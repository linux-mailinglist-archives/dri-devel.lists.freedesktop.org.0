Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0F42F2976
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812396E061;
	Tue, 12 Jan 2021 07:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D514D6E0F1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:23:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C796580677;
 Mon, 11 Jan 2021 09:23:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 11 Jan 2021 09:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/Ad2iVRipXqGp
 pegZRIk/NN02smUVWPzBKu1TR5HnFQ=; b=Td5FadssRdQhvwyBlo6wGhrmqVkZE
 nW/PaYA90FEMY8v7DTG4qEXFhFdvbZg4PSZc9Er75jZupoFSR/+pXhvq8Nd0bixe
 H7y2Z5Xq2QH/TOfyAZQuBtLj/26lrdAMTnH0T+uEVUiH9R2TMGZ+Os0eMLYWO6EA
 Es2q+3HL9djApA5m8HfOYjxmsdXWCEMgxBSMtmAJLcvnUpjlskyKcOrso9f3cmFl
 vMoEdIeSFCT8RY5FXBkloUnQNY+i1brmHhk8H0lU2NRukG0UjKgItZLbmaoKtdu8
 bUZtdmXITtQlUq3iB+mlSn5WbPqGbXyA9keY9L8V4R9YTVUch2A7v6qUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/Ad2iVRipXqGppegZRIk/NN02smUVWPzBKu1TR5HnFQ=; b=LX0KE+bq
 FuEm6CrERboGUIgjlGoTZHND5zsW4uzvyELM7araoqepzvc+4Cdht7HHjpAFHyHU
 hBep5XAtukbkVtNrzz8bP4kQ93Sqquz+cBFDZSllf3Nhivn/0xnDZhSmSQQUR4ko
 FqJT7iI/YCWSH8G/4XPP1DXaMYfztP9FCher58UGixFZSvxJ7rR2MaSY0muxZdOr
 TzRLDEvxu6exUj8ie29zNHlCyUs8PInQuHiW4FHNeNotLJ2FY0+sVz211op7o/71
 5Hykf4yum+OPKfuY5raHA2g9vv7I39eP/x90awPWRIcaZSz9DF5oHIaMow70IBS5
 uW1hpYDqf6WWww==
X-ME-Sender: <xms:XF_8X_AWU3LgkLyx3LP1dwUwOtqsv1Idb7vwSPYq4Dhqj8-AOrAP-Q>
 <xme:XF_8X_luJjLnFl8TzF5JHK445Ov2yKkVNSDxFl1_iqYBLmJVWTvCNy99ggoYo_Njq
 z4aECV6Q96Fyf-llDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XF_8X_hBRyuIUxdd9SnDD-JPGGtSP680UAnKqS5qQr9Td7ryA1elgg>
 <xmx:XF_8X5jJKc2yf60HFqv0_dMe2r4i5MJGNvuZthryKL1at4SGXAxKeQ>
 <xmx:XF_8XxtZzyvKtlz_9jZtqlcxDqhdUliBsZOykrAvyKzkyrlg25DzFQ>
 <xmx:XF_8X4uLN9mJVWvBb9uXs-MSYUSdiMUutW2XjRFb0iaw4h_ggptbFQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E96F2240057;
 Mon, 11 Jan 2021 09:23:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 09/15] drm/vc4: hdmi: Split the interrupt handlers
Date: Mon, 11 Jan 2021 15:23:03 +0100
Message-Id: <20210111142309.193441-10-maxime@cerno.tech>
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

The BCM2711 has two different interrupt sources to transmit and receive
CEC messages, provided through an external interrupt chip shared between
the two HDMI interrupt controllers.

