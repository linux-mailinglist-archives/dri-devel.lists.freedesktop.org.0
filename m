Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C19D48D976
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3609A10E534;
	Thu, 13 Jan 2022 14:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009E710E4B1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 57E95580807;
 Thu, 13 Jan 2022 09:07:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 13 Jan 2022 09:07:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ygoOPn6AjIIhp
 DS5nfawxR6o3qXAep6iLH8RPkS/1M8=; b=j5NsBfr9bPw/rHdXxQ9eM1wXD92bb
 DFh3G0Uiop7cZvZ4sVCeRTJCoYKBqkgN2DjoJJPH3rGz9jp1HLlLCien6vCu13zL
 Cc455naYl7Cda4upXwbtsx0wMMuBwThPuV4vwtDoHvbcDat7stS81yCZXXJQDADh
 zrohaRvfkX8gofGq/aa5rU1qp6kM9P9vUO70l+tfYUFqLbbK1gxKwymTSIwrsOqd
 QmGnpyerkxuC5LIzO51Gqfx0Mz13y6w7w8in5XW4GIX9k+7nIaqjA03jDMgG6bDi
 HxQaO182VFHkMzLWRln0ecjW3Cs6cAzCDiTY/CUDUDartEVwEPErBwZJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ygoOPn6AjIIhpDS5nfawxR6o3qXAep6iLH8RPkS/1M8=; b=jx3z+dct
 WSYOEUmPxiJMNWT2coxra6BJIVIzLR6dtBJJ8xSqBMnpJrMUsHA1gmoeG51/DAvv
 9gtU0JWATs+BhlKJedbLj8T0QGPqAYLTVHnNF6Ux9Rk4cyMj/XOYT/eCFN+WpzUe
 eVw6TktqX0rReD5Hnx5Xy3jELctEwLTndTei/XEahqlfKphHw30nbfTYsvf2gqhh
 blyikxqh4r5or5tzKapj6J+6PKppFCBIQFMsqJ+UTat8y18gq5OS99maYY7hl72/
 BaqIJOF6VEn29krDrSYD4xU4hnw7NJoOXrCqrcuDJ3chpNegb9azBXKMWEe8OD1/
 njAavSHqbQ35TA==
X-ME-Sender: <xms:PTLgYaI8ZKecfmUHJdcfsuyRpWMxAz-pCD4mfLWu_dW5oWPnWQeLCA>
 <xme:PTLgYSJ5df0S234WowCNKQeBSYWesiG4h8mkuvsCpMq9I7o6H4azFAL-YGp6dNjAJ
 UdZHLJ_XDI8ynMQBoo>
X-ME-Received: <xmr:PTLgYat3kZRgShlDxOYXKqRkovHB_BHotGz1XPGpEa2w3YwtHvSV_RlJKy6XtvNub80D8sV_swFw-hVz2UzhtEPWFUJmGlcGSuP3X8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PTLgYfYB-9PIFv_7eNHFXusc_mgxE3KrIOTF49pnLopiS2SMhQDpqQ>
 <xmx:PTLgYRaeriTdx1kSza5eQrc_IK-XiMq5eQFrJAbiRzM9g7r2qL9Ibw>
 <xmx:PTLgYbCvj9FNJX0ysaBD27kUVZVvFN6VurOpqxd55fuBtBD8XsJi9w>
 <xmx:PTLgYeTh8B_tiNMbeB3ZR19hFfXoIqfEApBLDM0OofFlTCfbaUNENw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 15/16] drm/vc4: hdmi: Always try to have the highest bpc
Date: Thu, 13 Jan 2022 15:07:19 +0100
Message-Id: <20220113140720.1678907-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we take the max_bpc property as the bpc value and do not try
anything else.

However, what the other drivers seem to be doing is that they would try
with the highest bpc allowed by the max_bpc property and the hardware
capabilities, test if it results in an acceptable configuration, and if
not decrease the bpc and try again.

Let's use the same logic.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 44 ++++++++++++++++++++++++++++++----
 drivers/gpu/drm/vc4/vc4_hdmi.h |  4 +++-
 2 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 86801019ceb1..b7783fba1b51 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -352,6 +352,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 		return NULL;
 
 	new_state->pixel_rate = vc4_state->pixel_rate;
+	new_state->output_bpc = vc4_state->output_bpc;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -907,6 +908,8 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
+	const struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -954,7 +957,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 
-	switch (state->max_bpc) {
+	switch (vc4_state->output_bpc) {
 	case 12:
 		gcp = 6;
 		gcp_en = true;
@@ -1262,9 +1265,11 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 					     struct drm_connector_state *conn_state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(conn_state);
 
 	mutex_lock(&vc4_hdmi->mutex);
-	vc4_hdmi->output_bpc = conn_state->max_bpc;
+	vc4_hdmi->output_bpc = vc4_state->output_bpc;
 	memcpy(&vc4_hdmi->saved_adjusted_mode,
 	       &crtc_state->adjusted_mode,
 	       sizeof(vc4_hdmi->saved_adjusted_mode));
@@ -1319,6 +1324,38 @@ vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
 	return 0;
 }
 
+static int
+vc4_hdmi_encoder_compute_config(const struct vc4_hdmi *vc4_hdmi,
+				struct vc4_hdmi_connector_state *vc4_state,
+				const struct drm_display_mode *mode)
+{
+	struct drm_connector_state *conn_state = &vc4_state->base;
+	unsigned int max_bpc = clamp_t(unsigned int, conn_state->max_bpc, 8, 12);
+	unsigned int bpc;
+	int ret;
+
+	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
+		drm_dbg(dev, "Trying with a %d bpc output\n", bpc);
+
+		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
+						     mode, bpc);
+		if (ret)
+			continue;
+
+		vc4_state->output_bpc = bpc;
+
+		drm_dbg(dev,
+			"Mode %ux%u @ %uHz: Found configuration: bpc: %u, clock: %llu\n",
+			mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
+			vc4_state->output_bpc,
+			vc4_state->pixel_rate);
+
+		break;
+	}
+
+	return ret;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1352,8 +1389,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		pixel_rate = mode->clock * 1000;
 	}
 
-	ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state, mode,
-					     conn_state->max_bpc);
+	ret = vc4_hdmi_encoder_compute_config(vc4_hdmi, vc4_state, mode);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 31b7d27deb8e..05d2b0eeaa9b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -218,7 +218,8 @@ struct vc4_hdmi {
 	bool scdc_enabled;
 
 	/**
-	 * @output_bpc: BPC currently being used. Protected by @mutex.
+	 * @output_bpc: Copy of @vc4_connector_state.output_bpc for use
+	 * outside of KMS hooks. Protected by @mutex.
 	 */
 	unsigned int output_bpc;
 };
@@ -240,6 +241,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 struct vc4_hdmi_connector_state {
 	struct drm_connector_state	base;
 	unsigned long long		pixel_rate;
+	unsigned int 			output_bpc;
 };
 
 static inline struct vc4_hdmi_connector_state *
-- 
2.34.1

