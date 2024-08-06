Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7094921F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 15:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6588310E378;
	Tue,  6 Aug 2024 13:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fris.de header.i=@fris.de header.b="nsESuk2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4345710E379
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:51:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 88FF1BFB06; Tue,  6 Aug 2024 15:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
 t=1722951281; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=cyPHxdswqOb5N+EqzIxpN2i+5Izf1AnteHGpt/ataIA=;
 b=nsESuk2sVBWj2SesqVt3A1EOdeQ4/vRf6w6WccdSt2uhfIqTmi27B07agGlrLJ/m/A9Ku9
 qYJSFQk02oVwssdIZH6GL6EtTzm2GsZO14f0QCmTxiIGcK57DgSAQCnaOJG6XfLN25KTTf
 xHiwKKb2lvidS5m5qJYCAhByorTU2cLwIklqrTYNRID7jtNTqjJzD1xhYf1Y3bcNEm05S/
 WLltmZXvc25z2h03u8boQGeybd9E0IxrPB6GYAhRR9+959NN0XzN7ZcgsyA75AtTZhCVth
 UTAZOkw4AgI4lrPn4LlLGL8KiTvyX5nD7kTPxtcW5FhmFB+GcFbfZCHz6obyEg==
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Gregor Herburger <gregor.herburger@ew.tq-group.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Parthiban Nallathambi <parthiban@linumiz.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH 0/4] arm64: dts: imx8mm-kontron: Add HDMI and LVDS display
 support
Date: Tue,  6 Aug 2024 15:32:58 +0200
Message-ID: <20240806133352.440922-1-frieder@fris.de>
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This add support for the display bridges (DSI->LVDS and DSI->HDMI)
on the BL i.MX8MM and the 7" LVDS panel in a separate overlay.

Only one of the interfaces (HDMI or LVDS) is supported at the same
time. Enabling the LVDS overlay will disable the HDMI interface.

* Patch 1 and 2: Add the necessary binding changes
* Patch 3: Extend the BL devicetree
* Patch 4: Add the LVDS panel overlay

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
 .../boot/dts/freescale/imx8mm-kontron-bl.dts  | 146 ++++++++++++
 .../boot/dts/freescale/imx8mm-kontron-dl.dtso | 210 ++++++++++++++++++
 5 files changed, 364 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso

-- 
2.45.2

