Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCEC39025D
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6DF6E252;
	Tue, 25 May 2021 13:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D43F6EA27
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:24:49 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EE408580726;
 Tue, 25 May 2021 09:24:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 25 May 2021 09:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=H4G+6d4HafTxP
 4ftH57AjUaxdyuIr+5y2Zm0x2UVvSQ=; b=O92I/IA3JS/7yem6uxUKF73p+uiJk
 h7crnvGyJqBYzmRNjlsGhw9ebEkyQgApc4dU2fF9X7NQC/FViBJTk7LH8+JbKbUf
 PdPIon8mYqTV94ma6KDju3zvrmoHCVfBVJ6XoXKSUSgi3L4c33zVPs/j7MYpSXVw
 G4eNko7sGYF4Bnz/0JH1WvdcFxowfwYieuMjUGbCT7jSn9MrlyMRyU7RLfkty0c1
 eHmnygTtpnD5LZBx8v6cpxrdPp8hY9ex9yzao9jzLP3A5sLUSErzhFSlHLaaUbTx
 6C0adUZ/3/C6k9lFPhuEDsLq8LkronwaVxxIGqIKd/JtzqNT4W/IYwv9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=H4G+6d4HafTxP4ftH57AjUaxdyuIr+5y2Zm0x2UVvSQ=; b=M6E+fmfF
 XWl6rJsuQNnfFbcdFM8EcgDCImeyw4D6yKEKG0FnRA5+tZadzwC+qOjt5nMKdrQ4
 KujN4zeLYzoSS9IgNNgiPiaYATV1ZBLvEuQlHQtPSx8iOMeEbyBKcyMc50yLnuDO
 JD8VfBjas8Yr3WctBxSb6m0y2CBMzGKNDKtPRuVHM0RZc4XiLrZnUIh3N5K1HB9n
 xvmAGeu+A/o68hHG9v+WA9a+eEl6En+emwqBkEGhd5a2x1176Rcns8AysW1GmnLc
 /HRS76vltPnvwVzIT0mk4W7YkbVpFYw4cqzMd+WFXkozCuJnSMhfN96crL02Zxgs
 wRAfwUU7uy1srQ==
X-ME-Sender: <xms:i_qsYJG6vYRxGpqa7s48ojVVg2X-waSVsPEdib4kUW35XX5W4v5KjA>
 <xme:i_qsYOXRCP5hu0vtnWOninf9YYD0xlECXCxI-BRjJk4EfWie46amPmhlD9mM2ugzu
 waTP1Uo1kCejr0YN0s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:i_qsYLJ00SKTDVENyPtIuAtmbkleAmYHiDA1pYSVpA-AGWUkXBJJZA>
 <xmx:i_qsYPEHAjdf2qF0FRBryt0DRjdUqnUr86iO4uRJ0HSdc-E-9oWwnA>
 <xmx:i_qsYPWrb8v46o2XNmLtte6PTJY-ez26qTsfaQEBnCcUme980YkbJQ>
 <xmx:i_qsYF9aIZM6PD6Q3SsjTn6lU2x6Jk9WO8i3tLStG0E9fQ0JxIB3Iw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 11/12] drm/vc4: hdmi: Remove redundant variables
Date: Tue, 25 May 2021 15:23:53 +0200
Message-Id: <20210525132354.297468-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525132354.297468-1-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
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
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++--------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0ecfcf54b70a..c6dafeab4378 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1064,12 +1064,13 @@ static u32 vc5_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
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
@@ -1081,12 +1082,11 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi)
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
 
@@ -1220,27 +1220,25 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
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
@@ -1258,7 +1256,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 		VC4_HDMI_AUDIO_PACKET_ZERO_DATA_ON_INACTIVE_CHANNELS |
 		VC4_SET_FIELD(0x8, VC4_HDMI_AUDIO_PACKET_B_FRAME_IDENTIFIER);
 
-	channel_mask = GENMASK(vc4_hdmi->audio.channels - 1, 0);
+	channel_mask = GENMASK(channels - 1, 0);
 	audio_packet_config |= VC4_SET_FIELD(channel_mask,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
@@ -1277,7 +1275,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	channel_map = vc4_hdmi->variant->channel_map(vc4_hdmi, channel_mask);
 	HDMI_WRITE(HDMI_MAI_CHANNEL_MAP, channel_map);
 	HDMI_WRITE(HDMI_AUDIO_PACKET_CONFIG, audio_packet_config);
-	vc4_hdmi_set_n_cts(vc4_hdmi);
+	vc4_hdmi_set_n_cts(vc4_hdmi, sample_rate);
 
 	memcpy(&vc4_hdmi->audio.infoframe, &params->cea, sizeof(params->cea));
 	vc4_hdmi_set_audio_infoframe(encoder);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 055aa64a47a2..511673cda341 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -111,8 +111,6 @@ struct vc4_hdmi_audio {
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

