Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA748AA326
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 21:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DFE113F6E;
	Thu, 18 Apr 2024 19:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fFICzeqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBE21139DE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 19:43:13 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-5e152c757a5so723613a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 12:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713469393; x=1714074193; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=38lT2Q9/Wtu/x/mwT7pRtKT/XjJGw1DkTWZ0TLbddro=;
 b=fFICzeqa/g8B1leQoW8SjWbYznicpZNoFtq7zkaD5I+ac5xsePwP0orGrWP0j2nMVZ
 TidtdedoVKE5+rjyqqtAcovNLoKInQOtCU39pDxF/XR0ioKr9LvUY8sFQHeQm39xoi+h
 JuyZakDodVolT2b/Zs2G62PZ1bfzOKqY273LhpQTFbwwpAA8rlX3DsJFKJwZwEtc3Xtk
 4GYOwpetPfAwpHSAbEZ0ddHtrIwkuqJC+n//PFy4J5/2tnM8xXMc+SXflny8GmixMNm3
 PQjWA+jKFU3DDC6i8wRlW1ImOVKb0UuSAbK0p555fx5hEUI8gzJTtMzsFyCLEBXhVDtN
 Vh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713469393; x=1714074193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=38lT2Q9/Wtu/x/mwT7pRtKT/XjJGw1DkTWZ0TLbddro=;
 b=eA5XSJ4tIT4iEEtpryypgvb3QmIqfhbH1yhaLUK3jl3XnjwEV/6OMA52XXv9I8zHNF
 egISWUszMHxolBZZ51ga4+fMvATgCiD8XAMqMKKb/1Imw9bGUeh1/l3CCFPagHM7F42c
 7snKWspwJAM0+0K3LyoTTvSeEdhn9Wv7rLEJY8ErqeEOHjfHfA/fMDwQvCcnLL4nx/OK
 9ag+kJQ/WMrZpcyKl7+9JKOjikvB19ssfesy7Crc4Wxfd40MgCkkdd/op6TMxh/kuPBD
 cquVVnP6YYTL/wtPiY49Ax12F5rb34CF7eGAJbmQNmeTK7Arwq1L+OvT9rojb49N2f7t
 wT2g==
X-Gm-Message-State: AOJu0YyVPUcaAM4/8lXWEd2aViF2fNEFPH0kotDp7BrxRCnGDqiDcWjm
 iXIOSkufeUI8nsC5Tws7e3zZi1i48kEUg4ReHEV2VSxeV3VnQNno
X-Google-Smtp-Source: AGHT+IFL5Cd2jMq39QbvOOpOS8FadIfe4V5Nx3bG2ekmukhNfIWjmkm1cizoU6hL1T9tr5VD1xV4Pw==
X-Received: by 2002:a17:90b:3108:b0:2ab:e1ae:d4c6 with SMTP id
 gc8-20020a17090b310800b002abe1aed4c6mr145328pjb.32.1713469393079; 
 Thu, 18 Apr 2024 12:43:13 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:8099:de35:15c0:2623:bd0c:2046])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a17090aa59800b002a67b6f4417sm3556327pjq.24.2024.04.18.12.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 12:43:12 -0700 (PDT)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 javier.carrasco.cruz@gmail.com, Shresth Prasad <shresthprasad7@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH][next] drivers: video: Simplify device_node cleanup using
 __free
Date: Fri, 19 Apr 2024 01:13:02 +0530
Message-ID: <20240418194302.1466-1-shresthprasad7@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Apr 2024 19:45:30 +0000
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

Add `__free` function attribute to `np` device_node pointer
initialisation and remove of_node_put cleanup for this pointer.

The `__free` attribute is used for scope based cleanup instead of
manually freeing the resource using `of_node_put`, making cleanup
simpler and safer.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
---
 drivers/video/backlight/sky81452-backlight.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index eb18c6eb0ff0..3c5d8125080c 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -182,7 +182,7 @@ static const struct attribute_group sky81452_bl_attr_group = {
 static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 							struct device *dev)
 {
-	struct device_node *np = of_node_get(dev->of_node);
+	struct device_node *np __free(device_node) = of_node_get(dev->of_node);
 	struct sky81452_bl_platform_data *pdata;
 	int num_entry;
 	unsigned int sources[6];
@@ -194,10 +194,8 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 	}
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		of_node_put(np);
+	if (!pdata)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	of_property_read_string(np, "name", &pdata->name);
 	pdata->ignore_pwm = of_property_read_bool(np, "skyworks,ignore-pwm");
@@ -217,7 +215,6 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 					num_entry);
 		if (ret < 0) {
 			dev_err(dev, "led-sources node is invalid.\n");
-			of_node_put(np);
 			return ERR_PTR(-EINVAL);
 		}
 
@@ -237,7 +234,6 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 	if (ret < 0)
 		pdata->boost_current_limit = 2750;
 
-	of_node_put(np);
 	return pdata;
 }
 #else
-- 
2.44.0

