Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B0493294
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 02:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FE510E132;
	Wed, 19 Jan 2022 01:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1640A10E132
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 01:54:43 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 a10-20020a9d260a000000b005991bd6ae3eso991520otb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 17:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qwNF7gDQbaVP4ndpQ6YMR5OTB3DEGyDODGB0cvvqRfI=;
 b=RMZoLr5me9tnUPKDibBFHoItAAW18Z7qW3Wvfs+uZT3fZUeTzmwRXEYOhlaHfap9Ht
 LHu4JK3cNut0N48MFSw8PRoj9VydjZKgRJ4ExdVtW5+Cruql7RT6ZnZVISNpiBkR+xoR
 wHWdahWo27Xna5kfRMIz+ljoSExsIMzWJpaxuG0HiLgISkx4SEOhZHf8QMuIa7SfT3Of
 rAmdrtIBYv5mc0YcQyMlV4DYsUoTJFvRBWiMyS0vDFR1FPFqXSRXZ5+pkkMcdlFYoIaS
 cihAThLsE+4/m0x2y6P29hfST1J1UnKRLGEKcyO24GZrDLzKQVk3WzO/7LcNW/bJ1MDB
 9Y6g==
X-Gm-Message-State: AOAM530l3Fgkbw42RQsi86meRS7MxrssgHgPRck1Bbml++sS/fzqoj3l
 OzFJ5Hf5rhzKfJM35KFdHQ==
X-Google-Smtp-Source: ABdhPJzVUKXAC2YcMFSv4hVv2ACgxjnkM4ifG2UCVa32kabvoUCd5Cz5lVIyctz4yYEGV/7yATw++g==
X-Received: by 2002:a9d:4b13:: with SMTP id q19mr22246546otf.300.1642557282257; 
 Tue, 18 Jan 2022 17:54:42 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id x26sm8030086ote.78.2022.01.18.17.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 17:54:41 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 - <patches@opensource.cirrus.com>
Subject: [PATCH] dt-bindings: Drop unnecessary pinctrl properties
Date: Tue, 18 Jan 2022 19:53:25 -0600
Message-Id: <20220119015325.2438277-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For a single pinctrl mode, it is not necessary to define pinctrl
properties as the tools always allow pinctrl properties.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../display/rockchip/rockchip,rk3066-hdmi.yaml         |  8 --------
 Documentation/devicetree/bindings/input/gpio-keys.yaml |  6 ------
 .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml  |  9 ---------
 .../devicetree/bindings/pinctrl/cirrus,madera.yaml     | 10 ----------
 .../devicetree/bindings/sound/samsung-i2s.yaml         |  6 ------
 5 files changed, 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
index 008c144257cb..1a68a940d165 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
@@ -26,14 +26,6 @@ properties:
   clock-names:
     const: hclk
 
-  pinctrl-0:
-    maxItems: 2
-
-  pinctrl-names:
-    const: default
-    description:
-      Switch the iomux for the HPD/I2C pins to HDMI function.
-
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index dbe7ecc19ccb..7fe1966ea28a 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -88,12 +88,6 @@ patternProperties:
             which can be disabled to suppress events from the button.
           type: boolean
 
-        pinctrl-0:
-          maxItems: 1
-
-        pinctrl-names:
-          maxItems: 1
-
       required:
         - linux,code
 
diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
index 80020539c3bb..5cd512b7d5ba 100644
--- a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
@@ -51,15 +51,6 @@ properties:
       appropriate of the LOCHNAGARx_PIN_NUM_GPIOS define, see [3].
     maxItems: 1
 
-  pinctrl-0:
-    description:
-      A phandle to the default pinctrl state.
-
-  pinctrl-names:
-    description:
-      A pinctrl state named "default" must be defined.
-    const: default
-
   pin-settings:
     type: object
     patternProperties:
diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
index e50d7ad5c229..c85f759ae5a3 100644
--- a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
@@ -30,16 +30,6 @@ description: |
     Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
 
 properties:
-  pinctrl-0:
-    description:
-      A phandle to the node containing the subnodes containing default
-      configurations.
-
-  pinctrl-names:
-    description:
-      A pinctrl state named "default" must be defined.
-    const: default
-
   pin-settings:
     description:
       One subnode is required to contain the default settings. It
diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
index 2e3628ef48df..84c4d6cba521 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -110,12 +110,6 @@ properties:
       Internal DMA register base address of the audio
       subsystem (used in secondary sound source).
 
-  pinctrl-0:
-    description: Should specify pin control groups used for this controller.
-
-  pinctrl-names:
-    const: default
-
   power-domains:
     maxItems: 1
 
-- 
2.32.0

