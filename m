Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B2416A281
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84156E2F2;
	Mon, 24 Feb 2020 09:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A170A6E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id A3AB6616;
 Mon, 24 Feb 2020 04:10:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=QFR9nHp7F+P+7
 34zbmmAryfq7g/fYNuR2nVgr5psw5M=; b=gmi9YG+UBXZePPsPMJzO7B5GhfCQv
 Vn2sLGyP9a6LQSD7vQR1+cpnt/eAnRju8+eQz0lSXbkNIbdkSzfW+GR2bxaTyemQ
 svL/G9TJO7OJwxjUosTrmYkPshgWEyu8MkANg/W2NKM0b1agwtawoOJTA9xFc96h
 07xLlXNHF6+Im8U7/5yUTGEHLsSd5y/8jEZgAa3nXRPo897Pea0A9D4WXsN5pvmc
 GszpEmKENksPy6Vxhbur9vkp3u9nlDG/yxAjASi0qpEYEG/D0aT9+ntEtkINf/as
 RAxNlg9mF/xPJP7HODju8PnI5nhMCQn0KMKGpg8gDJTp8Df72DEO5q8SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=QFR9nHp7F+P+734zbmmAryfq7g/fYNuR2nVgr5psw5M=; b=XSJiivHx
 HZWpj48edyXFOuecYekqZcO8+dpnxr+3Hq/dhsDOLXPFF8L69UDUzhWXgoroHfab
 STi4M10IFR85BOzSekz76Z5/O8JFKHGq+iRWwovfHpQlbCsN5di8MpTVwCdaiJoE
 hT9EopTdafoAUGjaVzRQ6gaImaGOkblR0ftd+XNcZB9eTqz40iCQjgcPuehP/qQU
 fRYH6JcEIZhzH75/BV2y2d1L7ICmceLKuHd8kG5tZII83RsmNZzh8ARAqk/mf9ee
 Syou7da1Ibs9BCTwVhuZjIALggt59LlBL5HKn+psh5O720WR8GYHeH4Gmx6JOjBe
 k4k679QkXnDiBA==
X-ME-Sender: <xms:_5JTXobNJDeXnmuelkMEeBqT1WhhR3ohjEVLr2G9pm-ImUKinYKiew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrihhnpegshi
 htvghsrdgurghtrgenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrth
 gvtghh
X-ME-Proxy: <xmx:_5JTXmV8ZxQdl4tvRy00uT8qC68711yWG4on0w8rB4WpUbFHFSaZlw>
 <xmx:_5JTXnKA8ATEcBWhlVbOxvRWDIu-mKk5Fd6temQqQGue_KERRe8nnQ>
 <xmx:_5JTXv2flZKkJ8-S69PAC5k8JOkQ7tXG2qw4BbXJfMIC68njLNMBSg>
 <xmx:_5JTXpS2jpkIuoikx1B_zXfJjM7EN8J6talYyWPk8JiADuQnbU8QIgbS3So>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C78AA3060BD1;
 Mon, 24 Feb 2020 04:10:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 65/89] drm/vc4: hdmi: Rename hdmi to vc4_hdmi
Date: Mon, 24 Feb 2020 10:07:07 +0100
Message-Id: <a4ebd977130db384dd720d5be8ffd886a9175ffe.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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

The driver isn't consistent with the name given to the vc4_hdmi
structure pointer in its functions. Make sure to use a consistent name.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 265 +++++++++++++++++-----------------
 1 file changed, 133 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4964ec6f5608..a08c25e0c056 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -108,11 +108,11 @@ static const struct debugfs_reg32 hd_regs[] = {
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct vc4_hdmi *hdmi = node->info_ent->data;
+	struct vc4_hdmi *vc4_hdmi = node->info_ent->data;
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	drm_print_regset32(&p, &hdmi->hdmi_regset);
-	drm_print_regset32(&p, &hdmi->hd_regset);
+	drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
+	drm_print_regset32(&p, &vc4_hdmi->hd_regset);
 
 	return 0;
 }
