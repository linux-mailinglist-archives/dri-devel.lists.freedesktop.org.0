Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E461A37F36
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD56410E3C2;
	Mon, 17 Feb 2025 10:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TFV9sYhf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA4D10E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:01:39 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38f2f748128so1215396f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786498; x=1740391298; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQlaDUo4DM2CfG9+Vwr7FXGbsG9nzlidtjF2Ge79JFI=;
 b=TFV9sYhfokHqI9VGYK4x0n8eH7pN0aCUNbIwIWy3zwX2TjU1HH4PmSD0gXQ49Vyh7a
 1Nl927bs1ou8Yz97DxEJHB+dY66fXLJJEMGjBPXSJZygeayacQ1ZVVHjjGX91fqVu65D
 5k+ylBZAt4WcCo60FrnIAUHWb79WWKWvmmrjn0JHPWJrUvVVm3L9zI6xMo7ZF7XaJ4dy
 TSkw3UOphvsGa4XvbWwzQi2I0pDxQgsuHfdYYiOIAySM1zEEKNeHX4UIX3ft049n8zx/
 cIMQ3fJEo0WwsXwBr5/HurBaLjGkjvglsWubc3Ghxyxi19OovLMmTmLFT2A4l3Pi8Dqu
 QM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786498; x=1740391298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cQlaDUo4DM2CfG9+Vwr7FXGbsG9nzlidtjF2Ge79JFI=;
 b=lLsH+zwTHQfz7fDXN2CRpSc+JsoL9lGZi+69Sn3PbF0+KT4Rsuks/aq8LIGOqsHpZO
 bOspkfhN6ikIZ0nq2d4wDhozn8YqhEo+dp/+3XEDRL3hH4w8RhqRcdqbYd2V88tZ6EV8
 s48oLIznN8d0WJYw2JDZ4BdyTK8n9ervOS+wXDqqo9UUt5C8eegTA913vPJoYOqKhhVl
 pUPRI5/SXGjn0CEnF2Oj9EziXCRcpAnd171MSio6E3hMjswqvikXuFX5dcxVBHayviVi
 1xuMHQKDNsMa0Wthr9XoraV7ICfgMBcgeSKzIh6t6Mc0VOGaN4YuIq6srl+lfUbF7P4t
 FNEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1NgooDO81JxH9l+USHApAvuM3ASM1gC8bLQ3+y7uyzprnSFNBsUxLmCrhWUkdY1XQBzkA/dujDss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypwbVjVkrz3NNg+nu5qX62qBTrenPzqmDL6AymWzxZOXhzUN4L
 NycH6ck42FIhWVdMW6D8M7ONtju20ZqXApl3knacf93we51WvQIW
X-Gm-Gg: ASbGnctD5ZYz4HhLQy6gxIi93j4Oth02TVcqikjX93J65EMlEtU8JNE1rnTdf+emtd8
 Q4XQemqAEyp/IQ8/K+2A4VdqK4uzSvB+/Yz6+OJmjrZEXITgk+xYWshHn1VO98iQHx6Aq4Ix9VN
 2NXT08FBcTHUNRc2FpbpcLR3DxwQ6fPhoY/1ZUG34HlWs/EWf/2W5/fFug/KxT/IwonCbkB4x1D
 saF7bjpSDvdkyns76thwmkBT2+Lfff3241nx6sOdIry5n1R1b5kQ7lLzQc/OjN0HAS86w01GRgM
 tIXJqrdFGs8DEgXYTg==
X-Google-Smtp-Source: AGHT+IERgf4vCWOYJpiPaChwre4D7Jf7Oj+yRx0VaKhY3mB+GYSaJMeKEQKY6m15DvRWOPQHqCbCQw==
X-Received: by 2002:a05:6000:1568:b0:38f:43c8:f751 with SMTP id
 ffacd0b85a97d-38f43c8fa82mr4178871f8f.35.1739786497932; 
 Mon, 17 Feb 2025 02:01:37 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm11591901f8f.86.2025.02.17.02.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:01:37 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 12/14] drm/vkms: Allow to attach encoders and CRTCs
Date: Mon, 17 Feb 2025 11:01:18 +0100
Message-ID: <20250217100120.7620-13-jose.exposito89@gmail.com>
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

Add a list of possible CRTCs to the encoder configuration and helpers to
attach and detach them.

