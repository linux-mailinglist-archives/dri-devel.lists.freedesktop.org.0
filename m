Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72254A3A3A7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9664310E73A;
	Tue, 18 Feb 2025 17:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HPgyvIbN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B455110E40E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so3243985f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898503; x=1740503303; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGOAV+n91+x7w7PPxVJ9AYuQQLXVm0lW+qAsfnT2Nw4=;
 b=HPgyvIbNlju7DH8feW7CKejjBrFCnelNTINH3sBrGmt0oWwrGawqRn19zAd0zsJHC0
 M7uS/YHNov6p6gFD0oDClgsp5x+tRU1whnH89YBbjPpDk7nBr7SLhw3bXx3qYQ2nLy7J
 HFI9g/V3te+zRuC735smO9oJqEV9nLDw1UBcgdG3hx+lla99gr2zHjqvj8rNHu2BiaZL
 58A1V2hwyLNxj79so7evjHAhzsvcp6UCAUkEgqBwY8YmqX5ZxANcGAwiS8dmdfMcHeok
 7ITZlltVUPTkpQLVml4k5wHvk1EeM0n/+Xc818/XbOkt9qfoSXthzpVbF3KYbrkldm0o
 FMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898503; x=1740503303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGOAV+n91+x7w7PPxVJ9AYuQQLXVm0lW+qAsfnT2Nw4=;
 b=VErgt/PQDvyzGkdIud0O0YZaRqVFJIka2X/0dZ3j8YJgiU6DwOW9I9HSqwdQTihurc
 1G9T/pmWTuJFt7JZY33v0M1NvkyotAQUi/z9YV3cFreTRhF4KdlrLJOiFGY4yBskjnSF
 c56FzCCTDBac9/t04JA9Oj0hR3kJRX84NDuFtnnuYFsKl8EbSo6lR3J3E5bOs2x2gqNX
 6M861Gu7vN8jxJOMk6MeIAzDWjK6Hz0AoF8sAYMLVmiqgPOh8jEfkOL//iTC0plfoxEb
 Rjuj/OP9ivgeI9UFGvmhnPuowuup3T7o9PmxbE50y1iE5jRo5QgfDd0+FeX7xSFPb9QB
 18bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6RX5wfjBUvKzf/VBefnNRynKz9YwHDIrwZkpLa2Fp44hu0FWhhQ77lrITyaWpQ+hRNynX4jHv+U8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywln8tZ04i4xK1XTLiq6Koe7Z1q9+lwg2QVkZUPeEmj5gmxGS96
 VcbgTuBUyw1aoRhvOM4gaZMHKVR38qizBFFCmh2m2Q/kPIaGrc0w
X-Gm-Gg: ASbGncvRK2NtGpscAN8ADAnxLJoveGmjpFdfvim/A8KlSlxeMelgeIb0EM6ZpEY8/v9
 oQR96UQ/WvVotAnGi4UeK97JI12jT0zKmNBmkW1pdoIkC3xKSHbis6LWs/4lT7AIlxFIdaAiuWy
 RiwU0xiqFMYy/gZWxu1pFU00GkKNYgi+er1anmnUQJCxXj0uhrhqWkJ+4tjiAL8A6f/ij8mSOSA
 4KfwjIehQdYk4SgY508dSGA2cG+4PnCiFs6AHiN6IYpOvggVZ+6U8qqlRwiArUINYWSRoMyUOAv
 NnjRhovjrDpdYaB/tQ==
X-Google-Smtp-Source: AGHT+IGVwOCse7i0Rjw0IStrwKsXzhkTTPNQyrA+eVwBPg5ii444ycnjb80RjsHuyBpDCbaSDwenXA==
X-Received: by 2002:a05:6000:2a4:b0:38f:483f:8319 with SMTP id
 ffacd0b85a97d-38f587f3ec3mr204987f8f.51.1739898502998; 
 Tue, 18 Feb 2025 09:08:22 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:22 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 08/16] drm/vkms: Allow to configure multiple encoders via
 configfs
Date: Tue, 18 Feb 2025 18:08:00 +0100
Message-ID: <20250218170808.9507-9-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/encoders to allow to create as
many encoders as required.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 99 ++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 3c9d72bdb65a..24f40128e8f3 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -76,6 +76,7 @@ And directories are created for each configurable item of the display pipeline::
   tree /config/vkms/my-vkms
   ├── crtcs
   ├── enabled
+  ├── encoders
   └── planes
 
 To add items to the display pipeline, create one or more directories under the
@@ -97,6 +98,10 @@ CRTCs have 1 configurable attribute:
 
 - writeback: Enable or disable writeback connector support
 
+Next, create one or more encoders::
+
+  sudo mkdir /config/vkms/my-vkms/encoders/encoder0
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
@@ -118,6 +123,7 @@ And removing the top level directory and its subdirectories::
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
+  sudo rmdir /config/vkms/my-vkms/encoders/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 7d5ebdd45d53..d7efa50a3fba 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -17,6 +17,7 @@ static bool is_configfs_registered;
  * Initialized when a new directory is created under "/config/vkms/"
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
+ * @encoders_group: Default subgroup of @group at "/config/vkms/encoders"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -26,6 +27,7 @@ struct vkms_configfs_device {
 	struct config_group group;
 	struct config_group planes_group;
 	struct config_group crtcs_group;
+	struct config_group encoders_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -62,6 +64,20 @@ struct vkms_configfs_crtc {
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
@@ -79,6 +95,10 @@ struct vkms_configfs_crtc {
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
+#define encoder_item_to_vkms_configfs_encoder(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
+		     group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -382,6 +402,81 @@ static const struct config_item_type plane_group_type = {
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
+	mutex_lock(lock);
+	vkms_config_destroy_encoder(encoder->dev->config, encoder->config);
+	kfree(encoder);
+	mutex_unlock(lock);
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
+	int ret;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	mutex_lock(&dev->lock);
+
+	if (dev->enabled) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	encoder = kzalloc(sizeof(*encoder), GFP_KERNEL);
+	if (!encoder) {
+		ret = -ENOMEM;
+		goto err_unlock;
+	}
+
+	encoder->dev = dev;
+
+	encoder->config = vkms_config_create_encoder(dev->config);
+	if (IS_ERR(encoder->config)) {
+		ret = PTR_ERR(encoder->config);
+		goto err_free;
+	}
+
+	config_group_init_type_name(&encoder->group, name, &encoder_item_type);
+
+	mutex_unlock(&dev->lock);
+
+	return &encoder->group;
+
+err_free:
+	kfree(encoder);
+err_unlock:
+	mutex_unlock(&dev->lock);
+	return ERR_PTR(ret);
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
@@ -495,6 +590,10 @@ static struct config_group *make_device_group(struct config_group *group,
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

