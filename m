Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971C69F68F2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFCE10EBCD;
	Wed, 18 Dec 2024 14:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="QBIyaIUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2146D10EBCF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:48:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3862b364538so505238f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 06:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734533327; x=1735138127;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yrY2pupmY3cS5kWrlBb91JoKbiwZO8QDmeo+1uchgEg=;
 b=QBIyaIUVnIBPz1YR8tdoBe9nyMDaKNbfcTFCOpJN5XFo1gpiIZlQg2s48QXXRvbtDL
 /Ewrze3JRe7l2O2Ddx3GRznxiYzy/Bbvn/P49f4a6y86nn+VdKMuEqzuP6qDjMrjDKoO
 t9/ZLx9gPd3e9bCTaUSOlz3p96peftz9W+rX+AwitK/1PeHL+bKurMHf1Pi5RUO3bYyN
 HErgWq5XzL5SkLjFCGOcAqrp8ZAfNSeakY801I3diUHmVXnhbDh+7eyzGVQ3eUjTTFXt
 KvIzLM/8p0p0DpEJmUS4x2aMasfTCUZJ4oKrXrsQhm/qXDg4BJgxtMo8uGgzqNhbkDEm
 Q4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734533327; x=1735138127;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yrY2pupmY3cS5kWrlBb91JoKbiwZO8QDmeo+1uchgEg=;
 b=xN/NwFZWy8nd19yjLmeMK/mN8W0vxgiunRyl+B0+9+T0oB0k/nDKfxPXX6j+hRFY+1
 NjKxcCZb2iZ+3JNwvMwnPKfugskEbnBaMWV0frI4E+mp0oH+dg9rUbaxY/iE0d7Bhuj+
 nw+RdW9JEPxKP+sLCMx9Ux/5+wcwiD83yGtuI00gGzCmd2bSMI1Qoe8xLzFkrYOY8FnX
 EWPCxQ7q99O4AqstD/wFTzDkzT7tZzsokZAhw1s8YSUwiwRCTsA8OaB4OqsxYvhEbmrI
 qMBwUZckLbroC3YO3iQv1mQfcAPTgR94a9/pfGUI4UKyfB41Azi8nI2dJAEE37W8Zyo4
 QV7Q==
X-Gm-Message-State: AOJu0YyZgFNpVUIL2afuw0auffyHMNstdYcWZOH0VKZs2sGNxrJlu7TZ
 sXZPu8A6g94wyLhzzB5lN3HbSKt697h+0mmOy+vXqIaxwHvt2bXnh4ZsNox/BjU=
X-Gm-Gg: ASbGncvdH5tzVTPdyXcXQL+DW6ZwpJm3Fx2yHZVAxkRpbCA8/Q80QLg4gAwnJDok3gh
 OevRIxUrnfEy7j4kKSR1lp7rb4OsQ+YoZcHCMtNYOUWmiH+oNvyaDldSvbtnfIXjFM3RDC7PrfW
 DgeX4fMk/E4yqMCM1qaFnkLfh1s9nI0sAQSeui1ltAoy36vfgOGyMZxW5fgydDd0JEoRmL0dmO/
 aLMC5OYgg2/yMXsu/io+d7mNUJw/0yfluf3B1Bl3FlPkuLB
X-Google-Smtp-Source: AGHT+IGVb9AVJbgLZf6oo7CR/UM/0zP05m4m7cxzr4ZQnmR8ihuiTVlaXnWyw/vXXHA60mapsdImEQ==
X-Received: by 2002:a05:6000:1ac9:b0:385:f64e:f177 with SMTP id
 ffacd0b85a97d-388e4e1d4f2mr2756907f8f.11.1734533327591; 
 Wed, 18 Dec 2024 06:48:47 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 06:48:46 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Dec 2024 14:48:33 +0000
Subject: [PATCH v4 2/3] dt-bindings: display: Fix BCM2835 HVS bindings for
 BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
added the compatible string for BCM2712, but missed out that
the number of interrupts and clocks changed too, and both need to be
named.

Update to validate clock, interrupts, and their names for the variants.

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
 1 file changed, 70 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..fd25ee5ce301 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -20,11 +20,20 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 3
 
   clocks:
-    maxItems: 1
-    description: Core Clock
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
 
 required:
   - compatible
@@ -33,17 +42,64 @@ required:
 
 additionalProperties: false
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - brcm,bcm2711-hvs
-          - brcm,bcm2712-hvs
-
-then:
-  required:
-    - clocks
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2711-hvs
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Core Clock
+        interrupts:
+          maxItems: 1
+
+      required:
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2712-hvs
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: core
+            - const: disp
+        interrupts:
+          items:
+            - description: Channel 0 End of frame
+            - description: Channel 1 End of frame
+            - description: Channel 2 End of frame
+        interrupt-names:
+          items:
+            - const: ch0-eof
+            - const: ch1-eof
+            - const: ch2-eof
+      required:
+        - clocks
+        - clock-names
+        - interrupt-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2835-hvs
+
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
 
 examples:
   - |

-- 
2.34.1

