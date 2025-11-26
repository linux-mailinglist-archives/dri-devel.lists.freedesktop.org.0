Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E3EC8B396
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B479010E6C0;
	Wed, 26 Nov 2025 17:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="01lxaJvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDC110E6C0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:37:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2F2551A1D85;
 Wed, 26 Nov 2025 17:37:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0359460721;
 Wed, 26 Nov 2025 17:37:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E57BA102F22B1; Wed, 26 Nov 2025 18:36:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764178619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IJWtf2kIy8lCBpcz/JyBziECbeFa7hVjHuwMzNqnPPg=;
 b=01lxaJvy4NvnD7Bd7na8RY3i95UleIWUh8amKU6GPWbeGPSOgB6sIoOBbKxdQPfJvJuvAg
 B4gll/zh9mLakH7nQjwwJ9dPhtOCmGs+4uIVsaVx+26avrGtGArYrNAR72Mxg/iTZcEGdI
 4SF3dWBYfcrC1hj7IQnDBQatbJ4BM10+4yJSSGFUOBSTE8GRwSYPZCMvTo7IVV2wBky1Xo
 thBSdQwQR5wp9SYaDT9g/AjY7xzr8fqaRPYB1PvS2YUTui3bfSWKoarRBGgqcTXUTERybS
 XaJLTRjpIJYpVVzuOSoN0EFVeddiy8URdVKQ1UyxCx0gHYvLxQRJQF1C7cSNcw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:47 +0100
Subject: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead of
 ti,tilcdc,panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
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

Use panel-dpi driver instead of the deprecated tilcdc-panel driver in
preparation for removing the tilcdc-panel driver and binding.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

This patch is not tested. It would be nice if someone with one of this
board could test and validate it.
---
 arch/arm/boot/dts/ti/davinci/da850-evm.dts    | 26 +++++++++++++-------------
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts | 25 +++++++++----------------
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts   | 21 ++++++++++-----------
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts   | 22 +++++++++++-----------
 arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts | 25 +++++++++++++------------
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts     | 25 ++++++++++++-------------
 6 files changed, 68 insertions(+), 76 deletions(-)

diff --git a/arch/arm/boot/dts/ti/davinci/da850-evm.dts b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
index 38a191fb04149..79cca1f6205ef 100644
--- a/arch/arm/boot/dts/ti/davinci/da850-evm.dts
+++ b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
@@ -40,7 +40,7 @@ backlight: backlight-pwm {
 	};
 
 	panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pins>;
 		/*
@@ -50,17 +50,10 @@ panel {
 		 */
 		status = "okay";
 		enable-gpios = <&gpio 40 GPIO_ACTIVE_HIGH>; /* lcd_panel_pwr */
