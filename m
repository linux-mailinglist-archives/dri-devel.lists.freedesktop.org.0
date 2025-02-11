Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E60DA30980
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAC310E674;
	Tue, 11 Feb 2025 11:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eeEX+YBw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCEF10E666
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:39 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38ddc36b81dso1498544f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272178; x=1739876978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGUdgw2ywsEOYDg6PxJGKHCOLJS2s2ya/ph3EyRFJVM=;
 b=eeEX+YBw0sF0+cb8oVk4RGIEt/BjyObluhZJFXAt1MMzIVK+fei/kEjhksZrgaGTPM
 JKLFUBM40c1IUtdogtYwsEu2Lul6cJX0NxDxRKhnXNMFLNUIz+lPWSyfg62uL7ym8U5D
 NykuHqb5tEjx//js1J09atBT4hKYNytzwC+8KaTIuleqpUd2pQauFbWvt60NLZPgu5+Q
 bvvmFzZbg6dLKFT7adVPfTvznY6jHFPJNeF6COVqVQ7BDLa9c9pfv5hQ+7pGSfBvp0+u
 tpM/sHczI8g4MSm9cxEw+sDliuThBuhZlWLbLjroRvVcSIcFreKAqe19laSVmXB+hc8s
 j2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272178; x=1739876978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGUdgw2ywsEOYDg6PxJGKHCOLJS2s2ya/ph3EyRFJVM=;
 b=tMH4JxCVZExkYAr1OXGS4Fh/vGWgVc3/vkl5IdLaGAiTjFFhXddcbl1I9BQkWVXonW
 KI3IPUvZtGCYQsnQDuHCM1Kp4+RHscUJONLusJKt/k94c/ErraMGK1qxBkRlUq2+8VQl
 vOhWrO0M7Z/4ixZHdft/2vz0HTp+aisIEHRt9MxfYKjodMFkIUfzouyrmFjyJmPgqs7A
 63rhGfi/U4acm8jyl1/GKkNXKiKlzJi8AvGDLmNr8GQpB5IpQ/oJy8YE0J+5AP4jLCUG
 PqmXQ2MwR5ExcwCcLJQFucTNGjJz08VzmDZnRm4Ewi7N6dl7d+SabJeGJTzcCWeXFEpF
 YSOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3gEF/GLo48YYEkcilb/AH3iovt+V65zmRpGA2zs0hBb951mdGQtuepAZqPzh+SBdMu4Im/ndtxv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk3yw/KgtYhUUSUgwrerr290O48RQtd19vJI5CD+pH0lIuOUld
 HgeWtPL9um4Sadpk10YjIJMCr9v+a+XHO3I9YXllvRQU6eW+5cot
X-Gm-Gg: ASbGncteOT1wC3JcgG1WGOqgPyN5eWPbw1jPUi55wYLeAVTrDOHJ5GHTUVHFCiOavit
 k9qi/JLBoELZgW2fUjlxe9ZoWGL/E0XCHTc9Ww6Is5wUSWjI//vTJ2b7vFuVt7Vn5ulyBccWIG7
 4lsnGbQNTd3GteEvRtsz9Njl3zgZNXKp7YU2QxtVBJb/wJbrOEWQg8rfBAYmRfo+r4RCPLXkN4n
 NQgVfHz9FsV4v1nuE2RbnsZu2W+XI26SrLeU9qYh7i/mWpasdrgS4IEcaFfFm4F9NK2uNtHyFII
 +pS7DK1Bw7qIolcO
X-Google-Smtp-Source: AGHT+IEBywQtzeAfqxQNya+FLykWVeF9GchkmCoUu0KPaur3KfXxA5e/gms8QC9wUmsE7b8h69zDmQ==
X-Received: by 2002:a5d:64c4:0:b0:38d:c0c0:b3da with SMTP id
 ffacd0b85a97d-38de438e603mr2334406f8f.2.1739272178153; 
 Tue, 11 Feb 2025 03:09:38 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:37 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 15/15] drm/vkms: Allow to attach connectors and encoders
Date: Tue, 11 Feb 2025 12:09:12 +0100
Message-ID: <20250211110912.15409-16-jose.exposito89@gmail.com>
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

Add a list of possible encoders to the connector configuration and
helpers to attach and detach them.

Now that the default configuration has its connector and encoder
correctly, configure the output following the configuration.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |  1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 94 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 60 ++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 29 ++++++
 drivers/gpu/drm/vkms/vkms_output.c            | 33 ++++---
 5 files changed, 204 insertions(+), 13 deletions(-)

diff --git a/.clang-format b/.clang-format
index ca49832993c5..7630990aa07a 100644
--- a/.clang-format
+++ b/.clang-format
@@ -694,6 +694,7 @@ ForEachMacros:
   - 'vkms_config_for_each_crtc'
   - 'vkms_config_for_each_encoder'
   - 'vkms_config_for_each_plane'
