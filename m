Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD6A39865
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6466D10E664;
	Tue, 18 Feb 2025 10:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZGFAA7u/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C1110E65B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:12:32 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-38f26a82d1dso2494389f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873550; x=1740478350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g7PM6zrdnrOUlqVaTX6Gb4KKvYDoSsi4rkHPEyXeezU=;
 b=ZGFAA7u//JPTxLb8oBCzRd1tP3Ksi4x4UWXTsrCHd60rzl7wgay8YpaZZpqbwRaxMY
 WlKR6VcexbzHh80OjvtAojSjgWCyuInQNx0SiWXsazeowfsjyFWuCjgfM+dr+KZDnUsa
 P330o0op3KSpjZYnaSUcOtF4dI2j3vr0pP2uIaILSXN4v94S6abMXhgWq545PZSUHreo
 mRgYqzVIfq+51Z49iwnBJcKTK13cZmFGBhLAs9ARVhtsrbDQYFZQGGJbjqjHZSsG3vsr
 1OWNjbD2GtVDHmBnjm6Bd5Xq8OaVqfIKgvdPcprMi6rgVM3J7osSl+botZqkGrw2A6ve
 WMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873550; x=1740478350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g7PM6zrdnrOUlqVaTX6Gb4KKvYDoSsi4rkHPEyXeezU=;
 b=HbVLFUjb6ePuah4YIQiJ//K5o7hTiB4ZfUsQUGXVzn+rN2d6zpLiff/1fzB0C5iru+
 bg3kaMIHWAggtSRnR9mPmiAdlTuvtHeO7qDTP4xvMtErW3es2ZVHkWOoFTuXMn9R/xgr
 7Hsx5ktDSCmca7Gh2NQsxmBnN2+ri8F7m6Gbac8NtLB1/am7AVCc/wr2/ty+lJWD3ADk
 89YDS+vEz+Aqa6SWHzb8YgZjSiysUNr4sxmTiZdaSx25nJBTTkLoz7nqG2ss2+T9NO83
 bnrvhqL80PJls2iDRlHWDUmeSgAO67POLc7Jzadte59bC10GzkVxiovTl/F+ij3S4WTE
 T8AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/6YGJ279pqIZEkFRTxur1vLBnCcN0K0GaDPnbICjNdLzHE4fefA8Fc8uE4/RovuQ5mCkNH0ASgq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS8qLKap747hUixzxYhxST8FqH1tU+sFtL7d94+Cir/u880n4b
 Bby0ZkpPyIRBuIB3B0bg1N9ezIWZ1lJkKjBRyEZhwTyZ9fBK43WP
X-Gm-Gg: ASbGncsgFoH/Wfj09O7w3SBsatmiT3LgkpbICt6NAEAY6B0GUNRGATAXI3iB2zKdTOn
 nrv7i5TIygaspwPISkTeEFYYReUu6smIJv6kJpjQBG59uLKN93CuEN7LlIuIfev/TT8vWz7IVVD
 Ly2+oNW4NULbr4CJnNMj9oVnph/pNMy5HmVJ+/chUYUWKyasRc3sb72dLW67UfQbwRrcxYnnXuo
 v7c1dIFB5sZOm2jtWQ5LwV41r1UBxTL/fTFqOmZNTRyl1Q2N4IBW3CDr1sq2cRunp2JCdEmf80Z
 Na3jlmf5mjSump5eWg==
X-Google-Smtp-Source: AGHT+IFzyH+cSQTx2cwyV6aD4CTwN0Tzy/I02hfI32Z6goKZXo1clWdpjl1Uf5CmtwD08iki6i0jFQ==
X-Received: by 2002:a5d:638a:0:b0:38d:dfdc:52a2 with SMTP id
 ffacd0b85a97d-38f33f531e1mr10770784f8f.40.1739873550382; 
 Tue, 18 Feb 2025 02:12:30 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm14749720f8f.66.2025.02.18.02.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:12:30 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 09/14] drm/vkms: Allow to configure multiple CRTCs
