Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A5DA21B92
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861A910E7B2;
	Wed, 29 Jan 2025 11:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lj3AFQ8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE2B10E7A8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:17 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso7486221f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148476; x=1738753276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q88yikrH24hbqKVdPbrR3EWE1tAj+IlW/np5tlv3WjE=;
 b=Lj3AFQ8WA5gwSoi4XKJOtxelR1YmTG67FFEZYhII1FvPehf/aruOBWjrIfgKWSia9E
 KN5/AJf95T/IK3lKH1SzledThh1/r/8PsFWBGE9fUaYeFvt1JyGrl4oi6SZrOWId6hXS
 kkXOKvKt35wwpZf8dLU+RAwa1REu6RochNedGIUyKjl5iWKhyiRxHsCfeNAz1vNF0RE0
 AVziaXxJeGtl2lUW2fZcu/k8ndUY2pBZ8XoZLKn3LIobGittyInNOC7NuKZQlF6VSng6
 79IKQtxVU+0Vrp5Rc7eZo3e7hWrM+Q/Kxgo4w41nFr4b2DVBUFULjiCW01sqKcPbWnsC
 4jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148476; x=1738753276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q88yikrH24hbqKVdPbrR3EWE1tAj+IlW/np5tlv3WjE=;
 b=CHLLDcWspmulx76NH0I/E9BPdbhQ83jfMNTYsn3cOaOaeL3MzNunVn74n247ZQIwSG
 6b73IceOPIzN9d0swpIUhIz5A/gDH7bT6t8WDIJJLcks4Cfccq3F3UqICLkpMpon9ydr
 ytk2eisqZfiXA3CsgSWGcoVJb2mbhYzHj2EPJBHSVKywyisk+lGxHFiQb+R0gvQq8X1/
 iU4u7m/3lU1uz5bHE9Id79JohcY8ktEWNhbdHK6TzLLAvdWD9TbPvWwk0FaojB/idWFn
 wuNuLk5Jhlq6s/41LJoDLARQZ/Hq1FMdcGg4xDmCfGMGlFLzFN6uAKwqYDeyD953QDCL
 bhsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6K43qi7AVWagn12buVUBlZdrhbQWrzylkgFBG1L6RybWqw5lJPID+ouManpXTYBzNvgc33ETweJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZcoPhAeO23LP1M2lFnUiyq1d4ntKStmiM339+Uij/r4KX6yO/
 31IRp3zDjhDFJBJKx8hU0JpYn6wpcFfjum7Fc5GYGYVIW5FEjh1H
X-Gm-Gg: ASbGncuv0Rqxx7Xm0yaMh9ozBjKm8JK/w5O7KTUo7cBHm9m2VXpQc2sTROpyizz5TDZ
 h6kQOm9knkjtAzCAsVh5jxRZwOPyUcC4AB1zDaSwsNEBK9xpT0i1SFgA+/r/6baIQvO7/g1kDTg
 P8CWGNYQnTBBC0MerYb/uKsT42cwT7s2PykRlVCpyJR05bdmLCY3LXR6sA84wj9l0Vte8vyIhWX
 iNKRsBSr/N/4FUsG41TiaFpLWyYllamL3Zy8TwiqvoPlyzj+ld8KdD6gZthDoD8hNXrdvxbpa6j
 76jZOn0danREwBPa
X-Google-Smtp-Source: AGHT+IHDlygoZF3UMYScVhrgVjNYuMwkTq/5UtcpTgAKwbdLoTEd/tYv5i194zzG2JjgIAWcJ9vP7Q==
X-Received: by 2002:adf:f943:0:b0:385:f996:1b8e with SMTP id
 ffacd0b85a97d-38c51951006mr2222645f8f.16.1738148475782; 
 Wed, 29 Jan 2025 03:01:15 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:15 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 09/13] drm/vkms: Allow to attach planes and CRTCs
Date: Wed, 29 Jan 2025 12:00:55 +0100
Message-ID: <20250129110059.12199-10-jose.exposito89@gmail.com>
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

Add a list of possible CRTCs to the plane configuration and helpers to
attach, detach and get the primary and cursor planes attached to a CRTC.

Now that the default configuration has its planes and CRTC correctly
attached, configure the output following the configuration.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 185 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 166 ++++++++++++++--
 drivers/gpu/drm/vkms/vkms_config.h            |  55 +++++-
 drivers/gpu/drm/vkms/vkms_output.c            |  77 ++++++--
 4 files changed, 446 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index b5907b060a5c..5e698616491a 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -87,6 +87,18 @@ static void vkms_config_test_default_config(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, vkms_config_crtc_get_writeback(crtc_cfg),
 			params->enable_writeback);
 
