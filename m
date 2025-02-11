Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09AAA3097F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F309810E670;
	Tue, 11 Feb 2025 11:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a1gL7YMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC5B10E674
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:38 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43956e3863eso92745e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272177; x=1739876977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBA7ggfA28/uYGXwmpLDfBK8mT199rEz14cjtJoLIxE=;
 b=a1gL7YMr5N0z3oYzgPYBSKL6QfVpneOsfQFXJOe6UEw+X9QsNwgPu2NVsZOJW9EtOr
 yGMpLcnHIvXgXYq/Rw6hiIhVMvt9Y/fz4ls7QMai5uZ4tNPm15I2a47SxbTYzT+gWNcp
 EogKeL8X26CPFvc1Gaslhfujcv8CJ9y1/ya3gzXaCKzYvsz0aclz1+VfE0fZkxUqKHDc
 SF/8+iE3X3lf0CceXkdx4tWhbvBnghA8FmsTvGXa09chQdzYobsJCQB0QtL8nnGs9DGg
 OYSfPqpIN9tV60IY0nv1K3Oq9bhHxmMbtLkMuwXw/wCfEiubO7el5dEjOxp6/pjh5gPl
 Sdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272177; x=1739876977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBA7ggfA28/uYGXwmpLDfBK8mT199rEz14cjtJoLIxE=;
 b=px04DreKf4VqGKQYYy+YHQC0xZaG2yrADcQx1XEFYLceVF9hj4G/2sejpm778nEcFN
 K2uiow9SGySI9Ji4m30NAd77Xtmi825dqp9bK9mNz8OqJKrOK4J+Hed8sFwRsEn2fAI1
 OI/76EK4XeouQe40DCrEPe+TpJBL8u0E1Hv0kOA8oyZubiert/etKq2YMaykRg/wvG/J
 WFYHgnLp4ysd1tS5u/c5oRx0s40d9arAM5mkSTbDcqrFqSJIp0flda/RBHdI0aoapeEj
 +n2eU76dlZOiHE6t2EcVhVDJIcuFRw80T/Y4N4lf56O/ATojL3LIsuvSEJMwJeA31eBf
 pTmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAvea6QlhBX09rvmZjlfLsTc8jFrtOKilWrRa8CecfPjdyOo1agKd+d4Vb6h/GbxzUgRmuJlHIyd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeTHY6nCgxaofyiQ547D0a9Xqjbq2EqUzug/8s8eaK/fhKzZpD
 ZtC9wtqEhm3UgGhcJREST+muXTVgNyghLA/KsGc2h9/PRD7yTlBe
X-Gm-Gg: ASbGnctaMH6iNO4etacGhrkvrgZSRRxAIGnJfXlYcbHKsBeW4ffqZJ7ouuC4yDL4yF+
 0vYHglFP+9FBEPoTrEaJtbWl77EKi0qNQKgwWg35eUnfH3yPitV8EP3m/sNsqolp24zdkCHhvst
 2pL+YZH7b+sOwlt0Ko71orALmuIOxFcWprcOvVN6GnGGvzAHWEj3MoA9r3E7XbM9im43g67SY9v
 TwiDYN1cCTb8dW319R3lH/NJ6WrC2PWJ/o4ftFv8TOxHIMmW55i/P+VTLMw62bpyow7qMXZpBIW
 lKBV7TurzJ+26+jt
X-Google-Smtp-Source: AGHT+IG6uIK5sMReW8rmpfJ2cFHMTPBO6ZtT186CMnf1Lse58U69fHbGtfmXj/UJuW94AjncP1IpdQ==
X-Received: by 2002:a05:600c:1c92:b0:439:4589:1abc with SMTP id
 5b1f17b1804b1-43945891eaemr64620595e9.14.1739272176501; 
 Tue, 11 Feb 2025 03:09:36 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:35 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 14/15] drm/vkms: Allow to configure multiple connectors
Date: Tue, 11 Feb 2025 12:09:11 +0100
Message-ID: <20250211110912.15409-15-jose.exposito89@gmail.com>
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

Add a list of connectors to vkms_config and helper functions to add and
remove as many connectors as wanted.

For backwards compatibility, add one enabled connector to the default
configuration.

A future patch will allow to attach connectors and encoders, but for the
moment there are no changes in the way the output is configured.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |  1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 74 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 50 +++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 42 +++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         | 11 +++
 5 files changed, 178 insertions(+)

diff --git a/.clang-format b/.clang-format
index 5d21c0e4edbd..ca49832993c5 100644
--- a/.clang-format
+++ b/.clang-format
@@ -690,6 +690,7 @@ ForEachMacros:
   - 'v4l2_m2m_for_each_src_buf'
   - 'v4l2_m2m_for_each_src_buf_safe'
   - 'virtio_device_for_each_vq'
