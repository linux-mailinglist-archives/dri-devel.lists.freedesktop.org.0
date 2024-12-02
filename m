Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7A69E0507
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBEE10E76A;
	Mon,  2 Dec 2024 14:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aP8y/Z1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBED10E76A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:32:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-434ab114753so36080715e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1733149936; x=1733754736;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iOx9NaY1qX5HDoI2TYyztMEaA2o1c52TzC8u++gvhCQ=;
 b=aP8y/Z1mqV6CCHavEZN7UbFRmMBGo1KcI5/Jkz0axTHJW1mZPGB9MvEhuYQytbhjEL
 /ocLMJh8Gxj/rZW2amI2toOkf2hi66cipxBGYBOBhm2RZG6fiuvTc6ia9wQgbd7MTVjZ
 nD7i7gcSvMSWuBk5e5q+JkncAS0XzCG6/00+JaN2anA0GNBRc+bYHKhJc9PnKPChYUUB
 XaZgpGhyJCWDuKWFwi0yX9Hps3jFYqdXHB81uk1I9Kob61UidNAl0jszQ1yJpom9CEic
 GtEgBzOB16w9hq6FF7c96xwKcXkByOmhbyIOkwRI7pw/7Tw28ASJXSMKrUB7OesHOvzi
 r5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149936; x=1733754736;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iOx9NaY1qX5HDoI2TYyztMEaA2o1c52TzC8u++gvhCQ=;
 b=p0D6TcHNMXLBjuNV9H+lDRxhmq+XBw51G2IB7CeBOyaNAfO8Ctk2pvXEOp+/fjWK6N
 ZQvfm321/NQSiQH34lhhLIuSOPORRPFc9ydkn4Z9gZnmpabGgimGILEkST6v2l1CFYpn
 uh5v+51vnPuq7kDrjQuWGC9sC4GSeZIMTSFRHaBidXQdaQ5rePjO/X1f6OmIiT82O5Kw
 VVtQMyAZrJP/lA+3Iq7UvESqUzFXQU5Tsg9vHLvKDJHlMzC/pqVbPx65Fl5VoSgC2usx
 iy+HOn6Ce9rF8KJmBsDuDbhUAD9lt3YkMz8r4qlBY4lQMneHWfqdFOpmLoP6+gZ32ctn
 eI0A==
X-Gm-Message-State: AOJu0YxpkrbFgYFLuRCvUnXpBEFZKKZtHKDcpyg+9oW6PHT81djbN9gD
 NMQBbp1p5UmALd0rDGoo5yl2O9vRJ19i+NUwwAjs6Q3LCg0PNRPyMIfO3/995VM=
X-Gm-Gg: ASbGncsnYyGpnRmGZ05PiSHVLpdFXFGzJLptjF3PP9rGX6iVPYwEn1b5Kpds5+h4AmH
 k9k9U+8GQg54GfqgSOuRTLzJBzvjiAyVRiv/8NjWJWliPkeZrk0VxPlh0FfdbRyD6FQFam08vjL
 iwzE/qQYhCQohy+o1wn7uJOEeMewDrExsP4eoiv14GZyB1mye/7npMy7uMr1qiKs0caEc9xur2s
 0u0R+ivuRhRDmtJIPp6TJwxje5hFvmEXTB1om9v4A==
X-Google-Smtp-Source: AGHT+IGWILDCH0oN5IIP6AmBZHCVw8v8xYQoGIqxbhQefLB2luB62aEimC6i2AGfGXR0N+C6cAzdpg==
X-Received: by 2002:a5d:6c6d:0:b0:385:e8aa:2a4e with SMTP id
 ffacd0b85a97d-385e8aa2c01mr5694103f8f.31.1733149936076; 
 Mon, 02 Dec 2024 06:32:16 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 06:32:15 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:54 +0000
Subject: [PATCH 1/7] dtbindings: display: bcm2711-hdmi: Correct bindings
 for 2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com>
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

The previous patch just adding the compatible missed out that the
number of interrupts changed

Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 44 +++++++++++++++-------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 6d11f5955b51..6af342c9b6b8 100644
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
+        - description: CEC TX interrupt
+        - description: CEC RX interrupt
+        - description: CEC stuck at low interrupt
+        - description: Wake-up interrupt
+        - description: Hotplug connected interrupt
+        - description: Hotplug removed interrupt
+
+      - items:
+        - description: CEC TX interrupt
+        - description: CEC RX interrupt
+        - description: CEC stuck at low interrupt
+        - description: Hotplug connected interrupt
+        - description: Hotplug removed interrupt
 
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
+        - const: cec-tx
+        - const: cec-rx
+        - const: cec-low
+        - const: wakeup
+        - const: hpd-connected
+        - const: hpd-removed
+
+      - items:
+        - const: cec-tx
+        - const: cec-rx
+        - const: cec-low
+        - const: hpd-connected
+        - const: hpd-removed
 
   ddc:
     $ref: /schemas/types.yaml#/definitions/phandle

-- 
2.34.1

