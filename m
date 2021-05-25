Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE0390237
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4E86EA13;
	Tue, 25 May 2021 13:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C216EA13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:24:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id C54BF580706;
 Tue, 25 May 2021 09:24:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 25 May 2021 09:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=wbZxITDCe0XGb
 MeBmFn7GYofbIW9DMDPBBXtnyxF65U=; b=qwievrlUa22NexRwqfDPQvwWjif1D
 XXbHHObmkvADyL04L807xvftlaFsHb0DGJWudwXb4c3MpidZgd1rbA+f+zWOdqZq
 wjhfqyBi2+SKujXCg2ATJQWAIlH6Rn/FaAde8gotMrFBg7/bPO6Dp/dYUj+437VQ
 UbmuSoclCzKJrCbvgnBY98T4eZZWojE4EX0G9dtjw+n6T/2PPziPZ5gpl3yLHRoh
 ycx9mbW0Edv0KPSfSuK4C7+5ewIPLsI1HHrMVVJu/Wb0Vik/R0XihpOZqy+cVMzq
 D/niTSbXCXeTzoN+AzX9BVgcX9rrPgnlLOaIVVa8+qC56wRrFXarrsicw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=wbZxITDCe0XGbMeBmFn7GYofbIW9DMDPBBXtnyxF65U=; b=r/M5ZpxE
 ojJdIBpVZiU7xsU7taCs0BcXl/dHDU7xx92mn0mXKg1RzjAwXLzLkYG91bUJGBM/
 ++bBbJ+HUbDpwWftgErJ3i8Q1kO/ke2irvMnSdthoUGPNrQAcRRSaPRWscOMqUJh
 1DaAVWwHfJc4w4OUafv1c+uStKnbRjal2knRv5wGI6N0TaBRJEn9n6LR1RstDBvL
 BKJ08hpI3d9l3w9I6ddDYKgIKCYMWHubyYsS+hIXNt9AQSNl7JFsKoXvTol1T8kt
 lqvMEL4W2vGqrdvOUF33N0WRueIGwdaRgwE9g4XaI2WFDwK6sPYVGBvzZKUgefJB
 evLnoi9gZ0I4Yw==
X-ME-Sender: <xms:dvqsYBZK0TIcZQWjghhf5N_kyAbop78bcaKb0VjxOmH9UQjoSzmbjw>
 <xme:dvqsYIZr6lMelO-2LYKdfvK1smpDyBUI8pJxnmTYtCgHh39rG0uzd-9P6y4bFVLZy
 BoY2wIjdSR62cbjKFY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dvqsYD-EUqIMJ_yOvtZ1_JAeU2f8P4pLnTAFANuuGwsJPombUpieOw>
 <xmx:dvqsYPpU6hBA9AOfkTniVRUAmBxmTWgD8Aj9kavkRjUB09QfR2_fgw>
 <xmx:dvqsYMqO2hoF6IO4n02KBKOof6Hgu8Dr1ONrdtnrmyaQYS1sNF08nQ>
 <xmx:dvqsYOjfifIucF1ia8Oh0F6I9C2MTnDHuez7l_tcIzoPxG0kDWXyhw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 03/12] ASoC: hdmi-codec: Rework to support more controls
Date: Tue, 25 May 2021 15:23:45 +0200
Message-Id: <20210525132354.297468-4-maxime@cerno.tech>
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

We're going to add more controls to support the IEC958 output, so let's
rework the control registration a bit to support more of them.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/hdmi-codec.c | 43 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 1567ba196ab9..65bde6f0ea1c 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -620,21 +620,23 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
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
@@ -651,12 +653,21 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
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

