Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD83766B4
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 16:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C576EE21;
	Fri,  7 May 2021 14:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6577B6EE21
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 14:05:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7ED8410B3;
 Fri,  7 May 2021 10:05:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 07 May 2021 10:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=09Uy7WBQq+HSR
 IIAHfkcUVN6cbj3/ew7Bu74jQE0zCQ=; b=jfMTjgN6Ph8uI2vHB24py8kSZ6+zu
 sQmbzGybTOZ6JXQSvxyKUWL503Eb4+bvFB3SHkO2UFi4Lv+SIHVc2nkLTk05bUm2
 TywWoX/GpBPlv0QBlE1wZNU5e3stXRe9pHktoeklGai6p8QamOzmtmuBGdrOeBWY
 S+RVeDahnot4XZYubxFA3HQsFi7eS0+YBQtfrof27MeG6iv9+3VNvGn+zZCjNOMO
 DdycOZD+Ul2ZxLAaFy4/A9oZLHgmuWE0gsnBUHJgpaPkvJ34NWagnC+ErOM/lwcM
 wcxiAVdO2g2KwIz1MrhHm9Q/Dr8eNkLPRf2qMNFRGkf34phL7HV5o+3TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=09Uy7WBQq+HSRIIAHfkcUVN6cbj3/ew7Bu74jQE0zCQ=; b=klSAYgTR
 eQCncZDLh+iqithFC+O5g8bXKxUtxiAdPtmgToa4C8uyBVWUuboH4I+7W8/rhUCj
 Kb9RNrvMWSaIIUHWB6+ghUe324rHlfl1Z7i7E28IWQgf+6s2N4v35EDtZkVPAQjK
 PAbF9+pa5dBcJoaT21LqslOyEQFYC62XBM4bX9hrSpv6z+/L8ay9nrlxaQ3/LTwJ
 LLXZF9x8keB8XkGtXW2ncZp9qZ5/DFsoMI17F6EHasE9uA0LOk5soA+ljgF5MHHZ
 zTUkGUusRMRv0XrHCqDkB58zr8lBySifnoMZwf8V/yKiRJt06xcfcDd2C6+wcZ+j
 q2jYk6mHiEl3lQ==
X-ME-Sender: <xms:LUmVYB1cmv6zFxFWWS4LpgEpec7bXCApm0oqXVCGCEPxYSgkFmy17A>
 <xme:LUmVYIFiLW_ap9PE4NopXlfKBWHdMn3k0chj1f-lYvCCPwu2i6frcY44Eq2ToKQz-
 Ii67PhyRiNCVaAQKOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepieeugeefgfeiieelveekheehhedtueetueehkedtfffgvedtvdeijeduieff
 veevnecuffhomhgrihhnpegshihtvghsrdgurghtrgenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LUmVYB4vH8F-rW1Np5KDCqHlxokZ2Xv_GVjX7QVCsrt2pvC8G6qFGg>
 <xmx:LUmVYO1vJ_fjGCV7i9fzxgD6WJkqM6C0JYE0NEKABbkXTMyUbcSkqg>
 <xmx:LUmVYEFaGZthE4T5IxcKQDFIW_uQLqplfLoZQd5tv2uI2U4alB6CCQ>
 <xmx:L0mVYN3IyA_axx_IkNGvGyhkzQMPw-jCTgCmx44q80LejTM4ur_Qk1Lhy_k>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:05:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 09/11] drm/vc4: hdmi: Register HDMI codec
Date: Fri,  7 May 2021 16:03:32 +0200
Message-Id: <20210507140334.204865-10-maxime@cerno.tech>
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

The hdmi-codec brings a lot of advanced features, including the HDMI
channel mapping. Let's use it in our driver instead of our own codec.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/Kconfig    |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 243 +++++++++++----------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |   3 +-
 3 files changed, 80 insertions(+), 167 deletions(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 118e8a426b1a..345a5570a3da 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -12,6 +12,7 @@ config DRM_VC4
 	select SND_PCM
 	select SND_PCM_ELD
 	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_SOC_HDMI_CODEC
 	select DRM_MIPI_DSI
 	help
 	  Choose this option if you have a system that has a Broadcom
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 505574e6cfd3..19739b57d067 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -45,6 +45,7 @@
 #include <linux/rational.h>
 #include <linux/reset.h>
 #include <sound/dmaengine_pcm.h>
+#include <sound/hdmi-codec.h>
 #include <sound/pcm_drm_eld.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -420,15 +421,10 @@ static void vc4_hdmi_set_spd_infoframe(struct drm_encoder *encoder)
 static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct hdmi_audio_infoframe *audio = &vc4_hdmi->audio.infoframe;
 	union hdmi_infoframe frame;
 
-	hdmi_audio_infoframe_init(&frame.audio);
-
-	frame.audio.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
-	frame.audio.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
-	frame.audio.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
-	frame.audio.channels = vc4_hdmi->audio.channels;
-
+	memcpy(&frame.audio, audio, sizeof(*audio));
 	vc4_hdmi_write_infoframe(encoder, &frame);
 }
 
