Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F11E59BB
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C296E4D7;
	Thu, 28 May 2020 07:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F266E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6FDFC581510;
 Wed, 27 May 2020 11:51:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=aGDNKgfbupEd2
 0uOVjJDSIqtW5LOwu8lX9eYl16fpr0=; b=op1qkriEu8zYCZLR8dUCyi21wN4gW
 oU3RkhbE+N+9HSwFyAuvWa1Og4/A/M8tttI6MmyT74td0GjXJ+zDQHizafhjYypa
 +N1eKXdLwX1gdXc3bn6ezi3z6Ftn1VXJob0TqcvMHhfID1K7otn1T2/Wj7oVU07Z
 PIaVeKjd72pr0KriFN2+h45USUTiFz7ZHqx6m+TqWUxX/5JKdwmOTd3y1XbJB0d9
 8VQ/9uVj/kCmjlamfIok8dzyWsxpnXyc3AQzoFu244dIx+5UvHTNlruapAqnHUfp
 ROO/8RaAwwrwl7jlQpYxPQ1GCy0j1sdF3pT2b84QClOaKH/wMKKWBQKsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=aGDNKgfbupEd20uOVjJDSIqtW5LOwu8lX9eYl16fpr0=; b=VRXxfC+f
 TfE3b0mCozxBK+B0CCM7oBX+QzU8iVUV5waHllvUZDpG7oBY9sHtqD6Vtdgd32sF
 3qJtVil8gcFp5NbhvS1s0v092QM5UVpd4uPSr+nUp1bHfFcYG5/hKNV1k9m1Q3Jr
 C/vppRRsaz/ryH8gP69GnxydIF5LdNiZme6nzSMx3nWM70aYEwYVAmiPTQJ+85Q4
 vL1VnvDCsUpI9G6dGHAONhhnd+KjgaN9MkTBYNYW40KWuInKo2T30gvXUvA3JYQM
 GHoerLOAul1nsxzLnZQJQyl3FNpEa9pHsJWvLqgIK1rr+cgutEblpfLAKN68+akB
 F/qC7PPhUB1+ow==
X-ME-Sender: <xms:hozOXlkHeLltD6mKafGuRBnL6MiFo9jksHtkRz0hZbUJoJ23f8G6Ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepieefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hozOXg0ztwryQZchw5eNPAx-0Qt9v4_urm0puEhKoAKI1Rn3babgNQ>
 <xmx:hozOXrrCOnWUswKrJD_-YDYlzb_g2MClsc3FlKj94PEOYR5zoR_EOw>
 <xmx:hozOXllxU8nHabz6JF3gDbvNVzNpFs5tBqWGmmf6lZnRsx3qyEhN4w>
 <xmx:hozOXomaNxseSHH5qLFHI1xODo_fANSk85mkoZQrRoTV7-Uk4WnE0w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 200C830614FA;
 Wed, 27 May 2020 11:51:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 087/105] drm/vc4: hdmi: Move CEC init to its own function
Date: Wed, 27 May 2020 17:48:57 +0200
Message-Id: <a054e42bfd4b913720d146b82e5aed1bb66b7dc4.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CEC init code was put directly into the bind function, which was quite
inconsistent with how the audio support was done, and would prevent us from
further changes to skip that initialisation entirely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 108 +++++++++++++++++++++-------------
 1 file changed, 67 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8a63ac3dd86b..7eb3cee25001 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1170,6 +1170,67 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
 	.adap_log_addr = vc4_hdmi_cec_adap_log_addr,
 	.adap_transmit = vc4_hdmi_cec_adap_transmit,
 };
