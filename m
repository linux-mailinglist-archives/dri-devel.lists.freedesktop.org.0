Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688F46D44A2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 14:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E90810E16B;
	Mon,  3 Apr 2023 12:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED64F10E16B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 12:45:07 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 f7-20020a4ab647000000b0054101f316c7so1159123ooo.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 05:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680525907; x=1683117907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EEiwmU/bK6nXvyr4GVL1g8PaLiBm1e8+Qx3WwljddG0=;
 b=F0wrxL2tsxiheL2oG1RX0QFXLFNUyr1exY6jhbBSdWZ3uKKw2RRic9emRxySeXxws5
 sfJq8JwSIG0AYcTS0/rntS4Zo4QQ1xP3znEk4VShdr1mQodp1YEx+Zozj7D3N7IMY2zN
 pR01UX3cgtEzL94ZTQtiDcbMeNZIOUubJDJx08nKMBgxQkzWvaod50z3RZn6r77RvkpP
 Bhhs096xwBDKXQQrRzSHAxGEhadLZSHTr8htSCe4RbqcFizxpVfn6ibhok8iclF3qNkU
 zg6jLLCylcddqJYVho4wwjw4kp9Tn7S7NhEHLx5TnK+piJQyOuSzJYYEeFI9jkwf8Mvz
 AuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680525907; x=1683117907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EEiwmU/bK6nXvyr4GVL1g8PaLiBm1e8+Qx3WwljddG0=;
 b=bd+CjxuyR5NHtznzDF0CXX0vB0P+qvd7Xlqx4udy4UgctJA/r1Vf8mDY6ExAES6Ftr
 +wyaCTtwGAXR/sspj8Utv/prZ/VheAIllOrRJCiGYD0DfsBSBf5WDLykTGD0pNgkWb+X
 7UNqj5TGHYXOznyAnXxAAuQogcWu+i+atlPtWZ4hFGKMldSa3B5yDz//eLxZBC4SdEFE
 g3n/A+TDjRT/auNtd2trvaKjFj0xG4XMSekWfdHvLde0zVMg3E6y9b33kBU0l19Jd2m/
 /DN/ARj+zgs78QMJ9A1VvjfbOVIF8WJztk+aVj2TAZGnx/KqRbSuJQ4lJIXlXZ7kiHBO
 fTfg==
X-Gm-Message-State: AAQBX9e/YSisKVCefShRTf4qkpmZGE6WhKdy8Px1nAjAX9VrxK4Z/i4q
 cKnP9bayHcLIi/zKTjA7c6I=
X-Google-Smtp-Source: AKy350YFtWu0YJtjMsDIFCBRdXGtVluGsavafCbCo3f1CVAHDEK9xMbQA4lDWAwyhLWx7n1iMf0P0g==
X-Received: by 2002:a05:6820:1b05:b0:53f:f8b:f8f2 with SMTP id
 bv5-20020a0568201b0500b0053f0f8bf8f2mr4770200oob.1.1680525906728; 
 Mon, 03 Apr 2023 05:45:06 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:791a:66eb:9101:534])
 by smtp.gmail.com with ESMTPSA id
 h38-20020a4a9429000000b0051a6cb524b6sm3952136ooi.2.2023.04.03.05.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 05:45:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v2] dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to
 yaml
Date: Mon,  3 Apr 2023 09:44:58 -0300
Message-Id: <20230403124458.198631-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jagan Teki <jagan@amarulasolutions.com>

Samsung MIPI DSIM bridge can be found on Exynos and NXP's 
i.MX8M Mini/Nano/Plus SoCs.

Convert exynos_dsim.txt to yaml.

Used the example node from latest Exynos SoC instead of
the one used in legacy exynos_dsim.txt.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Added samsung,mipi-dsim.yaml entry to MAINTAINERS file (Jagan)
- Added Marek Szyprowski entry to the samsung,mipi-dsim.yaml maintainers section (Jagan)
- Mention that i.MX8M Plus is also supported (Marek)
- Remove endpoint@0 description as it only has one endpoint (Marek)

 .../display/bridge/samsung,mipi-dsim.yaml     | 271 ++++++++++++++++++
 .../bindings/display/exynos/exynos_dsim.txt   |  92 ------
 MAINTAINERS                                   |   1 +
 3 files changed, 272 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
