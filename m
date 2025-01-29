Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9EBA21B8A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF4510E7A8;
	Wed, 29 Jan 2025 11:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KBLET8Ah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5373410E7A7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:15 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so6432545f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148474; x=1738753274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vojZaZ8F+NK/iPnjUpn4N9qYryOnpEU70w91WMVOaic=;
 b=KBLET8AhlfGqD40FrgieSyBaJMoKaNQK1oXkRBHztnnaruXK1OEon1z5VHqAjQuL7U
 T4QknpEzP6Hf7veg53e99gsb1QFeb48Gkdsci6s3Uo5Tm2xE7B/2PrlpcgE9ZbsPbDmq
 /mOl8ceG4kuj4b0oqFo1+Yi8U+izR3ypE8rpH2AQXN2tTS5EfLZ0MxM3+hm19PTVFzNX
 SAW15ncbx2fMCHiPGg1oIuF+dW4c0bem226Ju5oRTb6t1hKFnCBr32CEkcvqcYL3QNhM
 Q/EmTuhfu5BDPTyu3XxBnyCKduHPxmTNzNLrEeknzrVtMfEomkJZ2+5H49gR7Bx5pR6J
 3r+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148474; x=1738753274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vojZaZ8F+NK/iPnjUpn4N9qYryOnpEU70w91WMVOaic=;
 b=Vu3MbthkUe0lfwNipq4iWIXKgfjxbDlbIqyBbEenc6M27ztHdbI89UaYUBtYDJ++Jf
 /9z+2qPWe+1MOgNvYOq9Xtx/bWMMQoqzq8N2joupibIU0lW6Azy0w1zMsRGTt4DO2hz9
 ZJjQ8M+QGxyGqj8FKeIOu0ehZPyBcuzAe4335qjP4LOvD6AucWalWyAGXjE2qWPFLJ5F
 J1fpgcMXs57FEwES3kQw0UHX1tRB8wmnD7Eu7sTJPfv9l4ihBG4++hvch/Y3+5NY1Bcb
 dH+x1T+lXXA8cHUAVnZERKJCmTdnV6uOn/m2eec3G1LMIPDXVANYGPHQYlc7Aj+nKrGT
 TlGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3+6Rcshj61YeK2PHJcNC+hBlUfXBZajvvi7/15/pPJlcgrsTvWe89Q4x1OFMK6C59Min9+Pof5BI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiKUzGt++yuJNwQHPXxL6mH4sPS7+faxH78ofR1KkOFAqaPEK4
 wds9Bs9GRRiNiwaV2XFNS+ZlCfNwsuK1ODF1ckACRQr01GD99XMJ
X-Gm-Gg: ASbGnctl6wfm3IXN+3W2FiIJCYDhJW+5B9pJWkHGdM9i00pUidpVA3kWwa2uxbfKb21
 KWN7DAVzqqYRs8769ryJYLvrYS97y1jPtqZwSSgOrYjGDJgAAQt2aaOA/S44dKUqdKUxjp3dGCb
 Rxc39mow9NF5uJh4WmP6IJewGOblAwYbpUbukHEftfXPG4SxXie94F0vFvBbjLGE1SoqI5sbm5Q
 OXIFlWDWfHj0L590ECjt2+UkQgdiUG1hkEJigUK6r+2BaBWRvOXxOD+MstD9YtFQOC0JCb7SYMV
 vZYztwRQOTo7Ie5B
X-Google-Smtp-Source: AGHT+IGlv8nmLgUmiKojqFWxzvaUL7Lfp9PLXTfmvbPvfCDgXUEhyDos5aI69wAbNCN9hEyXOrofYw==
X-Received: by 2002:a5d:6c66:0:b0:38b:d7d2:12f6 with SMTP id
 ffacd0b85a97d-38c51932163mr2081326f8f.2.1738148473606; 
 Wed, 29 Jan 2025 03:01:13 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:12 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 07/13] drm/vkms: Allow to configure multiple planes
