Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF507A39863
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BDC10E65A;
	Tue, 18 Feb 2025 10:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hlbp7pkg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE66A10E65F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:12:36 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so3435855f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873555; x=1740478355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okm3LTa2KT6tlsIpTZr55gU34qeQ+5Qm8WrnAeHUzZI=;
 b=hlbp7pkgD2NYCK7iIyJjBO3vrGcrcQ5DyWIGAvP9C52S8qn2fKs6OV/kdbOpFsgBg3
 2Ul0tt94IDmLJANYysvEceJ1xn22p0XCrFSrZhv23qLOpDwcMQX/DwQ9EEB5kF2ERGdB
 jNO+yB+nGLBLEuQjOBKC7Rqfdi061bi+6iUzoZq7se9z0Q4hEh5cWZiubcq8Pno/1Kj1
 bVlBZeWBamgO2/CWtKWAza6B5AviEppNUNah3ebUZ4ICBcpRQbv+Bn7n+dUQciHNRMbE
 aTnCK7JHVrAnRXBUcSxxamd1Uf7A/DnGKbtf2DqW9LDJ077qn+0PvsXzVYOYX9IT8zF/
 WL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873555; x=1740478355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okm3LTa2KT6tlsIpTZr55gU34qeQ+5Qm8WrnAeHUzZI=;
 b=QLOwgC+gyuklDjgANkMuUVIy2b7hsNxw9nXQvHdHm0Qhwkja8QMiaY86vUwLQSjXrv
 kWdG0FmzLyqRSeaFrZVMRuvfWtJY05CFhDOoWljNqIDMbqi5lfcfHN4dTgA5Lu1XZROa
 J7gvT73OZxlr+bHVXK/EYjwV/Fuc4/0iFnTE2C34az73yNnHEzLaSXDGqN/GntcF7VQy
 Xndt0vaDw1y07rt1HZ/brrhsSLgKFCANd69IrEmRZrOq0ZkWBJPio4mjB+DgkPyK9ZXX
 ghl68pHSwNbheuAO4o+Btos6+KvJE/BjbJIDfKL8lETw9jp7njtQ2pEF7Smjdz3Lg4XT
 sK5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz1BH/zpfb38wFxuvDhvAMSKkQ63CYxweT1y+joGgn8TUY7osfwL92ofipZBHFyjvNyBYmvkpN60M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhKTbKHRDFntlDKhw7DNCF9sYFq0mvYuAEvIauqnpBseQ7IFJg
 XPlXFUtWu0OlN4j13RQ16T6C7NMCPoPn2eG6yy59avyvsG7j/ZDU2ije287z
X-Gm-Gg: ASbGncsf7h68kRQxNJse38T5XmDDFON0qWSaAscfqTrPgNlgFtYqFKqJNT9/0X+ZaH5
 R66ad5ZJqJsWJZ7u0q/zHETLj8ohrYJB+Mkr//bHxkZx3CGyv8l+L2uClMQx2/mnnWt60XynB2W
 4p88wWAOocFLD9uOyod7XWcJr/JUfZz2ROIl+jOo28P+fvCG8sQa1iYuaFX3upGaaT+t9cqzxxJ
 d+UrcXDB0DtqA18ccg5HTJAP3+ximbAExy9qpAg4Ua10rqaCLIYQwvfBeUxjSgqyV1sEcRjDI8W
 K5j72HKo4BpVEzCqlQ==
X-Google-Smtp-Source: AGHT+IFgN14jNIkd2URH9+9+nkuganTWAHpMTMupwnaZtTOP8R57T4kb08yf4d0Y+iofqeCmGB/kSA==
X-Received: by 2002:a5d:5f4e:0:b0:385:f220:f798 with SMTP id
 ffacd0b85a97d-38f33f3737amr11282812f8f.6.1739873555058; 
 Tue, 18 Feb 2025 02:12:35 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm14749720f8f.66.2025.02.18.02.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:12:34 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 13/14] drm/vkms: Allow to configure multiple connectors
Date: Tue, 18 Feb 2025 11:12:13 +0100
Message-ID: <20250218101214.5790-14-jose.exposito89@gmail.com>
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

Add a list of connectors to vkms_config and helper functions to add and
remove as many connectors as wanted.

For backwards compatibility, add one enabled connector to the default
configuration.

A future patch will allow to attach connectors and encoders, but for the
moment there are no changes in the way the output is configured.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |  1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 95 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 54 +++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 44 +++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         | 11 +++
 5 files changed, 205 insertions(+)

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
index 600f563dd0a8..610bcde3e018 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -28,6 +28,17 @@ static size_t vkms_config_get_num_encoders(struct vkms_config *config)
 	return count;
 }
 
+static size_t vkms_config_get_num_connectors(struct vkms_config *config)
+{
+	struct vkms_config_connector *connector_cfg;
+	size_t count = 0;
+
+	vkms_config_for_each_connector(config, connector_cfg)
+		count++;
+
+	return count;
+}
+
 static struct vkms_config_plane *get_first_plane(struct vkms_config *config)
 {
 	struct vkms_config_plane *plane_cfg;
@@ -58,6 +69,16 @@ static struct vkms_config_encoder *get_first_encoder(struct vkms_config *config)
 	return NULL;
 }
 
