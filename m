Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D92419751F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2379189FD9;
	Mon, 30 Mar 2020 07:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD106E172
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503370;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Zg1B2MSlw8LBkeQrcB+SbHPflxN5qiikKNdtggvwHAA=;
 b=afTdZlI2e4vbirzRkgWT86Uu9YSMGvEmuMp7vgrfFLQkcx3awWRG0X6BFSD8ZAijUa
 vKz3mVJfGkubuJWgCiEIs7KZgQxr5e6Qp/HfP2+HK//ruPhG615kIIw8G5cYNacApnkn
 fufUXdtYbBTmoerwSTywuk5OW5WATXpfyT5+uZPp2auwnkYb7ntX22sDexVYU46JSZwj
 jp1cfMzTp0XK30IM2uPumAyMriWn3DcCxcPNZw/t5IzKEIJfQk663yIHuhoRqZTgDthH
 oV+l91buA1WyGZrPKDrU+lYMD8V260alHo5fNYs4fiYuPKIn549vJDjfyD9m1sBDk/hC
 XiXw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id m02241w2THZvBM8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 29 Mar 2020 19:35:57 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Kees Cook <keescook@chromium.org>
Subject: [RFC v3 1/8] dt-bindings: display: convert ingenic, lcd.txt to ingenic,
 lcd.yaml
Date: Sun, 29 Mar 2020 19:35:47 +0200
Message-Id: <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503354.git.hns@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-gpio@vger.kernel.org, mips-creator-ci20-dev@googlegroups.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

and add compatible: jz4780-lcd, including an example how to
configure both lcd controllers.

Also fix the clock names and examples.

Based on work by Paul Cercueil <paul@crapouillou.net> and
Sam Ravnborg <sam@ravnborg.org>

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/ingenic,lcd.txt          |  45 ------
 .../bindings/display/ingenic,lcd.yaml         | 128 ++++++++++++++++++
 2 files changed, 128 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
deleted file mode 100644
index 01e3261defb6..000000000000
--- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Ingenic JZ47xx LCD driver
-
-Required properties:
-- compatible: one of:
-  * ingenic,jz4740-lcd
-  * ingenic,jz4725b-lcd
-  * ingenic,jz4770-lcd
-- reg: LCD registers location and length
-- clocks: LCD pixclock and device clock specifiers.
-	   The device clock is only required on the JZ4740.
-- clock-names: "lcd_pclk" and "lcd"
-- interrupts: Specifies the interrupt line the LCD controller is connected to.
-
-Example:
-
-panel {
-	compatible = "sharp,ls020b1dd01d";
-
-	backlight = <&backlight>;
-	power-supply = <&vcc>;
-
-	port {
-		panel_input: endpoint {
-			remote-endpoint = <&panel_output>;
-		};
-	};
-};
-
-
-lcd: lcd-controller@13050000 {
-	compatible = "ingenic,jz4725b-lcd";
-	reg = <0x13050000 0x1000>;
-
-	interrupt-parent = <&intc>;
-	interrupts = <31>;
-
-	clocks = <&cgu JZ4725B_CLK_LCD>;
-	clock-names = "lcd";
-
-	port {
-		panel_output: endpoint {
-			remote-endpoint = <&panel_input>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
new file mode 100644
index 000000000000..8b6467cfc191
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Ingenic JZ4780 LCD Controller
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+description: |
+  LCD Controller is the Display Controller for the Ingenic JZ47xx SoC
+
+properties:
+  compatible:
+    oneOf:
+     - const: ingenic,jz4725b-lcd
+     - const: ingenic,jz4740-lcd
+     - const: ingenic,jz4770-lcd
+     - const: ingenic,jz4780-lcd
+
+  reg:
+    maxItems: 1
+    description: LCD registers location and length
+
+  interrupts:
+    maxItems: 1
+    description: Specifies the interrupt provided by parent
+
+  clocks:
+    maxItems: 2
+    description: Clock specifiers for LCD pixclock and device clock.
+      The device clock is only required on the JZ4740 and JZ4780
+
+  clock-names:
+    items:
+      - const: lcd
+      - const: lcd_pclk
+
+  port:
+    type: object
+    description: |
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+required:
+    - compatible
+    - reg
+    - interrupts
+    - clocks
+    - clock-names
+    - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4725b-cgu.h>
+
+    panel {
+      compatible = "sharp,ls020b1dd01d";
+
+      backlight = <&backlight>;
+      power-supply = <&vcc>;
+
+      port {
+        panel_input: endpoint {
+          remote-endpoint = <&panel_output>;
+          };
+        };
+      };
+
+    lcd: lcd-controller@13050000 {
+      compatible = "ingenic,jz4725b-lcd";
+      reg = <0x13050000 0x1000>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <31>;
+
+      clocks = <&cgu JZ4725B_CLK_LCD>;
+      clock-names = "lcd", "lcd_pclk";
+
+      port {
+        panel_output: endpoint {
+          remote-endpoint = <&panel_input>;
+          };
+        };
+      };
+
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+
+    lcdc0: lcdc0@13050000 {
+        compatible = "ingenic,jz4780-lcd";
+        reg = <0x13050000 0x1800>;
+
+        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
+        clock-names = "lcd", "lcd_pclk";
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        jz4780_lcd_out: port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            jz4780_out_hdmi: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&hdmi_in_lcd>;
+            };
+        };
+    };
+
+    lcdc1: lcdc1@130a0000 {
+        compatible = "ingenic,jz4780-lcd";
+        reg = <0x130a0000 0x1800>;
+
+        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD1PIXCLK>;
+        clock-names = "lcd", "lcd_pclk";
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        status = "disabled";
+    };
+
+...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
