Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BD873897
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DFA1131FE;
	Wed,  6 Mar 2024 14:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDTuL+/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622311131FE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709734289; x=1741270289;
 h=resent-to:resent-from:resent-date:resent-message-id:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=FaF5jRU4mSiPhqmiBPj60toc/41UvsCRQRlYMkgJhfk=;
 b=hDTuL+/knhISPEEsCuu+LtmgHeuVRq9VAExe7RriZMUZ/zx8PkIhcCTn
 JmjSawPvrbZMa/RyFEKU+tBEljRKUhLqUszSFe/XXYJV6TNlB8KhQlI15
 spWB7JJcTY/7V34KRnmEpjiTcFtbrrznqXnRdMFzWR3VuLZqceywR+eeb
 uJEXPvIzxvQ1ZO1O6CKq8iX1wZP7Ey7JFV4jP/ylfG08HY1U+HKJWJ0BB
 JUaQPr7LhrxnlJqtnbPV0JVBN7Hg9y0QZoSRl0poGN3Vgvd4JTV5iTEjx
 gD4KzU7usMFg7rj4/2INMc7J+1uC30bh775U1JfQ7KVyH5IP7b2FDuzJ0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8151003"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="8151003"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:11:28 -0800
X-ExtLoopCount2: 2 from 10.252.33.211
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9744035"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:11:27 -0800
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 06 Mar 2024 16:11:22 +0200
Resent-Message-ID: <87h6hjxxf9.fsf@intel.com>
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Mailbox Transport; Wed, 6 Mar 2024 06:07:46 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 06:07:46 -0800
Received: from fmviesa004.fm.intel.com (10.60.135.144) by
 orsmsx603.amr.corp.intel.com (10.22.229.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 06:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14321643"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211]) by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 06:07:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 "Arun R Murthy" <arun.r.murthy@intel.com>
Subject: [PATCH v3 5/6] drm/i915/mst: add intel_dp_mst_disconnect()
Date: Wed, 6 Mar 2024 16:07:16 +0200
Message-ID: <0fdbb14d5cc6bfead388fea75ad611b667b17756.1709733981.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709733981.git.jani.nikula@intel.com>
References: <cover.1709733981.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-MS-Exchange-Organization-Network-Message-Id: cd0a3ba5-28b4-4f89-7a33-08dc3de6cc7e
X-MS-Exchange-Organization-AuthSource: ORSMSX603.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AVStamp-Enterprise: 1.0
X-MS-Exchange-Organization-SCL: -1
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.6775903
X-MS-Exchange-Processed-By-BccFoldering: 15.01.2507.035
MIME-Version: 1.0
X-TUID: 4dvTD8JUxm6m
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

Abstract the MST mode disconnect to a separate function.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 41f83d01a884..3956604d8b00 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4112,6 +4112,20 @@ intel_dp_mst_configure(struct intel_dp *intel_dp)
 	intel_dp->mst_detect = DRM_DP_SST;
 }
 
+static void
+intel_dp_mst_disconnect(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	if (!intel_dp->is_mst)
+		return;
+
+	drm_dbg_kms(&i915->drm, "MST device may have disappeared %d vs %d\n",
+		    intel_dp->is_mst, intel_dp->mst_mgr.mst_state);
+	intel_dp->is_mst = false;
+	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr, intel_dp->is_mst);
+}
+
 static bool
 intel_dp_get_sink_irq_esi(struct intel_dp *intel_dp, u8 *esi)
 {
@@ -5719,15 +5733,7 @@ intel_dp_detect(struct drm_connector *connector,
 		memset(intel_connector->dp.dsc_dpcd, 0, sizeof(intel_connector->dp.dsc_dpcd));
 		intel_dp->psr.sink_panel_replay_support = false;
 
-		if (intel_dp->is_mst) {
-			drm_dbg_kms(&dev_priv->drm,
-				    "MST device may have disappeared %d vs %d\n",
-				    intel_dp->is_mst,
-				    intel_dp->mst_mgr.mst_state);
-			intel_dp->is_mst = false;
-			drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
-							intel_dp->is_mst);
-		}
+		intel_dp_mst_disconnect(intel_dp);
 
 		intel_dp_tunnel_disconnect(intel_dp);
 
-- 
2.39.2