Date: Wed, 29 Jan 2025 12:00:53 +0100
Message-ID: <20250129110059.12199-8-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129110059.12199-1-jose.exposito89@gmail.com>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
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

Add a list of planes to vkms_config and create as many planes as
configured during output initialization.

For backwards compatibility, add one primary plane and, if configured,
one cursor plane and NUM_OVERLAY_PLANES planes to the default
configuration.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 133 +++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.c            | 149 +++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h            |  78 ++++++++-
 drivers/gpu/drm/vkms/vkms_output.c            |  67 ++++----
 4 files changed, 386 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 66c2c6cb4a0e..7d9cb3956741 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -24,6 +24,10 @@ static void vkms_config_test_empty_config(struct kunit *test)
 	dev_name = NULL;
 	KUNIT_EXPECT_STREQ(test, vkms_config_get_device_name(config), "test");
 
+	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
 	vkms_config_destroy(config);
 }
 
@@ -44,16 +48,138 @@ static void vkms_config_test_default_config(struct kunit *test)
 {
 	const struct default_config_case *params = test->param_value;
 	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+	int n_primaries = 0;
+	int n_cursors = 0;
+	int n_overlays = 0;
 
 	config = vkms_config_default_create(params->enable_cursor,
 					    params->enable_writeback,
 					    params->enable_overlay);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
-	KUNIT_EXPECT_EQ(test, config->cursor, params->enable_cursor);
 	KUNIT_EXPECT_EQ(test, config->writeback, params->enable_writeback);
-	KUNIT_EXPECT_EQ(test, config->overlay, params->enable_overlay);
 
+	/* Planes */
+	list_for_each_entry(plane_cfg, &config->planes, link) {
+		switch (vkms_config_plane_get_type(plane_cfg)) {
+		case DRM_PLANE_TYPE_PRIMARY:
+			n_primaries++;
+			break;
+		case DRM_PLANE_TYPE_CURSOR:
+			n_cursors++;
+			break;
+		case DRM_PLANE_TYPE_OVERLAY:
+			n_overlays++;
+			break;
+		default:
+			KUNIT_FAIL_AND_ABORT(test, "Unknown plane type");
+		}
+	}
+	KUNIT_EXPECT_EQ(test, n_primaries, 1);
+	KUNIT_EXPECT_EQ(test, n_cursors, params->enable_cursor ? 1 : 0);
+	KUNIT_EXPECT_EQ(test, n_overlays, params->enable_overlay ? 8 : 0);
+
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_get_planes(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg1, *plane_cfg2;
+	struct vkms_config_plane **array;
+	size_t length;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	array = vkms_config_get_planes(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	plane_cfg1 = vkms_config_add_plane(config);
+	array = vkms_config_get_planes(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg1);
+	kfree(array);
+
+	plane_cfg2 = vkms_config_add_plane(config);
+	array = vkms_config_get_planes(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 2);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg1);
+	KUNIT_ASSERT_PTR_EQ(test, array[1], plane_cfg2);
+	kfree(array);
+
+	vkms_config_destroy_plane(plane_cfg1);
+	array = vkms_config_get_planes(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg2);
+	kfree(array);
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_valid_plane_number(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+	int n;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	/* Invalid: No planes */
+	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
+	vkms_config_destroy_plane(plane_cfg);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Too many planes */
+	for (n = 0; n <= 32; n++)
+		vkms_config_add_plane(config);
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_valid_plane_type(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
+	vkms_config_destroy_plane(plane_cfg);
+
+	/* Invalid: No primary plane */
+	plane_cfg = vkms_config_add_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Multiple primary planes */
+	plane_cfg = vkms_config_add_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	plane_cfg = vkms_config_add_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: One primary plane */
+	vkms_config_destroy_plane(plane_cfg);
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Multiple cursor planes */
+	plane_cfg = vkms_config_add_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	plane_cfg = vkms_config_add_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: One primary and one cursor plane */
+	vkms_config_destroy_plane(plane_cfg);
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -63,6 +189,9 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
 			 default_config_gen_params),
+	KUNIT_CASE(vkms_config_test_get_planes),
+	KUNIT_CASE(vkms_config_test_valid_plane_number),
+	KUNIT_CASE(vkms_config_test_valid_plane_type),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 67f71d29596e..a5a77612645f 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -21,6 +21,8 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 		return ERR_PTR(-ENOMEM);
 	}
 
+	INIT_LIST_HEAD(&config->planes);
+
 	return config;
 }
 
@@ -29,26 +31,139 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 					       bool enable_overlay)
 {
 	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+	int n;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
 		return config;
 
-	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
-	config->overlay = enable_overlay;
+
+	plane_cfg = vkms_config_add_plane(config);
+	if (IS_ERR(plane_cfg))
+		goto err_alloc;
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+
+	if (enable_overlay) {
+		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
+			plane_cfg = vkms_config_add_plane(config);
+			if (IS_ERR(plane_cfg))
+				goto err_alloc;
+			vkms_config_plane_set_type(plane_cfg,
+						   DRM_PLANE_TYPE_OVERLAY);
+		}
+	}
+
+	if (enable_cursor) {
+		plane_cfg = vkms_config_add_plane(config);
+		if (IS_ERR(plane_cfg))
+			goto err_alloc;
+		vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	}
 
 	return config;