@@ -299,8 +299,8 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_dev *vc4 = encoder->dev->dev_private;
-	struct vc4_hdmi *hdmi = vc4->hdmi;
-	struct drm_connector *connector = &hdmi->connector.base;
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 	struct drm_connector_state *cstate = connector->state;
 	struct drm_crtc *crtc = encoder->crtc;
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
@@ -345,7 +345,7 @@ static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
 {
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = drm->dev_private;
-	struct vc4_hdmi *hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	union hdmi_infoframe frame;
 	int ret;
 
@@ -354,7 +354,7 @@ static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
 	frame.audio.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
 	frame.audio.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
 	frame.audio.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
-	frame.audio.channels = hdmi->audio.channels;
+	frame.audio.channels = vc4_hdmi->audio.channels;
 
 	vc4_hdmi_write_infoframe(encoder, &frame);
 }
@@ -369,7 +369,7 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_hdmi *hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	int ret;
 
 	HDMI_WRITE(VC4_HDMI_RAM_PACKET_CONFIG, 0);
@@ -378,9 +378,9 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 	HD_WRITE(VC4_HD_VID_CTL,
 		 HD_READ(VC4_HD_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
 
-	clk_disable_unprepare(hdmi->pixel_clock);
+	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
-	ret = pm_runtime_put(&hdmi->pdev->dev);
+	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
 	if (ret < 0)
 		DRM_ERROR("Failed to release power domain: %d\n", ret);
 }
@@ -391,7 +391,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct drm_device *dev = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_hdmi *hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	bool debug_dump_regs = false;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
@@ -413,13 +413,13 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	u32 csc_ctl;
 	int ret;
 
-	ret = pm_runtime_get_sync(&hdmi->pdev->dev);
+	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to retain power domain: %d\n", ret);
 		return;
 	}
 
