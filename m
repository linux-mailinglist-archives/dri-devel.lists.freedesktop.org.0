Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB073AC33E5
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 12:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C067D10E04F;
	Sun, 25 May 2025 10:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jf2OR1QG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABF210E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 10:40:33 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-742af848148so790972b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 03:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748169632; x=1748774432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GaYAYQTXNpM2WMYfSuIUveFo2umn4ZAMC5svAIDE8aA=;
 b=jf2OR1QGsKQSV0xaY27/s7bBunZeUJ0adxlLFf8HUoTcRKFCfDN91n9vhO+UDkFgui
 9dpuKB3OcMTbDcEmVU8Hx1IQxoVDVQyZnOshk58Zreubx5b8tWA9ejzTfSb1lp5Cu75Q
 TbeCMr/EWP5dBFc3+SbAVHZhasI7uTydeR45Xmmu6xVOwUjFAx+CHatyqZBLf1VgMtqJ
 ww5XPZuRuj9Tt4oOTjzibxNfgIUJz/EReqHQiNJgOPXBvZDBkgLRG7sSnG9xCfsuyocK
 w45LYQmUC1yawoL2K58bO1sL5HAab/b7B2DK6TJx1dPy36+K2HzHRIE7Xu/H2Vgputf+
 AoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748169632; x=1748774432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GaYAYQTXNpM2WMYfSuIUveFo2umn4ZAMC5svAIDE8aA=;
 b=nJ/FVVX3Xf3yIGC8WFTh1j1sO7l5dOCcqTBFaYfXIMySVmita7My3gRzGJjKBKv5jk
 DOUtLxXtzGb5HcNQGOTP4B5PXhl7KoDK0rLDsm+gfA5AgWBj35pWI7iJSPB6vwlMCBAv
 d4OFo6i2KQq0M92DXqV4Rr1Dhon/TSACoFf2uJM8HdNNKqCE038UaY8a43eH8gxUu1tM
 UFsIRu2LwfN11C4LclcqH0Y2ovxDnDWIRZYjc5Z8ItWdK/K4+ppFd8ToyLY273GZRbd0
 HO1nC6Io4oZ7V6v4Ql0eqbOVsRvza42GrwBUPTsv+AmSUW5gE8CqPU08Ida2oPS6T0yK
 IGNA==
X-Gm-Message-State: AOJu0YznTeyveiSaYCLXu709hSDX4tmgXwagHLwu0ucfcX1KUmg9C347
 iWThfbSClJVRJChFcKrHfNJJctKCo2eRBWSMLIKdm0Um26AcxQfQQ5sW
X-Gm-Gg: ASbGncvWhXezMJfsqYUYCCXM1hrbgGl3JRtpmAjXTm2kSwi4gmM0d7lT+dIXXhKNlOk
 s4k4omkg34jraRGEk32+3i2OtIhyCg1mYgo8l60j9q67T6brxkOiZb/JGWRaonuJts7XKsqexZ1
 wnXC9Ys6jOt4vjjoROJObAysqDqT9ZUjB8m4ObU/xqD5lSKY026Ilris3dZ90u5mm8IMtrpQAL1
 faRGeuzkLEvAohyxm07TIb6NyR8IwQ/cEDpVPK3DgwaWSbkuNUdFBWc8V236NsGRQYnOsfyOcuP
 hfredxQG3DxyknZIckgAY64tScXsDaKKVOL9NXrr6h0aNt3TmA==
X-Google-Smtp-Source: AGHT+IGlJGZJeHx8OGbctaBG1uExbLaC8Q3Ayyr+IhhjqqI6aLuKbhMEoRnhVaFAlORnkwrGEyDb6w==
X-Received: by 2002:a05:6a20:c709:b0:217:4f95:6a51 with SMTP id
 adf61e73a8af0-2188c362e27mr9194105637.29.1748169631662; 
 Sun, 25 May 2025 03:40:31 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a96defa1sm15833363b3a.12.2025.05.25.03.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 May 2025 03:40:31 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [RFC PATCH 1/2] backlight: Rename duplicated devices to support
 dual-backlight setups
Date: Sun, 25 May 2025 18:40:21 +0800
Message-ID: <20250525104022.1326997-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
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

When registering a backlight device, if a device with the same name
already exists, append "-secondary" to the new device's name. This is
useful for platforms with dual backlight drivers (e.g. some panels use
dual ktz8866), where both instances need to coexist.

For now, only one secondary instance is supported. If more instances
are needed, this logic can be extended with auto-increment or a more
flexible naming scheme.

Suggested-by: Daniel Thompson <danielt@kernel.org>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/video/backlight/backlight.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 9dc93c5e4..991702f5d 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -365,7 +365,8 @@ struct backlight_device *backlight_device_register(const char *name,
 	struct device *parent, void *devdata, const struct backlight_ops *ops,
 	const struct backlight_properties *props)
 {
-	struct backlight_device *new_bd;
+	struct backlight_device *new_bd, *prev_bd;
+	const char *new_name = NULL;
 	int rc;
 
 	pr_debug("backlight_device_register: name=%s\n", name);
@@ -377,10 +378,23 @@ struct backlight_device *backlight_device_register(const char *name,
 	mutex_init(&new_bd->update_lock);
 	mutex_init(&new_bd->ops_lock);
 
+	/*
+	 * If there is an instance with the same name already, then rename it.
+	 * We also can use an auto-increment field, but it seems that there is
+	 * no triple or quad case.
+	 */
+	prev_bd = backlight_device_get_by_name(name);
+	if (!IS_ERR_OR_NULL(prev_bd)) {
+		new_name = kasprintf(GFP_KERNEL, "%s-secondary", name);
+		if (!new_name)
+			return ERR_PTR(-ENOMEM);
+		put_device(&prev_bd->dev);
+	}
+
 	new_bd->dev.class = &backlight_class;
 	new_bd->dev.parent = parent;
 	new_bd->dev.release = bl_device_release;
-	dev_set_name(&new_bd->dev, "%s", name);
+	dev_set_name(&new_bd->dev, "%s", new_name ? new_name : name);
 	dev_set_drvdata(&new_bd->dev, devdata);
 
 	/* Set default properties */
@@ -414,6 +428,8 @@ struct backlight_device *backlight_device_register(const char *name,
 	list_add(&new_bd->entry, &backlight_dev_list);
 	mutex_unlock(&backlight_dev_list_mutex);
 
+	kfree(new_name);
+
 	return new_bd;
 }
 EXPORT_SYMBOL(backlight_device_register);
-- 
2.49.0

