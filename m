Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B55CB67B9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 17:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DAA10E386;
	Thu, 11 Dec 2025 16:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="v8JdI36i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5AF10E212
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 16:39:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6DD744E41B7D;
 Thu, 11 Dec 2025 16:39:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 448316072F;
 Thu, 11 Dec 2025 16:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E439103C8C1E; Thu, 11 Dec 2025 17:39:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765471182; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0CUr9ddV3oZ41q3/D/0z/oo3oYkxXbRVdv8SyL1wMI0=;
 b=v8JdI36i5NiGCTtV7pRC+dYkLOEumCiVmBUeSYFeog5xJ/9R6Tkxe5XREjXa9xRQ9nn6rJ
 DdJmMx4cOiMlm30Qast1XOcjPV4ccsDWdo7a6TiSk9LURCvPnfnrX67AHMP7U4QcxzfH4v
 Z+rNTxD+HEC1vmcL+aVPquApmzw3JpdaClouOXpWA6dvE3AAs/MhIGBIp1zR2KUEsIvHr5
 +YYevkWQW7czReLQL3FGL4+5BnsV44wQhmAlm4ZAPxt8SLj2RPjhqcjO/iFJT8e3B/76fF
 Jq3PkwjTT5st0o+DKeM05jmifu9PJMWEIFO9zFq/pxUAKzjcak6P2KLnJQeEhA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:45 +0100
Subject: [PATCH v2 01/20] dt-bindings: display: tilcdc: Convert to DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-1-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
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
 Bajjuri Praneeth <praneeth@ti.com>, 
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

Convert the device tree binding documentation for tilcdc
from plain text to DT binding schema.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  | 82 ------------------
 .../devicetree/bindings/display/tilcdc/tilcdc.yaml | 96 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 82 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
deleted file mode 100644
index 3b3d0bbfcfff4..0000000000000
--- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
+++ /dev/null
@@ -1,82 +0,0 @@
-Device-Tree bindings for tilcdc DRM driver
-
-Required properties:
- - compatible: value should be one of the following:
-    - "ti,am33xx-tilcdc" for AM335x based boards
-    - "ti,da850-tilcdc" for DA850/AM18x/OMAP-L138 based boards
- - interrupts: the interrupt number
- - reg: base address and size of the LCDC device
-
-Recommended properties:
- - ti,hwmods: Name of the hwmod associated to the LCDC
-
-Optional properties:
- - max-bandwidth: The maximum pixels per second that the memory
-   interface / lcd controller combination can sustain
- - max-width: The maximum horizontal pixel width supported by
-   the lcd controller.
- - max-pixelclock: The maximum pixel clock that can be supported
-   by the lcd controller in KHz.
- - blue-and-red-wiring: Recognized values "straight" or "crossed".
-   This property deals with the LCDC revision 2 (found on AM335x)
-   color errata [1].
-    - "straight" indicates normal wiring that supports RGB565,
-      BGR888, and XBGR8888 color formats.
-    - "crossed" indicates wiring that has blue and red wires
-      crossed. This setup supports BGR565, RGB888 and XRGB8888
-      formats.
-    - If the property is not present or its value is not recognized
-      the legacy mode is assumed. This configuration supports RGB565,
-      RGB888 and XRGB8888 formats. However, depending on wiring, the red
-      and blue colors are swapped in either 16 or 24-bit color modes.
-
-Optional nodes:
-
- - port/ports: to describe a connection to an external encoder. The
-   binding follows Documentation/devicetree/bindings/graph.txt and
-   supports a single port with a single endpoint.
-
- - See also Documentation/devicetree/bindings/display/tilcdc/panel.txt and
-   Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml for connecting
-   tfp410 DVI encoder or lcd panel to lcdc
-
-[1] There is an errata about AM335x color wiring. For 16-bit color mode
-    the wires work as they should (LCD_DATA[0:4] is for Blue[3:7]),
-    but for 24 bit color modes the wiring of blue and red components is
-    crossed and LCD_DATA[0:4] is for Red[3:7] and LCD_DATA[11:15] is
-    for Blue[3-7]. For more details see section 3.1.1 in AM335x
-    Silicon Errata:
-    https://www.ti.com/general/docs/lit/getliterature.tsp?baseLiteratureNumber=sprz360
-
-Example:
-
-	fb: fb@4830e000 {
-		compatible = "ti,am33xx-tilcdc", "ti,da850-tilcdc";
-		reg = <0x4830e000 0x1000>;
-		interrupt-parent = <&intc>;
-		interrupts = <36>;
-		ti,hwmods = "lcdc";
-
-		blue-and-red-wiring = "crossed";
-
-		port {
-			lcdc_0: endpoint {
-				remote-endpoint = <&hdmi_0>;
-			};
-		};
-	};
-
-	tda19988: tda19988 {
-		compatible = "nxp,tda998x";
-		reg = <0x70>;
-
-		pinctrl-names = "default", "off";
-		pinctrl-0 = <&nxp_hdmi_bonelt_pins>;
-		pinctrl-1 = <&nxp_hdmi_bonelt_off_pins>;
-
-		port {
-			hdmi_0: endpoint {
-				remote-endpoint = <&lcdc_0>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
new file mode 100644
index 0000000000000..34ac1fd04d5c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tilcdc/tilcdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LCD Controller, found on AM335x, DA850, AM18x and OMAP-L138
+
+maintainers:
+  - Kory Maincent <kory.maincent@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,am33xx-tilcdc
+      - ti,da850-tilcdc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the hwmod associated to the LCDC
+
+  max-bandwidth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum pixels per second that the memory interface / lcd
+      controller combination can sustain
+
+  max-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum horizontal pixel width supported by the lcd controller.
+
+  max-pixelclock:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum pixel clock that can be supported by the lcd controller
+      in KHz.
+
+  blue-and-red-wiring:
+    enum: [straight, crossed]
+    description:
+      This property deals with the LCDC revision 2 (found on AM335x)
+      color errata [1].
+       - "straight" indicates normal wiring that supports RGB565,
+         BGR888, and XBGR8888 color formats.
+       - "crossed" indicates wiring that has blue and red wires
+         crossed. This setup supports BGR565, RGB888 and XRGB8888
+         formats.
+       - If the property is not present or its value is not recognized
+         the legacy mode is assumed. This configuration supports RGB565,
+         RGB888 and XRGB8888 formats. However, depending on wiring, the red
+         and blue colors are swapped in either 16 or 24-bit color modes.
+
+       [1] There is an errata about AM335x color wiring. For 16-bit color
+       mode the wires work as they should (LCD_DATA[0:4] is for Blue[3:7]),
+       but for 24 bit color modes the wiring of blue and red components is
+       crossed and LCD_DATA[0:4] is for Red[3:7] and LCD_DATA[11:15] is
+       for Blue[3-7]. For more details see section 3.1.1 in AM335x
+       Silicon Errata
+       https://www.ti.com/general/docs/lit/getliterature.tsp?baseLiteratureNumber=sprz360
+
+required:
+  - compatible
+  - interrupts
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    tilcdc: tilcdc@4830e000 {
+        compatible = "ti,am33xx-tilcdc";
+        reg = <0x4830e000 0x1000>;
+        interrupt-parent = <&intc>;
+        interrupts = <36>;
+        ti,hwmods = "lcdc";
+
+        blue-and-red-wiring = "crossed";
+
+        port {
+            lcdc_0: endpoint {
+                remote-endpoint = <&hdmi_0>;
+            };
+        };
+    };

-- 
2.43.0

