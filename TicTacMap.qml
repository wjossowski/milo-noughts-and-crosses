import QtQuick 2.0

Rectangle {
    id: map

    property int spacing: 10
    property int tileSize: Math.min (getSideLength(map.width),
                                     getSideLength(map.height))

    function getSideLength(side)
    {
        return (side - (TicTacBoard.gridSize + 1) * spacing) / TicTacBoard.gridSize;
    }

    width: parent.width
    height: parent.height - 100
    color: '#131919'

    Grid {
        id: grid
        anchors.centerIn: parent
        rows: TicTacBoard.gridSize
        columns: TicTacBoard.gridSize
        spacing: map.spacing

        Repeater {
            model: TicTacBoard

            delegate: TicTacTile {
                id: tictactile
                owner: display
                winningfield: decoration
                sideLenght: map.tileSize
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        TicTacEngine.mark(index)
                    }
                }
            }
        }
    }
}