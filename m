Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EEB28E2D1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 17:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE30C6EA54;
	Wed, 14 Oct 2020 15:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D486EA54;
 Wed, 14 Oct 2020 15:08:15 +0000 (UTC)
IronPort-SDR: OzI0o7K0Mg7lQyS120qg9F9xrGLCDTal9S37Wzi+qd+8y1UshzRFKS2YyWP2pcq8hO7kNJhfSz
 c7DUoIIACPxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="166244494"
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; d="scan'208";a="166244494"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 08:08:14 -0700
IronPort-SDR: WpwQxawawQufyAO/N3oZafTD1hq9DeaJ53k0epH5SKXKpGRSiA9AVEeu81do27iSESLgTqoMeu
 2x3d6SKloTqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; d="scan'208";a="351520663"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2020 08:08:12 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Date: Wed, 14 Oct 2020 20:29:14 +0530
Message-Id: <20201014145914.67547-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

JSL has update in vswing table for eDP.

BSpec: 21257

Cc: Souza Jose <jose.souza@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 87 +++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bb0b9930958f..7ab694c6d8df 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -582,6 +582,34 @@ static const struct cnl_ddi_buf_trans ehl_combo_phy_ddi_translations_dp[] = {
 	{ 0x6, 0x7F, 0x3F, 0x00, 0x00 },	/* 900   900      0.0   */
 };
 
+static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_edp_hbr[] = {
+						/* NT mV Trans mV db    */
+	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },        /* 200   200      0.0   */
+	{ 0x8, 0x7F, 0x38, 0x00, 0x07 },        /* 200   250      1.9   */
+	{ 0x1, 0x7F, 0x33, 0x00, 0x0C },        /* 200   300      3.5   */
+	{ 0xA, 0x35, 0x36, 0x00, 0x09 },        /* 200   350      4.9   */
+	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },        /* 250   250      0.0   */
+	{ 0x1, 0x7F, 0x38, 0x00, 0x07 },        /* 250   300      1.6   */
+	{ 0xA, 0x35, 0x35, 0x00, 0x0A },        /* 250   350      2.9   */
+	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },        /* 300   300      0.0   */
+	{ 0xA, 0x35, 0x38, 0x00, 0x07 },        /* 300   350      1.3   */
+	{ 0xA, 0x35, 0x3F, 0x00, 0x00 },        /* 350   350      0.0   */
+};
+
+static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_edp_hbr2[] = {
+						/* NT mV Trans mV db    */
+	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },        /* 200   200      0.0   */
+	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },        /* 200   250      1.9   */
+	{ 0x1, 0x7F, 0x3D, 0x00, 0x02 },        /* 200   300      3.5   */
+	{ 0xA, 0x35, 0x38, 0x00, 0x07 },        /* 200   350      4.9   */
+	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },        /* 250   250      0.0   */
+	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },        /* 250   300      1.6   */
+	{ 0xA, 0x35, 0x3A, 0x00, 0x05 },        /* 250   350      2.9   */
+	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },        /* 300   300      0.0   */
+	{ 0xA, 0x35, 0x38, 0x00, 0x07 },        /* 300   350      1.3   */
+	{ 0xA, 0x35, 0x3F, 0x00, 0x00 },        /* 350   350      0.0   */
+};
+
 struct icl_mg_phy_ddi_buf_trans {
 	u32 cri_txdeemph_override_11_6;
 	u32 cri_txdeemph_override_5_0;
@@ -1162,6 +1190,57 @@ ehl_get_combo_buf_trans(struct intel_encoder *encoder,
 		return ehl_get_combo_buf_trans_dp(encoder, crtc_state, n_entries);
 }
 
+static const struct cnl_ddi_buf_trans *
+jsl_get_combo_buf_trans_hdmi(struct intel_encoder *encoder,
+			    const struct intel_crtc_state *crtc_state,
+			    int *n_entries)
+{
+	*n_entries = ARRAY_SIZE(icl_combo_phy_ddi_translations_hdmi);
+	return icl_combo_phy_ddi_translations_hdmi;
+}
+
+static const struct cnl_ddi_buf_trans *
+jsl_get_combo_buf_trans_dp(struct intel_encoder *encoder,
+			  const struct intel_crtc_state *crtc_state,
+			  int *n_entries)
+{
+	*n_entries = ARRAY_SIZE(icl_combo_phy_ddi_translations_dp_hbr2);
+	return icl_combo_phy_ddi_translations_dp_hbr2;
+}
+
+static const struct cnl_ddi_buf_trans *
+jsl_get_combo_buf_trans_edp(struct intel_encoder *encoder,
+			   const struct intel_crtc_state *crtc_state,
+			   int *n_entries)
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+
+	if (dev_priv->vbt.edp.low_vswing) {
+		if (crtc_state->port_clock > 270000) {
+			*n_entries = ARRAY_SIZE(jsl_combo_phy_ddi_translations_edp_hbr2);
+			return jsl_combo_phy_ddi_translations_edp_hbr2;
+		} else {
+			*n_entries = ARRAY_SIZE(jsl_combo_phy_ddi_translations_edp_hbr);
+			return jsl_combo_phy_ddi_translations_edp_hbr;
+		}
+	}
+
+	return jsl_get_combo_buf_trans_dp(encoder, crtc_state, n_entries);
+}
+
+static const struct cnl_ddi_buf_trans *
+jsl_get_combo_buf_trans(struct intel_encoder *encoder,
+		       const struct intel_crtc_state *crtc_state,
+		       int *n_entries)
+{
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
+		return jsl_get_combo_buf_trans_hdmi(encoder, crtc_state, n_entries);
+	else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
+		return jsl_get_combo_buf_trans_edp(encoder, crtc_state, n_entries);
+	else
+		return jsl_get_combo_buf_trans_dp(encoder, crtc_state, n_entries);
+}
+
 static const struct cnl_ddi_buf_trans *
 tgl_get_combo_buf_trans_hdmi(struct intel_encoder *encoder,
 			     const struct intel_crtc_state *crtc_state,
@@ -2363,7 +2442,9 @@ static u8 intel_ddi_dp_voltage_max(struct intel_dp *intel_dp,
 		else
 			tgl_get_dkl_buf_trans(encoder, crtc_state, &n_entries);
 	} else if (INTEL_GEN(dev_priv) == 11) {
-		if (IS_JSL_EHL(dev_priv))
+		if (IS_PLATFORM(dev_priv, INTEL_JASPERLAKE))
+			jsl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
+		else if (IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE))
 			ehl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
 		else if (intel_phy_is_combo(dev_priv, phy))
 			icl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
@@ -2544,7 +2625,9 @@ static void icl_ddi_combo_vswing_program(struct intel_encoder *encoder,
 
 	if (INTEL_GEN(dev_priv) >= 12)
 		ddi_translations = tgl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
-	else if (IS_JSL_EHL(dev_priv))
+	else if (IS_PLATFORM(dev_priv, INTEL_JASPERLAKE))
+		ddi_translations = jsl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
+	else if (IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE))
 		ddi_translations = ehl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
 	else
 		ddi_translations = icl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
