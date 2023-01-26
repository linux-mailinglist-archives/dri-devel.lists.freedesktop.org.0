Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F091A67CC96
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B5710E8F5;
	Thu, 26 Jan 2023 13:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FF110E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:48:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D49685C04A1;
 Thu, 26 Jan 2023 08:48:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 26 Jan 2023 08:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674740883; x=
 1674827283; bh=FSsBpcw8mXuSh/KQFKh6xmtSoH5w0b+NrRMQp1tcEu8=; b=f
 GCzjB5Z5aUbBkjzEm4Ge9Tu/shANs8Xtt+uvgso6iQ5gs5MUBK6URnq97+l+qjix
 WsKx+0Og/qBVA9Ndjvac8hgdNIm/OTLt0YsVZQT/zF1yzGvBSi683/c52XjO31c+
 Kf9DrVew6QJH/3gga58z99JzHQ5vbBVa7cri4oFJ7MRSAXLamKVhKlg3kwsnzhA9
 s6gSNfrvrfxcq5gEm42JI5+kbsjljKpmybhqHSbnKKB4/bzL30RxAoDLgn9bnlwP
 y+PbytoyM3VyFRo6m2Bu1OLF1JDjvGEVoI7XXGKveGSsjorsMaruyWQ0bMqoAhO8
 BZGcJKpuBVfuds5+FGI4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674740883; x=
 1674827283; bh=FSsBpcw8mXuSh/KQFKh6xmtSoH5w0b+NrRMQp1tcEu8=; b=Y
 96I1dIFYxH2KZ1y8pYCg1FrpncmPQpqlnak8Sr1DWOHDX8mebMQHuK/kCsZQJ/Ub
 rthHqalqp3mHTU78xbIInyQPGN8NDg7r2w3QMc/FFtclaHwnaQvABYmLL7V1x6NJ
 k9p3gBPz1Iiah8x3S4Gqmem5beDNCq7o4kHGWrnpjEJMG82o9s7Sw+yOXaWkTLRZ
 GueN3OoDs+IDqo/+bTF+V+jO2h1LrT0PZ97H+v04My8LXAgWOAdTqGF8lpJPEIAn
 eIVdWEMDn/BB6IbEEqe5S35u0qtuouhaCQ9PQpxAypHPRqKKdagLcWEGpAYbSFvx
 zSgT8swJhxLG0vnNJDppg==
X-ME-Sender: <xms:k4TSYyRjRTV6VUYtYBDW4KP8svGwD4S2Oj3PEDZoOBY7QgyzQxvX9w>
 <xme:k4TSY3yqw-qQwWakBaUSPQJsEwnydNQuVKqEUvpcFOSDWiLpO6RQYaNx12mjX0XIR
 XqOCeNIQJAwDASueV8>
X-ME-Received: <xmr:k4TSY_1WK2qOTJj9JiGsEkOpqbeo77aadpizpOo0rIfov73uskbxPhLhV_EWqMmRvWsLn49YAi17eokYPQzvSHl405-GzVmqa7N7qArrIOPrIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:k4TSY-DDugAcoArH7wW8peGbEBV8rnZistbxLI-l3oBRDsyjSjEPAQ>
 <xmx:k4TSY7hqRCr059tw59hERnCbuHSE1J7IpXsRTGG5XZKUdfd_prTz_A>
 <xmx:k4TSY6pciemQw59rxG6IkB0K-vJrN1gUMvRBbrBHegdcqvHdrMkp6g>
 <xmx:k4TSY6TW4nj0fKS9e3E1HGL5pGe6lo2Kl3Q-URjA6l45L2eaANYIWQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:48:02 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 14:46:35 +0100
