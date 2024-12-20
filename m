Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151B09F992D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 19:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8172010F022;
	Fri, 20 Dec 2024 18:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="oR0SzC7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C78B10F00A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 18:11:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso15413145e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734718285; x=1735323085;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9Sl5vZ6DuvY58dxwG3krkGImhGuVFYQY4MkC0DJ9Dic=;
 b=oR0SzC7ZfqnmiJcuBZjyaSb2AJTPCMyj+VCF4buRKtObU/8dkOGib8utbaJXGrFb+j
 vSDAcdgFHk/HB3GGBzKw3QgS6Zf/03ATAsMrnMDiNJ1nblQCKlAUi3bOBomr0gGmTu6Z
 N2K5LznNWNhl0IaVJ+CDT7bMGVoWctHye16dIUkDJWapkDoz/9SJYPaimwRJnMWh0jNY
 b/zVAqC7bF0FLfN2vyJDKtIX0UtjvYoo8W3zrQxHQ8PAdnN1DXYbErVCJthG4fBZNdJo
 XAHZzwPbVKBudHixiS3qJxo5rel5xM1jMYw3l+xGXKhcRZbGRdHAjyFqM7jGE6xdESZj
 Ceag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734718285; x=1735323085;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Sl5vZ6DuvY58dxwG3krkGImhGuVFYQY4MkC0DJ9Dic=;
 b=W1Z3K+ALJwSaZK4uQKUC6Ss7/rbDfjucQ6Q0H2py+QYzm+ljiiG68LqEUvAgz4bMQI
 IJ/+yQHmbORvKw/e8iaImkFn7twf0yZjmYThniZq5N2TwiI4EahO7HI6qCp5YMFQ557y
 DBX/DBkcfQMeShQTz2f19LhZJLK+hjsKu+YZp+QnVgTqNkXUWGf5mfZXigNdy+qK/Jxw
 6y4/nnwI3i2Q7j37ey+SZUIP2IlvNy5iutBunlRSgjhRPj6a+QKY+jIYGMnwDm5ZbbYP
 QGhLEAV/iqVVOxaDTNDjfGhukR4xZCm+N/BQXkl6laeSBqCxTM4Y+9nlNjJbAVxpeVOi
 du5A==
X-Gm-Message-State: AOJu0YxXhHxPOq64tdukAGwX+PUAJF7SY7mGQ8MLKxPkGn1H017kWahj
 OdmJ80aEyEqQ2axdwNj17g7BmkQhh92KJ8LQeKsmgA0wPI4Ca6Geal6ZNeFzMI8=
X-Gm-Gg: ASbGnctLTBZlsXk/rQ3HAqoHJKudTg1Ivwh+V8up+FtKYC3yHaGhtmJ5GJ1BcAVDp6P
 Dd/v4JCqtOq4hRFs8CQUbDUCUbfr0kQfUsduG2ntOMl4DQYrTUa4H6TCv3/pTVP8U+Sz/3MabTM
 SMUnkWMPUeCo7bxfA6v2c2zpKoBAlFJFiqi1h5ERoPwewWPCeZADo8lRTQxk9MOzN9MsCTzzPC6
 AHwqd/gOFUitBjtlRiSk2h7VuW2Ibvy9W9q+pxvnsqy1QcX
X-Google-Smtp-Source: AGHT+IEvTWbavoXhQ6+vfbkOhG8cbDKYZMOKpzg5ZpuFE1J+Gc33Tj3rIi7Es/smHvmbL2/NSCBTrA==
X-Received: by 2002:a05:600c:1912:b0:434:a968:89a3 with SMTP id
 5b1f17b1804b1-436686436f9mr40093445e9.9.1734718284772; 
 Fri, 20 Dec 2024 10:11:24 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4366127c488sm51460075e9.27.2024.12.20.10.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 10:11:24 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 18:11:12 +0000
Subject: [PATCH v5 2/3] dt-bindings: display: Fix brcm,bcm2835-hvs bindings
 for BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dt-bcm2712-fixes-v5-2-cbbf13d2e97a@raspberrypi.com>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
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

The driver commit adding support for BCM2712 [1] also requires that
both interrupts and clocks are named, so the relevant -names
properties are also added to "required" for BCM2712.

Update to validate clock, interrupts, and their names for the BCM2712
variant. (There should be no change in the binding requirements for
the other variants).

[1] Commit 7687a12153d3 ("drm/vc4: hvs: Add support for BCM2712 HVS")

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 88 ++++++++++++++++++----
 1 file changed, 74 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..9aca38a58a16 100644
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
@@ -33,17 +42,68 @@ required:
 
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
+        clock-names: false
+        interrupt-names: false
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
+        clock-names: false
+        interrupt-names: false
 
 examples:
   - |

-- 
2.34.1

