Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D708A50F70D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 11:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC8D10EBDD;
	Tue, 26 Apr 2022 09:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A9A10EA88;
 Tue, 26 Apr 2022 09:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650964767; x=1682500767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EMKYXCBtQYgQFb0/G/OE7AshsxCHuoTLXVu1p+ylpqc=;
 b=R0QBJk6muqRT8ELIfWxpk9FXdyLzI9WWg63Hco6qJEiEJ42vB9pm5xNb
 6CMKY2dhblus/SAqZDLmB+SgrUC5iu9PkvZRqebnfI1lf4/CrnVIuKVwh
 PBTqzTKqAgwqoOfvyToIMvAAmZb0wY7Mp8QReKiFCx+gGhVQU0o4tjY/A
 qCxs9wfQo9d3aj9eHoPMWDcbYdlaN8mW3YZZH0UHC3e/Gkd/CgkcF1Bfj
 nYZzAGkMg4E3MLNj5lZQhYzQhJ4a7yx7t0AOJJgPrbBYgs8C3F27XI7yo
 fVE5BZfE6xjui3llw1S+YyF6/OLd1iLXsZi3MK6wBLqXi2asKJVSJHXS6 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="245435659"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="245435659"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 02:19:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="558208645"
Received: from vhlushch-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.132.136])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 02:19:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/edid: drop kernel-doc for static functions
Date: Tue, 26 Apr 2022 12:19:13 +0300
Message-Id: <20220426091913.1339941-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426091913.1339941-1-jani.nikula@intel.com>
References: <20220426091913.1339941-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the kernel-doc for static functions, it's excessive, but retain the
info in plain comments.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 57 ++++++++++++--------------------------
 1 file changed, 17 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6446f5d3944b..bc43e1b32092 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2384,13 +2384,9 @@ static u32 edid_get_quirks(const struct edid *edid)
 #define MODE_SIZE(m) ((m)->hdisplay * (m)->vdisplay)
 #define MODE_REFRESH_DIFF(c,t) (abs((c) - (t)))
 
-/**
- * edid_fixup_preferred - set preferred modes based on quirk list
- * @connector: has mode list to fix up
- * @quirks: quirks list
- *
- * Walk the mode list for @connector, clearing the preferred status
- * on existing modes and setting it anew for the right mode ala @quirks.
+/*
+ * Walk the mode list for connector, clearing the preferred status on existing
+ * modes and setting it anew for the right mode ala quirks.
  */
 static void edid_fixup_preferred(struct drm_connector *connector,
 				 u32 quirks)
@@ -2659,10 +2655,7 @@ drm_gtf2_2j(const struct edid *edid)
 	return descriptor ? descriptor->data.other_data.data.range.formula.gtf2.j : 0;
 }
 
-/**
- * standard_timing_level - get std. timing level(CVT/GTF/DMT)
- * @edid: EDID block to scan
- */
+/* Get standard timing level (CVT/GTF/DMT). */
 static int standard_timing_level(const struct edid *edid)
 {
 	if (edid->revision >= 2) {
@@ -2696,12 +2689,7 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
 	return DIV_ROUND_CLOSEST(mode->clock, mode->htotal);
 }
 
-/**
- * drm_mode_std - convert standard mode info (width, height, refresh) into mode
- * @connector: connector of for the EDID block
- * @edid: EDID block to scan
- * @t: standard timing params
- *
+/*
  * Take the standard timing params (in this case width, aspect, and refresh)
  * and convert them into a real mode using CVT/GTF/DMT.
  */
@@ -2857,15 +2845,10 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
 	mode->flags |= DRM_MODE_FLAG_INTERLACE;
 }
 
-/**
- * drm_mode_detailed - create a new mode from an EDID detailed timing section
- * @dev: DRM device (needed to create new mode)
- * @edid: EDID block
- * @timing: EDID detailed timing info
- * @quirks: quirks to apply
- *
- * An EDID detailed timing block contains enough info for us to create and
- * return a new struct drm_display_mode.
+/*
+ * Create a new mode from an EDID detailed timing section. An EDID detailed
+ * timing block contains enough info for us to create and return a new struct
+ * drm_display_mode.
  */
 static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 						  const struct edid *edid,
@@ -3247,13 +3230,10 @@ do_established_modes(const struct detailed_timing *timing, void *c)
 	closure->modes += drm_est3_modes(closure->connector, timing);
 }
 
-/**
- * add_established_modes - get est. modes from EDID and add them
- * @connector: connector to add mode(s) to
- * @edid: EDID block to scan
- *
- * Each EDID block contains a bitmap of the supported "established modes" list
- * (defined above).  Tease them out and add them to the global modes list.
+/*
+ * Get established modes from EDID and add them. Each EDID block contains a
+ * bitmap of the supported "established modes" list (defined above). Tease them
+ * out and add them to the global modes list.
  */
 static int
 add_established_modes(struct drm_connector *connector, const struct edid *edid)
@@ -3311,13 +3291,10 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
 	}
 }
 
-/**
- * add_standard_modes - get std. modes from EDID and add them
- * @connector: connector to add mode(s) to
- * @edid: EDID block to scan
- *
- * Standard modes can be calculated using the appropriate standard (DMT,
- * GTF or CVT. Grab them from @edid and add them to the list.
+/*
+ * Get standard modes from EDID and add them. Standard modes can be calculated
+ * using the appropriate standard (DMT, GTF, or CVT). Grab them from EDID and
+ * add them to the list.
  */
 static int
 add_standard_modes(struct drm_connector *connector, const struct edid *edid)
-- 
2.30.2

