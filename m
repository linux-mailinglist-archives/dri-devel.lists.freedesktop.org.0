Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1BF54625A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B2512B0C9;
	Fri, 10 Jun 2022 09:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD4311B30D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 21BE25C01B2;
 Fri, 10 Jun 2022 05:30:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853441; x=1654939841; bh=L8
 FysLd5hzALL1AKdrURcr7bua00R2FdHjEaMfBLzz0=; b=pdAirbQ12q0bMA+49p
 0HovmE965qUVMtEhB6s97nFJ3KvJWeFkk6+ZNwS5wkcWa1V1r5+hY5tSHUOwGsCK
 A3Ll/JkPHZJK1FgYh0FoXLJ1o8ckavtGcAXe6CwEbn9Ps83my2wlIMpK5UMGhsfh
 aCkSkm8bkEcStOkLH908PklT2Pr1L7qs2v6c/9suIIi3xV1b1XfPVRQfKLFvdCvf
 ZtvCnAao1JWs3jjfIGjITRXkwzDhpcaxEOYQsM5kmIVLPptVqlYNvAFAG8Inm39k
 b5SE07lGKH6dOeavv7vHKE6rdlFKElu2k49d0nlb94BgGBq9Rk7oLpakuxwiOrOm
 hRfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853441; x=1654939841; bh=L8FysLd5hzALL
 1AKdrURcr7bua00R2FdHjEaMfBLzz0=; b=hzDMnwEYQvXJ5Q7/1ciCbdSc58vSv
 i2F8O5HTiFP3fDcGZH/I7lacqqT098DbUnZl+XtK2ZB3pC3mYjixz0Dw969F3JoR
 CYW6feuKDf3zzNM5XsxcNsRYHTH12VqRdEl7Sye0DItqE+KH/xAcmN8ulTejal7m
 lT5wkIeO1KAxkR1sfID3FK7842DWqe/JxgYfbduAUln7IM215lLyjJLCAJd2DdZQ
 OZtifNnjey0RGAj9CGkAylZQyim4elO8ayUoaJG7CO6IeE42h2gtiMpvqVZjF6Ci
 vDsSZ6go3as0M+tU5pB40KhlqOZ89JxRu1ug/o+YV82EquqF1e1TY+mVQ==
X-ME-Sender: <xms:QA-jYr-HUCEMVoTaArvPlMhY3LC_M8zQ7k0vBYWkvPTtz-sjFehL7w>
 <xme:QA-jYnuCSZe7w-scM0dabjiMt8HYR20MsGp81HCLlhvwdgeeZy-1aZUwV9W-xHIvM
 6cEYPhv-0omv_Y-gz0>
X-ME-Received: <xmr:QA-jYpBoS2DmwRk7U-YI22aU-BNsuhrTS5Ga_9dkBS1R14lLxHlk5Uile_VbEcKSnfJl7Hv0sMs7Ln-b_x9rUH9nGx9qOKrZHWAkJdI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QQ-jYndRsElyR-gyF7qksGq7wAoGOu1K69L9TIJtYv4Us6NDqXvZ3w>
 <xmx:QQ-jYgNeO1Fii_XvqT6ZIfcyCnOlgX5ElwjNssGAkYU1-gZuwTSxCQ>
 <xmx:QQ-jYplVaLL2rcwbX4ZPTX762UZhE0Gafc_cI0BfYf9KMH5QsDBq6A>
 <xmx:QQ-jYtpy5urkbdraYFzPv5IVPLPKK5ZywrIT1c-KzENOb8KbZOAkzA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 41/64] drm/vc4: hdmi: Use devm to register hotplug interrupts
Date: Fri, 10 Jun 2022 11:29:01 +0200
Message-Id: <20220610092924.754942-42-maxime@cerno.tech>
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
index ecc898684c4b..ca0bc8be3e6a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2181,21 +2181,19 @@ static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2203,16 +2201,6 @@ static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2994,11 +2982,11 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
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
@@ -3008,8 +2996,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_free_hotplug:
-	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
@@ -3020,8 +3006,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 			    void *data)
 {
-	struct vc4_hdmi *vc4_hdmi;
-
 	/*
 	 * ASoC makes it a bit hard to retrieve a pointer to the
 	 * vc4_hdmi structure. Registering the card will overwrite our
@@ -3041,9 +3025,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
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