The rest of the CEC controller is identical though so we need to change
a bit the code organisation to share the code as much as possible, yet
still allowing to register independant handlers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 86 +++++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7b5c92df8f1b..12ca5f3084af 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1454,15 +1454,22 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 }
 
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
-static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
+static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
 {
 	struct vc4_hdmi *vc4_hdmi = priv;
 
-	if (vc4_hdmi->cec_irq_was_rx) {
-		if (vc4_hdmi->cec_rx_msg.len)
-			cec_received_msg(vc4_hdmi->cec_adap,
-					 &vc4_hdmi->cec_rx_msg);
-	} else if (vc4_hdmi->cec_tx_ok) {
+	if (vc4_hdmi->cec_rx_msg.len)
+		cec_received_msg(vc4_hdmi->cec_adap,
+				 &vc4_hdmi->cec_rx_msg);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t vc4_cec_irq_handler_tx_thread(int irq, void *priv)
+{
+	struct vc4_hdmi *vc4_hdmi = priv;
+
+	if (vc4_hdmi->cec_tx_ok) {
 		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_OK,
 				  0, 0, 0, 0);
 	} else {
@@ -1476,6 +1483,19 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
+{
+	struct vc4_hdmi *vc4_hdmi = priv;
+	irqreturn_t ret;
+
+	if (vc4_hdmi->cec_irq_was_rx)
+		ret = vc4_cec_irq_handler_rx_thread(irq, priv);
+	else
+		ret = vc4_cec_irq_handler_tx_thread(irq, priv);
+
+	return ret;
+}
+
 static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
 {
 	struct drm_device *dev = vc4_hdmi->connector.dev;
@@ -1500,31 +1520,55 @@ static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
 	}
 }
 
+static irqreturn_t vc4_cec_irq_handler_tx_bare(int irq, void *priv)
+{
+	struct vc4_hdmi *vc4_hdmi = priv;
+	u32 cntrl1;
+
+	cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
+	vc4_hdmi->cec_tx_ok = cntrl1 & VC4_HDMI_CEC_TX_STATUS_GOOD;
+	cntrl1 &= ~VC4_HDMI_CEC_START_XMIT_BEGIN;
+	HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t vc4_cec_irq_handler_rx_bare(int irq, void *priv)
+{
+	struct vc4_hdmi *vc4_hdmi = priv;
+	u32 cntrl1;
+
+	vc4_hdmi->cec_rx_msg.len = 0;
+	cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
+	vc4_cec_read_msg(vc4_hdmi, cntrl1);
+	cntrl1 |= VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
+	HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
+	cntrl1 &= ~VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
+
+	HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
+
+	return IRQ_WAKE_THREAD;
+}
+
 static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 {
 	struct vc4_hdmi *vc4_hdmi = priv;
 	u32 stat = HDMI_READ(HDMI_CEC_CPU_STATUS);
-	u32 cntrl1, cntrl5;
+	irqreturn_t ret;
+	u32 cntrl5;
 
 	if (!(stat & VC4_HDMI_CPU_CEC))
 		return IRQ_NONE;
-	vc4_hdmi->cec_rx_msg.len = 0;
-	cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
+
 	cntrl5 = HDMI_READ(HDMI_CEC_CNTRL_5);
 	vc4_hdmi->cec_irq_was_rx = cntrl5 & VC4_HDMI_CEC_RX_CEC_INT;
-	if (vc4_hdmi->cec_irq_was_rx) {
-		vc4_cec_read_msg(vc4_hdmi, cntrl1);
-		cntrl1 |= VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
-		HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
-		cntrl1 &= ~VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
-	} else {
-		vc4_hdmi->cec_tx_ok = cntrl1 & VC4_HDMI_CEC_TX_STATUS_GOOD;
-		cntrl1 &= ~VC4_HDMI_CEC_START_XMIT_BEGIN;
-	}
-	HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
+	if (vc4_hdmi->cec_irq_was_rx)
+		ret = vc4_cec_irq_handler_rx_bare(irq, priv);
+	else
+		ret = vc4_cec_irq_handler_tx_bare(irq, priv);
+
 	HDMI_WRITE(HDMI_CEC_CPU_CLEAR, VC4_HDMI_CPU_CEC);
-
-	return IRQ_WAKE_THREAD;
+	return ret;
 }
 
 static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
