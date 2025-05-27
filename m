Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD07AC4E67
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE4710E4D2;
	Tue, 27 May 2025 12:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="n6uC7Qhr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929CA10E4B1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748347895;
 bh=Kr9JGkqSj9Ped/Q6Pi3Di8bZNdl/U2IOTHASMaKOiXo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=n6uC7Qhr0Vkcs/w3e0pnn+5rZoqNDbDB9BvGpSQAmi5i4eqpjY0ArnUyHD5P7TFi/
 wFxfKDZQ5hivjc5TnYxLNTNE4pG4S7B+umOzk+vSJ0tJAKAlPMFYuDQsP5dx0gSN4g
 qxgk8wHWsVGSiDVdCfnnN6Gofg5jTXQBHOw2wwupYghlk6hwHVKy9Uw6rxA5IVKTYV
 5ub0SENDcrCgej3zeHLnvP8aOzu1/WEgZ8UQ1llS2r/Yk8sZ7+8TEDJEZevxbRMgUI
 OSvpNbiu72YpgFHdUeCjW2hoYTL/rj71oz2VXI8xV4eBsxJRiUletvttbYB7n3G397
 qNa23ogzI/cTg==
Received: from localhost (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2B02817E056F;
 Tue, 27 May 2025 14:11:35 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:24 +0300
Subject: [PATCH v5 16/19] drm/tests: hdmi: Rename max TMDS rate fallback tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-16-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

In preparation to extend the max TMDS rate fallback tests for covering
YUV420 output, update the rather generic function names
drm_test_check_max_tmds_rate_{bpc|format}_fallback() to properly
indicate the intended test cases.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8015e4c469049c611f7fcc24269cd349680900c9..c6f7c33f5f7142d6ee80970f73e9757fbc08b3d5 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1253,7 +1253,7 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
  * Then we will pick the latter, and the computed TMDS character rate
  * will be equal to 1.25 times the mode pixel clock.
  */
-static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
+static void drm_test_check_max_tmds_rate_bpc_fallback_rgb(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_modeset_acquire_ctx ctx;
@@ -1322,7 +1322,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
  * Then we will prefer to keep the RGB format with a lower bpc over
  * picking YUV422.
  */
-static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
+static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_modeset_acquire_ctx ctx;
@@ -1774,8 +1774,8 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_disable_connector),
 	KUNIT_CASE(drm_test_check_hdmi_funcs_reject_rate),
-	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback),
-	KUNIT_CASE(drm_test_check_max_tmds_rate_format_fallback),
+	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_rgb),
+	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_dvi),

-- 
2.49.0

