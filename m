Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4691910237
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1379510E2F2;
	Thu, 20 Jun 2024 11:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bnMw0W8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFF510E8DC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:10:00 +0000 (UTC)
Received: by mail-wm1-f98.google.com with SMTP id
 5b1f17b1804b1-424798859dfso7605325e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 04:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718881799; x=1719486599;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cK+L5yW/iH6P0lWxDbggvRxWvWuKB8/PuWfG3NK6lw4=;
 b=bnMw0W8Ps5w6enZkwiyK4eY5dNx0dxAqh8ITRPjHnnvbdsiAcq9LFs49GVZmQf53KK
 hRtyfjbKC3eAh2sf0s/YXoELIkMS0lflEfMUjjrpAgx2gq+bEGjgVhtgcBcd6xR6RbQX
 kqlhffZ2fmuwxVVUPRSdzoITfRtVSMdKLERJFTxz18rgTptfx94cI13ayfgyfokRtZhn
 Of5CJGFkPRdu4BriuAocopguGY3fZyAwjKaHoqp3A6kx+7eQDZWahZWYBz0/2GOECjfy
 OPKy97GFGBsMMrcYcYLbm2svrqoKY1z3PtX3k3qtI0bbP3u3dNRiDSGtBAzOXF6EKgGM
 D/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718881799; x=1719486599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cK+L5yW/iH6P0lWxDbggvRxWvWuKB8/PuWfG3NK6lw4=;
 b=Aon5G5bQwXLZqsjMFamzea7YW/dldRfJdkwsLnpX5dC90mPEMTPLYB5kZrXvN0xTBv
 RKWhjCQIOwYeYQGyBEvtw9bVzEiXmyyF8A7wLdfBrrHqxAox9An4BRXrvMqJERZxkejR
 rhk3pAg/HtXE9QwqmyUlI0EzI4Z+t18QMgR1xtEVLFrD5ECto/34eRuw3YOG2b/XvgHc
 eG4S2R4x99YN7Drvamyf75dvapXP+XLs2ag7WbRzG2LcFO9fV4RSH8c1GthHKpXSGQSR
 1tiJxLg+rdjOXBWQYqd6vNI9Uts3SLkaxQ6n/X86ntGbJ7aoOr9HFJk0MNek1FlKQJDW
 aDxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsepDfZ/SQsxJnf9GForkU/O3UzYiMwKaji1I/nYVTSknRrXt2HQuhWcV64oSsSxcXH9WikBjIiqGtAaEObu2O9D8sYCGrCYvJ1XfCJltI
X-Gm-Message-State: AOJu0Yx40xJJ9crCoknS4aAopz9yARSL7kOehGJa703N0U/NCwCkCpzA
 tt/bFcMcO+Bztpu/Z3CjpVv7oE3ZVQ058OX3JE5XU8y3DplF1hu/4ZXL1FZd4w3M/0hYKpAZOC4
 xfmfa+2nfB5WetEwTzQRH2Phv57dszUxZ
X-Google-Smtp-Source: AGHT+IE2Umkt28Pp3QcmndSkXpPd7oUwur3JktUwb+heTFXIQZYiDY+vsSxXpapm4dZICG6tCQ8EGsanNS4K
X-Received: by 2002:a05:600c:33a9:b0:423:499:a1ef with SMTP id
 5b1f17b1804b1-42475297ad0mr42095755e9.27.1718881798837; 
 Thu, 20 Jun 2024 04:09:58 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d0b54f7sm2596235e9.3.2024.06.20.04.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:09:58 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3] drm/tests: Add tests for the new Monochrome value of
 tv_mode
Date: Thu, 20 Jun 2024 12:09:47 +0100
Message-Id: <20240620110947.3615207-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
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

This is v3 from the larger set in https://patchwork.freedesktop.org/series/130023/
as all patches except this one have been merged already.

V2->V3
- Don't change the TV_OPT_TEST macro, and add the new tests directly.
- drm_modes_analog_tv_tests in alphabetical order.

 .../gpu/drm/tests/drm_cmdline_parser_test.c   | 11 +++++++
 drivers/gpu/drm/tests/drm_connector_test.c    |  1 +
 drivers/gpu/drm/tests/drm_modes_test.c        | 31 +++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 6f1457bd21d9..59c8408c453c 100644
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
@@ -992,6 +992,17 @@ static const struct drm_cmdline_tv_option_test drm_cmdline_tv_option_tests[] = {
 	TV_OPT_TEST(PAL_M, "720x480i,tv_mode=PAL-M", drm_mode_analog_ntsc_480i),
 	TV_OPT_TEST(PAL_N, "720x576i,tv_mode=PAL-N", drm_mode_analog_pal_576i),
 	TV_OPT_TEST(SECAM, "720x576i,tv_mode=SECAM", drm_mode_analog_pal_576i),
+	{
+		.name = "MONO_525",
+		.cmdline = "720x480i,tv_mode=Mono",
+		.mode_fn = drm_mode_analog_ntsc_480i,
+		.tv_mode = DRM_MODE_TV_MODE_MONOCHROME,
+	}, {
+		.name = "MONO_625",
+		.cmdline = "720x576i,tv_mode=Mono",
+		.mode_fn = drm_mode_analog_pal_576i,
+		.tv_mode = DRM_MODE_TV_MODE_MONOCHROME,
+	},
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
index 7029f7a2eb4d..6ed51f99e133 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -130,7 +130,38 @@ static void drm_test_modes_analog_tv_pal_576i_inlined(struct kunit *test)
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
+	KUNIT_CASE(drm_test_modes_analog_tv_mono_576i),
 	KUNIT_CASE(drm_test_modes_analog_tv_ntsc_480i),
 	KUNIT_CASE(drm_test_modes_analog_tv_ntsc_480i_inlined),
 	KUNIT_CASE(drm_test_modes_analog_tv_pal_576i),
-- 
2.34.1

