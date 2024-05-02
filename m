Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F638B94BE
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 08:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA4C10EB45;
	Thu,  2 May 2024 06:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UizIzUKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C7A10EB45
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 06:37:07 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1ec486198b6so21198505ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 23:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714631827; x=1715236627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BoLV4NBTi5WshpxXLizBmf79HWwJfptg7//iRnwuPL0=;
 b=UizIzUKlDqG2g+1UkfuC/wzkEQpEoOLUzP8zLLWeMdUXe8vAgGRZVng8Plt+uxKKKH
 SgNdZX+DvAzR0EJlRakKTu7ubw9cDzDBhNLDnqQyjnL3waKTiKDsnHLv4a89k7ai3+/g
 OZDBo1Ucbdx5pi7cmMJg063YTCm1Yvoheio18X/h84u4anU5vkgbMoQ2BP+xJh0a+X8Z
 vICLb6U1+LBETS218kZOwj5W9wjh+Z5kn5eEQneghcx4ss+5SGA3qAW+wok2alY8HR8j
 jZ5HW8th8O3xb6JUpr4sTVBeqUc8FddieccQeqnYEo8DuC91bksyBcXMX/Z7fTRbh8TW
 uGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714631827; x=1715236627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BoLV4NBTi5WshpxXLizBmf79HWwJfptg7//iRnwuPL0=;
 b=Zlx9FfZ2+T5hYwKiI11IWC0GaFiWCB2cnxcLBn+nJYq4DYq4lqyrt0Wv5t2iXdmQ+I
 fb4dIX+NTgrD7sLTU9cIEORhvrKCD/pppRIFOLDLOm+AGqZR2c0ujA6h2YrST/KgGa/B
 8tTlMjCvsnP8QmJZzO6lUYfDsYCxKhztoFYyx1Y91ZPIdUGe1FATRYh5TDzyn8UpDEaX
 TlnTEPDtnUNiyEBTYmgPLZfDdBZwFQJZsIc89eg4+d0szMWOlUMVnpF8k0tWJ4llJ5W2
 X96uWjBTQRE5iutWXAC0fBkDNfSCYMHezxpWCGuJVGGAtmpUaBQjhDzmx6sbXRIuZExZ
 n3jg==
X-Gm-Message-State: AOJu0YxsIIir+I4D9yUVC+12uXEvUuPZUPNuo+O+KoRsPazOEtOCPLCw
 nJqpAXGf1IMrcpiLd+bQGWAZghCrXfqkkPjfZ4Yl4+pA2xzOjJjY
X-Google-Smtp-Source: AGHT+IGRsFloWjksJZp0KragxTnZKgqBKV04pCsU3xT3150e9iJsRxDV8vqtiXoBmaMkF0RRlmSAFA==
X-Received: by 2002:a17:902:e883:b0:1e3:e4ff:7054 with SMTP id
 w3-20020a170902e88300b001e3e4ff7054mr6427245plg.38.1714631826997; 
 Wed, 01 May 2024 23:37:06 -0700 (PDT)
Received: from shresth-aspirea71576g.abesec.ac.in ([139.5.197.146])
 by smtp.gmail.com with ESMTPSA id
 lf4-20020a170902fb4400b001e8d180766dsm450881plb.278.2024.05.01.23.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 23:37:06 -0700 (PDT)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, javier.carrasco.cruz@gmail.com,
 skhan@linuxfoundation.org, julia.lawall@inria.fr,
 Shresth Prasad <shresthprasad7@gmail.com>
Subject: [PATCH v3][next] backlight: sky81452-backlight: Remove unnecessary
 call to of_node_get
Date: Thu,  2 May 2024 12:06:22 +0530
Message-ID: <20240502063621.65687-2-shresthprasad7@gmail.com>
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

