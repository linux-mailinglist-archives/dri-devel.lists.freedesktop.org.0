Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17535C1AC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612526E3DA;
	Mon, 12 Apr 2021 09:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC146E083
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:39:36 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c15so3232231wro.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 02:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+eQLUSDxC/KAAM8PQeZDYoC/OzSAmtGzEqBzK7vKIGE=;
 b=S6fzpl/s75vVv8GaAqf5ZTN4LDh0y9MH26OLlgagJ+bvjjFRGI6Itb0hTRBU7SsSZu
 w6MqOhpJgnLiJ+nJm5qcsEhdx0rRVDTaA9ojT6RbFPQC3AzCZegNQKaFNYTQ3GUfuRCk
 F/dk7wbDIL/zk0f9Ny1L5+kFc7E1cfrPgThGJUTIyg8mVI7WWSASDsB5bz7TyLBcOhX4
 aksWcwICfKfZFm69wh2qpyqlow7djgoVE/FGdbtP+WEERJO6aulOTlfuxgnoA/N8FtEJ
 5M7XJAEHG7bBcP87chiEiY2nvgDTOJ38Ulxz5y9L5NyvOWvlIKRjkZaztfy3xiUQg0zl
 hz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+eQLUSDxC/KAAM8PQeZDYoC/OzSAmtGzEqBzK7vKIGE=;
 b=pvZIDFX0w9Yl0MndGyO4AdLpRZkinls/Cv6zWjk8sMdX1Cliz0yoYgd1/VokAcG/FF
 nlS32BIVRCo2htxIVr2VQmxIO1x4dqA44NjA7hBtmcpOJLcPqPPGn77Qetb8k+YlEQjg
 zhVEchAJ3PWD8JurPFTEkeKFhxclsXLKmiTcArA4LRPraYCmvM1GHkx+ZuBC32swY5fW
 cbXxDzqGNb2dJpFVSO1FJdBEoq6YshfM3Tesv4l5G2dPy7zDHGmRLpBbV2H7p5y6D2Tl
 2trN2jd+7WubUUc+2M84as+bWHE48LuiYTIAAoSiBnjPB2hvwClTjBpUsgRZeqOZ3Efk
 aOVA==
X-Gm-Message-State: AOAM533HOMy2z3aXsOeQscZvXFswlxcj4Q54b+lk2trtuxftDCxxt2EA
 Og8b41r2+8NLk3Nb+qynXGRQ2A==
X-Google-Smtp-Source: ABdhPJwGo6b1fl6GiM30UBzNo5HI0PPshN6/qFRKQ5/fXShS8QTcPCs67HSa/l6X+PPuI/HtUH4a8Q==
X-Received: by 2002:adf:f990:: with SMTP id f16mr1883862wrr.312.1618220374703; 
 Mon, 12 Apr 2021 02:39:34 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: display: mediatek,
 hdmi: Convert to use graph schema
Date: Mon, 12 Apr 2021 11:39:24 +0200
Message-Id: <20210412093928.3321194-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412093928.3321194-1-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the mediatek,dpi binding to use the graph schema.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../display/mediatek/mediatek,cec.yaml        |  51 +++++++
 .../display/mediatek/mediatek,hdmi-ddc.yaml   |  57 ++++++++
 .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
 .../display/mediatek/mediatek,hdmi.yaml       | 131 +++++++++++++++++
 4 files changed, 239 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
