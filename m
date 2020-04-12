Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2141A5FBE
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 20:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029C46E126;
	Sun, 12 Apr 2020 18:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C888D6E126
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 18:20:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y4so563489ljn.7
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ASiH77KqT+uIPGN2ZfFxNnHDvvgHobJSFotNpJNlIq0=;
 b=f36j3/w4PIac6wI43iNe9WBgl5Y4J8foTCyQSghBaK1vuu7eDZMvJggaDzt/90gNYT
 kYrPvi7VB6Zx7TZ/ns1h4qU7o7rmA6FaGK+ZXBO/FzhCxmRPWcIaPC0HmmHtRJYUaoMd
 qZyfLZIw2zDJeqADcYJ3r7uRUV+adjlBe7Cq46f+ShgEvDe0Sx1IowH/UoI2VlbCNC5x
 gg7ru6YJgt0KSpZhAY74HwF/srLxzuVBkOqjaDzJ9fgYDcDvpaLeAl64Gd8jOhFVNp2P
 AYWRBrvw/YRTqefWPCk1I0Tfp/CYdbqIXYehzl9FnTqxPB3t85+73Lx89ZY+1AL2Lvfa
 x57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ASiH77KqT+uIPGN2ZfFxNnHDvvgHobJSFotNpJNlIq0=;
 b=TCtfaG+H5LCnaLZySEbuusv56b1jmB8xMsgdXFCdJbFz5PcKSLfCJO5M9q579SbNiJ
 q3irnmMr7BY4SNtbxIABU2zZI3FqGvAvf061ceURq24p4wlsK0PcraKGDdPnT5ZuIjF5
 psH/gxq3NtxOLsVWBemnruxKkWG2yP797KlLHRRRrtsakPavsKA82lp8RnnFSYbgQWe/
 RS+sQojO839EevJ3DJKjjpo91hETOvNfgbOmqSXbD2Mz1JdmwL6HDOCM77zXzHVQw6Cu
 PI9S3IN4Tvl+83G9r27dYq6/kut0D6FOZq8nw5Gt9r7L3E+6Dz+z12w9Be4a8ClnT91Z
 /2hQ==
X-Gm-Message-State: AGi0PuYMjIu79MA1WabKfAzlG08gW6zVY6ZtBcsVZIO/eeBgTuT40Uao
 /iwk08PsxJUQM9MHpA/LI4s=
X-Google-Smtp-Source: APiQypLohagm5VawXigAmzF4HYOmsoRJOvC1c2kS6bgTv+0U7HyuTnjttLKVJkQBLxtCAulwnyhYmQ==
X-Received: by 2002:a2e:985a:: with SMTP id e26mr8617976ljj.17.1586715621920; 
 Sun, 12 Apr 2020 11:20:21 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 m13sm6434394lfk.12.2020.04.12.11.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 11:20:21 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/4] dt-bindings: display: convert atmel-hlcdc to DT Schema
Date: Sun, 12 Apr 2020 20:20:09 +0200
Message-Id: <20200412182012.27515-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200412182012.27515-1-sam@ravnborg.org>
References: <20200412182012.27515-1-sam@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

atmel hlcdc is a MFD devide with two sub-devices:
- PWM
- Display controller

Add binding files for each device:

 - mfd/atmel-hlcdc - this is overall device
 - pwm/atmel-hlcdc-pwm - the pwm part, used for backlight
 - display/atmel/hlcdc-dc - the display controller

The hlcdc IP is present in several different chips from microchip
(former Atmel). The individual chips has independent compatibles in
the mfd binding, to allow for chip specific configuration.

As the conversion is a full re-write there was no tie to the original
license, and the standard license for bindings is used.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
---
 .../bindings/display/atmel/hlcdc-dc.txt       |  75 -------------
 .../bindings/display/atmel/hlcdc-dc.yaml      | 102 ++++++++++++++++++
 .../devicetree/bindings/mfd/atmel-hlcdc.txt   |  55 ----------
 .../devicetree/bindings/mfd/atmel-hlcdc.yaml  |  78 ++++++++++++++
 .../bindings/pwm/atmel-hlcdc-pwm.txt          |  29 -----
 .../bindings/pwm/atmel-hlcdc-pwm.yaml         |  39 +++++++
 6 files changed, 219 insertions(+), 159 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
 create mode 100644 Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel-hlcdc.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.yaml

