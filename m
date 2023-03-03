Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F96AA1BB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 22:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E8D10E76C;
	Fri,  3 Mar 2023 21:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D87E10E761;
 Fri,  3 Mar 2023 21:42:28 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id f20so2638432uam.3;
 Fri, 03 Mar 2023 13:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677879747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rFg6pSfino77uF+HXmnoihrZxJlMZzrsrBXsKobvwe8=;
 b=f/fD4R1S9SeixcyNLbfFxEYB7cG3G8w40nCfTh+Tf5A8Pr3MRwjxbhKNIMSxDG7sWg
 IlAtMW9Ci5M9mcZEpotcRwU+pvbz9MR4sxNiFQbTR4f1Z4YEZ1Wuc4PupiVANBsysTJC
 C2062XzdzSkju9YT1vRuOtm3G0jdKEVw4GLoxYW2PQgE6htkmne2wAuBWvv6HGeG9OMO
 FB3NGgsyDFCSQwPT8/cc5ZWpRBvd0JJRSjVSxOE0WvJmXbqWP8JKxPhoGe6w/Ai62oeP
 eOVNGdyeg15HGyQIOS3J3NKZek6mvN6N9N/hLQFRcpIxX+u6DexZUBUjSLzWpvDaA1OX
 w7qg==
X-Gm-Message-State: AO0yUKWjnDtZLlry8zgDjDmtt8Lr5WVcoTo3nLR9yhC4S4YWzNg4Ryce
 upNuoSMITgY7y4+ZESoRqQ==
X-Google-Smtp-Source: AK7set/TFn6+sHFO6iJCrVn9rkV/klD75YUW0HXM8c9ScE+df0qdv/4xZOSEsBrdkimegwYlR5lx1Q==
X-Received: by 2002:a05:6122:d9a:b0:401:32f5:a867 with SMTP id
 bc26-20020a0561220d9a00b0040132f5a867mr1716236vkb.2.1677879747018; 
 Fri, 03 Mar 2023 13:42:27 -0800 (PST)
Received: from robh_at_kernel.org (adsl-72-50-1-86.prtc.net. [72.50.1.86])
 by smtp.gmail.com with ESMTPSA id
 q141-20020a1fa793000000b004123f2e187csm432069vke.5.2023.03.03.13.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 13:42:26 -0800 (PST)
Received: (nullmailer pid 49481 invoked by uid 1000);
 Fri, 03 Mar 2023 21:42:23 -0000
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: yamllint: Require a space after a comment '#'
Date: Fri,  3 Mar 2023 15:42:23 -0600
Message-Id: <20230303214223.49451-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-crypto@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable yamllint to check the prefered commenting style of requiring a
space after a comment character '#'. Fix the cases in the tree which
have a warning with this enabled. Most cases just need a space after the
'#'. A couple of cases with comments which were not intended to be
comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
brcm,bcmgenet.yaml.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-phy@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-spi@vger.kernel.org
---
 Documentation/devicetree/bindings/.yamllint   |  2 +-
 .../bindings/clock/qcom,a53pll.yaml           |  4 ++--
 .../devicetree/bindings/crypto/ti,sa2ul.yaml  |  4 ++--
 .../bindings/display/msm/qcom,mdp5.yaml       |  2 +-
 .../interrupt-controller/arm,gic.yaml         |  4 ++--
 .../loongson,pch-msi.yaml                     |  2 +-
 .../bindings/media/renesas,vin.yaml           |  4 ++--
 .../devicetree/bindings/media/ti,cal.yaml     |  4 ++--
 .../bindings/net/brcm,bcmgenet.yaml           |  2 --
 .../bindings/net/cortina,gemini-ethernet.yaml |  6 ++---
 .../devicetree/bindings/net/mdio-gpio.yaml    |  4 ++--
 .../phy/marvell,armada-cp110-utmi-phy.yaml    |  2 +-
 .../bindings/phy/phy-stm32-usbphyc.yaml       |  2 +-
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |  2 +-
 .../bindings/pinctrl/pinctrl-mt8192.yaml      |  2 +-
 .../regulator/nxp,pca9450-regulator.yaml      |  8 +++----
 .../regulator/rohm,bd71828-regulator.yaml     | 20 ++++++++--------
 .../regulator/rohm,bd71837-regulator.yaml     |  6 ++---
 .../regulator/rohm,bd71847-regulator.yaml     |  6 ++---
 .../bindings/soc/renesas/renesas.yaml         |  2 +-
 .../devicetree/bindings/soc/ti/ti,pruss.yaml  |  2 +-
 .../bindings/sound/amlogic,axg-tdm-iface.yaml |  2 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml   |  4 ++--
 .../bindings/sound/qcom,lpass-tx-macro.yaml   |  4 ++--
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  4 ++--
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  2 +-
 .../bindings/sound/simple-card.yaml           | 24 +++++++++----------
 .../bindings/spi/microchip,mpfs-spi.yaml      |  2 +-
 28 files changed, 65 insertions(+), 67 deletions(-)

