Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C102B3809
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 19:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604B16E9B4;
	Sun, 15 Nov 2020 18:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553AD6E9B1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 18:51:49 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v20so17353788ljk.8
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 10:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uR/XhDoVeyIzrRhErdUqxajySVHEj7lVT5My0U++OY4=;
 b=npyf9Zw2ueN7vYFbaM2+RgiFURnYjx2mm/GV9/xeluQ+0Ozg9fXet7Sxikoj1Lpj+T
 CxS9H65i/Wtb2+jSrWbNtNptAH2fsYWVU10dQyWoHvW3kRptGCV0PoQSwhv7SbXbqfMP
 LEDe3+eIa52nvpB4cV/+scWMs9894/kqYXx5tQ6ED44sx4b6H1PNx8TpRu4L6mzTcU8J
 Q9rJ0R/oywRRK+vwFlFjKj87XGQ22H0+5mZ0X1pJZd0yB9ACLruTnRggXDj/YZEAaqxu
 9SYt+jRb9hXMGE/x5YKYxDx1IFF3cmTYnwA8y0bPJ270URl+2I41m0vUEApeNePPKDw/
 tUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uR/XhDoVeyIzrRhErdUqxajySVHEj7lVT5My0U++OY4=;
 b=Xp0lobMArLIbvlvnMsRETsCHfom35QKgT5e9JxvbXLwKGuWauU/ZYQnBT5RbuET3Zm
 E9FTgeHhuqussRsW2XarGJjJWnDd14dgpxwHwaar6hXpa/QCHvC4C02T77XtjFMC+Djo
 xZWRyXx9uRt0h2/S4+Ei1b31uD96FfvDkPF3dqo4B0a+LC/nvNickGFZn4rfSp+OK+h7
 CHLmbxGiP7vZJvP9yTefW33F1czRdjt/ONECdh2rabf2ItoYkf37j0992uHPbmIjPk7T
 9SkUAQbMwR3lC08IBNNagrgjf4Icxgso69qjE9LyOPd0m5SCLYgZ0SgM8P8O6Ah0GgZ5
 IYsw==
X-Gm-Message-State: AOAM531yqDd94dHKN0Wq1jWY4l9215KYcF+vPvnOxxt4rOCbfA5jAra1
 4wGOVU00SR0EdAT69z/s1gW+7oqyeyxQKg==
X-Google-Smtp-Source: ABdhPJzFJB0lIOYQ4ShMSG/XEfblRg9lLueZHgv3HXFH3X9KhzJ5AwdJmzydXHF9jShT61JCxra0Tw==
X-Received: by 2002:a2e:5705:: with SMTP id l5mr4927051ljb.93.1605466307478;
 Sun, 15 Nov 2020 10:51:47 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id v4sm1503882ljg.84.2020.11.15.10.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 10:51:46 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3] dt-bindings: display: mcde: Convert to YAML schema
Date: Sun, 15 Nov 2020 19:51:45 +0100
Message-Id: <20201115185145.566772-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This moves the MCDE bindings over to using the YAML schema
to describe the ST-Ericsson MCDE display controller,
making use of the generic DSI controller schema.

In the process we correct an error in the old text bindings:
the clocks for the SDI host controllers were specified as
part of the main MCDE component while they should be
specified in the DSI host controller subnodes. This was
a leftover from an earlier iteration of the first patch
series adding the MCDE.

We also add the "port" node, we will use this when adding
LCD panels using the direct parallel interface DPI instead
of DSI.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Add resets to the bindings for future-proofing, set
  additionalProperties: false
- Extend commit message to explain the the old bindings
  were incorrect.
ChangeLog v1->v2:
- Cut the description on the interrupts.
- Drop maxItems: 3 on clocks and clock-names: implicit from
  the number of listed items.
- Tag the DSI ports with unevaluatedProperties: false
- Tag the MCDE as such with additionalProperties: true
- It was a bit hard to test this because of the code base
  being out of phase with the validation tools but it seems
  to check out.
---
 .../devicetree/bindings/display/ste,mcde.txt  | 104 -----------
 .../devicetree/bindings/display/ste,mcde.yaml | 169 ++++++++++++++++++
 2 files changed, 169 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ste,mcde.txt
 create mode 100644 Documentation/devicetree/bindings/display/ste,mcde.yaml

