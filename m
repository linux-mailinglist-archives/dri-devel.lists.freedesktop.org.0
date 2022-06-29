Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9959655FFF2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD16A14A4A2;
	Wed, 29 Jun 2022 12:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DAF14A066
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 378FC320094B;
 Wed, 29 Jun 2022 08:35:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506150; x=1656592550; bh=4h
 zyTwqknhF0RfDHnhqMfZRIQQJYp16IbLpzWA2/cs4=; b=BoRDjhskoWpOLktR01
 bJehsherIoVsYjbt+xdT81bTKTSbDDfnFbVDJt2CiJweBnrW+HxBxUIu3fM6HLiZ
 lez6T7fjfdaqXXRpp9+fdPedusgugT3t1I9AhLLKxfEkNV15s+uwutGImhaWwy8v
 XHTOwIcYl9FFeVlymDPTeftkzl5xUBBORx+w+yXeczIp3NWq7dTc4ijFCSxsTQ+t
 a8v3pCsNP1R8Dk6vfZhJrTiwv5+AmAplIX88cuy8RhUTyoPt1dkIIjoS2nwyFhVd
 Nnh9hvwYk1A9OSTsYGjime5itLXrt1FHjGwgUFwuGabPzK1Cm6fRtok4xFcYXf1z
 V+kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506150; x=1656592550; bh=4hzyTwqknhF0R
 fDHnhqMfZRIQQJYp16IbLpzWA2/cs4=; b=osVb5rtsjRzE8pehto23x0FUvhnRN
 8TV0C5HuTtB+w6WbOTl/5DZ+6LiVDTFonU2b3/RXOxQuLsoDAHnNyLGwV5Zf62c6
 5E/FcWNgGU+hkRwW4/ry9lf9DR+OV7TEQNQjkmfGjuD0cbSDnAgH/bwWhYBVaiWE
 TFyhfmfAknNdA07y28VM7ZWBvrWR3oL/w/3PI7bjvReVgQk3hvM03izKKvdhYd/X
 lRHCQD2u/Y1wXxfXDQC7QQuWbkU+dS3Ef14Wt3Iqt3P8X6LAHQqG/gpuNBYv/vmi
 ReE5cZtxGMFdbK2eXNA80BZ24MlteRECw3mYohK9ylr7Y09ZuPg5dwp1g==
X-ME-Sender: <xms:Jke8YjceUtGw2C1M0uq3DD5kbMdBZabpIQUwh6SK-taNk3oFvBbURw>
 <xme:Jke8YpNjxrunXeHVRxkG_jdBIher4_vfiKgjMkEc45NnoukSAJzUH90doFX1CYXtL
 py1QLaCNEPfBRLQRlk>
X-ME-Received: <xmr:Jke8YsjP0m28nK2j3JrB2SRfIzXlZL4gReJmAiHoZSr5hBwS4KKwukNsjel-9f2QA4z4FBZXo_SCXkMfaKZz1nXRFQaPdfxbgF-dgv0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Jke8Yk-Us2qdNsYkAuqIY4CL_5mlEz9wiIIO-3GKGhzIOEHRVvYYYg>
 <xmx:Jke8YvvjzDzu8rLFTmXCWSvMfi6AV70rMgy0N1EQ14BxrHBguU6YQw>
 <xmx:Jke8YjEwW07XrpnSaTPFCAYb78i6Ufu9kEqWkjTfqLAQyDcp-VRCjQ>
 <xmx:Jke8YlUEvwcm4zLfOcadyWk7DquWwyQ9yfXgK_S2a26oUmmcfpwE4g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 12/71] drm/vc4: drv: Call component_unbind_all()
Date: Wed, 29 Jun 2022 14:34:11 +0200
Message-Id: <20220629123510.1915022-13-maxime@cerno.tech>
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

While we were using the component framework to deal with all the DRM
subdevices, we were not calling component_unbind_all().

This leads to none of the subdevices freeing up their resources as part of
their unbind() or device managed hooks.

Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 14 ++++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 2b014b6332a6..072c65aa1d98 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -267,6 +267,13 @@ static void vc4_match_add_drivers(struct device *dev,
 	}
 }
 
+static void vc4_component_unbind_all(void *ptr)
+{
+	struct vc4_dev *vc4 = ptr;
+
+	component_unbind_all(vc4->dev, &vc4->base);
+}
+
 const struct of_device_id vc4_dma_range_matches[] = {
 	{ .compatible = "brcm,bcm2711-hvs" },
 	{ .compatible = "brcm,bcm2835-hvs" },
@@ -310,6 +317,7 @@ static int vc4_drm_bind(struct device *dev)
 	if (IS_ERR(vc4))
 		return PTR_ERR(vc4);
 	vc4->is_vc5 = is_vc5;
+	vc4->dev = dev;
 
 	drm = &vc4->base;
 	platform_set_drvdata(pdev, drm);
@@ -360,6 +368,10 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, vc4_component_unbind_all, vc4);
+	if (ret)
+		return ret;
+
 	ret = vc4_plane_create_additional_planes(drm);
 	if (ret)
 		goto unbind_all;
@@ -380,8 +392,6 @@ static int vc4_drm_bind(struct device *dev)
 	return 0;
 
 unbind_all:
-	component_unbind_all(dev, drm);
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 93fd55b9e99e..c48a73914200 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -75,6 +75,7 @@ struct vc4_perfmon {
 
 struct vc4_dev {
 	struct drm_device base;
+	struct device *dev;
 
 	bool is_vc5;
 
-- 
2.36.1

