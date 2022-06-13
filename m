Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CCB5485CE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EB610E831;
	Mon, 13 Jun 2022 14:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B5810E831
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 1BD963200961;
 Mon, 13 Jun 2022 10:48:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 13 Jun 2022 10:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131731; x=1655218131; bh=fZ
 ZZbq3aNuFcTMZqR6JMqFUPO1iJar02xvns20U5YrA=; b=i4iZLW7ug+MAt+5C5i
 xwsiviJ+Z09ziK7FmxNYLXxv5Du/93t/H4bzgVHAgv68w0OG0zGnAiC5CPFK7/25
 Uk6rMPjhVHuNNb5IYP8Hc43Jca4zEQttn1UjPQ0dywOwDqDEckXqBHURmtpduoyv
 IhLA6Vkqg2+8cPvA150rxjshiKXEREedGxO0ILRi4kPKggfe6ceDXNPtpRJpAsqz
 kl6aWmDU0yXkSbLtuLHXfqa3HsraqrVvZMK2Zx+Oxd3MFW2dE9ujc81WbhIcDUxo
 TRCRR9DPPjPea8Mkuk6Dk6O1gBQO8KOt6ih0tLrs36fMK1IR/FZtj1A5q7PNTeJl
 8T+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131731; x=1655218131; bh=fZZZbq3aNuFcT
 MZqR6JMqFUPO1iJar02xvns20U5YrA=; b=wAgJ0p+UZRoqNLt093UTvyc1R78P5
 aaQ53BYQLE70RIhLiGB2PcNKEBtFOiyHlSI1wdwwB2kkUGpS4+v3bB+CC+IMNeC5
 1RJcKfkOjBJFhj595n444f/wS+tcRTkKcmM1WYBdDwWObO44IKGKUv60Jbwl4Ny8
 nEHgNoftpyHUa2h6IQZHa3+KeXJNpFLsRVrbZb/w9ybTJLLA2PEACqkwB5KtzpQD
 Ve6YwWzmuK/ZuBlUsmYxudIZaG6ta6g3FR/MlZsRg4C7uqXWKk9/thyyKOWfiT86
 iLj+TY+ZHlySxuec/VpH2w6Oyf6+H7Qv3p8aohFwTTKmxLZWVrZyJdgSg==
X-ME-Sender: <xms:Uk6nYjPW4UM3KGIF-Fc1pb-28To1OCAOFklvx94PCiVJcEkx6zJ4jg>
 <xme:Uk6nYt8hlMbCxyXJXBtUgY9jzKlPV1XPQHjBAv19IW4f0pUnIZICcP17drAtRh07Z
 sgQWveSIMd5Ip4tzWA>
X-ME-Received: <xmr:Uk6nYiQedTYqNH68MH_YRuTktifkRKNnQeppkI55nVXCTGucM_oHBULi3RaDJAmM1zsFBiqPFiRk7d1AhZcxBwpIx8icPIoUOkojVHc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Uk6nYnuZBa_okvu1QU0YBUFTTNAgvzY7WyDLi4f6UdieruM6_SWtfQ>
 <xmx:Uk6nYref7vD0oCFJ4E95Yi2AtJXdGuRdAYM5YqLHtkw2-scTXpaIPA>
 <xmx:Uk6nYj0Hs2joa0Ap0xwBppvw0YJJhsMrB6cu7mlS3irBlwCfj0OoCQ>
 <xmx:U06nYsHBRYGoohUpfQ_S2_mhqtVgsQEyFWcme-3XPSu2fL8DwWJung>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 15/33] drm/vc4: dsi: Fix dsi0 interrupt support
Date: Mon, 13 Jun 2022 16:47:42 +0200
Message-Id: <20220613144800.326124-16-maxime@cerno.tech>
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

DSI0 seemingly had very little or no testing as a load of
the register mappings were incorrect/missing, so host
transfers always timed out due to enabling/checking incorrect
bits in the interrupt enable and status registers.

Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 111 ++++++++++++++++++++++++++--------
 1 file changed, 85 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 97a258c934af..333ea96fcde4 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -181,8 +181,50 @@
 
 #define DSI0_TXPKT_PIX_FIFO		0x20 /* AKA PIX_FIFO */
 
