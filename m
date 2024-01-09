Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7558280A1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FFC10E6D2;
	Tue,  9 Jan 2024 08:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67AAB10E6DB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:24:23 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 220161C0998;
 Tue,  9 Jan 2024 17:24:21 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v6 22/37] dt-bindings: display: smi,
 sm501: SMI SM501 binding json-schema
Date: Tue,  9 Jan 2024 17:23:19 +0900
Message-Id: <9c3a9caaa1e2fc7e515cac67f07a20af071bd1be.1704788539.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704788539.git.ysato@users.sourceforge.jp>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 .../bindings/display/smi,sm501.yaml           | 417 ++++++++++++++++++
 1 file changed, 417 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/smi,sm501.yaml

diff --git a/Documentation/devicetree/bindings/display/smi,sm501.yaml b/Documentation/devicetree/bindings/display/smi,sm501.yaml
new file mode 100644
index 000000000000..8f2767bf2193
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/smi,sm501.yaml
@@ -0,0 +1,417 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/smi,sm501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Motion SM501 Mobile Multimedia Companion Chip
+
+maintainers:
+  - Yoshinori Sato <ysato@user.sourceforge.jp>
+
+description: |
+  These DT bindings describe the SM501.
+
+properties:
+  compatible:
+    const:
+      smi,sm501
+
+  reg:
+    maxItems: 2
+    description: |
+     First entry: System Configuration register
+     Second entry: IO space (Display Controller register)
+
+  interrupts:
+    description: SM501 interrupt to the cpu should be described here.
+
+  mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: select a video mode
+
+  edid:
+    description: |
+      verbatim EDID data block describing attached display.
+      Data from the detailed timing descriptor will be used to
+      program the display controller.
+
+  little-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: available on big endian systems, to set different foreign endian.
+  big-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: available on little endian systems, to set different foreign endian.
+
+  swap-fb-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: swap framebuffer byteorder.
+
+  route-crt-panel:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Panel output merge to CRT.
+
+  crt:
+    type: object
+    description: CRT output control
+    properties:
+      edid:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description: |
+          verbatim EDID data block describing attached display.
+          Data from the detailed timing descriptor will be used to
+          program the display controller.
+
+      smi,flags:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description: Display control flags.
+        items:
+          anyOf:
+            - const: use-init-done
+            - const: disable-at-exit
+            - const: use-hwcursor
+            - const: use-hwaccel
+            - const: panel-no-fpen
+            - const: panel-no-vbiasen
+            - const: panel-inv-fpen
+            - const: panel-inv-vbiasen
+        maxItems: 8
+
+      bpp:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Color depth
+
+  panel:
+    type: object
+    description: Panel output control
+    properties:
+      edid:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description: |
+          verbatim EDID data block describing attached display.
+          Data from the detailed timing descriptor will be used to
+          program the display controller.
+
+      smi,flags:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description: Display control flags.
+        items:
+          anyOf:
+            - const: use-init-done
+            - const: disable-at-exit
+            - const: use-hwcursor
+            - const: use-hwaccel
+            - const: panel-no-fpen
+            - const: panel-no-vbiasen
+            - const: panel-inv-fpen
+            - const: panel-inv-vbiasen
+        maxItems: 8
+
+      bpp:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Color depth
+
+  smi,devices:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: Select SM501 device functions.
+    items:
+      anyOf:
+        - const: usb-host
+        - const: usb-slave
+        - const: ssp0
+        - const: ssp1
+        - const: uart0
+        - const: uart1
+        - const: fbaccel
+        - const: ac97
+        - const: i2s
+        - const: gpio
+    minItems: 1
+    maxItems: 10
+
+  smi,mclk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: mclk frequency.
+
+  smi,m1xclk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: m1xclk frequency.
+
+  misc-timing:
+    type: object
+    description: Miscellaneous Timing register values.
+    properties:
+      ex:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Extend bus holding time.
+        enum: [0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240]
+
+      xc:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Xscale clock input select.
+        items:
+          enum:
+            - internal-pll
+            - hclk
+            - gpio33
+
+      us:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: USB host current detection.
+        items:
+          enum:
+            - disable
+            - enable
+
+      ssm1:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: SDRAM clock select for PW mode 1.
+        items:
+          enum:
+            - 288mhz
+            - div
+
+      sm1:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: SDRAM clock divider for PW mode 1.
+        enum: [1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 384]
+
+      ssm0:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: SDRAM clock select for PW mode 0.
+        items:
+          enum:
+            - 288mhz
+            - div
+
+      sm0:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: SDRAM clock divider for PW mode 0.
+        enum: [1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 384]
+
+      deb:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: 96MHz PLL debug control.
+        items:
+          enum:
+            - input-reference
+            - output
+
+      acpi:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: ACPI control.
+        items:
+          enum:
+            - disable
+            - enable
+
+      divider:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Second PLL output frequency.
+        enum: [336, 288, 240, 192]
+
+      usb-mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: USB Host mode.
+        items:
+          enum:
+            - normal
+            - simulation
+
+      delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Delay time to latch read data. Set the value to 10x.
+        enum: [5, 10, 15, 20, 25]
+
+  misc-control:
+    type: object
+    description: Miscellaneous Control register values.
+    properties:
+      pad:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: PCI Pad drive strength.
+        enum: [24, 12, 8]
+
+      usbclk:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: USB Clcok Select.
+        items:
+          enum:
+            - crystal
+            - 96mhz
+            - 48mhz
+
+      uart-ssp:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: UART1/SSP1 select.
+        items:
+          enum:
+            - uart1
+            - ssp1
+
+      lat:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: 8051 Latch enable.
+        items:
+          enum:
+            - disable
+            - enable
+
+      fp:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Flat Panel data select.
+        enum: [18, 24]
+
+      freq:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Frequency select.
+        enum: [24, 12]
+
+      refresh:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Internal memory refresh timing.
+        enum: [8, 16, 32, 64]
+
+      hold:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: BUS Hold time.
+        enum: [0, 8, 16, 24, 32]
+
+      sh:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: SuperH ready polarity.
+        items:
+          enum:
+            - active-low
+            - active-high
+
+      ii:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Interrupt Inverting.
+        items:
+          enum:
+            - normal
+            - invert
+
+      pll:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: PLL clock count.
+        items:
+          enum:
+            - disable
+            - enable
+
+      gap:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: DAC Band GAP control.
+        items:
+          const: default
+
+      dac:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: DAC Power control.
+        items:
+          enum:
+            - disable
+            - enable
+
+      mc:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: USB slave controller.
+        items:
+          enum:
+            - cpu
+            - '8051'
+
+      bl:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: CPU Master burst length.
+        enum: [8, 1]
+
+      usb:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: USB port select.
+        items:
+          enum:
+            - master
+            - slave
+
+      lb:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: USB loop-back select.
+        items:
+          enum:
+            - normal
+            - loopback
+      vr:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: NEC VR Memory map select.
+        enum: [30, 62]
+
+  gpio-pin-control:
+    type: object
+    description: GPIO control configuration.
+    properties:
+      pin:
+        type: object
+        properties:
+          gpio:
+            $ref: /schemas/types.yaml#/definitions/flag
+            description: pin in/out use GPIO.
+          function:
+            $ref: /schemas/types.yaml#/definitions/flag
+            description: pin in/out use function.
+
+  gpio-i2c:
+    type: object
+    description: GPIO I2C definition.
+    properties:
+      i2c:
+        type: object
+        properties:
+          bus:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: I2C bus number.
+
+          sda:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: I2C SDA pin port number.
+
+          scl:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: I2C SCL pin port number.
+
+          delay:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: bit transmission delay.
+
+          timeout:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: transmission timeout.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+
+examples:
+  # MPC5200
+  - |
+    display@1,0 {
+        compatible = "smi,sm501";
+        reg = <0x00000000 0x00800000
+               0x03e00000 0x00200000>;
+        interrupts = <1 1 3>;
+        mode = "640x480-32@60";
+        edid = [00 ff ff ff ff ff ff 00 00 00 00 00 00 00 00 00
+                00 00 01 04 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 f0 0a 80 fb 20 e0 25 10 32 60
+                02 00 00 00 00 00 00 06 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 bd];
+    };
-- 
2.39.2

