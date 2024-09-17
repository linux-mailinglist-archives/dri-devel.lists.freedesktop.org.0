Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F697B3CA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 19:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F338F10E4E1;
	Tue, 17 Sep 2024 17:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+6Zhjfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9480010E4E1;
 Tue, 17 Sep 2024 17:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595069; x=1758131069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZITBU+hd+N2tDZbdlkKVjNI1DprnuVTxpMGjRD6oah4=;
 b=f+6Zhjfji8h8X0YNgtL2jWTdUsIxVlJ0+m5OQXuSLegXq7lUldCqihho
 HV4KDv9AluFAo/Tpv1+Ahf1YJgJu2miI5evWXo4RybK3LXxaTX58mYHcH
 uPeD0XQjuV61bZXKaKRk9WCczy6dVhgU50qJytzkd4is9JlVZNSL438od
 hjnFemkS3YOmqIw7Myaj84j34Ij4/sNlvW2EoLVCTC5JQ7uoD1FiI9xqO
 DoUdqWvB3g/Ak/4WvQpdrqUReUQL3s2LmAej2QBLBm5q+ATJFFnoqoRNK
 rCDn+V1KmVaIXVisSFs8vkF/SFkBrvw1C2M92BtdaFrFs/VSGExT8tByP Q==;
X-CSE-ConnectionGUID: Vx3ij5S/QJmCD9sCXacwuQ==
X-CSE-MsgGUID: IO7IjU6kRjqjbHHGFSyRhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13561372"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13561372"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:44:28 -0700
X-CSE-ConnectionGUID: 2Ih5vL1ZTMCoBhoaFhNSjg==
X-CSE-MsgGUID: OFV6ublHTzOCGOClAdh9TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="100104504"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:44:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 1/2] Revert "drm/tests: Add test for drm_framebuffer_free()"
Date: Tue, 17 Sep 2024 20:43:51 +0300
Message-Id: <d47a2a7dd325dfa6b514ad9faa9d40ff14d84065.1726594684.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1726594684.git.jani.nikula@intel.com>
References: <cover.1726594684.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This reverts commit d2194256049910d286cd6c308c2689df521d8842.

Intel CI consistently hits a WARN in drm_framebuffer_free() with this
test, because the fb->filp_head list is uninitialized.

Link: https://lore.kernel.org/r/87plp7ex27.fsf@intel.com
Fixes: d21942560499 ("drm/tests: Add test for drm_framebuffer_free()")
Cc: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_mode_object.c            |  1 -
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 50 --------------------
 2 files changed, 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index e943205a2394..df4cc0e8e263 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -81,7 +81,6 @@ int drm_mode_object_add(struct drm_device *dev,
 {
 	return __drm_mode_object_add(dev, obj, obj_type, true, NULL);
 }
-EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_mode_object_add);
 
 void drm_mode_object_register(struct drm_device *dev,
 			      struct drm_mode_object *obj)
diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 6ea04cc8f324..72314805839d 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -358,7 +358,6 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 struct drm_framebuffer_test_priv {
 	struct drm_device dev;
 	bool buffer_created;
-	bool buffer_freed;
 };
 
 static struct drm_framebuffer *fb_create_mock(struct drm_device *dev,
@@ -650,59 +649,10 @@ static void drm_test_framebuffer_init_dev_mismatch(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
 }
 
-static void destroy_free_mock(struct drm_framebuffer *fb)
-{
-	struct drm_framebuffer_test_priv *priv = container_of(fb->dev, typeof(*priv), dev);
-
-	priv->buffer_freed = true;
-}
-
-static struct drm_framebuffer_funcs framebuffer_funcs_free_mock = {
-	.destroy = destroy_free_mock,
-};
-
-/*
- * In summary, the drm_framebuffer_free() function must implicitly call
- * fb->funcs->destroy() and garantee that the framebufer object is unregistered
- * from the drm_device idr pool.
- */
-static void drm_test_framebuffer_free(struct kunit *test)
-{
-	struct drm_framebuffer_test_priv *priv = test->priv;
-	struct drm_device *dev = &priv->dev;
-	struct drm_mode_object *obj;
-	struct drm_framebuffer fb = {
-		.dev = dev,
-		.funcs = &framebuffer_funcs_free_mock,
-	};
-	int id, ret;
-
-	priv->buffer_freed = false;
-
-	/*
-	 * Mock	a framebuffer that was not unregistered	at the moment of the
-	 * drm_framebuffer_free() call.
-	 */
-	ret = drm_mode_object_add(dev, &fb.base, DRM_MODE_OBJECT_FB);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-	id = fb.base.id;
-
-	drm_framebuffer_free(&fb.base.refcount);
-
-	/* The framebuffer object must be unregistered */
-	obj = drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_FB);
-	KUNIT_EXPECT_PTR_EQ(test, obj, NULL);
-	KUNIT_EXPECT_EQ(test, fb.base.id, 0);
-
-	/* Test if fb->funcs->destroy() was called */
-	KUNIT_EXPECT_EQ(test, priv->buffer_freed, true);
-}
-
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
-	KUNIT_CASE(drm_test_framebuffer_free),
 	KUNIT_CASE(drm_test_framebuffer_init),
 	KUNIT_CASE(drm_test_framebuffer_init_bad_format),
 	KUNIT_CASE(drm_test_framebuffer_init_dev_mismatch),
-- 
2.39.2