+static struct vkms_config_connector *get_first_connector(struct vkms_config *config)
+{
+	struct vkms_config_connector *connector_cfg;
+
+	vkms_config_for_each_connector(config, connector_cfg)
+		return connector_cfg;
+
+	return NULL;
+}
+
 struct default_config_case {
 	bool enable_cursor;
 	bool enable_writeback;
@@ -79,6 +100,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, vkms_config_get_num_planes(config), 0);
 	KUNIT_EXPECT_EQ(test, vkms_config_get_num_crtcs(config), 0);
 	KUNIT_EXPECT_EQ(test, vkms_config_get_num_encoders(config), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_get_num_connectors(config), 0);
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -155,6 +177,9 @@ static void vkms_config_test_default_config(struct kunit *test)
 	/* Encoders */
 	KUNIT_EXPECT_EQ(test, vkms_config_get_num_encoders(config), 1);
 
+	/* Connectors */
+	KUNIT_EXPECT_EQ(test, vkms_config_get_num_connectors(config), 1);
+
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -284,6 +309,51 @@ static void vkms_config_test_get_encoders(struct kunit *test)
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
@@ -491,6 +561,29 @@ static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
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
+	connector_cfg = get_first_connector(config);
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
 static void vkms_config_test_attach_different_configs(struct kunit *test)
 {
 	struct vkms_config *config1, *config2;
@@ -730,12 +823,14 @@ static struct kunit_case vkms_config_test_cases[] = {
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
 	KUNIT_CASE(vkms_config_test_attach_different_configs),
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 17262a9c2567..fbbdee6068ce 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -25,6 +25,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 	INIT_LIST_HEAD(&config->planes);
 	INIT_LIST_HEAD(&config->crtcs);
 	INIT_LIST_HEAD(&config->encoders);
+	INIT_LIST_HEAD(&config->connectors);
 
 	return config;
 }
@@ -38,6 +39,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
 	int n;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
@@ -89,6 +91,10 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg))
 		goto err_alloc;
 
+	connector_cfg = vkms_config_create_connector(config);
+	if (IS_ERR(connector_cfg))
+		goto err_alloc;
+
 	return config;
 
 err_alloc:
@@ -102,6 +108,7 @@ void vkms_config_destroy(struct vkms_config *config)
 	struct vkms_config_plane *plane_cfg, *plane_tmp;
 	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
 	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
+	struct vkms_config_connector *connector_cfg, *connector_tmp;
 
 	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
 		vkms_config_destroy_plane(plane_cfg);
@@ -112,6 +119,9 @@ void vkms_config_destroy(struct vkms_config *config)
 	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, link)
 		vkms_config_destroy_encoder(config, encoder_cfg);
 
+	list_for_each_entry_safe(connector_cfg, connector_tmp, &config->connectors, link)
+		vkms_config_destroy_connector(connector_cfg);
+
 	kfree_const(config->dev_name);
 	kfree(config);
 }
@@ -255,6 +265,20 @@ static bool valid_encoder_possible_crtcs(const struct vkms_config *config)
 	return true;
 }
 
+static bool valid_connector_number(const struct vkms_config *config)
+{
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
+	size_t n_connectors;
+
+	n_connectors = list_count_nodes((struct list_head *)&config->connectors);
+	if (n_connectors <= 0 || n_connectors >= 32) {
+		drm_info(dev, "The number of connectors must be between 1 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(const struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -268,6 +292,9 @@ bool vkms_config_is_valid(const struct vkms_config *config)
 	if (!valid_encoder_number(config))
 		return false;
 
+	if (!valid_connector_number(config))
+		return false;
+
 	if (!valid_plane_possible_crtcs(config))
 		return false;
 
@@ -292,6 +319,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
 
 	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
 	seq_printf(m, "dev_name=%s\n", dev_name);
@@ -311,6 +339,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
 		seq_puts(m, "encoder\n");
 
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg)
+		seq_puts(m, "connector\n");
+
 	return 0;
 }
 
@@ -520,3 +551,26 @@ void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_encoder_detach_crtc);
+
+struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *config)
+{
+	struct vkms_config_connector *connector_cfg;
+
+	connector_cfg = kzalloc(sizeof(*connector_cfg), GFP_KERNEL);
+	if (!connector_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	connector_cfg->config = config;
+
+	list_add_tail(&connector_cfg->link, &config->connectors);
+
+	return connector_cfg;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_connector);
+
+void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg)
+{
+	list_del(&connector_cfg->link);
+	kfree(connector_cfg);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_connector);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 3e5b2e407378..73562c894102 100644
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
 
@@ -92,6 +94,24 @@ struct vkms_config_encoder {
 	struct drm_encoder *encoder;
 };
 
+/**
+ * struct vkms_config_connector
+ *
+ * @link: Link to the others connector in vkms_config
+ * @config: The vkms_config this connector belongs to
+ * @connector: Internal usage. This pointer should never be considered as valid.
+ *             It can be used to store a temporary reference to a VKMS connector
+ *             during device creation. This pointer is not managed by the
+ *             configuration and must be managed by other means.
+ */
+struct vkms_config_connector {
+	struct list_head link;
+	struct vkms_config *config;
+
+	/* Internal usage */
+	struct vkms_connector *connector;
+};
+
 /**
  * vkms_config_for_each_plane - Iterate over the vkms_config planes
  * @config: &struct vkms_config pointer
@@ -116,6 +136,14 @@ struct vkms_config_encoder {
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
@@ -361,4 +389,20 @@ int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *enc
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

