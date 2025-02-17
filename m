Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDDBA37F37
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DFD10E405;
	Mon, 17 Feb 2025 10:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hyOfJE8V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6289410E3E8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:01:35 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4396a24118dso26415815e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786494; x=1740391294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSrfW4vID/ZAsmlpyoSMJry7zJ9YdWQKmVlp2hDaPt4=;
 b=hyOfJE8VQdg0Q1Dab1YxPZU2GLcF2HGQ9tmOFYW420Jniwz/p9U6PvZXGGE2eDQ3It
 7c309zBmLUMqdHaoCHhRURUc9kyXb4k5nfB9Wul0e5U3TPbDizFBQ/ZLMC2PbrUI46a8
 eeGb56p1GuCgfJxkBAILGHF7/nKgbmXyrKDWOokKoBWkwIXeMFNSufXjqBYQ3Y53RTDw
 AXpyRaZDSjNPgZR16CJEbRyg59iy6HJLMFBBmDnon35758AVmVSj9I6Hqrtca7AzpktA
 InzfHQ9pjD2INLysXVHGcXHDcdBrzDifHVLW6xGkblRzQDYUdQSGQUKccKIXAEqPPv7f
 +Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786494; x=1740391294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSrfW4vID/ZAsmlpyoSMJry7zJ9YdWQKmVlp2hDaPt4=;
 b=sd1GmGtIVW/kjjBEtk7SBd8GAMYjPY1vDLiitw3Reb0+DmEnCBn0lrav193RB3EwcI
 1delcK4tSRnzogaXR8HvM/gxLH03m/8yhmmK+tBmt8E6utcSyVJP1Erf8E55oznenEUk
 kSn02U8Y/Doj5yuKkmfTNZ8Zp8rH6Th87QHXHYRKIkKxA/tMCuIGgQw/XVd9Wj5hgUC6
 rOhf/6vfo0wfArTBceDsv6EN8kFH0JhOpmAi+Apfk/iyaBIxdRgeeKAlBHn9Zfn6DEBR
 wVutbNwr2u6W0Zn++dYl6hPyoHTQPrK/GbiGa2K6rHT/0QJdb0qYxFeZe45fMpnBaezp
 ZRnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/5ZQNhtGWrUIpHpre4R+ukuhs8suhSKveX/7faXvW4iXpggQHdyIb+zpS0zsBozRHfrvkbglGyew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT5xOKi5Cd4yFT6dodY5ZdBcuSzypx2w472Nw5Kz6epSk7Tfqx
 64PZHMbUZBRvSenxB92cCOl1Z4Yv3rj/V+lqd5tCrByepMw7xr8u
X-Gm-Gg: ASbGncsHtFtb0dTs2LHjtXNklDRDQLZ6/d5DKU6xDa2C4uU5JE13q4tLh+5bUQnymPx
 /QuiVltdLuzQB+Wg7XcUxW2KHtIfCcrmfVeYVW9Lyo588qqMHYvdJyKsCFw7dQK1c+Wt+3Kz/p+
 7/XhT/8ffud1VwPOfTk6UnLSt39Ok0Dhbv1Gv0x2Y/NTSlvK8HodbJ1nTh/JIsxSLRP6HXr9Lpf
 tQX/BNsZu4NdZWMgYecu+ahNaNKYb3yeCReRCI2Nh+7cLN+t0tGLZA+5Xn/kBGJAihR/0duPb3V
 EPA+Hfvdp6SIG94mKg==
X-Google-Smtp-Source: AGHT+IE4VXLne6sIG307xQsNtrMPLrSZtXRSPD2+s47ILm99USQ8Tj9BzGbdQDRZCI621/kHUhRIhA==
X-Received: by 2002:a05:6000:1ac5:b0:38f:32ac:7e55 with SMTP id
 ffacd0b85a97d-38f33f53f34mr9012471f8f.48.1739786493628; 
 Mon, 17 Feb 2025 02:01:33 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm11591901f8f.86.2025.02.17.02.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:01:33 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 08/14] drm/vkms: Allow to configure multiple planes
Date: Mon, 17 Feb 2025 11:01:14 +0100
Message-ID: <20250217100120.7620-9-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217100120.7620-1-jose.exposito89@gmail.com>
References: <20250217100120.7620-1-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/vkms/vkms_config.c            | 127 +++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h            |  75 +++++++++-
 drivers/gpu/drm/vkms/vkms_output.c            |  42 ++----
 5 files changed, 349 insertions(+), 36 deletions(-)

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
index 6e07139d261c..fe6f079902fd 100644
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
+	vkms_config_for_each_plane(config, plane_cfg) {
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
index d1947537834c..3c3f5cf79058 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -22,6 +22,8 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 		return ERR_PTR(-ENOMEM);
 	}
 
+	INIT_LIST_HEAD(&config->planes);
+
 	return config;
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create);
@@ -31,28 +33,116 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
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
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_default_create);
 
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
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy);
 
+static bool valid_plane_number(const struct vkms_config *config)
+{
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
+	size_t n_planes;
+
+	n_planes = list_count_nodes((struct list_head *)&config->planes);
+	if (n_planes <= 0 || n_planes >= 32) {
+		drm_info(dev, "The number of planes must be between 1 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool valid_plane_type(const struct vkms_config *config)
+{
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
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
 bool vkms_config_is_valid(const struct vkms_config *config)
 {
+	if (!valid_plane_number(config))
+		return false;
+
+	if (!valid_plane_type(config))
+		return false;
+
 	return true;
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_is_valid);
@@ -63,12 +153,17 @@ static int vkms_config_show(struct seq_file *m, void *data)
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
@@ -82,3 +177,27 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
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
+	plane_cfg->config = config;
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+
+	list_add_tail(&plane_cfg->link, &config->planes);
+
+	return plane_cfg;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
+
+void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
+{
+	list_del(&plane_cfg->link);
+	kfree(plane_cfg);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_plane);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 31c758631c37..613e98760640 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -3,6 +3,7 @@
 #ifndef _VKMS_CONFIG_H_
 #define _VKMS_CONFIG_H_
 
+#include <linux/list.h>
 #include <linux/types.h>
 
 #include "vkms_drv.h"
@@ -12,18 +13,46 @@
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
+ * @config: The vkms_config this plane belongs to
+ * @type: Type of the plane. The creator of configuration needs to ensures that
+ *        at least one primary plane is present.
+ * @plane: Internal usage. This pointer should never be considered as valid.
+ *         It can be used to store a temporary reference to a VKMS plane during
+ *         device creation. This pointer is not managed by the configuration and
+ *         must be managed by other means.
+ */
+struct vkms_config_plane {
+	struct list_head link;
+	struct vkms_config *config;
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
@@ -84,4 +113,42 @@ bool vkms_config_is_valid(const struct vkms_config *config);
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

