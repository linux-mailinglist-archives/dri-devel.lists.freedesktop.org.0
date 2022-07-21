Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1FF57CEFE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 17:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA0310E0F1;
	Thu, 21 Jul 2022 15:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CF910E147
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 15:32:11 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m12so2278994lfj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 08:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BQPsNrymYWigYAjbaDXSls9HO34dMn+jNyqBAMGHkhE=;
 b=klI60USk54N1ownski2MYVS3xKr8/dbLGBfThTwKmpoSlp9gA0BGnWpC9utJG4uA5m
 2CCtvMBNtdFNqB8IgxA0+GaosllXfWigQdxOdCu1XVk+1Rts1gdQNd6u6Ma9NPPIWTj5
 1IbT841W++hJJgq+y9PLiXuvfn5+N8yp5NMHbm82xVvIT4Aljr+GFPAzq1vQ0O9QITX2
 WUQ9oP14M7KrpxoJi8E70tMDMjKr4WbxJEVDe/+CpKHJBhLE/xVIUJ6IUAu4k0UzhuT7
 9j6bDJ2xgCoJ8bGPTZ+H0krYG6U7lCMEZjjwdEjTtPBudunXg8aRjFQ/Zciv9euVnpOp
 O93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BQPsNrymYWigYAjbaDXSls9HO34dMn+jNyqBAMGHkhE=;
 b=0hv7QY1Uvw8ED38EYnZlklFR5tAP2ZvZ1i3Z8FVuZaC4jjIAUtSN6N+7g3ZYXVlCW1
 5AM8vlvWITKmKGdQzaPz0n6a5sRk5b4rs23/MX4r2MuJgovwIin3goycyjGjPWWCuzmv
 TK/nhEEm7Cn3x+w1Cp3rk4JD/4sFkgsuJ7CSdpOvPbIl/5DRyZKTG24AE/+nlN0mXtA/
 a/6/xSOuyrnNtQ0efxsWT4PrR6kPjTZfHVtHsJZMT0MeK4KDCqZQLYyNazYGJHkKoSys
 7rLY7Yw51eFxOPp+j2sxIfsryvmaZ3pDJ7gy1ofzO0UgFXeMVfNK0lO9ar34vB6ntbd6
 QNJg==
X-Gm-Message-State: AJIora8Ke7+Bkm7o2cfWAsdFbFFgR1iCOWPkyj8yGsWn2Ua3TcdOQjQ/
 EdHF7p/BjUJvy1pDPIFmviNFhg==
X-Google-Smtp-Source: AGRyM1u0E04Ew60hmcTsh0czeXohs6Fb3/eaGE8jGFnsE2y7hLGkSmza1WWiq5qyBWVL95BtnaBBXg==
X-Received: by 2002:a05:6512:10c3:b0:48a:b6d:41d with SMTP id
 k3-20020a05651210c300b0048a0b6d041dmr22990192lfg.679.1658417529272; 
 Thu, 21 Jul 2022 08:32:09 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
 by smtp.gmail.com with ESMTPSA id
 a27-20020ac25e7b000000b0048a2995772asm504604lfr.73.2022.07.21.08.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:32:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Tomislav Denis <tomislav.denis@avl.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>, Nuno Sa <nuno.sa@analog.com>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Mark Brown <broonie@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Marek Belisko <marek@goldelico.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Christian Eggers <ceggers@arri.de>, Beniamin Bia <beniamin.bia@analog.com>,
 Stefan Popa <stefan.popa@analog.com>,
 Oskar Andero <oskar.andero@gmail.com>,
 =?UTF-8?q?M=C3=A5rten=20Lindahl?= <martenli@axis.com>,
 Dan Murphy <dmurphy@ti.com>, Sean Nyekjaer <sean@geanix.com>,
 Cristian Pop <cristian.pop@analog.com>, Lukas Wunner <lukas@wunner.de>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Matheus Tavares <matheus.bernardino@usp.br>,
 Sankar Velliangiri <navin@linumiz.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Stefan Wahren <stefan.wahren@in-tech.com>, Pratyush Yadav <p.yadav@ti.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org, netdev@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: panel: explicitly list SPI CPHA and CPOL
