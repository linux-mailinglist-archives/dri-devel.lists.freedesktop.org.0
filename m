Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E26A4493F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E5810E4C9;
	Tue, 25 Feb 2025 17:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c/Z/keQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C5110E69F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:51 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-439350f1a0bso459255e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506390; x=1741111190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTsFuw25JN5p3fGYw8niDWV82fMArp6L/Ntua1mS02k=;
 b=c/Z/keQQsAdgpjAOfDdmSs9R3TjYwe4Dld1RLpKMZmCcOh4SeYh8ZEn6f7pe3yFWux
 qrgvbZY4cp75aTsib7yyK/3EHLLdnu+F+Bs941BVO6eAb9OfsC4ooBiknBNOFT175clf
 HgaL38t9sKt+44TeMDcGXA1386isgWfrL5m5abS8ptMrYxvqd0hirpun3hzG8IJg7+mG
 Zy2nQzArOIqbs2NqOL7rjro4hP9pRQb3kya7h3mXkHQJdA5faA9XMjB4qVpHeNqM/hIl
 FJbA1LPOmUAd5F7UxxdfsaMdHKxPltcbxe+iY2y9tY7R960lWgEXfcxHZYHIIo3wUrWi
 oG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506390; x=1741111190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTsFuw25JN5p3fGYw8niDWV82fMArp6L/Ntua1mS02k=;
 b=HeR4qy6q93Si15gvUHTGOuB4FqYZK5PHv72YVXdoL2GceAaNHT/m5XUrPVFod+ap9h
 AGNGCMtEHiNSuqnCK9wbJyT+HnxaK9y+KcgfZBxlAYCTMg1w/6QaK5LExchvhTD2P+2X
 BxNFT7SKk7EUEFkVX5RGlBhyYpsH1wUp7Fojqkws1OyfOanEWK5HTyqSXAK4GSeNdWBX
 eZnHg0bO0DmRs4kSp87eVYuHTMLzURNgUxshU/ap9ikUgpLSx+Ubzc0teL/Eb29BqXZo
 414v+6OYQr1uXvU2H4N6Dbbohvm3QITfEW+LRE262dxAwOqYzfQnGd1Q+ORnDlsCvJ3p
 cXkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdoeXMHEf8i2Sdtpj62jMPQmPe1veyTGAm51nAUwx0h9zmokoEAQgZW6GJLULDbzeQkMRM/0qNq6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAJzz2BM9AUIaajf9QZiaLXDY/csjwYhGv7+28ZkvfKiRwarUM
 2YL2lkls46aRFZ1CMOo7JxM4pu9yyWVbUbQ/kwUw/15YujTH+GJC
X-Gm-Gg: ASbGncsezzZm7nzZw7RfZSdCZyFptakd+g7h1SrS6lkRWSyemLqqq32a63IMbJ1t6Z2
 QxAjUAt1Ml8GbWUzq/81Yd18XPCWwoKZY5OkqXSUnNQdZDmCvwVB6tEEp17qhIdLWNe0sDFWmmh
 P3t/6Ad06cvpJ2OplaMxC5w66V08XhVcUdYgKtZAn5tNuLFtznLVEEgdSHunlTif5F38OD+M2BH
 lXm2n3uiAcKZnNErAjNKTUiDhln4+NMUTRTD1MraBDboS/Y9zsnweiKouKdtp3EfQcX7h+MN9Rh
 J384wei5WH4dVqtA4mVKICMNKcgM
X-Google-Smtp-Source: AGHT+IEOazIMO3dYrk+eRsHezFG2wuGzjSRuNjHFFDNYiidmpZhlQQKcv5oVveo+glrBODNV5JWyUg==
X-Received: by 2002:a05:600c:46ca:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-439ae2d1f3fmr145310205e9.3.1740506389953; 
 Tue, 25 Feb 2025 09:59:49 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:49 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 08/16] drm/vkms: Allow to configure multiple encoders via
 configfs
