Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C61858059C7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D426710E5C5;
	Tue,  5 Dec 2023 16:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3413510E4DA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:55:34 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 33C531C0509;
 Tue,  5 Dec 2023 18:46:46 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v5 22/37] dt-bindings: display: smi,
 sm501: SMI SM501 binding json-schema
Date: Tue,  5 Dec 2023 18:45:41 +0900
Message-Id: <f671beae8a8ebfd361f4c903bccce713135a169f.1701768028.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Dec 2023 16:16:42 +0000
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
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
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
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Baoquan He <bhe@redhat.com>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define SM501 functions and modes.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 .../bindings/display/smi,sm501.yaml           | 134 ++++++++++++++++++
 include/dt-bindings/display/sm501.h           |  25 ++++
 2 files changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/smi,sm501.yaml
 create mode 100644 include/dt-bindings/display/sm501.h

diff --git a/Documentation/devicetree/bindings/display/smi,sm501.yaml b/Documentation/devicetree/bindings/display/smi,sm501.yaml
new file mode 100644
index 000000000000..df46600b8d4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/smi,sm501.yaml
@@ -0,0 +1,134 @@
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
+  interrupt-name: true
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
+    description: CRT output control
+
+  panel:
+    description: Panel output control
+
+  bpp:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Color depth
+
+  smi,flags:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Display control flags.
+
+  smi,devices:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: SM501 device function select.
+
+  smi,mclk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: mclk frequency.
+
+  smi,m1xclk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: m1xclk frequency.
+
+  smi,misc-timing:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Miscellaneous Timing reg value.
+
+  smi,misc-control:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Miscellaneous Control reg value.
+
+  smi,gpio-low:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: GPIO0 to 31 Control reg value.
+
+  smi,gpio-high:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: GPIO32 to 63 Control reg value.
+
+  smi,gpio-i2c:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    description: |
+      GPIO I2C bus number
+      1st field - I2C bus number
+      2nd Field - GPIO SDA
+      3rd Field - GPIO SCL
+      4th Field - Timeout
+      5th Field - udelay
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
diff --git a/include/dt-bindings/display/sm501.h b/include/dt-bindings/display/sm501.h
new file mode 100644
index 000000000000..1be8490d7635
--- /dev/null
+++ b/include/dt-bindings/display/sm501.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+/* Platform data definitions */
+
+#define SM501FB_FLAG_USE_INIT_MODE	(1<<0)
+#define SM501FB_FLAG_DISABLE_AT_EXIT	(1<<1)
+#define SM501FB_FLAG_USE_HWCURSOR	(1<<2)
+#define SM501FB_FLAG_USE_HWACCEL	(1<<3)
+#define SM501FB_FLAG_PANEL_NO_FPEN	(1<<4)
+#define SM501FB_FLAG_PANEL_NO_VBIASEN	(1<<5)
+#define SM501FB_FLAG_PANEL_INV_FPEN	(1<<6)
+#define SM501FB_FLAG_PANEL_INV_VBIASEN	(1<<7)
+
+#define SM501_USE_USB_HOST	(1<<0)
+#define SM501_USE_USB_SLAVE	(1<<1)
+#define SM501_USE_SSP0		(1<<2)
+#define SM501_USE_SSP1		(1<<3)
+#define SM501_USE_UART0		(1<<4)
+#define SM501_USE_UART1		(1<<5)
+#define SM501_USE_FBACCEL	(1<<6)
+#define SM501_USE_AC97		(1<<7)
+#define SM501_USE_I2S		(1<<8)
+#define SM501_USE_GPIO		(1<<9)
+
+#define SM501_USE_ALL		(0xffffffff)
-- 
2.39.2

