Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DBE219941
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D785E6E9FF;
	Thu,  9 Jul 2020 07:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3005F89267
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:44:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 379572F3;
 Wed,  8 Jul 2020 13:44:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=3uwAqq5OBfzBZ
 /+HBzsienxQfnHCP6B2zMAh8ZKS3hA=; b=FIW9Nhq/hGyqdk1IwHu5rhQ0/G2i8
 cbVMhXHKrwc/6e1pbNfLWLVtiezV4ZTbdI5m1BS4JJ7rB6yi/GFYB2r9H4pEYUll
 K1IGYq+muFeuqyFqrbK/PqV3QVx/645vfgEb5nTiQ6yOalvFIgJxnWmPqdAYy9y6
 YX2ZRP3JGd0/XDYsocGSUhCr0QMX65Cr2gC0i/Bjj6II/CFCvnLsXpsarA3sbrqJ
 mY0qFoTmxL1HW0rcP99nzzeTfrxWhHItlbCUl0Ihp7Ed9nZrhTd7DiFvi0LnTjK3
 HS3L+0B6tHfTlTH4EVpomKQCxKVHfXD2Bx7wIYVJ5Jsy/4Fwo+OqfqcLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=3uwAqq5OBfzBZ/+HBzsienxQfnHCP6B2zMAh8ZKS3hA=; b=mpxbQxZb
 NFFhFIQloBnB1kLmxMqEXnPtal73GZluS+EcjaDa4QNJclljdIEIPDEsmjBH/24s
 tNWffmcPtLH+33I6o+4TjuB8BlrxttxcMKVKZR4G4YqX6EEddJsfrclN2nH1pWsF
 c1O4V9jWk/3t1vRweBHctieOEuVRm9bRMupvUFIyiRl6hf2WOyCVWUn87ZHmfMua
 yhcpMb5SRAf+/XEeemx2zksBeoMPTxr5mYk1QdPQoFgGOXaadOlKnaIL+AfM92av
 bAmERRoYUehi7U/e/bTUlvwd/Nh/AFeTCb/VtmGXOJ9jWpGxvyWW7vcl+WDXBhF0
 Op9tSIfhFi0Igw==
X-ME-Sender: <xms:6gUGX6dT9ToQ2wImlNCodALim1PfV1l2D4zl8K68TSSIlgY66bi2Lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepiedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6gUGX0PEhrtGqW7sJVOGV8BvXwMbuv6C17F1rg32cRGORl_WIppzyQ>
 <xmx:6gUGX7ga2uswzepxhvsvSeedLqEnmj0QwqDBX8GEnlag2aft6MxAEg>
 <xmx:6gUGX38cYtZNOZ54hUbnQHMiEVSV6pqCHk4d38Esx8-xI-BAQr4U3Q>
 <xmx:6gUGXz_lhauCcW9fcbd3XjmLZ0Dk-iOdyEZiU_oB_oPT8SpMXnlw5u-RTzs>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65EC230600B2;
 Wed,  8 Jul 2020 13:44:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 69/78] drm/vc4: hdmi: Remove register dumps in enable
Date: Wed,  8 Jul 2020 19:42:17 +0200
Message-Id: <805c78c427113b151dbd289dc52116f17734a1da.1594230107.git-series.maxime@cerno.tech>
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

The current code has some logic, disabled by default, to dump the register
setup in the HDMI controller.

However, since we're going to split those functions in multiple, shorter,
functions that only make sense where they are called in sequence, keeping
the register dump makes little sense.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0a9a323e03d8..4058985940e6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -430,7 +430,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
-	bool debug_dump_regs = false;
 	unsigned long pixel_rate, hsm_rate;
 	int ret;
 
@@ -489,14 +488,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	if (vc4_hdmi->variant->phy_init)
 		vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
 
-	if (debug_dump_regs) {
-		struct drm_printer p = drm_info_printer(&vc4_hdmi->pdev->dev);
-
-		dev_info(&vc4_hdmi->pdev->dev, "HDMI regs before:\n");
-		drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
-		drm_print_regset32(&p, &vc4_hdmi->hd_regset);
-	}
-
 	HDMI_WRITE(HDMI_VID_CTL, 0);
 
 	HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
@@ -522,14 +513,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 
-	if (debug_dump_regs) {
-		struct drm_printer p = drm_info_printer(&vc4_hdmi->pdev->dev);
-
-		dev_info(&vc4_hdmi->pdev->dev, "HDMI regs after:\n");
-		drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
-		drm_print_regset32(&p, &vc4_hdmi->hd_regset);
-	}
-
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) |
 		   VC4_HD_VID_CTL_ENABLE |
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