-
-		panel-info {
-			ac-bias = <255>;
-			ac-bias-intrpt = <0>;
-			dma-burst-sz = <16>;
-			bpp = <16>;
-			fdd = <0x80>;
-			sync-edge = <0>;
-			sync-ctrl = <1>;
-			raster-order = <0>;
-			fifo-th = <1>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
 		};
 
 		display-timings {
@@ -222,6 +215,13 @@ &rtc0 {
 };
 
 &lcdc {
+	fifo-threshold = <16>;
+
+	port {
+		lcdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 	status = "okay";
 };
 
@@ -459,7 +459,7 @@ &vpif {
 	pinctrl-0 = <&vpif_capture_pins>, <&vpif_display_pins>;
 	/*
 	 * The vpif and the LCD are mutually exclusive.
-	 * To enable VPIF, disable the ti,tilcdc,panel then
+	 * To enable VPIF, disable the panel-dpi then
 	 * change the status below to 'okay'
 	 */
 	status = "disabled";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
index 4b070e634b281..f38ce9be2c106 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
@@ -68,10 +68,15 @@ gpio-poweroff {
 	};
 
 	panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 		pinctrl-names = "default", "sleep";
 		pinctrl-0 = <&lcd_pins_default &lcd_disen_pins>;
 		pinctrl-1 = <&lcd_pins_sleep>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
+		};
 
 		display-timings {
 			timing-320x240 {
@@ -86,21 +91,9 @@ timing-320x240 {
 				clock-frequency = <9000000>;
 				hsync-active    = <0>;
 				vsync-active    = <0>;
+				pixelclk-active = <1>;
 			};
 		};
-		panel-info {
-			ac-bias           = <255>;
-			ac-bias-intrpt    = <0>;
-			dma-burst-sz      = <16>;
-			bpp               = <24>;
-			bus-width         = <16>;
-			fdd               = <0x80>;
-			sync-edge         = <0>;
-			sync-ctrl         = <1>;
-			raster-order      = <0>;
-			fifo-th           = <0>;
-		};
-
 	};
 
 	guardian_beeper: pwm-7 {
@@ -265,8 +258,8 @@ &lcdc {
 	blue-and-red-wiring = "crossed";
 	status = "okay";
 	port {
-		lcdc_0: endpoint@0 {
-			remote-endpoint = <0>;
+		lcdc_out: endpoint@0 {
+			remote-endpoint = <&panel_in>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
index c9ccb9de21ad7..2c5229d05ade7 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
@@ -50,20 +50,14 @@ lis3_reg: fixedregulator@1 {
 	};
 
 	panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 		status = "okay";
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pins_s0>;
-		panel-info {
-			ac-bias           = <255>;
-			ac-bias-intrpt    = <0>;
-			dma-burst-sz      = <16>;
-			bpp               = <16>;
-			fdd               = <0x80>;
-			sync-edge         = <0>;
-			sync-ctrl         = <1>;
-			raster-order      = <0>;
-			fifo-th           = <0>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
 		};
 
 		display-timings {
@@ -395,6 +389,11 @@ &rtc {
 
 &lcdc {
 	status = "okay";
+	port {
+		lcdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &elm {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
index e7d561a527fdd..2760c0eab50c2 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
@@ -31,7 +31,7 @@ leds: user-leds-pins {
 	};
 
 	panel: lcd_panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 	};
 
 	sound: sound_iface {
@@ -189,16 +189,10 @@ &panel {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&lcd_pins>;
-	panel-info {
-		ac-bias = <255>;
-		ac-bias-intrpt = <0>;
-		dma-burst-sz = <16>;
-		bpp = <32>;
-		fdd = <0x80>;
-		sync-edge = <0>;
-		sync-ctrl = <1>;
-		raster-order = <0>;
-		fifo-th = <0>;
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&lcdc_out>;
+		};
 	};
 	display-timings {
 		native-mode = <&timing0>;
@@ -214,12 +208,18 @@ timing0: timing-480x272 {
 			vsync-len = <10>;
 			hsync-active = <1>;
 			vsync-active = <1>;
+			pixelclk-active = <1>;
 		};
 	};
 };
 
 &lcdc {
 	status = "okay";
+	port {
+		lcdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &am33xx_pinmux {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts b/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts
index 2841e95d9a094..25ee855dd21a7 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts
@@ -13,23 +13,17 @@ / {
 
 	/* DRM display driver */
 	panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 		status = "okay";
 		pinctrl-names = "default", "sleep";
 		pinctrl-0 = <&lcd_pins_default>;
 		pinctrl-1 = <&lcd_pins_sleep>;
-
-		panel-info {
-			ac-bias           = <255>;
-			ac-bias-intrpt    = <0>;
-			dma-burst-sz      = <16>;
-			bpp               = <32>;
-			fdd               = <0x80>;
-			sync-edge         = <0>;
-			sync-ctrl         = <1>;
-			raster-order      = <0>;
-			fifo-th           = <0>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
 		};
+
 		display-timings {
 			/* Timing selection performed by U-Boot */
 			timing0: lcd {/* 800x480p62 */
@@ -44,6 +38,7 @@ timing0: lcd {/* 800x480p62 */
 				vsync-len = <2>;
 				hsync-active = <1>;
 				vsync-active = <1>;
+				pixelclk-active = <1>;
 			};
 			timing1: dvi { /* 1024x768p60 */
 				clock-frequency = <65000000>;
@@ -57,6 +52,7 @@ timing1: dvi { /* 1024x768p60 */
 				vsync-len = <6>;
 				hsync-active = <0>;
 				vsync-active = <0>;
+				pixelclk-active = <1>;
 			};
 		};
 	};
@@ -173,4 +169,9 @@ lcd-ena-hog {
 /* Display */
 &lcdc {
 	status = "okay";
+	port {
+		lcdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
index f3524e5ee43e2..b4b2b6d18d646 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
@@ -123,22 +123,14 @@ audio_mclk: audio_mclk_gate@0 {
 	};
 
 	panel: lcd_panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pins>;
 
-		panel-info {
-			ac-bias = <255>;
-			ac-bias-intrpt = <0>;
-			dma-burst-sz = <16>;
-			bpp = <16>;
-			fdd = <0x80>;
-			tft-alt-mode = <0>;
-			mono-8bit-mode = <0>;
-			sync-edge = <0>;
-			sync-ctrl = <1>;
-			raster-order = <0>;
-			fifo-th = <0>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
 		};
 
 		display-timings {
@@ -157,6 +149,8 @@ timing0: 960x128 {
 				vfront-porch = <8>;
 				vsync-len = <4>;
 				vsync-active = <0>;
+
+				pixelclk-active = <1>;
 			};
 		};
 	};
@@ -711,6 +705,11 @@ &ehrpwm1 {
 
 &lcdc {
 	status = "okay";
+	port {
+		lcdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &tscadc {

-- 
2.43.0

