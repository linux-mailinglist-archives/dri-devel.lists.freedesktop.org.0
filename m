Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA956B64E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E59B113857;
	Fri,  8 Jul 2022 09:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FBC113857
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:11 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 3D49032009AC;
 Fri,  8 Jul 2022 05:58:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 Jul 2022 05:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274289; x=1657360689; bh=/v
 F9zfnycxjK1S1Pqhlug+oosh/ChTm2+6271ft9Ul0=; b=u2k6MSOdTj6KkPYCo9
 Wd9TyrqxfgVvvoktDmp8dIzhhGOI4kJygyWkUd2TDPkP/WjOj1UGqys4MEikV/C9
 xRsR81Q2OOOUgbxKBiNLQjwq746aO+dN2VjfCYrhJ/E2EguFqH/UzDGDFD1xEMLV
 cUPdHTbufmUyO5p/yzQR+DG3cNI++9W8y1i0+eQozE5jjYrpmq3ZjAD5QvuktdoO
 r49j8dR0V3PzFoqi19vlSQmn4vQK6NKJmaRud78owNUHBYAh6SG4CzLhOoDnxlL+
 SJ8Gpko18T18nMJra64SJE6kjBckfWn+cnhvmAqUMRPBZmnAin8fu6IvIRjv5XX+
 v4aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274289; x=1657360689; bh=/vF9zfnycxjK1
 S1Pqhlug+oosh/ChTm2+6271ft9Ul0=; b=IjHYJG3lvAvoOR9UxkmDlZgHWjOyl
 bS+yRomZfMe4CYwH4H++i2FcDIELlLCMMEzFaE+guUFJ++uHZET8BH1doPY4djQ9
 wRUxZFeLZQahesRjyG27M9F/8GwxmJEXo/Q1X4XXeyDUM9o7AxHWdDEppjwaTgwT
 cFVF0u+Xxq8UNubFw9EbCJouRyjEttxXhFNgGC3oqqAewNjMmomqN36QSrKplF6T
 sIQ0U/6YCv+gNbQTdq2ojXt+66cQ+5lYor+bBeOhDo+v0kuT0ps7DB5Y1e+FN5Cf
 3KOsxTu/EJnVJZDkMlp91Orgf5tlRUPnzMJGnHr5oA6FjYrtBozV71Yjw==
X-ME-Sender: <xms:sf_HYrX-AHM0LC6spDGnStVMFRnCK01Oetzpw5-kjL7zFL1aTGC9jw>
 <xme:sf_HYjktFelommsFIEfjcVTwCuZDsIZ60qfXjDyods2FVts4TsR3OPxXCvZ9t3SKa
 KLgwyRFvrvNGEd7DIQ>
X-ME-Received: <xmr:sf_HYnbPkVowbOOfkXjz8DhoaDM4hW8Gaol3RtQ4RxCkGKZoaARlwO0tLvPsUBxhA52VF7aQQhd_8h5ygFSoGCM0YurRhhxJwAEg-TE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sf_HYmXFJGqIxLSfEqgTlZ7QLTrMm7wU3PNjzsm5VmOmbN174cOyJQ>
 <xmx:sf_HYlmOYAYe1YClwXsnunqwKSLr_S9LXmzxs31fIdNBzA0ycu9nQA>
 <xmx:sf_HYjcu81-FxTfGjAE8E41Aq_bkfGHYc0ncbnr-lWego4p-6fyfow>
 <xmx:sf_HYotJG3EYfIcPheUJ15OhA18WdY52knGG3V7UNzEX-m7h_7kBSg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 20/69] drm/vc4: crtc: Move debugfs_name to crtc_data
Date: Fri,  8 Jul 2022 11:56:18 +0200
Message-Id: <20220708095707.257937-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