+  - 'vkms_config_for_each_connector'
   - 'vkms_config_for_each_crtc'
   - 'vkms_config_for_each_encoder'
   - 'vkms_config_for_each_plane'
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 7458d175acb6..cba7e9d2fcad 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -27,6 +27,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->crtcs));
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->encoders));
+	KUNIT_EXPECT_TRUE(test, list_empty(&config->connectors));
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -103,6 +104,9 @@ static void vkms_config_test_default_config(struct kunit *test)
 	/* Encoders */
 	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 1);
 
+	/* Connectors */
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->connectors), 1);
+
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -232,6 +236,51 @@ static void vkms_config_test_get_encoders(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_get_connectors(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_connector *connector_cfg;
+	struct vkms_config_connector *connector_cfg1, *connector_cfg2;
+	int n_connectors = 0;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	vkms_config_for_each_connector(config, connector_cfg)
+		n_connectors++;
+	KUNIT_ASSERT_EQ(test, n_connectors, 0);
+
+	connector_cfg1 = vkms_config_create_connector(config);
+	vkms_config_for_each_connector(config, connector_cfg) {
+		n_connectors++;
+		if (connector_cfg != connector_cfg1)
+			KUNIT_FAIL(test, "Unexpected connector");
+	}
+	KUNIT_ASSERT_EQ(test, n_connectors, 1);
+	n_connectors = 0;
+
+	connector_cfg2 = vkms_config_create_connector(config);
+	vkms_config_for_each_connector(config, connector_cfg) {
+		n_connectors++;
+		if (connector_cfg != connector_cfg1 &&
+		    connector_cfg != connector_cfg2)
+			KUNIT_FAIL(test, "Unexpected connector");
+	}
+	KUNIT_ASSERT_EQ(test, n_connectors, 2);
+	n_connectors = 0;
+
+	vkms_config_destroy_connector(connector_cfg2);
+	vkms_config_for_each_connector(config, connector_cfg) {
+		n_connectors++;
+		if (connector_cfg != connector_cfg1)
+			KUNIT_FAIL(test, "Unexpected connector");
+	}
+	KUNIT_ASSERT_EQ(test, n_connectors, 1);
+	n_connectors = 0;
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_invalid_plane_number(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -439,6 +488,29 @@ static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_invalid_connector_number(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_connector *connector_cfg;
+	int n;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	/* Invalid: No connectors */
+	connector_cfg = list_first_entry(&config->connectors, typeof(*connector_cfg), link);
+	vkms_config_destroy_connector(connector_cfg);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Too many connectors */
+	for (n = 0; n <= 32; n++)
+		connector_cfg = vkms_config_create_connector(config);
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_plane_attach_crtc(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -635,12 +707,14 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_get_planes),
 	KUNIT_CASE(vkms_config_test_get_crtcs),
 	KUNIT_CASE(vkms_config_test_get_encoders),
+	KUNIT_CASE(vkms_config_test_get_connectors),
 	KUNIT_CASE(vkms_config_test_invalid_plane_number),
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
 	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
 	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
+	KUNIT_CASE(vkms_config_test_invalid_connector_number),
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index f727c0009489..d52280d3bbee 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -24,6 +24,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 	INIT_LIST_HEAD(&config->planes);
 	INIT_LIST_HEAD(&config->crtcs);
 	INIT_LIST_HEAD(&config->encoders);
+	INIT_LIST_HEAD(&config->connectors);
 
 	return config;
 }
@@ -36,6 +37,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
 	int n;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
@@ -87,6 +89,10 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg))
 		goto err_alloc;
 
+	connector_cfg = vkms_config_create_connector(config);
+	if (IS_ERR(connector_cfg))
+		goto err_alloc;
+
 	return config;
 
 err_alloc:
@@ -99,6 +105,7 @@ void vkms_config_destroy(struct vkms_config *config)
 	struct vkms_config_plane *plane_cfg, *plane_tmp;
 	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
 	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
+	struct vkms_config_connector *connector_cfg, *connector_tmp;
 
 	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
 		vkms_config_destroy_plane(plane_cfg);
@@ -109,6 +116,9 @@ void vkms_config_destroy(struct vkms_config *config)
 	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, link)
 		vkms_config_destroy_encoder(config, encoder_cfg);
 
+	list_for_each_entry_safe(connector_cfg, connector_tmp, &config->connectors, link)
+		vkms_config_destroy_connector(connector_cfg);
+
 	kfree_const(config->dev_name);
 	kfree(config);
 }