-	ret = clk_set_rate(hdmi->pixel_clock,
+	ret = clk_set_rate(vc4_hdmi->pixel_clock,
 			   mode->clock * 1000 *
 			   ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1));
 	if (ret) {
@@ -427,7 +427,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
-	ret = clk_prepare_enable(hdmi->pixel_clock);
+	ret = clk_prepare_enable(vc4_hdmi->pixel_clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on pixel clock: %d\n", ret);
 		return;
@@ -447,11 +447,11 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	HDMI_WRITE(VC4_HDMI_TX_PHY_RESET_CTL, 0);
 
 	if (debug_dump_regs) {
-		struct drm_printer p = drm_info_printer(&hdmi->pdev->dev);
+		struct drm_printer p = drm_info_printer(&vc4_hdmi->pdev->dev);
 
-		dev_info(&hdmi->pdev->dev, "HDMI regs before:\n");
-		drm_print_regset32(&p, &hdmi->hdmi_regset);
-		drm_print_regset32(&p, &hdmi->hd_regset);
+		dev_info(&vc4_hdmi->pdev->dev, "HDMI regs before:\n");
+		drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
+		drm_print_regset32(&p, &vc4_hdmi->hd_regset);
 	}
 
 	HD_WRITE(VC4_HD_VID_CTL, 0);
@@ -526,11 +526,11 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	HDMI_WRITE(VC4_HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 
 	if (debug_dump_regs) {
-		struct drm_printer p = drm_info_printer(&hdmi->pdev->dev);
+		struct drm_printer p = drm_info_printer(&vc4_hdmi->pdev->dev);
 
-		dev_info(&hdmi->pdev->dev, "HDMI regs after:\n");
-		drm_print_regset32(&p, &hdmi->hdmi_regset);
-		drm_print_regset32(&p, &hdmi->hd_regset);
+		dev_info(&vc4_hdmi->pdev->dev, "HDMI regs after:\n");
+		drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
+		drm_print_regset32(&p, &vc4_hdmi->hd_regset);
 	}
 
 	HD_WRITE(VC4_HD_VID_CTL,
@@ -617,15 +617,15 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 };
 
 /* HDMI audio codec callbacks */
-static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *hdmi)
+static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
-	u32 hsm_clock = clk_get_rate(hdmi->hsm_clock);
+	u32 hsm_clock = clk_get_rate(vc4_hdmi->hsm_clock);
 	unsigned long n, m;
 
-	rational_best_approximation(hsm_clock, hdmi->audio.samplerate,
+	rational_best_approximation(hsm_clock, vc4_hdmi->audio.samplerate,
 				    VC4_HD_MAI_SMP_N_MASK >>
 				    VC4_HD_MAI_SMP_N_SHIFT,
 				    (VC4_HD_MAI_SMP_M_MASK >>
@@ -637,14 +637,14 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *hdmi)
 		 VC4_SET_FIELD(m - 1, VC4_HD_MAI_SMP_M));
 }
 
-static void vc4_hdmi_set_n_cts(struct vc4_hdmi *hdmi)
+static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_crtc *crtc = encoder->crtc;
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	u32 samplerate = hdmi->audio.samplerate;
+	u32 samplerate = vc4_hdmi->audio.samplerate;
 	u32 n, cts;
 	u64 tmp;
 
@@ -676,16 +676,16 @@ static inline struct vc4_hdmi *dai_to_hdmi(struct snd_soc_dai *dai)
 static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
-	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = &hdmi->encoder.base.base;
-	struct drm_connector *connector = &hdmi->connector.base;
+	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 	struct vc4_dev *vc4 = to_vc4_dev(encoder->dev);
 	int ret;
 
-	if (hdmi->audio.substream && hdmi->audio.substream != substream)
+	if (vc4_hdmi->audio.substream && vc4_hdmi->audio.substream != substream)
 		return -EINVAL;
 
-	hdmi->audio.substream = substream;
+	vc4_hdmi->audio.substream = substream;
 
 	/*
 	 * If the HDMI encoder hasn't probed, or the encoder is
@@ -707,11 +707,11 @@ static int vc4_hdmi_audio_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static void vc4_hdmi_audio_reset(struct vc4_hdmi *hdmi)
+static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
-	struct device *dev = &hdmi->pdev->dev;
+	struct device *dev = &vc4_hdmi->pdev->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	int ret;
 
@@ -727,14 +727,14 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *hdmi)
 static void vc4_hdmi_audio_shutdown(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
-	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
+	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
 
-	if (substream != hdmi->audio.substream)
+	if (substream != vc4_hdmi->audio.substream)
 		return;
 
-	vc4_hdmi_audio_reset(hdmi);
+	vc4_hdmi_audio_reset(vc4_hdmi);
 
-	hdmi->audio.substream = NULL;
+	vc4_hdmi->audio.substream = NULL;
 }
 
 /* HDMI audio codec callbacks */
@@ -742,23 +742,23 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params,
 				    struct snd_soc_dai *dai)
 {
-	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
-	struct device *dev = &hdmi->pdev->dev;
+	struct device *dev = &vc4_hdmi->pdev->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map, i;
 
-	if (substream != hdmi->audio.substream)
+	if (substream != vc4_hdmi->audio.substream)
 		return -EINVAL;
 
 	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		params_rate(params), params_width(params),
 		params_channels(params));
 
-	hdmi->audio.channels = params_channels(params);
-	hdmi->audio.samplerate = params_rate(params);
+	vc4_hdmi->audio.channels = params_channels(params);
+	vc4_hdmi->audio.samplerate = params_rate(params);
 
 	HD_WRITE(VC4_HD_MAI_CTL,
 		 VC4_HD_MAI_CTL_RESET |
@@ -767,23 +767,23 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 		 VC4_HD_MAI_CTL_ERRORE |
 		 VC4_HD_MAI_CTL_ERRORF);
 
-	vc4_hdmi_audio_set_mai_clock(hdmi);
+	vc4_hdmi_audio_set_mai_clock(vc4_hdmi);
 
 	audio_packet_config =
 		VC4_HDMI_AUDIO_PACKET_ZERO_DATA_ON_SAMPLE_FLAT |
 		VC4_HDMI_AUDIO_PACKET_ZERO_DATA_ON_INACTIVE_CHANNELS |
 		VC4_SET_FIELD(0xf, VC4_HDMI_AUDIO_PACKET_B_FRAME_IDENTIFIER);
 
-	channel_mask = GENMASK(hdmi->audio.channels - 1, 0);
+	channel_mask = GENMASK(vc4_hdmi->audio.channels - 1, 0);
 	audio_packet_config |= VC4_SET_FIELD(channel_mask,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
 	/* Set the MAI threshold.  This logic mimics the firmware's. */
-	if (hdmi->audio.samplerate > 96000) {
+	if (vc4_hdmi->audio.samplerate > 96000) {
 		HD_WRITE(VC4_HD_MAI_THR,
 			 VC4_SET_FIELD(0x12, VC4_HD_MAI_THR_DREQHIGH) |
 			 VC4_SET_FIELD(0x12, VC4_HD_MAI_THR_DREQLOW));
-	} else if (hdmi->audio.samplerate > 48000) {
+	} else if (vc4_hdmi->audio.samplerate > 48000) {
 		HD_WRITE(VC4_HD_MAI_THR,
 			 VC4_SET_FIELD(0x14, VC4_HD_MAI_THR_DREQHIGH) |
 			 VC4_SET_FIELD(0x12, VC4_HD_MAI_THR_DREQLOW));
@@ -807,7 +807,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 
 	HDMI_WRITE(VC4_HDMI_MAI_CHANNEL_MAP, channel_map);
 	HDMI_WRITE(VC4_HDMI_AUDIO_PACKET_CONFIG, audio_packet_config);
-	vc4_hdmi_set_n_cts(hdmi);
+	vc4_hdmi_set_n_cts(vc4_hdmi);
 
 	return 0;
 }
@@ -815,8 +815,8 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
-	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
@@ -827,7 +827,7 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 			   HDMI_READ(VC4_HDMI_TX_PHY_CTL0) &
 			   ~VC4_HDMI_TX_PHY_RNG_PWRDN);
 		HD_WRITE(VC4_HD_MAI_CTL,
-			 VC4_SET_FIELD(hdmi->audio.channels,
+			 VC4_SET_FIELD(vc4_hdmi->audio.channels,
 				       VC4_HD_MAI_CTL_CHNUM) |
 			 VC4_HD_MAI_CTL_ENABLE);
 		break;
@@ -859,8 +859,8 @@ static int vc4_hdmi_audio_eld_ctl_info(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_info *uinfo)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct vc4_hdmi *hdmi = snd_component_to_hdmi(component);
-	struct drm_connector *connector = &hdmi->connector.base;
+	struct vc4_hdmi *vc4_hdmi = snd_component_to_hdmi(component);
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
 	uinfo->count = sizeof(connector->eld);
@@ -872,8 +872,8 @@ static int vc4_hdmi_audio_eld_ctl_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct vc4_hdmi *hdmi = snd_component_to_hdmi(component);
-	struct drm_connector *connector = &hdmi->connector.base;
+	struct vc4_hdmi *vc4_hdmi = snd_component_to_hdmi(component);
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 
 	memcpy(ucontrol->value.bytes.data, connector->eld,
 	       sizeof(connector->eld));
@@ -941,9 +941,9 @@ static const struct snd_soc_component_driver vc4_hdmi_audio_cpu_dai_comp = {
 
 static int vc4_hdmi_audio_cpu_dai_probe(struct snd_soc_dai *dai)
 {
-	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
+	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
 
-	snd_soc_dai_init_dma_data(dai, &hdmi->audio.dma_data, NULL);
+	snd_soc_dai_init_dma_data(dai, &vc4_hdmi->audio.dma_data, NULL);
 
 	return 0;
 }
@@ -969,11 +969,11 @@ static const struct snd_dmaengine_pcm_config pcm_conf = {
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
 };
 
-static int vc4_hdmi_audio_init(struct vc4_hdmi *hdmi)
+static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
-	struct snd_soc_dai_link *dai_link = &hdmi->audio.link;
-	struct snd_soc_card *card = &hdmi->audio.card;
-	struct device *dev = &hdmi->pdev->dev;
+	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
+	struct snd_soc_card *card = &vc4_hdmi->audio.card;
+	struct device *dev = &vc4_hdmi->pdev->dev;
 	const __be32 *addr;
 	int ret;
 
@@ -991,9 +991,9 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *hdmi)
 	 * This VC/MMU should probably be exposed to avoid this kind of hacks.
 	 */
 	addr = of_get_address(dev->of_node, 1, NULL, NULL);
-	hdmi->audio.dma_data.addr = be32_to_cpup(addr) + VC4_HD_MAI_DATA;
-	hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	hdmi->audio.dma_data.maxburst = 2;
+	vc4_hdmi->audio.dma_data.addr = be32_to_cpup(addr) + VC4_HD_MAI_DATA;
+	vc4_hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	vc4_hdmi->audio.dma_data.maxburst = 2;
 
 	ret = devm_snd_dmaengine_pcm_register(dev, &pcm_conf, 0);
 	if (ret) {
@@ -1016,9 +1016,9 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *hdmi)
 		return ret;
 	}
 
-	dai_link->cpus		= &hdmi->audio.cpu;
-	dai_link->codecs	= &hdmi->audio.codec;
-	dai_link->platforms	= &hdmi->audio.platform;
+	dai_link->cpus		= &vc4_hdmi->audio.cpu;
+	dai_link->codecs	= &vc4_hdmi->audio.codec;
+	dai_link->platforms	= &vc4_hdmi->audio.platform;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
@@ -1043,7 +1043,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *hdmi)
 	 * now stored in card->drvdata and should be retrieved with
 	 * snd_soc_card_get_drvdata() if needed.
 	 */
-	snd_soc_card_set_drvdata(card, hdmi);
+	snd_soc_card_set_drvdata(card, vc4_hdmi);
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret)
 		dev_err(dev, "Could not register sound card: %d\n", ret);
