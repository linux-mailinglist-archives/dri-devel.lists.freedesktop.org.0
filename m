Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D13766A1
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 16:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC186E237;
	Fri,  7 May 2021 14:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B426E237
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 14:04:54 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A409BC82;
 Fri,  7 May 2021 10:04:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 07 May 2021 10:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=p4zNkQ6XqSu53
 1sqVPafbjFGIX0E1EULqXXdj3asw88=; b=b+o1gs9kqt42h8FDXMFQBMaAq5EIY
 Y61zxCthjPYd0PYYRRmVFk4Y6hbhQSbyda3qcwLQ0W6UwbomliRnH3DnqesUPUox
 dn0v9KN5aYmE1zpMqK66JWUO8akYPvTTC58WSDoX3gMRDNhxe8kUeOEeKMusy4jr
 oPnYlbQ8G+JfCUFIEC+y5PldrOgBiePSU87UTJlDcW8aDzGA0oHLUPnwhC3dEWLD
 cLeVUiMCbKAQND18f3JGccjePbq/ONBi1C2uIlFfNycXFncEjsUgxonjV1iPXZOo
 zcxUmyZ0ja3I+eYItvRAKsXgIH3cErYa2XsWGfs9qSyLj3hj3u9XX4FEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=p4zNkQ6XqSu531sqVPafbjFGIX0E1EULqXXdj3asw88=; b=sfgEYNl3
 KEYOaerCWT0EZO7ibWnt8UIbcFyT7qlk56JtzvjvAv8caTmTPrxq84a+oaNFQiKK
 3tPXP50iyFZeerowCaIQpT8+aaGScaFWZ78sQ5cDXKAQte/lMjwV7kP/kOjxv84r
 nrwAiHbFNGaeSdqn/PAaSjOV2TbgDselj/+5sGMsZgFeHKWVDhzNc902tYBK9zAh
 K1MmlV1eCexg8rjJOtYQP3km3ppxyoa9/JIWxBl+0Z91XHOKoeUB0Qe1ojGTSKlE
 hN6Jy4uoBd8lSjBUIyuhN21Nvx+AFSemwDhaWYcFc9BvnxFBoignlgq5iKO97suW
 sgU0c2KCA0lXqw==
X-ME-Sender: <xms:BEmVYG_AmEyOlku4kJKBRS-KAsQb6Hqdgq_u9iO7qK4SYgGr55ga3g>
 <xme:BEmVYGvFN8pqCAMEhDjBIx4WfHjp8NbXNGQfklBjAPkaETbXEkZ8vmPIQzf1xhBPG
 45-WeG-E6JkQvvqAsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BEmVYMCIIfUjZc_JH8hRPP-Li0zjGQ-r3FaH6QUAT6lDe_jaiqWJSg>
 <xmx:BEmVYOclB1Y3j-b-u84Qlxs0v6q8-Y-YfELrNjn37dpOWocNUChVyw>
 <xmx:BEmVYLNxUIz_mYWEXvdKgU38cX0d59dFuAGjgzHF5WnEZ2hKgBSbpQ>
 <xmx:BEmVYC--udB5snsYV8MDhU2i9uafBmlFmnKy0kxCQViD10DLVjiVl7URYw8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:04:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 02/11] ASoC: hdmi-codec: Rework to support more controls
Date: Fri,  7 May 2021 16:03:25 +0200
Message-Id: <20210507140334.204865-3-maxime@cerno.tech>
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

We're going to add more controls to support the IEC958 output, so let's
rework the control registration a bit to support more of them.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/hdmi-codec.c | 43 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 422539f933de..bc0d695d2df0 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -621,21 +621,23 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 			 SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |\
 			 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
-static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
-			      struct snd_soc_dai *dai)
-{
-	struct snd_soc_dai_driver *drv = dai->driver;
-	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	struct snd_kcontrol *kctl;
-	struct snd_kcontrol_new hdmi_eld_ctl = {
-		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
-			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+struct snd_kcontrol_new hdmi_codec_controls[] = {
+	{
+		.access	= (SNDRV_CTL_ELEM_ACCESS_READ |
+			   SNDRV_CTL_ELEM_ACCESS_VOLATILE),
 		.iface	= SNDRV_CTL_ELEM_IFACE_PCM,
 		.name	= "ELD",
 		.info	= hdmi_eld_ctl_info,
 		.get	= hdmi_eld_ctl_get,
-		.device	= rtd->pcm->device,
-	};
+	},
+};
+
+static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_soc_dai_driver *drv = dai->driver;
+	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	unsigned int i;
 	int ret;
 
 	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -652,12 +654,21 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	hcp->chmap_info->chmap = hdmi_codec_stereo_chmaps;
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 
-	/* add ELD ctl with the device number corresponding to the PCM stream */
-	kctl = snd_ctl_new1(&hdmi_eld_ctl, dai->component);
-	if (!kctl)
-		return -ENOMEM;
+	for (i = 0; i < ARRAY_SIZE(hdmi_codec_controls); i++) {
+		struct snd_kcontrol *kctl;
 
-	return snd_ctl_add(rtd->card->snd_card, kctl);
+		/* add ELD ctl with the device number corresponding to the PCM stream */
+		kctl = snd_ctl_new1(&hdmi_codec_controls[i], dai->component);
+		if (!kctl)
+			return -ENOMEM;
+
+		kctl->id.device = rtd->pcm->device;
+		ret = snd_ctl_add(rtd->card->snd_card, kctl);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int hdmi_dai_probe(struct snd_soc_dai *dai)
-- 
2.31.1

