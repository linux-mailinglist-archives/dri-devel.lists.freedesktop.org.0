Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB39A3097B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1699E10E671;
	Tue, 11 Feb 2025 11:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KTfAIfow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B4A10E66B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:30 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38dcc6bfbccso2248534f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272169; x=1739876969; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2kmfXhT9BzoK/pB6AuaP8lD3p6L3Xv05Wido6gdYTs=;
 b=KTfAIfowVq7BeP9fDMbvEoYkcEAWwPRxLTfyeIhXerhBAgr5/YNdS3GQomOBgvsDYn
 0FMXsT/S5+J2YXoA2OQdVh8j0kO8gXMRXMLGa2NaslZcIPLL4eW5Hu2OHpD3KT+9/H+p
 5ojXPrb9yiY6Z1HISJkljcGlGb/YbPr3/9QEhWazto78B5kCPEztg56rFd5J7TkwVdnq
 SKAjjajliEbUquxmuZqXy76uVdJ2IQoVdlAb8TwHnZQuZiv4WHahwrZUVZLMLNOfTxvJ
 XNuGSm/uEyy7cExMJx7fcdfSNUla/meuGX6AtThvVqBgdRZZH+xIX1CVTWBRU4y7D4Vd
 5iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272169; x=1739876969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B2kmfXhT9BzoK/pB6AuaP8lD3p6L3Xv05Wido6gdYTs=;
 b=ComQS/ZecaEpZeJ0B8rfdUXuU7PRFR/Zg1gry9HzkS+FT28L+Jiz9R5nPvohKQJzHY
 E9Rcvxb9bNIx/4SKBEOm1mzEYclJq0MIKddQQGL33tX5RLDz3YBf533yBkYOIk5sNqAD
 VF2dg8hupoabmhEj3CNdHA9VKQJ8NgbyCcsmKIJF1JRnjbjflmO1NCrpSoOoWbgQFhAm
 y++HyzeQ5s20FCSKMvzVgQE3rZtDho3pxBNPE2LOIqdY+DzB3rlaOok0JFdYtz11aqM1
 kGXWB5eE4AvaRBJXb9k3JdbvsZZWYUQ1KyJbXTLzYOgZwv7jswi5nCjOo7dydaP+mQQy
 Brfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmblaiB5PnDFhJdSgF4LOFVaB7wBrULFxqLjNaZcesb0+whOLpMdMLTEzKQ798m/siv7DoMfjC09s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziP8Gdiev6qmWK4poUHiMgTmAbzzHP21e4DmQFAK78o8sIaHNM
 W8J0uXujCPalKbEmoKCb8oOh14CuprRQqMJt16g/xzlKn5Ogrhls
X-Gm-Gg: ASbGncvOjAHFalApDrSey3cppjXuI4A7OH27C6jtEzgLE6nk1poq7yqSJbHdepANNqU
 8HB29dZeLDhPed0C8v1blqfJPW27GQCrqJG53v6dbBYydRwvZuYwSO6QdHC5+/z6eHy7k5G9HNG
 Lb1X2/r1SAJP/wG8Dd1NVSzxzgcx0mfI/Iqst2uqV3KfkYHSWf/e7SlHjhvJSoq9kcjD05EVWke
 UQxOf7L5ujzzYPI0iTr1n3Z/PwrAOLis67aNjv8F2bYe/mbRBiUYkOPtLQg4qnOThCpWoLay9YD
 HNePyV3pPU6ssUCX
X-Google-Smtp-Source: AGHT+IEzl7v9Ctoqur7uCVRnL8fUQKBIvhoP1P3h6FkEuOOmER8stFwB4z2yi1f8X0XCRNCSRLIZzQ==
X-Received: by 2002:a05:6000:156f:b0:38d:d9e7:54a8 with SMTP id
 ffacd0b85a97d-38dd9e756f9mr7286984f8f.19.1739272168677; 
 Tue, 11 Feb 2025 03:09:28 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:28 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 09/15] drm/vkms: Allow to configure multiple planes
Date: Tue, 11 Feb 2025 12:09:06 +0100
Message-ID: <20250211110912.15409-10-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211110912.15409-1-jose.exposito89@gmail.com>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
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

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |   1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 140 +++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.c            | 124 +++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h            |  73 ++++++++-
 drivers/gpu/drm/vkms/vkms_output.c            |  42 ++----
 5 files changed, 344 insertions(+), 36 deletions(-)

