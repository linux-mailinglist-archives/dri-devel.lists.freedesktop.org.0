Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38BA37F31
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0452A10E3ED;
	Mon, 17 Feb 2025 10:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h7BJeqRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA3D10E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:01:36 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4396a4d5e3bso26187175e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786495; x=1740391295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ard8F/ImBapjiK3Qgw2K+5KYKoFmpd/b+fCrH1E+pw=;
 b=h7BJeqRzd/BGrk1ithdrB1ILhRVL04NvahJk5rZV/VuNqAzurd3ip2pIjwuIGhPYQS
 WxJ0SGJEu8GiiY654BICrCcEX/DnXYuBBjPyn5L1WH7AzqZw0ukWIakzpu0mhVSj04ut
 K0GGNdu6Iif/nUwlYOY/QBaHjbwQwgQ+8ZqslbGEt4uGumtPUHAUumFsjJV3bp988iLz
 7kDdEouMCCWj1ZD88OT1qX5s2JxcGfoqMH+nAUgkVKRqi0T3zUhNjRxIvGdcg6D2Z517
 d12hiuAdyif8sLcRfhxjo63WxE+gYdJOPqHBNOKfMe8e1Ul30EJ+4HhPFlZaxzxfBTlk
 i9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786495; x=1740391295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ard8F/ImBapjiK3Qgw2K+5KYKoFmpd/b+fCrH1E+pw=;
 b=VJsoyBv+IlPnGNpoI7VVkfoSIgxvrWWjvB6myZOuBjgQHQa29qDzSv0LXR/X/ZSC1Q
 jRRCJZcCuQCQEfqO5upiI75wx3D2Ho+MAqX1noXTQhQUD0dcUJv+bOB2pAiZx3Ze255b
 fYZw8FtbmuIGj1IYQ9aZTLx3Dqra1KFkHZoOXeJPyqlMKH3bGo7Ej1LgtVNOJ2mzp0pT
 EYM+kVOXBPteQwkXOzJYDlNQr8DLyAG7KzQTtVN6o0I9W+wIkCtlecVqTjX3/9A6ud0X
 wCobCjyDMxXCn1OosiVyBRbXaSLvXYBc71155hIOmQYueuprhvWdlpDaxjs35/ptavzY
 DA/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMt+d5NWdU1Kiob9K9zlZhnFgUD7cK8hG2E56j4Y3Ccd0kYk7d1gpf0kaytbaS7mDnG5aztgXMRJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLNlw8PSIf9fd6qZjXixF6Mf7VjMgOuNuBK/hw0DB6X2Letcz2
 zse24ji9w4WWmeD16mEvm0NK9mcTqEZohyyMfkQqGEy+8yXaVoqb
X-Gm-Gg: ASbGnctD7EVTdvR+iG+jke3YJWPDiDGKiY3NRZMroHEzoXvyw5WYjhOtYlI5jp/1SMn
 vdQtJ/MLVUks8Ajb8AUl7CMH49pzcaAicKpo2Fyez8O8YtQDTWavIkkBDJVhAObyrlvQvqvs4ph
 DpN4OSz4VHDeU8ib6y+anw8eVrT3uGO4yD1Y7xroT7ia4NlFrcgI+Qt5cbsp7N93gpo4GxTIjka
 RDJQRm1UoznBr0y32nW63HBTg4J2/QOny7a3B9gBpRbLWje0Pff91YotptLZ450M7+tT5rAH8eN
 AqT9zZYsThwjRfMImQ==
X-Google-Smtp-Source: AGHT+IFK8DpkcwyuRSHeqcTmKovdePAaotiW5JS+D7k7nGvwuuRMowAPsCf0v9vYyLbrWDrjMjHx0Q==
X-Received: by 2002:a5d:648f:0:b0:38f:2856:7d9a with SMTP id
 ffacd0b85a97d-38f33f14a27mr8637339f8f.3.1739786494843; 
 Mon, 17 Feb 2025 02:01:34 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm11591901f8f.86.2025.02.17.02.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:01:34 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 09/14] drm/vkms: Allow to configure multiple CRTCs
Date: Mon, 17 Feb 2025 11:01:15 +0100
Message-ID: <20250217100120.7620-10-jose.exposito89@gmail.com>
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

Add a list of CRTCs to vkms_config and helper functions to add and
remove as many CRTCs as wanted.

For backwards compatibility, add one CRTC to the default configuration.

A future patch will allow to attach planes and CRTCs, but for the
moment there are no changes in the way the output is configured.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |  1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 73 ++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.c            | 63 ++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h            | 80 +++++++++++++++++++
 4 files changed, 212 insertions(+), 5 deletions(-)

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
index fe6f079902fd..6a89361601a0 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -25,6 +25,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
 	KUNIT_EXPECT_STREQ(test, vkms_config_get_device_name(config), "test");
 
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
+	KUNIT_EXPECT_TRUE(test, list_empty(&config->crtcs));
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -49,6 +50,7 @@ static void vkms_config_test_default_config(struct kunit *test)
 	const struct default_config_case *params = test->param_value;
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
 	int n_primaries = 0;
 	int n_cursors = 0;
 	int n_overlays = 0;
@@ -58,8 +60,6 @@ static void vkms_config_test_default_config(struct kunit *test)
 					    params->enable_overlay);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
-	KUNIT_EXPECT_EQ(test, config->writeback, params->enable_writeback);
-
 	/* Planes */
 	vkms_config_for_each_plane(config, plane_cfg) {
 		switch (vkms_config_plane_get_type(plane_cfg)) {
@@ -80,6 +80,13 @@ static void vkms_config_test_default_config(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, n_cursors, params->enable_cursor ? 1 : 0);
 	KUNIT_EXPECT_EQ(test, n_overlays, params->enable_overlay ? 8 : 0);
 
+	/* CRTCs */
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->crtcs), 1);
+
+	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
+	KUNIT_EXPECT_EQ(test, vkms_config_crtc_get_writeback(crtc_cfg),
+			params->enable_writeback);
+
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -128,6 +135,43 @@ static void vkms_config_test_get_planes(struct kunit *test)
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
@@ -192,13 +236,38 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
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
+	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
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