@@ -1056,20 +1056,21 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *hdmi)
 static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 {
 	struct vc4_dev *vc4 = priv;
-	struct vc4_hdmi *hdmi = vc4->hdmi;
-
-	if (hdmi->cec_irq_was_rx) {
-		if (hdmi->cec_rx_msg.len)
-			cec_received_msg(hdmi->cec_adap, &hdmi->cec_rx_msg);
-	} else if (hdmi->cec_tx_ok) {
-		cec_transmit_done(hdmi->cec_adap, CEC_TX_STATUS_OK,
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+
+	if (vc4_hdmi->cec_irq_was_rx) {
+		if (vc4_hdmi->cec_rx_msg.len)
+			cec_received_msg(vc4_hdmi->cec_adap,
+					 &vc4_hdmi->cec_rx_msg);
+	} else if (vc4_hdmi->cec_tx_ok) {
+		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_OK,
 				  0, 0, 0, 0);
 	} else {
 		/*
 		 * This CEC implementation makes 1 retry, so if we
 		 * get a NACK, then that means it made 2 attempts.
 		 */
-		cec_transmit_done(hdmi->cec_adap, CEC_TX_STATUS_NACK,
+		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_NACK,
 				  0, 2, 0, 0);
 	}
 	return IRQ_HANDLED;
@@ -1095,23 +1096,23 @@ static void vc4_cec_read_msg(struct vc4_dev *vc4, u32 cntrl1)
 static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 {
 	struct vc4_dev *vc4 = priv;
-	struct vc4_hdmi *hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	u32 stat = HDMI_READ(VC4_HDMI_CPU_STATUS);
 	u32 cntrl1, cntrl5;
 
 	if (!(stat & VC4_HDMI_CPU_CEC))
 		return IRQ_NONE;
-	hdmi->cec_rx_msg.len = 0;
+	vc4_hdmi->cec_rx_msg.len = 0;
 	cntrl1 = HDMI_READ(VC4_HDMI_CEC_CNTRL_1);
 	cntrl5 = HDMI_READ(VC4_HDMI_CEC_CNTRL_5);
-	hdmi->cec_irq_was_rx = cntrl5 & VC4_HDMI_CEC_RX_CEC_INT;
-	if (hdmi->cec_irq_was_rx) {
+	vc4_hdmi->cec_irq_was_rx = cntrl5 & VC4_HDMI_CEC_RX_CEC_INT;
+	if (vc4_hdmi->cec_irq_was_rx) {
 		vc4_cec_read_msg(vc4, cntrl1);
 		cntrl1 |= VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
 		HDMI_WRITE(VC4_HDMI_CEC_CNTRL_1, cntrl1);
 		cntrl1 &= ~VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
 	} else {
-		hdmi->cec_tx_ok = cntrl1 & VC4_HDMI_CEC_TX_STATUS_GOOD;
+		vc4_hdmi->cec_tx_ok = cntrl1 & VC4_HDMI_CEC_TX_STATUS_GOOD;
 		cntrl1 &= ~VC4_HDMI_CEC_START_XMIT_BEGIN;
 	}
 	HDMI_WRITE(VC4_HDMI_CEC_CNTRL_1, cntrl1);
@@ -1213,44 +1214,44 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
-	struct vc4_hdmi *hdmi;
+	struct vc4_hdmi *vc4_hdmi;
 	struct drm_encoder *encoder;
 	struct device_node *ddc_node;
 	u32 value;
 	int ret;
 
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
+	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
+	if (!vc4_hdmi)
 		return -ENOMEM;
 
-	hdmi->pdev = pdev;
-	encoder = &hdmi->encoder.base.base;
+	vc4_hdmi->pdev = pdev;
+	encoder = &vc4_hdmi->encoder.base.base;
 	encoder->base.type = VC4_ENCODER_TYPE_HDMI0;
 
-	hdmi->hdmicore_regs = vc4_ioremap_regs(pdev, 0);
-	if (IS_ERR(hdmi->hdmicore_regs))
-		return PTR_ERR(hdmi->hdmicore_regs);
+	vc4_hdmi->hdmicore_regs = vc4_ioremap_regs(pdev, 0);
+	if (IS_ERR(vc4_hdmi->hdmicore_regs))
+		return PTR_ERR(vc4_hdmi->hdmicore_regs);
 
-	hdmi->hd_regs = vc4_ioremap_regs(pdev, 1);
-	if (IS_ERR(hdmi->hd_regs))
-		return PTR_ERR(hdmi->hd_regs);
+	vc4_hdmi->hd_regs = vc4_ioremap_regs(pdev, 1);
+	if (IS_ERR(vc4_hdmi->hd_regs))
+		return PTR_ERR(vc4_hdmi->hd_regs);
 
-	hdmi->hdmi_regset.base = hdmi->hdmicore_regs;
-	hdmi->hdmi_regset.regs = hdmi_regs;
-	hdmi->hdmi_regset.nregs = ARRAY_SIZE(hdmi_regs);
-	hdmi->hd_regset.base = hdmi->hd_regs;
-	hdmi->hd_regset.regs = hd_regs;
-	hdmi->hd_regset.nregs = ARRAY_SIZE(hd_regs);
+	vc4_hdmi->hdmi_regset.base = vc4_hdmi->hdmicore_regs;
+	vc4_hdmi->hdmi_regset.regs = hdmi_regs;
+	vc4_hdmi->hdmi_regset.nregs = ARRAY_SIZE(hdmi_regs);
+	vc4_hdmi->hd_regset.base = vc4_hdmi->hd_regs;
+	vc4_hdmi->hd_regset.regs = hd_regs;
+	vc4_hdmi->hd_regset.nregs = ARRAY_SIZE(hd_regs);
 
-	hdmi->pixel_clock = devm_clk_get(dev, "pixel");
-	if (IS_ERR(hdmi->pixel_clock)) {
+	vc4_hdmi->pixel_clock = devm_clk_get(dev, "pixel");
+	if (IS_ERR(vc4_hdmi->pixel_clock)) {
 		DRM_ERROR("Failed to get pixel clock\n");
-		return PTR_ERR(hdmi->pixel_clock);
+		return PTR_ERR(vc4_hdmi->pixel_clock);
 	}
-	hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
-	if (IS_ERR(hdmi->hsm_clock)) {
+	vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
+	if (IS_ERR(vc4_hdmi->hsm_clock)) {
 		DRM_ERROR("Failed to get HDMI state machine clock\n");
-		return PTR_ERR(hdmi->hsm_clock);
+		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
 
 	ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
@@ -1259,9 +1260,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return -ENODEV;
 	}
 
-	hdmi->ddc = of_find_i2c_adapter_by_node(ddc_node);
+	vc4_hdmi->ddc = of_find_i2c_adapter_by_node(ddc_node);
 	of_node_put(ddc_node);
-	if (!hdmi->ddc) {
+	if (!vc4_hdmi->ddc) {
 		DRM_DEBUG("Failed to get ddc i2c adapter by node\n");
 		return -EPROBE_DEFER;
 	}
@@ -1270,13 +1271,13 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	 * needs to be a bit higher than the pixel clock rate
 	 * (generally 148.5Mhz).
 	 */
-	ret = clk_set_rate(hdmi->hsm_clock, HSM_CLOCK_FREQ);
+	ret = clk_set_rate(vc4_hdmi->hsm_clock, HSM_CLOCK_FREQ);
 	if (ret) {
 		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
 		goto err_put_i2c;
 	}
 
-	ret = clk_prepare_enable(hdmi->hsm_clock);
+	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on HDMI state machine clock: %d\n",
 			  ret);
@@ -1289,18 +1290,18 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (of_find_property(dev->of_node, "hpd-gpios", &value)) {
 		enum of_gpio_flags hpd_gpio_flags;
 
-		hdmi->hpd_gpio = of_get_named_gpio_flags(dev->of_node,
+		vc4_hdmi->hpd_gpio = of_get_named_gpio_flags(dev->of_node,
 							 "hpd-gpios", 0,
 							 &hpd_gpio_flags);
-		if (hdmi->hpd_gpio < 0) {
-			ret = hdmi->hpd_gpio;
+		if (vc4_hdmi->hpd_gpio < 0) {
+			ret = vc4_hdmi->hpd_gpio;
 			goto err_unprepare_hsm;
 		}
 
-		hdmi->hpd_active_low = hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
+		vc4_hdmi->hpd_active_low = hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
 	}
 
-	vc4->hdmi = hdmi;
+	vc4->hdmi = vc4_hdmi;
 
 	/* HDMI core must be enabled. */
 	if (!(HD_READ(VC4_HD_M_CTL) & VC4_HD_M_ENABLE)) {
@@ -1321,11 +1322,11 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		goto err_destroy_encoder;
 
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
-	hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
+	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 					      vc4, "vc4",
 					      CEC_CAP_DEFAULTS |
 					      CEC_CAP_CONNECTOR_INFO, 1);
-	ret = PTR_ERR_OR_ZERO(hdmi->cec_adap);
+	ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
 	if (ret < 0)
 		goto err_destroy_conn;
 
@@ -1349,32 +1350,32 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 					"vc4 hdmi cec", vc4);
 	if (ret)
 		goto err_delete_cec_adap;
-	ret = cec_register_adapter(hdmi->cec_adap, dev);
+	ret = cec_register_adapter(vc4_hdmi->cec_adap, dev);
 	if (ret < 0)
 		goto err_delete_cec_adap;
 #endif
 
-	ret = vc4_hdmi_audio_init(hdmi);
+	ret = vc4_hdmi_audio_init(vc4_hdmi);
 	if (ret)
 		goto err_destroy_encoder;
 
-	vc4_debugfs_add_file(drm, "hdmi_regs", vc4_hdmi_debugfs_regs, hdmi);
+	vc4_debugfs_add_file(drm, "hdmi_regs", vc4_hdmi_debugfs_regs, vc4_hdmi);
 
 	return 0;
 
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 err_delete_cec_adap:
-	cec_delete_adapter(hdmi->cec_adap);
+	cec_delete_adapter(vc4_hdmi->cec_adap);
 err_destroy_conn:
-	vc4_hdmi_connector_destroy(&hdmi->connector.base);
+	vc4_hdmi_connector_destroy(&vc4_hdmi->connector.base);
 #endif
 err_destroy_encoder:
 	vc4_hdmi_encoder_destroy(encoder);
 err_unprepare_hsm:
-	clk_disable_unprepare(hdmi->hsm_clock);
+	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 	pm_runtime_disable(dev);
 err_put_i2c:
-	put_device(&hdmi->ddc->dev);
+	put_device(&vc4_hdmi->ddc->dev);
 
 	return ret;
 }
@@ -1384,16 +1385,16 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 {
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
-	struct vc4_hdmi *hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 
-	cec_unregister_adapter(hdmi->cec_adap);
-	vc4_hdmi_connector_destroy(&hdmi->connector.base);
-	vc4_hdmi_encoder_destroy(&hdmi->encoder.base.base);
+	cec_unregister_adapter(vc4_hdmi->cec_adap);
+	vc4_hdmi_connector_destroy(&vc4_hdmi->connector.base);
+	vc4_hdmi_encoder_destroy(&vc4_hdmi->encoder.base.base);
 
-	clk_disable_unprepare(hdmi->hsm_clock);
+	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 	pm_runtime_disable(dev);
 
-	put_device(&hdmi->ddc->dev);
+	put_device(&vc4_hdmi->ddc->dev);
 
 	vc4->hdmi = NULL;
 }
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
