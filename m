Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF555546259
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B62911B8BF;
	Fri, 10 Jun 2022 09:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DE811B973
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9FAAD5C0065;
 Fri, 10 Jun 2022 05:30:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853449; x=1654939849; bh=bG
 Qpa1vuynQ4TT/KSYUoD4i8MEFR4WtR2D8WfGcdw7Q=; b=oOgT3LQuYU5HtYxgAm
 ulv3tTeZwgkxWdRWxaEz+Bp2BMdNfe1YkKu8qmJou8OTo9trD9JFGdmIpaNWAurD
 FQ0QosTAjWWDb7AFo3jB2AiF6WpIKPyuo6IvsHj+TOHK3ZN0rgq6PswftsQM94RK
 irHJMfI881m1mzi77ZvIIebpK7oOzs3UBBbWhwVzmmvKgLWYhBMrDn36Di6+xoOT
 wcde4+TUwHeYrVoUxEOwZF1GgFS0dWMd965YUCOhDBJRD9at+fvpMu8yDci8lr1d
 SXwQpnTGzELnR5rKLvaot8mS/AmOrwAxSv8yXcbwehAR2zP4IFrCovE1OLbX8wYd
 s8IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853449; x=1654939849; bh=bGQpa1vuynQ4T
 T/KSYUoD4i8MEFR4WtR2D8WfGcdw7Q=; b=qy1qWmFV5RjtIQB0+JPDk2Ry/iajx
 eDvcpVczmjAv4a28yzqQS/6Xw+P0V9C1/6AU1yRtDmI5XovSwYGUIt/YBYob5zca
 HcJ4nvbOJXfpIQBzZrmrU2gCQEfHqAanvvHdX4mpWo3LuTwymHLIA/RprkMcz+sh
 clK6gbHWSyv/1xfaxxa4egs8T8S7iN2Cs3P9jn8LCuCe2Ilp3tXmtOd1RpTsOYpu
 vHxMEOtUX4eD9qCo75TbB7fQ4leLnn1xAXHuCd301FXGE/RM5cTdvcMA8kLE2uzn
 SQIfPM64t/euKCc3WiCgAV3bJscv7YSgB9ib2DOL/LLsmRc/nHNCy3F0w==
X-ME-Sender: <xms:SQ-jYoxGnhoJXv5zouR-71emagMrFX-p0NXoHeyS72rpqO0b2pT-Yg>
 <xme:SQ-jYsTty0G8Bzlu0JRvgmfqthjUP6Oa-JV91QnnZlglNk4NoL5KSBGLIIWGhZSyJ
 MuKxpXOeEoXNg-wzls>
X-ME-Received: <xmr:SQ-jYqWsgluw3jnleUQuaTwuGJZVrHNrAvUMfzO1ntoB-vrZfvQ_l_79GgszD49fVfuyCSKotf4WSE_wwHmbz6cjs0D698-T66ceEfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SQ-jYmgsv-Dzq8NM9faQ98QXZt4ulJr1GsE49oNakYiHTBIkxDTS-g>
 <xmx:SQ-jYqAcb88L2QRkcc7Ea7N2bBpNbHk8nXq6lwsqdPtAn5JLHeu7uw>
 <xmx:SQ-jYnKMbcq2cQ3kMrsbIKVGhxBpJLBBcnCBzw5_qjksuOw7y8_j7A>
 <xmx:SQ-jYt-KY2SLLp7uME1w8YEE7LLPl-GBVB5P3fG7vHd_Tay_4NO1yQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 46/64] drm/vc4: txp: Remove duplicate regset
Date: Fri, 10 Jun 2022 11:29:06 +0200
Message-Id: <20220610092924.754942-47-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 87c896f482fb..51ac01838093 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -154,7 +154,6 @@ struct vc4_txp {
 	struct drm_writeback_connector connector;
 
 	void __iomem *regs;
-	struct debugfs_regset32 regset;
 };
 
 static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
@@ -493,9 +492,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
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
@@ -521,7 +520,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, txp);
 
-	vc4_debugfs_add_regset32(drm, "txp_regs", &txp->regset);
+	vc4_debugfs_add_regset32(drm, "txp_regs", &vc4_crtc->regset);
 
 	return 0;
 }
-- 
2.36.1

