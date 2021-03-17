Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B3E33F417
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA266E7FA;
	Wed, 17 Mar 2021 15:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF2C6E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9C1D7580CE9;
 Wed, 17 Mar 2021 11:44:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 11:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=LIq6CqiRCx8I2
 LZNichF2N26yxCbBa+tlRH/PZ0hmOk=; b=efm+2neKH3eIuO85O8K73af93TZBW
 o0xz8GH/LmjTDOYcQlzMZhqA6b+M1AxAAKw9odPthrnVqak9aS+CTT28nMvBa9cw
 kEDACeRmRuvWQv9ySvwIAS3WwaWadV+KzW/GyPON8OgU9PH/JzH55bnBZxBA8y2e
 /GKtsUW7BElBCLlRGpGL7EYKJQNAiaPZrdYfxEt5oCcJHMyT+8jUC4V2SFYaJjXe
 rZJRaZNGgIEsEv2JcEmsJQbVW4J1dxZKCS1wy0+CutIs+H3JB6s94YBAufVYPpI6
 Hwj5t3+DSiYTxabKAWya9uFQfIy0ixTa7yS9Sg6Mfal8EDT+MXi4oLa7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=LIq6CqiRCx8I2LZNichF2N26yxCbBa+tlRH/PZ0hmOk=; b=SlJeVPgp
 DVBC+/AM8ntA6envsABAJSvmqCFh/LQ+ElqI5t6p21fKGXKxgMkdTqT3Fxdsj0k0
 Kn47LlXFRXwUSrULn9cEsmVmgEERtyJLGf3NUX6hiSZ57XLcnunbIIP3uOpQhsna
 75v9QVQlNBqAhjGl0RN2SaEaWW22w+hiS2GWFqPC0MPZ8ObvWBmrNTicD5fBVBkT
 fwIdOk3Tg0ECMLueXfbEfwUATy4m3ALDo1eZZq07i9bvUic9iM/vc/f5WD3NFfHX
 JGi4ilRx03hb6KvYj3ov4H0F1Zp8MZw2GZtsRjSMmkx8nd35d96Jkj5RRd/Awris
 EA5pCObi55UN/w==
X-ME-Sender: <xms:yyNSYF-esQp71YRUmyhOoaFVXJwEDxYPigywOn_l6l-a7qCfhF7gyQ>
 <xme:yyNSYKU4YeSSNGxL_rkGq8oQNx1-hFSVKhdRHZtUDOm4WZyEEd3pt_Cu9eIOPc6wY
 2JxTDv66dlfg1UGBHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepfeevhfdvvdeivdeihefftddvtefgieegffevhfeilefgfeeuteevudejgedu
 lefhnecuffhomhgrihhnpegsrghsvgdrphhoshhtnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yyNSYOIr9zpPy2mfBK1XqB_yavj6C_GWl_QjzGGLVczmy9RTSmBUCw>
 <xmx:yyNSYODFrbflFRLDNvn8AccOXR6Bu_lb9ibqu0MoFPjc1XjJayj6FA>
 <xmx:yyNSYOHf97Iqgvg0eDl77OUGjr7esBYuSkxkIJWGdPS3xLKnJuGHLw>
 <xmx:yyNSYHV7uGMh9f81nsGtnQTuuJZkpOsVDShtRfdrpRSs36jGMu-ktQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B81A24005E;
 Wed, 17 Mar 2021 11:44:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 10/18] drm/vc4: hdmi: Convert to bridge
Date: Wed, 17 Mar 2021 16:43:44 +0100
Message-Id: <20210317154352.732095-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converting the HDMI controller to a bridge seems like the preferred way
to support an YUV output, so let's do this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  37 ++++++-----
 drivers/gpu/drm/vc4/vc4_drv.c  |  15 +++--
 drivers/gpu/drm/vc4/vc4_drv.h  |  27 +++++---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 111 +++++++++++++++++++++------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |   8 +++
 5 files changed, 131 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e2607e1f2520..8c13d31827bc 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -283,14 +283,19 @@ static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc)
 	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		struct drm_encoder *encoder;
-		struct vc4_encoder *vc4_encoder;
+		struct drm_bridge *bridge;
+		struct vc4_bridge *vc4_bridge;
 
 		encoder = vc4_get_connector_encoder(connector);
 		if (!encoder)
 			continue;
 
