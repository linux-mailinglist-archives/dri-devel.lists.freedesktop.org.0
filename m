Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A3A21B8B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A170010E7AB;
	Wed, 29 Jan 2025 11:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m9o3JefS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608C510E7AB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:19 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso70189675e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148478; x=1738753278; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ctx3bBvh7dKYn9+bYFpGOwRx0uhS4Evu/DJfS35toY=;
 b=m9o3JefSG5l6s0Q731eb1SCBpwbmf0a2mppRlKI2iK7l8UX7YmFx8+aEmlxJD4zNp0
 wfUqtOU3IOS/l10mPHdyJ69EnU8M/wagUq3R9VrEYWKSU+HqZTG9gtGrq67MGfASK1m2
 nNuhTlBHWwyN4b4pyqvo8wWT7/5YmCQvReTyRVWL4X4Gdj1/5JcVOz1RvssHoRHr4Yt4
 t11qvvL4uy8osJa6yiLsLI2vOeoSaBkk1R6mcWvwskuVdU5uUal6kyWBS25WuVfjqWva
 a1kFACWib9sAjPkjfFCVUN1lI69x3v6vF/WQmwD4XW50zBy1Xq1CoOqRnc7Cqzo+VZMH
 fIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148478; x=1738753278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ctx3bBvh7dKYn9+bYFpGOwRx0uhS4Evu/DJfS35toY=;
 b=FSbTCo393RhaH9artg03M7Oku2NCqkpbe42dWHbuk+Iy9CTtq36d4s22WVf31AvWfL
 tII3hz32jsW1Ry6YS4hZYXxBWEXEaBAzraonlUippoN33UYjsZv/5eWynkRgLBfIcCno
 5s18RpI8YH8vlqhJNj2u2uOEsXSHRxo+oWBPZN268SYJzliUnfgQgOGiVd73UEiStcvp
 H4D8XDKapN7EAM19I8g/4Jt2XP5YHLWxmhYc5N9vK8bqVFVNS61SPRPoxDVvwCBPvlOr
 xK8cRh8GVRkthf/V6/POg/sJBwjMJnzWfXBfbVPtVckb9AJZ6ujbcA8jbKgLGjGLH2zL
 uXGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV29blSw4xBkEUVDD3813zKVAuxfbqlnt1uBMXgvC1hD+p27Pm1JqPEoqHHlB5SUbXzZKWt8O8QQ+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza9rT3cJo+Cn2s6N4EUeO9hA4fWfSBPDuazB5nATOpzT4cPOg7
 VssLp2MfkunIU722NHZ2E2YrDVGCaeMXvi9wbvCzhL0lnzsajbn/
X-Gm-Gg: ASbGncuJ8KK+huWEcTPCTPZzoAhIcFyG7kAU0H61IecHdsRF7UoQ6EEng4ZF8VFHU6F
 usEoVFHFAeOg0IgprvNSvSIHA0ANAj9Dfdv2evP61mY+9DmxzmmkhgKvrhpxAx6rTDL0PsYRKWt
 Mum5PVY/q9oapd2gu4MqPiw8JUzTSYTAQnnRgIZkbF9aauI37zDCdFsbT0czRcdYEV/pMQjJmrg
 3sdbzIeUohhyN4alFv+nEKy5JgnJvscKPqHQmCC75QpiFvhRmYru9YzVu9KraCLIFZAlt94qbmN
 a4wCOSWBG0Kg8lQ9TvY8h4c72dI=
X-Google-Smtp-Source: AGHT+IGwOpnYkfxSC17PNmKgDXS/E15tZQhZiHk1BMlGNoe2KSpGP7el/jfnz4r9qDPjkJ51kbuApg==
X-Received: by 2002:a05:600c:1d1e:b0:434:a90b:94fe with SMTP id
 5b1f17b1804b1-438dc3c2608mr23253225e9.10.1738148477437; 
 Wed, 29 Jan 2025 03:01:17 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:17 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 11/13] drm/vkms: Allow to attach encoders and CRTCs
Date: Wed, 29 Jan 2025 12:00:57 +0100
Message-ID: <20250129110059.12199-12-jose.exposito89@gmail.com>
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

Add a list of possible CRTCs to the encoder configuration and helpers to
attach and detach them.

Now that the default configuration has its encoder and CRTC correctly
attached, configure the output following the configuration.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 112 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 106 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            |  33 ++++++
 drivers/gpu/drm/vkms/vkms_output.c            |  64 +++++++---
 4 files changed, 299 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 6c09363d9a96..27d44315c2de 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -244,6 +244,7 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 	int err;
 
 	config = vkms_config_default_create(false, false, false);
