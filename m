Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C9EA7272C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D66710E797;
	Wed, 26 Mar 2025 23:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8GVMRIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8D610E797;
 Wed, 26 Mar 2025 23:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743032453; x=1774568453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V2hIantJs/ba1zTI8XaNyTzBKndiBQRmCbgC6UJbNUE=;
 b=k8GVMRIV72fEyIg3jLglNUJ/e2ycCzJydPFTrWDK5MQBvjc8nqpJQ3Yg
 gpwdCpNTzaQCct+kijvlC92/f13ojNBrw5Oo/wJRFoM3HwnPWQQl4K5JP
 J5ZaZvShfsMdqD0db2aNKOv9RkPuYdfGMK/RJs/UBbJCD0QYXHr8Ert5D
 a6mdh0wL5Uw7PN+cNds2y4F1vuZbizLNB85xwJDe3vnJrHd+Vdm9nPhkH
 OQQ4lhxicHls9VPDl0chzyeWkJjJv0TG8yx2vfCmnLOUqagTnTrk9bTx6
 qRa2gNr043LIPphSputWCC3n+Ld5+/1pG/PZqf0+EtJ6VJ7vb1NohNAd5 A==;
X-CSE-ConnectionGUID: +mbLaiT4Q7SnrN0g97ssVQ==
X-CSE-MsgGUID: hqLOTkZ0RMCfwvy/CznEZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44236851"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="44236851"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:53 -0700
X-CSE-ConnectionGUID: Z5NwH3EtToeJAUjTLLkGuQ==
X-CSE-MsgGUID: wUj3M/t8Q/iCjqnS78Bk0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="125146910"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.3])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:50 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Arshad Mehmood <arshad.mehmood@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 6/6] drm/i915/gt: Remove unused
 I915_ENGINE_FIRST_RENDER_COMPUTE flag
Date: Thu, 27 Mar 2025 00:40:05 +0100
Message-ID: <20250326234005.1574688-7-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
References: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
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

From: Andi Shyti <andi.shyti@intel.com>

The I915_ENGINE_FIRST_RENDER_COMPUTE flag is no longer used.
Its purpose has been replaced by the FIRST_CCS() helper, which
determines the first render or compute engine as needed.

Remove the flag definition and its assignment from
intel_engine_setup().

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 4 ----
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index b721bbd23356..1b60be057192 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -497,10 +497,6 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 	engine->logical_mask = BIT(logical_instance);
 	__sprint_engine_name(engine);
 
-	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
-	    __ffs(CCS_MASK(engine->gt) | RCS_MASK(engine->gt)) == engine->instance)
-		engine->flags |= I915_ENGINE_FIRST_RENDER_COMPUTE;
-
 	/* features common between engines sharing EUs */
 	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
 		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 155b6255a63e..c5529b966b7a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -590,8 +590,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_WANT_FORCED_PREEMPTION BIT(8)
 #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
 #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
-#define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
-#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(12)
+#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(11)
 	unsigned int flags;
 
 	/*
-- 
2.47.2

