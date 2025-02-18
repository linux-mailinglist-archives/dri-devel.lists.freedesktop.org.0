Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96118A3A8C0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 21:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EB510E11B;
	Tue, 18 Feb 2025 20:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c7xnhbkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D4410E11B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 20:26:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 850A45C62A2;
 Tue, 18 Feb 2025 20:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B739C4CEE2;
 Tue, 18 Feb 2025 20:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739910362;
 bh=VropmkxRvGV2M+HXGjJIyxCbLwUKDK91l3HDTGhaTAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c7xnhbkOsM4EEQcZOU5IKdmzV951tqRXySsxXmMcfH5p904dK74l9fo1BTYRTU5bU
 d/OiQ6i6+ry3pJsZEyc2LZJrquz3QLqV5sHxWAvmZK2vloFcrS9BRtoXCLz1vzPHaX
 TkGQw7odvwYt+negXYgQUoXTUicMhKd7BjgmnkvJBmEI/rr1Zkm5xBBpZSavhprIky
 5OhAf32TFyWT4qk23CAM880Xnyn10xxQKK1Kf85yueRHAUFZsagfrPf/FHNItUYR+X
 MEZXSDvtvpK0W0eJSYEpdfyTeAI2pEAU80aIkT8lVPsprMraJJmTNDGHGxGWQ12HfQ
 IRfni2j8PZr8g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 29/31] drm/tests: hdmi: Remove redundant
 assignments
Date: Tue, 18 Feb 2025 15:24:49 -0500
Message-Id: <20250218202455.3592096-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202455.3592096-1-sashal@kernel.org>
References: <20250218202455.3592096-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.3
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
Stable-dep-of: 5d14c08a4746 ("drm/tests: hdmi: Fix recursive locking")
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

