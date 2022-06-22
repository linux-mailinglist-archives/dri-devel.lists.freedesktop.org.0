Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964CF554D2E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF2F112D96;
	Wed, 22 Jun 2022 14:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB30A1132E0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 63D3C3200944;
 Wed, 22 Jun 2022 10:33:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 10:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908402; x=1655994802; bh=fQ
 faNoufPrNtNO8+hwF53YLxIXq59m/sIzbKTmW/03M=; b=YJTHAnXqDgymyfniDP
 FExlpRUT1zV9mM1PXyzz/KGREK4V+Za3+hvclA6+x7GjDQwGH36nAqmxU9U07GTf
 5p/hPV1KF/4CnIZRYNatVe9/dfjSOC6v+TiSiEjK8UIvVuFUDTVYgA/3vBgPvWQv
 TMyE4u4fkBmJqzoIWgDzTdoFynsLnkERfnt4mJL5AMIHj5sGPxv/uG+pmFJHWghE
 1HXSdqcUlJhpwxzC7pzzaBPMPqAVQ+hyayu0J6iVhCKZiJqUHuWmD+LPBMrr3bPM
 h0T40L7lJLnPLFjudyLmCdDnVmklcBEP4ddCMVzQjiREC73DGrEGoKsmvEGCjUcw
 /4Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908402; x=1655994802; bh=fQfaNoufPrNtN
 O8+hwF53YLxIXq59m/sIzbKTmW/03M=; b=dPwb5zDqFKmj98SfkY1gts0M5r2Fa
 h607RLIVFtpEqmnbkpr81Kg39/hwxAyRltF2ufnIBa5LzXs70V6FidTCotSb4l3Y
 Ow/8vo+2BvVYvz7uRvSjmeTeylSB/TzO+DVl0stFSsUQI1epxV6SUPOdlBBcd2ZB
 K17ZbcYkdXwkxRQbO3l1VYgNzCoyu0PDZWnuktx6Aja01LQiXsIwecezYv0x2FBz
 XGd5XTKUiVHWhODdf0YXyfvQ4WpbYrHKxw96EJffwA+BaJpJGjbSyDPRhLKjwkmG
 jOiUykDpfOU7P/UZZDFX+i6YL88iRgTN1vGMrh4vF6SdfjDHm35oKbj4g==
X-ME-Sender: <xms:MiizYnmRk8Su6GnXFZpn3qwgsEvgZHkqe9F_oaTE1RibzjCXbXCLgw>
 <xme:MiizYq3CCZnP6UtOfWArui4JzYCVZl6JeStDRy535GsH5dmMSqS36e8u4nZ2LJdCE
 03QdChabcWSYWvVsUo>
X-ME-Received: <xmr:MiizYtqp62I7QNV9ROFcPuedANY8U41xraZG8SXOtAjV-1jSv_fYiySvgRNVCKcmynw9tst7kg_2oKpStiK5O76pck__UeneChAXDnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MiizYvmZzL5McA-S7UTkfYVLlylL380eswiQ99YqeziIVa_MIMrONQ>
 <xmx:MiizYl0JQyvYjnsBEPW0BJFfH6JJzwOooQAGyNRo6E5Sj2eOkkUDVA>
 <xmx:MiizYusml26ikEBDX34gTz47ihuwR8p3MYw-oSQzvBVEgwPPK09syA>
 <xmx:MiizYt85U-I-aUoB2swzvqfJBjjOJHKT6WiH1nNdhjFEId975j3DwA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 22/68] drm/vc4: dpi: Remove vc4_dev dpi pointer
Date: Wed, 22 Jun 2022 16:31:23 +0200
Message-Id: <20220622143209.600298-23-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no user for that pointer so let's just get rid of it.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 7 -------
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c180eb60bee8..f2b46c524919 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -249,7 +249,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dpi *dpi;
 	struct vc4_dpi_encoder *vc4_dpi_encoder;
 	int ret;
@@ -308,8 +307,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, dpi);
 
-	vc4->dpi = dpi;
-
 	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
 
 	return 0;
@@ -323,8 +320,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 static void vc4_dpi_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
 	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
@@ -332,8 +327,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 	drm_encoder_cleanup(dpi->encoder);
 
 	clk_disable_unprepare(dpi->core_clock);
-
-	vc4->dpi = NULL;
 }
 
 static const struct component_ops vc4_dpi_ops = {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6afa873f0def..db51dd3e20b8 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -83,7 +83,6 @@ struct vc4_dev {
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
-	struct vc4_dpi *dpi;
 	struct vc4_vec *vec;
 	struct vc4_txp *txp;
 
-- 
2.36.1

