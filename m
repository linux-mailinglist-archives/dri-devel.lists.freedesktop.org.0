Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3201B3766BB
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 16:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2EB6EE27;
	Fri,  7 May 2021 14:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FCC6EE27
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 14:05:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 4A3A4F9B;
 Fri,  7 May 2021 10:05:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 07 May 2021 10:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=S7H+ptOP2bhOf
 UCpUIPTZM6vAsJtn5bIwJNg3j5CAEU=; b=QAueQppW2aMrDWWRR/uxJgnbkjPYG
 tolulOIZOQ1SUlbJ+v9fiDCO0g9eTgAS5uKeBb0Sc7/nDCa8GGw+1Hnj3wH+IugL
 91SqWBY9QL3oiR2PZzf1qWx01g/icpdD7v6gZ3bNDoA2L5GcIVH4Q+x8Yb+41WqW
 lEJFKHrrv9KZHmb5eGzxKmCvEwAdgGU1ddlr+GL/A1dLJ1jYWQqzEClF+XmvwY5W
 9lVxL4unP/6fbRizEp23dLGks84y3AVrMqgIz5fG6Hy1T/sd7zoxkBeB4MzT1fuj
 RoMNnu8krNHym/EhQI7ZDdBjkfi+iTOJjihB2ab1mu067L6jSgMmQLiXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=S7H+ptOP2bhOfUCpUIPTZM6vAsJtn5bIwJNg3j5CAEU=; b=G3r6w1NF
 h1ZA1Ab2YkA0fYD51Szck/VF4OnfeGXDeM5Hr20GsIWpvCZP4vTWke5MWjDGvvSV
 9qHnVcJbTmhRlKG795xFOf6reKAQ1B4ijzjWqfUluJyVjfa5DglM5nbkWk5otxhL
 zdEoabVDO47GY2b59rf8hK3uv1epYww6GljHF0drCGYlZe/ey60pDcC4dXZDSYxG
 UnOOBDsxVv1Nv7gGAxmOVVfLeud7gmogRIMgesYNjH8eWyx4wI+11jOr66BjDVe1
 cslDlWtvYy/bOosqIXbOyufl+itfdYXGm0pJ2zfKXkTZXCK3o7wIwDeEVaKbPBS1
 QaZW6SCYezcDcA==
X-ME-Sender: <xms:M0mVYMpoqlDBPMxLWSt0D0TN_ZANLrxYbxDIfUKYxPUl50jSaKA_1Q>
 <xme:M0mVYCo24oBgEqc54uOK721_zcmQWCMSYGreTrBg3PH2GYOSkCz86QxZ1b0bTl-Fj
 eSiZcaeS3Rg1lX9Oow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:M0mVYBMkE28jrtETjROqGlHyyH2xNSlkQuoHIALCh2MvmK-zohBfYw>
 <xmx:M0mVYD7a9n2Q31EKPjd4mhxU4CPl5AVmr6wa9prB5mSHJF7SJjPN0Q>
 <xmx:M0mVYL5kmps54f0ard9eSCwPrh2mC8W1oxKG18UwMGk-Wm3Fe-V_PQ>
 <xmx:NUmVYAqwBenWA2bMDqZFLnrYFmBOfYOg-zRa_yuM1euLlWU7z1ukn_SypDY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:05:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 10/11] drm/vc4: hdmi: Remove redundant variables
Date: Fri,  7 May 2021 16:03:33 +0200
Message-Id: <20210507140334.204865-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507140334.204865-1-maxime@cerno.tech>
References: <20210507140334.204865-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++--------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 19739b57d067..a5780da70c1c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1008,12 +1008,13 @@ static u32 vc5_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
 }
 
 /* HDMI audio codec callbacks */
