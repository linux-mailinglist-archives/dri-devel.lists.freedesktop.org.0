Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9D56B6BA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1D81138A1;
	Fri,  8 Jul 2022 09:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F051138A1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 246A532009CA;
 Fri,  8 Jul 2022 05:59:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274363; x=1657360763; bh=Xx
 t215AFiNT8gG7pGzaAX2NF08/liZMw8E6QmSKTFCE=; b=qspsgpCrveDyR8Mwj8
 AApj9g5pZRrE5Y671XjHr13tSogRKgN8ZXuKluREF8KJE9FFWWULtKNDzGHfBNDR
 KoDt2MX8+jD2o9ahHzFcPJ0PyEcu6N+L6JpdcEBrksJVMQi1zUfo39HUzIrjVa2v
 HdSG1TEOH5+C1CZdeYkuyCrmYEY0Cz4FOLLABHgARtqBTefrxWrIuQQreBUFJ/Td
 TXQFLObjhZ9uSWHloZ1QMIaa0ZDls3jg2Ee0Mv3eqXXbKFXk+nJ1UZJvJMhNGwgE
 jA3dvl+UdXkgSDLWtpgm6nA99GxyCZEBSokSFK0aao5v9RI/uUMRF6yE2c3QUE94
 bylw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274363; x=1657360763; bh=Xxt215AFiNT8g
 G7pGzaAX2NF08/liZMw8E6QmSKTFCE=; b=3Otao1Gwc2ciupOFobtq/gI81k0tm
 pmxzgtNcm3Sd79NcyjgBvi94SqSfD31tuk21NS/tDtPCcIHxyujt9ZwzOLFKzvxZ
 AVEzOn1ecHDvXw8pFOsPBbjRddQFwZ+jPLnjkoDphfsOjZIKc1lyZl/nfKMV3SA5
 zHX7vILGhKUm+PFUVzYQVpVEV1XszIvnIcA2iPnwnz0avGEDshVGEl4F7suR6JyO
 qP97t7RhORjJSm5krhhhNmeh2lfAHq031ubL1AL6rJATlA3e3kpwYp4YlsXmMetN
 gdOdnQxXuEBoXPbDKvLlKZ9MJS6XzUVfMrDhw8edleCW5rJRsyOXl6fWg==
X-ME-Sender: <xms:-__HYvz0x80NzadfLvee3W9ium5l1CSm_T9Szotn--hqj6B05nihtA>
 <xme:-__HYnTTg-xU3JwyX0VnQqHWkGvrUcj2f_4xi3jtY6AhJIanGsZo0WlRXlCbpAKJ_
 lfgngVU2pRhPXiCFCY>
X-ME-Received: <xmr:-__HYpWYa6K_XxmDkmmBT78F0QjKXRZwyh62QvBt2Q5trIpTjQO-AKfTYO_XVA56bBbYUjdvzZ1V-KVhTV39Z25CKs2AkuWqauHCjPU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-__HYphBJfdGOdYSK9Ud3EAJJn1gZuQE9r9DilKOXXyB6Ifcf_l32w>
 <xmx:-__HYhBCLzh9zlyY8g5wZ4rs60LypWcuZGJv5mlDmwbG3puH8VNkSw>
 <xmx:-__HYiIdIKmUa9G8uXbZjcHrU_nS8LLDBg-v60HEV_SINYJgTF9Ohw>
 <xmx:-__HYs-zK1MVFbT7P6R3IwZD1axlMYnYDq7VfHPzKgV1s15ROFeO_A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 45/69] drm/vc4: hdmi: Use devm to register hotplug
 interrupts
Date: Fri,  8 Jul 2022 11:56:43 +0200
Message-Id: <20220708095707.257937-46-maxime@cerno.tech>
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

Commit 776efe800fed ("drm/vc4: hdmi: Drop devm interrupt handler for
hotplug interrupts") dropped the device-managed interrupt registration
because it was creating bugs and races whenever an interrupt was coming in
while the device was removed.

However, our latest patches to the HDMI controller driver fix this as well,
so we can use device-managed interrupt handlers again.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 41 +++++++++-------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cee38fc900fd..514253fa26fe 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2217,21 +2217,19 @@ static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2239,16 +2237,6 @@ static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -3070,11 +3058,11 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
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
@@ -3084,8 +3072,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_free_hotplug:
-	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 err_disable_runtime_pm:
@@ -3097,8 +3083,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 			    void *data)
 {
-	struct vc4_hdmi *vc4_hdmi;
-
 	/*
 	 * ASoC makes it a bit hard to retrieve a pointer to the
 	 * vc4_hdmi structure. Registering the card will overwrite our
@@ -3118,9 +3102,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
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

