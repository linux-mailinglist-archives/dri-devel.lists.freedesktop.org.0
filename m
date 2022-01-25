Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA149AF75
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF9810EEF1;
	Tue, 25 Jan 2022 09:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FF110EED5;
 Tue, 25 Jan 2022 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643101938; x=1674637938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VMPFjgBFzuD/1KNxhZKDY6N3SKYpJFTd+gMhidTD0vs=;
 b=M9zgiauhMAhS9vxUe7v/GmLxLRQta2w+vNWG9jW9aCBINm9vtuW4AkpW
 hFl7jKWSKf1TfRzBn7huKbfc/RLIPebw0bGAeM/Gx/oClng3Z/jPJbEqj
 zFzlw7Qqf6AVAJ3R28jjbVZQ5ujh3pda+xVkHLKNGe7r0fVtWI1nRF2Nm
 js6rHzcvmaWmh9sf604P/FJ13xd/c0Ee6Gx0RZv9CeemwCiapllHolvRd
 GzbZcws6OgEZnkEbnXImLrQ44odWPDO72L6eJP29ZWV0ov99Y8ryqVyZF
 v/1Re+p2dMeEpsbLH3bc/F8YYvFRMbKSqxlkXhn3dMa9PgXIZnBkbkJrc g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246042326"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="246042326"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:12:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="695768091"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:12:15 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915_hdmi: Fix the definition of
 intel_hdmi_dsc_get_bpp
Date: Tue, 25 Jan 2022 14:27:59 +0530
Message-Id: <20220125085801.1025521-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
References: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
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

Fixes: 6e6cb758e035 ("drm/i915: Add helper functions for calculating DSC
parameters for HDMI2.1")

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: "Ville Syrj_l_" <ville.syrjala@linux.intel.com>
Cc: "Jos_ Roberto de Souza" <jose.souza@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>
Cc: Aditya Swarup <aditya.swarup@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: <stable@vger.kernel.org> # v5.12+

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
index b577c38fa90c..fe40e49d2962 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -10,6 +10,7 @@
 #include <linux/types.h>
 
 #include "i915_reg.h"
+#include "intel_display_types.h"
 
 struct drm_connector;
 struct drm_encoder;
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

