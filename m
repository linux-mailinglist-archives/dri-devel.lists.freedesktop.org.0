Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AC854622F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B13311B267;
	Fri, 10 Jun 2022 09:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0680111B24E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F7DE5C01B5;
 Fri, 10 Jun 2022 05:30:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853404; x=1654939804; bh=1+
 sliJFZNu3SuOKgrh1R4J3cRr7ooqaay9fcMSx6iPs=; b=DIDE1+MZN2dxD7BdFw
 FTiAF/kUe2yS7GE1qVU7EP2um7s2/R5kMrmskqQHS6dHHqAIr72oQYs0OaoSWQbu
 D1bTlH/wvL2qiNzbJqo8+5Oin2OXq7bU5i5LsI3RcudtgQjoFwWoCDK+tYAzAkIm
 GCMc0WqOIVBIvaUc2ObFNxd5fkQrxpX/vsbY53VKVS0LhUpeNUPQsPfYN9OaHMeF
 oNr1VeIiXPb1mHN1yiTfqz1Hu/BIKWmUAA251fC5489wx177h35d57ulRPhHr1Ag
 0/fkzYOlkAGUA+sAJ/X9wMVjvVKx7iTM/cGcZhI6Drt27Omar0QEpX+7dQXlQHm/
 H1Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853404; x=1654939804; bh=1+sliJFZNu3Su
 OKgrh1R4J3cRr7ooqaay9fcMSx6iPs=; b=ieMuB8JeEV15SlE1OeeGTobwe5M0V
 kjaz6DwyhNkTRv0JoDNB5GAB3AajqsdXJe/BZyUlqOSUgVA0s9rQpBFxSvGzKNUv
 6yS1Psunu8xHnFkbkTVg5t2CKn4r18wjr9UO1Htm8DK083J9TCRFHakK34tEhCd+
 ky1ltpoRTW4jmi9XwNB3nG1L3mFiUCtSf3J24UPEI2gyIiGjc+LGbOuBB6KdvBe8
 0DSycCg0GbgaAtnAwq0Bb+5XZnb5FnvO6LbrV1w7k/M3oA06GVkXaqb7phlXRM2W
 FLtPxvHRZD3NwPsxgkcuGo6c8pVZzCKR8JDMZE/oxpuAfPQHSbgi+rZWg==
X-ME-Sender: <xms:HA-jYsc5PxgSIp1g78_cjDcQ18IV-OL1oWyiORLAS8PjEN1RENjxFQ>
 <xme:HA-jYuN_Pj4LAYExuW186cBjeMlVB4ENs8RsfhFWSOBs9mX7OVcbZBkQsi2CnfINY
 AojxY_URvc_kCKf_zA>
X-ME-Received: <xmr:HA-jYti9Jl6-__-TCnV__ZdvOABqwQvCkMfRTKRJ-4YemQsqnwaCcQTnV1wBh_dnevVutOuiI4NhqX6LUZ99Eln8LRbRNctm1zYeayk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HA-jYh9REn1lsUbSlwt9xdKfrgzShhiQCTtGSFuyWnqP9CqeKIePMg>
 <xmx:HA-jYosohpwLT9aTOlbblC_oMzkPSVd9GDuHV1dE2DEP6yDMYWyefg>
 <xmx:HA-jYoHBlpjBrYuVicFVXN0q1IV4aNBE9dnHn3U6gvooCndbnp1uEw>
 <xmx:HA-jYqJF7B6uuZz53sEFZJQgZ_Ex8siW4kEizWumbPxLSNv-ap-MYQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 20/64] drm/vc4: dpi: Remove vc4_dev dpi pointer
Date: Fri, 10 Jun 2022 11:28:40 +0200
Message-Id: <20220610092924.754942-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
index fff3772be2d4..846f3cda179a 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -79,7 +79,6 @@ struct vc4_dev {
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
-	struct vc4_dpi *dpi;
 	struct vc4_vec *vec;
 	struct vc4_txp *txp;
 
-- 
2.36.1