-#define DSI0_INT_STAT		0x24
-#define DSI0_INT_EN		0x28
+#define DSI0_INT_STAT			0x24
+#define DSI0_INT_EN			0x28
+# define DSI0_INT_FIFO_ERR		BIT(25)
+# define DSI0_INT_CMDC_DONE_MASK	VC4_MASK(24, 23)
+# define DSI0_INT_CMDC_DONE_SHIFT	23
+#  define DSI0_INT_CMDC_DONE_NO_REPEAT		1
+#  define DSI0_INT_CMDC_DONE_REPEAT		3
+# define DSI0_INT_PHY_DIR_RTF		BIT(22)
+# define DSI0_INT_PHY_D1_ULPS		BIT(21)
+# define DSI0_INT_PHY_D1_STOP		BIT(20)
+# define DSI0_INT_PHY_RXLPDT		BIT(19)
+# define DSI0_INT_PHY_RXTRIG		BIT(18)
+# define DSI0_INT_PHY_D0_ULPS		BIT(17)
+# define DSI0_INT_PHY_D0_LPDT		BIT(16)
+# define DSI0_INT_PHY_D0_FTR		BIT(15)
+# define DSI0_INT_PHY_D0_STOP		BIT(14)
+/* Signaled when the clock lane enters the given state. */
+# define DSI0_INT_PHY_CLK_ULPS		BIT(13)
+# define DSI0_INT_PHY_CLK_HS		BIT(12)
+# define DSI0_INT_PHY_CLK_FTR		BIT(11)
+/* Signaled on timeouts */
+# define DSI0_INT_PR_TO			BIT(10)
+# define DSI0_INT_TA_TO			BIT(9)
+# define DSI0_INT_LPRX_TO		BIT(8)
+# define DSI0_INT_HSTX_TO		BIT(7)
+/* Contention on a line when trying to drive the line low */
+# define DSI0_INT_ERR_CONT_LP1		BIT(6)
+# define DSI0_INT_ERR_CONT_LP0		BIT(5)
+/* Control error: incorrect line state sequence on data lane 0. */
+# define DSI0_INT_ERR_CONTROL		BIT(4)
+# define DSI0_INT_ERR_SYNC_ESC		BIT(3)
+# define DSI0_INT_RX2_PKT		BIT(2)
+# define DSI0_INT_RX1_PKT		BIT(1)
+# define DSI0_INT_CMD_PKT		BIT(0)
+
+#define DSI0_INTERRUPTS_ALWAYS_ENABLED	(DSI0_INT_ERR_SYNC_ESC | \
+					 DSI0_INT_ERR_CONTROL |	 \
+					 DSI0_INT_ERR_CONT_LP0 | \
+					 DSI0_INT_ERR_CONT_LP1 | \
+					 DSI0_INT_HSTX_TO |	 \
+					 DSI0_INT_LPRX_TO |	 \
+					 DSI0_INT_TA_TO |	 \
+					 DSI0_INT_PR_TO)
+
 # define DSI1_INT_PHY_D3_ULPS		BIT(30)
 # define DSI1_INT_PHY_D3_STOP		BIT(29)
 # define DSI1_INT_PHY_D2_ULPS		BIT(28)
@@ -892,6 +934,9 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 
 		DSI_PORT_WRITE(PHY_AFEC0, afec0);
 
+		/* AFEC reset hold time */
+		mdelay(1);
+
 		DSI_PORT_WRITE(PHY_AFEC1,
 			       VC4_SET_FIELD(6,  DSI0_PHY_AFEC1_IDR_DLANE1) |
 			       VC4_SET_FIELD(6,  DSI0_PHY_AFEC1_IDR_DLANE0) |
@@ -1058,12 +1103,9 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 		DSI_PORT_WRITE(CTRL, DSI_PORT_READ(CTRL) | DSI1_CTRL_EN);
 
 	/* Bring AFE out of reset. */
-	if (dsi->variant->port == 0) {
-	} else {
-		DSI_PORT_WRITE(PHY_AFEC0,
-			       DSI_PORT_READ(PHY_AFEC0) &
-			       ~DSI1_PHY_AFEC0_RESET);
-	}
+	DSI_PORT_WRITE(PHY_AFEC0,
+		       DSI_PORT_READ(PHY_AFEC0) &
+		       ~DSI_PORT_BIT(PHY_AFEC0_RESET));
 
 	vc4_dsi_ulps(dsi, false);
 
@@ -1182,13 +1224,28 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 	/* Enable the appropriate interrupt for the transfer completion. */
 	dsi->xfer_result = 0;
 	reinit_completion(&dsi->xfer_completion);
-	DSI_PORT_WRITE(INT_STAT, DSI1_INT_TXPKT1_DONE | DSI1_INT_PHY_DIR_RTF);
-	if (msg->rx_len) {
-		DSI_PORT_WRITE(INT_EN, (DSI1_INTERRUPTS_ALWAYS_ENABLED |
-					DSI1_INT_PHY_DIR_RTF));
+	if (dsi->variant->port == 0) {
+		DSI_PORT_WRITE(INT_STAT,
+			       DSI0_INT_CMDC_DONE_MASK | DSI1_INT_PHY_DIR_RTF);
+		if (msg->rx_len) {
+			DSI_PORT_WRITE(INT_EN, (DSI0_INTERRUPTS_ALWAYS_ENABLED |
+						DSI0_INT_PHY_DIR_RTF));
+		} else {
+			DSI_PORT_WRITE(INT_EN,
+				       (DSI0_INTERRUPTS_ALWAYS_ENABLED |
+					VC4_SET_FIELD(DSI0_INT_CMDC_DONE_NO_REPEAT,
+						      DSI0_INT_CMDC_DONE)));
+		}
 	} else {
-		DSI_PORT_WRITE(INT_EN, (DSI1_INTERRUPTS_ALWAYS_ENABLED |
-					DSI1_INT_TXPKT1_DONE));
+		DSI_PORT_WRITE(INT_STAT,
+			       DSI1_INT_TXPKT1_DONE | DSI1_INT_PHY_DIR_RTF);
+		if (msg->rx_len) {
+			DSI_PORT_WRITE(INT_EN, (DSI1_INTERRUPTS_ALWAYS_ENABLED |
+						DSI1_INT_PHY_DIR_RTF));
+		} else {
+			DSI_PORT_WRITE(INT_EN, (DSI1_INTERRUPTS_ALWAYS_ENABLED |
+						DSI1_INT_TXPKT1_DONE));
+		}
 	}
 
 	/* Send the packet. */
@@ -1205,7 +1262,7 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 		ret = dsi->xfer_result;
 	}
 
-	DSI_PORT_WRITE(INT_EN, DSI1_INTERRUPTS_ALWAYS_ENABLED);
+	DSI_PORT_WRITE(INT_EN, DSI_PORT_BIT(INTERRUPTS_ALWAYS_ENABLED));
 
 	if (ret)
 		goto reset_fifo_and_return;
@@ -1251,7 +1308,7 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 		       DSI_PORT_BIT(CTRL_RESET_FIFOS));
 
 	DSI_PORT_WRITE(TXPKT1C, 0);
