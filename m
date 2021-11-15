Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7654503D5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35876E8E2;
	Mon, 15 Nov 2021 11:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443356E8CA;
 Mon, 15 Nov 2021 11:53:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="230886140"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="230886140"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:53:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="493993467"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:53:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: include intel-gtt.h only where needed
Date: Mon, 15 Nov 2021 13:53:11 +0200
Message-Id: <034f57db24d6936ac2e4e6830261d791240cdd79.1636977089.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1636977089.git.jani.nikula@intel.com>
References: <cover.1636977089.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only intel_gt.c and intel_ggtt.c need the interface.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 1 +
 drivers/gpu/drm/i915/gt/intel_gt.c   | 2 ++
 drivers/gpu/drm/i915/i915_drv.h      | 1 -
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 1fb4a03d7ac3..0c956e5e7fc7 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -9,6 +9,7 @@
 #include <asm/smp.h>
 
 #include <drm/i915_drm.h>
+#include <drm/intel-gtt.h>
 
 #include "gem/i915_gem_lmem.h"
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 1cb1948ac959..f2422d48be32 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/intel-gtt.h>
+
 #include "intel_gt_debugfs.h"
 
 #include "gem/i915_gem_lmem.h"
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 21ff781b8149..6f9f20a10c0c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -50,7 +50,6 @@
 #include <linux/stackdepot.h>
 #include <linux/xarray.h>
 
-#include <drm/intel-gtt.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_auth.h>
 #include <drm/drm_cache.h>
-- 
2.30.2

