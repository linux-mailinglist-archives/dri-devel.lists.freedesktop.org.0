Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B055D560E33
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 02:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3809310F185;
	Thu, 30 Jun 2022 00:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0759F10F179
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 00:48:32 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id i126so3494870oih.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 17:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZoHHf750ikPW+XZEf2iSWFtT8HR0uz3SV2yHLq8NkM8=;
 b=CIGF+4fRbZHHvHzzQRWCETt9wHl+8aY7KGOLBg2L5Eftan6zy58uPfKuYvHzs8Mt2A
 /F/5dgzp4rxQHN7XStvYMZgiH0H7KkyRNwee2AITOTkDDe/1Jg+2uHRr7AzSkMlDFQrt
 7pFTyypnuF5qpQ5Xcn7WtEs11p2OAsJxsRPHyWHX8h28MGaTi5iFcAaNGqEZQMZCVSt0
 xUXcd1hTKAdp+wsENLImL425vbuADHNqtc0gljaaShASaa/fUCxMf7j3Nd16co15LAwc
 QmafJK3qeBgaVUeFfn4N/ntLEJui4CyLeVuTV9iXnfDmw2czZZHfzOneiOgJvsCrlMpM
 qCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZoHHf750ikPW+XZEf2iSWFtT8HR0uz3SV2yHLq8NkM8=;
 b=tbhO2SgGzbomu/ekG5jd0HxB1sTQKLQpHJQ+tzNuapzFbdGY7pczFTnJ0SXpXA3Rpy
 h7ZTeOAUFksiYBiuGpITAGidDgUTwP9Xe6JEI9uBK7AwN9CepcGDMJ2s0F7gPPnodtgh
 Ahy2SMMM8gXT0TXm/MiOpFKfB0Bxh/+khPXTaZSRBmY+2P1eXdrVO+TqEBZ+npwmwaS9
 SoZMWdYoEwvfeFwLeYZwXecWIBTnNeoMFmFP7bh1hWPkvzAWJxOa3QN9TYdyz4IyyAjW
 NgUFLIwO/5ECrP1rGn2svpTL6ilbMi1UlTiPVk/ZZYmksQ4PPbX8eWvxXlXJnrInaH0K
 H5+g==
X-Gm-Message-State: AJIora8YJHL2wGbCrmMxpwYJ/XI255bxi9mz+FbJr+p2r/Wny+HEMtOh
 QpJOZblF+SBQtyWUTS9mKRwt6Q==
X-Google-Smtp-Source: AGRyM1sRA71NEVOE7V30f6aO9lSpxmwsHJQ6KEQ7dfu8GomweVcLZeNUr1w6/REumFEKENW3v10D8Q==
X-Received: by 2002:a05:6808:118a:b0:322:35d7:77f2 with SMTP id
 j10-20020a056808118a00b0032235d777f2mr5211373oil.79.1656550111951; 
 Wed, 29 Jun 2022 17:48:31 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056808210a00b00325cda1ff8esm9432250oiw.13.2022.06.29.17.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 17:48:31 -0700 (PDT)
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
Subject: [PATCH v3 1/9] drm: selftest: convert drm_damage_helper selftest to
 KUnit
Date: Wed, 29 Jun 2022 21:46:03 -0300
Message-Id: <20220630004611.114441-2-maira.canal@usp.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630004611.114441-1-maira.canal@usp.br>
References: <20220630004611.114441-1-maira.canal@usp.br>
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
Cc: Arthur Grillo <arthur.grillo@usp.br>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Considering the current adoption of the KUnit framework, convert the
DRM damage helper selftest to the KUnit API.

Acked-by: Daniel Latypov <dlatypov@google.com>
Tested-by: David Gow <davidgow@google.com>
Co-developed-by: Arthur Grillo <arthur.grillo@usp.br>
Signed-off-by: Arthur Grillo <arthur.grillo@usp.br>
Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/Kconfig                       |   8 +-
 drivers/gpu/drm/selftests/Makefile            |   3 +-
 .../gpu/drm/selftests/drm_modeset_selftests.h |  21 -
 .../drm/selftests/test-drm_damage_helper.c    | 668 ------------------
 .../drm/selftests/test-drm_modeset_common.h   |  21 -
 drivers/gpu/drm/tests/Makefile                |   2 +-
 .../gpu/drm/tests/drm_damage_helper_test.c    | 634 +++++++++++++++++
 7 files changed, 643 insertions(+), 714 deletions(-)
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_damage_helper.c
 create mode 100644 drivers/gpu/drm/tests/drm_damage_helper_test.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 6c2256e8474b..06822ecf51c6 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -72,8 +72,14 @@ config DRM_DEBUG_SELFTEST
 
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
-	depends on DRM && KUNIT=y
+	depends on DRM && KUNIT
+	select PRIME_NUMBERS
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_LIB_RANDOM
 	select DRM_KMS_HELPER
