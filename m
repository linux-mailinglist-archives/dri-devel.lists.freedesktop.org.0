Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB47219961
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BA56EA32;
	Thu,  9 Jul 2020 07:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0974889C9C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:44:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 10CF4FE4;
 Wed,  8 Jul 2020 13:44:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=WHESNcuVWnukW
 BRXCRgzBXIom6wlyAKEckGY8OnoahQ=; b=XrirGnkWIt6bDsOc4ApcQgpO/EQQZ
 P2ctGOX+nY04C/O3cNyFKUFN0exgOXtM1DG/rt436jDuHNyfdMaiOOZXTU34yTFZ
 lau+ybu5VDg5h+YijT02n8bfo7bTY2ucXeYIaMNlkRVK8DFQW17fJJZLLyHu0JJJ
 Pl18AwR+0yNn+tQ5NDAwLHnvyEpYDwCXvp060CibJHP4hnobYQfIQUaBxewMljBb
 v1xNCQEXDc7PdIMq0MDljsFOCDNq33Tyu6ai/R7U6IilRmQ09oEDl1iL5eLNROw1
 Ei7S6Q2fjCG0yGukCsxYs5dObIIXYpHLs/iaAcOGjx1MbZco6IdWrDFbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=WHESNcuVWnukWBRXCRgzBXIom6wlyAKEckGY8OnoahQ=; b=e6OgA7r3
 mTYn3/zpJi6kveeF1WxcoRHpis2AXr0Zc+tYoVBJTGLkisjcTKtViXfG4c2rN2Vi
 tuufYR5Aw/y6EeAtN/bnrnHkDINSKdvnxhUDuLMSMJ9iNneAIPhFPwcrfmYizZgw
 VuBqN0L+OF8iG2pXjo0KdMVKDtfUIQnD1c7bJ2bpbH3+VxML33s5AOElKN0V7xdg
 oCVV/vnZy/G0lf1ecFgyiFVHXQBR5e3xifmJ/EItEeN5GNvmCjL43miOrdCxq8r5
 bZnpIs7myf7qBFPTraaVc3xIUfMG+zKsu6A4qStnz/eE4H57V/Hn3vHU6nOW2Hce
 SCyYVn6nJ2CqqA==
X-ME-Sender: <xms:5wUGX_YcrmDAfz3lVCvHV6IuPmpo2GB2f35KH93Wg-Ax21yrhXYAEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepiedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5wUGX-Z05eZ9dcnqn8lASRKMKdwG7oQQkLIHPmiX7hgUF5JoFluOXA>
 <xmx:5wUGXx_CIaY5_c5z4wyhL8gh8j28ARaL4JisBa-5RhvnIgbMtUz5xw>
 <xmx:5wUGX1rtPiymu1xj-zJpGH9Vn6hUvsTOHoWL6GTW9yAfv-xM1jpeAw>
 <xmx:5wUGX6IEzpVWbIAQJA5ayCkH4mE0tzIMtKKsytLL4l8ceLGomKXw0yHCnIM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4FD2130600B4;
 Wed,  8 Jul 2020 13:44:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 67/78] drm/vc4: hdmi: Add audio-related callbacks
Date: Wed,  8 Jul 2020 19:42:15 +0200
Message-Id: <3e4812754845ee5dc809aa75ec648a9935a9aa16.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The audio configuration has changed for the BCM2711, with notably a
different parent clock and a different channel configuration.

Make that modular to be able to support the BCM2711.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  4 ++++
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e1ef0907a827..1b6f51849d6c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -611,10 +611,22 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 	.enable = vc4_hdmi_encoder_enable,
 };
 
+static u32 vc4_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
+{
+	int i;
+	u32 channel_map = 0;
+
+	for (i = 0; i < 8; i++) {
+		if (channel_mask & BIT(i))
+			channel_map |= i << (3 * i);
+	}
+	return channel_map;
+}
+
 /* HDMI audio codec callbacks */
 static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi)
 {
-	u32 hsm_clock = clk_get_rate(vc4_hdmi->hsm_clock);
+	u32 hsm_clock = clk_get_rate(vc4_hdmi->audio_clock);
 	unsigned long n, m;
 
 	rational_best_approximation(hsm_clock, vc4_hdmi->audio.samplerate,
@@ -733,7 +745,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	u32 audio_packet_config, channel_mask;
-	u32 channel_map, i;
+	u32 channel_map;
 
 	if (substream != vc4_hdmi->audio.substream)
 		return -EINVAL;
@@ -785,12 +797,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
 		   VC4_SET_FIELD(channel_mask, VC4_HDMI_MAI_CHANNEL_MASK));
 
-	channel_map = 0;
-	for (i = 0; i < 8; i++) {
-		if (channel_mask & BIT(i))
-			channel_map |= i << (3 * i);
-	}
-
+	channel_map = vc4_hdmi->variant->channel_map(vc4_hdmi, channel_mask);
 	HDMI_WRITE(HDMI_MAI_CHANNEL_MAP, channel_map);
 	HDMI_WRITE(HDMI_AUDIO_PACKET_CONFIG, audio_packet_config);
 	vc4_hdmi_set_n_cts(vc4_hdmi);
@@ -1343,6 +1350,7 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		DRM_ERROR("Failed to get HDMI state machine clock\n");
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
+	vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
 
 	return 0;
 }
@@ -1508,6 +1516,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.phy_disable		= vc4_hdmi_phy_disable,
 	.phy_rng_enable		= vc4_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc4_hdmi_phy_rng_disable,
+	.channel_map		= vc4_hdmi_channel_map,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 77d47d1707ce..4aea5ee8a91d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -72,6 +72,9 @@ struct vc4_hdmi_variant {
 
 	/* Callback to disable the RNG in the PHY */
 	void (*phy_rng_disable)(struct vc4_hdmi *vc4_hdmi);
+
+	/* Callback to get channel map */
+	u32 (*channel_map)(struct vc4_hdmi *vc4_hdmi, u32 channel_mask);
 };
 
 /* HDMI audio information */
@@ -112,6 +115,7 @@ struct vc4_hdmi {
 
 	struct clk *pixel_clock;
 	struct clk *hsm_clock;
+	struct clk *audio_clock;
 
 	struct debugfs_regset32 hdmi_regset;
 	struct debugfs_regset32 hd_regset;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