-		vc4_encoder = to_vc4_encoder(encoder);
-		if (vc4_encoder->crtc == crtc) {
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		if (!bridge)
+			continue;
+
+		vc4_bridge = to_vc4_bridge(bridge);
+		if (vc4_bridge->crtc == crtc) {
 			drm_connector_list_iter_end(&conn_iter);
 			return encoder;
 		}
@@ -429,7 +434,8 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 			    unsigned int channel)
 {
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
-	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+	struct drm_bridge *bridge = drm_bridge_chain_get_first_bridge(encoder);
+	struct vc4_bridge *vc4_bridge = to_vc4_bridge(bridge);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
 	int ret;
@@ -457,14 +463,14 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 	 */
 	mdelay(20);
 
-	if (vc4_encoder && vc4_encoder->post_crtc_disable)
-		vc4_encoder->post_crtc_disable(encoder, state);
+	if (vc4_bridge && vc4_bridge->post_crtc_disable)
+		vc4_bridge->post_crtc_disable(bridge, state);
 
 	vc4_crtc_pixelvalve_reset(crtc);
 	vc4_hvs_stop_channel(dev, channel);
 
-	if (vc4_encoder && vc4_encoder->post_crtc_powerdown)
-		vc4_encoder->post_crtc_powerdown(encoder, state);
+	if (vc4_bridge && vc4_bridge->post_crtc_powerdown)
+		vc4_bridge->post_crtc_powerdown(bridge, state);
 
 	return 0;
 }
@@ -529,7 +535,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
-	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+	struct drm_bridge *bridge = drm_bridge_chain_get_first_bridge(encoder);
+	struct vc4_bridge *vc4_bridge = to_vc4_bridge(bridge);
 
 	require_hvs_enabled(dev);
 
@@ -540,15 +547,15 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	vc4_hvs_atomic_enable(crtc, state);
 
-	if (vc4_encoder->pre_crtc_configure)
-		vc4_encoder->pre_crtc_configure(encoder, state);
+	if (vc4_bridge->pre_crtc_configure)
+		vc4_bridge->pre_crtc_configure(bridge, state);
 
 	vc4_crtc_config_pv(crtc);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
-	if (vc4_encoder->pre_crtc_enable)
-		vc4_encoder->pre_crtc_enable(encoder, state);
+	if (vc4_bridge->pre_crtc_enable)
+		vc4_bridge->pre_crtc_enable(bridge, state);
 
 	/* When feeding the transposer block the pixelvalve is unneeded and
 	 * should not be enabled.
@@ -556,8 +563,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	CRTC_WRITE(PV_V_CONTROL,
 		   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
 
-	if (vc4_encoder->post_crtc_enable)
-		vc4_encoder->post_crtc_enable(encoder, state);
+	if (vc4_bridge->post_crtc_enable)
+		vc4_bridge->post_crtc_enable(bridge, state);
 }
 
 static enum drm_mode_status vc4_crtc_mode_valid(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index cd1fb75c66a7..cee54f3b64e9 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -217,20 +217,25 @@ static struct drm_crtc *vc4_drv_find_crtc(struct drm_device *drm,
 	return NULL;
 }
 
-static void vc4_drv_set_encoder_data(struct drm_device *drm)
+static void vc4_drv_set_bridge_data(struct drm_device *drm)
 {
 	struct drm_encoder *encoder;
 
 	drm_for_each_encoder(encoder, drm) {
-		struct vc4_encoder *vc4_encoder;
+		struct vc4_bridge *vc4_bridge;
+		struct drm_bridge *bridge;
 		struct drm_crtc *crtc;
 
 		crtc = vc4_drv_find_crtc(drm, encoder);
 		if (WARN_ON(!crtc))
 			return;
 
-		vc4_encoder = to_vc4_encoder(encoder);
-		vc4_encoder->crtc = crtc;
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		if (!bridge)
+			continue;
+
+		vc4_bridge = to_vc4_bridge(bridge);
+		vc4_bridge->crtc = crtc;
 	}
 }
 
@@ -296,7 +301,7 @@ static int vc4_drm_bind(struct device *dev)
 	ret = component_bind_all(dev, drm);
 	if (ret)
 		return ret;
-	vc4_drv_set_encoder_data(drm);
+	vc4_drv_set_bridge_data(drm);
 
 	ret = vc4_plane_create_additional_planes(drm);
 	if (ret)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 1b569dcc2154..a5721ffc6529 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -10,6 +10,7 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_encoder.h>
@@ -438,16 +439,8 @@ enum vc4_encoder_type {
 
 struct vc4_encoder {
 	struct drm_encoder base;
-	struct drm_crtc *crtc;
 	enum vc4_encoder_type type;
 	u32 clock_select;
-
-	void (*pre_crtc_configure)(struct drm_encoder *encoder, struct drm_atomic_state *state);
-	void (*pre_crtc_enable)(struct drm_encoder *encoder, struct drm_atomic_state *state);
-	void (*post_crtc_enable)(struct drm_encoder *encoder, struct drm_atomic_state *state);
-
-	void (*post_crtc_disable)(struct drm_encoder *encoder, struct drm_atomic_state *state);
-	void (*post_crtc_powerdown)(struct drm_encoder *encoder, struct drm_atomic_state *state);
 };
 
 static inline struct vc4_encoder *
@@ -456,6 +449,24 @@ to_vc4_encoder(struct drm_encoder *encoder)
 	return container_of(encoder, struct vc4_encoder, base);
 }
 
+struct vc4_bridge {
+	struct drm_bridge base;
+	struct drm_crtc *crtc;
+
+	void (*pre_crtc_configure)(struct drm_bridge *bridge, struct drm_atomic_state *state);
+	void (*pre_crtc_enable)(struct drm_bridge *bridge, struct drm_atomic_state *state);
+	void (*post_crtc_enable)(struct drm_bridge *bridge, struct drm_atomic_state *state);
+
+	void (*post_crtc_disable)(struct drm_bridge *bridge, struct drm_atomic_state *state);
+	void (*post_crtc_powerdown)(struct drm_bridge *bridge, struct drm_atomic_state *state);
+};
+
+static inline struct vc4_bridge *
+to_vc4_bridge(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct vc4_bridge, base);
+}
+
 struct vc4_crtc_data {
 	/* Bitmask of channels (FIFOs) of the HVS that the output can source from */
 	unsigned int hvs_available_channels;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8f0af246f18f..4ce0aea6ba17 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -454,10 +454,10 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 		vc4_hdmi_set_audio_infoframe(encoder);
 }
 
