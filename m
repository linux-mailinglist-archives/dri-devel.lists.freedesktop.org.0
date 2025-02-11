Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08A1A3097D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C5010E673;
	Tue, 11 Feb 2025 11:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cou7PeiT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F70810E670
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:34 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-439554db49dso3720145e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272172; x=1739876972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gz0YRk3ughu7e2CD68H5VgQs97KOCSbfd1nCJLxiUJ0=;
 b=Cou7PeiTxMGV2sQ3IAADWKfPRsdwJzV0xQDVg5Z+5GkAa+/wt3HTb8yuSdb9wVCvv8
 QX9lBrQhmYhOpkVx53hJ3zjfuU5InWHc/ZRgMvdYSNsAOBXP1MXum4rFixxfz+QtgHOf
 XjKW8Q8ewbvKntt/bRq3+mhI1Y2lNwlt8P9jDJ2n6GeK74FweyTUcNZcreBbHpFGCNsb
 cr2qAgaYZTgPjEhF1GV0dWWcrSNLOJyVVPvFsTEH2LichjeIoRTsimoyFvWNlOB54vNy
 wlCo7XULg7qxaZzzh5+LLDNKK2Hu5bBwUv+GyRn5n3DfSKHibTOtHn+1syTwGNlusSPc
 fJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272172; x=1739876972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gz0YRk3ughu7e2CD68H5VgQs97KOCSbfd1nCJLxiUJ0=;
 b=DwRavVAvxsQYCP2gJwtRgS6RLEZOQSaBYcn494kNBt1FtsLPFVVWgECiW1ZwprKe0l
 XR4JBu4X1twQpJxI1m0+TACkTtO1mAHXvpji8yXzlIdw/OkgQo6aiFGIWs0XHdNRVMo1
 v/pFEaUonb2WMwkDJDRXDz6X7himU16j8OoJfjcr2eSAkR6fhwHPoQaUs0VkPK9b6wN0
 ZyKFDjE1Zp5BecII9YzmZj8UphVIt4B72nKl+rL/C5V+ziZqyEiG0oOcQMGE7Yv5oUu6
 oKUaXPoRxOWSB8Jr2tGjcEJ0HUD4UreLzpmDD6pJiiSJygHRFpdtcuqVDCDQu3pjZR/4
 OkeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL3HPMmQAZm3La3S9/rH4ZztH99oeP8r0neMjQvmA9SiP6213a6w18tPYEwbPf3mb3DGN+EnhlBqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC9v9osdgRDV4rBTQVU9UlNHwnRO9NMSfHBwJPOF6Fcw75IHnr
 I42Z0q7mIzLNeuy4yhYGv0PqlrmjWXR1nvDwCGClHVZ+EiF74T9V
X-Gm-Gg: ASbGnctK+uep0JdWvwhoj++ft/7F+bjJ7GFcfSnUqwk+8YUzory+1QAFHerc7yJi9tH
 RGUnjcqQMOMfyNuyROQziCH3v2mZIBl22Lv4XjpHwqtY8FUXUSlUdpSfM6sVujih8bNYhzR8KOu
 YAjv2u8VXsCEV3z/9pkH6b/zsJMAueUBStJR6LBYVVNF7OdvaE+Udum4/RKu1vdLwpmkl8i4J7Y
 k/k2DOfbmTUEweTAhW7EmQCga80e6sQD/+rMp/R8KlV6dPGvl4k7jbLFzrIPgQhN6WFCp8QWmyh
 aw+XeIIhqMFUH9fi
X-Google-Smtp-Source: AGHT+IFYyO9xkH4y9QLRvN5380Sr4o2mE2mFu7BIqe31z9dyETfPETCYymIayfCMHUazfsKp2PlPrw==
X-Received: by 2002:a05:600c:4f8e:b0:434:a7e3:db5c with SMTP id
 5b1f17b1804b1-43924989dbbmr183832195e9.11.1739272172196; 
 Tue, 11 Feb 2025 03:09:32 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:31 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 11/15] drm/vkms: Allow to attach planes and CRTCs