+
+err_alloc:
+	vkms_config_destroy(config);
+	return ERR_PTR(-ENOMEM);
 }
 
 void vkms_config_destroy(struct vkms_config *config)
 {
+	struct vkms_config_plane *plane_cfg, *plane_tmp;
+
+	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
+		vkms_config_destroy_plane(plane_cfg);
+
 	kfree_const(config->dev_name);
 	kfree(config);
 }
 
+struct vkms_config_plane **vkms_config_get_planes(const struct vkms_config *config,
+						  size_t *out_length)
+{
+	struct vkms_config_plane **array;
+	struct vkms_config_plane *plane_cfg;
+	size_t length;
+	int n = 0;
+
+	length = list_count_nodes((struct list_head *)&config->planes);
+	if (length == 0) {
+		*out_length = length;
+		return NULL;
+	}
+
+	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
+	if (!array)
+		return ERR_PTR(-ENOMEM);
+
+	list_for_each_entry(plane_cfg, &config->planes, link) {
+		array[n] = plane_cfg;
+		n++;
+	}
+
+	*out_length = length;
+	return array;
+}
+
+static bool valid_plane_number(struct vkms_config *config)
+{
+	size_t n_planes;
+
+	n_planes = list_count_nodes(&config->planes);
+	if (n_planes <= 0 || n_planes >= 32) {
+		pr_err("The number of planes must be between 1 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool valid_plane_type(struct vkms_config *config)
+{
+	struct vkms_config_plane *plane_cfg;
+	bool has_primary_plane = false;
+	bool has_cursor_plane = false;
+
+	list_for_each_entry(plane_cfg, &config->planes, link) {
+		enum drm_plane_type type;
+
+		type = vkms_config_plane_get_type(plane_cfg);
+
+		if (type == DRM_PLANE_TYPE_PRIMARY) {
+			if (has_primary_plane) {
+				pr_err("Multiple primary planes\n");
+				return false;
+			}
+
+			has_primary_plane = true;
+		} else if (type == DRM_PLANE_TYPE_CURSOR) {
+			if (has_cursor_plane) {
+				pr_err("Multiple cursor planes\n");
+				return false;
+			}
+
+			has_cursor_plane = true;
+		}
+	}
+
+	if (!has_primary_plane) {
+		pr_err("Primary plane not found\n");
+		return false;
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
+	if (!valid_plane_number(config))
+		return false;
+
+	if (!valid_plane_type(config))
+		return false;
+
 	return true;
 }
 
@@ -58,12 +173,17 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	const char *dev_name;
+	struct vkms_config_plane *plane_cfg;
 
 	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
 	seq_printf(m, "dev_name=%s\n", dev_name);
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
-	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
-	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+
+	list_for_each_entry(plane_cfg, &vkmsdev->config->planes, link) {
+		seq_puts(m, "plane:\n");
+		seq_printf(m, "\ttype=%d\n",
+			   vkms_config_plane_get_type(plane_cfg));
+	}
 
 	return 0;
 }
@@ -77,3 +197,24 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
 	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
 			      ARRAY_SIZE(vkms_config_debugfs_list));
 }
+
+struct vkms_config_plane *vkms_config_add_plane(struct vkms_config *config)
+{
+	struct vkms_config_plane *plane_cfg;
+
+	plane_cfg = kzalloc(sizeof(*plane_cfg), GFP_KERNEL);
+	if (!plane_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+
+	list_add_tail(&plane_cfg->link, &config->planes);
+
+	return plane_cfg;
+}
+
+void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
+{
+	list_del(&plane_cfg->link);
+	kfree(plane_cfg);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 963f22b9b4bd..d9aeba1762d1 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -3,6 +3,7 @@
 #ifndef _VKMS_CONFIG_H_
 #define _VKMS_CONFIG_H_
 
+#include <linux/list.h>
 #include <linux/types.h>
 
 #include "vkms_drv.h"
@@ -12,18 +13,36 @@
  *
  * @dev_name: Name of the device
  * @writeback: If true, a writeback buffer can be attached to the CRTC
- * @cursor: If true, a cursor plane is created in the VKMS device
- * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
+ * @planes: List of planes configured for the device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
 	const char *dev_name;
 	bool writeback;
-	bool cursor;
-	bool overlay;
+	struct list_head planes;
 	struct vkms_device *dev;
 };
 
+/**
+ * struct vkms_config_plane
+ *
+ * @link: Link to the others planes in vkms_config
+ * @type: Type of the plane. The creator of configuration needs to ensures that
+ *        at least one primary plane is present.
+ * @plane: Internal usage. This pointer should never be considered as valid.
+ *         It can be used to store a temporary reference to a VKMS plane during
+ *         device creation. This pointer is not managed by the configuration and
+ *         must be managed by other means.
+ */
+struct vkms_config_plane {
+	struct list_head link;
+
+	enum drm_plane_type type;
+
+	/* Internal usage */
+	struct vkms_plane *plane;
+};
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -64,6 +83,19 @@ vkms_config_get_device_name(struct vkms_config *config)
 	return config->dev_name;
 }
 
+/**
+ * vkms_config_planes() - Return the array of planes of the device
+ * @config: Configuration to get the planes from
+ * @out_length: Length of the returned array
+ *
+ * Returns:
+ * A list of pointers to the configurations. On success, the caller is
+ * responsible to free the returned array, but not its contents. On error,
+ * it returns an error and @out_length is invalid.
+ */
+struct vkms_config_plane **vkms_config_get_planes(const struct vkms_config *config,
+						  size_t *out_length);
+
 /**
  * vkms_config_is_valid() - Validate a configuration
  * @config: Configuration to validate
@@ -81,4 +113,42 @@ bool vkms_config_is_valid(struct vkms_config *config);
  */
 void vkms_config_register_debugfs(struct vkms_device *vkms_device);
 
+/**
+ * vkms_config_add_plane() - Add a new plane configuration
+ * @config: Configuration to add the plane to
+ *
+ * Returns:
+ * The new plane configuration or an error. Call vkms_config_destroy_plane() to
+ * free the returned plane configuration.
+ */
+struct vkms_config_plane *vkms_config_add_plane(struct vkms_config *config);
+
+/**
+ * vkms_config_destroy_plane() - Remove and free a plane configuration
+ * @plane_cfg: Plane configuration to destroy
+ */
+void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg);
+
+/**
+ * vkms_config_plane_type() - Return the plane type
+ * @plane_cfg: Plane to get the type from
+ */
+static inline enum drm_plane_type
+vkms_config_plane_get_type(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->type;
+}
+
+/**
+ * vkms_config_plane_set_type() - Set the plane type
+ * @plane_cfg: Plane to set the type to
+ * @type: New plane type
+ */
+static inline void
+vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
+			   enum drm_plane_type type)
+{
+	plane_cfg->type = type;
+}
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 068a7f87ecec..b2ae269e5827 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -11,61 +11,63 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	struct vkms_connector *connector;
 	struct drm_encoder *encoder;
 	struct vkms_output *output;
