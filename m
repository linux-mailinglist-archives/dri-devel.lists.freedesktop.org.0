Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74822554D55
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269AC11339C;
	Wed, 22 Jun 2022 14:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608D011339F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 30DB23200974;
 Wed, 22 Jun 2022 10:34:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 10:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908489; x=1655994889; bh=T5
 HcZwYPPe1IICwyp3JZYsyUJ4ckmtlG8sFVxjrgRrc=; b=fKCAeDSHwZA/JQKV22
 OOBSKjzWX3RCbIOcLXcFbe7dgkwPLMz5AZ7h6NAWd2oycYMqkLBPkBb0mqfDDrF3
 X/4CaE7nex1DO9JpQdNArQ+WqMwsPB1v868WOZhuXDeqBDlEnqPpy0A4pctSs/py
 VZiApnR1EU8eyu02QFxwVFZKp/OzktxwT5vf4z3eZALvnMSjfKqgWeOx9Ra30a0s
 XIfg0Fa3upLlpjjrNX4IM+mmicTYO0UgHY40B56U7Br7A2sTHJmobJY0IUG4cRCU
 8/7fzyd2e9jnyEPxjs2ng1iHu99u1S6myqwOI5IlRDYMqZhgjbgQo8mq4KQw5eC+
 3KGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908489; x=1655994889; bh=T5HcZwYPPe1II
 Cwyp3JZYsyUJ4ckmtlG8sFVxjrgRrc=; b=o+86rDMokIHjRJkS1lbJuiZNkgKK/
 xVtBn1EwYjvg2rOwhJF0w6P7IM7EZXWuAEByM03Ji/t/4e4O6cZ9Nv0hq1162/n9
 gCtwpYPU9Tb3uoaXV6fTb+8LU8tXgpDhlgvxRJhmj8iRP8ieLmO8EDUqlVOFNBwH
 kVGtQx/HkP+Az1UGsU+WES5KS8ejEK444K7BMUPcIvOunf6YcGB+jrDGDiYPwZkf
 MmPSHoeCfCtIqciNJF5IaTVyWyMrdxUmkwrE7ytJmzgcmTBwy8Wvn8JR4mNDMBba
 WnJAW4BdeZi7JebmAJKIQi1VI+UILMD5mveHecS1arRgli3PNxRN+fLAg==
X-ME-Sender: <xms:iSizYojOzG3DTuYzFZtQJw3G8gmBc4faIuJGEfxrubbJOrW4_4mPRQ>
 <xme:iSizYhA8GF9hLPU28B0fAGxePNQp6VOD0ZGh4xCVHba3rJq79vsuI5-01UlTPpRbt
 CBzf_wxnxm3DxNgU6E>
X-ME-Received: <xmr:iSizYgFLaHnygcYJpCmL_UINfvOd_TiMOXg8kwk8mJCazdDplKbrZVzny2EpsD72giGEPTUAGSxJoSBYuRIedybYQXJo3ALMiiV0fNM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iSizYpRBmqy565NJNrPSbJNvQqWvHGxVaUQCgMMcjhtAxp_0yI5XNw>
 <xmx:iSizYlyoTB00FLPoXvaqUqFiMQlGUKibFjJrkgTxAbzt3x1osDg4Rw>
 <xmx:iSizYn7znNZ-r2l2QkqZu9rF3CKRL_9TzslimX64kRGuAmfbEaYwkg>
 <xmx:iSizYnuaIXKgvPxmxSEwZShmEYBEzd6Elb5j7usq2QvHtMbqbBAFnA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 49/68] drm/vc4: txp: Remove duplicate regset
Date: Wed, 22 Jun 2022 16:31:50 +0200
Message-Id: <20220622143209.600298-50-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
index 0e868aebc25f..10862a850d6e 100644
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
@@ -522,7 +521,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, txp);
 
-	vc4_debugfs_add_regset32(drm, "txp_regs", &txp->regset);
+	vc4_debugfs_add_regset32(drm, "txp_regs", &vc4_crtc->regset);
 
 	return 0;
 }
-- 
2.36.1

