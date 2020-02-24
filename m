Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7016A2B8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8DE6E379;
	Mon, 24 Feb 2020 09:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44556E220
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id AD77D640;
 Mon, 24 Feb 2020 04:10:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=iUQC0glIIyne3
 RrlfNFKcz2PgmyFbl6nzYucpQx+EsQ=; b=vgcn4ipWYVC8tub6nwxmLj2V2voj+
 XX2ZVCpfFfNRmTLvYy+lL0Nv+7rjEmPX6NB5Oxdv6oIvFbgrB5iFT9L3ymZhkCVr
 5CvSFNuNSeas2Sl0c34X2PbXnc/FVmyzmqhQhTdAE2PMbNCTLvyLwg/BQ+1kTjj6
 WBf6hCe1izhodjnC8ljcSfX0carnOhH2A1G+HzaZnzcecCkXYo7T7fVsosmB0PIH
 AHmkWZxbU84gs7lAr0eThuPGiGSiQJFdFeH01H5110xg6kzEsssmq8YUe6ur/RDK
 VMTq5P/N77J7dEo3mT4aqcWd+HN9qtkZ6ULM2icAuC95MuV6tHYIiGQ7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=iUQC0glIIyne3RrlfNFKcz2PgmyFbl6nzYucpQx+EsQ=; b=vfBnuLZt
 Yf4Cpsixib69+kn4tYutQHLKNDWODSKtDg6ekpcQNz1cjcKQxUrNvqbpiwPEP+9Y
 +eVM3TgHaGjhQK5tqum8F3J09X3xHb3H4YGpC8hLIffezayDaPx3G61YJnHnj6rr
 Qj92WuHd3rCn+LwNXjxKiBWCvisewMF6pzpGN1Lj98jvTjIFfxIGzzIC8JIWypZ0
 ZwRRatIJbHgj8n66ZUPqXc2cny/Z3XdDU2VWUaUf3x5QKGQzeIS7OUQ7gZL6+Um3
 CIOLZp/lsvecUfW9p/jK+fx9VlK/HkRwRK5qbwydg4P5a0e2t1cxx1VPGEcV5n2j
 20qZ3F3dqSkgVQ==
X-ME-Sender: <xms:_JJTXhIG3tn7vR2dZj7TZm9SwnCy30OgJ3H7p5Xd6Agt0MX2UJYQlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrihhnpegshi
 htvghsrdgurghtrgenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrth
 gvtghh
X-ME-Proxy: <xmx:_JJTXpeuPzPQl6C8sdIAhf1s87NCNci4kMzToCaEbCPp2MaN0NSUrQ>
 <xmx:_JJTXscJLP2KDXfLRgnKGR9br5PesFt44TvXtwCdnn3fnpu6i39tEw>
 <xmx:_JJTXkOTkMrf8hiCfR5PoKCoKkhL8dtrHoSBKewkTMGLcUpVTpEbLA>
 <xmx:_JJTXvIBUuitD3lPOOkp3Ozaggm0XvrvaGGPCxx_Ntl6UMln4baV5CnOU5M>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E80C93060BD1;
 Mon, 24 Feb 2020 04:10:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 63/89] drm/vc4: hdmi: rework connectors and encoders
Date: Mon, 24 Feb 2020 10:07:05 +0100
Message-Id: <011dae3ec0dfce8eb748ca658fb657792fb55c6b.1582533919.git-series.maxime@cerno.tech>
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

the vc4_hdmi driver has some custom structures to hold the data it needs to
associate with the drm_encoder and drm_connector structures.

However, it allocates them separately from the vc4_hdmi structure which
makes it more complicated than it needs to be.

Move those structures to be contained by vc4_hdmi and update the code
accordingly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 85 ++++++++++++++++-------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 64 +++++++++++++-------------
 2 files changed, 71 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a31fdf1dc6cf..5db003bb3cf5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -190,20 +190,15 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
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
@@ -215,7 +210,7 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
 	/* Create and attach TV margin props to this connector. */
 	ret = drm_mode_create_tv_margin_properties(dev);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
 	drm_connector_attach_tv_margin_properties(connector);
 
@@ -227,7 +222,7 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
 
 	drm_connector_attach_encoder(connector, encoder);
 
-	return connector;
+	return 0;
 }
 
 static void vc4_hdmi_encoder_destroy(struct drm_encoder *encoder)