-static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi)
+static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
+					 unsigned int samplerate)
 {
 	u32 hsm_clock = clk_get_rate(vc4_hdmi->audio_clock);
 	unsigned long n, m;
 
-	rational_best_approximation(hsm_clock, vc4_hdmi->audio.samplerate,
+	rational_best_approximation(hsm_clock, samplerate,
 				    VC4_HD_MAI_SMP_N_MASK >>
 				    VC4_HD_MAI_SMP_N_SHIFT,
 				    (VC4_HD_MAI_SMP_M_MASK >>
@@ -1025,12 +1026,11 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi)
 		   VC4_SET_FIELD(m - 1, VC4_HD_MAI_SMP_M));
 }
 
-static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi)
+static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int samplerate)
 {
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_crtc *crtc = encoder->crtc;
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	u32 samplerate = vc4_hdmi->audio.samplerate;
 	u32 n, cts;
 	u64 tmp;
 
@@ -1164,27 +1164,25 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
+	unsigned int sample_rate = params->sample_rate;
+	unsigned int channels = params->channels;
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map;
 	u32 mai_audio_format;
 	u32 mai_sample_rate;
 
 	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
-		params->sample_rate, params->sample_width,
-		params->channels);
-
-	vc4_hdmi->audio.channels = params->channels;
-	vc4_hdmi->audio.samplerate = params->sample_rate;
+		sample_rate, params->sample_width, channels);
 
 	HDMI_WRITE(HDMI_MAI_CTL,
-		   VC4_SET_FIELD(params->channels, VC4_HD_MAI_CTL_CHNUM) |
+		   VC4_SET_FIELD(channels, VC4_HD_MAI_CTL_CHNUM) |
 		   VC4_HD_MAI_CTL_WHOLSMP |
 		   VC4_HD_MAI_CTL_CHALIGN |
 		   VC4_HD_MAI_CTL_ENABLE);
 
-	vc4_hdmi_audio_set_mai_clock(vc4_hdmi);
+	vc4_hdmi_audio_set_mai_clock(vc4_hdmi, sample_rate);
 
-	mai_sample_rate = sample_rate_to_mai_fmt(vc4_hdmi->audio.samplerate);
+	mai_sample_rate = sample_rate_to_mai_fmt(sample_rate);
 	if (params->iec.status[0] & IEC958_AES0_NONAUDIO &&
 	    params->channels == 8)
 		mai_audio_format = VC4_HDMI_MAI_FORMAT_HBR;
@@ -1202,7 +1200,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 		VC4_HDMI_AUDIO_PACKET_ZERO_DATA_ON_INACTIVE_CHANNELS |
 		VC4_SET_FIELD(0x8, VC4_HDMI_AUDIO_PACKET_B_FRAME_IDENTIFIER);
 
-	channel_mask = GENMASK(vc4_hdmi->audio.channels - 1, 0);
+	channel_mask = GENMASK(channels - 1, 0);
 	audio_packet_config |= VC4_SET_FIELD(channel_mask,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
@@ -1221,7 +1219,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	channel_map = vc4_hdmi->variant->channel_map(vc4_hdmi, channel_mask);
 	HDMI_WRITE(HDMI_MAI_CHANNEL_MAP, channel_map);
 	HDMI_WRITE(HDMI_AUDIO_PACKET_CONFIG, audio_packet_config);
-	vc4_hdmi_set_n_cts(vc4_hdmi);
+	vc4_hdmi_set_n_cts(vc4_hdmi, sample_rate);
 
 	memcpy(&vc4_hdmi->audio.infoframe, &params->cea, sizeof(params->cea));
 	vc4_hdmi_set_audio_infoframe(encoder);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index fdee27faafa3..574f379faf93 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -108,8 +108,6 @@ struct vc4_hdmi_audio {
 	struct snd_soc_dai_link_component cpu;
 	struct snd_soc_dai_link_component codec;
 	struct snd_soc_dai_link_component platform;
-	int samplerate;
-	int channels;
 	struct snd_dmaengine_dai_dma_data dma_data;
 	struct hdmi_audio_infoframe infoframe;
 	bool streaming;
-- 
2.31.1

