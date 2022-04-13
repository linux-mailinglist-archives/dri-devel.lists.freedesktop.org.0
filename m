Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D26F5001A4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDCC10F133;
	Wed, 13 Apr 2022 22:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CAF10F133
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 769015C031C;
 Wed, 13 Apr 2022 18:19:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 13 Apr 2022 18:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888370; x=1649974770; bh=li
 VdDnZWRFN/01EDWJ04iBIR5q+lQrzOvuZ68gkGyyw=; b=oDd7p6QrclsdB2kEr+
 b4VXLYx8zVfp6/GGPo20iFE9nO19iLxL60kn/u+BFK43vwaL2BEIAcUicxjZHxNE
 OltBlAHGzFxh57XwjsNHlsHstZwc2PYrHsXBm5TZkXO0h31lro2PHOUPmkzOvrYD
 XBNy4Q0wgJQLnLltqB6YGQhT9TezApB6qXSl0+6u0eXjljLGKstN3rQ4ZAH/+XAg
 C9swaIMLkCb0IG2ohUCBEhrNSubzOCxiE1cU67Yp3ooxrqTPZLYWuAxKKsDMXlVI
 xEh9redb5YACaA6M9Yojq/vChXeADcP1dzuZ9Qn832n0wCPJWYeZDBd9nwQBrV14
 2+HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888370; x=1649974770; bh=liVdDnZWRFN/01EDWJ04iBIR5q+lQrzOvuZ
 68gkGyyw=; b=m5N3aDVtE1a1pPJ6sChRefOD8H8bwexJlBtFeBquBiTqGWJf3hr
 XX0CeZnFDLknqQMb4B/OlNM8pCEgCsvxhEcWwcxdbqRSFjbHIp4Ui+sod4gphPzi
 /RT7YwkPbeLri8BKZasQf0pdkchph/5c0M0ru/SH6lf7KFo4IJ/MIAAztUzkhLrS
 lnFiRJmKMwlDTPDBiIV7f5g6ZG2DHEr000Kyeipm0vVqXATApe5XjE3kFoZEnqJP
 sWlfnGk1UhB8jKILM79N8wcWnq3RsfY1rnOQ/QstXHIk8VEA+UpFVBCZfUmk+y1X
 ICvmIvrkjUYYJvXwVPSkkpmCu15ZbonD8hg==
X-ME-Sender: <xms:ckxXYjZadNcDJbQD7r9ibi404I-NpOAcz8BSGffrA1g8lVaNypfzvw>
 <xme:ckxXYiYJVYscMHrzeT8gRpR7QWV4uVMjl0cC4p-3DwmKFEzOSicmerm2iI08QwStP
 JQ_lrXzMRzpdkplDQ>
X-ME-Received: <xmr:ckxXYl9h1RMi3Pn4VyfvQn9_Qen88JpKydeEHcchGqJUg5eDFEGo4E7Iv0ftvvpSOZmkNwz1IBpm82Xngi63cJ_nTwWz4ZYUxD7ksQ29ScEdOQ83LtkOjLRX3mW43QleTGsSsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ckxXYpo7zZGKH5QcxZ58pUDwHxIYjLG_QIeeqwQFW3qx_nKSarUzjg>
 <xmx:ckxXYuqAKjLtKI5y3Z1MEcnrPZ6647Ctva94lwH956Y0SQdrX3Y_HQ>
 <xmx:ckxXYvS7idCnA164E4rr_4sxZUWXwujMJpPXM2t2Sb4_-4Wr5o2-bg>
 <xmx:ckxXYh6Eg1NzYJ1FQJJsGl16kbeOf4n5v_QoTV2EEDc9N4HnvLOCLg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:29 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 04/16] drm/rockchip: ebc: Add DRM driver skeleton
Date: Wed, 13 Apr 2022 17:19:04 -0500
Message-Id: <20220413221916.50995-5-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413221916.50995-1-samuel@sholland.org>
References: <20220413221916.50995-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <x@xff.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Rockchip E-Book Controller (EBC) has a relatively simple and self-
contained display pipeline. The pipeline consists of a single CRTC,
encoder, and bridge, with the bridge normally attached to a panel.

Initially, there is also a single plane. Since all blitting is done in
software, the driver could eventually support any number of planes. For
example, it could expose one plane for each supported waveform.

