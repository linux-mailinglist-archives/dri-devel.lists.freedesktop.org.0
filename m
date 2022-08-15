Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359AF5933E9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 19:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539AEB9894;
	Mon, 15 Aug 2022 17:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDBF99F21;
 Mon, 15 Aug 2022 10:39:43 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id dc19so12815549ejb.12;
 Mon, 15 Aug 2022 03:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=y47fphay88YhgkrxJS087JAv9jYshLngojVyHSZW0rk=;
 b=dtLylneQ3SUwELJtGcnR7eZkBFJWSD1a1NX51iB5jMlk/uGRTvLrJBFrhnxhrIr97u
 JwTA2j0T3AF+wh3jTQanm4s9Pu7j0+IVpqSUjKJNjY7WF6uBlcd9AHdhC6jjbnDp/fgg
 lOJnZMtyp4DGGBM/h3f12aEsE/1Vh8E1hWFC1KEv3YoNet8aomm9WaxSFm0gwwckjr9O
 fzxjKgYVcAkO+d0cYMKJwO4H4If9OrKjhQjyZdveVwhRo6wqzl6VjC4/JnKFZNHv4Kip
 aNjNDTIXA4Gbc24Z0d0oDhmRfhPRMxzbpiWypEqsxJRebERoFwrogpUnqwJhEaVUveyS
 BXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=y47fphay88YhgkrxJS087JAv9jYshLngojVyHSZW0rk=;
 b=uzrQ0qY6v3u+7gd+jVFSnlTrs1ZxLDxfZJNuFl+hck+W1jIx8IXwW+mW+sjGiGkuC/
 5dO2oYjVhkTlH/FbsMPn+dK8QzXOQaokImXmQLFWMvY1QOXLoKok2BTTldehTBaBbAq4
 0VRWx8e9/fP1x17C/aBuE8UZx0HQlsywEh6rxVtlK4rqJ7vjd68pVH+DSAjmZobMVNDx
 6h0OSR3/y7G1FrFLtzk6nw3q6FDjKY0SMOl8Gz61vOifopGTbFmlQ2ZkPEty3GLZdKLj
 vu9c4uWPGiUenHPE28e1F4POItzamFk2RStah7u41zwJXhimH97BpQqL41VkkNllk3BU
 P5Pw==
X-Gm-Message-State: ACgBeo2mYvQ1yZH4gYqzeCZz8IWpSwQRFOHD19SLmGbPfcjZErvOUuYX
 nXb+ylRYuL55r37oZqCZ64I=
X-Google-Smtp-Source: AA6agR7qtuf+I3tONYtQqyagI1LQhsHIYULX6gFA76EjOjrjlo8JkyuxpF2cJ3s+FAzjjY6LHV/gZg==
X-Received: by 2002:a17:907:6930:b0:733:8eb3:83a3 with SMTP id
 rb48-20020a170907693000b007338eb383a3mr10419170ejc.32.1660559981517; 
 Mon, 15 Aug 2022 03:39:41 -0700 (PDT)
Received: from localhost.localdomain (5-13-160-72.residential.rdsnet.ro.
 [5.13.160.72]) by smtp.gmail.com with ESMTPSA id
 lb1-20020a170907784100b0073851453444sm1217479ejc.60.2022.08.15.03.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 03:39:41 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/hwmon: use simplified HWMON_CHANNEL_INFO macro
Date: Mon, 15 Aug 2022 13:40:28 +0300
Message-Id: <20220815104028.381271-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Aug 2022 17:12:57 +0000
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
Cc: nouveau@lists.freedesktop.org, Beniamin Sandu <beniaminsandu@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes the code look cleaner and easier to read.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 85 +++++--------------------
 1 file changed, 17 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 1c3104d20571..a7db7c31064b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -211,75 +211,24 @@ static const struct attribute_group temp1_auto_point_sensor_group = {
 
 #define N_ATTR_GROUPS   3
 
-static const u32 nouveau_config_chip[] = {
-	HWMON_C_UPDATE_INTERVAL,
-	0
-};
-
-static const u32 nouveau_config_in[] = {
-	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_LABEL,
-	0
-};
-
-static const u32 nouveau_config_temp[] = {
-	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
-	HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_EMERGENCY |
-	HWMON_T_EMERGENCY_HYST,
-	0
-};
-
-static const u32 nouveau_config_fan[] = {
-	HWMON_F_INPUT,
-	0
-};
-
-static const u32 nouveau_config_pwm[] = {
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	0
-};
-
-static const u32 nouveau_config_power[] = {
-	HWMON_P_INPUT | HWMON_P_CAP_MAX | HWMON_P_CRIT,
-	0
-};
-
-static const struct hwmon_channel_info nouveau_chip = {
-	.type = hwmon_chip,
-	.config = nouveau_config_chip,
-};
-
-static const struct hwmon_channel_info nouveau_temp = {
-	.type = hwmon_temp,
-	.config = nouveau_config_temp,
-};
-
-static const struct hwmon_channel_info nouveau_fan = {
-	.type = hwmon_fan,
-	.config = nouveau_config_fan,
-};
-
-static const struct hwmon_channel_info nouveau_in = {
-	.type = hwmon_in,
-	.config = nouveau_config_in,
-};
-
-static const struct hwmon_channel_info nouveau_pwm = {
-	.type = hwmon_pwm,
-	.config = nouveau_config_pwm,
-};
-
-static const struct hwmon_channel_info nouveau_power = {
-	.type = hwmon_power,
-	.config = nouveau_config_power,
-};
-
 static const struct hwmon_channel_info *nouveau_info[] = {
-	&nouveau_chip,
-	&nouveau_temp,
-	&nouveau_fan,
-	&nouveau_in,
-	&nouveau_pwm,
-	&nouveau_power,
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT |
+			   HWMON_T_MAX | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_CRIT_HYST |
+			   HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT |
+			   HWMON_I_MIN | HWMON_I_MAX |
+			   HWMON_I_LABEL),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_CAP_MAX | HWMON_P_CRIT),
 	NULL
 };
 
-- 
2.25.1

