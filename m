Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7753766AC
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 16:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276526E17E;
	Fri,  7 May 2021 14:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878B16E17E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 14:05:18 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 9AFDD10B5;
 Fri,  7 May 2021 10:05:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 07 May 2021 10:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=nkQdZXJuk0cxE
 elA5wlSpQhj9rb48V0iqU/erk5ij2s=; b=WNCgn3gwafgcn2JBF5quiVmtFUpGT
 4tEWnmpca5eee1KfZvSXeqNqsXG3rIhKNZ+HuQ0q+PyTIBMii9GFCxHm5Bof34Dq
 2i0x78q5h/e/zGSBkpmwmTE6jCUYIDdgM8Wow6AcWx62lbbtIDEBQMaIuRU2O+W6
 0pmjC4Q1UD9UTHPItLwunXnsXzufqi9lQzRbhwOXilh/MtGOe4p8w18hfXBgaAqm
 tPdvyfKkMnl+IfC+Ib9ZueZOcC7J1mWrUi440Cfz8R6B0nIpaFWxuzqT1rDjxs30
 oQ4kASgKgdm/7rUPUG9vrG37ZSxwDgVqUAxv6EUQVyUvU9wgHKT2jtHhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=nkQdZXJuk0cxEelA5wlSpQhj9rb48V0iqU/erk5ij2s=; b=A99rgBSf
 Xv7TLELRpxa0M0OkDBfW84hTqG2kzADXPkRDHiVg+ldJkwI8kLsoDQVfKMiuPN9J
 FtWLq6yLI3kngBnR6C6t7lUfZj8F+CyrRE5A1OZs8AWkXH3TmTFtAWu2RFxenb0o
 aWpwA1ZG04o4o9M/PpMsCYSRW4v9Q+h5qRrRjqI387pbEk0s8/Zk+ZP6h5IJSXfk
 D5MuSURdA8TIi/wZxRbs7tFcuxijOGYs7/vLMrXLNBUyuYX2itWipuWgCp9Scz0s
 PoI2etFdqTUEbK6eoP4RUJJoy/+lFTj+EaC9Iw9bCA5eBM/aYv8WFc2ZBfDNKw/A
 M11JHmoH7c26EQ==
X-ME-Sender: <xms:GUmVYLQHJqUHbrksuL-76Czw2ayTxqq4yi7wEBePrJFJlimo6ICkxQ>
 <xme:GUmVYMwbA_bRx43omzQmF7ExgAK1p_DmrWjOyJEeaUILLTehC7O-CLJ_acapf6dg2
 HS4sbLZv5Dpk3q8Itg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GUmVYA12vAm5YuuHnHAAJuWUonc82a55LUWYTaVqhjo8K8f3pmPcrg>
 <xmx:GUmVYLBdLdYpRhSd6BrPLwOUvqgVn5xz0r9OgwIrHmosRNtUoehM2w>
 <xmx:GUmVYEjIAC747l5SjtjOf2FhQ1iGz1xkyQh_PPVwcrxzAGxt01e3Hw>
 <xmx:HEmVYMThXe4RN2wQb-RO1Zg6snpcG8L60dyieaVUz-8Y6FJks34SE0gvqqo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:05:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 06/11] drm/vc4: hdmi: Set HDMI_MAI_FMT
Date: Fri,  7 May 2021 16:03:29 +0200
Message-Id: <20210507140334.204865-7-maxime@cerno.tech>
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
 Dom Cobley <popcornmix@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

The hardware uses this for generating the right audio
data island packets when using formats other than PCM

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 48 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_regs.h | 30 +++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 459d76414a29..9d33ac464a2d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1125,6 +1125,44 @@ static void vc4_hdmi_audio_shutdown(struct snd_pcm_substream *substream,
 	vc4_hdmi->audio.substream = NULL;
 }
 