+	select DRM_BUDDY
+	select DRM_EXPORT_FOR_TESTS if m
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for DRM. This option is not useful for
diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
index 5ba5f9138c95..7a1a732e0a1b 100644
--- a/drivers/gpu/drm/selftests/Makefile
+++ b/drivers/gpu/drm/selftests/Makefile
@@ -1,8 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 test-drm_modeset-y := test-drm_modeset_common.o test-drm_plane_helper.o \
                       test-drm_format.o test-drm_framebuffer.o \
-		      test-drm_damage_helper.o test-drm_dp_mst_helper.o \
-		      test-drm_rect.o
+		      test-drm_dp_mst_helper.o test-drm_rect.o
 
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o \
 				    test-drm_buddy.o
diff --git a/drivers/gpu/drm/selftests/drm_modeset_selftests.h b/drivers/gpu/drm/selftests/drm_modeset_selftests.h
index 782e285ca383..4787b3b70709 100644
--- a/drivers/gpu/drm/selftests/drm_modeset_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_modeset_selftests.h
@@ -15,26 +15,5 @@ selftest(check_drm_format_block_width, igt_check_drm_format_block_width)
 selftest(check_drm_format_block_height, igt_check_drm_format_block_height)
 selftest(check_drm_format_min_pitch, igt_check_drm_format_min_pitch)
 selftest(check_drm_framebuffer_create, igt_check_drm_framebuffer_create)
-selftest(damage_iter_no_damage, igt_damage_iter_no_damage)
-selftest(damage_iter_no_damage_fractional_src, igt_damage_iter_no_damage_fractional_src)
-selftest(damage_iter_no_damage_src_moved, igt_damage_iter_no_damage_src_moved)
-selftest(damage_iter_no_damage_fractional_src_moved, igt_damage_iter_no_damage_fractional_src_moved)
-selftest(damage_iter_no_damage_not_visible, igt_damage_iter_no_damage_not_visible)
-selftest(damage_iter_no_damage_no_crtc, igt_damage_iter_no_damage_no_crtc)
-selftest(damage_iter_no_damage_no_fb, igt_damage_iter_no_damage_no_fb)
-selftest(damage_iter_simple_damage, igt_damage_iter_simple_damage)
-selftest(damage_iter_single_damage, igt_damage_iter_single_damage)
-selftest(damage_iter_single_damage_intersect_src, igt_damage_iter_single_damage_intersect_src)
-selftest(damage_iter_single_damage_outside_src, igt_damage_iter_single_damage_outside_src)
-selftest(damage_iter_single_damage_fractional_src, igt_damage_iter_single_damage_fractional_src)
-selftest(damage_iter_single_damage_intersect_fractional_src, igt_damage_iter_single_damage_intersect_fractional_src)
-selftest(damage_iter_single_damage_outside_fractional_src, igt_damage_iter_single_damage_outside_fractional_src)
-selftest(damage_iter_single_damage_src_moved, igt_damage_iter_single_damage_src_moved)
-selftest(damage_iter_single_damage_fractional_src_moved, igt_damage_iter_single_damage_fractional_src_moved)
-selftest(damage_iter_damage, igt_damage_iter_damage)
-selftest(damage_iter_damage_one_intersect, igt_damage_iter_damage_one_intersect)
-selftest(damage_iter_damage_one_outside, igt_damage_iter_damage_one_outside)
-selftest(damage_iter_damage_src_moved, igt_damage_iter_damage_src_moved)
-selftest(damage_iter_damage_not_visible, igt_damage_iter_damage_not_visible)
 selftest(dp_mst_calc_pbn_mode, igt_dp_mst_calc_pbn_mode)
 selftest(dp_mst_sideband_msg_req_decode, igt_dp_mst_sideband_msg_req_decode)
