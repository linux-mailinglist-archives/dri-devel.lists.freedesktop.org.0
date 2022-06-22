Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7AC554D50
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77EA113392;
	Wed, 22 Jun 2022 14:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18437113361
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id DFCCE32009B6;
 Wed, 22 Jun 2022 10:34:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Jun 2022 10:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908474; x=1655994874; bh=2F
 DacKUvifgGsRWcPYiEAmeMnuHGNd58BePRBtiY5Fk=; b=cbE1dJIqT7Fk2yfnuF
 dqJ5C3ROOGyuy28XcB6OAQrk1GsQKEK48iMR4boD/nwPPvDRlT62CRz7DKYtuhzt
 MjQ3u870nUpNzaCqbunx6gx0m3oQLr+dW/2BYLz6MAmYGmAUnqypDA/atJt2iGYI
 44ovu7IMSAlivy69ETlhXHXnxPpUXaOG8AL3YtKudZ6f8yfNZpjwUzF5wnibVCP8
 oLIIaPcViiGB2OtHNgHdbb8C1Z9D2Ideib+aJHiOOetJb/I0rvdZ06L0mIxZsf85
 5UZZxnzZcW/GNdHH/RalaNvjvqTRzuMgiRDMvPB5C6jz+lxEdyaPHnObR2q64ULA
 Aggg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908474; x=1655994874; bh=2FDacKUvifgGs
 RWcPYiEAmeMnuHGNd58BePRBtiY5Fk=; b=xmUN8kz7TMlxmbKhJoHk2NU7XpIr5
 0Mi8FzfJaiTkMv868EDMo984HMlVWq6RCvWZSWQuosM2NlY8/rLc0itELfqVScHE
 iNI2h7Bvm1sWXAR1z1m9N/osQrt+DDpItl7Zjy9w8i9AFpAJwZ2mP18jIIQE4j00
 xVhkFAjcBpg9CuHctD5HbD+h/ATtkuAFnYH9XZNi4BU1lZr2guHlCe9FCeOINR7X
 2WyVS6i+oqVog5dAYHN/5FI2aaPDKhNPcFY6lsLrod5Lo0IEuDcvH1fU02GYbfxr
 BXpHtZm3I6UtDi/UW3sZIdSu0keRlNkMg/OVMms8dbCVoQcaRYEkOapow==
X-ME-Sender: <xms:eiizYmd0EqM3TaEsN5xqOInBndiA8zLr3h7G9h_-hPcy9rCX7GXbWA>
 <xme:eiizYgM2Wuxw08SKePgHHH1vi3cJIWUPThbFvCHlQ8s0TaUCPaPCilXLw-YxtgB2O
 vCSmRoQlXFhrmxzd-A>
X-ME-Received: <xmr:eiizYngJFAt0Bu_yHgud33Gvc-Z_JlqhCx_noDp0aNTLYWSd6S8FShHP7gbTKkTNvcolQTAbVZI-Fs-Ui1hF6LHmtigIGmmpEqHktyE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eiizYj9EjcdwClptIjL_Aito8qK5J9vElnjMLTjx6nW7lhgHCesKSw>
 <xmx:eiizYittzqqRde0kJqotxSgzp26fFYeR-RFjcyOf5mzl1jhtIm8XvQ>
 <xmx:eiizYqG5g56kfQ6vsMJdfA0MMvlxVblrtA9I9Tgf28BS_qi8Oa6tFQ>
 <xmx:eiizYkK_yZBDH1ESLpF6CIoADMRY__FRr-dL0fNdXSLbR_puMoOfvw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 44/68] drm/vc4: hdmi: Use devm to register hotplug
 interrupts
Date: Wed, 22 Jun 2022 16:31:45 +0200
Message-Id: <20220622143209.600298-45-maxime@cerno.tech>
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

Commit 776efe800fed ("drm/vc4: hdmi: Drop devm interrupt handler for
hotplug interrupts") dropped the device-managed interrupt registration
because it was creating bugs and races whenever an interrupt was coming in
while the device was removed.

However, our latest patches to the HDMI controller driver fix this as well,
so we can use device-managed interrupt handlers again.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 41 +++++++++-------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1febab3b52c6..cba51827b621 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2182,21 +2182,19 @@ static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
 		unsigned int hpd_con = platform_get_irq_byname(pdev, "hpd-connected");
 		unsigned int hpd_rm = platform_get_irq_byname(pdev, "hpd-removed");
 
-		ret = request_threaded_irq(hpd_con,
-					   NULL,
-					   vc4_hdmi_hpd_irq_thread, IRQF_ONESHOT,
-					   "vc4 hdmi hpd connected", vc4_hdmi);
+		ret = devm_request_threaded_irq(&pdev->dev, hpd_con,
+						NULL,
+						vc4_hdmi_hpd_irq_thread, IRQF_ONESHOT,
+						"vc4 hdmi hpd connected", vc4_hdmi);
 		if (ret)
 			return ret;
 
-		ret = request_threaded_irq(hpd_rm,
-					   NULL,
-					   vc4_hdmi_hpd_irq_thread, IRQF_ONESHOT,
-					   "vc4 hdmi hpd disconnected", vc4_hdmi);
-		if (ret) {
-			free_irq(hpd_con, vc4_hdmi);
+		ret = devm_request_threaded_irq(&pdev->dev, hpd_rm,
+						NULL,
+						vc4_hdmi_hpd_irq_thread, IRQF_ONESHOT,
+						"vc4 hdmi hpd disconnected", vc4_hdmi);
+		if (ret)
 			return ret;
-		}
 
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 	}
@@ -2204,16 +2202,6 @@ static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
 	return 0;
 }
 
-static void vc4_hdmi_hotplug_exit(struct vc4_hdmi *vc4_hdmi)
-{
-	struct platform_device *pdev = vc4_hdmi->pdev;
-
-	if (vc4_hdmi->variant->external_irq_controller) {
-		free_irq(platform_get_irq_byname(pdev, "hpd-connected"), vc4_hdmi);
-		free_irq(platform_get_irq_byname(pdev, "hpd-removed"), vc4_hdmi);
-	}
-}
-
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
 {
@@ -3000,11 +2988,11 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vc4_hdmi_cec_init(vc4_hdmi);
 	if (ret)
-		goto err_free_hotplug;
+		goto err_put_runtime_pm;
 
 	ret = vc4_hdmi_audio_init(vc4_hdmi);
 	if (ret)
-		goto err_free_hotplug;
+		goto err_put_runtime_pm;
 
 	vc4_debugfs_add_file(drm, variant->debugfs_name,
 			     vc4_hdmi_debugfs_regs,
@@ -3014,8 +3002,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_free_hotplug:
-	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
@@ -3026,8 +3012,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 			    void *data)
 {
-	struct vc4_hdmi *vc4_hdmi;
-
 	/*
 	 * ASoC makes it a bit hard to retrieve a pointer to the
 	 * vc4_hdmi structure. Registering the card will overwrite our
@@ -3047,9 +3031,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	 */
 	BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) != 0);
 	BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) != 0);
-	vc4_hdmi = dev_get_drvdata(dev);
-
-	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
 }
-- 
2.36.1

