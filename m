Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27064EE65
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC30310E5F3;
	Fri, 16 Dec 2022 16:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6140E10E5ED;
 Fri, 16 Dec 2022 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206473; x=1702742473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=httAY6kPHBKy710R/K4WAgMkSoLHJTsRKuZXNt1PH5E=;
 b=A9ChjoXwT/87JKitqHv5cP91VO+C2VXp3S9oCmWiUckuHg50HPyFKvvv
 YHFUogZyEonQVmceffp1b/zF4DpoGfBu+YjN0dle03WaIf9EnEPkP6d9Y
 M31Olg9xcjR+Z52czC1CMdfPe6ff11E15KUS8p2Lugg04m94rG42iyUUq
 HVqCan1WixYWbhNyKPvEAo7wFwIu91xTTxFzavhHEr7oMCnm9a9waWLk/
 MKQ6FV9LJWayU1+uVSZS1F81jhjZXtDGbOp7KJ6nKlrnCEzdVZ178unYH
 Y8AfI1DPqEvw7gWiczIOTJs6TOARMAM0cEcXjx+NXw6O3uBS00fhRNmd1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="383327070"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="383327070"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="738576216"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="738576216"
Received: from fbielich-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.62.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/12] drm/edid: rename struct drm_display_info *display to
 *info
Date: Fri, 16 Dec 2022 18:00:17 +0200
Message-Id: <0f716f5b0e6c7380d36b8ee2a95bed63a50b1672.1671206131.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671206131.git.jani.nikula@intel.com>
References: <cover.1671206131.git.jani.nikula@intel.com>
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

Rename the local variable to info for consistency.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index d3ce559e0dfa..f40058d4c290 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5991,14 +5991,14 @@ static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 				      const u8 *hf_scds)
 {
-	struct drm_display_info *display = &connector->display_info;
-	struct drm_hdmi_info *hdmi = &display->hdmi;
+	struct drm_display_info *info = &connector->display_info;
+	struct drm_hdmi_info *hdmi = &info->hdmi;
 	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
 	int max_tmds_clock = 0;
 	u8 max_frl_rate = 0;
 	bool dsc_support = false;
 
-	display->has_hdmi_infoframe = true;
+	info->has_hdmi_infoframe = true;
 
 	if (hf_scds[6] & 0x80) {
 		hdmi->scdc.supported = true;
@@ -6022,7 +6022,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 		max_tmds_clock = hf_scds[5] * 5000;
 
 		if (max_tmds_clock > 340000) {
-			display->max_tmds_clock = max_tmds_clock;
+			info->max_tmds_clock = max_tmds_clock;
 		}
 
 		if (scdc->supported) {
-- 
2.34.1

