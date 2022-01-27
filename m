Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A749E433
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9D10EEE8;
	Thu, 27 Jan 2022 14:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477D710EEE8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 14:10:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A52CD5805AF;
 Thu, 27 Jan 2022 09:10:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 27 Jan 2022 09:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=LFTDmmV59cFD9Wz3z2ovMw18FDf0Tk
 WPfWRkawn6fKM=; b=FXDfH/OdHDCvW0mIVcD9U7fTUTJYFRdqOHGSfLYGDERWia
 4mOwyLzCEDJa7xGbErd4fsCl8TXPEs+MqgHpNnlO1tzx+J9VpX7BcqIh0Z4/8SGg
 h1+9aDTlhgLRFaA9cVSTzfgUUXJX8MMt6Mss0M5fieeVDf12+QYLQIoqQT18lGE+
 SXtwBKbTy+Txfqh+O23u9c6bblzeniIeBx7w8rp9CSHO8iUfBXJk5+rpamuEJfRR
 LkiMcmgWpPP/A7W1rS6JDZ4awKMCQszdwvyO8vMsoB+ydGF+/g4DLBK6pcQHwpZV
 zvrSeXxGi+wHdSn325VeUtCtopsemQs/GmqqWFcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LFTDmm
 V59cFD9Wz3z2ovMw18FDf0TkWPfWRkawn6fKM=; b=Re2t1yUirFjL3/pQKNUtml
 DCa69l0eT9H2ZyijBObioQ4NYKqWSrLG3aOrs+Wegq/nGWgvssFoqRwR2TFvaloC
 1bYrYr/4h0hWP96xSyxkEb5gq/f9UCzJex5s14DQT+XrymWbsNRE50o8XxCO3cU+
 Di/pbvst2rDbAbLc9YtjfcdR057ZVQhwF7SuyWb9T+JzZgFYzhB/hlOo16QKznhb
 FTWO44Vyz8oRCwSMFyvRxYrKrWSbDvSrha0RzAlAhjhCwmjxBaXgFCb2SEygbO+j
 7ARts+Xh8yOGOZvbt5hVvVd6Zd2tZxrN8AUy6Z/qMSC5DlcVpInoxvce8yh1z3sA
 ==
X-ME-Sender: <xms:2qfyYdYurWFk8XhFn70ld2HQgayP76kKja9x8vRgxdjhX49kNUphWQ>
 <xme:2qfyYUZRDzhB3c_M07pRIqMpKjs1V-xJuX6QiJ2E6D2bwPEp4i3YWCkehUKoZLDSv
 0-tGS0Ols-5dlV3G60>
X-ME-Received: <xmr:2qfyYf_WcjnRLk74qhi8fr_-xwMM5RFJ2zx94SsS718iwJCapnEGYF1Z5LruwQksTftAA170R7CIP-0rCVYGFEN8Issgjxx1sdcOS0I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2qfyYboQBj2T_YHqpx5PbZycGJXw0y4IiIazGFcgZXq59o5oBNi6cQ>
 <xmx:2qfyYYr_V2L4WnKxv_5HrqqIflfKOnkSix2mu3Aoej0tki-ILl_JAw>
 <xmx:2qfyYRRmLK8oRX2aCIVI_jKQlaSKuKPDxdL2nYSMN47U_ZBD4fdtGQ>
 <xmx:2qfyYViIRcMhnS2Ngem4pZrkpm_mKXMKmEAIsOzA71LqaERL0zPAxg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 09:10:33 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 5/6] drm/vc4: hdmi: Always try to have the highest bpc
Date: Thu, 27 Jan 2022 15:10:20 +0100
Message-Id: <20220127141021.302482-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127141021.302482-1-maxime@cerno.tech>
References: <20220127141021.302482-1-maxime@cerno.tech>
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
index 03d0813992a7..3ce002e485ce 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -352,6 +352,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 		return NULL;
 
 	new_state->pixel_rate = vc4_state->pixel_rate;
+	new_state->output_bpc = vc4_state->output_bpc;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -906,6 +907,8 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
+	const struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -953,7 +956,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 
-	switch (state->max_bpc) {
+	switch (vc4_state->output_bpc) {
 	case 12:
 		gcp = 6;
 		gcp_en = true;
@@ -1261,9 +1264,11 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
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
@@ -1318,6 +1323,38 @@ vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
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
 
@@ -1351,8 +1388,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
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

