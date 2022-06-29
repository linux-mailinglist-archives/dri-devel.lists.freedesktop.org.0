Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AFD560021
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1FD14A647;
	Wed, 29 Jun 2022 12:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7550814A637
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 43ED9320016F;
 Wed, 29 Jun 2022 08:37:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506245; x=1656592645; bh=rA
 cqYZbj7jMGyZTwhBxfUhXNdIKPUB/nVysVoLIhzfQ=; b=M5typMSmoFG6ipowJi
 dWii+2rigBQK/2uoC7C/oX4dZgOE+skn0yXD/IMivgA+k3WCQUwXNHECD4J9MEul
 TK1HszlSCBi3f+ODzOIx6ohr2voZHV94QpIbO/ZSo/4AxBmKdFiklK+3DyvYoK9v
 7KDD1ZlV4Qd0fO3/Se1HEiRejbO7ylTiaeyJIOKF1Ab0LljoPt0WxkDuXVywrXRM
 XjA1rsOa30r3FO/jAXtBuwhw2q8z95+hVOXWUMM48Uwi07EaEHCG04vElrkl+XDO
 Xg0Fl7B6XzBg9X/P3Ddsf7LzjPmuGjHg/NKy3DjWl7cn80RfBccP/NkoxXNKbxQV
 h5hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506245; x=1656592645; bh=rAcqYZbj7jMGy
 ZTwhBxfUhXNdIKPUB/nVysVoLIhzfQ=; b=je088toDRe1517ky6BdKPMM+DoF+4
 hU9p4ibbZ3y85pRT7NeuXcSoLnc2YMisJSKXNyyrs6W2TgELFRslytG5S5v/6r3v
 g369yh8A9tO1MsEwIfIvDPZFdIfjKiQWqg7lt6GCmSgoi0v2n7K+JOicViBPsTkn
 PhHFx75gEmb3fz/6Y2zktnf5qBN6hpuyalpTv7rH01omKBzxIvyRSNsp/AtJ83xD
 xdOkkVcfjfclwAGVunQDM4hSLR7L/I45pi8QhM9MpnPF68c3JE4vlHvcBQXc2dQ3
 fuzZWAUZHnHUC8bJrWRrs3mdeQODRyk7ux36Fqkk3W40T01VHt66Nxj6g==
X-ME-Sender: <xms:hUe8YvnMRZYJsVcEk2G0tzMSHZldScjXDumkC3FvmLnUCb5SfeV0wA>
 <xme:hUe8Yi0YYt0JjlN5llQo-x5I9JAHjhDhzo5C1FW0zafwh2YPdsVPXw-Rm27Yrc4jB
 vArb5sSAenzXGjH0Vc>
X-ME-Received: <xmr:hUe8YloRWavL4LWkF3LPvjl2NB_zYSYJuKrNc1yW4XmLBpUL1sPnefg55cjOyMKXIPi0n74-igk1KiyLDz6bb8CjJMsS0KdZN15kGi8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hUe8YnmrXkoT1FsqxnFrvBU7QOXiru8Y7CJLQ1kNcAheU1v1xNmmeg>
 <xmx:hUe8Yt18LfZYmSDgkK3PFHu1oR6g0DDf1C1QDYMKmsfW1FbiCxV-1g>
 <xmx:hUe8YmtUL_KtKQ46qBRAr39nrvfRdJUwodo6IgxLyumi8eSXfX7sSA>
 <xmx:hUe8YoTh133gN9A9xSsYwG2arhcOhYAzryNPcQg9BA30lMbVNNEy_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 44/71] drm/vc4: hdmi: Switch to device-managed CEC
 initialization
Date: Wed, 29 Jun 2022 14:34:43 +0200
Message-Id: <20220629123510.1915022-45-maxime@cerno.tech>
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

The current code to unregister our CEC device needs to be undone manually
when we remove the HDMI driver.

Since the CEC framework will allocate its main structure, and will defer
its deallocation to when the last user will have closed it, we don't really
need to take any particular measure to prevent any use-after-free and can
thus use any managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 94 ++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bf7d56bbcba0..83ca1c02dde2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2576,6 +2576,14 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
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
@@ -2600,70 +2608,71 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -3039,7 +3048,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vc4_hdmi_audio_init(vc4_hdmi);
 	if (ret)
-		goto err_free_cec;
+		goto err_free_hotplug;
 
 	vc4_debugfs_add_file(drm, variant->debugfs_name,
 			     vc4_hdmi_debugfs_regs,
@@ -3049,8 +3058,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_free_cec:
-	vc4_hdmi_cec_exit(vc4_hdmi);
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_put_runtime_pm:
@@ -3092,7 +3099,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hdmi_regset.regs);
 	kfree(vc4_hdmi->hd_regset.regs);
 
-	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
-- 
2.36.1

