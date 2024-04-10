Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED44C89EFCC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9FF11238D;
	Wed, 10 Apr 2024 10:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YX/LTS6A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0111F11238D;
 Wed, 10 Apr 2024 10:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712744788; x=1744280788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M3O9qpOpl0tFXPWOqxn9bO81A5EGYim5BIOgoxc4otI=;
 b=YX/LTS6A4Kr7NzBqR+fTzy+7DcGfvJ6mvfP7/YaIGAL/vicousJfK+3Z
 hdedAw2Z1q7gvdyVck0s7Vt2SP4lhL4TiQA0LfsgLFE8i334prKKJ+J/3
 hPreiGx5VOuvj9c8bOxKssQmaBO9glB/Jw2O6F4UaAJgXxs9vHt7+QLMN
 u+uFDkIlMWyRbdzo+FiIMLNPQk+Nx5u2qbhGKRJBSz97qAQrPv9g0XL4F
 3/a2lmtG1o8Z67rvpqwv0vhOeGfgJhJDCuPP41kUbX2jrlMbU9oe7WKBM
 o/h8C6F3OJBJBubS6TxdxqTVrZLA99ofQ8gvXvDSrvFhiyC7zkKuenYW/ A==;
X-CSE-ConnectionGUID: FR744s6fSEO8U5Rb7VkCCQ==
X-CSE-MsgGUID: qMv6GmePS32OsuReqSSFzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33504883"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="33504883"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:26:27 -0700
X-CSE-ConnectionGUID: dwIJXnp4Qlm0KFXIAybhmw==
X-CSE-MsgGUID: 1FiyMWSMSwGJGm4mZVBB8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20486655"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:26:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2] drm: move i915_drm.h under include/drm/intel
Date: Wed, 10 Apr 2024 13:26:15 +0300
Message-Id: <20240410102615.16506-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <63e199dec91cc2e717d81ab00e28f68b9bec8461.1712743191.git.jani.nikula@intel.com>
References: <63e199dec91cc2e717d81ab00e28f68b9bec8461.1712743191.git.jani.nikula@intel.com>
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

v2: Also fix comment in intel_pci_config.h (Ilpo)

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
 drivers/gpu/drm/i915/intel_pci_config.h    | 2 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c      | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 2 +-
 drivers/platform/x86/intel_ips.c           | 2 +-
 include/drm/{ => intel}/i915_drm.h         | 0
 9 files changed, 8 insertions(+), 8 deletions(-)
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
diff --git a/drivers/gpu/drm/i915/intel_pci_config.h b/drivers/gpu/drm/i915/intel_pci_config.h
index 23b8e519f333..ebe040828e20 100644
--- a/drivers/gpu/drm/i915/intel_pci_config.h
+++ b/drivers/gpu/drm/i915/intel_pci_config.h
@@ -31,7 +31,7 @@ static inline int intel_mmio_bar(int graphics_ver)
 	}
 }
 
-/* BSM in include/drm/i915_drm.h */
+/* BSM in include/drm/intel/i915_drm.h */
 
 #define MCHBAR_I915				0x44
 #define MCHBAR_I965				0x48
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