All the CRTCs, including the TXP, have a debugfs file and name so we can
consolidate it into vc4_crtc_data.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 18 +++++++++---------
 drivers/gpu/drm/vc4/vc4_drv.h  |  4 ++--
 drivers/gpu/drm/vc4/vc4_txp.c  |  1 +
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index d7cc006b22c9..bcce61879d53 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1084,10 +1084,10 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 
 static const struct vc4_pv_data bcm2835_pv0_data = {
 	.base = {
+		.debugfs_name = "crtc0_regs",
 		.hvs_available_channels = BIT(0),
 		.hvs_output = 0,
 	},
-	.debugfs_name = "crtc0_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1098,10 +1098,10 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
 
 static const struct vc4_pv_data bcm2835_pv1_data = {
 	.base = {
+		.debugfs_name = "crtc1_regs",
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
-	.debugfs_name = "crtc1_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1112,10 +1112,10 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
 
 static const struct vc4_pv_data bcm2835_pv2_data = {
 	.base = {
+		.debugfs_name = "crtc2_regs",
 		.hvs_available_channels = BIT(1),
 		.hvs_output = 1,
 	},
-	.debugfs_name = "crtc2_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1126,10 +1126,10 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
 
 static const struct vc4_pv_data bcm2711_pv0_data = {
 	.base = {
+		.debugfs_name = "crtc0_regs",
 		.hvs_available_channels = BIT(0),
 		.hvs_output = 0,
 	},
-	.debugfs_name = "crtc0_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1140,10 +1140,10 @@ static const struct vc4_pv_data bcm2711_pv0_data = {
 
 static const struct vc4_pv_data bcm2711_pv1_data = {
 	.base = {
+		.debugfs_name = "crtc1_regs",
 		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
 		.hvs_output = 3,
 	},
-	.debugfs_name = "crtc1_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1154,10 +1154,10 @@ static const struct vc4_pv_data bcm2711_pv1_data = {
 
 static const struct vc4_pv_data bcm2711_pv2_data = {
 	.base = {
+		.debugfs_name = "crtc2_regs",
 		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
 		.hvs_output = 4,
 	},
-	.debugfs_name = "crtc2_regs",
 	.fifo_depth = 256,
 	.pixels_per_clock = 2,
 	.encoder_types = {
@@ -1167,10 +1167,10 @@ static const struct vc4_pv_data bcm2711_pv2_data = {
 
 static const struct vc4_pv_data bcm2711_pv3_data = {
 	.base = {
+		.debugfs_name = "crtc3_regs",
 		.hvs_available_channels = BIT(1),
 		.hvs_output = 1,
 	},
-	.debugfs_name = "crtc3_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1180,10 +1180,10 @@ static const struct vc4_pv_data bcm2711_pv3_data = {
 
 static const struct vc4_pv_data bcm2711_pv4_data = {
 	.base = {
+		.debugfs_name = "crtc4_regs",
 		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
 		.hvs_output = 5,
 	},
-	.debugfs_name = "crtc4_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 2,
 	.encoder_types = {
@@ -1320,7 +1320,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 
 	platform_set_drvdata(pdev, vc4_crtc);
 
-	vc4_debugfs_add_regset32(drm, pv_data->debugfs_name,
+	vc4_debugfs_add_regset32(drm, pv_data->base.debugfs_name,
 				 &vc4_crtc->regset);
 
 	return 0;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index d935aa3e4409..443894e1715d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -459,6 +459,8 @@ to_vc4_encoder(struct drm_encoder *encoder)
 }
 
 struct vc4_crtc_data {
+	const char *debugfs_name;
+
 	/* Bitmask of channels (FIFOs) of the HVS that the output can source from */
 	unsigned int hvs_available_channels;
 
@@ -476,8 +478,6 @@ struct vc4_pv_data {
 	u8 pixels_per_clock;
 
 	enum vc4_encoder_type encoder_types[4];
-	const char *debugfs_name;
-
 };
 
 struct vc4_crtc {
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index d20b0bc51a18..20e08e31aa1b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -461,6 +461,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 }
 
 static const struct vc4_crtc_data vc4_txp_crtc_data = {
+	.debugfs_name = "txp_regs",
 	.hvs_available_channels = BIT(2),
 	.hvs_output = 2,
 };
-- 
2.36.1

