Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47B437019
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 04:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5026E52D;
	Fri, 22 Oct 2021 02:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E01A6E52D;
 Fri, 22 Oct 2021 02:40:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="252707256"
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="252707256"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 19:40:21 -0700
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="527768607"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 19:40:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>, <daniele.ceraolospurio@intel.com>,
 <john.c.harrison@intel.com>
Subject: [PATCH 1/2] drm/i915/selftests: Use correct selfest calls for live
 tests
Date: Thu, 21 Oct 2021 19:35:37 -0700
Message-Id: <20211022023538.20908-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211022023538.20908-1-matthew.brost@intel.com>
References: <20211022023538.20908-1-matthew.brost@intel.com>
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

This will help in an upcoming patch where the live selftest wrappers
are extended to do more.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c    | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c      | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c    | 2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c           | 2 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c              | 2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c           | 2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c               | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
index 13b088cc787e..a666d7e610f5 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
@@ -434,5 +434,5 @@ int i915_gem_coherency_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_gem_coherency),
 	};
 
-	return i915_subtests(tests, i915);
+	return i915_live_subtests(tests, i915);
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 4a6bb64c3a35..9f410941ce63 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -475,5 +475,5 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_dmabuf_import_same_driver_lmem_smem),
 	};
 
-	return i915_subtests(tests, i915);
+	return i915_live_subtests(tests, i915);
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 6d30cdfa80f3..ebac007c01c9 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -1430,5 +1430,5 @@ int i915_gem_mman_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_mmap_gpu),
 	};
 
-	return i915_subtests(tests, i915);
+	return i915_live_subtests(tests, i915);
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
index 740ee8086a27..ae1361c7c4cf 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
@@ -95,5 +95,5 @@ int i915_gem_object_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_gem_huge),
 	};
 
-	return i915_subtests(tests, i915);
+	return i915_live_subtests(tests, i915);
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 46f4236039a9..9ed01b538b05 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -2112,5 +2112,5 @@ int i915_gem_gtt_live_selftests(struct drm_i915_private *i915)
 
 	GEM_BUG_ON(offset_in_page(i915->ggtt.vm.total));
 
-	return i915_subtests(tests, i915);
+	return i915_live_subtests(tests, i915);
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
index 9e9a6cb1d9e5..86bad00cca95 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf.c
+++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
@@ -431,7 +431,7 @@ int i915_perf_live_selftests(struct drm_i915_private *i915)
 	if (err)
 		return err;
 
-	err = i915_subtests(tests, i915);
+	err = i915_live_subtests(tests, i915);
 
 	destroy_empty_config(&i915->perf);
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index d67710d10615..afbf88865a8b 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -1693,7 +1693,7 @@ int i915_request_live_selftests(struct drm_i915_private *i915)
 	if (intel_gt_is_wedged(&i915->gt))
 		return 0;
 
-	return i915_subtests(tests, i915);
+	return i915_live_subtests(tests, i915);
 }
 
 static int switch_to_kernel_sync(struct intel_context *ce, int err)
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 1f10fe36619b..5f0f4f872049 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -1085,5 +1085,5 @@ int i915_vma_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_vma_remapped_gtt),
 	};
 
-	return i915_subtests(tests, i915);
+	return i915_live_subtests(tests, i915);
 }
-- 
2.32.0

