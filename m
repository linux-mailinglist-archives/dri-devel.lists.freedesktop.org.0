Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A589EF81
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E3C112B48;
	Wed, 10 Apr 2024 10:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTqq+ACY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94990113288;
 Wed, 10 Apr 2024 10:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743575; x=1744279575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=POvhEB8t0WFy4nylAwlrruFpDkkoF+yFUljeDXXjvvs=;
 b=hTqq+ACYd3hZrEgcFQSHNB970LB0M+0R4AmVkVHr54pjvWkzFY+88nUQ
 bLgnwnQifDLmEmGYt6DzOWWPA88kFmT+FQo9Xcar//cjbdIQtMT5tI4UZ
 dhb1de6wwRiZr7gtHAXIJv2Pi7y9QBL3rHFH26V5JidvuDyBztFJl5wKt
 Et/M5/1sYJwF8o4+WwBgmjlCh52FJkx06N7pnhcgRsXuoQ1v/bZJCdkaf
 gw0tB3GTOU2fO8JJ0p2AR9T6GbRJhBFObYGb+HuGEATgLW+2ohOSeuqRT
 qkVqXs2ckb1ObYT7352e7wxVbWe4yoTDLhCHw0xedqpiSzpaBbXl6uzeF Q==;
X-CSE-ConnectionGUID: BXK6g0h6Sl6EtJQs/NWsDA==
X-CSE-MsgGUID: 51PdHwINTv6QtY6ughQnbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11888332"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11888332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:06:15 -0700
X-CSE-ConnectionGUID: 828wEhnrQJKOq+bQ1BnWZg==
X-CSE-MsgGUID: VgheGFgMRouN0Yu/LadwLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25195110"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:06:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 08/10] drm: move i915_pciids.h under include/drm/intel
Date: Wed, 10 Apr 2024 13:05:15 +0300
Message-Id: <949c8dc81d825b29a4adc6a4f46751f89ae7a831.1712743191.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
References: <cover.1712743191.git.jani.nikula@intel.com>
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
index 5b867c02d2b5..6019949a3f68 100644
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
index b8903bd0e82a..15525fbf91c1 100644
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
index 405ca17a990b..983848e5b5b4 100644
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
index a0a43ea07f11..12948d586143 100644
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

