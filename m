Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1E3455931
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EAD6E9DF;
	Thu, 18 Nov 2021 10:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B365B6E9C2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 19CE6580912;
 Thu, 18 Nov 2021 05:38:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 18 Nov 2021 05:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=HPxmOUgOUXx2k
 qjwLNR68MCCF0bp9X93Ia8VuZOB/UY=; b=WOuTywos2RylEtEBOyfpaSazLTBfa
 iVCXPAlhYVIM51EY/u5W2h9IFNUxRAZFL3JVY2aBxyhCPNvKrYYA0ntRxIjJfC5x
 5jSQNQnwQJMjV+iX0vBAlXbRRDQsRhY7h/AHnmhvqoZJwH9WG2tMnYLh1TSTjUqO
 Ll0Dcomqw61Kaei/8VRboTssVuUukgG+hCsgDZKk7YO8be0r/SXTqaOt4DX+4X1E
 heuEkGUJ6JqokWNjoEzZ7aFsugk5ZVCkxJH3M7N8DSrGycPNB44aAClwRmGrLVIk
 RteNfrFg0n0smYnh1lNTVSfO2Qj1kJ10S8meWRXNU8U5T8bp55idWUPpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HPxmOUgOUXx2kqjwLNR68MCCF0bp9X93Ia8VuZOB/UY=; b=S1RseHRw
 JoNBKVgakrCuoBz8ejP+stnVqre9tuPq880ZzszYXCvUTOD0sn/3RXTYc+1CtIH0
 RwtYoADsYgfpeyg05Ks4FEp9pw3g3YDjouLpWeApWtJ4rcEymJxBybTeHz+iN9TK
 whTAPh633Z2r23guByP3lhnT3H6TFPSq5cvbzsuea6szqTWubI0R/iuGEC+YvKXn
 IaBOihzlgrDbI2mUHy4sjsUQ4RmEft60QzPdloa4c42NZFmPZmL2xM2UX6Vuqnp9
 H9652J4M6am/jOwSYy4FpyvMNdYxVjGrZ7QFZdfpyXXIvL/aao815HziPoh/f6PH
 cxyVIP84TjU5eg==
X-ME-Sender: <xms:Hi2WYbUOrhQ6GY_DbLWG3cMWQJpQc-m-mT6fcrxVFPqWx2MN88cTvA>
 <xme:Hi2WYTn9JPwdbBte8pe3-pkAMEdENJczS0aewtRdR8zUxW89cRftv1xiKGWiXn7No
 otUxoOvidvxtqHRTA8>
X-ME-Received: <xmr:Hi2WYXZfLW1n8oayfTVvmahmcA5ZkD1rAKu40_YH5MULiTcRLO6SGems-I4joATLzR30cJOmlKhoao-UVzBSUAqAGXCGoa7CVOBqIyp7UZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Hi2WYWUVwdkrf26ojCuaIdaZVFS5b49RsPnmsfOD12e5XnD0f8_G9A>
 <xmx:Hi2WYVmezrtDbubR5Yz3amEq3Kykzhv5s8CRqOQJ3ht9sw8txjfmfg>
 <xmx:Hi2WYTf-L0LnvxAh_y9cJWvnlu_k4eVQwYDKwhgfW-urWsY8i2ZbOg>
 <xmx:Hy2WYWhZCnvNKBP7aBZc1Nd0exiu7XfAejVPCOv_I-ClJfw7FEOcxA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 02/13] drm/atomic: Add HDMI scrambler state helper
Date: Thu, 18 Nov 2021 11:38:03 +0100
Message-Id: <20211118103814.524670-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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
index ddcf5c2c8e6a..08dfb2d1bf9b 100644
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
+	required = drm_mode_hdmi_requires_scrambling(mode, conn_state->max_bpc);
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
index b501d0badaea..02c6f9f0d4f7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -830,6 +830,31 @@ struct drm_connector_state {
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
2.33.1

