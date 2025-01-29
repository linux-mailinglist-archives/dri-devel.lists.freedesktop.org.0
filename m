Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ECFA21B8F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CBA10E7B4;
	Wed, 29 Jan 2025 11:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="icdm4PBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A20F10E7AB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:18 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so3357485f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148477; x=1738753277; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AeAv/5lTYD8GiNcnw1WJeIlZJ4ADDa5O2/fInNJ5TA0=;
 b=icdm4PBF/343UpPmoHC6r4aHw3aBdaOzm5pSKbnZRDP30ZIW6nlB7kuyqGA3AXndrU
 uojO0yQpEZw20uDMimcqD90WUzm+vLy8zVarDNZu1U+0jX8FFB4yjQWV7bdnHi5nBqJS
 0H7XQkOKq9H2/KD3vyiKNWvf/ZFgS11Z7vBsb4ISHtFMCVXU3tB4KaeTEixV7BNkG4+7
 eK6duxD5oTJAEGtZnJOY2R8wBy4dlvkYiMt4k7DfDJzVr5y3kRSiFPpSnORAUI2K+56O
 IQc1xVLC2Lj9mPV9bSS3rJuNFsOj67Ont/qrALdaCbfe6CpoCwqll+sQhGO7+ATlvzN7
 V9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148477; x=1738753277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AeAv/5lTYD8GiNcnw1WJeIlZJ4ADDa5O2/fInNJ5TA0=;
 b=IBOOnFcI8TydwY7yerCzayu6r6Ji9Nrx6b1RoQiXJWto+O5TOOsJlmYJibRE1rveQK
 7C9bTi+cabA0q6koEUda2Jnk57mZ8B/EfUDSu5VyhwZGlrverKsY5WGh1qO3F0T1l9Vg
 /izBLyCTxjvHKbdpslR3scGox4FqfL8ZmKL2Y46GWLaQF5ScYGKFtydnZEjODxjS+K5K
 cforabOVgnILQMov/mIR85Be7hNN5xHFBm+pOFolHWM1eXkF3SBbLnvi0TH5SdUFvR3u
 5UtFipEcrlfrLp1+mFILiqwd1uGx7pU+d6d7NM1sjHLgluOwRgBeSEzwOcv2euEkHdlj
 rX7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPAgKCBJSvtbnNvu10UPQcld8HIpmz2tLuBK0vkFbcl733GOC9XttCYo43ZtzDjzlt1sbC4J6yeec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiHEgdf7XLLYj5G02Ew+jRWKy+Duwu5BwcnMMmiK9btzSIhpYb
 EfUPJBMPB+2mUzCirIvBS+OUxX3YbLVj8CpygcZ076W8ud+mLTAg
X-Gm-Gg: ASbGnctplAD5HmzBWNVHGN9/CB3lRMjuGTwqV8J1RXGitdB56cf+JlGBkkOMBOucr/S
 On7LS2tIKIqbI61zgwUr3OoKbTOGuRLHAnPMUBKZkpYtJydgjk1/xfj6ogL4MqHGRRArgBOlS/t
 sGV9QnUji76pM6riFNkZhUAWnjH7RijH388M+0JZVaEp5OurpUoA22/tdA572rlJtjlVh/ybcEO
 b+r0kQKqZQp5/HbxfsFc25zRiSKDL1OWK/rooAIYgoc86w4aKnxYqAbhpwcViqUfY9w7hFaKa65
 WlNmCVYLXfKNGFQqA0rvtec94+4=
X-Google-Smtp-Source: AGHT+IHHCx+npwL1T2h8TDIMwNBgX+6NeaIWD3PcUKnbkw8C0FD0i29soN8lgyZbFPebW96899TEDA==
X-Received: by 2002:a5d:64a1:0:b0:385:f17b:de54 with SMTP id
 ffacd0b85a97d-38c5193112amr2151371f8f.5.1738148476587; 
 Wed, 29 Jan 2025 03:01:16 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:16 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 10/13] drm/vkms: Allow to configure multiple encoders
Date: Wed, 29 Jan 2025 12:00:56 +0100
Message-ID: <20250129110059.12199-11-jose.exposito89@gmail.com>
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

Add a list of encoders to vkms_config and helper functions to add and
remove as many encoders as wanted.

For backwards compatibility, add one encoder to the default
configuration.

