Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F04A03252DB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 16:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3405E6ECC6;
	Thu, 25 Feb 2021 15:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AAB6E24D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 15:59:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 04A77B74;
 Thu, 25 Feb 2021 10:59:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 25 Feb 2021 10:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=yiVhkweNcX6LI
 AOiOficpKa13v18XeI1u1OKFdrNSEQ=; b=OenZPPiheLnWspCACnmVPsRkji/sV
 e2PySD0+G5te2RNsPELqQExHWKuxe06AvfWWX3hpqifKgAsZxmoTh+IZEeBcicJM
 8GM6CifSM8AyH//xX/dFHy1jnsMXDLRxeLACuXcYJ4Mb6uVoT/dt2q/r/TL2ClgV
 v+Ef+FmeSRT2mp1etsSj4w32ZqaMOhYdUvY4BuLUPW8hbZKZ3cwhIaR2GIkWzMQI
 nq3Ue4miJa50J3JqrrMP5jUZslpsKrhmeYi4J4HzVGhGYa3/1aqvmqvn6OvSsSBN
 7ybA7e9qOWHm1Xel3f9wqW/+u1xBxQ2TYZGcgvheKwsLw/4CvDkK/0w+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=yiVhkweNcX6LIAOiOficpKa13v18XeI1u1OKFdrNSEQ=; b=HpE/AwAc
 6TROccHckNo6eBJnE5gM855c4mwEDgZEK5j1yoQKDDc1KR18OPkbNpwS+URFAaUE
 NqRJucD7ZUVud4rkaLViIUbVPxFGouAcvSTtwr6GArY0Yu5RFeL6b4fYWipdnR3d
 9+FyTesoZLG2Bm4oAcJ0UBrfmajsFGCRclMZZeT4FvxmJFL0iJiENpz7FJL/p4zw
 +1uGd8os7sSVGSN311bgwTxsgK3Eeno5z9Ia0SQwHWcdnpG6n9lPZTl8QPHx6nkY
 92xhJOJId58AGBwFQZZMzICmeo9i7Q2zu9XiiwRfXZjpeggYzKutQaKk+0YtBrjd
 dwJ6ad2R4U440A==
X-ME-Sender: <xms:Wck3YL8D0cstQ_99xeHzXOnZKOUHxsSDPimjt5nC0WUStc9iDRW7NQ>
 <xme:Wck3YH2zAbJSBye9oeGzICaZ5e2NVhowfTuk_iJFFGngtQTChEo5_pj26nQBIS_Ad
 CNBzvudvPG_IbQVLpI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Wck3YA_ECp10MlJmsYLdzS_bHbJenkdkn4nd5MaT2qnfgLJUqgS26A>
 <xmx:Wck3YPu0vawX6-PmBUBGY8dZtmD2FuojqHHaRQONkIFzsUl7JjPLPA>
 <xmx:Wck3YLCereyXXRjDaKqx6dVJzuGoZoiU-6CktGv8BYeOFOsYoRV8cQ>
 <xmx:Wck3YIRT1a_UK7zkAJO5M2COtAwMCj90JOJ5y0O_KnJIdM3ntHefhcef6cE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B5821080059;
 Thu, 25 Feb 2021 10:59:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/vc4: hdmi: Enable the scrambler
Date: Thu, 25 Feb 2021 16:59:06 +0100
Message-Id: <20210225155909.1853812-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225155909.1853812-1-maxime@cerno.tech>
References: <20210225155909.1853812-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI controller on the BCM2711 includes a scrambler in order to
reach the modes that require it. Let's add the support for it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 58 +++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  3 ++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index f05f6da286f7..1a6babb53cf4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -35,6 +35,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_scdc_helper.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/i2c.h>
@@ -76,6 +77,8 @@
 #define VC5_HDMI_VERTB_VSPO_SHIFT		16
 #define VC5_HDMI_VERTB_VSPO_MASK		VC4_MASK(29, 16)
 
+#define VC5_HDMI_SCRAMBLER_CTL_ENABLE		BIT(0)
+
 #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_SHIFT	8
 #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK	VC4_MASK(10, 8)
 
@@ -445,6 +448,58 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 		vc4_hdmi_set_audio_infoframe(encoder);
 }
 
+#define HDMI_14_MAX_TMDS_CLK	(340 * 1000 * 1000)
+
+static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
+					 struct drm_display_mode *mode)
+{
+	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
+
+	if (!vc4_encoder->hdmi_monitor)
+		return false;
+
+	if (!display->hdmi.scdc.supported ||
+	    !display->hdmi.scdc.scrambling.supported)
+		return false;
+
+	if ((mode->clock * 1000) < HDMI_14_MAX_TMDS_CLK)
+		return false;
+
+	return true;
+}
+
+static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
+{
+	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+
+	if (!vc4_hdmi_supports_scrambling(encoder, mode))
+		return;
+
+	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
+	drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
+
+	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
+		   VC5_HDMI_SCRAMBLER_CTL_ENABLE);
+}
+
+static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
+{
+	struct drm_display_mode *mode = &encoder->crtc->mode;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+
+	if (!vc4_hdmi_supports_scrambling(encoder, mode))
+		return;
+
+	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) &
+		   ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
+
+	drm_scdc_set_scrambling(vc4_hdmi->ddc, false);
+	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, false);
+}
+
 static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 					       struct drm_atomic_state *state)
 {
@@ -457,6 +512,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
+
+	vc4_hdmi_disable_scrambling(encoder);
 }
 
 static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
@@ -901,6 +958,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	}
 
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
+	vc4_hdmi_enable_scrambling(encoder);
 }
 
 static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index e1b58eac766f..6897586228ad 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -100,6 +100,7 @@ enum vc4_hdmi_field {
 	HDMI_RM_FORMAT,
 	HDMI_RM_OFFSET,
 	HDMI_SCHEDULER_CONTROL,
+	HDMI_SCRAMBLER_CTL,
 	HDMI_SW_RESET_CONTROL,
 	HDMI_TX_PHY_CHANNEL_SWAP,
 	HDMI_TX_PHY_CLK_DIV,
@@ -234,6 +235,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
 	VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
 	VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
 	VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
+	VC4_HDMI_REG(HDMI_SCRAMBLER_CTL, 0x1c4),
 	VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
 	VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
 	VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
@@ -313,6 +315,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
 	VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
 	VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
 	VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
+	VC4_HDMI_REG(HDMI_SCRAMBLER_CTL, 0x1c4),
 	VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
 	VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
 	VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