Date: Tue, 11 Feb 2025 12:09:08 +0100
Message-ID: <20250211110912.15409-12-jose.exposito89@gmail.com>
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

Add a list of possible CRTCs to the plane configuration and helpers to
attach, detach and get the primary and cursor planes attached to a CRTC.

Now that the default configuration has its planes and CRTC correctly
attached, configure the output following the configuration.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |   1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 188 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 147 ++++++++++++--
 drivers/gpu/drm/vkms/vkms_config.h            |  59 +++++-
 drivers/gpu/drm/vkms/vkms_output.c            |  51 +++--
 5 files changed, 411 insertions(+), 35 deletions(-)

diff --git a/.clang-format b/.clang-format
index e7a901c3617d..6f944fa39841 100644
--- a/.clang-format
+++ b/.clang-format
@@ -692,6 +692,7 @@ ForEachMacros:
   - 'virtio_device_for_each_vq'
   - 'vkms_config_for_each_crtc'
   - 'vkms_config_for_each_plane'
+  - 'vkms_config_plane_for_each_possible_crtc'
   - 'while_for_each_ftrace_op'
   - 'xa_for_each'
   - 'xa_for_each_marked'
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 59bd7baea923..505eebb07a52 100644
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
@@ -199,6 +211,8 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 {
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
+	int err;
 
 	config = vkms_config_default_create(false, false, false);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
@@ -206,16 +220,26 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
 	vkms_config_destroy_plane(plane_cfg);
 
+	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
+
 	/* Invalid: No primary plane */
 	plane_cfg = vkms_config_create_plane(config);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Invalid: Multiple primary planes */
 	plane_cfg = vkms_config_create_plane(config);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
 	plane_cfg = vkms_config_create_plane(config);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid: One primary plane */
@@ -225,14 +249,50 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	/* Invalid: Multiple cursor planes */
 	plane_cfg = vkms_config_create_plane(config);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
 	plane_cfg = vkms_config_create_plane(config);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid: One primary and one cursor plane */
 	vkms_config_destroy_plane(plane_cfg);
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
+	/* Invalid: Second CRTC without primary plane */
+	crtc_cfg = vkms_config_create_crtc(config);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: Second CRTC with a primary plane */
+	plane_cfg = vkms_config_create_plane(config);
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
 
@@ -259,6 +319,131 @@ static void vkms_config_test_invalid_crtc_number(struct kunit *test)
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
+	overlay_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(overlay_cfg, DRM_PLANE_TYPE_OVERLAY);
+	primary_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(primary_cfg, DRM_PLANE_TYPE_PRIMARY);
+	cursor_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(cursor_cfg, DRM_PLANE_TYPE_CURSOR);
+
+	crtc_cfg = vkms_config_create_crtc(config);
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
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+	int n_crtcs = 0;
+	int err;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	plane_cfg1 = vkms_config_create_plane(config);
+	plane_cfg2 = vkms_config_create_plane(config);
+	crtc_cfg1 = vkms_config_create_crtc(config);
+	crtc_cfg2 = vkms_config_create_crtc(config);
+
+	/* No possible CRTCs */
+	vkms_config_plane_for_each_possible_crtc(plane_cfg1, idx, possible_crtc)
+		KUNIT_FAIL(test, "Unexpected possible CRTC");
+
+	vkms_config_plane_for_each_possible_crtc(plane_cfg2, idx, possible_crtc)
+		KUNIT_FAIL(test, "Unexpected possible CRTC");
+
+	/* Plane 1 attached to CRTC 1 and 2 */
+	err = vkms_config_plane_attach_crtc(plane_cfg1, crtc_cfg1);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	err = vkms_config_plane_attach_crtc(plane_cfg1, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	vkms_config_plane_for_each_possible_crtc(plane_cfg1, idx, possible_crtc) {
+		n_crtcs++;
+		if (possible_crtc != crtc_cfg1 && possible_crtc != crtc_cfg2)
+			KUNIT_FAIL(test, "Unexpected possible CRTC");
+	}
+	KUNIT_ASSERT_EQ(test, n_crtcs, 2);
+	n_crtcs = 0;
+
+	vkms_config_plane_for_each_possible_crtc(plane_cfg2, idx, possible_crtc)
+		KUNIT_FAIL(test, "Unexpected possible CRTC");
+
+	/* Plane 1 attached to CRTC 1 and plane 2 to CRTC 2 */
+	vkms_config_plane_detach_crtc(plane_cfg1, crtc_cfg2);
+	vkms_config_plane_for_each_possible_crtc(plane_cfg1, idx, possible_crtc) {
+		n_crtcs++;
+		if (possible_crtc != crtc_cfg1)
+			KUNIT_FAIL(test, "Unexpected possible CRTC");
+	}
+	KUNIT_ASSERT_EQ(test, n_crtcs, 1);
+	n_crtcs = 0;
+
+	err = vkms_config_plane_attach_crtc(plane_cfg2, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	vkms_config_plane_for_each_possible_crtc(plane_cfg2, idx, possible_crtc) {
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
@@ -267,7 +452,10 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_get_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_plane_number),
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
+	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
+	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
+	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index b08021e62c9f..d96f9e5f9b72 100644
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
 			plane_cfg = vkms_config_create_plane(config);
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
 		plane_cfg = vkms_config_create_plane(config);
 		if (IS_ERR(plane_cfg))
 			goto err_alloc;
+
 		vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+
+		if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
+			goto err_alloc;
 	}
 
 	return config;
@@ -103,7 +114,8 @@ static bool valid_plane_number(struct vkms_config *config)
 	return true;
 }
 
-static bool valid_plane_type(struct vkms_config *config)
+static bool valid_planes_for_crtc(struct vkms_config *config,
+				  struct vkms_config_crtc *crtc_cfg)
 {
 	struct drm_device *dev = &config->dev->drm;
 	struct vkms_config_plane *plane_cfg;
@@ -111,24 +123,31 @@ static bool valid_plane_type(struct vkms_config *config)
 	bool has_cursor_plane = false;
 
 	vkms_config_for_each_plane(config, plane_cfg) {
+		struct vkms_config_crtc *possible_crtc;
+		unsigned long idx = 0;
 		enum drm_plane_type type;
 
 		type = vkms_config_plane_get_type(plane_cfg);
 
-		if (type == DRM_PLANE_TYPE_PRIMARY) {
-			if (has_primary_plane) {
-				drm_info(dev, "Multiple primary planes\n");
-				return false;
-			}
+		vkms_config_plane_for_each_possible_crtc(plane_cfg, idx, possible_crtc) {
+			if (possible_crtc != crtc_cfg)
+				continue;
 
-			has_primary_plane = true;
-		} else if (type == DRM_PLANE_TYPE_CURSOR) {
-			if (has_cursor_plane) {
-				drm_info(dev, "Multiple cursor planes\n");
-				return false;
-			}
+			if (type == DRM_PLANE_TYPE_PRIMARY) {
+				if (has_primary_plane) {
+					drm_info(dev, "Multiple primary planes\n");
+					return false;
+				}
 
-			has_cursor_plane = true;
+				has_primary_plane = true;
+			} else if (type == DRM_PLANE_TYPE_CURSOR) {
+				if (has_cursor_plane) {
+					drm_info(dev, "Multiple cursor planes\n");
+					return false;
+				}
+
+				has_cursor_plane = true;
+			}
 		}
 	}
 
@@ -140,6 +159,21 @@ static bool valid_plane_type(struct vkms_config *config)
 	return true;
 }
 
+static bool valid_plane_possible_crtcs(struct vkms_config *config)
+{
+	struct drm_device *dev = &config->dev->drm;
+	struct vkms_config_plane *plane_cfg;
+
+	vkms_config_for_each_plane(config, plane_cfg) {
+		if (xa_empty(&plane_cfg->possible_crtcs)) {
+			drm_info(dev, "All planes must have at least one possible CRTC\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
 static bool valid_crtc_number(struct vkms_config *config)
 {
 	struct drm_device *dev = &config->dev->drm;
@@ -156,15 +190,22 @@ static bool valid_crtc_number(struct vkms_config *config)
 
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
 
+	vkms_config_for_each_crtc(config, crtc_cfg) {
+		if (!valid_planes_for_crtc(config, crtc_cfg))
+			return false;
+	}
+
 	return true;
 }
 
@@ -214,6 +255,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 		return ERR_PTR(-ENOMEM);
 
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
 
 	list_add_tail(&plane_cfg->link, &config->planes);
 
@@ -222,10 +264,39 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 
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
+	vkms_config_plane_for_each_possible_crtc(plane_cfg, idx, possible_crtc) {
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
+	vkms_config_plane_for_each_possible_crtc(plane_cfg, idx, possible_crtc) {
+		if (possible_crtc == crtc_cfg)
+			xa_erase(&plane_cfg->possible_crtcs, idx);
+	}
+}
+
 struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -244,6 +315,54 @@ struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *config)
 void vkms_config_destroy_crtc(struct vkms_config *config,
 			      struct vkms_config_crtc *crtc_cfg)
 {
+	struct vkms_config_plane *plane_cfg;
+
+	vkms_config_for_each_plane(config, plane_cfg)
+		vkms_config_plane_detach_crtc(plane_cfg, crtc_cfg);
+
 	list_del(&crtc_cfg->link);
 	kfree(crtc_cfg);
 }
+
+/**
+ * vkms_config_crtc_get_plane() - Return the first attached plane to a CRTC with
+ * the specific type
+ * @config: Configuration containing the CRTC and the plane
+ * @crtc_cfg: Only find planes attached to this CRTC
+ * @type: Plane type to search
+ *
+ * Returns:
+ * The first plane found attached to @crtc_cfg with the type @type.
+ */
+static struct vkms_config_plane *vkms_config_crtc_get_plane(const struct vkms_config *config,
+							    struct vkms_config_crtc *crtc_cfg,
+							    enum drm_plane_type type)
+{
+	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *possible_crtc;
+	enum drm_plane_type current_type;
+	unsigned long idx = 0;
+
+	vkms_config_for_each_plane(config, plane_cfg) {
+		current_type = vkms_config_plane_get_type(plane_cfg);
+
+		vkms_config_plane_for_each_possible_crtc(plane_cfg, idx, possible_crtc) {
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
index 0f5937b44948..0fe0ded1d8e4 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -5,6 +5,7 @@
 
 #include <linux/list.h>
 #include <linux/types.h>
+#include <linux/xarray.h>
 
 #include "vkms_drv.h"
 
@@ -12,14 +13,12 @@
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
@@ -31,6 +30,7 @@ struct vkms_config {
  * @link: Link to the others planes in vkms_config
  * @type: Type of the plane. The creator of configuration needs to ensures that
  *        at least one primary plane is present.
+ * @possible_crtcs: Array of CRTCs that can be used with this plane
  * @plane: Internal usage. This pointer should never be considered as valid.
  *         It can be used to store a temporary reference to a VKMS plane during
  *         device creation. This pointer is not managed by the configuration and
@@ -40,6 +40,7 @@ struct vkms_config_plane {
 	struct list_head link;
 
 	enum drm_plane_type type;
+	struct xarray possible_crtcs;
 
 	/* Internal usage */
 	struct vkms_plane *plane;
@@ -80,6 +81,16 @@ struct vkms_config_crtc {
 #define vkms_config_for_each_crtc(config, crtc_cfg) \
 	list_for_each_entry((crtc_cfg), &(config)->crtcs, link)
 
+/**
+ * vkms_config_plane_for_each_possible_crtc - Iterate over the vkms_config_plane
+ * possible CRTCs
+ * @plane_cfg: &struct vkms_config_plane pointer
+ * @idx: Index of the cursor
+ * @possible_crtc: &struct vkms_config_crtc pointer used as cursor
+ */
+#define vkms_config_plane_for_each_possible_crtc(plane_cfg, idx, possible_crtc) \
+	xa_for_each(&(plane_cfg)->possible_crtcs, idx, (possible_crtc))
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -187,6 +198,22 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
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
 /**
  * vkms_config_create_crtc() - Add a new CRTC configuration
  * @config: Configuration to add the CRTC to
@@ -227,4 +254,32 @@ vkms_config_crtc_set_writeback(struct vkms_config_crtc *crtc_cfg,
 	crtc_cfg->writeback = writeback;
 }
 
+/**
+ * vkms_config_crtc_primary_plane() - Return the primary plane for a CRTC
+ * @config: Configuration containing the CRTC
+ * @crtc_config: Target CRTC
+ *
+ * Note that, if multiple primary planes are found, the first one is returned.
+ * In this case, the configuration will be invalid. See vkms_config_is_valid().
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
+ * Note that, if multiple cursor planes are found, the first one is returned.
+ * In this case, the configuration will be invalid. See vkms_config_is_valid().
+ *
+ * Returns:
+ * The cursor plane or NULL if none is assigned yet.
+ */
+struct vkms_config_plane *vkms_config_crtc_cursor_plane(const struct vkms_config *config,
+							struct vkms_config_crtc *crtc_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 08ea691db299..f63bc8e3014b 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -10,9 +10,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
 	struct drm_encoder *encoder;
-	struct vkms_output *output;
-	struct vkms_plane *primary = NULL, *cursor = NULL;
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
 	int ret;
 	int writeback;
 
@@ -29,18 +28,37 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
 			return PTR_ERR(plane_cfg->plane);
 		}
+	}
+
+	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
+		struct vkms_config_plane *primary, *cursor;
+
+		primary = vkms_config_crtc_primary_plane(vkmsdev->config, crtc_cfg);
+		cursor = vkms_config_crtc_cursor_plane(vkmsdev->config, crtc_cfg);
 
-		if (type == DRM_PLANE_TYPE_PRIMARY)
-			primary = plane_cfg->plane;
-		else if (type == DRM_PLANE_TYPE_CURSOR)
-			cursor = plane_cfg->plane;
+		crtc_cfg->crtc = vkms_crtc_init(dev, &primary->plane->base,
+						cursor ? &cursor->plane->base : NULL);
+		if (IS_ERR(crtc_cfg->crtc)) {
+			DRM_ERROR("Failed to allocate CRTC\n");
+			return PTR_ERR(crtc_cfg->crtc);
+		}
+
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
-		return PTR_ERR(output);
+	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
+		struct vkms_config_crtc *possible_crtc;
+		unsigned long idx = 0;
+
+		vkms_config_plane_for_each_possible_crtc(plane_cfg, idx, possible_crtc) {
+			plane_cfg->plane->base.possible_crtcs |=
+				drm_crtc_mask(&possible_crtc->crtc->crtc);
+		}
 	}
 
 	connector = vkms_connector_init(vkmsdev);
@@ -60,7 +78,9 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		DRM_ERROR("Failed to init encoder\n");
 		return ret;
 	}
-	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
+
+	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg)
+		encoder->possible_crtcs = drm_crtc_mask(&crtc_cfg->crtc->crtc);
 
 	/* Attach the encoder and the connector */
 	ret = drm_connector_attach_encoder(&connector->base, encoder);
@@ -69,13 +89,6 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		return ret;
 	}
 
-	/* Initialize the writeback component */
-	if (vkmsdev->config->writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev, output);
-		if (writeback)
-			DRM_ERROR("Failed to init writeback connector\n");
-	}
-
 	drm_mode_config_reset(dev);
 
 	return ret;
-- 
2.48.1

