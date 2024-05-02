Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A768B9F66
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 19:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9A310F6DE;
	Thu,  2 May 2024 17:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IpX9589E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437A2112606
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 17:23:59 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1ed0abbf706so5379955ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714670638; x=1715275438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BoLV4NBTi5WshpxXLizBmf79HWwJfptg7//iRnwuPL0=;
 b=IpX9589EVe2XA3keTNdtvtAK/JSCpUoMfrKJNi93WI6UPD1vqvtF75NB7mUHJSyvfV
 zcxDv7I1A+smzS5WrGJSz4faXee1ng8OeVx+mUYTyPHIzAFxKxi+qMrIiYDPxBPzDn2x
 bI10HnphPPMDd9UadzjQXvGutaAWQJxondQvny9OOuhe1hsLc23X3dnHzfrCA1RycSgg
 k4rFYS6P/k9/mTb4F3xu434Qs2SS/X7F5A9JlVZqv6gw2hH4ixzA1/5xqwIauaX/X8SW
 lHVJmaRj+FwRdxnj420JXuzfPl94QFP5lq4/NtwajN1+Cgd94EbCyIwBep7a5F8UIPzL
 NoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714670638; x=1715275438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BoLV4NBTi5WshpxXLizBmf79HWwJfptg7//iRnwuPL0=;
 b=aDJK2qFJ5ngnE0gDEHi++UWE/fumOvlCDISq2HASKzPNjr3wSASR8ujHfEvyzNwtIF
 PGBc1PUkFLTBWGTUQNepZdY2ldGLiulm5mHaT0PBoyGrxCGtr83PU/wodqEJl+4nJz39
 v3+kLHLkM6Fsmj7pVAWXmqdiH5T1R3AdipFe+I7W66NxlArgxgGGcNEQsLXy6dYbvFTX
 6wzJPwz843OIJlRT5mttpREQTMaca59gJc367gqofwK2H5ZA2/E+40jyOSHQiXIKtBr2
 DcqN73VhwCVhAovSYkW1vK3so09VTfSiT+g126UDZ3tWBjKJVVzmLq4jnAdNi11AA/Qu
 8nLg==
X-Gm-Message-State: AOJu0YzigstzxnVjGxF3+EfSVIWEAUymTZWNSTE6kJCCzk7HKJqCaKk7
 Xkt3rYLkD+D2EOsVU9DfZqi7Jd+AcP/ZpZY6YjUKdC9S9J0zAvbW
X-Google-Smtp-Source: AGHT+IEyeN+w/2GKnAAXaO0iG1dRQeaeYXXU53saYgxjY5324IkOkLk95/QiEGVAl7Bnc0yRghOx1w==
X-Received: by 2002:a17:902:da8d:b0:1e9:cf94:5bea with SMTP id
 j13-20020a170902da8d00b001e9cf945beamr433078plx.35.1714670638524; 
 Thu, 02 May 2024 10:23:58 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:5fc9:c3c6:40e7:b56b:5c47:4a78])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a170902bc4c00b001e4565a2596sm1568513plz.92.2024.05.02.10.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 10:23:58 -0700 (PDT)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, javier.carrasco.cruz@gmail.com,
 skhan@linuxfoundation.org, julia.lawall@inria.fr,
 Shresth Prasad <shresthprasad7@gmail.com>
Subject: [RESEND][PATCH v3][next] backlight: sky81452-backlight: Remove
 unnecessary call to of_node_get
Date: Thu,  2 May 2024 22:51:21 +0530
Message-ID: <20240502172121.8695-2-shresthprasad7@gmail.com>
X-Mailer: git-send-email 2.45.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`dev->of_node` already has a reference to the device_node and calling
of_node_get on it is unnecessary. All conresponding calls to
of_node_put are also removed.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
---
Changes in v3:
    - Remove unnecessary braces

 drivers/video/backlight/sky81452-backlight.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index eb18c6eb0ff0..19f9f84a9fd6 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -182,7 +182,7 @@ static const struct attribute_group sky81452_bl_attr_group = {
 static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 							struct device *dev)
 {
-	struct device_node *np = of_node_get(dev->of_node);
+	struct device_node *np = dev->of_node;
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
2.45.0

