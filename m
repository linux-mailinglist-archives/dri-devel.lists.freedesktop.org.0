Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15496554D65
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E320B1133AF;
	Wed, 22 Jun 2022 14:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A9C1133AF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:24 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A78915C01A9;
 Wed, 22 Jun 2022 10:35:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908523; x=1655994923; bh=zb
 qot/lYj1EhwVWOFtCHJqZHaINz0fEgHOQJG+IZh74=; b=y66Smd7Ngtr24i74bI
 InPkJaQlSeC3IKrp1CQRln5z6lq1X5AAVvFQ1W342kGcbuSnyK/nIphtU3kdzdLC
 KADJO9EvdCEiQ56BtznEIRaJUmwZVIi1CESVbDEjClDfq/czRr+zrEtIEbCmY+QH
 CKu6MUbNXzK2m4bZytV5yko1jc2ZKCFfGz+b41CEraGy9CXmyBu1sI3Ne/GnDGro
 Aq0dDVSTgS7WWJkZVoCq4wcdw2bGzoikLCxeiABrkJmOanpIwX4/8GuMb8y6h1Ad
 0rKhSu69EIQfQeS1TAFszm+tuuTTSsr0I2yMBk0V0rC19q5SY4KqO/T6L8ZMC6IR
 H94w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908523; x=1655994923; bh=zbqot/lYj1Ehw
 VWOFtCHJqZHaINz0fEgHOQJG+IZh74=; b=aEfmRVUR16NV24k+vuwO0Z5+PbKHq
 B+d9agkFHs67dzqLD2tPsqxvRyca7jfabGsC2Qk/ZL3e48GVr0ErkIUf5y8S4NJN
 JRCmPttJrMD8fWwBzTSdnkkDdUvk+VdP8Pydu2GDUuCFR8UTl5biKhOe+o0JucQZ
 8NUKud80SYr7TzfYFI1LmKCED4XPOt+O/b/QMPs8v+urnm4/CmWz59/GmIDnfmGw
 DZBcGgtkpYXldAif7CYVOqKVaCZblJPoLNRWoj/rIWZ1GPECxdrwFZYSxJEAJaa6
 RCWgMZQKhci/H2kRoOBpgHP0Nw4h5AWWIToFkAxvjABgvdG9yuTes1nFQ==
X-ME-Sender: <xms:qiizYhc_CcUUFc_tdicGig4WT8PlvcPI3jQZyUr187pDZpDSJhJxzQ>
 <xme:qiizYvOiyJatKAhNH419cPCD5HpsCK9HjrZxWJ2rDgBMdgtmqa_8BkFoueaJbHkPk
 hDj3EQ5lgSkLPdLKOc>
X-ME-Received: <xmr:qiizYqgLOF8z96b6SUn7eSjctu_fISVmsM1seARZiyzAy7XzlpY45xVIBG7IOwE1EyXssusP7nhFXXq4irVF-GJr_mh4SNrJny04RS0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qiizYq9SGZmFfjwjzIPmwAAmXUO6rXr9DbpbMMVPG73UFXTPiZmiOg>
 <xmx:qiizYtsyqScYEvqAX2tUXmqjI3vYoDcIZADjh-cGmJsRkcm4-KRLxQ>
 <xmx:qiizYpEFhjOnGtW3tep6sXODQH9h9_scEIShVrC3EjXh4TaV02Yiog>
 <xmx:qyizYnIq9edNuQCKS9jEJ5X_M4AvY5XsMcHMxRytXhrULLb_JtTQlQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 60/68] drm/vc4: vec: Switch to devm_pm_runtime_enable
Date: Wed, 22 Jun 2022 16:32:01 +0200
Message-Id: <20220622143209.600298-61-maxime@cerno.tech>
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

devm_pm_runtime_enable() simplifies the driver a bit since it will call
pm_runtime_disable() automatically through a device-managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index b2a15c39939e..7e02fbad3208 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -583,42 +583,32 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = drmm_encoder_init(drm, &vec->encoder.base,
 				NULL,
 				DRM_MODE_ENCODER_TVDAC,
 				NULL);
 	if (ret)
-		goto err_put_runtime_pm;
+		return ret;
 
 	drm_encoder_helper_add(&vec->encoder.base, &vc4_vec_encoder_helper_funcs);
 
 	ret = vc4_vec_connector_init(drm, vec);
 	if (ret)
-		goto err_put_runtime_pm;
+		return ret;
 
 	dev_set_drvdata(dev, vec);
 
 	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
 
 	return 0;
-
-err_put_runtime_pm:
-	pm_runtime_disable(dev);
-
-	return ret;
-}
-
-static void vc4_vec_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	pm_runtime_disable(dev);
 }
 
 static const struct component_ops vc4_vec_ops = {
 	.bind   = vc4_vec_bind,
-	.unbind = vc4_vec_unbind,
 };
 
 static int vc4_vec_dev_probe(struct platform_device *pdev)
-- 
2.36.1

