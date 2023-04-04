Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2716D5640
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 03:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE4910E54E;
	Tue,  4 Apr 2023 01:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122D910E2A8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 01:47:10 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17ebba88c60so32884477fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 18:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680572830; x=1683164830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u+rAMhXye71r8k79t/zlh0LDeIevikh0fUoSitoTI6g=;
 b=HuPihsvYtAeP+bvS3rcqgr5vyK7YyKFz2hfW7DSWBCfNXTk6G5kLq7qnyx4+ODG0WC
 9nTViYpxlzH4B3JZ+0tzwxLLFRfxKNEdxqihJL5BBzTRUcrLLrZWF0FZ6OT1HDRIiOTR
 dHjkFmCh1+lbEgFjrp8hdjulrMxfuABmfyyhboJmBJP4aFfSKZhgcxMBx3Taq4Mod32e
 +moEVLpEbMrYjZrNCy9O8MdQEnrcPIidxRW2MG3RO8JzPR2btWtT6Rh4h+fsds4SRyhh
 oLJ93reUtYgSA9kYRaQIepkoucZZI2J3hfxpbHiMB01P2x8aK2qNOjHDKQy8tey0rm3J
 zxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680572830; x=1683164830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u+rAMhXye71r8k79t/zlh0LDeIevikh0fUoSitoTI6g=;
 b=F8ycf2ikuqwVqbKTZ0vzHT1iSSWyPolyJgfkB9xH9sy1bfjhSHX+g+/C31ARQcIwmQ
 hqxw/Zlskd8ObrxWLqz58Kv8yniBLBW87plT99hizZNkCtYzYqtwyvp7XpLuwRuBG7ue
 pZ3boFAKYQPaYN8Lqla5o4eviUSgi67GEgqpzllPXqXfnZtNv1q7vkq72xrSsop+nlzR
 hkn/fCjGcDFsP1blNi03y4j0M+7H51mkaB53XCl561WCxLvrtUSxLYdcV6PROxIzfOKc
 78dSSn69cjT080hZTfFXcM2ndHhiDnDYA6rphiJisyaa5/sErqQUV1Zj2hyADuwZZr6/
 DI3A==
X-Gm-Message-State: AAQBX9cU7BFQokXJTjWwkl3+e1dB0gmewGXYqPxez+/MCU1dESVhwmRz
 sl9aL6U0MqhKrywTei1VpME=
X-Google-Smtp-Source: AKy350bYEJph3ZK/LuytDtZ6q4SefG+wvC66ApJE7reKyyoTkZrvX4xTTXA7lmWHsxFjLxPX8aECig==
X-Received: by 2002:a05:6870:51c:b0:17a:45b3:6585 with SMTP id
 j28-20020a056870051c00b0017a45b36585mr720675oao.0.1680572829725; 
 Mon, 03 Apr 2023 18:47:09 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:b774:9c46:6b8:3f2])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a056871029500b00176209a6d6asm4215049oae.10.2023.04.03.18.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:47:09 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v3] dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to
 yaml
Date: Mon,  3 Apr 2023 22:46:59 -0300
Message-Id: <20230404014659.505306-1-festevam@gmail.com>
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

Used the example node from exynos5433.dtsi instead of the one used in
the legacy exynos_dsim.txt.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Took previous Rob Herring's feedback into account:
https://lore.kernel.org/all/20210712151322.GA1931925@robh.at.kernel.org/
- Handled imx8mn and imx8mp
- Remove unnecessary #address-cells/size-cells.

 .../display/bridge/samsung,mipi-dsim.yaml     | 255 ++++++++++++++++++
 .../bindings/display/exynos/exynos_dsim.txt   |  92 -------
 MAINTAINERS                                   |   1 +
 3 files changed, 256 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
new file mode 100644
index 000000000000..55dbec178ea8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -0,0 +1,255 @@
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
+  - Marek Szyprowski <m.szyprowski@samsung.com>
+
+description: |
+  Samsung MIPI DSIM bridge controller can be found it on Exynos
+  and i.MX8M Mini/Nano/Plus SoC's.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - samsung,exynos3250-mipi-dsi
+          - samsung,exynos4210-mipi-dsi
+          - samsung,exynos5410-mipi-dsi
+          - samsung,exynos5422-mipi-dsi
+          - samsung,exynos5433-mipi-dsi
+          - fsl,imx8mm-mipi-dsim
+          - fsl,imx8mp-mipi-dsim
+      - items:
+          - const: fsl,imx8mn-mipi-dsim
+          - const: fsl,imx8mm-mipi-dsim
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
+  samsung,phy-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: phandle to the samsung phy-type
+
+  power-domains:
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
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: dsim
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port node to receive pixel data from the
+          display controller. Exactly one endpoint must be
+          specified.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DSI output port node to the panel or the next bridge
+          in the chain
+
+required:
+  - clock-names
+  - clocks
+  - compatible
+  - interrupts
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

