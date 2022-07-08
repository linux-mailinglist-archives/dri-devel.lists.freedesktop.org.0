Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3856B6B9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AE51138A2;
	Fri,  8 Jul 2022 09:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6510E112371
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3DCB032009E0;
 Fri,  8 Jul 2022 05:59:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274360; x=1657360760; bh=Is
 NbyoMpBX2rILQoNf1Zi/Q01kJT5D7YGgtw2Jj1kjg=; b=CL3Vjg4XCL3U1lNcZx
 eueUQ9yelztoT0qt6QSIqTLklnkrMGH5jgCzKeCoUhxWduG5pytZr9wWZ9EPw0QV
 VkIndswo3xNLr/2QUWN9R3qzOq3ltIXYxs3h0/5f4AgbevtBd95bSM3VKxnjH7Bd
 Rf+MIwiJIZVLEbhtAinx0MWdf+V1g/Kpzbl6+zD9rnyLQoFD3ln8aDsyY+IeLZ8+
 2d0H+d2wGcEK/iHKR0MVVt1ydlBww8PzFxSeyZm0d8QnrikaYyBUi9CXoa+oFPXn
 5xv0HCtu/T5GjAeLZVPPpE+zdv3939AahBPVI+OyZLYEOwoENRo8MAUvkk+bCPId
 bKhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274360; x=1657360760; bh=IsNbyoMpBX2rI
 LQoNf1Zi/Q01kJT5D7YGgtw2Jj1kjg=; b=OQPrMm7apWIo3G9zrtdOa73Gka5zl
 GZsgOuxVUgzuUZMKhhGp9+prXar0Mv3Wv8Y98mttjp0wKUENc+rkw4C3mqla03ni
 WG+2uSLwj/17BfZ+846hwClfSlGt6DQAXJPBQzC8e+mN2gSe88g4tRVxT8dy3XVS
 7zVU++YnzWSiS8dh4UoJ7CW14rIlQTkhiKqnnPfkFytskb91QkCkP7/pCw3tDisu
 seKHFLRVWLIWmmLEn6m0X5GHl2Py/0fsLkcniNEsKR0RCfpeOu2pBL3Tls4KsDk2
 +uZkGJSbgvar1wov4uNyG59+GfWJ8VEE7jEQBNuNlzckF7+xJFfoWIx5w==
X-ME-Sender: <xms:-P_HYvIlBS9ZMmH6x_HbLcXVO4GQ9G2CADkQKuAB2Lx6_OdYskk2Mw>
 <xme:-P_HYjKwVsQCVT3tVPJHh7sr11CyCuz7LGri42EoHm0j2wQ-Q-XtV4kMoaqhNW3kl
 3F7bxUNabcG2V7mo44>
X-ME-Received: <xmr:-P_HYntJrjyv2WH7hKz_SjlW9VEziDcx3F1xUOOtL71xzVUql9igQYFKEQPMW_fMNl1O_bNVtBYuxTFq9wKLBghg-MubwHSVOZdbJGE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-P_HYoY3gRiej_dVcBqnIYpBXSN9Uf7btBj9SPC7Hppd5AcgoLM7dg>
 <xmx:-P_HYmbMsibBlU5wccMcn8qcEO5REMaRwtcYKniP3dIqhnN2BzPlCw>
 <xmx:-P_HYsBHs4Dc34WV2pSfgLG4GcnWg35LuNorRjFiOTMTOu1rxzFl6Q>
 <xmx:-P_HYtVv-gtRC5oD3QhRio6U8bWQw9jy2q4Q8shUNn5NqV_LE9G5mg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 44/69] drm/vc4: hdmi: Switch to DRM-managed kfree to build
 regsets
Date: Fri,  8 Jul 2022 11:56:42 +0200
Message-Id: <20220708095707.257937-45-maxime@cerno.tech>
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

