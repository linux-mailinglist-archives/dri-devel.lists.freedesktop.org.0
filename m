Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC987C8B39B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A4010E6C2;
	Wed, 26 Nov 2025 17:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="urmWOWiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5904A10E6BF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:37:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 48E531A1D86;
 Wed, 26 Nov 2025 17:37:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1E8B060721;
 Wed, 26 Nov 2025 17:37:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E28F4102F22D9; Wed, 26 Nov 2025 18:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764178622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EWslL5MJAu1ktwPaDyDYlweDV4/0Xu50P9NpGLLvPzI=;
 b=urmWOWiOCRBQAaoKMUKHRNe7j5UlKQhDEabtHMlCvM1TGAhlLuB+6X45QYYWZNSKGwwm69
 l3PZTZjW3W6qIfDfh/qnPs3VW+hLmQ+MfuadSI3knL03/q0LZ1eM5N8kx7JkuyjppmOTc8
 b9GVdtvZ6b20OoB/85QkDEDzmcDujK+oYN24M5A/fLSuGuVdh4NdEhYkUc5WnuO2mqggJa
 3vEk7KOmZQGFpmcX15aegIJY2/WRrOq6pQDQMhlUyw8G5TttJqc7qvbarJ9o2r7csdbJ/H
 Jy8lJW2nADY63oCd7wPItAFFyEpdjeh5fWz6eH8nur/0b2LUpJAJZv24W/wh8Q==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:48 +0100
Subject: [PATCH 06/21] dt-bindings: display: tilcdc: Remove panel binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-6-49b9ef2e3aa0@bootlin.com>
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

Remove the deprecated ti,tilcdc,panel binding which violates devicetree
design principles by placing display controller configuration
(DMA burst size, FIFO thresholds, AC bias, etc.) inside the panel node
instead of the controller node where it belongs.

This non-standard binding has several critical issues:
- Mixes controller-specific hardware parameters with panel properties
- Lacks the standard port/endpoint graph for panel connections
- Cannot work with the standard DRM panel infrastructure
- Forces vendor-specific binding instead of reusable panel-dpi binding

The tilcdc driver has been updated to work with standard DRM panels and
bridges, and all in-tree users have been migrated to use the generic
panel-dpi binding with proper port/endpoint connections. Controller
parameters like fifo-threshold are now correctly specified in the
tilcdc node itself.

While removing bindings is exceptional, keeping this binding would:
- Perpetuate incorrect devicetree design patterns
- Require maintaining a non-standard panel driver solely for tilcdc
- Block proper integration with the DRM panel subsystem
- Prevent devicetree reusability across different display controllers

This removal completes the migration to standard DRM panel bindings.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 .../devicetree/bindings/display/tilcdc/panel.txt   | 66 ----------------------
 1 file changed, 66 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
deleted file mode 100644
index 808216310ea27..0000000000000
--- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-Device-Tree bindings for tilcdc DRM generic panel output driver
-
-Required properties:
- - compatible: value should be "ti,tilcdc,panel".
- - panel-info: configuration info to configure LCDC correctly for the panel
-   - ac-bias: AC Bias Pin Frequency
-   - ac-bias-intrpt: AC Bias Pin Transitions per Interrupt
-   - dma-burst-sz: DMA burst size
-   - bpp: Bits per pixel
-   - fdd: FIFO DMA Request Delay
-   - sync-edge: Horizontal and Vertical Sync Edge: 0=rising 1=falling
-   - sync-ctrl: Horizontal and Vertical Sync: Control: 0=ignore
-   - raster-order: Raster Data Order Select: 1=Most-to-least 0=Least-to-most
-   - fifo-th: DMA FIFO threshold
- - display-timings: typical videomode of lcd panel.  Multiple video modes
-   can be listed if the panel supports multiple timings, but the 'native-mode'
-   should be the preferred/default resolution.  Refer to
-   Documentation/devicetree/bindings/display/panel/display-timing.txt for display
-   timing binding details.
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-- enable-gpios: GPIO pin to enable or disable the panel
-
-Recommended properties:
- - pinctrl-names, pinctrl-0: the pincontrol settings to configure
-   muxing properly for pins that connect to TFP410 device
-
-Example:
-
-	/* Settings for CDTech_S035Q01 / LCD3 cape: */
-	lcd3 {
-		compatible = "ti,tilcdc,panel";
-		pinctrl-names = "default";
-		pinctrl-0 = <&bone_lcd3_cape_lcd_pins>;
-		backlight = <&backlight>;
-		enable-gpios = <&gpio3 19 0>;
-
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
-		};
-		display-timings {
-			native-mode = <&timing0>;
-			timing0: 320x240 {
-				hactive         = <320>;
-				vactive         = <240>;
-				hback-porch     = <21>;
-				hfront-porch    = <58>;
-				hsync-len       = <47>;
-				vback-porch     = <11>;
-				vfront-porch    = <23>;
-				vsync-len       = <2>;
-				clock-frequency = <8000000>;
-				hsync-active    = <0>;
-				vsync-active    = <0>;
-			};
-		};
-	};

-- 
2.43.0

