Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816E082EE1E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 12:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61A610E4BC;
	Tue, 16 Jan 2024 11:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C426710E4A3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 11:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705405587; x=1736941587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GSW8gfeJDJGG4Eyjlb7l7mF/XAzi1B1v2cpDaXS8Ako=;
 b=hP1MgFkNt65uxhTGdk/JpYeBfzBWp0KizPAUqmXWSU9qiKTrRci7Mczc
 NLYkcWAXERfQCcM+ovdv536LgMWCuwrIer9ATBtyWD/rlbxBizQseqDQr
 3RKKYPEh6ZghZsSi8H5DT2Jvgns5j6QDGKWKNxNW/cYWudwQtH8kHk6Dg
 SlN2uk6MooyvFcgFlV5jxWVzMGMnZQlJmsaS8QQ0qwjuWDTRCv3Jva5jT
 +lHSC8iQLMuJHPzUd8AfWUlNXvnI/E4dfQVJpbBSEzrMbJhzpIwnXJwIK
 cRPH+PtKhHxmusnKc10UN6cBKqPUKrXqXmMY4k7MxTu2/C2pbLGsq4l5l w==;
X-CSE-ConnectionGUID: m9+TCx76QtaEOtm0pEMV+w==
X-CSE-MsgGUID: fVuuBNdNSA6Yok3rfvz1qA==
X-IronPort-AV: E=Sophos;i="6.05,199,1701154800"; d="scan'208";a="245533633"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2024 04:39:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 04:39:02 -0700
Received: from che-lt-i70843lx.amer.actel.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 04:38:51 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <conor.dooley@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>, 
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <lee@kernel.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <linux-pwm@vger.kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: mfd: atmel,
 hlcdc: Convert to DT schema format
Date: Tue, 16 Jan 2024 17:08:00 +0530
Message-ID: <20240116113800.82529-4-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240116113800.82529-1-dharma.b@microchip.com>
References: <20240116113800.82529-1-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: linux4microchip@microchip.com,
 Dharma Balasubiramani <dharma.b@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the atmel,hlcdc binding to DT schema format.

Adjust the clock-names property to clarify that the LCD controller expects
one of these clocks (either sys_clk or lvds_pll_clk to be present but not
both) along with the slow_clk and periph_clk. This alignment with the actual
hardware requirements will enable accurate device tree configuration for
systems using the HLCDC IP.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
changelog
v1 -> v2
- Remove the explicit copyrights.
- Modify title (not include words like binding/driver).
- Modify description actually describing the hardware and not the driver.
- Add details of lvds_pll addition in commit message.
- Ref endpoint and not endpoint-base.
- Fix coding style.

Note: Renaming hlcdc-display-controller, hlcdc-pwm to generic names throws
errors from the existing DTS files.
...
/home/dharma/Mainline/linux/arch/arm/boot/dts/microchip/at91sam9n12ek.dtb:
hlcdc@f8038000: 'hlcdc-display-controller' does not match any of the
regexes: 'pinctrl-[0-9]+'
---
 .../devicetree/bindings/mfd/atmel,hlcdc.yaml  | 105 ++++++++++++++++++
 .../devicetree/bindings/mfd/atmel-hlcdc.txt   |  56 ----------
 2 files changed, 105 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt

diff --git a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
new file mode 100644
index 000000000000..f624b60b76fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel's HLCD Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
+
+description: |
+  The Atmel HLCDC (HLCD Controller) IP available on Atmel SoCs exposes two
+  subdevices
+    # a PWM chip:
+    # a Display Controller:
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
+      - microchip,sam9x75-xlcdc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    anyOf:
+      - items:
+          - enum:
+              - sys_clk
+              - lvds_pll_clk
+      - contains:
+          const: periph_clk
+      - contains:
+          const: slow_clk
+    maxItems: 3
+
+  hlcdc-display-controller:
+    $ref: /schemas/display/atmel/atmel,hlcdc-display-controller.yaml
+
+  hlcdc-pwm:
+    $ref: /schemas/pwm/atmel,hlcdc-pwm.yaml
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/dma/at91.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    lcd_controller: lcd-controller@f0030000 {
+      compatible = "atmel,sama5d3-hlcdc";
+      reg = <0xf0030000 0x2000>;
+      clocks = <&lcdc_clk>, <&lcdck>, <&clk32k>;
+      clock-names = "periph_clk", "sys_clk", "slow_clk";
+      interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+
+      hlcdc-display-controller {
+        compatible = "atmel,hlcdc-display-controller";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb888>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          reg = <0>;
+
+          hlcdc_panel_output: endpoint@0 {
+            reg = <0>;
+            remote-endpoint = <&panel_input>;
+          };
+        };
+      };
+
+      hlcdc-pwm {
+        compatible = "atmel,hlcdc-pwm";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_lcd_pwm>;
+        #pwm-cells = <3>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
deleted file mode 100644
index 7de696eefaed..000000000000
--- a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
+++ /dev/null
@@ -1,56 +0,0 @@
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
-   "microchip,sam9x75-xlcdc"
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
-- 
2.25.1

