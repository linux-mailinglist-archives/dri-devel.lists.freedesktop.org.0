Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39679CF6E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8868E10E40D;
	Tue, 12 Sep 2023 11:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AA110E3EE;
 Tue, 12 Sep 2023 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516926; x=1726052926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2LnSMNwXmZBIeFJR0OwhduOuJ6r2tFZJKPcsY17z1yU=;
 b=C3SH+OD+bg9VwqqYk0U1X0j8FSEsZx23+FyiZGjInI6Zh/1bTTFp8DXQ
 jpGo5YLBDeSFHfP7APayLJYbVzlDNBwVE7P7eAphp3QQZUFXrlZFf9gz1
 bi8299ZvidSlFW6obkZVEpGYWQbn40tPV+Had8/c6GDL7em6ZXpTYiEUB
 Rem0AyneVBwc2JLaVNbh6efzRBv65BZqsfBzEIKtWVNQIOy0lVarDiHIH
 H6eqXvPem28MlquhvlwWHmIJigRJg7Co/qwp4ZAgNN6/tjxhGcPvTrwga
 obAFqslE+nF94+LrChQp1imoT3nNGPCOkLg42d7gPLSZN57xmPhi9bkUX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378253092"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="378253092"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074512687"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="1074512687"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/19] drm/i915/display: add I915 conditional build to
 intel_dpio_phy.h
Date: Tue, 12 Sep 2023 14:06:38 +0300
Message-Id: <978bc7263e8de10ffc1ef16086341dd629347c8e.1694514689.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1694514689.git.jani.nikula@intel.com>
References: <cover.1694514689.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add stubs for !I915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpio_phy.h | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.h b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
index 9c7725dacb47..4d43dbbdf81c 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
@@ -26,6 +26,7 @@ enum dpio_phy {
 	DPIO_PHY2,
 };
 
+#ifdef I915
 void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
 			     enum dpio_phy *phy, enum dpio_channel *ch);
 void bxt_ddi_phy_set_signal_levels(struct intel_encoder *encoder,
@@ -70,5 +71,100 @@ void vlv_phy_pre_encoder_enable(struct intel_encoder *encoder,
 				const struct intel_crtc_state *crtc_state);
 void vlv_phy_reset_lanes(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *old_crtc_state);
+#else
+static inline void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
+					   enum dpio_phy *phy, enum dpio_channel *ch)
+{
+}
+static inline void bxt_ddi_phy_set_signal_levels(struct intel_encoder *encoder,
+						 const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void bxt_ddi_phy_init(struct drm_i915_private *dev_priv, enum dpio_phy phy)
+{
+}
+static inline void bxt_ddi_phy_uninit(struct drm_i915_private *dev_priv, enum dpio_phy phy)
+{
+}
+static inline bool bxt_ddi_phy_is_enabled(struct drm_i915_private *dev_priv,
+					  enum dpio_phy phy)
+{
+	return false;
+}
+static inline bool bxt_ddi_phy_verify_state(struct drm_i915_private *dev_priv,
+					    enum dpio_phy phy)
+{
+	return true;
+}
+static inline u8 bxt_ddi_phy_calc_lane_lat_optim_mask(u8 lane_count)
+{
+	return 0;
+}
+static inline void bxt_ddi_phy_set_lane_optim_mask(struct intel_encoder *encoder,
+						   u8 lane_lat_optim_mask)
+{
+}
+static inline u8 bxt_ddi_phy_get_lane_lat_optim_mask(struct intel_encoder *encoder)
+{
+	return 0;
+}
+static inline enum dpio_channel vlv_dig_port_to_channel(struct intel_digital_port *dig_port)
+{
+	return DPIO_CH0;
+}
+static inline enum dpio_phy vlv_dig_port_to_phy(struct intel_digital_port *dig_port)
+{
+	return DPIO_PHY0;
+}
+static inline enum dpio_channel vlv_pipe_to_channel(enum pipe pipe)
+{
+	return DPIO_CH0;
+}
+static inline void chv_set_phy_signal_level(struct intel_encoder *encoder,
+					    const struct intel_crtc_state *crtc_state,
+					    u32 deemph_reg_value, u32 margin_reg_value,
+					    bool uniq_trans_scale)
+{
+}
+static inline void chv_data_lane_soft_reset(struct intel_encoder *encoder,
+					    const struct intel_crtc_state *crtc_state,
+					    bool reset)
+{
+}
+static inline void chv_phy_pre_pll_enable(struct intel_encoder *encoder,
+					  const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void chv_phy_pre_encoder_enable(struct intel_encoder *encoder,
+					      const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void chv_phy_release_cl2_override(struct intel_encoder *encoder)
+{
+}
+static inline void chv_phy_post_pll_disable(struct intel_encoder *encoder,
+					    const struct intel_crtc_state *old_crtc_state)
+{
+}
+
+static inline void vlv_set_phy_signal_level(struct intel_encoder *encoder,
+					    const struct intel_crtc_state *crtc_state,
+					    u32 demph_reg_value, u32 preemph_reg_value,
+					    u32 uniqtranscale_reg_value, u32 tx3_demph)
+{
+}
+static inline void vlv_phy_pre_pll_enable(struct intel_encoder *encoder,
+					  const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void vlv_phy_pre_encoder_enable(struct intel_encoder *encoder,
+					      const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void vlv_phy_reset_lanes(struct intel_encoder *encoder,
+				       const struct intel_crtc_state *old_crtc_state)
+{
+}
+#endif
 
 #endif /* __INTEL_DPIO_PHY_H__ */
-- 
2.39.2

