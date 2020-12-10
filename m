Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF62D5E78
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9066EAB2;
	Thu, 10 Dec 2020 14:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C0A6E530
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:47:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 060F642D;
 Thu, 10 Dec 2020 08:46:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Dec 2020 08:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=GnMDKUbYk1SWY
 yZetGWDdJskWJOGEDSUZizDVtCEfAo=; b=Omnj0xdM/OiaRxShbBIW4aFeaaRa9
 4Ib3cLiJ29OyceCsrvFP3eiRNZcs/HPszUD9/ukJXiP0IlEJs1+DnOOQ4/N6h1Sp
 r4fsXDlMxqdyIx6laZwxMUfgd5N80E2wbBdQHgLp7gNiraOJvOLwxth4kXW65jXD
 VPGDXTayRawqTjX144lJMvDsQmbCEknYNNeY65MrHtBEs5lny1wFoLMUMpqlqmWC
 TXX6aSLY1SuuPHCSfjf54hBoi37X6AxP8EwGZJaJ8gEXdg87CQkYnHRImXL7e1kY
 kr3klWULgU7IxDcLA/TxVE5tmBe57+edAHA00Tgc3rz9OjpsRFrMyTPRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GnMDKUbYk1SWYyZetGWDdJskWJOGEDSUZizDVtCEfAo=; b=gCa43CV7
 uj4WkRzFvbg5OzFv72wwcYqk003p3HQElHwH82Kc8IesIE1HOdD57EU/7fTofamA
 zKaR95/2Jrli7RrZWfP0IRqWY5aMid1jIAa9w1MgQkIAFvy3LhzR1BtcrKHkGC3o
 4bc29xBEuzYPd002RNr2eDlGTAy/eDbWQZ0RAJMGgIXpMWd6aNMD2pIUPKDUiPKo
 cdTRYox5otctKooC0zstwIthlMpFltI91KKDBVX90CMhUQWXbxUVvQLp4R7DV0Tk
 VjhZHOOBafwCXCQb4p7VnR8iXZuIuk5adn9ooYwdEGaeG/wZQm8iYkHJ0wNBQrlo
 gPsXzMn017OOYg==
X-ME-Sender: <xms:0ybSXx6d5_y_03w-HRxg-Yc1D3m5aYCRtXiP-JJUmTi3ytPCtEccRA>
 <xme:0ybSX80hqPdTLNee_m6iot9jwRnIN7rMfgdck1mHJzZUkmY9vJmezZE_OkAUPdT_D
 V6D2vLp1SjQ1ywnxhY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0ybSX6zTYWdZCBOezOwAJddd0q1Y4yxquYLfPkK2bxotiOolNvb19A>
 <xmx:0ybSX-sCJ3wPqozOnHu5ypsps-LMuSVIlSj0LPFjtiusgNijrKMo-w>
 <xmx:0ybSX8zPzEeXZA8oYSq0C05eWuOtIrTA0S-xvm7K5DloQZT3kDpbHg>
 <xmx:0ybSXyhQ0JriouV5tjpCS48WGd8pmOW797XTrEPjmo4PVx0g1nnQw8qiGYE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 66AF81080059;
 Thu, 10 Dec 2020 08:46:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 07/15] drm/vc4: hdmi: Update the CEC clock divider on HSM rate
 change
Date: Thu, 10 Dec 2020 14:46:40 +0100
Message-Id: <20201210134648.272857-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Thomas Gleixner <tglx@linutronix.de>,
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 39 +++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0c53d7427d15..b93ee3e26e2b 100644
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
@@ -761,6 +782,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		return;
 	}
 
+	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
+
 	/*
 	 * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
 	 * at 300MHz.
@@ -1586,7 +1609,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 {
 	struct cec_connector_info conn_info;
 	struct platform_device *pdev = vc4_hdmi->pdev;
-	u16 clk_cnt;
 	u32 value;
 	int ret;
 
@@ -1605,17 +1627,14 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
