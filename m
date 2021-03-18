Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ACE34020D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 10:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C75D6E0DD;
	Thu, 18 Mar 2021 09:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9276E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 09:29:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3CDF2580F02;
 Thu, 18 Mar 2021 05:29:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 18 Mar 2021 05:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=o8pH4aIR5A23s
 svm8ZUyfJiwKP1mhO2pCnPxnh7MJsg=; b=F2WVT0XxakxnT0UkhO5mWeO3ZIbmP
 jMlqBxLVbeZdFn/7Ke57MnBmGvHvwC3UYoH6T+OMonRxgP8kXZPMC/J4WposwtcC
 rtvyX+Nn9/GqZJtO5UsldTLvnBX1g0h8FRgaTLYimBkxtUNbBLW3ctLwx0BM5tPH
 qfgVqqUHxyO4nZvsYdr6wxp9RZHSGp1bzTtBAZvjAiYe1fe+Qw4xbDDt8LA0uIPL
 eqafQbz0z2GZr/eF6WIgyd12zVP3Yzl2E6VhmM5q8/gmAlyoO5b0uJkhPRcUhLId
 B81+HMNtahJYrrR/204w7xuyPj6m6/YoVcaUuvq+ocpeDmOjckxkkpCmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=o8pH4aIR5A23ssvm8ZUyfJiwKP1mhO2pCnPxnh7MJsg=; b=T1GdtcX4
 Bat9C35ZM6szn9stfPXARlM7JZyCkWBpVBri5Uvsx5t8ggdGKm88Y3+9F5KVG2my
 8VESYDWqq1riz+W7VZfNN99/OIUw1QiHVVV3B3YMtJp+J0fHVMoUlpiPSJECiWjs
 ri1QFHqrHF9uGXRqULoWEVsT+18ESlQRW49tTHunNfJWGnat6+xa0/73gM9fgCap
 pOo8YhfCQmJxCfxd2uDh/UTYLOxWidJNz95k2/9RBsHpUBhZ08LFqzzRGhH4MUXT
 xe7dfQBhA/7U3vhPKUt/Hhu6quzqP5X+crGiD2ImSfNu3QztFWrWJDgttC7/i612
 OkMjHDgxmhJYDg==
X-ME-Sender: <xms:dB1TYMct67AZwpKrVb_9UM7IiWay2IbA6BR4Eo9s1ddlxaiPnWF3lg>
 <xme:dB1TYONjrayM1fQYDLlQ6ea9DKe8uMQVBEqCsuRPqqrMje5RMrI3SG-A-taZ8GOP8
 gFGC8BjkXfTlOK4Gus>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dB1TYNjRNTRfiaDpSTgjcZM2RXcWBzsNvZaGQULgpNriy0ay52gPtA>
 <xmx:dB1TYB_VdZ20Bsy4fWfptc0ZuSvD_jHSjju-x1z-v_7XS9JiJTxTpA>
 <xmx:dB1TYItcfX-WZgQXrXRt7zl6NbyWb_5zL7bm0K0tu24bnBn4dISqbg>
 <xmx:dB1TYKJ7tjVTIex2xkQyKMie2sfvb9-5LbHyR_oRGt45qhSap41G-Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D22BC108005F;
 Thu, 18 Mar 2021 05:29:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 2/5] drm/vc4: hdmi: Properly compute the BVB clock rate
Date: Thu, 18 Mar 2021 10:29:14 +0100
Message-Id: <20210318092917.831995-3-maxime@cerno.tech>
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

The BVB clock rate computation doesn't take into account a mode clock of
594MHz that we're going to need to support 4k60.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index eee9751009c2..eaee853bb404 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -91,7 +91,6 @@
 # define VC4_HD_M_ENABLE			BIT(0)
 
 #define CEC_CLOCK_FREQ 40000
-#define VC4_HSM_MID_CLOCK 149985000
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
@@ -739,7 +738,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long pixel_rate, hsm_rate;
+	unsigned long bvb_rate, pixel_rate, hsm_rate;
 	int ret;
 
 	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
@@ -793,12 +792,14 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 
 	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
 
-	/*
-	 * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
-	 * at 300MHz.
-	 */
-	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
-			       (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
+	if (pixel_rate > 297000000)
+		bvb_rate = 300000000;
+	else if (pixel_rate > 148500000)
+		bvb_rate = 150000000;
+	else
+		bvb_rate = 75000000;
+
+	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
 		clk_disable_unprepare(vc4_hdmi->hsm_clock);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
