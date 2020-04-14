import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Content(),
        ),
      ),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  List<Expanded> createExpanded() {
    const List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple
    ];
    List<Expanded> widgets = new List();
    for (var i = 0; i < colors.length; i++) {
      var color = colors[i];
      Expanded widget = Expanded(
        child: FlatButton(
          onPressed: () {
            final cachePlayer = AudioCache();
            cachePlayer.play('note${i + 1}.wav');
          },
          color: color,
        ),
      );
      widgets.add(widget);
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: createExpanded(),
    );
  }
}
