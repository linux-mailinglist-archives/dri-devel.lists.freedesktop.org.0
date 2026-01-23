Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGOIKPydc2lgxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:12:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3778304
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D6710EB2F;
	Fri, 23 Jan 2026 16:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="sLwVHkid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0861C10EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:12:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B3EC44E42223;
 Fri, 23 Jan 2026 16:12:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 87F756070A;
 Fri, 23 Jan 2026 16:12:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 80B5E119A87A9; Fri, 23 Jan 2026 17:12:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769184757; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=O0e7oK0+DtrdeS2mjGJxW+Ios+Q8mp3j2SQs5EO70xg=;
 b=sLwVHkidiHIDfZuSGh2sRDPCpneLh4ZvKNK8EJrcwXsFqE6lVHYTRzYTI4fE/+CwJmhTfr
 bzXTjSu2Ru4YgqLmubEcynDKIsaXX1eTPnaJFpvPFh12oMSniTn5OkWz6Fc2wH5V63ROao
 tHD55DhHjB1cAdamR1ytMTVrowVFnHaMflrWFNBjzjYGjjOnLbxsFlRZ0a9BbyErMKxeWg
 cl2SkR914fIDMVofHcO0TQBHRChiA8gAwhQzckJ1iYaSiz2AqEiIe8+n5bAGnXZP7mGd4M
 lRQnD3Aep1tJnhma5Rx+J9eV9SV3i2fk9pxkKP/biUUnHjvo5QsOSFJ6/nySbA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:19 +0100
Subject: [PATCH v5 01/25] dt-bindings: display: tilcdc: Convert to DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-1-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
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
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:luca.ceresoli@bootlin.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:kory.maincent@bootlin.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:url,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,qualcomm.com:email,devicetree.org:url,4830e000:email]
X-Rspamd-Queue-Id: 34F3778304
X-Rspamd-Action: no action

Convert the device tree binding documentation for tilcdc
from plain text to DT binding schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Change in v3:
- Rename binding file to ti,am33xx-tilcdc.yaml.
- Use generic node name and drop unused label.
---
 .../bindings/display/tilcdc/ti,am33xx-tilcdc.yaml  | 100 +++++++++++++++++++++
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 -----------------
 2 files changed, 100 insertions(+), 82 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/ti,am33xx-tilcdc.yaml b/Documentation/devicetree/bindings/display/tilcdc/ti,am33xx-tilcdc.yaml
new file mode 100644
index 0000000000000..eb0ebb678fa87
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tilcdc/ti,am33xx-tilcdc.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Bootlin
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml#
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
+    # maximum: 2048*2048*60
+    maximum: 251658240
+
+  max-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum horizontal pixel width supported by the lcd controller.
+    maximum: 2048
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
+    display-controller@4830e000 {
+        compatible = "ti,am33xx-tilcdc";
+        reg = <0x4830e000 0x1000>;
+        interrupt-parent = <&intc>;
+        interrupts = <36>;
+        ti,hwmods = "lcdc";
+
+        blue-and-red-wiring = "crossed";
+
+        port {
+            endpoint {
+                remote-endpoint = <&hdmi_0>;
+            };
+        };
+    };
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

-- 
2.43.0

