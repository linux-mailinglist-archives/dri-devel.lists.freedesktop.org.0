Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A314156C152
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B84D10E883;
	Fri,  8 Jul 2022 20:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E79310E856
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:31:56 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id n66so28390oia.11
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jXSAcCjSuTVSwifnWHkttE3RKSSgb83Wqfj3wPc0wrU=;
 b=y1urKzl9hlGlL2hsuZP/BCoSOOQW59H5pYHy1mrZSi4L63rlkDc7VhUiD/E/dWE398
 LECrM2wlgY7YcqCK+helnutrikd6/4VwQQPXhSmn1vvAq4oknXB1m8LIGfcMajZZTTj9
 KeXvnNGDrP9/Zo2dtY6pEn8hyVG12osaoXVxlY70qH3MFqSrWM8iM2TdsupCbWuoR81e
 qrC6499iXnk87ZODHo5cS1u5Dv+0QWOwJzvyLGCwrc6Tkj16oAbKo+Gp6AATZH0vev35
 WWVWg4rDjrytrsYJzg2S80tR9JHeU5iz67jhLCFIwzaadpSF7V2eR1leBKt8nLOJBXnf
 9LjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jXSAcCjSuTVSwifnWHkttE3RKSSgb83Wqfj3wPc0wrU=;
 b=08rvR4t0q/BodHwCZ3zq6NNOuOUlo6sWDBQzEvW3TOQ4xVS7FJWaXV7R1AVfm8wIZ3
 c4DI5mrf5gZq1LdybEw10Prren2VFurH97dSliZZE8p1f0OGY/bClv7W8j3xt70KIgrN
 FCCdFWMJsADfnBlQW/zXVO1hF5okxqSNRbIdb/+UsvZCTCBXWYwE+gLz6y3A7denPg5r
 bWMWLjNnyeGlWxbTILQRtBruCSPY1pP37wQrqRD/CCZbQ7e9qGo2632MgIU71vCO3GNI
 EoBq7OwTrUfZKTR5niwrPjMguMJ39fH+35elCVh68SqnaavYefQ+10Z9W5B83uj5VZd/
 Tz2g==
X-Gm-Message-State: AJIora+5Nkk6551txn4KiI632Hoko3GmAY70t1HCrZMFCKpFo21dwlG3
 vCSxBo2HMLYqrEGmOyjf7wmFNQ==
X-Google-Smtp-Source: AGRyM1u5AM+Y0DgDxIfbw4mbb1+UY2oUjfVjAJTQJRF03Sr1cDdc5nF7MkAb3W4C21DhBWnB7LOsQA==
X-Received: by 2002:a05:6808:192a:b0:335:3fd7:665f with SMTP id
 bf42-20020a056808192a00b003353fd7665fmr951552oib.164.1657312315569; 
 Fri, 08 Jul 2022 13:31:55 -0700 (PDT)
Received: from fedora.. ([143.107.182.242]) by smtp.gmail.com with ESMTPSA id
 ci10-20020a05683063ca00b0061c309b1dc2sm742225otb.39.2022.07.08.13.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 13:31:55 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 leandro.ribeiro@collabora.com, n@nfraprado.net,
 Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
Subject: [PATCH v5 4/9] drm: selftest: convert drm_format selftest to KUnit
Date: Fri,  8 Jul 2022 17:30:47 -0300
Message-Id: <20220708203052.236290-5-maira.canal@usp.br>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220708203052.236290-1-maira.canal@usp.br>
References: <20220708203052.236290-1-maira.canal@usp.br>
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Considering the current adoption of the KUnit framework, convert the
DRM format selftest to the KUnit API.

Tested-by: David Gow <davidgow@google.com>
Acked-by: Daniel Latypov <dlatypov@google.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/selftests/Makefile            |   3 +-
 .../gpu/drm/selftests/drm_modeset_selftests.h |   3 -
 drivers/gpu/drm/selftests/test-drm_format.c   | 280 -----------------
 .../drm/selftests/test-drm_modeset_common.h   |   3 -
 drivers/gpu/drm/tests/Makefile                |   2 +-
 drivers/gpu/drm/tests/drm_format_test.c       | 287 ++++++++++++++++++
 6 files changed, 289 insertions(+), 289 deletions(-)
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_format.c
 create mode 100644 drivers/gpu/drm/tests/drm_format_test.c

diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
index 8a794914e328..b7f252d886d0 100644
--- a/drivers/gpu/drm/selftests/Makefile
+++ b/drivers/gpu/drm/selftests/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 test-drm_modeset-y := test-drm_modeset_common.o test-drm_plane_helper.o \
-                      test-drm_format.o test-drm_framebuffer.o \
-		      test-drm_dp_mst_helper.o
+                      test-drm_framebuffer.o test-drm_dp_mst_helper.o
 
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o \
 				    test-drm_buddy.o
diff --git a/drivers/gpu/drm/selftests/drm_modeset_selftests.h b/drivers/gpu/drm/selftests/drm_modeset_selftests.h
index a3ca90307364..63061ef55eff 100644
--- a/drivers/gpu/drm/selftests/drm_modeset_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_modeset_selftests.h
@@ -7,9 +7,6 @@
  * Tests are executed in order by igt/drm_selftests_helper
  */
 selftest(check_plane_state, igt_check_plane_state)
-selftest(check_drm_format_block_width, igt_check_drm_format_block_width)
-selftest(check_drm_format_block_height, igt_check_drm_format_block_height)
-selftest(check_drm_format_min_pitch, igt_check_drm_format_min_pitch)
 selftest(check_drm_framebuffer_create, igt_check_drm_framebuffer_create)
 selftest(dp_mst_calc_pbn_mode, igt_dp_mst_calc_pbn_mode)
 selftest(dp_mst_sideband_msg_req_decode, igt_dp_mst_sideband_msg_req_decode)
