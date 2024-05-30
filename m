Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A318D4C6F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50A910F97B;
	Thu, 30 May 2024 13:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rvg93kaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D2311217E;
 Thu, 30 May 2024 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717075197; x=1748611197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BwowBzSpm/4PJjjUCFjLkOz3Z6BzAvw5N/aPiE9IlwU=;
 b=Rvg93kaR08QhmXWog1VANiKDiJTPmIZtZtazI40vhscM/Dqq3rY5+uKf
 Kaozc3pumiDeSRWIHoAoVGVyIx8uVGXYFqcuUdscOWJU2/7IR5Fp8HYUQ
 B292KWvtT6G+nxVlKkIH9PveSLq8L1QGQywtNV9yUj4fkIMA3HwOMho29
 Jeo3m/bTSJenPy4gZXsDUzbXZOu/OM6C+YUngX7sDnMkIoAQ8ObOUltKL
 G3KFT5rrlQxlupbRvEgjqZVoIFFgpY9uKHZ15l2m1EcaubM5pvpBUNBPb
 fFMRNwQJ7O+bzrrDKntD3Tv3xqPrvkI4+eIMJzj4/8l6US+uc7YSLmcCV A==;
X-CSE-ConnectionGUID: Kov+/NffSby5kTMeKt9Ljg==
X-CSE-MsgGUID: H/jKCjz0RzOHyrlqoEtpTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24678045"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24678045"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:56 -0700
X-CSE-ConnectionGUID: PRP2qVfuTpWo7Wl1DF3XPg==
X-CSE-MsgGUID: bneYBkgJRLKCkvpLvilV0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="35884802"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 06/10] drm: move i915_pxp_tee_interface.h under
 include/drm/intel
Date: Thu, 30 May 2024 16:19:07 +0300
Message-Id: <5c1626978d2552ef5732dcf9427c903046afb9c1.1717075103.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717075103.git.jani.nikula@intel.com>
References: <cover.1717075103.git.jani.nikula@intel.com>
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
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
index ed88d6df4397..2820d389c88e 100644
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

