Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73433F420
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69806E824;
	Wed, 17 Mar 2021 15:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71F36E821
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:20 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1CD08580A4F;
 Wed, 17 Mar 2021 11:44:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 17 Mar 2021 11:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YTINQVeuPITaE
 7c2kEQa9k0tDCW0U4kfHCphOlbOg50=; b=UvIiR9QhbGVbggD9Za7+3APTzJFZ5
 b2D3VbhGpS84ti3BhGj1C/NfPDL8kblS3xEv/WWnXWnqlpzZgRTvMt9Jl30oD+Ti
 2A0wVpQb1+mP7WiIrOa8FY5uJxo2Lhw8zUpRO1D0YWcHRtv/b8BESmJ5Jxw/NJnM
 bmQvflaO8aI522byPiLn1jeG3rwTdvJVVh9u3bTAQdUzum6O56t2ggFR14K0r6Vx
 c9xHVstdeOvfT9EsBrACD92iAY+YTZmbq0wj1fyiljWjJmpW9fs9Eli1mqq95Wum
 FPUKN7sRAcqEn3ApFxF/0IfjOf15M4MZbGQSR5ih0B+zOP1ARij2Z92BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YTINQVeuPITaE7c2kEQa9k0tDCW0U4kfHCphOlbOg50=; b=Ikon346/
 CXAA1o2aZS1HBDEr5WM6jZ8Bik0YLLVVhQ8dxm3JC+9zncyju6QOUhD3ekanKJk8
 XsOqPiAxbKgRMKDMbA1FuFGHRVQ+G607ZzBe232NDNJFD8SoYF4FkafTzVWdkuFw
 sTo8w6qM6dB+n7zuTz0wvpvT8ZaMas4uvdAeIwWCGGudUQ2IMM3i7bLSv/wVkDJt
 wuBUznuFwBN2UNAQFZw3uFQzTT7aYI5zWP41oEPHU2v3CXU44YCyvNyEGsSs/iUV
 DuxfgGQ4HlJSZ/AxV4SEnOcIk9oOlCjAHg1+4Lp6e2jkChrZH3teB5M8RH3XLw8Y
 Jsy3Gap03YOR8A==
X-ME-Sender: <xms:1CNSYLhXEVWgMNcQOl5nMRnJMlkOj2qtutG4ujo2pPlSbcE9L4uRrg>
 <xme:1CNSYDe7GjrCt8m602phTg-vXe7TOVT9CONg7OO1o1evVjMWt-K3Bic3VRQbCTMPF
 cSCXyiAkdY5ECRNNUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1CNSYJxGOloHtGui_Mj1tBzMUQLcTkBW4WlFwQ_J15hcG6DYUeeKAQ>
 <xmx:1CNSYFZnsn7wV9wb3fuKSKxWaVewZMRAQOPi_ESLubb65Ke5ZASKgg>
 <xmx:1CNSYPKPXzpXuUESOEj1mv6SoIlt9gYa8HeyKvczfR9zYPVZaOaWqw>
 <xmx:1CNSYJQRizyJrPIIShUSZNtRI1IrxZgKiWXJrD2vgB1K8SSW0xw-Ig>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CF53124005D;
 Wed, 17 Mar 2021 11:44:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 15/18] drm/vc4: hdmi: Rework the infoframe prototype
Date: Wed, 17 Mar 2021 16:43:49 +0100
Message-Id: <20210317154352.732095-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support a YUV output, we're going to need to have access to
the bridge state in the vc4_hdmi_set_avi_infoframe function. Since we
also need the connector state in that function, let's pass the full
atomic state.

While we're at it, since all those functions actually need the vc4_hdmi
structure, let's pass it instead of the drm_encoder.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 38 ++++++++++++++++------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 56b5654c820f..83e44cf44d65 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -330,10 +330,10 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 			  BIT(packet_id)), 100);
 }
 
-static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
+static void vc4_hdmi_write_infoframe(struct vc4_hdmi *vc4_hdmi,
 				     union hdmi_infoframe *frame)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	u32 packet_id = frame->any.type - 0x80;
 	const struct vc4_hdmi_register *ram_packet_start =
 		&vc4_hdmi->variant->registers[HDMI_RAM_PACKET_START];
@@ -381,11 +381,13 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 		DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
 }
 
-static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
+static void vc4_hdmi_set_avi_infoframe(struct vc4_hdmi *vc4_hdmi,
+				       struct drm_atomic_state *state)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_connector_state *cstate = connector->state;
+	struct drm_connector_state *cstate =
+		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_crtc *crtc = encoder->crtc;
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	union hdmi_infoframe frame;
@@ -406,10 +408,10 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 
 	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
 
-	vc4_hdmi_write_infoframe(encoder, &frame);
+	vc4_hdmi_write_infoframe(vc4_hdmi, &frame);
 }
 
-static void vc4_hdmi_set_spd_infoframe(struct drm_encoder *encoder)
+static void vc4_hdmi_set_spd_infoframe(struct vc4_hdmi *vc4_hdmi)
 {
 	union hdmi_infoframe frame;
 	int ret;
@@ -422,12 +424,11 @@ static void vc4_hdmi_set_spd_infoframe(struct drm_encoder *encoder)
 
 	frame.spd.sdi = HDMI_SPD_SDI_PC;
 
-	vc4_hdmi_write_infoframe(encoder, &frame);
+	vc4_hdmi_write_infoframe(vc4_hdmi, &frame);
 }
 
-static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
+static void vc4_hdmi_set_audio_infoframe(struct vc4_hdmi *vc4_hdmi)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	union hdmi_infoframe frame;
 
 	hdmi_audio_infoframe_init(&frame.audio);
@@ -437,21 +438,19 @@ static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
 	frame.audio.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
 	frame.audio.channels = vc4_hdmi->audio.channels;
 
-	vc4_hdmi_write_infoframe(encoder, &frame);
+	vc4_hdmi_write_infoframe(vc4_hdmi, &frame);
 }
 
-static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
+static void vc4_hdmi_set_infoframes(struct vc4_hdmi *vc4_hdmi, struct drm_atomic_state *state)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-
-	vc4_hdmi_set_avi_infoframe(encoder);
-	vc4_hdmi_set_spd_infoframe(encoder);
+	vc4_hdmi_set_avi_infoframe(vc4_hdmi, state);
+	vc4_hdmi_set_spd_infoframe(vc4_hdmi);
 	/*
 	 * If audio was streaming, then we need to reenabled the audio
 	 * infoframe here during encoder_enable.
 	 */
 	if (vc4_hdmi->audio.streaming)
-		vc4_hdmi_set_audio_infoframe(encoder);
+		vc4_hdmi_set_audio_infoframe(vc4_hdmi);
 }
 
 static void vc4_hdmi_bridge_post_crtc_disable(struct drm_bridge *bridge,
@@ -921,7 +920,7 @@ static void vc4_hdmi_bridge_post_crtc_enable(struct drm_bridge *bridge,
 		HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
 			   VC4_HDMI_RAM_PACKET_ENABLE);
 
-		vc4_hdmi_set_infoframes(encoder);
+		vc4_hdmi_set_infoframes(vc4_hdmi, state);
 	}
 
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
@@ -1184,7 +1183,6 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map;
@@ -1244,7 +1242,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 	HDMI_WRITE(HDMI_AUDIO_PACKET_CONFIG, audio_packet_config);
 	vc4_hdmi_set_n_cts(vc4_hdmi);
 
-	vc4_hdmi_set_audio_infoframe(encoder);
+	vc4_hdmi_set_audio_infoframe(vc4_hdmi);
 
 	return 0;
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