diff --git a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
deleted file mode 100644
index 0398aec488ac..000000000000
--- a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-Device-Tree bindings for Atmel's HLCDC (High LCD Controller) DRM driver
-
-The Atmel HLCDC Display Controller is subdevice of the HLCDC MFD device.
-See ../../mfd/atmel-hlcdc.txt for more details.
-
-Required properties:
- - compatible: value should be "atmel,hlcdc-display-controller"
- - pinctrl-names: the pin control state names. Should contain "default".
- - pinctrl-0: should contain the default pinctrl states.
- - #address-cells: should be set to 1.
- - #size-cells: should be set to 0.
-
-Required children nodes:
- Children nodes are encoding available output ports and their connections
- to external devices using the OF graph reprensentation (see ../graph.txt).
- At least one port node is required.
-
-Optional properties in grandchild nodes:
- Any endpoint grandchild node may specify a desired video interface
- according to ../../media/video-interfaces.txt, specifically
- - bus-width: recognized values are <12>, <16>, <18> and <24>, and
-   override any output mode selection heuristic, forcing "rgb444",
-   "rgb565", "rgb666" and "rgb888" respectively.
-
-Example:
-
-	hlcdc: hlcdc@f0030000 {
-		compatible = "atmel,sama5d3-hlcdc";
-		reg = <0xf0030000 0x2000>;
-		interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
-		clocks = <&lcdc_clk>, <&lcdck>, <&clk32k>;
-		clock-names = "periph_clk","sys_clk", "slow_clk";
-
-		hlcdc-display-controller {
-			compatible = "atmel,hlcdc-display-controller";
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb888>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0>;
-
-				hlcdc_panel_output: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&panel_input>;
-				};
-			};
-		};
-
-		hlcdc_pwm: hlcdc-pwm {
-			compatible = "atmel,hlcdc-pwm";
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_lcd_pwm>;
-			#pwm-cells = <3>;
-		};
-	};
-
-Example 2: With a video interface override to force rgb565; as above
-but with these changes/additions:
-
-	&hlcdc {
-		hlcdc-display-controller {
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb565>;
-
-			port@0 {
-				hlcdc_panel_output: endpoint@0 {
-					bus-width = <16>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml
new file mode 100644
index 000000000000..7eb6266a25a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/atmel/hlcdc-dc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel HLCDC (High LCD Controller) display controller
+
+maintainers:
+  - Sam Ravnborg <sam@ravnborg.org>
+  - Boris Brezillon <bbrezillon@kernel.org>
+
+description: |
+  The Atmel HLCDC Display Controller is subdevice of the HLCDC MFD device.
+  See ../../mfd/atmel-hlcdc.yaml for more details.
+
+properties:
+  compatible:
+    const: atmel,hlcdc-display-controller
+
+  "#address-cells":
+    const: 1
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+patternProperties:
+  "^port@[0-9]$":
+    type: object
+    description: |
+      A port node with endpoint definitions as defined in
+      ../../media/video-interfaces.txt
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      reg:
+        maxItems: 1
+        description: The virtual number of the port
+
+    patternProperties:
+      "^endpoint(@[0-9])$":
+        type: object
+
+        properties:
+          reg:
+            maxItems: 1
+            description: The virtual number of the endpoint
+
+          bus-width:
+            enum: [12, 16, 18, 24]
+            description:
+              Any endpoint node may specify a desired video interface
+              according to ../../media/video-interfaces.txt, specifically
+              Recognized values are <12>, <16>, <18> and <24>, and
+              override any output mode selection heuristic, forcing
+              "rgb444", "rgb565", "rgb666" and "rgb888" respectively.
+
+          remote-endpoint:
+            $ref: /schemas/types.yaml#/definitions/phandle
+            description:
+              phandle to the panel node
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    hlcdc-display-controller {
+        compatible = "atmel,hlcdc-display-controller";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+
+            endpoint@0 {
+                reg = <0>;
+                bus-width = <16>;
+                remote-endpoint = <&panel_input>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
deleted file mode 100644
index 5f8880cc757e..000000000000
--- a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Device-Tree bindings for Atmel's HLCDC (High LCD Controller) MFD driver
-
-Required properties:
- - compatible: value should be one of the following:
-   "atmel,at91sam9n12-hlcdc"
-   "atmel,at91sam9x5-hlcdc"
-   "atmel,sama5d2-hlcdc"
-   "atmel,sama5d3-hlcdc"
-   "atmel,sama5d4-hlcdc"
-   "microchip,sam9x60-hlcdc"
- - reg: base address and size of the HLCDC device registers.
- - clock-names: the name of the 3 clocks requested by the HLCDC device.
-   Should contain "periph_clk", "sys_clk" and "slow_clk".
- - clocks: should contain the 3 clocks requested by the HLCDC device.
- - interrupts: should contain the description of the HLCDC interrupt line
-
-The HLCDC IP exposes two subdevices:
- - a PWM chip: see ../pwm/atmel-hlcdc-pwm.txt
- - a Display Controller: see ../display/atmel/hlcdc-dc.txt
-
-Example:
-
-	hlcdc: hlcdc@f0030000 {
-		compatible = "atmel,sama5d3-hlcdc";
-		reg = <0xf0030000 0x2000>;
-		clocks = <&lcdc_clk>, <&lcdck>, <&clk32k>;
-		clock-names = "periph_clk","sys_clk", "slow_clk";
-		interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
-
-		hlcdc-display-controller {
-			compatible = "atmel,hlcdc-display-controller";
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb888>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0>;
-
-				hlcdc_panel_output: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&panel_input>;
-				};
-			};
-		};
-
-		hlcdc_pwm: hlcdc-pwm {
-			compatible = "atmel,hlcdc-pwm";
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_lcd_pwm>;
-			#pwm-cells = <3>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.yaml b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.yaml
new file mode 100644
index 000000000000..cad14fa173a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/atmel-hlcdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device-Tree bindings for Atmel's HLCDC (High LCD Controller)
+
+maintainers:
+  - Sam Ravnborg <sam@ravnborg.org>
+  - Boris Brezillon <bbrezillon@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91sam9n12-hlcdc
+      - atmel,at91sam9x5-hlcdc
+      - atmel,sama5d2-hlcdc
+      - atmel,sama5d3-hlcdc
+      - atmel,sama5d4-hlcdc
+      - microchip,sam9x60-hlcdc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    maxItems: 3
+    items:
+      - const: periph_clk
+      - const: sys_clk
+      - const: slow_clk
+
+  interrupts:
+    description: The HLCDC interrupt line
+    maxItems: 1
+
+  hlcdc_pwm:
+    type: object
+    description: |
+      PWM controller - used for backlight.
+      See ../pwm/atmel-hlcdc-pwm.yaml for details
+
+  hlcdc-display-controller:
+    type: object
+    description: |
+      LCD display controller
+      See ../display/atmel/hlcdc-dc.yaml for details
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    hlcdc {
+        compatible = "atmel,sama5d3-hlcdc";
+        reg = <0xf0030000 0x2000>;
+        clocks = <&lcdc_clk>, <&lcdck>, <&clk32k>;
+        clock-names = "periph_clk","sys_clk", "slow_clk";
+        interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+
+        hlcdc-display-controller {
+        };
+
+        hlcdc_pwm {
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt b/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt
deleted file mode 100644
index afa501bf7f94..000000000000
--- a/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Device-Tree bindings for Atmel's HLCDC (High-end LCD Controller) PWM driver
-
-The Atmel HLCDC PWM is subdevice of the HLCDC MFD device.
-See ../mfd/atmel-hlcdc.txt for more details.
-
-Required properties:
- - compatible: value should be one of the following:
-   "atmel,hlcdc-pwm"
- - pinctr-names: the pin control state names. Should contain "default".
- - pinctrl-0: should contain the pinctrl states described by pinctrl
-   default.
- - #pwm-cells: should be set to 3. This PWM chip use the default 3 cells
-   bindings defined in pwm.yaml in this directory.
-
-Example:
-
-	hlcdc: hlcdc@f0030000 {
-		compatible = "atmel,sama5d3-hlcdc";
-		reg = <0xf0030000 0x2000>;
-		clocks = <&lcdc_clk>, <&lcdck>, <&clk32k>;
-		clock-names = "periph_clk","sys_clk", "slow_clk";
-
-		hlcdc_pwm: hlcdc-pwm {
-			compatible = "atmel,hlcdc-pwm";
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_lcd_pwm>;
-			#pwm-cells = <3>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.yaml b/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.yaml
new file mode 100644
index 000000000000..70d063b48260
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/atmel-hlcdc-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device-Tree bindings for Atmel's HLCDC (High-end LCD Controller) PWM
+
+maintainers:
+  - Sam Ravnborg <sam@ravnborg.org>
+  - Boris Brezillon <bbrezillon@kernel.org>
+
+description: |
+  The Atmel HLCDC PWM is subdevice of the HLCDC MFD device.
+  See ../mfd/atmel-hlcdc.txt for more details.
+
+properties:
+  compatible:
+    const: atmel,hlcdc-pwm
+
+  "#pwm-cells":
+    const: 3
+    description:
+      This PWM chip use the default 3 cells bindings defined in pwm.yaml.
+
+required:
+  - compatible
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hlcdc_pwm {
+        compatible = "atmel,hlcdc-pwm";
+        #pwm-cells = <3>;
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
