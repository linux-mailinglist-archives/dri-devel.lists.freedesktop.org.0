Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76ACA7D74B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4253410E394;
	Mon,  7 Apr 2025 08:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IBdRigDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CB910E391
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:40 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so27069295e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013678; x=1744618478; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YVCYzfxx8qviL1pZU6Jrz6KDb/rO6bc8XZpUckpDZE=;
 b=IBdRigDKZz8CXhyCDOlL30WCpH1vYMWX1qfYy4zDTbCoCbi3S/fC3FV39m2bXPpTO8
 bfQnZBLoLGJOQI71hlUexSpH+v/3ruIVZZqManL9A7FteO7BWvAOBpqLZoYd0fB7hVZV
 c6avXM2MCCg+r5Bvl/IpEfwOLOdj16fFJ7hwnnEhqAWP7SnYm7/+AEJlyb4zfrUEjh+4
 qEg4G4N9XjNhlG2k8GUELi6zpEZMm8A4lE6dm8TBvtNNQ2WgELqxIH9OPl79WV0hHQlZ
 Ug5afSP7meXHt1hL6u9iyGxgPbPnxI6KIIUP2XdTs2XR5hFmwGp2VUghx4ZhbDv8Li+B
 J8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013678; x=1744618478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3YVCYzfxx8qviL1pZU6Jrz6KDb/rO6bc8XZpUckpDZE=;
 b=V3T8YYxcrTK4YOTp5qX0XrPM+X1zpHW4vGIPnJn8YU/KEzsUNZtshGM7ToqgRyJixZ
 v5/D8Ou/xCAoWvBTyilBN15+r783CytSkH7h9aThZ6Y5nhHRwmFfy2hHZJC5H/emViWl
 28PspqUlsIeM7TB23z0Xz5vnfv/nPx/DCyw2AC1GvHF6xc5NqXqxYpHIzcJy5TPE9feo
 am0+Sy4qQqMQUPbO15vL3/fcV05by7KuhmHCsFaRaayGd4GLPs+boWz3KDwXTKQMGF1r
 swY+ePLZqAd/WV2RAf7QBP0c6zG6GHoZJh4y+mbQm0ijlWpFs3yS6s7ElT06zdTIShwW
 iYDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxhyaNKMDU8244OoK+P57yarvTfuF4MT4HPWoltujF0ops8oBBXMDZNe9Z+4P0iGRmc9yfL+MD3XA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb4w/6oZ//ji43R3qYtiHnB4dNv88VF+m46v5Ce9HvhJPJQyHN
 LPbQKHDAYzxKuRThByW/rxNVlySD4cWyjKU+wg9BMFnoIRSiXASL
X-Gm-Gg: ASbGncujJtOZATgl44Ac/yPIQXbPvPEtvzLnMuPDtO/f+3NK0SXGUzwoXGJplJJeg7q
 H3l71Ziz69HB2spr5p1JFePmZ/VrjNUQv+/AmQSAhqfPXeKERKfpsUHtJg+1m7Y7hUzvDJgBfhn
 vwded1Nsxnmv4KExm/EZcEYaYDdUNGpvzOtRHGvGOvJE+p2t+NdlD7r/4ncHwfX+QWbvHr6RPp+
 H82YCFSGq4AL5RUtKMxzAafhUZ89vdaGzL1Euo//RmCvc9IS+ZVvYpo1nmIzKDKw3ewmWkeoLsP
 0zxsN2vII4YMjQYmXbf52KFsU1MNW7uUZukJ8tmRjNrI
X-Google-Smtp-Source: AGHT+IElBQGStyE2bMCP5d5QJjkdipCeXPcuZYwURkEiVB3dfTK496XhZrH7wiMK1+7MUwB5IZBupQ==
X-Received: by 2002:a05:600c:5785:b0:43d:209:21fd with SMTP id
 5b1f17b1804b1-43ee0783d96mr69770095e9.30.1744013678526; 
 Mon, 07 Apr 2025 01:14:38 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:38 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 04/16] drm/vkms: Allow to configure the plane type via
 configfs
Date: Mon,  7 Apr 2025 10:14:13 +0200
Message-ID: <20250407081425.6420-5-jose.exposito89@gmail.com>
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

When a plane is created, add a `type` file to allow to set the type:

 - 0 overlay
 - 1 primary
 - 2 cursor

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
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