new file mode 100644
index 000000000000..408e7dfce409
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI CEC Controller Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The HDMI CEC controller handles hotplug detection and CEC communication.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7623-hdmi
+      - mediatek,mt8173-hdmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    cec: cec@10013000 {
+        compatible = "mediatek,mt8173-cec";
+        reg = <0x10013000 0xbc>;
+        interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&infracfg CLK_INFRA_CEC>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
new file mode 100644
index 000000000000..c15b3470d652
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI DDC Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7623-hdmi
+      - mediatek,mt8173-hdmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ddc-i2c
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmi_ddc0: i2c@11012000 {
+        compatible = "mediatek,mt8173-hdmi-ddc";
+        reg = <0x11012000 0x1c>;
+        interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&pericfg CLK_PERI_I2C5>;
+        clock-names = "ddc-i2c";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
deleted file mode 100644
index b284ca51b913..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
+++ /dev/null
@@ -1,136 +0,0 @@
-Mediatek HDMI Encoder
-=====================
-
-The Mediatek HDMI encoder can generate HDMI 1.4a or MHL 2.0 signals from
-its parallel input.
-
-Required properties:
-- compatible: Should be "mediatek,<chip>-hdmi".
-- the supported chips are mt2701, mt7623 and mt8173
-- reg: Physical base address and length of the controller's registers
-- interrupts: The interrupt signal from the function block.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: must contain "pixel", "pll", "bclk", and "spdif".
-- phys: phandle link to the HDMI PHY node.
-  See Documentation/devicetree/bindings/phy/phy-bindings.txt for details.
-- phy-names: must contain "hdmi"
-- mediatek,syscon-hdmi: phandle link and register offset to the system
-  configuration registers. For mt8173 this must be offset 0x900 into the
-  MMSYS_CONFIG region: <&mmsys 0x900>.
-- ports: A node containing input and output port nodes with endpoint
-  definitions as documented in Documentation/devicetree/bindings/graph.txt.
-- port@0: The input port in the ports node should be connected to a DPI output
-  port.
-- port@1: The output port in the ports node should be connected to the input
-  port of a connector node that contains a ddc-i2c-bus property, or to the
-  input port of an attached bridge chip, such as a SlimPort transmitter.
-
-HDMI CEC
-========
-
-The HDMI CEC controller handles hotplug detection and CEC communication.
-
-Required properties:
-- compatible: Should be "mediatek,<chip>-cec"
-- the supported chips are mt7623 and mt8173
-- reg: Physical base address and length of the controller's registers
-- interrupts: The interrupt signal from the function block.
-- clocks: device clock
-
-HDMI DDC
-========
-
-The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
-The Mediatek's I2C controller is used to interface with I2C devices.
-
-Required properties:
-- compatible: Should be "mediatek,<chip>-hdmi-ddc"
-- the supported chips are mt7623 and mt8173
-- reg: Physical base address and length of the controller's registers
-- clocks: device clock
-- clock-names: Should be "ddc-i2c".
-
-HDMI PHY
-========
-See phy/mediatek,hdmi-phy.yaml
-
-Example:
-
-cec: cec@10013000 {
-	compatible = "mediatek,mt8173-cec";
-	reg = <0 0x10013000 0 0xbc>;
-	interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&infracfg CLK_INFRA_CEC>;
-};
-
-hdmi_phy: hdmi-phy@10209100 {
-	compatible = "mediatek,mt8173-hdmi-phy";
-	reg = <0 0x10209100 0 0x24>;
-	clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
-	clock-names = "pll_ref";
-	clock-output-names = "hdmitx_dig_cts";
-	mediatek,ibias = <0xa>;
-	mediatek,ibias_up = <0x1c>;
-	#clock-cells = <0>;
-	#phy-cells = <0>;
-};
-
-hdmi_ddc0: i2c@11012000 {
-	compatible = "mediatek,mt8173-hdmi-ddc";
-	reg = <0 0x11012000 0 0x1c>;
-	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&pericfg CLK_PERI_I2C5>;
-	clock-names = "ddc-i2c";
-};
-
-hdmi0: hdmi@14025000 {
-	compatible = "mediatek,mt8173-hdmi";
-	reg = <0 0x14025000 0 0x400>;
-	interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
-		 <&mmsys CLK_MM_HDMI_PLLCK>,
-		 <&mmsys CLK_MM_HDMI_AUDIO>,
-		 <&mmsys CLK_MM_HDMI_SPDIF>;
-	clock-names = "pixel", "pll", "bclk", "spdif";
-	pinctrl-names = "default";
-	pinctrl-0 = <&hdmi_pin>;
-	phys = <&hdmi_phy>;
-	phy-names = "hdmi";
-	mediatek,syscon-hdmi = <&mmsys 0x900>;
-	assigned-clocks = <&topckgen CLK_TOP_HDMI_SEL>;
-	assigned-clock-parents = <&hdmi_phy>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			hdmi0_in: endpoint {
-				remote-endpoint = <&dpi0_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi_con_in>;
-			};
-		};
-	};
-};
-
-connector {
-	compatible = "hdmi-connector";
-	type = "a";
-	ddc-i2c-bus = <&hdmiddc0>;
-
-	port {
-		hdmi_con_in: endpoint {
-			remote-endpoint = <&hdmi0_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
new file mode 100644
index 000000000000..9c125d7c8934
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI Encoder Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The Mediatek HDMI encoder can generate HDMI 1.4a or MHL 2.0 signals from
+  its parallel input.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-hdmi
+      - mediatek,mt7623-hdmi
+      - mediatek,mt8173-hdmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Pixel Clock
+      - description: HDMI PLL
+      - description: Bit Clock
+      - description: S/PDIF Clock
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: pll
+      - const: bclk
+      - const: spdif
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: hdmi
+
+  mediatek,syscon-hdmi:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    minItems: 2
+    description: |
+      phandle link and register offset to the system configuration registers.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Input port node. This port should be connected to a DPI output port.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Output port node. This port should be connected to the input port of a connector
+          node that contains a ddc-i2c-bus property, or to the  input port of an attached
+          bridge chip, such as a SlimPort transmitter.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - mediatek,syscon-hdmi
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmi0: hdmi@14025000 {
+        reg = <0x14025000 0x400>;
+        interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
+             <&mmsys CLK_MM_HDMI_PLLCK>,
+             <&mmsys CLK_MM_HDMI_AUDIO>,
+             <&mmsys CLK_MM_HDMI_SPDIF>;
+        clock-names = "pixel", "pll", "bclk", "spdif";
+        pinctrl-names = "default";
+        pinctrl-0 = <&hdmi_pin>;
+        phys = <&hdmi_phy>;
+        phy-names = "hdmi";
+        mediatek,syscon-hdmi = <&mmsys 0x900>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            hdmi0_in: endpoint {
+              remote-endpoint = <&dpi0_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            hdmi0_out: endpoint {
+              remote-endpoint = <&hdmi_con_in>;
+            };
+          };
+        };
+    };
+
+...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
