Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423847926E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 18:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B61210E353;
	Fri, 17 Dec 2021 17:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDC910E358
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 17:07:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id o29so2080566wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 09:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rj5IyEdB5LfycbzI0ZIjHtZ0iD/3vI9d8AkqKZ9gT38=;
 b=adHyDt0K5r7da7gXAlO/cl46F93q8YB11ACsGn9ohSPiTWVmEGrZpe0QikzYVTH78z
 aiJDKCfXGbsebmia2ilp44/EOrdOcVWqUfzZHxwaalhR8nLduf9pLfYkaVS3PkuYqAb4
 oRZp8ZyUN9uYyyoXvzOC/Utcs6+1U1zwUplvNZ3kKIq7JcFhAMwhs4ybfLAd9V6WGQe6
 XRRjscRRLnTA+VfxmhwD6p9o2BxVthAR9D6R9/Uq87/Zf/hL4dD7+/00wXk18SPZRGys
 3KCrSGtBCsf/+wOcRwywCcVwr97gT8p/zrGNvfHgQT/E7MNNgwJZuhFntOp9fKMYhtbN
 xJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rj5IyEdB5LfycbzI0ZIjHtZ0iD/3vI9d8AkqKZ9gT38=;
 b=zTQhThrjEHIL3OMYymOcRp34VqNapj6loWX7MibdGqcFFYXyG4nDWAK3dczV4qTq8R
 hRAR0mOciPbKFIf/z4ebBzIV+s/JEEfdpcNrOc8VegwF87Pxs9+3XHn3Ui6uudp+VGN6
 ypIyr1wzPjfdqzgYTviljZElwFQv0c5ouwFpGl3/i5OKDnjBmFfFj64IZupAWkr01JUp
 ofVdutBy663Diq2L8IaLYaHJWTJNiKIJYnsUg9jGDsT2OToU6AvaJBGLweFbJH9PWJnc
 awgrVbP2AzfD56S61pjRx/B1SgojVHTMZOQ+LSp2XDhlbkbIqyVQ37GMYGokkV7y1ves
 vz1g==
X-Gm-Message-State: AOAM532ObdMyMqGdNOD3LoieE5gmAeBnVagPwf/rC5n68Wub4QOPKXBn
 gf+uYP3rktZeGPPP1elGj7s=
X-Google-Smtp-Source: ABdhPJwmvDx62eDbmIAfL5AeTax+2/vdjtBv/diBvtkgm60FDAly3+dkMrD9dNIXOBOkgVaXBkjQbg==
X-Received: by 2002:a1c:8015:: with SMTP id b21mr10219610wmd.161.1639760837868; 
 Fri, 17 Dec 2021 09:07:17 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id l8sm11940149wmc.40.2021.12.17.09.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:07:16 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: leds: Document rfkill* trigger
Date: Fri, 17 Dec 2021 18:07:14 +0100
Message-Id: <20211217170715.2893923-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Milo Kim <milo.kim@ti.com>, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

LEDs can use rfkill events as a trigger source, so document these in the
device tree bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/leds/common.yaml        | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 697102707703..f686907b4907 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -79,24 +79,25 @@ properties:
       the LED.
     $ref: /schemas/types.yaml#/definitions/string
 
-    enum:
+    oneOf:
         # LED will act as a back-light, controlled by the framebuffer system
-      - backlight
+      - const: backlight
         # LED will turn on (but for leds-gpio see "default-state" property in
         # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
-      - default-on
+      - const: default-on
         # LED "double" flashes at a load average based rate
-      - heartbeat
+      - const: heartbeat
         # LED indicates disk activity
-      - disk-activity
+      - const: disk-activity
         # LED indicates IDE disk activity (deprecated), in new implementations
         # use "disk-activity"
-      - ide-disk
+      - const: ide-disk
         # LED flashes at a fixed, configurable rate
-      - timer
+      - const: timer
         # LED alters the brightness for the specified duration with one software
         # timer (requires "led-pattern" property)
-      - pattern
+      - const: pattern
+      - pattern: "^rfkill[0-9]+$"
 
   led-pattern:
     description: |
-- 
2.34.1

