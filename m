Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428C789EF79
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F8F10EEBF;
	Wed, 10 Apr 2024 10:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0vMlphv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2479D10EA28;
 Wed, 10 Apr 2024 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743551; x=1744279551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bJvBDcWN+hYP8lUcQTW3oD+Ab8zXqHFWhrkQMmIUJnQ=;
 b=L0vMlphviwG5/osJHfgl1Gk64ipLzcQuQovo7+F3M/7u8oJjU81cqVHN
 qQykzTJBkYUJOAS8MYlodJK0oampS3/U5PCQWU0fpezKRssMbwO2eYvCk
 mhgSBNCAe+4fuUIwdzbG2y4WGfBWCxGkAMHYCkJJAU6ZsJuphBoYs6rMr
 uYi7+iwwzUM7waGKOwCghrfL/GU5XT8q7xyKKGiCt+gxhcGH2JGXLA/jf
 hAG3mkomrVHbBtDoVFizkihtP8qNaBvy1qonvolxFzTpx8hAcAd0Ct3LD
 fW1HXIwoWzsvGNXT18xR7ZlyWokWKF1/+J7byitdd8yKMfPh3m3MB0qdb A==;
X-CSE-ConnectionGUID: aMzNy/EZSsqTFFPCWtAS8A==
X-CSE-MsgGUID: mQBS2OEKQq6B08XMjANrRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8320052"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8320052"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:51 -0700
X-CSE-ConnectionGUID: 57p0r80aR6WTFZ1dLUrXig==
X-CSE-MsgGUID: 2aWKd9GUSVSuoIB9BEQGoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20460986"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 04/10] drm: move i915_component.h under include/drm/intel
Date: Wed, 10 Apr 2024 13:05:11 +0300
Message-Id: <3ec9dfb58154d95e98afe03048a8f31cbbe1659e.1712743191.git.jani.nikula@intel.com>
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
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c   | 2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c    | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c | 2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c     | 2 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c            | 2 +-
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c   | 2 +-
 drivers/misc/mei/hdcp/mei_hdcp.c             | 2 +-
 drivers/misc/mei/pxp/mei_pxp.c               | 2 +-
 include/drm/{ => intel}/i915_component.h     | 0
 include/sound/hdaudio.h                      | 2 +-
 10 files changed, 9 insertions(+), 9 deletions(-)
 rename include/drm/{ => intel}/i915_component.h (100%)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 07e0c73204f3..53951c50b504 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -26,7 +26,7 @@
 
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
-#include <drm/i915_component.h>
+#include <drm/intel/i915_component.h>
 
 #include "i915_drv.h"
 #include "intel_atomic.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index d5ed4c7dfbc0..183ea437d623 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -13,7 +13,7 @@
 #include <linux/random.h>
 
 #include <drm/display/drm_hdcp_helper.h>
-#include <drm/i915_component.h>
+#include <drm/intel/i915_component.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
index e7619d81353c..d8edd7c054c8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
@@ -5,7 +5,7 @@
 
 #include <linux/component.h>
 
-#include <drm/i915_component.h>
+#include <drm/intel/i915_component.h>
 #include <drm/intel/i915_gsc_proxy_mei_interface.h>
 
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index b00d6c280159..051b6cdcf721 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -6,7 +6,7 @@
 #include <linux/component.h>
 
 #include <drm/i915_pxp_tee_interface.h>
-#include <drm/i915_component.h>
+#include <drm/intel/i915_component.h>
 
 #include "gem/i915_gem_lmem.h"
 #include "gt/intel_gt_print.h"
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index ea7b5ffb8954..a278d08b343c 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -9,7 +9,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
-#include <drm/i915_component.h>
+#include <drm/intel/i915_component.h>
 #include <drm/intel/i915_gsc_proxy_mei_interface.h>
 
 #include "abi/gsc_proxy_commands_abi.h"
diff --git a/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c b/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
index d5fbaf5d0c8e..f52fe23a6c0b 100644
--- a/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
+++ b/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
@@ -17,7 +17,7 @@
 #include <linux/slab.h>
 #include <linux/uuid.h>
 #include <drm/drm_connector.h>
-#include <drm/i915_component.h>
+#include <drm/intel/i915_component.h>
 #include <drm/intel/i915_gsc_proxy_mei_interface.h>
 
 /**
diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index f8759a6c9ed3..e43ea536c947 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -23,7 +23,7 @@
 #include <linux/mei_cl_bus.h>
 #include <linux/component.h>
 #include <drm/drm_connector.h>
-#include <drm/i915_component.h>
+#include <drm/intel/i915_component.h>
 #include <drm/i915_hdcp_interface.h>
 
 #include "mei_hdcp.h"
diff --git a/drivers/misc/mei/pxp/mei_pxp.c b/drivers/misc/mei/pxp/mei_pxp.c
index b1e4c23b31a3..5a7a4d8b0e23 100644
--- a/drivers/misc/mei/pxp/mei_pxp.c
+++ b/drivers/misc/mei/pxp/mei_pxp.c
@@ -19,7 +19,7 @@
 #include <linux/mei_cl_bus.h>
 #include <linux/component.h>
 #include <drm/drm_connector.h>
-#include <drm/i915_component.h>
+#include <drm/intel/i915_component.h>
 #include <drm/i915_pxp_tee_interface.h>
 
 #include "mei_pxp.h"
diff --git a/include/drm/i915_component.h b/include/drm/intel/i915_component.h
similarity index 100%
rename from include/drm/i915_component.h
rename to include/drm/intel/i915_component.h
diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index a73d7f34f4e5..00d1ab6936dd 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -18,7 +18,7 @@
 #include <sound/pcm.h>
 #include <sound/memalloc.h>
 #include <sound/hda_verbs.h>
-#include <drm/i915_component.h>
+#include <drm/intel/i915_component.h>
 
 /* codec node id */
 typedef u16 hda_nid_t;
-- 
2.39.2

