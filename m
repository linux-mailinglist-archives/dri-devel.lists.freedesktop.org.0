Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293D297B3CB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 19:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8A010E4E2;
	Tue, 17 Sep 2024 17:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aivcRazB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0FE10E4DF;
 Tue, 17 Sep 2024 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595069; x=1758131069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0vodmgTDYnccO3IJrR3AprT9KinosMB1n7XorujWjsg=;
 b=aivcRazBOkCoSmjN1wfwatkTdKyo/dN5yrhjox722jrIyPXNKtslJknz
 Bo027FAQA1SOC4ESvZMhxyIKrP4Tcm2dAH9liPEnhn1J+VmKTRy0IlgHB
 ZAGhnyJSIaNPG8ke4rI5I9K6kaEcT/f6I+3q/XyAT/mENJ7iF4b24UgNf
 cUcLOjfMbp6edpgUxpddlr2Qu1unQnsxnJj4OPqZA3Uo1RgCzKZ4gCnNW
 p4vI90Jd7P3GfkIWV9F4+buDralNa+tzDC0lYaVkqYUp6JM67Uj0UMkmD
 N1fVhXozheei7EhIWrrDXL9GWrMM5/SOhYtNLlekf6H0BIr68dI2vOwaH g==;
X-CSE-ConnectionGUID: 65v3bDeuShSwpCOWKiOMgQ==
X-CSE-MsgGUID: FI4bgyCVTWa55J0TLwUKXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13561381"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13561381"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:44:29 -0700
X-CSE-ConnectionGUID: pbta1qYlRT2uZYAFDfIb7g==
X-CSE-MsgGUID: skGtcn61R/uwtMuM8DEe4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="100104525"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:44:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 2/2] Revert "drm/tests: Add test for drm_framebuffer_init()"
Date: Tue, 17 Sep 2024 20:43:52 +0300
Message-Id: <85689294b421bf48be5d412af7065a0e89aea73f.1726594684.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1726594684.git.jani.nikula@intel.com>
References: <cover.1726594684.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This reverts commit 2735d5e4060960c7bd06698b0a1990c7d42c762e.

This test hits a WARN_ON_ONCE(), because fb.format isn't set.

Fixes: 2735d5e40609 ("drm/tests: Add test for drm_framebuffer_init()")
Cc: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_framebuffer.c            |  1 -
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 84 --------------------
 2 files changed, 85 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 47e6e8577b62..9cd85ac789bb 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -839,7 +839,6 @@ void drm_framebuffer_free(struct kref *kref)
 
 	fb->funcs->destroy(fb);
 }
-EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_free);
 
 /**
  * drm_framebuffer_init - initialize a framebuffer
diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 72314805839d..e11b5bc9a105 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -5,7 +5,6 @@
  * Copyright (c) 2022 Maíra Canal <mairacanal@riseup.net>
  */
 
-#include <kunit/device.h>
 #include <kunit/test.h>
 
 #include <drm/drm_device.h>
@@ -569,93 +568,10 @@ static void drm_test_framebuffer_lookup_inexistent(struct kunit *test)
 	KUNIT_EXPECT_NULL(test, fb);
 }
 
-/*
- * Test if drm_framebuffer_init initializes the framebuffer successfully,
- * asserting that its modeset object struct and its refcount are correctly
- * set and that strictly one framebuffer is initialized.
- */
-static void drm_test_framebuffer_init(struct kunit *test)
-{
-	struct drm_framebuffer_test_priv *priv = test->priv;
-	struct drm_device *dev = &priv->dev;
-	struct drm_format_info format = { };
-	struct drm_framebuffer fb1 = { .dev = dev, .format = &format };
-	struct drm_framebuffer_funcs funcs = { };
-	int ret;
-
-	ret = drm_framebuffer_init(dev, &fb1, &funcs);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	/* Check if fb->funcs is actually set to the drm_framebuffer_funcs passed on */
-	KUNIT_EXPECT_PTR_EQ(test, fb1.funcs, &funcs);
-
-	/* The fb->comm must be set to the current running process */
-	KUNIT_EXPECT_STREQ(test, fb1.comm, current->comm);
-
-	/* The fb->base must be successfully initialized */
-	KUNIT_EXPECT_NE(test, fb1.base.id, 0);
-	KUNIT_EXPECT_EQ(test, fb1.base.type, DRM_MODE_OBJECT_FB);
-	KUNIT_EXPECT_EQ(test, kref_read(&fb1.base.refcount), 1);
-	KUNIT_EXPECT_PTR_EQ(test, fb1.base.free_cb, &drm_framebuffer_free);
-
-	/* There must be just that one fb initialized */
-	KUNIT_EXPECT_EQ(test, dev->mode_config.num_fb, 1);
-	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.prev, &fb1.head);
-	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.next, &fb1.head);
-
-	drm_framebuffer_cleanup(&fb1);
-}
-
-/* Try to init a framebuffer without setting its format */
-static void drm_test_framebuffer_init_bad_format(struct kunit *test)
-{
-	struct drm_framebuffer_test_priv *priv = test->priv;
-	struct drm_device *dev = &priv->dev;
-	struct drm_framebuffer fb1 = { .dev = dev, .format = NULL };
-	struct drm_framebuffer_funcs funcs = { };
-	int ret;
-
-	/* Fails if fb.format isn't set */
-	ret = drm_framebuffer_init(dev, &fb1, &funcs);
-	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
-}
-
-/*
- * Test calling drm_framebuffer_init() passing a framebuffer linked to a
- * different drm_device parent from the one passed on the first argument, which
- * must fail.
- */
-static void drm_test_framebuffer_init_dev_mismatch(struct kunit *test)
-{
-	struct drm_framebuffer_test_priv *priv = test->priv;
-	struct drm_device *right_dev = &priv->dev;
-	struct drm_device *wrong_dev;
-	struct device *wrong_dev_parent;
-	struct drm_format_info format = { };
-	struct drm_framebuffer fb1 = { .dev = right_dev, .format = &format };
-	struct drm_framebuffer_funcs funcs = { };
-	int ret;
-
-	wrong_dev_parent = kunit_device_register(test, "drm-kunit-wrong-device-mock");
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, wrong_dev_parent);
-
-	wrong_dev = __drm_kunit_helper_alloc_drm_device(test, wrong_dev_parent,
-							sizeof(struct drm_device),
-							0, 0);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, wrong_dev);
-
-	/* Fails if fb->dev doesn't point to the drm_device passed on first arg */
-	ret = drm_framebuffer_init(wrong_dev, &fb1, &funcs);
-	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
-}
-
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
-	KUNIT_CASE(drm_test_framebuffer_init),
-	KUNIT_CASE(drm_test_framebuffer_init_bad_format),
-	KUNIT_CASE(drm_test_framebuffer_init_dev_mismatch),
 	KUNIT_CASE(drm_test_framebuffer_lookup),
 	KUNIT_CASE(drm_test_framebuffer_lookup_inexistent),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
-- 
2.39.2

