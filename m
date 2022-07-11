Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08E570937
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652C990354;
	Mon, 11 Jul 2022 17:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E3D90325
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E89185C010A;
 Mon, 11 Jul 2022 13:41:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 13:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561274; x=1657647674; bh=3y
 8cQNpi869mLnyLx311rfT1TwxIzJOtcu51Uwda8F4=; b=ssYRGrtGRXrmbAKr2f
 aIt73GLg3CcnwcwuTckAwMwe3Pk2AQzgfK6g2PnbwovNijnEbhgk7baFylOJiqdV
 jKfhvlrqWYvr3YLpT2r0IVKtdP5VdoFe27fKS8G7REapjYMC7K0nNILb09s0I/nn
 szHbGG4i3/DbNk658BSVOmPqcye4reJgdOh5WRCckc0r0xRLRvig7SqjaZCvVMyQ
 yKcKoeOb7OX8Obn/E0D9FMrSZ0ewYYH0mF5/IS9bAuRiF1N0QwEMP9ndMDSBSeQW
 VZdqvdW+O7dJSQfKB0voBIA4/Hyof2zA7EFuzGt7qHFWPtx4Ge4n5wY9CCYDjWKa
 jcwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561274; x=1657647674; bh=3y8cQNpi869mL
 nyLx311rfT1TwxIzJOtcu51Uwda8F4=; b=rhoTyo09eeoZYILX78S9G2FaqYhV2
 ust3mzXgguVNlrwPNzuVXEYTUkvbNUHLjvITQjfcUFXmnozn2mgMpXC5l9aCwEk0
 SqrftJ1ji07JVCFMM7MgYz6NPzy4+agjnFF+Efmv8yXG7+E5PCPeEUHWEYxIEkrP
 +u3+T5jvnHXDG+43NdtxqSQFhy1HkBTy/zWvu9YZCGUq1GdCuLariqQmfZQZcaBG
 +bqA008vo4j8HmSEIybkomOxVVYyW+gqhcLHDAOg1ELAyElCoAahmLPDD7BCHB0/
 sPTHnL81mk6S0eZ6471ZvF5oNgY+9qXVDfQOyf+UqciN4opyFaZBZukOQ==
X-ME-Sender: <xms:umDMYsY4ph6TnwGVTzEnXN8DWXbipbnWsfFjKxYvxuTDOvdvlh48BQ>
 <xme:umDMYnYsRrYwP5rVhuIpV898YARrp-DG1kO2x4h35g3rHCrQ6ikgsyajguP26oIEC
 IP9VTGzoQFZ9VWn0Fc>
X-ME-Received: <xmr:umDMYm9K--_J_OFYFNm2eEWyW2kpnx5jgas0cUmDY_zX_mFpwMTk-uTU6fgYZW2X-5EvLUncjARNxVENiZLfTr3tNOe5BM8E6oWMm9U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:umDMYmrXFRhmqOidr5iKJRjXqCQ6Xpd4Dy5VGQtItoSGGZWNIZaooQ>
 <xmx:umDMYnq40Z6s_ftJ5h1pSIlGhC0cZ72TEgc-qcrpEw5SouFPBZ3UjQ>
 <xmx:umDMYkTEZ2ht41RMgVlIRDSuxooNWiizIo0_rO1YkPDaV53KLYSi5w>
 <xmx:umDMYone3YP4TMcllCaCALyjLMoY2OKGHKRccFdrHD7JOwJE-B41PQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 54/69] drm/vc4: vec: Remove vc4_dev vec pointer
Date: Mon, 11 Jul 2022 19:39:24 +0200
Message-Id: <20220711173939.1132294-55-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_vec.c | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 0eb5f8a669fe..b7ccdc2b09de 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -84,7 +84,6 @@ struct vc4_dev {
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
-	struct vc4_vec *vec;
 
 	struct vc4_hang_state *hang_state;
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 11fc3d6f66b1..99fe40c8cf81 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -532,7 +532,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_vec *vec;
 	struct vc4_vec_encoder *vc4_vec_encoder;
 	int ret;
@@ -585,8 +584,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, vec);
 
-	vc4->vec = vec;
-
 	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
 
 	return 0;
@@ -601,15 +598,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 static void vc4_vec_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
 	vc4_vec_connector_destroy(vec->connector);
 	drm_encoder_cleanup(vec->encoder);
 	pm_runtime_disable(dev);
-
-	vc4->vec = NULL;
 }
 
 static const struct component_ops vc4_vec_ops = {
-- 
2.36.1

