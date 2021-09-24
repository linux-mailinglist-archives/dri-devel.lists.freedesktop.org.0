Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A82417655
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 15:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D056EE1E;
	Fri, 24 Sep 2021 13:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776F66EE1E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 13:55:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E416A5C0240;
 Fri, 24 Sep 2021 09:55:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Sep 2021 09:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Sv0qPnJN/S3pk
 T/0nnOvVtdE+WlCbnHcL+fpK10WEsA=; b=2xXR6o3OTol+MGcjrhuRRuQdPNCRQ
 PB0ONp80Fkbnc7soxWsydNKVbinrIsfveiqUitjD3vhoSmHC27I1BVgT75EpxBLU
 d3yEgyBmuXLesox9cge89hi5qJVYnza2ViLFloawXwqvq5gAJ2uapzoxWGnduvE/
 PtBl4UKnms7eyuezyJ9HvcJXk8n0WRq+1Lz5LSTq8SDfNhGdmVyQUkFDE5jXo8iE
 ZZZY8dE6TE22ZnoWViAXqnDMKcjYpZDE6CL1mJFRWWlO8wb1oRrCPEQm3UDmIHPz
 k3V64DVJHQv7T+4NiIrgnGrLnimnb7uTyLOlkfXxunCdVl9a9xKIgh2cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Sv0qPnJN/S3pkT/0nnOvVtdE+WlCbnHcL+fpK10WEsA=; b=YyG+taqp
 b2mr2+sYnh+MV+RdcmrwHC09SGXk9M5bV0NgRULJILxnST1LqckSsWD69BCcyvpI
 HrWPMaql3NjmYRjnoy32AxVIySSGSwT/U1jka4XCmwPc3mUq4KL+omMv38e/LL8M
 u9EVyIIa6mriuaMJd/wEorFoYtiiZYiR9sRbMqgNCDRS1tl9/62tpnG9QPmfoJiI
 HV0Js9LCxgH4ZR/hRlnJUqsfbDsBxByrAl5SD0B/QnnJk0SWYlcSgllw0sW8G4d6
 7fX7cClZQBbe0ij8+PggFwTx8ZNfEawlm6+JLfodmZP48zYglvZLdbtw8FshfowI
 89EKoSww+gnkGQ==
X-ME-Sender: <xms:1thNYZD7e3e3etycTvGxp7q8QW518IvrJ83rjWkqk9Sj74kS8CIPSQ>
 <xme:1thNYXiYg1R8xgqnv8z16IJrUrhdABUo2JbfpQGobWQ_RfLyPQxg0w2TuJ7_VuFTo
 dLW-eDWHY3E7KmRLZg>
X-ME-Received: <xmr:1thNYUkTBM0BXpbAP1ryDYkaeLew9dFLrRZbL2iFAwNWxdIhI-UzJKxkAAbz_jl8_jxriID-JRDgwTuf-uuMaa0QwgwZFSqAPtte>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1thNYTw4P06AyBmAbwpMCWYvFByxIJDm28ao0DFDLS8-Xy9_N90nag>
 <xmx:1thNYeSdBDlE2hOIqLG8zucyPnSFGzpGHQn1hSqYjHbAzD4bv1-ZZw>
 <xmx:1thNYWau6DN4on-NwKDRUpLTdbkMXy1UoSKizwYp9UQ7w0ohmcjvaQ>
 <xmx:1thNYbQwZIX-oJziGcH4GiFeGGHA6MGFxApGGVRFlvv1UAit4qFzmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 09:55:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 1/2] drm/vc4: hdmi: Check the device state in prepare()
Date: Fri, 24 Sep 2021 15:55:29 +0200
Message-Id: <20210924135530.1036564-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924135530.1036564-1-maxime@cerno.tech>
References: <20210924135530.1036564-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b4b4653fe301..74f9df38815e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1227,17 +1227,31 @@ static inline struct vc4_hdmi *dai_to_hdmi(struct snd_soc_dai *dai)
 	return snd_soc_card_get_drvdata(card);
 }
 
+static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
+{
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
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
 
-	/*
-	 * If the HDMI encoder hasn't probed, or the encoder is
-	 * currently in DVI mode, treat the codec dai as missing.
-	 */
-	if (!encoder->crtc || !(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
-				VC4_HDMI_RAM_PACKET_ENABLE))
+	if (!vc4_hdmi_audio_can_stream(vc4_hdmi))
 		return -ENODEV;
 
 	vc4_hdmi->audio.streaming = true;
@@ -1339,6 +1353,9 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	u32 mai_audio_format;
 	u32 mai_sample_rate;
 
+	if (!vc4_hdmi_audio_can_stream(vc4_hdmi))
+		return -EINVAL;
+
 	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		sample_rate, params->sample_width, channels);
 
-- 
2.31.1

