Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619043983A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F246E05D;
	Mon, 25 Oct 2021 14:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C956E055
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:11:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B9BD75805BE;
 Mon, 25 Oct 2021 10:11:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 25 Oct 2021 10:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9ooEoIqPsQPag
 +S7IZdWToL5/xTYUh+e0qhr7MZMyhY=; b=bh7hmc8ak1w/gChB7rP9HMm+h7xaw
 yRprkAdlOaRh35dZRwjGpDOk/DEx+NbOKu9/kmdI0vmQt2nwzRpEnHeVLK2dvrbd
 boSToTj0LsCvnNCi94Xx4JZJ84bbUugRyiGxxfuYZzVjRS5TDmOdEDsuATLKNela
 sAy9xRMCIN5k1GuyKRuuDhQZQ6DD8mmwaEbaS+stwo3PFN/U5Hh9gEYcv/c39jVW
 O32wMERCsb8HSMiCXFgQxVkSEiWGnH0CMWFQVT5Obhn5oC8vFaPneAwVa/5PstIx
 FrA0zIbrJamMJckzE7Y1Y3WZuNlaMHywEzF0CxNgyPz1CseQuWh17x/QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9ooEoIqPsQPag+S7IZdWToL5/xTYUh+e0qhr7MZMyhY=; b=WurglZ3/
 5LNZPgIJDubqT1Q5amDC0Utv4NC24xfWYXX0oIvLlgtr7Eo6rOEKURj4Er079PJl
 fgDfe2VQByUAKVWcv4lA1Dq5C5aWYON8oudQyuo2jLMTjCcG3kUee0ph8byiyaVZ
 mF0BbKYhYW2GOugBRr0Z8FMhOKYCzqcy+spQarm+59tgqgDKf2UsqOufWK3TAuUh
 v9yvE7fd6OrPjJ0W19axSFaQ8A7ZHl5TdtxAq4J/158KTag7uP5UBXKimvD7a5wb
 G5iXeTYfWl3VWiYWMTDyW68zKEYwEnNO5tHtOvfklHMuaJ73Ht0K1YNplxS0tojd
 B1rCxwJKg6R+Ww==
X-ME-Sender: <xms:FLt2Ya30sp1LqvEYvozEXjsuhcmHKX8nfgjeYHKy0cy07MDkpvpqPw>
 <xme:FLt2YdG3d8olTqL5r2Y2goTwltYcSFQrlzt0zhESTrRmoBjKkwQSccra9iQGVxlt7
 TL4YO41NXp5UiFtThc>
X-ME-Received: <xmr:FLt2YS5iK242PrPM63bZ3c21i09A9el3moR6QPKkCPURdhXNrHNViDSKTHkQ0Y0IL37md9n3tbBtxbdvFVcXOIu-1q_Ns9PoW_TRQ-I6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FLt2Yb2N-Y1YZ1y3sb_hJbwohRRYk4qVVHHngOH-lQKeRe7hwkwOIQ>
 <xmx:FLt2YdHrGHUrXjWsxWj49FbpwTZdWqkaKoSG_ASVXqYUkRrUIfckvQ>
 <xmx:FLt2YU_KDGNpYdWpRd2D54ZqEJogvzX-8mCdHEc2AeGmuHmqAZBxHA>
 <xmx:FLt2YcCXMTbwcpN9E642n5qp_PnjmYo-Fwz-BtkmOd85TaiKCnapLA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:11:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 7/9] drm/vc4: hdmi: Check the device state in prepare()
Date: Mon, 25 Oct 2021 16:11:11 +0200
Message-Id: <20211025141113.702757-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025141113.702757-1-maxime@cerno.tech>
References: <20211025141113.702757-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though we already check that the encoder->crtc pointer is there
during in startup(), which is part of the open() path in ASoC, nothing
guarantees that our encoder state won't change between the time when we
open the device and the time we prepare it.

Move the sanity checks we do in startup() to a helper and call it from
prepare().

Fixes: 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 35 +++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cb444571a3f7..291fad018be3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1394,20 +1394,36 @@ static inline struct vc4_hdmi *dai_to_hdmi(struct snd_soc_dai *dai)
 	return snd_soc_card_get_drvdata(card);
 }
 
+static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
+{
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
+
+	lockdep_assert_held(&vc4_hdmi->mutex);
+
+	/*
+	 * The encoder doesn't have a CRTC until the first modeset.
+	 */
+	if (!encoder->crtc)
+		return false;
+
+	/*
+	 * If the encoder is currently in DVI mode, treat the codec DAI
+	 * as missing.
+	 */
+	if (!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) & VC4_HDMI_RAM_PACKET_ENABLE))
+		return false;
+
+	return true;
+}
+
 static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	unsigned long flags;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
-	/*
-	 * If the HDMI encoder hasn't probed, or the encoder is
-	 * currently in DVI mode, treat the codec dai as missing.
-	 */
-	if (!encoder->crtc || !(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
-				VC4_HDMI_RAM_PACKET_ENABLE)) {
+	if (!vc4_hdmi_audio_can_stream(vc4_hdmi)) {
 		mutex_unlock(&vc4_hdmi->mutex);
 		return -ENODEV;
 	}
@@ -1537,6 +1553,11 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 
 	mutex_lock(&vc4_hdmi->mutex);
 
+	if (!vc4_hdmi_audio_can_stream(vc4_hdmi)) {
+		mutex_unlock(&vc4_hdmi->mutex);
+		return -EINVAL;
+	}
+
 	vc4_hdmi_audio_set_mai_clock(vc4_hdmi, sample_rate);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
-- 
2.31.1

