Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F053A44948
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B3B10E784;
	Tue, 25 Feb 2025 18:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bVrGxqzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EFC10E6EE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:52 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4399a1eada3so51838805e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506391; x=1741111191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ERnhTJ83jS9HrIxUIwFbH0bG0W+iXLYtduz4GOdzo4=;
 b=bVrGxqzF653TYspgxkj2mMCzgegGMgTTXnjmsGTH5lLVIF4jQzaT+rOGlNV9ptnDH+
 lBXz1OYizYhpC3cv8AWR8e+gwUo/Tw7o28jnjo0+UwNCNIwQpgRFeouMrl9zFew0piFP
 8sblxNLqSWmemaeEHxwQLBQ/SFuy2bz6RfYb6evh9O2xPaVSenAYSb/P95HeZm+olfrR
 G0PZbbwmXLqVss8r+RuRsApK4VlI2BfJzVwHcNBAemxPDkKFB+l5QNh4EQ0z+nkKsKUP
 j+sTvPElGaySnBU9F6CpIyK8/ySybIM/0xEevISzrvatatsRu2Tjy2tS1gFzblIZlWqN
 Qj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506391; x=1741111191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ERnhTJ83jS9HrIxUIwFbH0bG0W+iXLYtduz4GOdzo4=;
 b=rRcz14d6kQnFxEYgnPzEbqPhii1d570b7N5eAv3QHUfQQKGxvddkBxsVvo6PLbKeDc
 nrKUAAvd5XxlgZSL/oy3hdo2ZSwwKPWvpQLSzmT5Wn4lG39caIbgY35ra5UiXWPOT2z5
 2Y4jV2whNvPwvKRLSbX33QJcu4FYWDqhVbOsXSYJaIOX2zA9WrIOJE3WEC6K6HKEmW91
 gOc2j4qO2ZxChHjxRozpmtqewlCDKCdH8ZE0SceKcMaLQlhA6lo8awQQZv6+qSoN7gmF
 LDRSuw5xYStMQGcApSPNwUx1cIYiX2x+uDRPvYeo15ozxxclRql1fOnhHiDmNbZI+qjH
 NhwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTpZ+cFkEn2n67IAn85fybCT6xkZfFYSH+GWeyyNC0TMZzoJhDjnqfik+OhrOpKLPLHl6KzRHslD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTGP5DCaTKp/urUkvFEqbMgzWvTw1KqfBwi+FOXIVO/z7O06Bu
 Vqa1mu/G8u5dC2TGsrPMMwn6VnqYRm5QpFzZJfF0PtSTLmeF2HlK
X-Gm-Gg: ASbGncvGninElV+SIsI0dO3LVvNzwnb/Ux4yomAJA7uWl/kiguyt+a7jNdo/DblMwjg
 HG8xB+svHAcdy3+OBPYEFb3HcLJ/q9KnFPuIv1Wprdq4AtqvpU8J7Z+AdTiCqEOz8L4lIYjtQ+v
 mVrOuEnQ+9NIWIglYyrY9zaU03fwYEERmeJi4hMxCxVGkLLv2L4py1XaRMXqHovYHXK7xycHOVo
 usDFA4DE4wt8/Y9nDqMggJ20g74PpeAaDmymu6zLAU7XySACCOY87XnSlcaEQYTukLNtk3q6YyZ
 QYkSvKhUiwPHtf5iiDnrKkZaXc8W
X-Google-Smtp-Source: AGHT+IHCWQpZfQj2ZmqqchJwQSTf4iypFQkgwB0Olxc8jlH2dpN0x4GiKPXIgyo4G4hwCub03XS22A==
X-Received: by 2002:a05:600c:4f86:b0:439:967b:46fc with SMTP id
 5b1f17b1804b1-43ab8fd73f2mr4044375e9.8.1740506391126; 
 Tue, 25 Feb 2025 09:59:51 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:50 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 09/16] drm/vkms: Allow to attach encoders and CRTCs via
 configfs
Date: Tue, 25 Feb 2025 18:59:29 +0100
Message-ID: <20250225175936.7223-10-jose.exposito89@gmail.com>
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

Create a default subgroup at
/config/vkms/encoders/encoder/possible_crtcs that will contain symbolic
links to the possible CRTCs for the encoder.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 55 ++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

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
index cf865728abc2..64aa10cd3156 100644
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
@@ -353,6 +359,49 @@ static const struct config_item_type plane_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int encoder_possible_crtcs_allow_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct vkms_configfs_crtc *crtc;
+
+	if (target->ci_type != &crtc_item_type)
+		return -EINVAL;
+
+	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	guard(mutex)(&encoder->dev->lock);
+
+	if (encoder->dev->enabled)
+		return -EBUSY;
+
+	return vkms_config_encoder_attach_crtc(encoder->config, crtc->config);
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
+	guard(mutex)(&encoder->dev->lock);
+	vkms_config_encoder_detach_crtc(encoder->config, crtc->config);
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
@@ -402,6 +451,12 @@ static struct config_group *make_encoder_group(struct config_group *group,
 
 	config_group_init_type_name(&encoder->group, name, &encoder_item_type);
 
+	config_group_init_type_name(&encoder->possible_crtcs_group,
+				    "possible_crtcs",
+				    &encoder_possible_crtcs_group_type);
+	configfs_add_default_group(&encoder->possible_crtcs_group,
+				   &encoder->group);
+
 	return &encoder->group;
 }
 
-- 
2.48.1

