Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D809A44946
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371EC10E6EE;
	Tue, 25 Feb 2025 18:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KzGlkcAA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9550B10E67F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:50 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38f488f3161so3276601f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506389; x=1741111189; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQ3qzmV/GwODyLkEBydltNTBiPP7GsnM7FoOeuRwhyU=;
 b=KzGlkcAAvqN+eYgu+vKqO2tuvhT/UPJ/5QJyKf0iAXQKzLsJ8jo9ZxZmguEDgO0gYP
 y2uHW5azJX9u5Vs+XqjgMYGLUdIszXn8XQZzn2bkQ8xAs5Nkunbh5MHRfkKxjHEbnvTy
 cWWd7Kvpnws71XOCpaKskZ0z2xoVJ5XcD2kSLun47mBH91YcclouWnZQqDGM2/jPLVaS
 x3KjK2nfyweszI5eS9x4oui4u7cK+FO6Y2vLnRn1mW4J1jpansbcNZTalUyAJD+uJrzm
 SXojrYMKISdxiPPHLw7wH4sNpI0M98/I8pNmY1BHuHo7Ml4MqWutX2FzWtsOQVa8jEuW
 59pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506389; x=1741111189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQ3qzmV/GwODyLkEBydltNTBiPP7GsnM7FoOeuRwhyU=;
 b=WtIt24aJRyOYmXZR9NvNF3mAg299HF8Y48YpgIJT+RKSOI9xBFmxsx0r7MsYSsDikN
 VJSOUl4gnUgQLIHlisBDs+ykhgNSnn4KBRDIJ98F1ZVELAw5y3oskD94b6pkBFp5Uz14
 2WT/wPX1PfReLJojIxSGucWqJtQkkyLakN0OWGKdtHObj2dhHLZ536qzTWEus6ZwKjR+
 aRdcpIjccSemvrcPtmxJlmk2TOwkgMBrgS3WyAuhzpsyWGNoF9/PVrsGT38a4b+races
 VkY3NGDUg6/0gR93weGRsy3RNkMtZS1kkGL+LpY2qs1f//T2N8EAHf2xd4QRs51fSbq4
 LtSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTIgG6wc7ytE4/dZOfOjVi6Y7WS1X5tnI/AYRNmDCeE/FmNBRMSHbDVHEcegZ+J33XBNoIljRq/qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFVO35bahvPg+Xk/4Q9MqvAHpxNNfTLuisHR2skMCVlWd1fqAS
 R++T+ZPjkUs3VMFSWKP//wNLEHaKjny7K+UEWfr96D0dC7PDxvbP
X-Gm-Gg: ASbGncuZpg3yjeh829MAC9TCqcMsGSEsBXuYADcySTLlXdW+rNgT9l0AcKcTIVLxqkk
 q+9Swgh0yL4NBU5mCfT8O6lNEiDzVY4BMmw/QMGPzFNMZSS2mAhytFQmI4cq8boo/qGqO7A0Ed6
 xRvAcFYw9Q0f/Hs3OunU9ltQAwW/hIlyy6wg/r4NbM6DYIEaArKy8Ag5qP7zzQwZdNwyZ5gVjG/
 YPe9r0EoeyhU2hqqur2+g4zXH7RIIuZ1DjYO2NZfh3dnLIA9all+KBLdhNygr3nTVvs6obByQj/
 lqOjDu9kyG4hPHEG7qunKun4C4hu
X-Google-Smtp-Source: AGHT+IEy+IL/4SACMuAp4ri5486dK+aWSMx2NkyH5sRE4U8G0AbrFzsBBuGGPkYXj/bg5UH5g8T4Iw==
X-Received: by 2002:a05:6000:154a:b0:38d:e3da:8b50 with SMTP id
 ffacd0b85a97d-38f7082821bmr17517108f8f.39.1740506389035; 
 Tue, 25 Feb 2025 09:59:49 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:48 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 07/16] drm/vkms: Allow to attach planes and CRTCs via
 configfs
Date: Tue, 25 Feb 2025 18:59:27 +0100
Message-ID: <20250225175936.7223-8-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/planes/plane/possible_crtcs
that will contain symbolic links to the possible CRTCs for the plane.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  9 +++++
 drivers/gpu/drm/vkms/vkms_configfs.c | 54 ++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index abe7a0f5a4ab..13b96837a266 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -98,6 +98,14 @@ CRTCs have 1 configurable attribute:
 
 - writeback: Enable or disable writeback connector support by writing 1 or 0
 
+To finish the configuration, link the different pipeline items::
+
+  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
+
+Since at least one primary plane is required, make sure to set the right type::
+
+  echo "1" | sudo tee /config/vkms/my-vkms/planes/plane0/type
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -108,6 +116,7 @@ Finally, you can remove the VKMS instance disabling it::
 
 And removing the top level directory and its subdirectories::
 
+  sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 233a3d4ad75c..09d1f2224d01 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -38,11 +38,13 @@ struct vkms_configfs_device {
  *
  * @group: Top level configuration group that represents a plane.
  * Initialized when a new directory is created under "/config/vkms/planes"
+ * @possible_crtcs_group: Default subgroup of @group at "plane/possible_crtcs"
  * @dev: The vkms_configfs_device this plane belongs to
  * @config: Configuration of the VKMS plane
  */
 struct vkms_configfs_plane {
 	struct config_group group;
+	struct config_group possible_crtcs_group;
 	struct vkms_configfs_device *dev;
 	struct vkms_config_plane *config;
 };
@@ -71,6 +73,10 @@ struct vkms_configfs_crtc {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+#define plane_possible_crtcs_item_to_vkms_configfs_plane(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_plane, \
+		     possible_crtcs_group)
+
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
@@ -175,6 +181,49 @@ static const struct config_item_type crtc_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int plane_possible_crtcs_allow_link(struct config_item *src,
+					   struct config_item *target)
+{
+	struct vkms_configfs_plane *plane;
+	struct vkms_configfs_crtc *crtc;
+
+	if (target->ci_type != &crtc_item_type)
+		return -EINVAL;
+
+	plane = plane_possible_crtcs_item_to_vkms_configfs_plane(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	guard(mutex)(&plane->dev->lock);
+
+	if (plane->dev->enabled)
+		return -EBUSY;
+
+	return vkms_config_plane_attach_crtc(plane->config, crtc->config);
+}
+
+static void plane_possible_crtcs_drop_link(struct config_item *src,
+					   struct config_item *target)
+{
+	struct vkms_configfs_plane *plane;
+	struct vkms_configfs_crtc *crtc;
+
+	plane = plane_possible_crtcs_item_to_vkms_configfs_plane(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	guard(mutex)(&plane->dev->lock);
+	vkms_config_plane_detach_crtc(plane->config, crtc->config);
+}
+
+static struct configfs_item_operations plane_possible_crtcs_item_operations = {
+	.allow_link	= plane_possible_crtcs_allow_link,
+	.drop_link	= plane_possible_crtcs_drop_link,
+};
+
+static const struct config_item_type plane_possible_crtcs_group_type = {
+	.ct_item_ops	= &plane_possible_crtcs_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t plane_type_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_plane *plane;
@@ -267,6 +316,11 @@ static struct config_group *make_plane_group(struct config_group *group,
 
 	config_group_init_type_name(&plane->group, name, &plane_item_type);
 
+	config_group_init_type_name(&plane->possible_crtcs_group,
+				    "possible_crtcs",
+				    &plane_possible_crtcs_group_type);
+	configfs_add_default_group(&plane->possible_crtcs_group, &plane->group);
+
 	return &plane->group;
 }
 
-- 
2.48.1

