Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 098D0582C2F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 18:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FF097265;
	Wed, 27 Jul 2022 16:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A34494A0D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 16:43:17 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t1so27900784lft.8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 09:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dq1uiZkAWa3YJvnfamL8dc9poZEqWN+zXqH3YX0Ei5g=;
 b=qCyMVBkCXFWl1AlJ5rfWeaCJL8jbUT35O7IxR89YvWURkZkpEiIbfagT6bJR1uSTck
 YbU0zVyldV6p6XW6UPlKR00YL+u6oN22qGh3V9lr5RSCTRxlTg+6j/L1shioPpEaS7DM
 ftpLvGyWCZ4+68kqY/LMvV0tyXTclfFKxn0mbsxA8s+4Q6K4RFIO+s856ieFJmBcpnW+
 /D2V4JWTU3+J4p4RgsA9fCq1V2L8dieLqfkcESOSMz5v+uN+0E8rlxc14XXQP5MqGJmq
 uJ5bAEibiJbYXh7hTOYcNgy4qXuk7IeI2q0jqOu2k2ViRQo6nhIypR1TXJ/sh8Xcs7M3
 7PjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dq1uiZkAWa3YJvnfamL8dc9poZEqWN+zXqH3YX0Ei5g=;
 b=uFziavovsdGpGy+xUXP6ySRYgMUyCH0jmmFt79Ebu+cqi4QZGEGSnyiLxmQT4yYrfK
 g2wStvp0PFHLG3RnFt72Qm114IYXYepoYmanSIbYuA46Vk2bcNC4jmpNkBmvPM+3PJhQ
 Wo6/jIEzjwbgd0OnXz6EeZyurByVq3xh6C853w6Fajfi6yzisFbxehDmLhkposilUWqy
 2CuxJ5BMRYDkIxkDR4N5nu6EBi2iLHEzeZRFQ2PMoG3OVqCKHAh7JmU1GFwsAMVAwZTr
 sqidvn0PquLzqLfTPLSYvhrTSoDdmLGFcvQgEGxFbLKUtaa8e5Cuc9PnBlVWAr2N+EUo
 sHLQ==
X-Gm-Message-State: AJIora/wpPbMAjvcuvW/4PXq47eSnASYdmjpildZILWIdw1oBDFl1kZL
 whuVdcptv5L1Imk/+94OjjmBCw==
X-Google-Smtp-Source: AGRyM1tjstljwcPGnQ8nUewAwhzjHnExmu7i325wwT19JRsKZYk7zO7l24iTwuawcmiATp8A/e/MEQ==
X-Received: by 2002:a05:6512:2826:b0:48a:a02c:4a6a with SMTP id
 cf38-20020a056512282600b0048aa02c4a6amr3196539lfb.29.1658940195058; 
 Wed, 27 Jul 2022 09:43:15 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no.
 [78.26.46.173]) by smtp.gmail.com with ESMTPSA id
 t17-20020ac243b1000000b0047fae90bfb4sm3869763lfl.56.2022.07.27.09.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 09:43:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Lechner <david@lechnology.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Heiko Schocher <hs@denx.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: use spi-peripheral-props.yaml
Date: Wed, 27 Jul 2022 18:43:12 +0200
Message-Id: <20220727164312.385836-1-krzysztof.kozlowski@linaro.org>
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

Instead of listing directly properties typical for SPI peripherals,
reference the spi-peripheral-props.yaml schema.  This allows using all
properties typical for SPI-connected devices, even these which device
bindings author did not tried yet.

Remove the spi-* properties which now come via spi-peripheral-props.yaml
schema, except for the cases when device schema adds some constraints
like maximum frequency.

While changing additionalProperties->unevaluatedProperties, put it in
typical place, just before example DTS.

The sitronix,st7735r references also panel-common.yaml and lists
explicitly allowed properties, thus here reference only
spi-peripheral-props.yaml for purpose of documenting the SPI slave
device and bringing spi-max-frequency type validation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Technically, this depends on [1] merged to SPI tree, if we want to
preserve existing behavior of not allowing SPI CPHA and CPOL in each of
schemas in this patch.

If this patch comes independently via different tree, the SPI CPHA and
CPOL will be allowed for brief period of time, before [1] is merged.
This will not have negative impact, just DT schema checks will be
loosened for that period.

[1] https://lore.kernel.org/all/20220722191539.90641-2-krzysztof.kozlowski@linaro.org/
---
 .../devicetree/bindings/display/panel/lg,lg4573.yaml       | 2 +-
 .../devicetree/bindings/display/sitronix,st7735r.yaml      | 1 +
 .../devicetree/bindings/display/solomon,ssd1307fb.yaml     | 7 +++----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml b/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
index b4314ce7b411..ee357e139ac0 100644
--- a/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
@@ -15,13 +15,13 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
     const: lg,lg4573
 
   reg: true
-  spi-max-frequency: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
index 157b1a7b18f9..53f181ef3670 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
@@ -15,6 +15,7 @@ description:
 
 allOf:
   - $ref: panel/panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 3fbd87c2c120..669f70b1b4c4 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -49,9 +49,6 @@ properties:
   vbat-supply:
     description: The supply for VBAT
 
-  # Only required for SPI
-  spi-max-frequency: true
-
   solomon,height:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 16
@@ -153,6 +150,8 @@ required:
   - reg
 
 allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
   - if:
       properties:
         compatible:
@@ -223,7 +222,7 @@ allOf:
         solomon,dclk-frq:
           default: 10
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

