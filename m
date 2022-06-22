Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627D554D34
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ADD113362;
	Wed, 22 Jun 2022 14:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E69F113361
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3211732009A4;
 Wed, 22 Jun 2022 10:33:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908421; x=1655994821; bh=NB
 ZZWA00DIKwbHD6WMsHk+WHyisFYjRbDWYsNNjsmYc=; b=RTFOPa/1/+rz91fb7Q
 7SIV85r+1fDVYX5QvUtH8I8O/nOvjZVPV3QL7ZqC4ZsAobpNfruqOKGQuvPUnK/P
 GIKuDlyzrx2DNbbftihZcc1tqgv44qbRPUG64waRVPbxIxG1+y97tn4W6dULHgCJ
 6uAfY3IzZ6JT5NXzKEnyudt8o2tsUtsMvh8AkfPOWdXN2o8tDxeTqgkhghUCDWtf
 nDFsu9iqYbSbSjwMP03Z7lqT26X9jLn7byj6XDDwtNDDLnID2QRi/k7b9lr26jBe
 lM/1Y6k06821639lafHK3RGL8RBesy1juDCHngoDMhbhWetbyB6lwsr9cB8CPK1v
 RWcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908421; x=1655994821; bh=NBZZWA00DIKwb
 HD6WMsHk+WHyisFYjRbDWYsNNjsmYc=; b=icxPLzEzULFeUCkCt4WcFJkhMRCd4
 A6ZdbXM55uHjxcWtmEdpiZFTcKp+o225qm/c53fgXgfSTUaOpYsKpmkVyLnNoBx8
 IRxmDR5HBuXnR+4Nyvn5JYtigeJz3D7bm96h+bvm84OC2NMcCBEa4nnii/hkkWPh
 wc56GfljncnSkXmFOfQjktFo+LLMoalkuFc3rFIEO62wqnC61Lrn8TFgXP0g3sVb
 v+SPJt8MQy7Ft+cR3usUJKl+Ue8kY5DpXBRkHPE2Pa1kxm+ZwIdDxExxcOYSVNrK
 LgnEw/uvBRHwoD08sPOjRj8zDCTPB5GF6fPktD1iLOgPJi+WmfdLeQH0A==
X-ME-Sender: <xms:RSizYqGRp0o-nL4FMXIw8XITTyQsS3eRsY_GP0GZ20dTlCZS1-LADg>
 <xme:RSizYrXDkXyRyXcRehl1ApCmI8KczdUtLEOipca7DZd3BFmiL_XDVQhxSu1UJ9xza
 xNd_15urusbOoc_sTs>
X-ME-Received: <xmr:RSizYkJKIVjj9A0v_bAbDOEZJyNSULf747Z9Silw4rYY4SFwQIXdtgAz8FHGefEGsVE7H5y4kLkgsAadfRij6UFcvTJvMHtG-yUHXLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RSizYkFWn2SDsQjOUPooCjdxUdgFRcy9GS5jvMUr5jActd_7NW8uaQ>
 <xmx:RSizYgXkhR35eHBmE9mA3eRRE8SSFPpQ_SWU4OZKnOrjsxrdTMQNKA>
 <xmx:RSizYnMwYehsmVirD-yKpL2vAGaZkNKPALHV0_4JuCvBkzrYcHyRxg>
 <xmx:RSizYqfDY8gx_Zz05DQDMX7p7J0oR7mN2z2oq32EIMoFUApCRW_hoA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 28/68] drm/vc4: dpi: Switch to DRM-managed encoder
 initialization
Date: Wed, 22 Jun 2022 16:31:29 +0200
Message-Id: <20220622143209.600298-29-maxime@cerno.tech>
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

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 4e24dbad77f2..233bc5d3b02f 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -296,35 +296,28 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
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