However, EPD controller hardware has some unique properties which
complicate using drm_simple_display_pipe:
  - EPDs operate on relative pixel values, not absolute pixel values.
    This requires the driver to maintain multiple shadow buffers for the
    "previous" and "next" framebuffer contents.
  - It also means that disabling the CRTC (i.e. clearing the screen)
    requires access to these shadow buffers, as it requires knowing the
    previous contents of the framebuffer. And of course it requires a
    buffer for the blank image.
  - Atomically managing these shadow buffers needs reference counting in
    .atomic_check. However, drm_simple_display_pipe_funcs::check is only
    called while the plane is visible, complicating this.
  - Furthermore, because all plane blitting/blending must be done in
    software, the number and location of these planes is arbitrary.
    drm_simple_display_pipe enforces an unnecessary limitation that a
    single plane covers the entire CRTC.

For these reasons, drm_simple_display_pipe is not used.

This commit adds the structure for this pipeline. The atomic helper
callbacks are left empty. They will be filled in incrementally by the
next several commits.

Both the CRTC and the pipe need extra state information, so this commit
adds the state hook boilerplate. Additionally, the plane takes advantage
of the shadow plane helpers.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/rockchip/rockchip_ebc.c | 359 +++++++++++++++++++++++-
 1 file changed, 356 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_ebc.c b/drivers/gpu/drm/rockchip/rockchip_ebc.c
index 5ed66c6cd2f0..f75fd23adda2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_ebc.c
+++ b/drivers/gpu/drm/rockchip/rockchip_ebc.c
@@ -12,6 +12,17 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
 #define EBC_DSP_START			0x0000
 #define EBC_DSP_START_DSP_OUT_LOW		BIT(31)
 #define EBC_DSP_START_DSP_SDCE_WIDTH(x)		((x) << 16)
@@ -118,10 +129,332 @@ struct rockchip_ebc {
 	struct clk			*dclk;
 	struct clk			*hclk;
 	struct completion		display_end;
+	struct drm_crtc			crtc;
+	struct drm_device		drm;
+	struct drm_encoder		encoder;
+	struct drm_plane		plane;
 	struct regmap			*regmap;
 	struct regulator_bulk_data	supplies[EBC_NUM_SUPPLIES];
 };
 
