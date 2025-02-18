Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C016CA3A39E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD88F10E411;
	Tue, 18 Feb 2025 17:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lbnkPTgO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBE610E2B8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:23 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce2e5so2360579f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898502; x=1740503302; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9hQRUblb+vO7RJ4YMQbXRW++SdGt5uub9rk+BJCkK/4=;
 b=lbnkPTgOsh93By7EVTsFJzaJ1D4BLEXI3/CEzdMHtxkqbdUIO9ARrIqt4BojfFisxA
 env5s03bbsim0+76qgQ4CANYh3lc59iqaX/8A1+HCB0MlPAgUlbPgMUWV2Sns3za3TIC
 niWP58xRcUXrBwj3i5t7tPhA41EjE6Sh/MeTPWoCvDHqKxobN2TvKP7kimuIuhrtrGK0
 GYi3kpUw6Nl38vYin2/a2tMl4n4tWh3uFX5BtIybLs1nFQDbLZe8UIYmQAuq0vOEQpCR
 KjZ4gVvcFo4MScfR2xKzqBeL9yznhEmuBG8fMGYqQIfnVozyiP94BDZZKmIP8wCSmAuY
 aZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898502; x=1740503302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9hQRUblb+vO7RJ4YMQbXRW++SdGt5uub9rk+BJCkK/4=;
 b=X4Z3KO2pvvRCJMZmLqMtUNglhSUgawH+vBhfUHjK/TAx1W8jgP6v72hq/Xeai03XAW
 KWnKUrW5nacT7vl55WwbgQzlcwnc7oJ5GLaYsqK7OAVysl3dpPs/UdESn4HFUqgiBOk0
 VYTDSBDalVWAi+gwGmoKDxbAokQ9rC59RQ/00b2jK6e2hGEKdvVZw2kT/s8iUuLWwf6X
 yOj9fTWAIkogpL/KIBGqoH/HRK17JSly0vslQPL9g0UrgWfXfxxWphfIm3ZrkArUbj37
 QWorPcpG3lzSKC5+TjEBnTYS9n4bgsA7Bido+LrChtsF7oU9BVWEMC/KYq71n93SF2On
 quGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB4niW6U0DUzXoZpyP/Er0kRoc/Nt7oEwyArFctJmSMokOigHEGNQ6RqQX5FblJWhNiYmmN0KoMS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmbRgezJszEMgbxTeTrXZU85LRpdRCDtO9tJ7EztZR6hWZtwis
 EVYrpguN2C3zyXUVNO1+x2mzymFzk6jqdCAo1picW1frn4yf3faM
X-Gm-Gg: ASbGncsLWEPYtSbj7AcgP9GnsWBxJyUUCCNneLwicvjqzlirwNfBlCBR5JRvRwPAVNW
 K2vtbh+mm9pFOHy8PvbMiJ67JU7H+3eTfAdC0Q4RNJJFWzg9H9OtsvSkt2XQl0PhuGGkVPG2sFy
 qRwa6KgnI2hqnP8e+TW6/F2EFU2As3aQ1m7gmvBtSwQYwTlhmeiFq46sEM6U2HpL4NdCYcln4Sn
 LPl7IrRXqYbqnC8pn1BeK5FwL0vbEDKJJ2MNJfWNnDwx469oAoMZeykJ6VHmMcn17Q10U6RsQ2m
 cf70N1rT3G0K+DZoYg==
X-Google-Smtp-Source: AGHT+IFcWb1Y+wG/0Wid8Odg/wbxw6fNIMjnOHVTs78p5eZGd+zacraSrMvuQdfCFFp6AbRWpnHw+A==
X-Received: by 2002:a5d:47a9:0:b0:38f:4531:3973 with SMTP id
 ffacd0b85a97d-38f45313bccmr6180267f8f.4.1739898501833; 
 Tue, 18 Feb 2025 09:08:21 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:21 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 07/16] drm/vkms: Allow to attach planes and CRTCs via configfs
Date: Tue, 18 Feb 2025 18:07:59 +0100
Message-ID: <20250218170808.9507-8-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/planes/plane/possible_crtcs
that will contain symbolic links to the possible CRTCs for the plane.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  9 ++++
 drivers/gpu/drm/vkms/vkms_configfs.c | 61 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 4e87d8a81844..3c9d72bdb65a 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -97,6 +97,14 @@ CRTCs have 1 configurable attribute:
 
 - writeback: Enable or disable writeback connector support
 
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
@@ -107,6 +115,7 @@ Finally, you can remove the VKMS instance disabling it::
 
 And removing the top level directory and its subdirectories::
 
+  sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 88037a57a138..7d5ebdd45d53 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -37,11 +37,13 @@ struct vkms_configfs_device {
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
@@ -70,6 +72,10 @@ struct vkms_configfs_crtc {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+#define plane_possible_crtcs_item_to_vkms_configfs_plane(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_plane, \
+		     possible_crtcs_group)
+
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
@@ -195,6 +201,56 @@ static const struct config_item_type crtc_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int plane_possible_crtcs_allow_link(struct config_item *src,
+					   struct config_item *target)
+{
+	struct vkms_configfs_plane *plane;
+	struct vkms_configfs_crtc *crtc;
+	int ret;
+
+	if (target->ci_type != &crtc_item_type)
+		return -EINVAL;
+
+	plane = plane_possible_crtcs_item_to_vkms_configfs_plane(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	mutex_lock(&plane->dev->lock);
+
+	if (plane->dev->enabled) {
+		mutex_unlock(&plane->dev->lock);
+		return -EPERM;
+	}
+
+	ret = vkms_config_plane_attach_crtc(plane->config, crtc->config);
+	mutex_unlock(&plane->dev->lock);
+
+	return ret;
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
+	mutex_lock(&plane->dev->lock);
+	vkms_config_plane_detach_crtc(plane->config, crtc->config);
+	mutex_unlock(&plane->dev->lock);
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
@@ -301,6 +357,11 @@ static struct config_group *make_plane_group(struct config_group *group,
 
 	config_group_init_type_name(&plane->group, name, &plane_item_type);
 
+	config_group_init_type_name(&plane->possible_crtcs_group,
+				    "possible_crtcs",
+				    &plane_possible_crtcs_group_type);
+	configfs_add_default_group(&plane->possible_crtcs_group, &plane->group);
+
 	mutex_unlock(&dev->lock);
 
 	return &plane->group;
-- 
2.48.1

