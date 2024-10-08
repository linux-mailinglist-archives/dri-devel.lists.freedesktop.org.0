Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A158D995239
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 16:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7C110E35E;
	Tue,  8 Oct 2024 14:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 487 seconds by postgrey-1.36 at gabe;
 Tue, 08 Oct 2024 14:46:46 UTC
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E8410E35E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 14:46:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37971BFB0D; Tue,  8 Oct 2024 16:38:25 +0200 (CEST)
From: Frieder Schrempf <frieder@fris.de>
To: Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Frieder Schrempf <frieder@fris.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Gregor Herburger <gregor.herburger@ew.tq-group.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Parthiban Nallathambi <parthiban@linumiz.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH v3 0/4] arm64: dts: imx8mm-kontron: Add HDMI and LVDS display
 support
Date: Tue,  8 Oct 2024 16:37:42 +0200
Message-ID: <20241008143804.126795-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add support for the display bridges (DSI->LVDS and DSI->HDMI)
on the BL i.MX8MM and the 7" LVDS panel in a separate overlay.

Only one of the interfaces (HDMI or LVDS) is supported at the same
time. Enabling the LVDS overlay will disable the HDMI interface.

* Patch 1 and 2: Add the necessary binding changes
* Patch 3: Extend the BL devicetree
* Patch 4: Add the LVDS panel overlay

Changes for v3:
* Add A-b tag from Krzysztof
* Fix LVDS bridge input port reference

Changes for v2:
* Patch 1: Add link to commit message
* Patch 2: Add Conors A-b tag
* Patch 3: Remove blank lines from hdmi node
* Patch 3: Fix order of lvds and hdmi nodes within i2c
* Patch 3: Remove the unneeded deletion of samsung,pll-clock-frequency
* Patch 3: Use the existing MIPI DSI output port from imx8mm.dtsi
* Patch 4: Update copyright year
* Patch 4: Use exisitng MIPI DSI output port from imx8mm.dtsi
* Patch 4: Fix pinctrl for GPIO hogs
* Patch 4: Fix property order in i2c2 node
* Patch 4: Use generic node name for touchscreen

Frieder Schrempf (4):
  dt-bindings: vendor-prefixes: Add Jenson Display
  dt-bindings: display: panel-lvds: Add compatible for Jenson
    BL-JT60050-01A
  arm64: dts: imx8mm-kontron: Add support for display bridges on BL
    i.MX8MM
  arm64: dts: imx8mm-kontron: Add DL (Display-Line) overlay with LVDS
    support

 .../bindings/display/panel/panel-lvds.yaml    |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../boot/dts/freescale/imx8mm-kontron-bl.dts  | 131 ++++++++++++
 .../boot/dts/freescale/imx8mm-kontron-dl.dtso | 189 ++++++++++++++++++
 5 files changed, 328 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso

-- 
2.46.0

