Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DED2A6553
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 14:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097326ED09;
	Wed,  4 Nov 2020 13:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6789B6ED09
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 13:37:21 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k25so22986930lji.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 05:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YuzDEYdnaOghE7AdVNEB5LTNZ+6AM+70CMY6cCVuBwk=;
 b=B9ydajV4s6CXAjxdSPkjU8uIFACIJ/wPrtXa+9mx4Jo2JfpoBdeL3kH4NpxPbti8VU
 aS9gct5iDPy4192nHA0XJfSA3GSqjbxsRQXe0P1lQHj/OlJGBQN9NLtNcaoZz30m58Ko
 Tr+0pyY4ZoBU4RMEzC5zQH9ZZ85O5YORUxFrQIFwoLgrQbOd/1ueE0r7LAMsQHsD1Vki
 XO97mmKp6rTo3cRhm/bCver5JRhl8aSBmsXPq9myClyewr4xyeoNtnXqwIFiLU7T/QBK
 r2AUCLUsOKT23WQKdgNKf3fgHriyh07geSR/pP4Xwm3La7ZPcqGDEKasBpAPTM8JMH0i
 FYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YuzDEYdnaOghE7AdVNEB5LTNZ+6AM+70CMY6cCVuBwk=;
 b=a9K9EBGXdLVem8X40hfvsoxehHcVTPBoccCLZH/gp63CpqzcmjWEdXahUGg69Yz3B4
 FqLIIgI6nHwh7DV6VDZzYu9yANaiSk3mi9ZAo/By3K7fXvdWnDEi2VsrfTgHvN5M/bwc
 pWjjHMs/aJaF+4/Op4BfO7oslHEydLCWUqWi0nPHaysITjGSfBlCFpYLp0VaRbSyFyT1
 /OjuWXAVgGUHeMI3VhL+oIKw/2HBHhG1NnSe1bSsuj+PFVDNp6hpfsyVrV7mrw9kFxWQ
 W+5pbq6pXcfhuc/PBbOKSZ07eYADUccyy12MwRGSixCapXyMrAH0SJJaJAkKbzAkli0u
 fW1g==
X-Gm-Message-State: AOAM531aruwXlFTWAnZRTtKDYI+hoEZ6oKTD8GDCIA5988GYHgIddlLg
 NKuY33WyhRHWmJL8ZpkocwHouiiM+mmm+9Nk
X-Google-Smtp-Source: ABdhPJxAM1oo0926Z94PtWqWZxPpV+KJElZbPhatXMuKoa9VF/OwknQnXTAOttxXI2rWI8yV0uZWdQ==
X-Received: by 2002:a2e:8ecc:: with SMTP id e12mr11090683ljl.98.1604497039454; 
 Wed, 04 Nov 2020 05:37:19 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id u25sm407418lfq.84.2020.11.04.05.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 05:37:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] dt-bindings: display: mcde: Convert to YAML schema
Date: Wed,  4 Nov 2020 14:37:09 +0100
Message-Id: <20201104133709.1373147-1-linus.walleij@linaro.org>
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

We also add the "port" node, we will use this when adding
LCD panels using the direct parallel interface DPI instead
of DSI.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/display/ste,mcde.txt  | 104 -----------
 .../devicetree/bindings/display/ste,mcde.yaml | 167 ++++++++++++++++++
 2 files changed, 167 insertions(+), 104 deletions(-)
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
index 000000000000..a00333acd9a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ste,mcde.yaml
@@ -0,0 +1,167 @@
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
+    description: the interrupt line for the MCDE
+
+  clocks:
+    maxItems: 3
+    description: an array of the MCDE clocks
+    items:
+      - description: MCDECLK (main MCDE clock)
+      - description: LCDCLK (LCD clock)
+      - description: PLLDSI (HDMI clock)
+
+  clock-names:
+    maxItems: 3
+    items:
+      - const: mcde
+      - const: lcd
+      - const: hdmi
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - epod-supply
+  - vana-supply
+
+unevaluatedProperties: false
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