Date: Tue, 18 Feb 2025 11:12:09 +0100
Message-ID: <20250218101214.5790-10-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218101214.5790-1-jose.exposito89@gmail.com>
References: <20250218101214.5790-1-jose.exposito89@gmail.com>
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

Add a list of CRTCs to vkms_config and helper functions to add and
remove as many CRTCs as wanted.

For backwards compatibility, add one CRTC to the default configuration.

A future patch will allow to attach planes and CRTCs, but for the
moment there are no changes in the way the output is configured.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |  1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 83 ++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.c            | 63 +++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h            | 80 ++++++++++++++++++
 4 files changed, 222 insertions(+), 5 deletions(-)

diff --git a/.clang-format b/.clang-format
index c585d2a5b395..e7a901c3617d 100644
--- a/.clang-format
+++ b/.clang-format
@@ -690,6 +690,7 @@ ForEachMacros:
   - 'v4l2_m2m_for_each_src_buf'
   - 'v4l2_m2m_for_each_src_buf_safe'
   - 'virtio_device_for_each_vq'
+  - 'vkms_config_for_each_crtc'
   - 'vkms_config_for_each_plane'
   - 'while_for_each_ftrace_op'
   - 'xa_for_each'
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 116db01ba8a0..104120c91c39 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -27,6 +27,16 @@ static struct vkms_config_plane *get_first_plane(struct vkms_config *config)
 	return NULL;
 }
 
+static struct vkms_config_crtc *get_first_crtc(struct vkms_config *config)
+{
+	struct vkms_config_crtc *crtc_cfg;
+
+	vkms_config_for_each_crtc(config, crtc_cfg)
+		return crtc_cfg;
+
+	return NULL;
+}
+
 struct default_config_case {
 	bool enable_cursor;
 	bool enable_writeback;
@@ -46,6 +56,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
 	KUNIT_EXPECT_STREQ(test, vkms_config_get_device_name(config), "test");
 
 	KUNIT_EXPECT_EQ(test, vkms_config_get_num_planes(config), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_get_num_crtcs(config), 0);
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -70,6 +81,7 @@ static void vkms_config_test_default_config(struct kunit *test)
 	const struct default_config_case *params = test->param_value;
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
 	int n_primaries = 0;
 	int n_cursors = 0;
 	int n_overlays = 0;
@@ -79,8 +91,6 @@ static void vkms_config_test_default_config(struct kunit *test)
 					    params->enable_overlay);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
