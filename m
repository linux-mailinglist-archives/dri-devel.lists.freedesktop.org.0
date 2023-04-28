Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE546F1C2A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 18:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3250A10E3D9;
	Fri, 28 Apr 2023 16:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ED310E3DA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 16:03:00 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64115eef620so13604740b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682697779; x=1685289779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NFqCvF6zcr5bU/PC6sitkV28Z2TiIUDFVfcU6fA1uhs=;
 b=PwjZmFWjx0l6/Cp3B6ZEV6WQ7Zx28GfcOc51v/XK+23ClDY50ePtgxT09IwNgPEopC
 XgFev2tc3ytoXpXLsu2m7KZ5WzuFJI08T+0tRjFosmfzexucrkduyA3QGDctCx5X1sl3
 1Enws9t3ncavnNHrV7394jQs6V2A1q0TUYUigkpb3CxG/rDvjjqvkDXW0VazHIbG+l7L
 bkjeRYHv6/rRV69VLp7KVgFOX3e9KAbdkhb6BWIUhT/urHkwkoMdUf5v9LLm6CeLVkRr
 z0fnVDsae2mmHQiEdZuIdHcl6LHoFqiGR5rtgFHEVb5carY4Nr9lqieW4rWV43BzLB25
 TPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682697779; x=1685289779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NFqCvF6zcr5bU/PC6sitkV28Z2TiIUDFVfcU6fA1uhs=;
 b=e6lQuLXmiQI9jfnkWnHxje/1OTRXOP0djRP/DepOB9+glhRyXFO4whOBb11ryuHlzk
 lb3ympxdWIr4Xs8KFgYvgyDRVKs7tVZDzFT+tzZba0sAbQpTTknIVqlvoIeyG1zNbp5X
 u0hI63O1LZIrJ3chdanQc+s5+Io6iUQtKKKQUKH6CLVLA7LES7lqhBxLtBkkcOpdZQ5i
 dNETTHz1i1Pb1eiGUPaHGYymujFsy6Y2JykhHBrkqL+zXLOeB6FoyZln57ad6ES82RW7
 e1/H6jQNy7Ebt6BdELwLGP+eKgtxYJRdJmRa6q6t8KBlBpEJFvPGqk8/rP0nDa8vKTWA
 F7Lg==
X-Gm-Message-State: AC+VfDws4bjdZiVpTsM9LEQyUFBaHhjwFiXqI2dbchZqmT8DnA+HU5Kt
 e85pPD/PTvaQG3oHTLDV4IjRy9oB36FILc84
X-Google-Smtp-Source: ACHHUZ4n9eWm1zNiFdfRPnFXpG+pdAIxXQZgdvnrdjIN6cuRBezH8a5Vp7dwCkgu/eE23rnzdDfxEw==
X-Received: by 2002:a17:902:dacb:b0:1a2:a904:c42e with SMTP id
 q11-20020a170902dacb00b001a2a904c42emr7025837plx.24.1682697778013; 
 Fri, 28 Apr 2023 09:02:58 -0700 (PDT)
Received: from localhost.localdomain (n220246252240.netvigator.com.
 [220.246.252.240]) by smtp.gmail.com with ESMTPSA id
 x15-20020a170902820f00b001a045f45d49sm13354756pln.281.2023.04.28.09.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:02:57 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: leds: backlight: ktz8866: Add reg property and
 update example
Date: Sat, 29 Apr 2023 00:02:46 +0800
Message-Id: <20230428160246.16982-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.2
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
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kinetic,ktz8866 is a I2C driver, so add the missing reg property.
And update example to make it clear.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 .../leds/backlight/kinetic,ktz8866.yaml       | 29 ++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
index e1191453c2f0..6ec40cce3f11 100644
--- a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -21,6 +21,9 @@ properties:
   compatible:
     const: kinetic,ktz8866
 
+  reg:
+    maxItems: 1
+
   vddpos-supply:
     description: positive boost supply regulator.
 
@@ -53,6 +56,7 @@ properties:
 
 required:
   - compatible
+  - reg
   - vddpos-supply
   - vddneg-supply
   - enable-gpios
@@ -63,14 +67,19 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    backlight {
-        compatible = "kinetic,ktz8866";
-
-        vddpos-supply = <&bl_vddpos_5p5>;
-        vddneg-supply = <&bl_vddneg_5p5>;
-        enable-gpios = <&tlmm 139 GPIO_ACTIVE_HIGH>;
-        current-num-sinks = <5>;
-        kinetic,current-ramp-delay-ms = <128>;
-        kinetic,led-enable-ramp-delay-ms = <1>;
-        kinetic,enable-lcd-bias;
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@11 {
+            compatible = "kinetic,ktz8866";
+            reg = <0x11>;
+            vddpos-supply = <&bl_vddpos_5p5>;
+            vddneg-supply = <&bl_vddneg_5p5>;
+            enable-gpios = <&tlmm 139 GPIO_ACTIVE_HIGH>;
+            current-num-sinks = <5>;
+            kinetic,current-ramp-delay-ms = <128>;
+            kinetic,led-enable-ramp-delay-ms = <1>;
+            kinetic,enable-lcd-bias;
+        };
     };
-- 
2.39.2

