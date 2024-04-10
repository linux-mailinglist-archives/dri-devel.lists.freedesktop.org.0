Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C9989EF86
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0D810EA24;
	Wed, 10 Apr 2024 10:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0EgCkzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31EA10EA32;
 Wed, 10 Apr 2024 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743570; x=1744279570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zceLu27KX5mycpwBq7C7JSyU6Z7R7YwGkoFyQkqqkkw=;
 b=N0EgCkzgFuK9JCv+7VSgI6P6QJ/Qgb/IXymyRjqbvTUWeYRhU3c/CfSK
 sP3/fTy0C88+utrIlxY0HiwTPh9R9zgp8cw8XxWgoHFj/H2qKk0qv0Oa6
 z/ndeazN+liBJe2pMmbsUMbMcgBQFUL7tnlrJsTWDTiLCJmmBevmEVGCx
 qjkIAFB6abAF1JrvLVERRefNqBuTGtXLEhrlRcvnq/8Bz2kZR9c93+Dti
 i7vLdNjzHedWKQmjT6yzV1bQPjMuPYrAv1JaFG5op5MlvfeL7XlmV2BUi
 aUhTQiwaKVjkB+GOjVrWfpOatxlwLAoLRX5fKDn2FMoGkAU7rFE9Uioq/ A==;
X-CSE-ConnectionGUID: NSpDovzwT6ufQA69yXsDFQ==
X-CSE-MsgGUID: qp80G83NRFqso89PzIcRrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8320092"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8320092"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:06:10 -0700
X-CSE-ConnectionGUID: nD496gKnTkOo3oqplLfFEQ==
X-CSE-MsgGUID: bci8PQ4BQpCgI2iEXXTt1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20461024"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:06:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH 07/10] drm: move i915_pxp_tee_interface.h under
 include/drm/intel
Date: Wed, 10 Apr 2024 13:05:14 +0300
Message-Id: <e91e71bcefa861601e321213e317a1ac2afb2a3f.1712743191.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
References: <cover.1712743191.git.jani.nikula@intel.com>
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

Clean up the top level include/drm directory by grouping all the Intel
specific files under a common subdirectory.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c         | 2 +-
 drivers/misc/mei/pxp/mei_pxp.c                   | 2 +-
 include/drm/{ => intel}/i915_pxp_tee_interface.h | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename include/drm/{ => intel}/i915_pxp_tee_interface.h (100%)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 051b6cdcf721..1784153f0cf8 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -5,7 +5,7 @@
 
 #include <linux/component.h>
 
-#include <drm/i915_pxp_tee_interface.h>
+#include <drm/intel/i915_pxp_tee_interface.h>
 #include <drm/intel/i915_component.h>
 
 #include "gem/i915_gem_lmem.h"
diff --git a/drivers/misc/mei/pxp/mei_pxp.c b/drivers/misc/mei/pxp/mei_pxp.c
index 5a7a4d8b0e23..4268a868255f 100644
--- a/drivers/misc/mei/pxp/mei_pxp.c
+++ b/drivers/misc/mei/pxp/mei_pxp.c
@@ -20,7 +20,7 @@
 #include <linux/component.h>
 #include <drm/drm_connector.h>
 #include <drm/intel/i915_component.h>
-#include <drm/i915_pxp_tee_interface.h>
+#include <drm/intel/i915_pxp_tee_interface.h>
 
 #include "mei_pxp.h"
 
diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/intel/i915_pxp_tee_interface.h
similarity index 100%
rename from include/drm/i915_pxp_tee_interface.h
rename to include/drm/intel/i915_pxp_tee_interface.h
-- 
2.39.2

