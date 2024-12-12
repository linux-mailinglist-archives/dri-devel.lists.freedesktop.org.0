Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71B9EFB18
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20FF10E642;
	Thu, 12 Dec 2024 18:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="FXwt/MsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D685F10E642
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 18:36:42 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so4174335e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734028601; x=1734633401;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Sw6ds3OYrX9qZTskII5utnH0CDhwWN9CZmERg/3tjRI=;
 b=FXwt/MsYk/Xo9BwVHyUoyCH7wSti1xqy5hvpkgAvT28/4iegFOFIQG453eXSIeNzSo
 bTR0ZH661Ulsak6X3ypo10x358qRhCwcF8GMogYlo759anxq0RHUlWAY2UFFs4YR1tJQ
 RpC2rDBvkqoWNAiQBg9u4CnqW5trzOFMWE+tiy3pArC57OQgneZnCmcwcuJyMwwUDFD6
 M6s5FyRAtAQAmAWPdi5K84M8JD691e2Xlb8gWqJfj0HJGmX++edIIVXeMw8F4OGhbJnS
 euKgTc/EZ2W1UulFB6SphPYu2/ey98wcOFqKqZZiMCXwEzPudlp1BDGJvRwz5BE9d1jU
 GjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734028601; x=1734633401;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sw6ds3OYrX9qZTskII5utnH0CDhwWN9CZmERg/3tjRI=;
 b=cePdQfM2Np0eZHw5y9LENqFGfryUU9CM9tCChBuvNWTfU0DTJB1NCZJfSXSYFOU/EP
 zPdp4bOWdUCkUHDPEvvm+Gjz0E98hfBWzIZKEanN1QvG9w5hGC7H1lhPpYBfrEPAeEyn
 w+r/gHzPPG6LGE/dT46rj7dEr+cViLcYdJe09f4ZrY6HLAAQ2rtRaL+1mJmfd3rFyxZ3
 j5KvnQUdDceYDV7IQmF7e6/5NahCDd7fjpCn7lSD3OfsgsGG4cY1oH3bvq7kezMZF3Gg
 al0kdtAFC8ze9G8mn5wfYeTUkfATi+Lry1rzx79tFuJf7bV6XL1j3JCUZqKmGj8WIAke
 hXMA==
X-Gm-Message-State: AOJu0YzyLMW5kXlsD2oHYIVRieDCVIjhcM4Yi9v3x4CmZbc2DG0fYLNk
 t93LP4z/FKpeet5XaJ/JrQCSKwe9xse11KjYyXi9nWcn/WGIQvD79wAhlerSz68=
X-Gm-Gg: ASbGncvolCec2H0WJj28FzZPV34+f32yWmmgyiNPlOdFcO6fVFqNIi2zquLR6OlsOWd
 dnAB7TTlYuLMX9d60XW3amiiBGxHiCAWQb269ZumwOdJ+5wiVtIW5/nLSu4d91e1P9VwkBOsHQD
 lzqvLIsJbXQDexuIZ/fmNY+Wqp/kZExJA8xxKGJ7xdt1VjyVUgpqlrbJ37/6iwYJBQHd55caoLB
 eh59D+gEE1JMqIUUla2UknK28g06if1Hp7tl7Nex7ucA3MC
X-Google-Smtp-Source: AGHT+IGgVpkk1QUs/pq3VjaphhAJz/7+ivfj+5RpPlXI4jycscQ8dQXMYYBv4ChFADcllhzmrrBmNA==
X-Received: by 2002:a05:600c:3b13:b0:434:effb:9f8a with SMTP id
 5b1f17b1804b1-4362284264bmr44025395e9.15.1734028601307; 
 Thu, 12 Dec 2024 10:36:41 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 10:36:40 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:28 +0000
Subject: [PATCH v3 1/7] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-1-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
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
 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 107 ++++++++++++++++++---
 1 file changed, 93 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 6d11f5955b51..dd7dea60183b 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -56,22 +56,38 @@ properties:
       - const: cec
 
   interrupts:
-    items:
-      - description: CEC TX interrupt
-      - description: CEC RX interrupt
-      - description: CEC stuck at low interrupt
-      - description: Wake-up interrupt
-      - description: Hotplug connected interrupt
-      - description: Hotplug removed interrupt
+    oneOf:
+      - items:
+          - description: CEC TX interrupt
+          - description: CEC RX interrupt
+          - description: CEC stuck at low interrupt
+          - description: Wake-up interrupt
+          - description: Hotplug connected interrupt
+          - description: Hotplug removed interrupt
+
+      - items:
+          - description: CEC TX interrupt
+          - description: CEC RX interrupt
+          - description: CEC stuck at low interrupt
+          - description: Hotplug connected interrupt
+          - description: Hotplug removed interrupt
 
   interrupt-names:
-    items:
-      - const: cec-tx
-      - const: cec-rx
-      - const: cec-low
-      - const: wakeup
-      - const: hpd-connected
-      - const: hpd-removed
+    oneOf:
+      - items:
+          - const: cec-tx
+          - const: cec-rx
+          - const: cec-low
+          - const: wakeup
+          - const: hpd-connected
+          - const: hpd-removed
+
+      - items:
+          - const: cec-tx
+          - const: cec-rx
+          - const: cec-low
+          - const: hpd-connected
+          - const: hpd-removed
 
   ddc:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -112,6 +128,66 @@ required:
 
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
@@ -136,6 +212,9 @@ examples:
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

