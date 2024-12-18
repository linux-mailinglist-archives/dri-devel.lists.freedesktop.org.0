Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBA69F68F1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE39210EBC7;
	Wed, 18 Dec 2024 14:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Vq8X2OQt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF1610EBC9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:48:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso5783245e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 06:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734533326; x=1735138126;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0HhuvChnZxHEKbDR0wzjSlhppXuk6dBcqGjZkLEJAX4=;
 b=Vq8X2OQtA+7wd8d/mu+2WQjcMVoEfKrQyOcRcJjPy11FtazVc0KrjZg7XHMoxLqSga
 b7+iuOfVTaI0cg2UaTpAGdHpTMduZQcq2sx+bkUlUZFEnzSbzJHBLqQoixlZY/UXe8ya
 OXCRDc/6XQcEMi14ZUjcXkdjb0cugJaxJuo7xvpZ+mQYTbF+Ood6kUw3+O10X5slw82l
 G7nl0xadFCUzxwFhoWTwolUYOc2+uwsx2z6pD7F9+2bKbAiAjuuEoS+5A4ofgmSxahmi
 AKmV91E4W4f5ksJqFG+pqP/wfQ/D1eYW7nlS+ueIomA6pZ/C0LdHkhDguX/GGkZfcJds
 2JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734533326; x=1735138126;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0HhuvChnZxHEKbDR0wzjSlhppXuk6dBcqGjZkLEJAX4=;
 b=rA6SvkNQ8YLqIC8ZWsIdzQAPbZeqgaeoJmosl2+TYt3e02drTKO5R+Iv3o6eFb7uqS
 VuvoxAYy4Fq58UW2Bl7EzryPmmBcG3HH1TZYpvlNJVmLtu/2/Y91KxNpfF8nOW4J5e4/
 4Gq7GZgrxlYzLpbYNke009brzPgL3GMbBW7TLWUZ1mTBThWOH+gOG4pqWaL8kC1ce6yO
 fA98EOraaEOJK/VPWaqraFruBIUtdL3YL9aBI8PA1KRdeVbfTl5zg5yIqOVBkJXsbyb1
 le6eR0SS3mmwbNQ9pdm313DyyEP8afgATXFfenS43cW8VtgssOs4nkv3JgBXgILx9Yn9
 fbMA==
X-Gm-Message-State: AOJu0YxuI2/PpfSsJNA0ZjpuOdxvRTWqapHJemZpP+7BDDHt0JcKWZaw
 9XipH5H502alYjYJl65XgXuhLPtRTIYA3MNNMA7vjmCFsxzaPIg6p2qGlMA3saebeX3wZmHHeDK
 d
X-Gm-Gg: ASbGncs8JDpC+Iuw/B+8PgaluFV+MaK5g0AQ6ULQn7iLHZZgFuFGfPwT477f2uVqBBl
 TnERTddjpCkcxcLAX65vNmeluy5kAWsCufHYx6hehU2rIe4kli1sqOdjAiqzLXbzOKRInFdHqyo
 +UpDwca5HI+ktuwnsrM2IAaRmPoOmpt2ONkzMJC2MIye0USE2yoGfklYJdqA2wD846cyBquppYp
 Q6sJsMnbizwMCWcE+WFesOYZvxSb4ZmX9Ib+vKcPkQM2F4l
X-Google-Smtp-Source: AGHT+IHW10MOxS28loaYz58hcigl3Ail1h5qTPK70DcVM/fvNy/4Wh1EKi45+y5z3iUCnn9N7rshPw==
X-Received: by 2002:a05:600c:35cb:b0:434:fa73:a906 with SMTP id
 5b1f17b1804b1-436553052fbmr27423205e9.4.1734533326478; 
 Wed, 18 Dec 2024 06:48:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 06:48:46 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Dec 2024 14:48:32 +0000
Subject: [PATCH v4 1/3] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dt-bcm2712-fixes-v4-1-54cc88b6c229@raspberrypi.com>
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

Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
added the compatible strings for BCM2712, but missed out that the
number of interrupts changed.

Update the schema to include the interrupt requirements.

Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 81 ++++++++++++++++++----
 1 file changed, 67 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 6d11f5955b51..83c058728ef1 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -56,22 +56,12 @@ properties:
       - const: cec
 
   interrupts:
-    items:
-      - description: CEC TX interrupt
-      - description: CEC RX interrupt
-      - description: CEC stuck at low interrupt
-      - description: Wake-up interrupt
-      - description: Hotplug connected interrupt
-      - description: Hotplug removed interrupt
+    minItems: 5
+    maxItems: 6
 
   interrupt-names:
-    items:
-      - const: cec-tx
-      - const: cec-rx
-      - const: cec-low
-      - const: wakeup
-      - const: hpd-connected
-      - const: hpd-removed
+    minItems: 5
+    maxItems: 6
 
   ddc:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -112,6 +102,66 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm2711-hdmi0
+              - brcm,bcm2711-hdmi1
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: CEC TX interrupt
+            - description: CEC RX interrupt
+            - description: CEC stuck at low interrupt
+            - description: Wake-up interrupt
+            - description: Hotplug connected interrupt
+            - description: Hotplug removed interrupt
+        interrupt-names:
+          items:
+            - const: cec-tx
+            - const: cec-rx
+            - const: cec-low
+            - const: wakeup
+            - const: hpd-connected
+            - const: hpd-removed
+
+
+      required:
+        - interrupts
+        - interrupt-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm2712-hdmi0
+              - brcm,bcm2712-hdmi1
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: CEC TX interrupt
+            - description: CEC RX interrupt
+            - description: CEC stuck at low interrupt
+            - description: Hotplug connected interrupt
+            - description: Hotplug removed interrupt
+        interrupts-names:
+          items:
+            - const: cec-tx
+            - const: cec-rx
+            - const: cec-low
+            - const: hpd-connected
+            - const: hpd-removed
+
+      required:
+        - interrupts
+        - interrupt-names
+
 examples:
   - |
     hdmi0: hdmi@7ef00700 {
@@ -136,6 +186,9 @@ examples:
                     "hd";
         clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
         clock-names = "hdmi", "bvb", "audio", "cec";
+        interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
+        interrupt-names = "cec-tx", "cec-rx", "cec-low", "wakeup",
+                "hpd-connected", "hpd-removed";
         resets = <&dvp 0>;
         ddc = <&ddc0>;
     };

-- 
2.34.1

