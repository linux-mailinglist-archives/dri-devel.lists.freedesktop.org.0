Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3E7DDEDE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 11:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D8310E69C;
	Wed,  1 Nov 2023 10:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE8410E69C;
 Wed,  1 Nov 2023 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698832891; x=1730368891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FglxVv0+ILLFhiiZy7xXU+/1z3a0IsCWn59maXHNwzk=;
 b=BWSBnqNYL0uh1Ja0afgHLiGxNehYWo9tWtU+fqc6x/EVhbNchZ81EZCl
 WONfw1uSqU39+Y/xi/dyWYYYSF9uB/Hfx3bFS0Pvh4hL3EXSxcDHkMFou
 3bGjTEcfNkzDN6G+iDGJxiINpH5bBj/Fe/l9XD8IoUS5O1kn3+lP/As7R
 vrRdTwZbVfg1jYAQWYNdn2lvfPGedy67nkTdZznf591jHjtuKrjx5N742
 AwSXlMDh8Uj5/YZviRZLxbhcGXjH8ugGUjrulbvmpR1WDQHeFYv+85TgU
 oHMGCwdpujSYcPFiPx/dDq1D7EG9+g/9RQXd1s70g6QHxFLIy2zxZ9TQU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="452755525"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="452755525"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 03:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851532735"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="851532735"
Received: from cwilso3-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.231.239])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 03:01:30 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Remove unused for_each_uabi_class_engine
Date: Wed,  1 Nov 2023 10:01:24 +0000
Message-Id: <20231101100124.303739-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Unused macro after 99919be74aa3 ("drm/i915/gem: Zap the i915_gem_object_blt code")
removed some code.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index bfcbe93bd9fe..744c8c4a50fa 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -418,11 +418,6 @@ static inline struct intel_gt *to_gt(const struct drm_i915_private *i915)
 	     (engine__); \
 	     (engine__) = rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
 
-#define for_each_uabi_class_engine(engine__, class__, i915__) \
-	for ((engine__) = intel_engine_lookup_user((i915__), (class__), 0); \
-	     (engine__) && (engine__)->uabi_class == (class__); \
-	     (engine__) = rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
-
 #define INTEL_INFO(i915)	((i915)->__info)
 #define RUNTIME_INFO(i915)	(&(i915)->__runtime)
 #define DRIVER_CAPS(i915)	(&(i915)->caps)
-- 
2.39.2

