Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F06560010
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD4114A613;
	Wed, 29 Jun 2022 12:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B30314A5F9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:43 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id F01643200922;
 Wed, 29 Jun 2022 08:36:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 Jun 2022 08:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506201; x=1656592601; bh=8y
 jYT//3VMGCegxt+4Vn9GTldRWlnvVLa8sWT76UytE=; b=KVadXAipoY70qg1abw
 8gJ8FQHx1vtPA5mD8+nkZwaGNWIRFRaPYs1z6Nei1qvFKMsR1Y0mxyHkZ2wl71nc
 X0gclQS8T9h7WVtskQxehDTM+nHT9jy13iepSCUCI62kCLDEGbfr24xD+s8j+TRv
 rPEWbYJG89wN0XoEZjMJhz1ovQSanGi5K3+zW8mPgKbqbWsFYyCxalxO26ohTFrT
 kWR5pdW8E9KjIk41MN0cSZWjxg4prZqKIha3eFEAi98l3jkWY1q/WB14ZWUcYqjV
 0eW6DHqx3k+1bO2qRicYHi3XHmQmhB5cWdFG1JhwikgZ/qbONpfwWZGkugYfxSly
 v+Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506201; x=1656592601; bh=8yjYT//3VMGCe
 gxt+4Vn9GTldRWlnvVLa8sWT76UytE=; b=OT/oFckWJEk/t0VF4HL3NVKFMEyS/
 D1HE74MhQlL671WLGXVkVrjwZvOsh7G9422YDtfCYPgtA8Z6gxJrZ5sAlVE96DQI
 6nje2k1CwWeukxhv05Kh6lPzjhQ0dL+yizv/FuBprXYMt94PzTuKlQjs/3XnwUzu
 6xyda6jTKOrDjBFlMUQBo1bdJuXuJ6HB9xK+aTM6ewT/zkBoSCQbTdQAVtQAWqQA
 /8lpG1/9r2oaeDUK0wkDujH5gdYRhg3b4ALXdpxa1Ysz65byYeyeMicTa+BaBwtG
 z7X5iqALHj1ww/Ik2a9+WC5Cw/GNP83FV8qd7RBttHS0tA7nxGugExtWw==
X-ME-Sender: <xms:WUe8YnBeUrFdY9COqp_FG3gWwJ5wMQPEeBor9_sVSXuRkvg9diu5jw>
 <xme:WUe8YtjxIPgkIn3u82sbQ4TtkB6DeovFi93twnv6zAR2J5KmN0VJe9DQ-cDEypa4b
 9FqesS3WC5I1whigP0>
X-ME-Received: <xmr:WUe8Yilhz3kap0lC_Xl8tuiWSXH96XswEhjcejG2ayw36UqMkKPnVd6pq05vx8RbNrabBzUDX1Fm0Ogx3a323loX95-cVPVrzeZ_r8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WUe8YpygRpOQn5dCvMEA6pXAp7V7UsztXmCFGJYZJJ-sFJBRqhYv0A>
 <xmx:WUe8YsROcr3MMyziN_l-Rmkvg85OBIoYmkqpf2VdTRDCAr6YLXVcAQ>
 <xmx:WUe8YsY9BnJb58HXPxlC7ZVdPPOmPM70x6knX_s4BmJPOgLGhHVc3A>
 <xmx:WUe8YhLvus57hSVimNMesuPUINP4j0TbOyPVfbWCSFSCDXc7LQcUNg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 29/71] drm/vc4: dpi: Switch to DRM-managed encoder
 initialization
Date: Wed, 29 Jun 2022 14:34:28 +0200
Message-Id: <20220629123510.1915022-30-maxime@cerno.tech>
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
index 9c5629e9e446..6e0d8da4ae1e 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -315,35 +315,28 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
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

