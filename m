Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38594A57D0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020E210E5AD;
	Tue,  1 Feb 2022 07:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D478010E5AB;
 Tue,  1 Feb 2022 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643700875; x=1675236875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DTK4CS/sPUtVDSPGGUOg8mPJikMQo9fYvR7wfkQ61/U=;
 b=Z8/XpPRWZ03UbaRH8FZL8VLAhBVkWiq9+DbTx7YX6iFJPA8Si+bhUnCs
 /stO6T8H+BZ9/4rXZGxb2yq/3b3uh7dhBr7OX3FBB2jpUJFBKCJYfJ2zw
 mRkk5odDgE6q0M6g7tdWOxMlogjzLTvzuMkM2rYhblyvL6U9sWGIc+Al7
 PQCO//3/neiGOGRpyiu1N/A8k6P1M/87+dnTevTMz9b2f9VwRaJA5HAJk
 VoynBChaQSUiGfp/hxNy73DmCrYxkLvnVLviJFNu/djnEMCbfUqYQ4Ymw
 SzlqSECeWhVhxJgMqoeHOk01iVmBYXMkQCW87Ngn4ClruysTdX9dCCAsQ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="245227825"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="245227825"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:34:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="698315962"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:34:28 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/i915/hdmi: Fix the definition of
 intel_hdmi_dsc_get_bpp
Date: Tue,  1 Feb 2022 12:50:27 +0530
Message-Id: <20220201072030.1466446-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201072030.1466446-1-ankit.k.nautiyal@intel.com>
References: <20220201072030.1466446-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the data-type of the argument output_format to enum, for the
function intel_hdmi_dsc_get_bpp.

v2: Fixed formatting issues in commit message (Jani).
Avoided including the header intel_display_types.h, instead used
forward declaration for the appropriate enum. (Jani).

Fixes: 6e6cb758e035 ("drm/i915: Add helper functions for calculating DSC parameters for HDMI2.1")
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_hdmi.h | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 45cf0ab04009..381a9de3a015 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3126,8 +3126,8 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
  */
 int
 intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
-		       int output_format, bool hdmi_all_bpp,
-		       int hdmi_max_chunk_bytes)
+		       enum intel_output_format output_format,
+		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
 {
 	int max_dsc_bpp, min_dsc_bpp;
 	int target_bytes;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index b577c38fa90c..ea2a3456bd4b 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -22,6 +22,7 @@ struct intel_hdmi;
 struct drm_connector_state;
 union hdmi_infoframe;
 enum port;
+enum intel_output_format;
 
 void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 			       struct intel_connector *intel_connector);
@@ -49,8 +50,8 @@ bool intel_hdmi_limited_color_range(const struct intel_crtc_state *crtc_state,
 bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
 			     int bpc, bool has_hdmi_sink, bool ycbcr420_output);
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
-			   int num_slices, int output_format, bool hdmi_all_bpp,
-			   int hdmi_max_chunk_bytes);
+			   int num_slices, enum intel_output_format output_format,
+			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
 int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
 				  int src_max_slices, int src_max_slice_width,
 				  int hdmi_max_slices, int hdmi_throughput);
-- 
2.25.1

