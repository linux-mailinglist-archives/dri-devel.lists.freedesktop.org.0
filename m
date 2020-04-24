Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896281B7FF8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE186EB77;
	Fri, 24 Apr 2020 20:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C9289718
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id ED9201449;
 Fri, 24 Apr 2020 11:36:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=QEJKWnaZzR3+q
 oqRuw5W5gKK2SMkJo6qCi6X5edDMMU=; b=XbLKQ1aezBgcv9Q+2r1Hf5rXFqqAl
 rIoXeMzHhl9eVAg2iAYQ0nKhz6K/40QF/PJUr8iD+zp3F/fAPo9yFvoxNpLQnVAu
 pSmjKoWBKRvmPLG81Eb93NqnIXwd9TiMgYdYVa8WxU7O9Wv7UkXI2K7GDer2b3Wz
 NVVJwvv9Ozg77FlpnMq6IuU1XQHEF3QFlx0rGmDRs8rT+9AYhZAK8pSxTSSl57Hx
 uH3u2eoYbxNXP94LSRszDN2AmB/muGQF9KbbSxN2fHBgf+FPJT/mRiKFQHcKtxef
 K+mePp2hYYxgTLFO52ic9EKxdyuWpXp6+4laEIVJZi17Ha++VV/VSzWbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=QEJKWnaZzR3+qoqRuw5W5gKK2SMkJo6qCi6X5edDMMU=; b=foliInlX
 zijwP5WBb3gCwjxSV3nlMLC4gYoLiKihdiMVGpvgqf7Q1AIpMWaI+v3371TBWV/K
 dY8OjSGVUmeKLA5Ivh9KNorvHXggy6B8LWlHGIRiKjykc4Z8DpjXtkV8VDkFz8v4
 vMx/527AOhJgC+R2XAFdsOu5X0T27cvC92WqXVhRw08akTP9XHS49AMDEaL7ODs1
 mbPMKRkso4kZRqS5yypH93v8dxpnKn68IDNe5i+Aq4Q7sx5AHF/IT94JFw12zuDR
 Or8ROJuePb041+MnQ56s9lZ4ohBy5Az3f/RxDdi6u8nnStql3umM80yPXufwUEYf
 MSqs/NrE1TAl5A==
X-ME-Sender: <xms:kgejXmtzYmKyfe2GQ9m5m1M5vrYZTp3gLS6w96Z-0qgikgHeqdFz4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epsgihthgvshdruggrthgrnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
 hordhtvggthh
X-ME-Proxy: <xmx:kgejXsUKVBcnP-kdaHNlfkIujlXmbpkBqKvNOXQwPvSQnleOEH6O5g>
 <xmx:kgejXizBzjB01eMaPQvlb9v8WRTPH4oPGQCS569bBRjFhARD6YzY_w>
 <xmx:kgejXjJbX5P0wSKsT5oQsmPEmVscMVtbjTgW-UA7bvG6e3z1QyZEpA>
 <xmx:kgejXsSEVQeROK1A3VmKtiKTtAa8JONEVVyf15aX1MLLZJq7ALAk1jzq3Pc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2BBCB3065CDA;
 Fri, 24 Apr 2020 11:36:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 63/91] drm/vc4: hdmi: rework connectors and encoders
Date: Fri, 24 Apr 2020 17:34:44 +0200
Message-Id: <9ac05e280ae09286e80a882a5103c2e615f6253f.1587742492.git-series.maxime@cerno.tech>
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
index 4b21292072e4..ba3b589af30d 100644
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
@@ -636,7 +632,8 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 /* HDMI audio codec callbacks */
 static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *hdmi)
 {
-	struct drm_device *drm = hdmi->encoder->dev;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	u32 hsm_clock = clk_get_rate(hdmi->hsm_clock);
 	unsigned long n, m;
@@ -655,7 +652,7 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *hdmi)
 
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *hdmi)
 {
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_crtc *crtc = encoder->crtc;
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
@@ -693,7 +690,8 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
+	struct drm_connector *connector = &hdmi->connector.base;
 	struct vc4_dev *vc4 = to_vc4_dev(encoder->dev);
 	int ret;
 
@@ -710,8 +708,7 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 				VC4_HDMI_RAM_PACKET_ENABLE))
 		return -ENODEV;
 
-	ret = snd_pcm_hw_constraint_eld(substream->runtime,
-					hdmi->connector->eld);
+	ret = snd_pcm_hw_constraint_eld(substream->runtime, connector->eld);
 	if (ret)
 		return ret;
 
@@ -725,7 +722,7 @@ static int vc4_hdmi_audio_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 static void vc4_hdmi_audio_reset(struct vc4_hdmi *hdmi)
 {
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct device *dev = &hdmi->pdev->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
@@ -759,7 +756,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct device *dev = &hdmi->pdev->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
@@ -832,7 +829,7 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.base.base;
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
@@ -876,9 +873,10 @@ static int vc4_hdmi_audio_eld_ctl_info(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct vc4_hdmi *hdmi = snd_component_to_hdmi(component);
+	struct drm_connector *connector = &hdmi->connector.base;
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
-	uinfo->count = sizeof(hdmi->connector->eld);
+	uinfo->count = sizeof(connector->eld);
 
 	return 0;
 }
@@ -888,9 +886,10 @@ static int vc4_hdmi_audio_eld_ctl_get(struct snd_kcontrol *kcontrol,
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
@@ -1228,7 +1227,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
 	struct vc4_hdmi *hdmi;
-	struct vc4_hdmi_encoder *vc4_hdmi_encoder;
+	struct drm_encoder *encoder;
 	struct device_node *ddc_node;
 	u32 value;
 	int ret;
@@ -1237,14 +1236,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
@@ -1330,16 +1325,14 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
+	ret = vc4_hdmi_connector_init(drm, hdmi, hdmi->ddc);
+	if (ret)
 		goto err_destroy_encoder;
-	}
+
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 	hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 					      vc4, "vc4",
@@ -1349,7 +1342,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret < 0)
 		goto err_destroy_conn;
 
-	cec_fill_conn_info_from_drm(&conn_info, hdmi->connector);
+	cec_fill_conn_info_from_drm(&conn_info, &hdmi->connector.base);
 	cec_s_conn_info(hdmi->cec_adap, &conn_info);
 
 	HDMI_WRITE(VC4_HDMI_CPU_MASK_SET, 0xffffffff);
@@ -1386,10 +1379,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
@@ -1407,8 +1400,8 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
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
