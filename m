Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A817F3766A2
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 16:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6386E523;
	Fri,  7 May 2021 14:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727986E523
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 14:05:01 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 90C5110D9;
 Fri,  7 May 2021 10:04:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 07 May 2021 10:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0tCZUVm0Lzbwz
 sTVp/1htol6gCR0oAWdginEPnGYXF4=; b=Ynaf956GV8wbJXhvbajTdKtfun1wW
 zjGaLO9RbkGM6Ouyoutlv/Hg6a3NkRMI6DHto/e3OaAYA7+tk9uYIOl8E5Z9EZgD
 wBXD3axDk1NUJ4/7H6v/Edy48teBjjo8INWUX98uHs0RC77oS3az9Yv6jjb2Hyx8
 btkabc+em++s4LfMSDQFhUVtg7YHALj7tVMhWaaDoT4tZQBt6BkAruI4fz5355W9
 Y5NKFByLefd8yMsXhQ8WQu7A+f49L5I7YpLCyCOtysRKf+MOBBAEGAepLJTEQ6cj
 qUgAyV6PGccvNBziQqJcr94rozl04AnkedKuI2bysOEhI6+RIIkFq535g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0tCZUVm0LzbwzsTVp/1htol6gCR0oAWdginEPnGYXF4=; b=sS7Y9NvX
 VDZ3nM/GcQCub7C3/JoE4MyreKyEoAVvMbDVQueqf5PfpufL+K+VuELMdX4Pc+tv
 RNAK9XyF9hwpsRXCqLyYz9Yx4VamEUFpnfjVrVzaoF9V1hHG70uiIoDxFzTMEbdP
 bVfBtEPfhm4bOExQH0dVWd6fykVp7Er9W916qlqpU49KdAI5pHKzJw9IHQLH4hYh
 q2+fnO0IW97Z/6gxYGpkXsnxpB9E/kyMGX0cU7xxQtX2TwHtkvmC8hx9HXMzqX+N
 dwlpbfG+kpXkGF1RHZEu7tBlSh3QWZKkyv2fW3DtK0VzYMb9LdZJ7x1SvrAGhIRA
 vnsgnifyKzNBLw==
X-ME-Sender: <xms:CUmVYEryuC1OEEzC82JqulSjZWCaZgh9i320mYgh_dwzwMJnNCYgZw>
 <xme:CUmVYKrBm3HlrsItIyv8zkA-asGMzQ6hFrFJjWyE0kJNYzfXZ1B-kgFtK_C9r9Yzc
 YKbozCfbHlj2LnrRXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CUmVYJOJaDt7v40suSMqvQOhTHs5uIKtMf-2aFpNJU-aS3GmpIEtwQ>
 <xmx:CUmVYL4RhMlOkhkgNXVFSBw0B1K7qRLcNiqto0tMOsvNs_mF3jiUWQ>
 <xmx:CUmVYD4GmNBLLv_2bz9lvauThC7jRuJ-7oCCkXhHtwwGP_90oyMM1w>
 <xmx:C0mVYIr5lrviq9klt-4ahWejS_JaCcXceeD9Tkd760al6MyNbrAySWt8--A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:04:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 03/11] ASoC: hdmi-codec: Add iec958 controls
Date: Fri,  7 May 2021 16:03:26 +0200
Message-Id: <20210507140334.204865-4-maxime@cerno.tech>
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
 sound/soc/codecs/hdmi-codec.c | 66 +++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index bc0d695d2df0..45081f928680 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -278,6 +278,7 @@ struct hdmi_codec_priv {
 	bool busy;
 	struct snd_soc_jack *jack;
 	unsigned int jack_status;
+	u8 iec_status[5];
 };
 
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
@@ -386,6 +387,47 @@ static int hdmi_codec_chmap_ctl_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int hdmi_codec_iec958_info(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+	return 0;
+}
+
+static int hdmi_codec_iec958_default_get(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	memcpy(ucontrol->value.iec958.status, hcp->iec_status,
+	       sizeof(hcp->iec_status));
+
+	return 0;
+}
+
+static int hdmi_codec_iec958_default_put(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	memcpy(hcp->iec_status, ucontrol->value.iec958.status,
+	       sizeof(hcp->iec_status));
+
+	return 0;
+}
+
+static int hdmi_codec_iec958_mask_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	memset(ucontrol->value.iec958.status, 0xff,
+	       sizeof_field(struct hdmi_codec_priv, iec_status));
+
+	return 0;
+}
+
 static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
@@ -460,8 +502,9 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 		params_width(params), params_rate(params),
 		params_channels(params));
 
-	ret = snd_pcm_create_iec958_consumer_hw_params(params, hp.iec.status,
-						       sizeof(hp.iec.status));
+	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp->iec_status));
+	ret = snd_pcm_fill_iec958_consumer_hw_params(params, hp.iec.status,
+						     sizeof(hp.iec.status));
 	if (ret < 0) {
 		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
 			ret);
@@ -622,6 +665,20 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 			 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 struct snd_kcontrol_new hdmi_codec_controls[] = {
+	{
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, MASK),
+		.info = hdmi_codec_iec958_info,
+		.get = hdmi_codec_iec958_mask_get,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
+		.info = hdmi_codec_iec958_info,
+		.get = hdmi_codec_iec958_default_get,
+		.put = hdmi_codec_iec958_default_put,
+	},
 	{
 		.access	= (SNDRV_CTL_ELEM_ACCESS_READ |
 			   SNDRV_CTL_ELEM_ACCESS_VOLATILE),
@@ -874,6 +931,11 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	hcp->hcd = *hcd;
 	mutex_init(&hcp->lock);
 
+	ret = snd_pcm_create_iec958_consumer_default(hcp->iec_status,
+						     sizeof(hcp->iec_status));
+	if (ret < 0)
+		return ret;
+
 	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv), GFP_KERNEL);
 	if (!daidrv)
 		return -ENOMEM;
-- 
2.31.1

