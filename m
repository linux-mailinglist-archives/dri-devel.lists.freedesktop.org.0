Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB9057092B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C110E90347;
	Mon, 11 Jul 2022 17:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC4090322
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 34B265C006F;
 Mon, 11 Jul 2022 13:41:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561268; x=1657647668; bh=kW
 4lqq+LnFUibttzUI04gh6WR+RRTgJCgPAjjmiSa5Q=; b=KNtYKbLSQ2gsYtV+Lg
 9VwuXN/3j0sHEizNrkHHBQS8v/XHCpLRCbTYsjXTjHae7H0clh5OfJL59JcXiXwh
 571HU+o7aSJX5/48Aglt8V6X56B+TNcJvmaT6JFieST31C7S2ppNGZycr6TTePPS
 SJHTq7KcABzEMnOlSLcA6Q3rTr/CXoe778UdnOqjCPpMrgsN60rZWdstRDp8JIeU
 tZ7rN2twKrNRJ5Ss96Io9CutDpVHUaIQsI/vvgvVk6ii6DU9k+rT8xKWVGrczfBt
 mxJau4b442li4tKWzSNpt/EC04wOunVITYhx6pjS2PpfFxkBlON6+3Ke/HbS9G3O
 ylbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561268; x=1657647668; bh=kW4lqq+LnFUib
 ttzUI04gh6WR+RRTgJCgPAjjmiSa5Q=; b=2kogDmYi6KacJETFNFQGiO2M2i5iU
 Z+0EWq0jaIXK7udEaCkGpKZ+Z+KScqqpkO/C3mutEOK15x9sAUP4mPleTfigVtQ1
 EeL3h7q12yLzys9nEALCer592MvwjFgdStkDVLtXGAddGQufpz8fyOlyZxBd7RIQ
 ZadjyU2v+UVs+QM5JQaylNSPpi5yzLSz2tEWAoRmzZw5iIFZ7183Oxx7mcsUlXIU
 wqz8CDuk9HYs2g5Wxw7z3myyLPSX6uEWpMtKFOzs8+cyy5doGEGA20uSVAF/Wmmx
 QngZjWw3XxxEg+H3X9raFTpDPLwNpwJdM3tAIH5EFVLhqlPIer3XKmtzg==
X-ME-Sender: <xms:tGDMYiZZel_pNp-8oPyqto5AXQfyw95qFvIbzRB9GN7T2vyYk2kMUw>
 <xme:tGDMYlY1Lv5ruhHgvbcxr2JzdcpySEXdyUDDMYfBEC8GyLupbTPbKm7c-R1NXWsjk
 SIBD-ITrcDW1qMbOKE>
X-ME-Received: <xmr:tGDMYs9RQHSIRACzoqp1fD8suZfgWypirsiYxt4kBE1zYEEUL7_0aNIiTDxgCkrcLPsEcFsE_UKP_HbuLCtf31jzm8j7kCOe511GZ2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tGDMYko7mnoRYCwDoTMNoGN5GMwEhHBO07wrj__n0XkG4qAMXqEFMg>
 <xmx:tGDMYtp-a9WjU6YsevOMVlqDvdZSLtQYLrhtYiq--NRHeYaeJFySDA>
 <xmx:tGDMYiR7m_D4I2p71tfiSEkdr4-L9McA2i5BO7bLPV1V1SjYioBxUA>
 <xmx:tGDMYulHEoj4v4jW4pMth1rew2Wgoo9V_x9oKZXgjfxFahlVs-70Gw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 50/69] drm/vc4: txp: Remove duplicate regset
Date: Mon, 11 Jul 2022 19:39:20 +0200
Message-Id: <20220711173939.1132294-51-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's already a regset in the vc4_crtc structure so there's no need to
duplicate it in vc4_txp.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 483a03a07ed2..19e37924ce77 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -155,7 +155,6 @@ struct vc4_txp {
 	struct drm_writeback_connector connector;
 
 	void __iomem *regs;
-	struct debugfs_regset32 regset;
 };
 
 static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
@@ -494,9 +493,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	txp->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(txp->regs))
 		return PTR_ERR(txp->regs);
-	txp->regset.base = txp->regs;
-	txp->regset.regs = txp_regs;
-	txp->regset.nregs = ARRAY_SIZE(txp_regs);
+	vc4_crtc->regset.base = txp->regs;
+	vc4_crtc->regset.regs = txp_regs;
+	vc4_crtc->regset.nregs = ARRAY_SIZE(txp_regs);
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
@@ -523,7 +522,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, txp);
 
-	vc4_debugfs_add_regset32(drm, "txp_regs", &txp->regset);
+	vc4_debugfs_add_regset32(drm, "txp_regs", &vc4_crtc->regset);
 
 	return 0;
 }
-- 
2.36.1