new file mode 100644
index 000000000000..2698752dc6ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -0,0 +1,271 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung MIPI DSIM bridge controller
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Jagan Teki <jagan@amarulasolutions.com>
+
+description: |
+  Samsung MIPI DSIM bridge controller can be found it on Exynos
+  and i.MX8M Mini/Nano/Plus SoC's.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos3250-mipi-dsi
+      - samsung,exynos4210-mipi-dsi
+      - samsung,exynos5410-mipi-dsi
+      - samsung,exynos5422-mipi-dsi
+      - samsung,exynos5433-mipi-dsi
+      - fsl,imx8mm-mipi-dsim
+      - fsl,imx8mp-mipi-dsim
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  clocks:
+    minItems: 2
+    maxItems: 5
+
+  clock-names:
+    minItems: 2
+    maxItems: 5
+
+  phys:
+    maxItems: 1
+    description: phandle to the phy module representing the DPHY
+
+  phy-names:
+    items:
+      - const: dsim
+
+  samsung,phy-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: phandle to the samsung phy-type
+
+  power-domains:
+    description: phandle to the associated power domain
+    maxItems: 1
+
+  samsung,power-domain:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the associated samsung power domain
+
+  vddcore-supply:
+    description: MIPI DSIM Core voltage supply (e.g. 1.1V)
+
+  vddio-supply:
+    description: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
+
+  samsung,burst-clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      DSIM high speed burst mode frequency.
+
+  samsung,esc-clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      DSIM escape mode frequency.
+
+  samsung,pll-clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      DSIM oscillator clock frequency.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Input port node to receive pixel data from the
+          display controller. Exactly one endpoint must be
+          specified.
+
+        unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DSI output port node to the panel or the next bridge
+          in the chain
+
+required:
+  - '#address-cells'
+  - '#size-cells'
+  - clock-names
+  - clocks
+  - compatible
+  - interrupts
+  - phy-names
+  - phys
+  - reg
+  - samsung,burst-clock-frequency
+  - samsung,esc-clock-frequency
+  - samsung,pll-clock-frequency
+
+allOf:
+  - $ref: ../dsi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos5433-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          items:
+            - const: bus_clk
+            - const: phyclk_mipidphy0_bitclkdiv8
+            - const: phyclk_mipidphy0_rxclkesc0
+            - const: sclk_rgb_vclk_to_dsim0
+            - const: sclk_mipi
+
+        ports:
+          required:
+            - port@0
+
+      required:
+        - ports
+        - vddcore-supply
+        - vddio-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos5410-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          items:
+            - const: bus_clk
+            - const: pll_clk
+
+      required:
+        - vddcore-supply
+        - vddio-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos4210-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          items:
+            - const: bus_clk
+            - const: sclk_mipi
+
+      required:
+        - vddcore-supply
+        - vddio-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos3250-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          items:
+            - const: bus_clk
+            - const: pll_clk
+
+      required:
+        - vddcore-supply
+        - vddio-supply
+        - samsung,phy-type
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5433.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dsi@13900000 {
+       compatible = "samsung,exynos5433-mipi-dsi";
+       reg = <0x13900000 0xC0>;
+       interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+       phys = <&mipi_phy 1>;
+       phy-names = "dsim";
+       clocks = <&cmu_disp CLK_PCLK_DSIM0>,
+                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8>,
+                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0>,
+                <&cmu_disp CLK_SCLK_RGB_VCLK_TO_DSIM0>,
+                <&cmu_disp CLK_SCLK_DSIM0>;
+       clock-names = "bus_clk",
+                     "phyclk_mipidphy0_bitclkdiv8",
+                     "phyclk_mipidphy0_rxclkesc0",
+                     "sclk_rgb_vclk_to_dsim0",
+                     "sclk_mipi";
+       power-domains = <&pd_disp>;
+       vddcore-supply = <&ldo6_reg>;
+       vddio-supply = <&ldo7_reg>;
+       samsung,burst-clock-frequency = <512000000>;
+       samsung,esc-clock-frequency = <16000000>;
+       samsung,pll-clock-frequency = <24000000>;
+       pinctrl-names = "default";
+       pinctrl-0 = <&te_irq>;
+       status = "disabled";
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       panel@0 {
+          compatible = "samsung,s6e3ha2";
+          reg = <0>;
+          vdd3-supply = <&ldo27_reg>;
+          vci-supply = <&ldo28_reg>;
+          reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
+          enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
+       };
+
+       ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+             reg = <0>;
+
+             dsi_to_mic: endpoint {
+                remote-endpoint = <&mic_to_dsi>;
+             };
+          };
+       };
+    };
diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
deleted file mode 100644
index 2a5f0889ec32..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-Exynos MIPI DSI Master
-
-Required properties:
-  - compatible: value should be one of the following
-		"samsung,exynos3250-mipi-dsi" /* for Exynos3250/3472 SoCs */
-		"samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
-		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
-		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
-		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
-		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
-		"fsl,imx8mp-mipi-dsim" /* for i.MX8M Plus SoCs */
-  - reg: physical base address and length of the registers set for the device
-  - interrupts: should contain DSI interrupt
-  - clocks: list of clock specifiers, must contain an entry for each required
-    entry in clock-names
-  - clock-names: should include "bus_clk"and "sclk_mipi" entries
-		 the use of "pll_clk" is deprecated
-  - phys: list of phy specifiers, must contain an entry for each required
-    entry in phy-names
-  - phy-names: should include "dsim" entry
-  - vddcore-supply: MIPI DSIM Core voltage supply (e.g. 1.1V)
-  - vddio-supply: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
-  - samsung,pll-clock-frequency: specifies frequency of the oscillator clock
-  - #address-cells, #size-cells: should be set respectively to <1> and <0>
-    according to DSI host bindings (see MIPI DSI bindings [1])
-  - samsung,burst-clock-frequency: specifies DSI frequency in high-speed burst
-    mode
-  - samsung,esc-clock-frequency: specifies DSI frequency in escape mode
-
-Optional properties:
-  - power-domains: a phandle to DSIM power domain node
-
-Child nodes:
-  Should contain DSI peripheral nodes (see MIPI DSI bindings [1]).
-
-Video interfaces:
-  Device node can contain following video interface port nodes according to [2]:
-  0: RGB input,
-  1: DSI output
-
-[1]: Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
-[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-	dsi@11c80000 {
-		compatible = "samsung,exynos4210-mipi-dsi";
-		reg = <0x11C80000 0x10000>;
-		interrupts = <0 79 0>;
-		clocks = <&clock 286>, <&clock 143>;
-		clock-names = "bus_clk", "sclk_mipi";
-		phys = <&mipi_phy 1>;
-		phy-names = "dsim";
-		vddcore-supply = <&vusb_reg>;
-		vddio-supply = <&vmipi_reg>;
-		power-domains = <&pd_lcd0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		samsung,pll-clock-frequency = <24000000>;
-
-		panel@1 {
-			reg = <0>;
-			...
-			port {
-				panel_ep: endpoint {
-					remote-endpoint = <&dsi_ep>;
-				};
-			};
-		};
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				decon_to_mic: endpoint {
-					remote-endpoint = <&mic_to_decon>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				dsi_ep: endpoint {
-					reg = <0>;
-					samsung,burst-clock-frequency = <500000000>;
-					samsung,esc-clock-frequency = <20000000>;
-					remote-endpoint = <&panel_ep>;
-				};
-			};
-		};
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 4f57deee1a08..aca7027dc464 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6640,6 +6640,7 @@ M:	Jagan Teki <jagan@amarulasolutions.com>
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
 F:	drivers/gpu/drm/bridge/samsung-dsim.c
 F:	include/drm/bridge/samsung-dsim.h
 
-- 
2.34.1