-	struct vkms_plane *primary, *overlay, *cursor = NULL;
-	int ret;
+	struct vkms_plane *primary = NULL, *cursor = NULL;
+	struct vkms_config_plane **plane_cfgs = NULL;
+	size_t n_planes;
+	int ret = 0;
 	int writeback;
 	unsigned int n;
 
-	/*
-	 * Initialize used plane. One primary plane is required to perform the composition.
-	 *
-	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
-	 * composition.
-	 */
-	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
-	if (IS_ERR(primary))
-		return PTR_ERR(primary);
+	plane_cfgs = vkms_config_get_planes(vkmsdev->config, &n_planes);
+	if (IS_ERR(plane_cfgs))
+		return PTR_ERR(plane_cfgs);
 
-	if (vkmsdev->config->cursor) {
-		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
-		if (IS_ERR(cursor))
-			return PTR_ERR(cursor);
+	for (n = 0; n < n_planes; n++) {
+		struct vkms_config_plane *plane_cfg;
+		enum drm_plane_type type;
+
+		plane_cfg = plane_cfgs[n];
+		type = vkms_config_plane_get_type(plane_cfg);
+
+		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
+		if (IS_ERR(plane_cfg->plane)) {
+			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
+			ret = PTR_ERR(plane_cfg->plane);
+			goto err_free;
+		}
+
+		if (type == DRM_PLANE_TYPE_PRIMARY)
+			primary = plane_cfg->plane;
+		else if (type == DRM_PLANE_TYPE_CURSOR)
+			cursor = plane_cfg->plane;
 	}
 
 	output = vkms_crtc_init(dev, &primary->base,
 				cursor ? &cursor->base : NULL);
 	if (IS_ERR(output)) {
 		DRM_ERROR("Failed to allocate CRTC\n");
-		return PTR_ERR(output);
-	}
-
-	if (vkmsdev->config->overlay) {
-		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
-			if (IS_ERR(overlay)) {
-				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
-				return PTR_ERR(overlay);
-			}
-			overlay->base.possible_crtcs = drm_crtc_mask(&output->crtc);
-		}
+		ret = PTR_ERR(output);
+		goto err_free;
 	}
 
 	connector = vkms_connector_init(vkmsdev);
 	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
-		return PTR_ERR(connector);
+		ret = PTR_ERR(connector);
+		goto err_free;
 	}
 
 	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
 	if (!encoder) {
 		DRM_ERROR("Failed to allocate encoder\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_free;
 	}
 	ret = drmm_encoder_init(dev, encoder, NULL,
 				DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
-		return ret;
+		goto err_free;
 	}
 	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
 
@@ -73,7 +75,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	ret = drm_connector_attach_encoder(&connector->base, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
-		return ret;
+		goto err_free;
 	}
 
 	/* Initialize the writeback component */
@@ -85,5 +87,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_mode_config_reset(dev);
 
+err_free:
+	kfree(plane_cfgs);
+
 	return ret;
 }
-- 
2.48.1

