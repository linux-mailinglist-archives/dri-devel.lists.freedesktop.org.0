Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AAD2F2963
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B999A6E07F;
	Tue, 12 Jan 2021 07:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046FF6E0EB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:23:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6E647580674;
 Mon, 11 Jan 2021 09:23:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jan 2021 09:23:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=h37ITJkzNT7pA
 1gj3B7YQ+gQTPP35jabwp2YfZchJeU=; b=HFolrEhMAetWvoOYhmVv+loLC33JT
 KjP43OYoxCU9+uWxCfylHBirHUD+gHGF+Crj2oTPDHJN/Wfrla+0jyFdGkIuTGVC
 /r2S5taI0uCgCFT4GRsGsnLqC+rSVCGnWykFo83TBBpSFLujJTT4MShGsixxiXh3
 l7L3xQG1VtXwqKyGPhaDm8h5rKuPwqe+AeBUXLgAjNwvDQ1yuCWZuTDjf68egvUt
 uSMMS7SHc+j54hfquzBb8aWXGaTDPZwgJhpIB93I+qisiCrwVjNqnh8OfLU3/dqS
 FMxrGSfNIw+IyYBuyYpgVfBOCDA/S4oJjmOqiyxXEpQiYWbKOWLDY3MYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=h37ITJkzNT7pA1gj3B7YQ+gQTPP35jabwp2YfZchJeU=; b=SdJayjet
 pX2hOXSgXTaRfwutKCRGOgQFp2WxCK+nubP1TfPNIqnhNG4GmU/RUZaehgWlyICm
 wb2ISOrp1mLhxBipe9PDb1sPvpvvkTEMF25MStLHpBWc3AJrzrzf0vnZmYmMK3ov
 BnGOQulQs1F2KP1XG0GgLKyUrDjek6rnp/Qk93r3M83dk44ryxCdPe66zluMCS2z
 gWKrFY223sem2/8QlHqb1l9hHTZh0OUWpIrAVDfSc1uu+/h8bMiT3d6K4n5PPwD9
 6AKyQEqJycKCXNIrwHgDF4QriaD9/7v3s2mL1yrOjWywR5wF3p7pG6FTtrLSY/xF
 4s/4UyLUk/UNoQ==
X-ME-Sender: <xms:WV_8X0FrFZ_fm-9OjuxvedPSe6w3WT1NgJi_kvidggrIomg4Qo2MUg>
 <xme:WV_8X2xGqOX8YEBM2EpNwfinAh_2Oz_gWL2P9kI-94uyhhKsJc8aAcTZk9J9elqm9
 mIurjyfSbkp2-mCTFk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WV_8X9tREdpfsZOcfGXfZO0x9ukJKpQeiaC8xrRgOfSDxprzGjzkCg>
 <xmx:WV_8X72vuVAQEKjfLipvf9BMj3ECrlkzSpyQ87wID_jIecRu1FT4rQ>
 <xmx:WV_8Xw-IXDbkCYGR0l6ideU5anvUkFvRs52El8Go2j28guHwHoUXeQ>
 <xmx:WV_8X7DPyYu9h6rVavGXYWoJ0DvUL3woDVU2DZ4GwiPC3wJD0WBw6w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1EC70240062;
 Mon, 11 Jan 2021 09:23:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 07/15] drm/vc4: hdmi: Update the CEC clock divider on HSM
 rate change
Date: Mon, 11 Jan 2021 15:23:01 +0100
Message-Id: <20210111142309.193441-8-maxime@cerno.tech>
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

As part of the enable sequence we might change the HSM clock rate if the
pixel rate is different than the one we were already dealing with.

On the BCM2835 however, the CEC clock derives from the HSM clock so any
rate change will need to be reflected in the CEC clock divider to output
40kHz.

Fixes: cd4cb49dc5bb ("drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate")
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 39 +++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 50008513edfc..0627b8db32f6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -132,6 +132,27 @@ static void vc5_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 		   HDMI_READ(HDMI_CLOCK_STOP) | VC4_DVP_HT_CLOCK_STOP_PIXEL);
 }
 
+#ifdef CONFIG_DRM_VC4_HDMI_CEC
+static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
+{
+	u16 clk_cnt;
+	u32 value;
+
+	value = HDMI_READ(HDMI_CEC_CNTRL_1);
+	value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
+
+	/*
+	 * Set the clock divider: the hsm_clock rate and this divider
+	 * setting will give a 40 kHz CEC clock.
+	 */
+	clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
+	value |= clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
+	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
+}
+#else
+static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
+#endif
+
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -770,6 +791,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		return;
 	}
 
+	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
+
 	/*
 	 * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
 	 * at 300MHz.
@@ -1598,7 +1621,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 {
 	struct cec_connector_info conn_info;
 	struct platform_device *pdev = vc4_hdmi->pdev;
-	u16 clk_cnt;
 	u32 value;
 	int ret;
 
@@ -1617,17 +1639,14 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
 
 	HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
+
 	value = HDMI_READ(HDMI_CEC_CNTRL_1);
-	value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
-	/*
-	 * Set the logical address to Unregistered and set the clock
-	 * divider: the hsm_clock rate and this divider setting will
-	 * give a 40 kHz CEC clock.
-	 */
-	clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
-	value |= VC4_HDMI_CEC_ADDR_MASK |
-		 (clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
+	/* Set the logical address to Unregistered */
+	value |= VC4_HDMI_CEC_ADDR_MASK;
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
+
+	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
+
 	ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
 					vc4_cec_irq_handler,
 					vc4_cec_irq_handler_thread, 0,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
