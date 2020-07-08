Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18866219957
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71BC6EA1A;
	Thu,  9 Jul 2020 07:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3126E90D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5D862102B;
 Wed,  8 Jul 2020 13:43:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wDrRDroC8ocj8
 EhlxGBQct+8EUPDVlBrak0jB4BFHGo=; b=rTp3MKQH3O4FLes4WZVlJPXOMKpRj
 qAhvlzTMUZVMUNcv0wyzRNJDL45Z+Artll6LyQUu+RvoOq7kMOolWQ7BRMk2Z1Nr
 CMNQgkj5KlGg/FpN74MRpF27fqBfixosMoVc05DuOV8tYjQEt34A82xRtLuFfK22
 UraoFvX3SeVRQGsmFaShLWkwijl4U+68qkBay9toG4AH1hfY2zi5/BziUsOw2uXE
 TLvhJ/1PPp1HuNdkX7D7ORO9AXeUFqxoSaXtahYWWWMrY15rHym35lXHNh+98w9+
 rp0fpLp0Vxdj9SdsF0R+HXFkA+KYlLCHqmP6GjKkCN4lgE+W2PSMH2bhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wDrRDroC8ocj8EhlxGBQct+8EUPDVlBrak0jB4BFHGo=; b=F/6caJE7
 a53qzHGxUZMlzac6tX6zdlUJEgpQJPFXG2/3LXr8ljX7Jqp38dy5c56e+Q9b38/l
 uH7pxyy61ocuD0ehI6+KMKHV5L/6USfnygYDdbd/Fzf/aDWMLUhLlu+nyl8wBvye
 TFDstftKYS/ojwZ9/ziRtRSTpN6od1NCmfCv4IdOBd9ZvjcFsxcpMe6XV1eEq2jF
 Tch0PXbc7rtvP7rKdiHm1i0jM7zYbb/Ub7cDG2sXZco8v/sIdX15xz6mLOKTa1Hx
 5l7EphTv2T7Bc9m5drBhhDID6uHXaDFrMW/KLVytUarprWrTA6rsFDTt14+QZhrr
 9ZohpB0bhs0g7w==
X-ME-Sender: <xms:1AUGX_45oRL5M4QlrvR4xb9yvC1UTNmaRJ3hdeCw9z2E-AzZ3O4AxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgephedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1AUGX04B3sqz-IrsX3ugxnGTazBXb71bGLMuJ8S53Lbko-vN3W3obg>
 <xmx:1AUGX2f6-qTcz2vnKPiZyjTzBGj1vUbooqpAQo5pE-EIomR4u4uOIw>
 <xmx:1AUGXwKUrCmnIr6bqf3jYwu9B27PbZ6i-7VksrTJMHKtNUe_xFvooA>
 <xmx:1QUGXwp7Igjm-LP-dnLylATFjg7DLLc-jQW_ujM_rlxaOQ9fKycmAJkcPUU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A701328005D;
 Wed,  8 Jul 2020 13:43:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 54/78] drm/vc4: hdmi: Add PHY RNG enable / disable function
Date: Wed,  8 Jul 2020 19:42:02 +0200
Message-Id: <6289e210ab50767f32951c1e9b80d420dc879447.1594230107.git-series.maxime@cerno.tech>
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

Let's continue the implementation of hooks for the parts that change in the
BCM2711 SoC with the PHY RNG setup.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 15 +++++++++------
 drivers/gpu/drm/vc4/vc4_hdmi.h     |  8 ++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 15 +++++++++++++++
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 068041145d1c..19897d6525ac 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -762,9 +762,9 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
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
@@ -776,9 +776,10 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
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
@@ -1433,6 +1434,8 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.reset			= vc4_hdmi_reset,
 	.phy_init		= vc4_hdmi_phy_init,
 	.phy_disable		= vc4_hdmi_phy_disable,
+	.phy_rng_enable		= vc4_hdmi_phy_rng_enable,
+	.phy_rng_disable	= vc4_hdmi_phy_rng_disable,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 32c80161c786..950accbc44e4 100644
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
