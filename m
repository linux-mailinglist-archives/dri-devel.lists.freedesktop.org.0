Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397429CEB4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346416EB89;
	Wed, 28 Oct 2020 08:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44196E0BF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 10:16:04 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5E29658026C;
 Tue, 27 Oct 2020 06:16:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 27 Oct 2020 06:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=6ek8BSXlWORnKgWBP5B1QQSoz7
 NyffqGB/miVQHie5s=; b=jd+cEYOKyqBI6Z4flqJkU0nSnJreKbFG7FEZ94JcLj
 I4fpqUTlV6+QPT1SXZ1D9ox1NltkhHmJICAMw0TchWZ8onD/Gt8y+wgZ6sqkURP0
 dVuo3wgTLcNNj0Zjz0u5xS/Iq25XjpOhsTVawGGHWE9P+v4ZemmM0dJyJtQF4NPO
 e4R3pml9xa4VsMe29g8T1apsKmMG4BYw7UIDIlL6C6CRBm0i0X2kWxXhty2ZzlZD
 RZuUyDkx7ZxoTeCWzYbaf7X+zFacisfjD3KogNMa+8AOLlGu/BkP2vaHDFSKZRjN
 H/dYKrg0gYYvX5fRWMcpI+p10Lv73aobZx/o0arBrVhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6ek8BSXlWORnKgWBP
 5B1QQSoz7NyffqGB/miVQHie5s=; b=laAL9ajaUvSvn+d2qPIfsh7b+l9hhC87+
 dtA1GPLq9YjglxPYJR1ewC4lVdkZyxuyxig7rcVSsLyXnqAJfBBXS2dGM7V0kK3b
 5o7n01bXo3YBf/ai7L/ayv6aBg0orgNVbMPSBbCFxJoplJf6DzCCydhjr6MjokdP
 2xzNK5bQk1vd/3lnFUP2J4YNbldo4VP/j8FdGAwI+UICdisFVulO9O8fGT742RpA
 sIhcUeFKdwlBtd7cus3yG22WFQaKfhuOnYYsE0lIWwWnNM0VyP/ZHq05JxtTPEj8
 0P2rEoWgXkyONIbEdvgk8dQxBE12Cf4HIj9pt2CK1JOqdhdVdjm9A==
X-ME-Sender: <xms:YfOXXyudBtTFTDcaWmwGap3SIvxqV7hshZJ_GphIwSsMKoMSESDwMQ>
 <xme:YfOXX3epn63wLpbySvXh8mgbMC7WJUCQkwtzqH2QuHMygrkpkL8DE9RqC88MhJmjJ
 QA2ImQCIvnzSNtAfcE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YfOXX9xpUMKgAByl8QlIGHPUmhXjt1RKTO99sh0xR6QvpyE5MO_rxQ>
 <xmx:YfOXX9MmDJ-qm7r5w91mt6-qYk5PLxAHZmcKIxyXaaZ_zh8VMREf_w>
 <xmx:YfOXXy_e1aOcFCJs-PnpJYvc2ILdBNNF4f_qFFXyL-WIyURGEPXMpA>
 <xmx:YvOXX1VC_02m04r_d-yiwhKt8TwnE5Jd8f6uIuEp0ffn5IQ1HJS0DQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B861D328005D;
 Tue, 27 Oct 2020 06:16:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] drm/vc4: hdmi: Avoid sleeping in atomic context
Date: Tue, 27 Oct 2020 11:15:58 +0100
Message-Id: <20201027101558.427256-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: alsa-devel@alsa-project.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When running the trigger hook, ALSA by default will take a spinlock, and
thus will run the trigger hook in atomic context.

However, our HDMI driver will send the infoframes as part of the trigger
hook, and part of that process is to wait for a bit to be cleared for up to
100ms. To be nicer to the system, that wait has some usleep_range that
interact poorly with the atomic context.

There's several ways we can fix this, but the more obvious one is to make
ALSA take a mutex instead by setting the nonatomic flag on the DAI link.
That doesn't work though, since now the cyclic callback installed by the
dmaengine helpers in ALSA will take a mutex, while that callback is run by
dmaengine's virt-chan code in a tasklet where sleeping is not allowed
either.

Given the delay we need to poll the bit for, changing the usleep_range for
a udelay and keep running it from a context where interrupts are disabled
is not really a good option either.

However, we can move the infoframe setup code in the hw_params hook, like
is usually done in other HDMI controllers, that isn't protected by a
spinlock and thus where we can sleep. Infoframes will be sent on a regular
basis anyway, and since hw_params is where the audio parameters that end up
in the infoframes are setup, this also makes a bit more sense.

Fixes: bb7d78568814 ("drm/vc4: Add HDMI audio support")
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 74da7c00ecd0..ec3ba3ecd32a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1077,6 +1077,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map;
@@ -1136,6 +1137,8 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 	HDMI_WRITE(HDMI_AUDIO_PACKET_CONFIG, audio_packet_config);
 	vc4_hdmi_set_n_cts(vc4_hdmi);
 
+	vc4_hdmi_set_audio_infoframe(encoder);
+
 	return 0;
 }
 
@@ -1143,11 +1146,9 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		vc4_hdmi_set_audio_infoframe(encoder);
 		vc4_hdmi->audio.streaming = true;
 
 		if (vc4_hdmi->variant->phy_rng_enable)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