-	DSI_PORT_WRITE(INT_EN, DSI1_INTERRUPTS_ALWAYS_ENABLED);
+	DSI_PORT_WRITE(INT_EN, DSI_PORT_BIT(INTERRUPTS_ALWAYS_ENABLED));
 	return ret;
 }
 
@@ -1388,26 +1445,28 @@ static irqreturn_t vc4_dsi_irq_handler(int irq, void *data)
 	DSI_PORT_WRITE(INT_STAT, stat);
 
 	dsi_handle_error(dsi, &ret, stat,
-			 DSI1_INT_ERR_SYNC_ESC, "LPDT sync");
+			 DSI_PORT_BIT(INT_ERR_SYNC_ESC), "LPDT sync");
 	dsi_handle_error(dsi, &ret, stat,
-			 DSI1_INT_ERR_CONTROL, "data lane 0 sequence");
+			 DSI_PORT_BIT(INT_ERR_CONTROL), "data lane 0 sequence");
 	dsi_handle_error(dsi, &ret, stat,
-			 DSI1_INT_ERR_CONT_LP0, "LP0 contention");
+			 DSI_PORT_BIT(INT_ERR_CONT_LP0), "LP0 contention");
 	dsi_handle_error(dsi, &ret, stat,
-			 DSI1_INT_ERR_CONT_LP1, "LP1 contention");
+			 DSI_PORT_BIT(INT_ERR_CONT_LP1), "LP1 contention");
 	dsi_handle_error(dsi, &ret, stat,
-			 DSI1_INT_HSTX_TO, "HSTX timeout");
+			 DSI_PORT_BIT(INT_HSTX_TO), "HSTX timeout");
 	dsi_handle_error(dsi, &ret, stat,
-			 DSI1_INT_LPRX_TO, "LPRX timeout");
+			 DSI_PORT_BIT(INT_LPRX_TO), "LPRX timeout");
 	dsi_handle_error(dsi, &ret, stat,
-			 DSI1_INT_TA_TO, "turnaround timeout");
+			 DSI_PORT_BIT(INT_TA_TO), "turnaround timeout");
 	dsi_handle_error(dsi, &ret, stat,
-			 DSI1_INT_PR_TO, "peripheral reset timeout");
+			 DSI_PORT_BIT(INT_PR_TO), "peripheral reset timeout");
 
-	if (stat & (DSI1_INT_TXPKT1_DONE | DSI1_INT_PHY_DIR_RTF)) {
+	if (stat & ((dsi->variant->port ? DSI1_INT_TXPKT1_DONE :
+					  DSI0_INT_CMDC_DONE_MASK) |
+		    DSI_PORT_BIT(INT_PHY_DIR_RTF))) {
 		complete(&dsi->xfer_completion);
 		ret = IRQ_HANDLED;
-	} else if (stat & DSI1_INT_HSTX_TO) {
+	} else if (stat & DSI_PORT_BIT(INT_HSTX_TO)) {
 		complete(&dsi->xfer_completion);
 		dsi->xfer_result = -ETIMEDOUT;
 		ret = IRQ_HANDLED;
-- 
2.36.1

