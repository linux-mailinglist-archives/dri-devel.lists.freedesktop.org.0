Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECAA89EF84
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AE011328A;
	Wed, 10 Apr 2024 10:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHq8dzZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323E610EA24;
 Wed, 10 Apr 2024 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743557; x=1744279557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mumY1GcVkw8mOGIhsUnZxpQfZ2vPMs+xTyKtdEBX6sA=;
 b=EHq8dzZpHBOXYZRkf1wNC1xb1JGJhAUgn+u5EoU2hWmpXTeL9xlJQpSk
 ZySLH5J1kCk/P+sl51YYtwOJ1EmGiRo+8gKcWF2qJ0H5zeGg4z5ePCiLP
 BtauN7ocTKcdH+BR8aSxDMOmRZHuz/mG46xCY9NR5TnvvRu2bz9SCkjPq
 aDofTZ1p1gdQJpidQzfaWUskRB6keFZy6qGCAmPe12/0mVypuFwKPro+k
 BTgWWs4xtbwHtm0PslcyGcO5/lgVu1QwGd/pJrH8mzovsyVZmsFoMClvH
 WPdzXxZQ4vupm8smdrqepFJRYnxk1h3tKgpl/w5cC6cjLIlv2RItc1a8z w==;
X-CSE-ConnectionGUID: l1UFSHqnTjS26jQwchrPdw==
X-CSE-MsgGUID: ccfq0duARJq2slbZqHEsjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8320059"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8320059"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:57 -0700
X-CSE-ConnectionGUID: TIwbQ4EKRyKCz3sNkTAnyA==
X-CSE-MsgGUID: vb+dWgstRWOEVPpFwbvF2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20460996"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 05/10] drm: move intel_lpe_audio.h under include/drm/intel
Date: Wed, 10 Apr 2024 13:05:12 +0300
Message-Id: <bf584e79e13001b962370a26e3b93c1c57ac6a1e.1712743191.git.jani.nikula@intel.com>
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
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c      | 2 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c | 2 +-
 include/drm/{ => intel}/intel_lpe_audio.h      | 0
 sound/x86/intel_hdmi_audio.c                   | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename include/drm/{ => intel}/intel_lpe_audio.h (100%)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 5f6deceaf8ba..959aa1143a7d 100644
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
index 5863763de530..4e3f78d1d4f9 100644
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