Date: Thu, 21 Jul 2022 17:31:50 +0200
Message-Id: <20220721153155.245336-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
References: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
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

The spi-cpha and spi-cpol properties are device specific and should be
accepted only if device really needs them.  Explicitly list them in
device bindings in preparation of their removal from generic
spi-peripheral-props.yaml schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/lgphilips,lb035q02.yaml   | 10 ++++++++++
 .../bindings/display/panel/samsung,ld9040.yaml       | 10 ++++++++++
 .../bindings/display/panel/samsung,lms380kf01.yaml   | 12 +++++++++---
 .../bindings/display/panel/samsung,lms397kf04.yaml   | 12 +++++++++---
 .../bindings/display/panel/samsung,s6d27a1.yaml      | 12 +++++++++---
 .../bindings/display/panel/sitronix,st7789v.yaml     | 10 ++++++++++
 .../devicetree/bindings/display/panel/tpo,td.yaml    | 10 ++++++++++
 7 files changed, 67 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
index 5e4e0e552c2f..0bd7bbad5b94 100644
--- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
@@ -21,6 +21,16 @@ properties:
   enable-gpios: true
   port: true
 
+  spi-cpha:
+    type: boolean
+    description:
+      The device requires shifted clock phase (CPHA) mode.
+
+  spi-cpol:
+    type: boolean
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
+
 required:
   - compatible
   - enable-gpios
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
index d525165d6d63..ee6a61549916 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
@@ -42,6 +42,16 @@ properties:
   panel-height-mm:
     description: physical panel height [mm]
 
+  spi-cpha:
+    type: boolean
+    description:
+      The device requires shifted clock phase (CPHA) mode.
+
+  spi-cpol:
+    type: boolean
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
index 251f0c7115aa..7f010cb4aa20 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
@@ -43,9 +43,15 @@ properties:
 
   backlight: true
 
-  spi-cpha: true
-
-  spi-cpol: true
+  spi-cpha:
+    type: boolean
+    description:
+      The device requires shifted clock phase (CPHA) mode.
+
+  spi-cpol:
+    type: boolean
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
 
   spi-max-frequency:
     maximum: 1200000
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
index cd62968426fb..794da8b45896 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
@@ -33,9 +33,15 @@ properties:
 
   backlight: true
 
-  spi-cpha: true
-
-  spi-cpol: true
+  spi-cpha:
+    type: boolean
+    description:
+      The device requires shifted clock phase (CPHA) mode.
+
+  spi-cpol:
+    type: boolean
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
 
   spi-max-frequency:
     description: inherited as a SPI client node, the datasheet specifies
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
index 26e3c820a2f7..468111b1a1b4 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
@@ -41,9 +41,15 @@ properties:
 
   backlight: true
 
-  spi-cpha: true
-
-  spi-cpol: true
+  spi-cpha:
+    type: boolean
+    description:
+      The device requires shifted clock phase (CPHA) mode.
+
+  spi-cpol:
+    type: boolean
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
 
   spi-max-frequency:
     maximum: 1200000
diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index 9e1d707c2ace..0eea7de51689 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -23,6 +23,16 @@ properties:
   backlight: true
   port: true
 
+  spi-cpha:
+    type: boolean
+    description:
+      The device requires shifted clock phase (CPHA) mode.
+
+  spi-cpol:
+    type: boolean
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
index f902a9d74141..9b0e8659d6bd 100644
--- a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
+++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
@@ -28,6 +28,16 @@ properties:
   backlight: true
   port: true
 
+  spi-cpha:
+    type: boolean
+    description:
+      The device requires shifted clock phase (CPHA) mode.
+
+  spi-cpol:
+    type: boolean
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
+
 required:
   - compatible
   - port
-- 
2.34.1