diff --git a/drivers/gpu/drm/selftests/test-drm_format.c b/drivers/gpu/drm/selftests/test-drm_format.c
deleted file mode 100644
index c5e212afa27a..000000000000
--- a/drivers/gpu/drm/selftests/test-drm_format.c
+++ /dev/null
@@ -1,280 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Test cases for the drm_format functions
- */
-
-#define pr_fmt(fmt) "drm_format: " fmt
-
-#include <linux/errno.h>
-#include <linux/kernel.h>
-
-#include <drm/drm_fourcc.h>
-
-#include "test-drm_modeset_common.h"
-
-int igt_check_drm_format_block_width(void *ignored)
-{
-	const struct drm_format_info *info = NULL;
-
-	/* Test invalid arguments */
-	FAIL_ON(drm_format_info_block_width(info, 0) != 0);
-	FAIL_ON(drm_format_info_block_width(info, -1) != 0);
-	FAIL_ON(drm_format_info_block_width(info, 1) != 0);
-
-	/* Test 1 plane format */
-	info = drm_format_info(DRM_FORMAT_XRGB4444);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_block_width(info, 0) != 1);
-	FAIL_ON(drm_format_info_block_width(info, 1) != 0);
-	FAIL_ON(drm_format_info_block_width(info, -1) != 0);
-
-	/* Test 2 planes format */
-	info = drm_format_info(DRM_FORMAT_NV12);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_block_width(info, 0) != 1);
-	FAIL_ON(drm_format_info_block_width(info, 1) != 1);
-	FAIL_ON(drm_format_info_block_width(info, 2) != 0);
-	FAIL_ON(drm_format_info_block_width(info, -1) != 0);
-
-	/* Test 3 planes format */
-	info = drm_format_info(DRM_FORMAT_YUV422);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_block_width(info, 0) != 1);
-	FAIL_ON(drm_format_info_block_width(info, 1) != 1);
-	FAIL_ON(drm_format_info_block_width(info, 2) != 1);
-	FAIL_ON(drm_format_info_block_width(info, 3) != 0);
-	FAIL_ON(drm_format_info_block_width(info, -1) != 0);
-
-	/* Test a tiled format */
-	info = drm_format_info(DRM_FORMAT_X0L0);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_block_width(info, 0) != 2);
-	FAIL_ON(drm_format_info_block_width(info, 1) != 0);
-	FAIL_ON(drm_format_info_block_width(info, -1) != 0);
-
-	return 0;
-}
-
-int igt_check_drm_format_block_height(void *ignored)
-{
-	const struct drm_format_info *info = NULL;
-
-	/* Test invalid arguments */
-	FAIL_ON(drm_format_info_block_height(info, 0) != 0);
-	FAIL_ON(drm_format_info_block_height(info, -1) != 0);
-	FAIL_ON(drm_format_info_block_height(info, 1) != 0);
-
-	/* Test 1 plane format */
-	info = drm_format_info(DRM_FORMAT_XRGB4444);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_block_height(info, 0) != 1);
-	FAIL_ON(drm_format_info_block_height(info, 1) != 0);
-	FAIL_ON(drm_format_info_block_height(info, -1) != 0);
-
-	/* Test 2 planes format */
-	info = drm_format_info(DRM_FORMAT_NV12);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_block_height(info, 0) != 1);
-	FAIL_ON(drm_format_info_block_height(info, 1) != 1);
-	FAIL_ON(drm_format_info_block_height(info, 2) != 0);
-	FAIL_ON(drm_format_info_block_height(info, -1) != 0);
-
-	/* Test 3 planes format */
-	info = drm_format_info(DRM_FORMAT_YUV422);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_block_height(info, 0) != 1);
-	FAIL_ON(drm_format_info_block_height(info, 1) != 1);
-	FAIL_ON(drm_format_info_block_height(info, 2) != 1);
-	FAIL_ON(drm_format_info_block_height(info, 3) != 0);
-	FAIL_ON(drm_format_info_block_height(info, -1) != 0);
-
-	/* Test a tiled format */
-	info = drm_format_info(DRM_FORMAT_X0L0);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_block_height(info, 0) != 2);
-	FAIL_ON(drm_format_info_block_height(info, 1) != 0);
-	FAIL_ON(drm_format_info_block_height(info, -1) != 0);
-
-	return 0;
-}
-
-int igt_check_drm_format_min_pitch(void *ignored)
-{
-	const struct drm_format_info *info = NULL;
-
-	/* Test invalid arguments */
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, -1, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 0) != 0);
-
-	/* Test 1 plane 8 bits per pixel format */
-	info = drm_format_info(DRM_FORMAT_RGB332);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, -1, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 0) != 0);
-
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1) != 1);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 2) != 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 640) != 640);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1024) != 1024);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1920) != 1920);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 4096) != 4096);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 671) != 671);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, UINT_MAX) !=
-			(uint64_t)UINT_MAX);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)) !=
-			(uint64_t)(UINT_MAX - 1));
-
-	/* Test 1 plane 16 bits per pixel format */
-	info = drm_format_info(DRM_FORMAT_XRGB4444);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, -1, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 0) != 0);
-
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1) != 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 2) != 4);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 640) != 1280);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1024) != 2048);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1920) != 3840);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 4096) != 8192);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 671) != 1342);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, UINT_MAX) !=
-			(uint64_t)UINT_MAX * 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)) !=
-			(uint64_t)(UINT_MAX - 1) * 2);
-
-	/* Test 1 plane 24 bits per pixel format */
-	info = drm_format_info(DRM_FORMAT_RGB888);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, -1, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 0) != 0);
-
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1) != 3);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 2) != 6);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 640) != 1920);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1024) != 3072);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1920) != 5760);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 4096) != 12288);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 671) != 2013);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, UINT_MAX) !=
-			(uint64_t)UINT_MAX * 3);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, UINT_MAX - 1) !=
-			(uint64_t)(UINT_MAX - 1) * 3);
-
-	/* Test 1 plane 32 bits per pixel format */
-	info = drm_format_info(DRM_FORMAT_ABGR8888);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, -1, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 0) != 0);
-
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1) != 4);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 2) != 8);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 640) != 2560);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1024) != 4096);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1920) != 7680);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 4096) != 16384);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 671) != 2684);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, UINT_MAX) !=
-			(uint64_t)UINT_MAX * 4);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, UINT_MAX - 1) !=
-			(uint64_t)(UINT_MAX - 1) * 4);
-
-	/* Test 2 planes format */
-	info = drm_format_info(DRM_FORMAT_NV12);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, -1, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, 0) != 0);
-
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1) != 1);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 1) != 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 2) != 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 1) != 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 640) != 640);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 320) != 640);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1024) != 1024);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 512) != 1024);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1920) != 1920);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 960) != 1920);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 4096) != 4096);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 2048) != 4096);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 671) != 671);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 336) != 672);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, UINT_MAX) !=
-			(uint64_t)UINT_MAX);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, UINT_MAX / 2 + 1) !=
-			(uint64_t)UINT_MAX + 1);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)) !=
-			(uint64_t)(UINT_MAX - 1));
-	FAIL_ON(drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) /  2) !=
-			(uint64_t)(UINT_MAX - 1));
-
-	/* Test 3 planes 8 bits per pixel format */
-	info = drm_format_info(DRM_FORMAT_YUV422);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, -1, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 3, 0) != 0);
-
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1) != 1);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 1) != 1);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, 1) != 1);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 2) != 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 2) != 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, 2) != 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 640) != 640);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 320) != 320);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, 320) != 320);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1024) != 1024);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 512) != 512);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, 512) != 512);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1920) != 1920);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 960) != 960);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, 960) != 960);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 4096) != 4096);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 2048) != 2048);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, 2048) != 2048);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 671) != 671);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 336) != 336);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, 336) != 336);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, UINT_MAX) !=
-			(uint64_t)UINT_MAX);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, UINT_MAX / 2 + 1) !=
-			(uint64_t)UINT_MAX / 2 + 1);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, UINT_MAX / 2 + 1) !=
-			(uint64_t)UINT_MAX / 2 + 1);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, (UINT_MAX - 1) / 2) !=
-			(uint64_t)(UINT_MAX - 1) / 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) / 2) !=
-			(uint64_t)(UINT_MAX - 1) / 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 2, (UINT_MAX - 1) / 2) !=
-			(uint64_t)(UINT_MAX - 1) / 2);
-
-	/* Test tiled format */
-	info = drm_format_info(DRM_FORMAT_X0L2);
-	FAIL_ON(!info);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, -1, 0) != 0);
-	FAIL_ON(drm_format_info_min_pitch(info, 1, 0) != 0);
-
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1) != 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 2) != 4);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 640) != 1280);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1024) != 2048);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 1920) != 3840);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 4096) != 8192);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, 671) != 1342);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, UINT_MAX) !=
-			(uint64_t)UINT_MAX * 2);
-	FAIL_ON(drm_format_info_min_pitch(info, 0, UINT_MAX - 1) !=
-			(uint64_t)(UINT_MAX - 1) * 2);
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/selftests/test-drm_modeset_common.h b/drivers/gpu/drm/selftests/test-drm_modeset_common.h
index 42a10d7da51c..5709d967a5c4 100644
--- a/drivers/gpu/drm/selftests/test-drm_modeset_common.h
+++ b/drivers/gpu/drm/selftests/test-drm_modeset_common.h
@@ -17,9 +17,6 @@
 #define FAIL_ON(x) FAIL((x), "%s", "FAIL_ON(" __stringify(x) ")\n")
 
 int igt_check_plane_state(void *ignored);