@@ -1063,18 +1059,10 @@ static inline struct vc4_hdmi *dai_to_hdmi(struct snd_soc_dai *dai)
 	return snd_soc_card_get_drvdata(card);
 }
 
-static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
-				  struct snd_soc_dai *dai)
+static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 {
-	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
+	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
-	struct drm_connector *connector = &vc4_hdmi->connector;
-	int ret;
-
-	if (vc4_hdmi->audio.substream && vc4_hdmi->audio.substream != substream)
-		return -EINVAL;
-
-	vc4_hdmi->audio.substream = substream;
 
 	/*
 	 * If the HDMI encoder hasn't probed, or the encoder is
@@ -1084,15 +1072,18 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 				VC4_HDMI_RAM_PACKET_ENABLE))
 		return -ENODEV;
 
-	ret = snd_pcm_hw_constraint_eld(substream->runtime, connector->eld);
-	if (ret)
-		return ret;
+	vc4_hdmi->audio.streaming = true;
 
-	return 0;
-}
+	HDMI_WRITE(HDMI_MAI_CTL,
+		   VC4_HD_MAI_CTL_RESET |
+		   VC4_HD_MAI_CTL_FLUSH |
+		   VC4_HD_MAI_CTL_DLATE |
+		   VC4_HD_MAI_CTL_ERRORE |
+		   VC4_HD_MAI_CTL_ERRORF);
+
+	if (vc4_hdmi->variant->phy_rng_enable)
+		vc4_hdmi->variant->phy_rng_enable(vc4_hdmi);
 
-static int vc4_hdmi_audio_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-{
 	return 0;
 }
 
@@ -1112,17 +1103,20 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	HDMI_WRITE(HDMI_MAI_CTL, VC4_HD_MAI_CTL_FLUSH);
 }
 
-static void vc4_hdmi_audio_shutdown(struct snd_pcm_substream *substream,
-				    struct snd_soc_dai *dai)
+static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
 {
-	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
+	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 
-	if (substream != vc4_hdmi->audio.substream)
-		return;
+	HDMI_WRITE(HDMI_MAI_CTL,
+		   VC4_HD_MAI_CTL_DLATE |
+		   VC4_HD_MAI_CTL_ERRORE |
+		   VC4_HD_MAI_CTL_ERRORF);
 
+	if (vc4_hdmi->variant->phy_rng_disable)
+		vc4_hdmi->variant->phy_rng_disable(vc4_hdmi);
+
+	vc4_hdmi->audio.streaming = false;
 	vc4_hdmi_audio_reset(vc4_hdmi);
-
-	vc4_hdmi->audio.substream = NULL;
 }
 
 static int sample_rate_to_mai_fmt(int samplerate)
@@ -1164,39 +1158,38 @@ static int sample_rate_to_mai_fmt(int samplerate)
 }
 
 /* HDMI audio codec callbacks */
-static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
-				    struct snd_pcm_hw_params *params,
-				    struct snd_soc_dai *dai)
+static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
 {
-	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
+	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
-	struct device *dev = &vc4_hdmi->pdev->dev;
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map;
 	u32 mai_audio_format;
 	u32 mai_sample_rate;
 
-	if (substream != vc4_hdmi->audio.substream)
-		return -EINVAL;
-
 	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
-		params_rate(params), params_width(params),
-		params_channels(params));
+		params->sample_rate, params->sample_width,
+		params->channels);
 
-	vc4_hdmi->audio.channels = params_channels(params);
-	vc4_hdmi->audio.samplerate = params_rate(params);
+	vc4_hdmi->audio.channels = params->channels;
+	vc4_hdmi->audio.samplerate = params->sample_rate;
 
 	HDMI_WRITE(HDMI_MAI_CTL,
-		   VC4_HD_MAI_CTL_RESET |
-		   VC4_HD_MAI_CTL_FLUSH |
-		   VC4_HD_MAI_CTL_DLATE |
-		   VC4_HD_MAI_CTL_ERRORE |
-		   VC4_HD_MAI_CTL_ERRORF);
+		   VC4_SET_FIELD(params->channels, VC4_HD_MAI_CTL_CHNUM) |
+		   VC4_HD_MAI_CTL_WHOLSMP |
+		   VC4_HD_MAI_CTL_CHALIGN |
+		   VC4_HD_MAI_CTL_ENABLE);
 
 	vc4_hdmi_audio_set_mai_clock(vc4_hdmi);
 
 	mai_sample_rate = sample_rate_to_mai_fmt(vc4_hdmi->audio.samplerate);
