Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949478D4C67
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C82210EFFF;
	Thu, 30 May 2024 13:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQBuMBI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AC110F16D;
 Thu, 30 May 2024 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717075170; x=1748611170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IPpeaZDywOPbcdMo33H0ltYKp2nT4PZVGvtM2N/x7vA=;
 b=FQBuMBI/vxKastojXEMZlY8qEl142bSUjgqCGiTx+6F3aYo9WU3q2GyF
 4DZhINHxAOHnpM1vEqKM2IbI+g0hReuqt1QYmHCIZ/y7O0pTp2bxeXkRw
 Y8afKfqRYs02J4h/p0PDd07oDPw45EKXcqzxPPOit7nOlW10Acu3eQRSK
 6ksb2r1KWHoBIBEGUA+cadpzFvm0HC0iuZ4rAG1sv+JYM/1PXkBK9pbGl
 grnW7msITxp/Jq+lMoz3dlDGpOJlSQwD2K9kxFnXazt+ljhm3w/LUPdqC
 MJ6GoZIgfvttNNmvczuKEdtj2KRu6VCMRB37t4riCgf2GjSIkvDotlPie Q==;
X-CSE-ConnectionGUID: u02GX18tRk+K2JqmB4I7hg==
X-CSE-MsgGUID: Afc8IzPSQuaN1oafqlvplg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24168133"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24168133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:29 -0700
X-CSE-ConnectionGUID: dcxgJCpMReCMSJhbim2+6w==
X-CSE-MsgGUID: xxuuAtxpSLOeqw6oUCY4Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="66671539"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 02/10] drm: move i915_gsc_proxy_mei_interface.h under
 include/drm/intel
Date: Thu, 30 May 2024 16:19:03 +0300
Message-Id: <461662d528c3f327c81b764b7c883cd4519d8729.1717075103.git.jani.nikula@intel.com>
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
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c           | 2 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                      | 2 +-
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c             | 2 +-
 include/drm/{ => intel}/i915_gsc_proxy_mei_interface.h | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename include/drm/{ => intel}/i915_gsc_proxy_mei_interface.h (100%)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
index a7d5465655f9..e7619d81353c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
@@ -6,7 +6,7 @@
 #include <linux/component.h>
 
 #include <drm/i915_component.h>
-#include <drm/i915_gsc_proxy_mei_interface.h>
+#include <drm/intel/i915_gsc_proxy_mei_interface.h>
 
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_print.h"
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 6d6d1068cf23..cc3426fcfa89 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -10,7 +10,7 @@
 
 #include <drm/drm_managed.h>
 #include <drm/i915_component.h>
-#include <drm/i915_gsc_proxy_mei_interface.h>
+#include <drm/intel/i915_gsc_proxy_mei_interface.h>
 
 #include "abi/gsc_proxy_commands_abi.h"
 #include "regs/xe_gsc_regs.h"
diff --git a/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c b/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
index 89364bdbb129..d5fbaf5d0c8e 100644
--- a/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
+++ b/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
@@ -18,7 +18,7 @@
 #include <linux/uuid.h>
 #include <drm/drm_connector.h>
 #include <drm/i915_component.h>
-#include <drm/i915_gsc_proxy_mei_interface.h>
+#include <drm/intel/i915_gsc_proxy_mei_interface.h>
 
 /**
  * mei_gsc_proxy_send - Sends a proxy message to ME FW.
diff --git a/include/drm/i915_gsc_proxy_mei_interface.h b/include/drm/intel/i915_gsc_proxy_mei_interface.h
similarity index 100%
rename from include/drm/i915_gsc_proxy_mei_interface.h
rename to include/drm/intel/i915_gsc_proxy_mei_interface.h
-- 
2.39.2

