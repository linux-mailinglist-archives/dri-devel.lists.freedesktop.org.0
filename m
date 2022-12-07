Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC056457CA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 11:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44C510E394;
	Wed,  7 Dec 2022 10:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712FD10E38F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 10:27:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CBA4C5C00EF;
 Wed,  7 Dec 2022 05:27:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 07 Dec 2022 05:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670408840; x=
 1670495240; bh=vNQF1/ogN8Vz4W9wc5Vdm2dmWdFNZe2M9hI8eB4AV7k=; b=c
 nzeVVUrYhQk13y3TM3HBfdFuSpIPRHA1368XMXBWBmUPMRDh+YI9qanbC25gMnqY
 WE5Hw2ChpviqJZdaiJZD/NvKoWj2b46WmyBfWG4OKr6T3ZC4On1o9LUFjotot//F
 R1k5MUSxfHFXemNl80LSywaoY+ZtRzz1D+LxhT/iS8LQE+t3WaT25pEri2aVfuZt
 CiCgY5w/G6bnCILjhvL125JtfiZ4aNv34myphBIKtKSLvgy6iErXINu01fVSk5Jh
 xBP48i378Pv9C1s/lPxUWdu2Dyi9OAJxOd77SSDq4lPqVKPgwBBeipiLg57f5fR/
 PdoGyyFssfDaK7nFRItuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670408840; x=
 1670495240; bh=vNQF1/ogN8Vz4W9wc5Vdm2dmWdFNZe2M9hI8eB4AV7k=; b=E
 FufSSqgZoWX6Pd+/luN134DPgN3z/qNfQnCWOQI2lvYqrIjqUv+8TT3YALtyWKSf
 jElqh+U/1V9DS2K50CnmSDOqBHugZfhdRk5NilVjCaFrV1m/7H2Rfo3St3Qn4gNX
 mCOCTDevOaTnOvr7PdUdBGnA06lV8vh+Emz9Uw1ph714wlG614UeNatMWWkrYnrU
 2aNilyoJUX1e8ydEHS27/MOlhTxFP+mTmTe/xK8x8uHsy10Sn44sfv/7DRhDHLS5
 WA01iGYlQN6ePVgPmU6/0mYlC9/tFc/IkStGPKOgpUI/QKixt8H2ag5K1ABeSfis
 oey9a00iy/U1rWmj//JfA==
X-ME-Sender: <xms:iGqQY86QKkC4vzJR9c1qo_W4fU8Q6BrpSZSMl7EMIJ_DJMtc_JS9pA>
 <xme:iGqQY97XFvrldFRG5qmg4BpBdnk6en-QDxuG8xJai3M2b3mRIkm6okCcVVvnRUG9t
 B0CGBmQbmNvhla5VRk>
X-ME-Received: <xmr:iGqQY7e1s336P2qcKDtx5yNnUgq_tM-bfh5nuQ1g7RNl6NyOqQ7YgIR5VsPHrTOIw5XBg5zswJKVh6D6OPz2qyZrAXBANcrtUKayD8RyTsFl1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iGqQYxI1XnaMSoKja3BZ9kAuIz0MKRBPVDpoMEhimgq8fAIef017yQ>
 <xmx:iGqQYwKJps7e477GDjUnfLb_5_VRdU0m5qV39OVUj9ZTH4UFhd0XFQ>
 <xmx:iGqQYyy-vibfST-b1jh-jFi5_l36siOB0QpdIM--luXuuEc2ZhGkfQ>
 <xmx:iGqQYygwwLGQAvacyHFt7EtZ77BiOs5vhw5VRfHKL3mkVibmbaJKPA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 05:27:20 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 11:22:46 +0100
Subject: [PATCH 3/6] drm/vc4: dsi: Remove splitting the bridge chain from the
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-dsi-bridge-v1-3-8f68ee0b0adb@cerno.tech>
References: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
In-Reply-To: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=3801; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=DYzIKgF8O4vqIwwivxAS+tyuqAfWzIHA7ueve8x9kVE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTMkuXJv61PHzMoUbqyYyZDfeSDkSGJ3/U9bE5sHbTI69d
 ueGbO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRTfEM/z3iOP1vvvabl1Bd65nJkz
 0nTV9AdpdsnbeP2HenPcxdGxkZHhzR/jtDr1a5/azIqcd7FpQuOfKo7IP9LeO+ZwoqTGs3cwMA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Splitting the bridge chain fails for atomic bridges as the
framework can't add the relevant state in
drm_atomic_add_encoder_bridges.
The chain was split because we needed to power up before
calling pre_enable, but that is now done in mode_set, and will
move into the framework.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 47 -------------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 607ebe368409..53d73a6590b7 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -557,7 +557,6 @@ struct vc4_dsi {
 	struct platform_device *pdev;
 
 	struct drm_bridge *out_bridge;
-	struct list_head bridge_chain;
 
 	void __iomem *regs;
 
@@ -794,23 +793,9 @@ static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
 {
 	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	struct device *dev = &dsi->pdev->dev;
-	struct drm_bridge *iter;
-
-	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->disable)
-			iter->funcs->disable(iter);
-
-		if (iter == dsi->out_bridge)
-			break;
-	}
 
 	vc4_dsi_ulps(dsi, true);
 
-	list_for_each_entry_from(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->post_disable)
-			iter->funcs->post_disable(iter);
-	}
-
 	clk_disable_unprepare(dsi->pll_phy_clock);
 	clk_disable_unprepare(dsi->escape_clock);
 	clk_disable_unprepare(dsi->pixel_clock);
@@ -1111,12 +1096,6 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 {
 	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	bool debug_dump_regs = false;
-	struct drm_bridge *iter;
-
-	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->pre_enable)
-			iter->funcs->pre_enable(iter);
-	}
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		DSI_PORT_WRITE(DISP0_CTRL,
@@ -1133,11 +1112,6 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 			       DSI_DISP0_ENABLE);
 	}
 
-	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->enable)
-			iter->funcs->enable(iter);
-	}
-
 	if (debug_dump_regs) {
 		struct drm_printer p = drm_info_printer(&dsi->pdev->dev);
 		dev_info(&dsi->pdev->dev, "DSI regs after:\n");
@@ -1625,7 +1599,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	dsi->variant = of_device_get_match_data(dev);
 
-	INIT_LIST_HEAD(&dsi->bridge_chain);
 	dsi->encoder.type = dsi->variant->port ?
 		VC4_ENCODER_TYPE_DSI1 : VC4_ENCODER_TYPE_DSI0;
 
@@ -1762,32 +1735,12 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	ret = drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
 	if (ret)
 		return ret;
-	/* Disable the atomic helper calls into the bridge.  We
-	 * manually call the bridge pre_enable / enable / etc. calls
-	 * from our driver, since we need to sequence them within the
-	 * encoder's enable/disable paths.
-	 */
-	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 
 	return 0;
 }
 
-static void vc4_dsi_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	struct vc4_dsi *dsi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dsi->encoder.base;
-
-	/*
-	 * Restore the bridge_chain so the bridge detach procedure can happen
-	 * normally.
-	 */
-	list_splice_init(&dsi->bridge_chain, &encoder->bridge_chain);
-}
-
 static const struct component_ops vc4_dsi_ops = {
 	.bind   = vc4_dsi_bind,
-	.unbind = vc4_dsi_unbind,
 };
 
 static int vc4_dsi_dev_probe(struct platform_device *pdev)

-- 
2.38.1
