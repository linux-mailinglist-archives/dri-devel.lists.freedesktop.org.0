Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810A79D5B85
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F95610EB02;
	Fri, 22 Nov 2024 09:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KptW0JlX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC5E10EB02
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:13:16 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53dd1829b56so1472665e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732266794; x=1732871594; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HoL3aWMtjL9qLbqtGe43c2BpbewS4aE5M6KHnAUYZyA=;
 b=KptW0JlX/jGiIWAowZ3bvxitOHZyqw30dtYdJ0ad+FNUvh1mNkBytxWKfNc4xA9RZk
 XXG7mXj4yglCKCRpk/FOUKwY7iAi5Gcn9HNsix7afQ9NMZnRVXRkNB34uZUgjgiT+ehu
 Lk9WrOefRSWZCIQPw9n+88TgZxMFIE6vpgeHD/AN1KX2CmGHsh0DXrXNkeDiOOS5Sc4x
 dy2VdDsVbokREse6T7XLQcOPgNZUpcprdYjYqXpmNKtYcnBxQCmOMdAh03tFpiCgNEvp
 YKEbnYzva5ADrQXdgVe0Gqj2NIMY5UVVXo6MQ6CTIpW5vd4+/dMcG6d7yWat20yBxnIx
 J8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732266794; x=1732871594;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HoL3aWMtjL9qLbqtGe43c2BpbewS4aE5M6KHnAUYZyA=;
 b=IKlO6XYROLd7QS6gNVNW5NINtFpmLx4IlpSnnHsfmZhGpdfQGEFN3BzUI1FZFbSpFm
 ho0WKjPxUHcsP2XinhxdrTrjE2lEZX/CZSP8IB95KKQW7KZ8kyvqpNo1TO4X95ZmZhgR
 Bd4QbSlnKBu70Vqnp6icDxP1EaKwhmEm1ddSLLO/YER0JUUiAfCRa+NzDaxbU0IgGwzQ
 iQW1LgPc7LBxNu+zzLszdTt/vVH9+Jf2fkCxe1y9WOmF+0BzEOjIrgiEHlOraJCzz4V5
 Lj+9uM+KNGdyWXJcksHhZ57PqMYiMCgVRMokAH8K9k7AmyTXa34FR2Q54uxgwZrDB6SQ
 GMpw==
X-Gm-Message-State: AOJu0YzOGxjjhDnD5YFSAhxXP7yfckExZuRVEb8Ud/1l5F1IdOu91jEe
 sTV6elw+h3YcJS5PL3R0HTLVUpDDMchLr4cFn44QUewaq2En+6lS+4sSXfBup2I=
X-Gm-Gg: ASbGnctsn9ohL5AhOca+7aLMdUdC3f2tMHO7I2JcplDnlqnHWmtCYZ8lWU3Q7kt4MNI
 idIqWCdHuMnskpJDaThwzCkijpqQOEL75mzsPiVgvO0kEZvwP1Zcak7pXBxegXSbOKSu8R3qO+r
 dajIPSeB9SwUHKoLeZUP3vU4t3K2Lp2x1HqqJAf6x0aHyaJEwWvlctMKxxxvPn3P2rbNc5UehRE
 neg+L+5P5sX7bkn0bKtrgwuROyYUcLOV/Qz7OWQICXZEVMpZlakCeRW6A==
X-Google-Smtp-Source: AGHT+IGsVNjOq27k776zE/cKgwN70tM6uYhT0eEceng2yr5gRWog07KJFnzoL9IEms+6bvRWR289/w==
X-Received: by 2002:a05:6512:b8a:b0:53d:d2d0:7c8f with SMTP id
 2adb3069b0e04-53dd389d8c5mr910882e87.34.1732266794264; 
 Fri, 22 Nov 2024 01:13:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:13:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:12:58 +0200
Subject: [PATCH v4 02/10] drm/tests: hdmi: rename connector creation function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-2-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11003;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=g90UV4snbYK1PCsg8Vi4l6YeLj+54jyCttfyA/beoL8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEshr58WmNMo81MG4tiQNHQeSCPOdq5T4NQZ4
 z8ZTDVJEraJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1fMGB/9ZOhAOQVgQ06z4Dsew8aMKvh7Gsx2b8vApxlPuSYhFhnespRjpeyhSCxW5AAYYPlS87N3
 OpezjjaXuXIKqiV1jqN8LW1Mdu4T94LRA30YeLbaImenTe4zJULUTIPgSb0YhDqlBtKMplZ+ztr
 xZa14xzq/fyMB1B0/kW6cpcS8Aija2dpwz7SD2cUXZ+WnR2224RqWvRC5r+3Yh3JTatsclMYRqT
 zFyZjeJDH8l2dK/pK7ipe0HJbkZdttc3WuNvlFBXzitXJaNC1t8gP7mfTF4ENXVC6Tna2YUX3un
 gPH6KVG+TF4XJf8zdGy9/ks9y9P+2SD6uG+UcQHbET/Akc4+
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 58 +++++++++++-----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 1e77689af6549f162eb3026c7bd2bbd59516ed98..d81254d46975e8af0d782249928217a1ebb7646e 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -164,7 +164,7 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_atomic_helper_connector_hdmi_init(struct kunit *test,
+drm_kunit_helper_connector_hdmi_init(struct kunit *test,
 				      unsigned int formats,
 				      unsigned int max_bpc)
 {
@@ -247,7 +247,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -310,7 +310,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -373,7 +373,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -429,7 +429,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -485,7 +485,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -543,7 +543,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -601,7 +601,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -659,7 +659,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -719,7 +719,7 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -793,7 +793,7 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -862,7 +862,7 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -911,7 +911,7 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -958,7 +958,7 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1005,7 +1005,7 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1056,7 +1056,7 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1112,7 +1112,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1179,7 +1179,7 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -1242,7 +1242,7 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -1305,7 +1305,7 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1370,7 +1370,7 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -1438,7 +1438,7 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1496,7 +1496,7 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -1593,7 +1593,7 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1615,7 +1615,7 @@ static void drm_test_check_bpc_8_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1639,7 +1639,7 @@ static void drm_test_check_bpc_10_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1663,7 +1663,7 @@ static void drm_test_check_bpc_12_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1685,7 +1685,7 @@ static void drm_test_check_format_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -1707,7 +1707,7 @@ static void drm_test_check_tmds_char_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),

-- 
2.39.5