@@ -297,6 +298,9 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 
 	/* Invalid: Second CRTC without primary plane */
 	crtc_cfg = vkms_config_add_crtc(config);
+	encoder_cfg = vkms_config_add_encoder(config);
+	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid: Second CRTC with a primary plane */
@@ -374,6 +378,51 @@ static void vkms_config_test_valid_encoder_number(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
+	struct vkms_config_encoder *encoder_cfg;
+	int err;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	crtc_cfg1 = list_first_entry(&config->crtcs, typeof(*crtc_cfg1), link);
+
+	/* Invalid: Encoder without a possible CRTC */
+	encoder_cfg = vkms_config_add_encoder(config);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: Second CRTC with shared encoder */
+	crtc_cfg2 = vkms_config_add_crtc(config);
+
+	plane_cfg = vkms_config_add_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg1);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Second CRTC without encoders */
+	vkms_config_encoder_detach_crtc(encoder_cfg, crtc_cfg2);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: First CRTC with 2 possible encoder */
+	vkms_config_destroy_plane(plane_cfg);
+	vkms_config_destroy_crtc(config, crtc_cfg2);
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_plane_attach_crtc(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -496,6 +545,67 @@ static void vkms_config_test_plane_get_possible_crtcs(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_encoder_get_possible_crtcs(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
+	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
+	struct vkms_config_crtc **array;
+	size_t length;
+	int err;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	encoder_cfg1 = vkms_config_add_encoder(config);
+	encoder_cfg2 = vkms_config_add_encoder(config);
+	crtc_cfg1 = vkms_config_add_crtc(config);
+	crtc_cfg2 = vkms_config_add_crtc(config);
+
+	/* No possible CRTCs */
+	array = vkms_config_encoder_get_possible_crtcs(encoder_cfg1, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	array = vkms_config_encoder_get_possible_crtcs(encoder_cfg2, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	/* Encoder 1 attached to CRTC 1 and 2 */
+	err = vkms_config_encoder_attach_crtc(encoder_cfg1, crtc_cfg1);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	err = vkms_config_encoder_attach_crtc(encoder_cfg1, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	array = vkms_config_encoder_get_possible_crtcs(encoder_cfg1, &length);
+	KUNIT_ASSERT_EQ(test, length, 2);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], crtc_cfg1);
+	KUNIT_ASSERT_PTR_EQ(test, array[1], crtc_cfg2);
+	kfree(array);
+
+	array = vkms_config_encoder_get_possible_crtcs(encoder_cfg2, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	/* Encoder 1 attached to CRTC 1 and encoder 2 to CRTC 2 */
+	vkms_config_encoder_detach_crtc(encoder_cfg1, crtc_cfg2);
+
+	array = vkms_config_encoder_get_possible_crtcs(encoder_cfg1, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], crtc_cfg1);
+	kfree(array);
+
+	err = vkms_config_encoder_attach_crtc(encoder_cfg2, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	array = vkms_config_encoder_get_possible_crtcs(encoder_cfg2, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], crtc_cfg2);
+	kfree(array);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
@@ -508,8 +618,10 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_valid_crtc_number),
 	KUNIT_CASE(vkms_config_test_valid_encoder_number),
+	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
+	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 75e72f9b5972..437a9980e9a8 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -84,6 +84,9 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (IS_ERR(encoder_cfg))
 		goto err_alloc;
 
+	if (vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg))
+		goto err_alloc;
+
 	return config;
 
 err_alloc:
@@ -288,6 +291,40 @@ static bool valid_encoder_number(struct vkms_config *config)
 	return true;
 }
 
+static bool valid_encoder_possible_crtcs(struct vkms_config *config)
+{
+	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
+
+	list_for_each_entry(encoder_cfg, &config->encoders, link) {
+		if (xa_empty(&encoder_cfg->possible_crtcs)) {
+			pr_err("All encoders must have at least one possible CRTC\n");
+			return false;
+		}
+	}
+
+	list_for_each_entry(crtc_cfg, &config->crtcs, link) {
+		bool crtc_has_encoder = false;
+
+		list_for_each_entry(encoder_cfg, &config->encoders, link) {
+			struct vkms_config_crtc *possible_crtc;
+			unsigned long idx = 0;
+
+			xa_for_each(&encoder_cfg->possible_crtcs, idx, possible_crtc) {
+				if (possible_crtc == crtc_cfg)
+					crtc_has_encoder = true;
+			}
+		}
+
+		if (!crtc_has_encoder) {
+			pr_err("All CRTCs must have at least one possible encoder\n");
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
@@ -309,6 +346,9 @@ bool vkms_config_is_valid(struct vkms_config *config)
 			return false;
 	}
 
+	if (!valid_encoder_possible_crtcs(config))
+		return false;
+
 	return true;
 }
 
@@ -454,10 +494,14 @@ void vkms_config_destroy_crtc(struct vkms_config *config,
 			      struct vkms_config_crtc *crtc_cfg)
 {
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 
 	list_for_each_entry(plane_cfg, &config->planes, link)
 		vkms_config_plane_detach_crtc(plane_cfg, crtc_cfg);
 
+	list_for_each_entry(encoder_cfg, &config->encoders, link)
+		vkms_config_encoder_detach_crtc(encoder_cfg, crtc_cfg);
+
 	list_del(&crtc_cfg->link);
 	kfree(crtc_cfg);
 }
@@ -503,6 +547,8 @@ struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config)
 	if (!encoder_cfg)
 		return ERR_PTR(-ENOMEM);
 
+	xa_init_flags(&encoder_cfg->possible_crtcs, XA_FLAGS_ALLOC);
+
 	list_add_tail(&encoder_cfg->link, &config->encoders);
 
 	return encoder_cfg;
@@ -511,6 +557,66 @@ struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config)
 void vkms_config_destroy_encoder(struct vkms_config *config,
 				 struct vkms_config_encoder *encoder_cfg)
 {
+	xa_destroy(&encoder_cfg->possible_crtcs);
 	list_del(&encoder_cfg->link);
 	kfree(encoder_cfg);
 }
