Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4E4554D4F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AD3113327;
	Wed, 22 Jun 2022 14:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF1B113327
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B94A932009B7;
 Wed, 22 Jun 2022 10:34:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908471; x=1655994871; bh=5m
 lR8qDZx49aJewS0jE/7NDmwILx0xG20jF3Ik59JwQ=; b=o3h8gH383BaaXmdnTx
 xxlvTklJXaC2XlSwdeDELEi7AidRG5moXoPwVm/+oLnCpAqGXwqqgDyFREJZ4IME
 mF4A7mmNuXj8sQn0W13/dad3mR5J69LV1hu01DniXSY66nCvRrOtENa0v/QAR7Kp
 6WZ8QLM9x9uFDWE/lls7s0e5qTQGjnQkgome9q9I+Y5JVcsfuasSuCo1cLF/oMkY
 ZfXQwoXmu1SisRQMSzu88Rx3L8igTdd5ym39zLgpT9b0P+82DYx/QQhfgKnVxWzs
 qk9KpEjX/vtzZtbkUyWcWUSujTnt2hGJSOR0/k9Dwnd6lTfU75csSANxJo56t2sh
 XFRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908471; x=1655994871; bh=5mlR8qDZx49aJ
 ewS0jE/7NDmwILx0xG20jF3Ik59JwQ=; b=m73HsO94NvuK7NeA//oQwprzNtMEU
 I1AYIQfC1RSZj7GQIr76zSQJ/PL2W9TwAkLybWoiBJjauZGtxA6qiEbFg9d8e9YS
 sSY2THSupOtQ4U/tWgiemM72vP/8cP5WqjR/iJVK1MTtrKvxCF7F0HulwNpPLcUh
 YD7O4yA9G+ataZWtk19Ig7oksv8yJXn6a0ER1F1IHQYXJQJZA4K3WvKFao1AzIeQ
 F6fjyYuXy+WEXFIkIjH7dOYR1oXUbetBmKblmI1LgsvHDB9H9xuxBynSeypctf6+
 BaLZXgORQdoVH1Fq+b8TZeR+En/Gl3GKHE/9/B3t4+6rPZ3/lSAoToNPg==
X-ME-Sender: <xms:dyizYoSMsAV7ML4SxalaABxHjY4X39j3-88GBUxaHDf3Vj7SdwWV1w>
 <xme:dyizYlyIEFQ2_l-YLf323AdUGbbOSBDV5QOu1xFokPiPUaN8ECP4F8IORQ-CLeV7H
 p4UMPhRee8Vw_o6xUE>
X-ME-Received: <xmr:dyizYl0PvRlcchmOg1RJ_zqIll6o-CvZIkBYrgmeMW4QPVSsl-WvL0VVjme6YqhajXQtoksejTRbWWY8QMJEuxOk_mQJurFKsGgL5Ro>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dyizYsCE7OUkTOHVC0Q-k00M2F2oBrPasHP11CI5QUJw41X1lYHXsQ>
 <xmx:dyizYhjKPIInJtjbUljdaoiR7UAETrDr9u3fR8XkNGveVhiiMWCHxQ>
 <xmx:dyizYoo4erDsUF1hH90m_hbjnuZu3yXteqzcvdB79n4HcQUCA-g4SA>
 <xmx:dyizYhfwBRa2jkzI0XyvIoV1wnGTxh5L5JhOs27miyrifOD1x3enXQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 43/68] drm/vc4: hdmi: Switch to DRM-managed kfree to build
 regsets
Date: Wed, 22 Jun 2022 16:31:44 +0200
Message-Id: <20220622143209.600298-44-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 30 +++++++++++++++++++++---------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ++-
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 350220786bef..1febab3b52c6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2656,7 +2656,15 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2664,6 +2672,7 @@ static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
 	struct debugfs_reg32 *regs, *new_regs;
 	unsigned int count = 0;
 	unsigned int i;
+	int ret;
 
 	regs = kcalloc(variant->num_registers, sizeof(*regs),
 		       GFP_KERNEL);
@@ -2689,10 +2698,15 @@ static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
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
@@ -2706,11 +2720,11 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
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
 
@@ -2733,7 +2747,8 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	return 0;
 }
 
-static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
+static int vc5_hdmi_init_resources(struct drm_device *drm,
+				   struct vc4_hdmi *vc4_hdmi)
 {
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
@@ -2903,7 +2918,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (variant->max_pixel_clock > HDMI_14_MAX_TMDS_CLK)
 		vc4_hdmi->scdc_enabled = true;
 
-	ret = variant->init_resources(vc4_hdmi);
+	ret = variant->init_resources(drm, vc4_hdmi);
 	if (ret)
 		return ret;
 
@@ -3034,9 +3049,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) != 0);
 	vc4_hdmi = dev_get_drvdata(dev);
 
-	kfree(vc4_hdmi->hdmi_regset.regs);
-	kfree(vc4_hdmi->hd_regset.regs);
-
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 51b27dcdcd9b..f6be92f33383 100644
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

