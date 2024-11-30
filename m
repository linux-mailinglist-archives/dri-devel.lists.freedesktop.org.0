Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20459DEE6B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025D010ED11;
	Sat, 30 Nov 2024 01:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I9w0Thao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B8F10E0EC
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:52:42 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53de8ecb39bso2868161e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931561; x=1733536361; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=b4B0Y8eeW8nijFHMU2wdPBEmou1JUmUHuwSM02tCW6A=;
 b=I9w0ThaokMHtqGmR3IBUe741C3kw5qpZuZrN5w2r0tl4uueU0y/LGdWUl8EvPtNcn2
 HKwnnEQakwO4fLkXryp70zSG/8Z2VeoJhmjY5b/NMzUSNTD0YHlgrhmkZYVpeHlUv5Pq
 aaJ78zQBL+QUhdyQ7jc6bLsAgzNCQFThGPE+jOd0O+dZXHcXW8WHU58ChyxRW4zV1w68
 SuV0rXu4j0Krqmv2fAFf5iR2iTCZGreVYxVHqS9+sQ18USzrkUKCjgc6i4NhfInRKPH1
 0fLpSo2ZQrJGq33Ry7iNeKkn53aOBnrCHA3qFkSuV1V7dc/kxIYyy8Jdkhy2RzLkq7wa
 ujDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931561; x=1733536361;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4B0Y8eeW8nijFHMU2wdPBEmou1JUmUHuwSM02tCW6A=;
 b=TjT3/pfsHOR4TD4yQWb4aMYJSZt2ZadIby66Irj6zc6gXD2d1lP53Q7awNx432qV22
 W7MP16FjU5k27nQrexWdRTAvM0XmZHPmF4gsfhbQY5KaFSTk0N4YQszy6hM7nd/THeol
 MxoU2K8D+i2Tlu5UygQdPNWw5pnLYfkbDRSH5o5I6Y99ldmf2dET+PsDn3OzSWbpjpHL
 QfeAwvCJLjQOE5DMQzmYSne2l84LYKgt6vcYOWvn1Beclg6fXuW2z2f9+7ddSqKLxPRo
 rLBaStK4n38WI3A/qydY+q35RH72s377OLKd37XxjT1a9+cE0B7GNzKvRXAoPnzOqDLy
 Ml/g==
X-Gm-Message-State: AOJu0YznNTy3w7Zlv1lGkXrtgDG/KmfhbKBR8DZGcWjw9TjMd2F6eHXA
 8NsiRSlHyOSOf4avEeqm+jkWq5XHtisyC0/bVZP1cVZD7OPpbP/TsKNdTHcef+4=
X-Gm-Gg: ASbGncvSt0OMnoCZPbOA/LX169DhMHzJWv+p2KPupACcVw1HlQAuCBxIoz7BPU5HRUS
 RoJZJcNXU9rI5K5FfQ8ucrALC+9Eg3SDBm3e/vXbJxvDJXp5AiZFJC7pKmDrFVT+RPDoWvopcQg
 /22aHP8CjygAaD4GvBNsm+WqpI+p5ki0QPtcB5CX9OeNtdrIMwqK5cQqZvPkFUjEGfM83SIXTMc
 vtzUUfEmqNtP1Op2ujjVo/PSsSBAR99P9SpBAzRSQ+OrW/dXmNx9ogKrA==
X-Google-Smtp-Source: AGHT+IHr7e6eqX9Z0gQvURdKQ1bdtAFQTJZejUyHCz6bKeZj+mC0/lLghPW0EOJgTJMIplS8zy4hNg==
X-Received: by 2002:a05:6512:32c1:b0:53d:a68f:d901 with SMTP id
 2adb3069b0e04-53df00d1b06mr7609554e87.15.1732931560699; 
 Fri, 29 Nov 2024 17:52:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:52:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:27 +0200
Subject: [PATCH v5 02/10] drm/tests: hdmi: rename connector creation function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-2-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14634;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=v8BoSRVhNVLNIqn0L1HvmQQ2nfTsZdUMUqZ1imeVKuY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/fLC3qTV5FPAg0koUKF7mCCVp4yjgnKY2Ob
 7XbeEcO7OuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv3wAKCRCLPIo+Aiko
 1W8+B/wK+y74BQCSvsvXrO6Z3w7xSSgmnVQ99HIWNd93CVXPYrCnNdWqf/FAeZisVnWQRjmqeyV
 L0N+uCP5Wt1zYJyCnIFQC4R5WgF8vMQ8v39fsp9Ab3f03lvV/5/BpvWcBC6FQdGTBx6ObXov7xp
 VOVE5CIYcE5LxJWlebKEE2e5J0cZTNEH9IyhHjYq8gERQmh2oAKbBBWHs7HpDuSZta1oid9nUZi
 cdWlFnP4EajV5XBJ6VleF4Ideqv6+Vg/KH7ZUCelcHS5hnxwnbxlw9r1GOLUIc+Gzuk/BCs+E0Y
 uh9d/yk0xHTcrLsNtUfZ36YteFQsA33xM6D/deRqQpwMun9D
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

As pointed out by Maxime, the drm_atomic_helper_connector_hdmi_init()
isn't a good name for a function inside KUnit tests. Rename it to
drm_kunit_helper_connector_hdmi_init().

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 202 ++++++++++-----------
 1 file changed, 101 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 1e77689af6549f162eb3026c7bd2bbd59516ed98..60b1e37522837ee183c65413e3ba6c6ec4fed341 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -164,9 +164,9 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_atomic_helper_connector_hdmi_init(struct kunit *test,
-				      unsigned int formats,
-				      unsigned int max_bpc)
+drm_kunit_helper_connector_hdmi_init(struct kunit *test,
+				     unsigned int formats,
+				     unsigned int max_bpc)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
@@ -247,9 +247,9 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -310,9 +310,9 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -373,9 +373,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -429,9 +429,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -485,9 +485,9 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -543,9 +543,9 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -601,9 +601,9 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -659,9 +659,9 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -719,9 +719,9 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -793,9 +793,9 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -862,11 +862,11 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -911,9 +911,9 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -958,9 +958,9 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1005,9 +1005,9 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1056,9 +1056,9 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -1112,9 +1112,9 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1179,11 +1179,11 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1242,11 +1242,11 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -1305,9 +1305,9 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1370,11 +1370,11 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1438,9 +1438,9 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1496,11 +1496,11 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1593,9 +1593,9 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1615,9 +1615,9 @@ static void drm_test_check_bpc_8_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1639,9 +1639,9 @@ static void drm_test_check_bpc_10_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1663,9 +1663,9 @@ static void drm_test_check_bpc_12_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1685,11 +1685,11 @@ static void drm_test_check_format_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1707,11 +1707,11 @@ static void drm_test_check_tmds_char_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;

-- 
2.39.5

