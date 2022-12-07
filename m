Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A864596B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2838C10E399;
	Wed,  7 Dec 2022 11:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895C010E195
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E3D2F5C01D2;
 Wed,  7 Dec 2022 06:55:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 07 Dec 2022 06:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414119; x=
 1670500519; bh=44BQFZc8En5VihF5MmLMyAz0cXeJWt1WjW3mw1Kzpwo=; b=K
 TSZmu08S90UQAO8qZ6c2q1vABMngkWY4ZuqP3Y0oFkzfv8IGdIizk2PoEWMAqD9C
 B65kQjBf2DoD8OT1VpTIcjdP13KaNaYDQdATFNiDA62RLZuEsAUt1kkmKfdjvVaa
 7rZWXF61k8iYN56FGvCUC7ZMt25zcXxme1moJOy5JRv/Nq+UHDm27fTV1rMcQuuY
 F+vnfErmZfJSu6lOQjFVPigQcdaHAzc48CJU2T9BFD1OFbrEKC3MQTAcsWNcAxr+
 T+LcLMazJ29N6HR/YQ6brl3iND9Wg2ipVTK33GPEBsq5OD2Pch8fxFNAByO0256s
 dIhA+PJs1MsgdMQzPhm1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414119; x=
 1670500519; bh=44BQFZc8En5VihF5MmLMyAz0cXeJWt1WjW3mw1Kzpwo=; b=P
 NbIyPjoNBZnGtcMfs0jWP/v4xrWMq1J8roQpZPX9WgxU6Zez8+rVQwZ9DQj9XD6q
 E3za2uac+s6mLlnYPq3f9AcshXrMcU//ES2nw4JfHF8uEMRwKMZhp0uCv33PvRhm
 1oXRoP6eRJS3yAsGoxGzCAWaI69VFCG6y3AKrmA/Sjg1C8ITHOjBlQwRy8gQ1ie0
 0jjxqRX2j1cJqonCzcp/HLcI697pIXsMzQt9A7QX+m3BZ6C9QLKx/hhDnwUIDGu6
 O7zh+fngSaTBq/1NMIEWfPT7A9iahk6fItj/awab+iJ/tk/MA+02JBeyXB3mvolt
 DhT5ep9F43n180CMB1tlw==
X-ME-Sender: <xms:J3-QY-qA0gIz2BuQjKPHlnVt_v3wcRLEuodyIsUH72Fx2Vy9WgiFMw>
 <xme:J3-QY8o7IV_1J7FUenQPCNECXx8HE5r44ZmhSXUR9qpfNS35s25Gobg2aZoioR3LK
 CrwTq8BX11MTZviDvY>
X-ME-Received: <xmr:J3-QYzNJdp7-NtDKapba4nmLLdYsO9cKuYsqfko4YPgpgu5YSJGtWrTdcM67om9uyxVnHsVGGuocMKg6cv9kXMqzUkOYMGMBwm3rFM2Jx57jow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:J3-QY95oCLgOpIVOBa95Iy_RUJ0cZpVziXjgLu8jX6nqmUEILyG6dg>
 <xmx:J3-QY97et1YCLqoTqtr3ZpTUCMiINfBDHomVg6ueyWfSGDFg-7DE-A>
 <xmx:J3-QY9j0E5hAkqsZeo9rAxxz7bBU2fHNe0MzOzgRh1eUdByfxaRvvA>
 <xmx:J3-QY6w_kLPmEJkfYZd_NmZf-3XM4NBC1jqYU6CxoIjq-DQWjsmR5A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:15 +0100
Subject: [PATCH 04/15] drm/vc4: hvs: Correct interrupt masking bit assignment
 for HVS5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-4-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=5333; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=qtAhhBZK0yOvDtPhFIW1oQxPHiQbKZ8wNM3EEjkze4g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6lasnyib1v9hqeBjk6dCm4tSLyRxt/Q1fzY2qNuksdCx
 9cHzjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExkz2OG/xU+wmdZZ91NYjF6/Pc253
 LXKc4zdz+aFNltk3Z/bdRirQqG/yXLHVluCcY/b/t5YY5QiNnKyCnbxXQULoTf5wuIEDmcwgcA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

HVS5 has moved the interrupt enable bits around within the
DISPCTRL register, therefore the configuration has to be updated
to account for this.

Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c  | 52 +++++++++++++++++++++++++++++-------------
 drivers/gpu/drm/vc4/vc4_regs.h | 10 ++++++--
 2 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 57d99e7199ee..d9fc0d03023b 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -660,7 +660,8 @@ void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
 		return;
 
 	dispctrl = HVS_READ(SCALER_DISPCTRL);
-	dispctrl &= ~SCALER_DISPCTRL_DSPEISLUR(channel);
+	dispctrl &= ~(hvs->vc4->is_vc5 ? SCALER5_DISPCTRL_DSPEISLUR(channel) :
+					 SCALER_DISPCTRL_DSPEISLUR(channel));
 
 	HVS_WRITE(SCALER_DISPCTRL, dispctrl);
 
@@ -677,7 +678,8 @@ void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel)
 		return;
 
 	dispctrl = HVS_READ(SCALER_DISPCTRL);
-	dispctrl |= SCALER_DISPCTRL_DSPEISLUR(channel);
+	dispctrl |= (hvs->vc4->is_vc5 ? SCALER5_DISPCTRL_DSPEISLUR(channel) :
+					SCALER_DISPCTRL_DSPEISLUR(channel));
 
 	HVS_WRITE(SCALER_DISPSTAT,
 		  SCALER_DISPSTAT_EUFLOW(channel));
@@ -703,6 +705,7 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 	int channel;
 	u32 control;
 	u32 status;
