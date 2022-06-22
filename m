Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC2D554D54
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D7A11339A;
	Wed, 22 Jun 2022 14:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721DB11339A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3F2D832009A4;
 Wed, 22 Jun 2022 10:34:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908486; x=1655994886; bh=MS
 NL3Q/EPskg8EZkNLnemKhV3AQsW/dEOF9nwXZOAGM=; b=vdzOdRjSSgKd/u+vT2
 5MObNoJb6abgTKsXyj7rAteAQpUxpn+UGfloxKlwUEEzBrhMzLWdV9Wh5q0BUiei
 +rO1ELOG0ud9t21hA+XSrjp/RF/vggv8a0yc/Bp/YE07u3GegQgvOXc/vPZ3QrP4
 dtR9b9BnXJ8rUHXWfW3eS25Z4BrkE15EsY+EadpgBuje55flLKNwqigqFA+KC1lC
 NpS1XKojZRTa+1RAJy4UWWF/ODuW86JJfs6QIECghK1FoejO3+RubRrr+AET9ReN
 +qEqElWGWwOCm6M76bdAm4NiTRFuIxA7F4GEIUVuQ42mihhD11tyoQI3+dS6QGBJ
 ce6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908486; x=1655994886; bh=MSNL3Q/EPskg8
 EZkNLnemKhV3AQsW/dEOF9nwXZOAGM=; b=OlPGk9/D0zT7AqTrc2QDzGFVpZMr6
 6V3iUigeTgoQwa6+MDIjoBleBmj5UZsc1n5T1Vxjds8FWfd4SRRDWMgtikyRJdAI
 RDunviGTVeGFtqVc5kKA2U8Rd/V+/4qXIL0+NIjFgwTgon5/hbRgE2/0ztXzhRWU
 4Yx3FyG1nVIYpO4FjM7JLQN9pXXkRTLWjmt2Mg082oINMrQAeXq1Xw5NZmCb4Jcf
 egitKCQP6K0GxLhXFYzrgSjNNnSCa98tN2CdqK572pTutG6P3rwde7P/Xk2CaqDJ
 zdGqU5PBRK/3vLfqTqOuqAhvX4ZGypjeMbtp53vE/7R518xzzpBz/skDw==
X-ME-Sender: <xms:hiizYvZjAvwTXt8cZw40p8h-M-FGRiaX6dGNymc8HSxtKVE3EIYwfg>
 <xme:hiizYuavkTWQDAWeHyU_Zk6tx0018JDK_6X5qOTqWDBX337ozrsujrd-51RSBFyme
 7kIEdOBUVve2Y375sg>
X-ME-Received: <xmr:hiizYh_heEaH1OOGD9I43XojNVhzEcc0j9gY-64CqHV3CtYfInMBCsOCXUcrI1xXnGRxMnR7g1Rj8wcFmI7sc2NyXnDJ4x48zusvAJU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hiizYlogMUsx1LUvf04gRfec_sQOLbXkeIXwwE8sXmkpR8ZWBpV70A>
 <xmx:hiizYqpmN0KtrTMAccarFuwiXc55s5gEsDy_KIQRpmqHdSLi05c6Gg>
 <xmx:hiizYrQOcokqsAifHBm2yoFAfnjdiGmRSRflNTKZN8K8EMqRFvz9aw>
 <xmx:hiizYjm21pJwWPTsR51rE2ukMybRkHSpvv7sKqqNUEnmmkOa1XT2Lg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 48/68] drm/vc4: txp: Remove vc4_dev txp pointer
Date: Wed, 22 Jun 2022 16:31:49 +0200
Message-Id: <20220622143209.600298-49-maxime@cerno.tech>
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
index 949db41c50fb..0e868aebc25f 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -468,7 +468,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_crtc *vc4_crtc;
 	struct vc4_txp *txp;
 	struct drm_crtc *crtc;
@@ -522,7 +521,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	dev_set_drvdata(dev, txp);
-	vc4->txp = txp;
 
 	vc4_debugfs_add_regset32(drm, "txp_regs", &txp->regset);
 
@@ -532,13 +530,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
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

