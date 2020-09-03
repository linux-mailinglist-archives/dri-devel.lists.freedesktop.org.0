Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A3125D22D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C142B6EB14;
	Fri,  4 Sep 2020 07:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBD06E5A0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 82DCCC8A;
 Thu,  3 Sep 2020 04:03:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=R7gde/JmokMBO
 gfgWZpXaMXBU7tMPOuvSM4JJSMjk5s=; b=e9xFqgaag0gE4xZ0sr15PhueYinnF
 9qob3x43AUA9pUnDELCC0bXsQlTeIevTeDQ2tJOdV3d2IQE7VdTByoiLfQhqjIlA
 vdV/e3DWjTiWw7qGdccRNkg4IQOcifA7rBuwNMypypnUp8z9gj+Qrl0dPBFr8RJl
 sCuQ59idHWpKg5fO7Qo1/BOa6O550zmPoxD6BKxc0S4JQXpAdAgkAIFZ9PEEnmGp
 H5IF6Uqp51tug/6SsKnwJ1mC2umCLhm3KrbZbKZvs+LSt2I071a+7IJICr8OMNS0
 wgQpvKbLCbO//fSkQQWomUp3RP8puN2XzwV9OIqQTFwlTnlAGf7ghcDEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=R7gde/JmokMBOgfgWZpXaMXBU7tMPOuvSM4JJSMjk5s=; b=LH8IJN6w
 OpOjXtkOAVpr4imWz3ZMAvOXKKiG7tZObi4J4icxZzg1GdNFj9sGZamt6jqZq04U
 hbAKxNVrgdgy9KTps5z62dVjwHGjYTgpnWb+nGRD/lNPNKncyB8mcCCieo6oF/G8
 OP3ocNX/eem359xQhCUY11K6CegOzvJ4KIjykqDT86G0lKsqwLk4QOw4vzaOGW1o
 jn1OOXtthDnU0R/nbf12HmLbFlbIQBK9e3ViVgeqkB9w/KdyUIHfIczJr896vaRU
 dY5dqjqXlJ6RaggWGwd3H5BQARj5awYut/6FM0MUtXIQFPk9ET0o5LWQWfPukdIT
 qhUaLheCYottWQ==
X-ME-Sender: <xms:T6NQX18NWETovjBvqNI4arQRRsV1TNtY_IpqafVeXCn3YCDeNk0z9g>
 <xme:T6NQX5snCzOBzNVuvdXIKEYLkEgxRtd8LKVPVCV2-Tppg-BIGo83HZkQleThcAhFR
 2-4jxgsUhJ_wePefhI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeeivd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:T6NQXzB3maWgqL6D01aKxniMipI8ATtrUs1e5derygDF_gb1zttWmg>
 <xmx:T6NQX5dLkCjo91H2F6zjljtUL4-95b7rEAJqPWaC73Rh30SUqkRXGw>
 <xmx:T6NQX6Od0cY_-sqAWjGwtmlDSVgjY6JyId1F9ufAEoNjPcFwBBzH2w>
 <xmx:T6NQX7nfmSN3XNDFUw3ydAtlOqeL4GYVNmbm7JujO9bYJ3nTRHm3AASkKfo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B12CB328005A;
 Thu,  3 Sep 2020 04:03:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 66/80] drm/vc4: hdmi: Reset audio infoframe on
 encoder_enable if previously streaming
Date: Thu,  3 Sep 2020 10:01:38 +0200
Message-Id: <cd579ccc2c9b9d2fce0ebaf32f847cedb0e4a7a2.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

If the encoder is disabled and re-enabled (eg mode change) all infoframes
are reset, whilst the audio subsystem know nothing about this change.
The driver therefore needs to reinstate the audio infoframe for
itself.

Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 53c3b5ae1179..43e59466b1d8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -308,8 +308,16 @@ static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
 
 static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 {
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+
 	vc4_hdmi_set_avi_infoframe(encoder);
 	vc4_hdmi_set_spd_infoframe(encoder);
+	/*
+	 * If audio was streaming, then we need to reenabled the audio
+	 * infoframe here during encoder_enable.
+	 */
+	if (vc4_hdmi->audio.streaming)
+		vc4_hdmi_set_audio_infoframe(encoder);
 }
 
 static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
@@ -694,6 +702,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	int ret;
 
+	vc4_hdmi->audio.streaming = false;
 	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO);
 	if (ret)
 		dev_err(dev, "Failed to stop audio infoframe: %d\n", ret);
@@ -797,6 +806,7 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		vc4_hdmi_set_audio_infoframe(encoder);
+		vc4_hdmi->audio.streaming = true;
 
 		if (vc4_hdmi->variant->phy_rng_enable)
 			vc4_hdmi->variant->phy_rng_enable(vc4_hdmi);
@@ -815,6 +825,8 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (vc4_hdmi->variant->phy_rng_disable)
 			vc4_hdmi->variant->phy_rng_disable(vc4_hdmi);
 
+		vc4_hdmi->audio.streaming = false;
+
 		break;
 	default:
 		break;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 342f6e0227a2..77d47d1707ce 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -85,6 +85,8 @@ struct vc4_hdmi_audio {
 	int channels;
 	struct snd_dmaengine_dai_dma_data dma_data;
 	struct snd_pcm_substream *substream;
+
+	bool streaming;
 };
 
 /* General HDMI hardware state. */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