+
+int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *encoder_cfg,
+						 struct vkms_config_crtc *crtc_cfg)
+{
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+	u32 crtc_idx = 0;
+
+	xa_for_each(&encoder_cfg->possible_crtcs, idx, possible_crtc) {
+		if (possible_crtc == crtc_cfg)
+			return -EINVAL;
+	}
+
+	return xa_alloc(&encoder_cfg->possible_crtcs, &crtc_idx, crtc_cfg,
+			xa_limit_32b, GFP_KERNEL);
+}
+
+void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
+				     struct vkms_config_crtc *crtc_cfg)
+{
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+
+	xa_for_each(&encoder_cfg->possible_crtcs, idx, possible_crtc) {
+		if (possible_crtc == crtc_cfg)
+			xa_erase(&encoder_cfg->possible_crtcs, idx);
+	}
+}
+
+struct vkms_config_crtc **
+vkms_config_encoder_get_possible_crtcs(struct vkms_config_encoder *encoder_cfg,
+				       size_t *out_length)
+{
+	struct vkms_config_crtc **array;
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx;
+	size_t length = 0;
+	int n = 0;
+
+	xa_for_each(&encoder_cfg->possible_crtcs, idx, possible_crtc)
+		length++;
+
+	if (length == 0) {
+		*out_length = 0;
+		return NULL;
+	}
+
+	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
+	if (!array)
+		return ERR_PTR(-ENOMEM);
+
+	xa_for_each(&encoder_cfg->possible_crtcs, idx, possible_crtc) {
+		array[n] = possible_crtc;
+		n++;
+	}
+
+	*out_length = length;
+	return array;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 40774d0daeac..5f4a33e113bf 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -70,6 +70,7 @@ struct vkms_config_crtc {
  * struct vkms_config_encoder
  *
  * @link: Link to the others encoders in vkms_config
+ * @possible_crtcs: Array of CRTCs that can be used with this encoder
  * @encoder: Internal usage. This pointer should never be considered as valid.
  *           It can be used to store a temporary reference to a VKMS encoder
  *           during device creation. This pointer is not managed by the
@@ -78,6 +79,8 @@ struct vkms_config_crtc {
 struct vkms_config_encoder {
 	struct list_head link;
 
+	struct xarray possible_crtcs;
+
 	/* Internal usage */
 	struct drm_encoder *encoder;
 };
@@ -334,4 +337,34 @@ struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config);
 void vkms_config_destroy_encoder(struct vkms_config *config,
 				 struct vkms_config_encoder *encoder_cfg);
 
+/**
+ * vkms_config_encoder_attach_crtc - Attach a encoder to a CRTC
+ * @encoder_cfg: Encoder to attach
+ * @crtc_cfg: CRTC to attach @encoder_cfg to
+ */
+int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *encoder_cfg,
+						 struct vkms_config_crtc *crtc_cfg);
+
+/**
+ * vkms_config_encoder_detach_crtc - Detach a encoder from a CRTC
+ * @encoder_cfg: Encoder to detach
+ * @crtc_cfg: CRTC to detach @encoder_cfg from
+ */
+void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
+				     struct vkms_config_crtc *crtc_cfg);
+
+/**
+ * vkms_config_encoder_get_possible_crtcs() - Return the array of possible CRTCs
+ * @encoder_cfg: Encoder to get the possible CRTCs from
+ * @out_length: Length of the returned array
+ *
+ * Returns:
+ * A list of pointers to the configurations. On success, the caller is
+ * responsible to free the returned array, but not its contents. On error,
+ * it returns an error and @out_length is invalid.
+ */
+struct vkms_config_crtc **
+vkms_config_encoder_get_possible_crtcs(struct vkms_config_encoder *encoder_cfg,
+				       size_t *out_length);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 427d0aad8901..9c3e00817add 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -9,11 +9,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
-	struct drm_encoder *encoder;
 	struct vkms_config_plane **plane_cfgs = NULL;
 	size_t n_planes;
 	struct vkms_config_crtc **crtc_cfgs = NULL;
 	size_t n_crtcs;