+	u32 dspeislur;
 
 	/*
 	 * NOTE: We don't need to protect the register access using
@@ -719,9 +722,11 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 	control = HVS_READ(SCALER_DISPCTRL);
 
 	for (channel = 0; channel < SCALER_CHANNELS_COUNT; channel++) {
+		dspeislur = vc4->is_vc5 ? SCALER5_DISPCTRL_DSPEISLUR(channel) :
+					  SCALER_DISPCTRL_DSPEISLUR(channel);
 		/* Interrupt masking is not always honored, so check it here. */
 		if (status & SCALER_DISPSTAT_EUFLOW(channel) &&
-		    control & SCALER_DISPCTRL_DSPEISLUR(channel)) {
+		    control & dspeislur) {
 			vc4_hvs_mask_underrun(hvs, channel);
 			vc4_hvs_report_underrun(dev);
 
@@ -898,19 +903,34 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		    SCALER_DISPCTRL_DISPEIRQ(1) |
 		    SCALER_DISPCTRL_DISPEIRQ(2);
 
-	dispctrl &= ~(SCALER_DISPCTRL_DMAEIRQ |
-		      SCALER_DISPCTRL_SLVWREIRQ |
-		      SCALER_DISPCTRL_SLVRDEIRQ |
-		      SCALER_DISPCTRL_DSPEIEOF(0) |
-		      SCALER_DISPCTRL_DSPEIEOF(1) |
-		      SCALER_DISPCTRL_DSPEIEOF(2) |
-		      SCALER_DISPCTRL_DSPEIEOLN(0) |
-		      SCALER_DISPCTRL_DSPEIEOLN(1) |
-		      SCALER_DISPCTRL_DSPEIEOLN(2) |
-		      SCALER_DISPCTRL_DSPEISLUR(0) |
-		      SCALER_DISPCTRL_DSPEISLUR(1) |
-		      SCALER_DISPCTRL_DSPEISLUR(2) |
-		      SCALER_DISPCTRL_SCLEIRQ);
+	if (!vc4->is_vc5)
+		dispctrl &= ~(SCALER_DISPCTRL_DMAEIRQ |
+			      SCALER_DISPCTRL_SLVWREIRQ |
+			      SCALER_DISPCTRL_SLVRDEIRQ |
+			      SCALER_DISPCTRL_DSPEIEOF(0) |
+			      SCALER_DISPCTRL_DSPEIEOF(1) |
+			      SCALER_DISPCTRL_DSPEIEOF(2) |
+			      SCALER_DISPCTRL_DSPEIEOLN(0) |
+			      SCALER_DISPCTRL_DSPEIEOLN(1) |
+			      SCALER_DISPCTRL_DSPEIEOLN(2) |
+			      SCALER_DISPCTRL_DSPEISLUR(0) |
+			      SCALER_DISPCTRL_DSPEISLUR(1) |
+			      SCALER_DISPCTRL_DSPEISLUR(2) |
+			      SCALER_DISPCTRL_SCLEIRQ);
+	else
+		dispctrl &= ~(SCALER_DISPCTRL_DMAEIRQ |
+			      SCALER5_DISPCTRL_SLVEIRQ |
+			      SCALER5_DISPCTRL_DSPEIEOF(0) |
+			      SCALER5_DISPCTRL_DSPEIEOF(1) |
+			      SCALER5_DISPCTRL_DSPEIEOF(2) |
+			      SCALER5_DISPCTRL_DSPEIEOLN(0) |
+			      SCALER5_DISPCTRL_DSPEIEOLN(1) |
+			      SCALER5_DISPCTRL_DSPEIEOLN(2) |
+			      SCALER5_DISPCTRL_DSPEISLUR(0) |
+			      SCALER5_DISPCTRL_DSPEISLUR(1) |
+			      SCALER5_DISPCTRL_DSPEISLUR(2) |
+			      SCALER_DISPCTRL_SCLEIRQ);
+
 
 	/* Set AXI panic mode.
 	 * VC4 panics when < 2 lines in FIFO.
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 95deacdc31e7..1256f0877ff6 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -234,15 +234,21 @@
  * always enabled.
  */
 # define SCALER_DISPCTRL_DSPEISLUR(x)		BIT(13 + (x))
+# define SCALER5_DISPCTRL_DSPEISLUR(x)		BIT(9 + ((x) * 4))
 /* Enables Display 0 end-of-line-N contribution to
  * SCALER_DISPSTAT_IRQDISP0
  */
 # define SCALER_DISPCTRL_DSPEIEOLN(x)		BIT(8 + ((x) * 2))
+# define SCALER5_DISPCTRL_DSPEIEOLN(x)		BIT(8 + ((x) * 4))
 /* Enables Display 0 EOF contribution to SCALER_DISPSTAT_IRQDISP0 */
 # define SCALER_DISPCTRL_DSPEIEOF(x)		BIT(7 + ((x) * 2))
+# define SCALER5_DISPCTRL_DSPEIEOF(x)		BIT(7 + ((x) * 4))
 
-# define SCALER_DISPCTRL_SLVRDEIRQ		BIT(6)
-# define SCALER_DISPCTRL_SLVWREIRQ		BIT(5)
+# define SCALER5_DISPCTRL_DSPEIVST(x)		BIT(6 + ((x) * 4))
+
+# define SCALER_DISPCTRL_SLVRDEIRQ		BIT(6)	/* HVS4 only */
+# define SCALER_DISPCTRL_SLVWREIRQ		BIT(5)	/* HVS4 only */
+# define SCALER5_DISPCTRL_SLVEIRQ		BIT(5)
 # define SCALER_DISPCTRL_DMAEIRQ		BIT(4)
 /* Enables interrupt generation on the enabled EOF/EOLN/EISLUR
  * bits and short frames..

-- 
2.38.1
