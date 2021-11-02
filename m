Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D426443116
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C15B72E71;
	Tue,  2 Nov 2021 14:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3398672E71
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 14:59:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8AF1758074B;
 Tue,  2 Nov 2021 10:59:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 02 Nov 2021 10:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=k2xpQwmAT+mpq
 LxUbulFoFKTGhRvj+lFLAq3m/dstWE=; b=WPgB0mBYm58DSMhUWJgjo3t/DPQ4f
 5JSU0uBrc/AelyE3YnTKN+lyqftUjvG3mb+sn61EeQdCgvWu3/IbBteDsqgOAt5x
 uLrUHwJIny7QLDgxz/3G2laCqTm3klWW75WWpZwYV8QJeXwm4jfSwpjRirDL9qsq
 p6h326U4C9aSrLwARNTOai8SKxrVPTBH7/nKCWNxx7jj1+S8kBoR2oUhkmsBbRlf
 4VyXUX1aAhoTEs2VtM3EBQZfBkL6th8XlUJ+WA4BxrrZUkbjzW71eArGujLfj3r8
 ngl7O11Gfc19Qjo0HqC8oDhx27M+1CsY+fzO6X04BEna/xm2zu3izG2/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=k2xpQwmAT+mpqLxUbulFoFKTGhRvj+lFLAq3m/dstWE=; b=KU3g+sWV
 tURzbgCdhvBQrxWNyeeagqDGAT2FhVS+XgKD1bUXi8jqDQd2k36zB2oD/qh/5zAC
 AuELeMm9vw0OvwAtfnSGnYW/kyZ2owOIIZTaxZSWxwUiBllIJQd6moirucMkJlrJ
 AHYrnCW/Dx31otklmgOtBA+qGFLjwtFAidKhIYHfAIyeY8CNmxl1jB+KnIZOQYTX
 1QbeBQs5nAZuzJdHPIE+dhBEe9Ji2uc6KGP4jLuCmq+E9BBKVhZZMuHkepzikPxj
 MfnOgNnExOSal64K0jyUyeB2KeXORf8T8sP/3psYCXGGC+GZ9fEA/4VJj2jwn4Qy
 ondruqX+8skrmQ==
X-ME-Sender: <xms:bVKBYZihzj1JAJcT3TmdmwXZpXJlcxvQD1rdQlmTC86gFKCILnxgBg>
 <xme:bVKBYeB5Pwa0m0aT2R0_-657xL5DFoAuSaktNU163wj90-TyqEqyHlZeAhcC44WxS
 0QbTKQJ9mMB-GeWPyg>
X-ME-Received: <xmr:bVKBYZF8ZkJ13E1sHKPLvFj8BPuFq33rDAw451veZDYAns-UOEetziaG9Hn-V3SvH2f9qyj7tjnEcBRs4F6u2m1Apy0-iiY-e-NvHwqO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bVKBYeS7HDJs4HiZCCfoyLFpj5hWXU7qG03i9ZIEtpY3ZGS58uz8Eg>
 <xmx:bVKBYWycflEzaem_ELBmNf6yqMO7lDrVg2kVkg-hnVO1QxvLwLs0hQ>
 <xmx:bVKBYU4-6M-_uk-A7R3fWDHHw7bI7eMsvFPPJTonrLVirU4uEWdbZA>
 <xmx:bVKBYaedKLN1R7y6PxEI5ztW4Kqi7DwlEpifxXeTHzzyFbCU28JE0g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 10:59:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 03/13] drm/atomic: Add HDMI scrambler state helper
Date: Tue,  2 Nov 2021 15:59:34 +0100
Message-Id: <20211102145944.259181-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All the drivers that implement the HDMI scrambling setup (dw-hdmi, i915,
tegra, vc4) duplicate the same logic to see if the TMDS ratio or the
scrambling state needs to be modified depending on the current connector
state and CRTC mode.

Since it's basically the same logic everywhere, let's put these two
informations in the connector state, and filled by a atomic_check helper
so that drivers can just use it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 58 +++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  3 ++
 include/drm/drm_connector.h               | 25 ++++++++++
 3 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index ddcf5c2c8e6a..93f40f2975c3 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -454,6 +454,64 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 
+/**
+ * drm_atomic_helper_connector_hdmi_check - Checks the state of an HDMI connector
+ * @connector: DRM connector
+ * @state: DRM atomic state to check
+ *
+ * Checks that an HDMI connector state is sane, and sets the various
+ * HDMI-specific flags in drm_connector_state related to HDMI support.
+ *
+ * Returns:
+ * 0 on success, a negative error code otherwise.
+ */
+int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
+					   struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
+										    connector);
+	struct drm_display_info *info = &connector->display_info;
+	const struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	bool required;
+
+	if (!conn_state)
+		return -EINVAL;
+
+	crtc = conn_state->crtc;
+	if (!crtc)
+		return -EINVAL;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	mode = &crtc_state->mode;
+	crtc_state->connectors_changed = true;
+	conn_state->hdmi_needs_scrambling = false;
+	conn_state->hdmi_needs_high_tmds_ratio = false;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	if (!info->hdmi.scdc.supported)
+		return 0;
+
+	required = drm_mode_hdmi_requires_scrambling(mode);
+	if (required && !info->hdmi.scdc.scrambling.supported)
+		return -EINVAL;
+
+	if (info->hdmi.scdc.scrambling.low_rates || required)
+		conn_state->hdmi_needs_scrambling = true;
+
+	if (required)
+		conn_state->hdmi_needs_high_tmds_ratio = true;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
+
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
  * @connector: connector object
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 3f8f1d627f7c..3d3d1ff355f4 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -26,6 +26,7 @@
 
 #include <linux/types.h>
 
+struct drm_atomic_state;
 struct drm_bridge;
 struct drm_bridge_state;
 struct drm_crtc;
@@ -71,6 +72,8 @@ void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
+int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
+					   struct drm_atomic_state *state);
 void
 __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,
 					   struct drm_connector_state *state);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 030636635af1..78d3d6c78fcb 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -832,6 +832,31 @@ struct drm_connector_state {
 	 * DRM blob property for HDR output metadata
 	 */
 	struct drm_property_blob *hdr_output_metadata;
+
+	/**
+	 * @hdmi_needs_scrambling:
+	 *
+	 * Only relevant for HDMI sink. Tracks whether the scrambling
+	 * should be turned on for the current sink and mode.
+	 *
+	 * Drivers needing this should use
+	 * drm_atomic_helper_connector_hdmi_check() and use the value
+	 * set here to enable or disable their scrambler.
+	 */
+	bool hdmi_needs_scrambling;
+
+	/**
+	 * @hdmi_needs_high_tmds_ratio:
+	 *
+	 * Only relevant for HDMI sink. Tracks whether the TMDS clock
+	 * ratio should be 1/10 of the pixel clock (false), or 1/40
+	 * (true).
+	 *
+	 * Drivers needing this should use
+	 * drm_atomic_helper_connector_hdmi_check() and use the value
+	 * set here to enable or disable their scrambler.
+	 */
+	bool hdmi_needs_high_tmds_ratio;
 };
 
 /**
-- 
2.32.0

