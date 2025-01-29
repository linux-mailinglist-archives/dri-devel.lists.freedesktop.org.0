Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B695A21B8D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C6310E7AC;
	Wed, 29 Jan 2025 11:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DY2dXPci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCAF10E7AC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso45489535e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148480; x=1738753280; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPKCrtDQeB9pT35xBqaZjucly7gQR5uxUbB7ZFp2HeA=;
 b=DY2dXPcizNm1etSHZ5jo8vLCso0mUk2KB0w8RNa9cNcpj5hqdCjZAd1umDgjXK1fB8
 gQcIo4auXgwY9DpveQ3J9xF2Z+AqEqdACR79kVkERFx4utqIV70U0B81INZXHTkN72Mp
 9T/o7NjfwZTyPraozfew5+7eoTx4Y6c/dSxRxM6W6spX+1W7N0N6ttO+6TylpaffkJag
 YgKUx9AH5wmdzPQLyQX7lsRh7rnYhYYHmnD3OsrW0rFG2zW6rUErfptfqpFvQQo1CFDI
 Bt9jLRiV91wFNr9qLrODqvB10pumS0Mt1U71Mao3CoJ9lGwhqpVQfxKfYdoojbBrTYXp
 POjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148480; x=1738753280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sPKCrtDQeB9pT35xBqaZjucly7gQR5uxUbB7ZFp2HeA=;
 b=kYE4Dv97chuYVEKSx79MKYIwMketxg13YJxEECnKU/qdmmYy+lfnM3COM0h0UOovXv
 Y6aXX0rNCUWLOB1ASH+d77AETkmiG9/I+bapxJdV+qV3WR8/uvqPeQUYof/yo0svWyNH
 8T7SqYtg00azcVdUcqI1vx7A2epX11lFanoY0P08uHtJVc7h84Cx35VmdaELu9Q5ASh/
 TnitFApyieLgzuCd4m6xtAtcpG8kRoHS2RrbOPNDOZ/ZC38zbwnYZRxxLZExwXd32aq0
 hudhMG4C5f1nObewJN7JGJO9SGZjy+VUFZMbHp2AlmDKe0Ez03trYKbmX8IV4UX3aN+e
 YugQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH5U2jH90Pyjf7tGPhSn92vxe95inhThuYXXULQF01jxHSZhd5hR3fI9CmunEzqWVgioellQ46TpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYvSHKFy630MkbvOBv1NDTDpjL9iMl/190oXtBB6FPaTJ5XmEQ
 oQrtDDca7x14w/wJzNG/vjamMomefRtXDjRLq/FEs3Wrs4oAI5iv
X-Gm-Gg: ASbGncvPxUrtDpRra6ALe2HsO8bHuDOw6FlEbG068Ht6e5O+4lTsnExNqxLgeDl8Ltx
 B7+xh36epYrdmwYe6la/Bju7d+d4NykNaJ90a+sRAI/oOpM6xCHBGdv70WR9IgogCTX0A9FQuhM
 L3HYJJt1zaSa3I9OF9Co6xNq4tp4eG/wjnRCUxDfa/Fl+jwBvWIB0V/FC2HfFMriLqu7EPrPIiL
 UtTydo41ZNu1JM1KbO+F3d03+JNYbLoeYAFDlxicxjxaq317fa9GJFTl6ZBllX2o1524Ddvw13E
 Y6yHrjjDN6SCiXs4
X-Google-Smtp-Source: AGHT+IHe873lwgBSOx12roMFUoX/pWu+ybMJMlclWGzsLsm+W6rPbHJG1LVgiHlxQhQxStQL04VdHw==
X-Received: by 2002:a05:600c:3494:b0:434:a315:19c with SMTP id
 5b1f17b1804b1-438dc3a85b3mr20395585e9.3.1738148480162; 
 Wed, 29 Jan 2025 03:01:20 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:18 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 13/13] drm/vkms: Allow to attach connectors and encoders
Date: Wed, 29 Jan 2025 12:00:59 +0100
Message-ID: <20250129110059.12199-14-jose.exposito89@gmail.com>
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

Add a list of possible encoders to the connector configuration and
helpers to attach and detach them.