Date: Tue, 25 Feb 2025 18:59:28 +0100
Message-ID: <20250225175936.7223-9-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225175936.7223-1-jose.exposito89@gmail.com>
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/encoders to allow to create as
many encoders as required.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 85 ++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 13b96837a266..e24767448775 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -76,6 +76,7 @@ And directories are created for each configurable item of the display pipeline::
   tree /config/vkms/my-vkms
   ├── crtcs
   ├── enabled
+  ├── encoders
   └── planes
 
 To add items to the display pipeline, create one or more directories under the
@@ -98,6 +99,10 @@ CRTCs have 1 configurable attribute:
 
 - writeback: Enable or disable writeback connector support by writing 1 or 0
 
+Next, create one or more encoders::
+
+  sudo mkdir /config/vkms/my-vkms/encoders/encoder0
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
@@ -119,6 +124,7 @@ And removing the top level directory and its subdirectories::
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
+  sudo rmdir /config/vkms/my-vkms/encoders/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 09d1f2224d01..cf865728abc2 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -18,6 +18,7 @@ static bool is_configfs_registered;
  * Initialized when a new directory is created under "/config/vkms/"
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
+ * @encoders_group: Default subgroup of @group at "/config/vkms/encoders"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -27,6 +28,7 @@ struct vkms_configfs_device {
 	struct config_group group;
 	struct config_group planes_group;
 	struct config_group crtcs_group;
+	struct config_group encoders_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -63,6 +65,20 @@ struct vkms_configfs_crtc {
 	struct vkms_config_crtc *config;
 };
 
+/**
+ * struct vkms_configfs_encoder - Configfs representation of a encoder
+ *
+ * @group: Top level configuration group that represents a encoder.
+ * Initialized when a new directory is created under "/config/vkms/encoders"
+ * @dev: The vkms_configfs_device this encoder belongs to
+ * @config: Configuration of the VKMS encoder
+ */
+struct vkms_configfs_encoder {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_encoder *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
@@ -80,6 +96,10 @@ struct vkms_configfs_crtc {
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
+#define encoder_item_to_vkms_configfs_encoder(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
+		     group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -333,6 +353,67 @@ static const struct config_item_type plane_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static void encoder_release(struct config_item *item)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct mutex *lock;
+
+	encoder = encoder_item_to_vkms_configfs_encoder(item);
+	lock = &encoder->dev->lock;
+
+	guard(mutex)(lock);
+	vkms_config_destroy_encoder(encoder->dev->config, encoder->config);
+	kfree(encoder);
+}
+
+static struct configfs_item_operations encoder_item_operations = {
+	.release	= &encoder_release,
+};
+
+static const struct config_item_type encoder_item_type = {
+	.ct_item_ops	= &encoder_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_encoder_group(struct config_group *group,
+					       const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_encoder *encoder;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	guard(mutex)(&dev->lock);
+
+	if (dev->enabled)
+		return ERR_PTR(-EBUSY);
+
+	encoder = kzalloc(sizeof(*encoder), GFP_KERNEL);
+	if (!encoder)
+		return ERR_PTR(-ENOMEM);
+
+	encoder->dev = dev;
+
+	encoder->config = vkms_config_create_encoder(dev->config);
+	if (IS_ERR(encoder->config)) {
+		kfree(encoder);
+		return ERR_CAST(encoder->config);
+	}
+
+	config_group_init_type_name(&encoder->group, name, &encoder_item_type);
+
+	return &encoder->group;
+}
+
+static struct configfs_group_operations encoders_group_operations = {
+	.make_group	= &make_encoder_group,
+};
+
+static const struct config_item_type encoder_group_type = {
+	.ct_group_ops	= &encoders_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_device *dev;
@@ -433,6 +514,10 @@ static struct config_group *make_device_group(struct config_group *group,
 				    &crtc_group_type);
 	configfs_add_default_group(&dev->crtcs_group, &dev->group);
 
+	config_group_init_type_name(&dev->encoders_group, "encoders",
+				    &encoder_group_type);
+	configfs_add_default_group(&dev->encoders_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.48.1