diff --git a/Documentation/devicetree/bindings/display/ste,mcde.txt b/Documentation/devicetree/bindings/display/ste,mcde.txt
deleted file mode 100644
index 4c33c692bd5f..000000000000
--- a/Documentation/devicetree/bindings/display/ste,mcde.txt
+++ /dev/null
@@ -1,104 +0,0 @@
-ST-Ericsson Multi Channel Display Engine MCDE
-
-The ST-Ericsson MCDE is a display controller with support for compositing
-and displaying several channels memory resident graphics data on DSI or
-LCD displays or bridges. It is used in the ST-Ericsson U8500 platform.
-
-Required properties:
-
-- compatible: must be:
-  "ste,mcde"
-- reg: register base for the main MCDE control registers, should be
-  0x1000 in size
-- interrupts: the interrupt line for the MCDE
-- epod-supply: a phandle to the EPOD regulator
-- vana-supply: a phandle to the analog voltage regulator
-- clocks: an array of the MCDE clocks in this strict order:
-  MCDECLK (main MCDE clock), LCDCLK (LCD clock), PLLDSI
-  (HDMI clock), DSI0ESCLK (DSI0 energy save clock),
-  DSI1ESCLK (DSI1 energy save clock), DSI2ESCLK (DSI2 energy
-  save clock)
-- clock-names: must be the following array:
-  "mcde", "lcd", "hdmi"
-  to match the required clock inputs above.
-- #address-cells: should be <1> (for the DSI hosts that will be children)
-- #size-cells: should be <1> (for the DSI hosts that will be children)
-- ranges: this should always be stated
-
-Required subnodes:
-
-The devicetree must specify subnodes for the DSI host adapters.
-These must have the following characteristics:
-
-- compatible: must be:
-  "ste,mcde-dsi"
-- reg: must specify the register range for the DSI host
-- vana-supply: phandle to the VANA voltage regulator
-- clocks: phandles to the high speed and low power (energy save) clocks
-  the high speed clock is not present on the third (dsi2) block, so it
-  should only have the "lp" clock
-- clock-names: "hs" for the high speed clock and "lp" for the low power
-  (energy save) clock
-- #address-cells: should be <1>
-- #size-cells: should be <0>
-
-Display panels and bridges will appear as children on the DSI hosts, and
-the displays are connected to the DSI hosts using the common binding
-for video transmitter interfaces; see
-Documentation/devicetree/bindings/media/video-interfaces.txt
-
-If a DSI host is unused (not connected) it will have no children defined.
-
-Example:
-
-mcde@a0350000 {
-	compatible = "ste,mcde";
-	reg = <0xa0350000 0x1000>;
-	interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-	epod-supply = <&db8500_b2r2_mcde_reg>;
-	vana-supply = <&ab8500_ldo_ana_reg>;
-	clocks = <&prcmu_clk PRCMU_MCDECLK>, /* Main MCDE clock */
-		 <&prcmu_clk PRCMU_LCDCLK>, /* LCD clock */
-		 <&prcmu_clk PRCMU_PLLDSI>; /* HDMI clock */
-	clock-names = "mcde", "lcd", "hdmi";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-
-	dsi0: dsi@a0351000 {
-		compatible = "ste,mcde-dsi";
-		reg = <0xa0351000 0x1000>;
-		vana-supply = <&ab8500_ldo_ana_reg>;
-		clocks = <&prcmu_clk PRCMU_DSI0CLK>, <&prcmu_clk PRCMU_DSI0ESCCLK>;
-		clock-names = "hs", "lp";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		panel {
-			compatible = "samsung,s6d16d0";
-			reg = <0>;
-			vdd1-supply = <&ab8500_ldo_aux1_reg>;
-			reset-gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
-		};
-
-	};
-	dsi1: dsi@a0352000 {
-		compatible = "ste,mcde-dsi";
-		reg = <0xa0352000 0x1000>;
-		vana-supply = <&ab8500_ldo_ana_reg>;
-		clocks = <&prcmu_clk PRCMU_DSI1CLK>, <&prcmu_clk PRCMU_DSI1ESCCLK>;
-		clock-names = "hs", "lp";
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-	dsi2: dsi@a0353000 {
-		compatible = "ste,mcde-dsi";
-		reg = <0xa0353000 0x1000>;
-		vana-supply = <&ab8500_ldo_ana_reg>;
-		/* This DSI port only has the Low Power / Energy Save clock */
-		clocks = <&prcmu_clk PRCMU_DSI2ESCCLK>;
-		clock-names = "lp";
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/ste,mcde.yaml b/Documentation/devicetree/bindings/display/ste,mcde.yaml
new file mode 100644
index 000000000000..830c9b4091cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ste,mcde.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ste,mcde.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST-Ericsson Multi Channel Display Engine MCDE
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    const: ste,mcde
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: an array of the MCDE clocks
+    items:
+      - description: MCDECLK (main MCDE clock)
+      - description: LCDCLK (LCD clock)
+      - description: PLLDSI (HDMI clock)
+
+  clock-names:
+    items:
+      - const: mcde
+      - const: lcd
+      - const: hdmi
+
+  resets:
+    maxItems: 1
+
+  epod-supply:
+    description: a phandle to the EPOD regulator
+
+  vana-supply:
+    description: a phandle to the analog voltage regulator
+
+  port:
+    type: object
+    description:
+      A DPI port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^dsi@[0-9a-f]+$":
+    description: subnodes for the three DSI host adapters
+    type: object
+    allOf:
+      - $ref: dsi-controller.yaml#
+    properties:
+      compatible:
+        const: ste,mcde-dsi
+
+      reg:
+        maxItems: 1
+
+      vana-supply:
+        description: a phandle to the analog voltage regulator
+
+      clocks:
+        description: phandles to the high speed and low power (energy save) clocks
+          the high speed clock is not present on the third (dsi2) block, so it
+          should only have the "lp" clock
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        oneOf:
+          - items:
+              - const: hs
+              - const: lp
+          - items:
+              - const: lp
+
+    required:
+      - compatible
+      - reg
+      - vana-supply
+      - clocks
+      - clock-names
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - epod-supply
+  - vana-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mfd/dbx500-prcmu.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    mcde@a0350000 {
+      compatible = "ste,mcde";
+      reg = <0xa0350000 0x1000>;
+      interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+      epod-supply = <&db8500_b2r2_mcde_reg>;
+      vana-supply = <&ab8500_ldo_ana_reg>;
+      clocks = <&prcmu_clk PRCMU_MCDECLK>,
+               <&prcmu_clk PRCMU_LCDCLK>,
+               <&prcmu_clk PRCMU_PLLDSI>;
+      clock-names = "mcde", "lcd", "hdmi";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      dsi0: dsi@a0351000 {
+        compatible = "ste,mcde-dsi";
+        reg = <0xa0351000 0x1000>;
+        vana-supply = <&ab8500_ldo_ana_reg>;
+        clocks = <&prcmu_clk PRCMU_DSI0CLK>, <&prcmu_clk PRCMU_DSI0ESCCLK>;
+        clock-names = "hs", "lp";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+          compatible = "samsung,s6d16d0";
+          reg = <0>;
+          vdd1-supply = <&ab8500_ldo_aux1_reg>;
+          reset-gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
+        };
+      };
+
+      dsi1: dsi@a0352000 {
+        compatible = "ste,mcde-dsi";
+        reg = <0xa0352000 0x1000>;
+        vana-supply = <&ab8500_ldo_ana_reg>;
+        clocks = <&prcmu_clk PRCMU_DSI1CLK>, <&prcmu_clk PRCMU_DSI1ESCCLK>;
+        clock-names = "hs", "lp";
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+
+      dsi2: dsi@a0353000 {
+        compatible = "ste,mcde-dsi";
+        reg = <0xa0353000 0x1000>;
+        vana-supply = <&ab8500_ldo_ana_reg>;
+        /* This DSI port only has the Low Power / Energy Save clock */
+        clocks = <&prcmu_clk PRCMU_DSI2ESCCLK>;
+        clock-names = "lp";
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+    };
+
+...
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
