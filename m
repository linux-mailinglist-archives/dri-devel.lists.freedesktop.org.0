Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 952896ABD43
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20AA10E213;
	Mon,  6 Mar 2023 10:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D0E10E1EE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:49:43 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F7615C01D1;
 Mon,  6 Mar 2023 05:49:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 06 Mar 2023 05:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678099782; x=1678186182; bh=WpTOBsdjitBp97qEBqoruubIoNGb9rZNa01
 UrTQRCH8=; b=oIiSGDw3bhLfPZB1wC/VQ4sEMzRRF3DAVEYI/cm2hIThVhO8Ci8
 owGLi1LYs4+xBa+HhCpoBnt9DmOxetRbuKz8+48UpYz+3UVtdZ406J/BOSLQd3Fo
 1myShvBpo2g5vy/ZmcoKzU0iutbFOmoYx3MTy1ogw2PDn9vmZ5ff0kWc7A/ps3gJ
 LPiSz9GKu6hHF0kPRQwtYNmAKpEQrYNWFKqGQ+bK67/lr1mq0At/SwKrB/rYsDVJ
 K4l5aYdmm0KBWDaCjZFi0RIpI7pPAXC+V+gHewrTM/i+g+nJ/9mDAp7twfuOiUsH
 QksVC0X0fPzzjFUpkCjA600VSnDEHBzQOsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678099782; x=1678186182; bh=WpTOBsdjitBp97qEBqoruubIoNGb9rZNa01
 UrTQRCH8=; b=ntOFCUxa3Y6J7aE0pMLgIkoJMWfMzM0J+jT+FLMDmUyw13frr+B
 mmAz1FhYVKPjNF0nmJP5mPKUUDbyRXgDfIImfapj7MJ7MO4dGYiKqIea4cnnE5Ef
 kzIq2aFaTm7FwM+xutMHAYFzFOcdYBbVeC3LtaDjxVvk+A078c27Wh/MEibj8OOb
 WBwfZeM7lGF2K6DXLUmBwS5+cPfauzO/AZFUNGiNI8kkJQ+KwkcF7qqZC90o40vZ
 cEdN3GeZzF/U+u9ucCrtwZuSLFl0oIZutTb89dfS0u8pkdigSgYFIacwo6n945sf
 Iig+rsavquhi6dAdZSNhIYcka1mOtEg6ySg==
X-ME-Sender: <xms:RsUFZKOji0NsQp5q-9pEAX73V_pJtlv6sLuRo6S6ZAdqvhZsoTfNTw>
 <xme:RsUFZI86s7NXDgDIPE0MmMW76-lfQUolCNx4FypPD5WYXPSAiK3WdTiI_Ug27jKJ2
 mnnyoqqsebIZEEGapM>
X-ME-Received: <xmr:RsUFZBTBIH-y15bs_LlrcNx3wU5XlfcAtoJY52oB-JEnCCq8_8QpscNdJx85fLhpJ2KdiRZaJL9ue9Q5m2TSanQfIL19jkI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtiedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RsUFZKuZvSkXLW_KZ_Q8Xyb6rpoyQZzj99zCjFqo2A1Yg5AmCpGt7Q>
 <xmx:RsUFZCfUsU159RlEDfyReB1bv8VDJ637vsvBc8W-LxcheqDfPEM7xA>
 <xmx:RsUFZO36LMCbiPVaHDh9nA8CCgttP-7qbH40FdMCnPwbT23ChhZ_qg>
 <xmx:RsUFZFs4ErbKBJV7sVj3MQQgPQ0ucnM8EtfB3VPdFExs7Mz9IdC5BQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 05:49:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 06 Mar 2023 11:46:42 +0100
Subject: [PATCH v3 1/9] drm/vc4: Switch to container_of_const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v3-1-bdd54f66884e@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=13673; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ezENJzreOEib1mQhz3sukSD/w2Uriixv0pvxlqyaI6c=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmsR6b/XFf0SfnD5pKb03OSVit+cDrUv1qKe95T3fQZO4vv
 xzvad5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiL8oY/orKumVJWQn6G1Rw1BnFii
 yd1KNktPmsYgAzD9+BO1cqjjEyvN4/OUl0+tNfqddeims93zQpXHjlY0aPtmufL65qS0o7yggA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Maxime Ripard <maxime@cerno.tech>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

container_of_const() allows to preserve the pointer constness and is
thus more flexible than inline functions.

