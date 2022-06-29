Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A210560027
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E311414A64C;
	Wed, 29 Jun 2022 12:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF87E14A63C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 98C0A3200972;
 Wed, 29 Jun 2022 08:37:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506269; x=1656592669; bh=kW
 4lqq+LnFUibttzUI04gh6WR+RRTgJCgPAjjmiSa5Q=; b=dtCzB8mhEhxcJ2sfQX
 15ME/sbBc/KS1tEjRYksdwYF/Mt5rVBBlg6xL8nbZg+GNc3F/TCmtqxl7xjj+Ycx
 k/wI7SoIvH3ToqJg/IC6Dy11GXPiILLe41I2k4vEA4WCsV4o9yNmBTtMfcz58uXz
 igMCbOQIaXz2JyhCul1LvyRwSRCeDfkssuy+mzyOQa6NGihyFZ4pKLJaBzaFiYn1
 K/G/+y1I8kMcvAY9kjsu/auVvrQdpSrekuAsMBY5tLaMNfy+oynM+oXcgGSEMupR
 4nXMU7Eq9pCY8MbbBndsIvITAgtQdC1P4TIqcT45Y2XYFLQF4M42NYPoNEAReZYr
 KNkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506269; x=1656592669; bh=kW4lqq+LnFUib
 ttzUI04gh6WR+RRTgJCgPAjjmiSa5Q=; b=ZKmoUr/Ntf4eyeXcqiA9q1sJ1l1WO
 Bos36fNn/p9Qamws92DkAnS/J2ge6R3tx5lo8ViYAL4hs9eHm2dF5jkhABGtm6Sz
 INluAX4r1UWcjIO4ACFG7T4cp+WqWVSBpOR16+uwyZe24VNgyxL6eu41qV6sYjsj
 hba1ZIsc6JCfSqOQRbGYQxpoMpzYAoswnyOSLpd8ZtKNzL24QqISsjcQoYAprMDH
 0eSn2/la3aXLemWfYHSxMoRy6m5c40Ev7q6ZPJYPunaS5P/8X8bkM8rH/skkX/DL
 utjBLwecxLrXkEHl0MfiGgdO7emaRicPzkT39N+oh2M0yEOQwy6PXKxPQ==
X-ME-Sender: <xms:nEe8YgAOT97n1QMvQG2-RcVeKYkyiS9LA6dycahbuhXo-59pcatzwg>
 <xme:nEe8YigSM952SpvcgawNGseYbEza1qLEJoG3jfb6vLRhm2KxKAitMS11Pg1FzeeMK
 IkD2pQCyQYvUt62FXI>
X-ME-Received: <xmr:nEe8YjkDT-LjYfWfmSFgyZhTUNMDRL5R56fLZyFZh8VLNo2T5_p1FxwWWsfFEdbaeVfedOMxcDzK9SakCvhfkjCXk9vl-KMzjvIGasE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nUe8YmwB-QNtOo3hda436A9_cwneBNf_j3Cl39pX_uJ747lGrNbJBA>
 <xmx:nUe8YlRnIJzXpiGYkNTlH6eZc3iyWidYx5tWS_9TZ157XBp_wtVaAw>
 <xmx:nUe8YhYT-DASH55mDQRYZzCJOC_LffqDYMBCwri5_iG4TO-5c4hitg>
 <xmx:nUe8YjNdOIgJuC62mmj_3o4wHsKX5PI-mzN5CU0Ky1emSR1gR4_jYg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 52/71] drm/vc4: txp: Remove duplicate regset
Date: Wed, 29 Jun 2022 14:34:51 +0200
Message-Id: <20220629123510.1915022-53-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

