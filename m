Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5F789EF7C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC74910F7BB;
	Wed, 10 Apr 2024 10:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1jsvs9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C8410EA32;
 Wed, 10 Apr 2024 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743564; x=1744279564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oE6m4k6fw2ovbCGonnwUHHaFNIXRtdmEHq0iiCK39IU=;
 b=e1jsvs9Mf9UvW8AtLlKtpNvL8Zrurv4VgFFGKG49JaeUAeu1NBFx0ejg
 plE75IuRasMbZFzJgUItR92nKdNEhSOUai8UdhE7w8bD9FfKAOPbhLoew
 Jbrff99eKRNWt2M/vQNveOIhdPRLDXeyKU3/+lZGQzAK7wwkJTYncJYIF
 JTXMSrO5fjJEEWUxauQ4rYChzajPsx80dMUEdoslUD8p9pkztn+6zgNm6
 s0ZCoDlDAuymt7LlTKnBH8ivp0J/hxDk16Oc1Hcn11WQjFJgItMmOh+mJ
 r8Pr9tp71Kaughay4r7FKZbkRU9BmSKcpU5Ug46gdzdYGt1MgNH4sQjTE g==;
X-CSE-ConnectionGUID: co/K+BAqQfafxZ57ehYjgw==
X-CSE-MsgGUID: ZKFbk5EiT/2PorE3vRl0Ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18808949"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18808949"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:06:02 -0700
X-CSE-ConnectionGUID: NpK971YpQ36V9YICNPUFKw==
X-CSE-MsgGUID: 4FHN7mZUSLKjXS0WIS0u0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51735615"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 06/10] drm: move i915_drm.h under include/drm/intel
Date: Wed, 10 Apr 2024 13:05:13 +0300
Message-Id: <63e199dec91cc2e717d81ab00e28f68b9bec8461.1712743191.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
References: <cover.1712743191.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 arch/x86/kernel/early-quirks.c             | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c       | 2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c        | 2 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c      | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 2 +-
 drivers/platform/x86/intel_ips.c           | 2 +-
 include/drm/{ => intel}/i915_drm.h         | 0
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename include/drm/{ => intel}/i915_drm.h (100%)

diff --git a/arch/x86/kernel/early-quirks.c b/arch/x86/kernel/early-quirks.c
index 59f4aefc6bc1..5b867c02d2b5 100644
--- a/arch/x86/kernel/early-quirks.c
+++ b/arch/x86/kernel/early-quirks.c
@@ -17,7 +17,7 @@
 #include <linux/bcma/bcma.h>
 #include <linux/bcma/bcma_regs.h>
 #include <linux/platform_data/x86/apple.h>
-#include <drm/i915_drm.h>
+#include <drm/intel/i915_drm.h>
 #include <drm/i915_pciids.h>
 #include <asm/pci-direct.h>
 #include <asm/dma.h>
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index ad6dd7f3259b..30595b2b63e1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -8,7 +8,7 @@
 #include <linux/mutex.h>
 
 #include <drm/drm_mm.h>
-#include <drm/i915_drm.h>
+#include <drm/intel/i915_drm.h>
 
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 2717699c6591..206a5e0fedf1 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -9,7 +9,7 @@
 #include <linux/stop_machine.h>
 
 #include <drm/drm_managed.h>
-#include <drm/i915_drm.h>
+#include <drm/intel/i915_drm.h>
 #include <drm/intel/intel-gtt.h>
 
 #include "display/intel_display.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index c9cb2a391942..70176be269d3 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -5,7 +5,7 @@
 
 #include <linux/string_helpers.h>
 
-#include <drm/i915_drm.h>
+#include <drm/intel/i915_drm.h>
 
 #include "display/intel_display.h"
 #include "display/intel_display_irq.h"
diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915/soc/intel_gmch.c
index 40874ebfb64c..734e9f2801ea 100644
--- a/drivers/gpu/drm/i915/soc/intel_gmch.c
+++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
@@ -8,7 +8,7 @@
 #include <linux/vgaarb.h>
 
 #include <drm/drm_managed.h>
-#include <drm/i915_drm.h>
+#include <drm/intel/i915_drm.h>
 
 #include "i915_drv.h"
 #include "intel_gmch.h"
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ff2239c0eda5..7af1a48f3b59 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -9,7 +9,7 @@
 #include <linux/sizes.h>
 
 #include <drm/drm_managed.h>
-#include <drm/i915_drm.h>
+#include <drm/intel/i915_drm.h>
 
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_gtt_defs.h"
diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index ba38649cc142..2a88012958eb 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -59,7 +59,7 @@
 #include <linux/tick.h>
 #include <linux/timer.h>
 #include <linux/dmi.h>
-#include <drm/i915_drm.h>
+#include <drm/intel/i915_drm.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include "intel_ips.h"
diff --git a/include/drm/i915_drm.h b/include/drm/intel/i915_drm.h
similarity index 100%
rename from include/drm/i915_drm.h
rename to include/drm/intel/i915_drm.h
-- 
2.39.2