diff --git a/.clang-format b/.clang-format
index fe1aa1a30d40..c585d2a5b395 100644
--- a/.clang-format
+++ b/.clang-format
@@ -690,6 +690,7 @@ ForEachMacros:
   - 'v4l2_m2m_for_each_src_buf'
   - 'v4l2_m2m_for_each_src_buf_safe'
   - 'virtio_device_for_each_vq'
+  - 'vkms_config_for_each_plane'
   - 'while_for_each_ftrace_op'
   - 'xa_for_each'
   - 'xa_for_each_marked'
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 6e07139d261c..38ec456d9610 100644
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
 
@@ -44,16 +48,145 @@ static void vkms_config_test_default_config(struct kunit *test)
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
+	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_plane *plane_cfg1, *plane_cfg2;
+	int n_planes = 0;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	vkms_config_for_each_plane(config, plane_cfg)
+		n_planes++;
+	KUNIT_ASSERT_EQ(test, n_planes, 0);
+
+	plane_cfg1 = vkms_config_create_plane(config);
+	vkms_config_for_each_plane(config, plane_cfg) {
+		n_planes++;
+		if (plane_cfg != plane_cfg1)
+			KUNIT_FAIL(test, "Unexpected plane");
+	}
+	KUNIT_ASSERT_EQ(test, n_planes, 1);
+	n_planes = 0;
+
+	plane_cfg2 = vkms_config_create_plane(config);
+	vkms_config_for_each_plane(config, plane_cfg) {
+		n_planes++;
+		if (plane_cfg != plane_cfg1 && plane_cfg != plane_cfg2)
+			KUNIT_FAIL(test, "Unexpected plane");
+	}
+	KUNIT_ASSERT_EQ(test, n_planes, 2);
+	n_planes = 0;
+
+	vkms_config_destroy_plane(plane_cfg1);
+	vkms_config_for_each_plane(config, plane_cfg) {
+		n_planes++;
+		if (plane_cfg != plane_cfg2)
+			KUNIT_FAIL(test, "Unexpected plane");
+	}
+	KUNIT_ASSERT_EQ(test, n_planes, 1);
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_invalid_plane_number(struct kunit *test)
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
+		vkms_config_create_plane(config);
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
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Multiple primary planes */
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: One primary plane */
+	vkms_config_destroy_plane(plane_cfg);
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Multiple cursor planes */
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: One primary and one cursor plane */
+	vkms_config_destroy_plane(plane_cfg);
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -63,6 +196,9 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
 			 default_config_gen_params),
+	KUNIT_CASE(vkms_config_test_get_planes),
+	KUNIT_CASE(vkms_config_test_invalid_plane_number),
+	KUNIT_CASE(vkms_config_test_valid_plane_type),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 67f71d29596e..8feacfc155be 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -21,6 +21,8 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 		return ERR_PTR(-ENOMEM);
 	}
 
+	INIT_LIST_HEAD(&config->planes);
+
 	return config;
 }
 
