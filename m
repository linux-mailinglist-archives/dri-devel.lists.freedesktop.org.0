Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC4D1E594D
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF8F6E466;
	Thu, 28 May 2020 07:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281586E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 90376580C3B;
 Wed, 27 May 2020 11:51:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=upxZGzscKBQ3B
 5QGb99rDZa61nB3JngVpsG8rZDtRF0=; b=a4Zqh0aQAXadVojfj3uXPR+/yo2b6
 tmVoGcRSZC++cxUvs/rDOfdG5+U/quoL3P8Sp641oWqA39/RcNQetHrJVjPcbCgs
 Cob+W+itFSiBOOJ67jy7J/lT/qeRzIGeFE+TLIycr4P5clAKdS1mRrXEhVqVx3vv
 jvFBSwHzLRILuFhOQfMOioeA/RhMVktMrsin2ntXQqBclmvtSxfqmHZJK7R43Lnx
 MyZM8aJgOEx8S/B0GX2gH3J95CyvVCCT0srWT6CrqMhnBSwQ/g7dQGu43XxB7Wa+
 d4cHsFwIkESlhTdyv+GARQDNoimeXPzKzSLWSzTNtCb3qeBSZoKYiuNgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=upxZGzscKBQ3B5QGb99rDZa61nB3JngVpsG8rZDtRF0=; b=04zAjv49
 /c35Cz1JnrqXJs186aGgtMhRfTKm1YcFcOuXHH8Wy8Ya5VqGABzNbj7LHIlrXp6/
 3D4K4NKUstIq9gdqlWE1HflNbU8UuCTm4/mY8ozshghPcC1F5xMw7YrOcAkkMSqX
 vB5nMDwI7dB9Q2vn1lEpeeg0lTUQk52ijeTltxXYpvTu9A5liIQMmuWYzzRsD/eQ
 JX/tq0URikT4xTg/Ql6q19BrEbni2qoPHYkC++afMXPYFnTb0V1TwppG5ckYeKPN
 bi2XoVILmnZo3yfwB9PS2qv0Qtb3JhqSiEoJwSRRMFzQW9gPmOxPITZfslhBPLC1
 wK7oHNApR6wlng==
X-ME-Sender: <xms:dYzOXpJi15PR39hllOMsKkHim6LorwIfpSIHNpJxFt4ZvNQzYroGGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dYzOXlJA0jf7uWHBerQy1ZYfnfVL-olrlPmKSCAlECB9mvq3yXWNTQ>
 <xmx:dYzOXhtnRwnfnMOzaPbC_Bg2TCRKuND7ypzjOZJNWcGsYmrz_FTdwg>
 <xmx:dYzOXqaU0NWIyFc0WZHwS1C6131Ux-6gpDEMzuRMaMXTrryAPwHD3g>
 <xmx:dYzOXg6DdKiuYxRPZu-XUx2yclg01n-H_v6bHo-DydlE1FhSE0zU0Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 303DA328005D;
 Wed, 27 May 2020 11:51:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 076/105] drm/vc4: hdmi: Pass vc4_hdmi to CEC code
Date: Wed, 27 May 2020 17:48:46 +0200
Message-Id: <1b7b5a8ac7a6e500b2ab37a4366069ac4021e61e.1590594512.git-series.maxime@cerno.tech>
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

Our CEC code also retrieves the associated vc4_hdmi by setting the
vc4_dev pointer as its private data, and then dereferences its vc4_hdmi
pointer.

In order to eventually get rid of that pointer, we can simply pass the
vc4_hdmi pointer directly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4a28e0c0c814..892108f16802 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1032,8 +1032,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 {
-	struct vc4_dev *vc4 = priv;
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = priv;
 
 	if (vc4_hdmi->cec_irq_was_rx) {
 		if (vc4_hdmi->cec_rx_msg.len)
@@ -1053,9 +1052,8 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
-static void vc4_cec_read_msg(struct vc4_dev *vc4, u32 cntrl1)
+static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
 {
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	struct cec_msg *msg = &vc4_hdmi->cec_rx_msg;
 	unsigned int i;
 
@@ -1073,8 +1071,7 @@ static void vc4_cec_read_msg(struct vc4_dev *vc4, u32 cntrl1)
 
 static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 {
-	struct vc4_dev *vc4 = priv;
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = priv;
 	u32 stat = HDMI_READ(VC4_HDMI_CPU_STATUS);
 	u32 cntrl1, cntrl5;
 
@@ -1085,7 +1082,7 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 	cntrl5 = HDMI_READ(VC4_HDMI_CEC_CNTRL_5);
 	vc4_hdmi->cec_irq_was_rx = cntrl5 & VC4_HDMI_CEC_RX_CEC_INT;
 	if (vc4_hdmi->cec_irq_was_rx) {
-		vc4_cec_read_msg(vc4, cntrl1);
+		vc4_cec_read_msg(vc4_hdmi, cntrl1);
 		cntrl1 |= VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
 		HDMI_WRITE(VC4_HDMI_CEC_CNTRL_1, cntrl1);
 		cntrl1 &= ~VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
@@ -1101,8 +1098,7 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 
 static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
-	struct vc4_dev *vc4 = cec_get_drvdata(adap);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
 	u32 val = HDMI_READ(VC4_HDMI_CEC_CNTRL_5);
@@ -1145,8 +1141,7 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 
 static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
-	struct vc4_dev *vc4 = cec_get_drvdata(adap);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 
 	HDMI_WRITE(VC4_HDMI_CEC_CNTRL_1,
 		   (HDMI_READ(VC4_HDMI_CEC_CNTRL_1) & ~VC4_HDMI_CEC_ADDR_MASK) |
@@ -1157,8 +1152,7 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
-	struct vc4_dev *vc4 = cec_get_drvdata(adap);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	u32 val;
 	unsigned int i;
 
@@ -1303,7 +1297,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
-						  vc4, "vc4",
+						  vc4_hdmi, "vc4",
 						  CEC_CAP_DEFAULTS |
 						  CEC_CAP_CONNECTOR_INFO, 1);
 	ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
@@ -1327,7 +1321,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
