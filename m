Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84952F2966
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35D56E095;
	Tue, 12 Jan 2021 07:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576FB6E0F1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:23:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C0D81580679;
 Mon, 11 Jan 2021 09:23:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 11 Jan 2021 09:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=26f7j1fxvkXI1
 Pud0oRSJDYJpfzIdzL5X72cW8kRnn0=; b=ZZ3lTMhrDgsCMza5AXhPnwJuan+PX
 Cf1iXAhm/KUPgSWm3HsOVHRbk8/CNas8EABg/ZzHO8B0GaJXBj+qWz17oiHWD2C/
 5665yurtSIsMd3t+IGGZzAhXmqv/au4ERdjcjqwrknFJkAgb0RtSTvKhWSeuCHYo
 gu74fjXdnQtyAF9hy0BEkPCu29tFki0kf5mnSD49AHo0bCzOSQSLkOUuRaLUfgBj
 N2rmfkIauEbmlvuy9qnxfc3Oo3DCdDOQrnicU7UE5KTJYxNy4rB1A3+0W8QeQfKZ
 5js6wERAAGM/2cu+t5W4dAMgWHO8PgE5T0GWwJJptkRFaJDq5Ki9oYcbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=26f7j1fxvkXI1Pud0oRSJDYJpfzIdzL5X72cW8kRnn0=; b=UgdLFUf8
 wdFTOPXkCcoKx13rCGz3wGAlgruBZCGYSba1VoOn5WM7C0XPZ1R6sycX4mMx/Ecz
 7Ri7WcWia7qqMsPaSYLHCa3UkLU2dnYcQZnooOwt/s553dESheXPgJKCIeOAc7am
 k92Vp79q/1jg67+8OAWGacxCtclCxcR2rRui96+dvKka/txjWbXrU4sSF0f1d/vG
 ttQ7n2uhnhlWU2jASl1B6MuzWjBJinVSayYYM+vzzq4xRLLnFqgbhr8CFFIFyLzj
 eqUt/wwaVwOWgw8qJqAJzgX4SMCF3allmbOp3ePk0AtP712HJ2euNFnBFA6fkxqW
 pOTUHBURtijUmg==
X-ME-Sender: <xms:XV_8X30fC7h9vgV2BVQtDWqWSvHtU3J-j9QBfCAruKjQgN_f8_HBTQ>
 <xme:XV_8X2HSOBDn0CqwO7invK0CmOm_EHdjB5wwBYf2zk62OwDi4HTEjAYNwalKH5vih
 R8xDTz2wzNOZ8p9hXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XV_8X34RAfzovMxQBuCao_hmLM_LjwJR0wvml60mm0aJDwTQ7XWpGQ>
 <xmx:XV_8X80SN-tIpFyN4kWlUj80jVFvAY7HFr5QmXov-HczJLNi_8QfLw>
 <xmx:XV_8X6HzlvgFBmxOcSl5d6FqmrqhuK_VO5jvrEQAyFyk5OBsapFeHA>
 <xmx:XV_8XxfUrTeDOk2aM5HRxOSdbIuWRCknDMmiAtwdS_qmOnfE5pWNyw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54CC324005D;
 Mon, 11 Jan 2021 09:23:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 10/15] drm/vc4: hdmi: Support BCM2711 CEC interrupt setup
Date: Mon, 11 Jan 2021 15:23:04 +0100
Message-Id: <20210111142309.193441-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI controller found in the BCM2711 has an external interrupt
controller for the CEC and hotplug interrupt shared between the two
instances.

Let's add a variant flag to register a single interrupt handler and
deals with the interrupt handler setup, or two interrupt handlers
relying on an external irqchip.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 42 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  7 ++++++
 2 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 12ca5f3084af..d116ecfd8cf7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1605,9 +1605,11 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 			   ((3600 / usecs) << VC4_HDMI_CEC_CNT_TO_3600_US_SHIFT) |
 			   ((3500 / usecs) << VC4_HDMI_CEC_CNT_TO_3500_US_SHIFT));
 
-		HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
+		if (!vc4_hdmi->variant->external_irq_controller)
+			HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
 	} else {
-		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
+		if (!vc4_hdmi->variant->external_irq_controller)
+			HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
 		HDMI_WRITE(HDMI_CEC_CNTRL_5, val |
 			   VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
 	}
@@ -1682,8 +1684,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
 	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
 
-	HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
-
 	value = HDMI_READ(HDMI_CEC_CNTRL_1);
 	/* Set the logical address to Unregistered */
 	value |= VC4_HDMI_CEC_ADDR_MASK;
@@ -1691,12 +1691,32 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 
 	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
 
-	ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
-					vc4_cec_irq_handler,
-					vc4_cec_irq_handler_thread, 0,
-					"vc4 hdmi cec", vc4_hdmi);
-	if (ret)
-		goto err_delete_cec_adap;
+	if (vc4_hdmi->variant->external_irq_controller) {
+		ret = devm_request_threaded_irq(&pdev->dev,
+						platform_get_irq_byname(pdev, "cec-rx"),
+						vc4_cec_irq_handler_rx_bare,
+						vc4_cec_irq_handler_rx_thread, 0,
+						"vc4 hdmi cec rx", vc4_hdmi);
+		if (ret)
+			goto err_delete_cec_adap;
+
+		ret = devm_request_threaded_irq(&pdev->dev,
+						platform_get_irq_byname(pdev, "cec-tx"),
+						vc4_cec_irq_handler_tx_bare,
+						vc4_cec_irq_handler_tx_thread, 0,
+						"vc4 hdmi cec tx", vc4_hdmi);
+		if (ret)
+			goto err_delete_cec_adap;
+	} else {
+		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
+
+		ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
+						vc4_cec_irq_handler,
+						vc4_cec_irq_handler_thread, 0,
+						"vc4 hdmi cec", vc4_hdmi);
+		if (ret)
+			goto err_delete_cec_adap;
+	}
 
 	ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
 	if (ret < 0)
@@ -2095,6 +2115,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 		PHY_LANE_CK,
 	},
 	.unsupported_odd_h_timings	= true,
+	.external_irq_controller	= true,
 
 	.init_resources		= vc5_hdmi_init_resources,
 	.csc_setup		= vc5_hdmi_csc_setup,
@@ -2121,6 +2142,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 		PHY_LANE_2,
 	},
 	.unsupported_odd_h_timings	= true,
+	.external_irq_controller	= true,
 
 	.init_resources		= vc5_hdmi_init_resources,
 	.csc_setup		= vc5_hdmi_csc_setup,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 6966db1a0957..d71f6ed321bf 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -64,6 +64,13 @@ struct vc4_hdmi_variant {
 	/* The BCM2711 cannot deal with odd horizontal pixel timings */
 	bool unsupported_odd_h_timings;
 
+	/*
+	 * The BCM2711 CEC/hotplug IRQ controller is shared between the
+	 * two HDMI controllers, and we have a proper irqchip driver for
+	 * it.
+	 */
+	bool external_irq_controller;
+
 	/* Callback to get the resources (memory region, interrupts,
 	 * clocks, etc) for that variant.
 	 */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
