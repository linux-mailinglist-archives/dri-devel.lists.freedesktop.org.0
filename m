Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FAB20EF83
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC5689D3E;
	Tue, 30 Jun 2020 07:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7543889F97
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 22:34:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id CD9AD2A1386
Received: by jupiter.universe (Postfix, from userid 1000)
 id B9E51480102; Tue, 30 Jun 2020 00:34:50 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sam Ravnborg <sam@ravnborg.org>, Tony Lindgren <tony@atomide.com>
Subject: [PATCHv1 0/4] panel-dsi-cm: update bindings
Date: Tue, 30 Jun 2020 00:33:11 +0200
Message-Id: <20200629223315.118256-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:53 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subject: panel-dsi-cm: update bindings

The cleanup series for omapdrm's DSI code got too big. Reviewing
this is not fun and the same goes for keeping track of the change
requests. Let's do the cleanup in smaller steps instead. This is
the first batch, which updates the binding (txt -> yaml) and
modifies the DT slightly.

-- Sebastian

Sebastian Reichel (4):
  dt-bindings: display: panel-dsi-cm: convert to YAML
  ARM: dts: omap: add channel to DSI panels
  ARM: dts: omap4-droid4: add panel compatible
  ARM: dts: omap4-droid4: add panel orientation

 .../bindings/display/panel/panel-dsi-cm.txt   |  29 -----
 .../bindings/display/panel/panel-dsi-cm.yaml  | 100 ++++++++++++++++++
 .../boot/dts/motorola-mapphone-common.dtsi    |   6 +-
 arch/arm/boot/dts/omap3-n950.dts              |   3 +-
 arch/arm/boot/dts/omap3.dtsi                  |   3 +
 arch/arm/boot/dts/omap4-sdp.dts               |   6 +-
 arch/arm/boot/dts/omap4.dtsi                  |   6 ++
 arch/arm/boot/dts/omap5.dtsi                  |   6 ++
 8 files changed, 125 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