A future patch will allow to attach encoders and CRTCs, but for the
moment there are no changes in the way the output is configured.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 65 ++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 78 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 49 ++++++++++++
 3 files changed, 192 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 5e698616491a..6c09363d9a96 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -26,6 +26,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
 
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->crtcs));
+	KUNIT_EXPECT_TRUE(test, list_empty(&config->encoders));
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -99,6 +100,9 @@ static void vkms_config_test_default_config(struct kunit *test)
 		KUNIT_EXPECT_EQ(test, n_possible_crtcs, 1);
 	}
 
+	/* Encoders */
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 1);
+
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -176,6 +180,42 @@ static void vkms_config_test_get_crtcs(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_get_encoders(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
+	struct vkms_config_encoder **array;
+	size_t length;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	array = vkms_config_get_encoders(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	encoder_cfg1 = vkms_config_add_encoder(config);
+	array = vkms_config_get_encoders(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], encoder_cfg1);
+	kfree(array);
+
+	encoder_cfg2 = vkms_config_add_encoder(config);
+	array = vkms_config_get_encoders(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 2);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], encoder_cfg1);
+	KUNIT_ASSERT_PTR_EQ(test, array[1], encoder_cfg2);
+	kfree(array);
+
+	vkms_config_destroy_encoder(config, encoder_cfg2);
+	array = vkms_config_get_encoders(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], encoder_cfg1);
+	kfree(array);
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_valid_plane_number(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -311,6 +351,29 @@ static void vkms_config_test_valid_crtc_number(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_valid_encoder_number(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_encoder *encoder_cfg;
+	int n;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	/* Invalid: No encoders */
+	encoder_cfg = list_first_entry(&config->encoders, typeof(*encoder_cfg), link);
+	vkms_config_destroy_encoder(config, encoder_cfg);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Too many encoders */
+	for (n = 0; n <= 32; n++)
+		vkms_config_add_encoder(config);
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_plane_attach_crtc(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -439,10 +502,12 @@ static struct kunit_case vkms_config_test_cases[] = {
 			 default_config_gen_params),
 	KUNIT_CASE(vkms_config_test_get_planes),
 	KUNIT_CASE(vkms_config_test_get_crtcs),
+	KUNIT_CASE(vkms_config_test_get_encoders),
 	KUNIT_CASE(vkms_config_test_valid_plane_number),
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_valid_crtc_number),
+	KUNIT_CASE(vkms_config_test_valid_encoder_number),
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	{}
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index a2ce4905589b..75e72f9b5972 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -23,6 +23,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 
 	INIT_LIST_HEAD(&config->planes);
 	INIT_LIST_HEAD(&config->crtcs);
+	INIT_LIST_HEAD(&config->encoders);
 
 	return config;
 }
@@ -34,6 +35,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 	int n;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
@@ -78,6 +80,10 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 			goto err_alloc;
 	}
 
+	encoder_cfg = vkms_config_add_encoder(config);
+	if (IS_ERR(encoder_cfg))
+		goto err_alloc;
+
 	return config;
 
 err_alloc:
@@ -89,6 +95,7 @@ void vkms_config_destroy(struct vkms_config *config)
 {
 	struct vkms_config_plane *plane_cfg, *plane_tmp;
 	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
+	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
 
 	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
 		vkms_config_destroy_plane(plane_cfg);
@@ -96,6 +103,9 @@ void vkms_config_destroy(struct vkms_config *config)
 	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, link)
 		vkms_config_destroy_crtc(config, crtc_cfg);
 
+	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, link)
+		vkms_config_destroy_encoder(config, encoder_cfg);
+
 	kfree_const(config->dev_name);
 	kfree(config);
 }
@@ -154,6 +164,33 @@ struct vkms_config_crtc **vkms_config_get_crtcs(const struct vkms_config *config
 	return array;
 }
 
+struct vkms_config_encoder **vkms_config_get_encoders(const struct vkms_config *config,
+						      size_t *out_length)
+{
+	struct vkms_config_encoder **array;
+	struct vkms_config_encoder *encoder_cfg;
+	size_t length;
+	int n = 0;
+
+	length = list_count_nodes((struct list_head *)&config->encoders);
+	if (length == 0) {
+		*out_length = length;
+		return NULL;
+	}
+
+	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
+	if (!array)
+		return ERR_PTR(-ENOMEM);
+
+	list_for_each_entry(encoder_cfg, &config->encoders, link) {
+		array[n] = encoder_cfg;
+		n++;
+	}
+
+	*out_length = length;
+	return array;
+}
+
 static bool valid_plane_number(struct vkms_config *config)
 {
 	size_t n_planes;
@@ -238,6 +275,19 @@ static bool valid_crtc_number(struct vkms_config *config)
 	return true;
 }
 
