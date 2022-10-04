Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B6D5F42B5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 14:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F55E10E5AE;
	Tue,  4 Oct 2022 12:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3ED10E5AE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 12:09:11 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id y22so1099260ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=aPGidK7aepjAesrd9H3pmdchlCYA90T2ED3drHviM08=;
 b=eUwwFFRlDQ0dPHZ7nXZ9uSzyINsHKjDxBeGQx32XdcQKTTjivd9v/k87W7R0Di/3a9
 EXskKqoDPguV6PMERy9DnXZzXHQYOd/kUUtKqXoVVLwPBnEeYWZn8lgiIusHaipqGgsE
 PlVw02zjug2Nr4e/wXp1J0Z6Oqr8a7wK0B8ycCITBSiTa1qPev5zne2jiaZQSCD06F9B
 OlSCC8VylSH5cunQQY378AzMsXyuH2roJBLZz8VfjOIJcRgDnCaTAA+nZl/7QwkH/0eB
 7LGzsP2ypr6D2z1PmLmc4zalV93+HBTjs7Z9bsX+3X+IOVnr3U4iisFBW0NVkVKTuqBK
 269w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=aPGidK7aepjAesrd9H3pmdchlCYA90T2ED3drHviM08=;
 b=71oI5k8mp75TUh7jqADKhe9GhREqemTVPKbb5I3NTMOfDRQLyWG23e509KdI8lxQJS
 1QsoJMPUeWaTHZ+Vey8/WoIB5sLQx0w1neF3D82ip5BBlmknbSOXBRT/d1XarQWX1JJM
 yPS1lkoC9pbC//tVn08uBzTjYwHd6/ZCLl/4KLavuLuvXF+xB4+zsVkbDC8pgl7zQxgB
 7maFWF5ccWol9n1ABLrqOCXncbdt5izYRTQcVYDTmc/3FMnaU8s05s18DW0WW/u9NkDG
 t18ipjTDlyTIIToqH7+JfPLGX5ygVRcs1MmkufIdjas2b3nvocmzYGUNpYc10+bx9ll0
 K1+w==
X-Gm-Message-State: ACrzQf1+orEGAqWrN+fGHluySZJkOff36rkCJyIzlx48nB9vSrt/YcyW
 Svf2+U7QFhwk4JaE0p/ikorDzg==
X-Google-Smtp-Source: AMsMyM45quw5V+niXpUB6OEOrWbJDo4mYlYyBGIR2JYohc2wUst18OtOb8ZfZ9GCSKf+Bt3KV/9/9A==
X-Received: by 2002:a2e:bc09:0:b0:26c:203:e38 with SMTP id
 b9-20020a2ebc09000000b0026c02030e38mr8655204ljf.249.1664885349333; 
 Tue, 04 Oct 2022 05:09:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a056512308d00b004979989028bsm1891360lfd.147.2022.10.04.05.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 05:09:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Dillon Min <dillon.minfei@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: panel: use spi-peripheral-props.yaml
Date: Tue,  4 Oct 2022 14:09:07 +0200
Message-Id: <20221004120907.72767-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For devices connectable by SPI bus (e.g. already using
"spi-max-frequency" property), reference the "spi-peripheral-props.yaml"
schema to allow using all SPI device properties, even these which device
bindings author did not tried yet.

Change "additionalProperties" to "unevaluatedProperties", so the actual
other properties from "spi-peripheral-props.yaml" can be used.  This has
additional impact of allowing also other properties from
panel-common.yaml to be used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/ilitek,ili9163.yaml    | 3 ++-
 .../devicetree/bindings/display/panel/ilitek,ili9341.yaml    | 1 +
 .../devicetree/bindings/display/panel/nec,nl8048hl11.yaml    | 3 ++-
 .../bindings/display/panel/samsung,lms380kf01.yaml           | 5 ++---
 .../bindings/display/panel/samsung,lms397kf04.yaml           | 3 ++-
 .../devicetree/bindings/display/panel/samsung,s6d27a1.yaml   | 4 ++--
 .../devicetree/bindings/display/panel/tpo,tpg110.yaml        | 1 +
 7 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
index 7e7a8362b951..a4154b51043e 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
@@ -15,6 +15,7 @@ description:
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
@@ -41,7 +42,7 @@ required:
   - dc-gpios
   - reset-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 99e0cb9440cf..94f169ea065a 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -16,6 +16,7 @@ description: |
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml b/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml
index aa788eaa2f71..3b09b359023e 100644
--- a/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml
+++ b/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml
@@ -15,6 +15,7 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
@@ -34,7 +35,7 @@ required:
   - reset-gpios
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
index 251f0c7115aa..70ffc88d2a08 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
@@ -9,14 +9,13 @@ title: Samsung LMS380KF01 display panel
 description: The LMS380KF01 is a 480x800 DPI display panel from Samsung Mobile
   Displays (SMD) utilizing the WideChips WS2401 display controller. It can be
   used with internal or external backlight control.
-  The panel must obey the rules for a SPI slave device as specified in
-  spi/spi-controller.yaml
 
 maintainers:
   - Linus Walleij <linus.walleij@linaro.org>
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
@@ -59,7 +58,7 @@ required:
   - spi-cpol
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
index cd62968426fb..5e77cee93f83 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
@@ -14,6 +14,7 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
@@ -51,7 +52,7 @@ required:
   - spi-cpol
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
index 26e3c820a2f7..d273faf4442a 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
@@ -7,14 +7,14 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S6D27A1 display panel
 
 description: The S6D27A1 is a 480x800 DPI display panel from Samsung Mobile
-  Displays (SMD). The panel must obey the rules for a SPI slave device
-  as specified in spi/spi-controller.yaml
+  Displays (SMD).
 
 maintainers:
   - Markuss Broks <markuss.broks@gmail.com>
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
index 6f1f02044b4b..f0243d196191 100644
--- a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
+++ b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
@@ -41,6 +41,7 @@ description: |+
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
-- 
2.34.1

