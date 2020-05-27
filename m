Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3661E59A6
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B4B6E491;
	Thu, 28 May 2020 07:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2436E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 63E995814FC;
 Wed, 27 May 2020 11:51:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YLgHQlgusRMFY
 H3oIrPEeoCTOvM+aBf2NkHA4+L5RjA=; b=w0ErxFaUcsUoJUqORgbXZo3SHKEYS
 T/6lYxDLeF7n963e8leZNqKXeWsKrzcNy7SMVb/4xC0ExfM8w2OGwcZMojFm4JSF
 buU6f8K0lxcOK3gYp5UlmlcM/zUhUXY4DsVWyLNmwESag510xQo2UdwJBnsthYwp
 zdW7F9tFcmSB5NdyWufcFDN71rtfD0VAw6HbehpS7pLwa3Cw654/S40ePHqf872m
 iKzYnH9gNcmu8hnLCv6FI6EN+5wCrrsJu/ydo1pV4Mr4EyzyXNaDkxbuiNLF6bY1
 DijVhb1OCViU/WqcUKLNnhSXFcQ/yjoo6TPTrAsNMI3VHRaJHaU1sLoag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YLgHQlgusRMFYH3oIrPEeoCTOvM+aBf2NkHA4+L5RjA=; b=GJ/aIjn6
 Rkhnb2v68Xe9sX9ag696XPiRuSrsjmb5Rgy07SlQJfO2rLZJjfukl6GQv6cj6pSC
 Wr/Y5Yicl7qO8CcwB7QlD9BfhQ7E3jXH0NMHFVQqaLbVOe3fctt+MBnb5xhtDbGA
 amkzHoWbWimWk705U3UNk95YOW47lGZj+xtiIY2LHo/jcZXc6hbEFLQTHvKPq17r
 aBXX4gLXsDNtYz96vf3h+9JKaKXoSWxV95Gea21Zi5MquI2Grb0K9lw31hpHTe5D
 Nuf8WnnEZqqLStswlx5fr5LLuDNiOt+YB1cKvUIKL4lJFzkL5tkbGYAdveHYN4uB
 N6W9ua4N1GWLwQ==
X-ME-Sender: <xms:gIzOXimFWQmRzbNfWw6o7tjsccbT3ZgPI7hdKrEuZjj55bgcZMyZjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gIzOXp2kggAfOfXvmiYC0sDAxktBy_2y3vfADllc5dxyZQ5k28JvBw>
 <xmx:gIzOXgp9oXUR-Sg6gToPRWBov1l1HxLZnS0lJ-FeTSL7aY9Ky3iKSw>
 <xmx:gIzOXmmlNGIlrKwtJhxH-fXjqYcpj6rsT2NA0oyA_SLy_lvwlVHD7w>
 <xmx:gIzOXhmQApD1DJAFCXFdw_i2tBRRMm9WztZBoOMFbPKuO-kcPKplyQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F2955306218B;
 Wed, 27 May 2020 11:51:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 083/105] drm/vc4: hdmi: Add PHY RNG enable / disable
 function
Date: Wed, 27 May 2020 17:48:53 +0200
Message-Id: <4ff7428d535748a50d25f3788197df8bc24a4102.1590594512.git-series.maxime@cerno.tech>
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

Let's continue the implementation of hooks for the parts that change in the
BCM2711 SoC with the PHY RNG setup.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 15 +++++++++------
 drivers/gpu/drm/vc4/vc4_hdmi.h     |  8 ++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 15 +++++++++++++++
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3d5e35aa96ff..133c7453e588 100644
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
@@ -1414,6 +1415,8 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
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
