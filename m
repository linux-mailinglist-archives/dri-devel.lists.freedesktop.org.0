Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832299EEFA1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A564510EE2C;
	Thu, 12 Dec 2024 16:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bdMCrBJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E3010EE28
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 16:19:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso5766505e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734020345; x=1734625145;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZmY4nSeOHfUAeSRoOGUYAdGnJvM3BDuelhiAae/7ZWg=;
 b=bdMCrBJI2YhEFzuAs6jhoQqT76txfyyrFxyci5LQCYZgBukIaFlxxC8GV64ngsiFYs
 oVwAD/di+CQcNCU+qo/loXFkw6zDz1MLHfbE56TRHf36DPmv1i62z22zYvSDmQg6h6KH
 G4Y+tJk+aSFZcg1uwrkVFxBOYqdECTl1NkALxDK+5NM2We/m6g20zBbm4lcLymNCEG4m
 O+n0ivJzz0V7BNjDMVK0ayP0Tq6QvpijMa8+duVQP4N9H2m+eJGfhji0LL6TYX8I9gm/
 mhELmrlMUaSb1mDi0+DFY4tfjS3TqE62JG5zfepE29vv0HQ/MCCmaMSyNIzjHXJS9CBQ
 oYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734020345; x=1734625145;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmY4nSeOHfUAeSRoOGUYAdGnJvM3BDuelhiAae/7ZWg=;
 b=TCDN/VWHwNBiU8RSJWLX+0vrl/azsosuiUcTbkynjuRqlD/UXCGf+LCQPnUwlgq6n2
 sCVG48pHoKf4SZECSMkmcLrKPl0D0h6eeonQVLAohOq5NYpKXZWsosy32qv2cRmpCBIm
 eJkW6SI7Otqnr8r87wtZrJvhtboJP9/k0RsvS46aQIJMBpjKTCpve5q590/nqmGSR5Gg
 mwSPhXcJV0BOC1t7QCpFTV2i+wGxlTHooVatBQlk+pf7BOwkP8+utwFtq8SmcGP9VeSr
 ftB6n2raJjU2rgFsT+h/Ayk1NtLwMasb3fnRJhpFpnDssyo9w6ueCsiICNsbjsqXSJyj
 6Q+A==
X-Gm-Message-State: AOJu0Ywu0z6FaPAldkjklFoNT3zmuYWcoiGLo8K8vP0V7o2UkVnfHZYt
 uQj3RysdbP4CecpNQfwCmy+5V5bT83yymxnm5yKuw2scZ/8wzLl2k7Fzz3qfbMM=
X-Gm-Gg: ASbGncsAVpFs59OkTv1zmbZyk9pX4ZlQhk8cPU4IWNeYQt4GDTxS7QV7dFqo9PCTfy8
 YmS4ZfmABEUZpzAA08u7aXJYhhl6y0qggMVuOjes/EBeCGfdW2bfWCs6lhlGng2eoMl1Z+n4GH+
 /sHFem+dNfVYXWGTa3p2/b9Ogsw5nXtkkfd6kEfpG+y7UrcV1fk46CI6BchzpeJrLVIrhaZjzFm
 8D0OlL60b5Y1bsVQKp44jO7wyE/AljP7chmV/tGJGibTXdy
X-Google-Smtp-Source: AGHT+IGaFVqNcAbsh2wXwykvgIG8wIvYr5xOyoWGcWi8bclbVOgLkhFW5BR0LdTPsNVGk8Tlgv5MLQ==
X-Received: by 2002:a05:600c:b86:b0:434:f2f4:4c07 with SMTP id
 5b1f17b1804b1-4361c373f5fmr66829415e9.15.1734020345541; 
 Thu, 12 Dec 2024 08:19:05 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 08:19:04 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:52 +0000
Subject: [PATCH v2 2/7] dt-bindings: display: Fix BCM2835 HVS bindings for
 BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-2-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
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
the number of interrupts and clocks changed too.

Update to validate clock and interrupts for the variants.

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 83 ++++++++++++++++++----
 1 file changed, 69 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..36bf8eec88a6 100644
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
@@ -33,17 +42,63 @@ required:
 
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

