Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C66E32AF1A8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 14:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359498915B;
	Wed, 11 Nov 2020 13:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0198915B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 13:08:11 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 74so3058489lfo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 05:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oxwnhzkt/PN6/sXeM3n8c5ZwySGgQoKrslhl8b+S4sY=;
 b=LoRB7XIMp+jsMO/urS8K8C+S8QcJKlGd3y80e9+mJwhmPjMAANbpmsytiUqsrOo9Zc
 xY4ycP+c96Qz5SMtcoPxArWIjOKJ9/exdk7CXt/EgoWWkDONceqLE7P1POjqP8hlMoJs
 6KIz693z8rYq9+BJw9XA9YS8wYkGUbu9SIuZ09NavZMxKy5AVPHjfcLv3q++oteJopOO
 XBvLlWnoWwAqLaU1kpUZGF/DlLNGGNTVl9Jl/eh+Bddyj8vGK1fNm3Z8lj6Nje1DFJaN
 Wcp21tHJFHcTjaKUVKXSb3f9QLH+HF4wotTB0uQThyxQoswAkH9iI8aPHMSSjSWL/pOV
 aICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oxwnhzkt/PN6/sXeM3n8c5ZwySGgQoKrslhl8b+S4sY=;
 b=b6weUPMgpMf8V/1MW+2XkcxndAokWTSn+2PheiuooMETgHI3jhF12wP1XrDBHOJCZ4
 pccii5xYLbc//mTiqLBNw9OgaoFfoieaLIpZQTM42Vs7zaqxwYTDTWpsfly1Sltt56Tn
 e8Yi4Hjw8kvzPgiBqsh3JoNyNZdrfS9RDOLah2wBDN05X5navS5YQyetPPymRxpAu85E
 uKNbsIkL+ogamiRo02kRoi58tOTEmuG88S/eUOEYZ3J8fWyOz/o7EhEeZokYpfXESb2I
 pwzsuHkV3e7DYXtY606m8w0voDRBJ/LCVWXnNrwWTum5xgqb5e3JZIm7NG+zVPxOh8zW
 /OTA==
X-Gm-Message-State: AOAM531EgvJAfLDeZ6u0u+883IdzGSd/3FsVyR7Vyq1lnl5TkDkhU7Ic
 mv27DAbhAkWtSyqp8Fo+xWYYJs/Tco5PiOJb
X-Google-Smtp-Source: ABdhPJxgNW5S6E9QODxDE8bEj4LFNE6xtq3p8MFtYnZoSmvlrOsWvik98obnAQWebIZDc7hQI5BHEg==
X-Received: by 2002:a19:ad06:: with SMTP id t6mr10021401lfc.222.1605100089749; 
 Wed, 11 Nov 2020 05:08:09 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id q7sm230512ljh.79.2020.11.11.05.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:08:09 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH v2] dt-bindings: display: mcde: Convert to YAML schema
Date: Wed, 11 Nov 2020 14:07:54 +0100
Message-Id: <20201111130754.2283993-1-linus.walleij@linaro.org>
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
 .../devicetree/bindings/display/ste,mcde.yaml | 166 ++++++++++++++++++
 2 files changed, 166 insertions(+), 104 deletions(-)
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
index 000000000000..51851566c72d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ste,mcde.yaml
@@ -0,0 +1,166 @@
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
+additionalProperties: true
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