+static int sample_rate_to_mai_fmt(int samplerate)
+{
+	switch (samplerate) {
+	case 8000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_8000;
+	case 11025:
+		return VC4_HDMI_MAI_SAMPLE_RATE_11025;
+	case 12000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_12000;
+	case 16000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_16000;
+	case 22050:
+		return VC4_HDMI_MAI_SAMPLE_RATE_22050;
+	case 24000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_24000;
+	case 32000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_32000;
+	case 44100:
+		return VC4_HDMI_MAI_SAMPLE_RATE_44100;
+	case 48000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_48000;
+	case 64000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_64000;
+	case 88200:
+		return VC4_HDMI_MAI_SAMPLE_RATE_88200;
+	case 96000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_96000;
+	case 128000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_128000;
+	case 176400:
+		return VC4_HDMI_MAI_SAMPLE_RATE_176400;
+	case 192000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_192000;
+	default:
+		return VC4_HDMI_MAI_SAMPLE_RATE_NOT_INDICATED;
+	}
+}
+
 /* HDMI audio codec callbacks */
 static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params,
@@ -1135,6 +1173,8 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map;
+	u32 mai_audio_format;
+	u32 mai_sample_rate;
 
 	if (substream != vc4_hdmi->audio.substream)
 		return -EINVAL;
@@ -1155,6 +1195,14 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 
 	vc4_hdmi_audio_set_mai_clock(vc4_hdmi);
 
+	mai_sample_rate = sample_rate_to_mai_fmt(vc4_hdmi->audio.samplerate);
+	mai_audio_format = VC4_HDMI_MAI_FORMAT_PCM;
+	HDMI_WRITE(HDMI_MAI_FMT,
+		   VC4_SET_FIELD(mai_sample_rate,
+				 VC4_HDMI_MAI_FORMAT_SAMPLE_RATE) |
+		   VC4_SET_FIELD(mai_audio_format,
+				 VC4_HDMI_MAI_FORMAT_AUDIO_FORMAT));
+
 	/* The B frame identifier should match the value used by alsa-lib (8) */
 	audio_packet_config =
 		VC4_HDMI_AUDIO_PACKET_ZERO_DATA_ON_SAMPLE_FLAT |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index be2c32a519b3..489f921ef44d 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -516,6 +516,36 @@
 # define VC4_HDMI_AUDIO_PACKET_CEA_MASK_MASK			VC4_MASK(7, 0)
 # define VC4_HDMI_AUDIO_PACKET_CEA_MASK_SHIFT			0
 
+# define VC4_HDMI_MAI_FORMAT_AUDIO_FORMAT_MASK		VC4_MASK(23, 16)
+# define VC4_HDMI_MAI_FORMAT_AUDIO_FORMAT_SHIFT		16
+
+enum {
+	VC4_HDMI_MAI_FORMAT_PCM = 2,
+	VC4_HDMI_MAI_FORMAT_HBR = 200,
+};
+
+# define VC4_HDMI_MAI_FORMAT_SAMPLE_RATE_MASK		VC4_MASK(15, 8)
+# define VC4_HDMI_MAI_FORMAT_SAMPLE_RATE_SHIFT		8
+
+enum {
+	VC4_HDMI_MAI_SAMPLE_RATE_NOT_INDICATED = 0,
+	VC4_HDMI_MAI_SAMPLE_RATE_8000 = 1,
+	VC4_HDMI_MAI_SAMPLE_RATE_11025 = 2,
+	VC4_HDMI_MAI_SAMPLE_RATE_12000 = 3,
+	VC4_HDMI_MAI_SAMPLE_RATE_16000 = 4,
+	VC4_HDMI_MAI_SAMPLE_RATE_22050 = 5,
+	VC4_HDMI_MAI_SAMPLE_RATE_24000 = 6,
+	VC4_HDMI_MAI_SAMPLE_RATE_32000 = 7,
+	VC4_HDMI_MAI_SAMPLE_RATE_44100 = 8,
+	VC4_HDMI_MAI_SAMPLE_RATE_48000 = 9,
+	VC4_HDMI_MAI_SAMPLE_RATE_64000 = 10,
+	VC4_HDMI_MAI_SAMPLE_RATE_88200 = 11,
+	VC4_HDMI_MAI_SAMPLE_RATE_96000 = 12,
+	VC4_HDMI_MAI_SAMPLE_RATE_128000 = 13,
+	VC4_HDMI_MAI_SAMPLE_RATE_176400 = 14,
+	VC4_HDMI_MAI_SAMPLE_RATE_192000 = 15,
+};
+
 # define VC4_HDMI_RAM_PACKET_ENABLE		BIT(16)
 
 /* When set, the CTS_PERIOD counts based on MAI bus sync pulse instead
-- 
2.31.1

