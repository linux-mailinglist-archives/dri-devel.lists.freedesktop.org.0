Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC39560024
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE45114A64E;
	Wed, 29 Jun 2022 12:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D5F14A637
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2026A320016F;
 Wed, 29 Jun 2022 08:37:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 29 Jun 2022 08:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506251; x=1656592651; bh=j8
 25XMiP5T+XLLI5W0/LFinJFaZeVrzE0Tx7Y0bAFt0=; b=Zx9ifkCLSjRiIsJvfC
 m/VUOr88cdJrgX1rSC5G8sJaFIpQzosNQccoG1sGXM3CYABpw49xLbFyWHXL5UYm
 +Bq01mio0h9VNOE9oeZaI5nQ6f927MDtCc0ElGZGXYOMUxcG5f/q/VTkeuqmswBx
 i/EEWFR/tyVxw5BhwZniqvIBW6mIqDBBR+wYxtJT35q0ngSmB3DkYYY3kenNzLK9
 LLPxkXThUAp1t1ndiPJnNhzsXMfjH9+uoePyR2DcrAAtcreWZAXQOMOz67Qy07iB
 6wuVowkvCVAKjqwPbyEktwVNwbCW4LDI9lmYZlaUFAGRTJZN/tIVQbWiiMIeBIPi
 J8tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506251; x=1656592651; bh=j825XMiP5T+XL
 LI5W0/LFinJFaZeVrzE0Tx7Y0bAFt0=; b=g9TBhAfQEb8oagjXdFnjAgvmcfWDb
 +ZB4uMmlmlCR/SESbhYDqixzVLM5N/emoGD0ybqy6w5t+6YP549qQC9JYpeFOFel
 x9CJF+Rb4O9udvqjfAi7/osJsfGB9kT3TgYSX1v2vtrU9SjC0gK9o6ZzMNLeWNQF
 JngdVMnJ2oafYfgHN1jC2Qjwf173N2Fy1JLsLkpmrwijseEe6zZHmyCcuqs3tqzz
 zZhmm5zoQAPBEtftr8bMfPPJcQEz0yJfGebi52s9JJYDw00B9GNlJlAI7NEjoWU/
 vryetG5O1r/fyxxbjEss3t2wx6pgfsGyBBpdSu8HqO1Di7WzBC2tjeD6g==
X-ME-Sender: <xms:i0e8Yh_o8IBHPdT_3ER09pcK1jb_u7fVRrL63U4dfR6omZMAmtFZpg>
 <xme:i0e8YlvLqH04oHCU-kFql1do-VItsTStDenZOcY3nDQ82-K_s5wbS0Q2UJvMsE6VS
 vpj9elcrV7GB8xGAKc>
X-ME-Received: <xmr:i0e8YvCv1oCuUvk56mW82jZl-BgdZzdcVHOfOzaiyVBEmZpYdTnIjY16Z_F1BS7vEuyMvz3NbAWeqLqaQEbeOyr06ZkXZa5dhWzivlo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:i0e8Ylf1nVNPYYbkzRtfw26y7El9KOHgLJROvizSBM5DaoacmHeoIA>
 <xmx:i0e8YmNkJV9XhdhIvGmEugHg2PhnwV4LzdyApPh7W1boo7DI0dxyug>
 <xmx:i0e8YnlMRwHeTihkP_RgMUxr1cZRR6i1ZywseihP9Fi3kSVSzNF-AA>
 <xmx:i0e8YjocjewJZX4zhhAScVw0M1oZnJmnO51_4a5u__K4O895fSKUTQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 46/71] drm/vc4: hdmi: Switch to DRM-managed kfree to build
 regsets
Date: Wed, 29 Jun 2022 14:34:45 +0200
Message-Id: <20220629123510.1915022-47-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code to build the registers set later exposed in debugfs for
the HDMI controller relies on traditional allocations, that are later
free'd as part of the driver unbind hook.

Since krealloc doesn't have a DRM-managed equivalent, let's add an action
to free the buffer later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 46 +++++++++++++++++++++-------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ++-
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 274f17880455..c93100fe4b42 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2675,7 +2675,15 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2683,6 +2691,7 @@ static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
 	struct debugfs_reg32 *regs, *new_regs;
 	unsigned int count = 0;
 	unsigned int i;
+	int ret;
 
 	regs = kcalloc(variant->num_registers, sizeof(*regs),
 		       GFP_KERNEL);
@@ -2708,10 +2717,15 @@ static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
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
@@ -2725,11 +2739,11 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
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
 
@@ -2752,7 +2766,8 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	return 0;
 }
 
-static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
+static int vc5_hdmi_init_resources(struct drm_device *drm,
+				   struct vc4_hdmi *vc4_hdmi)
 {
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
@@ -2854,35 +2869,35 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
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
 
@@ -2977,7 +2992,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (variant->max_pixel_clock > HDMI_14_MAX_TMDS_CLK)
 		vc4_hdmi->scdc_enabled = true;
 
-	ret = variant->init_resources(vc4_hdmi);
+	ret = variant->init_resources(drm, vc4_hdmi);
 	if (ret)
 		return ret;
 
@@ -3104,9 +3119,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
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

