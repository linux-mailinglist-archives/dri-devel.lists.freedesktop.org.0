Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476B9AAE18A
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF9910E7FC;
	Wed,  7 May 2025 13:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UV8yjHEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9BA10E7F5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:54:47 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso50495555e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746626086; x=1747230886; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hf29a068uSV+gOxXOAqPS64BgHiJ9rQElLGH+oW5Azk=;
 b=UV8yjHEWsMMx5ieGEYpih/EMuH2xNIytl4IYQALINqqg30tgvHOQd3UlHfVt8DFhJY
 L2MDgubWNCwHCiGFGfs1rUa3DvZt8x8ZkTjw+Vs2qb1yy1CzE04KMJ3lYcNSaTt7Wefa
 M11Bl3Xy55BcVh1qd3lKzpRAhU8kYQnMeVnsEnEmZtUQYJIsD+wYdzamyrgpBsj5VkrZ
 cUYtCjiquXZMFHAJoBLjoc037T9vOUGbsUtxcailKH+EMWtM89BkIdUt/dmdYTmyksWV
 z9fQ2EZ+ROvQgZj0SnSXkNS7K0C6ufKvjEVXO5On4Hl3+Nqdn86zB3idQUQtfL0GzBIh
 p6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746626086; x=1747230886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hf29a068uSV+gOxXOAqPS64BgHiJ9rQElLGH+oW5Azk=;
 b=JCj1NKKN8QqtHzkPpxAudm3NuJiFpLZGaIO3SVEypZy7io57OcEqZ1RQCfT+g2labJ
 QAf61uye88SYROo1NyDv+BWQSFn5J6YlQ7f0ErXA6r1OBOky8icZ9uUnHRGj8kWjUICb
 ICJo1mde1IDtBJ1FPzy3gDCita6kwJGGba6PSyhQMFPuMwO88+szpNTs9QwnrAyILvtP
 4NSvkPomcC5fPvU3p2hpcCtLxkW6/768ZCA52y4mqXLBhJwmilftZnhSfrIyjZcd/mAT
 zkfMbmgAOHhmhsys9FtEyC6dqTB3LtLx0WCxdwC4f/UKjh3HjJWqi9gskbquer8K9S3l
 8IGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeBqFBCg0JOEw2m82vs+hEeJ5vhxl6oQ4u6su0ZhMeJCDOPieYJzAHc19cw1Op9it/OQBXV01doLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgI0o2nbA1DUMTcBoAznrGw41zuPV5LGoTLKnNHWemiPADpGJv
 80wXx1PygSJx/fFE9MVX6kuEUqpN9+R/+SK2y8iRFBEzpX7AijOK
X-Gm-Gg: ASbGnct2XJF5XBs9pO3l80Y8V4Bh1fWKG9By1NgVCbCtdFtr9lQmLsQ0PzKCc9WNXNK
 HdXsT91eyhIIImhD6StTHkgMKiYDqQYpmyiUcajt3v3WQiKqWCjOH4Z8UVIwYSSflLH9KJ9gDbO
 umOjSBxGBEkd/lhWBJ3smXJLddm198oUJGAl4AwwlFqICS1jdowtNrzuW1TMS4SP1JDxNLzvyJE
 QiAkOZyHaSkIXSq+155OUJiEFkm/ZtGhVL00Kt+1rzj1aFM1Ptv2wpTsyauL88Q+8d3Y5T+xuK7
 +k5o58mK7iw79YICdfqw7yXKxie4wbNzhF1oI66Pcw==
X-Google-Smtp-Source: AGHT+IG3McCwf4+c/FvGUTkfhJOwvL0zCzL2qFhyOb7erSoPR0UGcnOTeNf80Nd1APHPk40TSnUX5Q==
X-Received: by 2002:a05:600c:4eca:b0:43c:e2dd:98f3 with SMTP id
 5b1f17b1804b1-441d44dd21cmr21102965e9.21.1746626085635; 
 Wed, 07 May 2025 06:54:45 -0700 (PDT)
Received: from fedora.. ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:44 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 09/16] drm/vkms: Allow to attach encoders and CRTCs via
 configfs
Date: Wed,  7 May 2025 15:54:24 +0200
Message-ID: <20250507135431.53907-10-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
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

Create a default subgroup at
/config/vkms/encoders/encoder/possible_crtcs that will contain symbolic
links to the possible CRTCs for the encoder.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
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
2.49.0

