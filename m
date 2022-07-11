Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C930570931
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E8790325;
	Mon, 11 Jul 2022 17:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5418090343
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A80965C006F;
 Mon, 11 Jul 2022 13:40:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561259; x=1657647659; bh=Xx
 t215AFiNT8gG7pGzaAX2NF08/liZMw8E6QmSKTFCE=; b=NlaukrVg3lgZsgXqi0
 jqpldzRgsnWVLGDve1mA3zmXvxQTU5d4ZW4ISf2ftPQp7GTHNwb4gAD2l9u3he3a
 yYpC2R6u8tMbkQZgTxA5cODNbHVATac2tJ18sAGNWZAqND5B0wEyk1VoWstdpdJR
 siSJ8x5eQqOFNdk3lSqpY5PdVHX0g9Jwc5LuB2Pw7N8myfI2UUzXiZkmXA3JxTsm
 Lycvddk7KzCt2D/h+JlOZdpiJbXKotrirfAEKRc34fM9wuUHxLXEXATEzdR51rHf
 EMzXf7wc4ftiP65ZuQU9pb0b7TODlLnwn6JaIYwpy26tE0oaHbURYTIZrH7OUlTr
 EEvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561259; x=1657647659; bh=Xxt215AFiNT8g
 G7pGzaAX2NF08/liZMw8E6QmSKTFCE=; b=y9Zj4ydnaIRqdK13mcodYj55GNWtP
 cCDMowadU59vvgcLPltnkSD9dmJLh9nHmSOJtFgyIMJzwh2+5BUecOXg5Ai5mJlh
 tsfEMVFUtiOJATHh4VdmT3BHL53wSc767IJWqsqeXBZ8gnbtjtRbLk3W3H9AzQRl
 bgYxbBU5HL0Ebto5qMacMm5wMmsVQaiAacneOuG+Sxk6+4w7zJcc5CqF5HkhBJmw
 R3LmGHU3UYViVmiBzMYR9ORITsy/hkYoiWnDIsXLv3T9erxp0gX87r4W3TXmIXue
 DP+KvvCZyY/okEmLV+9OvT9LxrklwGm8zOF6CnbpmgkMhWWUKpIRfqT8Q==
X-ME-Sender: <xms:q2DMYgnJE7RdLr1B4lVRSRoRojBoHRhuEcIsNCzLSZpa7HK55kHjjA>
 <xme:q2DMYv3KTN2CNeZ3Rg6zwR6CCVaAr12X3g_p87yXmGA6NEelyCfDN2RV-Ri5-bvL1
 5gb6bF1HSx5_pz7a-A>
X-ME-Received: <xmr:q2DMYuoTrraEG5MdZoROtD0Kbx3hsDiSeQ1ClIF_5YFbf9lY2hYb0NhzLSfGLIT4rrvUaWQb7BQdGamMiAMBCK6B9XDp12oimBIoFBk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepudehnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:q2DMYskinrrkL3IDfRUDcjZA-Epsm1LwSc7F9_MQfNUQPGTv6oUCRg>
 <xmx:q2DMYu0pJSTa7mD6rY5mObgvI-0W3MULRVq-gKQGR-eoHCB34s1G8Q>
 <xmx:q2DMYjtk4HTnSJa2v1IBzoRIoQjqNxyeWZINpv_KU4BvLzlavucimA>
 <xmx:q2DMYhRfssqE4JmuYzNJJCd9I6iaS5IIC-1vwH6vXz3G7oMkYtOn1A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 45/69] drm/vc4: hdmi: Use devm to register hotplug
 interrupts
Date: Mon, 11 Jul 2022 19:39:15 +0200
Message-Id: <20220711173939.1132294-46-maxime@cerno.tech>
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

