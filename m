Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD46560025
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFD514A653;
	Wed, 29 Jun 2022 12:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3E814A638
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:47 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A46323200952;
 Wed, 29 Jun 2022 08:37:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 Jun 2022 08:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506266; x=1656592666; bh=ir
 xUiBzMnRYI3gOoSOE1ycmJn1cn+8O/4mhVAyz2FqE=; b=enNZ2hj+y39TRaO9md
 XvsUh4u3fAOKfoXxoQWoxwa4sZsZCOq5uRmTByDhNVhl7J2EiKEpQ2wQTEcFEP6H
 xjNuhqTa0Dfi9bnPfIj8zarlM0JogafS8GaIQXSxVfvqx+YRuU2pv1vqsYV9LtYe
 dVmWef7b+q/kr8/ZUfPAtKK11QWYOGHMdwXjalkniLGyQRzoUZD1bcAwNmA3lOtP
 Mr23xqgcY0LfkDJlseA47k+EVSl85cIYe8R13eNfK33zZh3vYzNgAddgqQAeOJc1
 mJMgEoymPhG+YA3IzsJPVzaPXorg3IFqhp8O1mCaEKOtkYFdwlDFFCnLwKlYbWVk
 v5FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506266; x=1656592666; bh=irxUiBzMnRYI3
 gOoSOE1ycmJn1cn+8O/4mhVAyz2FqE=; b=E4apW6QoddxBG0C2YLM2i6g9zulHd
 RuhiknoZcy5qZIiaoF+rGuO6qUorpBsG+gfTSPsidylif+moxYv/qSITK9sgaiUg
 e6zcG23JwAOgUCkswTK2L849NXTFgIDYUBNjXm4kASoOEQBKej91Jjbpye/ILJTd
 q8y1aazOwiIotCVPYAie6htgBs49j5YBODsDO00Fe/Spatx6x65A91cX7SuMUzic
 zuuL9jOsvVEDRjcFYQks6EkdKz4l29hdWvuV67b1d2qXqsrMYn85roakKuvBtCTg
 ujVVTs38dkrVjNBraZUWQ8WKYSHlvvCtL63QOd5QyaR2EfE/uLpawComA==
X-ME-Sender: <xms:mUe8YoD4RM6A-YLkV2F7CaX6--70elkC7KSC9UR-UEhO8GHaUYWjkA>
 <xme:mUe8Yqjqlijy1BjmX9LVx26ErvIITw492BPHayBIH6DUXr_zZtqxoZOdJG2GEGOkQ
 pnYyNB-UTatNo-x-Eo>
X-ME-Received: <xmr:mUe8YrkxVdlWOm9ZD5km8McKsLg-NCUGx16D89FZGnqYEUGXZDdCgRi4qz9AoMMHGR7bbyofBYdnKYkW7T5GASPMsYKn1PtYKNFyZGY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mke8YuzNYZ3ieJbaQtsK9j1peKonN8QWpgAyS2A4lnLifnUjRB1tsw>
 <xmx:mke8YtR5eptcb0Tl2WtlWDrrxefABawO_c9YvVksx7_nqCizsBhbHg>
 <xmx:mke8Ypbz8OTR_pn7_RK4wkxFc-hp-sWRMtJAO-R_3ivB2cQTyPm-4Q>
 <xmx:mke8YrNDLwKG2_o0NA9E1VysKFmOvKdj-NjIsQbkSZONHbICck0Izw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 51/71] drm/vc4: txp: Remove vc4_dev txp pointer
Date: Wed, 29 Jun 2022 14:34:50 +0200
Message-Id: <20220629123510.1915022-52-maxime@cerno.tech>
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

There's no user for that pointer so let's just get rid of it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 drivers/gpu/drm/vc4/vc4_txp.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index db51dd3e20b8..9c5b31fa4b9c 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -84,7 +84,6 @@ struct vc4_dev {
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
 	struct vc4_vec *vec;
-	struct vc4_txp *txp;
 
 	struct vc4_hang_state *hang_state;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 448d48e7e99f..483a03a07ed2 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -469,7 +469,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_crtc *vc4_crtc;
 	struct vc4_txp *txp;
 	struct drm_crtc *crtc;
@@ -523,7 +522,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	dev_set_drvdata(dev, txp);
-	vc4->txp = txp;
 
 	vc4_debugfs_add_regset32(drm, "txp_regs", &txp->regset);
 
@@ -533,13 +531,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 static void vc4_txp_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_txp *txp = dev_get_drvdata(dev);
 
 	vc4_txp_connector_destroy(&txp->connector.base);
-
-	vc4->txp = NULL;
 }
 
 static const struct component_ops vc4_txp_ops = {
-- 
2.36.1

