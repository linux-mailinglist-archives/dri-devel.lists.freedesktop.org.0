Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441A556B6B8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB9F113655;
	Fri,  8 Jul 2022 09:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895E3112371
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6221B32009CA;
 Fri,  8 Jul 2022 05:59:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274354; x=1657360754; bh=NJ
 4xacfliAO7X3Q+LvFXSg7dOS+RVXe1J/U9DfN9hzQ=; b=KP9QipkXvlbjqUQ5vr
 5/vwtfL+QqpMqceSBgxZP7DchTJzoIW9wYar9g9wv0cMlkRr3BEROCEOfgajEtEs
 jVoYEvX3ccDjPgEsqYd+ydUOIcdaxlcxXkIFe//0EPLl7YVfUiuvcAZCwfGMEPgd
 6CuONkjnAH8xFmeIE4Uf/1QiynHz2WqblquhtbgFhtOeGipZRLJnrVo4wHwXWnRt
 KTh8wqcCvXVYWcMul9Qxt2adlfx20hPK0/wUKWSmjk3JIFkFFHfNfj6s2bqQ93Ps
 c8O67H2MK25cy8sIAxAG4s81noSv5UgZ4pwWtBMFgR0w+u4+G7UmX9UYPDom0DIj
 rMfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274354; x=1657360754; bh=NJ4xacfliAO7X
 3Q+LvFXSg7dOS+RVXe1J/U9DfN9hzQ=; b=C7vJPIT2XlN8SIa+F/RSWm4ZphVTN
 evWJ6UUL5jQG+H4K4s0ySLkwNQaI8mRwUY3bMbnTdIw4O/nNjjP03ukS72OOmPhS
 cS8wikuQ4KyZTUq3x4LWVvD+H8CZ6txbBxCL6EkEerTTNEECqrCk1Hs9vPjSIMai
 Ow02Epfw5+vHFyc1uGeWO+ze6rPOSHLFL46YvvWGBZAEMSqdtVsdoE8vlzJV2UDu
 d54OU80DSfDAoW3er+HNSggBxKTxLJnnodFfIMLkdU6jnf3/a+sCNbQWOLp0NPHt
 e7BL0zwVgYCmU63MkqyuCK39RfB6IkHrYwTzEnjnvw+iKybGrYEcVN7Bg==
X-ME-Sender: <xms:8v_HYihtOF7S690k9O9-x4okVI5tGhgnYRpjIM6XlCPoqWMCqQc5zA>
 <xme:8v_HYjCG7miSk3ufeJzAiPCeWVUevqkpEIVf8hLTXHdctjeF3P46Tw1GC_tNJv7kB
 rKYC9ME57YcrXOGZ5E>
X-ME-Received: <xmr:8v_HYqGavkVM4zepC06Rsq5WA3oPFbhhPxZGbfR_syZEhPiKuqTtHFnovLRoP63Y3Ms3voksV13u9jQkP7cGOTj5IZ9ZNeroIiyRUnU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8v_HYrToY2C9gVYhJ-MB8B0UQgLdxdMWhsos6kDnsZYqeFLnBhWNXg>
 <xmx:8v_HYvyQz6cZ_8hDMHKpzZg0iPV6gTv_dUJsn4OAkzrF4aWHIPNDfA>
 <xmx:8v_HYp6_2aDMIE3yakFq1y9Ix7SoIcHIW2eUGmTNkbecYJzSfvaasg>
 <xmx:8v_HYhvYWBoC8UT4Lqp0dHb9D54yeyQbGv8Hjst2AyEmKsdkzjWfVg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 42/69] drm/vc4: hdmi: Switch to device-managed CEC
 initialization
Date: Fri,  8 Jul 2022 11:56:40 +0200
Message-Id: <20220708095707.257937-43-maxime@cerno.tech>
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

The current code to unregister our CEC device needs to be undone manually
when we remove the HDMI driver.

Since the CEC framework will allocate its main structure, and will defer
its deallocation to when the last user will have closed it, we don't really
need to take any particular measure to prevent any use-after-free and can
thus use any managed action.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 94 ++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cf04f915ce7b..e84600695fe2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2577,6 +2577,14 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
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
@@ -2601,70 +2609,71 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
 
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
 #endif
 
 static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
@@ -3040,7 +3049,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vc4_hdmi_audio_init(vc4_hdmi);
 	if (ret)
-		goto err_free_cec;
+		goto err_free_hotplug;
 
 	vc4_debugfs_add_file(drm, variant->debugfs_name,
 			     vc4_hdmi_debugfs_regs,
@@ -3050,8 +3059,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_free_cec:
-	vc4_hdmi_cec_exit(vc4_hdmi);
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_put_runtime_pm:
@@ -3093,7 +3100,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hdmi_regset.regs);
 	kfree(vc4_hdmi->hd_regset.regs);
 
-	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
-- 
2.36.1

