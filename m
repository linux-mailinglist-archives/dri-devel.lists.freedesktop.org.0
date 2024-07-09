Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08092BBBF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C861410E561;
	Tue,  9 Jul 2024 13:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vCb/viZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3578510E55F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:48:42 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1faad2f1967so42253715ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720532922; x=1721137722; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=d1cg3oGj3xn4CjG29iqKzWVPtEDspEWgovxGLFjyf9Y=;
 b=vCb/viZbwbfzToJAuwy5gQ4YgA460ogQKcNanjgEHPfUwivsy71hzwI24uE5M5y2yv
 CGh0h09YMBzsAGr1sHkGtazGD3ImRKuW6TrhK/2fjNXgYmCZ2fu7WxsKt91BkmC9hait
 KLwHBDDYNjR86ayDPOBw02TYivrr2hr9rJRb/ZfUkhQ6NOjcgt3qRehRrKdF+2fFIWp9
 yss1Wi2mLqjrdepkZnLDBCcPPH/RNrzZygJdbzM7sa36LvQ6uaMgSnKOdWkvBop/x9/T
 shHf9/EjbJlxiDscskkZIgbHQ+htn/kL8gmkLvYuMNApUUtJ+C0NnVyk/COIf2EI6wgr
 w1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532922; x=1721137722;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d1cg3oGj3xn4CjG29iqKzWVPtEDspEWgovxGLFjyf9Y=;
 b=VMulIy4RJO/zcW5Y1V/gF0OZ1KL+yBNQyrisVOYai9oLy/7mhsWB76PVOXovsAz+eH
 DjeMkfCgU9Aen7+X4aEN2BMfIVSJYTTOUjaGL0o7u6rJ3cygsnmnRkQe8jF6Jy4n2UKi
 Ie7lCblaTJ0n0NHDUeLgvuXUbLlw6lU67E6JgU3Ah/Y0MJMfWDCo8DXLJxnjFlNdu+fZ
 cEaHzUAIwX9wp7J6QYnyk7P1/LVygiRyeTEsh5PcL4pwkae+eP1ek2vMXpPtE3vQRZeP
 Wsjt/xPa6H/XUyQ2gi+bjsEmc2fFpYR2Z3AqcKwOAUv1e3YM0dJ1JcHt0gSgAz8BybcW
 LpQA==
X-Gm-Message-State: AOJu0YzWd+U7SkoAvnvDnHvhQWo5OREh1jekmM1MbOTjYvMXWKPi2eHN
 nF74wdeF3pZ4u6mFgJqZ5oxiNsPn8TXdj3t+1wRvJNVemjveAMXdX05hnhGOOyk=
X-Google-Smtp-Source: AGHT+IGLfknG2M8X0lovKsSP0vKbezDHgILVPXhoA81XpBuj5dwR7qFpbLQUQaFiZglTuwKGg6Rz4Q==
X-Received: by 2002:a17:902:d2c1:b0:1fb:7530:61c6 with SMTP id
 d9443c01a7336-1fbb7f7a9f7mr41595795ad.2.1720532921676; 
 Tue, 09 Jul 2024 06:48:41 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab6b9fsm16211685ad.138.2024.07.09.06.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:48:41 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@google.com, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v6 4/5] dt-bindings: display: panel: Add compatible for
 starry-er88577
Date: Tue,  9 Jul 2024 21:47:53 +0800
Message-Id: <20240709134754.28013-5-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The starry-er88577 is a 10.1" WXGA TFT-LCD panel, and the init_code
of the starry-er88577 panel is very similar to the boe-th101mb31ig002
panel, so We will add a new configuration based on
"boe,th101mb31ig002-28a.yaml".

Because the panel used reset gpio before but did not add the definition
of "reset gpio" in binding, reset gpio was added in binding, but since 
the starry-er88577 panel did not use "reset gpio", a judgment was added 
here.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes between V6 and V5:
-  1. Modify the commit information.
-  2. Modify "reset gpio" binding.

v4: https://lore.kernel.org/all/20240704072958.27876-5-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V5 and V4:
-  1. We are compatible with starry-er88577 panels in the boe-th101mb31ig002
-     driver, so add it to the "boe,th101mb31ig002-28a.yaml".

v4: https://lore.kernel.org/all/20240620115245.31540-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
-  1. Move positions to keep the list sorted.

v3: https://lore.kernel.org/all/20240614145609.25432-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
-  1. Separate the Starry bindings from kingdisplay, and add it to panel-simple-dsi.yaml

v2: https://lore.kernel.org/all/20240601084528.22502-4-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  1. Add compatible for Starry er88577 in Kingdisplay kd101ne3 dt-bindings.
---
 .../display/panel/boe,th101mb31ig002-28a.yaml | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml b/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
index 32df26cbfeed..c5efc560ba1c 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
@@ -9,18 +9,18 @@ title: BOE TH101MB31IG002-28A WXGA DSI Display Panel
 maintainers:
   - Manuel Traut <manut@mecka.net>
 
-allOf:
-  - $ref: panel-common.yaml#
-
 properties:
   compatible:
     enum:
         # BOE TH101MB31IG002-28A 10.1" WXGA TFT LCD panel
       - boe,th101mb31ig002-28a
+        # The Starry-er88577 is a 10.1" WXGA TFT-LCD panel
+      - starry,er88577
 
   reg: true
   backlight: true
   enable-gpios: true
+  reset-gpios: true
   power-supply: true
   port: true
   rotation: true
@@ -31,6 +31,20 @@ required:
   - enable-gpios
   - power-supply
 
+allOf:
+  - $ref: panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          # The Starry-er88577 is a 10.1" WXGA TFT-LCD panel
+          const: starry,er88577
+    then:
+      properties:
+        reset-gpios: false
+    else:
+      required:
+        - reset-gpios
+
 additionalProperties: false
 
 examples:
@@ -45,6 +59,7 @@ examples:
             reg = <0>;
             backlight = <&backlight_lcd0>;
             enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 55 GPIO_ACTIVE_LOW>;
             rotation = <90>;
             power-supply = <&vcc_3v3>;
             port {
-- 
2.17.1

