Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E07E57092A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0DA90322;
	Mon, 11 Jul 2022 17:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0B290322
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:55 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B1C05C005E;
 Mon, 11 Jul 2022 13:40:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561254; x=1657647654; bh=NJ
 4xacfliAO7X3Q+LvFXSg7dOS+RVXe1J/U9DfN9hzQ=; b=oTT6i1DZO2YSSCsok7
 ZgmN5bRFQEnP3ttBm6VXWwClw0PJBfHKqWCaa5FStKXDwrWLI2wzdhjoleMdJ5sa
 5pckiFMWSAFJxNWmOIDaTAS+2CuoGaSWGPMJHPQyo/B4yw7dGdNXirVqDFVcSpCx
 Mmn1XJVKedcGlLY0aovoI1hTM+USqqTj7MKqpzWzxMq/GFEkp9VqSfOVTnuUlYFc
 PYjfQvixJ5mdNNhv3EfKTLGUvmbscI6WusADNdEEc6w5Zv0i3A+Mfy2ITD0p6DVA
 HF3Ugll7jc34P24rlQrWWxj/kFJjHk+mig9Vrdgk6tdTBy50lrK8Z3r2BsndzUiY
 RFxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561254; x=1657647654; bh=NJ4xacfliAO7X
 3Q+LvFXSg7dOS+RVXe1J/U9DfN9hzQ=; b=r8i3j6AFXPzv7looJ2jOfL+bmFRLc
 wcjmyhOqhhCY78pruyOWTZ+QSYnsPy7b7BSsyoaBpxaf2aH7AwWYPBoOTAyqDRUo
 kg6E/xqt///VFVnQhfOHK/X6SeWifDLnEQuG+F6ygVAlM2/dgXaz8ih2LY2Ds1M8
 E3ky0R7ydCli4m2yKQGYUzRmXFN6lkk2SRqdL9Zt6TRFScrAEu3R7xLf90C0jN4K
 ClGRauSDPfOiFP5TBJ6vdUV+BzetFeiXDxTA4jSJBVGHAMgjovee2uai4kS2fMyo
 9Oc4SD2C1LdLcInPoGw34hv5k4wfnB9ww8pRWNrlg65IAuVZzsExnMJrQ==
X-ME-Sender: <xms:pmDMYnhljzmNxB9D0f6IPs4eEZYtUk0Tdy5K2qpfUvmQ1YFNjKw1Ng>
 <xme:pmDMYkAgzjmF5WceQ1QUDJmsTrSo_a0YDrq8nBwpzqzA6AkOtICBC9E_9wLYKZJd_
 ucrH-hHdxBq0Ca6su4>
X-ME-Received: <xmr:pmDMYnGTHQDR_uEIBboXbGpY9VRbupGNFluWzW69rBJBvG4l5WjkQQcq0dM4u9Nj2ZuDT_cgP7-Mz_ix9kI9TT41K4u2l9ssfMJro3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pmDMYkS5Hs6AJPGt8CtyNmk7vWSSN2a3x9G_9qKVKD0v4plG-SI4hg>
 <xmx:pmDMYky-e1wYrRAoNl7qeJR5tcwlJICqxQBszcyP40DS8fXkY6pfDA>
 <xmx:pmDMYq7qnmTVsHVKd5suy56F3vKxbtV_d8vs3oaOAls6c4_KvDB8fQ>
 <xmx:pmDMYut3L94xeuIkA4ZSoAQx_kuo6Iy2Tk-3lZ4FbnC36L1ikfPebA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 42/69] drm/vc4: hdmi: Switch to device-managed CEC
 initialization
Date: Mon, 11 Jul 2022 19:39:12 +0200
Message-Id: <20220711173939.1132294-43-maxime@cerno.tech>
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