Now that the default configuration has its encoder and CRTC correctly
attached, configure the output following the configuration.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |   1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 125 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            |  82 ++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            |  29 ++++
 drivers/gpu/drm/vkms/vkms_output.c            |  49 ++++---
 5 files changed, 266 insertions(+), 20 deletions(-)

diff --git a/.clang-format b/.clang-format
index c355a2f58eed..5d21c0e4edbd 100644
--- a/.clang-format
+++ b/.clang-format
@@ -693,6 +693,7 @@ ForEachMacros:
   - 'vkms_config_for_each_crtc'
   - 'vkms_config_for_each_encoder'
   - 'vkms_config_for_each_plane'
+  - 'vkms_config_encoder_for_each_possible_crtc'
   - 'vkms_config_plane_for_each_possible_crtc'
   - 'while_for_each_ftrace_op'
   - 'xa_for_each'
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 92926972c64c..62fbcba4520f 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -260,6 +260,7 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 	int err;
 
 	config = vkms_config_default_create(false, false, false);
@@ -313,6 +314,9 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 
 	/* Invalid: Second CRTC without primary plane */
 	crtc_cfg = vkms_config_create_crtc(config);
+	encoder_cfg = vkms_config_create_encoder(config);
+	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid: Second CRTC with a primary plane */
@@ -390,11 +394,57 @@ static void vkms_config_test_invalid_encoder_number(struct kunit *test)
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
+	encoder_cfg = vkms_config_create_encoder(config);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: Second CRTC with shared encoder */
+	crtc_cfg2 = vkms_config_create_crtc(config);
+
+	plane_cfg = vkms_config_create_plane(config);
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
 static void vkms_config_test_attach_different_configs(struct kunit *test)
 {
 	struct vkms_config *config1, *config2;
 	struct vkms_config_plane *plane_cfg1, *plane_cfg2;
 	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
+	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
 	int err;
 
 	config1 = vkms_config_create("test1");
@@ -405,20 +455,29 @@ static void vkms_config_test_attach_different_configs(struct kunit *test)
 
 	plane_cfg1 = vkms_config_create_plane(config1);
 	crtc_cfg1 = vkms_config_create_crtc(config1);
+	encoder_cfg1 = vkms_config_create_encoder(config1);
 
 	plane_cfg2 = vkms_config_create_plane(config2);
 	crtc_cfg2 = vkms_config_create_crtc(config2);
+	encoder_cfg2 = vkms_config_create_encoder(config2);
 
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg1);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg2);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg1);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg2);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg2);
 
 	err = vkms_config_plane_attach_crtc(plane_cfg1, crtc_cfg2);
 	KUNIT_EXPECT_NE(test, err, 0);
 	err = vkms_config_plane_attach_crtc(plane_cfg2, crtc_cfg1);
 	KUNIT_EXPECT_NE(test, err, 0);
 
+	err = vkms_config_encoder_attach_crtc(encoder_cfg1, crtc_cfg2);
+	KUNIT_EXPECT_NE(test, err, 0);
+	err = vkms_config_encoder_attach_crtc(encoder_cfg2, crtc_cfg1);
+	KUNIT_EXPECT_NE(test, err, 0);
+
 	vkms_config_destroy(config1);
 	vkms_config_destroy(config2);
 }
