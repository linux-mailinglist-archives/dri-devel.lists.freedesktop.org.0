Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DE1673E82
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075AE10E9AB;
	Thu, 19 Jan 2023 16:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DEF10E9A7;
 Thu, 19 Jan 2023 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674145178; x=1705681178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RQvIBJV5ujzuDZ4mJMY6PyvVi/7K09K7bbJat1hnOtw=;
 b=j0qtOXN18651Lkc5ltA+0GytHQgQQ8cCG3GdhOSwpoFxgXtzxNshNTnL
 zzIhWx7bSfKcvKu4zYr8Lb0+eryuzweMhuE9qNk5XCYKMp/R4Odr6/o/v
 D8KSdB+WXJwSAL9PdCJhmbEvf2/tvWYgDPF0oWAbIEVGrIE4QB8CiMKA8
 cebPh9NPE93nMj4L9XCP/Js+ERYSQJVGtZOd7kDN+1LarIhvgMskyCEPR
 XLaZUgiI+4BZY6tGm/hgm+brBRgjWu4mXI31tXYsCpS/CXZxe6DF9ljEr
 k1y6nnG7ILezhqf6WZGRRxJw98HDZjSENsmx4y1tY5imItQL39FmMcrGp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325372888"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="325372888"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:19:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="660256920"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="660256920"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.157])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:19:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 4/8] drm/edid: remove redundant
 _drm_connector_update_edid_property()
Date: Thu, 19 Jan 2023 18:18:57 +0200
Message-Id: <712cc299afe33d8f6279a15d5b0117aeeab88bb4.1674144945.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674144945.git.jani.nikula@intel.com>
References: <cover.1674144945.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Realize that drm_edid_connector_update() and
_drm_connector_update_edid_property() are now the same thing. Drop the
latter.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index d0c21d27b978..3d0a4da661bc 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6784,24 +6784,6 @@ int drm_edid_connector_add_modes(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_edid_connector_add_modes);
 
-static int _drm_connector_update_edid_property(struct drm_connector *connector,
-					       const struct drm_edid *drm_edid)
-{
-	/*
-	 * Set the display info, using edid if available, otherwise resetting
-	 * the values to defaults. This duplicates the work done in
-	 * drm_add_edid_modes, but that function is not consistently called
-	 * before this one in all drivers and the computation is cheap enough
-	 * that it seems better to duplicate it rather than attempt to ensure
-	 * some arbitrary ordering of calls.
-	 */
-	update_display_info(connector, drm_edid);
-
-	_drm_update_tile_info(connector, drm_edid);
-
-	return _drm_edid_connector_property_update(connector, drm_edid);
-}
-
 /**
  * drm_connector_update_edid_property - update the edid property of a connector
  * @connector: drm connector
@@ -6823,8 +6805,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 {
 	struct drm_edid drm_edid;
 
-	return _drm_connector_update_edid_property(connector,
-						   drm_edid_legacy_init(&drm_edid, edid));
+	return drm_edid_connector_update(connector, drm_edid_legacy_init(&drm_edid, edid));
 }
 EXPORT_SYMBOL(drm_connector_update_edid_property);
 
-- 
2.34.1

