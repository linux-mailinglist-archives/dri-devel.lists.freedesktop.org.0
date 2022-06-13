Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7565485D6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78C310E843;
	Mon, 13 Jun 2022 14:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF5310E843
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 311E93200926;
 Mon, 13 Jun 2022 10:49:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 13 Jun 2022 10:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131756; x=1655218156; bh=a4
 ZIdLYnOFghKmCb+Yo/w1WeRHOfJ5AyZtGAmvSFgP4=; b=TUWrGFNQJS9owYYOam
 unOJDl+jfPVD1FKXhj3WREagsrMNdF2B+gP91R4Z6AJtQqPEJ2PqYSmbLnHMH17s
 d5lkRT3Vta1y1agHvehhcgA1XuoxvYdrFyzZMxS4Aqn7eRH3ya0cVHCIOk4Cr67S
 1xsQbdUEWCbULiu3VIUpPUFcIMqfYOF8bg8vkp37IRQ0a+5f2bzybw8HXIrtR9wx
 BQ6S3YAc3H8oXpoXQve1zdbUv2g512oaS3uiMiQi+aJCtlN6y8EcmM+BY3VVyGR5
 Jh0r9Zxx9C0SeIzJkLMXPmUc1Try+Rv6lN3VUFGmgnpdDwIXxKan0ORW1fNvkKra
 Dxsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131756; x=1655218156; bh=a4ZIdLYnOFghK
 mCb+Yo/w1WeRHOfJ5AyZtGAmvSFgP4=; b=YEk+oz2x2xDQBbrsQ1B/aKZPTHXnZ
 u/yfBSDYSJZetCznFH6uQLZFQb8GnfZGnW1yACYEW1xJj/CLaZq0HiGKTsMW4ird
 KYAwz234gslRYckGyzsM2XQNwqIMJ9QaZ+tsHEajM2JgabNRf+YSL6hLh3Opnm7M
 U6IhZUBe9XfnniBj/F8FH2+4KdI6hF/mSVam3rpfZqJcLBt312u4owQBNWN1hGNA
 H4Rqkq0V8BpGkSvRlVfKqsV6F9XCf23Au+HQGzkNc6NbZDitWuC6sS9kTP47fBMH
 /n4A5Kb3aPtZLlfW26l+xQGz2MhZgWS2pmyy7eBk26pyCelRe/MpM2K1w==
X-ME-Sender: <xms:bE6nYvGcLTKxnr-MFXe4gisnmSoB6j6rYNU2Rk9Nizus5YBHtXjd5g>
 <xme:bE6nYsV0jkxIiBWBRJWRYb8vUBAiKH_Yvb-S4_-l6K86C7qk8scmDjUVxqZZuZi8l
 OTLeVAAp7xuU9ygEUo>
X-ME-Received: <xmr:bE6nYhIOjQhfB-NfZp-d66dDbJ--_eUuJ1XUvomD7jfV2DvITGM7JvdVgcIEVXJJa_G2bLHgX6Zp3x3_6nEBSWp8wbuadvUTZZO9KIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bE6nYtGVLjjl8xW9w7dE1_jcf2mSgMFr3pxlEkCaaVT8Y0TclVLwMA>
 <xmx:bE6nYlVUX12nAqhK0fJgY33cShnUbifiHUPJdU-ldv9BLx_8q0o3dQ>
 <xmx:bE6nYoPinVw8_sIxc0i2JXKKChqVVQ62kQMWimEHKYTdcM9yQFxs-w>
 <xmx:bE6nYjfu8xEoSO7qDfOmrvQP2o6aau8D4G6y2nq2cDz54BWpfUN3eg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 23/33] drm/vc4: hdmi: Move HDMI reset to pm_resume
Date: Mon, 13 Jun 2022 16:47:50 +0200
Message-Id: <20220613144800.326124-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The BCM2835-37 found in the RaspberryPi 0 to 3 have a power domain
attached to the HDMI block, handled in Linux through runtime_pm.

That power domain is shared with the VEC block, so even if we put our
runtime_pm reference in the HDMI driver it would keep being on. If the
VEC is disabled though, the power domain would be disabled and we would
lose any initialization done in our bind implementation.

That initialization involves calling the reset function and initializing
the CEC registers.

Let's move the initialization to our runtime_resume implementation so
that we initialize everything properly if we ever need to.

Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable to runtime_pm")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 41 ++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8142efa2d479..654c4116b669 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2543,8 +2543,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	struct cec_connector_info conn_info;
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
-	unsigned long flags;
-	u32 value;
 	int ret;
 
 	if (!of_find_property(dev->of_node, "interrupts", NULL)) {
@@ -2563,15 +2561,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
 	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
 
-	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
-	value = HDMI_READ(HDMI_CEC_CNTRL_1);
-	/* Set the logical address to Unregistered */
-	value |= VC4_HDMI_CEC_ADDR_MASK;
-	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
-	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
-
-	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
-
 	if (vc4_hdmi->variant->external_irq_controller) {
 		ret = request_threaded_irq(platform_get_irq_byname(pdev, "cec-rx"),
 					   vc4_cec_irq_handler_rx_bare,
@@ -2587,10 +2576,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 		if (ret)
 			goto err_remove_cec_rx_handler;
 	} else {
-		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
-		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
-		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
-
 		ret = request_threaded_irq(platform_get_irq(pdev, 0),
 					   vc4_cec_irq_handler,
 					   vc4_cec_irq_handler_thread, 0,
@@ -2641,7 +2626,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 }
 
 static void vc4_hdmi_cec_exit(struct vc4_hdmi *vc4_hdmi) {};
-
 #endif
 
 static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
@@ -2870,12 +2854,34 @@ static int __maybe_unused vc4_hdmi_runtime_suspend(struct device *dev)
 static int vc4_hdmi_runtime_resume(struct device *dev)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	unsigned long __maybe_unused flags;
+	u32 __maybe_unused value;
 	int ret;
 
 	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
 	if (ret)
 		return ret;
 
+	if (vc4_hdmi->variant->reset)
+		vc4_hdmi->variant->reset(vc4_hdmi);
+
+#ifdef CONFIG_DRM_VC4_HDMI_CEC
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+	value = HDMI_READ(HDMI_CEC_CNTRL_1);
+	/* Set the logical address to Unregistered */
+	value |= VC4_HDMI_CEC_ADDR_MASK;
+	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
+
+	if (!vc4_hdmi->variant->external_irq_controller) {
+		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
+		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+	}
+#endif
+
 	return 0;
 }
 
@@ -2965,9 +2971,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	if (vc4_hdmi->variant->reset)
-		vc4_hdmi->variant->reset(vc4_hdmi);
-
 	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
 	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&
 	    HDMI_READ(HDMI_VID_CTL) & VC4_HD_VID_CTL_ENABLE) {
-- 
2.36.1

