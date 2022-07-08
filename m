Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134656B698
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B73B113858;
	Fri,  8 Jul 2022 09:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C00113852
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 459BB32009CB;
 Fri,  8 Jul 2022 05:58:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274298; x=1657360698; bh=Ld
 OHFOaSSYGiIKd3eFqRjSY6sOpsnClpy7sQKTPslFM=; b=o4pJbVzb1Xr4rmic3x
 1Zbtxb5aHydKy11bGFrMuIEdOSS3cBZvQArzpRsDqmR5sDjGIU143lOX/69q5JRu
 ARySM1UVYQlFyHcgbcL7l/fg2fk+G2bzXJFDi9DkQqtArIpFcGq7b0XypD3JqjUF
 Utk/YRn+AtpXAJDAQMsjooC5cia/j9dXxCQ2xzJyVniDIXX8MUPPtJysygZelAE0
 +VSdtOPY0NUAgxQtK+TED2rEEaW+k7Fjk873AGkj43TB6iPHvfOIje6rDmG5Ga8J
 oOD8Mj/4ZLRY7pMSG9Q4pXPwvKks0Z61UaiRDSNYVJCO8tkb4Oyaf0qxN13Z4dkK
 pM6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274298; x=1657360698; bh=LdOHFOaSSYGiI
 Kd3eFqRjSY6sOpsnClpy7sQKTPslFM=; b=PqynjcFwBuCy5lXB4WIONxpZujVoY
 JMsD7IkWvkKHmdNS+wkQWbD1iLnsrqKVCqNixtYRVgh+kh0Jf8RGh/8AOiROqf6E
 kzGQZ3VDZsa6XCv+nRJdgrSJjlWRD73tZVSf3fMsMO/nLmGKYPG1CP7dkzT9xGiW
 lVTMyYUiTI7DAvxCOH5Pb/W/RI2LhkxdmSGziINcoTPsWfrjjFdQy4kQYpKk7e6M
 dJuwsd1zASKf1hJ9gvIPkjrnBXuPS6WhWpXQhg1VBI9ecYp93PjH/6L0kG0U5i10
 BKT9wI+AjZH45w+3/1FabTxghpvXd9wXD2bG23VWLIOB5SyleF2+X4ZiA==
X-ME-Sender: <xms:uv_HYucNKVuyo_ONLd8IYCcyaoS59yUAFnA7LFpOg-corPSzOMlZ3g>
 <xme:uv_HYoOR4h3pEeiB4-z8Ywomg4CxR5tXMtBNvr00ewyTm2o8yW5cTDfQNwkZx0IU0
 JCIaugo37tFl5EFxf0>
X-ME-Received: <xmr:uv_HYvj-V_5NjJOzcmBwqcEfiqSAGn6KW8a1gGRS2yOOfhPoR6mxgx_CUZ-W-HmVfx6B5m7vtW7UKSLZOauvYgwPn1B3OBj_VWaG3Ws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uv_HYr_LDbwMQryDu_3e2465jaTZF3SfBr5PWT7hP1cX7PcZcri8Dg>
 <xmx:uv_HYqseRSm7OtOxr1CAvJHYCt4_5Agr8H2zOz_VxuFq5eDUmF3VcQ>
 <xmx:uv_HYiFNhrwT7yWJGKZpW2CHpcwtdEtdvlW5KCkA2LUSM3TvesZefg>
 <xmx:uv_HYsWgjodyciup94HJ4EaNPfOnNFIdCyV2Aa0s3BfU0h3uDdAZEQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 23/69] drm/vc4: dpi: Remove vc4_dev dpi pointer
Date: Fri,  8 Jul 2022 11:56:21 +0200
Message-Id: <20220708095707.257937-24-maxime@cerno.tech>
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

There's no user for that pointer so let's just get rid of it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 7 -------
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index ef5e3921062c..d3625dcb5dcb 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -269,7 +269,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dpi *dpi;
 	struct vc4_dpi_encoder *vc4_dpi_encoder;
 	int ret;
@@ -328,8 +327,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, dpi);
 
-	vc4->dpi = dpi;
-
 	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
 
 	return 0;
@@ -343,8 +340,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 static void vc4_dpi_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
 	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
@@ -352,8 +347,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 	drm_encoder_cleanup(dpi->encoder);
 
 	clk_disable_unprepare(dpi->core_clock);
-
-	vc4->dpi = NULL;
 }
 
 static const struct component_ops vc4_dpi_ops = {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 116e54fc1363..835d286c2802 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -84,7 +84,6 @@ struct vc4_dev {
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
-	struct vc4_dpi *dpi;
 	struct vc4_vec *vec;
 	struct vc4_txp *txp;
 
-- 
2.36.1

