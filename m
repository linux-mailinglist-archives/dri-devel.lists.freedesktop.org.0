Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE41C8059D7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B83310E5DE;
	Tue,  5 Dec 2023 16:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6823010E4DA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:55:33 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id C45C01C05EE;
 Tue,  5 Dec 2023 18:46:35 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v5 17/37] dt-bindings: interrupt-controller: renesas,
 sh7751-intc: Add json-schema
Date: Tue,  5 Dec 2023 18:45:36 +0900
Message-Id: <1fafcf1c70ee4e38847bac1379bcb4555a237505.1701768028.git.ysato@users.sourceforge.jp>
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

Renesas SH7751 INTC json-schema.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 .../renesas,sh7751-intc.yaml                  | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-intc.yaml
new file mode 100644
index 000000000000..9d05c10f5c32
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-intc.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/renesas,sh7751-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas SH7751 Interrupt Controller
+
+maintainers:
+  - Yoshinori Sato <ysato@users.sourceforge.jp>
+
+properties:
+  compatible:
+    items:
+      - const: renesas,sh7751-intc
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller: true
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: ICR
+      - const: INTPRI00
+
+  renesas,icr-irlm:
+    type: boolean
+    description: If true ICR.IRLM=1
+
+  renesas,ipr-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      IRQ to IPR mapping definition.
+      1st - INTEVT
+      2nd - Register
+      3rd - bit index
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - interrupt-controller
+  - reg
+  - reg-names
+  - renesas,ipr-map
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/sh_intc.h>
+    shintc: interrupt-controller@ffd00000 {
+            compatible = "renesas,sh7751-intc";
+            #interrupt-cells = <1>;
+            interrupt-controller;
+            reg = <0xffd00000 14>, <0xfe080000 128>;
+            reg-names = "ICR", "INTPRI00";
+            renesas,ipr-map = <0x240 IPRD IPR_B12>, /* IRL0 */
+                              <0x2a0 IPRD IPR_B8>,  /* IRL1 */
+                              <0x300 IPRD IPR_B4>,  /* IRL2 */
+                              <0x360 IPRD IPR_B0>,  /* IRL3 */
+                              <0x400 IPRA IPR_B12>, /* TMU0 */
+                              <0x420 IPRA IPR_B8>,  /* TMU1 */
+                              <0x440 IPRA IPR_B4>,  /* TMU2 TNUI */
+                              <0x460 IPRA IPR_B4>,  /* TMU2 TICPI */
+                              <0x480 IPRA IPR_B0>,  /* RTC ATI */
+                              <0x4a0 IPRA IPR_B0>,  /* RTC PRI */
+                              <0x4c0 IPRA IPR_B0>,  /* RTC CUI */
+                              <0x4e0 IPRB IPR_B4>,  /* SCI ERI */
+                              <0x500 IPRB IPR_B4>,  /* SCI RXI */
+                              <0x520 IPRB IPR_B4>,  /* SCI TXI */
+                              <0x540 IPRB IPR_B4>,  /* SCI TEI */
+                              <0x560 IPRB IPR_B12>, /* WDT */
+                              <0x580 IPRB IPR_B8>,  /* REF RCMI */
+                              <0x5a0 IPRB IPR_B4>,  /* REF ROVI */
+                              <0x600 IPRC IPR_B0>,  /* H-UDI */
+                              <0x620 IPRC IPR_B12>, /* GPIO */
+                              <0x640 IPRC IPR_B8>,  /* DMAC DMTE0 */
+                              <0x660 IPRC IPR_B8>,  /* DMAC DMTE1 */
+                              <0x680 IPRC IPR_B8>,  /* DMAC DMTE2 */
+                              <0x6a0 IPRC IPR_B8>,  /* DMAC DMTE3 */
+                              <0x6c0 IPRC IPR_B8>,  /* DMAC DMAE */
+                              <0x700 IPRC IPR_B4>,  /* SCIF ERI */
+                              <0x720 IPRC IPR_B4>,  /* SCIF RXI */
+                              <0x740 IPRC IPR_B4>,  /* SCIF BRI */
+                              <0x760 IPRC IPR_B4>,  /* SCIF TXI */
+                              <0x780 IPRC IPR_B8>,  /* DMAC DMTE4 */
+                              <0x7a0 IPRC IPR_B8>,  /* DMAC DMTE5 */
+                              <0x7c0 IPRC IPR_B8>,  /* DMAC DMTE6 */
+                              <0x7e0 IPRC IPR_B8>,  /* DMAC DMTE7 */
+                              <0xa00 INTPRI00 IPR_B0>,      /* PCIC PCISERR */
+                              <0xa20 INTPRI00 IPR_B4>,      /* PCIC PCIDMA3 */
+                              <0xa40 INTPRI00 IPR_B4>,      /* PCIC PCIDMA2 */
+                              <0xa60 INTPRI00 IPR_B4>,      /* PCIC PCIDMA1 */
+                              <0xa80 INTPRI00 IPR_B4>,      /* PCIC PCIDMA0 */
+                              <0xaa0 INTPRI00 IPR_B4>,      /* PCIC PCIPWON */
+                              <0xac0 INTPRI00 IPR_B4>,      /* PCIC PCIPWDWN */
+                              <0xae0 INTPRI00 IPR_B4>,      /* PCIC PCIERR */
+                              <0xb00 INTPRI00 IPR_B8>,      /* TMU3 */
+                              <0xb80 INTPRI00 IPR_B12>;     /* TMU4 */
+    };
+...
-- 
2.39.2

