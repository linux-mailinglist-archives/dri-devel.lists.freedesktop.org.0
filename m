Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3CE560022
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8043314A64A;
	Wed, 29 Jun 2022 12:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2852214A638
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id EA542320096B;
 Wed, 29 Jun 2022 08:37:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 29 Jun 2022 08:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506254; x=1656592654; bh=Ty
 7f3UAtcPZ+3dmn+cT8rSlL/4ZPC5n88TGaue3/NiY=; b=0jaxH89aRr5Bwr54ug
 DcHR4OwHqwplulr3Nd3pJJvbzL9ktNCjPsfDK65OdXhVkDxGXRLbra7KtvtfPO9b
 lKjouMlqSIMm3otNCJHsy8ja/9snwAGv5bVqtl3e5H5nzPOhyvco+OCI+E+4JTF5
 hgkvn2UR9xI8JNHpe0oBpFh4ZK+y5jFmk96zOlhTDDqF7Zhxtkjo32Ex155Ax3F0
 +qWJg2BdmrzECrobOwqF7YnzyKTbB3ZttjmJe9C34jSngnlIUiYlGT/boNek9Z06
 XxLO6HcKPSEugSfbXY6+qlbxIL+TyopYaRpdCq28F5Om+DIepyReltcc+AFpOAWG
 5+QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506254; x=1656592654; bh=Ty7f3UAtcPZ+3
 dmn+cT8rSlL/4ZPC5n88TGaue3/NiY=; b=AVznSrgGeXNFw+w9eZZTUj/dVaFOJ
 AvCRkwNN51zvpy8duoydO7u13NNH+aQEZyiY4upEil7XvP7Z1IqESmG4pkp747t7
 MD65sy+41ZVlWLu50IUSZVVMPI+xO5hhwnct2FusbMl6pOBNaKDF6WloD99NgexC
 DepPcJXeSTIM3TZyO+wTKNSnavwz6sswTdWZqvUXJsHX/fH7uoHNE+J3ROS2CIxt
 evZjEqZsTGt/yNw3u1exlWLy6siXtBvCCdwYdhPYqgyuyC8aYL6EIBC7JgHAHaDD
 hiGty/ULyEb2+5QdIl3g7/EKK8gsYtxIR1GS+GNiIWy8GT9ZY9bUcp9zw==
X-ME-Sender: <xms:jke8Yn2L2LSqJvKWnOPoDMVV7GHYaaJLzU2V4fjdkSsLcujASxtjZg>
 <xme:jke8YmHOt9KPgLH47cJkQVWRvUFKrjZAxNef77BSAAAHBFCuVflD0348eBfeZGgz_
 m7aEhifzTgIiXXMA_I>
X-ME-Received: <xmr:jke8Yn5dejKMqcpoJN1lSJAVHtKt48ILJCxtEBCVyJFvXzBibwNqflqbq8Pk2IHiS5ZiUbnU_B7Wi2GivQGPY5IRoYxnnmHNWGjBaVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jke8Ys1uJCcLxYMf6EasROIFBzXlW6GG8YmveSKO2wwp85t1VmPqCg>
 <xmx:jke8YqEfT41E646wpjVfw0NKCYmjwXwIPr5fGBTFcwK6nqdJdf7tOA>
 <xmx:jke8Yt-5bYjLvLKI-K8tBfm0jdsHqGeVnfNmg7CHb7R4o6kkcLhaRA>
 <xmx:jke8Ymi09PDt8rxGX__L3VHuM076qGFVxhA9ov9W60JOCTITzXsvGA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 47/71] drm/vc4: hdmi: Use devm to register hotplug
 interrupts
Date: Wed, 29 Jun 2022 14:34:46 +0200
Message-Id: <20220629123510.1915022-48-maxime@cerno.tech>
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
index c93100fe4b42..6275db463afd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2216,21 +2216,19 @@ static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2238,16 +2236,6 @@ static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -3069,11 +3057,11 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
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
@@ -3083,8 +3071,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_free_hotplug:
-	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 err_disable_runtime_pm:
@@ -3096,8 +3082,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 			    void *data)
 {
-	struct vc4_hdmi *vc4_hdmi;
-
 	/*
 	 * ASoC makes it a bit hard to retrieve a pointer to the
 	 * vc4_hdmi structure. Registering the card will overwrite our
@@ -3117,9 +3101,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
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

