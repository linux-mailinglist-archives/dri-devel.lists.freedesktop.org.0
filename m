Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2945034020E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 10:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7188F6E8AD;
	Thu, 18 Mar 2021 09:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84446E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 09:29:29 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 205615810AC;
 Thu, 18 Mar 2021 05:29:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 18 Mar 2021 05:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=cp4JYBp7SNAXp
 r0wqEUamycv8Z5Ef6rK4yLi6AM+P/g=; b=D06jyL+za4HGhp0cIuNWB/cbmo7yM
 t9ghPDEKxCBviSxvHY1Ng0z4oaOMA3vRGbv5KlyRX1svBtOUMgz2I32Wmqa8ovMq
 zFeXpzQVHrNFOFEJu1WHSg57La4AjOaU/SBLQd2yoFb8dLWEy+LAW0CwLsebH6ir
 UKfHyc3vaW54agr7vpct6fy6piDatezqTVXRiEwcc5XXUUec4po4s/04jpYr8YFk
 ogWvl+4emedoTonXRGnJCXYxJOA+hx7FiaJRAYzitW4yPSwgXY6rs8o7qH5TNQRi
 9TICurmMw6xvuxKaDwi+OvXg7DDJPlgSMdMkEFl0vlDbB+0VnN3ote1yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=cp4JYBp7SNAXpr0wqEUamycv8Z5Ef6rK4yLi6AM+P/g=; b=k6uCPiCL
 +2UrYkGR3iFvIYVowv6v3ov7oayS1dLSiPhzdA4h2XdqyjDDpJQDJIt1hf3MF3WZ
 zwronogEayS1ilQiNvduukhBeeem6kcnW7h8BfBn3auBIKX7blsMppbXv0Si0Kle
 rJQeW6DAyAt+HJOvNyCdBtBN5BGAV68S35OtZpqlmFCrmaq355mNSv21jmfWaRte
 5Jp98Bzep7ur4hPyq2PEfxRwtOjUbNfAVYzcuRXNNnKuVrcyxw1RGWnHwJWbqqSB
 ERXoplorQjHxrbzmtb0ALAtUdlLLW5S1eGmRB3lFwjl3JkUo7mypZTAskfr0UdiN
 9wTVrrH8cnrPuA==
X-ME-Sender: <xms:eB1TYO_KwPzk7VMpUI002wn0bGmTd1HzngCCceels5-dAZ4YU-cfDg>
 <xme:eB1TYOs9s3Km-5YY12Ehl7_lTvCQKQX5rgHKvia1pzCYEMMfIRd8aoab5KZR53NBH
 e5b1xb-Gme2errYrFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eB1TYEDX9rXpyeEZNYfLqT8QMOPUHSyzCzP4VexIybp4CkRZAKOOTQ>
 <xmx:eB1TYGeSYHOxogoMEkhRR6uHhO3BWrOwA3RZ3gN_9WNM6FZvFh0MFA>
 <xmx:eB1TYDOk3mhvGZTj2lBQACWTDvviBYTV0gieow9FzMOWHkObhdGLPA>
 <xmx:eR1TYOoaayBfIcccME68O6gxRmBwgiFfnrZnvgXBvDVy9c1QcH617A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AAD001080066;
 Thu, 18 Mar 2021 05:29:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 5/5] drm/vc4: hdmi: Raise the maximum clock rate
Date: Thu, 18 Mar 2021 10:29:17 +0100
Message-Id: <20210318092917.831995-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318092917.831995-1-maxime@cerno.tech>
References: <20210318092917.831995-1-maxime@cerno.tech>
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

Now that we have the infrastructure in place, we can raise the maximum
pixel rate we can reach for HDMI0 on the BCM2711.

HDMI1 is left untouched since its pixelvalve has a smaller FIFO and
would need a clock faster than what we can provide to support the same
modes.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 530c83097b1a..a31771dd09e6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2190,7 +2190,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
+	.max_pixel_clock	= 600000000,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