+  - 'vkms_config_connector_for_each_possible_encoder'
   - 'vkms_config_encoder_for_each_possible_crtc'
   - 'vkms_config_plane_for_each_possible_crtc'
   - 'while_for_each_ftrace_op'
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index cba7e9d2fcad..2d104ecfde3b 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -511,6 +511,27 @@ static void vkms_config_test_invalid_connector_number(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_valid_connector_possible_encoders(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	encoder_cfg = list_first_entry(&config->encoders,
+				       typeof(*encoder_cfg), link);
+	connector_cfg = list_first_entry(&config->connectors,
+					 typeof(*connector_cfg), link);
+
+	/* Invalid: Connector without a possible encoder */
+	vkms_config_connector_detach_encoder(connector_cfg, encoder_cfg);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_plane_attach_crtc(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -700,6 +721,77 @@ static void vkms_config_test_encoder_get_possible_crtcs(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_connector *connector_cfg1, *connector_cfg2;
+	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
+	struct vkms_config_encoder *possible_encoder;
+	unsigned long idx = 0;
+	int n_encoders = 0;
+	int err;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	connector_cfg1 = vkms_config_create_connector(config);
+	connector_cfg2 = vkms_config_create_connector(config);
+	encoder_cfg1 = vkms_config_create_encoder(config);
+	encoder_cfg2 = vkms_config_create_encoder(config);
+
+	/* No possible encoders */
+	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
+							possible_encoder)
+		KUNIT_FAIL(test, "Unexpected possible encoder");
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg2, idx,
+							possible_encoder)
+		KUNIT_FAIL(test, "Unexpected possible encoder");
+
+	/* Connector 1 attached to encoders 1 and 2 */
+	err = vkms_config_connector_attach_encoder(connector_cfg1, encoder_cfg1);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	err = vkms_config_connector_attach_encoder(connector_cfg1, encoder_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
+							possible_encoder) {
+		n_encoders++;
+		if (possible_encoder != encoder_cfg1 &&
+		    possible_encoder != encoder_cfg2)
+			KUNIT_FAIL(test, "Unexpected possible encoder");
+	}
+	KUNIT_ASSERT_EQ(test, n_encoders, 2);
+	n_encoders = 0;
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg2, idx,
+							possible_encoder)
+		KUNIT_FAIL(test, "Unexpected possible encoder");
+
+	/* Connector 1 attached to encoder 1 and connector 2 to encoder 2 */
+	vkms_config_connector_detach_encoder(connector_cfg1, encoder_cfg2);
+	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
+							possible_encoder) {
+		n_encoders++;
+		if (possible_encoder != encoder_cfg1)
+			KUNIT_FAIL(test, "Unexpected possible encoder");
+	}
+	KUNIT_ASSERT_EQ(test, n_encoders, 1);
+	n_encoders = 0;
+
+	err = vkms_config_connector_attach_encoder(connector_cfg2, encoder_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	vkms_config_connector_for_each_possible_encoder(connector_cfg2, idx,
+							possible_encoder) {
+		n_encoders++;
+		if (possible_encoder != encoder_cfg2)
+			KUNIT_FAIL(test, "Unexpected possible encoder");
+	}
+	KUNIT_ASSERT_EQ(test, n_encoders, 1);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
@@ -715,9 +807,11 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
 	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_connector_number),
+	KUNIT_CASE(vkms_config_test_valid_connector_possible_encoders),
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
+	KUNIT_CASE(vkms_config_test_connector_get_possible_encoders),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index d52280d3bbee..3d95dc713151 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -93,6 +93,9 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (IS_ERR(connector_cfg))
 		goto err_alloc;
 
+	if (vkms_config_connector_attach_encoder(connector_cfg, encoder_cfg))
+		goto err_alloc;
+
 	return config;
 
 err_alloc:
@@ -275,6 +278,22 @@ static bool valid_connector_number(struct vkms_config *config)
 	return true;
 }
 
