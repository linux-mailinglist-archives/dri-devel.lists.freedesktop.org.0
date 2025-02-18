Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455EAA3A8D8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 21:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E3F10E75B;
	Tue, 18 Feb 2025 20:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="obPnZQI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED51110E75B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 20:27:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C1475C0198;
 Tue, 18 Feb 2025 20:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2304C4CEE2;
 Tue, 18 Feb 2025 20:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739910447;
 bh=9RMUXCpwQl+Ol+ViCz2WX9hXMmoenkkXVabWO8sPUIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=obPnZQI7pdXZIAENTtY4e2Zm+FWje9nHYpSTRVPBeNul+JdaUb+1UFPdpUeeZgRcq
 YKGFFrURM6Jj0pwK+lHTnyHHp8ZDVwstecMeRZ4eeJAr5W/Ygg4pEsH0Fr0w+YiLlo
 gD+iotoijOtql7jP182E0naejloQCP1dOpmKTRGRbVs6yDgTHYU3ck9RQ3QBTHglP0
 DkVtmTZyMG4wiLoj2jnYcyowPZ2I7/sGpG4jVGFgpIFOkGZePUG8AV8H/ofFeQZqHf
 LYkRxpNTXz+U55ybfBMTgCeaT5zzhskyiBPPSHBPltWALfwiGufDD8FzAFlMRzEY2P
 hW0W1jDZhj6Ow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 29/31] drm/tests: hdmi: Remove redundant
 assignments
Date: Tue, 18 Feb 2025 15:26:15 -0500
Message-Id: <20250218202619.3592630-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202619.3592630-1-sashal@kernel.org>
References: <20250218202619.3592630-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.15
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

From: Maxime Ripard <mripard@kernel.org>

[ Upstream commit bb4f929a8875b4801db95b8cf3b2c527c1e475e0 ]

Some tests have the drm pointer assigned multiple times to the same
value. Drop the redundant assignments.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20250129-test-kunit-v2-2-fe59c43805d5@kernel.org
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 4ba869e0e794c..ac653346e766b 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -443,7 +443,6 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
-	drm = &priv->drm;
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -557,7 +556,6 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
-	drm = &priv->drm;
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -673,7 +671,6 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
-	drm = &priv->drm;
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -1275,7 +1272,6 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	rate = mode->clock * 1500;
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-- 
2.39.5

