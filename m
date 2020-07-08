Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C437D21992A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4B86E9DE;
	Thu,  9 Jul 2020 07:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A756E909
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 182B2FE4;
 Wed,  8 Jul 2020 13:43:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=5fospLCfj2jIx
 rFLw5W1VG9dCvGpHk+9x5EoX9vZygI=; b=WiLhLH/qjiDZd+D/xlTP2BMo3n7Ll
 1sd8P4TpSnlWsGejuWsrf5UNAsnznyFIaiQHupX7NriRK++knBfhImUS22+sJMcN
 wtpyKAx6GqrlVKrTGfGXqzKn2j5GWET41LKJqUHHTxi6Qt43T8K1SCOG1JYLd2x+
 AoSMuN5Zob8QT1mFKbL0hWxmCgnfzGcqQbt699x4aQdDSZqJelf8IMxB/8H0jE0t
 Fkh1YCfzDwegNQlpU12rASNqeLycHEzIfiC+FhJUPEnIN8FcXzo/cBJFivkp0A1l
 LbqtsGCV8AZR7jVuDWIX5XcP0O7EZw4+zo/N8MBlgSwkC83sWXK97gwvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=5fospLCfj2jIxrFLw5W1VG9dCvGpHk+9x5EoX9vZygI=; b=IgQOFyL6
 iJhIo+H9smb3U6G6rBwnHZu8VH85Cf7rEQGZvXnQ1kBBsAS/p9Bu9O8j/+MhTDJo
 ibjVElfO7c0trfZiTcv37Qe1MvUdqcjOBeiR6qDpGUzvTohqtCx1grqhoKf30/uf
 U0RLNAB189RZeQxQRDWAKBMIw5Q7ZA45HhMDJFXdagbIt2xPHfje4UmEPCjkV1JE
 dr+GRRHySkuoY4ntrXqMfUQBdieIDf9Md+zy6Rf/VCC9oYLtqZJNH/QUxv12C6FU
 2jhzoSrwVG70ZTHeoD4N8qO2lErduOZcqSMQT2TbjSZD4NDkzzdUTSXOrOKzxVAd
 SZV19SxheuPCvQ==
X-ME-Sender: <xms:2gUGX2D-HQ1AqIQ6Bn6z06ZHjTLLOU_ADntB-RFnh5bqvDivPitAaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2gUGXwirxZCINVHleWbdMs2EDJHhB0fRgujpRjU-99521zi3Sfn1og>
 <xmx:2gUGX5lak8551ivoZCypcYTmdZKH9j2rEFMEc4W1D2Gr1lLeUO5rgA>
 <xmx:2gUGX0x1EtCv2Ykn6iVjdg1XZIyL9MCA_f4kk50Iwn1A6dfl72JB0g>
 <xmx:2gUGX0QHkL-p2pqEFoI4YLc-MuBBfaZkUuAm7fyU27cRZrPRlEfOEsKxut8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55E7D328005E;
 Wed,  8 Jul 2020 13:43:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 58/78] drm/vc4: hdmi: Move CEC init to its own function
Date: Wed,  8 Jul 2020 19:42:06 +0200
Message-Id: <1b459f691ed99dcae2cea07e23ec1f5dd39837be.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
index ef51eedaf75a..8cd08b541c14 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1171,6 +1171,67 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
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
@@ -1250,9 +1311,6 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 
 static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
-#ifdef CONFIG_DRM_VC4_HDMI_CEC
-	struct cec_connector_info conn_info;
-#endif
 	const struct vc4_hdmi_variant *variant = of_device_get_match_data(dev);
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
@@ -1332,43 +1390,13 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
@@ -1376,12 +1404,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
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
@@ -1422,7 +1448,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
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
