Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900E1B7FFC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC5F6EB42;
	Fri, 24 Apr 2020 20:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C10896B5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id CDD4A145B;
 Fri, 24 Apr 2020 11:36:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=vdM/4XaeVSUc3
 VqHyRlaM8vqrseDJanMHFILNJC9PX0=; b=x8B2LxEAMRZyXWK99Sk1PTBTza0SD
 83wuoOqnQFNtnXxKA16H7UMcxEi1kjGqVK4+bVBJgpB+lDlUUhBIUt6liQCn/nJ5
 57sb3R9gqk+gStMtkLpXrkM2FOpK8qVKJjHBWii1iprx7KDC7sj8OlpFNx8xsdk5
 sf94eICOB1+5uXAr7FXoTnU7wYzt6Mfr42KUTX5kEy9gAD/X2lgWh5zkcFcUJj0P
 1J5IEuYx7c6WdINdM3pXMfCpnZNbsmaKUlA3IWSt47Pf+1tH5Tgj03yJEKGgyFks
 OBHZ/+zgh6Ut5QVTgrvgFG8P36vn4SZMylK25aW94tckwIRB3WW8OmJnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vdM/4XaeVSUc3VqHyRlaM8vqrseDJanMHFILNJC9PX0=; b=pWGWRSth
 oBGfTXWypP+i+f1aeAP9zjRMmhKLym6dndfru4+pEk/p2/Ien6t1AqiSHTZcrmsu
 c+FvoXC1lNCXHoFYCikUgSILXWdPItve3qjsuISm1jApIXdRhtXipy1/mY+wiVxp
 l6gHyhAQocUEyY3eW9288pCQ3ogjpcbTB4hQKJ/nn3YAYFvM8rWAOmQFRsETJ8PA
 LjX1VOaMcqapMMG5NZIJEsMkOE/ajgAE9z6LKgqBVwwcCTwhyrMI1iuVItggUc2y
 ofasyXXT4Yn7xLqCfVnCGt8Owp/laiO9cDQZBfcVNu+hXg4DfVZrYG/TsErfZ471
 490lUB0RQMvetg==
X-ME-Sender: <xms:eQejXjSR-oMqdDc7vQp4VkkE8SljBPjNTJQlBnaeiLlfapv_AQOdvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefkeenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eQejXmAQtflvpsSQJh4ROot4_j8HXJ_z5q6Sn4ElqF8rpxTUUCpEug>
 <xmx:eQejXqndF_5bkkKXC_hAWoNRKVrbaY1nAf4WYxSlqvLD3AaGw50vAA>
 <xmx:eQejXsePmNfhCLedZdRMwc7FR3SyNHH7rvJCUbi5hxSr79FoBCoGaw>
 <xmx:eQejXhAij-H5vRmxP8D-WPeggIkfA14B7ahxgeAarE0dW_PxJYHlYN-1tdQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18C933065D93;
 Fri, 24 Apr 2020 11:36:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 45/91] drm/vc4: crtc: Deal with different number of pixel
 per clock
Date: Fri, 24 Apr 2020 17:34:26 +0200
Message-Id: <52788447bf78006f79bdf365ec152db4c838abe4.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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

Some of the HDMI pixelvalves in vc5 output two pixels per clock cycle.
Let's put the number of pixel output per clock cycle in the CRTC data and
update the various calculations to reflect that.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 17 ++++++++++-------
 drivers/gpu/drm/vc4/vc4_drv.h  |  3 +++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 9718df881fab..be264da1a13f 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -282,6 +282,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	bool is_dsi = (vc4_encoder->type == VC4_ENCODER_TYPE_DSI0 ||
 		       vc4_encoder->type == VC4_ENCODER_TYPE_DSI1);
 	u32 format = is_dsi ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
+	u8 ppc = vc4_crtc->data->pixels_per_clock;
 
 	/* Reset the PV fifo. */
 	CRTC_WRITE(PV_CONTROL, 0);
@@ -289,17 +290,16 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	CRTC_WRITE(PV_CONTROL, 0);
 
 	CRTC_WRITE(PV_HORZA,
-		   VC4_SET_FIELD((mode->htotal -
-				  mode->hsync_end) * pixel_rep,
+		   VC4_SET_FIELD((mode->htotal - mode->hsync_end) * pixel_rep / ppc,
 				 PV_HORZA_HBP) |
-		   VC4_SET_FIELD((mode->hsync_end -
-				  mode->hsync_start) * pixel_rep,
+		   VC4_SET_FIELD((mode->hsync_end - mode->hsync_start) * pixel_rep / ppc,
 				 PV_HORZA_HSYNC));
+
 	CRTC_WRITE(PV_HORZB,
-		   VC4_SET_FIELD((mode->hsync_start -
-				  mode->hdisplay) * pixel_rep,
+		   VC4_SET_FIELD((mode->hsync_start - mode->hdisplay) * pixel_rep / ppc,
 				 PV_HORZB_HFP) |
-		   VC4_SET_FIELD(mode->hdisplay * pixel_rep, PV_HORZB_HACTIVE));
+		   VC4_SET_FIELD(mode->hdisplay * pixel_rep / ppc,
+				 PV_HORZB_HACTIVE));
 
 	CRTC_WRITE(PV_VERTA,
 		   VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end,
@@ -1040,6 +1040,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 static const struct vc4_crtc_data bcm2835_pv0_data = {
 	.hvs_channel = 0,
 	.debugfs_name = "crtc0_regs",
+	.pixels_per_clock = 1,
 	.encoder_types = {
 		[PV_CONTROL_CLK_SELECT_DSI] = VC4_ENCODER_TYPE_DSI0,
 		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_DPI,
@@ -1049,6 +1050,7 @@ static const struct vc4_crtc_data bcm2835_pv0_data = {
 static const struct vc4_crtc_data bcm2835_pv1_data = {
 	.hvs_channel = 2,
 	.debugfs_name = "crtc1_regs",
+	.pixels_per_clock = 1,
 	.encoder_types = {
 		[PV_CONTROL_CLK_SELECT_DSI] = VC4_ENCODER_TYPE_DSI1,
 		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_SMI,
@@ -1058,6 +1060,7 @@ static const struct vc4_crtc_data bcm2835_pv1_data = {
 static const struct vc4_crtc_data bcm2835_pv2_data = {
 	.hvs_channel = 1,
 	.debugfs_name = "crtc2_regs",
+	.pixels_per_clock = 1,
 	.encoder_types = {
 		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_HDMI,
 		[PV_CONTROL_CLK_SELECT_VEC] = VC4_ENCODER_TYPE_VEC,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 487ad72c284d..cda738dbd6c1 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -453,6 +453,9 @@ struct vc4_crtc_data {
 	/* Which channel of the HVS this pixelvalve sources from. */
 	int hvs_channel;
 
+	/* Number of pixels output per clock period */
+	u8 pixels_per_clock;
+
 	enum vc4_encoder_type encoder_types[4];
 	const char *debugfs_name;
 };
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
