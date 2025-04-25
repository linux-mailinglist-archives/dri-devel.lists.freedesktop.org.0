Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8365EA9C576
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 12:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CB210E94A;
	Fri, 25 Apr 2025 10:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WjO2TnLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB4610E93E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745576914;
 bh=Ru4SuCX08vOXduZ4SmjSPm6UxW9W5DJ2U+xBG6H0qIE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WjO2TnLyaOutpa406wZXjWnScLFIwzKhD15gW5RaI7m3rjwK5+7YGoS+l6RRzBFs0
 twafr1lwnq1c0oVQfF7xOaYSP9wbkbEHoAPXKs3DP5jSOcjjZX3/qlYKJdDsV9OTfP
 ws8+VT8xUrKQWiy/uLigMxkTcsWW/vJoeSy4/llxgeiXoRaMxc3b8zZpyV85KuHovS
 ITOyx4aQ3Wj7Qob2Dw62cM/cyUZtWikDcmYmKKc5W2JUqy+cxr0i7wDpPmUo34W0fo
 8pIRGwtSQ5vm5lzUmPFlMWcRKOk+LTYjMvzzHWkbGM80rMdfs7k7yamLpBJkTBnbfK
 0bSrC6JnXFnAw==
Received: from localhost (unknown [82.76.59.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6828B17E362C;
 Fri, 25 Apr 2025 12:28:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:10 +0300
Subject: [PATCH v4 19/23] drm/tests: hdmi: Rename max TMDS rate fallback tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-19-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
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

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 6dae9a56bf1bccd39f6b79f6ad9f943538d0ad36..faec7aa6fd55faae2207072b67ef3d372dc1695e 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1278,7 +1278,7 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
  * Then we will pick the latter, and the computed TMDS character rate
  * will be equal to 1.25 times the mode pixel clock.
  */
-static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
+static void drm_test_check_max_tmds_rate_bpc_fallback_rgb(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_modeset_acquire_ctx ctx;
@@ -1347,7 +1347,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
  * Then we will prefer to keep the RGB format with a lower bpc over
  * picking YUV422.
  */
-static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
+static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_modeset_acquire_ctx ctx;
@@ -1803,8 +1803,8 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
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

