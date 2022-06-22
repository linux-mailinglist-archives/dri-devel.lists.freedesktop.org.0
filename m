Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5701E554D4D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13099112D33;
	Wed, 22 Jun 2022 14:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C2B112D33
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A530F3200990;
 Wed, 22 Jun 2022 10:34:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908465; x=1655994865; bh=q7
 /fd0DLHrnCXwO8CASy1xKxXuQ0/gz3zwHafc2DVYM=; b=CsMsqBwLlP6oGHWQ3K
 eqOyI+4itOVsG/aO3M75+ixzT6kpZKT0mxG9a24SQ+5r2efnUwF7NDx0OeJ+tlub
 zjWSfd8pda3sUVxxXYUzhd04f3cm6BKnwu0K6MFwk4MBcmh/AnaR37Mmsxkue9qF
 yQud70Pcm5qq6RfqXkFetXk0fnEM8Re1eCO8eu8PU64yBX5aLBSyR0iWzvzsfmxx
 0Vh5yxRUOrpOVymDxN7dH7iLHounnt+slu3TZicqJG5JjDbZqcxP1MHByDETW+iL
 dumwciCIDdx4hobJ2P7ijgiFsFDoYIY85UXJJ+R2QGdEI0h+RKEXfHh9trKjIIbg
 ywqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908465; x=1655994865; bh=q7/fd0DLHrnCX
 wO8CASy1xKxXuQ0/gz3zwHafc2DVYM=; b=PRONpJ52TYB4Ews+I0+mdFuS6pZk1
 /ytsGmIAaymnYXbfaDTsaYMeSw/nkBgVlQc7zczdqxpPXqyBJKy5GMie2rfHIubx
 VLBYwbHaVZCothfCglvVauEsCWq0H+iZuYQrF8a88Hb7jLA6qWPmQJYAchYkcBrS
 ms8ZyOkd1Vplx5jUr+5V1WUWgtKOvaksiaj4vEYBFl0qhMQdbPQ5hyByg4Y5hHNC
 VBnL3f7QC3QHqpkazNzoSpAOSdQC0iH2BDtl3Ep5F3UdHBu8w4I7W6l8xcWypoJT
 9U8jkYZTFFv0LtcQNIOLazg8oiQ6I9fKyX4IsjSXximAAUzKGKjbsnsAg==
X-ME-Sender: <xms:cCizYrjFkqFcw6vcCgqB5M3B62ql_A5X5nhxAYYOauG3aw6hV3l_7g>
 <xme:cCizYoCbt8b7tAstbVCZdcaaSZfdFBT8UbGYRzp7DB1Vqm2Fz5-NQVl-2pjs3Zovw
 6PLnRkhYv6iisbzxEg>
X-ME-Received: <xmr:cCizYrGNQuOdkKZNYNQHrSSm85JtGY9jgm6pjwG-TtDnLIjqS-_7NlbWyD_8GqR9Lot5RAbdZ6gTdQzlo-cfrv_79rrc3eMejVq1D7I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cSizYoTGsvALHX-_f4rcGy99kYIKt89LsUPKtlBb8SRJbE3H54nNYQ>
 <xmx:cSizYozibNA9WHUZOPSTr1QtK5K6ZD-qvuC20kbB2euwh9sYLvcYOQ>
 <xmx:cSizYu7Z3FNtOAmOaNZxUbtBw1S367dT2fZSGuL6eViG_h75RJGVKQ>
 <xmx:cSizYitelyEspKhFYEHHZzT2emHUcFE4l8hN9aW3IJQiofmqaFHFAw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 41/68] drm/vc4: hdmi: Switch to device-managed CEC
 initialization
Date: Wed, 22 Jun 2022 16:31:42 +0200
Message-Id: <20220622143209.600298-42-maxime@cerno.tech>
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
index 2de7532b6c78..36ded0f56548 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2542,6 +2542,14 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
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
@@ -2577,75 +2585,75 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2971,7 +2979,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vc4_hdmi_audio_init(vc4_hdmi);
 	if (ret)
-		goto err_free_cec;
+		goto err_free_hotplug;
 
 	vc4_debugfs_add_file(drm, variant->debugfs_name,
 			     vc4_hdmi_debugfs_regs,
@@ -2981,8 +2989,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_free_cec:
-	vc4_hdmi_cec_exit(vc4_hdmi);
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_put_runtime_pm:
@@ -3023,7 +3029,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hdmi_regset.regs);
 	kfree(vc4_hdmi->hd_regset.regs);
 
-	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
-- 
2.36.1

