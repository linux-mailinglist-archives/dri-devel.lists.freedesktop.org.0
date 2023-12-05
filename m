Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4718059B6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE5210E5AF;
	Tue,  5 Dec 2023 16:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59E2910E4D2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:55:33 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 4CCF91C05B8;
 Tue,  5 Dec 2023 18:46:27 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v5 13/37] dt-bindings: clock: sh7750-cpg: Add renesas,
 sh7750-cpg header.
Date: Tue,  5 Dec 2023 18:45:32 +0900
Message-Id: <ad0f5da442a9f4f32fecb4f2d2a6be1bdac6e896.1701768028.git.ysato@users.sourceforge.jp>
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

SH7750 CPG Clock output define.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 .../bindings/clock/renesas,sh7750-cpg.yaml    | 103 ++++++++++++++++++
 include/dt-bindings/clock/sh7750-cpg.h        |  26 +++++
 2 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
 create mode 100644 include/dt-bindings/clock/sh7750-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
new file mode 100644
index 000000000000..da0b837c1123
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,sh7750-cpg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas SH7750/7751 Clock Pulse Generator (CPG)
+
+maintainers:
+  - Yoshinori Sato <ysato@users.sourceforge.jp>
+
+description:
+  The Clock Pulse Generator (CPG) generates core clocks for the SoC.  It
+  includes PLLs, and variable ratio dividers.
+
+  The CPG may also provide a Clock Domain for SoC devices, in combination with
+  the CPG Module Stop (MSTP) Clocks.
+
+properties:
+  compatible:
+    enum:
+      - renesas,sh7750-cpg             # SH7750
+      - renesas,sh7750s-cpg            # SH775S
+      - renesas,sh7750r-cpg            # SH7750R
+      - renesas,sh7751-cpg             # SH7751
+      - renesas,sh7751r-cpg            # SH7751R
+
+  reg: true
+
+  reg-names: true
+
+  clocks: true
+
+  clock-names: true
+
+  '#clock-cells':
+    const: 1
+
+  renesas,mode:
+    description: Board-specific settings of the MD[0-2] pins on SoC
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 6
+
+  '#power-domain-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,sh7750-cpg
+              - renesas,sh7750s-cpg
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          items:
+            - const: FRQCR
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,sh7750r-cpg
+              - renesas,sh7751-cpg
+              - renesas,sh7751r-cpg
+    then:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          items:
+            - const: FRQCR
+            - const: CLKSTP00
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sh7750-cpg.h>
+    cpg: clock-controller@ffc00000 {
+        #clock-cells = <1>;
+        #power-domain-cells = <0>;
+        compatible = "renesas,sh7751r-cpg";
+        clocks = <&xtal>;
+        clock-names = "xtal";
+        reg = <0xffc00000 20>, <0xfe0a0000 16>;
+        reg-names = "FRQCR", "CLKSTP00";
+        renesas,mode = <0>;
+    };
diff --git a/include/dt-bindings/clock/sh7750-cpg.h b/include/dt-bindings/clock/sh7750-cpg.h
new file mode 100644
index 000000000000..17d5a8076aac
--- /dev/null
+++ b/include/dt-bindings/clock/sh7750-cpg.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright 2023 Yoshinori Sato
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_SH7750_H__
+#define __DT_BINDINGS_CLOCK_SH7750_H__
+
+#define SH7750_CPG_PLLOUT	0
+
+#define SH7750_CPG_FCK		1
+#define SH7750_CPG_BCK		2
+#define SH7750_CPG_ICK		3
+
+#define SH7750_MSTP_SCI		4
+#define SH7750_MSTP_RTC		5
+#define SH7750_MSTP_TMU012	6
+#define SH7750_MSTP_SCIF	7
+#define SH7750_MSTP_DMAC	8
+#define SH7750_MSTP_UBC		9
+#define SH7750_MSTP_SQ		10
+#define SH7750_CSTP_INTC	11
+#define SH7750_CSTP_TMU34	12
+#define SH7750_CSTP_PCIC	13
+
+#endif
-- 
2.39.2