+	list_for_each_entry(plane_cfg, &config->planes, link) {
+		struct vkms_config_crtc *possible_crtc;
+		int n_possible_crtcs = 0;
+		unsigned long idx = 0;
+
+		xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
+			KUNIT_EXPECT_PTR_EQ(test, crtc_cfg, possible_crtc);
+			n_possible_crtcs++;
+		}
+		KUNIT_EXPECT_EQ(test, n_possible_crtcs, 1);
+	}
+
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -191,6 +203,8 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 {
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
+	int err;
 
 	config = vkms_config_default_create(false, false, false);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
@@ -198,16 +212,26 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
 	vkms_config_destroy_plane(plane_cfg);
 
+	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
+
 	/* Invalid: No primary plane */
 	plane_cfg = vkms_config_add_plane(config);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Invalid: Multiple primary planes */
 	plane_cfg = vkms_config_add_plane(config);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
 	plane_cfg = vkms_config_add_plane(config);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid: One primary plane */
@@ -217,14 +241,50 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	/* Invalid: Multiple cursor planes */
 	plane_cfg = vkms_config_add_plane(config);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
 	plane_cfg = vkms_config_add_plane(config);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid: One primary and one cursor plane */
 	vkms_config_destroy_plane(plane_cfg);
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
+	/* Invalid: Second CRTC without primary plane */
+	crtc_cfg = vkms_config_add_crtc(config);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: Second CRTC with a primary plane */
+	plane_cfg = vkms_config_add_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_valid_plane_possible_crtcs(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
+	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
+
+	/* Invalid: Primary plane without a possible CRTC */
+	vkms_config_plane_detach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
 	vkms_config_destroy(config);
 }
 
@@ -251,6 +311,128 @@ static void vkms_config_test_valid_crtc_number(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_plane_attach_crtc(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *overlay_cfg;
+	struct vkms_config_plane *primary_cfg;
+	struct vkms_config_plane *cursor_cfg;
+	struct vkms_config_crtc *crtc_cfg;
+	int err;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	overlay_cfg = vkms_config_add_plane(config);
+	vkms_config_plane_set_type(overlay_cfg, DRM_PLANE_TYPE_OVERLAY);
+	primary_cfg = vkms_config_add_plane(config);
+	vkms_config_plane_set_type(primary_cfg, DRM_PLANE_TYPE_PRIMARY);
+	cursor_cfg = vkms_config_add_plane(config);
+	vkms_config_plane_set_type(cursor_cfg, DRM_PLANE_TYPE_CURSOR);
+
+	crtc_cfg = vkms_config_add_crtc(config);
+
+	/* No primary or cursor planes */
+	KUNIT_EXPECT_NULL(test, vkms_config_crtc_primary_plane(config, crtc_cfg));
+	KUNIT_EXPECT_NULL(test, vkms_config_crtc_cursor_plane(config, crtc_cfg));
+
+	/* Overlay plane, but no primary or cursor planes */
+	err = vkms_config_plane_attach_crtc(overlay_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_NULL(test, vkms_config_crtc_primary_plane(config, crtc_cfg));
+	KUNIT_EXPECT_NULL(test, vkms_config_crtc_cursor_plane(config, crtc_cfg));
+
+	/* Primary plane, attaching it twice must fail */
+	err = vkms_config_plane_attach_crtc(primary_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	err = vkms_config_plane_attach_crtc(primary_cfg, crtc_cfg);
+	KUNIT_EXPECT_NE(test, err, 0);
+	KUNIT_EXPECT_PTR_EQ(test,
+			    vkms_config_crtc_primary_plane(config, crtc_cfg),
+			    primary_cfg);
+	KUNIT_EXPECT_NULL(test, vkms_config_crtc_cursor_plane(config, crtc_cfg));
+
+	/* Primary and cursor planes */
+	err = vkms_config_plane_attach_crtc(cursor_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_PTR_EQ(test,
+			    vkms_config_crtc_primary_plane(config, crtc_cfg),
+			    primary_cfg);
+	KUNIT_EXPECT_PTR_EQ(test,
+			    vkms_config_crtc_cursor_plane(config, crtc_cfg),
+			    cursor_cfg);
+
+	/* Detach primary and destroy cursor plane */
+	vkms_config_plane_detach_crtc(overlay_cfg, crtc_cfg);
+	vkms_config_plane_detach_crtc(primary_cfg, crtc_cfg);
+	vkms_config_destroy_plane(cursor_cfg);
+	KUNIT_EXPECT_NULL(test, vkms_config_crtc_primary_plane(config, crtc_cfg));
+	KUNIT_EXPECT_NULL(test, vkms_config_crtc_cursor_plane(config, crtc_cfg));
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_plane_get_possible_crtcs(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg1, *plane_cfg2;
+	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
+	struct vkms_config_crtc **array;
+	size_t length;
+	int err;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	plane_cfg1 = vkms_config_add_plane(config);
+	plane_cfg2 = vkms_config_add_plane(config);
+	crtc_cfg1 = vkms_config_add_crtc(config);
+	crtc_cfg2 = vkms_config_add_crtc(config);
+
+	/* No possible CRTCs */
+	array = vkms_config_plane_get_possible_crtcs(plane_cfg1, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	array = vkms_config_plane_get_possible_crtcs(plane_cfg2, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	/* Plane 1 attached to CRTC 1 and 2 */
+	err = vkms_config_plane_attach_crtc(plane_cfg1, crtc_cfg1);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	err = vkms_config_plane_attach_crtc(plane_cfg1, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	array = vkms_config_plane_get_possible_crtcs(plane_cfg1, &length);
+	KUNIT_ASSERT_EQ(test, length, 2);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], crtc_cfg1);
+	KUNIT_ASSERT_PTR_EQ(test, array[1], crtc_cfg2);
+	kfree(array);
+
+	array = vkms_config_plane_get_possible_crtcs(plane_cfg2, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	/* Plane 1 attached to CRTC 1 and plane 2 to CRTC 2 */
+	vkms_config_plane_detach_crtc(plane_cfg1, crtc_cfg2);
+
+	array = vkms_config_plane_get_possible_crtcs(plane_cfg1, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], crtc_cfg1);
+	kfree(array);
+
+	err = vkms_config_plane_attach_crtc(plane_cfg2, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	array = vkms_config_plane_get_possible_crtcs(plane_cfg2, &length);
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
@@ -259,7 +441,10 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_get_crtcs),
 	KUNIT_CASE(vkms_config_test_valid_plane_number),
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
+	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_valid_crtc_number),
+	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
+	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 4128892836d7..a2ce4905589b 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -50,13 +50,20 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 		goto err_alloc;
 	vkms_config_crtc_set_writeback(crtc_cfg, enable_writeback);
 
+	if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
+		goto err_alloc;
+
 	if (enable_overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
 			plane_cfg = vkms_config_add_plane(config);
 			if (IS_ERR(plane_cfg))
 				goto err_alloc;
+
 			vkms_config_plane_set_type(plane_cfg,
 						   DRM_PLANE_TYPE_OVERLAY);
+
+			if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
+				goto err_alloc;
 		}
 	}
 
@@ -64,7 +71,11 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 		plane_cfg = vkms_config_add_plane(config);
 		if (IS_ERR(plane_cfg))
 			goto err_alloc;
+
 		vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+
+		if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
+			goto err_alloc;
 	}
 
 	return config;
@@ -156,31 +167,39 @@ static bool valid_plane_number(struct vkms_config *config)
 	return true;
 }
 
-static bool valid_plane_type(struct vkms_config *config)
+static bool valid_plane_type(struct vkms_config *config,
+			     struct vkms_config_crtc *crtc_cfg)
 {
 	struct vkms_config_plane *plane_cfg;
 	bool has_primary_plane = false;
 	bool has_cursor_plane = false;
 
 	list_for_each_entry(plane_cfg, &config->planes, link) {
+		struct vkms_config_crtc *possible_crtc;
+		unsigned long idx = 0;
 		enum drm_plane_type type;
 
 		type = vkms_config_plane_get_type(plane_cfg);
 
-		if (type == DRM_PLANE_TYPE_PRIMARY) {
-			if (has_primary_plane) {
-				pr_err("Multiple primary planes\n");
-				return false;
-			}
+		xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
+			if (possible_crtc != crtc_cfg)
+				continue;
 
-			has_primary_plane = true;
-		} else if (type == DRM_PLANE_TYPE_CURSOR) {
-			if (has_cursor_plane) {
-				pr_err("Multiple cursor planes\n");
-				return false;
-			}
+			if (type == DRM_PLANE_TYPE_PRIMARY) {
+				if (has_primary_plane) {
+					pr_err("Multiple primary planes\n");
+					return false;
+				}
 
-			has_cursor_plane = true;
+				has_primary_plane = true;
+			} else if (type == DRM_PLANE_TYPE_CURSOR) {
+				if (has_cursor_plane) {
+					pr_err("Multiple cursor planes\n");
+					return false;
+				}
+
+				has_cursor_plane = true;
+			}
 		}
 	}
 
@@ -192,6 +211,20 @@ static bool valid_plane_type(struct vkms_config *config)
 	return true;
 }
 
+static bool valid_plane_possible_crtcs(struct vkms_config *config)
+{
+	struct vkms_config_plane *plane_cfg;
+
+	list_for_each_entry(plane_cfg, &config->planes, link) {
+		if (xa_empty(&plane_cfg->possible_crtcs)) {
+			pr_err("All planes must have at least one possible CRTC\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
 static bool valid_crtc_number(struct vkms_config *config)
 {
 	size_t n_crtcs;
@@ -207,15 +240,22 @@ static bool valid_crtc_number(struct vkms_config *config)
 
 bool vkms_config_is_valid(struct vkms_config *config)
 {
+	struct vkms_config_crtc *crtc_cfg;
+
 	if (!valid_plane_number(config))
 		return false;
 
 	if (!valid_crtc_number(config))
 		return false;
 
-	if (!valid_plane_type(config))
+	if (!valid_plane_possible_crtcs(config))
 		return false;
 
+	list_for_each_entry(crtc_cfg, &config->crtcs, link) {
+		if (!valid_plane_type(config, crtc_cfg))
+			return false;
+	}
+
 	return true;
 }
 
@@ -265,6 +305,7 @@ struct vkms_config_plane *vkms_config_add_plane(struct vkms_config *config)
 		return ERR_PTR(-ENOMEM);
 
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
 
 	list_add_tail(&plane_cfg->link, &config->planes);
 
@@ -273,10 +314,69 @@ struct vkms_config_plane *vkms_config_add_plane(struct vkms_config *config)
 
 void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
 {
+	xa_destroy(&plane_cfg->possible_crtcs);
 	list_del(&plane_cfg->link);
 	kfree(plane_cfg);
 }
 
+int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *plane_cfg,
+					       struct vkms_config_crtc *crtc_cfg)
+{
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+	u32 crtc_idx = 0;
+
+	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
+		if (possible_crtc == crtc_cfg)
+			return -EINVAL;
+	}
+
+	return xa_alloc(&plane_cfg->possible_crtcs, &crtc_idx, crtc_cfg,
+			xa_limit_32b, GFP_KERNEL);
+}
+
+void vkms_config_plane_detach_crtc(struct vkms_config_plane *plane_cfg,
+				   struct vkms_config_crtc *crtc_cfg)
+{
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+
+	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
+		if (possible_crtc == crtc_cfg)
+			xa_erase(&plane_cfg->possible_crtcs, idx);
+	}
+}
+
+struct vkms_config_crtc **vkms_config_plane_get_possible_crtcs(struct vkms_config_plane *plane_cfg,
+							       size_t *out_length)
+{
+	struct vkms_config_crtc **array;
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx;
+	size_t length = 0;
+	int n = 0;
+
+	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc)
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
+	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
+		array[n] = possible_crtc;
+		n++;
+	}
+
+	*out_length = length;
+	return array;
+}
+
 struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -295,6 +395,44 @@ struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config)
 void vkms_config_destroy_crtc(struct vkms_config *config,
 			      struct vkms_config_crtc *crtc_cfg)
 {
+	struct vkms_config_plane *plane_cfg;
+
+	list_for_each_entry(plane_cfg, &config->planes, link)
+		vkms_config_plane_detach_crtc(plane_cfg, crtc_cfg);
+
 	list_del(&crtc_cfg->link);
 	kfree(crtc_cfg);
 }
+
+static struct vkms_config_plane *vkms_config_crtc_get_plane(const struct vkms_config *config,
+							    struct vkms_config_crtc *crtc_cfg,
+							    enum drm_plane_type type)
+{
+	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *possible_crtc;
+	enum drm_plane_type current_type;
+	unsigned long idx;
+
+	list_for_each_entry(plane_cfg, &config->planes, link) {
+		current_type = vkms_config_plane_get_type(plane_cfg);
+
+		xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
+			if (possible_crtc == crtc_cfg && current_type == type)
+				return plane_cfg;
+		}
+	}
+
+	return NULL;
+}
+
+struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_config *config,
+							 struct vkms_config_crtc *crtc_cfg)
+{
+	return vkms_config_crtc_get_plane(config, crtc_cfg, DRM_PLANE_TYPE_PRIMARY);
+}
+
+struct vkms_config_plane *vkms_config_crtc_cursor_plane(const struct vkms_config *config,
+							struct vkms_config_crtc *crtc_cfg)
+{
+	return vkms_config_crtc_get_plane(config, crtc_cfg, DRM_PLANE_TYPE_CURSOR);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index a7828fe0c4b2..1f2e6c485d08 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -12,14 +12,12 @@
  * struct vkms_config - General configuration for VKMS driver
  *
  * @dev_name: Name of the device
- * @writeback: If true, a writeback buffer can be attached to the CRTC
  * @planes: List of planes configured for the device
  * @crtcs: List of CRTCs configured for the device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
 	const char *dev_name;
-	bool writeback;
 	struct list_head planes;
 	struct list_head crtcs;
 	struct vkms_device *dev;
@@ -31,6 +29,7 @@ struct vkms_config {
  * @link: Link to the others planes in vkms_config
  * @type: Type of the plane. The creator of configuration needs to ensures that
  *        at least one primary plane is present.
+ * @possible_crtcs: Array of CRTCs that can be used with this plane
  * @plane: Internal usage. This pointer should never be considered as valid.
  *         It can be used to store a temporary reference to a VKMS plane during
  *         device creation. This pointer is not managed by the configuration and
@@ -40,6 +39,7 @@ struct vkms_config_plane {
 	struct list_head link;
 
 	enum drm_plane_type type;
+	struct xarray possible_crtcs;
 
 	/* Internal usage */
 	struct vkms_plane *plane;
@@ -194,6 +194,35 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
 	plane_cfg->type = type;
 }
 
+/**
+ * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
+ * @plane_cfg: Plane to attach
+ * @crtc_cfg: CRTC to attach @plane_cfg to
+ */
+int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *plane_cfg,
+					       struct vkms_config_crtc *crtc_cfg);
+
+/**
+ * vkms_config_plane_attach_crtc - Detach a plane from a CRTC
+ * @plane_cfg: Plane to detach
+ * @crtc_cfg: CRTC to detach @plane_cfg from
+ */
+void vkms_config_plane_detach_crtc(struct vkms_config_plane *plane_cfg,
+				   struct vkms_config_crtc *crtc_cfg);
+
+/**
+ * vkms_config_plane_get_possible_crtcs() - Return the array of possible CRTCs
+ * @plane_cfg: Plane to get the possible CRTCs from
+ * @out_length: Length of the returned array
+ *
+ * Returns:
+ * A list of pointers to the configurations. On success, the caller is
+ * responsible to free the returned array, but not its contents. On error,
+ * it returns an error and @out_length is invalid.
+ */
+struct vkms_config_crtc **vkms_config_plane_get_possible_crtcs(struct vkms_config_plane *plane_cfg,
+							       size_t *out_length);
+
 /**
  * vkms_config_add_crtc() - Add a new CRTC configuration
  * @config: Configuration to add the CRTC to
@@ -234,4 +263,26 @@ vkms_config_crtc_set_writeback(struct vkms_config_crtc *crtc_cfg,
 	crtc_cfg->writeback = writeback;
 }
 
+/**
+ * vkms_config_crtc_primary_plane() - Return the primary plane for a CRTC
+ * @config: Configuration containing the CRTC
+ * @crtc_config: Target CRTC
+ *
+ * Returns:
+ * The primary plane or NULL if none is assigned yet.
+ */
+struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_config *config,
+							 struct vkms_config_crtc *crtc_cfg);
+
+/**
+ * vkms_config_crtc_cursor_plane() - Return the cursor plane for a CRTC
+ * @config: Configuration containing the CRTC
+ * @crtc_config: Target CRTC
+ *
+ * Returns:
+ * The cursor plane or NULL if none is assigned yet.
+ */
+struct vkms_config_plane *vkms_config_crtc_cursor_plane(const struct vkms_config *config,
+							struct vkms_config_crtc *crtc_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index b2ae269e5827..427d0aad8901 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -10,18 +10,24 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
 	struct drm_encoder *encoder;
-	struct vkms_output *output;
-	struct vkms_plane *primary = NULL, *cursor = NULL;
 	struct vkms_config_plane **plane_cfgs = NULL;
 	size_t n_planes;
+	struct vkms_config_crtc **crtc_cfgs = NULL;
+	size_t n_crtcs;
 	int ret = 0;
 	int writeback;
-	unsigned int n;
+	unsigned int n, i;
 
 	plane_cfgs = vkms_config_get_planes(vkmsdev->config, &n_planes);
 	if (IS_ERR(plane_cfgs))
 		return PTR_ERR(plane_cfgs);
 
+	crtc_cfgs = vkms_config_get_crtcs(vkmsdev->config, &n_crtcs);
+	if (IS_ERR(crtc_cfgs)) {
+		ret = PTR_ERR(crtc_cfgs);
+		goto err_free;
+	}
+
 	for (n = 0; n < n_planes; n++) {
 		struct vkms_config_plane *plane_cfg;
 		enum drm_plane_type type;
@@ -35,19 +41,54 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			ret = PTR_ERR(plane_cfg->plane);
 			goto err_free;
 		}
+	}
+
+	for (n = 0; n < n_crtcs; n++) {
+		struct vkms_config_crtc *crtc_cfg;
+		struct vkms_config_plane *primary, *cursor;
+
+		crtc_cfg = crtc_cfgs[n];
+		primary = vkms_config_crtc_primary_plane(vkmsdev->config, crtc_cfg);
+		cursor = vkms_config_crtc_cursor_plane(vkmsdev->config, crtc_cfg);
+
+		crtc_cfg->crtc = vkms_crtc_init(dev, &primary->plane->base,
+						cursor ? &cursor->plane->base : NULL);
+		if (IS_ERR(crtc_cfg->crtc)) {
+			DRM_ERROR("Failed to allocate CRTC\n");
+			ret = PTR_ERR(crtc_cfg->crtc);
+			goto err_free;
+		}
 
-		if (type == DRM_PLANE_TYPE_PRIMARY)
-			primary = plane_cfg->plane;
-		else if (type == DRM_PLANE_TYPE_CURSOR)
-			cursor = plane_cfg->plane;
+		/* Initialize the writeback component */
+		if (vkms_config_crtc_get_writeback(crtc_cfg)) {
+			writeback = vkms_enable_writeback_connector(vkmsdev, crtc_cfg->crtc);
+			if (writeback)
+				DRM_ERROR("Failed to init writeback connector\n");
+		}
 	}
 
-	output = vkms_crtc_init(dev, &primary->base,
-				cursor ? &cursor->base : NULL);
-	if (IS_ERR(output)) {
-		DRM_ERROR("Failed to allocate CRTC\n");
-		ret = PTR_ERR(output);
-		goto err_free;
+	for (n = 0; n < n_planes; n++) {
+		struct vkms_config_plane *plane_cfg;
+		struct vkms_config_crtc **possible_crtcs;
+		size_t n_possible_crtcs;
+
+		plane_cfg = plane_cfgs[n];
+		possible_crtcs = vkms_config_plane_get_possible_crtcs(plane_cfg,
+								      &n_possible_crtcs);
+		if (IS_ERR(possible_crtcs)) {
+			ret = PTR_ERR(possible_crtcs);
+			goto err_free;
+		}
+
+		for (i = 0; i < n_possible_crtcs; i++) {
+			struct vkms_config_crtc *possible_crtc;
+
+			possible_crtc = possible_crtcs[i];
+			plane_cfg->plane->base.possible_crtcs |=
+				drm_crtc_mask(&possible_crtc->crtc->crtc);
+		}
+
+		kfree(possible_crtcs);
 	}
 
 	connector = vkms_connector_init(vkmsdev);
@@ -69,7 +110,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		DRM_ERROR("Failed to init encoder\n");
 		goto err_free;
 	}
-	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
+	encoder->possible_crtcs = drm_crtc_mask(&crtc_cfgs[0]->crtc->crtc);
 
 	/* Attach the encoder and the connector */
 	ret = drm_connector_attach_encoder(&connector->base, encoder);
@@ -78,17 +119,11 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		goto err_free;
 	}
 
-	/* Initialize the writeback component */
-	if (vkmsdev->config->writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev, output);
-		if (writeback)
-			DRM_ERROR("Failed to init writeback connector\n");
-	}
-
 	drm_mode_config_reset(dev);
 
 err_free:
 	kfree(plane_cfgs);
+	kfree(crtc_cfgs);
 
 	return ret;
 }
-- 
2.48.1