+DEFINE_DRM_GEM_FOPS(rockchip_ebc_fops);
+
+static const struct drm_driver rockchip_ebc_drm_driver = {
+	.lastclose		= drm_fb_helper_lastclose,
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.major			= 0,
+	.minor			= 3,
+	.name			= "rockchip-ebc",
+	.desc			= "Rockchip E-Book Controller",
+	.date			= "20220303",
+	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.fops			= &rockchip_ebc_fops,
+};
+
+static const struct drm_mode_config_funcs rockchip_ebc_mode_config_funcs = {
+	.fb_create		= drm_gem_fb_create_with_dirty,
+	.atomic_check		= drm_atomic_helper_check,
+	.atomic_commit		= drm_atomic_helper_commit,
+};
+
+/*
+ * CRTC
+ */
+
+struct ebc_crtc_state {
+	struct drm_crtc_state		base;
+};
+
+static inline struct ebc_crtc_state *
+to_ebc_crtc_state(struct drm_crtc_state *crtc_state)
+{
+	return container_of(crtc_state, struct ebc_crtc_state, base);
+}
+
+static inline struct rockchip_ebc *crtc_to_ebc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct rockchip_ebc, crtc);
+}
+
+static void rockchip_ebc_crtc_mode_set_nofb(struct drm_crtc *crtc)
+{
+}
+
+static int rockchip_ebc_crtc_atomic_check(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state)
+{
+	return 0;
+}
+
+static void rockchip_ebc_crtc_atomic_flush(struct drm_crtc *crtc,
+					   struct drm_atomic_state *state)
+{
+}
+
+static void rockchip_ebc_crtc_atomic_enable(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
+}
+
+static void rockchip_ebc_crtc_atomic_disable(struct drm_crtc *crtc,
+					     struct drm_atomic_state *state)
+{
+}
+
+static const struct drm_crtc_helper_funcs rockchip_ebc_crtc_helper_funcs = {
+	.mode_set_nofb		= rockchip_ebc_crtc_mode_set_nofb,
+	.atomic_check		= rockchip_ebc_crtc_atomic_check,
+	.atomic_flush		= rockchip_ebc_crtc_atomic_flush,
+	.atomic_enable		= rockchip_ebc_crtc_atomic_enable,
+	.atomic_disable		= rockchip_ebc_crtc_atomic_disable,
+};
+
+static void rockchip_ebc_crtc_destroy_state(struct drm_crtc *crtc,
+					    struct drm_crtc_state *crtc_state);
+
+static void rockchip_ebc_crtc_reset(struct drm_crtc *crtc)
+{
+	struct ebc_crtc_state *ebc_crtc_state;
+
+	if (crtc->state)
+		rockchip_ebc_crtc_destroy_state(crtc, crtc->state);
+
+	ebc_crtc_state = kzalloc(sizeof(*ebc_crtc_state), GFP_KERNEL);
+	if (!ebc_crtc_state)
+		return;
+
+	__drm_atomic_helper_crtc_reset(crtc, &ebc_crtc_state->base);
+}
+
+static struct drm_crtc_state *
+rockchip_ebc_crtc_duplicate_state(struct drm_crtc *crtc)
+{
+	struct ebc_crtc_state *ebc_crtc_state;
+
+	if (!crtc->state)
+		return NULL;
+
+	ebc_crtc_state = kzalloc(sizeof(*ebc_crtc_state), GFP_KERNEL);
+	if (!ebc_crtc_state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &ebc_crtc_state->base);
+
+	return &ebc_crtc_state->base;
+}
+
+static void rockchip_ebc_crtc_destroy_state(struct drm_crtc *crtc,
+					    struct drm_crtc_state *crtc_state)
+{
+	struct ebc_crtc_state *ebc_crtc_state = to_ebc_crtc_state(crtc_state);
+
+	__drm_atomic_helper_crtc_destroy_state(&ebc_crtc_state->base);
+
+	kfree(ebc_crtc_state);
+}
+
+static const struct drm_crtc_funcs rockchip_ebc_crtc_funcs = {
+	.reset			= rockchip_ebc_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= rockchip_ebc_crtc_duplicate_state,
+	.atomic_destroy_state	= rockchip_ebc_crtc_destroy_state,
+};
+
+/*
+ * Plane
+ */
+
+struct ebc_plane_state {
+	struct drm_shadow_plane_state	base;
+};
+
+static inline struct ebc_plane_state *
+to_ebc_plane_state(struct drm_plane_state *plane_state)
+{
+	return container_of(plane_state, struct ebc_plane_state, base.base);
+}
+
+static inline struct rockchip_ebc *plane_to_ebc(struct drm_plane *plane)
+{
+	return container_of(plane, struct rockchip_ebc, plane);
+}
+
+static int rockchip_ebc_plane_atomic_check(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	plane_state = drm_atomic_get_new_plane_state(state, plane);
+	if (!plane_state->crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  true, true);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void rockchip_ebc_plane_atomic_update(struct drm_plane *plane,
+					     struct drm_atomic_state *state)
+{
+}
+
+static const struct drm_plane_helper_funcs rockchip_ebc_plane_helper_funcs = {
+	.prepare_fb		= drm_gem_prepare_shadow_fb,
+	.cleanup_fb		= drm_gem_cleanup_shadow_fb,
+	.atomic_check		= rockchip_ebc_plane_atomic_check,
+	.atomic_update		= rockchip_ebc_plane_atomic_update,
+};
+
+static void rockchip_ebc_plane_destroy_state(struct drm_plane *plane,
+					     struct drm_plane_state *plane_state);
+
+static void rockchip_ebc_plane_reset(struct drm_plane *plane)
+{
+	struct ebc_plane_state *ebc_plane_state;
+
+	if (plane->state)
+		rockchip_ebc_plane_destroy_state(plane, plane->state);
+
+	ebc_plane_state = kzalloc(sizeof(*ebc_plane_state), GFP_KERNEL);
+	if (!ebc_plane_state)
+		return;
+
+	__drm_gem_reset_shadow_plane(plane, &ebc_plane_state->base);
+}
+
+static struct drm_plane_state *
+rockchip_ebc_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct ebc_plane_state *ebc_plane_state;
+
+	if (!plane->state)
+		return NULL;
+
+	ebc_plane_state = kzalloc(sizeof(*ebc_plane_state), GFP_KERNEL);
+	if (!ebc_plane_state)
+		return NULL;
+
+	__drm_gem_duplicate_shadow_plane_state(plane, &ebc_plane_state->base);
+
+	return &ebc_plane_state->base.base;
+}
+
+static void rockchip_ebc_plane_destroy_state(struct drm_plane *plane,
+					     struct drm_plane_state *plane_state)
+{
+	struct ebc_plane_state *ebc_plane_state = to_ebc_plane_state(plane_state);
+
+	__drm_gem_destroy_shadow_plane_state(&ebc_plane_state->base);
+
+	kfree(ebc_plane_state);
+}
+
+static const struct drm_plane_funcs rockchip_ebc_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= rockchip_ebc_plane_reset,
+	.atomic_duplicate_state	= rockchip_ebc_plane_duplicate_state,
+	.atomic_destroy_state	= rockchip_ebc_plane_destroy_state,
+};
+
+static const u32 rockchip_ebc_plane_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static const u64 rockchip_ebc_plane_format_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static int rockchip_ebc_drm_init(struct rockchip_ebc *ebc)
+{
+	struct drm_device *drm = &ebc->drm;
+	struct drm_bridge *bridge;
+	int ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	drm->mode_config.max_width = DRM_SHADOW_PLANE_MAX_WIDTH;
+	drm->mode_config.max_height = DRM_SHADOW_PLANE_MAX_HEIGHT;
+	drm->mode_config.funcs = &rockchip_ebc_mode_config_funcs;
+	drm->mode_config.quirk_addfb_prefer_host_byte_order = true;
+
+	drm_plane_helper_add(&ebc->plane, &rockchip_ebc_plane_helper_funcs);
+	ret = drm_universal_plane_init(drm, &ebc->plane, 0,
+				       &rockchip_ebc_plane_funcs,
+				       rockchip_ebc_plane_formats,
+				       ARRAY_SIZE(rockchip_ebc_plane_formats),
+				       rockchip_ebc_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_enable_fb_damage_clips(&ebc->plane);
+
+	drm_crtc_helper_add(&ebc->crtc, &rockchip_ebc_crtc_helper_funcs);
+	ret = drm_crtc_init_with_planes(drm, &ebc->crtc, &ebc->plane, NULL,
+					&rockchip_ebc_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	ebc->encoder.possible_crtcs = drm_crtc_mask(&ebc->crtc);
+	ret = drm_simple_encoder_init(drm, &ebc->encoder, DRM_MODE_ENCODER_NONE);
+	if (ret)
+		return ret;
+
+	bridge = devm_drm_of_get_bridge(drm->dev, drm->dev->of_node, 0, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
+
+	ret = drm_bridge_attach(&ebc->encoder, bridge, NULL, 0);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+
+static int __maybe_unused rockchip_ebc_suspend(struct device *dev)
+{
+	struct rockchip_ebc *ebc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = drm_mode_config_helper_suspend(&ebc->drm);
+	if (ret)
+		return ret;
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int __maybe_unused rockchip_ebc_resume(struct device *dev)
+{
+	struct rockchip_ebc *ebc = dev_get_drvdata(dev);
+
+	pm_runtime_force_resume(dev);
+
+	return drm_mode_config_helper_resume(&ebc->drm);
+}
+
 static int rockchip_ebc_runtime_suspend(struct device *dev)
 {
 	struct rockchip_ebc *ebc = dev_get_drvdata(dev);
@@ -173,6 +506,7 @@ static int rockchip_ebc_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rockchip_ebc_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(rockchip_ebc_suspend, rockchip_ebc_resume)
 	SET_RUNTIME_PM_OPS(rockchip_ebc_runtime_suspend,
 			   rockchip_ebc_runtime_resume, NULL)
 };
@@ -230,9 +564,10 @@ static int rockchip_ebc_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int i, ret;
 
-	ebc = devm_kzalloc(dev, sizeof(*ebc), GFP_KERNEL);
-	if (!ebc)
-		return -ENOMEM;
+	ebc = devm_drm_dev_alloc(dev, &rockchip_ebc_drm_driver,
+				 struct rockchip_ebc, drm);
+	if (IS_ERR(ebc))
+		return PTR_ERR(ebc);
 
 	platform_set_drvdata(pdev, ebc);
 	init_completion(&ebc->display_end);
@@ -279,13 +614,28 @@ static int rockchip_ebc_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	ret = rockchip_ebc_drm_init(ebc);
+	if (ret)
+		goto err_disable_pm;
+
 	return 0;
+
+err_disable_pm:
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		rockchip_ebc_runtime_suspend(dev);
+
+	return ret;
 }
 
 static int rockchip_ebc_remove(struct platform_device *pdev)
 {
+	struct rockchip_ebc *ebc = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	drm_dev_unregister(&ebc->drm);
+	drm_atomic_helper_shutdown(&ebc->drm);
+
 	pm_runtime_disable(dev);
 	if (!pm_runtime_status_suspended(dev))
 		rockchip_ebc_runtime_suspend(dev);
@@ -295,8 +645,11 @@ static int rockchip_ebc_remove(struct platform_device *pdev)
 
 static void rockchip_ebc_shutdown(struct platform_device *pdev)
 {
+	struct rockchip_ebc *ebc = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	drm_atomic_helper_shutdown(&ebc->drm);
+
 	if (!pm_runtime_status_suspended(dev))
 		rockchip_ebc_runtime_suspend(dev);
 }
-- 
2.35.1

