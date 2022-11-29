Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF1C63C701
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 19:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B54010E13A;
	Tue, 29 Nov 2022 18:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6A410E13A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 18:04:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p04xy-0007bB-Ub; Tue, 29 Nov 2022 19:04:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p04xw-0018MV-8f; Tue, 29 Nov 2022 19:04:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p04xw-001HXM-BE; Tue, 29 Nov 2022 19:04:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2] dt-bindings: display: Convert fsl,imx-fb.txt to dt-schema
Date: Tue, 29 Nov 2022 19:04:14 +0100
Message-Id: <20221129180414.2729091-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6324;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=DvIV4HYaKMOHhRZZ9BFQMck2c1xBdZcv3zmxYbeH/x4=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjhkmVlfJhpGvZR/g7+qMBEOOg9M2j7V0Pr+1Mc0ip
 qpFd09eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY4ZJlQAKCRDB/BR4rcrsCUZaB/
 95e3vBWHk9dJeaXqBOZxzbs7y8ZA3KvfawQ+4cyiJx8mhv5SmDZNqt4OsrG+kW2O2Frld/9apDyY8H
 CsFTx92U3wtW+ojrlespcMOr6kYC5xffKzYv6LV65A/fjGLF/X/GOQGip+5B6VXKiuyaICT/Pjt0G5
 5vsqq/0RzQ4DIQODzD/rtrsuLsNMpFuSeYHNef/n+f7k0DNsyOz/JkRwwSfrChl8NjWyTZBDjhFaEc
 To7TdTUUQxtPSdJPhoNAYAr2dcqBccDC3F0SsKhrvwxsnF/JlbikJv630LOAtX9eYoN2obKpp+sSeH
 R9yx9UBCNNHk/6EqIHYVQdug6m0TV5
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

Compared to the txt description this adds clocks and clock-names to
match reality.

Note that fsl,imx-lcdc was picked as the new name as this is the actual
hardware's name. There will be a new binding implementing the saner drm
concept that is supposed to supersede this legacy fb binding

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since v1, sent with Message-Id:
 - mention clock stuff being added (Philipp)
 - dropped some quotes (Rob)
 - fix specification of compatible
   (I kept claiming though that imx21 isn't compatible to imx1. While
   that might be true, I don't have an i.MX1 to check the details and
   currently the imx*.dtsi don't claim that compatibility.)

I tried to implement the suggestion by Rob to formalize the display
binding. But I learned that this doesn't change how the display property
is formalized in the fsl,imx-lcdc.yaml (which is just a phandle without
means to specify that it should point to a node which fulfills a certain
binding.)

Best regards
Uwe

 .../bindings/display/imx/fsl,imx-fb.txt       |  57 ----------
 .../bindings/display/imx/fsl,imx-lcdc.yaml    | 102 ++++++++++++++++++
 2 files changed, 102 insertions(+), 57 deletions(-)
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
index 000000000000..35a8fff036ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
@@ -0,0 +1,102 @@
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
+      - enum:
+          - fsl,imx1-fb
+          - fsl,imx21-fb
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
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Override value for DMA Control Register
+
+  fsl,lpccr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Contrast Control Register value.
+
+  fsl,lscr1:
+    $ref: /schemas/types.yaml#/definitions/uint32
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

