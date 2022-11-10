Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9802E623F0F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 10:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8284A10E116;
	Thu, 10 Nov 2022 09:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F5910E116
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 09:50:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ot4Bz-00038j-S8; Thu, 10 Nov 2022 10:49:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ot4Bx-003QNd-Bg; Thu, 10 Nov 2022 10:49:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ot4Bx-00Fc5W-At; Thu, 10 Nov 2022 10:49:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1] dt-bindings: display: Convert fsl,imx-fb.txt to dt-schema
Date: Thu, 10 Nov 2022 10:49:45 +0100
Message-Id: <20221110094945.191100-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6633;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=gDjfQeiKMW2DRBDBjhZv+vsZKqFTCNLSH4EUGQpsD94=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjbMk2BDEgQuePuatqKXCGeqt/SeIve0qf4o5NL0hM
 oKAYx82JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY2zJNgAKCRDB/BR4rcrsCciyB/
 wMd2Q7bsWazaZlpfdbM7ePVGmuwseyzq8Ndif5LB7jTfVw6OZwTkAHr8pQWC0MfAC5q3LaWHdM6LQ9
 cSe3XTgCGbd5XG0Fspei/desUhAOcgwIZDAcT07BBLKa8sFFIDOfnMoIjA8JcSTKiwK1evsCEQDdbv
 Y9F9GEu/LUQAOnOoyS/FJJkLdOetI89IX970KbR58I10GhKD2A+xbqNH1CVbhrvGXrTo0CxXqNUSjw
 hTFZZMURMLEHDejKqPAjOARYSlkmwZ6nMy5qAqHp2XumdnucTdX60Nhg5JpiSqON2LiFYpvVxpm9l+
 ycPj59p2gxApUCehwllfitwG/Yu32x
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a straight forward conversion. Note that fsl,imx-lcdc was picked
as the new name as this is the compatible that should supersede the
legacy fb binding.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

the eventual goal is to add drm support for this hardware. That one will
use a different (and more sensible) binding. However fsl,imx*-fb won't
go away directly, and Rob requested to describe both bindings in the
same file given that it describes a single hardware type.

As a first step I convert the old binding to yaml. I tried to put the
new binding on top of that but I'm not sure about a few things in this
patch and so post only this first patch and once it's accepted add the
new binding which I guess is less overall work.

What I'm unsure about is the description of the display node (Is there a
better description? I didn't find a schema for that.)
Further I didn't find documentation about additionalProperties and
unevaluatedProperties. Did I pick the right one here?

Best regards
Uwe

 .../bindings/display/imx/fsl,imx-fb.txt       |  57 ---------
 .../bindings/display/imx/fsl,imx-lcdc.yaml    | 110 ++++++++++++++++++
 2 files changed, 110 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
deleted file mode 100644
index f4df9e83bcd2..000000000000
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-Freescale imx21 Framebuffer
-
-This framebuffer driver supports devices imx1, imx21, imx25, and imx27.
-
-Required properties:
-- compatible : "fsl,<chip>-fb", chip should be imx1 or imx21
-- reg : Should contain 1 register ranges(address and length)
-- interrupts : One interrupt of the fb dev
-
-Required nodes:
-- display: Phandle to a display node as described in
-	Documentation/devicetree/bindings/display/panel/display-timing.txt
-	Additional, the display node has to define properties:
-	- bits-per-pixel: Bits per pixel
-	- fsl,pcr: LCDC PCR value
-	A display node may optionally define
-	- fsl,aus-mode: boolean to enable AUS mode (only for imx21)
-
-Optional properties:
-- lcd-supply: Regulator for LCD supply voltage.
-- fsl,dmacr: DMA Control Register value. This is optional. By default, the
-	register is not modified as recommended by the datasheet.
-- fsl,lpccr: Contrast Control Register value. This property provides the
-	default value for the contrast control register.
-	If that property is omitted, the register is zeroed.
-- fsl,lscr1: LCDC Sharp Configuration Register value.
-
-Example:
-
-	imxfb: fb@10021000 {
-		compatible = "fsl,imx21-fb";
-		interrupts = <61>;
-		reg = <0x10021000 0x1000>;
-		display = <&display0>;
-	};
-
-	...
-
-	display0: display0 {
-		model = "Primeview-PD050VL1";
-		bits-per-pixel = <16>;
-		fsl,pcr = <0xf0c88080>;	/* non-standard but required */
-		display-timings {
-			native-mode = <&timing_disp0>;
-			timing_disp0: 640x480 {
-				hactive = <640>;
-				vactive = <480>;
-				hback-porch = <112>;
-				hfront-porch = <36>;
-				hsync-len = <32>;
-				vback-porch = <33>;
-				vfront-porch = <33>;
-				vsync-len = <2>;
-				clock-frequency = <25000000>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
new file mode 100644
index 000000000000..c3cf6f92a766
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx-lcdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX LCD Controller, found on i.MX1, i.MX21, i.MX25 and i.MX27
+
+maintainers:
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Pengutronix Kernel Team <kernel@pengutronix.de>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx1-fb
+              - fsl,imx21-fb
+      - items:
+          - enum:
+              - fsl,imx25-fb
+              - fsl,imx27-fb
+          - const: fsl,imx21-fb
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ipg
+      - const: ahb
+      - const: per
+
+  display:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Display hardware node
+      It needs to define the following properties:
+        - bits-per-pixel
+        - fsl,pcr: LCDC PCR value
+      And optionally:
+        - fsl,aus-mode: boolean to enable AUS mode (only for imx21)
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  lcd-supply:
+    description:
+      Regulator for LCD supply voltage.
+
+  fsl,dmacr:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description:
+      Override value for DMA Control Register
+
+  fsl,lpccr:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description:
+      Contrast Control Register value.
+
+  fsl,lscr1:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description:
+      LCDC Sharp Configuration Register value.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - display
+  - interrupts
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    imxfb: fb@10021000 {
+        compatible = "fsl,imx21-fb";
+        interrupts = <61>;
+        reg = <0x10021000 0x1000>;
+        display = <&display0>;
+        clocks = <&clks 103>, <&clks 49>, <&clks 66>;
+        clock-names = "ipg", "ahb", "per";
+    };
+
+    display0: display0 {
+        model = "Primeview-PD050VL1";
+        bits-per-pixel = <16>;
+        fsl,pcr = <0xf0c88080>; /* non-standard but required */
+
+        display-timings {
+            native-mode = <&timing_disp0>;
+            timing_disp0: timing0 {
+                hactive = <640>;
+                vactive = <480>;
+                hback-porch = <112>;
+                hfront-porch = <36>;
+                hsync-len = <32>;
+                vback-porch = <33>;
+                vfront-porch = <33>;
+                vsync-len = <2>;
+                clock-frequency = <25000000>;
+            };
+        };
+    };
-- 
2.38.1