@@ -251,6 +261,20 @@ static bool valid_encoder_possible_crtcs(struct vkms_config *config)
 	return true;
 }
 
+static bool valid_connector_number(struct vkms_config *config)
+{
+	struct drm_device *dev = &config->dev->drm;
+	size_t n_connectors;
+
+	n_connectors = list_count_nodes(&config->connectors);
+	if (n_connectors <= 0 || n_connectors >= 32) {
+		drm_info(dev, "The number of connectors must be between 1 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -264,6 +288,9 @@ bool vkms_config_is_valid(struct vkms_config *config)
 	if (!valid_encoder_number(config))
 		return false;
 
+	if (!valid_connector_number(config))
+		return false;
+
 	if (!valid_plane_possible_crtcs(config))
 		return false;
 
@@ -287,6 +314,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
 
 	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
 	seq_printf(m, "dev_name=%s\n", dev_name);
@@ -306,6 +334,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
 		seq_puts(m, "encoder\n");
 
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg)
+		seq_puts(m, "connector\n");
+
 	return 0;
 }
 
@@ -494,3 +525,22 @@ void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
 			xa_erase(&encoder_cfg->possible_crtcs, idx);
 	}
 }
+
+struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *config)
+{
+	struct vkms_config_connector *connector_cfg;
+
+	connector_cfg = kzalloc(sizeof(*connector_cfg), GFP_KERNEL);
+	if (!connector_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	list_add_tail(&connector_cfg->link, &config->connectors);
+
+	return connector_cfg;
+}
+
+void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg)
+{
+	list_del(&connector_cfg->link);
+	kfree(connector_cfg);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 28c24afebe1e..8451c2f127b6 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -16,6 +16,7 @@
  * @planes: List of planes configured for the device
  * @crtcs: List of CRTCs configured for the device
  * @encoders: List of encoders configured for the device
+ * @connectors: List of connectors configured for the device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
@@ -23,6 +24,7 @@ struct vkms_config {
 	struct list_head planes;
 	struct list_head crtcs;
 	struct list_head encoders;
+	struct list_head connectors;
 	struct vkms_device *dev;
 };
 
@@ -86,6 +88,22 @@ struct vkms_config_encoder {
 	struct drm_encoder *encoder;
 };
 
+/**
+ * struct vkms_config_connector
+ *
+ * @link: Link to the others connector in vkms_config
+ * @connector: Internal usage. This pointer should never be considered as valid.
+ *             It can be used to store a temporary reference to a VKMS connector
+ *             during device creation. This pointer is not managed by the
+ *             configuration and must be managed by other means.
+ */
+struct vkms_config_connector {
+	struct list_head link;
+
+	/* Internal usage */
+	struct vkms_connector *connector;
+};
+
 /**
  * vkms_config_for_each_plane - Iterate over the vkms_config planes
  * @config: &struct vkms_config pointer
@@ -110,6 +128,14 @@ struct vkms_config_encoder {
 #define vkms_config_for_each_encoder(config, encoder_cfg) \
 	list_for_each_entry((encoder_cfg), &(config)->encoders, link)
 
+/**
+ * vkms_config_for_each_connector - Iterate over the vkms_config connectors
+ * @config: &struct vkms_config pointer
+ * @connector_cfg: &struct vkms_config_connector pointer used as cursor
+ */
+#define vkms_config_for_each_connector(config, connector_cfg) \
+	list_for_each_entry((connector_cfg), &(config)->connectors, link)
+
 /**
  * vkms_config_plane_for_each_possible_crtc - Iterate over the vkms_config_plane
  * possible CRTCs
@@ -355,4 +381,20 @@ int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *enc
 void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
 				     struct vkms_config_crtc *crtc_cfg);
 
+/**
+ * vkms_config_create_connector() - Add a new connector configuration
+ * @config: Configuration to add the connector to
+ *
+ * Returns:
+ * The new connector configuration or an error. Call
+ * vkms_config_destroy_connector() to free the returned connector configuration.
+ */
+struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *config);
+
+/**
+ * vkms_config_destroy_connector() - Remove and free a connector configuration
+ * @connector_cfg: Connector configuration to destroy
+ */
+void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index ab8b52a84151..48b10cba322a 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -25,8 +25,19 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
 	return count;
 }
 
+static struct drm_encoder *vkms_conn_best_encoder(struct drm_connector *connector)
+{
+	struct drm_encoder *encoder;
+
+	drm_connector_for_each_possible_encoder(connector, encoder)
+		return encoder;
+
+	return NULL;
+}
+
 static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes    = vkms_conn_get_modes,
+	.best_encoder = vkms_conn_best_encoder,
 };
 
 struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
-- 
2.48.1

