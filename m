Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36548A3A399
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CC210E0D8;
	Tue, 18 Feb 2025 17:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GF6eKNnZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D4210E04F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:16 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso64221455e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898495; x=1740503295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uL6cYtME81OabMEvJHb4zln7D1CzFUsjB88Lba9wNjg=;
 b=GF6eKNnZqzozxtddxjA9a5SngKr1WA0AF54RIKVNAEs1PpqbZBnQAr1BxfxWi8BCiT
 1jY0A8JGWMp6bOqnRXNw0wnpRbIhAqPrbxf4UnETxT7/TLL23sG+G8fOqbUs4On3RXR/
 e5EuvIalOdvvBd9AiAHcjbsuzM0JpBiGeV9gqMAZET/T2JtQI5LRiDi7vUQ7AHSBRFJV
 A2cg9Mjg2RbpwjwmsZFfWQD1mYOPilPEOWNSeM6k72nNx8BN+DnPrQHz5xH0L831TLrU
 pSJQiYycvkD8Q9IAlziIrBvs6dpTrJVZKj2f2V9DeB+5hV3xsm+2+PPS3IAhHd2zUXsG
 JYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898495; x=1740503295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uL6cYtME81OabMEvJHb4zln7D1CzFUsjB88Lba9wNjg=;
 b=weMXO7RyTTDZPIZZ44vgsFUwMqbe7tjdpONtyKZ4si1cOQI2B/osq3EN+kzFem4SJ6
 gZrWxWhuQvqTfIpzD0OwHJJsCIq4QYC6z1ZzBHRaU4F7bLp5VHBa79Qf3EAq8vbqUjvF
 EKUQOJvKt/JZ/0X2iixWnQ7HMrskyh4Kcj/x8bAcN2ormI9SIlYtp4VdzMGhbzY9dTxJ
 hIWV5SXOTa86YJcezkQQLrisY6Ay71J7wHI8/O/rQxIlBdk9alcHuguFYiDV/pYxYQH9
 3hmWEwnTsyC6BiVFVymIxQHzHBAtWSBXeA77c4qAFMZfi4xnXTvkm9ekELz6qQy+bzbn
 1ZFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5DQfUq6DLxxky8Bo/S+ipHn3tROlpfxvvc6LPrg8Y9wiEqe6WBdlh41E/Y1/EEDLDhcR1g70+G0E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq73+ISsEscKZi0CytWuPdB+fbHkYgtP2HbWGVUXSdwjxiHS/U
 GNMbyXRgGDiu3oU4iOvs7C0KkyxciZikeWxZ1x8+phVJaOCj2MEz
X-Gm-Gg: ASbGncuBAulXyLAU6zajIHNtdlFLaqTp0GGwlwJi1obb4auJxux2OrrTO89IRJhxGRO
 UKgoQORhM3eEhtcP1nItEfobBJWmXMlBHYdaLnvcCmLDrVF/FsU9sT2Ngw8123SfBIO2AvHHm4o
 nRHZ99v2KU1bSqBPha0IyNqhOj79F8kxK//iFMxzQ2mopXjEMz8KA+5GV4yE7HuhrBJYqvRUVT9
 YZ0/6v0UJdY7R2iXJa5406oUCL5/4jhakeR3HtUfldDF2lksW8luxQj0//F5Mt/uM83FOFyZSyJ
 2VFTkZ2J8QeBpBDvNQ==
X-Google-Smtp-Source: AGHT+IF44VIn/rxhr0e48RyjAhlq5WyDUp5UN4pEKUc0N1DwkqpoyhaBjR6V+hO1E+VpZZ3N93vboQ==
X-Received: by 2002:a05:600c:4fce:b0:439:3d5c:8c19 with SMTP id
 5b1f17b1804b1-4396e717094mr127675585e9.24.1739898493749; 
 Tue, 18 Feb 2025 09:08:13 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:13 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 01/16] drm/vkms: Expose device creation and destruction
Date: Tue, 18 Feb 2025 18:07:53 +0100
Message-ID: <20250218170808.9507-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218170808.9507-1-jose.exposito89@gmail.com>
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In preparation for configfs support, expose vkms_create() and
vkms_destroy().

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index a24d1655f7b8..23817c7b997e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -146,7 +146,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct platform_device *pdev;
@@ -229,7 +229,7 @@ static int __init vkms_init(void)
 	return 0;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_destroy(struct vkms_config *config)
 {
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index a74a7fc3a056..0fe08cd0c461 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -223,6 +223,10 @@ struct vkms_device {
 #define to_vkms_plane_state(target)\
 	container_of(target, struct vkms_plane_state, base.base)
 
+/* VKMS device */
+int vkms_create(struct vkms_config *config);
+void vkms_destroy(struct vkms_config *config);
+
 /**
  * vkms_crtc_init() - Initialize a CRTC for VKMS
  * @dev: DRM device associated with the VKMS buffer
-- 
2.48.1