+static bool valid_encoder_number(struct vkms_config *config)
+{
+	size_t n_encoders;
+
+	n_encoders = list_count_nodes(&config->encoders);
+	if (n_encoders <= 0 || n_encoders >= 32) {
+		pr_err("The number of encoders must be between 1 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -248,6 +298,9 @@ bool vkms_config_is_valid(struct vkms_config *config)
 	if (!valid_crtc_number(config))
 		return false;
 
+	if (!valid_encoder_number(config))
+		return false;
+
 	if (!valid_plane_possible_crtcs(config))
 		return false;
 
@@ -267,6 +320,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	const char *dev_name;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 
 	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
 	seq_printf(m, "dev_name=%s\n", dev_name);
@@ -283,6 +337,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			   vkms_config_crtc_get_writeback(crtc_cfg));
 	}
 
+	list_for_each_entry(encoder_cfg, &vkmsdev->config->encoders, link) {
+		seq_puts(m, "encoder\n");
+	}
+
 	return 0;
 }
 
@@ -436,3 +494,23 @@ struct vkms_config_plane *vkms_config_crtc_cursor_plane(const struct vkms_config
 {
 	return vkms_config_crtc_get_plane(config, crtc_cfg, DRM_PLANE_TYPE_CURSOR);
 }
+
+struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config)
+{
+	struct vkms_config_encoder *encoder_cfg;
+
+	encoder_cfg = kzalloc(sizeof(*encoder_cfg), GFP_KERNEL);
+	if (!encoder_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	list_add_tail(&encoder_cfg->link, &config->encoders);
+
+	return encoder_cfg;
+}
+
+void vkms_config_destroy_encoder(struct vkms_config *config,
+				 struct vkms_config_encoder *encoder_cfg)
+{
+	list_del(&encoder_cfg->link);
+	kfree(encoder_cfg);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 1f2e6c485d08..40774d0daeac 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -14,12 +14,14 @@
  * @dev_name: Name of the device
  * @planes: List of planes configured for the device
  * @crtcs: List of CRTCs configured for the device
+ * @encoders: List of encoders configured for the device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
 	const char *dev_name;
 	struct list_head planes;
 	struct list_head crtcs;
+	struct list_head encoders;
 	struct vkms_device *dev;
 };
 
@@ -64,6 +66,22 @@ struct vkms_config_crtc {
 	struct vkms_output *crtc;
 };
 
+/**
+ * struct vkms_config_encoder
+ *
+ * @link: Link to the others encoders in vkms_config
+ * @encoder: Internal usage. This pointer should never be considered as valid.
+ *           It can be used to store a temporary reference to a VKMS encoder
+ *           during device creation. This pointer is not managed by the
+ *           configuration and must be managed by other means.
+ */
+struct vkms_config_encoder {
+	struct list_head link;
+
+	/* Internal usage */
+	struct drm_encoder *encoder;
+};
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -139,6 +157,19 @@ static inline size_t vkms_config_get_num_crtcs(struct vkms_config *config)
 struct vkms_config_crtc **vkms_config_get_crtcs(const struct vkms_config *config,
 						size_t *out_length);
 
+/**
+ * vkms_config_get_encoders() - Return the array of encoders of the device
+ * @config: Configuration to get the encoders from
+ * @out_length: Length of the returned array
+ *
+ * Returns:
+ * A list of pointers to the configurations. On success, the caller is
+ * responsible to free the returned array, but not its contents. On error,
+ * it returns an error and @out_length is invalid.
+ */
+struct vkms_config_encoder **vkms_config_get_encoders(const struct vkms_config *config,
+						      size_t *out_length);
+
 /**
  * vkms_config_is_valid() - Validate a configuration
  * @config: Configuration to validate
@@ -285,4 +316,22 @@ struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_confi
 struct vkms_config_plane *vkms_config_crtc_cursor_plane(const struct vkms_config *config,
 							struct vkms_config_crtc *crtc_cfg);
 
+/**
+ * vkms_config_add_encoder() - Add a new encoder configuration
+ * @config: Configuration to add the encoder to
+ *
+ * Returns:
+ * The new encoder configuration or an error. Call vkms_config_destroy_encoder()
+ * to free the returned encoder configuration.
+ */
+struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config);
+
+/**
+ * vkms_config_destroy_encoder() - Remove and free a encoder configuration
+ * @config: Configuration to remove the encoder from
+ * @encoder_cfg: Encoder configuration to destroy
+ */
+void vkms_config_destroy_encoder(struct vkms_config *config,
+				 struct vkms_config_encoder *encoder_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
-- 
2.48.1