diff --git a/Documentation/devicetree/bindings/.yamllint b/Documentation/devicetree/bindings/.yamllint
index 214abd3ec440..4abe9f0a1d46 100644
--- a/Documentation/devicetree/bindings/.yamllint
+++ b/Documentation/devicetree/bindings/.yamllint
@@ -19,7 +19,7 @@ rules:
   colons: {max-spaces-before: 0, max-spaces-after: 1}
   commas: {min-spaces-after: 1, max-spaces-after: 1}
   comments:
-    require-starting-space: false
+    require-starting-space: true
     min-spaces-from-content: 1
   comments-indentation: disable
   document-start:
diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 525ebaa93c85..64bfd0f5d4d0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -45,14 +45,14 @@ required:
 additionalProperties: false
 
 examples:
-  #Example 1 - A53 PLL found on MSM8916 devices
+  # Example 1 - A53 PLL found on MSM8916 devices
   - |
     a53pll: clock@b016000 {
         compatible = "qcom,msm8916-a53pll";
         reg = <0xb016000 0x40>;
         #clock-cells = <0>;
     };
-  #Example 2 - A53 PLL found on IPQ6018 devices
+  # Example 2 - A53 PLL found on IPQ6018 devices
   - |
     a53pll_ipq: clock-controller@b116000 {
         compatible = "qcom,ipq6018-a53pll";
diff --git a/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml b/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml
index 0c15fefb6671..77ec8bc70bf7 100644
--- a/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml
+++ b/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml
@@ -26,8 +26,8 @@ properties:
   dmas:
     items:
       - description: TX DMA Channel
-      - description: RX DMA Channel #1
-      - description: RX DMA Channel #2
+      - description: 'RX DMA Channel #1'
+      - description: 'RX DMA Channel #2'
 
   dma-names:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index ef461ad6ce4a..a763cf8da122 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -61,7 +61,7 @@ properties:
           - const: lut
           - const: tbu
           - const: tbu_rt
-        #MSM8996 has additional iommu clock
+        # MSM8996 has additional iommu clock
       - items:
           - const: iface
           - const: bus
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index 220256907461..a2846e493497 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -133,8 +133,8 @@ properties:
       - items: # for "arm,cortex-a9-gic"
           - const: PERIPHCLK
           - const: PERIPHCLKEN
-      - const: clk # for "arm,gic-400" and "nvidia,tegra210"
-      - const: gclk #for "arm,pl390"
+      - const: clk  # for "arm,gic-400" and "nvidia,tegra210"
+      - const: gclk # for "arm,pl390"
 
   power-domains:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
index 1f6fd73d4624..31e6bfbc3fd3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
@@ -46,7 +46,7 @@ required:
   - loongson,msi-base-vec
   - loongson,msi-num-vecs
 
-additionalProperties: true #fixme
+additionalProperties: true # fixme
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index c0442e79cbb4..ffa7a6c4f212 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -69,7 +69,7 @@ properties:
   resets:
     maxItems: 1
 
-  #The per-board settings for Gen2 and RZ/G1 platforms:
+  # The per-board settings for Gen2 and RZ/G1 platforms:
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
@@ -108,7 +108,7 @@ properties:
 
           data-active: true
 
-  #The per-board settings for Gen3 and RZ/G2 platforms:
+  # The per-board settings for Gen3 and RZ/G2 platforms:
   renesas,id:
     description: VIN channel number
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
index f8e4d260d10a..26b3fedef355 100644
--- a/Documentation/devicetree/bindings/media/ti,cal.yaml
+++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
@@ -75,7 +75,7 @@ properties:
       port@0:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI2 Port #0
+        description: 'CSI2 Port #0'
 
         properties:
           endpoint:
@@ -93,7 +93,7 @@ properties:
       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI2 Port #1
+        description: 'CSI2 Port #1'
 
         properties:
           endpoint:
diff --git a/Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml b/Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml
index c99034f053e8..0e5e5db32faf 100644
--- a/Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml
+++ b/Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml
@@ -73,8 +73,6 @@ allOf:
 unevaluatedProperties: false
 
 examples:
-  #include <dt-bindings/interrupt-controller/arm-gic.h>
-
   - |
     ethernet@f0b60000 {
         phy-mode = "internal";
diff --git a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
index 253b5d1407ee..44fd23a5fa2b 100644
--- a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
+++ b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
@@ -31,9 +31,9 @@ properties:
 
   ranges: true
 
-#The subnodes represents the two ethernet ports in this device.
-#They are not independent of each other since they share resources
-#in the parent node, and are thus children.
+# The subnodes represents the two ethernet ports in this device.
+# They are not independent of each other since they share resources
+# in the parent node, and are thus children.
 patternProperties:
   "^ethernet-port@[0-9]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/net/mdio-gpio.yaml b/Documentation/devicetree/bindings/net/mdio-gpio.yaml
index 1d83b8dcce2c..137657341802 100644
--- a/Documentation/devicetree/bindings/net/mdio-gpio.yaml
+++ b/Documentation/devicetree/bindings/net/mdio-gpio.yaml
@@ -33,8 +33,8 @@ properties:
       - description: MDIO
       - description: MDO
 
-#Note: Each gpio-mdio bus should have an alias correctly numbered in "aliases"
-#node.
+# Note: Each gpio-mdio bus should have an alias correctly numbered in "aliases"
+# node.
 additionalProperties:
   type: object
 
diff --git a/Documentation/devicetree/bindings/phy/marvell,armada-cp110-utmi-phy.yaml b/Documentation/devicetree/bindings/phy/marvell,armada-cp110-utmi-phy.yaml
index 30f3b5f32a95..43416c216190 100644
--- a/Documentation/devicetree/bindings/phy/marvell,armada-cp110-utmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/marvell,armada-cp110-utmi-phy.yaml
@@ -41,7 +41,7 @@ properties:
       Phandle to the system controller node
     $ref: /schemas/types.yaml#/definitions/phandle
 
-#Required child nodes:
+# Required child nodes:
 
 patternProperties:
   "^usb-phy@[0|1]$":
diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
index 5b4c915cc9e5..24a3dbde223b 100644
--- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
@@ -55,7 +55,7 @@ properties:
     description: number of clock cells for ck_usbo_48m consumer
     const: 0
 
-#Required child nodes:
+# Required child nodes:
 
 patternProperties:
   "^usb-phy@[0|1]$":
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index 2e19a434c669..0ef2c9b9d466 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -83,7 +83,7 @@ properties:
     description:
       Phandle to a regulator supply to any specific refclk pll block.
 
-#Required nodes:
+# Required nodes:
 patternProperties:
   "^usb3-phy@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
index e0e943e5b874..a09ebbfec574 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
@@ -51,7 +51,7 @@ properties:
     description: The interrupt outputs to sysirq.
     maxItems: 1
 
-#PIN CONFIGURATION NODES
+# PIN CONFIGURATION NODES
 patternProperties:
   '-pins$':
     type: object
diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
index 835b53302db8..6b53dc87694e 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
@@ -17,10 +17,10 @@ description: |
   Datasheet is available at
   https://www.nxp.com/docs/en/data-sheet/PCA9450DS.pdf
 
-#The valid names for PCA9450 regulator nodes are:
-#BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6,
-#LDO1, LDO2, LDO3, LDO4, LDO5
-#Note: Buck3 removed on PCA9450B and connect with Buck1 on PCA9450C.
+# The valid names for PCA9450 regulator nodes are:
+# BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6,
+# LDO1, LDO2, LDO3, LDO4, LDO5
+# Note: Buck3 removed on PCA9450B and connect with Buck1 on PCA9450C.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
index 3cbe3b76ccee..bbf38d5cd06d 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
@@ -82,20 +82,20 @@ patternProperties:
 
         # Supported default DVS states:
         #     buck       |    run     |   idle    | suspend  | lpsr
-        #--------------------------------------------------------------
+        # --------------------------------------------------------------
         # 1, 2, 6, and 7 | supported  | supported | supported (*)
-        #--------------------------------------------------------------
+        # --------------------------------------------------------------
         # 3, 4, and 5    |                    supported (**)
-        #--------------------------------------------------------------
+        # --------------------------------------------------------------
         #
-        #(*)  LPSR and SUSPEND states use same voltage but both states have own
-        #     enable /
-        #     disable settings. Voltage 0 can be specified for a state to make
-        #     regulator disabled on that state.
+        # (*)  LPSR and SUSPEND states use same voltage but both states have own
+        #      enable /
+        #      disable settings. Voltage 0 can be specified for a state to make
+        #      regulator disabled on that state.
         #
-        #(**) All states use same voltage but have own enable / disable
-        #     settings. Voltage 0 can be specified for a state to make
-        #     regulator disabled on that state.
+        # (**) All states use same voltage but have own enable / disable
+        #      settings. Voltage 0 can be specified for a state to make
+        #      regulator disabled on that state.
 
     required:
       - regulator-name
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml
index ab842817d847..abf1fbdf3850 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml
@@ -23,9 +23,9 @@ description: |
   if they are disabled at startup the voltage monitoring for LDO5/LDO6 will
   cause PMIC to reset.
 
-#The valid names for BD71837 regulator nodes are:
-#BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6, BUCK7, BUCK8
-#LDO1, LDO2, LDO3, LDO4, LDO5, LDO6, LDO7
+# The valid names for BD71837 regulator nodes are:
+# BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6, BUCK7, BUCK8
+# LDO1, LDO2, LDO3, LDO4, LDO5, LDO6, LDO7
 
 patternProperties:
   "^LDO[1-7]$":
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml
index 65fc3d15f693..34ce781954b6 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml
@@ -22,9 +22,9 @@ description: |
   not be disabled by driver at startup. If BUCK5 is disabled at startup the
   voltage monitoring for LDO5/LDO6 can cause PMIC to reset.
 
-#The valid names for BD71847 regulator nodes are:
-#BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6
-#LDO1, LDO2, LDO3, LDO4, LDO5, LDO6
+# The valid names for BD71847 regulator nodes are:
+# BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6
+# LDO1, LDO2, LDO3, LDO4, LDO5, LDO6
 
 patternProperties:
   "^LDO[1-6]$":
diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 2789022b52eb..3a618b4c8ab7 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -111,7 +111,7 @@ properties:
       - description: RZ/G1C (R8A77470)
         items:
           - enum:
-              - iwave,g23s #iWave Systems RZ/G1C Single Board Computer (iW-RainboW-G23S)
+              - iwave,g23s # iWave Systems RZ/G1C Single Board Computer (iW-RainboW-G23S)
           - const: renesas,r8a77470
 
       - description: RZ/G2M (R8A774A1)
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
index 847873289f25..c697691f1fd4 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -313,7 +313,7 @@ additionalProperties: false
 # Due to inability of correctly verifying sub-nodes with an @address through
 # the "required" list, the required sub-nodes below are commented out for now.
 
-#required:
+# required:
 # - memories
 # - interrupt-controller
 # - pru
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
index 320f0002649d..45955d8a26d1 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
@@ -24,7 +24,7 @@ properties:
     items:
       - description: Bit clock
       - description: Sample clock
-      - description: Master clock #optional
+      - description: Master clock # optional
 
   clock-names:
     minItems: 2
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 79c6f8da1319..e6fcf542cf87 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -34,13 +34,13 @@ properties:
 
   clock-names:
     oneOf:
-      - items:   #for ADSP based platforms
+      - items:   # for ADSP based platforms
           - const: mclk
           - const: npl
           - const: macro
           - const: dcodec
           - const: fsgen
-      - items:   #for ADSP bypass based platforms
+      - items:   # for ADSP bypass based platforms
           - const: mclk
           - const: npl
           - const: fsgen
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index da5f70910da5..6c8751497d36 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -36,13 +36,13 @@ properties:
 
   clock-names:
     oneOf:
-      - items:   #for ADSP based platforms
+      - items:   # for ADSP based platforms
           - const: mclk
           - const: npl
           - const: macro
           - const: dcodec
           - const: fsgen
-      - items:   #for ADSP bypass based platforms
+      - items:   # for ADSP bypass based platforms
           - const: mclk
           - const: npl
           - const: fsgen
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 0a3c688ef1ec..61cdfc265b0f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -34,11 +34,11 @@ properties:
 
   clock-names:
     oneOf:
-      - items:   #for ADSP based platforms
+      - items:   # for ADSP based platforms
           - const: mclk
           - const: macro
           - const: dcodec
-      - items:   #for ADSP bypass based platforms
+      - items:   # for ADSP bypass based platforms
           - const: mclk
 
   clock-output-names:
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index d06f188030a3..044e77718a1b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -26,7 +26,7 @@ properties:
   '#size-cells':
     const: 0
 
-#Digital Audio Interfaces
+# Digital Audio Interfaces
 patternProperties:
   '^dai@[0-9]+$':
     type: object
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index f0d81bfe2598..806e2fff165f 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -262,9 +262,9 @@ required:
 additionalProperties: false
 
 examples:
-#--------------------
+# --------------------
 # single DAI link
-#--------------------
+# --------------------
   - |
     sound {
         compatible = "simple-audio-card";
@@ -291,9 +291,9 @@ examples:
         };
     };
 
-#--------------------
+# --------------------
 # Multi DAI links
-#--------------------
+# --------------------
   - |
     sound {
         compatible = "simple-audio-card";
@@ -334,10 +334,10 @@ examples:
         };
     };
 
