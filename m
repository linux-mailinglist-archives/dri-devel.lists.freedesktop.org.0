Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD41A5FC0
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 20:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BE76E134;
	Sun, 12 Apr 2020 18:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215286E13A
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 18:20:27 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h6so5012014lfc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 11:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s7PyP7wM+hSmqY+Nl4dhHB6/+lR7BTTva1Z1R03Oe1A=;
 b=O3gdcKnk6nH6vW/0o9T/tib9LsIjIxtq7DG8LrEag2qjwgCdtswUsLnNipTw+jT4mP
 e6cbPPRL2CNlRKZQh2uOMyQo8DyoWKT/QaNU20nlUtHfdcRUNBK4L6HBlspqSom+34R3
 j5TopCMaCD4NhkoQu4G+WM7fTFuXOdCPJ4KUsfEo9ysytuqSgn7sMNY/2udkVmdpe+Sq
 E6lHiaVugK/D0cp8oht8TJynVaMa1uDkGVpjyHYgwvMMhfaYM0BhWCdi9naledajb1/J
 HXbSROWbXH982peXfJctgLkwg1M88T2iLbE70T8ApVkffnPJ8+xumdNgXwejrBbJmrne
 2Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s7PyP7wM+hSmqY+Nl4dhHB6/+lR7BTTva1Z1R03Oe1A=;
 b=qHRXAHRe50HcQkv9dUTzPQ0E4YYPIOLsmiRntLEJyWEP7j2qRYeDs7IOClf5YA9O50
 s9eFjMyl3D3uP9n5YznqPJYvgCGAO6uUuD954OglvDpBvF9cHU5fmokeN6pnvA/CFbtL
 43JZuTwXM71y4l/6gWUiT9SCZJNEAPFkb88yydYbx7VLYZ4OKqz9e3g5x0RLQu0EfLFH
 cE2QTZyhoYCmyfe16UDvld4IPOGaZ/PVg8m57ISzGV9ANe93nNug7qwbWq5FHaimc+jR
 p/csy6S6zJ9GmrUeEgfn5saoCvlRU35Doj/mXp2MQExuG+OrhKEkn9sougdT9MLZ7sWJ
 aRhQ==
X-Gm-Message-State: AGi0PubjnAAp78HiE/UWXhQJn8or99UXFbqdvDMd48ugSF3daTlJZTWo
 1gESKvn6nt478oFyU1XwP5A=
X-Google-Smtp-Source: APiQypJSXZxot3B6tsVUM4YKg3cHraXKHQBplcVR54rLr6Cr3IwsfjmqDogPJQNAHRKGcEqAoTxaPg==
X-Received: by 2002:a05:6512:10c9:: with SMTP id
 k9mr8379271lfg.183.1586715625482; 
 Sun, 12 Apr 2020 11:20:25 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 m13sm6434394lfk.12.2020.04.12.11.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 11:20:25 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 4/4] dt-bindings: display: add port support to atmel lcdc
Date: Sun, 12 Apr 2020 20:20:12 +0200
Message-Id: <20200412182012.27515-5-sam@ravnborg.org>
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

Update the Atmel LCDC binding to include:
- pwm. Used for backlight
- endpoints using port node
  Used for handle to panel
- Added wiring property that is used to describe
  the wiring between the LCDC and the panel

Existing properties that should not be used in new
bindings are deprecated.

Updated example to include the updated way to specify panel etc.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/atmel/lcdc.yaml          | 94 ++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
index 7dcb9a4d5902..b5c2628f7805 100644
--- a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
+++ b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
@@ -28,6 +28,7 @@ properties:
 
   "#address-cells":
     const: 1
+
   "#size-cells":
     const: 0
 
@@ -43,13 +44,84 @@ properties:
   lcd-supply:
     description: Regulator for LCD supply voltage.
 
+  "#pwm-cells":
+    description:
+      This PWM chip use the default 3 cells bindings
+      defined in ../../pwm/pwm.yaml.
+    const: 3
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    maxItems: 2
+    items:
+      - const: lcdc_clk
+      - const: hclk
+
+  port@0:
+    type: object
+    description: Endpoints of the display controller
+
+    properties:
+
+      reg:
+        const: 0
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      endpoint@0:
+        type: object
+        description: endpoint node that include phandle to panel
+
+        properties:
+
+          reg:
+            const: 0
+
+          wiring:
+            enum:
+              - straight
+              - red-blue-reversed
+            description: |
+              The LCDC is based on a blue-green-red configuration but to adapt
+              to SW only supporting red-green-blue the data lines for red and blue
+              may be reversed.
+              See details in: http://ww1.microchip.com/downloads/en/AppNotes/doc6300.pdf
+              "straight" - default value. Data lines are not reversed, uses BGR
+              "red-blue-reversed" - red and green are reversed, uses RGB
+
+          remote-endpoint:
+            $ref: /schemas/types.yaml#/definitions/phandle
+            description:
+              phandle to the panel node
+
+        required:
+          - reg
+          - remote-endpoint
+
+        additionalProperties: false
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+
+    additionalProperties: false
+
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
     description: phandle to display node
 
 patternProperties:
   "^display[0-9]$":
     type: object
+    deprecated: true
     description: |
       Display node is required to initialize the lcd panel.
       This should be in the board dts
@@ -107,12 +179,32 @@ required:
 
 examples:
   - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     fb {
         compatible = "atmel,at91sam9263-lcdc";
         reg = <0x00700000 0x1000>;
-        interrupts = <23 3 0>;
+        interrupts = <26 IRQ_TYPE_LEVEL_HIGH 3>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 26>, <&pmc PMC_TYPE_PERIPHERAL 26>;
+        clock-names = "lcdc_clk", "hclk";
+
+        /* pwm for backlight */
+        #pwm-cells = <3>;
+
         #address-cells = <1>;
         #size-cells = <0>;
+
+        port@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            endpoint@0 {
+                reg = <0>;
+                wiring = "red-blue-reversed";
+                remote-endpoint = <&panel_input>;
+            };
+        };
     };
 
   - |
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
