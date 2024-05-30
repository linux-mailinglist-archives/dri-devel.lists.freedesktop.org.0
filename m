Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE18D4C78
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63430112021;
	Thu, 30 May 2024 13:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfR4B19w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE3410FEC6;
 Thu, 30 May 2024 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717075201; x=1748611201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J5HV41mo4w7qYv+3Al3FL2cyApBrk8R9E9ns9qtqMLE=;
 b=LfR4B19w3Tn9V4lq1D0YxhR549et7SwvsHTM1hR9rDPXHZ0fKxxUT0yx
 yHQQNRqQyhjZJ8pJVbHrKYuZU2iW2FWbR+Xij7sv9+DJZ7ce7Myip48PE
 xQGU3aoOWgycgdgyPpcyQfgZhJP97avxRerqm5KgsUP+qlcvEd/bDglDG
 wdfQVQ00s2nt3PHVt95b9GgKJonXvEEsB+DeGu6oyNCHjHzD1QJOVOF4V
 QE31a4JM0VhsJGqG04mxu2gQcSLGN4+11fbzlHNpY3T1dfRB1hMzXA6xG
 UD0DBLh35j37R5Br+Rr1GLAG9UTLdc8PkOsTS15tXZr86Qq8rsh5W1/Kx Q==;
X-CSE-ConnectionGUID: oD99hsGdR8el5jF7Z5KBPA==
X-CSE-MsgGUID: 56RlkNlfQ4e6JzfGmVe0sg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24678051"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24678051"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:20:00 -0700
X-CSE-ConnectionGUID: DKnTGSJrTKGsY6Xjgy52cg==
X-CSE-MsgGUID: hbWFiFIhSEiGUj5GdsNfMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="35884805"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 07/10] drm: move i915_pciids.h under include/drm/intel
Date: Thu, 30 May 2024 16:19:08 +0300
Message-Id: <a19cebc0f03588b9627dcaaebe69a9fef28c27f0.1717075103.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717075103.git.jani.nikula@intel.com>
References: <cover.1717075103.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up the top level include/drm directory by grouping all the Intel
specific files under a common subdirectory.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 arch/x86/kernel/early-quirks.c                      | 2 +-
 drivers/gpu/drm/i915/display/intel_display_device.c | 2 +-
 drivers/gpu/drm/i915/i915_pci.c                     | 2 +-
 drivers/gpu/drm/i915/intel_device_info.c            | 2 +-
 include/drm/{ => intel}/i915_pciids.h               | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename include/drm/{ => intel}/i915_pciids.h (100%)

diff --git a/arch/x86/kernel/early-quirks.c b/arch/x86/kernel/early-quirks.c
index ec1a7943c228..29d1f9104e94 100644
--- a/arch/x86/kernel/early-quirks.c
+++ b/arch/x86/kernel/early-quirks.c
@@ -18,7 +18,7 @@
 #include <linux/bcma/bcma_regs.h>
 #include <linux/platform_data/x86/apple.h>
 #include <drm/intel/i915_drm.h>
-#include <drm/i915_pciids.h>
+#include <drm/intel/i915_pciids.h>
 #include <asm/pci-direct.h>
 #include <asm/dma.h>
 #include <asm/io_apic.h>
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index cf093bc0cb28..11e6edc03358 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -3,7 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#include <drm/i915_pciids.h>
+#include <drm/intel/i915_pciids.h>
 #include <drm/drm_color_mgmt.h>
 #include <linux/pci.h>
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 84cd2f0343a2..ce4dfd65fafa 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -24,7 +24,7 @@
 
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
-#include <drm/i915_pciids.h>
+#include <drm/intel/i915_pciids.h>
 
 #include "display/intel_display.h"
 #include "display/intel_display_driver.h"
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 862f4b705227..d26de37719a7 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -25,7 +25,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_print.h>
-#include <drm/i915_pciids.h>
+#include <drm/intel/i915_pciids.h>
 
 #include "gt/intel_gt_regs.h"
 #include "i915_drv.h"
diff --git a/include/drm/i915_pciids.h b/include/drm/intel/i915_pciids.h
similarity index 100%
rename from include/drm/i915_pciids.h
rename to include/drm/intel/i915_pciids.h
-- 
2.39.2

