Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C4421993A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7DE6E9E6;
	Thu,  9 Jul 2020 07:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129A289C9C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1BFC32F9;
 Wed,  8 Jul 2020 13:43:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=N2HpSoi77GHrm
 8D3aBLWSlDgIFgPad6DQRwf6FVDtpo=; b=CMDmC8LV11OBD5zRNCe634fFAdEOJ
 ciwEbmNoOH8kNvmfELoDl5mXvnObK0PCqoWlSQJFnHKBzt5lUZG0KcXa8eo/Gp5c
 4UDEyd5ttXqE9P6+KMn6ND1qCPGw9SoPCaA5teWxGCgJ8BYHOliVZ4WZ5QHkMWfz
 qba1e7UeoH40o+L2djbiL9+Xl76PMd+2Iiulq6d3JV/RJE2YZW0JXJE0qZI8yqHM
 d1ulSpI3yOZJ+4LbiDL2FO++2pPPfWRYNDPb2yUWtEc+Ky8ljmdP3kND930NxJm4
 LqnccFj31M2P5SuO8X40TEHWvFtPv8Rv95NxWeNRuYsNRoCEdcca4mgfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=N2HpSoi77GHrm8D3aBLWSlDgIFgPad6DQRwf6FVDtpo=; b=Fmz6D0S2
 ARVwzIWKj0ULZhz6NTGJt03adPOSQUVtdlJFaNUGXJTBxmyQfrBTWJpVvXop8MK6
 7aC5pPM42YWa8WU5ITec4CXPCbR1IdyWtporpb3Ecefb4MG/ScRnFXR4ltUAufj+
 LswYU9vlywHrXSv6sDttYr94sS7d27gefHXyujKksfg6u4Yl4lUpdGJA33z0ouFl
 uL6sfjuSnfx4bI1uniUgM491G5Ua1OY7BCXv7rG8/+yr+YYDBWNa/vBEqyCjCIIf
 LVHgny4/V+vujSVHvFvvjnUha6jDiM6pGMfANX/DnhKu6NBoPRKKWeuzThX8OqXZ
 a2mri1m/0zFbWQ==
X-ME-Sender: <xms:wAUGX6jR51-q_Q9KsSzrIpSp-6TRIr4SqyoVwDCsqfeUPDOteLng_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepieeugeefgfeiieelveekheehhedtueetueehkedtfffgvedtvdeijeduieff
 veevnecuffhomhgrihhnpegshihtvghsrdgurghtrgenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wAUGX7BQ51qvMe54UVO8GwR7NwEQAjEwDR_GuFnXILvsnbwb4JB_BQ>
 <xmx:wAUGXyHTm4CvpHejviv1cRl5SI5rteRgCGRQxa7iCRoCxheRrUJnfQ>
 <xmx:wAUGXzT3V0dwjJt9ZdDhAn8x014ifxjZKwxjol-v7IRjSTG-JQd7eg>
 <xmx:wAUGX-xmhmU4WxzWjXod1QjGQYZzoEs7EZEk_CampUhwemLlJMXwriD1410>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 681DF328005D;
 Wed,  8 Jul 2020 13:43:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 40/78] drm/vc4: hdmi: rework connectors and encoders
Date: Wed,  8 Jul 2020 19:41:48 +0200
Message-Id: <6ff9f5156dd14ab23967fe7357660b3cbf556c22.1594230107.git-series.maxime@cerno.tech>
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

the vc4_hdmi driver has some custom structures to hold the data it needs to
associate with the drm_encoder and drm_connector structures.

However, it allocates them separately from the vc4_hdmi structure which
makes it more complicated than it needs to be.

Move those structures to be contained by vc4_hdmi and update the code
accordingly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 87 ++++++++++++++++-------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 64 +++++++++++++-------------
 2 files changed, 72 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index db79e0d88625..1e2214f24ed7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -191,20 +191,15 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.get_modes = vc4_hdmi_connector_get_modes,
 };
 
