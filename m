Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E52921E597B
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCCE6E443;
	Thu, 28 May 2020 07:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6336E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4247258210B;
 Wed, 27 May 2020 11:51:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=9l0N3GFCYNrVd
 2F1SBKJ2XrWSefL3iJLCc9iCwPGOWc=; b=Bgbo7Rw5pG0Z+dBmot69P7zT9T7U8
 kPRwgDqXDLKNWPBXhyoIcMTFMJaIjLnUn1NDbAyiB2y7K0FLgMo7V9w+c/SE0iq9
 Lu4BMV25y3401nxy7KcyAgDsfGAKHdhHtGAy+gazv+dP+lPg6sH4iyWwbWXyvE1P
 CkfzlPgVouZfI1bWwYa5vN9c5QXwg8ofOPYuU8NKpODACZQGPV9HTFDTPprTzMHX
 lccYIQALryZihCb68noGgy9vcwF4jYXsPP0IrMAi65FbR2aOseXKvk0wPawJmGSk
 QqwA+3ab4d1znTgAndrmW5r/2LAnnaz9qmIaOqEZ4SeMQssPDYiQ4J+Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9l0N3GFCYNrVd2F1SBKJ2XrWSefL3iJLCc9iCwPGOWc=; b=Qma4d6X8
 Qyk2dmH50kPLN8Ifw4CWSWSR3oceIFZnqM7Gfq1pW/AUCSiw3JomtbIrvV9nSvPk
 OuUIE73ewObEFfE3rBdWncBUqPQj/0xItDmYqVvGqpIe9pfFhRGXV0aQf/Sj1hlx
 bqwbjJUtyEt04JR9NL/pOvwooWbEtJH4rRh8Aebn1OS0MCa9kCQL97oahorWGmrV
 pWhGHpB150cSTP/yZJijUP+AA6roCVU4hx8ZJjpA2eKicxBFoRB//RxgejT5g5x9
 ujVTI2oWz4D9X4TiHcBnsbr6/LCMhCO6OX2ZfCWE9vOQtlLd5d9kchlsX9t0dDLs
 FisNdoex+Ck5Uw==
X-ME-Sender: <xms:kYzOXplL64OvlFO1vPhyNF3QSmRrHR805ONXI0gDOI9pdtqrwxURtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kYzOXk3CHDglhhKTwhLsH9392NeJkBbq1i84qzQk5hTfx7EDZXdtYw>
 <xmx:kYzOXvpALJfeeheTZp5Xmal_b_K-CI5LELsCrIC24bCO1DaKtLtb3g>
 <xmx:kYzOXpmykxfYOcRLaUIewkuLdtxA3fC3nhKh7i2s37OrRd1nUq1PiA>
 <xmx:kYzOXsl5H1bNA8HlbAP7PNU8dwAr_YPKSs-U-dmPSrRqlxnUfIx8mA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D8E553280060;
 Wed, 27 May 2020 11:51:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 094/105] drm/vc4: hdmi: Reset audio infoframe on
 encoder_enable if previously streaming
Date: Wed, 27 May 2020 17:49:04 +0200
Message-Id: <1802995678e68ab74e1dd87b30666a0d5b7146f6.1590594512.git-series.maxime@cerno.tech>
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

If the encoder is disabled and re-enabled (eg mode change) all infoframes
are reset, whilst the audio subsystem know nothing about this change.
The driver therefore needs to reinstate the audio infoframe for
itself.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ebe9dd25c65a..dcac5e77d2ab 100644
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
index 9a6831b941d9..eb0f91b57316 100644
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
