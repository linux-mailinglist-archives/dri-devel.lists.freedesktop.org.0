Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC22A56DCA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A4110EBE5;
	Fri,  7 Mar 2025 16:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B6M1ueDb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A269410EBE4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:06 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso24147025e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365245; x=1741970045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MV2OWA6Mh9vxWtK9J9PJqfJQiomHto+OaIeMpCvYMU=;
 b=B6M1ueDbHaysrv1XFZZBIfCWUbXx9RLLm4EXquUUyvms5Mx9XwTXn4foMKdeZ25TaH
 1JW4YsQ7qv8NmiRnFOYSkzGCJldeVxPj6ZLwVXMnP9zjbRn1nfI5lS94X5J45BhSHa9/
 E7xjR9H6UE1xTsW1DQEl7uQefVT9Lu3gFKngaJy3/IyFejKiLN48gRqSLb8srfu7MrDb
 VkShDzEBDCfyvPxtjN+ztU4XXZkNCUpL6gae8w75piO6JweXizsy4VE+02SO59Y+NryM
 6mQxbroMkx1axBBOdMwg2M1QNZOtGGo/zELUX2RUT7mIW6l7hgIfLLZGtfYoSqcXWdka
 BJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365245; x=1741970045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MV2OWA6Mh9vxWtK9J9PJqfJQiomHto+OaIeMpCvYMU=;
 b=v5qWPVcIV7PIxfneOX7qC6ujgIuioR59EqsTIPMZDHX6pbjjBHUqJoLEv7NItoP7/T
 twaETRWDzU8Wuz1MDmcaxrmg7iVWwUlJHdC5/XnoW2hnf5RtWPtt0tpj9Hrz+1oWcmvI
 jToJcKduEs9GrLSBA1q2XUW+RnUiFFVlJHW6AEe6pjXT+SoEyoyMeojwLIBbNMQrF+Yx
 kbsYOpbxTW36s3f4t5NTbCkH18YHoDwCyI1DIlR3mGM4ZzCZGq2rLjs5jF0V4+rpAGdl
 GrmwuyCBB89D/1cvBvsClJcoLVlyxVzlPxmayYGfUvjJ1ADFaTbLuXXPt+N9Dr9/M7Ll
 ZHFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqWnoEY0AbDPghVAS07WAeTsFZoGC/Ac5Iz1lkqPI4r2GTklXNM1yTWVEe+f6JMGxyuRn0HRRx6+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9zdJfq7taMTPUpfrz00sDU9smbPos3niYvpKn+5DOf68awzLD
 P67UTvzyM8vRnjI9/UOaIGw0JhMO7KSlEeDBTSeINlh8tazdtphJ
X-Gm-Gg: ASbGncvR+g9h2hWvyhalktl5nB88yQsttrsCpViEY9/hkR/fpL9ov9BT85jqRwiyGej
 i7EphBcqbedY9X+BWhxtPmhTOdRcUbnfztel88tP1r7gKgjE/jjnOFPNLEfwCxTijKnnItja+H4
 2tCeWSmaaeAXg1C9/S8GN9QihWa4rqwDBTE9dkA28rhAFXFOS2vhE3El/NY9fEks9mayUC8O5cs
 oEWgdMnZueffJiv7Y1M7/x74QYKlgZlFtrcGBb0TILFNGAEUlhzuBNsfftm6TiOxOHN04/8V7xB
 FkKzcZBcTjoopkPj7PqZe8MZpwYH9WEMgbgQFRxdosg1yiA=
X-Google-Smtp-Source: AGHT+IHy6prLRyeDeLBBqQYAih4z7dhF8ZsgqaozMxKPj1Kdi9OZe1sSmPCaA48+hp2UIfpfozoC+w==
X-Received: by 2002:a5d:47cd:0:b0:391:952:c730 with SMTP id
 ffacd0b85a97d-39132d09078mr4081895f8f.11.1741365243576; 
 Fri, 07 Mar 2025 08:34:03 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:34:02 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 04/16] drm/vkms: Allow to configure the plane type via
 configfs
Date: Fri,  7 Mar 2025 17:33:41 +0100
Message-ID: <20250307163353.5896-5-jose.exposito89@gmail.com>
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

When a plane is created, add a `type` file to allow to set the type:

 - 0 overlay
 - 1 primary
 - 2 cursor

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  5 +++
 drivers/gpu/drm/vkms/vkms_configfs.c | 46 ++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index bf23d0da33fe..a87e0925bebb 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -84,6 +84,11 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
+Planes have 1 configurable attribute:
+
+- type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
+  exposed by the "type" property of a plane)
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index a7c705e00e4c..398755127759 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -55,6 +55,51 @@ struct vkms_configfs_plane {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+static ssize_t plane_type_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	enum drm_plane_type type;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		type = vkms_config_plane_get_type(plane->config);
+
+	return sprintf(page, "%u", type);
+}
+
+static ssize_t plane_type_store(struct config_item *item, const char *page,
+				size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	enum drm_plane_type type;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	if (kstrtouint(page, 10, &type))
+		return -EINVAL;
+
+	if (type != DRM_PLANE_TYPE_OVERLAY && type != DRM_PLANE_TYPE_PRIMARY &&
+	    type != DRM_PLANE_TYPE_CURSOR)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_type(plane->config, type);
+	}
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(plane_, type);
+
+static struct configfs_attribute *plane_item_attrs[] = {
+	&plane_attr_type,
+	NULL,
+};
+
 static void plane_release(struct config_item *item)
 {
 	struct vkms_configfs_plane *plane;
@@ -74,6 +119,7 @@ static struct configfs_item_operations plane_item_operations = {
 };
 
 static const struct config_item_type plane_item_type = {
+	.ct_attrs	= plane_item_attrs,
 	.ct_item_ops	= &plane_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.48.1

