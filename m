Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9442B2D5E88
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B546EACE;
	Thu, 10 Dec 2020 14:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DEB6E580
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:47:04 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 0C93CEC8;
 Thu, 10 Dec 2020 08:47:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 10 Dec 2020 08:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3l25+3vkvIlo3
 zdTOZj26wgphPMfgkDcOOj5Y5/Rn7E=; b=LamlBIu/5hNVwgjfRRnkhX899sXT7
 QtJksW123ywwkkfHr+Bk5i2rq3Q/2GUZJ3A+3Ar4SDTvNL+FewfnV+BCDaCIUsIG
 oNitV6kgJP20/4GKANbzBAfCw5WLTRyzr7VbmjWUmoYW1x4BWqnc+cyf9L7frf2d
 CMZyifqOHu/NjLePjlSwHEpMCAl3SxmA1imuVLxjREunDQwkcT6sYkz8EF9M9mBl
 cQwWLyQ8cKJf0YN3vvtkPx1njkHOvONP3N2Wr6n3dN27idNhEljkTXz0lCgoVltA
 UQh17EMveFf0LAQvcClvh3HDF9umLr0STst3Vspir3Zi2QyIMWne4KrcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3l25+3vkvIlo3zdTOZj26wgphPMfgkDcOOj5Y5/Rn7E=; b=M8275zfY
 Tppp2r2eE7oDoA+65vqvb0YpslV51TqC0gKuQ482ydTNFol+Fja8t542xA36lnvX
 E7uA5rGdcZhAta8/s2czL2jtMPfhvzGg3cJf0vln/E+gvSqnv7c+/HtejT3hzn5h
 X5pD0o/vCwLpSrDsc/Gk4aFCRa3MXG63H9ibWo1nCVPP9HPfnIaiBr8azyUM7SFu
 54SIAKbYHzDWI1BdxLnB+pFRL/P+toNzorEgiZ+UR9F9+T4EXhmAzOuAXhgy9Wl8
 m5k/tV3L+IwvsU/1yIpaIkoIaXZFRiVqfm0h979ifMZjhXwS8n5GSEK+Kb+/xWoI
 u3ubYFhDKRD9rA==
X-ME-Sender: <xms:1ibSX4doEY7tXruJEjWNX1nXFSPQI343L4gzL7Ouy7mfhdbO2RRwjQ>
 <xme:1ibSX0zZsP0VyzN4RJ3GWrBwdT3b6lePEd0TrhxvUJGUCGFcngWiv7IBpcYLywR9y
 MDsve7OdsWpeGQzDqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1ibSX2HbtvqMAuBJIt5iC1VPo5A1byHiUTdMnJTjMljnan6tRAOR1A>
 <xmx:1ibSXwzEoRHz9BmrU4XwLZqbKvHI-DszNGtWFgKYEYQV2qaM6v_Zsw>
 <xmx:1ibSX_uOqUkkXUA8sL6sS7I477R2rvsv-Rx0wjjZk4hAKRwvm39wsg>
 <xmx:1ibSX4dE1o11qlAGfZAStSACy1A4fCWo22MbWCEAnRz3I4n2IdLBC6TNlYE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4C82D1080067;
 Thu, 10 Dec 2020 08:47:02 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 09/15] drm/vc4: hdmi: Split the interrupt handlers
Date: Thu, 10 Dec 2020 14:46:42 +0100
Message-Id: <20201210134648.272857-10-maxime@cerno.tech>
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
index 0debd22bc992..80a81fcea315 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1442,15 +1442,22 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -1464,6 +1471,19 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
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
@@ -1488,31 +1508,55 @@ static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
