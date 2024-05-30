Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1158D4C69
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9C810F16D;
	Thu, 30 May 2024 13:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiMzmXjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEA210F97B;
 Thu, 30 May 2024 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717075177; x=1748611177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMS12pEMq8w6cHhtJwjIx3yS3c4F2O2WtSXW3BPA+RU=;
 b=OiMzmXjdCv58U1ZtTkkR9Z1td3666pBTjnARjDq5ILWCrGueKQiNnmN2
 BS2YERFsuujISgx/JcJ38UIekK6jUQoa+p2pWC1KoF9IICD2iM/148jux
 +SF5bLqzrEEXtkNgbH0/iPHabxuDFk2odxwzm9DilqvBiw5El8CJmXM2A
 HCDNKLM6Wuq6Up/kOlMgnsEAHoMfRWWQltD33vuJRYogtntlDUF2rWCL5
 xKkYQig0KSnZRAZEz8UCG0wrY8VtG8GaX3wWUZRe8k43d9iggkxazVTQS
 5YfTkaHLURiWtuHYzFaQSbnJWke30pZuJ08Sl1+8LT6irsk3pbe5qwg29 Q==;
X-CSE-ConnectionGUID: 1zAXMjKjSMmGdvRtro8JQg==
X-CSE-MsgGUID: 7GuolV0/TP2B/uajcvUoNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24168148"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24168148"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:37 -0700
X-CSE-ConnectionGUID: /RNLJn70QRimZqUvPnJp3Q==
X-CSE-MsgGUID: vPh3OADwTeWl14Fl/g32aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="66671552"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 03/10] drm: move i915_component.h under include/drm/intel
Date: Thu, 30 May 2024 16:19:04 +0300
Message-Id: <a8c07233a8234858eb6711140482ef8db4c91cf4.1717075103.git.jani.nikula@intel.com>
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

v2: Also change Documentation/gpu/i915.rst (Andi)

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/i915.rst                   | 2 +-
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
 11 files changed, 10 insertions(+), 10 deletions(-)
 rename include/drm/{ => intel}/i915_component.h (100%)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 3113e36f14cf..ad59ae579237 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -150,7 +150,7 @@ High Definition Audio
 .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
    :internal:
 
-.. kernel-doc:: include/drm/i915_component.h
+.. kernel-doc:: include/drm/intel/i915_component.h
    :internal:
 
 Intel HDMI LPE Audio Support
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 4c031e97f9a5..b9bafec06fb8 100644
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
index 5767070248bb..ba3eca919900 100644
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
index cc3426fcfa89..aa812a2bc3ed 100644
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
index 49abc95677cd..ed88d6df4397 100644
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
index 1d10939e40af..7e39d486374a 100644
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

