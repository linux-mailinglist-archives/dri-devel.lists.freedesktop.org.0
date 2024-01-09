Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB182808B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A86810E3D1;
	Tue,  9 Jan 2024 08:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C10710E3BA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:23:57 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 585D91C0637;
 Tue,  9 Jan 2024 17:23:55 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v6 09/37] dt-bindings: timer: renesas, tmu: add renesas,
 tmu-sh7750
Date: Tue,  9 Jan 2024 17:23:06 +0900
Message-Id: <183bc01316cab97a7ae96df525a5a450c477210d.1704788539.git.ysato@users.sourceforge.jp>
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

Add SH7750 TMU entry.

I wanted to replace interrupts and interrupt-names in the if compatible is
"renesas,tmu-7750", but it seems that I can't rewrite it as expected.
This resulted in a redundant conditional statement.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 .../bindings/timer/renesas,tmu.yaml           | 67 ++++++++++++++-----
 1 file changed, 51 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index a67e427a9e7e..bcdd40a13ea4 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -39,14 +39,15 @@ properties:
           - renesas,tmu-r8a779a0 # R-Car V3U
           - renesas,tmu-r8a779f0 # R-Car S4-8
           - renesas,tmu-r8a779g0 # R-Car V4H
+          - renesas,tmu-sh7750   # SH7750
       - const: renesas,tmu
 
   reg:
     maxItems: 1
 
-  interrupts:
-    minItems: 2
-    maxItems: 3
+  interrupts: true
+
+  interrupt-names: true
 
   clocks:
     maxItems: 1
@@ -75,21 +76,55 @@ required:
   - clock-names
   - power-domains
 
-if:
-  not:
-    properties:
-      compatible:
-        contains:
-          enum:
-            - renesas,tmu-r8a7740
-            - renesas,tmu-r8a7778
-            - renesas,tmu-r8a7779
-then:
-  required:
-    - resets
-
 additionalProperties: false
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - renesas,tmu-r8a7740
+                - renesas,tmu-r8a7778
+                - renesas,tmu-r8a7779
+                - renesas,tmu-sh7750
+
+    then:
+      required:
+        - resets
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - renesas,tmu-sh7750
+
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 3
+        interrupt-names:
+          items:
+            - const: tuni0
+            - const: tuni1
+            - const: tuni2
+
+    else:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 4
+        interrupt-names:
+          items:
+            - const: tuni0
+            - const: tuni1
+            - const: tuni2
+            - const: ticpi2
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7779-clock.h>
-- 
2.39.2

