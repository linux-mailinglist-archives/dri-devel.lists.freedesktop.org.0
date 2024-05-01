Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7FD8B8A8F
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 14:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B385810FB4B;
	Wed,  1 May 2024 12:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J31UG2Qr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5244C10FB4B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 12:52:04 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6ed3cafd766so6052584b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 05:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714567924; x=1715172724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e/dJlWSPreiopPSl6wgz1zP3z6iVTFkuzcbTcNZ6zic=;
 b=J31UG2QrcpDbIevPDR4WVz2/T9F40HN3sYPNHuC3nvKLjazu3WacKJs7C+4JW7VoJa
 RqNutQAdV7V/58qN/otE5gzoP3E4co8dqNoNNsZioXefy7X6xJAQUSKzngSbp/61ywZk
 K32ReUmeq4jEuXaTtnM3wS4bUmdddV5sCdR+rT4eUDvv78NDS5HY4URcDX+qYNZ1Yat4
 7sn7NFNjDKRfJs5yOJ7VYMuUjJBE1OxwgiSstXgS47iPvdhfY+CATUdM0nMMLoqvJ9Md
 twvY264WustD0kq6Nfa/ASZi3EWjr0vOs339HiJRvUlS79jNK92iqsHu3IU49Gl8k2ej
 AqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714567924; x=1715172724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e/dJlWSPreiopPSl6wgz1zP3z6iVTFkuzcbTcNZ6zic=;
 b=cG6YMON6Vd1c6ElSv7KMhJ4UQEn0NBdMqgLMyWhIJV0UaaKvYgKVzbW8WHCmzIJ6Wn
 dUlMFBYVaJKFXCObtnoP19hz5pGT7RpreG5JmBYc8EAwMEbGQTQbqK+Dqjsvc+qKkixt
 G5kd2CdI6lEdUAGJpbRIxo5TgaJpsWtibAmy60hhq8r7G0TUEqXkbzF6Jcs15jnvVBX5
 jk+kVs8Q2pUwpEVXYEWIasUK7WEsbOAzfIj14gFL0yIeoha8QG1j2zuwB4R25ve7dReD
 /VrkrYbqPQw2+sg5tml3bUvglVHqCFFrC/DuvBeysPqZh6u8Zl+nXLCaYqBJq0VBSXoo
 /JRQ==
X-Gm-Message-State: AOJu0Yzu02g0UafI3cHAnzy3Zj1hx+ppco0aBUGapCGtErw23r061VLx
 CroVMaGUDgF7tBQcH68YaPioAZI6AP52XKGcJCyumEB7HMKNNm03
X-Google-Smtp-Source: AGHT+IG9pZ629ZawhSJloqIJTILZG+s27Bbhu3JGaf+WQGhAeV1DAcYc/NGiY8Iwuy6byAhwjoXamg==
X-Received: by 2002:a05:6a20:ce4b:b0:1af:3715:80c8 with SMTP id
 id11-20020a056a20ce4b00b001af371580c8mr3408299pzb.46.1714567923655; 
 Wed, 01 May 2024 05:52:03 -0700 (PDT)
Received: from dev.. ([2402:e280:214c:86:7cbc:420c:c1c5:6f2e])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a62e802000000b006ed4f616ec4sm22545230pfi.57.2024.05.01.05.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 05:52:03 -0700 (PDT)
From: R Sundar <prosunofficial@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 javier.carrasco.cruz@gmail.com, R Sundar <prosunofficial@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] backlight: sky81452-backlight: replace of_node_put with __free
Date: Wed,  1 May 2024 18:21:46 +0530
Message-Id: <20240501125146.33648-1-prosunofficial@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new cleanup magic to replace of_node_put() with
__free(device_node) marking to auto release when they get out of scope.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: R Sundar <prosunofficial@gmail.com>
---
 drivers/video/backlight/sky81452-backlight.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index eb18c6eb0ff0..54095872a33a 100644
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
2.34.1

