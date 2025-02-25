Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A570A4493E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D12110E6A0;
	Tue, 25 Feb 2025 17:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aPG6MasH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F9410E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4399deda38cso36715775e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506386; x=1741111186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JmwMWV6oF+Vmhdp0fICh2mmxVSO2Me4ydPSVWJnw9l0=;
 b=aPG6MasHUCZS1vF+sS2Zr0+5Nn+UB/H5jAOM7s1IxpBLPh1nkQTd/NQEiStJ6pd8yZ
 jr9jIdToASw8A+dJ56ruNYeftfMUswNjjMAePpac+gR6J27vDOW7pMS1aCn+VWaq00ZP
 w32W9LFutRw557BGZfFtgkQstkMcre+bFcWe0O7Ojs2B+L7avtkrx8h64AigzsUfjESn
 FSbkByUA8JL8vQtSA85A7I58278YJRDxFhlVEOKxnIu/lKcrbD0jBjwrY0F4Hq48n0IN
 rbbvB6wLIJyPQitwjj/mGXzLPQ6lZkSlk/XjuIeLXW02YqucX0xlp08Enl2QEJSMZTIY
 HSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506386; x=1741111186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JmwMWV6oF+Vmhdp0fICh2mmxVSO2Me4ydPSVWJnw9l0=;
 b=sDvnkJQ//yRXZC2l/xiYLd0lRHyIgX3ujwD/xmR3vcuU2Z+1YaulX6nT49KJAjjpry
 IvvRtSt8ygmE/JEN9xCPuxligKcaynAnapwkWGOS9gKhTzbscvkjaXmR2dwNKKTVj3/e
 NhHxVnvTiiyH4pJG76AcPr/gqqybQKJ9Edl8FUEKaTWSO7uADJxuaCIOIZWHYYyfz7mn
 f3KN1KIgYnuZaAs9Nht8C906tq1pUPT2t+B0OXf5AIVhIo/ILvv8aXFAhVFUp4EKwVdp
 6H28JpvtBGvPZHaqaLb1FOl9UOTf3MlsTRsXs6f+GMpogyWhaP9SL92OLwYut/marxeS
 oysg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVES/B9a78jAifFHrIhroTW3Ige6bAVxRjshHLEGPDdcRUOsUaosvB/pUg0b2gN//SDoQ05MGXVoLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ2v3ziTK57btHd9mzSFcEmrM4eoG3VHVYqZs0vicCVdbylEDG
 jWCCbUc65+3z1Dg8xGSVea6oZjRhXvS743poYAZXPmb2F9jqml7f
X-Gm-Gg: ASbGncv6TA1/35lbHBf9+TYTDgUhfcSn5Qr1bq/cF4Tdl/zHWU++mLqVi5aButsjYQB
 nwgfRiqIEeERbraQ8uWD/QWF0W5GAdbuZ5wz2lxbhKWTWu9wZ3+jQG0bs9kG1TaMqEF6LmHrseR
 mgypcGk5nAIOukaSTpwwTXkkv+8xc7gzHe1ZrD6gzqZSMBqcyKo+O/jrWz5+Jw91M1t1bd1AJi/
 xC7bgLEci6kUQ67myS9GculkjSJk11IQqUFZY4K81A8uHksb/TJLSb2BRqgMsHwV/T9+fa/lNBF
 hxjdo9HuIT4ttFKRiKjXVg2bdhOD
X-Google-Smtp-Source: AGHT+IFLjeZRYlh7NEmH/CmtWS5phKKBkIkl2C2e27eaJkg9xOLmwwxXIek45/j4yp0tP6BluN2ZOQ==
X-Received: by 2002:a05:600c:5012:b0:439:98b0:f8ce with SMTP id
 5b1f17b1804b1-43ab60f0c1bmr25519295e9.7.1740506386063; 
 Tue, 25 Feb 2025 09:59:46 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:44 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 04/16] drm/vkms: Allow to configure the plane type via
 configfs
Date: Tue, 25 Feb 2025 18:59:24 +0100
Message-ID: <20250225175936.7223-5-jose.exposito89@gmail.com>
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

When a plane is created, add a `type` file to allow to set the type:

 - 0 overlay
 - 1 primary
 - 2 cursor

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  5 ++++
 drivers/gpu/drm/vkms/vkms_configfs.c | 43 ++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

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
index 4f9d3341e6c0..c2e1eef75906 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -55,6 +55,48 @@ struct vkms_configfs_plane {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+static ssize_t plane_type_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	guard(mutex)(&plane->dev->lock);
+	return sprintf(page, "%u", vkms_config_plane_get_type(plane->config));
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
+	guard(mutex)(&plane->dev->lock);
+
+	if (plane->dev->enabled)
+		return -EBUSY;
+
+	vkms_config_plane_set_type(plane->config, type);
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
@@ -73,6 +115,7 @@ static struct configfs_item_operations plane_item_operations = {
 };
 
 static const struct config_item_type plane_item_type = {
+	.ct_attrs	= plane_item_attrs,
 	.ct_item_ops	= &plane_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.48.1

