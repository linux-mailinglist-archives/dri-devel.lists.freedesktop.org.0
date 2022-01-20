Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE911495143
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A5A10E48D;
	Thu, 20 Jan 2022 15:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3F110E480
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:17:30 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 6A1262B00158;
 Thu, 20 Jan 2022 10:17:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Jan 2022 10:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=ygoOPn6AjIIhpDS5nfawxR6o3qXAep
 6iLH8RPkS/1M8=; b=iyvgrjt82xfwoEQ8okVLtfFMoXOVwDkNKIeBGsDTOdNYfU
 +Nlkd+iYET+6GjqtRLgSEmRSE2ji/VtDSG/Zs6/5qIUjKGFpyRWEVdkaersXy/C8
 Y2mlrSkwB83L8BPRdrBy4KExbnIiz16mYBljGsK5u4OFSD7wW4BIA4Q/Ftm7hFiv
 ZH/lnN3fW8WdyNb+2Eq6O4cUK4pdOoy7wsu09N/c5P8mdomqq4uc83Ahh8RtTcru
 KULEGrCdJAt5WHkHTSmdgprmQVaUfLjpFNH6uvf5l6hkbg9axuOanxBdHF1WqKrv
 omWo/PcdCg7WokMsX93ESZeFuFkTPKU5PVua2sow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ygoOPn
 6AjIIhpDS5nfawxR6o3qXAep6iLH8RPkS/1M8=; b=Vt6Ev4Ip2nHvI1ultKnK44
 1los2812T0Fo9frDBv4Sb+SVBxzmh8tHcmu1Oi3OsriW0dSHI393IhSb6XePcevy
 CE7s9CXcA/Jeou8kZSFcxrhWyVeonBO8kcxjR3qzQ3eOX9GbWvCQRvgAskc1GSU/
 O3gUkYpDIZyrU+Cq0D+wj8UOvEyU0SzuDb4PnfrqgYv+cmuPGk1WzpRXe9dxUN82
 1W3bk02CzLbrXB7fiWGIAUbsrYjTZtAv5JIkm2XebqMkdDyTGzGzsQ48ehJs6hZf
 PQncos8vFpe+HVRRd7EHZDk/hMQ5qALxbRUVhW1oQGdrboKSbajgFpm8ntMcWvUA
 ==
X-ME-Sender: <xms:B33pYcLP6O2EUkeRYi0o1QJS_2UX5qEbASItfXE15chA6QCYIYI4_w>
 <xme:B33pYcLdloHMu75bA0t2RhvL7ZoDpQrpKvlZlEFc5ep5311qjei8ib2-atCHqzOOK
 pYKpFR8O39OhlmcP-U>
X-ME-Received: <xmr:B33pYcsPsVp_ho75vMzqUp4_x6NnVjQwhWvj0XbVl0VpR-UL5uZjtQ2LK2P0FQkOsyzrxRCPR1HiVDKjdCiCA_bgTeGxEuMvGi-MoE0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:B33pYZaHm4_FJpUnwmapAv4b4i3WD67LmxsYriVSYTmkCfbFuuv7VA>
 <xmx:B33pYTZDlS9NdwjmBziP1yTX8uaRYwJ8B4BQsj2Et41zOMhVgMoXeQ>
 <xmx:B33pYVC-nqdugELr1ghzl40B7xgEec8gPwIjC3Mo_KO08TuGclHw-A>
 <xmx:B33pYQQPS4SFcvysLMkdoJ1-jWU1Uyf-jATwMgfbIE20-JQ1FvY_uLinIFA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:17:27 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 15/16] drm/vc4: hdmi: Always try to have the highest bpc
Date: Thu, 20 Jan 2022 16:16:24 +0100
Message-Id: <20220120151625.594595-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
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

