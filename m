Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5461A56DCD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9F810EBF2;
	Fri,  7 Mar 2025 16:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j9qp2kQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EEA10EBEE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43bc63876f1so17641015e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365251; x=1741970051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=++hf8G4nEk9Bpzh89kQV5A47zc/b6vQ6MPdCQxsR9cg=;
 b=j9qp2kQeMwcYy+uD2F+uEMSJZSMtaOwroZ9dvRE5npkf5O8KNtpCER2aAn3Qy61Ayz
 qXA6ERo6rnPIBM76rgEDXF0gqgBQlynp4fflnH9REzApXXw44L+0GBpmedxzD/SuKCfD
 JhWUg92q6OG1c6hwP3RbAjsOgE1kTDv9ccN78zEVO6zf+Fed1cKmToYc4ff4I0zAEmTP
 sWkMnqveaqcGoB4V3T9efUDOpfsce85EDWh4TMGT1HSnWVwuS85T3TdXEifbmrMOkB9S
 4drem/MJ0YC+DM6i+IJlBvdyR3pwVzTV2IiExYSK6thXyz6C8NzeJ3h79vgu6IKTDLCO
 3BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365251; x=1741970051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++hf8G4nEk9Bpzh89kQV5A47zc/b6vQ6MPdCQxsR9cg=;
 b=g5Q0HiDrLTV/MN0SQsTnpyImljvpAQaqeRC5xbMfk5rmLFldAht0UTqfxRWtOs7HZ8
 +g29Ci502+pyet8E5SLC6QlmqZIQfoLngVUY4o1dVfDgohN0hSdcFuKmkISLSzxo1t+J
 KMsnntzYQT3P5623NGUvMqqztlIShKGnVdDyOlPylSSxBLY3gC8atbWs5ZbqFKP7wF4V
 0JPFITh+eSAKHdfhprBXlJ+RWxn5uR7y7XP+outLHVTzBfzMc6X++tlS97Lr3VC/rriG
 yUMxZ6JA1qaIF8iOcQsafzeopSzahS1N0RaoK03gJjWI4GDa8SewDcQwDKGluShHsQhr
 2Uaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFuZBLLDSL4pj1+E8x4a1cBn1yVFXbeCLIJm03LeB1pp/190NHV7w9jAHHFWSqEfgYobgzvQulD2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBJZxh2qqYo2/+mIzFQLl3FDKGzP90NQdjLm66R/axC/j+IZKj
 rgUAN75hd6jLSuG2Qh0W7T91Xo1JigrPoBdqqWfR2g9/gm7JH78/
X-Gm-Gg: ASbGnctgqU0xtHJtPp0tTu5Q0LzcwD3oY+69zcgC87jFeF0aSbgxkonjz2VrlDabI6W
 16fpdbHaJIp9Dgq43nVqSKrl9SrhxEzQno+Q26sWvxoXk19M0hji1L5Aze2aydolaHh5lF7liaM
 J4IiIjtPNWxnFTySshfudTFnQUFRjkaBDel8DGRGv5xM8G8XdmITmUPbHPEKK/wkyCqfBMhOlpm
 10+S1IC1/tgwi2AFGqkd9Z967Skk5qxHdyK3DkHEDgOm7O5Oct+ptHjzbm5SjgYLd04+t+V277x
 Oo0xiCeXpqCUwNHgzbAk2nlS0KFJfExxzHiR0lxlCgnesng=
X-Google-Smtp-Source: AGHT+IFRCRTbXpFBWuMUYNVgD4erCo26cMvSvBPI4MZCLSewSYGptXR8L/t9TuQLLLKD6G3ia6vuQg==
X-Received: by 2002:a05:600c:3b0e:b0:43b:d04a:3506 with SMTP id
 5b1f17b1804b1-43c686f703emr25579665e9.25.1741365251122; 
 Fri, 07 Mar 2025 08:34:11 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:34:10 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 09/16] drm/vkms: Allow to attach encoders and CRTCs via
 configfs
Date: Fri,  7 Mar 2025 17:33:46 +0100
Message-ID: <20250307163353.5896-10-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307163353.5896-1-jose.exposito89@gmail.com>
References: <20250307163353.5896-1-jose.exposito89@gmail.com>
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

Create a default subgroup at
/config/vkms/encoders/encoder/possible_crtcs that will contain symbolic
links to the possible CRTCs for the encoder.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 58 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index e24767448775..650dbfa76f59 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -106,6 +106,7 @@ Next, create one or more encoders::
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
+  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
 
 Since at least one primary plane is required, make sure to set the right type::
 
@@ -122,6 +123,7 @@ Finally, you can remove the VKMS instance disabling it::
 And removing the top level directory and its subdirectories::
 
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
+  sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 0df86e63570a..7de601e39d2b 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -70,11 +70,13 @@ struct vkms_configfs_crtc {
  *
  * @group: Top level configuration group that represents a encoder.
  * Initialized when a new directory is created under "/config/vkms/encoders"
+ * @possible_crtcs_group: Default subgroup of @group at "encoder/possible_crtcs"
  * @dev: The vkms_configfs_device this encoder belongs to
  * @config: Configuration of the VKMS encoder
  */
 struct vkms_configfs_encoder {
 	struct config_group group;
+	struct config_group possible_crtcs_group;
 	struct vkms_configfs_device *dev;
 	struct vkms_config_encoder *config;
 };
@@ -100,6 +102,10 @@ struct vkms_configfs_encoder {
 	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
 		     group)
 
+#define encoder_possible_crtcs_item_to_vkms_configfs_encoder(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
+		     possible_crtcs_group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -364,6 +370,52 @@ static const struct config_item_type plane_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int encoder_possible_crtcs_allow_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct vkms_configfs_crtc *crtc;
+	int ret;
+
+	if (target->ci_type != &crtc_item_type)
+		return -EINVAL;
+
+	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	scoped_guard(mutex, &encoder->dev->lock) {
+		if (encoder->dev->enabled)
+			return -EBUSY;
+
+		ret = vkms_config_encoder_attach_crtc(encoder->config, crtc->config);
+	}
+
+	return ret;
+}
+
+static void encoder_possible_crtcs_drop_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct vkms_configfs_crtc *crtc;
+
+	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	scoped_guard(mutex, &encoder->dev->lock)
+		vkms_config_encoder_detach_crtc(encoder->config, crtc->config);
+}
+
+static struct configfs_item_operations encoder_possible_crtcs_item_operations = {
+	.allow_link	= encoder_possible_crtcs_allow_link,
+	.drop_link	= encoder_possible_crtcs_drop_link,
+};
+
+static const struct config_item_type encoder_possible_crtcs_group_type = {
+	.ct_item_ops	= &encoder_possible_crtcs_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static void encoder_release(struct config_item *item)
 {
 	struct vkms_configfs_encoder *encoder;
@@ -413,6 +465,12 @@ static struct config_group *make_encoder_group(struct config_group *group,
 
 		config_group_init_type_name(&encoder->group, name,
 					    &encoder_item_type);
+
+		config_group_init_type_name(&encoder->possible_crtcs_group,
+					    "possible_crtcs",
+					    &encoder_possible_crtcs_group_type);
+		configfs_add_default_group(&encoder->possible_crtcs_group,
+					   &encoder->group);
 	}
 
 	return &encoder->group;
-- 
2.48.1