-	KUNIT_EXPECT_EQ(test, config->writeback, params->enable_writeback);
-
 	/* Planes */
 	vkms_config_for_each_plane(config, plane_cfg) {
 		switch (vkms_config_plane_get_type(plane_cfg)) {
@@ -101,6 +111,13 @@ static void vkms_config_test_default_config(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, n_cursors, params->enable_cursor ? 1 : 0);
 	KUNIT_EXPECT_EQ(test, n_overlays, params->enable_overlay ? 8 : 0);
 
+	/* CRTCs */
+	KUNIT_EXPECT_EQ(test, vkms_config_get_num_crtcs(config), 1);
+
+	crtc_cfg = get_first_crtc(config);
+	KUNIT_EXPECT_EQ(test, vkms_config_crtc_get_writeback(crtc_cfg),
+			params->enable_writeback);
+
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -149,6 +166,43 @@ static void vkms_config_test_get_planes(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_get_crtcs(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 0);
+	vkms_config_for_each_crtc(config, crtc_cfg)
+		KUNIT_FAIL(test, "Unexpected CRTC");
+
+	crtc_cfg1 = vkms_config_create_crtc(config);
+	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
+	vkms_config_for_each_crtc(config, crtc_cfg) {
+		if (crtc_cfg != crtc_cfg1)
+			KUNIT_FAIL(test, "Unexpected CRTC");
+	}
+
+	crtc_cfg2 = vkms_config_create_crtc(config);
+	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 2);
+	vkms_config_for_each_crtc(config, crtc_cfg) {
+		if (crtc_cfg != crtc_cfg1 && crtc_cfg != crtc_cfg2)
+			KUNIT_FAIL(test, "Unexpected CRTC");
+	}
+
+	vkms_config_destroy_crtc(config, crtc_cfg2);
+	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
+	vkms_config_for_each_crtc(config, crtc_cfg) {
+		if (crtc_cfg != crtc_cfg1)
+			KUNIT_FAIL(test, "Unexpected CRTC");
+	}
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_invalid_plane_number(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -213,13 +267,38 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_invalid_crtc_number(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_crtc *crtc_cfg;
+	int n;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	/* Invalid: No CRTCs */
+	crtc_cfg = get_first_crtc(config);
+	vkms_config_destroy_crtc(config, crtc_cfg);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Too many CRTCs */
+	for (n = 0; n <= 32; n++)
+		vkms_config_create_crtc(config);
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
 			 default_config_gen_params),
 	KUNIT_CASE(vkms_config_test_get_planes),
+	KUNIT_CASE(vkms_config_test_get_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_plane_number),
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
+	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 3c3f5cf79058..d195db770fae 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -23,6 +23,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 	}
 
 	INIT_LIST_HEAD(&config->planes);
+	INIT_LIST_HEAD(&config->crtcs);
 
 	return config;
 }
@@ -34,19 +35,23 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 {
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
 	int n;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
 		return config;
 
-	config->writeback = enable_writeback;
-
 	plane_cfg = vkms_config_create_plane(config);
 	if (IS_ERR(plane_cfg))
 		goto err_alloc;
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
 
+	crtc_cfg = vkms_config_create_crtc(config);
+	if (IS_ERR(crtc_cfg))
+		goto err_alloc;
+	vkms_config_crtc_set_writeback(crtc_cfg, enable_writeback);
+
 	if (enable_overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
 			plane_cfg = vkms_config_create_plane(config);
@@ -75,10 +80,14 @@ EXPORT_SYMBOL_IF_KUNIT(vkms_config_default_create);
 void vkms_config_destroy(struct vkms_config *config)
 {
 	struct vkms_config_plane *plane_cfg, *plane_tmp;
+	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
 
 	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
 		vkms_config_destroy_plane(plane_cfg);
 
+	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, link)
+		vkms_config_destroy_crtc(config, crtc_cfg);
+
 	kfree_const(config->dev_name);
 	kfree(config);
 }
@@ -135,11 +144,28 @@ static bool valid_plane_type(const struct vkms_config *config)
 	return true;
 }
 
+static bool valid_crtc_number(const struct vkms_config *config)
+{
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
+	size_t n_crtcs;
+
+	n_crtcs = list_count_nodes((struct list_head *)&config->crtcs);
+	if (n_crtcs <= 0 || n_crtcs >= 32) {
+		drm_info(dev, "The number of CRTCs must be between 1 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(const struct vkms_config *config)
 {
 	if (!valid_plane_number(config))
 		return false;
 
+	if (!valid_crtc_number(config))
+		return false;
+
 	if (!valid_plane_type(config))
 		return false;
 
@@ -154,10 +180,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	const char *dev_name;
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
 
 	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
 	seq_printf(m, "dev_name=%s\n", dev_name);
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 
 	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
 		seq_puts(m, "plane:\n");
@@ -165,6 +191,12 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			   vkms_config_plane_get_type(plane_cfg));
 	}
 
+	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
+		seq_puts(m, "crtc:\n");
+		seq_printf(m, "\twriteback=%d\n",
+			   vkms_config_crtc_get_writeback(crtc_cfg));
+	}
+
 	return 0;
 }
 
@@ -201,3 +233,28 @@ void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
 	kfree(plane_cfg);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_plane);
+
+struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *config)
+{
+	struct vkms_config_crtc *crtc_cfg;
+
+	crtc_cfg = kzalloc(sizeof(*crtc_cfg), GFP_KERNEL);
+	if (!crtc_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	crtc_cfg->config = config;
+	vkms_config_crtc_set_writeback(crtc_cfg, false);
+
+	list_add_tail(&crtc_cfg->link, &config->crtcs);
+
+	return crtc_cfg;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_crtc);
+
+void vkms_config_destroy_crtc(struct vkms_config *config,
+			      struct vkms_config_crtc *crtc_cfg)
+{
+	list_del(&crtc_cfg->link);
+	kfree(crtc_cfg);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_crtc);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 613e98760640..978418db84b9 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -14,12 +14,14 @@
  * @dev_name: Name of the device
  * @writeback: If true, a writeback buffer can be attached to the CRTC
  * @planes: List of planes configured for the device
+ * @crtcs: List of CRTCs configured for the device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
 	const char *dev_name;
 	bool writeback;
 	struct list_head planes;
+	struct list_head crtcs;
 	struct vkms_device *dev;
 };
 
