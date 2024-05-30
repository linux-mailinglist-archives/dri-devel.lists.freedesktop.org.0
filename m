Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034CF8D4C6B
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D0710FD0F;
	Thu, 30 May 2024 13:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQBhp+jm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD2E10EAF5;
 Thu, 30 May 2024 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717075183; x=1748611183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T9TSxLLhZB5UB3WSAwCmgQDHJZnyJBFuMjQDgyHbW3c=;
 b=DQBhp+jmIBEik1lYDQZhI0MQBEqEOqTJVR4sg8uRlIb9GEetchxu4Odl
 7HjOhPkqLv83Z/z0qk4HZUfktOi5zZaGUTvx95QNYrPBG8sUX1Rgo821w
 fSmSRiwlnBRjZhtSg0jLf7fGkuhslQKtX3DcPFHT1al83nSowJFSXf+bY
 YbD4wV4jyuoY5WAhwXkKZC11U5APzyQnYF2b0KwQXfgx3IvuIK24xMaJp
 wb2B75XosI7XSKHgc88fBS8QlaD8ZjdnJSM0qknduQj9VxQCKdH8gyUp1
 Jufj0F9Cn2Ax3usS4yhqH72hpZOkJEWgdpLOHcvGeb8LQPiAs6gNNl1LL A==;
X-CSE-ConnectionGUID: 4ci08S6vT1WesdSeBllzZw==
X-CSE-MsgGUID: wAyGOEJdQfWQ4lGIKBA5Eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11805714"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="11805714"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:43 -0700
X-CSE-ConnectionGUID: soJDYfUUQji1zQ7GU8y2Rw==
X-CSE-MsgGUID: up8xVDHUTcOeQLGcJND95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="73291229"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 04/10] drm: move intel_lpe_audio.h under include/drm/intel
Date: Thu, 30 May 2024 16:19:05 +0300
Message-Id: <2d645970a65cfd13e01fd8195b35bf9483ae9c2f.1717075103.git.jani.nikula@intel.com>
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
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c      | 2 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c | 2 +-
 include/drm/{ => intel}/intel_lpe_audio.h      | 0
 sound/x86/intel_hdmi_audio.c                   | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename include/drm/{ => intel}/intel_lpe_audio.h (100%)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 3767be0bdba8..06ec9ce7fe1c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -38,7 +38,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
-#include <drm/intel_lpe_audio.h>
+#include <drm/intel/intel_lpe_audio.h>
 
 #include "g4x_hdmi.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index 93e6cac9a4ed..f11626176fe2 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -68,7 +68,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#include <drm/intel_lpe_audio.h>
+#include <drm/intel/intel_lpe_audio.h>
 
 #include "i915_drv.h"
 #include "i915_irq.h"
diff --git a/include/drm/intel_lpe_audio.h b/include/drm/intel/intel_lpe_audio.h
similarity index 100%
rename from include/drm/intel_lpe_audio.h
rename to include/drm/intel/intel_lpe_audio.h
diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 02f5a7f9b728..d41ea09ffbe5 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -31,7 +31,7 @@
 #include <sound/jack.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
-#include <drm/intel_lpe_audio.h>
+#include <drm/intel/intel_lpe_audio.h>
 #include "intel_hdmi_audio.h"
 
 #define INTEL_HDMI_AUDIO_SUSPEND_DELAY_MS  5000
-- 
2.39.2

