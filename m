Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DCA3F1B0D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7356E971;
	Thu, 19 Aug 2021 13:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE526E971
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:59:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D65B32B00560;
 Thu, 19 Aug 2021 09:59:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 19 Aug 2021 09:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=AjzD4NCR+RXsI
 9pn023+m6EFCbk81Gsf49j9QMb7lOc=; b=hFQRMhokJd5G9qjRa/TVC3PugbXW9
 1oorXisFUfu/dgxzgqDFZmY9SM0qipsWHC25ojun2PXStGfO+PxyvEJX0yCKVzjy
 xvCNOXK08KRsMR/s3ZsjIXfeWBGEETK19YYtCXFQIOGyEosgdxzM/3TOokiniv68
 RfZpFCMBsJIFHVkNEQz7OPC5ucqwIT9WKuIOBew7JspaVf+2WAAy6sAgv2lOhbyh
 v88VvYO072eyL+VDvZJx79mZcsmQp6Bjxkn+DYqXhkqUOC4jahlnj/MuuNlfvp+L
 tsEPoczh99lc+JJ+K6q9fpSmQkcJq+AoPfyaGDFptzkZcL3+dEX02d1RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=AjzD4NCR+RXsI9pn023+m6EFCbk81Gsf49j9QMb7lOc=; b=WdiLVyPK
 L4XgKVqPfEcW/HfDs5NIEF2nVeW14IiwkN53j1wUJEe2okp9LF/ft3DOJjN285To
 61egtdia/vgAHDhMFpHeSbN8UmFf+dI6CdFCOwLCZIymiygh6MPnIXdQb12aHtU9
 vXEOihC47rTAsVUOGKW7Cscdr5p0J7nbVxlBYGuUzyiIG3lz7IglO+Eu1LT/p9VW
 FChl48+EXc7BCErrg835yGY/qoWGSSKYQiL/2SbrukupOCq5IyJVYhGP5RIBd4bG
 N9ogtTXB56JlCv5LfatTp9c4yBCy3uFRyMmYbTqChKU6mLCqBXFYO2qo2s9h04GI
 1SEBHxghTGq1pA==
X-ME-Sender: <xms:z2MeYexkFqZAwPPK0H8KTeZDxAhJbEZGm7JOvawrx6AOU1xi9lldhA>
 <xme:z2MeYaQcu88m1aMT-XsH3f3ZHrsCgNG46NtfihKEpTn9JehdZfZm4YuffCPqS4zRl
 K--dcIylAFw9-nIxr8>
X-ME-Received: <xmr:z2MeYQXi9iRQxiDOZvQvEepAr7Nw3tkBclZWUJctB_cWa9XRh6ZRapDEhRMBX5SuK6BbE747nre1TLA9wCmMleC-0VfeBj9TrIJR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:z2MeYUgmroPdHG4rtBS1JT6FlxA5R7hsXMyl4VcrY_6pzTU1Kgwedg>
 <xmx:z2MeYQDBLn44G1u3RrOer2fwp0CysaMcc2YWySCE_a1Aun_prRA0tw>
 <xmx:z2MeYVLJNCjw6wV3CRTdzmZr_j7-UVfZcliaBhUc9TGoT8UEoQhVWg>
 <xmx:0WMeYazMwsli4XAQqVpyzbCDeSnGoFHcbY8JJ9VQ0mGPvbeHkJSt6lVrWuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 09:59:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 2/6] drm/vc4: hdmi: Make sure the controller is powered up
 during bind
Date: Thu, 19 Aug 2021 15:59:27 +0200
Message-Id: <20210819135931.895976-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819135931.895976-1-maxime@cerno.tech>
References: <20210819135931.895976-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the bind hook, we actually need the device to have the HSM clock
running during the final part of the display initialisation where we
reset the controller and initialise the CEC component.

Failing to do so will result in a complete, silent, hang of the CPU.

Fixes: 411efa18e4b0 ("drm/vc4: hdmi: Move the HSM clock enable to runtime_pm")
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 602203b2d8e1..5dde3e5c1d7f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2191,6 +2191,18 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
+	/*
+	 * We need to have the device powered up at this point to call
+	 * our reset hook and for the CEC init.
+	 */
+	ret = vc4_hdmi_runtime_resume(dev);
+	if (ret)
+		goto err_put_ddc;
+
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
@@ -2202,8 +2214,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	}
 
-	pm_runtime_enable(dev);
-
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
@@ -2223,6 +2233,8 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			     vc4_hdmi_debugfs_regs,
 			     vc4_hdmi);
 
+	pm_runtime_put_sync(dev);
+
 	return 0;
 
 err_free_cec:
@@ -2231,6 +2243,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
 err_destroy_encoder:
 	drm_encoder_cleanup(encoder);
+	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 err_put_ddc:
 	put_device(&vc4_hdmi->ddc->dev);
-- 
2.31.1

