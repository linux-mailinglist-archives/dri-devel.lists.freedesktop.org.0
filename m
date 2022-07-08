Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32856B6A2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6636C113876;
	Fri,  8 Jul 2022 09:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3C3113876
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2EAE432009AE;
 Fri,  8 Jul 2022 05:58:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274316; x=1657360716; bh=4u
 DgSdHpp+qURN8db9X4iLS+B4ku09Ksntp7OG8mbY4=; b=UhCPqMhM1/UcYQ32BK
 hR+4bY+tbj7yHSYcshXEc14Y3pFrm4Ld24vJH9Jq+PanOJhd15AELM2XWcloBNYN
 AU8RefoZX9vAysAWrXmGW6GnmAAPT2g59aQvXKLxTDfWwaGXy/3/lJ6AYP5abjJS
 Buqb5oP3ZqInU/W0ME4l8HmyzwNzVrKi5e+d2JuNyreJDnT43j1S4BUBDwaVc8kI
 C4drAkLDrg3+OTkMFvWsaFSF2LB9EwbFJru7o7FMJ1dhWl8Jc3CTUm/EVqgBt2/0
 1J03frW597FqEKPDu1DmQpHW6bKGKb/3bqMT9I+v9DXnqTz1UPtcAdlYKjJ0WMMF
 Gxgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274316; x=1657360716; bh=4uDgSdHpp+qUR
 N8db9X4iLS+B4ku09Ksntp7OG8mbY4=; b=G40FWO1cnY5sKrHvLXw9ppm8xgjsM
 gFHU+lr8zGe85vtkHfc7NVCl5vDND3kphBfpRrX+pP7BRUscs3HL4MtcEkiHMmKQ
 mjpGysUVwsdzakg1L/lLh51wH0pSQi1697OIBdFtEDhJySW2k+LR9cfhyjH0RaUI
 xHPmBj44pgdydUE75JEZpyTeO6BF1l8z+Gu6ag3NrXWavdUZIF13/oEfVYUAFJYn
 L3dmakigfuHT7kZGRdxcZNUhYgCgMv7DwJbvpPWrp3bB6L7BJK+gMZ+Zx4GAplrr
 sYefE3Df0KPGdGwJCZErhc5azupeh3b45Q00fAHAuLJv38hZ6isFz/i4Q==
X-ME-Sender: <xms:zP_HYk4g21WBByglKslvLO4vNG_2hufnpBAW-riJhcxk3FKVduocnQ>
 <xme:zP_HYl7xMCGeadGPQo1AvI3Tbg7C2YZYPu_DiekXxqgi6eqvQ1DDKQEUwTy3g455F
 Hy1fSa77Ubc5_tdHLE>
X-ME-Received: <xmr:zP_HYjeRuRhckF2eEzB9qjX2GqrLnbFg3KHm9j0JV90h5yfMwe3-8wbrnkySAR7DlgGQVmw8RhvRYnU1wKnrc9cNA7bKnEP1iNyIIRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zP_HYpKqERWNtMCgYyTg5mKz5hvd6QFkXaw0hVamjSuFP6ZrbO-f6g>
 <xmx:zP_HYoKQoO4qogW3QfFFZYrISpjfgxjYB-g4tid1zrKmI2fm3nvj5A>
 <xmx:zP_HYqzv8FDMB2foRHXWU2z8QV3oaUhHJR9PDTibt09q7uiGk78oAg>
 <xmx:zP_HYii3f5zGe8j4W44RU3iB8__hG4vmX2o7GRCdAdLQNwnPN_mv7w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 29/69] drm/vc4: dpi: Switch to DRM-managed encoder
 initialization
Date: Fri,  8 Jul 2022 11:56:27 +0200
Message-Id: <20220708095707.257937-30-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c4ea99f85e5b..ceb14aea6c05 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -316,35 +316,28 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
+	ret = drmm_encoder_init(drm, &dpi->encoder.base,
+				NULL,
+				DRM_MODE_ENCODER_DPI,
+				NULL);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
 	ret = vc4_dpi_init_bridge(dpi);
 	if (ret)
-		goto err_destroy_encoder;
+		return ret;
 
 	dev_set_drvdata(dev, dpi);
 
 	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
 
 	return 0;
-
-err_destroy_encoder:
-	drm_encoder_cleanup(&dpi->encoder.base);
-	return ret;
-}
-
-static void vc4_dpi_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	struct vc4_dpi *dpi = dev_get_drvdata(dev);
-
-	drm_encoder_cleanup(&dpi->encoder.base);
 }
 
 static const struct component_ops vc4_dpi_ops = {
 	.bind   = vc4_dpi_bind,
-	.unbind = vc4_dpi_unbind,
 };
 
 static int vc4_dpi_dev_probe(struct platform_device *pdev)
-- 
2.36.1