+static bool valid_connector_possible_encoders(struct vkms_config *config)
+{
+	struct drm_device *dev = &config->dev->drm;
+	struct vkms_config_connector *connector_cfg;
+
+	vkms_config_for_each_connector(config, connector_cfg) {
+		if (xa_empty(&connector_cfg->possible_encoders)) {
+			drm_info(dev,
+				 "All connectors must have at least one possible encoder\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -302,6 +321,9 @@ bool vkms_config_is_valid(struct vkms_config *config)
 	if (!valid_encoder_possible_crtcs(config))
 		return false;
 
+	if (!valid_connector_possible_encoders(config))
+		return false;
+
 	return true;
 }
 
@@ -493,6 +515,11 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi
 void vkms_config_destroy_encoder(struct vkms_config *config,
 				 struct vkms_config_encoder *encoder_cfg)
 {
+	struct vkms_config_connector *connector_cfg;
+
+	vkms_config_for_each_connector(config, connector_cfg)
+		vkms_config_connector_detach_encoder(connector_cfg, encoder_cfg);
+
 	xa_destroy(&encoder_cfg->possible_crtcs);
 	list_del(&encoder_cfg->link);
 	kfree(encoder_cfg);
@@ -534,6 +561,8 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 	if (!connector_cfg)
 		return ERR_PTR(-ENOMEM);
 
+	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
+
 	list_add_tail(&connector_cfg->link, &config->connectors);
 
 	return connector_cfg;
@@ -541,6 +570,37 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 
 void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg)
 {
+	xa_destroy(&connector_cfg->possible_encoders);
 	list_del(&connector_cfg->link);
 	kfree(connector_cfg);
 }
+
+int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connector *connector_cfg,
+						      struct vkms_config_encoder *encoder_cfg)
+{
+	struct vkms_config_encoder *possible_encoder;
+	unsigned long idx = 0;
+	u32 encoder_idx = 0;
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx,
+							possible_encoder) {
+		if (possible_encoder == encoder_cfg)
+			return -EINVAL;
+	}
+
+	return xa_alloc(&connector_cfg->possible_encoders, &encoder_idx,
+			encoder_cfg, xa_limit_32b, GFP_KERNEL);
+}
+
+void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
+					  struct vkms_config_encoder *encoder_cfg)
+{
+	struct vkms_config_encoder *possible_encoder;
+	unsigned long idx = 0;
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx,
+							possible_encoder) {
+		if (possible_encoder == encoder_cfg)
+			xa_erase(&connector_cfg->possible_encoders, idx);
+	}
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 8451c2f127b6..c87513d174f2 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -92,6 +92,7 @@ struct vkms_config_encoder {
  * struct vkms_config_connector
  *
  * @link: Link to the others connector in vkms_config
+ * @possible_encoders: Array of encoders that can be used with this connector
  * @connector: Internal usage. This pointer should never be considered as valid.
  *             It can be used to store a temporary reference to a VKMS connector
  *             during device creation. This pointer is not managed by the
@@ -100,6 +101,8 @@ struct vkms_config_encoder {
 struct vkms_config_connector {
 	struct list_head link;
 
+	struct xarray possible_encoders;
+
 	/* Internal usage */
 	struct vkms_connector *connector;
 };
@@ -156,6 +159,16 @@ struct vkms_config_connector {
 #define vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) \
 	xa_for_each(&(encoder_cfg)->possible_crtcs, idx, (possible_crtc))
 
+/**
+ * vkms_config_connector_for_each_possible_encoder - Iterate over the
+ * vkms_config_connector possible encoders
+ * @connector_cfg: &struct vkms_config_connector pointer
+ * @idx: Index of the cursor
+ * @possible_encoder: &struct vkms_config_encoder pointer used as cursor
+ */
+#define vkms_config_connector_for_each_possible_encoder(connector_cfg, idx, possible_encoder) \
+	xa_for_each(&(connector_cfg)->possible_encoders, idx, (possible_encoder))
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -397,4 +410,20 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
  */
 void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg);
 
+/**
+ * vkms_config_connector_attach_encoder - Attach a connector to an encoder
+ * @connector_cfg: Connector to attach
+ * @encoder_cfg: Encoder to attach @connector_cfg to
+ */
+int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connector *connector_cfg,
+						      struct vkms_config_encoder *encoder_cfg);
+
+/**
+ * vkms_config_connector_detach_encoder - Detach a connector from an encoder
+ * @connector_cfg: Connector to detach
+ * @encoder_cfg: Encoder to detach @connector_cfg from
+ */
+void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
+					  struct vkms_config_encoder *encoder_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 8920d6b5d105..8d7ca0cdd79f 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -8,10 +8,10 @@
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	struct vkms_connector *connector;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
 	int ret;
 	int writeback;
 
@@ -83,22 +83,29 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	connector = vkms_connector_init(vkmsdev);
-	if (IS_ERR(connector)) {
-		DRM_ERROR("Failed to init connector\n");
-		return PTR_ERR(connector);
-	}
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+		struct vkms_config_encoder *possible_encoder;
+		unsigned long idx = 0;
 
-	/* Attach the encoder and the connector */
-	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg) {
-		ret = drm_connector_attach_encoder(&connector->base, encoder_cfg->encoder);
-		if (ret) {
-			DRM_ERROR("Failed to attach connector to encoder\n");
-			return ret;
+		connector_cfg->connector = vkms_connector_init(vkmsdev);
+		if (IS_ERR(connector_cfg->connector)) {
+			DRM_ERROR("Failed to init connector\n");
+			return PTR_ERR(connector_cfg->connector);
+		}
+
+		vkms_config_connector_for_each_possible_encoder(connector_cfg,
+								idx,
+								possible_encoder) {
+			ret = drm_connector_attach_encoder(&connector_cfg->connector->base,
+							   possible_encoder->encoder);
+			if (ret) {
+				DRM_ERROR("Failed to attach connector to encoder\n");
+				return ret;
+			}
 		}
 	}
 
 	drm_mode_config_reset(dev);
 
-	return ret;
+	return 0;
 }
-- 
2.48.1

