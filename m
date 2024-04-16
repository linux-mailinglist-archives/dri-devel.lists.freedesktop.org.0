Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB348A66EF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 11:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AF4112B3A;
	Tue, 16 Apr 2024 09:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHXApejT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE2310FCBC;
 Tue, 16 Apr 2024 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713259212; x=1744795212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gbGSwvUZvRYb2J1TKm8VmKGfPg6ygHVxEBLUT3T9owE=;
 b=AHXApejTYvfyulyCxeY10NMH/CDCCZTWVHZgeEaMsRgZDo197rfjdzQ8
 JyhrgTP2L/ov0O0SYTGx1PUmtlLcBKqltllktBH9v13nx4TySb8jF5Acd
 nnaIcKpr3nZHWcf+1dlCp7H34My25ZwmZekrPYDUROL+PpKtqQ22H1LbW
 mX/t+To7XshwGRrRxrmoVv6mPj6Q8heVUmJ8p6zDgbX7drFFCIzJC6744
 Un58wO1HhyWv5UPlGGNlmI2WopKRfcrOduqtoWQpy+J6H6b1og/bCk4fd
 RIBV1FXG4ICaYbRHNE3HhxcVDu6YMpu0CybBJ9sHcsHg8VVhcyHotBLVl Q==;
X-CSE-ConnectionGUID: 71DS8WBdSDm/EfLRLBqyvg==
X-CSE-MsgGUID: wbnFlpmcSF2xVnbAp/JnZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8605995"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8605995"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:12 -0700
X-CSE-ConnectionGUID: ZkW3LjbmShWrnBSzCiM61g==
X-CSE-MsgGUID: N9fSBbIkQC2DM7HfyBM2TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22199294"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [REBASE 1/7] drm/displayid: move drm_displayid.h to
 drm_displayd_internal.h
Date: Tue, 16 Apr 2024 12:19:54 +0300
Message-Id: <220713d4e3cc364ac103ba689065ae96e075f1fa.1713259151.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713259151.git.jani.nikula@intel.com>
References: <cover.1713259151.git.jani.nikula@intel.com>
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

There are no exported symbols for displayid, and it's all internal
interfaces. Move the header to drivers/gpu/drm/drm_displayd_internal.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c                              | 3 ++-
 .../gpu/drm/drm_displayid_internal.h                         | 5 +++--
 drivers/gpu/drm/drm_edid.c                                   | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename include/drm/drm_displayid.h => drivers/gpu/drm/drm_displayid_internal.h (98%)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 9edc111be7ee..f72a893c7deb 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -3,10 +3,11 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <drm/drm_displayid.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 
+#include "drm_displayid_internal.h"
+
 static const struct displayid_header *
 displayid_get_header(const u8 *displayid, int length, int index)
 {
diff --git a/include/drm/drm_displayid.h b/drivers/gpu/drm/drm_displayid_internal.h
similarity index 98%
rename from include/drm/drm_displayid.h
rename to drivers/gpu/drm/drm_displayid_internal.h
index 566497eeb3b8..56fd3bb0a779 100644
--- a/include/drm/drm_displayid.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -19,8 +19,9 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#ifndef DRM_DISPLAYID_H
-#define DRM_DISPLAYID_H
+
+#ifndef __DRM_DISPLAYID_INTERNAL_H__
+#define __DRM_DISPLAYID_INTERNAL_H__
 
 #include <linux/types.h>
 #include <linux/bits.h>
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1400722ae3fe..c4f799059522 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -40,7 +40,6 @@
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_displayid.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
@@ -48,6 +47,7 @@
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_displayid_internal.h"
 #include "drm_internal.h"
 
 static int oui(u8 first, u8 second, u8 third)
-- 
2.39.2