+	struct vkms_config_encoder **encoder_cfgs = NULL;
+	size_t n_encoders;
 	int ret = 0;
 	int writeback;
 	unsigned int n, i;
@@ -28,6 +29,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		goto err_free;
 	}
 
+	encoder_cfgs = vkms_config_get_encoders(vkmsdev->config, &n_encoders);
+	if (IS_ERR(encoder_cfgs)) {
+		ret = PTR_ERR(encoder_cfgs);
+		goto err_free;
+	}
+
 	for (n = 0; n < n_planes; n++) {
 		struct vkms_config_plane *plane_cfg;
 		enum drm_plane_type type;
@@ -91,6 +98,44 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		kfree(possible_crtcs);
 	}
 
+	for (n = 0; n < n_encoders; n++) {
+		struct vkms_config_encoder *encoder_cfg;
+		struct vkms_config_crtc **possible_crtcs;
+		size_t n_possible_crtcs;
+
+		encoder_cfg = encoder_cfgs[n];
+
+		encoder_cfg->encoder = drmm_kzalloc(dev, sizeof(*encoder_cfg->encoder), GFP_KERNEL);
+		if (!encoder_cfg->encoder) {
+			DRM_ERROR("Failed to allocate encoder\n");
+			ret = -ENOMEM;
+			goto err_free;
+		}
+		ret = drmm_encoder_init(dev, encoder_cfg->encoder, NULL,
+					DRM_MODE_ENCODER_VIRTUAL, NULL);
+		if (ret) {
+			DRM_ERROR("Failed to init encoder\n");
+			goto err_free;
+		}
+
+		possible_crtcs = vkms_config_encoder_get_possible_crtcs(encoder_cfg,
+									&n_possible_crtcs);
+		if (IS_ERR(possible_crtcs)) {
+			ret = PTR_ERR(possible_crtcs);
+			goto err_free;
+		}
+
+		for (i = 0; i < n_possible_crtcs; i++) {
+			struct vkms_config_crtc *possible_crtc;
+
+			possible_crtc = possible_crtcs[i];
+			encoder_cfg->encoder->possible_crtcs |=
+				drm_crtc_mask(&possible_crtc->crtc->crtc);
+		}
+
+		kfree(possible_crtcs);
+	}
+
 	connector = vkms_connector_init(vkmsdev);
 	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
@@ -98,22 +143,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		goto err_free;
 	}
 
-	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
-	if (!encoder) {
-		DRM_ERROR("Failed to allocate encoder\n");
-		ret = -ENOMEM;
-		goto err_free;
-	}
-	ret = drmm_encoder_init(dev, encoder, NULL,
-				DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to init encoder\n");
-		goto err_free;
-	}
-	encoder->possible_crtcs = drm_crtc_mask(&crtc_cfgs[0]->crtc->crtc);
-
 	/* Attach the encoder and the connector */
-	ret = drm_connector_attach_encoder(&connector->base, encoder);
+	ret = drm_connector_attach_encoder(&connector->base, encoder_cfgs[0]->encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
 		goto err_free;
@@ -124,6 +155,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 err_free:
 	kfree(plane_cfgs);
 	kfree(crtc_cfgs);
+	kfree(encoder_cfgs);
 
 	return ret;
 }
-- 
2.48.1

