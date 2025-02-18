Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF8A3A39F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5313B10E40E;
	Tue, 18 Feb 2025 17:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g9ksKz5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA78010E3F4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso21812825e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898498; x=1740503298; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y8R03JFVj2NKekAWxfkOZ96PWx+yt6w/rnA7LR8wx3E=;
 b=g9ksKz5jwCb5GPIPvvQRhjRonYZJ8MPzkwZNX0/dNp3ktt3J7ngmy+e/Z8e2LTap6b
 gKIu2E6bBv0jwmKaN1c8lZ3QVvPkF4AyJqcnDWogKnChOBDXagdEpDde3jRHRLNuQfvr
 7uRJeTy0y1lMpt1eSwIZGDa3VX5VjsdjnPUPA3cCaYFOl8+2hXs3ckuZpwHl5d8L04eZ
 /BwBrCcFlObSKkmwMib1aKRkOYkG2bjkRIFN2AyUZ1T0SWgcgzM/7gloubDuwzRFWboR
 QTbTSUIeTenzUBLdaks19JoIIP1oPu7myE3hPCuL5vLVuC4DcsJYfuDEUPlHmnU7pvhT
 TH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898498; x=1740503298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y8R03JFVj2NKekAWxfkOZ96PWx+yt6w/rnA7LR8wx3E=;
 b=mk1Lqx6vNtvXIXsgRaBeqoVvhgCF6/FejQXvK1K012rfw7TVLIO9jz1xTMMAvsauBm
 aD/KCcDFKR4tMZ73ZfDqw7QQ4poYkSYmvVmkPAFTj558I2srlKOX3tOJHgNrFbU0Pz11
 DIhxIIY97Le0biV9MepnNnyVbnYWCjZqGhMIplACN9zCySVMdEb87eiR31UVoqq9Tyd5
 USozKYZ/rkBl9o+KwIbvo6tqnjp1u+S4UeOXwIfOaZNaMZgnb9u9/mcG8RgGr3U7T+C3
 SjPUz9fFx+7C/qHtC/MVbjVD6AFWSMR7dEifK8gSs7YaFbxRyKuCr+kLqtpnLmRVbvdf
 HpWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI/Rgoo7ieRIts0DAtOSUL5MIHv7LXtBL/m+6ocf5dAeZZdE+ax9GynPQ7wRUo84LwpoeanSvOtkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/9yHgIiAauB62+yRP7d6Ah3yA7nootj3ZcVjpXoxrTZfc6BQ4
 0GMsdVskbJvilDUbVRCHO2w0cRxg9dd4pI2whDH9ANJod/qwxGPh
X-Gm-Gg: ASbGncvL8XZo2xJiqO3iiPJ1zeH6DiuIydUkDpjJ5+ji+b1Dm2ia6wnz+wXCFRW6J4T
 VM6IeRWJNTAAVyd/0MddfKfHDVw7rZ0HAly/ps6ZSe+G1nZ7PY2x38FjqqMr9gLcJXTw4sBB3kO
 4qPnbI+xKcN/BkbAg07ltQqCNTob34x1g+ZW2sv4fZ3FbEHkRuZq/J+ZrhkvggF9bec7rvGlB49
 SAlOKDyQlDj6tKKNv1Jc2S8tnIASk+sdpnZDtP1EDbdYQAGeuwAU7aTpCP/XbQSHN+uw1GA4j3W
 9gVCu4Ygj+7J6yNvMA==
X-Google-Smtp-Source: AGHT+IFHJhZKf7IH9i9zM3eHxhLXuccFXsGBcnnRTeEzbT9cC2YctBvx2HRssvzKQvcni8dI79RnDw==
X-Received: by 2002:a05:600c:4ecd:b0:439:35e2:bb45 with SMTP id
 5b1f17b1804b1-4396e6dfd41mr152201005e9.18.1739898498201; 
 Tue, 18 Feb 2025 09:08:18 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:17 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 04/16] drm/vkms: Allow to configure the plane type via configfs
Date: Tue, 18 Feb 2025 18:07:56 +0100
Message-ID: <20250218170808.9507-5-jose.exposito89@gmail.com>
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

When a plane is created, add a `type` file to allow to set the type:

 - 0 overlay
 - 1 primary
 - 2 cursor

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  4 +++
 drivers/gpu/drm/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index bf23d0da33fe..d95f228de05b 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -84,6 +84,10 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
+Planes have 1 configurable attribute:
+
+- type: Plane type: 0 overlay, 1 primary, 2 cursor
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index dd9dfe51eb3a..093735f47858 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -54,6 +54,56 @@ struct vkms_configfs_plane {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+static ssize_t plane_type_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	enum drm_plane_type type;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	mutex_lock(&plane->dev->lock);
+	type = vkms_config_plane_get_type(plane->config);
+	mutex_unlock(&plane->dev->lock);
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
+	mutex_lock(&plane->dev->lock);
+
+	if (plane->dev->enabled) {
+		mutex_unlock(&plane->dev->lock);
+		return -EPERM;
+	}
+
+	vkms_config_plane_set_type(plane->config, type);
+
+	mutex_unlock(&plane->dev->lock);
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
@@ -73,6 +123,7 @@ static struct configfs_item_operations plane_item_operations = {
 };
 
 static const struct config_item_type plane_item_type = {
+	.ct_attrs	= plane_item_attrs,
 	.ct_item_ops	= &plane_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.48.1

