Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8790F259
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7361D10ED06;
	Wed, 19 Jun 2024 15:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Om0aQqSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3C210ED08
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:39:30 +0000 (UTC)
Received: by mail-wm1-f99.google.com with SMTP id
 5b1f17b1804b1-421757d217aso69146185e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718811568; x=1719416368;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkByz0jdfgl7WplPLctMZcoTBeRcA0ZVaM9uKpl5RsY=;
 b=Om0aQqSMd1WrvvZwWOKDwfda+V8e6IDHrILP4+ononJs46dfm6ndJP9Xq+esOXGz9u
 c7P+aiCVVp9eyg2EJxvXOYb1cPessHmyAr5ZAie8/vUJks/vechvvqat9Ph9pNm2g2bG
 LhUG9LRNrEm9VOmQwxxcOQEXty+06bsMSrBbOLatr/h9KDTJb+mROO+79M0dGFROjFRY
 G0QWd8k+w8YcJEOUNtE5s7QF5V7rJN2xRt/hlHA1+jFBRJXN7N1KoWXBx/ojiY3XFcrU
 /1JifdoxVSaieTwR/eUAd4TXzxsCYrQjmvt2B76Dc/exFuJBQ3xBLP+7rgHNgLu8TUGZ
 ZfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718811568; x=1719416368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QkByz0jdfgl7WplPLctMZcoTBeRcA0ZVaM9uKpl5RsY=;
 b=OUqCX+OutlPuV1fkJ4bJYM+plkHlLxJEPC6VP+XPBsELj4JjGkqPnvnEdNwy9vMkWy
 DstVZRvXSTLdM1LAF4b++jPUojlXg327TWJ92I+G2xQQNm6PvlFbJSCPLVJEq8Po5N0s
 L+y0DB9AUld969QCIbAPIHwBc1Ots+uEu4ZhF2iTtjjyk17KMxV28TPsFosJxVQVCwF1
 Qwqg4QkWOLvBCy3UYdNaBUlGaCiseOV62XaQNIDdxdpVPP4eQab8WhlNGPlaNN94Ofoa
 0BVrFt6VAFywqpwuOwVb+TZZYtSJ7jBYQHpaLvTeHlBaKRwQmW79cSGZhxFdKkZeOnU3
 aDfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiz5EvqkfUisLMQcKUeXYEmcmnWZtFTuP4gZGL+dWNEadFzsECD2XHe0+Z61WDdPoMZXVKPzNJXdm4hejM51zOmi+y99DXwjFckkLgdCbj
X-Gm-Message-State: AOJu0Yy0H8UmnzCmNMjF4+QNflMrBiaDu8fnS5/YReOYil+jblHYTC6h
 uAOVP41CiMYBSQK1xqOGwZJ7TFEkDUjqqXvtuBj8oe//oSdwrmcMcOcTMyQ+z1oI+QtDdii7nPB
 PAu+rp+E7pZrqFKqYjry4d4ZKpRmEPUDI
X-Google-Smtp-Source: AGHT+IG79eXOE6uElwN+awZxclHuyl2zdittbri9V3NiSMUw13yo3kC0l/BBmel0o+bLsyvRdB7IqoxzOU3/
X-Received: by 2002:a05:600c:3b12:b0:422:1705:7549 with SMTP id
 5b1f17b1804b1-42475296a6emr23017825e9.25.1718811568265; 
 Wed, 19 Jun 2024 08:39:28 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-422874e79ddsm8451525e9.43.2024.06.19.08.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 08:39:28 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 1/3] drm/tests: Add tests for the new Monochrome value of
 tv_mode
Date: Wed, 19 Jun 2024 16:39:11 +0100
Message-Id: <20240619153913.2804051-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
References: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
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