+
+static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
+{
+	struct cec_connector_info conn_info;
+	struct platform_device *pdev = vc4_hdmi->pdev;
+	u32 value;
+	int ret;
+
+	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
+						  vc4_hdmi, "vc4",
+						  CEC_CAP_DEFAULTS |
+						  CEC_CAP_CONNECTOR_INFO, 1);
+	ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
+	if (ret < 0)
+		return ret;
+
+	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
+	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
+
+	HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
+	value = HDMI_READ(HDMI_CEC_CNTRL_1);
+	value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
+	/*
+	 * Set the logical address to Unregistered and set the clock
+	 * divider: the hsm_clock rate and this divider setting will
+	 * give a 40 kHz CEC clock.
+	 */
+	value |= VC4_HDMI_CEC_ADDR_MASK |
+		 (4091 << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
+	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
+	ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
+					vc4_cec_irq_handler,
+					vc4_cec_irq_handler_thread, 0,
+					"vc4 hdmi cec", vc4_hdmi);
+	if (ret)
+		goto err_delete_cec_adap;
+
+	ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
+	if (ret < 0)
+		goto err_delete_cec_adap;
+
+	return 0;
+
+err_delete_cec_adap:
+	cec_delete_adapter(vc4_hdmi->cec_adap);
+
+	return ret;
+}
+
+static void vc4_hdmi_cec_exit(struct vc4_hdmi *vc4_hdmi)
+{
+	cec_unregister_adapter(vc4_hdmi->cec_adap);
+}
+#else
+static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
+{
+	return 0;
+}
+
+static void vc4_hdmi_cec_exit(struct vc4_hdmi *vc4_hdmi) {};
+
 #endif
 
 static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
@@ -1247,9 +1308,6 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 
 static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
-#ifdef CONFIG_DRM_VC4_HDMI_CEC
-	struct cec_connector_info conn_info;
-#endif
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	const struct vc4_hdmi_variant *variant;
@@ -1328,43 +1386,13 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_destroy_encoder;
 
-#ifdef CONFIG_DRM_VC4_HDMI_CEC
-	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
-						  vc4_hdmi, "vc4",
-						  CEC_CAP_DEFAULTS |
-						  CEC_CAP_CONNECTOR_INFO, 1);
-	ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
-	if (ret < 0)
-		goto err_destroy_conn;
-
-	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
-	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
-
-	HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
-	value = HDMI_READ(HDMI_CEC_CNTRL_1);
-	value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
-	/*
-	 * Set the logical address to Unregistered and set the clock
-	 * divider: the hsm_clock rate and this divider setting will
-	 * give a 40 kHz CEC clock.
-	 */
-	value |= VC4_HDMI_CEC_ADDR_MASK |
-		 (4091 << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
-	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
-	ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0),
-					vc4_cec_irq_handler,
-					vc4_cec_irq_handler_thread, 0,
-					"vc4 hdmi cec", vc4_hdmi);
+	ret = vc4_hdmi_cec_init(vc4_hdmi);
 	if (ret)
-		goto err_delete_cec_adap;
-	ret = cec_register_adapter(vc4_hdmi->cec_adap, dev);
-	if (ret < 0)
-		goto err_delete_cec_adap;
-#endif
+		goto err_destroy_conn;
 
 	ret = vc4_hdmi_audio_init(vc4_hdmi);
 	if (ret)
-		goto err_destroy_encoder;
+		goto err_free_cec;
 
 	vc4_debugfs_add_file(drm, variant->debugfs_name,
 			     vc4_hdmi_debugfs_regs,
@@ -1372,12 +1400,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-#ifdef CONFIG_DRM_VC4_HDMI_CEC
-err_delete_cec_adap:
-	cec_delete_adapter(vc4_hdmi->cec_adap);
+err_free_cec:
+	vc4_hdmi_cec_exit(vc4_hdmi);
 err_destroy_conn:
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
-#endif
 err_destroy_encoder:
 	drm_encoder_cleanup(encoder);
 err_unprepare_hsm:
@@ -1402,7 +1428,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hdmi_regset.regs);
 	kfree(vc4_hdmi->hd_regset.regs);
 
-	cec_unregister_adapter(vc4_hdmi->cec_adap);
+	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
 	drm_encoder_cleanup(&vc4_hdmi->encoder.base.base);
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