-#--------------------
+# --------------------
 # route audio from IMX6 SSI2 through TLV320DAC3100 codec
 # through TPA6130A2 amplifier to headphones:
-#--------------------
+# --------------------
   - |
     sound {
         compatible = "simple-audio-card";
@@ -359,9 +359,9 @@ examples:
         };
     };
 
-#--------------------
+# --------------------
 # Sampling Rate Conversion
-#--------------------
+# --------------------
   - |
     sound {
         compatible = "simple-audio-card";
@@ -387,9 +387,9 @@ examples:
         };
     };
 
-#--------------------
+# --------------------
 # 2 CPU 1 Codec (Mixing)
-#--------------------
+# --------------------
   - |
     sound {
         compatible = "simple-audio-card";
@@ -424,7 +424,7 @@ examples:
         };
     };
 
-#--------------------
+# --------------------
 # Multi DAI links with DPCM:
 #
 # CPU0 ------ ak4613
@@ -433,7 +433,7 @@ examples:
 # CPU3 --/                /* DPCM 5ch/6ch */
 # CPU4 --/                /* DPCM 7ch/8ch */
 # CPU5 ------ PCM3168A-c
-#--------------------
+# --------------------
   - |
     sound {
         compatible = "simple-audio-card";
diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
index 1051690e3753..74a817cc7d94 100644
--- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -22,7 +22,7 @@ properties:
       - items:
           - const: microchip,mpfs-qspi
           - const: microchip,coreqspi-rtl-v2
-      - const: microchip,coreqspi-rtl-v2 #FPGA QSPI
+      - const: microchip,coreqspi-rtl-v2 # FPGA QSPI
       - const: microchip,mpfs-spi
 
   reg:
-- 
2.39.2

