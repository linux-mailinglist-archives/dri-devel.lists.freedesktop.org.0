Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933A5570941
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A51B90367;
	Mon, 11 Jul 2022 17:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FB690332
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:58 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C4E15C00B0;
 Mon, 11 Jul 2022 13:40:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561258; x=1657647658; bh=Is
 NbyoMpBX2rILQoNf1Zi/Q01kJT5D7YGgtw2Jj1kjg=; b=TzUleo6+qwYKuscvct
 EeJGqxW0AvmQvSTUVFCoEJ2wVabfD8Op56JJTyZkvI9/fucZRz9wUjNHVs/TXHPY
 mHXLQCYok++8yzUwKK3kiKOK1/HLOhXjUeDgdPUEctZ+2tQCU7g0uXV8TuTp/Pt2
 9daRBobItWRXVqNyWP0bB1zyeJOAjJ7uMyi1UUUjZmnMjc7eApMFv3IIvgnUSEiF
 Jm2VuJou8nNqNvjhNl9TxzU7IO0mRvvfbplnTKSJkPZayfz4HVABRmECKyEi+G3x
 IyJGFgSwM+QvNsE8y9JzHDuG4RRivyKcANxkcR43CBdJKfCvbywzvkA1wzwsg9Ob
 Z1VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561258; x=1657647658; bh=IsNbyoMpBX2rI
 LQoNf1Zi/Q01kJT5D7YGgtw2Jj1kjg=; b=qFLk8WI0tklWN2e9ul8q59a2asXLg
 9e0ZBWGLaxstpkChwkN1Ycx7poa6GtfIeCkN9u9fbv4tcg1RL+Bsl1yURpYNHSlL
 yufLHSv7cr2QM2hSvNh9JnKP32LoZVLidGQgaeGzyKow2gUbNFlW2K4ioSpKybKc
 XoWdLMjLECfgUKG8/EdypVcU5fQ1oKap3SvVZk1jVZcu/B60LlorFa9maSocfM7D
 6xL0Istbr57fI/UYYTNQ8FankLQ8TN1kerQWd1Tf2pONFnaTJCvKJ+L8yrPfXWOO
 bGTDWmVWRsWVIlenePOP3QJzFR7GWD3aGgreCgTrx11rZdT+pg0V4V07Q==
X-ME-Sender: <xms:qmDMYpyDQZzs5JBT0NwnNO5Rzx9fQH0bKbzHVYbMLoiuffPaE0uCyw>
 <xme:qmDMYpRN6UdZmoTLwlpF9WxE_nNBy_iSNzbZwMZiupDAB5rc7hZyRiWygdnjB_M_h
 xMOXOZaw6b2OA5s2LI>
X-ME-Received: <xmr:qmDMYjVY2Q1xzVdePPqRyo5gh-uvZcBEO5DtTK4bBwa_-ryyYWOIYHPWvcVXW-Hwph9bnAVPc9LerdQmZgQHtAHnmDoJfX1IbxLgdQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qmDMYriYibb1C6tIaq7x44wDNfAPDjrIg1PYkfJhMSZXi0rtFf4HlA>
 <xmx:qmDMYrAar-1ZK_ybydZrPTjOQg7OT1ip9TT_ec4x58iF30SreJ--1g>
 <xmx:qmDMYkIZr0BNrrQMJFpmKNZhLR8-s1K9fY9YQ1T_45XEikTtJziD3g>
 <xmx:qmDMYm9h3_kt_e4_PYg_cIvJN46a89mCEI_GoiuKWQgQnKc7SOrAVw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 44/69] drm/vc4: hdmi: Switch to DRM-managed kfree to build
 regsets
Date: Mon, 11 Jul 2022 19:39:14 +0200
Message-Id: <20220711173939.1132294-45-maxime@cerno.tech>
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

The current code to build the registers set later exposed in debugfs for
the HDMI controller relies on traditional allocations, that are later
free'd as part of the driver unbind hook.

Since krealloc doesn't have a DRM-managed equivalent, let's add an action
to free the buffer later on.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 46 +++++++++++++++++++++-------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ++-
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2705f879efce..cee38fc900fd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2676,7 +2676,15 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 }
 #endif
 