-	mai_audio_format = VC4_HDMI_MAI_FORMAT_PCM;
+	if (params->iec.status[0] & IEC958_AES0_NONAUDIO &&
+	    params->channels == 8)
+		mai_audio_format = VC4_HDMI_MAI_FORMAT_HBR;
+	else
+		mai_audio_format = VC4_HDMI_MAI_FORMAT_PCM;
 	HDMI_WRITE(HDMI_MAI_FMT,
 		   VC4_SET_FIELD(mai_sample_rate,
 				 VC4_HDMI_MAI_FORMAT_SAMPLE_RATE) |
@@ -1230,94 +1223,12 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 	HDMI_WRITE(HDMI_AUDIO_PACKET_CONFIG, audio_packet_config);
 	vc4_hdmi_set_n_cts(vc4_hdmi);
 
+	memcpy(&vc4_hdmi->audio.infoframe, &params->cea, sizeof(params->cea));
 	vc4_hdmi_set_audio_infoframe(encoder);
 
 	return 0;
 }
 
-static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
-				  struct snd_soc_dai *dai)
-{
-	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-		vc4_hdmi->audio.streaming = true;
-
-		if (vc4_hdmi->variant->phy_rng_enable)
-			vc4_hdmi->variant->phy_rng_enable(vc4_hdmi);
-
-		HDMI_WRITE(HDMI_MAI_CTL,
-			   VC4_SET_FIELD(vc4_hdmi->audio.channels,
-					 VC4_HD_MAI_CTL_CHNUM) |
-					 VC4_HD_MAI_CTL_WHOLSMP |
-					 VC4_HD_MAI_CTL_CHALIGN |
-					 VC4_HD_MAI_CTL_ENABLE);
-		break;
-	case SNDRV_PCM_TRIGGER_STOP:
-		HDMI_WRITE(HDMI_MAI_CTL,
-			   VC4_HD_MAI_CTL_DLATE |
-			   VC4_HD_MAI_CTL_ERRORE |
-			   VC4_HD_MAI_CTL_ERRORF);
-
-		if (vc4_hdmi->variant->phy_rng_disable)
-			vc4_hdmi->variant->phy_rng_disable(vc4_hdmi);
-
-		vc4_hdmi->audio.streaming = false;
-
-		break;
-	default:
-		break;
-	}
-
-	return 0;
-}
-
-static inline struct vc4_hdmi *
-snd_component_to_hdmi(struct snd_soc_component *component)
-{
-	struct snd_soc_card *card = snd_soc_component_get_drvdata(component);
-
-	return snd_soc_card_get_drvdata(card);
-}
-
-static int vc4_hdmi_audio_eld_ctl_info(struct snd_kcontrol *kcontrol,
-				       struct snd_ctl_elem_info *uinfo)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct vc4_hdmi *vc4_hdmi = snd_component_to_hdmi(component);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
-	uinfo->count = sizeof(connector->eld);
-
-	return 0;
-}
-
-static int vc4_hdmi_audio_eld_ctl_get(struct snd_kcontrol *kcontrol,
-				      struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct vc4_hdmi *vc4_hdmi = snd_component_to_hdmi(component);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-
-	memcpy(ucontrol->value.bytes.data, connector->eld,
-	       sizeof(connector->eld));
-
-	return 0;
-}
-
-static const struct snd_kcontrol_new vc4_hdmi_audio_controls[] = {
-	{
-		.access = SNDRV_CTL_ELEM_ACCESS_READ |
-			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
-		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
-		.name = "ELD",
-		.info = vc4_hdmi_audio_eld_ctl_info,
-		.get = vc4_hdmi_audio_eld_ctl_get,
-	},
-};
-
 static const struct snd_soc_dapm_widget vc4_hdmi_audio_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("TX"),
 };