Subject: [PATCH v2 1/9] drm/vc4: Switch to container_of_const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v2-1-8ace2d8221ad@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18543; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ztOSJ+35LdG0dBYR2QkyRaLU6ifgGzImhDjDgcVKD6s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXWlwiXy5ZGqgwcbf3ztMlU6TXfe0o9X1+4O3uS8m17zw5
 Tmye11HKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJHDJi+J91uqv5g7qmz5NNX5004w
 xXnV1QUTCv+wi3sd4/pe72H4sZ/kqeza3nvpTYwCc70701+fzBv6pyu4+57LmtMD2+ccfB+7wA
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
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
 drivers/gpu/drm/vc4/vc4_bo.c                |  2 +-
 drivers/gpu/drm/vc4/vc4_crtc.c              |  4 +-
 drivers/gpu/drm/vc4/vc4_dpi.c               |  7 +---
 drivers/gpu/drm/vc4/vc4_drv.h               | 65 +++++++++--------------------
 drivers/gpu/drm/vc4/vc4_dsi.c               | 19 ++++-----
 drivers/gpu/drm/vc4/vc4_gem.c               |  7 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.c              |  7 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.h              | 16 +++----
 drivers/gpu/drm/vc4/vc4_irq.c               |  2 +-
 drivers/gpu/drm/vc4/vc4_kms.c               | 16 +++----
 drivers/gpu/drm/vc4/vc4_plane.c             |  2 +-
 drivers/gpu/drm/vc4/vc4_txp.c               | 12 ++----
 drivers/gpu/drm/vc4/vc4_v3d.c               |  2 +-
 drivers/gpu/drm/vc4/vc4_vec.c               | 14 ++-----
 16 files changed, 65 insertions(+), 117 deletions(-)

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
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 86d629e45307..d0a00ed42cb0 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -609,7 +609,7 @@ static void vc4_free_object(struct drm_gem_object *gem_bo)
 static void vc4_bo_cache_time_work(struct work_struct *work)
 {
 	struct vc4_dev *vc4 =
-		container_of(work, struct vc4_dev, bo_cache.time_work);
+		container_of_const(work, struct vc4_dev, bo_cache.time_work);
 	struct drm_device *dev = &vc4->base;
 
 	mutex_lock(&vc4->bo_lock);
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index cdc0559221f0..4425dc15308d 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -869,7 +869,7 @@ vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
 static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
 {
 	struct vc4_async_flip_state *flip_state =
-		container_of(cb, struct vc4_async_flip_state, cb.seqno);
+		container_of_const(cb, struct vc4_async_flip_state, cb.seqno);
 	struct vc4_bo *bo = NULL;
 
 	if (flip_state->old_fb) {
@@ -897,7 +897,7 @@ static void vc4_async_page_flip_fence_complete(struct dma_fence *fence,
 					       struct dma_fence_cb *cb)
 {
 	struct vc4_async_flip_state *flip_state =
-		container_of(cb, struct vc4_async_flip_state, cb.fence);
+		container_of_const(cb, struct vc4_async_flip_state, cb.fence);
 
 	vc4_async_page_flip_complete(flip_state);
 	dma_fence_put(fence);
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
index a5c075f802e4..0923680f2b2b 100644
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
@@ -1625,7 +1620,7 @@ static void vc4_dsi_dma_chan_release(void *ptr)
 static void vc4_dsi_release(struct kref *kref)
 {
 	struct vc4_dsi *dsi =
-		container_of(kref, struct vc4_dsi, kref);
+		container_of_const(kref, struct vc4_dsi, kref);
 
 	kfree(dsi);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 628d40ff3aa1..0cb2e86edbf3 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -315,7 +315,7 @@ static void
 vc4_reset_work(struct work_struct *work)
 {
 	struct vc4_dev *vc4 =
-		container_of(work, struct vc4_dev, hangcheck.reset_work);
+		container_of_const(work, struct vc4_dev, hangcheck.reset_work);
 
 	vc4_save_hang_state(&vc4->base);
 
@@ -1039,7 +1039,8 @@ vc4_job_handle_completed(struct vc4_dev *vc4)
 
 static void vc4_seqno_cb_work(struct work_struct *work)
 {
-	struct vc4_seqno_cb *cb = container_of(work, struct vc4_seqno_cb, work);
+	struct vc4_seqno_cb *cb =
+		container_of_const(work, struct vc4_seqno_cb, work);
 
 	cb->func(cb);
 }
@@ -1077,7 +1078,7 @@ static void
 vc4_job_done_work(struct work_struct *work)
 {
 	struct vc4_dev *vc4 =
-		container_of(work, struct vc4_dev, job_done_work);
+		container_of_const(work, struct vc4_dev, job_done_work);
 
 	vc4_job_handle_completed(vc4);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 14628864487a..b3e7030305ea 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -948,9 +948,10 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 
 static void vc4_hdmi_scrambling_wq(struct work_struct *work)
 {
-	struct vc4_hdmi *vc4_hdmi = container_of(to_delayed_work(work),
-						 struct vc4_hdmi,
-						 scrambling_work);
+	struct vc4_hdmi *vc4_hdmi =
+		container_of_const(to_delayed_work(work),
+				   struct vc4_hdmi,
+				   scrambling_work);
 
 	if (drm_scdc_get_scrambling_status(vc4_hdmi->ddc))
 		return;
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
diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index 1e6db0121ccd..6408fbd1684e 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -63,7 +63,7 @@ static void
 vc4_overflow_mem_work(struct work_struct *work)
 {
 	struct vc4_dev *vc4 =
-		container_of(work, struct vc4_dev, overflow_mem_work);
+		container_of_const(work, struct vc4_dev, overflow_mem_work);
 	struct vc4_bo *bo;
 	int bin_bo_slot;
 	struct vc4_exec_info *exec;
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
index dee525bacd4b..f3cb28657973 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1333,7 +1333,7 @@ u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist)
 u32 vc4_plane_dlist_size(const struct drm_plane_state *state)
 {
 	const struct vc4_plane_state *vc4_state =
-		container_of(state, typeof(*vc4_state), base);
+		container_of_const(state, typeof(*vc4_state), base);
 
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
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 29a664c8bf44..f48cf1ea48bb 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -349,7 +349,7 @@ int vc4_v3d_bin_bo_get(struct vc4_dev *vc4, bool *used)
 
 static void bin_bo_release(struct kref *ref)
 {
-	struct vc4_dev *vc4 = container_of(ref, struct vc4_dev, bin_bo_kref);
+	struct vc4_dev *vc4 = container_of_const(ref, struct vc4_dev, bin_bo_kref);
 
 	if (WARN_ON_ONCE(!vc4->bin_bo))
 		return;
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
2.39.1
