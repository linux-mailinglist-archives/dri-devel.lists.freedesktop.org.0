Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39FE25D203
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2356EAE1;
	Fri,  4 Sep 2020 07:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25046E5A0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C91DEC5E;
 Thu,  3 Sep 2020 04:02:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=0TWbDW/JdFFMG
 1mfSXir09nBxVJRRqIxvzdJBQweG5M=; b=gH9yzGV/+iSUK2rYbUxO2g0bTm6l7
 y4v0sxlX2rV7p2gHW0mPhEqOMsspAaWRn5tMqD0jmPF26T97h+3HEzmGgB+Xxgju
 3PegqIk8LdsMGts87O7r7uRgHJoDQzfhdLxyTX4o7APq0YrAuTQwjOQiBLZpTWLI
 fjnYHzZ+ust8FkjZ710I13uurBMpL9XvQCjHVtnndisNWCKmiAm8yljatAEZEODU
 kN9gwhd78gRFye3SVtC84TIxPyFYY8O7ttReCuiTwbeDqVYNeSz1cBegXWFrmEbJ
 qzkSZGnHIRVb25It1ijCS3KVyDlQOmMYebxXc5N6v9VY07QHMNd9c6oPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=0TWbDW/JdFFMG1mfSXir09nBxVJRRqIxvzdJBQweG5M=; b=NmjHn+To
 EtGJa2MXJ98hOxnMjHBxwX4D86S9UsMq9ezWRCzk2YW07rcvfBMupoSvMc3uB3Aa
 VSD5q+QS/i5R9Iz1ZbpeCW312JqFpEebOl2s6np1u9GJrARXCAEEr0q3J72A2LLV
 Ca99T5eUbI9cTXVWUoMcj6zXWZx2uPJ1YxHSwV1EWXUMPG7fzl1rg51BfD+rhS6H
 +GuO9EJQHKIRLnIfS0EnL9ydqqKE+jZgJJxYYg9BB5lIK0F3z+BMlIhmu8jCEEXd
 EuRuJgvWYtCiKboT9r4BghqeB2x5wuhGtsibdafDCCDeuZC62AgALx+WJyYT6Cxz
 ZGi7QWRdF6HlKA==
X-ME-Sender: <xms:EqNQXyD3fahuuUIKxhLqm9B3bnIxfwU3IS0rYNs8d01pyNQPcp38Kw>
 <xme:EqNQX8gUH8OK8qsKbv853SqrtM-rS9NpN2gCdFFSlTAfLnfNrg_MjG0q--2l1QvWu
 stcjcpYPDlv2J01hb8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedule
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EqNQX1nhp5D5seO36tw8mM4C76T5ZCMpwduT58YqEhMADXPTWqJXvg>
 <xmx:EqNQXwxV4JwY79okls2sW0TQrLhLwA-_cSUabFzwAUxj9RJ1rbhyhg>
 <xmx:EqNQX3TCQGML49rVuxcUmHolPwga8wmmzI_gVNuOlG9hYCUcr2DmnA>
 <xmx:EqNQX_YL0yzRFmkUF8OEB6W6mtruJ_9U-7Hid2jqM4CLPtpXgM8gF_BNJ5Y>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1140B306005F;
 Thu,  3 Sep 2020 04:02:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 23/80] drm/vc4: crtc: Move the HVS gamma LUT setup to our
 init function
Date: Thu,  3 Sep 2020 10:00:55 +0200
Message-Id: <d439da8f1592a450a6ad35ab1f9e77def17c7965.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since most of the HVS channel is setup in the init function, let's move the
gamma setup there too. As this makes the HVS mode_set function empty, let's
remove it in the process.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 +-
 drivers/gpu/drm/vc4/vc4_hvs.c  | 59 +++++++++--------------------------
 drivers/gpu/drm/vc4/vc4_txp.c  |  1 +-
 4 files changed, 16 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 181d3fd57bc7..284a85b9d7d4 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -379,8 +379,6 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	vc4_crtc_config_pv(crtc);