@@ -45,6 +47,27 @@ struct vkms_config_plane {
 	struct vkms_plane *plane;
 };
 
+/**
+ * struct vkms_config_crtc
+ *
+ * @link: Link to the others CRTCs in vkms_config
+ * @config: The vkms_config this CRTC belongs to
+ * @writeback: If true, a writeback buffer can be attached to the CRTC
+ * @crtc: Internal usage. This pointer should never be considered as valid.
+ *        It can be used to store a temporary reference to a VKMS CRTC during
+ *        device creation. This pointer is not managed by the configuration and
+ *        must be managed by other means.
+ */
+struct vkms_config_crtc {
+	struct list_head link;
+	struct vkms_config *config;
+
+	bool writeback;
+
+	/* Internal usage */
+	struct vkms_output *crtc;
+};
+
 /**
  * vkms_config_for_each_plane - Iterate over the vkms_config planes
  * @config: &struct vkms_config pointer
@@ -53,6 +76,14 @@ struct vkms_config_plane {
 #define vkms_config_for_each_plane(config, plane_cfg) \
 	list_for_each_entry((plane_cfg), &(config)->planes, link)
 
+/**
+ * vkms_config_for_each_crtc - Iterate over the vkms_config CRTCs
+ * @config: &struct vkms_config pointer
+ * @crtc_cfg: &struct vkms_config_crtc pointer used as cursor
+ */
+#define vkms_config_for_each_crtc(config, crtc_cfg) \
+	list_for_each_entry((crtc_cfg), &(config)->crtcs, link)
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -96,6 +127,15 @@ vkms_config_get_device_name(struct vkms_config *config)
 	return config->dev_name;
 }
 
+/**
+ * vkms_config_get_num_crtcs() - Return the number of CRTCs in the configuration
+ * @config: Configuration to get the number of CRTCs from
+ */
+static inline size_t vkms_config_get_num_crtcs(struct vkms_config *config)
+{
+	return list_count_nodes(&config->crtcs);
+}
+
 /**
  * vkms_config_is_valid() - Validate a configuration
  * @config: Configuration to validate
@@ -151,4 +191,44 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
 	plane_cfg->type = type;
 }
 
+/**
+ * vkms_config_create_crtc() - Add a new CRTC configuration
+ * @config: Configuration to add the CRTC to
+ *
+ * Returns:
+ * The new CRTC configuration or an error. Call vkms_config_destroy_crtc() to
+ * free the returned CRTC configuration.
+ */
+struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *config);
+
+/**
+ * vkms_config_destroy_crtc() - Remove and free a CRTC configuration
+ * @config: Configuration to remove the CRTC from
+ * @crtc_cfg: CRTC configuration to destroy
+ */
+void vkms_config_destroy_crtc(struct vkms_config *config,
+			      struct vkms_config_crtc *crtc_cfg);
+
+/**
+ * vkms_config_crtc_get_writeback() - If a writeback connector will be created
+ * @crtc_cfg: CRTC with or without a writeback connector
+ */
+static inline bool
+vkms_config_crtc_get_writeback(struct vkms_config_crtc *crtc_cfg)
+{
+	return crtc_cfg->writeback;
+}
+
+/**
+ * vkms_config_crtc_set_writeback() - If a writeback connector will be created
+ * @crtc_cfg: Target CRTC
+ * @writeback: Enable or disable the writeback connector
+ */
+static inline void
+vkms_config_crtc_set_writeback(struct vkms_config_crtc *crtc_cfg,
+			       bool writeback)
+{
+	crtc_cfg->writeback = writeback;
+}
+
 #endif /* _VKMS_CONFIG_H_ */
-- 
2.48.1

