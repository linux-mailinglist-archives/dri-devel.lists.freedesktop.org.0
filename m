Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF48D2F42
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C6510E395;
	Wed, 29 May 2024 08:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52B8E10FD8F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:02:09 +0000 (UTC)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp
 [111.234.128.6])
 by sakura.ysato.name (Postfix) with ESMTPSA id B781C1C0FA0;
 Wed, 29 May 2024 17:02:07 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren <guoren@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anup Patel <apatel@ventanamicro.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [DO NOT MERGE v8 22/36] dt-bindings: display: smi,
 sm501: SMI SM501 binding json-schema
Date: Wed, 29 May 2024 17:01:08 +0900
Message-Id: <2fb214e148e74fb0acc202543dca8dd8a170a6e6.1716965617.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716965617.git.ysato@users.sourceforge.jp>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 .../bindings/display/smi,sm501.yaml           | 443 ++++++++++++++++++
 1 file changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/smi,sm501.yaml

diff --git a/Documentation/devicetree/bindings/display/smi,sm501.yaml b/Documentation/devicetree/bindings/display/smi,sm501.yaml
new file mode 100644
index 000000000000..c3ab0f08a894
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/smi,sm501.yaml
@@ -0,0 +1,443 @@
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
+description:
+  Silicon Motion Inc, SM501 Companion Chip.
+
+definitions:
+  fb-flag:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: Display initialize flags.
+    items:
+      anyOf:
+        - const: use-init-done
+        - const: disable-at-exit
+        - const: use-hwcursor
+        - const: use-hwaccel
+        - const: panel-no-fpen
+        - const: panel-no-vbiasen
+        - const: panel-inv-fpen
+        - const: panel-inv-vbiasen
+    maxItems: 8
+
+properties:
+  compatible:
+    const:
+      smi,sm501
+
+  reg:
+    maxItems: 2
+    description:
+      First entry - System Configuration registers
+      Second entry - IO space (Display Controller register)
+
+  interrupts:
+    description: SM501 interrupt to the cpu should be described here.
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: m1xclk
+
+  mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Select a video mode
+
+  edid:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      Verbatim EDID data block describing attached display.
+      Data from the detailed timing descriptor will be used to
+      program the display controller.
+
+  smi,little-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: available on big endian systems, to set different foreign endian.
+  smi,big-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: available on little endian systems, to set different foreign endian.
+
+  smi,swap-fb-endian:
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
+      smi,flags:
+        $ref: "#/definitions/fb-flag"
+
+      bpp:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Color depth
+
+  panel:
+    type: object
+    description: Panel output control
+    properties:
+      smi,flags:
+        $ref: "#/definitions/fb-flag"
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
+    minItems: 1
+    maxItems: 9
+
+  smi,misc-timing-ex:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - Extend bus holding time.
+    enum:
+      - none
+      - "16"
+      - "32"
+      - "48"
+      - "64"
+      - "80"
+      - "96"
+      - "112"
+      - "128"
+      - "144"
+      - "160"
+      - "176"
+      - "192"
+      - "208"
+      - "224"
+      - "240"
+
+  smi,misc-timing-xc:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - Xscale clock input select.
+    enum:
+      - internal-pll
+      - hclk
+      - gpio30
+
+  smi,misc-timing-usb-current:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - USB host current detection.
+    enum:
+      - disable
+      - enable
+
+  smi,misc-timing-ssm1:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - System SDRAM Clock Select for PW Mode 1.
+    enum:
+      - "288"
+      - divider
+
+  smi,misc-timing-sm1:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - SDRAM clock divider for PW mode 1.
+    enum:
+      - "1"
+      - "2"
+      - "3"
+      - "4"
+      - "6"
+      - "8"
+      - "12"
+      - "16"
+      - "24"
+      - "32"
+      - "48"
+      - "64"
+      - "96"
+      - "128"
+      - "192"
+      - "384"
+
+  smi,misc-timing-ssm0:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - System SDRAM Clock Select for PW Mode 0.
+    enum:
+      - "288"
+      - divider
+
+  smi,misc-timing-sm0:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - SDRAM clock divider for PW mode 0.
+    enum:
+      - "1"
+      - "2"
+      - "3"
+      - "4"
+      - "6"
+      - "8"
+      - "12"
+      - "16"
+      - "24"
+      - "32"
+      - "48"
+      - "64"
+      - "96"
+      - "128"
+      - "192"
+      - "384"
+
+  smi,misc-timing-deb:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - 96MHz PLL debug control
+    enum:
+      - input-reference
+      - output
+
+  smi,misc-timing-a:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - ACPI Control.
+    enum:
+      - no-acpi
+      - acpi
+
+  smi,misc-timing-divider:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - Output Frequency Selection for Second PLL.
+    enum:
+      - "336"
+      - "288"
+      - "240"
+      - "192"
+
+  smi,misc-timing-u:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - USB Host mode.
+    enum:
+      - normal
+      - simulation
+
+  smi,misc-timing-delay:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Miscellaneous Timing - Delay time to latch read data for external SDRAM memory controller.
+    enum:
+      - none
+      - "0.5"
+      - "1.0"
+      - "1.5"
+      - "2.0"
+      - "2.5"
+
+  smi,misc-control-pad:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - PCI Pad drive strength.
+    enum:
+      - "24"
+      - "12"
+      - "8"
+
+  smi,misc-control-usbclk:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - USB Clcok Select.
+    enum:
+      - xtal
+      - "96"
+      - "48"
+
+  smi,misc-control-ssp:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - UART1/SSP1 Select.
+    enum:
+      - uart1
+      - ssp1
+
+  smi,misc-control-lat:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - 8051 Latch Enable for Address.
+    enum:
+      - disable
+      - enable
+
+  smi,misc-control-fp:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - Flat Panel Data Select.
+    enum:
+      - "18"
+      - "24"
+
+  smi,misc-control-freq:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - Crystal frequency select.
+    enum:
+      - "24"
+      - "12"
+
+  smi,misc-control-refresh:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - Internal memory refresh control
+    enum:
+      - "8"
+      - "16"
+      - "32"
+      - "64"
+
+  smi,misc-control-hold:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - BUS Hold time.
+    enum:
+      - fifo-empty
+      - "8"
+      - "16"
+      - "24"
+      - "32"
+
+  smi,misc-control-sh:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - Renesas SuperH ready polarity.
+    enum:
+      - active-low
+      - active-high
+
+  smi,misc-control-ii:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - Interrupt inverting.
+    enum:
+      - normal
+      - inverted
+
+  smi,misc-control-pll:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - PLL clock count.
+    enum:
+      - disable
+      - enable
+
+  smi,misc-control-gap:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - DAC Band Gap Control.
+    const: "0"
+
+  smi,misc-control-dac:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - DAC Power control.
+    enum:
+      - disable
+      - enable
+
+  smi,misc-control-mc:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - USB slave controller.
+    enum:
+      - cpu
+      - "8051"
+
+  smi,misc-control-bl:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - CPU Master burst length.
+    enum:
+      - "1"
+      - "8"
+
+  smi,misc-control-usb:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - USB port select.
+    enum:
+      - master
+      - slave
+
+  smi,misc-control-vr:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Micellaneous Control - NEC VR Memory map select.
+    enum:
+      - "0x1e00000"
+      - "0x3e00000"
+
+  gpio:
+    type: object
+    description: GPIO pin control
+    additionalProperties: false
+    patternProperties:
+      "^pin-[0-9]+$":
+        $ref: /schemas/types.yaml#/definitions/string
+        enum:
+          - ioport
+          - function
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
+  - |
+        display@10000000 {
+                compatible = "smi,sm501";
+                reg = <0x10000000 0x03e00000
+                       0x13e00000 0x00200000>;
+                interrupt-parent = <&r2dintc>;
+                interrupts = <4 0>;
+                clocks = <&mclk &m1xclk>;
+                clock-names = "mclk", "m1xclk";
+                mode = "640x480-16@60";
+                smi,little-endian;
+                smi,devices = "usb-host", "uart0";
+                smi,swap-fb-endian;
+                edid = [00 ff ff ff ff ff ff 00 00 00 00 00 00 00 00 00
+                        00 00 01 04 00 00 00 00 00 00 00 00 00 00 00 00
+                        00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                        00 00 00 00 00 00 f0 0a 80 fb 20 e0 25 10 32 60
+                        02 00 00 00 00 00 00 06 00 00 00 00 00 00 00 00
+                        00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                        00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                        00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 bd];
+
+                smi,misc-timing-ex = "16";
+                smi,misc-timing-xc = "internal-pll";
+                smi,misc-timing-usb-current = "disable";
+                smi,misc-control-pad = "24";
+                smi,misc-control-usbclk = "xtal";
+                smi,misc-control-sh = "active-low";
+
+                gpio {
+                        pin-0 = "ioport";
+                        pin-1 = "function";
+                };
+
+                crt {
+                        smi,flags = "use-init-done",
+                                    "disable-at-exit",
+                                    "use-hwcursor",
+                                    "use-hwaccel";
+                };
+
+                panel {
+                        bpp = <16>;
+                        smi,flags = "use-init-done",
+                                    "disable-at-exit",
+                                    "use-hwcursor",
+                                    "use-hwaccel";
+                };
+        };
-- 
2.39.2

