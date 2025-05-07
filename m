Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E100AAE185
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE8B10E7F0;
	Wed,  7 May 2025 13:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H0o48IpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598EB10E7F0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:54:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so60013125e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746626080; x=1747230880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=revvLaJxQIsk5Gmv9SK/V5e8fpLQQcfcA31+6NgbB0U=;
 b=H0o48IpFuSWy+9QK1rb3sT7B12kT0X/QVO5koCa3CxCot8s2IkYepJkchhRuJTxxy3
 wp0Eg22+0hFEi0v4q+kQDN3hntVLqJQWHwH6LMZseEb2QHSgptA/wMBdyH8SL2SXaVQw
 KAP0HmNJ+RXNvqr7jABO9oXCmbgzhnDXq03CYI69EOXONyk9lBaLotgPBR7BD8sVISb7
 k56NP+nY/PvTCinVCBfyBdiiAym+CdbIRceSmFHvhFpZIYb1Ssq3PUqsBfaOjKFs3pjG
 HvxzneZZjhPH9d4ljPp0TR5hemamU3577zN6Js3t2sJ2anTL5sDe357D0JzAAT5Ii8sT
 PQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746626080; x=1747230880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=revvLaJxQIsk5Gmv9SK/V5e8fpLQQcfcA31+6NgbB0U=;
 b=WwAFWhjToIlgg0L6mQRMyi6pHbKVUhukCK2R0JqhYvVMuI0FM1ovcdEr09GpJKZ56e
 wORY2zBeCvoi4lcnWFKiEEhrYophmaSrDvUwISQR+skAAZCe49lNOvub9Mgo6/vFI//p
 XgtrSnohzR0kTDI3oGMNvht5lONxQ2Q80RGGgrLEiDl29rNnYp2pFwNdzNY0iuNqzOyD
 nkDRzWkvmaLRV5rz0c79kfMCQkZXSowE3GkZ+DZrvGIUEPAAl6Jhm2YNjBXTpqyjZQqQ
 gDAk84h9DNz+rEmeqJHe8g+LNNJRIBayLSmTdleY1Bdpy+zhgX64PgWgCztUGlX0b0m2
 DlgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgKA8U4hpyb9EjcTf6S6kuGqen+ucla8RNtvOH0fyg+HjK0TktHrjTrK8ZBdV1Ck9cDeO8E+jJvqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNMoa0I7TG3xGoHViT8OXAf0JulhKvxbSr0b/sJFci7Y9e+Llm
 hkS2eNqDU6jfuWYT53yIbP8XC7Qj0jjQColWRwA3D51ZgmwRbYks
X-Gm-Gg: ASbGncuuLmPV1HFS2PinhSH4C33H8AQLXfAwMsRGzGtAQRkMJqBfAfV4bFVQkHxNG+Y
 fsrzOfHUOrv7X1kr0nekMUgdBce7mTS0p2gFEcJnC5qAE2Fnbu7j9BI94t0EnB5uVaVioBydu0T
 q/EU9ATYdUnViaIDDdgfHXLs7TrC3zZvIJTAWdWHW6Vv728HHyXCC1J8gKss/cRO+dZkO9e6lBS
 Blf5dm311AuLTmIv4OrRPs+UBDoOWsEbl0/XtXti9M9CeGwUrkghAb9wHwYgWJYEtqG8CagwL5d
 bdTTkc6P67hyqcgE89a2pbuJjMyoFRPQlgV9WHo1tNhT7vVjFeuS
X-Google-Smtp-Source: AGHT+IFM2cUAeZfIFBOSxl3VH6utrOqI2LAEVzXdvefWHLgUAnUSzvYO0BzOjfZP721jAF09vl6/OQ==
X-Received: by 2002:a05:600c:3845:b0:43c:fa52:7d2d with SMTP id
 5b1f17b1804b1-441d44ddba7mr29173265e9.20.1746626079620; 
 Wed, 07 May 2025 06:54:39 -0700 (PDT)
Received: from fedora.. ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:38 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 04/16] drm/vkms: Allow to configure the plane type via
 configfs
Date: Wed,  7 May 2025 15:54:19 +0200
Message-ID: <20250507135431.53907-5-jose.exposito89@gmail.com>
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

When a plane is created, add a `type` file to allow to set the type:

 - 0 overlay
 - 1 primary
 - 2 cursor

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
2.49.0

