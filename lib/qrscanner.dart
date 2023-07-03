import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class Qrscanner extends StatefulWidget {
  @override
  _QrscannerState createState() => _QrscannerState();
}

class _QrscannerState extends State<Qrscanner> {
  String? _qrInfo = 'Scan a QR code';
  bool camState = false;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (camState == true) {
              setState(() {
                camState = false;
              });
            } else {
              setState(() {
                camState = true;
              });
            }
          },
          child: const Icon(Icons.camera),
        ),
        body: camState
            ? Center(
                child: SizedBox(
                  height: 1000,
                  width: 500,
                  child: QRBarScannerCamera(
                    onError: (context, error) => Text(
                      error.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (code) {
                      qrCallback(code);
                    },
                  ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Code :" + _qrInfo!,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              )
        //boarder
        );
  }
}
