Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B09A21EF8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA16D10E117;
	Wed, 29 Jan 2025 14:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NE7pqaJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B59310E117
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:22:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DAF8EA419C9;
 Wed, 29 Jan 2025 14:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16241C4CEE5;
 Wed, 29 Jan 2025 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738160533;
 bh=ADo9G62kpcf40b2yx8be7dGFxjUQenFK2NhtIVR00Kc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NE7pqaJMl7ndlRTcW/QDDNUlI3uuSLfU3Mv/LFW+Aw4Gmv88tPAzU7QLU8PvIprjG
 ZEyvX0wLGgdthgrLSAUu/4q3TeFcJZqkNk1wvxMl3+b83AR2cw8oE1al/yRcXIS4s3
 8qTzVWoMWvfAVxc4eTVwXEB4jn3YdjTNjOVjU5TY+O4/Z6S558Jw9MJ9t/TQaA6rmB
 6IGHxlvJqazuFR7C6QlV54LM8cPd6saCe8ug3/9kXvHV61q2XCGK3RpsiRHVbFEMIU
 FZ78cOPskN+OGdCyuTCm5S8ibmGW3QNAgdRin6Yrn/4wkQi41yzwN9aDZW0D/bFBc4
 Cc4UoCcuBpVOQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 29 Jan 2025 15:21:55 +0100
Subject: [PATCH v2 3/4] drm/tests: hdmi: Reorder DRM entities variables
 assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-test-kunit-v2-3-fe59c43805d5@kernel.org>
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
In-Reply-To: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17739; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ADo9G62kpcf40b2yx8be7dGFxjUQenFK2NhtIVR00Kc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmzLNt36RYI8fieP1oi9vzYzrtsi1dfY78QcvTNMjMBa
 1fj5ZvlOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBENBczNqyfOqX+9NGNSYUe
 pouXNTLp+G2VLpz5bcbHvZ57mZNfugRenfaJ8fruzUXLPSO27+wqkmKs0z+Ykrjo/P1MB8Gn2w9
 Vmrg6FDTopVxtlJd6sj9nfcfRGxPur6k1r0tmX89kUiCr4/0PAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The tests all deviate slightly in how they assign their local pointers
to DRM entities. This makes refactoring pretty difficult, so let's just
move the assignment as soon as the entities are allocated.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 81 +++++++++++-----------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 32e0477deb45c1481a7d23bb6e6a74de52845d1c..c265d28631603f266ba606564e77b8f965b7f83b 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -287,19 +287,20 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -350,19 +351,20 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -413,22 +415,22 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -524,22 +526,22 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -639,22 +641,22 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -756,10 +758,12 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -768,12 +772,10 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -830,10 +832,12 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -842,12 +846,10 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -901,10 +903,12 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 						    BIT(HDMI_COLORSPACE_YUV422) |
 						    BIT(HDMI_COLORSPACE_YUV444),
 						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_dvi_1080p,
 				 ARRAY_SIZE(test_edid_dvi_1080p));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -916,12 +920,10 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -948,10 +950,12 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -961,12 +965,10 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -995,10 +997,12 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -1008,12 +1012,10 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1042,10 +1044,12 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -1055,12 +1059,10 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1093,19 +1095,20 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	/* You shouldn't be doing that at home. */
 	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
@@ -1149,10 +1152,12 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -1172,12 +1177,10 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
 
 	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1218,10 +1221,12 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 						    BIT(HDMI_COLORSPACE_YUV422) |
 						    BIT(HDMI_COLORSPACE_YUV444),
 						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -1244,12 +1249,10 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
 
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1341,10 +1344,12 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -1372,12 +1377,10 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
 
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1408,10 +1411,12 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 						    BIT(HDMI_COLORSPACE_YUV422) |
 						    BIT(HDMI_COLORSPACE_YUV444),
 						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -1439,12 +1444,10 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
 
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1474,10 +1477,12 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	priv = drm_kunit_helper_connector_hdmi_init(test,
 						    BIT(HDMI_COLORSPACE_RGB),
 						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -1497,12 +1502,10 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	 * clock to actually use 12bpc.
 	 */
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1534,10 +1537,12 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 						    BIT(HDMI_COLORSPACE_YUV422) |
 						    BIT(HDMI_COLORSPACE_YUV444),
 						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_340mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -1557,12 +1562,10 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	 * clock to actually use 12bpc.
 	 */
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);

-- 
2.47.1

