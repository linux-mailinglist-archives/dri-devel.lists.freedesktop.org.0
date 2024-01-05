Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FAC8258BE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 17:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9FF10E650;
	Fri,  5 Jan 2024 16:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B1010E650
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704473887; x=1736009887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fKRVkebIGYyYJ9x+jfnrzE9GFR7h9RQYa/vo76WXbgI=;
 b=Vtdln7SJoiaGziqId0uNzgQ+B+IVN8OlJxcx+JOrI0bjaUwsat+W32oW
 csPxkDLii+1bF+0NXdDrHvLVIi86FOGwnP63k08lzVJGOATQotktjsDc+
 aKwGikW/dDiac4V53Y1antUsrTOhvkzRPuyKQBo++auH+gp+v8gh1FtY2
 Bhl3uIqY5EyChX+itP3uuug4zj3M/13b+RSPcLjcyVQksKPh3T8WBM15P
 G0pT8v3MinXoNPO8I6jX9xaqvD0lUBx+HBUpZJocLHIRroIDnMszQYY9L
 FQZ51+XQRSRnNjYRdpvOrDc/w/V1yyX7nAa5kRTxW5N/WnG8/TTKbBHzP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4640359"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="4640359"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 08:58:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="846615126"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="846615126"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.106])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 08:58:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/probe-helper: remove unused
 drm_connector_helper_get_modes_from_ddc()
Date: Fri,  5 Jan 2024 18:57:49 +0200
Message-Id: <60eb6b2db16747d3f9c12604b197f33da585c16e.1704473654.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704473654.git.jani.nikula@intel.com>
References: <cover.1704473654.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the unused drm_connector_helper_get_modes_from_ddc()
function. Most drivers should probably have this functionality split to
detect and get modes parts, so the helper is not the best abstraction.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 36 ------------------------------
 include/drm/drm_probe_helper.h     |  1 -
 2 files changed, 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 3f479483d7d8..d1e1ade66f81 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1100,42 +1100,6 @@ enum drm_mode_status drm_crtc_helper_mode_valid_fixed(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_helper_mode_valid_fixed);
 
-/**
- * drm_connector_helper_get_modes_from_ddc - Updates the connector's EDID
- *                                           property from the connector's
- *                                           DDC channel
- * @connector: The connector
- *
- * Returns:
- * The number of detected display modes.
- *
- * Uses a connector's DDC channel to retrieve EDID data and update the
- * connector's EDID property and display modes. Drivers can use this
- * function to implement struct &drm_connector_helper_funcs.get_modes
- * for connectors with a DDC channel.
- */
-int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
-{
-	struct edid *edid;
-	int count = 0;
-
-	if (!connector->ddc)
-		return 0;
-
-	edid = drm_get_edid(connector, connector->ddc);
-
-	// clears property if EDID is NULL
-	drm_connector_update_edid_property(connector, edid);
-
-	if (edid) {
-		count = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-	}
-
-	return count;
-}
-EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
-
 /**
  * drm_connector_helper_get_modes_fixed - Duplicates a display mode for a connector
  * @connector: the connector
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index fad3c4003b2b..62741a88796b 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -32,7 +32,6 @@ enum drm_mode_status drm_crtc_helper_mode_valid_fixed(struct drm_crtc *crtc,
 						      const struct drm_display_mode *mode,
 						      const struct drm_display_mode *fixed_mode);
 
-int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
 int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
 					 const struct drm_display_mode *fixed_mode);
 int drm_connector_helper_get_modes(struct drm_connector *connector);
-- 
2.39.2

