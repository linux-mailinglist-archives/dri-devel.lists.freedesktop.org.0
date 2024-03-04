Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDC387042A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 15:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E241121F8;
	Mon,  4 Mar 2024 14:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="N9h9roHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183591121F8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709562647; x=1741098647;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=UuQpdAHcUd83egaYxRT9C0L3QRwOwMeJRqrjcKWuQhg=;
 b=N9h9roHF2z5djvQuLLo7zlPN9QQ5kQvxm48+Q25/ucI6io55z7H/0iVP
 G44zNP9p4bdChe1ZwyDlPGogPLohwk86MFcc2IO6C0t6NjZPKRYPtBSJs
 TEKdAumG2ehPz5IS3QC4sezpyGRRR28uI5nL4A7sgo4Jx+hQHNwouHGIH
 OFJkwFApb9rZpxjn4972EWfCCSpmL7ovV1ovjDhPCCEnhDAwtcWJMdjQd
 7RE+pYnqVSn+1DaFQOXDHuXf/2auTrN9XoDvZJ5bblJQSp61oQDuC0Xsx
 E4NRKSx4TVMepbEQntTc/pcQ88JzCta5P7zxbTG/DJwqXudQEW1TSlwHc Q==;
X-CSE-ConnectionGUID: jOFY5svaROuAta/v3OojJw==
X-CSE-MsgGUID: EHliILurSS+P6PNTdF359g==
X-IronPort-AV: E=Sophos;i="6.06,203,1705388400"; d="scan'208";a="184437303"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Mar 2024 07:30:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 07:30:16 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 07:30:10 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Mon, 4 Mar 2024 20:00:03 +0530
Subject: [PATCH v3] dt-bindings: display: atmel,lcdc: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240304-lcdc-fb-v3-1-8b616fbb0199@microchip.com>
X-B4-Tracking: v=1; b=H4sIAOra5WUC/2WMQQ6CMBBFr0K6toZOR1BX3sO4oNNWJhFLWtNoC
 He3sCHR5fv5700iucguiXM1iegyJw7PAnpXCeq7591JtoUF1IA1gJYPsiS9keZowYHXdFIoynu
 MzvN7LV1vhXtOrxA/azirZf1vZCWVRGqQTANta/1lYIqBeh73FAaxdDJsrq5xc6G4nUKDjSZ1a
 Ltfd57nL7naEtjeAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Dharma Balasubiramani <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709562610; l=9681;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=UuQpdAHcUd83egaYxRT9C0L3QRwOwMeJRqrjcKWuQhg=;
 b=hlfgdx8OEW0RK4jE3F6jUlwIvXBbITRfiUwf5z0o8Ymdn22QO3gdspRtvhlVlwjwaxh6GCEVQ
 v/kK7SFjmHRBr+3vDb5HB+owT9CxaWW3e3mAfSdyqFaoHBI/ks/nGhd
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the atmel,lcdc bindings to DT schema.
Changes during conversion: add missing clocks and clock-names properties.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
This patch converts the existing lcdc display text binding to JSON schema.
The binding is split into two namely
lcdc.yaml
- Holds the frame buffer properties
lcdc-display.yaml
- Holds the display panel properties which is a phandle to the display
property in lcdc fb node.

These bindings are tested using the following command.
'make DT_CHECKER_FLAGS=-m dt_binding_check'
---
Changes in v3:
- Remove the generic property "bits-per-pixel"
- Link to v2: https://lore.kernel.org/r/20240304-lcdc-fb-v2-1-a14b463c157a@microchip.com

Changes in v2:
- Run checkpatch and remove whitespace errors.
- Add the standard interrupt flags.
- Split the binding into two, namely lcdc.yaml and lcdc-display.yaml.
- Link to v1: https://lore.kernel.org/r/20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com
---
 .../bindings/display/atmel,lcdc-display.yaml       | 97 ++++++++++++++++++++++
 .../devicetree/bindings/display/atmel,lcdc.txt     | 87 -------------------
 .../devicetree/bindings/display/atmel,lcdc.yaml    | 70 ++++++++++++++++
 3 files changed, 167 insertions(+), 87 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml b/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml
