Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15327A7D754
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E059610E3AB;
	Mon,  7 Apr 2025 08:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F6QDtDBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B61310E39E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:44 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so27125755e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013683; x=1744618483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f0WRLpCb7W4S/OASemBlBhF+MVaGI+eJr0lijF+1c3c=;
 b=F6QDtDBBFl6//GT8mwhi5xhJrc5TPa17VxG+8uiptilVQVPkElSEmeqce5G9ytCinu
 R/T1GlszNiwnqVp+SkJkXnAqpBVoUpnJRtUtQ6N/jhw+1+DX1JTVK+TkG2BDUQmPiMs1
 BjwNvgqSpdaKvn5OFXNZNDvIOxb+3/TbL4A18nytYyXnquf3xYpAdBFAg3iANTscR0OM
 gNWdyhbozExLeBBmbnlwktVHKu7u/jVazm6m6jg9gsCRkW9yBax7jhiMwhj+945RerCt
 P9Y/aH2qcbbToaly5rhY73p4mhms5p4U44iCD8T8UKd+hGSf7p1QxUURLf6L9hlC+qB+
 RwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013683; x=1744618483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f0WRLpCb7W4S/OASemBlBhF+MVaGI+eJr0lijF+1c3c=;
 b=L0m1CPvWeNTZORibuw4A2VHEk8Ti5kxYJ0tclUvxN/RwBvk/wQVWvrO1m7nmgKBDEy
 KA4fBGi1SvnZDRuIPTN3nV3/dPKsSkfHBj165k26vkoKUDYfkI3xwHJv6vQV5eQ5WloS
 TlXuxCA4nQMu8ixjVQk7ODsyPHwk6jQxhw1aJGle35YFYcqI0C0ITC3K9jxQE2ozlWL0
 QQfmbQyKO61TWF7snr13TU3M8sWzDFLpe4/E8+3ZUOsQ1GasQMd0sRs7SDnsqHJJ6B+X
 3l38BDcvJAUXUJqommXuWifkvsgoWptN5Y/UJy9y8gBSmPrUb5dev64xgHMwsSTqADLt
 09lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ3IN4qeTQQP27Wxgwv1WzTN+sgnNLyHrqebE18adVi0nGIIfdIxxuwrxEkrvD/DnM31PCdZbVH80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg7Iv1Yx+oQD+qApFk/I0oJKcqQiOQClSjlMAR4lW1VdZycf+9
 W3bziE5+pnF/DXo8x0MHK+wvRis3qTSOdi8gca4cK77I++6CQYS1
X-Gm-Gg: ASbGncuotP8PjnN04BLls3MSs86FlhFd3fqRZA0dk2MLZ4Q/IllbM7ChpcsBPMpTnM0
 Y++CwHjPyjrk8jpKSoPhzE7V003UjMt+AgqkviK1yevA7HeqzkHnK8EQyl8bphCTsfK02qZQfCd
 rcR7iQAJKzoESjXmJ59lb9RCDQXhgd68V3QVTetkUDyhKlcyJIY5D1gvy5Qo/kWZz8Jw1UDCOcY
 IO+r7xTCJ/lV4rnZ/b6Wxts6PvJTVuFmMpeBSSkVpxsNC2nos6yAc6cDYGiYcl1wqakpdxSY2o6
 QRKvKFn+RFQA/wdxfwJitPs1biFp+F16bXgQB0MJ7xUY
X-Google-Smtp-Source: AGHT+IG/88e0b60/Y0C5GKyTtSCd9DooMjlQuLLois99UoJNmC+RM6Kq5lX/7f0WXIwo/PqsRyl+Rw==
X-Received: by 2002:a05:600c:b95:b0:43c:fa0e:4713 with SMTP id
 5b1f17b1804b1-43ecf81c336mr101643585e9.2.1744013682759; 
 Mon, 07 Apr 2025 01:14:42 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:42 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 08/16] drm/vkms: Allow to configure multiple encoders via
 configfs
Date: Mon,  7 Apr 2025 10:14:17 +0200
Message-ID: <20250407081425.6420-9-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Create a default subgroup at /config/vkms/encoders to allow to create as
many encoders as required.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 87 ++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

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
index 2cf97c2b6203..0df86e63570a 100644
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
@@ -344,6 +364,69 @@ static const struct config_item_type plane_group_type = {
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
+	scoped_guard(mutex, lock) {
+		vkms_config_destroy_encoder(encoder->dev->config, encoder->config);
+		kfree(encoder);
+	}
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
+	scoped_guard(mutex, &dev->lock) {
+		if (dev->enabled)
+			return ERR_PTR(-EBUSY);
+
+		encoder = kzalloc(sizeof(*encoder), GFP_KERNEL);
+		if (!encoder)
+			return ERR_PTR(-ENOMEM);
+
+		encoder->dev = dev;
+
+		encoder->config = vkms_config_create_encoder(dev->config);
+		if (IS_ERR(encoder->config)) {
+			kfree(encoder);
+			return ERR_CAST(encoder->config);
+		}
+
+		config_group_init_type_name(&encoder->group, name,
+					    &encoder_item_type);
+	}
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
@@ -447,6 +530,10 @@ static struct config_group *make_device_group(struct config_group *group,
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

