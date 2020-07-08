Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5C8219932
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4A56E9D5;
	Thu,  9 Jul 2020 07:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C636F892ED
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D4D4D10A4;
 Wed,  8 Jul 2020 13:43:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=zFJHZQUTy1bnY
 gAlf5FgTQ/rrMfeSejtTuATKfAIljc=; b=RqLbJIcuKW/eO/qNSvs2YT/BL/mun
 +05zOklUcWsC6pMQksD780TqCTrCKjF5uoicjh9crC9C3JtJK0i4TZ8a72Aqyf4H
 8tviz13KT5BTmR7AaMyis4t/HnJV8XwKu0cOMKIxB+EgDesn/j7KsLOfJ5K55e9c
 mmPyHn95xjcKSaKFN9sUIkbwGcyxWqt9mfYTpJ/fZGKVzA6qXgUpbmQfpO8fOTm8
 oQpqDZIbOwK4Q89VTDHW2zHdWsZmVxoBOlgewymo/FLruZTpwO0UUMQWZ9YIyg4f
 S26GpersvxdRUTc9tzR7TSXURk7iNhU1gDE2Qo0TW2cuxkGcdaGQkq3nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zFJHZQUTy1bnYgAlf5FgTQ/rrMfeSejtTuATKfAIljc=; b=d6PsKOF9
 K+8uprWGJK3CFQU8k+Sz9Hvbn97bAIsmMOh+YNqXOGfDB/DjzUjhXjyDzAtn0vAK
 92/fQbgS7xWV1nVAHLQVAQQkaJX19u+Q7Hm/JR7vyUBSasH7eQBfEUdyLqVAk4Gp
 FUMEN0ddgrWUaxnyOaK48Vhi+7eI1U7vjuim8NTqEg3dYnLcg5W71Qqb3VNh3NEl
 OepwuzauTTsev+3tgu2BnIX0EYje2SwgK+njOMMNujIRUQ5VCVGlU3Ch3Oi0wW/1
 Ce3C8foes6glN0Rabf4w8pwmzZbhq9ajGalh3BfDqfdU/4LKyPrJ90uKKnGuoSZZ
 6OHRRbSx4pPxbA==
X-ME-Sender: <xms:yQUGX9D8opCPc-hq4cpm8JXag8XeZpk7YdURMiZrpCnYeR5voTy-_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgeefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yQUGX7igPrxXS1OBfYrJF0fF_Tu531CWMNLZyVIiQ-To6gqObnzg2Q>
 <xmx:yQUGX4kWEBx5yUHdxyLzsu2PRWM-GrE7eoOC2qbuYrfO7egxIzGGyQ>
 <xmx:yQUGX3waSEABySXQurXPYs1m0sF_faW9JF-s8gwg8HvBB89ETthHYg>
 <xmx:yQUGX_TI8Q7rIrwCNbgFonXezeHUlnenWibB41OcylV3NWA4F8dHesshPTQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1951D328005A;
 Wed,  8 Jul 2020 13:43:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 46/78] drm/vc4: hdmi: Pass vc4_hdmi to CEC code
Date: Wed,  8 Jul 2020 19:41:54 +0200
Message-Id: <5d99c9c1fe8831588af896178ceffd0cce0d3885.1594230107.git-series.maxime@cerno.tech>
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

Our CEC code also retrieves the associated vc4_hdmi by setting the
vc4_dev pointer as its private data, and then dereferences its vc4_hdmi
pointer.

In order to eventually get rid of that pointer, we can simply pass the
vc4_hdmi pointer directly.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d9db3c38f433..09b297a1b39d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1033,8 +1033,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 {
-	struct vc4_dev *vc4 = priv;
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = priv;
 
 	if (vc4_hdmi->cec_irq_was_rx) {
 		if (vc4_hdmi->cec_rx_msg.len)
@@ -1054,9 +1053,8 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
-static void vc4_cec_read_msg(struct vc4_dev *vc4, u32 cntrl1)
+static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
 {
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	struct cec_msg *msg = &vc4_hdmi->cec_rx_msg;
 	unsigned int i;
 
@@ -1074,8 +1072,7 @@ static void vc4_cec_read_msg(struct vc4_dev *vc4, u32 cntrl1)
 
 static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 {
-	struct vc4_dev *vc4 = priv;
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = priv;
 	u32 stat = HDMI_READ(VC4_HDMI_CPU_STATUS);
 	u32 cntrl1, cntrl5;
 
@@ -1086,7 +1083,7 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 	cntrl5 = HDMI_READ(VC4_HDMI_CEC_CNTRL_5);
 	vc4_hdmi->cec_irq_was_rx = cntrl5 & VC4_HDMI_CEC_RX_CEC_INT;
 	if (vc4_hdmi->cec_irq_was_rx) {
-		vc4_cec_read_msg(vc4, cntrl1);
+		vc4_cec_read_msg(vc4_hdmi, cntrl1);
 		cntrl1 |= VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
 		HDMI_WRITE(VC4_HDMI_CEC_CNTRL_1, cntrl1);
 		cntrl1 &= ~VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
@@ -1102,8 +1099,7 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 
 static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
-	struct vc4_dev *vc4 = cec_get_drvdata(adap);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
 	u32 val = HDMI_READ(VC4_HDMI_CEC_CNTRL_5);
@@ -1146,8 +1142,7 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 
 static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
-	struct vc4_dev *vc4 = cec_get_drvdata(adap);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 
 	HDMI_WRITE(VC4_HDMI_CEC_CNTRL_1,
 		   (HDMI_READ(VC4_HDMI_CEC_CNTRL_1) & ~VC4_HDMI_CEC_ADDR_MASK) |
@@ -1158,8 +1153,7 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
-	struct vc4_dev *vc4 = cec_get_drvdata(adap);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	u32 val;
 	unsigned int i;
 
@@ -1306,7 +1300,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
-						  vc4, "vc4",
+						  vc4_hdmi, "vc4",
 						  CEC_CAP_DEFAULTS |
 						  CEC_CAP_CONNECTOR_INFO, 1);
 	ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
@@ -1330,7 +1324,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0),
 					vc4_cec_irq_handler,
 					vc4_cec_irq_handler_thread, 0,
-					"vc4 hdmi cec", vc4);
+					"vc4 hdmi cec", vc4_hdmi);
 	if (ret)
 		goto err_delete_cec_adap;
 	ret = cec_register_adapter(vc4_hdmi->cec_adap, dev);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