@@ -548,6 +607,70 @@ static void vkms_config_test_plane_get_possible_crtcs(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_encoder_get_possible_crtcs(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
+	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+	int n_crtcs = 0;
+	int err;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	encoder_cfg1 = vkms_config_create_encoder(config);
+	encoder_cfg2 = vkms_config_create_encoder(config);
+	crtc_cfg1 = vkms_config_create_crtc(config);
+	crtc_cfg2 = vkms_config_create_crtc(config);
+
+	/* No possible CRTCs */
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc)
+		KUNIT_FAIL(test, "Unexpected possible CRTC");
+
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg2, idx, possible_crtc)
+		KUNIT_FAIL(test, "Unexpected possible CRTC");
+
+	/* Encoder 1 attached to CRTC 1 and 2 */
+	err = vkms_config_encoder_attach_crtc(encoder_cfg1, crtc_cfg1);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	err = vkms_config_encoder_attach_crtc(encoder_cfg1, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc) {
+		n_crtcs++;
+		if (possible_crtc != crtc_cfg1 && possible_crtc != crtc_cfg2)
+			KUNIT_FAIL(test, "Unexpected possible CRTC");
+	}
+	KUNIT_ASSERT_EQ(test, n_crtcs, 2);
+	n_crtcs = 0;
+
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg2, idx, possible_crtc)
+		KUNIT_FAIL(test, "Unexpected possible CRTC");
+
+	/* Encoder 1 attached to CRTC 1 and encoder 2 to CRTC 2 */
+	vkms_config_encoder_detach_crtc(encoder_cfg1, crtc_cfg2);
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc) {
+		n_crtcs++;
+		if (possible_crtc != crtc_cfg1)
+			KUNIT_FAIL(test, "Unexpected possible CRTC");
+	}
+	KUNIT_ASSERT_EQ(test, n_crtcs, 1);
+	n_crtcs = 0;
+
+	err = vkms_config_encoder_attach_crtc(encoder_cfg2, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg2, idx, possible_crtc) {
+		n_crtcs++;
+		if (possible_crtc != crtc_cfg2)
+			KUNIT_FAIL(test, "Unexpected possible CRTC");
+	}
+	KUNIT_ASSERT_EQ(test, n_crtcs, 1);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
@@ -560,9 +683,11 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
 	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
+	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_attach_different_configs),
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
+	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index db8be054f6f4..17262a9c2567 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -86,6 +86,9 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (IS_ERR(encoder_cfg))
 		goto err_alloc;
 
+	if (vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg))
+		goto err_alloc;
+
 	return config;
 
 err_alloc:
@@ -216,6 +219,42 @@ static bool valid_encoder_number(const struct vkms_config *config)
 	return true;
 }
 
