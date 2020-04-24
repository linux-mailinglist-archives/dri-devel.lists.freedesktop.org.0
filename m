Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 496251B7FFF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8557B6EB46;
	Fri, 24 Apr 2020 20:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0728E89E0C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:37:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 07F4A1458;
 Fri, 24 Apr 2020 11:37:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=F5QLvlk7uyaYu
 /P8IGALIklTeuVPSgj/ku7bPYJJ59U=; b=ufwImHjQxega/GtKPoJ9dRyb+aUqb
 36ZQXN6nTIsEj+srdCihtEIqjQIKaVd2FqCQgjsDi/Rt4O/z7Tzau8Ydedt5CpFI
 sVBqGtN1JLC6OZqmrNhcGcPj9O1FfQrqRt+kgJBxTU/b/z+zEWUK7XilBh4f+uuH
 8yclFgDkObiLnJIx5XD+aILUuG1BVLMdbh0tpXrDuTJhi1optVLwsOUN4+fnEy2v
 wqKOSyyLFsP9PoZ5Th0gz2mpbVLCs6eC8yMep2Z4CMpPgpTxYd5+52H62TIi7/hc
 rRPD//Pjkwhf0GikPUoeiMGSXXQ3O1Iy4uCRw19EPwWpfMT5Z1+PQ5ROg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=F5QLvlk7uyaYu/P8IGALIklTeuVPSgj/ku7bPYJJ59U=; b=alZeoZ/q
 FqfY3pnLVUbMG6iH2Z7IJ4ZvniqOYguQWF71ACLpSnfzs8qg+BJimjqGyX2lqV/F
 0/CsSYj/MxGCtnW8yRtQf4l5E8Hv0b1nSM8Mr/LMrGvkgpnyATjRf6p7HUd0jDwB
 RB/W/++1nRe1XpAUi+mPglcft9Blt2056KmrXrTZWPZ6AkJwWnfgt7IXiXZL/hjU
 n+rPGEqULL0kHGQSQdZJoXEXfwcJuDEyc+V58b4ObJMdb+5Mla1qsRUt9fpnndaF
 g0unGdBnqXbANqzT/7H/e6RLEJI61NSfp2DnW2zAoREfZlxbzX7JWK4bbGEpO3Wi
 4RsoXCZSJJ7STw==
X-ME-Sender: <xms:pAejXoG9KI2i72mznXpiShk1WgpWUeaTzI3wTiMLHbG67J6z24o5sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeeiheenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pAejXg6AQSoDpB6p-udv_ti1mzoga1yTObBFsZAMOKEEDI5bU7XKCQ>
 <xmx:pAejXridI4R8X8S7eX9RdMW69MXnd9mciuP0_vFnrmqLTVG1pNe-7w>
 <xmx:pAejXi7f4mR-XFQ2lo-O96ne4J9iA-5H9MYSMQYn4yb2mReUAV8Q-Q>
 <xmx:pAejXk3sMnvzk27__F3zdnXFd2bm2ODu-8x6nVwkiXvLYvW4DyVgOfPbOaY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 486CD3280064;
 Fri, 24 Apr 2020 11:37:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 76/91] drm/vc4: hdmi: Add PHY RNG enable / disable function
Date: Fri, 24 Apr 2020 17:34:57 +0200
Message-Id: <e732fdbddb9cf4a3b83bdc996745887818a52e98.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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

Let's continue the implementation of hooks for the parts that change in the
BCM2711 SoC with the PHY RNG setup.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 15 +++++++++------
 drivers/gpu/drm/vc4/vc4_hdmi.h     |  8 ++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 15 +++++++++++++++
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b04b18d9417d..189c88d3b06e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -764,9 +764,9 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		vc4_hdmi_set_audio_infoframe(encoder);
-		HDMI_WRITE(HDMI_TX_PHY_CTL_0,
-			   HDMI_READ(HDMI_TX_PHY_CTL_0) &
-			   ~VC4_HDMI_TX_PHY_RNG_PWRDN);
+
+		if (vc4_hdmi->variant->phy_rng_enable)
+			vc4_hdmi->variant->phy_rng_enable(vc4_hdmi);
 
 		HDMI_WRITE(HDMI_MAI_CTL,
 			   VC4_SET_FIELD(vc4_hdmi->audio.channels,
@@ -778,9 +778,10 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 			   VC4_HD_MAI_CTL_DLATE |
 			   VC4_HD_MAI_CTL_ERRORE |
 			   VC4_HD_MAI_CTL_ERRORF);
-		HDMI_WRITE(HDMI_TX_PHY_CTL_0,
-			   HDMI_READ(HDMI_TX_PHY_CTL_0) |
-			   VC4_HDMI_TX_PHY_RNG_PWRDN);
+
+		if (vc4_hdmi->variant->phy_rng_disable)
+			vc4_hdmi->variant->phy_rng_disable(vc4_hdmi);
+
 		break;
 	default:
 		break;
@@ -1425,6 +1426,8 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.reset			= vc4_hdmi_reset,
 	.phy_init		= vc4_hdmi_phy_init,
 	.phy_disable		= vc4_hdmi_phy_disable,
+	.phy_rng_enable		= vc4_hdmi_phy_rng_enable,
+	.phy_rng_disable	= vc4_hdmi_phy_rng_disable,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 39ae5273f36b..9ae4d2c5a4f0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -47,6 +47,12 @@ struct vc4_hdmi_variant {
 
 	/* Callback to disable the PHY */
 	void (*phy_disable)(struct vc4_hdmi *vc4_hdmi);
+
+	/* Callback to enable the RNG in the PHY */
+	void (*phy_rng_enable)(struct vc4_hdmi *vc4_hdmi);
+
+	/* Callback to disable the RNG in the PHY */
+	void (*phy_rng_disable)(struct vc4_hdmi *vc4_hdmi);
 };
 
 /* HDMI audio information */
@@ -107,5 +113,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
 		       struct drm_display_mode *mode);
 void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
+void vc4_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
+void vc4_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
 
 #endif /* _VC4_HDMI_H_ */
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
index 5a1746877bb5..93287e24d7d1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
@@ -7,6 +7,7 @@
  */
 
 #include "vc4_hdmi.h"
+#include "vc4_regs.h"
 #include "vc4_hdmi_regs.h"
 
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi, struct drm_display_mode *mode)
@@ -23,3 +24,17 @@ void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi)
 {
 	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
 }
+
+void vc4_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi)
+{
+	HDMI_WRITE(HDMI_TX_PHY_CTL_0,
+		   HDMI_READ(HDMI_TX_PHY_CTL_0) &
+		   ~VC4_HDMI_TX_PHY_RNG_PWRDN);
+}
+
+void vc4_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi)
+{
+	HDMI_WRITE(HDMI_TX_PHY_CTL_0,
+		   HDMI_READ(HDMI_TX_PHY_CTL_0) |
+		   VC4_HDMI_TX_PHY_RNG_PWRDN);
+}
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