Now that the default configuration has its connector and encoder
correctly, configure the output following the configuration.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 62 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 69 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 33 +++++++++
 drivers/gpu/drm/vkms/vkms_output.c            | 57 +++++++++++----
 4 files changed, 209 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 40c385eedc1d..d89acdc1a752 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -688,6 +688,67 @@ static void vkms_config_test_encoder_get_possible_crtcs(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_connector *connector_cfg1, *connector_cfg2;
+	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
+	struct vkms_config_encoder **array;
+	size_t length;
+	int err;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	connector_cfg1 = vkms_config_add_connector(config);
+	connector_cfg2 = vkms_config_add_connector(config);
+	encoder_cfg1 = vkms_config_add_encoder(config);
+	encoder_cfg2 = vkms_config_add_encoder(config);
+
+	/* No possible encoders */
+	array = vkms_config_connector_get_possible_encoders(connector_cfg1, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	array = vkms_config_connector_get_possible_encoders(connector_cfg2, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	/* Connector 1 attached to encoders 1 and 2 */
+	err = vkms_config_connector_attach_encoder(connector_cfg1, encoder_cfg1);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	err = vkms_config_connector_attach_encoder(connector_cfg1, encoder_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	array = vkms_config_connector_get_possible_encoders(connector_cfg1, &length);
+	KUNIT_ASSERT_EQ(test, length, 2);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], encoder_cfg1);
+	KUNIT_ASSERT_PTR_EQ(test, array[1], encoder_cfg2);
+	kfree(array);
+
+	array = vkms_config_connector_get_possible_encoders(connector_cfg2, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	/* Connector 1 attached to encoder 1 and connector 2 to encoder 2 */
+	vkms_config_connector_detach_encoder(connector_cfg1, encoder_cfg2);
+
+	array = vkms_config_connector_get_possible_encoders(connector_cfg1, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], encoder_cfg1);
+	kfree(array);
+
+	err = vkms_config_connector_attach_encoder(connector_cfg2, encoder_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	array = vkms_config_connector_get_possible_encoders(connector_cfg2, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], encoder_cfg2);
+	kfree(array);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
@@ -706,6 +767,7 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
+	KUNIT_CASE(vkms_config_test_connector_get_possible_encoders),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index e94e48fe3ad9..db6e3c71fd68 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -94,6 +94,9 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 		goto err_alloc;
 	vkms_config_connector_set_enabled(connector_cfg, true);
 
+	if (vkms_config_connector_attach_encoder(connector_cfg, encoder_cfg))
+		goto err_alloc;
+
 	return config;
 
 err_alloc:
@@ -629,6 +632,11 @@ struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config)
 void vkms_config_destroy_encoder(struct vkms_config *config,
 				 struct vkms_config_encoder *encoder_cfg)
 {
+	struct vkms_config_connector *connector_cfg;
+
+	list_for_each_entry(connector_cfg, &config->connectors, link)
+		vkms_config_connector_detach_encoder(connector_cfg, encoder_cfg);
+
 	xa_destroy(&encoder_cfg->possible_crtcs);
 	list_del(&encoder_cfg->link);
 	kfree(encoder_cfg);
@@ -702,6 +710,7 @@ struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *conf
 		return ERR_PTR(-ENOMEM);
 
 	vkms_config_connector_set_enabled(connector_cfg, false);
+	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
 
@@ -710,6 +719,66 @@ struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *conf
 
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
+	xa_for_each(&connector_cfg->possible_encoders, idx, possible_encoder) {
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
+	xa_for_each(&connector_cfg->possible_encoders, idx, possible_encoder) {
+		if (possible_encoder == encoder_cfg)
+			xa_erase(&connector_cfg->possible_encoders, idx);
+	}
+}
+
+struct vkms_config_encoder **
+vkms_config_connector_get_possible_encoders(struct vkms_config_connector *connector_cfg,
+					    size_t *out_length)
+{
+	struct vkms_config_encoder **array;
+	struct vkms_config_encoder *possible_encoder;
+	unsigned long idx;
+	size_t length = 0;
+	int n = 0;
+
+	xa_for_each(&connector_cfg->possible_encoders, idx, possible_encoder)
+		length++;
+
+	if (length == 0) {
+		*out_length = length;
+		return NULL;
+	}
+
+	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
+	if (!array)
+		return ERR_PTR(-ENOMEM);
+
+	xa_for_each(&connector_cfg->possible_encoders, idx, possible_encoder) {
+		array[n] = possible_encoder;
+		n++;
+	}
+
+	*out_length = length;
+	return array;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index cc32aadfda8d..24052de05e98 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -94,6 +94,7 @@ struct vkms_config_encoder {
  * @enabled: Connector are a different from planes, CRTCs and encoders because
  *           they can be added and removed once the device is created.
  *           This flag represents if they are part of the device or not.
+ * @possible_encoders: Array of encoders that can be used with this connector
  * @connector: Internal usage. This pointer should never be considered as valid.
  *             It can be used to store a temporary reference to a VKMS connector
  *             during device creation. This pointer is not managed by the
@@ -103,6 +104,7 @@ struct vkms_config_connector {
 	struct list_head link;
 
 	bool enabled;
+	struct xarray possible_encoders;
 
 	/* Internal usage */
 	struct vkms_connector *connector;
@@ -443,4 +445,35 @@ vkms_config_connector_set_enabled(struct vkms_config_connector *connector_cfg,
 	connector_cfg->enabled = enabled;
 }
 
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
+/**
+ * vkms_config_connector_get_possible_encoders() - Return the array of possible
+ * encoders
+ * @connector_cfg: Connector to get the possible encoders from
+ * @out_length: Length of the returned array
+ *
+ * Returns:
+ * A list of pointers to the configurations. On success, the caller is
+ * responsible to free the returned array, but not its contents. On error,
+ * it returns an error and @out_length is invalid.
+ */
+struct vkms_config_encoder **
+vkms_config_connector_get_possible_encoders(struct vkms_config_connector *connector_cfg,
+					    size_t *out_length);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 9c3e00817add..20ee8fdfa6f8 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -8,13 +8,14 @@
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	struct vkms_connector *connector;
 	struct vkms_config_plane **plane_cfgs = NULL;
 	size_t n_planes;
 	struct vkms_config_crtc **crtc_cfgs = NULL;
 	size_t n_crtcs;
 	struct vkms_config_encoder **encoder_cfgs = NULL;
 	size_t n_encoders;
+	struct vkms_config_connector **connector_cfgs = NULL;
+	size_t n_connectors;
 	int ret = 0;
 	int writeback;
 	unsigned int n, i;
@@ -35,6 +36,13 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		goto err_free;
 	}
 
+	connector_cfgs = vkms_config_get_connectors(vkmsdev->config,
+						    &n_connectors);
+	if (IS_ERR(connector_cfgs)) {
+		ret = PTR_ERR(connector_cfgs);
+		goto err_free;
+	}
+
 	for (n = 0; n < n_planes; n++) {
 		struct vkms_config_plane *plane_cfg;
 		enum drm_plane_type type;
@@ -136,18 +144,42 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		kfree(possible_crtcs);
 	}
 
-	connector = vkms_connector_init(vkmsdev);
-	if (IS_ERR(connector)) {
-		DRM_ERROR("Failed to init connector\n");
-		ret = PTR_ERR(connector);
-		goto err_free;
-	}
+	for (n = 0; n < n_connectors; n++) {
+		struct vkms_config_connector *connector_cfg;
+		struct vkms_config_encoder **possible_encoders;
+		size_t n_possible_encoders;
 
-	/* Attach the encoder and the connector */
-	ret = drm_connector_attach_encoder(&connector->base, encoder_cfgs[0]->encoder);
-	if (ret) {
-		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_free;
+		connector_cfg = connector_cfgs[n];
+
+		connector_cfg->connector = vkms_connector_init(vkmsdev);
+		if (IS_ERR(connector_cfg->connector)) {
+			DRM_ERROR("Failed to init connector\n");
+			ret = PTR_ERR(connector_cfg->connector);
+			goto err_free;
+		}
+
+		possible_encoders =
+			vkms_config_connector_get_possible_encoders(connector_cfg,
+								    &n_possible_encoders);
+		if (IS_ERR(possible_encoders)) {
+			ret = PTR_ERR(possible_encoders);
+			goto err_free;
+		}
+
+		for (i = 0; i < n_possible_encoders; i++) {
+			struct vkms_config_encoder *possible_encoder;
+
+			possible_encoder = possible_encoders[i];
+			ret = drm_connector_attach_encoder(&connector_cfg->connector->base,
+							   possible_encoder->encoder);
+			if (ret) {
+				DRM_ERROR("Failed to attach connector to encoder\n");
+				kfree(possible_encoders);
+				goto err_free;
+			}
+		}
+
+		kfree(possible_encoders);
 	}
 
 	drm_mode_config_reset(dev);
@@ -156,6 +188,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	kfree(plane_cfgs);
 	kfree(crtc_cfgs);
 	kfree(encoder_cfgs);
+	kfree(connector_cfgs);
 
 	return ret;
 }
-- 
2.48.1

