Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C56A9C575
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 12:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA3510E94B;
	Fri, 25 Apr 2025 10:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="m7B2+5nf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B00410E929
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745576904;
 bh=hj8rzcU5KaXu33k1FiIJ/Tj50IiApAELLP5G/q5n02o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=m7B2+5nfaG59Qa/hVbWZN6j1uUxKCjcQYIVy12iv5wMQD7sR7SJpvqF+Dmy+E9B7H
 Uh/rctL53vKy01DKUWGGsp6UnM/VEbgvVexKU26WF1B9+BAO1psuzW3mYw2sfh7b5X
 3AJWX+rgm6YRR5iw3+s5hy33F8GXeA2zJM/AONmiO2W/GvD/bJDixuYuOZ06Xy9Bxr
 kKyc1M6XPAcpEKcfkusR/iWJ4iqm2C//8hk1GIF8W0xWyVczn0OZG3LfhrwUSv+fRc
 f7+Ww1lBEiQdXQ7cqCT/AR6ZYlh/9wqf4i2un9r0cIb7xO6lcdVEBV6NB1/2fZUN8Y
 NLlUqktKNdvZQ==
Received: from localhost (unknown [82.76.59.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 8FA7017E3626;
 Fri, 25 Apr 2025 12:28:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:26:58 +0300
Subject: [PATCH v4 07/23] drm/tests: hdmi: Replace '[_]MHz' with 'mhz'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-7-5e55e2aaa3fa@collabora.com>
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

Improve consistency throughout drm_hdmi_state_helper_test.c by replacing
the two occurrences of '[_]MHz' substring with 'mhz'.

As a bonus, this also helps getting rid of checkpatch.pl complaint:

  CHECK: Avoid CamelCase: <reject_100_MHz_connector_hdmi_funcs>

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 7ffd666753b10bc991894e238206a3c5328d0e23..c8dc6fa0f925e35e9903a18bac7f78f9d8165960 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -89,15 +89,15 @@ static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 };
 
 static enum drm_mode_status
-reject_100MHz_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 					     const struct drm_display_mode *mode,
 					     unsigned long long tmds_rate)
 {
 	return (tmds_rate > 100ULL * 1000 * 1000) ? MODE_BAD : MODE_OK;
 }
 
-static const struct drm_connector_hdmi_funcs reject_100_MHz_connector_hdmi_funcs = {
-	.tmds_char_rate_valid	= reject_100MHz_connector_tmds_char_rate_valid,
+static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
+	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -1934,7 +1934,7 @@ static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
 							  BIT(HDMI_COLORSPACE_RGB),
 							  8,
-							  &reject_100_MHz_connector_hdmi_funcs);
+							  &reject_100mhz_connector_hdmi_funcs);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;

-- 
2.49.0

