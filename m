Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5C847C01E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 13:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF601127BC;
	Tue, 21 Dec 2021 12:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AC01127BC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 12:52:39 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id fo11so12316340qvb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 04:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1B7l3mS3kUTU8so7uOc+jIgCAO6knrVM5YQ4rwdLGo=;
 b=DZknkE84SXFm1CqZFn9xy79y1nd/rRGk1NST3G5Dinw28RTUc6yLkILJ0bwOXKz4cn
 0E1jbChyxZ3SiSIR6t05gTIgX7gCmOjkVuGerCyq2Kja36R/fZGEKtYZIQ3jQzZJVVmr
 9ClUlDwpN8Fkv9YEOqBkV8u8d3VQ1s5RXN4HINwOwMILQ6+tnu2OKJA+72wgy68CcnID
 YTf5oeCcpfYC+A8iZ+PeLhWYIRXq5J5X2YACTOsWPY3M0Dc6I4M38dHjbR7OzOBRkaDS
 O1K7yzcdOE7vmAKCij6AhkXOpS057l23RepwWs6BNs+YhH42UJqP8Ydi4GKExKK8L3AF
 XGZg==
X-Gm-Message-State: AOAM530hj0LSnAVFK73bPvMSa30x4i3OBB2AIUk9D5Nn3MgcRuFCVvtg
 H9ItKYtoARJpUucLb0VQeg==
X-Google-Smtp-Source: ABdhPJyuBOkK+1SyYLuLwxdaZwirAVxpp2OHAD0Tudg+XxkEaltQoeTJ6bX0JnXjQ/rxB6rRKyvAXw==
X-Received: by 2002:a05:6214:1cc4:: with SMTP id
 g4mr2008650qvd.45.1640091158530; 
 Tue, 21 Dec 2021 04:52:38 -0800 (PST)
Received: from xps15.. ([24.55.105.145])
 by smtp.googlemail.com with ESMTPSA id x15sm13932938qko.82.2021.12.21.04.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 04:52:38 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Cercueil <paul@crapouillou.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Maxime Ripard <mripard@kernel.org>, Marek Belisko <marek@goldelico.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] dt-bindings: display: Add SPI peripheral schema to SPI based
 displays
Date: Tue, 21 Dec 2021 08:52:09 -0400
Message-Id: <20211221125209.1195932-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With 'unevaluatedProperties' support enabled, several SPI based display
binding examples have warnings:

Documentation/devicetree/bindings/display/panel/samsung,ld9040.example.dt.yaml: lcd@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency', 'spi-3wire' were unexpected)
Documentation/devicetree/bindings/display/panel/ilitek,ili9322.example.dt.yaml: display@0: Unevaluated properties are not allowed ('reg' was unexpected)
Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.example.dt.yaml: display@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
Documentation/devicetree/bindings/display/panel/abt,y030xx067a.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
Documentation/devicetree/bindings/display/panel/sony,acx565akm.example.dt.yaml: panel@2: Unevaluated properties are not allowed ('spi-max-frequency', 'reg' were unexpected)
Documentation/devicetree/bindings/display/panel/tpo,td.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('reg', 'spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
Documentation/devicetree/bindings/display/panel/innolux,ej030na.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
Documentation/devicetree/bindings/display/panel/sitronix,st7789v.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)

Fix all of these by adding a reference to spi-peripheral-props.yaml.
With this, the description that the binding must follow
spi-controller.yaml is both a bit out of date and redundant, so remove
it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
This is dependent on spi-peripheral-props.yaml landing in 5.17-rc1.
---
 .../devicetree/bindings/display/panel/abt,y030xx067a.yaml  | 5 +----
 .../devicetree/bindings/display/panel/ilitek,ili9322.yaml  | 4 +---
 .../devicetree/bindings/display/panel/innolux,ej030na.yaml | 5 +----
 .../bindings/display/panel/kingdisplay,kd035g6-54nt.yaml   | 5 +----
 .../bindings/display/panel/lgphilips,lb035q02.yaml         | 5 +----
 .../devicetree/bindings/display/panel/samsung,ld9040.yaml  | 7 +------
 .../devicetree/bindings/display/panel/samsung,s6e63m0.yaml | 1 +
 .../bindings/display/panel/sitronix,st7789v.yaml           | 5 +----
 .../devicetree/bindings/display/panel/sony,acx565akm.yaml  | 5 +----
 .../devicetree/bindings/display/panel/tpo,td.yaml          | 5 +----
 10 files changed, 10 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
