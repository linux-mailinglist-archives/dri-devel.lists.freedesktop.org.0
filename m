Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B573856B6DC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD831138B7;
	Fri,  8 Jul 2022 09:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CDA1138BA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E0A7C32009CA;
 Fri,  8 Jul 2022 05:59:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274378; x=1657360778; bh=kW
 4lqq+LnFUibttzUI04gh6WR+RRTgJCgPAjjmiSa5Q=; b=Z7FRdRMfDKOnzhBQY/
 XtuchDhQnP4SdmEngr2r+U//zS83DQVnLGWXPXTBEtWffEZBbMFXxOzhd68Ill97
 9WauFjdgePyElcPYsBqkY/A1TdDvz6gRPTY/Abm4XoyrasCAihNw9Be6+JPnSiYK
 hxENziwXQ4WdCCo9VBz19tK0SGIjUVgHVDYN2evvKuvd4uqhiHrn3jVP8EeIZ9Cj
 5EcVWDg01HCIQj37C2fUUUBg6v+UVpBoYWcDL9tRo1OgxKyNUvYPFris+/8O131f
 gv50vpuSgH+9my6VSJWvmYZwFAKHEUkuoywt1vAvfmsSzFmtIB+e3R5gpsYZkGtN
 veKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274378; x=1657360778; bh=kW4lqq+LnFUib
 ttzUI04gh6WR+RRTgJCgPAjjmiSa5Q=; b=g/PqpHIJpdSZnKQowjXYqZEwUGL3A
 DEaCXO6FeQT2ttXiqaP/E8IURlzGZSJ/NuvwF+flY/Ue8hoRw0RWQv/6SwDzcK8H
 +GXfnlRxss3CQXW2+aJERZBegjqA2Mn5nBuW7Eq+2jvEU+izWVAoP9Aljw+Pta37
 N/pFdM6+DQ/fyJjLYc+MW4q7eCdZJ0nORrYeyO1V//NezuJS6TCPreEKlQIKD/1j
 nY9gRqN5vZ+EO4heKfgavI+lfSAlLDiu6Wqvmgd2AyyovzO3ufFy4m1aEUniq2x3
 r8w6V2mPiMdnlFIJ8BcDdsDAP6xXYxqqI4IUZ/KtinvqWDe4xxuBZ+ZxA==
X-ME-Sender: <xms:CgDIYtbkKI8h0_bABvKTtruNfpNAIv1YXIz5wc0yW8EbyQQcHGwB6g>
 <xme:CgDIYkbPP4Nn1ejXwSGH6cohgz4wBsuCinLMg6qL5QR3FwkIvGz13oKIWVOMIQW-D
 Hj9GJJDIb_wBkdXql8>
X-ME-Received: <xmr:CgDIYv98TPbcCZDONU1fVRdePoOXybX5JYIaXPCyCU1MoGqUUnok3zdo72huV-AJV2KKuyueitujwVLALohvGPXe6YmBjff3dsRIlow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedufeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CgDIYrq-1TiFF_KepNgRJIqsAl_mZR1HxCdUIpGL4GAnnlFEgFDptA>
 <xmx:CgDIYooVGZhuZucuJTLManMdf8oG00UvVPpOHNXI87ma7UfvSafrpQ>
 <xmx:CgDIYhTEJlSeNkuj9GcmyGhQcjZs5ZcX3mZQ3x8dDKds-UhumUzQ2A>
 <xmx:CgDIYhmM_UHi9Q6KCsiFSfRlDsZEDbsR_YIJAIVbwWCAUaFLM0D-bQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 50/69] drm/vc4: txp: Remove duplicate regset
Date: Fri,  8 Jul 2022 11:56:48 +0200
Message-Id: <20220708095707.257937-51-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

