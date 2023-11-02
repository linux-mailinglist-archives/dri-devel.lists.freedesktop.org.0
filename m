Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A087DEEF1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 10:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109A210E837;
	Thu,  2 Nov 2023 09:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D1B10E837;
 Thu,  2 Nov 2023 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698917576; x=1730453576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y5Uyg2N/ET8DhqTb9XyrwIlw4JDIiMJ7uWwCl1L4vJ0=;
 b=LN5Bnj25qhiwh1VF3pS/MGCDzRXcuXENbynLQOuNPV/qZ+RoVfUINUyk
 Z1Vc6bzmgnzIiyMjzVogKiCagZoDpLyd8Vf8chxT06g3kDj6ge2mcnF7l
 FXEt+rlDU4ztt9AtdmFLctIJX3zS6P45zFDA0a3PsqwgKfhtuO0SCTGWu
 /rgrsz/LJTUtZs1ubf4UXi8nCz/h2a5AMPs4As9JMX+BQR2bgF28Z0YSj
 KujwLiGg8rkCzSzY/plxiM06Iwy/hZLs6BesP8yk5JfXjeFnqeNp/puXr
 I6D8khDA5ipc/gjLSXfAUy6AaLQTLJs1GnVz0gckw6eFv8nr5sZIqSjyH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="385848224"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="385848224"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="754727052"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="754727052"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.30])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:32:54 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Remove unused for_each_uabi_class_engine
Date: Thu,  2 Nov 2023 09:32:47 +0000
Message-Id: <20231102093248.362659-1-tvrtko.ursulin@linux.intel.com>
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
Reviewed-by: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 259884b10d9a..bf6ed434bb6b 100644
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