Adds test for the cmdline parser, connector property, and
drm_analog_tv_mode to ensure the behaviour of the new value is
correct.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../gpu/drm/tests/drm_cmdline_parser_test.c   | 20 ++++++------
 drivers/gpu/drm/tests/drm_connector_test.c    |  1 +
 drivers/gpu/drm/tests/drm_modes_test.c        | 31 +++++++++++++++++++
 3 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 6f1457bd21d9..95fb379c69eb 100644
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
@@ -976,22 +976,24 @@ static void drm_test_cmdline_tv_options(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-#define TV_OPT_TEST(_opt, _cmdline, _mode_fn)		\
+#define TV_OPT_TEST(_opt, _cmdline, _mode_fn, _tvmode)		\
 	{						\
 		.name = #_opt,				\
 		.cmdline = _cmdline,			\
 		.mode_fn = _mode_fn,			\
-		.tv_mode = DRM_MODE_TV_MODE_ ## _opt,	\
+		.tv_mode = DRM_MODE_TV_MODE_ ## _tvmode,	\
 	}
 
 static const struct drm_cmdline_tv_option_test drm_cmdline_tv_option_tests[] = {
-	TV_OPT_TEST(NTSC, "720x480i,tv_mode=NTSC", drm_mode_analog_ntsc_480i),
-	TV_OPT_TEST(NTSC_443, "720x480i,tv_mode=NTSC-443", drm_mode_analog_ntsc_480i),
-	TV_OPT_TEST(NTSC_J, "720x480i,tv_mode=NTSC-J", drm_mode_analog_ntsc_480i),
-	TV_OPT_TEST(PAL, "720x576i,tv_mode=PAL", drm_mode_analog_pal_576i),
-	TV_OPT_TEST(PAL_M, "720x480i,tv_mode=PAL-M", drm_mode_analog_ntsc_480i),
-	TV_OPT_TEST(PAL_N, "720x576i,tv_mode=PAL-N", drm_mode_analog_pal_576i),
-	TV_OPT_TEST(SECAM, "720x576i,tv_mode=SECAM", drm_mode_analog_pal_576i),
+	TV_OPT_TEST(NTSC, "720x480i,tv_mode=NTSC", drm_mode_analog_ntsc_480i, NTSC),
+	TV_OPT_TEST(NTSC_443, "720x480i,tv_mode=NTSC-443", drm_mode_analog_ntsc_480i, NTSC_443),
+	TV_OPT_TEST(NTSC_J, "720x480i,tv_mode=NTSC-J", drm_mode_analog_ntsc_480i, NTSC_J),
+	TV_OPT_TEST(PAL, "720x576i,tv_mode=PAL", drm_mode_analog_pal_576i, PAL),
+	TV_OPT_TEST(PAL_M, "720x480i,tv_mode=PAL-M", drm_mode_analog_ntsc_480i, PAL_M),
+	TV_OPT_TEST(PAL_N, "720x576i,tv_mode=PAL-N", drm_mode_analog_pal_576i, PAL_N),
+	TV_OPT_TEST(SECAM, "720x576i,tv_mode=SECAM", drm_mode_analog_pal_576i, SECAM),
+	TV_OPT_TEST(MONO_525, "720x480i,tv_mode=Mono", drm_mode_analog_ntsc_480i, MONOCHROME),
+	TV_OPT_TEST(MONO_625, "720x576i,tv_mode=Mono", drm_mode_analog_pal_576i, MONOCHROME),
 };
 
 static void drm_cmdline_tv_option_desc(const struct drm_cmdline_tv_option_test *t,
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 2812b123a79c..15e36a8db685 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -777,6 +777,7 @@ struct drm_get_tv_mode_from_name_test drm_get_tv_mode_from_name_valid_tests[] =
 	TV_MODE_NAME("PAL-M", DRM_MODE_TV_MODE_PAL_M),
 	TV_MODE_NAME("PAL-N", DRM_MODE_TV_MODE_PAL_N),
 	TV_MODE_NAME("SECAM", DRM_MODE_TV_MODE_SECAM),
+	TV_MODE_NAME("Mono", DRM_MODE_TV_MODE_MONOCHROME),
 };
 
 static void
diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index 7029f7a2eb4d..066a08a38ca3 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -130,11 +130,42 @@ static void drm_test_modes_analog_tv_pal_576i_inlined(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));
 }
 
+static void drm_test_modes_analog_tv_mono_576i(struct kunit *test)
+{
+	struct drm_test_modes_priv *priv = test->priv;
+	struct drm_display_mode *mode;
+
+	mode = drm_analog_tv_mode(priv->drm,
+				  DRM_MODE_TV_MODE_MONOCHROME,
+				  13500 * HZ_PER_KHZ, 720, 576,
+				  true);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 50);
+	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
+
+	/* BT.601 defines hsync_start at 732 for 576i */
+	KUNIT_EXPECT_EQ(test, mode->hsync_start, 732);
+
+	/*
+	 * The PAL standard expects a line to take 64us. With a pixel
+	 * clock of 13.5 MHz, a pixel takes around 74ns, so we need to
+	 * have 64000ns / 74ns = 864.
+	 *
+	 * This is also mandated by BT.601.
+	 */
+	KUNIT_EXPECT_EQ(test, mode->htotal, 864);
+
+	KUNIT_EXPECT_EQ(test, mode->vdisplay, 576);
+	KUNIT_EXPECT_EQ(test, mode->vtotal, 625);
+}
+
 static struct kunit_case drm_modes_analog_tv_tests[] = {
 	KUNIT_CASE(drm_test_modes_analog_tv_ntsc_480i),
 	KUNIT_CASE(drm_test_modes_analog_tv_ntsc_480i_inlined),
 	KUNIT_CASE(drm_test_modes_analog_tv_pal_576i),
 	KUNIT_CASE(drm_test_modes_analog_tv_pal_576i_inlined),
+	KUNIT_CASE(drm_test_modes_analog_tv_mono_576i),
 	{ }
 };
 
-- 
2.34.1