-static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
+static void vc4_hdmi_free_regset(struct drm_device *drm, void *ptr)
+{
+	struct debugfs_reg32 *regs = ptr;
+
+	kfree(regs);
+}
+
+static int vc4_hdmi_build_regset(struct drm_device *drm,
+				 struct vc4_hdmi *vc4_hdmi,
 				 struct debugfs_regset32 *regset,
 				 enum vc4_hdmi_regs reg)
 {
@@ -2684,6 +2692,7 @@ static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
 	struct debugfs_reg32 *regs, *new_regs;
 	unsigned int count = 0;
 	unsigned int i;
+	int ret;
 
 	regs = kcalloc(variant->num_registers, sizeof(*regs),
 		       GFP_KERNEL);
@@ -2709,10 +2718,15 @@ static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
 	regset->regs = new_regs;
 	regset->nregs = count;
 
+	ret = drmm_add_action_or_reset(drm, vc4_hdmi_free_regset, new_regs);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
+static int vc4_hdmi_init_resources(struct drm_device *drm,
+				   struct vc4_hdmi *vc4_hdmi)
 {
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
@@ -2726,11 +2740,11 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	if (IS_ERR(vc4_hdmi->hd_regs))
 		return PTR_ERR(vc4_hdmi->hd_regs);
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->hd_regset, VC4_HD);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->hd_regset, VC4_HD);
 	if (ret)
 		return ret;
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->hdmi_regset, VC4_HDMI);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->hdmi_regset, VC4_HDMI);
 	if (ret)
 		return ret;
 
@@ -2753,7 +2767,8 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	return 0;
 }
 
-static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
+static int vc5_hdmi_init_resources(struct drm_device *drm,
+				   struct vc4_hdmi *vc4_hdmi)
 {
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
@@ -2855,35 +2870,35 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		return PTR_ERR(vc4_hdmi->reset);
 	}
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->hdmi_regset, VC4_HDMI);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->hdmi_regset, VC4_HDMI);
 	if (ret)
 		return ret;
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->hd_regset, VC4_HD);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->hd_regset, VC4_HD);
 	if (ret)
 		return ret;
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->cec_regset, VC5_CEC);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->cec_regset, VC5_CEC);
 	if (ret)
 		return ret;
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->csc_regset, VC5_CSC);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->csc_regset, VC5_CSC);
 	if (ret)
 		return ret;
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->dvp_regset, VC5_DVP);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->dvp_regset, VC5_DVP);
 	if (ret)
 		return ret;
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->phy_regset, VC5_PHY);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->phy_regset, VC5_PHY);
 	if (ret)
 		return ret;
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->ram_regset, VC5_RAM);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->ram_regset, VC5_RAM);
 	if (ret)
 		return ret;
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->rm_regset, VC5_RM);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->rm_regset, VC5_RM);
 	if (ret)
 		return ret;
 
@@ -2978,7 +2993,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (variant->max_pixel_clock > HDMI_14_MAX_TMDS_CLK)
 		vc4_hdmi->scdc_enabled = true;
 
-	ret = variant->init_resources(vc4_hdmi);
+	ret = variant->init_resources(drm, vc4_hdmi);
 	if (ret)
 		return ret;
 
@@ -3105,9 +3120,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) != 0);
 	vc4_hdmi = dev_get_drvdata(dev);
 
-	kfree(vc4_hdmi->hdmi_regset.regs);
-	kfree(vc4_hdmi->hd_regset.regs);
-
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index c3ed2b07df23..99b0bc1297be 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -58,7 +58,8 @@ struct vc4_hdmi_variant {
 	/* Callback to get the resources (memory region, interrupts,
 	 * clocks, etc) for that variant.
 	 */
-	int (*init_resources)(struct vc4_hdmi *vc4_hdmi);
+	int (*init_resources)(struct drm_device *drm,
+			      struct vc4_hdmi *vc4_hdmi);
 
 	/* Callback to reset the HDMI block */
 	void (*reset)(struct vc4_hdmi *vc4_hdmi);
-- 
2.36.1