new file mode 100644
index 000000000000..5e0b706d695d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/atmel,lcdc-display.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip's LCDC Display
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Dharma Balasubiramani <dharma.b@microchip.com>
+
+description:
+  The LCD Controller (LCDC) consists of logic for transferring LCD image data
+  from an external display buffer to a TFT LCD panel. The LCDC has one display
+  input buffer per layer that fetches pixels through the single bus host
+  interface and a look-up table to allow palletized display configurations. The
+  LCDC is programmable on a per layer basis, and supports different LCD
+  resolutions, window sizes, image formats and pixel depths.
+
+# We need a select here since this schema is applicable only for nodes with the
+# following properties
+
+select:
+  anyOf:
+    - required: [ 'atmel,dmacon' ]
+    - required: [ 'atmel,lcdcon2' ]
+    - required: [ 'atmel,guard-time' ]
+
+properties:
+  atmel,dmacon:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: dma controller configuration
+
+  atmel,lcdcon2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: lcd controller configuration
+
+  atmel,guard-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: lcd guard time (Delay in frame periods)
+
+  bits-per-pixel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: lcd panel bit-depth.
+
+  atmel,lcdcon-backlight:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: enable backlight
+
+  atmel,lcdcon-backlight-inverted:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: invert backlight PWM polarity
+
+  atmel,lcd-wiring-mode:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: lcd wiring mode "RGB" or "BRG"
+
+  atmel,power-control-gpio:
+    description: gpio to power on or off the LCD (as many as needed)
+
+  display-timings:
+    $ref: panel/display-timings.yaml#
+
+required:
+  - atmel,dmacon
+  - atmel,lcdcon2
+  - atmel,guard-time
+  - bits-per-pixel
+
+additionalProperties: false
+
+examples:
+  - |
+    display: panel {
+      bits-per-pixel = <32>;
+      atmel,lcdcon-backlight;
+      atmel,dmacon = <0x1>;
+      atmel,lcdcon2 = <0x80008002>;
+      atmel,guard-time = <9>;
+      atmel,lcd-wiring-mode = <1>;
+
+      display-timings {
+        native-mode = <&timing0>;
+        timing0: timing0 {
+          clock-frequency = <9000000>;
+          hactive = <480>;
+          vactive = <272>;
+          hback-porch = <1>;
+          hfront-porch = <1>;
+          vback-porch = <40>;
+          vfront-porch = <1>;
+          hsync-len = <45>;
+          vsync-len = <1>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc.txt b/Documentation/devicetree/bindings/display/atmel,lcdc.txt
deleted file mode 100644
index b5e355ada2fa..000000000000
--- a/Documentation/devicetree/bindings/display/atmel,lcdc.txt
+++ /dev/null
@@ -1,87 +0,0 @@
-Atmel LCDC Framebuffer
------------------------------------------------------
-
-Required properties:
-- compatible :
-	"atmel,at91sam9261-lcdc" , 
-	"atmel,at91sam9263-lcdc" ,
-	"atmel,at91sam9g10-lcdc" ,
-	"atmel,at91sam9g45-lcdc" ,
-	"atmel,at91sam9g45es-lcdc" ,
-	"atmel,at91sam9rl-lcdc" ,
-- reg : Should contain 1 register ranges(address and length).
-	Can contain an additional register range(address and length)
-	for fixed framebuffer memory. Useful for dedicated memories.
-- interrupts : framebuffer controller interrupt
-- display: a phandle pointing to the display node
-
-Required nodes:
-- display: a display node is required to initialize the lcd panel
-	This should be in the board dts.
-- default-mode: a videomode within the display with timing parameters
-	as specified below.
-
-Optional properties:
-- lcd-supply: Regulator for LCD supply voltage.
-
-Example:
-
-	fb0: fb@00500000 {
-		compatible = "atmel,at91sam9g45-lcdc";
-		reg = <0x00500000 0x1000>;
-		interrupts = <23 3 0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_fb>;
-		display = <&display0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-	};
-
-Example for fixed framebuffer memory:
-
-	fb0: fb@00500000 {
-		compatible = "atmel,at91sam9263-lcdc";
-		reg = <0x00700000 0x1000 0x70000000 0x200000>;
-		[...]
-	};
-
-Atmel LCDC Display
------------------------------------------------------
-Required properties (as per of_videomode_helper):
-
- - atmel,dmacon: dma controller configuration
- - atmel,lcdcon2: lcd controller configuration
- - atmel,guard-time: lcd guard time (Delay in frame periods)
- - bits-per-pixel: lcd panel bit-depth.
-
-Optional properties (as per of_videomode_helper):
- - atmel,lcdcon-backlight: enable backlight
- - atmel,lcdcon-backlight-inverted: invert backlight PWM polarity
- - atmel,lcd-wiring-mode: lcd wiring mode "RGB" or "BRG"
- - atmel,power-control-gpio: gpio to power on or off the LCD (as many as needed)
-
-Example:
-	display0: display {
-		bits-per-pixel = <32>;
-		atmel,lcdcon-backlight;
-		atmel,dmacon = <0x1>;
-		atmel,lcdcon2 = <0x80008002>;
-		atmel,guard-time = <9>;
-		atmel,lcd-wiring-mode = <1>;
-
-		display-timings {
-			native-mode = <&timing0>;
-			timing0: timing0 {
-				clock-frequency = <9000000>;
-				hactive = <480>;
-				vactive = <272>;
-				hback-porch = <1>;
-				hfront-porch = <1>;
-				vback-porch = <40>;
-				vfront-porch = <1>;
-				hsync-len = <45>;
-				vsync-len = <1>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc.yaml b/Documentation/devicetree/bindings/display/atmel,lcdc.yaml
new file mode 100644
index 000000000000..1b6f7e395006
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/atmel,lcdc.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/atmel,lcdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip's LCDC Framebuffer
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Dharma Balasubiramani <dharma.b@microchip.com>
+
+description:
+  The LCDC works with a framebuffer, which is a section of memory that contains
+  a complete frame of data representing pixel values for the display. The LCDC
+  reads the pixel data from the framebuffer and sends it to the LCD panel to
+  render the image.
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91sam9261-lcdc
+      - atmel,at91sam9263-lcdc
+      - atmel,at91sam9g10-lcdc
+      - atmel,at91sam9g45-lcdc
+      - atmel,at91sam9g45es-lcdc
+      - atmel,at91sam9rl-lcdc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: hclk
+      - const: lcdc_clk
+
+  display:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle pointing to the display node.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - display
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    fb@500000 {
+      compatible = "atmel,at91sam9g45-lcdc";
+      reg = <0x00500000 0x1000>;
+      interrupts = <23 IRQ_TYPE_LEVEL_HIGH 0>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&pinctrl_fb>;
+      clocks = <&pmc PMC_TYPE_PERIPHERAL 23>, <&pmc PMC_TYPE_PERIPHERAL 23>;
+      clock-names = "hclk", "lcdc_clk";
+      display = <&display>;
+    };

---
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
change-id: 20240223-lcdc-fb-b8d2e2f3c914

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>