-static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
-					       struct drm_atomic_state *state)
+static void vc4_hdmi_bridge_post_crtc_disable(struct drm_bridge *bridge,
+					      struct drm_atomic_state *state)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct vc4_hdmi *vc4_hdmi = bridge_to_vc4_hdmi(bridge);
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
 
@@ -468,10 +468,10 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
 }
 
-static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
-						 struct drm_atomic_state *state)
+static void vc4_hdmi_bridge_post_crtc_powerdown(struct drm_bridge *bridge,
+						struct drm_atomic_state *state)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct vc4_hdmi *vc4_hdmi = bridge_to_vc4_hdmi(bridge);
 	int ret;
 
 	if (vc4_hdmi->variant->phy_disable)
@@ -489,10 +489,6 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 		DRM_ERROR("Failed to release power domain: %d\n", ret);
 }
 
-static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
-{
-}
-
 static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       const struct drm_display_mode *mode)
 {
@@ -740,9 +736,10 @@ vc4_hdmi_encoder_get_connector_state(struct drm_encoder *encoder,
 	return NULL;
 }
 
-static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
-						struct drm_atomic_state *state)
+static void vc4_hdmi_bridge_pre_crtc_configure(struct drm_bridge *bridge,
+					       struct drm_atomic_state *state)
 {
+	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_connector_state *conn_state =
 		vc4_hdmi_encoder_get_connector_state(encoder, state);
 	struct vc4_hdmi_connector_state *vc4_conn_state =
@@ -836,9 +833,10 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
 }
 
-static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
-					     struct drm_atomic_state *state)
+static void vc4_hdmi_bridge_pre_crtc_enable(struct drm_bridge *bridge,
+					    struct drm_atomic_state *state)
 {
+	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
@@ -848,9 +846,10 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 }
 
-static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
-					      struct drm_atomic_state *state)
+static void vc4_hdmi_bridge_post_crtc_enable(struct drm_bridge *bridge,
+					     struct drm_atomic_state *state)
 {
+	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
@@ -907,20 +906,17 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
 }
 
-static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
-{
-}
-
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
-static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
-					 struct drm_crtc_state *crtc_state,
-					 struct drm_connector_state *conn_state)
+static int vc4_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
 {
 	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct vc4_hdmi *vc4_hdmi = bridge_to_vc4_hdmi(bridge);
 	unsigned long long pixel_rate = mode->clock * 1000;
 	unsigned long long tmds_rate;
 
@@ -963,10 +959,11 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 }
 
 static enum drm_mode_status
-vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
-			    const struct drm_display_mode *mode)
+vc4_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
+			   const struct drm_display_info *info,
+			   const struct drm_display_mode *mode)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct vc4_hdmi *vc4_hdmi = bridge_to_vc4_hdmi(bridge);
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
@@ -979,13 +976,49 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	return MODE_OK;
 }
 