-
-	vc4_hvs_mode_set_nofb(crtc);
 }
 
 static void require_hvs_enabled(struct drm_device *dev)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 4126506b3a69..dfcc684f5d28 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -904,7 +904,6 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state);
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
 void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_state *state);
-void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc);
 void vc4_hvs_dump_state(struct drm_device *dev);
 void vc4_hvs_unmask_underrun(struct drm_device *dev, int channel);
 void vc4_hvs_mask_underrun(struct drm_device *dev, int channel);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index dde931233d4a..efaae60bb323 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -201,6 +201,8 @@ static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
 {
 	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
 	unsigned int chan = vc4_crtc_state->assigned_channel;
+	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
+	u32 dispbkgndx;
 	u32 dispctrl;
 
 	/* Turn on the scaler, which will wait for vstart to start
@@ -225,6 +227,20 @@ static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
 
 	HVS_WRITE(SCALER_DISPCTRLX(chan), dispctrl);
 
+	dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(chan));
+	dispbkgndx &= ~SCALER_DISPBKGND_GAMMA;
+	dispbkgndx &= ~SCALER_DISPBKGND_INTERLACE;
+
+	HVS_WRITE(SCALER_DISPBKGNDX(chan), dispbkgndx |
+		  SCALER_DISPBKGND_AUTOHS |
+		  ((!vc4->hvs->hvs5) ? SCALER_DISPBKGND_GAMMA : 0) |
+		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
+
+	/* Reload the LUT, since the SRAMs would have been disabled if
+	 * all CRTCs had SCALER_DISPBKGND_GAMMA unset at once.
+	 */
+	vc4_hvs_lut_load(crtc);
+
 	return 0;
 }
 
@@ -421,49 +437,6 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	}
 }
 
-void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
-	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
-
-	if (vc4_state->assigned_channel == 2) {
-		u32 dispctrl;
-		u32 dsp3_mux;
-
-		/*
-		 * SCALER_DISPCTRL_DSP3 = X, where X < 2 means 'connect DSP3 to
-		 * FIFO X'.
-		 * SCALER_DISPCTRL_DSP3 = 3 means 'disable DSP 3'.
-		 *
-		 * DSP3 is connected to FIFO2 unless the transposer is
-		 * enabled. In this case, FIFO 2 is directly accessed by the
-		 * TXP IP, and we need to disable the FIFO2 -> pixelvalve1
-		 * route.
-		 */
-		if (vc4_state->feed_txp)
-			dsp3_mux = VC4_SET_FIELD(3, SCALER_DISPCTRL_DSP3_MUX);
-		else
-			dsp3_mux = VC4_SET_FIELD(2, SCALER_DISPCTRL_DSP3_MUX);
-
-		dispctrl = HVS_READ(SCALER_DISPCTRL) &
-			   ~SCALER_DISPCTRL_DSP3_MUX_MASK;
-		HVS_WRITE(SCALER_DISPCTRL, dispctrl | dsp3_mux);
-	}
-
-	HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
-		  SCALER_DISPBKGND_AUTOHS |
-		  ((!vc4->hvs->hvs5) ? SCALER_DISPBKGND_GAMMA : 0) |
-		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
-
-	/* Reload the LUT, since the SRAMs would have been disabled if
-	 * all CRTCs had SCALER_DISPBKGND_GAMMA unset at once.
-	 */
-	vc4_hvs_lut_load(crtc);
-}
-
 void vc4_hvs_mask_underrun(struct drm_device *dev, int channel)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index a2380d856000..849dcafbfff1 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -436,7 +436,6 @@ static const struct drm_crtc_helper_funcs vc4_txp_crtc_helper_funcs = {
 	.atomic_flush	= vc4_hvs_atomic_flush,
 	.atomic_enable	= vc4_txp_atomic_enable,
 	.atomic_disable	= vc4_txp_atomic_disable,
-	.mode_set_nofb	= vc4_hvs_mode_set_nofb,
 };
 
 static irqreturn_t vc4_txp_interrupt(int irq, void *data)
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