-static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
-						     struct drm_encoder *encoder,
-						     struct i2c_adapter *ddc)
+static int vc4_hdmi_connector_init(struct drm_device *dev,
+				   struct vc4_hdmi *vc4_hdmi,
+				   struct i2c_adapter *ddc)
 {
-	struct drm_connector *connector;
-	struct vc4_hdmi_connector *hdmi_connector;
+	struct vc4_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &hdmi_connector->base;
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	int ret;
 
-	hdmi_connector = devm_kzalloc(dev->dev, sizeof(*hdmi_connector),
-				      GFP_KERNEL);
-	if (!hdmi_connector)
-		return ERR_PTR(-ENOMEM);
-	connector = &hdmi_connector->base;
-
 	hdmi_connector->encoder = encoder;
 
 	drm_connector_init_with_ddc(dev, connector,
@@ -216,7 +211,7 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
 	/* Create and attach TV margin props to this connector. */
 	ret = drm_mode_create_tv_margin_properties(dev);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
 	drm_connector_attach_tv_margin_properties(connector);
 
@@ -228,7 +223,7 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
 
 	drm_connector_attach_encoder(connector, encoder);
 
-	return connector;
+	return 0;
 }
 
 static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
@@ -298,21 +293,22 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_dev *vc4 = encoder->dev->dev_private;
 	struct vc4_hdmi *hdmi = vc4->hdmi;
-	struct drm_connector_state *cstate = hdmi->connector->state;
+	struct drm_connector *connector = &hdmi->connector.base;
+	struct drm_connector_state *cstate = connector->state;
 	struct drm_crtc *crtc = encoder->crtc;
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	union hdmi_infoframe frame;
 	int ret;
 
 	ret = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						       hdmi->connector, mode);
+						       connector, mode);
 	if (ret < 0) {
 		DRM_ERROR("couldn't fill AVI infoframe\n");
 		return;
 	}
 
 	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
-					   hdmi->connector, mode,
+					   connector, mode,
 					   vc4_encoder->limited_rgb_range ?
 					   HDMI_QUANTIZATION_RANGE_LIMITED :
 					   HDMI_QUANTIZATION_RANGE_FULL);
@@ -628,7 +624,8 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 /* HDMI audio codec callbacks */
 static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *hdmi)
 {
-	struct drm_device *drm = hdmi->encoder->dev;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	u32 hsm_clock = clk_get_rate(hdmi->hsm_clock);
 	unsigned long n, m;
@@ -647,7 +644,7 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *hdmi)
 
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *hdmi)
 {
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_crtc *crtc = encoder->crtc;
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
@@ -685,7 +682,8 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct drm_connector *connector = &hdmi->connector.base;
 	struct vc4_dev *vc4 = to_vc4_dev(encoder->dev);
 	int ret;
 
@@ -702,8 +700,7 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 				VC4_HDMI_RAM_PACKET_ENABLE))
 		return -ENODEV;
 
-	ret = snd_pcm_hw_constraint_eld(substream->runtime,
-					hdmi->connector->eld);
+	ret = snd_pcm_hw_constraint_eld(substream->runtime, connector->eld);
 	if (ret)
 		return ret;
 
@@ -717,7 +714,7 @@ static int vc4_hdmi_audio_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 static void vc4_hdmi_audio_reset(struct vc4_hdmi *hdmi)
 {
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct device *dev = &hdmi->pdev->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
@@ -751,7 +748,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct device *dev = &hdmi->pdev->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
@@ -824,7 +821,7 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
@@ -868,9 +865,10 @@ static int vc4_hdmi_audio_eld_ctl_info(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct vc4_hdmi *hdmi = snd_component_to_hdmi(component);
+	struct drm_connector *connector = &hdmi->connector.base;
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
-	uinfo->count = sizeof(hdmi->connector->eld);
+	uinfo->count = sizeof(connector->eld);
 
 	return 0;
 }
@@ -880,9 +878,10 @@ static int vc4_hdmi_audio_eld_ctl_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct vc4_hdmi *hdmi = snd_component_to_hdmi(component);
+	struct drm_connector *connector = &hdmi->connector.base;
 
-	memcpy(ucontrol->value.bytes.data, hdmi->connector->eld,
-	       sizeof(hdmi->connector->eld));
+	memcpy(ucontrol->value.bytes.data, connector->eld,
+	       sizeof(connector->eld));
 
 	return 0;
 }
@@ -1221,7 +1220,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
 	struct vc4_hdmi *hdmi;
-	struct vc4_hdmi_encoder *vc4_hdmi_encoder;
+	struct drm_encoder *encoder;
 	struct device_node *ddc_node;
 	u32 value;
 	int ret;
@@ -1230,14 +1229,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (!hdmi)
 		return -ENOMEM;
 
-	vc4_hdmi_encoder = devm_kzalloc(dev, sizeof(*vc4_hdmi_encoder),
-					GFP_KERNEL);
-	if (!vc4_hdmi_encoder)
-		return -ENOMEM;
-	vc4_hdmi_encoder->base.type = VC4_ENCODER_TYPE_HDMI0;
-	hdmi->encoder = &vc4_hdmi_encoder->base.base;
-
+	encoder = &hdmi->encoder.base.base;
+	hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
 	hdmi->pdev = pdev;
+
 	hdmi->hdmicore_regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(hdmi->hdmicore_regs))
 		return PTR_ERR(hdmi->hdmicore_regs);
@@ -1325,15 +1320,13 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	}
 	pm_runtime_enable(dev);
 
