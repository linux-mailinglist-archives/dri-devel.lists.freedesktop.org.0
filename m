Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20D1A714A1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3C710E69D;
	Wed, 26 Mar 2025 10:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="StXtodWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A9410E696
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742984408;
 bh=v/fyQCNrVCvHT2cQvAAE7Y6GNncKXO0CKQph6nEoM98=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=StXtodWwXx0RhjEEZ+vHIJHX/By6TzJnC4UYUtOv7hEJRZ24VBbMLm1V59XCJkQFi
 ChBgO5oQT5xPlNeyEQCE8SKDG56etc8u4HaH+JKLGPpiQ0HKJlAN2Wbk8T9rK/nJtT
 Ka+u9lvRILzgf3ChItIskEcplvf8fKIWqrS4e5tjeqAXi6O876FIQOzVouj/2mBW8I
 e7pLmMrhLmL1Dv1ZQ1ia+MueBcJqbtexk4n06xZm0UxjK26FbJ5gbJa/q/exDsQtxF
 uEsWh1NTgXj7IUvb9WOOPyABc9FihpFAxtUQ/LWd02rH3plB9ShmAd4YmsxW5hiE6W
 rJggJc9IwkU7Q==
Received: from localhost (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id D577D17E0FCC;
 Wed, 26 Mar 2025 11:20:07 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 26 Mar 2025 12:19:58 +0200
Subject: [PATCH v3 09/15] drm/tests: hdmi: Fixup CamelCase warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-hdmi-conn-yuv-v3-9-294d3ebbb4b2@collabora.com>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
In-Reply-To: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Rename the reject_100_MHz_connector_hdmi_funcs variable to make
checkpatch.pl happy:

  CHECK: Avoid CamelCase: <reject_100_MHz_connector_hdmi_funcs>

While at it, also rename reject_100MHz_connector_tmds_char_rate_valid()
for consistency.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index bcbd146fb655f4402529e59af09c99dbae7be0bf..284bd9b1418a454d05c4a38263519eb8ae450090 100644
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
@@ -1933,7 +1933,7 @@ static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
 							  BIT(HDMI_COLORSPACE_RGB),
 							  8,
-							  &reject_100_MHz_connector_hdmi_funcs);
+							  &reject_100mhz_connector_hdmi_funcs);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;

-- 
2.49.0