Let's switch all our instances of container_of() to
container_of_const().

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.h        |  3 ++
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c |  4 +-
 drivers/gpu/drm/vc4/vc4_dpi.c               |  7 +---
 drivers/gpu/drm/vc4/vc4_drv.h               | 65 +++++++++--------------------
 drivers/gpu/drm/vc4/vc4_dsi.c               | 17 +++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h              | 16 +++----
 drivers/gpu/drm/vc4/vc4_kms.c               | 16 +++----
 drivers/gpu/drm/vc4/vc4_plane.c             |  3 +-
 drivers/gpu/drm/vc4/vc4_txp.c               | 12 ++----
 drivers/gpu/drm/vc4/vc4_vec.c               | 14 ++-----
 10 files changed, 51 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.h b/drivers/gpu/drm/vc4/tests/vc4_mock.h
index db8e9a141ef8..2d0b339bd9f3 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.h
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.h
@@ -43,6 +43,9 @@ struct vc4_dummy_output {
 	struct drm_connector connector;
 };
 
+#define encoder_to_vc4_dummy_output(_enc)				\
+	container_of_const(_enc, struct vc4_dummy_output, encoder.base)
+
 struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
 					  struct drm_device *drm,
 					  struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
index 8d33be828d9a..6e11fcc9ef45 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
@@ -80,7 +80,7 @@ int vc4_mock_atomic_add_output(struct kunit *test,
 	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
 
-	output = container_of(encoder, struct vc4_dummy_output, encoder.base);
+	output = encoder_to_vc4_dummy_output(encoder);
 	conn = &output->connector;
 	conn_state = drm_atomic_get_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
@@ -126,7 +126,7 @@ int vc4_mock_atomic_del_output(struct kunit *test,
 	ret = drm_atomic_set_mode_for_crtc(crtc_state, NULL);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	output = container_of(encoder, struct vc4_dummy_output, encoder.base);
+	output = encoder_to_vc4_dummy_output(encoder);
 	conn = &output->connector;
 	conn_state = drm_atomic_get_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index f518d6e59ed6..e68c07d86040 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -97,11 +97,8 @@ struct vc4_dpi {
 	struct debugfs_regset32 regset;
 };
 
-static inline struct vc4_dpi *
-to_vc4_dpi(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_dpi, encoder.base);
-}
+#define to_vc4_dpi(_encoder)						\
+	container_of_const(_encoder, struct vc4_dpi, encoder.base)
 
 #define DPI_READ(offset)								\
 	({										\
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 95069bb16821..e23084f3d6c2 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -232,11 +232,8 @@ struct vc4_dev {
 	struct kref bin_bo_kref;
 };
 
-static inline struct vc4_dev *
-to_vc4_dev(const struct drm_device *dev)
-{
-	return container_of(dev, struct vc4_dev, base);
-}
+#define to_vc4_dev(_dev)			\
+	container_of_const(_dev, struct vc4_dev, base)
 
 struct vc4_bo {
 	struct drm_gem_dma_object base;
@@ -285,11 +282,8 @@ struct vc4_bo {
 	struct mutex madv_lock;
 };
 
-static inline struct vc4_bo *
-to_vc4_bo(const struct drm_gem_object *bo)
-{
-	return container_of(to_drm_gem_dma_obj(bo), struct vc4_bo, base);
-}
+#define to_vc4_bo(_bo)							\
+	container_of_const(to_drm_gem_dma_obj(_bo), struct vc4_bo, base)
 
 struct vc4_fence {
 	struct dma_fence base;
@@ -298,11 +292,8 @@ struct vc4_fence {
 	uint64_t seqno;
 };
 
-static inline struct vc4_fence *
-to_vc4_fence(const struct dma_fence *fence)
-{
-	return container_of(fence, struct vc4_fence, base);
-}
+#define to_vc4_fence(_fence)					\
+	container_of_const(_fence, struct vc4_fence, base)
 
 struct vc4_seqno_cb {
 	struct work_struct work;
@@ -368,11 +359,8 @@ struct vc4_hvs_state {
 	} fifo_state[HVS_NUM_CHANNELS];
 };
 
-static inline struct vc4_hvs_state *
-to_vc4_hvs_state(const struct drm_private_state *priv)
-{
-	return container_of(priv, struct vc4_hvs_state, base);
-}
+#define to_vc4_hvs_state(_state)				\
+	container_of_const(_state, struct vc4_hvs_state, base)
 
 struct vc4_hvs_state *vc4_hvs_get_global_state(struct drm_atomic_state *state);
 struct vc4_hvs_state *vc4_hvs_get_old_global_state(const struct drm_atomic_state *state);
@@ -382,11 +370,8 @@ struct vc4_plane {
 	struct drm_plane base;
 };
 
-static inline struct vc4_plane *
-to_vc4_plane(const struct drm_plane *plane)
-{
-	return container_of(plane, struct vc4_plane, base);
-}
+#define to_vc4_plane(_plane)					\
+	container_of_const(_plane, struct vc4_plane, base)
 
 enum vc4_scaling_mode {
 	VC4_SCALING_NONE,
@@ -458,11 +443,8 @@ struct vc4_plane_state {
 	u64 membus_load;
 };
 
-static inline struct vc4_plane_state *
-to_vc4_plane_state(const struct drm_plane_state *state)
-{
-	return container_of(state, struct vc4_plane_state, base);
-}
+#define to_vc4_plane_state(_state)				\
+	container_of_const(_state, struct vc4_plane_state, base)
 
 enum vc4_encoder_type {
 	VC4_ENCODER_TYPE_NONE,
@@ -489,11 +471,8 @@ struct vc4_encoder {
 	void (*post_crtc_powerdown)(struct drm_encoder *encoder, struct drm_atomic_state *state);
 };
 
-static inline struct vc4_encoder *
-to_vc4_encoder(const struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_encoder, base);
-}
+#define to_vc4_encoder(_encoder)				\
+	container_of_const(_encoder, struct vc4_encoder, base)
 
 static inline
 struct drm_encoder *vc4_find_encoder_by_type(struct drm_device *drm,
@@ -591,11 +570,8 @@ struct vc4_crtc {
 	unsigned int current_hvs_channel;
 };
 
-static inline struct vc4_crtc *
-to_vc4_crtc(const struct drm_crtc *crtc)
-{
-	return container_of(crtc, struct vc4_crtc, base);
-}
+#define to_vc4_crtc(_crtc)					\
+	container_of_const(_crtc, struct vc4_crtc, base)
 
 static inline const struct vc4_crtc_data *
 vc4_crtc_to_vc4_crtc_data(const struct vc4_crtc *crtc)
@@ -608,7 +584,7 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
 {
 	const struct vc4_crtc_data *data = vc4_crtc_to_vc4_crtc_data(crtc);
 
-	return container_of(data, struct vc4_pv_data, base);
+	return container_of_const(data, struct vc4_pv_data, base);
 }
 
 struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
@@ -636,11 +612,8 @@ struct vc4_crtc_state {
 
 #define VC4_HVS_CHANNEL_DISABLED ((unsigned int)-1)
 
-static inline struct vc4_crtc_state *
-to_vc4_crtc_state(const struct drm_crtc_state *crtc_state)
-{
-	return container_of(crtc_state, struct vc4_crtc_state, base);
-}
+#define to_vc4_crtc_state(_state)				\
+	container_of_const(_state, struct vc4_crtc_state, base)
 
 #define V3D_READ(offset)								\
 	({										\
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index a5c075f802e4..9e0c355b236f 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -600,19 +600,14 @@ struct vc4_dsi {
 	struct debugfs_regset32 regset;
 };
 
-#define host_to_dsi(host) container_of(host, struct vc4_dsi, dsi_host)
+#define host_to_dsi(host)					\
+	container_of_const(host, struct vc4_dsi, dsi_host)
 
-static inline struct vc4_dsi *
-to_vc4_dsi(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_dsi, encoder.base);
-}
+#define to_vc4_dsi(_encoder)					\
+	container_of_const(_encoder, struct vc4_dsi, encoder.base)
 
-static inline struct vc4_dsi *
-bridge_to_vc4_dsi(struct drm_bridge *bridge)
-{
-	return container_of(bridge, struct vc4_dsi, bridge);
-}
+#define bridge_to_vc4_dsi(_bridge)				\
+	container_of_const(_bridge, struct vc4_dsi, bridge)
 
 static inline void
 dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index dc3ccd8002a0..5d249ac54cd1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -223,17 +223,14 @@ struct vc4_hdmi {
 	enum vc4_hdmi_output_format output_format;
 };
 
-static inline struct vc4_hdmi *
-connector_to_vc4_hdmi(struct drm_connector *connector)
-{
-	return container_of(connector, struct vc4_hdmi, connector);
-}
+#define connector_to_vc4_hdmi(_connector)				\
+	container_of_const(_connector, struct vc4_hdmi, connector)
 
 static inline struct vc4_hdmi *
 encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 {
 	struct vc4_encoder *_encoder = to_vc4_encoder(encoder);
-	return container_of(_encoder, struct vc4_hdmi, encoder);
+	return container_of_const(_encoder, struct vc4_hdmi, encoder);
 }
 
 struct vc4_hdmi_connector_state {
@@ -243,11 +240,8 @@ struct vc4_hdmi_connector_state {
 	enum vc4_hdmi_output_format	output_format;
 };
 
-static inline struct vc4_hdmi_connector_state *
-conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_state)
-{
-	return container_of(conn_state, struct vc4_hdmi_connector_state, base);
-}
+#define conn_state_to_vc4_hdmi_conn_state(_state)			\
+	container_of_const(_state, struct vc4_hdmi_connector_state, base)
 
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
 		       struct vc4_hdmi_connector_state *vc4_conn_state);
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index a7e3d47c50f4..5495f2a94fa9 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -31,11 +31,8 @@ struct vc4_ctm_state {
 	int fifo;
 };
 
-static struct vc4_ctm_state *
-to_vc4_ctm_state(const struct drm_private_state *priv)
-{
-	return container_of(priv, struct vc4_ctm_state, base);
-}
+#define to_vc4_ctm_state(_state)				\
+	container_of_const(_state, struct vc4_ctm_state, base)
 
 struct vc4_load_tracker_state {
 	struct drm_private_state base;
@@ -43,11 +40,8 @@ struct vc4_load_tracker_state {
 	u64 membus_load;
 };
 
-static struct vc4_load_tracker_state *
-to_vc4_load_tracker_state(const struct drm_private_state *priv)
-{
-	return container_of(priv, struct vc4_load_tracker_state, base);
-}
+#define to_vc4_load_tracker_state(_state)				\
+	container_of_const(_state, struct vc4_load_tracker_state, base)
 
 static struct vc4_ctm_state *vc4_get_ctm_state(struct drm_atomic_state *state,
 					       struct drm_private_obj *manager)
@@ -717,7 +711,7 @@ static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
 static void vc4_hvs_channels_print_state(struct drm_printer *p,
 					 const struct drm_private_state *state)
 {
-	struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
+	const struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
 	unsigned int i;
 
 	drm_printf(p, "HVS State\n");
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 97c84a3f5a46..00e713faecd5 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1334,8 +1334,7 @@ u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist)
 
 u32 vc4_plane_dlist_size(const struct drm_plane_state *state)
 {
-	const struct vc4_plane_state *vc4_state =
-		container_of(state, typeof(*vc4_state), base);
+	const struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 
 	return vc4_state->dlist_count;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index ef5cab2a3aa9..c5abdec03103 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -168,15 +168,11 @@ struct vc4_txp {
 	void __iomem *regs;
 };
 
-static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_txp, encoder.base);
-}
+#define encoder_to_vc4_txp(_encoder)					\
+	container_of_const(_encoder, struct vc4_txp, encoder.base)
 
-static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
-{
-	return container_of(conn, struct vc4_txp, connector.base);
-}
+#define connector_to_vc4_txp(_connector)				\
+	container_of_const(_connector, struct vc4_txp, connector.base)
 
 static const struct debugfs_reg32 txp_regs[] = {
 	VC4_REG32(TXP_DST_PTR),
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a3782d05cd66..d6e6a1a22eba 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -219,17 +219,11 @@ struct vc4_vec {
 		writel(val, vec->regs + (offset));					\
 	} while (0)
 
-static inline struct vc4_vec *
-encoder_to_vc4_vec(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_vec, encoder.base);
-}
+#define encoder_to_vc4_vec(_encoder)					\
+	container_of_const(_encoder, struct vc4_vec, encoder.base)
 
-static inline struct vc4_vec *
-connector_to_vc4_vec(struct drm_connector *connector)
-{
-	return container_of(connector, struct vc4_vec, connector);
-}
+#define connector_to_vc4_vec(_connector)				\
+	container_of_const(_connector, struct vc4_vec, connector)
 
 enum vc4_vec_tv_mode_id {
 	VC4_VEC_TV_MODE_NTSC,

-- 
2.39.2