-int igt_check_drm_format_block_width(void *ignored);
-int igt_check_drm_format_block_height(void *ignored);
-int igt_check_drm_format_min_pitch(void *ignored);
 int igt_check_drm_framebuffer_create(void *ignored);
 int igt_dp_mst_calc_pbn_mode(void *ignored);
 int igt_dp_mst_sideband_msg_req_decode(void *ignored);
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index f2eced30a955..1aa1627cb5e6 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_DRM_KUNIT_TEST) += drm_format_helper_test.o drm_damage_helper_test.o \
-	drm_cmdline_parser_test.o drm_rect_test.o
+	drm_cmdline_parser_test.o drm_rect_test.o drm_format_test.o
diff --git a/drivers/gpu/drm/tests/drm_format_test.c b/drivers/gpu/drm/tests/drm_format_test.c
new file mode 100644
index 000000000000..056cb8599d6d
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_format_test.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test cases for the drm_format functions
+ *
+ * Copyright (c) 2022 Maíra Canal <mairacanal@riseup.net>
+ */
+
+#include <kunit/test.h>
+
+#include <drm/drm_fourcc.h>
+
+static void igt_check_drm_format_block_width(struct kunit *test)
+{
+	const struct drm_format_info *info = NULL;
+
+	/* Test invalid arguments */
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 1));
+
+	/* Test 1 plane format */
+	info = drm_format_info(DRM_FORMAT_XRGB4444);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 1));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
+
+	/* Test 2 planes format */
+	info = drm_format_info(DRM_FORMAT_NV12);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 0));
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 1));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 2));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
+
+	/* Test 3 planes format */
+	info = drm_format_info(DRM_FORMAT_YUV422);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 0));
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 1));
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 2));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 3));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
+
+	/* Test a tiled format */
+	info = drm_format_info(DRM_FORMAT_X0L0);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 2);
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 1));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
+}
+
+static void igt_check_drm_format_block_height(struct kunit *test)
+{
+	const struct drm_format_info *info = NULL;
+
+	/* Test invalid arguments */
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 1));
+
+	/* Test 1 plane format */
+	info = drm_format_info(DRM_FORMAT_XRGB4444);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 1));
+
+	/* Test 2 planes format */
+	info = drm_format_info(DRM_FORMAT_NV12);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 0));
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 1));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 2));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
+
+	/* Test 3 planes format */
+	info = drm_format_info(DRM_FORMAT_YUV422);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 0));
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 1));
+	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 2));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 3));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
+
+	/* Test a tiled format */
+	info = drm_format_info(DRM_FORMAT_X0L0);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 2);
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 1));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
+}
+
+static void igt_check_drm_format_min_pitch(struct kunit *test)
+{
+	const struct drm_format_info *info = NULL;
+
+	/* Test invalid arguments */
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+
+	/* Test 1 plane 8 bits per pixel format */
+	info = drm_format_info(DRM_FORMAT_RGB332);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 640);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 1024);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 1920);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 4096);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 671);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
+			(uint64_t)UINT_MAX);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
+			(uint64_t)(UINT_MAX - 1));
+
+	/* Test 1 plane 16 bits per pixel format */
+	info = drm_format_info(DRM_FORMAT_XRGB4444);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 4);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 1280);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 2048);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 3840);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 8192);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 1342);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
+			(uint64_t)UINT_MAX * 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
+			(uint64_t)(UINT_MAX - 1) * 2);
+
+	/* Test 1 plane 24 bits per pixel format */
+	info = drm_format_info(DRM_FORMAT_RGB888);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 3);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 6);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 1920);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 3072);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 5760);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 12288);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2013);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
+			(uint64_t)UINT_MAX * 3);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
+			(uint64_t)(UINT_MAX - 1) * 3);
+
+	/* Test 1 plane 32 bits per pixel format */
+	info = drm_format_info(DRM_FORMAT_ABGR8888);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 4);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 8);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 2560);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 4096);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 7680);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 16384);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2684);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
+			(uint64_t)UINT_MAX * 4);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
+			(uint64_t)(UINT_MAX - 1) * 4);
+
+	/* Test 2 planes format */
+	info = drm_format_info(DRM_FORMAT_NV12);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 2, 0));
+
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 640);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 320), 640);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 1024);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 512), 1024);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 1920);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 960), 1920);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 4096);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 2048), 4096);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 671);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 336), 672);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
+			(uint64_t)UINT_MAX);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, UINT_MAX / 2 + 1),
+			(uint64_t)UINT_MAX + 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
+			(uint64_t)(UINT_MAX - 1));
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) /  2),
+			(uint64_t)(UINT_MAX - 1));
+
+	/* Test 3 planes 8 bits per pixel format */
+	info = drm_format_info(DRM_FORMAT_YUV422);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 2, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 3, 0));
+
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 1), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 2), 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 2), 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 640);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 320), 320);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 320), 320);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 1024);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 512), 512);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 512), 512);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 1920);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 960), 960);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 960), 960);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 4096);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 2048), 2048);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 2048), 2048);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 671);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 336), 336);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 336), 336);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
+			(uint64_t)UINT_MAX);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, UINT_MAX / 2 + 1),
+			(uint64_t)UINT_MAX / 2 + 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, UINT_MAX / 2 + 1),
+			(uint64_t)UINT_MAX / 2 + 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1) / 2),
+			(uint64_t)(UINT_MAX - 1) / 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) / 2),
+			(uint64_t)(UINT_MAX - 1) / 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, (UINT_MAX - 1) / 2),
+			(uint64_t)(UINT_MAX - 1) / 2);
+
+	/* Test tiled format */
+	info = drm_format_info(DRM_FORMAT_X0L2);
+	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
+	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 4);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 1280);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 2048);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 3840);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 8192);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 1342);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
+			(uint64_t)UINT_MAX * 2);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX - 1),
+			(uint64_t)(UINT_MAX - 1) * 2);
+}
+
+static struct kunit_case drm_format_tests[] = {
+	KUNIT_CASE(igt_check_drm_format_block_width),
+	KUNIT_CASE(igt_check_drm_format_block_height),
+	KUNIT_CASE(igt_check_drm_format_min_pitch),
+	{ }
+};
+
+static struct kunit_suite drm_format_test_suite = {
+	.name = "drm_format",
+	.test_cases = drm_format_tests,
+};
+
+kunit_test_suite(drm_format_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.35.3

