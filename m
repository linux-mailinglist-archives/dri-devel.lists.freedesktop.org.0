Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBEF219954
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2456EA10;
	Thu,  9 Jul 2020 07:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB836E90C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4C15B333;
 Wed,  8 Jul 2020 13:42:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=N6QhfHbx/i/SB
 X49oKupp16t5Yv/3jecagQWrR4AAuE=; b=q6l1AuehjjlVKFLCLQh+AewmgcA2k
 XAawCtvrEjqj0XJe7Lono6z4vadRAFGiQsl+jPEG1TN7l0eg2jIOAD2bX2jpyhH9
 Aq1G5Y+PPqbzSgM9+o/Bf72zU1F4MugnLktDqn2S5cTfQ/f9x6RJXX6HwSOkxJCm
 KJo42CFc7vVm2+zO0Ff6U8ZeN4sHohdVp6kjIuQURh4tAXShmcQV7aBW03nXglZP
 w5e514KNa+hmBxzTOJC5CRpmlSVRdm3FoucXX0XvHFMAVjTAURT0Oq95lTDVthx6
 bMaXU1mjjHVMCLmVNS4Q+reoky0zjFjNiFghdKWgTsPN052z1iWEdKqqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=N6QhfHbx/i/SBX49oKupp16t5Yv/3jecagQWrR4AAuE=; b=CBtbJ2v0
 LiL0oHja2govMnbYUeCFVzBeKTkmYmFqlx/N+9DfYlikbOjICB2sIb1kTNztky+w
 pONEfBayvS8qEhePb5ArCGNA4SGC49jh/iynpsvpZXHViCKmvKg9kGAu5yNmtrJT
 tHeGMBZzvNdfC5qkcT42BNL+J8izanz+NZR8ZTx4amarPenIv3zJSyARTueowh6i
 36roYhG2rpUieQgCgkTMTpMJLMnqtbtb5tOdFGp5hJwltrc8/h7p9bVkhYKHAi/0
 94xJa8JHofuaZE+O5V+Qn28ecSNjjfMLxut1S59UX+LwiBI6lI4Q9a0RMWhcMlNR
 83X114+GzvSOnQ==
X-ME-Sender: <xms:lQUGX3AE7Q3a2tzJkYKCgYeiklVLVbBmeZ3qtdp7slCQgEF2AvXbiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lQUGX9ifHV-xFquWhsuX9QxDZgARTzEguv4BwTs5y3UoB6wYSmtpyQ>
 <xmx:lQUGXyl3ub-ZfAMrSdIINCKW-kezwdbr7JndtXiU9eMDpaAJUdGilQ>
 <xmx:lQUGX5z-te8FckvibPnqjAv5WKVTdSa9khkHYuTR6QraX7NBNW34_g>
 <xmx:lQUGXxTQDsIXebiuzyS95IWNCYn2TbU3ZCSG2SRYdmiJz1M0bDUijjbs1qc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8511E3280063;
 Wed,  8 Jul 2020 13:42:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 10/78] drm/vc4: crtc: Rename HVS channel to output
Date: Wed,  8 Jul 2020 19:41:18 +0200
Message-Id: <4c3be351dac862a07c30bc32d13de495f1674045.1594230107.git-series.maxime@cerno.tech>
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

In vc5, the HVS has 6 outputs and 3 FIFOs (or channels), with
pixelvalves each being assigned to a given output, but each output can
then be muxed to feed from multiple FIFOs.

Since vc4 had that entirely static, both were probably equivalent, but
since that changes, let's rename hvs_channel to hvs_output in the
vc4_crtc_data, since a pixelvalve is really connected to an output, and
not to a FIFO.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 8 ++++----
 drivers/gpu/drm/vc4/vc4_drv.h  | 4 ++--
 drivers/gpu/drm/vc4/vc4_hvs.c  | 2 +-
 drivers/gpu/drm/vc4/vc4_txp.c  | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index fdecaba77836..d3126fe04d9a 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -775,7 +775,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 
 static const struct vc4_pv_data bcm2835_pv0_data = {
 	.base = {
-		.hvs_channel = 0,
+		.hvs_output = 0,
 	},
 	.debugfs_name = "crtc0_regs",
 	.pixels_per_clock = 1,
@@ -787,7 +787,7 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
 
 static const struct vc4_pv_data bcm2835_pv1_data = {
 	.base = {
-		.hvs_channel = 2,
+		.hvs_output = 2,
 	},
 	.debugfs_name = "crtc1_regs",
 	.pixels_per_clock = 1,
@@ -799,7 +799,7 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
 
 static const struct vc4_pv_data bcm2835_pv2_data = {
 	.base = {
-		.hvs_channel = 1,
+		.hvs_output = 1,
 	},
 	.debugfs_name = "crtc2_regs",
 	.pixels_per_clock = 1,
@@ -862,7 +862,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
 				  crtc_funcs, NULL);
 	drm_crtc_helper_add(crtc, crtc_helper_funcs);
-	vc4_crtc->channel = vc4_crtc->data->hvs_channel;
+	vc4_crtc->channel = vc4_crtc->data->hvs_output;
 	drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
 	drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index d80fc3bbb450..d1cf4c038180 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -447,8 +447,8 @@ to_vc4_encoder(struct drm_encoder *encoder)
 }
 
 struct vc4_crtc_data {
-	/* Which channel of the HVS this pixelvalve sources from. */
-	int hvs_channel;
+	/* Which output of the HVS this pixelvalve sources from. */
+	int hvs_output;
 };
 
 struct vc4_pv_data {
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 091fdf4908aa..6fd9de1dc65a 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -419,7 +419,7 @@ void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc)
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
 
-	if (vc4_crtc->data->hvs_channel == 2) {
+	if (vc4_crtc->data->hvs_output == 2) {
 		u32 dispctrl;
 		u32 dsp3_mux;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index a7c3af0005a0..f39d9900d027 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -452,7 +452,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 }
 
 static const struct vc4_crtc_data vc4_txp_crtc_data = {
-	.hvs_channel = 2,
+	.hvs_output = 2,
 };
 
 static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