-static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
-	.atomic_check = vc4_hdmi_encoder_atomic_check,
-	.mode_valid = vc4_hdmi_encoder_mode_valid,
-	.disable = vc4_hdmi_encoder_disable,
-	.enable = vc4_hdmi_encoder_enable,
+static int vc4_hdmi_bridge_attach(struct drm_bridge *bridge,
+				  enum drm_bridge_attach_flags flags)
+{
+	struct vc4_hdmi *vc4_hdmi = bridge_to_vc4_hdmi(bridge);
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
+	return vc4_hdmi_connector_init(bridge->dev, vc4_hdmi);
+}
+
+static const struct drm_bridge_funcs vc4_hdmi_bridge_funcs = {
+	.attach =	vc4_hdmi_bridge_attach,
+	.atomic_check =	vc4_hdmi_bridge_atomic_check,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.mode_valid =	vc4_hdmi_bridge_mode_valid,
 };
 
+static int vc4_hdmi_bridge_init(struct drm_device *drm,
+				struct vc4_hdmi *vc4_hdmi)
+{
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
+	struct drm_bridge *bridge = &vc4_hdmi->bridge.base;
+	struct device *dev = &vc4_hdmi->pdev->dev;
+	int ret;
+
+	bridge->funcs = &vc4_hdmi_bridge_funcs;
+	bridge->of_node = dev->of_node;
+	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
+
+	drm_bridge_add(bridge);
+
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+	if (ret) {
+		drm_bridge_remove(bridge);
+		return ret;
+	}
+
+	return 0;
+}
+
 static u32 vc4_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
 {
 	int i;
@@ -1945,14 +1978,15 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	dev_set_drvdata(dev, vc4_hdmi);
 	encoder = &vc4_hdmi->encoder.base.base;
 	vc4_hdmi->encoder.base.type = variant->encoder_type;
-	vc4_hdmi->encoder.base.pre_crtc_configure = vc4_hdmi_encoder_pre_crtc_configure;
-	vc4_hdmi->encoder.base.pre_crtc_enable = vc4_hdmi_encoder_pre_crtc_enable;
-	vc4_hdmi->encoder.base.post_crtc_enable = vc4_hdmi_encoder_post_crtc_enable;
-	vc4_hdmi->encoder.base.post_crtc_disable = vc4_hdmi_encoder_post_crtc_disable;
-	vc4_hdmi->encoder.base.post_crtc_powerdown = vc4_hdmi_encoder_post_crtc_powerdown;
 	vc4_hdmi->pdev = pdev;
 	vc4_hdmi->variant = variant;
 
+	vc4_hdmi->bridge.pre_crtc_configure = vc4_hdmi_bridge_pre_crtc_configure;
+	vc4_hdmi->bridge.pre_crtc_enable = vc4_hdmi_bridge_pre_crtc_enable;
+	vc4_hdmi->bridge.post_crtc_enable = vc4_hdmi_bridge_post_crtc_enable;
+	vc4_hdmi->bridge.post_crtc_disable = vc4_hdmi_bridge_post_crtc_disable;
+	vc4_hdmi->bridge.post_crtc_powerdown = vc4_hdmi_bridge_post_crtc_powerdown;
+
 	ret = variant->init_resources(vc4_hdmi);
 	if (ret)
 		return ret;
@@ -1996,9 +2030,8 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	pm_runtime_enable(dev);
 
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
-	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
-	ret = vc4_hdmi_connector_init(drm, vc4_hdmi);
+	ret = vc4_hdmi_bridge_init(drm, vc4_hdmi);
 	if (ret)
 		goto err_destroy_encoder;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 8e42f9e7b3e2..d03c849d6ea0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -1,6 +1,7 @@
 #ifndef _VC4_HDMI_H_
 #define _VC4_HDMI_H_
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 #include <media/cec.h>
 #include <sound/dmaengine_pcm.h>
@@ -125,6 +126,7 @@ struct vc4_hdmi {
 
 	struct vc4_hdmi_encoder encoder;
 	struct drm_connector connector;
+	struct vc4_bridge bridge;
 
 	struct i2c_adapter *ddc;
 	void __iomem *hdmicore_regs;
@@ -171,6 +173,12 @@ struct vc4_hdmi {
 	struct debugfs_regset32 hd_regset;
 };
 
+static inline struct vc4_hdmi *
+bridge_to_vc4_hdmi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct vc4_hdmi, bridge.base);
+}
+
 static inline struct vc4_hdmi *
 connector_to_vc4_hdmi(struct drm_connector *connector)
 {
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
