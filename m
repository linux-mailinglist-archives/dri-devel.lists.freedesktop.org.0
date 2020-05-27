Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31961E59B9
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27C36E4AA;
	Thu, 28 May 2020 07:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3166E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 51C7E58150C;
 Wed, 27 May 2020 11:51:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=eDAbvMfLbv4Fg
 ctRmppyGS67q8PV0h6E7eJzpTtuCW4=; b=nGlpocNCYULmCTd1H1OuoHGYJwDZ6
 649B4QIDDUHZLrGwPJWOmuwSBBqRos0JoG2IMimbAoY376xQDOC8nLXRNKURKN2G
 5eHbDKyGbInA2SgelWa4OXzh3uEVkN/Re2Qad6MSCwMSx4gOnmBin0+2pHNBG5Tn
 /sl7uKs7zq/q2g4neUu2DerdeNQoQa7AqfDjhgiLUGsJwzm+2MebSu0XB8yJfdcq
 kJIwgrdwToj1hltR0W/UC64jgHdjIamv2qQTdt5FwHmtDrf6pkOhyCZnxpPDaGaZ
 3tVqvInhbZ7yvtmujHzRUkBOz/UddOi4GkN/dL+ppkv0KUofOYJJNwa6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=eDAbvMfLbv4FgctRmppyGS67q8PV0h6E7eJzpTtuCW4=; b=w3q9xkVV
 JIlvjZ/P/pLwG9ZTU/p+GAUodh2ya6RXI0foqzEUzoFyj+jBCchbboCG8svlktb0
 Yx2Rhi6zeYv+g2PyOUqg1bjuFFAzkPPQZAltOkly15DP8//DK3oR63PAa7A3Mu/y
 /4ZHpJcZqKyuDQSrPJnsD1TKb2bAJGJbrchxCE04KAzSHZ5suYVw2499Vazw730B
 9+w+r1RfyCNk1o/w1E9OpbigzYVY4+62cZV+E22cTSIPRnRU6zxAntNHM08WCS+a
 ++qz5Ktkcm+70Poaro+RtQF969mVujASVZ32siwMKhN26dwXzrKkfaHCF/HLKh/v
 QMsP6bpsrlDMvA==
X-ME-Sender: <xms:lIzOXkH4nKEZ5MhWfBQrSfZ_NrPC40jY8lx7zZwP7kiUN63frrd5og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lIzOXtU1wljXpIFOo0_m03ISJd_kydTHjirnYGnNKLGS5jMvSkQ1Bg>
 <xmx:lIzOXuKhypTlW9mpCcoJUmyroMVPq5qvF1o53DHaKeSxALiOZYRR3A>
 <xmx:lIzOXmFl8-Qt-WurAnskT3WVoSfisCdt4nQc_M9m10pli3kW5k-9kA>
 <xmx:lIzOXlHfqEQpwFcOnNsx9lDW46qzupl9NqiJpaCFeQy8S7G4TSozfw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E70B93280063;
 Wed, 27 May 2020 11:51:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 096/105] drm/vc4: hdmi: Add audio-related callbacks
Date: Wed, 27 May 2020 17:49:06 +0200
Message-Id: <3fb0c9bed08d66768e0f086165ab553644df0afc.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
index afa71580bfce..7f98c1bbda73 100644
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
@@ -1340,6 +1347,7 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		DRM_ERROR("Failed to get HDMI state machine clock\n");
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
+	vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
 
 	return 0;
 }
@@ -1488,6 +1496,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.phy_disable		= vc4_hdmi_phy_disable,
 	.phy_rng_enable		= vc4_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc4_hdmi_phy_rng_disable,
+	.channel_map		= vc4_hdmi_channel_map,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index eb0f91b57316..30eac891dc74 100644
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
