Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620AE1A5FBD
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 20:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2743F6E12A;
	Sun, 12 Apr 2020 18:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045B26E126
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 18:20:24 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h6so5011975lfc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0pbLfr+nqgYUtCdJqqKNf5Tp0hM3f65yvGA3bZ3B05c=;
 b=W/4THMap5VWgZDYSArlhOr/33w32rR4CrPznKwmf4eV2YeNbx38QUxz5LIYOC1XUvy
 QynF4DiZhe7K72ILNnLVmWYt0LElk/+22TpObOkdthky9U2bZoHrBemU7FssxMaolzr9
 OHnNY8ppUS93RaVSkq+1MUtg0yHEs2ORexVabJ8FFXQ9wqzZy9Uhks9s14AJnJKccOSR
 Ua9ZyAM2UDq1YSxtliwJAe29MgAsRdIIjD6RATDIr5mSfBuq1NtATe57ARWO7qnvhnj5
 zTbBmEA3msDdK4CFjFJwiiAFSeY7isfdvSuQawtCkuB+LqXv2VdPAiUgSe+YOjswPCkz
 qTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0pbLfr+nqgYUtCdJqqKNf5Tp0hM3f65yvGA3bZ3B05c=;
 b=QZBQzTrx84x682yFOerFAC+1L8Nwu4rwLbVRiw/b3KmmHlWjk7P7OV3FJ9XIrm2wNW
 pwNmFq1X7cHcsyZJVIcLm2+axOY5qWOC/mf+LXGc1zyAD5usq+VPK7mV43ShwrEjcgM5
 BwWWuLzb5YKklZ7002b5irPw18NVdE1u7l8R+tHkeyE/hlaOLjnS67qki+2KBLIvkOcs
 rs6d8Ims7bEPezv6362BqHN9oBAV5lssCOPftnrGtI3lFRKMlPfqqu5xY/ayxUB6EekD
 euKrwvzktpwPlVlgHMrHoKQUz0KOPRxphcK5nTj0bRwQ7qMHnkNPSPhjJULsTH0WbKuF
 0UsA==
X-Gm-Message-State: AGi0PuZL0jK+HkcWzwzpv5bXEzCFrVypmuMUC+giM78FpOHPCIzAp5vU
 mQlgG8xzChsjU/IewmG6s7w=
X-Google-Smtp-Source: APiQypLNQSDf9U1QklVk237XXcfj1gMY0TpODl2xX9qpvSdr5iq3/V3MK6IVO8SZUNmLTlln272Snw==
X-Received: by 2002:ac2:57cb:: with SMTP id k11mr8378106lfo.19.1586715623259; 
 Sun, 12 Apr 2020 11:20:23 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 m13sm6434394lfk.12.2020.04.12.11.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 11:20:22 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/4] dt-bindings: display: convert atmel lcdc to DT Schema
Date: Sun, 12 Apr 2020 20:20:10 +0200
Message-Id: <20200412182012.27515-3-sam@ravnborg.org>
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

Add a new binding file to describe the bindings
for the Atmel LCDC IP.
This replaces the old txt based binding.

The binding file describes the current binding,
including properties to specify register values etc.
The binding will be updated in a follow-up patch,
the current binding describes the actual situation.

This new binding file replaces the old .txt based
binding which is deleted.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/atmel,lcdc.txt           |  88 -----------
 .../bindings/display/atmel/lcdc.yaml          | 137 ++++++++++++++++++
 2 files changed, 137 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/atmel,lcdc.txt
 create mode 100644 Documentation/devicetree/bindings/display/atmel/lcdc.yaml

diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc.txt b/Documentation/devicetree/bindings/display/atmel,lcdc.txt
deleted file mode 100644
index acb5a0132127..000000000000
--- a/Documentation/devicetree/bindings/display/atmel,lcdc.txt
+++ /dev/null
@@ -1,88 +0,0 @@
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
-	"atmel,at32ap-lcdc"
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
diff --git a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
new file mode 100644
index 000000000000..7dcb9a4d5902
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/atmel/lcdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel LCDC (LCD Controller) display controller with PWM
+
+maintainers:
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  The Atmel LCDC Display Controller is display controller that
+  includes a PWM for backlight/contrast.
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91sam9261-lcdc
+      - atmel,at91sam9263-lcdc
+      - atmel,at91sam9g10-lcdc
+      - atmel,at91sam9g45-lcdc
+      - atmel,at91sam9g45es-lcdc
+      - atmel,at91sam9g46-lcdc
+      - atmel,at91sam9m10-lcdc
+      - atmel,at91sam9m11-lcdc
+      - atmel,at91sam9rl-lcdc
+
+  "#address-cells":
+    const: 1
+  "#size-cells":
+    const: 0
+
+  reg:
+    description: |
+      Contains 1 register range (address and length).
+      Can contain an additional register range (address and length)
+      for fixed framebuffer memory
+
+  interrupts:
+    maxItems: 1
+
+  lcd-supply:
+    description: Regulator for LCD supply voltage.
+
+  display:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to display node
+
+patternProperties:
+  "^display[0-9]$":
+    type: object
+    description: |
+      Display node is required to initialize the lcd panel.
+      This should be in the board dts
+
+    properties:
+            
+      atmel,dmacon:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: DMA controller configuration
+
+      atmel,lcdcon2:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: LCD controller configuration
+
+      atmel,guard-time:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: LCD guard time (Delay in frame periods)
+
+      bits-per-pixel:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: LCD panel bit-depth.
+
+      atmel,lcdcon-backlight:
+        type: boolean
+        description: Enable backlight
+
+      atmel,lcdcon-backlight-inverted:
+        type: boolean
+        description: Invert backlight PWM polarity
+
+      atmel,lcd-wiring-mode:
+        enum:
+          - RGB
+          - BGR
+        description: LCD wiring mode
+
+      atmel,power-control-gpio:
+        description: gpio to power on or off the LCD
+
+      display-timings:
+        type: object
+        description: |
+          display-timings node as described in ../display-timings.yaml
+
+    required:
+      - atmel,dmacon
+      - atmel,lcdcon2
+      - atmel,guard-time
+      - bits-per-pixel
+      - display-timings
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    fb {
+        compatible = "atmel,at91sam9263-lcdc";
+        reg = <0x00700000 0x1000>;
+        interrupts = <23 3 0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
+
+  - |
+    fb {
+        compatible = "atmel,at91sam9263-lcdc";
+        reg = <0x00700000 0x1000 0x70000000 0x200000>;
+        display = <&display0>;
+
+        display0 {
+            bits-per-pixel = <32>;
+            atmel,lcdcon-backlight;
+            atmel,dmacon = <0x1>;
+            atmel,lcdcon2 = <0x80008002>;
+            atmel,guard-time = <9>;
+            atmel,lcd-wiring-mode = "BGR";
+
+            display-timings {
+            };
+        };
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