-	drm_simple_encoder_init(drm, hdmi->encoder, DRM_MODE_ENCODER_TMDS);
-	drm_encoder_helper_add(hdmi->encoder, &vc4_hdmi_encoder_helper_funcs);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
-	hdmi->connector =
-		vc4_hdmi_connector_init(drm, hdmi->encoder, hdmi->ddc);
-	if (IS_ERR(hdmi->connector)) {
-		ret = PTR_ERR(hdmi->connector);
+	ret = vc4_hdmi_connector_init(drm, hdmi, hdmi->ddc);
+	if (ret)
 		goto err_destroy_encoder;
-	}
+
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 	hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 					      vc4, "vc4",
@@ -1343,7 +1336,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret < 0)
 		goto err_destroy_conn;
 
-	cec_fill_conn_info_from_drm(&conn_info, hdmi->connector);
+	cec_fill_conn_info_from_drm(&conn_info, &hdmi->connector.base);
 	cec_s_conn_info(hdmi->cec_adap, &conn_info);
 
 	HDMI_WRITE(VC4_HDMI_CPU_MASK_SET, 0xffffffff);
@@ -1380,10 +1373,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_delete_cec_adap:
 	cec_delete_adapter(hdmi->cec_adap);
 err_destroy_conn:
-	vc4_hdmi_connector_destroy(hdmi->connector);
+	vc4_hdmi_connector_destroy(&hdmi->connector.base);
 #endif
 err_destroy_encoder:
-	drm_encoder_cleanup(hdmi->encoder);
+	drm_encoder_cleanup(encoder);
 err_unprepare_hsm:
 	clk_disable_unprepare(hdmi->hsm_clock);
 	pm_runtime_disable(dev);
@@ -1401,8 +1394,8 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	struct vc4_hdmi *hdmi = vc4->hdmi;
 
 	cec_unregister_adapter(hdmi->cec_adap);
-	vc4_hdmi_connector_destroy(hdmi->connector);
-	drm_encoder_cleanup(hdmi->encoder);
+	vc4_hdmi_connector_destroy(&hdmi->connector.base);
+	drm_encoder_cleanup(&hdmi->encoder.base.base);
 
 	clk_disable_unprepare(hdmi->hsm_clock);
 	pm_runtime_disable(dev);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 5ec5d1f6b1e6..17079a39f1b1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -8,6 +8,36 @@
 
 #include "vc4_drv.h"
 
+/* VC4 HDMI encoder KMS struct */
+struct vc4_hdmi_encoder {
+	struct vc4_encoder base;
+	bool hdmi_monitor;
+	bool limited_rgb_range;
+};
+
+static inline struct vc4_hdmi_encoder *
+to_vc4_hdmi_encoder(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct vc4_hdmi_encoder, base.base);
+}
+
+/* VC4 HDMI connector KMS struct */
+struct vc4_hdmi_connector {
+	struct drm_connector base;
+
+	/* Since the connector is attached to just the one encoder,
+	 * this is the reference to it so we can do the best_encoder()
+	 * hook.
+	 */
+	struct drm_encoder *encoder;
+};
+
+static inline struct vc4_hdmi_connector *
+to_vc4_hdmi_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct vc4_hdmi_connector, base);
+}
+
 /* HDMI audio information */
 struct vc4_hdmi_audio {
 	struct snd_soc_card card;
@@ -25,8 +55,8 @@ struct vc4_hdmi_audio {
 struct vc4_hdmi {
 	struct platform_device *pdev;
 
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
+	struct vc4_hdmi_encoder encoder;
+	struct vc4_hdmi_connector connector;
 
 	struct vc4_hdmi_audio audio;
 
@@ -53,34 +83,4 @@ struct vc4_hdmi {
 #define HD_READ(offset) readl(vc4->hdmi->hd_regs + offset)
 #define HD_WRITE(offset, val) writel(val, vc4->hdmi->hd_regs + offset)
 
-/* VC4 HDMI encoder KMS struct */
-struct vc4_hdmi_encoder {
-	struct vc4_encoder base;
-	bool hdmi_monitor;
-	bool limited_rgb_range;
-};
-
-static inline struct vc4_hdmi_encoder *
-to_vc4_hdmi_encoder(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_hdmi_encoder, base.base);
-}
-
-/* VC4 HDMI connector KMS struct */
-struct vc4_hdmi_connector {
-	struct drm_connector base;
-
-	/* Since the connector is attached to just the one encoder,
-	 * this is the reference to it so we can do the best_encoder()
-	 * hook.
-	 */
-	struct drm_encoder *encoder;
-};
-
-static inline struct vc4_hdmi_connector *
-to_vc4_hdmi_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct vc4_hdmi_connector, base);
-}
-
 #endif /* _VC4_HDMI_H_ */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
