Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD3D94A847
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9806D10E504;
	Wed,  7 Aug 2024 13:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnsGzn7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7BD10E09B;
 Wed,  7 Aug 2024 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723035971; x=1754571971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d54McKHxT5xAR3CP0HrjqmGUgIAJLFfzH5ksg97YQ5w=;
 b=ZnsGzn7keOv7yn1YhbSDXP6Lgu6Mf2Xpxh8mam3Io/MJ+f65fLqSjPL7
 LN2DG2DF68npgQOuhPyikHkyisWxtMhs7/j/y1fOkQeoZ1pQaU9K0siz+
 wd3cokwxVoav9XpSqZRFCQoutj8baVcoEkpySS0mM8yEz3UCHRZOP832x
 LdjYQ4o7nkrDy4BV/zwCEI6sbPagOiVU5n6Ivofa4xRso8lhcjD6bYHU3
 DqlYqiquhscAkepiTh/0zvo2CpxKj90BFRI4PrcMXPLA7qInVd121mhur
 fibnDdmD1WovkuZ2NW7SoFkF0h+AM7jySYBiPLNOO7EaFUp/Gii6mO5oi Q==;
X-CSE-ConnectionGUID: JvQHPD4ZTIKOBCUkaxxt6w==
X-CSE-MsgGUID: IwpcDDo8RBSnKk0J2tCiLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20979991"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="20979991"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:06:11 -0700
X-CSE-ConnectionGUID: ad7f2PX4RdGuOjQyJyVFPQ==
X-CSE-MsgGUID: ZVDV5I1VQZm+Rxok1gZmNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="61726587"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 intel.com) ([10.245.245.2])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:06:07 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH 1/2] drm/i915: Replace double blank with single blank after
 comma in gem/ and gt/
Date: Wed,  7 Aug 2024 14:05:15 +0100
Message-ID: <20240807130516.491053-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807130516.491053-1-andi.shyti@linux.intel.com>
References: <20240807130516.491053-1-andi.shyti@linux.intel.com>
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

Do not use double blanks, ",  " in function parameters where it's
not required by any alignment purpose. Replase it with a single
blank, ", ".

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h     | 2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c           | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c                | 2 +-
 drivers/gpu/drm/i915/selftests/intel_memory_region.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 1495b6074492..68413c05c812 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -535,7 +535,7 @@ struct drm_i915_gem_object {
 	 *   I915_CACHE_NONE. The only exception is userptr objects, where we
 	 *   instead force I915_CACHE_LLC, but we also don't allow userspace to
 	 *   ever change the @cache_level for such objects. Another special case
-	 *   is dma-buf, which doesn't rely on @cache_dirty,  but there we
+	 *   is dma-buf, which doesn't rely on @cache_dirty, but there we
 	 *   always do a forced flush when acquiring the pages, if there is a
 	 *   chance that the pages can be read directly from main memory with
 	 *   the GPU.
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 3eff364ccf3a..ca460cee4f8b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -336,7 +336,7 @@ static int clear(struct intel_migrate *migrate,
 
 			if (vaddr[x] != val) {
 				pr_err("%ps failed, (%u != %u), offset: %zu\n",
-				       fn, vaddr[x], val,  x * sizeof(u32));
+				       fn, vaddr[x], val, x * sizeof(u32));
 				igt_hexdump(vaddr + i * 1024, 4096);
 				err = -EINVAL;
 			}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 7a63abf8f644..5b8080ec5315 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -99,7 +99,7 @@ static void __confirm_options(struct intel_uc *uc)
 	}
 
 	if (!intel_uc_supports_guc(uc))
-		gt_info(gt,  "Incompatible option enable_guc=%d - %s\n",
+		gt_info(gt, "Incompatible option enable_guc=%d - %s\n",
 			i915->params.enable_guc, "GuC is not supported!");
 
 	if (i915->params.enable_guc & ENABLE_GUC_SUBMISSION &&
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index ae6070b5bf07..f08f6674911e 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -517,7 +517,7 @@ static int igt_mock_max_segment(void *arg)
 
 		if (!IS_ALIGNED(daddr, ps)) {
 			pr_err("%s: Created an unaligned scatterlist entry, addr=%pa, ps=%u\n",
-			       __func__,  &daddr, ps);
+			       __func__, &daddr, ps);
 			err = -EINVAL;
 			goto out_close;
 		}
-- 
2.45.2

