Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C3A21990D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9930A6E9C7;
	Thu,  9 Jul 2020 07:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33B06E90A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0AC812F9;
 Wed,  8 Jul 2020 13:42:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Vk31qh2PWOuZd
 ubIF97PpFQM2/3OoDC4F9L/RGnn0xQ=; b=i1gPCryF+cufE0lgiJol9iMYkNGb2
 pOVlLNWYzBxGZt7S+R28poQB/OonaMKyCWp9MOFmTsoYuPgdIf4zQeTAB3P6q0H1
 B7LISyglHuP6onq20JFHsS9ph4Thg9HVGDWXJ+0yI5kbtL6GSw91p+KLpbvvNtax
 JWls0I62hFiQkBnvSt7aFRUJJV8g5GU0JC3sTbhXgyKmbEx0oiuhEkp4P1GnQsQO
 ruIb/unTyexBikbQQN+qSwAuEsxiPyH6OXjIbICOd2couCzCxradrBCLxerygzJW
 O26T8+otv/l1B/bY/PQdICQhNl27RX+Ee9LwjrhQysSTgft5hwlTCVXmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Vk31qh2PWOuZdubIF97PpFQM2/3OoDC4F9L/RGnn0xQ=; b=B5yYDwh6
 YRVDzqOfeh8ymvovXvZBkzDrvO8SZo/3X17YIWBrDoeo5LWWMCDLLpCrsQAylvtn
 qs10fMIVoNOwbSIpVCPtljYFBJZ4R46XBJEcJBAZa/ut25XhhyYeM24NY8C+AXhi
 DCvViHpN7NUGWczMx5T4wEoyLtQU8O8f3uD4N8sXrXwtXUTbPn1mmIhmiAwv93tw
 N+Z0NmFlbG02937u7DF4CrJxnuwcIoeQhCHMQCunvl4oZqacagJzEG4SokK2UfbQ
 vSykJZky62oRbOdQKG658bHALysWu3v1i+kDr3tVqKgxRYSZUsiuBzk0n3pSet+W
 jy4RygyE59j4JA==
X-ME-Sender: <xms:kQUGXzjPC4nJT8iqGnX4ex7sBeOa59xid4Z_3J9d4MOcS5WCZqNCxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kQUGXwCnydV37ERwvPE_qC2SPxwvooI4Lr-oWZh0bl4-JqmjzYSdHg>
 <xmx:kQUGXzFzRh7KDu_0j5kXI9Z8KaezYPKnF4XZLbGlE8as1euKgErKSw>
 <xmx:kQUGXwR-jCO-hgT0cnOUKAzbP7vDqMj3FpM8waX7ShzukS0EmFZ6Aw>
 <xmx:kQUGXzzx6nl1h7OIJUqetowZYjNDO1n2yYHcxBGB6fHfpazq_GZ6gaF4b-M>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4458130600B1;
 Wed,  8 Jul 2020 13:42:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 07/78] drm/vc4: crtc: Deal with different number of pixel
 per clock
Date: Wed,  8 Jul 2020 19:41:15 +0200
Message-Id: <6cfe86334d4f13df3d1fc655321172ade621acca.1594230107.git-series.maxime@cerno.tech>
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

Some of the HDMI pixelvalves in vc5 output two pixels per clock cycle.
Let's put the number of pixel output per clock cycle in the CRTC data and
update the various calculations to reflect that.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 18 +++++++++++-------
 drivers/gpu/drm/vc4/vc4_drv.h  |  3 +++
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 6d8fa6118fc1..e55b2208b4b7 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -235,6 +235,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
 	struct drm_crtc_state *state = crtc->state;
 	struct drm_display_mode *mode = &state->adjusted_mode;
 	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -242,6 +243,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	bool is_dsi = (vc4_encoder->type == VC4_ENCODER_TYPE_DSI0 ||
 		       vc4_encoder->type == VC4_ENCODER_TYPE_DSI1);
 	u32 format = is_dsi ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
+	u8 ppc = pv_data->pixels_per_clock;
 
 	/* Reset the PV fifo. */
 	CRTC_WRITE(PV_CONTROL, 0);
@@ -249,17 +251,16 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
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
@@ -761,6 +762,7 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
 		.hvs_channel = 0,
 	},
 	.debugfs_name = "crtc0_regs",
+	.pixels_per_clock = 1,
 	.encoder_types = {
 		[PV_CONTROL_CLK_SELECT_DSI] = VC4_ENCODER_TYPE_DSI0,
 		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_DPI,
@@ -772,6 +774,7 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
 		.hvs_channel = 2,
 	},
 	.debugfs_name = "crtc1_regs",
+	.pixels_per_clock = 1,
 	.encoder_types = {
 		[PV_CONTROL_CLK_SELECT_DSI] = VC4_ENCODER_TYPE_DSI1,
 		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_SMI,
@@ -783,6 +786,7 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
 		.hvs_channel = 1,
 	},
 	.debugfs_name = "crtc2_regs",
+	.pixels_per_clock = 1,
 	.encoder_types = {
 		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_HDMI,
 		[PV_CONTROL_CLK_SELECT_VEC] = VC4_ENCODER_TYPE_VEC,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6358f6ca8d56..0bc150daafb2 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -454,6 +454,9 @@ struct vc4_crtc_data {
 struct vc4_pv_data {
 	struct vc4_crtc_data	base;
 
+	/* Number of pixels output per clock period */
+	u8 pixels_per_clock;
+
 	enum vc4_encoder_type encoder_types[4];
 	const char *debugfs_name;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