diff --git a/drivers/gpu/drm/selftests/test-drm_damage_helper.c b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
deleted file mode 100644
index 816e1464a98f..000000000000
--- a/drivers/gpu/drm/selftests/test-drm_damage_helper.c
+++ /dev/null
@@ -1,668 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Test case for drm_damage_helper functions
- */
-
-#define pr_fmt(fmt) "drm_damage_helper: " fmt
-
-#include <drm/drm_damage_helper.h>
-#include <drm/drm_framebuffer.h>
-#include <drm/drm_plane.h>
-#include <drm/drm_drv.h>
-
-#include "test-drm_modeset_common.h"
-
-struct drm_driver mock_driver;
-static struct drm_device mock_device;
-static struct drm_object_properties mock_obj_props;
-static struct drm_plane mock_plane;
-static struct drm_property mock_prop;
-
-static void mock_setup(struct drm_plane_state *state)
-{
-	static bool setup_done = false;
-
-	state->plane = &mock_plane;
-
-	if (setup_done)
-		return;
-
-	/* just enough so that drm_plane_enable_fb_damage_clips() works */
-	mock_device.driver = &mock_driver;
-	mock_device.mode_config.prop_fb_damage_clips = &mock_prop;
-	mock_plane.dev = &mock_device;
-	mock_obj_props.count = 0;
-	mock_plane.base.properties = &mock_obj_props;
-	mock_prop.base.id = 1; /* 0 is an invalid id */
-	mock_prop.dev = &mock_device;
-
-	drm_plane_enable_fb_damage_clips(&mock_plane);
-}
-
-static void set_plane_src(struct drm_plane_state *state, int x1, int y1, int x2,
-			  int y2)
-{
-	state->src.x1 = x1;
-	state->src.y1 = y1;
-	state->src.x2 = x2;
-	state->src.y2 = y2;
-}
-
-static void set_damage_clip(struct drm_mode_rect *r, int x1, int y1, int x2,
-			    int y2)
-{
-	r->x1 = x1;
-	r->y1 = y1;
-	r->x2 = x2;
-	r->y2 = y2;
-}
-
-static void set_damage_blob(struct drm_property_blob *damage_blob,
-			    struct drm_mode_rect *r, uint32_t size)
-{
-	damage_blob->length = size;
-	damage_blob->data = r;
-}
-
-static void set_plane_damage(struct drm_plane_state *state,
-			     struct drm_property_blob *damage_blob)
-{
-	state->fb_damage_clips = damage_blob;
-}
-
-static bool check_damage_clip(struct drm_plane_state *state, struct drm_rect *r,
-			      int x1, int y1, int x2, int y2)
-{
-	/*
-	 * Round down x1/y1 and round up x2/y2. This is because damage is not in
-	 * 16.16 fixed point so to catch all pixels.
-	 */
-	int src_x1 = state->src.x1 >> 16;
-	int src_y1 = state->src.y1 >> 16;
-	int src_x2 = (state->src.x2 >> 16) + !!(state->src.x2 & 0xFFFF);
-	int src_y2 = (state->src.y2 >> 16) + !!(state->src.y2 & 0xFFFF);
-
-	if (x1 >= x2 || y1 >= y2) {
-		pr_err("Cannot have damage clip with no dimension.\n");
-		return false;
-	}
-
-	if (x1 < src_x1 || y1 < src_y1 || x2 > src_x2 || y2 > src_y2) {
-		pr_err("Damage cannot be outside rounded plane src.\n");
-		return false;
-	}
-
-	if (r->x1 != x1 || r->y1 != y1 || r->x2 != x2 || r->y2 != y2) {
-		pr_err("Damage = %d %d %d %d\n", r->x1, r->y1, r->x2, r->y2);
-		return false;
-	}
-
-	return true;
-}
-
-const struct drm_framebuffer fb = {
-	.width = 2048,
-	.height = 2048
-};
-
-/* common mocked structs many tests need */
-#define MOCK_VARIABLES() \
-	struct drm_plane_state old_state; \
-	struct drm_plane_state state = { \
-		.crtc = ZERO_SIZE_PTR, \
-		.fb = (struct drm_framebuffer *) &fb, \
-		.visible = true, \
-	}; \
-	mock_setup(&old_state); \
-	mock_setup(&state);
-
-int igt_damage_iter_no_damage(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	/* Plane src same as fb size. */
-	set_plane_src(&old_state, 0, 0, fb.width << 16, fb.height << 16);
-	set_plane_src(&state, 0, 0, fb.width << 16, fb.height << 16);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return plane src as damage.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 0, 0, 2048, 2048));
-
-	return 0;
-}
-
-int igt_damage_iter_no_damage_fractional_src(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	/* Plane src has fractional part. */
-	set_plane_src(&old_state, 0x3fffe, 0x3fffe,
-		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
-	set_plane_src(&state, 0x3fffe, 0x3fffe,
-		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return rounded off plane src as damage.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 3, 3, 1028, 772));
-
-	return 0;
-}
-
-int igt_damage_iter_no_damage_src_moved(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	/* Plane src moved since old plane state. */
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 10 << 16, 10 << 16,
-		      (10 + 1024) << 16, (10 + 768) << 16);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return plane src as damage.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 10, 10, 1034, 778));
-
-	return 0;
-}
-
-int igt_damage_iter_no_damage_fractional_src_moved(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	/* Plane src has fractional part and it moved since old plane state. */
-	set_plane_src(&old_state, 0x3fffe, 0x3fffe,
-		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
-	set_plane_src(&state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return plane src as damage.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 4, 4, 1029, 773));
-
-	return 0;
-}
-
-int igt_damage_iter_no_damage_not_visible(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	state.visible = false;
-
-	mock_setup(&old_state);
-
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 0, "Should have no damage.");
-
-	return 0;
-}
-
-int igt_damage_iter_no_damage_no_crtc(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	state.crtc = NULL;
-
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 0, "Should have no damage.");
-
-	return 0;
-}
-
-int igt_damage_iter_no_damage_no_fb(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_plane_state old_state;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	struct drm_plane_state state = {
-		.crtc = ZERO_SIZE_PTR,
-		.fb = 0,
-	};
-
-	mock_setup(&old_state);
-
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 0, "Should have no damage.");
-
-	return 0;
-}
-
-int igt_damage_iter_simple_damage(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
-	/* Damage set to plane src */
-	set_damage_clip(&damage, 0, 0, 1024, 768);
-	set_damage_blob(&damage_blob, &damage, sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return damage when set.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 0, 0, 1024, 768));
-
-	return 0;
-}
-
-int igt_damage_iter_single_damage(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
-	set_damage_clip(&damage, 256, 192, 768, 576);
-	set_damage_blob(&damage_blob, &damage, sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return damage when set.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 256, 192, 768, 576));
-
-	return 0;
-}
-
-int igt_damage_iter_single_damage_intersect_src(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
-	/* Damage intersect with plane src. */
-	set_damage_clip(&damage, 256, 192, 1360, 768);
-	set_damage_blob(&damage_blob, &damage, sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return damage clipped to src.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 256, 192, 1024, 768));
-
-	return 0;
-}
-
-int igt_damage_iter_single_damage_outside_src(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
-	/* Damage clip outside plane src */
-	set_damage_clip(&damage, 1360, 1360, 1380, 1380);
-	set_damage_blob(&damage_blob, &damage, sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 0, "Should have no damage.");
-
-	return 0;
-}
-
-int igt_damage_iter_single_damage_fractional_src(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	/* Plane src has fractional part. */
-	set_plane_src(&old_state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	set_plane_src(&state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	set_damage_clip(&damage, 10, 10, 256, 330);
-	set_damage_blob(&damage_blob, &damage, sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return damage when set.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 10, 10, 256, 330));
-
-	return 0;
-}
-
-int igt_damage_iter_single_damage_intersect_fractional_src(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	/* Plane src has fractional part. */
-	set_plane_src(&old_state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	set_plane_src(&state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	/* Damage intersect with plane src. */
-	set_damage_clip(&damage, 10, 1, 1360, 330);
-	set_damage_blob(&damage_blob, &damage, sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return damage clipped to rounded off src.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 10, 4, 1029, 330));
-
-	return 0;
-}
-
-int igt_damage_iter_single_damage_outside_fractional_src(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	/* Plane src has fractional part. */
-	set_plane_src(&old_state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	set_plane_src(&state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	/* Damage clip outside plane src */
-	set_damage_clip(&damage, 1360, 1360, 1380, 1380);
-	set_damage_blob(&damage_blob, &damage, sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 0, "Should have no damage.");
-
-	return 0;
-}
-
-int igt_damage_iter_single_damage_src_moved(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	/* Plane src moved since old plane state. */
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 10 << 16, 10 << 16,
-		      (10 + 1024) << 16, (10 + 768) << 16);
-	set_damage_clip(&damage, 20, 30, 256, 256);
-	set_damage_blob(&damage_blob, &damage, sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return plane src as damage.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 10, 10, 1034, 778));
-
-	return 0;
-}
-
-int igt_damage_iter_single_damage_fractional_src_moved(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage;
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	/* Plane src with fractional part moved since old plane state. */
-	set_plane_src(&old_state, 0x3fffe, 0x3fffe,
-		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
-	set_plane_src(&state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	/* Damage intersect with plane src. */
-	set_damage_clip(&damage, 20, 30, 1360, 256);
-	set_damage_blob(&damage_blob, &damage, sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return rounded off plane src as damage.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 4, 4, 1029, 773));
-
-	return 0;
-}
-
-int igt_damage_iter_damage(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage[2];
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
-	/* 2 damage clips. */
-	set_damage_clip(&damage[0], 20, 30, 200, 180);
-	set_damage_clip(&damage[1], 240, 200, 280, 250);
-	set_damage_blob(&damage_blob, &damage[0], sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip) {
-		if (num_hits == 0)
-			FAIL_ON(!check_damage_clip(&state, &clip, 20, 30, 200, 180));
-		if (num_hits == 1)
-			FAIL_ON(!check_damage_clip(&state, &clip, 240, 200, 280, 250));
-		num_hits++;
-	}
-
-	FAIL(num_hits != 2, "Should return damage when set.");
-
-	return 0;
-}
-
-int igt_damage_iter_damage_one_intersect(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage[2];
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	set_plane_src(&old_state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	set_plane_src(&state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	/* 2 damage clips, one intersect plane src. */
-	set_damage_clip(&damage[0], 20, 30, 200, 180);
-	set_damage_clip(&damage[1], 2, 2, 1360, 1360);
-	set_damage_blob(&damage_blob, &damage[0], sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip) {
-		if (num_hits == 0)
-			FAIL_ON(!check_damage_clip(&state, &clip, 20, 30, 200, 180));
-		if (num_hits == 1)
-			FAIL_ON(!check_damage_clip(&state, &clip, 4, 4, 1029, 773));
-		num_hits++;
-	}
-
-	FAIL(num_hits != 2, "Should return damage when set.");
-
-	return 0;
-}
-
-int igt_damage_iter_damage_one_outside(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage[2];
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
-	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
-	/* 2 damage clips, one outside plane src. */
-	set_damage_clip(&damage[0], 1360, 1360, 1380, 1380);
-	set_damage_clip(&damage[1], 240, 200, 280, 250);
-	set_damage_blob(&damage_blob, &damage[0], sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return damage when set.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 240, 200, 280, 250));
-
-	return 0;
-}
-
-int igt_damage_iter_damage_src_moved(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage[2];
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	set_plane_src(&old_state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	set_plane_src(&state, 0x3fffe, 0x3fffe,
-		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
-	/* 2 damage clips, one outside plane src. */
-	set_damage_clip(&damage[0], 1360, 1360, 1380, 1380);
-	set_damage_clip(&damage[1], 240, 200, 280, 250);
-	set_damage_blob(&damage_blob, &damage[0], sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 1, "Should return round off plane src as damage.");
-	FAIL_ON(!check_damage_clip(&state, &clip, 3, 3, 1028, 772));
-
-	return 0;
-}
-
-int igt_damage_iter_damage_not_visible(void *ignored)
-{
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_property_blob damage_blob;
-	struct drm_mode_rect damage[2];
-	struct drm_rect clip;
-	uint32_t num_hits = 0;
-
-	MOCK_VARIABLES();
-
-	state.visible = false;
-
-	set_plane_src(&old_state, 0x40002, 0x40002,
-		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
-	set_plane_src(&state, 0x3fffe, 0x3fffe,
-		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
-	/* 2 damage clips, one outside plane src. */
-	set_damage_clip(&damage[0], 1360, 1360, 1380, 1380);
-	set_damage_clip(&damage[1], 240, 200, 280, 250);
-	set_damage_blob(&damage_blob, &damage[0], sizeof(damage));
-	set_plane_damage(&state, &damage_blob);
-	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
-	drm_atomic_for_each_plane_damage(&iter, &clip)
-		num_hits++;
-
-	FAIL(num_hits != 0, "Should not return any damage.");
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/selftests/test-drm_modeset_common.h b/drivers/gpu/drm/selftests/test-drm_modeset_common.h
index cfb51d8da2bc..c29354e59cec 100644
--- a/drivers/gpu/drm/selftests/test-drm_modeset_common.h
+++ b/drivers/gpu/drm/selftests/test-drm_modeset_common.h
@@ -25,27 +25,6 @@ int igt_check_drm_format_block_width(void *ignored);
 int igt_check_drm_format_block_height(void *ignored);
 int igt_check_drm_format_min_pitch(void *ignored);
 int igt_check_drm_framebuffer_create(void *ignored);
-int igt_damage_iter_no_damage(void *ignored);
-int igt_damage_iter_no_damage_fractional_src(void *ignored);
-int igt_damage_iter_no_damage_src_moved(void *ignored);
-int igt_damage_iter_no_damage_fractional_src_moved(void *ignored);
-int igt_damage_iter_no_damage_not_visible(void *ignored);
-int igt_damage_iter_no_damage_no_crtc(void *ignored);
-int igt_damage_iter_no_damage_no_fb(void *ignored);
-int igt_damage_iter_simple_damage(void *ignored);
-int igt_damage_iter_single_damage(void *ignored);
-int igt_damage_iter_single_damage_intersect_src(void *ignored);
-int igt_damage_iter_single_damage_outside_src(void *ignored);
-int igt_damage_iter_single_damage_fractional_src(void *ignored);
-int igt_damage_iter_single_damage_intersect_fractional_src(void *ignored);
-int igt_damage_iter_single_damage_outside_fractional_src(void *ignored);
-int igt_damage_iter_single_damage_src_moved(void *ignored);
-int igt_damage_iter_single_damage_fractional_src_moved(void *ignored);
-int igt_damage_iter_damage(void *ignored);
-int igt_damage_iter_damage_one_intersect(void *ignored);
-int igt_damage_iter_damage_one_outside(void *ignored);
-int igt_damage_iter_damage_src_moved(void *ignored);
-int igt_damage_iter_damage_not_visible(void *ignored);
 int igt_dp_mst_calc_pbn_mode(void *ignored);
 int igt_dp_mst_sideband_msg_req_decode(void *ignored);
 
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 2c8273796d9d..2f399e03d50c 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_DRM_KUNIT_TEST) += drm_format_helper_test.o
+obj-$(CONFIG_DRM_KUNIT_TEST) += drm_format_helper_test.o drm_damage_helper_test.o
diff --git a/drivers/gpu/drm/tests/drm_damage_helper_test.c b/drivers/gpu/drm/tests/drm_damage_helper_test.c
new file mode 100644
index 000000000000..6d03079baf70
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_damage_helper_test.c
@@ -0,0 +1,634 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test case for drm_damage_helper functions
+ */
+
+#include <kunit/test.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_drv.h>
+
+struct drm_damage_mock {
+	struct drm_driver driver;
+	struct drm_device device;
+	struct drm_object_properties obj_props;
+	struct drm_plane plane;
+	struct drm_property prop;
+	struct drm_framebuffer fb;
+	struct drm_plane_state state;
+	struct drm_plane_state old_state;
+};
+
+static int drm_damage_helper_init(struct kunit *test)
+{
+	struct drm_damage_mock *mock;
+
+	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
+
+	mock->fb.width = 2048;
+	mock->fb.height = 2048;
+
+	mock->state.crtc = ZERO_SIZE_PTR;
+	mock->state.fb = &mock->fb;
+	mock->state.visible = true;
+
+	mock->old_state.plane = &mock->plane;
+	mock->state.plane = &mock->plane;
+
+	/* just enough so that drm_plane_enable_fb_damage_clips() works */
+	mock->device.driver = &mock->driver;
+	mock->device.mode_config.prop_fb_damage_clips = &mock->prop;
+	mock->plane.dev = &mock->device;
+	mock->obj_props.count = 0;
+	mock->plane.base.properties = &mock->obj_props;
+	mock->prop.base.id = 1; /* 0 is an invalid id */
+	mock->prop.dev = &mock->device;
+
+	drm_plane_enable_fb_damage_clips(&mock->plane);
+
+	test->priv = mock;
+
+	return 0;
+}
+
+static void set_plane_src(struct drm_plane_state *state, int x1, int y1, int x2,
+			  int y2)
+{
+	state->src.x1 = x1;
+	state->src.y1 = y1;
+	state->src.x2 = x2;
+	state->src.y2 = y2;
+}
+
+static void set_damage_clip(struct drm_mode_rect *r, int x1, int y1, int x2,
+			    int y2)
+{
+	r->x1 = x1;
+	r->y1 = y1;
+	r->x2 = x2;
+	r->y2 = y2;
+}
+
+static void set_damage_blob(struct drm_property_blob *damage_blob,
+			    struct drm_mode_rect *r, uint32_t size)
+{
+	damage_blob->length = size;
+	damage_blob->data = r;
+}
+
+static void set_plane_damage(struct drm_plane_state *state,
+			     struct drm_property_blob *damage_blob)
+{
+	state->fb_damage_clips = damage_blob;
+}
+
+static void check_damage_clip(struct kunit *test, struct drm_rect *r,
+		int x1, int y1, int x2, int y2)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_plane_state state = mock->state;
+
+	/*
+	 * Round down x1/y1 and round up x2/y2. This is because damage is not in
+	 * 16.16 fixed point so to catch all pixels.
+	 */
+	int src_x1 = state.src.x1 >> 16;
+	int src_y1 = state.src.y1 >> 16;
+	int src_x2 = (state.src.x2 >> 16) + !!(state.src.x2 & 0xFFFF);
+	int src_y2 = (state.src.y2 >> 16) + !!(state.src.y2 & 0xFFFF);
+
+	if (x1 >= x2 || y1 >= y2)
+		KUNIT_FAIL(test, "Cannot have damage clip with no dimension.");
+	if (x1 < src_x1 || y1 < src_y1 || x2 > src_x2 || y2 > src_y2)
+		KUNIT_FAIL(test, "Damage cannot be outside rounded plane src.");
+	if (r->x1 != x1 || r->y1 != y1 || r->x2 != x2 || r->y2 != y2)
+		KUNIT_FAIL(test, "Damage = %d %d %d %d, want = %d %d %d %d",
+				r->x1, r->y1, r->x2, r->y2, x1, y1, x2, y2);
+}
+
+static void igt_damage_iter_no_damage(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	/* Plane src same as fb size. */
+	set_plane_src(&mock->old_state, 0, 0, mock->fb.width << 16, mock->fb.height << 16);
+	set_plane_src(&mock->state, 0, 0, mock->fb.width << 16, mock->fb.height << 16);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1, "Should return plane src as damage.");
+	check_damage_clip(test, &clip, 0, 0, 2048, 2048);
+}
+
+static void igt_damage_iter_no_damage_fractional_src(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	/* Plane src has fractional part. */
+	set_plane_src(&mock->old_state, 0x3fffe, 0x3fffe,
+		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
+	set_plane_src(&mock->state, 0x3fffe, 0x3fffe,
+		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1,
+			"Should return rounded off plane src as damage.");
+	check_damage_clip(test, &clip, 3, 3, 1028, 772);
+}
+
+static void igt_damage_iter_no_damage_src_moved(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	/* Plane src moved since old plane state. */
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 10 << 16, 10 << 16,
+		      (10 + 1024) << 16, (10 + 768) << 16);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1, "Should return plane src as damage.");
+	check_damage_clip(test, &clip, 10, 10, 1034, 778);
+}
+
+static void igt_damage_iter_no_damage_fractional_src_moved(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	/* Plane src has fractional part and it moved since old plane state. */
+	set_plane_src(&mock->old_state, 0x3fffe, 0x3fffe,
+		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
+	set_plane_src(&mock->state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1, "Should return plane src as damage.");
+	check_damage_clip(test, &clip, 4, 4, 1029, 773);
+}
+
+static void igt_damage_iter_no_damage_not_visible(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	mock->state.visible = false;
+
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 0, 0, 1024 << 16, 768 << 16);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 0, "Should have no damage.");
+}
+
+static void igt_damage_iter_no_damage_no_crtc(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	mock->state.crtc = NULL;
+
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 0, 0, 1024 << 16, 768 << 16);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 0, "Should have no damage.");
+}
+
+static void igt_damage_iter_no_damage_no_fb(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	mock->state.fb = NULL;
+
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 0, 0, 1024 << 16, 768 << 16);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 0, "Should have no damage.");
+}
+
+static void igt_damage_iter_simple_damage(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 0, 0, 1024 << 16, 768 << 16);
+	/* Damage set to plane src */
+	set_damage_clip(&damage, 0, 0, 1024, 768);
+	set_damage_blob(&damage_blob, &damage, sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1, "Should return damage when set.");
+	check_damage_clip(test, &clip, 0, 0, 1024, 768);
+}
+
+static void igt_damage_iter_single_damage(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 0, 0, 1024 << 16, 768 << 16);
+	set_damage_clip(&damage, 256, 192, 768, 576);
+	set_damage_blob(&damage_blob, &damage, sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1, "Should return damage when set.");
+	check_damage_clip(test, &clip, 256, 192, 768, 576);
+}
+
+static void igt_damage_iter_single_damage_intersect_src(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 0, 0, 1024 << 16, 768 << 16);
+	/* Damage intersect with plane src. */
+	set_damage_clip(&damage, 256, 192, 1360, 768);
+	set_damage_blob(&damage_blob, &damage, sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1, "Should return damage clipped to src.");
+	check_damage_clip(test, &clip, 256, 192, 1024, 768);
+}
+
+static void igt_damage_iter_single_damage_outside_src(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 0, 0, 1024 << 16, 768 << 16);
+	/* Damage clip outside plane src */
+	set_damage_clip(&damage, 1360, 1360, 1380, 1380);
+	set_damage_blob(&damage_blob, &damage, sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 0, "Should have no damage.");
+}
+
+static void igt_damage_iter_single_damage_fractional_src(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	/* Plane src has fractional part. */
+	set_plane_src(&mock->old_state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	set_plane_src(&mock->state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	set_damage_clip(&damage, 10, 10, 256, 330);
+	set_damage_blob(&damage_blob, &damage, sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1, "Should return damage when set.");
+	check_damage_clip(test, &clip, 10, 10, 256, 330);
+}
+
+static void igt_damage_iter_single_damage_intersect_fractional_src(
+		struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	/* Plane src has fractional part. */
+	set_plane_src(&mock->old_state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	set_plane_src(&mock->state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	/* Damage intersect with plane src. */
+	set_damage_clip(&damage, 10, 1, 1360, 330);
+	set_damage_blob(&damage_blob, &damage, sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1,
+			"Should return damage clipped to rounded off src.");
+	check_damage_clip(test, &clip, 10, 4, 1029, 330);
+}
+
+static void igt_damage_iter_single_damage_outside_fractional_src(
+		struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	/* Plane src has fractional part. */
+	set_plane_src(&mock->old_state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	set_plane_src(&mock->state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	/* Damage clip outside plane src */
+	set_damage_clip(&damage, 1360, 1360, 1380, 1380);
+	set_damage_blob(&damage_blob, &damage, sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 0, "Should have no damage.");
+}
+
+static void igt_damage_iter_single_damage_src_moved(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	/* Plane src moved since old plane state. */
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 10 << 16, 10 << 16,
+		      (10 + 1024) << 16, (10 + 768) << 16);
+	set_damage_clip(&damage, 20, 30, 256, 256);
+	set_damage_blob(&damage_blob, &damage, sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1,
+			"Should return plane src as damage.");
+	check_damage_clip(test, &clip, 10, 10, 1034, 778);
+}
+
+static void igt_damage_iter_single_damage_fractional_src_moved(
+		struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage;
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	/* Plane src with fractional part moved since old plane state. */
+	set_plane_src(&mock->old_state, 0x3fffe, 0x3fffe,
+		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
+	set_plane_src(&mock->state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	/* Damage intersect with plane src. */
+	set_damage_clip(&damage, 20, 30, 1360, 256);
+	set_damage_blob(&damage_blob, &damage, sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1,
+			"Should return rounded off plane as damage.");
+	check_damage_clip(test, &clip, 4, 4, 1029, 773);
+}
+
+static void igt_damage_iter_damage(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage[2];
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 0, 0, 1024 << 16, 768 << 16);
+	/* 2 damage clips. */
+	set_damage_clip(&damage[0], 20, 30, 200, 180);
+	set_damage_clip(&damage[1], 240, 200, 280, 250);
+	set_damage_blob(&damage_blob, &damage[0], sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip) {
+		if (num_hits == 0)
+			check_damage_clip(test, &clip, 20, 30, 200, 180);
+		if (num_hits == 1)
+			check_damage_clip(test, &clip, 240, 200, 280, 250);
+		num_hits++;
+	}
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 2, "Should return damage when set.");
+}
+
+static void igt_damage_iter_damage_one_intersect(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage[2];
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	set_plane_src(&mock->old_state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	set_plane_src(&mock->state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	/* 2 damage clips, one intersect plane src. */
+	set_damage_clip(&damage[0], 20, 30, 200, 180);
+	set_damage_clip(&damage[1], 2, 2, 1360, 1360);
+	set_damage_blob(&damage_blob, &damage[0], sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip) {
+		if (num_hits == 0)
+			check_damage_clip(test, &clip, 20, 30, 200, 180);
+		if (num_hits == 1)
+			check_damage_clip(test, &clip, 4, 4, 1029, 773);
+		num_hits++;
+	}
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 2, "Should return damage when set.");
+}
+
+static void igt_damage_iter_damage_one_outside(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage[2];
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	set_plane_src(&mock->old_state, 0, 0, 1024 << 16, 768 << 16);
+	set_plane_src(&mock->state, 0, 0, 1024 << 16, 768 << 16);
+	/* 2 damage clips, one outside plane src. */
+	set_damage_clip(&damage[0], 1360, 1360, 1380, 1380);
+	set_damage_clip(&damage[1], 240, 200, 280, 250);
+	set_damage_blob(&damage_blob, &damage[0], sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1, "Should return damage when set.");
+	check_damage_clip(test, &clip, 240, 200, 280, 250);
+}
+
+static void igt_damage_iter_damage_src_moved(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage[2];
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	set_plane_src(&mock->old_state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	set_plane_src(&mock->state, 0x3fffe, 0x3fffe,
+		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
+	/* 2 damage clips, one outside plane src. */
+	set_damage_clip(&damage[0], 1360, 1360, 1380, 1380);
+	set_damage_clip(&damage[1], 240, 200, 280, 250);
+	set_damage_blob(&damage_blob, &damage[0], sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 1,
+			"Should return round off plane src as damage.");
+	check_damage_clip(test, &clip, 3, 3, 1028, 772);
+}
+
+static void igt_damage_iter_damage_not_visible(struct kunit *test)
+{
+	struct drm_damage_mock *mock = test->priv;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_property_blob damage_blob;
+	struct drm_mode_rect damage[2];
+	struct drm_rect clip;
+	uint32_t num_hits = 0;
+
+	mock->state.visible = false;
+
+	set_plane_src(&mock->old_state, 0x40002, 0x40002,
+		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
+	set_plane_src(&mock->state, 0x3fffe, 0x3fffe,
+		      0x3fffe + (1024 << 16), 0x3fffe + (768 << 16));
+	/* 2 damage clips, one outside plane src. */
+	set_damage_clip(&damage[0], 1360, 1360, 1380, 1380);
+	set_damage_clip(&damage[1], 240, 200, 280, 250);
+	set_damage_blob(&damage_blob, &damage[0], sizeof(damage));
+	set_plane_damage(&mock->state, &damage_blob);
+	drm_atomic_helper_damage_iter_init(&iter, &mock->old_state, &mock->state);
+	drm_atomic_for_each_plane_damage(&iter, &clip)
+		num_hits++;
+
+	KUNIT_EXPECT_EQ_MSG(test, num_hits, 0, "Should not return any damage.");
+}
+
+static struct kunit_case drm_damage_helper_tests[] = {
+	KUNIT_CASE(igt_damage_iter_no_damage),
+	KUNIT_CASE(igt_damage_iter_no_damage_fractional_src),
+	KUNIT_CASE(igt_damage_iter_no_damage_src_moved),
+	KUNIT_CASE(igt_damage_iter_no_damage_fractional_src_moved),
+	KUNIT_CASE(igt_damage_iter_no_damage_not_visible),
+	KUNIT_CASE(igt_damage_iter_no_damage_no_crtc),
+	KUNIT_CASE(igt_damage_iter_no_damage_no_fb),
+	KUNIT_CASE(igt_damage_iter_simple_damage),
+	KUNIT_CASE(igt_damage_iter_single_damage),
+	KUNIT_CASE(igt_damage_iter_single_damage_intersect_src),
+	KUNIT_CASE(igt_damage_iter_single_damage_outside_src),
+	KUNIT_CASE(igt_damage_iter_single_damage_fractional_src),
+	KUNIT_CASE(igt_damage_iter_single_damage_intersect_fractional_src),
+	KUNIT_CASE(igt_damage_iter_single_damage_outside_fractional_src),
+	KUNIT_CASE(igt_damage_iter_single_damage_src_moved),
+	KUNIT_CASE(igt_damage_iter_single_damage_fractional_src_moved),
+	KUNIT_CASE(igt_damage_iter_damage),
+	KUNIT_CASE(igt_damage_iter_damage_one_intersect),
+	KUNIT_CASE(igt_damage_iter_damage_one_outside),
+	KUNIT_CASE(igt_damage_iter_damage_src_moved),
+	KUNIT_CASE(igt_damage_iter_damage_not_visible),
+	{ }
+};
+
+static struct kunit_suite drm_damage_helper_test_suite = {
+	.name = "drm_damage_helper",
+	.init = drm_damage_helper_init,
+	.test_cases = drm_damage_helper_tests,
+};
+
+kunit_test_suite(drm_damage_helper_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.36.1

