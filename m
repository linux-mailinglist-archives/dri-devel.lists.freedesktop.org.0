Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD6989EF77
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B98F10EA35;
	Wed, 10 Apr 2024 10:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyYHpVyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699F610EA28;
 Wed, 10 Apr 2024 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743545; x=1744279545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tAUOeTYL7yJ0jEQBnNTdD9svt6spqItWTX8lYTcStHs=;
 b=HyYHpVypCSeruKgUR2yjftxxMd0E0hBx8M6d+mVQf21VGVQv7mtpVPJY
 XJrsQgTDXyq5KWpSpWsTbbwENYjQdBS8Ktewel341j7shQhPeifiSvkMP
 WmmsSDxpaVGyxdLxgG9DgpZvrFBMoYimlQqdvGCXm0ysLcKlUpZfwOJO4
 OfRSjrgxL2dHF4LHkx9e3PntmZwA0wj/Q5p1hnKVrhZCwoRroNZfUUK08
 msMmRU5/6cUKuhG54XsT8sruLJobp3YsP5T5IacCG5RT9ohzYYfKZLPny
 WnYlDp0vktoAN/sjv9XM/FAgsORqKsOXQIzYEfb2XA1RjEomYIJK/IFuQ w==;
X-CSE-ConnectionGUID: vgWYacQfT2G3qI9UnX8FDQ==
X-CSE-MsgGUID: uysam/DJQw6vvIA09xSvwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8320043"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8320043"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:44 -0700
X-CSE-ConnectionGUID: ok0b+yWiQ4meJvkykDyH5Q==
X-CSE-MsgGUID: juyCsUTWTrur+Qte1MbgAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20460982"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH 03/10] drm: move i915_gsc_proxy_mei_interface.h under
 include/drm/intel
Date: Wed, 10 Apr 2024 13:05:10 +0300
Message-Id: <63ebb7decdd99568bf8c3162be2e9fa88e3fc9de.1712743191.git.jani.nikula@intel.com>
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
index 35e397b68dfc..ea7b5ffb8954 100644
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