index a108029ecfab..acd2f3faa6b9 100644
--- a/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
@@ -6,15 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Asia Better Technology 3.0" (320x480 pixels) 24-bit IPS LCD panel
 
-description: |
-  The panel must obey the rules for a SPI slave device as specified in
-  spi/spi-controller.yaml
-
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
index e89c1ea62ffa..7d221ef35443 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
@@ -15,11 +15,9 @@ description: |
   960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
   VCOMH outputs.
 
-  The panel must obey the rules for a SPI slave device as specified in
-  spi/spi-controller.yaml
-
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml b/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
index cda36c04e85c..72788e3e6c59 100644
--- a/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
+++ b/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
@@ -6,15 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Innolux EJ030NA 3.0" (320x480 pixels) 24-bit TFT LCD panel
 
-description: |
-  The panel must obey the rules for a SPI slave device as specified in
-  spi/spi-controller.yaml
-
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
index c45c92a3d41f..2a2756d19681 100644
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
@@ -6,15 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT LCD panel
 
-description: |
-  The panel must obey the rules for a SPI slave device as specified in
-  spi/spi-controller.yaml
-
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
index 830e335ddb53..5e4e0e552c2f 100644
--- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
@@ -6,15 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: LG.Philips LB035Q02 Panel
 
-description: |
-  The panel must obey the rules for a SPI slave device as specified in
-  spi/spi-controller.yaml
-
 maintainers:
   - Tomi Valkeinen <tomi.valkeinen@ti.com>
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
index 060ee27a4749..d525165d6d63 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
@@ -6,15 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Samsung LD9040 AMOLED LCD parallel RGB panel with SPI control bus
 
-description: |
-  The panel must obey the rules for a SPI slave device as specified in
-  spi/spi-controller.yaml
-
 maintainers:
   - Andrzej Hajda <a.hajda@samsung.com>
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
@@ -63,8 +60,6 @@ examples:
 
         lcd@0 {
             compatible = "samsung,ld9040";
-            #address-cells = <1>;
-            #size-cells = <0>;
 
             reg = <0>;
             vdd3-supply = <&ldo7_reg>;
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
index ea58df49263a..940f7f88526f 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
@@ -12,6 +12,7 @@ maintainers:
 allOf:
   - $ref: panel-common.yaml#
   - $ref: /schemas/leds/backlight/common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index fa46d151e7b3..9e1d707c2ace 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -6,15 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sitronix ST7789V RGB panel with SPI control bus
 
-description: |
-  The panel must obey the rules for a SPI slave device as specified in
-  spi/spi-controller.yaml
-
 maintainers:
   - Maxime Ripard <mripard@kernel.org>
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
index 95d053c548ab..98abdf4ddeac 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
@@ -6,15 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sony ACX565AKM SDI Panel
 
-description: |
-  The panel must obey the rules for a SPI slave device as specified in
-  spi/spi-controller.yaml
-
 maintainers:
   - Tomi Valkeinen <tomi.valkeinen@ti.com>
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
index 4aa605613445..f902a9d74141 100644
--- a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
+++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
@@ -6,16 +6,13 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Toppoly TD Panels
 
-description: |
-  The panel must obey the rules for a SPI slave device as specified in
-  spi/spi-controller.yaml
-
 maintainers:
   - Marek Belisko <marek@goldelico.com>
   - H. Nikolaus Schaller <hns@goldelico.com>
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
-- 
2.32.0

