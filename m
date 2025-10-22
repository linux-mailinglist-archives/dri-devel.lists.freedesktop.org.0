Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF60BFB241
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427E10E721;
	Wed, 22 Oct 2025 09:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ClvFXZ8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F7B10E71E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:22:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4711810948aso46415345e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761124964; x=1761729764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VNMoTZJllpgSAwO+/JhEP/SxoXgVZAY6noBMUvcjjeA=;
 b=ClvFXZ8HW5akXqHSP0O3al+iJN/LZp9Ckn98ngiEX3UV8KisuoEr5AHt+dmx2Cpkkj
 j4Wi0tzMaaNrEjyjlBMnSIu0ojyJSloAbnN6GM13o0DfDOr8yUr5VcYFO3QQS3B67EKK
 WL3DRAZQ202XYV5b0xanp4RoMgMQ87zlLTNWiwY/B0iEM9D9aItNhUgKr/6+SXCccNnq
 CZ8A/QfosLZiiH6NaNY64PjtXQwtOq/stJQxTSyvvWC2m8X2GeaJKwqBFgh9t4c6TUCh
 uHnq6XnwOs9cImMGUSAdPy4nGLFWgx7IImJwuyu/ZgDFin+heeJhtuj5zWqc094hTO1j
 g7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761124964; x=1761729764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VNMoTZJllpgSAwO+/JhEP/SxoXgVZAY6noBMUvcjjeA=;
 b=CXNVtS8Blocfn/1A86mgJz4J7KhYOECQezWTaRLTtdFdJzvNWCKpHBep3qIUN1wu27
 JKUcznfXvJwBKHHIDDaafP6OoIwGBnCLS07DuJcvZMVLMsF5vO9tRlKmG8GibDFfQQcW
 s3jwZY+fFZhfbJkHw3jf1+IlVdzLwEgnKnmKiRZu4sN3JGnmexngjMJpAfmTxD1u67a+
 vnHLV1fmc2rmZfEbpMKR7G8vuJ0i3n8+Toq39DH0eoWFaQFJuCGDme7xXULpsiUJ3pGI
 TEuduMJCUolCG/omdYzs5qiGNZOD4UMMkqEv3G8RNXr/KTmtRHQY3IwMGal8AD2+lVEG
 uhZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMAXmjOO5quY0THlUK7YuXCBnl8y5IgqBXqOqFyVByW2Ag3L9PDiITg38GW3cvExTwPyClrQxIXHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7/G5oeEaPYKz6RiWlnIUuR36eyoxVOU5hNy7qqAiZL9qqfXip
 hwqYAUj9NQlXm+nFV9d/cqL5lwmlC8SN18AvuYu35cDSZt3dGleTD1v6
X-Gm-Gg: ASbGncuip7X0hPKDIi5zTOalgl6U5d00EHnD4IIdKRB79kioep9RdugxMm11aJEyrCb
 lOzWkNgBnAIhUtS6kLRdzhCYtuiTUKEn8tixFggGcT+VcYt930hAQ0XdJDxhdBm+V6zQgUe/fv4
 UmqMlZ/zSWMvaCSWqOlP3Av/6Xrb6o4g01FpTcDx7axS0l1N8Z2RS0I2myRL7OowuraGz96Bnl/
 VZeP3/gEagk/BcHyytBSf9Toj6jZBfx4957G5lHOSiporgNH9G8NsHtuAcGeBwKR4HdXemWMzwG
 87QqsXkJtfQLl9QBB6zela8FFk1+RCy1h1YCju5lEYye6HvBDOExa0nH7JVNSW0VobWXFTBB0tO
 FFIvT/2rf4f3MfihWTSiLiGUBOpo5+kwI6m61EYeRc1QOT+fYDVAuPnylBFAP3IBjwxZCE68WHK
 z3BDBCKU8wWQ==
X-Google-Smtp-Source: AGHT+IG3shR1jkIXjfz9mpIHyj77SpOy/9Mx7bfHfwJZCSED1Rhf3mSo44aJkQh6ifUEBGx+vAYZxA==
X-Received: by 2002:a05:600c:3494:b0:471:76f:80ed with SMTP id
 5b1f17b1804b1-47117934827mr145803435e9.41.1761124963386; 
 Wed, 22 Oct 2025 02:22:43 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496afd459sm34829455e9.1.2025.10.22.02.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 02:22:42 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: mripard@kernel.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, cristian.ciocaltea@collabora.com, lumag@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] drm/tests: hdmi: Handle
 drm_kunit_helper_enable_crtc_connector() returning EDEADLK
Date: Wed, 22 Oct 2025 11:22:14 +0200
Message-ID: <20251022092233.8020-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fedora/CentOS/RHEL CI is reporting intermittent failures while running
the KUnit tests present in drm_hdmi_state_helper_test.c [1].

While the specific test causing the failure change between runs, all of
them are caused by drm_kunit_helper_enable_crtc_connector() returning
-EDEADLK. The error trace always follow this structure:

    # <test name>: ASSERTION FAILED at
    # drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:<line>
    Expected ret == 0, but
        ret == -35 (0xffffffffffffffdd)

As documented, if the drm_kunit_helper_enable_crtc_connector() function
returns -EDEADLK (-35), the entire atomic sequence must be restarted.

Handle this error code for all function calls.

Closes: https://datawarehouse.cki-project.org/issue/4039  [1]
Fixes: 6a5c0ad7e08e ("drm/tests: hdmi_state_helpers: Switch to new helper")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../drm/tests/drm_hdmi_state_helper_test.c    | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8bd412735000..70f9aa702143 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -257,10 +257,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -326,10 +332,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -397,10 +409,16 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -457,10 +475,17 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
+
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     mode,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -518,10 +543,16 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -580,10 +611,17 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
+
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     mode,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -643,10 +681,16 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -705,10 +749,17 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
+
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     mode,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -870,10 +921,16 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -946,10 +1003,16 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -1022,10 +1085,16 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1069,10 +1138,16 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1118,10 +1193,16 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1167,10 +1248,16 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1218,10 +1305,16 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	/* You shouldn't be doing that at home. */
@@ -1292,10 +1385,16 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_rgb(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1440,10 +1539,16 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422(struct kunit
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1669,10 +1774,17 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	drm_modeset_acquire_init(&ctx, 0);
 
 	crtc = priv->crtc;
+
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     mode,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1736,10 +1848,16 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1805,10 +1923,16 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1865,10 +1989,16 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1927,10 +2057,16 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1970,10 +2106,17 @@ static void drm_test_check_disable_connector(struct kunit *test)
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
+
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
-- 
2.51.0

