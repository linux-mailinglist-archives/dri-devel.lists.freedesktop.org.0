Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E8C97072E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 14:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2243510E0F2;
	Sun,  8 Sep 2024 12:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DBz1yKy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7EB10E0F2
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 12:09:01 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42c79deb7c4so28502365e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 05:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725797339; x=1726402139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WXhVFne8oOPihf62uhCsGSTcnVwmoqLgUS41SPYlfAE=;
 b=DBz1yKy1NVXsLzxuXCAWEdHtd0rON3pBdvwp11o0dceiJvO1cpYxAV0GVX4GcocIUP
 PADei+OO/oBsgDbvaR7ZFTI/sIjDXGBqfzvZqn9nZkaO9lSKQGy6n+k/xbqORZJB+xuL
 JNMsbgMaXBGZ38W4obN+TVwZVgCcQq97Pqpdm3A3s60YFXnMJuImbnLiwLlsx49QB3pW
 eII8R7mI99KyIZ9b0w7IHPRxIQfzrzgyNI7PXYi8QWLfV3ELRuV9WOkQnSGo/haZYmCK
 aL6KGCdlFoAB4SEfqPnR4ey3KF3Kx71d5RpqMAFM8PtZP8pU2wGhnCVZT8JuP4yRNcjJ
 vldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725797339; x=1726402139;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WXhVFne8oOPihf62uhCsGSTcnVwmoqLgUS41SPYlfAE=;
 b=SExlyOoHTfDhHE3QPZjKXeZhcKFpr51NlZOFP0PUeP8cvu6PHvOOcruarSOsxQlohW
 YynK+rY91TkwtcUMgyCazq3L9AqLIR0CWr5SdWbMvionp57y5hFb9u+jaLRF3ZZW3D+8
 3SVXoqenBix5upDP9TsH4tpGVk3HzuUHYle4P4hMGth2385fYORMDjbCTGRPMgjMlr8q
 maPdvUN5S85NJwdPKDnwED+ga3YXxdyVcwScJ90ncwRrGvglI0Ba3BPgDikh9jhaPu+4
 YEPzeBltA3QEmbyr0TObsjwBF4V6UW/E6YQ/WRN2nu1Pz25F5B3ut300imfB0tYcFvAe
 oV0A==
X-Gm-Message-State: AOJu0YyaBZBefD49ryB77100kDB8KRn3KF/QJ1ugybNZGSz+VAEsB7yt
 MzS/fn9jm9p7BR3jSbd4D7QmFbjgOPniSNagbgWrCxriIyDynHTq
X-Google-Smtp-Source: AGHT+IHq57o3e2wBx/L29p74S62hT5Dle2BqjI485e7gbJExQUtSpAjY/KDgDeo9DajUq+uck/wbsw==
X-Received: by 2002:a7b:c858:0:b0:42c:af06:71b with SMTP id
 5b1f17b1804b1-42caf060978mr25759815e9.28.1725797339200; 
 Sun, 08 Sep 2024 05:08:59 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd18:a600:88fa:9e17:3532:fcf4?
 (dynamic-2a01-0c23-bd18-a600-88fa-9e17-3532-fcf4.c23.pool.telefonica.de.
 [2a01:c23:bd18:a600:88fa:9e17:3532:fcf4])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ca05cfd03sm75056385e9.28.2024.09.08.05.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Sep 2024 05:08:58 -0700 (PDT)
Message-ID: <b2d8d283-36cc-42e8-a8e7-e57e9698a9b5@gmail.com>
Date: Sun, 8 Sep 2024 14:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/6] drm/sysfs: Remove version attribute
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>
Cc: "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

This undocumented attribute returns a version string which hasn't been
changed for ages. libdrm doesn't use it and I also found no other user.
So I think we can remove it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpu/drm/drm_sysfs.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index fb3bbb6ad..49e5faf11 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -126,8 +126,6 @@ static const struct component_ops typec_connector_ops = {
 	.unbind = typec_connector_unbind,
 };
 
-static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
-
 /**
  * drm_sysfs_init - initialize sysfs helpers
  *
@@ -140,19 +138,10 @@ static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
  */
 int drm_sysfs_init(void)
 {
-	int err;
-
 	drm_class = class_create("drm");
 	if (IS_ERR(drm_class))
 		return PTR_ERR(drm_class);
 
-	err = class_create_file(drm_class, &class_attr_version.attr);
-	if (err) {
-		class_destroy(drm_class);
-		drm_class = NULL;
-		return err;
-	}
-
 	drm_class->devnode = drm_devnode;
 
 	drm_sysfs_acpi_register();
@@ -169,7 +158,6 @@ void drm_sysfs_destroy(void)
 	if (IS_ERR_OR_NULL(drm_class))
 		return;
 	drm_sysfs_acpi_unregister();
-	class_remove_file(drm_class, &class_attr_version.attr);
 	class_destroy(drm_class);
 	drm_class = NULL;
 }
-- 
2.46.0


