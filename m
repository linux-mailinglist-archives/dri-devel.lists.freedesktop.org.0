Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE6C37679F
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936C36EE62;
	Fri,  7 May 2021 15:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0655F6EE62
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:06:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C3E6713DD;
 Fri,  7 May 2021 11:06:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 07 May 2021 11:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=5M+6fjInAXB3Y
 CU5vKSsEobsfbDpPN/+AxgvhrArl1U=; b=qT5A7zdh+C42xlGNDDr6o99h0fb5b
 pzvQTQQP4Sir2T6X5ft3+K5trWDwcAz2AWSPIfMCH7T0G413sXpeiXzb7BttWXtR
 wIhvmPhzsrTWkbW0+m+aYnWBlxispfjNuEwcBpWAeTBdSGdxi0PDsUjZKePRIK7X
 mn3p8PsfOIP0RLRHZ5gPeZPuuhU2xO8/YXvaXqX4xFlcYdjWnp91bkzXQjT7mjzw
 be06spsmR61oyyuLOUnfXaE31RhHUoGGpVehsLX8lq06J+0z1Mqq/zgo5i2CJzHz
 LEPsriFAgcWslCop4cZxWArxr5YpR5MgqQ8ImuOw+g6b4Lm1xedciZ2FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=5M+6fjInAXB3YCU5vKSsEobsfbDpPN/+AxgvhrArl1U=; b=gIu9stUe
 CyJfcEat9sSny+MBFfkVqK7ZdiMK7buvPuDsbWMyLrk5WKfOaT2RHsT2IiWZSKk5
 NsznZcBoFNuSSn38wzeT2zzetXAfLAUITPkWNuNSVjIpWwgaXVOKxWUajOsglx8u
 DyYCXkkjiIzomy1m363/kP7YCkl5YIHajEZNj23HVkGraYxh+EKyzsiD+tBuj41c
 SahjNVeOB1DbFyuOrae82FpIDXdq0UN48pzd6mUDooCrQv1XYUlaea9Ce4sq43Xq
 kDOi6RtX689qVYJg21oDv+k2P+KPosgkWaStOshKrWTq0bE3dNBXDYt9wL8pYeJP
 4iVaFZdu0VKogg==
X-ME-Sender: <xms:bleVYD_tdawJlv_zWPitnAgFDFe_Xyc4sA6R1lseLHAMdAJK8Z2gzg>
 <xme:bleVYPu5ZgFAHFOAIgYfqTDU_nOIEcnWNH1HX2CGNtajxmYBP8QDBkB4nBmve5JAc
 1HWdT9jvcFCVgz-Ljk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bleVYBAKmfjKgdbABzzcP42TyLwgfCFUT-WwVIOM-BN4adhKaV527A>
 <xmx:bleVYPcU18PytWBm2TIUoINKdtqfY7Tl57-qDycd8PVSczdgVHnHiQ>
 <xmx:bleVYIObYWEsDfmBLpX0t4VvMy1P8c2ECOWxQATwIeSM60IdmhBSyQ>
 <xmx:bleVYEnUjs0SppVZem5FuppqAZtz7zuoVlOcPeUqQSpqoSwf7nT-3smzbNE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:06:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 12/12] drm/vc4: hdmi: Raise the maximum clock rate
Date: Fri,  7 May 2021 17:05:15 +0200
Message-Id: <20210507150515.257424-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507150515.257424-1-maxime@cerno.tech>
References: <20210507150515.257424-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have the infrastructure in place, we can raise the maximum
pixel rate we can reach for HDMI0 on the BCM2711.

HDMI1 is left untouched since its pixelvalve has a smaller FIFO and
would need a clock faster than what we can provide to support the same
modes.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4fa7ea419594..0c64de5d60ec 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2237,7 +2237,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
+	.max_pixel_clock	= 600000000,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
-- 
2.31.1

