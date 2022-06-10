Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B53D6546251
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540A211B609;
	Fri, 10 Jun 2022 09:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC0511B30D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:36 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1CEDF5C01AE;
 Fri, 10 Jun 2022 05:30:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853436; x=1654939836; bh=2j
 mZKoaQadOSFboDIHkVmMqixspiiZhEtekQJG+eI/w=; b=jsxXs0V9giv1iWZvkU
 RI/SoiO31a1zc7quDkGTQD/RmRB3usBAoIj+pDKEsRvBW7XvQB9b1hn0vmUVBw9K
 3jicirNRy6c2eoj9po2gJs/F9FRG4/LGrKBR4mxOEZhkxV1BjyhyQq1842wQ8wPu
 pVJBenzV6l54MJVrv2ROznqWt1xqxu9vY+tvWrMkbi/QNJIvGt1e1MOMazTZfo+T
 c5BLeOYr/+zh99qB/jbCSDO/vngWGoeXqfevviasUA4HTRFPYvEZP+8FXLFWyLs6
 f5h7G8TrhJLVNRUSHpfb/fvqfivlDMBB/t4wn0mIg1/ZnvJFhhrYDunTIYueZRBE
 6rFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853436; x=1654939836; bh=2jmZKoaQadOSF
 boDIHkVmMqixspiiZhEtekQJG+eI/w=; b=trYHP7c3TMqNIAc347X8LWAlYBsHp
 72xjCrGChZ1z/Z5Y0tg85DTOOe44O3ucO1maQ7V4E5L6/8h1xb/XvFppFdmd8Myr
 yryM9Q0o5+2nUCjGNNF/5ifHoQVWtVhI771htAYuTiw3LOONdvSGkFbFeCY6H0zH
 8Im1HJ+KtOOqSb9JkWUcUplyV7z9H03qdr63DN6GyB+8dv8jBOfbLZ4wv0oKbtCu
 Tq4gEvKNB3mH3fxU0dSrZGpXXCYKBTSHP8ltPZVoqN8QNIoCkKdJoC9jutBX7HZx
 YlmDuvQp/8SZWL/ogXpCmwEykKhFRkNufVYYY+W8fkmLim4RAxNWwZmGg==
X-ME-Sender: <xms:Ow-jYmZ2dQVsf02ItK6tT3_mCsjI2xJLUYGmG-Ah3fDYYBOyvMCeSQ>
 <xme:Ow-jYpYpYb2yywtymq9sup8wcPZJb5NyAGevzFmqRgFQTObhdssYQVggWUY1Y6X9N
 PZLGB2gvrPT7T5MaIk>
X-ME-Received: <xmr:Ow-jYg_RY0_QVyJWR7COQBP4BY0XGdA611RivlP4DIIH-jM-3Cdn46kSUysr89utxs4IK814XfvM2IdLU2hHHEYUPeDdXZHlQnaNDVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ow-jYorpCnxPuQeUoqfHBi0C_kW3Bew_dXalRuujmhV7ta_9ujA_CQ>
 <xmx:Ow-jYhow89Gihl4csgXQ0GiUnNtWOPzLrp0dy9uIiT-01u2E2snDDg>
 <xmx:Ow-jYmRzoUZjmoqWN0VhqqcZEQO12UqCB3cWmCEpM0lh4ECUiJo6EA>
 <xmx:PA-jYimjQSc_MLxE0WX23HHZHGazG2nOLgZ1JD_Xhl5ZW0dNf3ePkg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 38/64] drm/vc4: hdmi: Switch to device-managed CEC
 initialization
Date: Fri, 10 Jun 2022 11:28:58 +0200
Message-Id: <20220610092924.754942-39-maxime@cerno.tech>
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

The current code to unregister our CEC device needs to be undone manually
when we remove the HDMI driver.

Since the CEC framework will allocate its main structure, and will defer
its deallocation to when the last user will have closed it, we don't really
need to take any particular measure to prevent any use-after-free and can
thus use any managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 95 ++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8f71f5a5e4ce..402bfde3b5fe 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2541,6 +2541,14 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
 	.adap_transmit = vc4_hdmi_cec_adap_transmit,
 };
 
