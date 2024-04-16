Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFB78A66F6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 11:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741C610FCBC;
	Tue, 16 Apr 2024 09:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZB1F+raN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CB5112B3C;
 Tue, 16 Apr 2024 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713259225; x=1744795225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpTl6PJVlS+qLZrFmuqHgMUcLhVl4aOiw0wi3Zpd5hk=;
 b=ZB1F+raNtox2RW1jD0ZQxchpMGWdXtqEhNkaJPItNCv9ojllbQbrdyjN
 e4f3dMEXuJIBVgcs4XV+LHC3OU63RkkMVpn1GnUfGNrSySuZ4akGcM0op
 IuA5Fo8v2cp9OOPYwMfEMF7Q0k2o7CuD1AN+TWg6GSF7SEWYodwDyblGG
 xLc06/j3Dprn0TnKwVfCyrndHFxOm+V1rZ4jXrBKMCS3MdReXCbffHQDT
 5aoupHI3XAZZNn9Aork1XD2vNO0rj1vRypu2biNpayUh1mchuxp9EYbaZ
 ot57NFCqwuUf7C4ZnEwU3JRI0P6WnFoB38mESeAHl5TPchVoTAQ8nBtjW w==;
X-CSE-ConnectionGUID: FgnBzClHQ++5grX6L6SUPQ==
X-CSE-MsgGUID: BQjFXIJrTMudSJLg4KpBEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8849716"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8849716"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:25 -0700
X-CSE-ConnectionGUID: gLro8R3+RT2x7U8K2iXR0g==
X-CSE-MsgGUID: 9O7TQlaXQZ2vFaeBF8X11Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="26995888"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [REBASE 4/7] drm/edid: rename drm_find_edid_extension() to
 drm_edid_find_extension()
Date: Tue, 16 Apr 2024 12:19:57 +0300
Message-Id: <b7a2c2509409de02bbd751541206586424a34725.1713259151.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713259151.git.jani.nikula@intel.com>
References: <cover.1713259151.git.jani.nikula@intel.com>
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

Follow the drm_edid_ naming convention.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h | 2 +-
 drivers/gpu/drm/drm_displayid.c     | 3 ++-
 drivers/gpu/drm/drm_edid.c          | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 2256893d7d67..25aaae937ceb 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -299,7 +299,7 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
 int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m);
 int drm_edid_override_set(struct drm_connector *connector, const void *edid, size_t size);
 int drm_edid_override_reset(struct drm_connector *connector);
-const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
+const u8 *drm_edid_find_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
 void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad);
 void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index f800dc0906d5..9d01d762801f 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -55,9 +55,10 @@ static const u8 *drm_find_displayid_extension(const struct drm_edid *drm_edid,
 					      int *length, int *idx,
 					      int *ext_index)
 {
-	const u8 *displayid = drm_find_edid_extension(drm_edid, DISPLAYID_EXT, ext_index);
 	const struct displayid_header *base;
+	const u8 *displayid;
 
+	displayid = drm_edid_find_extension(drm_edid, DISPLAYID_EXT, ext_index);
 	if (!displayid)
 		return NULL;
 
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c4f799059522..c29f31dcc818 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4200,7 +4200,7 @@ static int add_detailed_modes(struct drm_connector *connector,
  *
  * FIXME: Prefer not returning pointers to raw EDID data.
  */
-const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
+const u8 *drm_edid_find_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index)
 {
 	const u8 *edid_ext = NULL;
@@ -4234,7 +4234,7 @@ static bool drm_edid_has_cta_extension(const struct drm_edid *drm_edid)
 	bool found = false;
 
 	/* Look for a top level CEA extension block */
-	if (drm_find_edid_extension(drm_edid, CEA_EXT, &ext_index))
+	if (drm_edid_find_extension(drm_edid, CEA_EXT, &ext_index))
 		return true;
 
 	/* CEA blocks can also be found embedded in a DisplayID block */
-- 
2.39.2

