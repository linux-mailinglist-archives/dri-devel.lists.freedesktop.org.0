Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E275A21EF7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EA110E7FF;
	Wed, 29 Jan 2025 14:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NC6LBlMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB3E10E117
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:22:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 943335C55B7;
 Wed, 29 Jan 2025 14:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF956C4CEDF;
 Wed, 29 Jan 2025 14:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738160530;
 bh=guYwAGilkamBvUFHHQMbkhaLhzjw2pN9TGS5PC/TRjc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NC6LBlMVQ0m0MbX7CDpGfAxF7DHJg+D5cGlewPlMIbUCTc6MJwU/P6bt6vcYvvLW5
 ziWgIEEjjwJluNvnczOizD7gD1vQ3BwHf45xJDkXhe7jnvK4kEQoWUzfQmQUwITDGV
 SaOPcjbyxuwjVen56Okv+hUmUECrRtMJQ/fUAXO98Am3ISRFlqY2svCRIlhgY1KbEF
 ZSf0VFHATwxRnU2SKkX5WpfwJgIhj1Dpy63bEP4UKay7NynOJeG6CAq7P4gbXR8Y6H
 e2TXSOVcUsJhDtPTQoeJwVraDpfnEyOeS2VM4zMgX6S5G1t2wJCNUMW7GUWWlTgNxj
 W3fduTpweJ+Ig==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 29 Jan 2025 15:21:54 +0100
Subject: [PATCH v2 2/4] drm/tests: hdmi: Remove redundant assignments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-test-kunit-v2-2-fe59c43805d5@kernel.org>
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
In-Reply-To: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2410; i=mripard@kernel.org;
 h=from:subject:message-id; bh=guYwAGilkamBvUFHHQMbkhaLhzjw2pN9TGS5PC/TRjc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmzLNt3bPdxu7zzmK/4ouoj/2tENibIuNu5ptmGTb6hc
 0n877t1HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiD0UZ690vPJjdPl/2v6h0
 X0tZEOu0Czv2qEd2My4PuX5miUo2a5EjW8wbeebPd4t4f/tEF+7pZ6xTYwl1Vr4QnNl3VM54xel
 XueGKSgpJ/dvyApe4G7REbi59l9bSIL6pUGrL3MfG02dJRQIA
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

Some tests have the drm pointer assigned multiple times to the same
value. Drop the redundant assignments.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index e814b538c46c4d342604436beca64ac0bdb31526..32e0477deb45c1481a7d23bb6e6a74de52845d1c 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -479,11 +479,10 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
-	drm = &priv->drm;
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
@@ -593,11 +592,10 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
-	drm = &priv->drm;
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
@@ -709,11 +707,10 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
-	drm = &priv->drm;
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
@@ -1311,11 +1308,10 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	 * Thus, we have to calculate the rate by hand.
 	 */
 	rate = mode->clock * 1500;
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;

-- 
2.47.1