+static void vc4_hdmi_cec_release(void *ptr)
+{
+	struct vc4_hdmi *vc4_hdmi = ptr;
+
+	cec_unregister_adapter(vc4_hdmi->cec_adap);
+	vc4_hdmi->cec_adap = NULL;
+}
+
 static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 {
 	struct cec_connector_info conn_info;
@@ -2576,75 +2584,75 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
 
 	if (vc4_hdmi->variant->external_irq_controller) {
-		ret = request_threaded_irq(platform_get_irq_byname(pdev, "cec-rx"),
-					   vc4_cec_irq_handler_rx_bare,
-					   vc4_cec_irq_handler_rx_thread, 0,
-					   "vc4 hdmi cec rx", vc4_hdmi);
+		ret = devm_request_threaded_irq(dev, platform_get_irq_byname(pdev, "cec-rx"),
+						vc4_cec_irq_handler_rx_bare,
+						vc4_cec_irq_handler_rx_thread, 0,
+						"vc4 hdmi cec rx", vc4_hdmi);
 		if (ret)
 			goto err_delete_cec_adap;
 
-		ret = request_threaded_irq(platform_get_irq_byname(pdev, "cec-tx"),
-					   vc4_cec_irq_handler_tx_bare,
-					   vc4_cec_irq_handler_tx_thread, 0,
-					   "vc4 hdmi cec tx", vc4_hdmi);
+		ret = devm_request_threaded_irq(dev, platform_get_irq_byname(pdev, "cec-tx"),
+						vc4_cec_irq_handler_tx_bare,
+						vc4_cec_irq_handler_tx_thread, 0,
+						"vc4 hdmi cec tx", vc4_hdmi);
 		if (ret)
-			goto err_remove_cec_rx_handler;
+			goto err_delete_cec_adap;
 	} else {
 		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
-		ret = request_threaded_irq(platform_get_irq(pdev, 0),
-					   vc4_cec_irq_handler,
-					   vc4_cec_irq_handler_thread, 0,
-					   "vc4 hdmi cec", vc4_hdmi);
+		ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0),
+						vc4_cec_irq_handler,
+						vc4_cec_irq_handler_thread, 0,
+						"vc4 hdmi cec", vc4_hdmi);
 		if (ret)
 			goto err_delete_cec_adap;
 	}
 
 	ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
 	if (ret < 0)
-		goto err_remove_handlers;
+		goto err_delete_cec_adap;
+
+	/*
+	 * NOTE: Strictly speaking, we should probably use a DRM-managed
+	 * registration there to avoid removing the CEC adapter by the
+	 * time the DRM driver doesn't have any user anymore.
+	 *
+	 * However, the CEC framework already cleans up the CEC adapter
+	 * only when the last user has closed its file descriptor, so we
+	 * don't need to handle it in DRM.
+	 *
+	 * By the time the device-managed hook is executed, we will give
+	 * up our reference to the CEC adapter and therefore don't
+	 * really care when it's actually freed.
+	 *
+	 * There's still a problematic sequence: if we unregister our
+	 * CEC adapter, but the userspace keeps a handle on the CEC
+	 * adapter but not the DRM device for some reason. In such a
+	 * case, our vc4_hdmi structure will be freed, but the
+	 * cec_adapter structure will have a dangling pointer to what
+	 * used to be our HDMI controller. If we get a CEC call at that
+	 * moment, we could end up with a use-after-free. Fortunately,
+	 * the CEC framework already handles this too, by calling
+	 * cec_is_registered() in cec_ioctl() and cec_poll().
+	 */
+	ret = devm_add_action_or_reset(dev, vc4_hdmi_cec_release, vc4_hdmi);
+	if (ret)
+		return ret;
 
 	return 0;
 
-err_remove_handlers:
-	if (vc4_hdmi->variant->external_irq_controller)
-		free_irq(platform_get_irq_byname(pdev, "cec-tx"), vc4_hdmi);
-	else
-		free_irq(platform_get_irq(pdev, 0), vc4_hdmi);
-
-err_remove_cec_rx_handler:
-	if (vc4_hdmi->variant->external_irq_controller)
-		free_irq(platform_get_irq_byname(pdev, "cec-rx"), vc4_hdmi);
-
 err_delete_cec_adap:
 	cec_delete_adapter(vc4_hdmi->cec_adap);
 
 	return ret;
 }
-
-static void vc4_hdmi_cec_exit(struct vc4_hdmi *vc4_hdmi)
-{
-	struct platform_device *pdev = vc4_hdmi->pdev;
-
-	if (vc4_hdmi->variant->external_irq_controller) {
-		free_irq(platform_get_irq_byname(pdev, "cec-rx"), vc4_hdmi);
-		free_irq(platform_get_irq_byname(pdev, "cec-tx"), vc4_hdmi);
-	} else {
-		free_irq(platform_get_irq(pdev, 0), vc4_hdmi);
-	}
-
-	cec_unregister_adapter(vc4_hdmi->cec_adap);
-}
 #else
 static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 {
 	return 0;
 }
-
-static void vc4_hdmi_cec_exit(struct vc4_hdmi *vc4_hdmi) {};
-
 #endif
 
 static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
@@ -2967,7 +2975,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vc4_hdmi_audio_init(vc4_hdmi);
 	if (ret)
-		goto err_free_cec;
+		goto err_free_hotplug;
 
 	vc4_debugfs_add_file(drm, variant->debugfs_name,
 			     vc4_hdmi_debugfs_regs,
@@ -2977,8 +2985,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_free_cec:
-	vc4_hdmi_cec_exit(vc4_hdmi);
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_put_runtime_pm:
@@ -3019,7 +3025,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hdmi_regset.regs);
 	kfree(vc4_hdmi->hd_regset.regs);
 
-	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
-- 
2.36.1

