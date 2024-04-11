Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C678A18D1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 17:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801C010F1BE;
	Thu, 11 Apr 2024 15:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOeXfTx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032A410F19D;
 Thu, 11 Apr 2024 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712849688; x=1744385688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wz/ucUwNB4cMwKxG3EwYj7oVzLEz1Fgy67+G96GF5Ks=;
 b=eOeXfTx+jQoKRIlPncgjG12QRRnEZoemLhVI4+GCo8oeaS0m7dSUyLyN
 7mOCH2+5RXzBAD0b1GxX8/IDoTH3udL8ql62476FcC8B6Wob7GMnZh3ZL
 7IdQLHMN2JV6x77ewmYbxUS12dSwfpEJYQ1fD53sGD4HGCWPj3W2iSPo1
 dMw52LjG0MvDqTOwMz4H5oGzI6ZMF/Boo51COFiWkYPe67doM5+AIfYVQ
 eU/4W2X8FK5AqWwUhZPvkOkAj/qmV25cbTfK2TNSHCRC3iwiVDtO6+mMU
 gBBWtfxtUL05AavVFwGD1vm+aXkCsbxlLMZuqfixmIXNqde1N9TnIzfON A==;
X-CSE-ConnectionGUID: A95r59YrRk2y4i3ZrLJpug==
X-CSE-MsgGUID: 8sCzMI3gT56wPSnMqZiXhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8125535"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8125535"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:34:47 -0700
X-CSE-ConnectionGUID: o56VuxECSWyFlCmL5GkPpw==
X-CSE-MsgGUID: D6qtGVwDQGmk/7crHSTuPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21526435"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:34:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] drm: move i915_component.h under include/drm/intel
Date: Thu, 11 Apr 2024 18:34:37 +0300
Message-Id: <20240411153437.340597-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <3ec9dfb58154d95e98afe03048a8f31cbbe1659e.1712743191.git.jani.nikula@intel.com>
References: <3ec9dfb58154d95e98afe03048a8f31cbbe1659e.1712743191.git.jani.nikula@intel.com>
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
index 0ca1550fd9dc..fcb7a74506a2 100644
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