@@ -1328,8 +1239,6 @@ static const struct snd_soc_dapm_route vc4_hdmi_audio_routes[] = {
 
 static const struct snd_soc_component_driver vc4_hdmi_audio_component_drv = {
 	.name			= "vc4-hdmi-codec-dai-component",
-	.controls		= vc4_hdmi_audio_controls,
-	.num_controls		= ARRAY_SIZE(vc4_hdmi_audio_controls),
 	.dapm_widgets		= vc4_hdmi_audio_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(vc4_hdmi_audio_widgets),
 	.dapm_routes		= vc4_hdmi_audio_routes,
@@ -1340,28 +1249,6 @@ static const struct snd_soc_component_driver vc4_hdmi_audio_component_drv = {
 	.non_legacy_dai_naming	= 1,
 };
 
-static const struct snd_soc_dai_ops vc4_hdmi_audio_dai_ops = {
-	.startup = vc4_hdmi_audio_startup,
-	.shutdown = vc4_hdmi_audio_shutdown,
-	.hw_params = vc4_hdmi_audio_hw_params,
-	.set_fmt = vc4_hdmi_audio_set_fmt,
-	.trigger = vc4_hdmi_audio_trigger,
-};
-
-static struct snd_soc_dai_driver vc4_hdmi_audio_codec_dai_drv = {
-	.name = "vc4-hdmi-hifi",
-	.playback = {
-		.stream_name = "Playback",
-		.channels_min = 2,
-		.channels_max = 8,
-		.rates = SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
-			 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |
-			 SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |
-			 SNDRV_PCM_RATE_192000,
-		.formats = SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
-	},
-};
-
 static const struct snd_soc_component_driver vc4_hdmi_audio_cpu_dai_comp = {
 	.name = "vc4-hdmi-cpu-dai-component",
 };
@@ -1388,7 +1275,6 @@ static struct snd_soc_dai_driver vc4_hdmi_audio_cpu_dai_drv = {
 			 SNDRV_PCM_RATE_192000,
 		.formats = SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
 	},
-	.ops = &vc4_hdmi_audio_dai_ops,
 };
 
 static const struct snd_dmaengine_pcm_config pcm_conf = {
@@ -1396,6 +1282,31 @@ static const struct snd_dmaengine_pcm_config pcm_conf = {
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
 };
 
+
+static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
+				  uint8_t *buf, size_t len)
+{
+	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct drm_connector *connector = &vc4_hdmi->connector;
+
+	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops vc4_hdmi_codec_ops = {
+	.get_eld = vc4_hdmi_audio_get_eld,
+	.prepare = vc4_hdmi_audio_prepare,
+	.audio_shutdown = vc4_hdmi_audio_shutdown,
+	.audio_startup = vc4_hdmi_audio_startup,
+};
+
+struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
+	.ops = &vc4_hdmi_codec_ops,
+	.max_i2s_channels = 8,
+	.i2s = 1,
+};
+
 static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
 	const struct vc4_hdmi_register *mai_data =
@@ -1403,6 +1314,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
+	struct platform_device *codec_pdev;
 	const __be32 *addr;
 	int index;
 	int ret;
@@ -1449,12 +1361,13 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 		return ret;
 	}
 
-	/* register component and codec dai */
-	ret = devm_snd_soc_register_component(dev, &vc4_hdmi_audio_component_drv,
-				     &vc4_hdmi_audio_codec_dai_drv, 1);
-	if (ret) {
-		dev_err(dev, "Could not register component: %d\n", ret);
-		return ret;
+	codec_pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+						   PLATFORM_DEVID_AUTO,
+						   &vc4_hdmi_codec_pdata,
+						   sizeof(vc4_hdmi_codec_pdata));
+	if (IS_ERR(codec_pdev)) {
+		dev_err(dev, "Couldn't register the HDMI codec: %ld\n", PTR_ERR(codec_pdev));
+		return PTR_ERR(codec_pdev);
 	}
 
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
@@ -1467,9 +1380,9 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 
 	dai_link->name = "MAI";
 	dai_link->stream_name = "MAI PCM";
-	dai_link->codecs->dai_name = vc4_hdmi_audio_codec_dai_drv.name;
+	dai_link->codecs->dai_name = "i2s-hifi";
 	dai_link->cpus->dai_name = dev_name(dev);
-	dai_link->codecs->name = dev_name(dev);
+	dai_link->codecs->name = dev_name(&codec_pdev->dev);
 	dai_link->platforms->name = dev_name(dev);
 
 	card->dai_link = dai_link;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 3cebd1fd00fc..fdee27faafa3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -111,8 +111,7 @@ struct vc4_hdmi_audio {
 	int samplerate;
 	int channels;
 	struct snd_dmaengine_dai_dma_data dma_data;
-	struct snd_pcm_substream *substream;
-
+	struct hdmi_audio_infoframe infoframe;
 	bool streaming;
 };
 
-- 
2.31.1

