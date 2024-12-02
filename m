Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB359E0509
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFB910E767;
	Mon,  2 Dec 2024 14:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cAU0YddG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFF610E76A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:32:18 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so1545244f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1733149937; x=1733754737;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7AFVILEGG6inA8zYmU/doFUBGD/IkzUATf3B1mIzQMQ=;
 b=cAU0YddG/4tbVMui0SZmA78Bz6aDGsca5P1BB7NnL3jbnt2vUbc8/55CNv1JUgkw6h
 wrv3VC9nTMCsedLtSQMaJrKTwlPqtg25jlEaZOLxtYwI2irHEIBVZolwuQ5DGrQBdH+z
 R8F39MCSNlI/yqjhq1W49qHgsaCnsGM8fZppAJkAx8zCaStoRbgaPtr1sQwYXDpCwOM9
 RDVzQR0ivgLQ2HX0mzQYhm/V4UMFCIEgspAxGTMLR+mYv0j2Xo/o5NBGmR9Z/2Nqi6JB
 dWXudhQWz4xg/D2QVDhEh1VDuVssLsEfePa5piy+LxQpv+ZOxn8yNkU7HnZZJ4Yf2/Lw
 wjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149937; x=1733754737;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7AFVILEGG6inA8zYmU/doFUBGD/IkzUATf3B1mIzQMQ=;
 b=PRb7CIKxo2lv16W8Mu38mEu6QzJvgbDutCXXOUEoI/K75CBJAZ242VW2rCQvurirrC
 TD4MRfhYBj4AGEDdngn84mHZQ72GZj7Dzt9dCQ5uCoqV27uL0/qV7vqQ6NMYFZ5Nw6IW
 zp0IaqzVt1p6QrHu2z6QdQ42j3qcsrZ7to43FB3CUAhQMCZh4f9XPdC4ZZtxZL7L+W4z
 fNkQ1fyfXEMyefwli8gBz8Vjmj7vzTTNgUD3HJW+FY3EcCIlykv0+gsxUwJcmuttlXbw
 ixdJEx2javvkTHBOhiH5g6J3I6gpK7J+VyLlR9c6voWTwwXocGDChA4X5Wj04ySFPmL1
 vetw==
X-Gm-Message-State: AOJu0Ywth2vM2+JHsBFSeYQQ28xvT2xYlEX/z0TrB8C3IyMQja8RxLi2
 f21N7jslDPGE1Ggyqly5I3MYO9S7rw+5aZ9F2T365TP9lcQ0oTLJYSr/mxOJl5w=
X-Gm-Gg: ASbGnculnChd26Rcxhj4StMVGH7kLYmGjHTDBLLiuu0LgQ79cO77YifwdQq5NEhFgSE
 y+e0BgyWVOdTGhu0ciKjiitQWLKOXc1eRGwHcC8OPY+PcDAuOYrv+Z/tZixETDJkqyuHKsO35Mt
 5Ya1k44h30GBKUSYoYSrJFxBrj1cniSLQik+gD6gCctHNHz3dkWJEn7a2V5Jw+5qpNqsD26obaw
 TQmnQ4W82eDHINb70H8oXHWRUEpHEB/QojLp5s0Vg==
X-Google-Smtp-Source: AGHT+IEh8wUvPPp6fmiu8qi70G2dLIyR2cy0B8DQH6XpxZjumKSN1WVLLU9bXrhtMfH6hCylA9amQQ==
X-Received: by 2002:a05:6000:4024:b0:385:e4a7:df07 with SMTP id
 ffacd0b85a97d-385e4a7e08dmr6305010f8f.42.1733149937090; 
 Mon, 02 Dec 2024 06:32:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 06:32:16 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:55 +0000
Subject: [PATCH 2/7] dtbindings: display: Fix BCM2835 HVS bindings for BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-2-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
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
 Bartosz Golaszewski <brgl@bgdev.pl>
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

The previous patch adding the compatible string missed out that
the number of interrupts and clocks changed with BCM2712 too.

Update to validate clock and interrupts for the variants.

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 77 +++++++++++++++++-----
 1 file changed, 61 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..ab59edbcf32c 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -19,12 +19,13 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    maxItems: 1
+  interrupts: true
 
-  clocks:
-    maxItems: 1
-    description: Core Clock
+  interrupt-names: true
+
+  clocks: true
+
+  clock-names: true
 
 required:
   - compatible
@@ -33,17 +34,61 @@ required:
 
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