@@ -29,26 +31,114 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
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
+	plane_cfg = vkms_config_create_plane(config);
+	if (IS_ERR(plane_cfg))
+		goto err_alloc;
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+
+	if (enable_overlay) {
+		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
+			plane_cfg = vkms_config_create_plane(config);
+			if (IS_ERR(plane_cfg))
+				goto err_alloc;
+			vkms_config_plane_set_type(plane_cfg,
+						   DRM_PLANE_TYPE_OVERLAY);
+		}
+	}
+
+	if (enable_cursor) {
+		plane_cfg = vkms_config_create_plane(config);
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
 
+static bool valid_plane_number(struct vkms_config *config)
+{
+	struct drm_device *dev = &config->dev->drm;
+	size_t n_planes;
+
+	n_planes = list_count_nodes(&config->planes);
+	if (n_planes <= 0 || n_planes >= 32) {
+		drm_info(dev, "The number of planes must be between 1 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool valid_plane_type(struct vkms_config *config)
+{
+	struct drm_device *dev = &config->dev->drm;
+	struct vkms_config_plane *plane_cfg;
+	bool has_primary_plane = false;
+	bool has_cursor_plane = false;
+
+	vkms_config_for_each_plane(config, plane_cfg) {
+		enum drm_plane_type type;
+
+		type = vkms_config_plane_get_type(plane_cfg);
+
+		if (type == DRM_PLANE_TYPE_PRIMARY) {
+			if (has_primary_plane) {
+				drm_info(dev, "Multiple primary planes\n");
+				return false;
+			}
+
+			has_primary_plane = true;
+		} else if (type == DRM_PLANE_TYPE_CURSOR) {
+			if (has_cursor_plane) {
+				drm_info(dev, "Multiple cursor planes\n");
+				return false;
+			}
+
+			has_cursor_plane = true;
+		}
+	}
+
+	if (!has_primary_plane) {
+		drm_info(dev, "Primary plane not found\n");
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
 
@@ -58,12 +148,17 @@ static int vkms_config_show(struct seq_file *m, void *data)
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
+	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
+		seq_puts(m, "plane:\n");
+		seq_printf(m, "\ttype=%d\n",
+			   vkms_config_plane_get_type(plane_cfg));
+	}
 
 	return 0;
 }
@@ -77,3 +172,24 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
 	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
 			      ARRAY_SIZE(vkms_config_debugfs_list));
 }
+
+struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
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
index 0376dceaf6be..1c7ffc27f2a8 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -3,6 +3,7 @@
 #ifndef _VKMS_CONFIG_H_
 #define _VKMS_CONFIG_H_
 
+#include <linux/list.h>
 #include <linux/types.h>
 
 #include "vkms_drv.h"
@@ -12,18 +13,44 @@
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
+/**
+ * vkms_config_for_each_plane - Iterate over the vkms_config planes
+ * @config: &struct vkms_config pointer
+ * @plane_cfg: &struct vkms_config_plane pointer used as cursor
+ */
+#define vkms_config_for_each_plane(config, plane_cfg) \
+	list_for_each_entry((plane_cfg), &(config)->planes, link)
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -84,4 +111,42 @@ bool vkms_config_is_valid(struct vkms_config *config);
  */
 void vkms_config_register_debugfs(struct vkms_device *vkms_device);
 
+/**
+ * vkms_config_create_plane() - Add a new plane configuration
+ * @config: Configuration to add the plane to
+ *
+ * Returns:
+ * The new plane configuration or an error. Call vkms_config_destroy_plane() to
+ * free the returned plane configuration.
+ */
+struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config);
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
index 414cc933af41..08ea691db299 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -11,28 +11,29 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	struct vkms_connector *connector;
 	struct drm_encoder *encoder;
 	struct vkms_output *output;
-	struct vkms_plane *primary, *overlay, *cursor = NULL;
+	struct vkms_plane *primary = NULL, *cursor = NULL;
+	struct vkms_config_plane *plane_cfg;
 	int ret;
 	int writeback;
-	unsigned int n;
 
 	if (!vkms_config_is_valid(vkmsdev->config))
 		return -EINVAL;
 
-	/*
-	 * Initialize used plane. One primary plane is required to perform the composition.
-	 *
-	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
-	 * composition.
-	 */
-	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
-	if (IS_ERR(primary))
-		return PTR_ERR(primary);
+	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
+		enum drm_plane_type type;
 
-	if (vkmsdev->config->cursor) {
-		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
-		if (IS_ERR(cursor))
-			return PTR_ERR(cursor);
+		type = vkms_config_plane_get_type(plane_cfg);
+
+		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
+		if (IS_ERR(plane_cfg->plane)) {
+			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
+			return PTR_ERR(plane_cfg->plane);
+		}
+
+		if (type == DRM_PLANE_TYPE_PRIMARY)
+			primary = plane_cfg->plane;
+		else if (type == DRM_PLANE_TYPE_CURSOR)
+			cursor = plane_cfg->plane;
 	}
 
 	output = vkms_crtc_init(dev, &primary->base,
@@ -42,17 +43,6 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		return PTR_ERR(output);
 	}
 
-	if (vkmsdev->config->overlay) {
-		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
-			if (IS_ERR(overlay)) {
-				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
-				return PTR_ERR(overlay);
-			}
-			overlay->base.possible_crtcs = drm_crtc_mask(&output->crtc);
-		}
-	}
-
 	connector = vkms_connector_init(vkmsdev);
 	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
-- 
2.48.1