+static bool valid_encoder_possible_crtcs(const struct vkms_config *config)
+{
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
+	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
+
+	vkms_config_for_each_encoder(config, encoder_cfg) {
+		if (xa_empty(&encoder_cfg->possible_crtcs)) {
+			drm_info(dev, "All encoders must have at least one possible CRTC\n");
+			return false;
+		}
+	}
+
+	vkms_config_for_each_crtc(config, crtc_cfg) {
+		bool crtc_has_encoder = false;
+
+		vkms_config_for_each_encoder(config, encoder_cfg) {
+			struct vkms_config_crtc *possible_crtc;
+			unsigned long idx = 0;
+
+			vkms_config_encoder_for_each_possible_crtc(encoder_cfg,
+								   idx, possible_crtc) {
+				if (possible_crtc == crtc_cfg)
+					crtc_has_encoder = true;
+			}
+		}
+
+		if (!crtc_has_encoder) {
+			drm_info(dev, "All CRTCs must have at least one possible encoder\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(const struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -237,6 +276,9 @@ bool vkms_config_is_valid(const struct vkms_config *config)
 			return false;
 	}
 
+	if (!valid_encoder_possible_crtcs(config))
+		return false;
+
 	return true;
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_is_valid);
@@ -362,10 +404,14 @@ void vkms_config_destroy_crtc(struct vkms_config *config,
 			      struct vkms_config_crtc *crtc_cfg)
 {
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 
 	vkms_config_for_each_plane(config, plane_cfg)
 		vkms_config_plane_detach_crtc(plane_cfg, crtc_cfg);
 
+	vkms_config_for_each_encoder(config, encoder_cfg)
+		vkms_config_encoder_detach_crtc(encoder_cfg, crtc_cfg);
+
 	list_del(&crtc_cfg->link);
 	kfree(crtc_cfg);
 }
@@ -425,6 +471,8 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi
 		return ERR_PTR(-ENOMEM);
 
 	encoder_cfg->config = config;
+	xa_init_flags(&encoder_cfg->possible_crtcs, XA_FLAGS_ALLOC);
+
 	list_add_tail(&encoder_cfg->link, &config->encoders);
 
 	return encoder_cfg;
@@ -434,7 +482,41 @@ EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_encoder);
 void vkms_config_destroy_encoder(struct vkms_config *config,
 				 struct vkms_config_encoder *encoder_cfg)
 {
+	xa_destroy(&encoder_cfg->possible_crtcs);
 	list_del(&encoder_cfg->link);
 	kfree(encoder_cfg);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_encoder);
+
+int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *encoder_cfg,
+						 struct vkms_config_crtc *crtc_cfg)
+{
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+	u32 crtc_idx = 0;
+
+	if (encoder_cfg->config != crtc_cfg->config)
+		return -EINVAL;
+
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
+		if (possible_crtc == crtc_cfg)
+			return -EEXIST;
+	}
+
+	return xa_alloc(&encoder_cfg->possible_crtcs, &crtc_idx, crtc_cfg,
+			xa_limit_32b, GFP_KERNEL);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_encoder_attach_crtc);
+
+void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
+				     struct vkms_config_crtc *crtc_cfg)
+{
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
+		if (possible_crtc == crtc_cfg)
+			xa_erase(&encoder_cfg->possible_crtcs, idx);
+	}
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_encoder_detach_crtc);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 024cbed0e439..3e5b2e407378 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -76,6 +76,7 @@ struct vkms_config_crtc {
  *
  * @link: Link to the others encoders in vkms_config
  * @config: The vkms_config this CRTC belongs to
+ * @possible_crtcs: Array of CRTCs that can be used with this encoder
  * @encoder: Internal usage. This pointer should never be considered as valid.
  *           It can be used to store a temporary reference to a VKMS encoder
  *           during device creation. This pointer is not managed by the
@@ -85,6 +86,8 @@ struct vkms_config_encoder {
 	struct list_head link;
 	struct vkms_config *config;
 
+	struct xarray possible_crtcs;
+
 	/* Internal usage */
 	struct drm_encoder *encoder;
 };
@@ -123,6 +126,16 @@ struct vkms_config_encoder {
 #define vkms_config_plane_for_each_possible_crtc(plane_cfg, idx, possible_crtc) \
 	xa_for_each(&(plane_cfg)->possible_crtcs, idx, (possible_crtc))
 
+/**
+ * vkms_config_encoder_for_each_possible_crtc - Iterate over the
+ * vkms_config_encoder possible CRTCs
+ * @encoder_cfg: &struct vkms_config_encoder pointer
+ * @idx: Index of the cursor
+ * @possible_crtc: &struct vkms_config_crtc pointer used as cursor
+ */
+#define vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) \
+	xa_for_each(&(encoder_cfg)->possible_crtcs, idx, (possible_crtc))
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -332,4 +345,20 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi
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
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index f63bc8e3014b..8920d6b5d105 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -9,9 +9,9 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
-	struct drm_encoder *encoder;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 	int ret;
 	int writeback;
 
@@ -61,32 +61,41 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
+	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg) {
+		struct vkms_config_crtc *possible_crtc;
+		unsigned long idx = 0;
+
+		encoder_cfg->encoder = drmm_kzalloc(dev, sizeof(*encoder_cfg->encoder), GFP_KERNEL);
+		if (!encoder_cfg->encoder) {
+			DRM_ERROR("Failed to allocate encoder\n");
+			return -ENOMEM;
+		}
+		ret = drmm_encoder_init(dev, encoder_cfg->encoder, NULL,
+					DRM_MODE_ENCODER_VIRTUAL, NULL);
+		if (ret) {
+			DRM_ERROR("Failed to init encoder\n");
+			return ret;
+		}
+
+		vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
+			encoder_cfg->encoder->possible_crtcs |=
+				drm_crtc_mask(&possible_crtc->crtc->crtc);
+		}
+	}
+
 	connector = vkms_connector_init(vkmsdev);
 	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
 		return PTR_ERR(connector);
 	}
 
-	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
-	if (!encoder) {
-		DRM_ERROR("Failed to allocate encoder\n");
-		return -ENOMEM;
-	}
-	ret = drmm_encoder_init(dev, encoder, NULL,
-				DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to init encoder\n");
-		return ret;
-	}
-
-	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg)
-		encoder->possible_crtcs = drm_crtc_mask(&crtc_cfg->crtc->crtc);
-
 	/* Attach the encoder and the connector */
-	ret = drm_connector_attach_encoder(&connector->base, encoder);
-	if (ret) {
-		DRM_ERROR("Failed to attach connector to encoder\n");
-		return ret;
+	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg) {
+		ret = drm_connector_attach_encoder(&connector->base, encoder_cfg->encoder);
+		if (ret) {
+			DRM_ERROR("Failed to attach connector to encoder\n");
+			return ret;
+		}
 	}
 
 	drm_mode_config_reset(dev);
-- 
2.48.1