@@ -306,21 +301,22 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
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
@@ -624,7 +620,8 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 /* HDMI audio codec callbacks */
 static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *hdmi)
 {
-	struct drm_device *drm = hdmi->encoder->dev;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	u32 hsm_clock = clk_get_rate(hdmi->hsm_clock);
 	unsigned long n, m;
@@ -643,7 +640,7 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *hdmi)
 
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *hdmi)
 {
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_crtc *crtc = encoder->crtc;
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
@@ -681,7 +678,8 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct drm_connector *connector = &hdmi->connector.base;
 	struct vc4_dev *vc4 = to_vc4_dev(encoder->dev);
 	int ret;
 
@@ -698,8 +696,7 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 				VC4_HDMI_RAM_PACKET_ENABLE))
 		return -ENODEV;
 
-	ret = snd_pcm_hw_constraint_eld(substream->runtime,
-					hdmi->connector->eld);
+	ret = snd_pcm_hw_constraint_eld(substream->runtime, connector->eld);
 	if (ret)
 		return ret;
 
@@ -713,7 +710,7 @@ static int vc4_hdmi_audio_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 static void vc4_hdmi_audio_reset(struct vc4_hdmi *hdmi)
 {
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct device *dev = &hdmi->pdev->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
@@ -747,7 +744,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct device *dev = &hdmi->pdev->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
@@ -820,7 +817,7 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
@@ -864,9 +861,10 @@ static int vc4_hdmi_audio_eld_ctl_info(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct vc4_hdmi *hdmi = snd_component_to_hdmi(component);
+	struct drm_connector *connector = &hdmi->connector.base;
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
-	uinfo->count = sizeof(hdmi->connector->eld);
+	uinfo->count = sizeof(connector->eld);
 
 	return 0;
 }
@@ -876,9 +874,10 @@ static int vc4_hdmi_audio_eld_ctl_get(struct snd_kcontrol *kcontrol,
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
@@ -1216,7 +1215,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
 	struct vc4_hdmi *hdmi;
-	struct vc4_hdmi_encoder *vc4_hdmi_encoder;
+	struct drm_encoder *encoder;
 	struct device_node *ddc_node;
 	u32 value;
 	int ret;
@@ -1225,14 +1224,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (!hdmi)
 		return -ENOMEM;
 
-	vc4_hdmi_encoder = devm_kzalloc(dev, sizeof(*vc4_hdmi_encoder),
-					GFP_KERNEL);
-	if (!vc4_hdmi_encoder)
-		return -ENOMEM;
-	vc4_hdmi_encoder->base.type = VC4_ENCODER_TYPE_HDMI0;
-	hdmi->encoder = &vc4_hdmi_encoder->base.base;
-
 	hdmi->pdev = pdev;
+	encoder = &hdmi->encoder.base.base;
+	encoder->base.type = VC4_ENCODER_TYPE_HDMI0;
+
 	hdmi->hdmicore_regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(hdmi->hdmicore_regs))
 		return PTR_ERR(hdmi->hdmicore_regs);
@@ -1318,16 +1313,14 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	}
 	pm_runtime_enable(dev);
 
-	drm_encoder_init(drm, hdmi->encoder, &vc4_hdmi_encoder_funcs,
+	drm_encoder_init(drm, encoder, &vc4_hdmi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
-	drm_encoder_helper_add(hdmi->encoder, &vc4_hdmi_encoder_helper_funcs);
+	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
-	hdmi->connector =
-		vc4_hdmi_connector_init(drm, hdmi->encoder, hdmi->ddc);
-	if (IS_ERR(hdmi->connector)) {
-		ret = PTR_ERR(hdmi->connector);
+	ret = vc4_hdmi_connector_init(drm, vc4_hdmi, vc4_hdmi->ddc);
+	if (ret)
 		goto err_destroy_encoder;
-	}
+
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 	hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 					      vc4, "vc4",
@@ -1374,10 +1367,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_delete_cec_adap:
 	cec_delete_adapter(hdmi->cec_adap);
 err_destroy_conn:
-	vc4_hdmi_connector_destroy(hdmi->connector);
+	vc4_hdmi_connector_destroy(&hdmi->connector.base);
 #endif
 err_destroy_encoder:
-	vc4_hdmi_encoder_destroy(hdmi->encoder);
+	vc4_hdmi_encoder_destroy(encoder);
 err_unprepare_hsm:
 	clk_disable_unprepare(hdmi->hsm_clock);
 	pm_runtime_disable(dev);
@@ -1395,8 +1388,8 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	struct vc4_hdmi *hdmi = vc4->hdmi;
 
 	cec_unregister_adapter(hdmi->cec_adap);
-	vc4_hdmi_connector_destroy(hdmi->connector);
-	vc4_hdmi_encoder_destroy(hdmi->encoder);
+	vc4_hdmi_connector_destroy(&hdmi->connector.base);
+	vc4_hdmi_encoder_destroy(&hdmi->encoder.base.base);
 
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
