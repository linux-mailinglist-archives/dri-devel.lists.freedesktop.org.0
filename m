Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107761390A1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 13:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB2E6E065;
	Mon, 13 Jan 2020 12:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766106E065;
 Mon, 13 Jan 2020 12:03:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 04:03:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; 
 d="scan'208,217";a="243979866"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2020 04:03:07 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@intel.com, daniel@ffwll.ch, sam@ravnborg.org,
 sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Aditya Swarup <aditya.swarup@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Ausmus <james.ausmus@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Lyude Paul <lyude@redhat.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Shashank Sharma <shashank.sharma@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Drake <drake@endlessm.com>, Ramalingam C <ramalingam.c@intel.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 David Francis <David.Francis@amd.com>, Andi Shyti <andi@etezian.org>,
 Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, CQ Tang <cq.tang@intel.com>,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [Intel-gfx] [PATCH 4/6] drm/i915: Make WARN* drm specific where
 drm_priv ptr is available
Date: Mon, 13 Jan 2020 17:25:55 +0530
Message-Id: <20200113115557.32713-5-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200113115557.32713-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200113115557.32713-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminaryan.bharadiya@freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

command: spatch --sp-file <script> --dir drivers/gpu/drm/i915 \
					--linux-spacing --in-place

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c        |  14 +-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  19 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  10 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |   3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  81 +++++----
 drivers/gpu/drm/i915/display/intel_color.c    |   3 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  10 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  84 +++++----
 drivers/gpu/drm/i915/display/intel_display.c  | 160 ++++++++++-------
 .../drm/i915/display/intel_display_power.c    | 170 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c       |  96 +++++-----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  10 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |   3 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  35 ++--
 drivers/gpu/drm/i915/display/intel_dsb.c      |   6 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |  23 +--
 drivers/gpu/drm/i915/display/intel_gmbus.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  21 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  37 ++--
 drivers/gpu/drm/i915/display/intel_hotplug.c  |   5 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |   3 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |   7 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  12 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  19 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |   3 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  32 ++--
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   7 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |   5 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |  17 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c        |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  15 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   8 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |   3 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c          |   4 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   7 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  21 ++-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   2 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c        |   6 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |   4 +-
 drivers/gpu/drm/i915/gvt/display.c            |   3 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |   4 +-
 drivers/gpu/drm/i915/gvt/edid.c               |   2 +-
 drivers/gpu/drm/i915/gvt/gvt.c                |   4 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |   2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |   2 +-
 drivers/gpu/drm/i915/i915_drv.c               |  19 +-
 drivers/gpu/drm/i915/i915_gem.c               |   7 +-
 drivers/gpu/drm/i915/i915_irq.c               |  73 ++++----
 drivers/gpu/drm/i915/i915_pmu.c               |   6 +-
 drivers/gpu/drm/i915/intel_csr.c              |   4 +-
 drivers/gpu/drm/i915/intel_pch.c              |  68 ++++---
 drivers/gpu/drm/i915/intel_pm.c               |  24 +--
 drivers/gpu/drm/i915/intel_sideband.c         |   7 +-
 drivers/gpu/drm/i915/intel_uncore.c           |   2 +-
 64 files changed, 704 insertions(+), 538 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index aef4834a377f..6924b106971c 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -348,7 +348,7 @@ static void get_dsi_io_power_domains(struct drm_i915_private *dev_priv,
 	enum port port;
 
 	for_each_dsi_port(port, intel_dsi->ports) {
-		WARN_ON(intel_dsi->io_wakeref[port]);
+		drm_WARN_ON(&dev_priv->drm, intel_dsi->io_wakeref[port]);
 		intel_dsi->io_wakeref[port] =
 			intel_display_power_get(dev_priv,
 						port == PORT_A ?
@@ -1357,11 +1357,13 @@ static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
 		return ret;
 
 	/* DSI specific sanity checks on the common code */
-	WARN_ON(vdsc_cfg->vbr_enable);
-	WARN_ON(vdsc_cfg->simple_422);
-	WARN_ON(vdsc_cfg->pic_width % vdsc_cfg->slice_width);
-	WARN_ON(vdsc_cfg->slice_height < 8);
-	WARN_ON(vdsc_cfg->pic_height % vdsc_cfg->slice_height);
+	drm_WARN_ON(&dev_priv->drm, vdsc_cfg->vbr_enable);
+	drm_WARN_ON(&dev_priv->drm, vdsc_cfg->simple_422);
+	drm_WARN_ON(&dev_priv->drm,
+		    vdsc_cfg->pic_width % vdsc_cfg->slice_width);
+	drm_WARN_ON(&dev_priv->drm, vdsc_cfg->slice_height < 8);
+	drm_WARN_ON(&dev_priv->drm,
+		    vdsc_cfg->pic_height % vdsc_cfg->slice_height);
 
 	ret = drm_dsc_compute_rc_parameters(vdsc_cfg);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index c362eecdd414..2392b720e895 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -314,7 +314,8 @@ static void intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_sta
 		}
 	}
 
-	if (WARN(*scaler_id < 0, "Cannot find scaler for %s:%d\n", name, idx))
+	if (drm_WARN(&dev_priv->drm, *scaler_id < 0,
+		     "Cannot find scaler for %s:%d\n", name, idx))
 		return;
 
 	/* set scaler mode */
@@ -465,7 +466,8 @@ int intel_atomic_setup_scalers(struct drm_i915_private *dev_priv,
 			idx = plane->base.id;
 
 			/* plane on different crtc cannot be a scaler user of this crtc */
-			if (WARN_ON(intel_plane->pipe != intel_crtc->pipe))
+			if (drm_WARN_ON(&dev_priv->drm,
+					intel_plane->pipe != intel_crtc->pipe))
 				continue;
 
 			plane_state = intel_atomic_get_new_plane_state(intel_state,
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index e406719a6716..7af6bfaae3be 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -565,7 +565,7 @@ static void ilk_audio_codec_disable(struct intel_encoder *encoder,
 		      encoder->base.base.id, encoder->base.name,
 		      pipe_name(pipe));
 
-	if (WARN_ON(port == PORT_A))
+	if (drm_WARN_ON(&dev_priv->drm, port == PORT_A))
 		return;
 
 	if (HAS_PCH_IBX(dev_priv)) {
@@ -615,7 +615,7 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
 		      encoder->base.base.id, encoder->base.name,
 		      pipe_name(pipe), drm_eld_size(eld));
 
-	if (WARN_ON(port == PORT_A))
+	if (drm_WARN_ON(&dev_priv->drm, port == PORT_A))
 		return;
 
 	/*
@@ -809,7 +809,7 @@ static void glk_force_audio_cdclk(struct drm_i915_private *dev_priv,
 
 	drm_modeset_acquire_init(&ctx, 0);
 	state = drm_atomic_state_alloc(&dev_priv->drm);
-	if (WARN_ON(!state))
+	if (drm_WARN_ON(&dev_priv->drm, !state))
 		return;
 
 	state->acquire_ctx = &ctx;
@@ -830,7 +830,7 @@ static void glk_force_audio_cdclk(struct drm_i915_private *dev_priv,
 		goto retry;
 	}
 
-	WARN_ON(ret);
+	drm_WARN_ON(&dev_priv->drm, ret);
 
 	drm_atomic_state_put(state);
 
@@ -917,7 +917,7 @@ static int i915_audio_component_get_cdclk_freq(struct device *kdev)
 {
 	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
 
-	if (WARN_ON_ONCE(!HAS_DDI(dev_priv)))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !HAS_DDI(dev_priv)))
 		return -ENODEV;
 
 	return dev_priv->cdclk.hw.cdclk;
@@ -940,7 +940,8 @@ static struct intel_encoder *get_saved_enc(struct drm_i915_private *dev_priv,
 
 	/* MST */
 	if (pipe >= 0) {
-		if (WARN_ON(pipe >= ARRAY_SIZE(dev_priv->av_enc_map)))
+		if (drm_WARN_ON(&dev_priv->drm,
+				pipe >= ARRAY_SIZE(dev_priv->av_enc_map)))
 			return NULL;
 
 		encoder = dev_priv->av_enc_map[pipe];
@@ -1057,10 +1058,12 @@ static int i915_audio_component_bind(struct device *i915_kdev,
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
 	int i;
 
-	if (WARN_ON(acomp->base.ops || acomp->base.dev))
+	if (drm_WARN_ON(&dev_priv->drm, acomp->base.ops || acomp->base.dev))
 		return -EEXIST;
 
-	if (WARN_ON(!device_link_add(hda_kdev, i915_kdev, DL_FLAG_STATELESS)))
+	if (drm_WARN_ON(&dev_priv->drm, !device_link_add(hda_kdev,
+							 i915_kdev,
+							 DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
 	drm_modeset_lock_all(&dev_priv->drm);
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 8beac06e3f10..24963042dd52 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -228,7 +228,7 @@ parse_panel_options(struct drm_i915_private *dev_priv,
 
 	ret = intel_opregion_get_panel_type(dev_priv);
 	if (ret >= 0) {
-		WARN_ON(ret > 0xf);
+		drm_WARN_ON(&dev_priv->drm, ret > 0xf);
 		panel_type = ret;
 		DRM_DEBUG_KMS("Panel type: %d (OpRegion)\n", panel_type);
 	} else {
@@ -1218,7 +1218,8 @@ static int get_init_otp_deassert_fragment_len(struct drm_i915_private *dev_priv)
 	const u8 *data = dev_priv->vbt.dsi.sequence[MIPI_SEQ_INIT_OTP];
 	int index, len;
 
-	if (WARN_ON(!data || dev_priv->vbt.dsi.seq_version != 1))
+	if (drm_WARN_ON(&dev_priv->drm,
+			!data || dev_priv->vbt.dsi.seq_version != 1))
 		return 0;
 
 	/* index = 1 to skip sequence byte */
@@ -2242,7 +2243,8 @@ bool intel_bios_is_port_present(struct drm_i915_private *dev_priv, enum port por
 	}
 
 	/* FIXME maybe deal with port A as well? */
-	if (WARN_ON(port == PORT_A) || port >= ARRAY_SIZE(port_mapping))
+	if (drm_WARN_ON(&dev_priv->drm, port == PORT_A) ||
+	    port >= ARRAY_SIZE(port_mapping))
 		return false;
 
 	list_for_each_entry(devdata, &dev_priv->vbt.display_devices, node) {
@@ -2491,7 +2493,7 @@ intel_bios_is_port_hpd_inverted(const struct drm_i915_private *i915,
 	const struct child_device_config *child =
 		i915->vbt.ddi_port_info[port].child;
 
-	if (WARN_ON_ONCE(!IS_GEN9_LP(i915)))
+	if (drm_WARN_ON_ONCE(&i915->drm, !IS_GEN9_LP(i915)))
 		return false;
 
 	return child && child->hpd_invert;
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index b228671d5a5d..5d173bb234d5 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -122,7 +122,8 @@ static int icl_get_qgv_points(struct drm_i915_private *dev_priv,
 	if (ret)
 		return ret;
 
-	if (WARN_ON(qi->num_points > ARRAY_SIZE(qi->points)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			qi->num_points > ARRAY_SIZE(qi->points)))
 		qi->num_points = ARRAY_SIZE(qi->points);
 
 	for (i = 0; i < qi->num_points; i++) {
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 7d1ab1e5b7c3..9a54f94e2430 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -520,7 +520,8 @@ static void vlv_program_pfi_credits(struct drm_i915_private *dev_priv)
 	 * FIXME is this guaranteed to clear
 	 * immediately or should we poll for it?
 	 */
-	WARN_ON(I915_READ(GCI_CONTROL) & PFI_CREDIT_RESEND);
+	drm_WARN_ON(&dev_priv->drm,
+		    I915_READ(GCI_CONTROL) & PFI_CREDIT_RESEND);
 }
 
 static void vlv_set_cdclk(struct drm_i915_private *dev_priv,
@@ -719,12 +720,14 @@ static void bdw_set_cdclk(struct drm_i915_private *dev_priv,
 	u32 val;
 	int ret;
 
-	if (WARN((I915_READ(LCPLL_CTL) &
-		  (LCPLL_PLL_DISABLE | LCPLL_PLL_LOCK |
-		   LCPLL_CD_CLOCK_DISABLE | LCPLL_ROOT_CD_CLOCK_DISABLE |
-		   LCPLL_CD2X_CLOCK_DISABLE | LCPLL_POWER_DOWN_ALLOW |
-		   LCPLL_CD_SOURCE_FCLK)) != LCPLL_PLL_LOCK,
-		 "trying to change cdclk frequency with cdclk not enabled\n"))
+	if (drm_WARN(&dev_priv->drm, (I915_READ(LCPLL_CTL) &
+				      (LCPLL_PLL_DISABLE | LCPLL_PLL_LOCK |
+				       LCPLL_CD_CLOCK_DISABLE |
+				       LCPLL_ROOT_CD_CLOCK_DISABLE |
+				       LCPLL_CD2X_CLOCK_DISABLE |
+				       LCPLL_POWER_DOWN_ALLOW |
+				       LCPLL_CD_SOURCE_FCLK)) != LCPLL_PLL_LOCK,
+		     "trying to change cdclk frequency with cdclk not enabled\n"))
 		return;
 
 	ret = sandybridge_pcode_write(dev_priv,
@@ -832,15 +835,16 @@ static void skl_dpll0_update(struct drm_i915_private *dev_priv,
 	if ((val & LCPLL_PLL_ENABLE) == 0)
 		return;
 
-	if (WARN_ON((val & LCPLL_PLL_LOCK) == 0))
+	if (drm_WARN_ON(&dev_priv->drm, (val & LCPLL_PLL_LOCK) == 0))
 		return;
 
 	val = I915_READ(DPLL_CTRL1);
 
-	if (WARN_ON((val & (DPLL_CTRL1_HDMI_MODE(SKL_DPLL0) |
-			    DPLL_CTRL1_SSC(SKL_DPLL0) |
-			    DPLL_CTRL1_OVERRIDE(SKL_DPLL0))) !=
-		    DPLL_CTRL1_OVERRIDE(SKL_DPLL0)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			(val & (DPLL_CTRL1_HDMI_MODE(SKL_DPLL0) |
+				DPLL_CTRL1_SSC(SKL_DPLL0) |
+				DPLL_CTRL1_OVERRIDE(SKL_DPLL0))) !=
+			DPLL_CTRL1_OVERRIDE(SKL_DPLL0)))
 		return;
 
 	switch (val & DPLL_CTRL1_LINK_RATE_MASK(SKL_DPLL0)) {
@@ -942,7 +946,7 @@ static void skl_dpll0_enable(struct drm_i915_private *dev_priv, int vco)
 {
 	u32 val;
 
-	WARN_ON(vco != 8100000 && vco != 8640000);
+	drm_WARN_ON(&dev_priv->drm, vco != 8100000 && vco != 8640000);
 
 	/*
 	 * We always enable DPLL0 with the lowest link rate possible, but still
@@ -1005,7 +1009,8 @@ static void skl_set_cdclk(struct drm_i915_private *dev_priv,
 	 * use the corresponding VCO freq as that always leads to using the
 	 * minimum 308MHz CDCLK.
 	 */
-	WARN_ON_ONCE(IS_SKYLAKE(dev_priv) && vco == 8640000);
+	drm_WARN_ON_ONCE(&dev_priv->drm,
+			 IS_SKYLAKE(dev_priv) && vco == 8640000);
 
 	ret = skl_pcode_request(dev_priv, SKL_PCODE_CDCLK_CONTROL,
 				SKL_CDCLK_PREPARE_FOR_CHANGE,
@@ -1020,8 +1025,9 @@ static void skl_set_cdclk(struct drm_i915_private *dev_priv,
 	/* Choose frequency for this cdclk */
 	switch (cdclk) {
 	default:
-		WARN_ON(cdclk != dev_priv->cdclk.hw.bypass);
-		WARN_ON(vco != 0);
+		drm_WARN_ON(&dev_priv->drm,
+			    cdclk != dev_priv->cdclk.hw.bypass);
+		drm_WARN_ON(&dev_priv->drm, vco != 0);
 		/* fall through */
 	case 308571:
 	case 337500:
@@ -1223,8 +1229,9 @@ static int bxt_calc_cdclk(struct drm_i915_private *dev_priv, int min_cdclk)
 		    table[i].cdclk >= min_cdclk)
 			return table[i].cdclk;
 
-	WARN(1, "Cannot satisfy minimum cdclk %d with refclk %u\n",
-	     min_cdclk, dev_priv->cdclk.hw.ref);
+	drm_WARN(&dev_priv->drm, 1,
+		 "Cannot satisfy minimum cdclk %d with refclk %u\n",
+		 min_cdclk, dev_priv->cdclk.hw.ref);
 	return 0;
 }
 
@@ -1241,8 +1248,8 @@ static int bxt_calc_cdclk_pll_vco(struct drm_i915_private *dev_priv, int cdclk)
 		    table[i].cdclk == cdclk)
 			return dev_priv->cdclk.hw.ref * table[i].ratio;
 
-	WARN(1, "cdclk %d not valid for refclk %u\n",
-	     cdclk, dev_priv->cdclk.hw.ref);
+	drm_WARN(&dev_priv->drm, 1, "cdclk %d not valid for refclk %u\n",
+		 cdclk, dev_priv->cdclk.hw.ref);
 	return 0;
 }
 
@@ -1375,15 +1382,17 @@ static void bxt_get_cdclk(struct drm_i915_private *dev_priv,
 		div = 2;
 		break;
 	case BXT_CDCLK_CD2X_DIV_SEL_1_5:
-		WARN(IS_GEMINILAKE(dev_priv) || INTEL_GEN(dev_priv) >= 10,
-		     "Unsupported divider\n");
+		drm_WARN(&dev_priv->drm,
+			 IS_GEMINILAKE(dev_priv) || INTEL_GEN(dev_priv) >= 10,
+			 "Unsupported divider\n");
 		div = 3;
 		break;
 	case BXT_CDCLK_CD2X_DIV_SEL_2:
 		div = 4;
 		break;
 	case BXT_CDCLK_CD2X_DIV_SEL_4:
-		WARN(INTEL_GEN(dev_priv) >= 10, "Unsupported divider\n");
+		drm_WARN(&dev_priv->drm, INTEL_GEN(dev_priv) >= 10,
+			 "Unsupported divider\n");
 		div = 8;
 		break;
 	default:
@@ -1520,22 +1529,25 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
 	/* cdclk = vco / 2 / div{1,1.5,2,4} */
 	switch (DIV_ROUND_CLOSEST(vco, cdclk)) {
 	default:
-		WARN_ON(cdclk != dev_priv->cdclk.hw.bypass);
-		WARN_ON(vco != 0);
+		drm_WARN_ON(&dev_priv->drm,
+			    cdclk != dev_priv->cdclk.hw.bypass);
+		drm_WARN_ON(&dev_priv->drm, vco != 0);
 		/* fall through */
 	case 2:
 		divider = BXT_CDCLK_CD2X_DIV_SEL_1;
 		break;
 	case 3:
-		WARN(IS_GEMINILAKE(dev_priv) || INTEL_GEN(dev_priv) >= 10,
-		     "Unsupported divider\n");
+		drm_WARN(&dev_priv->drm,
+			 IS_GEMINILAKE(dev_priv) || INTEL_GEN(dev_priv) >= 10,
+			 "Unsupported divider\n");
 		divider = BXT_CDCLK_CD2X_DIV_SEL_1_5;
 		break;
 	case 4:
 		divider = BXT_CDCLK_CD2X_DIV_SEL_2;
 		break;
 	case 8:
-		WARN(INTEL_GEN(dev_priv) >= 10, "Unsupported divider\n");
+		drm_WARN(&dev_priv->drm, INTEL_GEN(dev_priv) >= 10,
+			 "Unsupported divider\n");
 		divider = BXT_CDCLK_CD2X_DIV_SEL_4;
 		break;
 	}
@@ -1848,15 +1860,16 @@ static void intel_set_cdclk(struct drm_i915_private *dev_priv,
 	if (!intel_cdclk_changed(&dev_priv->cdclk.hw, cdclk_state))
 		return;
 
-	if (WARN_ON_ONCE(!dev_priv->display.set_cdclk))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !dev_priv->display.set_cdclk))
 		return;
 
 	intel_dump_cdclk_state(cdclk_state, "Changing CDCLK to");
 
 	dev_priv->display.set_cdclk(dev_priv, cdclk_state, pipe);
 
-	if (WARN(intel_cdclk_changed(&dev_priv->cdclk.hw, cdclk_state),
-		 "cdclk state doesn't match!\n")) {
+	if (drm_WARN(&dev_priv->drm,
+		     intel_cdclk_changed(&dev_priv->cdclk.hw, cdclk_state),
+		     "cdclk state doesn't match!\n")) {
 		intel_dump_cdclk_state(&dev_priv->cdclk.hw, "[hw state]");
 		intel_dump_cdclk_state(cdclk_state, "[sw state]");
 	}
@@ -2445,7 +2458,7 @@ void intel_update_max_cdclk(struct drm_i915_private *dev_priv)
 		int max_cdclk, vco;
 
 		vco = dev_priv->skl_preferred_vco_freq;
-		WARN_ON(vco != 8100000 && vco != 8640000);
+		drm_WARN_ON(&dev_priv->drm, vco != 8100000 && vco != 8640000);
 
 		/*
 		 * Use the lower (vco 8640) cdclk values as a
@@ -2697,8 +2710,8 @@ void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
 	else if (IS_I845G(dev_priv))
 		dev_priv->display.get_cdclk = fixed_200mhz_get_cdclk;
 	else { /* 830 */
-		WARN(!IS_I830(dev_priv),
-		     "Unknown platform. Assuming 133 MHz CDCLK\n");
+		drm_WARN(&dev_priv->drm, !IS_I830(dev_priv),
+			 "Unknown platform. Assuming 133 MHz CDCLK\n");
 		dev_priv->display.get_cdclk = fixed_133mhz_get_cdclk;
 	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 3980e8b50c28..9e3be709a1cd 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -297,7 +297,8 @@ static void ilk_load_csc_matrix(const struct intel_crtc_state *crtc_state)
 		 * LUT is needed but CSC is not we need to load an
 		 * identity matrix.
 		 */
-		WARN_ON(!IS_CANNONLAKE(dev_priv) && !IS_GEMINILAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_CANNONLAKE(dev_priv) &&
+			    !IS_GEMINILAKE(dev_priv));
 
 		ilk_update_pipe_csc(crtc, ilk_csc_off_zero,
 				    ilk_csc_coeff_identity,
diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
index 44bbc7e74fc3..fbf2addc1439 100644
--- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
@@ -219,7 +219,7 @@ void intel_combo_phy_power_up_lanes(struct drm_i915_private *dev_priv,
 	u32 val;
 
 	if (is_dsi) {
-		WARN_ON(lane_reversal);
+		drm_WARN_ON(&dev_priv->drm, lane_reversal);
 
 		switch (lane_count) {
 		case 1:
diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 62bb655b71ce..42acc511eca9 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -230,7 +230,7 @@ static void hsw_disable_crt(struct intel_encoder *encoder,
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 
-	WARN_ON(!old_crtc_state->has_pch_encoder);
+	drm_WARN_ON(&dev_priv->drm, !old_crtc_state->has_pch_encoder);
 
 	intel_set_pch_fifo_underrun_reporting(dev_priv, PIPE_A, false);
 }
@@ -258,7 +258,7 @@ static void hsw_post_disable_crt(struct intel_encoder *encoder,
 
 	intel_ddi_fdi_post_disable(encoder, old_crtc_state, old_conn_state);
 
-	WARN_ON(!old_crtc_state->has_pch_encoder);
+	drm_WARN_ON(&dev_priv->drm, !old_crtc_state->has_pch_encoder);
 
 	intel_set_pch_fifo_underrun_reporting(dev_priv, PIPE_A, true);
 }
@@ -269,7 +269,7 @@ static void hsw_pre_pll_enable_crt(struct intel_encoder *encoder,
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 
-	WARN_ON(!crtc_state->has_pch_encoder);
+	drm_WARN_ON(&dev_priv->drm, !crtc_state->has_pch_encoder);
 
 	intel_set_pch_fifo_underrun_reporting(dev_priv, PIPE_A, false);
 }
@@ -282,7 +282,7 @@ static void hsw_pre_enable_crt(struct intel_encoder *encoder,
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
 
-	WARN_ON(!crtc_state->has_pch_encoder);
+	drm_WARN_ON(&dev_priv->drm, !crtc_state->has_pch_encoder);
 
 	intel_set_cpu_fifo_underrun_reporting(dev_priv, pipe, false);
 
@@ -299,7 +299,7 @@ static void hsw_enable_crt(struct intel_encoder *encoder,
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
 
-	WARN_ON(!crtc_state->has_pch_encoder);
+	drm_WARN_ON(&dev_priv->drm, !crtc_state->has_pch_encoder);
 
 	intel_crt_set_dpms(encoder, crtc_state, DRM_MODE_DPMS_ON);
 
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 4b384d974922..67c9f4444896 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -937,11 +937,11 @@ static int intel_ddi_hdmi_level(struct drm_i915_private *dev_priv, enum port por
 		intel_ddi_get_buf_trans_hdmi(dev_priv, &n_entries);
 		default_entry = 6;
 	} else {
-		WARN(1, "ddi translation table missing\n");
+		drm_WARN(&dev_priv->drm, 1, "ddi translation table missing\n");
 		return 0;
 	}
 
-	if (WARN_ON_ONCE(n_entries == 0))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, n_entries == 0))
 		return 0;
 
 	if (port_info->hdmi_level_shift_set)
@@ -949,7 +949,7 @@ static int intel_ddi_hdmi_level(struct drm_i915_private *dev_priv, enum port por
 	else
 		level = default_entry;
 
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
 		level = n_entries - 1;
 
 	return level;
@@ -1008,9 +1008,9 @@ static void intel_prepare_hdmi_ddi_buffers(struct intel_encoder *encoder,
 
 	ddi_translations = intel_ddi_get_buf_trans_hdmi(dev_priv, &n_entries);
 
-	if (WARN_ON_ONCE(!ddi_translations))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
 		return;
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
 		level = n_entries - 1;
 
 	/* If we're boosting the current, set bit 31 of trans1 */
@@ -1143,7 +1143,7 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 	/* Configure Port Clock Select */
 	ddi_pll_sel = hsw_pll_to_ddi_pll_sel(crtc_state->shared_dpll);
 	I915_WRITE(PORT_CLK_SEL(PORT_E), ddi_pll_sel);
-	WARN_ON(ddi_pll_sel != PORT_CLK_SEL_SPLL);
+	drm_WARN_ON(&dev_priv->drm, ddi_pll_sel != PORT_CLK_SEL_SPLL);
 
 	/* Start the training iterating through available voltages and emphasis,
 	 * testing each value twice. */
@@ -1420,7 +1420,7 @@ int cnl_calc_wrpll_link(struct drm_i915_private *dev_priv,
 	dco_freq += (((pll_state->cfgcr0 & DPLL_CFGCR0_DCO_FRACTION_MASK) >>
 		      DPLL_CFGCR0_DCO_FRACTION_SHIFT) * ref_clock) / 0x8000;
 
-	if (WARN_ON(p0 == 0 || p1 == 0 || p2 == 0))
+	if (drm_WARN_ON(&dev_priv->drm, p0 == 0 || p1 == 0 || p2 == 0))
 		return 0;
 
 	return dco_freq / (p0 * p1 * p2 * 5);
@@ -1608,7 +1608,7 @@ static void cnl_ddi_clock_get(struct intel_encoder *encoder,
 			link_clock = 405000;
 			break;
 		default:
-			WARN(1, "Unsupported link rate\n");
+			drm_WARN(&dev_priv->drm, 1, "Unsupported link rate\n");
 			break;
 		}
 		link_clock *= 2;
@@ -1699,12 +1699,12 @@ static void hsw_ddi_clock_get(struct intel_encoder *encoder,
 		else if (pll == SPLL_FREQ_2700MHz)
 			link_clock = 270000;
 		else {
-			WARN(1, "bad spll freq\n");
+			drm_WARN(&dev_priv->drm, 1, "bad spll freq\n");
 			return;
 		}
 		break;
 	default:
-		WARN(1, "bad port clock sel\n");
+		drm_WARN(&dev_priv->drm, 1, "bad port clock sel\n");
 		return;
 	}
 
@@ -1765,7 +1765,7 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
 	if (!intel_crtc_has_dp_encoder(crtc_state))
 		return;
 
-	WARN_ON(transcoder_is_dsi(cpu_transcoder));
+	drm_WARN_ON(&dev_priv->drm, transcoder_is_dsi(cpu_transcoder));
 
 	temp = DP_MSA_MISC_SYNC_CLOCK;
 
@@ -1788,8 +1788,8 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
 	}
 
 	/* nonsense combination */
-	WARN_ON(crtc_state->limited_color_range &&
-		crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
+	drm_WARN_ON(&dev_priv->drm, crtc_state->limited_color_range &&
+		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
 
 	if (crtc_state->limited_color_range)
 		temp |= DP_MSA_MISC_COLOR_CEA_RGB;
@@ -1905,7 +1905,8 @@ intel_ddi_transcoder_func_reg_val_get(const struct intel_crtc_state *crtc_state)
 			enum transcoder master;
 
 			master = crtc_state->mst_master_transcoder;
-			WARN_ON(master == INVALID_TRANSCODER);
+			drm_WARN_ON(&dev_priv->drm,
+				    master == INVALID_TRANSCODER);
 			temp |= TRANS_DDI_MST_TRANSPORT_SELECT(master);
 		}
 	} else {
@@ -2223,7 +2224,8 @@ static void intel_ddi_get_power_domains(struct intel_encoder *encoder,
 	 * happen since fake-MST encoders don't set their get_power_domains()
 	 * hook.
 	 */
-	if (WARN_ON(intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)))
 		return;
 
 	dig_port = enc_to_dig_port(&encoder->base);
@@ -2317,9 +2319,9 @@ static void skl_ddi_set_iboost(struct intel_encoder *encoder,
 		else
 			ddi_translations = intel_ddi_get_buf_trans_dp(dev_priv, port, &n_entries);
 
-		if (WARN_ON_ONCE(!ddi_translations))
+		if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
 			return;
-		if (WARN_ON_ONCE(level >= n_entries))
+		if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
 			level = n_entries - 1;
 
 		iboost = ddi_translations[level].i_boost;
@@ -2352,9 +2354,9 @@ static void bxt_ddi_vswing_sequence(struct intel_encoder *encoder,
 	else
 		ddi_translations = bxt_get_buf_trans_dp(dev_priv, &n_entries);
 
-	if (WARN_ON_ONCE(!ddi_translations))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
 		return;
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
 		level = n_entries - 1;
 
 	bxt_ddi_phy_set_signal_level(dev_priv, port,
@@ -2401,9 +2403,10 @@ u8 intel_ddi_dp_voltage_max(struct intel_encoder *encoder)
 			intel_ddi_get_buf_trans_dp(dev_priv, port, &n_entries);
 	}
 
-	if (WARN_ON(n_entries < 1))
+	if (drm_WARN_ON(&dev_priv->drm, n_entries < 1))
 		n_entries = 1;
-	if (WARN_ON(n_entries > ARRAY_SIZE(index_to_dp_signal_levels)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			n_entries > ARRAY_SIZE(index_to_dp_signal_levels)))
 		n_entries = ARRAY_SIZE(index_to_dp_signal_levels);
 
 	return index_to_dp_signal_levels[n_entries - 1] &
@@ -2446,9 +2449,9 @@ static void cnl_ddi_vswing_program(struct intel_encoder *encoder,
 	else
 		ddi_translations = cnl_get_buf_trans_dp(dev_priv, &n_entries);
 
-	if (WARN_ON_ONCE(!ddi_translations))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
 		return;
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
 		level = n_entries - 1;
 
 	/* Set PORT_TX_DW5 Scaling Mode Sel to 010b. */
@@ -2968,7 +2971,8 @@ static void icl_map_plls_to_ports(struct intel_encoder *encoder,
 	mutex_lock(&dev_priv->dpll_lock);
 
 	val = I915_READ(ICL_DPCLKA_CFGCR0);
-	WARN_ON((val & icl_dpclka_cfgcr0_clk_off(dev_priv, phy)) == 0);
+	drm_WARN_ON(&dev_priv->drm,
+		    (val & icl_dpclka_cfgcr0_clk_off(dev_priv, phy)) == 0);
 
 	if (intel_phy_is_combo(dev_priv, phy)) {
 		/*
@@ -3027,7 +3031,7 @@ static void icl_sanitize_port_clk_off(struct drm_i915_private *dev_priv,
 		 * Punt on the case now where clock is gated, but it would
 		 * be needed by the port. Something else is really broken then.
 		 */
-		if (WARN_ON(ddi_clk_needed))
+		if (drm_WARN_ON(&dev_priv->drm, ddi_clk_needed))
 			continue;
 
 		DRM_NOTE("PHY %c is disabled/in DSI mode with an ungated DDI clock, gate it\n",
@@ -3059,7 +3063,7 @@ void icl_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
 		 * In the unlikely case that BIOS enables DP in MST mode, just
 		 * warn since our MST HW readout is incomplete.
 		 */
-		if (WARN_ON(is_mst))
+		if (drm_WARN_ON(&dev_priv->drm, is_mst))
 			return;
 	}
 
@@ -3078,7 +3082,8 @@ void icl_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
 			if (other_encoder == encoder)
 				continue;
 
-			if (WARN_ON(port_mask & BIT(other_encoder->port)))
+			if (drm_WARN_ON(&dev_priv->drm,
+					port_mask & BIT(other_encoder->port)))
 				return;
 		}
 		/*
@@ -3100,7 +3105,7 @@ static void intel_ddi_clk_select(struct intel_encoder *encoder,
 	u32 val;
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 
-	if (WARN_ON(!pll))
+	if (drm_WARN_ON(&dev_priv->drm, !pll))
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
@@ -3200,7 +3205,8 @@ icl_program_mg_dp_mode(struct intel_digital_port *intel_dig_port,
 
 	switch (pin_assignment) {
 	case 0x0:
-		WARN_ON(intel_dig_port->tc_mode != TC_PORT_LEGACY);
+		drm_WARN_ON(&dev_priv->drm,
+			    intel_dig_port->tc_mode != TC_PORT_LEGACY);
 		if (width == 1) {
 			ln1 |= MG_DP_MODE_CFG_DP_X1_MODE;
 		} else {
@@ -3361,7 +3367,7 @@ static void tgl_dc3co_exitline_compute_config(struct intel_encoder *encoder,
 	exit_scanlines =
 		intel_usecs_to_scanlines(&cstate->hw.adjusted_mode, 200) + 1;
 
-	if (WARN_ON(exit_scanlines > crtc_vdisplay))
+	if (drm_WARN_ON(&dev_priv->drm, exit_scanlines > crtc_vdisplay))
 		return;
 
 	cstate->dc3co_exitline = crtc_vdisplay - exit_scanlines;
@@ -3536,9 +3542,10 @@ static void hsw_ddi_pre_enable_dp(struct intel_encoder *encoder,
 	int level = intel_ddi_dp_level(intel_dp);
 
 	if (INTEL_GEN(dev_priv) < 11)
-		WARN_ON(is_mst && (port == PORT_A || port == PORT_E));
+		drm_WARN_ON(&dev_priv->drm,
+			    is_mst && (port == PORT_A || port == PORT_E));
 	else
-		WARN_ON(is_mst && port == PORT_A);
+		drm_WARN_ON(&dev_priv->drm, is_mst && port == PORT_A);
 
 	intel_dp_set_link_params(intel_dp, crtc_state->port_clock,
 				 crtc_state->lane_count, is_mst);
@@ -3675,7 +3682,7 @@ static void intel_ddi_pre_enable(struct intel_encoder *encoder,
 	 *   the DP link parameteres
 	 */
 
-	WARN_ON(crtc_state->has_pch_encoder);
+	drm_WARN_ON(&dev_priv->drm, crtc_state->has_pch_encoder);
 
 	if (INTEL_GEN(dev_priv) >= 11)
 		icl_map_plls_to_ports(encoder, crtc_state);
@@ -3946,9 +3953,9 @@ gen9_chicken_trans_reg_by_port(struct drm_i915_private *dev_priv,
 		[PORT_E] = TRANSCODER_A,
 	};
 
-	WARN_ON(INTEL_GEN(dev_priv) < 9);
+	drm_WARN_ON(&dev_priv->drm, INTEL_GEN(dev_priv) < 9);
 
-	if (WARN_ON(port < PORT_A || port > PORT_E))
+	if (drm_WARN_ON(&dev_priv->drm, port < PORT_A || port > PORT_E))
 		port = PORT_A;
 
 	return CHICKEN_TRANS(trans[port]);
@@ -4267,7 +4274,7 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 	u32 temp, flags = 0;
 
 	/* XXX: DSI transcoder paranoia */
-	if (WARN_ON(transcoder_is_dsi(cpu_transcoder)))
+	if (drm_WARN_ON(&dev_priv->drm, transcoder_is_dsi(cpu_transcoder)))
 		return;
 
 	intel_dsc_get_config(encoder, pipe_config);
@@ -4568,7 +4575,8 @@ static int intel_hdmi_reset_link(struct intel_encoder *encoder,
 
 	crtc_state = to_intel_crtc_state(crtc->base.state);
 
-	WARN_ON(!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI));
+	drm_WARN_ON(&dev_priv->drm,
+		    !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI));
 
 	if (!crtc_state->hw.active)
 		return 0;
@@ -4816,7 +4824,7 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
 		encoder->update_complete = intel_ddi_update_complete;
 	}
 
-	WARN_ON(port > PORT_I);
+	drm_WARN_ON(&dev_priv->drm, port > PORT_I);
 	intel_dig_port->ddi_io_power_domain = POWER_DOMAIN_PORT_DDI_A_IO +
 					      port - PORT_A;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 1dca6c730025..325fbaaeb7c5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -203,9 +203,9 @@ int vlv_get_cck_clock(struct drm_i915_private *dev_priv,
 	val = vlv_cck_read(dev_priv, reg);
 	divider = val & CCK_FREQUENCY_VALUES;
 
-	WARN((val & CCK_FREQUENCY_STATUS) !=
-	     (divider << CCK_FREQUENCY_STATUS_SHIFT),
-	     "%s change in progress\n", name);
+	drm_WARN(&dev_priv->drm, (val & CCK_FREQUENCY_STATUS) !=
+		 (divider << CCK_FREQUENCY_STATUS_SHIFT),
+		 "%s change in progress\n", name);
 
 	return DIV_ROUND_CLOSEST(ref_freq << 1, divider + 1);
 }
@@ -1090,7 +1090,8 @@ intel_wait_for_pipe_off(const struct intel_crtc_state *old_crtc_state)
 		/* Wait for the Pipe State to go off */
 		if (intel_de_wait_for_clear(dev_priv, reg,
 					    I965_PIPECONF_ACTIVE, 100))
-			WARN(1, "pipe_off wait timed out\n");
+			drm_WARN(&dev_priv->drm, 1,
+				 "pipe_off wait timed out\n");
 	} else {
 		intel_wait_for_pipe_scanline_stopped(crtc);
 	}
@@ -1204,7 +1205,7 @@ void assert_panel_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 	enum pipe panel_pipe = INVALID_PIPE;
 	bool locked = true;
 
-	if (WARN_ON(HAS_DDI(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm, HAS_DDI(dev_priv)))
 		return;
 
 	if (HAS_PCH_SPLIT(dev_priv)) {
@@ -1240,7 +1241,8 @@ void assert_panel_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 		pp_reg = PP_CONTROL(0);
 		port_sel = I915_READ(PP_ON_DELAYS(0)) & PANEL_PORT_SELECT_MASK;
 
-		WARN_ON(port_sel != PANEL_PORT_SELECT_LVDS);
+		drm_WARN_ON(&dev_priv->drm,
+			    port_sel != PANEL_PORT_SELECT_LVDS);
 		intel_lvds_port_enabled(dev_priv, LVDS, &panel_pipe);
 	}
 
@@ -1479,7 +1481,8 @@ static void chv_enable_pll(struct intel_crtc *crtc,
 		 * DPLLB VGA mode also seems to cause problems.
 		 * We should always have it disabled.
 		 */
-		WARN_ON((I915_READ(DPLL(PIPE_B)) & DPLL_VGA_MODE_DIS) == 0);
+		drm_WARN_ON(&dev_priv->drm,
+			    (I915_READ(DPLL(PIPE_B)) & DPLL_VGA_MODE_DIS) == 0);
 	} else {
 		I915_WRITE(DPLL_MD(pipe), pipe_config->dpll_hw_state.dpll_md);
 		POSTING_READ(DPLL_MD(pipe));
@@ -1626,9 +1629,10 @@ void vlv_wait_port_ready(struct drm_i915_private *dev_priv,
 
 	if (intel_de_wait_for_register(dev_priv, dpll_reg,
 				       port_mask, expected_mask, 1000))
-		WARN(1, "timed out waiting for [ENCODER:%d:%s] port ready: got 0x%x, expected 0x%x\n",
-		     dport->base.base.base.id, dport->base.base.name,
-		     I915_READ(dpll_reg) & port_mask, expected_mask);
+		drm_WARN(&dev_priv->drm, 1,
+			 "timed out waiting for [ENCODER:%d:%s] port ready: got 0x%x, expected 0x%x\n",
+			 dport->base.base.base.id, dport->base.base.name,
+			 I915_READ(dpll_reg) & port_mask, expected_mask);
 }
 
 static void ilk_enable_pch_transcoder(const struct intel_crtc_state *crtc_state)
@@ -1865,7 +1869,7 @@ static void intel_enable_pipe(const struct intel_crtc_state *new_crtc_state)
 	val = I915_READ(reg);
 	if (val & PIPECONF_ENABLE) {
 		/* we keep both pipes enabled on 830 */
-		WARN_ON(!IS_I830(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_I830(dev_priv));
 		return;
 	}
 
@@ -2386,7 +2390,7 @@ static u32 intel_adjust_aligned_offset(int *x, int *y,
 	struct drm_i915_private *dev_priv = to_i915(fb->dev);
 	unsigned int cpp = fb->format->cpp[color_plane];
 
-	WARN_ON(new_offset > old_offset);
+	drm_WARN_ON(&dev_priv->drm, new_offset > old_offset);
 
 	if (!is_surface_linear(fb, color_plane)) {
 		unsigned int tile_size, tile_width, tile_height;
@@ -3143,7 +3147,7 @@ intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 	src_w = drm_rect_width(&plane_state->uapi.src) >> 16;
 	src_h = drm_rect_height(&plane_state->uapi.src) >> 16;
 
-	WARN_ON(is_ccs_modifier(fb->modifier));
+	drm_WARN_ON(&dev_priv->drm, is_ccs_modifier(fb->modifier));
 
 	/* Make src coordinates relative to the viewport */
 	drm_rect_translate(&plane_state->uapi.src,
@@ -3184,7 +3188,7 @@ intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 						      DRM_MODE_ROTATE_0, tile_size);
 		offset /= tile_size;
 
-		WARN_ON(i >= ARRAY_SIZE(info->plane));
+		drm_WARN_ON(&dev_priv->drm, i >= ARRAY_SIZE(info->plane));
 		info->plane[i].offset = offset;
 		info->plane[i].stride = DIV_ROUND_UP(fb->pitches[i],
 						     tile_width * cpp);
@@ -3806,7 +3810,7 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 	intel_add_fb_offsets(&x, &y, plane_state, 0);
 	offset = intel_plane_compute_aligned_offset(&x, &y, plane_state, 0);
 	alignment = intel_surf_alignment(fb, 0);
-	if (WARN_ON(alignment && !is_power_of_2(alignment)))
+	if (drm_WARN_ON(&dev_priv->drm, alignment && !is_power_of_2(alignment)))
 		return -EINVAL;
 
 	/*
@@ -5552,10 +5556,10 @@ static void lpt_program_iclkip(const struct intel_crtc_state *crtc_state)
 	}
 
 	/* This should not happen with any sane values */
-	WARN_ON(SBI_SSCDIVINTPHASE_DIVSEL(divsel) &
-		~SBI_SSCDIVINTPHASE_DIVSEL_MASK);
-	WARN_ON(SBI_SSCDIVINTPHASE_DIR(phasedir) &
-		~SBI_SSCDIVINTPHASE_INCVAL_MASK);
+	drm_WARN_ON(&dev_priv->drm, SBI_SSCDIVINTPHASE_DIVSEL(divsel) &
+		    ~SBI_SSCDIVINTPHASE_DIVSEL_MASK);
+	drm_WARN_ON(&dev_priv->drm, SBI_SSCDIVINTPHASE_DIR(phasedir) &
+		    ~SBI_SSCDIVINTPHASE_INCVAL_MASK);
 
 	DRM_DEBUG_KMS("iCLKIP clock: found settings for %dKHz refresh rate: auxdiv=%x, divsel=%x, phasedir=%x, phaseinc=%x\n",
 			clock,
@@ -5664,8 +5668,10 @@ static void cpt_set_fdi_bc_bifurcation(struct drm_i915_private *dev_priv, bool e
 	if (!!(temp & FDI_BC_BIFURCATION_SELECT) == enable)
 		return;
 
-	WARN_ON(I915_READ(FDI_RX_CTL(PIPE_B)) & FDI_RX_ENABLE);
-	WARN_ON(I915_READ(FDI_RX_CTL(PIPE_C)) & FDI_RX_ENABLE);
+	drm_WARN_ON(&dev_priv->drm,
+		    I915_READ(FDI_RX_CTL(PIPE_B)) & FDI_RX_ENABLE);
+	drm_WARN_ON(&dev_priv->drm,
+		    I915_READ(FDI_RX_CTL(PIPE_C)) & FDI_RX_ENABLE);
 
 	temp &= ~FDI_BC_BIFURCATION_SELECT;
 	if (enable)
@@ -6159,7 +6165,8 @@ static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 		int pfit_w, pfit_h, hscale, vscale;
 		int id;
 
-		if (WARN_ON(crtc_state->scaler_state.scaler_id < 0))
+		if (drm_WARN_ON(&dev_priv->drm,
+				crtc_state->scaler_state.scaler_id < 0))
 			return;
 
 		pfit_w = (crtc_state->pch_pfit.size >> 16) & 0xFFFF;
@@ -6774,7 +6781,7 @@ static void ilk_crtc_enable(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum pipe pipe = crtc->pipe;
 
-	if (WARN_ON(crtc->active))
+	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
 		return;
 
 	/*
@@ -6920,7 +6927,7 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	bool psl_clkgate_wa;
 
-	if (WARN_ON(crtc->active))
+	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
 		return;
 
 	intel_encoders_pre_pll_enable(state, crtc);
@@ -7113,7 +7120,7 @@ static void i9xx_pfit_enable(const struct intel_crtc_state *crtc_state)
 	 * The panel fitter should only be adjusted whilst the pipe is disabled,
 	 * according to register description and PRM.
 	 */
-	WARN_ON(I915_READ(PFIT_CONTROL) & PFIT_ENABLE);
+	drm_WARN_ON(&dev_priv->drm, I915_READ(PFIT_CONTROL) & PFIT_ENABLE);
 	assert_pipe_disabled(dev_priv, crtc_state->cpu_transcoder);
 
 	I915_WRITE(PFIT_PGM_RATIOS, crtc_state->gmch_pfit.pgm_ratios);
@@ -7308,7 +7315,7 @@ static void valleyview_crtc_enable(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum pipe pipe = crtc->pipe;
 
-	if (WARN_ON(crtc->active))
+	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
 		return;
 
 	if (intel_crtc_has_dp_encoder(new_crtc_state))
@@ -7372,7 +7379,7 @@ static void i9xx_crtc_enable(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum pipe pipe = crtc->pipe;
 
-	if (WARN_ON(crtc->active))
+	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
 		return;
 
 	i9xx_set_pll_dividers(new_crtc_state);
@@ -7515,7 +7522,7 @@ static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 	temp_crtc_state = intel_atomic_get_crtc_state(state, crtc);
 	ret = drm_atomic_add_affected_connectors(state, &crtc->base);
 
-	WARN_ON(IS_ERR(temp_crtc_state) || ret);
+	drm_WARN_ON(&dev_priv->drm, IS_ERR(temp_crtc_state) || ret);
 
 	dev_priv->display.crtc_disable(to_intel_atomic_state(state), crtc);
 
@@ -7527,7 +7534,8 @@ static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 	crtc->active = false;
 	crtc->base.enabled = false;
 
-	WARN_ON(drm_atomic_set_mode_for_crtc(&crtc_state->uapi, NULL) < 0);
+	drm_WARN_ON(&dev_priv->drm,
+		    drm_atomic_set_mode_for_crtc(&crtc_state->uapi, NULL) < 0);
 	crtc_state->uapi.active = false;
 	crtc_state->uapi.connector_mask = 0;
 	crtc_state->uapi.encoder_mask = 0;
@@ -9200,7 +9208,8 @@ bdw_get_pipemisc_output_format(struct intel_crtc *crtc)
 
 	if (tmp & PIPEMISC_YUV420_ENABLE) {
 		/* We support 4:2:0 in full blend mode only */
-		WARN_ON((tmp & PIPEMISC_YUV420_MODE_FULL_BLEND) == 0);
+		drm_WARN_ON(&dev_priv->drm,
+			    (tmp & PIPEMISC_YUV420_MODE_FULL_BLEND) == 0);
 
 		return INTEL_OUTPUT_FORMAT_YCBCR420;
 	} else if (tmp & PIPEMISC_OUTPUT_COLORSPACE_YUV) {
@@ -9621,10 +9630,11 @@ static void lpt_enable_clkout_dp(struct drm_i915_private *dev_priv,
 {
 	u32 reg, tmp;
 
-	if (WARN(with_fdi && !with_spread, "FDI requires downspread\n"))
+	if (drm_WARN(&dev_priv->drm, with_fdi && !with_spread,
+		     "FDI requires downspread\n"))
 		with_spread = true;
-	if (WARN(HAS_PCH_LPT_LP(dev_priv) &&
-	    with_fdi, "LP PCH doesn't have FDI\n"))
+	if (drm_WARN(&dev_priv->drm, HAS_PCH_LPT_LP(dev_priv) &&
+		     with_fdi, "LP PCH doesn't have FDI\n"))
 		with_fdi = false;
 
 	mutex_lock(&dev_priv->sb_lock);
@@ -9718,10 +9728,10 @@ static void lpt_bend_clkout_dp(struct drm_i915_private *dev_priv, int steps)
 	u32 tmp;
 	int idx = BEND_IDX(steps);
 
-	if (WARN_ON(steps % 5 != 0))
+	if (drm_WARN_ON(&dev_priv->drm, steps % 5 != 0))
 		return;
 
-	if (WARN_ON(idx >= ARRAY_SIZE(sscdivintphase)))
+	if (drm_WARN_ON(&dev_priv->drm, idx >= ARRAY_SIZE(sscdivintphase)))
 		return;
 
 	mutex_lock(&dev_priv->sb_lock);
@@ -9889,8 +9899,8 @@ static void ilk_set_pipeconf(const struct intel_crtc_state *crtc_state)
 	 * This would end up with an odd purple hue over
 	 * the entire display. Make sure we don't do it.
 	 */
-	WARN_ON(crtc_state->limited_color_range &&
-		crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
+	drm_WARN_ON(&dev_priv->drm, crtc_state->limited_color_range &&
+		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
 
 	if (crtc_state->limited_color_range)
 		val |= PIPECONF_COLOR_RANGE_SELECT;
@@ -10574,7 +10584,7 @@ static void cnl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 	temp = I915_READ(DPCLKA_CFGCR0) & DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(port);
 	id = temp >> DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(port);
 
-	if (WARN_ON(id < SKL_DPLL0 || id > SKL_DPLL2))
+	if (drm_WARN_ON(&dev_priv->drm, id < SKL_DPLL0 || id > SKL_DPLL2))
 		return;
 
 	pipe_config->shared_dpll = intel_get_shared_dpll_by_id(dev_priv, id);
@@ -10601,12 +10611,13 @@ static void icl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 								    port));
 			port_dpll_id = ICL_PORT_DPLL_MG_PHY;
 		} else {
-			WARN_ON(clk_sel < DDI_CLK_SEL_TBT_162);
+			drm_WARN_ON(&dev_priv->drm,
+				    clk_sel < DDI_CLK_SEL_TBT_162);
 			id = DPLL_ID_ICL_TBTPLL;
 			port_dpll_id = ICL_PORT_DPLL_DEFAULT;
 		}
 	} else {
-		WARN(1, "Invalid port %x\n", port);
+		drm_WARN(&dev_priv->drm, 1, "Invalid port %x\n", port);
 		return;
 	}
 
@@ -10649,7 +10660,7 @@ static void skl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 	temp = I915_READ(DPLL_CTRL2) & DPLL_CTRL2_DDI_CLK_SEL_MASK(port);
 	id = temp >> (port * 3 + 1);
 
-	if (WARN_ON(id < SKL_DPLL0 || id > SKL_DPLL3))
+	if (drm_WARN_ON(&dev_priv->drm, id < SKL_DPLL0 || id > SKL_DPLL3))
 		return;
 
 	pipe_config->shared_dpll = intel_get_shared_dpll_by_id(dev_priv, id);
@@ -10878,8 +10889,9 @@ static void hsw_get_ddi_port_state(struct intel_crtc *crtc,
 
 	pll = pipe_config->shared_dpll;
 	if (pll) {
-		WARN_ON(!pll->info->funcs->get_hw_state(dev_priv, pll,
-						&pipe_config->dpll_hw_state));
+		drm_WARN_ON(&dev_priv->drm,
+			    !pll->info->funcs->get_hw_state(dev_priv, pll,
+					    &pipe_config->dpll_hw_state));
 	}
 
 	/*
@@ -10948,8 +10960,9 @@ static void icl_get_trans_port_sync_config(struct intel_crtc_state *crtc_state)
 		intel_display_power_put(dev_priv, power_domain, trans_wakeref);
 	}
 
-	WARN_ON(crtc_state->master_transcoder != INVALID_TRANSCODER &&
-		crtc_state->sync_mode_slaves_mask);
+	drm_WARN_ON(&dev_priv->drm,
+		    crtc_state->master_transcoder != INVALID_TRANSCODER &&
+		    crtc_state->sync_mode_slaves_mask);
 }
 
 static bool hsw_get_pipe_config(struct intel_crtc *crtc,
@@ -10979,7 +10992,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 	if (IS_GEN9_LP(dev_priv) &&
 	    bxt_get_dsi_transcoder_state(crtc, pipe_config,
 					 &power_domain_mask, wakerefs)) {
-		WARN_ON(active);
+		drm_WARN_ON(&dev_priv->drm, active);
 		active = true;
 	}
 
@@ -11037,7 +11050,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 	intel_color_get_config(pipe_config);
 
 	power_domain = POWER_DOMAIN_PIPE_PANEL_FITTER(crtc->pipe);
-	WARN_ON(power_domain_mask & BIT_ULL(power_domain));
+	drm_WARN_ON(&dev_priv->drm, power_domain_mask & BIT_ULL(power_domain));
 
 	wf = intel_display_power_get_if_enabled(dev_priv, power_domain);
 	if (wf) {
@@ -11494,8 +11507,8 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 		return -EINVAL;
 	}
 
-	WARN_ON(plane_state->uapi.visible &&
-		plane_state->color_plane[0].stride != fb->pitches[0]);
+	drm_WARN_ON(&dev_priv->drm, plane_state->uapi.visible &&
+		    plane_state->color_plane[0].stride != fb->pitches[0]);
 
 	if (fb->pitches[0] !=
 	    drm_rect_width(&plane_state->uapi.dst) * fb->format->cpp[0]) {
@@ -12147,7 +12160,7 @@ int intel_plane_atomic_calc_changes(const struct intel_crtc_state *old_crtc_stat
 	was_visible = old_plane_state->uapi.visible;
 	visible = plane_state->uapi.visible;
 
-	if (!was_crtc_enabled && WARN_ON(was_visible))
+	if (!was_crtc_enabled && drm_WARN_ON(&dev_priv->drm, was_visible))
 		was_visible = false;
 
 	/*
@@ -12535,7 +12548,7 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 
 	if (mode_changed && crtc_state->hw.enable &&
 	    dev_priv->display.crtc_compute_clock &&
-	    !WARN_ON(crtc_state->shared_dpll)) {
+	    !drm_WARN_ON(&dev_priv->drm, crtc_state->shared_dpll)) {
 		ret = dev_priv->display.crtc_compute_clock(crtc, crtc_state);
 		if (ret)
 			return ret;
@@ -12565,7 +12578,8 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 	}
 
 	if (dev_priv->display.compute_intermediate_wm) {
-		if (WARN_ON(!dev_priv->display.compute_pipe_wm))
+		if (drm_WARN_ON(&dev_priv->drm,
+				!dev_priv->display.compute_pipe_wm))
 			return 0;
 
 		/*
@@ -13741,9 +13755,10 @@ static void intel_pipe_config_sanity_check(struct drm_i915_private *dev_priv,
 		 * FDI already provided one idea for the dotclock.
 		 * Yell if the encoder disagrees.
 		 */
-		WARN(!intel_fuzzy_clock_check(fdi_dotclock, dotclock),
-		     "FDI dotclock and encoder dotclock mismatch, fdi: %i, encoder: %i\n",
-		     fdi_dotclock, dotclock);
+		drm_WARN(&dev_priv->drm,
+			 !intel_fuzzy_clock_check(fdi_dotclock, dotclock),
+			 "FDI dotclock and encoder dotclock mismatch, fdi: %i, encoder: %i\n",
+			 fdi_dotclock, dotclock);
 	}
 }
 
@@ -14917,7 +14932,8 @@ static struct intel_crtc *intel_get_slave_crtc(const struct intel_crtc_state *ne
 	struct drm_i915_private *dev_priv = to_i915(new_crtc_state->uapi.crtc->dev);
 	enum transcoder slave_transcoder;
 
-	WARN_ON(!is_power_of_2(new_crtc_state->sync_mode_slaves_mask));
+	drm_WARN_ON(&dev_priv->drm,
+		    !is_power_of_2(new_crtc_state->sync_mode_slaves_mask));
 
 	slave_transcoder = ffs(new_crtc_state->sync_mode_slaves_mask) - 1;
 	return intel_get_crtc_for_pipe(dev_priv,
@@ -15206,8 +15222,9 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 		    is_trans_port_sync_slave(new_crtc_state))
 			continue;
 
-		WARN_ON(skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
-						    entries, num_pipes, i));
+		drm_WARN_ON(&dev_priv->drm,
+			    skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
+							entries, num_pipes, i));
 
 		entries[i] = new_crtc_state->wm.skl.ddb;
 		modeset_pipes &= ~BIT(pipe);
@@ -15241,8 +15258,9 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 		if ((modeset_pipes & BIT(pipe)) == 0)
 			continue;
 
-		WARN_ON(skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
-						    entries, num_pipes, i));
+		drm_WARN_ON(&dev_priv->drm,
+			    skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
+							entries, num_pipes, i));
 
 		entries[i] = new_crtc_state->wm.skl.ddb;
 		modeset_pipes &= ~BIT(pipe);
@@ -15250,7 +15268,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 		intel_update_crtc(crtc, state, old_crtc_state, new_crtc_state);
 	}
 
-	WARN_ON(modeset_pipes);
+	drm_WARN_ON(&dev_priv->drm, modeset_pipes);
 
 	/* If 2nd DBuf slice is no more required disable it */
 	if (INTEL_GEN(dev_priv) >= 11 && required_slices < hw_enabled_slices)
@@ -16496,7 +16514,7 @@ static int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 
 	intel_color_init(crtc);
 
-	WARN_ON(drm_crtc_index(&crtc->base) != crtc->pipe);
+	drm_WARN_ON(&dev_priv->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
 	return 0;
 
@@ -17634,7 +17652,8 @@ void i830_enable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 	u32 dpll, fp;
 	int i;
 
-	WARN_ON(i9xx_calc_dpll_params(48000, &clock) != 25154);
+	drm_WARN_ON(&dev_priv->drm,
+		    i9xx_calc_dpll_params(48000, &clock) != 25154);
 
 	DRM_DEBUG_KMS("enabling pipe %c due to force quirk (vco=%d dot=%d)\n",
 		      pipe_name(pipe), clock.vco, clock.dot);
@@ -17697,11 +17716,14 @@ void i830_disable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 	DRM_DEBUG_KMS("disabling pipe %c due to force quirk\n",
 		      pipe_name(pipe));
 
-	WARN_ON(I915_READ(DSPCNTR(PLANE_A)) & DISPLAY_PLANE_ENABLE);
-	WARN_ON(I915_READ(DSPCNTR(PLANE_B)) & DISPLAY_PLANE_ENABLE);
-	WARN_ON(I915_READ(DSPCNTR(PLANE_C)) & DISPLAY_PLANE_ENABLE);
-	WARN_ON(I915_READ(CURCNTR(PIPE_A)) & MCURSOR_MODE);
-	WARN_ON(I915_READ(CURCNTR(PIPE_B)) & MCURSOR_MODE);
+	drm_WARN_ON(&dev_priv->drm,
+		    I915_READ(DSPCNTR(PLANE_A)) & DISPLAY_PLANE_ENABLE);
+	drm_WARN_ON(&dev_priv->drm,
+		    I915_READ(DSPCNTR(PLANE_B)) & DISPLAY_PLANE_ENABLE);
+	drm_WARN_ON(&dev_priv->drm,
+		    I915_READ(DSPCNTR(PLANE_C)) & DISPLAY_PLANE_ENABLE);
+	drm_WARN_ON(&dev_priv->drm, I915_READ(CURCNTR(PIPE_A)) & MCURSOR_MODE);
+	drm_WARN_ON(&dev_priv->drm, I915_READ(CURCNTR(PIPE_B)) & MCURSOR_MODE);
 
 	I915_WRITE(PIPECONF(pipe), 0);
 	POSTING_READ(PIPECONF(pipe));
@@ -18469,7 +18491,7 @@ void intel_modeset_driver_remove(struct drm_i915_private *i915)
 	flush_workqueue(i915->modeset_wq);
 
 	flush_work(&i915->atomic_helper.free_work);
-	WARN_ON(!llist_empty(&i915->atomic_helper.free_list));
+	drm_WARN_ON(&i915->drm, !llist_empty(&i915->atomic_helper.free_list));
 
 	/*
 	 * Interrupts and polling as the first thing to avoid creating havoc.
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 679457156797..6828db633617 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -182,8 +182,9 @@ static void intel_power_well_get(struct drm_i915_private *dev_priv,
 static void intel_power_well_put(struct drm_i915_private *dev_priv,
 				 struct i915_power_well *power_well)
 {
-	WARN(!power_well->count, "Use count on power well %s is already zero",
-	     power_well->desc->name);
+	drm_WARN(&dev_priv->drm, !power_well->count,
+		 "Use count on power well %s is already zero",
+		 power_well->desc->name);
 
 	if (!--power_well->count)
 		intel_power_well_disable(dev_priv, power_well);
@@ -293,7 +294,7 @@ static void hsw_wait_for_power_well_enable(struct drm_i915_private *dev_priv,
 			      power_well->desc->name);
 
 		/* An AUX timeout is expected if the TBT DP tunnel is down. */
-		WARN_ON(!power_well->desc->hsw.is_tc_tbt);
+		drm_WARN_ON(&dev_priv->drm, !power_well->desc->hsw.is_tc_tbt);
 	}
 }
 
@@ -345,8 +346,10 @@ static void gen9_wait_for_power_well_fuses(struct drm_i915_private *dev_priv,
 					   enum skl_power_gate pg)
 {
 	/* Timeout 5us for PG#0, for other PGs 1us */
-	WARN_ON(intel_de_wait_for_set(dev_priv, SKL_FUSE_STATUS,
-				      SKL_FUSE_PG_DIST_STATUS(pg), 1));
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_wait_for_set(dev_priv,
+					  SKL_FUSE_STATUS,
+					  SKL_FUSE_PG_DIST_STATUS(pg), 1));
 }
 
 static void hsw_power_well_enable(struct drm_i915_private *dev_priv,
@@ -419,7 +422,7 @@ icl_combo_phy_aux_power_well_enable(struct drm_i915_private *dev_priv,
 	enum phy phy = ICL_AUX_PW_TO_PHY(pw_idx);
 	u32 val;
 
-	WARN_ON(!IS_ICELAKE(dev_priv));
+	drm_WARN_ON(&dev_priv->drm, !IS_ICELAKE(dev_priv));
 
 	val = I915_READ(regs->driver);
 	I915_WRITE(regs->driver, val | HSW_PWR_WELL_CTL_REQ(pw_idx));
@@ -449,7 +452,7 @@ icl_combo_phy_aux_power_well_disable(struct drm_i915_private *dev_priv,
 	enum phy phy = ICL_AUX_PW_TO_PHY(pw_idx);
 	u32 val;
 
-	WARN_ON(!IS_ICELAKE(dev_priv));
+	drm_WARN_ON(&dev_priv->drm, !IS_ICELAKE(dev_priv));
 
 	val = I915_READ(ICL_PORT_CL_DW12(phy));
 	I915_WRITE(ICL_PORT_CL_DW12(phy), val & ~ICL_LANE_ENABLE_AUX);
@@ -485,7 +488,7 @@ static int power_well_async_ref_count(struct drm_i915_private *dev_priv,
 	int refs = hweight64(power_well->desc->domains &
 			     async_put_domains_mask(&dev_priv->power_domains));
 
-	WARN_ON(refs > power_well->count);
+	drm_WARN_ON(&dev_priv->drm, refs > power_well->count);
 
 	return refs;
 }
@@ -515,7 +518,7 @@ static void icl_tc_port_assert_ref_held(struct drm_i915_private *dev_priv,
 			continue;
 
 		dig_port = enc_to_dig_port(&encoder->base);
-		if (WARN_ON(!dig_port))
+		if (drm_WARN_ON(&dev_priv->drm, !dig_port))
 			continue;
 
 		if (dig_port->aux_ch != aux_ch) {
@@ -526,10 +529,10 @@ static void icl_tc_port_assert_ref_held(struct drm_i915_private *dev_priv,
 		break;
 	}
 
-	if (WARN_ON(!dig_port))
+	if (drm_WARN_ON(&dev_priv->drm, !dig_port))
 		return;
 
-	WARN_ON(!intel_tc_port_ref_held(dig_port));
+	drm_WARN_ON(&dev_priv->drm, !intel_tc_port_ref_held(dig_port));
 }
 
 #else
@@ -613,15 +616,17 @@ static bool hsw_power_well_enabled(struct drm_i915_private *dev_priv,
 
 static void assert_can_enable_dc9(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE((I915_READ(DC_STATE_EN) & DC_STATE_EN_DC9),
-		  "DC9 already programmed to be enabled.\n");
-	WARN_ONCE(I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5,
-		  "DC5 still not disabled to enable DC9.\n");
-	WARN_ONCE(I915_READ(HSW_PWR_WELL_CTL2) &
-		  HSW_PWR_WELL_CTL_REQ(SKL_PW_CTL_IDX_PW_2),
-		  "Power well 2 on.\n");
-	WARN_ONCE(intel_irqs_enabled(dev_priv),
-		  "Interrupts not disabled yet.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      (I915_READ(DC_STATE_EN) & DC_STATE_EN_DC9),
+		      "DC9 already programmed to be enabled.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5,
+		      "DC5 still not disabled to enable DC9.\n");
+	drm_WARN_ONCE(&dev_priv->drm, I915_READ(HSW_PWR_WELL_CTL2) &
+		      HSW_PWR_WELL_CTL_REQ(SKL_PW_CTL_IDX_PW_2),
+		      "Power well 2 on.\n");
+	drm_WARN_ONCE(&dev_priv->drm, intel_irqs_enabled(dev_priv),
+		      "Interrupts not disabled yet.\n");
 
 	 /*
 	  * TODO: check for the following to verify the conditions to enter DC9
@@ -634,10 +639,11 @@ static void assert_can_enable_dc9(struct drm_i915_private *dev_priv)
 
 static void assert_can_disable_dc9(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE(intel_irqs_enabled(dev_priv),
-		  "Interrupts not disabled yet.\n");
-	WARN_ONCE(I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5,
-		  "DC5 still not disabled.\n");
+	drm_WARN_ONCE(&dev_priv->drm, intel_irqs_enabled(dev_priv),
+		      "Interrupts not disabled yet.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5,
+		      "DC5 still not disabled.\n");
 
 	 /*
 	  * TODO: check for the following to verify DC9 state was indeed
@@ -743,7 +749,8 @@ static void gen9_set_dc_state(struct drm_i915_private *dev_priv, u32 state)
 	u32 val;
 	u32 mask;
 
-	if (WARN_ON_ONCE(state & ~dev_priv->csr.allowed_dc_mask))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm,
+			     state & ~dev_priv->csr.allowed_dc_mask))
 		state &= dev_priv->csr.allowed_dc_mask;
 
 	val = I915_READ(DC_STATE_EN);
@@ -838,10 +845,12 @@ static void bxt_disable_dc9(struct drm_i915_private *dev_priv)
 
 static void assert_csr_loaded(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE(!I915_READ(CSR_PROGRAM(0)),
-		  "CSR program storage start is NULL\n");
-	WARN_ONCE(!I915_READ(CSR_SSP_BASE), "CSR SSP Base Not fine\n");
-	WARN_ONCE(!I915_READ(CSR_HTP_SKL), "CSR HTP Not fine\n");
+	drm_WARN_ONCE(&dev_priv->drm, !I915_READ(CSR_PROGRAM(0)),
+		      "CSR program storage start is NULL\n");
+	drm_WARN_ONCE(&dev_priv->drm, !I915_READ(CSR_SSP_BASE),
+		      "CSR SSP Base Not fine\n");
+	drm_WARN_ONCE(&dev_priv->drm, !I915_READ(CSR_HTP_SKL),
+		      "CSR HTP Not fine\n");
 }
 
 static struct i915_power_well *
@@ -861,7 +870,9 @@ lookup_power_well(struct drm_i915_private *dev_priv,
 	 * the first power well and hope the WARN gets reported so we can fix
 	 * our driver.
 	 */
-	WARN(1, "Power well %d not defined for this platform\n", power_well_id);
+	drm_WARN(&dev_priv->drm, 1,
+		 "Power well %d not defined for this platform\n",
+		 power_well_id);
 	return &dev_priv->power_domains.power_wells[0];
 }
 
@@ -884,7 +895,7 @@ void intel_display_power_set_target_dc_state(struct drm_i915_private *dev_priv,
 	mutex_lock(&power_domains->lock);
 	power_well = lookup_power_well(dev_priv, SKL_DISP_DC_OFF);
 
-	if (WARN_ON(!power_well))
+	if (drm_WARN_ON(&dev_priv->drm, !power_well))
 		goto unlock;
 
 	state = sanitize_target_dc_state(dev_priv, state);
@@ -915,10 +926,12 @@ static void assert_can_enable_dc5(struct drm_i915_private *dev_priv)
 	bool pg2_enabled = intel_display_power_well_is_enabled(dev_priv,
 					SKL_DISP_PW_2);
 
-	WARN_ONCE(pg2_enabled, "PG2 not disabled to enable DC5.\n");
+	drm_WARN_ONCE(&dev_priv->drm, pg2_enabled,
+		      "PG2 not disabled to enable DC5.\n");
 
-	WARN_ONCE((I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5),
-		  "DC5 already programmed to be enabled.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      (I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5),
+		      "DC5 already programmed to be enabled.\n");
 	assert_rpm_wakelock_held(&dev_priv->runtime_pm);
 
 	assert_csr_loaded(dev_priv);
@@ -940,10 +953,12 @@ static void gen9_enable_dc5(struct drm_i915_private *dev_priv)
 
 static void assert_can_enable_dc6(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE(I915_READ(UTIL_PIN_CTL) & UTIL_PIN_ENABLE,
-		  "Backlight is not disabled.\n");
-	WARN_ONCE((I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC6),
-		  "DC6 already programmed to be enabled.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      I915_READ(UTIL_PIN_CTL) & UTIL_PIN_ENABLE,
+		      "Backlight is not disabled.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      (I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC6),
+		      "DC6 already programmed to be enabled.\n");
 
 	assert_csr_loaded(dev_priv);
 }
@@ -1030,9 +1045,10 @@ static void gen9_assert_dbuf_enabled(struct drm_i915_private *dev_priv)
 {
 	u32 tmp = I915_READ(DBUF_CTL);
 
-	WARN((tmp & (DBUF_POWER_STATE | DBUF_POWER_REQUEST)) !=
-	     (DBUF_POWER_STATE | DBUF_POWER_REQUEST),
-	     "Unexpected DBuf power power state (0x%08x)\n", tmp);
+	drm_WARN(&dev_priv->drm,
+		 (tmp & (DBUF_POWER_STATE | DBUF_POWER_REQUEST)) !=
+		 (DBUF_POWER_STATE | DBUF_POWER_REQUEST),
+		 "Unexpected DBuf power power state (0x%08x)\n", tmp);
 }
 
 static void gen9_disable_dc_states(struct drm_i915_private *dev_priv)
@@ -1048,7 +1064,9 @@ static void gen9_disable_dc_states(struct drm_i915_private *dev_priv)
 
 	dev_priv->display.get_cdclk(dev_priv, &cdclk_state);
 	/* Can't read out voltage_level so can't use intel_cdclk_changed() */
-	WARN_ON(intel_cdclk_needs_modeset(&dev_priv->cdclk.hw, &cdclk_state));
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_cdclk_needs_modeset(&dev_priv->cdclk.hw,
+					      &cdclk_state));
 
 	gen9_assert_dbuf_enabled(dev_priv);
 
@@ -1204,8 +1222,8 @@ static bool vlv_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * We only ever set the power-on and power-gate states, anything
 	 * else is unexpected.
 	 */
-	WARN_ON(state != PUNIT_PWRGT_PWR_ON(pw_idx) &&
-		state != PUNIT_PWRGT_PWR_GATE(pw_idx));
+	drm_WARN_ON(&dev_priv->drm, state != PUNIT_PWRGT_PWR_ON(pw_idx) &&
+		    state != PUNIT_PWRGT_PWR_GATE(pw_idx));
 	if (state == ctrl)
 		enabled = true;
 
@@ -1214,7 +1232,7 @@ static bool vlv_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * is poking at the power controls too.
 	 */
 	ctrl = vlv_punit_read(dev_priv, PUNIT_REG_PWRGT_CTRL) & mask;
-	WARN_ON(ctrl != state);
+	drm_WARN_ON(&dev_priv->drm, ctrl != state);
 
 	vlv_punit_put(dev_priv);
 
@@ -1242,7 +1260,7 @@ static void vlv_init_display_clock_gating(struct drm_i915_private *dev_priv)
 	I915_WRITE(MI_ARB_VLV, MI_ARB_DISPLAY_TRICKLE_FEED_DISABLE);
 	I915_WRITE(CBR1_VLV, 0);
 
-	WARN_ON(dev_priv->rawclk_freq == 0);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->rawclk_freq == 0);
 
 	I915_WRITE(RAWCLK_FREQ_VLV,
 		   DIV_ROUND_CLOSEST(dev_priv->rawclk_freq, 1000));
@@ -1481,8 +1499,9 @@ static void chv_dpio_cmn_power_well_enable(struct drm_i915_private *dev_priv,
 	enum pipe pipe;
 	u32 tmp;
 
-	WARN_ON_ONCE(power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
-		     power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
+	drm_WARN_ON_ONCE(&dev_priv->drm,
+			 power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
+			 power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
 
 	if (power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC) {
 		pipe = PIPE_A;
@@ -1540,8 +1559,9 @@ static void chv_dpio_cmn_power_well_disable(struct drm_i915_private *dev_priv,
 {
 	enum dpio_phy phy;
 
-	WARN_ON_ONCE(power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
-		     power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
+	drm_WARN_ON_ONCE(&dev_priv->drm,
+			 power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
+			 power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
 
 	if (power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC) {
 		phy = DPIO_PHY0;
@@ -1621,11 +1641,13 @@ static void assert_chv_phy_powergate(struct drm_i915_private *dev_priv, enum dpi
 		actual = val >> DPIO_ANYDL_POWERDOWN_SHIFT_CH1;
 	actual &= DPIO_ALLDL_POWERDOWN | DPIO_ANYDL_POWERDOWN;
 
-	WARN(actual != expected,
-	     "Unexpected DPIO lane power down: all %d, any %d. Expected: all %d, any %d. (0x%x = 0x%08x)\n",
-	     !!(actual & DPIO_ALLDL_POWERDOWN), !!(actual & DPIO_ANYDL_POWERDOWN),
-	     !!(expected & DPIO_ALLDL_POWERDOWN), !!(expected & DPIO_ANYDL_POWERDOWN),
-	     reg, val);
+	drm_WARN(&dev_priv->drm, actual != expected,
+		 "Unexpected DPIO lane power down: all %d, any %d. Expected: all %d, any %d. (0x%x = 0x%08x)\n",
+		 !!(actual & DPIO_ALLDL_POWERDOWN),
+		 !!(actual & DPIO_ANYDL_POWERDOWN),
+		 !!(expected & DPIO_ALLDL_POWERDOWN),
+		 !!(expected & DPIO_ANYDL_POWERDOWN),
+		 reg, val);
 }
 
 bool chv_phy_powergate_ch(struct drm_i915_private *dev_priv, enum dpio_phy phy,
@@ -1703,7 +1725,9 @@ static bool chv_pipe_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * We only ever set the power-on and power-gate states, anything
 	 * else is unexpected.
 	 */
-	WARN_ON(state != DP_SSS_PWR_ON(pipe) && state != DP_SSS_PWR_GATE(pipe));
+	drm_WARN_ON(&dev_priv->drm,
+		    state != DP_SSS_PWR_ON(pipe) &&
+		    state != DP_SSS_PWR_GATE(pipe));
 	enabled = state == DP_SSS_PWR_ON(pipe);
 
 	/*
@@ -1711,7 +1735,7 @@ static bool chv_pipe_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * is poking at the power controls too.
 	 */
 	ctrl = vlv_punit_read(dev_priv, PUNIT_REG_DSPSSPM) & DP_SSC_MASK(pipe);
-	WARN_ON(ctrl << 16 != state);
+	drm_WARN_ON(&dev_priv->drm, ctrl << 16 != state);
 
 	vlv_punit_put(dev_priv);
 
@@ -1981,12 +2005,13 @@ __intel_display_power_put_domain(struct drm_i915_private *dev_priv,
 
 	power_domains = &dev_priv->power_domains;
 
-	WARN(!power_domains->domain_use_count[domain],
-	     "Use count on domain %s is already zero\n",
-	     name);
-	WARN(async_put_domains_mask(power_domains) & BIT_ULL(domain),
-	     "Async disabling of domain %s is pending\n",
-	     name);
+	drm_WARN(&dev_priv->drm, !power_domains->domain_use_count[domain],
+		 "Use count on domain %s is already zero\n",
+		 name);
+	drm_WARN(&dev_priv->drm,
+		 async_put_domains_mask(power_domains) & BIT_ULL(domain),
+		 "Async disabling of domain %s is pending\n",
+		 name);
 
 	power_domains->domain_use_count[domain]--;
 
@@ -2131,7 +2156,7 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 		goto out_verify;
 	}
 
-	WARN_ON(power_domains->domain_use_count[domain] != 1);
+	drm_WARN_ON(&i915->drm, power_domains->domain_use_count[domain] != 1);
 
 	/* Let a pending work requeue itself or queue a new one. */
 	if (power_domains->async_put_wakeref) {
@@ -2206,7 +2231,7 @@ intel_display_power_flush_work_sync(struct drm_i915_private *i915)
 
 	verify_async_put_domains_state(power_domains);
 
-	WARN_ON(power_domains->async_put_wakeref);
+	drm_WARN_ON(&i915->drm, power_domains->async_put_wakeref);
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
@@ -5170,8 +5195,9 @@ static bool vlv_punit_is_power_gated(struct drm_i915_private *dev_priv, u32 reg0
 
 static void assert_ved_power_gated(struct drm_i915_private *dev_priv)
 {
-	WARN(!vlv_punit_is_power_gated(dev_priv, PUNIT_REG_VEDSSPM0),
-	     "VED not power gated\n");
+	drm_WARN(&dev_priv->drm,
+		 !vlv_punit_is_power_gated(dev_priv, PUNIT_REG_VEDSSPM0),
+		 "VED not power gated\n");
 }
 
 static void assert_isp_power_gated(struct drm_i915_private *dev_priv)
@@ -5182,9 +5208,9 @@ static void assert_isp_power_gated(struct drm_i915_private *dev_priv)
 		{}
 	};
 
-	WARN(!pci_dev_present(isp_ids) &&
-	     !vlv_punit_is_power_gated(dev_priv, PUNIT_REG_ISPSSPM0),
-	     "ISP not power gated\n");
+	drm_WARN(&dev_priv->drm, !pci_dev_present(isp_ids) &&
+		 !vlv_punit_is_power_gated(dev_priv, PUNIT_REG_ISPSSPM0),
+		 "ISP not power gated\n");
 }
 
 static void intel_power_domains_verify_state(struct drm_i915_private *dev_priv);
@@ -5317,7 +5343,7 @@ void intel_power_domains_disable(struct drm_i915_private *i915)
 {
 	struct i915_power_domains *power_domains = &i915->power_domains;
 
-	WARN_ON(power_domains->wakeref);
+	drm_WARN_ON(&i915->drm, power_domains->wakeref);
 	power_domains->wakeref =
 		intel_display_power_get(i915, POWER_DOMAIN_INIT);
 
@@ -5399,7 +5425,7 @@ void intel_power_domains_resume(struct drm_i915_private *i915)
 		intel_power_domains_init_hw(i915, true);
 		power_domains->display_core_suspended = false;
 	} else {
-		WARN_ON(power_domains->wakeref);
+		drm_WARN_ON(&i915->drm, power_domains->wakeref);
 		power_domains->wakeref =
 			intel_display_power_get(i915, POWER_DOMAIN_INIT);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f6776899f24c..959b2eed8a64 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -330,7 +330,8 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
 	int size, max_rate = 0, vbt_max_rate = info->dp_max_link_rate;
 
 	/* This should only be done once */
-	WARN_ON(intel_dp->source_rates || intel_dp->num_source_rates);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_dp->source_rates || intel_dp->num_source_rates);
 
 	if (INTEL_GEN(dev_priv) >= 10) {
 		source_rates = cnl_rates;
@@ -760,10 +761,11 @@ vlv_power_sequencer_kick(struct intel_dp *intel_dp)
 	enum dpio_channel ch = vlv_pipe_to_channel(pipe);
 	u32 DP;
 
-	if (WARN(I915_READ(intel_dp->output_reg) & DP_PORT_EN,
-		 "skipping pipe %c power sequencer kick due to [ENCODER:%d:%s] being active\n",
-		 pipe_name(pipe), intel_dig_port->base.base.base.id,
-		 intel_dig_port->base.base.name))
+	if (drm_WARN(&dev_priv->drm,
+		     I915_READ(intel_dp->output_reg) & DP_PORT_EN,
+		     "skipping pipe %c power sequencer kick due to [ENCODER:%d:%s] being active\n",
+		     pipe_name(pipe), intel_dig_port->base.base.base.id,
+		     intel_dig_port->base.base.name))
 		return;
 
 	DRM_DEBUG_KMS("kicking pipe %c power sequencer for [ENCODER:%d:%s]\n",
@@ -837,13 +839,15 @@ static enum pipe vlv_find_free_pps(struct drm_i915_private *dev_priv)
 		struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 
 		if (encoder->type == INTEL_OUTPUT_EDP) {
-			WARN_ON(intel_dp->active_pipe != INVALID_PIPE &&
-				intel_dp->active_pipe != intel_dp->pps_pipe);
+			drm_WARN_ON(&dev_priv->drm,
+				    intel_dp->active_pipe != INVALID_PIPE &&
+				    intel_dp->active_pipe != intel_dp->pps_pipe);
 
 			if (intel_dp->pps_pipe != INVALID_PIPE)
 				pipes &= ~(1 << intel_dp->pps_pipe);
 		} else {
-			WARN_ON(intel_dp->pps_pipe != INVALID_PIPE);
+			drm_WARN_ON(&dev_priv->drm,
+				    intel_dp->pps_pipe != INVALID_PIPE);
 
 			if (intel_dp->active_pipe != INVALID_PIPE)
 				pipes &= ~(1 << intel_dp->active_pipe);
@@ -866,10 +870,10 @@ vlv_power_sequencer_pipe(struct intel_dp *intel_dp)
 	lockdep_assert_held(&dev_priv->pps_mutex);
 
 	/* We should never land here with regular DP ports */
-	WARN_ON(!intel_dp_is_edp(intel_dp));
+	drm_WARN_ON(&dev_priv->drm, !intel_dp_is_edp(intel_dp));
 
-	WARN_ON(intel_dp->active_pipe != INVALID_PIPE &&
-		intel_dp->active_pipe != intel_dp->pps_pipe);
+	drm_WARN_ON(&dev_priv->drm, intel_dp->active_pipe != INVALID_PIPE &&
+		    intel_dp->active_pipe != intel_dp->pps_pipe);
 
 	if (intel_dp->pps_pipe != INVALID_PIPE)
 		return intel_dp->pps_pipe;
@@ -880,7 +884,7 @@ vlv_power_sequencer_pipe(struct intel_dp *intel_dp)
 	 * Didn't find one. This should not happen since there
 	 * are two power sequencers and up to two eDP ports.
 	 */
-	if (WARN_ON(pipe == INVALID_PIPE))
+	if (drm_WARN_ON(&dev_priv->drm, pipe == INVALID_PIPE))
 		pipe = PIPE_A;
 
 	vlv_steal_power_sequencer(dev_priv, pipe);
@@ -913,7 +917,7 @@ bxt_power_sequencer_idx(struct intel_dp *intel_dp)
 	lockdep_assert_held(&dev_priv->pps_mutex);
 
 	/* We should never land here with regular DP ports */
-	WARN_ON(!intel_dp_is_edp(intel_dp));
+	drm_WARN_ON(&dev_priv->drm, !intel_dp_is_edp(intel_dp));
 
 	if (!intel_dp->pps_reset)
 		return backlight_controller;
@@ -1016,8 +1020,9 @@ void intel_power_sequencer_reset(struct drm_i915_private *dev_priv)
 {
 	struct intel_encoder *encoder;
 
-	if (WARN_ON(!IS_VALLEYVIEW(dev_priv) && !IS_CHERRYVIEW(dev_priv) &&
-		    !IS_GEN9_LP(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			!IS_VALLEYVIEW(dev_priv) && !IS_CHERRYVIEW(dev_priv) &&
+			!IS_GEN9_LP(dev_priv)))
 		return;
 
 	/*
@@ -1033,7 +1038,8 @@ void intel_power_sequencer_reset(struct drm_i915_private *dev_priv)
 	for_each_intel_dp(&dev_priv->drm, encoder) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 
-		WARN_ON(intel_dp->active_pipe != INVALID_PIPE);
+		drm_WARN_ON(&dev_priv->drm,
+			    intel_dp->active_pipe != INVALID_PIPE);
 
 		if (encoder->type != INTEL_OUTPUT_EDP)
 			continue;
@@ -1167,7 +1173,8 @@ intel_dp_check_edp(struct intel_dp *intel_dp)
 		return;
 
 	if (!edp_have_panel_power(intel_dp) && !edp_have_panel_vdd(intel_dp)) {
-		WARN(1, "eDP powered off while attempting aux channel communication.\n");
+		drm_WARN(&dev_priv->drm, 1,
+			 "eDP powered off while attempting aux channel communication.\n");
 		DRM_DEBUG_KMS("Status 0x%08x Control 0x%08x\n",
 			      I915_READ(_pp_stat_reg(intel_dp)),
 			      I915_READ(_pp_ctrl_reg(intel_dp)));
@@ -1378,8 +1385,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 		const u32 status = intel_uncore_read(uncore, ch_ctl);
 
 		if (status != intel_dp->aux_busy_last_status) {
-			WARN(1, "dp_aux_ch not started status 0x%08x\n",
-			     status);
+			drm_WARN(&i915->drm, 1,
+				 "dp_aux_ch not started status 0x%08x\n",
+				 status);
 			intel_dp->aux_busy_last_status = status;
 		}
 
@@ -1388,7 +1396,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	}
 
 	/* Only 5 data registers! */
-	if (WARN_ON(send_bytes > 20 || recv_size > 20)) {
+	if (drm_WARN_ON(&i915->drm, send_bytes > 20 || recv_size > 20)) {
 		ret = -E2BIG;
 		goto out;
 	}
@@ -2661,8 +2669,8 @@ static  u32 ilk_get_pp_control(struct intel_dp *intel_dp)
 	lockdep_assert_held(&dev_priv->pps_mutex);
 
 	control = I915_READ(_pp_ctrl_reg(intel_dp));
-	if (WARN_ON(!HAS_DDI(dev_priv) &&
-		    (control & PANEL_UNLOCK_MASK) != PANEL_UNLOCK_REGS)) {
+	if (drm_WARN_ON(&dev_priv->drm, !HAS_DDI(dev_priv) &&
+			(control & PANEL_UNLOCK_MASK) != PANEL_UNLOCK_REGS)) {
 		control &= ~PANEL_UNLOCK_MASK;
 		control |= PANEL_UNLOCK_REGS;
 	}
@@ -2759,7 +2767,7 @@ static void edp_panel_vdd_off_sync(struct intel_dp *intel_dp)
 
 	lockdep_assert_held(&dev_priv->pps_mutex);
 
-	WARN_ON(intel_dp->want_panel_vdd);
+	drm_WARN_ON(&dev_priv->drm, intel_dp->want_panel_vdd);
 
 	if (!edp_have_panel_vdd(intel_dp))
 		return;
@@ -2855,10 +2863,10 @@ static void edp_panel_on(struct intel_dp *intel_dp)
 		      dp_to_dig_port(intel_dp)->base.base.base.id,
 		      dp_to_dig_port(intel_dp)->base.base.name);
 
-	if (WARN(edp_have_panel_power(intel_dp),
-		 "[ENCODER:%d:%s] panel power already on\n",
-		 dp_to_dig_port(intel_dp)->base.base.base.id,
-		 dp_to_dig_port(intel_dp)->base.base.name))
+	if (drm_WARN(&dev_priv->drm, edp_have_panel_power(intel_dp),
+		     "[ENCODER:%d:%s] panel power already on\n",
+		     dp_to_dig_port(intel_dp)->base.base.base.id,
+		     dp_to_dig_port(intel_dp)->base.base.name))
 		return;
 
 	wait_panel_power_cycle(intel_dp);
@@ -2916,8 +2924,9 @@ static void edp_panel_off(struct intel_dp *intel_dp)
 	DRM_DEBUG_KMS("Turn [ENCODER:%d:%s] panel power off\n",
 		      dig_port->base.base.base.id, dig_port->base.base.name);
 
-	WARN(!intel_dp->want_panel_vdd, "Need [ENCODER:%d:%s] VDD to turn off panel\n",
-	     dig_port->base.base.base.id, dig_port->base.base.name);
+	drm_WARN(&dev_priv->drm, !intel_dp->want_panel_vdd,
+		 "Need [ENCODER:%d:%s] VDD to turn off panel\n",
+		 dig_port->base.base.base.id, dig_port->base.base.name);
 
 	pp = ilk_get_pp_control(intel_dp);
 	/* We need to switch off panel power _and_ force vdd, for otherwise some
@@ -3554,7 +3563,7 @@ static void intel_enable_dp(struct intel_encoder *encoder,
 	enum pipe pipe = crtc->pipe;
 	intel_wakeref_t wakeref;
 
-	if (WARN_ON(dp_reg & DP_PORT_EN))
+	if (drm_WARN_ON(&dev_priv->drm, dp_reg & DP_PORT_EN))
 		return;
 
 	with_pps_lock(intel_dp, wakeref) {
@@ -3625,9 +3634,9 @@ static void vlv_detach_power_sequencer(struct intel_dp *intel_dp)
 	enum pipe pipe = intel_dp->pps_pipe;
 	i915_reg_t pp_on_reg = PP_ON_DELAYS(pipe);
 
-	WARN_ON(intel_dp->active_pipe != INVALID_PIPE);
+	drm_WARN_ON(&dev_priv->drm, intel_dp->active_pipe != INVALID_PIPE);
 
-	if (WARN_ON(pipe != PIPE_A && pipe != PIPE_B))
+	if (drm_WARN_ON(&dev_priv->drm, pipe != PIPE_A && pipe != PIPE_B))
 		return;
 
 	edp_panel_vdd_off_sync(intel_dp);
@@ -3660,10 +3669,10 @@ static void vlv_steal_power_sequencer(struct drm_i915_private *dev_priv,
 	for_each_intel_dp(&dev_priv->drm, encoder) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 
-		WARN(intel_dp->active_pipe == pipe,
-		     "stealing pipe %c power sequencer from active [ENCODER:%d:%s]\n",
-		     pipe_name(pipe), encoder->base.base.id,
-		     encoder->base.name);
+		drm_WARN(&dev_priv->drm, intel_dp->active_pipe == pipe,
+			 "stealing pipe %c power sequencer from active [ENCODER:%d:%s]\n",
+			 pipe_name(pipe), encoder->base.base.id,
+			 encoder->base.name);
 
 		if (intel_dp->pps_pipe != pipe)
 			continue;
@@ -3686,7 +3695,7 @@ static void vlv_init_panel_power_sequencer(struct intel_encoder *encoder,
 
 	lockdep_assert_held(&dev_priv->pps_mutex);
 
-	WARN_ON(intel_dp->active_pipe != INVALID_PIPE);
+	drm_WARN_ON(&dev_priv->drm, intel_dp->active_pipe != INVALID_PIPE);
 
 	if (intel_dp->pps_pipe != INVALID_PIPE &&
 	    intel_dp->pps_pipe != crtc->pipe) {
@@ -4208,7 +4217,8 @@ intel_dp_link_down(struct intel_encoder *encoder,
 	enum port port = encoder->port;
 	u32 DP = intel_dp->DP;
 
-	if (WARN_ON((I915_READ(intel_dp->output_reg) & DP_PORT_EN) == 0))
+	if (drm_WARN_ON(&dev_priv->drm,
+			(I915_READ(intel_dp->output_reg) & DP_PORT_EN) == 0))
 		return;
 
 	DRM_DEBUG_KMS("\n");
@@ -4370,7 +4380,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 		to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
 
 	/* this function is meant to be called only once */
-	WARN_ON(intel_dp->dpcd[DP_DPCD_REV] != 0);
+	drm_WARN_ON(&dev_priv->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
 
 	if (!intel_dp_read_dpcd(intel_dp))
 		return false;
@@ -5125,7 +5135,7 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
 
 	crtc_state = to_intel_crtc_state(crtc->base.state);
 
-	WARN_ON(!intel_crtc_has_dp_encoder(crtc_state));
+	drm_WARN_ON(&dev_priv->drm, !intel_crtc_has_dp_encoder(crtc_state));
 
 	if (!crtc_state->hw.active)
 		return 0;
@@ -5658,7 +5668,8 @@ intel_dp_detect(struct drm_connector *connector,
 
 	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
 		      connector->base.id, connector->name);
-	WARN_ON(!drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
+	drm_WARN_ON(&dev_priv->drm,
+		    !drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
 
 	/* Can't disconnect eDP */
 	if (intel_dp_is_edp(intel_dp))
@@ -6865,7 +6876,8 @@ intel_dp_init_panel_power_sequencer_registers(struct intel_dp *intel_dp,
 	if (force_disable_vdd) {
 		u32 pp = ilk_get_pp_control(intel_dp);
 
-		WARN(pp & PANEL_POWER_ON, "Panel power already on\n");
+		drm_WARN(&dev_priv->drm, pp & PANEL_POWER_ON,
+			 "Panel power already on\n");
 
 		if (pp & EDP_FORCE_VDD)
 			DRM_DEBUG_KMS("VDD already on, disabling first\n");
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 4f4f1d449768..914be9190e03 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -352,8 +352,9 @@ static void intel_mst_post_disable_dp(struct intel_encoder *encoder,
 
 	intel_dp->active_mst_links--;
 	last_mst_stream = intel_dp->active_mst_links == 0;
-	WARN_ON(INTEL_GEN(dev_priv) >= 12 && last_mst_stream &&
-		!intel_dp_mst_is_master_trans(old_crtc_state));
+	drm_WARN_ON(&dev_priv->drm,
+		    INTEL_GEN(dev_priv) >= 12 && last_mst_stream &&
+		    !intel_dp_mst_is_master_trans(old_crtc_state));
 
 	intel_crtc_vblank_off(old_crtc_state);
 
@@ -437,8 +438,9 @@ static void intel_mst_pre_enable_dp(struct intel_encoder *encoder,
 	connector->encoder = encoder;
 	intel_mst->connector = connector;
 	first_mst_stream = intel_dp->active_mst_links == 0;
-	WARN_ON(INTEL_GEN(dev_priv) >= 12 && first_mst_stream &&
-		!intel_dp_mst_is_master_trans(pipe_config));
+	drm_WARN_ON(&dev_priv->drm,
+		    INTEL_GEN(dev_priv) >= 12 && first_mst_stream &&
+		    !intel_dp_mst_is_master_trans(pipe_config));
 
 	DRM_DEBUG_KMS("active links %d\n", intel_dp->active_mst_links);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.c b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
index 704f38681c4b..904695882b21 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
@@ -259,7 +259,8 @@ void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
 		}
 	}
 
-	WARN(1, "PHY not found for PORT %c", port_name(port));
+	drm_WARN(&dev_priv->drm, 1, "PHY not found for PORT %c",
+		 port_name(port));
 	*phy = DPIO_PHY0;
 	*ch = DPIO_CH0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index f1e5bf498227..2a567128864e 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -103,8 +103,8 @@ enum intel_dpll_id
 intel_get_shared_dpll_id(struct drm_i915_private *dev_priv,
 			 struct intel_shared_dpll *pll)
 {
-	if (WARN_ON(pll < dev_priv->shared_dplls||
-		    pll > &dev_priv->shared_dplls[dev_priv->num_shared_dpll]))
+	if (drm_WARN_ON(&dev_priv->drm, pll < dev_priv->shared_dplls || pll >
+			&dev_priv->shared_dplls[dev_priv->num_shared_dpll]))
 		return -1;
 
 	return (enum intel_dpll_id) (pll - dev_priv->shared_dplls);
@@ -118,7 +118,8 @@ void assert_shared_dpll(struct drm_i915_private *dev_priv,
 	bool cur_state;
 	struct intel_dpll_hw_state hw_state;
 
-	if (WARN(!pll, "asserting DPLL %s with no DPLL\n", onoff(state)))
+	if (drm_WARN(&dev_priv->drm, !pll,
+		     "asserting DPLL %s with no DPLL\n", onoff(state)))
 		return;
 
 	cur_state = pll->info->funcs->get_hw_state(dev_priv, pll, &hw_state);
@@ -140,14 +141,14 @@ void intel_prepare_shared_dpll(const struct intel_crtc_state *crtc_state)
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 
-	if (WARN_ON(pll == NULL))
+	if (drm_WARN_ON(&dev_priv->drm, pll == NULL))
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
-	WARN_ON(!pll->state.crtc_mask);
+	drm_WARN_ON(&dev_priv->drm, !pll->state.crtc_mask);
 	if (!pll->active_mask) {
 		DRM_DEBUG_DRIVER("setting up %s\n", pll->info->name);
-		WARN_ON(pll->on);
+		drm_WARN_ON(&dev_priv->drm, pll->on);
 		assert_shared_dpll_disabled(dev_priv, pll);
 
 		pll->info->funcs->prepare(dev_priv, pll);
@@ -169,14 +170,14 @@ void intel_enable_shared_dpll(const struct intel_crtc_state *crtc_state)
 	unsigned int crtc_mask = drm_crtc_mask(&crtc->base);
 	unsigned int old_mask;
 
-	if (WARN_ON(pll == NULL))
+	if (drm_WARN_ON(&dev_priv->drm, pll == NULL))
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
 	old_mask = pll->active_mask;
 
-	if (WARN_ON(!(pll->state.crtc_mask & crtc_mask)) ||
-	    WARN_ON(pll->active_mask & crtc_mask))
+	if (drm_WARN_ON(&dev_priv->drm, !(pll->state.crtc_mask & crtc_mask)) ||
+	    drm_WARN_ON(&dev_priv->drm, pll->active_mask & crtc_mask))
 		goto out;
 
 	pll->active_mask |= crtc_mask;
@@ -186,11 +187,11 @@ void intel_enable_shared_dpll(const struct intel_crtc_state *crtc_state)
 		      crtc->base.base.id);
 
 	if (old_mask) {
-		WARN_ON(!pll->on);
+		drm_WARN_ON(&dev_priv->drm, !pll->on);
 		assert_shared_dpll_enabled(dev_priv, pll);
 		goto out;
 	}
-	WARN_ON(pll->on);
+	drm_WARN_ON(&dev_priv->drm, pll->on);
 
 	DRM_DEBUG_KMS("enabling %s\n", pll->info->name);
 	pll->info->funcs->enable(dev_priv, pll);
@@ -221,7 +222,7 @@ void intel_disable_shared_dpll(const struct intel_crtc_state *crtc_state)
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
-	if (WARN_ON(!(pll->active_mask & crtc_mask)))
+	if (drm_WARN_ON(&dev_priv->drm, !(pll->active_mask & crtc_mask)))
 		goto out;
 
 	DRM_DEBUG_KMS("disable %s (active %x, on? %d) for crtc %d\n",
@@ -229,7 +230,7 @@ void intel_disable_shared_dpll(const struct intel_crtc_state *crtc_state)
 		      crtc->base.base.id);
 
 	assert_shared_dpll_enabled(dev_priv, pll);
-	WARN_ON(!pll->on);
+	drm_WARN_ON(&dev_priv->drm, !pll->on);
 
 	pll->active_mask &= ~crtc_mask;
 	if (pll->active_mask)
@@ -256,7 +257,7 @@ intel_find_shared_dpll(struct intel_atomic_state *state,
 
 	shared_dpll = intel_atomic_get_shared_dpll_state(&state->base);
 
-	WARN_ON(dpll_mask & ~(BIT(I915_NUM_PLLS) - 1));
+	drm_WARN_ON(&dev_priv->drm, dpll_mask & ~(BIT(I915_NUM_PLLS) - 1));
 
 	for_each_set_bit(i, &dpll_mask, I915_NUM_PLLS) {
 		pll = &dev_priv->shared_dplls[i];
@@ -1100,7 +1101,7 @@ static bool skl_ddi_dpll0_get_hw_state(struct drm_i915_private *dev_priv,
 
 	/* DPLL0 is always enabled since it drives CDCLK */
 	val = I915_READ(regs[id].ctl);
-	if (WARN_ON(!(val & LCPLL_PLL_ENABLE)))
+	if (drm_WARN_ON(&dev_priv->drm, !(val & LCPLL_PLL_ENABLE)))
 		goto out;
 
 	val = I915_READ(DPLL_CTRL1);
@@ -3814,7 +3815,7 @@ bool intel_reserve_shared_dplls(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
 	const struct intel_dpll_mgr *dpll_mgr = dev_priv->dpll_mgr;
 
-	if (WARN_ON(!dpll_mgr))
+	if (drm_WARN_ON(&dev_priv->drm, !dpll_mgr))
 		return false;
 
 	return dpll_mgr->get_dplls(state, crtc, encoder);
@@ -3866,7 +3867,7 @@ void intel_update_active_dpll(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	const struct intel_dpll_mgr *dpll_mgr = dev_priv->dpll_mgr;
 
-	if (WARN_ON(!dpll_mgr))
+	if (drm_WARN_ON(&dev_priv->drm, !dpll_mgr))
 		return;
 
 	dpll_mgr->update_active_dpll(state, crtc, encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index ada006a690df..d26412498b75 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -165,7 +165,7 @@ void intel_dsb_put(struct intel_dsb *dsb)
 	if (!HAS_DSB(i915))
 		return;
 
-	if (WARN_ON(dsb->refcount == 0))
+	if (drm_WARN_ON(&i915->drm, dsb->refcount == 0))
 		return;
 
 	if (--dsb->refcount == 0) {
@@ -202,7 +202,7 @@ void intel_dsb_indexed_reg_write(struct intel_dsb *dsb, i915_reg_t reg,
 		return;
 	}
 
-	if (WARN_ON(dsb->free_pos >= DSB_BUF_SIZE)) {
+	if (drm_WARN_ON(&dev_priv->drm, dsb->free_pos >= DSB_BUF_SIZE)) {
 		DRM_DEBUG_KMS("DSB buffer overflow\n");
 		return;
 	}
@@ -276,7 +276,7 @@ void intel_dsb_reg_write(struct intel_dsb *dsb, i915_reg_t reg, u32 val)
 		return;
 	}
 
-	if (WARN_ON(dsb->free_pos >= DSB_BUF_SIZE)) {
+	if (drm_WARN_ON(&dev_priv->drm, dsb->free_pos >= DSB_BUF_SIZE)) {
 		DRM_DEBUG_KMS("DSB buffer overflow\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 89fb0d90b694..3425cddf78ce 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -556,14 +556,15 @@ static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
 	const u8 *data;
 	fn_mipi_elem_exec mipi_elem_exec;
 
-	if (WARN_ON(seq_id >= ARRAY_SIZE(dev_priv->vbt.dsi.sequence)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			seq_id >= ARRAY_SIZE(dev_priv->vbt.dsi.sequence)))
 		return;
 
 	data = dev_priv->vbt.dsi.sequence[seq_id];
 	if (!data)
 		return;
 
-	WARN_ON(*data != seq_id);
+	drm_WARN_ON(&dev_priv->drm, *data != seq_id);
 
 	DRM_DEBUG_KMS("Starting MIPI sequence %d - %s\n",
 		      seq_id, sequence_name(seq_id));
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index a1048ece541e..455ae0f87640 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -407,7 +407,7 @@ static void intel_fbc_deactivate(struct drm_i915_private *dev_priv,
 {
 	struct intel_fbc *fbc = &dev_priv->fbc;
 
-	WARN_ON(!mutex_is_locked(&fbc->lock));
+	drm_WARN_ON(&dev_priv->drm, !mutex_is_locked(&fbc->lock));
 
 	if (fbc->active)
 		intel_fbc_hw_deactivate(dev_priv);
@@ -471,7 +471,8 @@ static int intel_fbc_alloc_cfb(struct drm_i915_private *dev_priv,
 	struct drm_mm_node *uninitialized_var(compressed_llb);
 	int ret;
 
-	WARN_ON(drm_mm_node_allocated(&fbc->compressed_fb));
+	drm_WARN_ON(&dev_priv->drm,
+		    drm_mm_node_allocated(&fbc->compressed_fb));
 
 	ret = find_compression_threshold(dev_priv, &fbc->compressed_fb,
 					 size, fb_cpp);
@@ -555,7 +556,7 @@ static bool stride_is_valid(struct drm_i915_private *dev_priv,
 			    unsigned int stride)
 {
 	/* This should have been caught earlier. */
-	if (WARN_ON_ONCE((stride & (64 - 1)) != 0))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, (stride & (64 - 1)) != 0))
 		return false;
 
 	/* Below are the additional FBC restrictions. */
@@ -663,8 +664,8 @@ static void intel_fbc_update_state_cache(struct intel_crtc *crtc,
 	cache->fb.format = fb->format;
 	cache->fb.stride = fb->pitches[0];
 
-	WARN_ON(plane_state->flags & PLANE_HAS_FENCE &&
-		!plane_state->vma->fence);
+	drm_WARN_ON(&dev_priv->drm, plane_state->flags & PLANE_HAS_FENCE &&
+		    !plane_state->vma->fence);
 
 	if (plane_state->flags & PLANE_HAS_FENCE &&
 	    plane_state->vma->fence)
@@ -926,9 +927,9 @@ static void __intel_fbc_disable(struct drm_i915_private *dev_priv)
 	struct intel_fbc *fbc = &dev_priv->fbc;
 	struct intel_crtc *crtc = fbc->crtc;
 
-	WARN_ON(!mutex_is_locked(&fbc->lock));
-	WARN_ON(!fbc->crtc);
-	WARN_ON(fbc->active);
+	drm_WARN_ON(&dev_priv->drm, !mutex_is_locked(&fbc->lock));
+	drm_WARN_ON(&dev_priv->drm, !fbc->crtc);
+	drm_WARN_ON(&dev_priv->drm, fbc->active);
 
 	DRM_DEBUG_KMS("Disabling FBC on pipe %c\n", pipe_name(crtc->pipe));
 
@@ -942,7 +943,7 @@ static void __intel_fbc_post_update(struct intel_crtc *crtc)
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct intel_fbc *fbc = &dev_priv->fbc;
 
-	WARN_ON(!mutex_is_locked(&fbc->lock));
+	drm_WARN_ON(&dev_priv->drm, !mutex_is_locked(&fbc->lock));
 
 	if (fbc->crtc != crtc)
 		return;
@@ -1129,7 +1130,7 @@ void intel_fbc_enable(struct intel_crtc *crtc,
 		__intel_fbc_disable(dev_priv);
 	}
 
-	WARN_ON(fbc->active);
+	drm_WARN_ON(&dev_priv->drm, fbc->active);
 
 	intel_fbc_update_state_cache(crtc, crtc_state, plane_state);
 
@@ -1195,7 +1196,7 @@ void intel_fbc_global_disable(struct drm_i915_private *dev_priv)
 
 	mutex_lock(&fbc->lock);
 	if (fbc->crtc) {
-		WARN_ON(fbc->crtc->active);
+		drm_WARN_ON(&dev_priv->drm, fbc->crtc->active);
 		__intel_fbc_disable(dev_priv);
 	}
 	mutex_unlock(&fbc->lock);
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 3d4d19ac1d14..efa417cde94b 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -908,7 +908,8 @@ int intel_gmbus_setup(struct drm_i915_private *dev_priv)
 struct i2c_adapter *intel_gmbus_get_adapter(struct drm_i915_private *dev_priv,
 					    unsigned int pin)
 {
-	if (WARN_ON(!intel_gmbus_is_valid_pin(dev_priv, pin)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			!intel_gmbus_is_valid_pin(dev_priv, pin)))
 		return NULL;
 
 	return &dev_priv->gmbus[pin].adapter;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 0fdbd39f6641..ccd5526ced83 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -853,7 +853,8 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	if (WARN_ON(!intel_hdcp_in_use(dev_priv, cpu_transcoder, port))) {
+	if (drm_WARN_ON(&dev_priv->drm,
+			!intel_hdcp_in_use(dev_priv, cpu_transcoder, port))) {
 		DRM_ERROR("%s:%d HDCP link stopped encryption,%x\n",
 			  connector->base.name, connector->base.base.id,
 			  I915_READ(HDCP_STATUS(dev_priv, cpu_transcoder,
@@ -1531,8 +1532,9 @@ static int hdcp2_enable_encryption(struct intel_connector *connector)
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
 	int ret;
 
-	WARN_ON(I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
-		LINK_ENCRYPTION_STATUS);
+	drm_WARN_ON(&dev_priv->drm,
+		    I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
+		    LINK_ENCRYPTION_STATUS);
 	if (hdcp->shim->toggle_signalling) {
 		ret = hdcp->shim->toggle_signalling(intel_dig_port, true);
 		if (ret) {
@@ -1569,8 +1571,9 @@ static int hdcp2_disable_encryption(struct intel_connector *connector)
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
 	int ret;
 
-	WARN_ON(!(I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
-			    LINK_ENCRYPTION_STATUS));
+	drm_WARN_ON(&dev_priv->drm,
+		    !(I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
+		      LINK_ENCRYPTION_STATUS));
 
 	I915_WRITE(HDCP2_CTL(dev_priv, cpu_transcoder, port),
 		   I915_READ(HDCP2_CTL(dev_priv, cpu_transcoder, port)) &
@@ -1690,7 +1693,8 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	if (WARN_ON(!intel_hdcp2_in_use(dev_priv, cpu_transcoder, port))) {
+	if (drm_WARN_ON(&dev_priv->drm,
+			!intel_hdcp2_in_use(dev_priv, cpu_transcoder, port))) {
 		DRM_ERROR("HDCP2.2 link stopped the encryption, %x\n",
 			  I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder,
 						 port)));
@@ -1881,7 +1885,7 @@ void intel_hdcp_component_init(struct drm_i915_private *dev_priv)
 		return;
 
 	mutex_lock(&dev_priv->hdcp_comp_mutex);
-	WARN_ON(dev_priv->hdcp_comp_added);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->hdcp_comp_added);
 
 	dev_priv->hdcp_comp_added = true;
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
@@ -1954,7 +1958,8 @@ int intel_hdcp_enable(struct intel_connector *connector,
 		return -ENOENT;
 
 	mutex_lock(&hdcp->mutex);
-	WARN_ON(hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
+	drm_WARN_ON(&dev_priv->drm,
+		    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
 	hdcp->content_type = content_type;
 
 	if (INTEL_GEN(dev_priv) >= 12) {
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 36738bb893f5..631fa7426cef 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -80,9 +80,10 @@ static void
 assert_hdmi_transcoder_func_disabled(struct drm_i915_private *dev_priv,
 				     enum transcoder cpu_transcoder)
 {
-	WARN(I915_READ(TRANS_DDI_FUNC_CTL(cpu_transcoder)) &
-	     TRANS_DDI_FUNC_ENABLE,
-	     "HDMI transcoder function enabled, expecting disabled\n");
+	drm_WARN(&dev_priv->drm,
+		 I915_READ(TRANS_DDI_FUNC_CTL(cpu_transcoder)) &
+		 TRANS_DDI_FUNC_ENABLE,
+		 "HDMI transcoder function enabled, expecting disabled\n");
 }
 
 struct intel_hdmi *enc_to_intel_hdmi(struct drm_encoder *encoder)
@@ -217,7 +218,8 @@ static void g4x_write_infoframe(struct intel_encoder *encoder,
 	u32 val = I915_READ(VIDEO_DIP_CTL);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	drm_WARN(&dev_priv->drm, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -290,7 +292,8 @@ static void ibx_write_infoframe(struct intel_encoder *encoder,
 	u32 val = I915_READ(reg);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	drm_WARN(&dev_priv->drm, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -367,7 +370,8 @@ static void cpt_write_infoframe(struct intel_encoder *encoder,
 	u32 val = I915_READ(reg);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	drm_WARN(&dev_priv->drm, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -443,7 +447,8 @@ static void vlv_write_infoframe(struct intel_encoder *encoder,
 	u32 val = I915_READ(reg);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	drm_WARN(&dev_priv->drm, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -522,7 +527,7 @@ static void hsw_write_infoframe(struct intel_encoder *encoder,
 
 	data_size = hsw_dip_data_size(dev_priv, type);
 
-	WARN_ON(len > data_size);
+	drm_WARN_ON(&dev_priv->drm, len > data_size);
 
 	val &= ~hsw_infoframe_enable(type);
 	I915_WRITE(ctl_reg, val);
@@ -843,7 +848,7 @@ intel_hdmi_compute_drm_infoframe(struct intel_encoder *encoder,
 	}
 
 	ret = hdmi_drm_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (drm_WARN_ON(&dev_priv->drm, ret))
 		return false;
 
 	return true;
@@ -1061,9 +1066,9 @@ static void ibx_set_infoframes(struct intel_encoder *encoder,
 	}
 
 	if (port != (val & VIDEO_DIP_PORT_MASK)) {
-		WARN(val & VIDEO_DIP_ENABLE,
-		     "DIP already enabled on port %c\n",
-		     (val & VIDEO_DIP_PORT_MASK) >> 29);
+		drm_WARN(&dev_priv->drm, val & VIDEO_DIP_ENABLE,
+			 "DIP already enabled on port %c\n",
+			 (val & VIDEO_DIP_PORT_MASK) >> 29);
 		val &= ~VIDEO_DIP_PORT_MASK;
 		val |= port;
 	}
@@ -1168,9 +1173,9 @@ static void vlv_set_infoframes(struct intel_encoder *encoder,
 	}
 
 	if (port != (val & VIDEO_DIP_PORT_MASK)) {
-		WARN(val & VIDEO_DIP_ENABLE,
-		     "DIP already enabled on port %c\n",
-		     (val & VIDEO_DIP_PORT_MASK) >> 29);
+		drm_WARN(&dev_priv->drm, val & VIDEO_DIP_ENABLE,
+			 "DIP already enabled on port %c\n",
+			 (val & VIDEO_DIP_PORT_MASK) >> 29);
 		val &= ~VIDEO_DIP_PORT_MASK;
 		val |= port;
 	}
@@ -3001,7 +3006,7 @@ static u8 icl_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
 	else if (intel_phy_is_tc(dev_priv, phy))
 		return GMBUS_PIN_9_TC1_ICP + intel_port_to_tc(dev_priv, port);
 
-	WARN(1, "Unknown port:%c\n", port_name(port));
+	drm_WARN(&dev_priv->drm, 1, "Unknown port:%c\n", port_name(port));
 	return GMBUS_PIN_2_BXT;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index a0ae7cb843d4..86326013ef40 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -509,8 +509,9 @@ void intel_hpd_irq_handler(struct drm_i915_private *dev_priv,
 			 * hotplug bits itself. So only WARN about unexpected
 			 * interrupts on saner platforms.
 			 */
-			WARN_ONCE(!HAS_GMCH(dev_priv),
-				  "Received HPD interrupt on pin %d although disabled\n", pin);
+			drm_WARN_ONCE(&dev_priv->drm, !HAS_GMCH(dev_priv),
+				      "Received HPD interrupt on pin %d although disabled\n",
+				      pin);
 			continue;
 		}
 
diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index 0b67f7887cd0..b0cf01268aab 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -166,7 +166,7 @@ static int lpe_audio_irq_init(struct drm_i915_private *dev_priv)
 {
 	int irq = dev_priv->lpe_audio.irq;
 
-	WARN_ON(!intel_irqs_enabled(dev_priv));
+	drm_WARN_ON(&dev_priv->drm, !intel_irqs_enabled(dev_priv));
 	irq_set_chip_and_handler_name(irq,
 				&lpe_audio_irqchip,
 				handle_simple_irq,
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index b78c14dd712e..26d1d096857c 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -204,7 +204,8 @@ static void intel_lvds_pps_init_hw(struct drm_i915_private *dev_priv,
 	u32 val;
 
 	val = I915_READ(PP_CONTROL(0));
-	WARN_ON((val & PANEL_UNLOCK_MASK) != PANEL_UNLOCK_REGS);
+	drm_WARN_ON(&dev_priv->drm,
+		    (val & PANEL_UNLOCK_MASK) != PANEL_UNLOCK_REGS);
 	if (pps->powerdown_on_reset)
 		val |= PANEL_POWER_RESET;
 	I915_WRITE(PP_CONTROL(0), val);
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index e59b4992ba1b..ffb3008a47df 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -403,8 +403,9 @@ int intel_opregion_notify_encoder(struct intel_encoder *intel_encoder,
 		type = DISPLAY_TYPE_INTERNAL_FLAT_PANEL;
 		break;
 	default:
-		WARN_ONCE(1, "unsupported intel_encoder type %d\n",
-			  intel_encoder->type);
+		drm_WARN_ONCE(&dev_priv->drm, 1,
+			      "unsupported intel_encoder type %d\n",
+			      intel_encoder->type);
 		return -EINVAL;
 	}
 
@@ -984,7 +985,7 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 		 */
 		if (opregion->header->over.major > 2 ||
 		    opregion->header->over.minor >= 1) {
-			WARN_ON(rvda < OPREGION_SIZE);
+			drm_WARN_ON(&dev_priv->drm, rvda < OPREGION_SIZE);
 
 			rvda += asls;
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index e40c3a0e2cd7..ea7358d92702 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -247,7 +247,7 @@ static int intel_overlay_on(struct intel_overlay *overlay)
 	struct i915_request *rq;
 	u32 *cs;
 
-	WARN_ON(overlay->active);
+	drm_WARN_ON(&dev_priv->drm, overlay->active);
 
 	rq = alloc_request(overlay, NULL);
 	if (IS_ERR(rq))
@@ -315,7 +315,7 @@ static int intel_overlay_continue(struct intel_overlay *overlay,
 	u32 flip_addr = overlay->flip_addr;
 	u32 tmp, *cs;
 
-	WARN_ON(!overlay->active);
+	drm_WARN_ON(&dev_priv->drm, !overlay->active);
 
 	if (load_polyphase_filter)
 		flip_addr |= OFC_UPDATE;
@@ -759,7 +759,8 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 	struct i915_vma *vma;
 	int ret, tmp_width;
 
-	WARN_ON(!drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
+	drm_WARN_ON(&dev_priv->drm,
+		    !drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
 
 	ret = intel_overlay_release_old_vid(overlay);
 	if (ret != 0)
@@ -857,7 +858,8 @@ int intel_overlay_switch_off(struct intel_overlay *overlay)
 	struct drm_i915_private *dev_priv = overlay->i915;
 	int ret;
 
-	WARN_ON(!drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
+	drm_WARN_ON(&dev_priv->drm,
+		    !drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
 
 	ret = intel_overlay_recover_from_interrupt(overlay);
 	if (ret != 0)
@@ -1389,7 +1391,7 @@ void intel_overlay_cleanup(struct drm_i915_private *dev_priv)
 	 * Furthermore modesetting teardown happens beforehand so the
 	 * hardware should be off already.
 	 */
-	WARN_ON(overlay->active);
+	drm_WARN_ON(&dev_priv->drm, overlay->active);
 
 	i915_gem_object_put(overlay->reg_bo);
 	i915_active_fini(&overlay->last_flip);
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 7b3ec6eb3382..996310755b58 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -423,7 +423,8 @@ void intel_gmch_panel_fitting(struct intel_crtc *intel_crtc,
 		}
 		break;
 	default:
-		WARN(1, "bad panel fit mode: %d\n", fitting_mode);
+		drm_WARN(&dev_priv->drm, 1, "bad panel fit mode: %d\n",
+			 fitting_mode);
 		return;
 	}
 
@@ -520,7 +521,7 @@ static u32 intel_panel_compute_brightness(struct intel_connector *connector,
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
 
-	WARN_ON(panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
 
 	if (i915_modparams.invert_brightness < 0)
 		return val;
@@ -569,7 +570,7 @@ static u32 i9xx_get_backlight(struct intel_connector *connector)
 
 static u32 _vlv_get_backlight(struct drm_i915_private *dev_priv, enum pipe pipe)
 {
-	if (WARN_ON(pipe != PIPE_A && pipe != PIPE_B))
+	if (drm_WARN_ON(&dev_priv->drm, pipe != PIPE_A && pipe != PIPE_B))
 		return 0;
 
 	return I915_READ(VLV_BLC_PWM_CTL(pipe)) & BACKLIGHT_DUTY_CYCLE_MASK;
@@ -626,7 +627,7 @@ static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32
 	struct intel_panel *panel = &connector->panel;
 	u32 tmp, mask;
 
-	WARN_ON(panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
 
 	if (panel->backlight.combination_mode) {
 		u8 lbpc;
@@ -709,7 +710,7 @@ void intel_panel_set_backlight_acpi(const struct drm_connector_state *conn_state
 
 	mutex_lock(&dev_priv->backlight_lock);
 
-	WARN_ON(panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
 
 	hw_level = clamp_user_to_hw(connector, user_level, user_max);
 	panel->backlight.level = hw_level;
@@ -1237,7 +1238,7 @@ static void intel_panel_set_backlight(const struct drm_connector_state *conn_sta
 
 	mutex_lock(&dev_priv->backlight_lock);
 
-	WARN_ON(panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
 
 	hw_level = scale_user_to_hw(connector, user_level, user_max);
 	panel->backlight.level = hw_level;
@@ -1546,7 +1547,7 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)
 	struct intel_panel *panel = &connector->panel;
 	int min;
 
-	WARN_ON(panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
 
 	/*
 	 * XXX: If the vbt value is 255, it makes min equal to max, which leads
@@ -1731,7 +1732,7 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
 	struct intel_panel *panel = &connector->panel;
 	u32 ctl, ctl2, val;
 
-	if (WARN_ON(pipe != PIPE_A && pipe != PIPE_B))
+	if (drm_WARN_ON(&dev_priv->drm, pipe != PIPE_A && pipe != PIPE_B))
 		return -ENODEV;
 
 	ctl2 = I915_READ(VLV_BLC_PWM_CTL2(pipe));
@@ -1921,7 +1922,7 @@ int intel_panel_setup_backlight(struct drm_connector *connector, enum pipe pipe)
 	}
 
 	/* ensure intel_panel has been initialized first */
-	if (WARN_ON(!panel->backlight.setup))
+	if (drm_WARN_ON(&dev_priv->drm, !panel->backlight.setup))
 		return -ENODEV;
 
 	/* set level and max in panel struct */
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index b4efee22fa63..89e2a8cc8700 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -328,7 +328,8 @@ intel_crtc_crc_setup_workarounds(struct intel_crtc *crtc, bool enable)
 
 	drm_atomic_state_put(state);
 unlock:
-	WARN(ret, "Toggling workaround to %i returns %i\n", enable, ret);
+	drm_WARN(&dev_priv->drm, ret,
+		 "Toggling workaround to %i returns %i\n", enable, ret);
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index e3fd5f1e2d21..5db66abb27d9 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -77,8 +77,8 @@ static bool intel_psr2_enabled(struct drm_i915_private *dev_priv,
 			       const struct intel_crtc_state *crtc_state)
 {
 	/* Cannot enable DSC and PSR2 simultaneously */
-	WARN_ON(crtc_state->dsc.compression_enable &&
-		crtc_state->has_psr2);
+	drm_WARN_ON(&dev_priv->drm, crtc_state->dsc.compression_enable &&
+		    crtc_state->has_psr2);
 
 	switch (dev_priv->psr.debug & I915_PSR_DEBUG_MODE_MASK) {
 	case I915_PSR_DEBUG_DISABLE:
@@ -737,10 +737,14 @@ static void intel_psr_activate(struct intel_dp *intel_dp)
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 
 	if (transcoder_has_psr2(dev_priv, dev_priv->psr.transcoder))
-		WARN_ON(I915_READ(EDP_PSR2_CTL(dev_priv->psr.transcoder)) & EDP_PSR2_ENABLE);
-
-	WARN_ON(I915_READ(EDP_PSR_CTL(dev_priv->psr.transcoder)) & EDP_PSR_ENABLE);
-	WARN_ON(dev_priv->psr.active);
+		drm_WARN_ON(&dev_priv->drm,
+			    I915_READ(EDP_PSR2_CTL(dev_priv->psr.transcoder)) &
+			    EDP_PSR2_ENABLE);
+
+	drm_WARN_ON(&dev_priv->drm,
+		    I915_READ(EDP_PSR_CTL(dev_priv->psr.transcoder)) &
+		    EDP_PSR_ENABLE);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->psr.active);
 	lockdep_assert_held(&dev_priv->psr.lock);
 
 	/* psr1 and psr2 are mutually exclusive.*/
@@ -800,7 +804,7 @@ static void intel_psr_enable_locked(struct drm_i915_private *dev_priv,
 	struct intel_dp *intel_dp = dev_priv->psr.dp;
 	u32 val;
 
-	WARN_ON(dev_priv->psr.enabled);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->psr.enabled);
 
 	dev_priv->psr.psr2_enabled = intel_psr2_enabled(dev_priv, crtc_state);
 	dev_priv->psr.busy_frontbuffer_bits = 0;
@@ -855,10 +859,10 @@ void intel_psr_enable(struct intel_dp *intel_dp,
 	if (!crtc_state->has_psr)
 		return;
 
-	if (WARN_ON(!CAN_PSR(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm, !CAN_PSR(dev_priv)))
 		return;
 
-	WARN_ON(dev_priv->drrs.dp);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->drrs.dp);
 
 	mutex_lock(&dev_priv->psr.lock);
 
@@ -880,11 +884,11 @@ static void intel_psr_exit(struct drm_i915_private *dev_priv)
 	if (!dev_priv->psr.active) {
 		if (transcoder_has_psr2(dev_priv, dev_priv->psr.transcoder)) {
 			val = I915_READ(EDP_PSR2_CTL(dev_priv->psr.transcoder));
-			WARN_ON(val & EDP_PSR2_ENABLE);
+			drm_WARN_ON(&dev_priv->drm, val & EDP_PSR2_ENABLE);
 		}
 
 		val = I915_READ(EDP_PSR_CTL(dev_priv->psr.transcoder));
-		WARN_ON(val & EDP_PSR_ENABLE);
+		drm_WARN_ON(&dev_priv->drm, val & EDP_PSR_ENABLE);
 
 		return;
 	}
@@ -892,12 +896,12 @@ static void intel_psr_exit(struct drm_i915_private *dev_priv)
 	if (dev_priv->psr.psr2_enabled) {
 		tgl_disallow_dc3co_on_psr2_exit(dev_priv);
 		val = I915_READ(EDP_PSR2_CTL(dev_priv->psr.transcoder));
-		WARN_ON(!(val & EDP_PSR2_ENABLE));
+		drm_WARN_ON(&dev_priv->drm, !(val & EDP_PSR2_ENABLE));
 		val &= ~EDP_PSR2_ENABLE;
 		I915_WRITE(EDP_PSR2_CTL(dev_priv->psr.transcoder), val);
 	} else {
 		val = I915_READ(EDP_PSR_CTL(dev_priv->psr.transcoder));
-		WARN_ON(!(val & EDP_PSR_ENABLE));
+		drm_WARN_ON(&dev_priv->drm, !(val & EDP_PSR_ENABLE));
 		val &= ~EDP_PSR_ENABLE;
 		I915_WRITE(EDP_PSR_CTL(dev_priv->psr.transcoder), val);
 	}
@@ -957,7 +961,7 @@ void intel_psr_disable(struct intel_dp *intel_dp,
 	if (!old_crtc_state->has_psr)
 		return;
 
-	if (WARN_ON(!CAN_PSR(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm, !CAN_PSR(dev_priv)))
 		return;
 
 	mutex_lock(&dev_priv->psr.lock);
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index ee54aa9fc8b5..e373a72cd66d 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1499,7 +1499,8 @@ static void intel_sdvo_pre_enable(struct intel_encoder *intel_encoder,
 
 	switch (crtc_state->pixel_multiplier) {
 	default:
-		WARN(1, "unknown pixel multiplier specified\n");
+		drm_WARN(&dev_priv->drm, 1,
+			 "unknown pixel multiplier specified\n");
 		/* fall through */
 	case 1: rate = SDVO_CLOCK_RATE_MULT_1X; break;
 	case 2: rate = SDVO_CLOCK_RATE_MULT_2X; break;
@@ -3230,9 +3231,9 @@ static void assert_sdvo_port_valid(const struct drm_i915_private *dev_priv,
 				   enum port port)
 {
 	if (HAS_PCH_SPLIT(dev_priv))
-		WARN_ON(port != PORT_B);
+		drm_WARN_ON(&dev_priv->drm, port != PORT_B);
 	else
-		WARN_ON(port != PORT_B && port != PORT_C);
+		drm_WARN_ON(&dev_priv->drm, port != PORT_B && port != PORT_C);
 }
 
 bool intel_sdvo_init(struct drm_i915_private *dev_priv,
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index fca77ec1e0dd..68106fe608be 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -104,7 +104,7 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
 	if (min <= 0 || max <= 0)
 		goto irq_disable;
 
-	if (WARN_ON(drm_crtc_vblank_get(&crtc->base)))
+	if (drm_WARN_ON(&dev_priv->drm, drm_crtc_vblank_get(&crtc->base)))
 		goto irq_disable;
 
 	/*
@@ -204,7 +204,8 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 	 * event outside of the critical section - the spinlock might spin for a
 	 * while ... */
 	if (new_crtc_state->uapi.event) {
-		WARN_ON(drm_crtc_vblank_get(&crtc->base) != 0);
+		drm_WARN_ON(&dev_priv->drm,
+			    drm_crtc_vblank_get(&crtc->base) != 0);
 
 		spin_lock(&crtc->base.dev->event_lock);
 		drm_crtc_arm_vblank_event(&crtc->base,
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 7773169b7331..66d032ec91d1 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -61,7 +61,7 @@ u32 intel_tc_port_get_lane_mask(struct intel_digital_port *dig_port)
 	lane_mask = intel_uncore_read(uncore,
 				      PORT_TX_DFLEXDPSP(dig_port->tc_phy_fia));
 
-	WARN_ON(lane_mask == 0xffffffff);
+	drm_WARN_ON(&i915->drm, lane_mask == 0xffffffff);
 
 	lane_mask &= DP_LANE_ASSIGNMENT_MASK(dig_port->tc_phy_fia_idx);
 	return lane_mask >> DP_LANE_ASSIGNMENT_SHIFT(dig_port->tc_phy_fia_idx);
@@ -76,7 +76,7 @@ u32 intel_tc_port_get_pin_assignment_mask(struct intel_digital_port *dig_port)
 	pin_mask = intel_uncore_read(uncore,
 				     PORT_TX_DFLEXPA1(dig_port->tc_phy_fia));
 
-	WARN_ON(pin_mask == 0xffffffff);
+	drm_WARN_ON(&i915->drm, pin_mask == 0xffffffff);
 
 	return (pin_mask & DP_PIN_ASSIGNMENT_MASK(dig_port->tc_phy_fia_idx)) >>
 	       DP_PIN_ASSIGNMENT_SHIFT(dig_port->tc_phy_fia_idx);
@@ -120,7 +120,8 @@ void intel_tc_port_set_fia_lane_count(struct intel_digital_port *dig_port,
 	struct intel_uncore *uncore = &i915->uncore;
 	u32 val;
 
-	WARN_ON(lane_reversal && dig_port->tc_mode != TC_PORT_LEGACY);
+	drm_WARN_ON(&i915->drm,
+		    lane_reversal && dig_port->tc_mode != TC_PORT_LEGACY);
 
 	val = intel_uncore_read(uncore,
 				PORT_TX_DFLEXDPMLE1(dig_port->tc_phy_fia));
@@ -195,7 +196,7 @@ static u32 tc_port_live_status_mask(struct intel_digital_port *dig_port)
 		mask |= BIT(TC_PORT_LEGACY);
 
 	/* The sink can be connected only in a single mode. */
-	if (!WARN_ON(hweight32(mask) > 1))
+	if (!drm_WARN_ON(&i915->drm, hweight32(mask) > 1))
 		tc_port_fixup_legacy_flag(dig_port, mask);
 
 	return mask;
@@ -409,8 +410,8 @@ static void intel_tc_port_reset_mode(struct intel_digital_port *dig_port,
 	enum tc_port_mode old_tc_mode = dig_port->tc_mode;
 
 	intel_display_power_flush_work(i915);
-	WARN_ON(intel_display_power_is_enabled(i915,
-					       intel_aux_power_domain(dig_port)));
+	drm_WARN_ON(&i915->drm, intel_display_power_is_enabled(i915,
+				       intel_aux_power_domain(dig_port)));
 
 	icl_tc_phy_disconnect(dig_port);
 	icl_tc_phy_connect(dig_port, required_lanes);
@@ -503,7 +504,7 @@ static void __intel_tc_port_lock(struct intel_digital_port *dig_port,
 	    intel_tc_port_needs_reset(dig_port))
 		intel_tc_port_reset_mode(dig_port, required_lanes);
 
-	WARN_ON(dig_port->tc_lock_wakeref);
+	drm_WARN_ON(&i915->drm, dig_port->tc_lock_wakeref);
 	dig_port->tc_lock_wakeref = wakeref;
 }
 
@@ -550,7 +551,7 @@ void intel_tc_port_init(struct intel_digital_port *dig_port, bool is_legacy)
 	enum port port = dig_port->base.port;
 	enum tc_port tc_port = intel_port_to_tc(i915, port);
 
-	if (WARN_ON(tc_port == PORT_TC_NONE))
+	if (drm_WARN_ON(&i915->drm, tc_port == PORT_TC_NONE))
 		return;
 
 	snprintf(dig_port->tc_port_name, sizeof(dig_port->tc_port_name),
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 6bab08db5d75..c49549db0ded 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -374,7 +374,7 @@ static bool is_pipe_dsc(const struct intel_crtc_state *crtc_state)
 		return false;
 
 	/* There's no pipe A DSC engine on ICL */
-	WARN_ON(crtc->pipe == PIPE_A);
+	drm_WARN_ON(&i915->drm, crtc->pipe == PIPE_A);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 6c55c16e9313..63cb73dbf0cc 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1007,7 +1007,7 @@ static bool intel_dsi_get_hw_state(struct intel_encoder *encoder,
 			tmp &= BXT_PIPE_SELECT_MASK;
 			tmp >>= BXT_PIPE_SELECT_SHIFT;
 
-			if (WARN_ON(tmp > PIPE_C))
+			if (drm_WARN_ON(&dev_priv->drm, tmp > PIPE_C))
 				continue;
 
 			*pipe = tmp;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index c8264eb036bf..93188f607572 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -85,7 +85,9 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 			spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 
 			i915_gem_object_lock(obj);
-			WARN_ON(i915_gem_object_set_to_gtt_domain(obj, false));
+			drm_WARN_ON(&i915->drm,
+				    i915_gem_object_set_to_gtt_domain(obj,
+								      false));
 			i915_gem_object_unlock(obj);
 			i915_gem_object_put(obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index a2a980d9d241..5d5d7eef3f43 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -148,7 +148,8 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 		last_pfn = page_to_pfn(page);
 
 		/* Check that the i965g/gm workaround works. */
-		WARN_ON((gfp & __GFP_DMA32) && (last_pfn >= 0x00100000UL));
+		drm_WARN_ON(&i915->drm,
+			    (gfp & __GFP_DMA32) && (last_pfn >= 0x00100000UL));
 	}
 	if (sg) { /* loop terminated early; short sg table */
 		sg_page_sizes |= sg->length;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index f7e4b39c734f..7eaa2ab01de3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -403,19 +403,22 @@ void i915_gem_driver_register__shrinker(struct drm_i915_private *i915)
 	i915->mm.shrinker.count_objects = i915_gem_shrinker_count;
 	i915->mm.shrinker.seeks = DEFAULT_SEEKS;
 	i915->mm.shrinker.batch = 4096;
-	WARN_ON(register_shrinker(&i915->mm.shrinker));
+	drm_WARN_ON(&i915->drm, register_shrinker(&i915->mm.shrinker));
 
 	i915->mm.oom_notifier.notifier_call = i915_gem_shrinker_oom;
-	WARN_ON(register_oom_notifier(&i915->mm.oom_notifier));
+	drm_WARN_ON(&i915->drm, register_oom_notifier(&i915->mm.oom_notifier));
 
 	i915->mm.vmap_notifier.notifier_call = i915_gem_shrinker_vmap;
-	WARN_ON(register_vmap_purge_notifier(&i915->mm.vmap_notifier));
+	drm_WARN_ON(&i915->drm,
+		    register_vmap_purge_notifier(&i915->mm.vmap_notifier));
 }
 
 void i915_gem_driver_unregister__shrinker(struct drm_i915_private *i915)
 {
-	WARN_ON(unregister_vmap_purge_notifier(&i915->mm.vmap_notifier));
-	WARN_ON(unregister_oom_notifier(&i915->mm.oom_notifier));
+	drm_WARN_ON(&i915->drm,
+		    unregister_vmap_purge_notifier(&i915->mm.vmap_notifier));
+	drm_WARN_ON(&i915->drm,
+		    unregister_oom_notifier(&i915->mm.oom_notifier));
 	unregister_shrinker(&i915->mm.shrinker);
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 451f3078d60d..62320ae5e646 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -181,14 +181,16 @@ static void g4x_get_stolen_reserved(struct drm_i915_private *i915,
 	 * Whether ILK really reuses the ELK register for this is unclear.
 	 * Let's see if we catch anyone with this supposedly enabled on ILK.
 	 */
-	WARN(IS_GEN(i915, 5), "ILK stolen reserved found? 0x%08x\n",
-	     reg_val);
+	drm_WARN(&i915->drm, IS_GEN(i915, 5),
+		 "ILK stolen reserved found? 0x%08x\n",
+		 reg_val);
 
 	if (!(reg_val & G4X_STOLEN_RESERVED_ADDR2_MASK))
 		return;
 
 	*base = (reg_val & G4X_STOLEN_RESERVED_ADDR2_MASK) << 16;
-	WARN_ON((reg_val & G4X_STOLEN_RESERVED_ADDR1_MASK) < *base);
+	drm_WARN_ON(&i915->drm,
+		    (reg_val & G4X_STOLEN_RESERVED_ADDR1_MASK) < *base);
 
 	*size = stolen_top - *base;
 }
@@ -694,9 +696,10 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 			 &stolen_offset, &gtt_offset, &size);
 
 	/* KISS and expect everything to be page-aligned */
-	if (WARN_ON(size == 0) ||
-	    WARN_ON(!IS_ALIGNED(size, I915_GTT_PAGE_SIZE)) ||
-	    WARN_ON(!IS_ALIGNED(stolen_offset, I915_GTT_MIN_ALIGNMENT)))
+	if (drm_WARN_ON(&i915->drm, size == 0) ||
+	    drm_WARN_ON(&i915->drm, !IS_ALIGNED(size, I915_GTT_PAGE_SIZE)) ||
+	    drm_WARN_ON(&i915->drm,
+			!IS_ALIGNED(stolen_offset, I915_GTT_MIN_ALIGNMENT)))
 		return ERR_PTR(-EINVAL);
 
 	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index f451ef376548..1d40cba90c1b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -432,9 +432,9 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 	unsigned int i;
 	int err;
 
-	WARN_ON(engine_mask == 0);
-	WARN_ON(engine_mask &
-		GENMASK(BITS_PER_TYPE(mask) - 1, I915_NUM_ENGINES));
+	drm_WARN_ON(&i915->drm, engine_mask == 0);
+	drm_WARN_ON(&i915->drm, engine_mask &
+		    GENMASK(BITS_PER_TYPE(mask) - 1, I915_NUM_ENGINES));
 
 	if (i915_inject_probe_failure(i915))
 		return -ENODEV;
@@ -455,7 +455,7 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 	 * are added to the driver by a warning and disabling the forgotten
 	 * engines.
 	 */
-	if (WARN_ON(mask != engine_mask))
+	if (drm_WARN_ON(&i915->drm, mask != engine_mask))
 		device_info->engine_mask = mask;
 
 	RUNTIME_INFO(i915)->num_engines = hweight32(mask);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 9e7f12bef828..848decee9066 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -278,7 +278,8 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 			}
 		}
 
-		if (WARN(errors, "Invalid UABI engine mapping found"))
+		if (drm_WARN(&i915->drm, errors,
+			     "Invalid UABI engine mapping found"))
 			i915->uabi_engines = RB_ROOT;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 16acdc5d6734..45d8e0019a8e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -448,9 +448,9 @@ void gtt_write_workarounds(struct intel_gt *gt)
 		intel_uncore_write(uncore,
 				   HSW_GTT_CACHE_EN,
 				   can_use_gtt_cache ? GTT_CACHE_EN_ALL : 0);
-		WARN_ON_ONCE(can_use_gtt_cache &&
-			     intel_uncore_read(uncore,
-					       HSW_GTT_CACHE_EN) == 0);
+		drm_WARN_ON_ONCE(&i915->drm, can_use_gtt_cache &&
+				 intel_uncore_read(uncore,
+						   HSW_GTT_CACHE_EN) == 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index eeef90b55c64..0afc1eb3c20f 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -300,8 +300,8 @@ static bool get_mocs_settings(const struct drm_i915_private *i915,
 		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
 		table->table = broxton_mocs_table;
 	} else {
-		WARN_ONCE(INTEL_GEN(i915) >= 9,
-			  "Platform that should have a MOCS table does not.\n");
+		drm_WARN_ONCE(&i915->drm, INTEL_GEN(i915) >= 9,
+			      "Platform that should have a MOCS table does not.\n");
 		return false;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 9e303c29d6e3..46e48c5b1b58 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -713,7 +713,7 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
 	 */
 	i = (i915_mmio_reg_offset(reg) -
 	     i915_mmio_reg_offset(GEN6_GT_GFX_RC6_LOCKED)) / sizeof(u32);
-	if (WARN_ON_ONCE(i >= ARRAY_SIZE(rc6->cur_residency)))
+	if (drm_WARN_ON_ONCE(&i915->drm, i >= ARRAY_SIZE(rc6->cur_residency)))
 		return 0;
 
 	fw_domains = intel_uncore_forcewake_for_reg(uncore, reg, FW_REG_READ);
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index bc44fe8e5ffa..7e2c6ac7d6b0 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -568,7 +568,8 @@ static void flush_cs_tlb(struct intel_engine_cs *engine)
 		return;
 
 	/* ring should be idle before issuing a sync flush*/
-	WARN_ON((ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
+	drm_WARN_ON(&dev_priv->drm,
+		    (ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
 
 	ENGINE_WRITE(engine, RING_INSTPM,
 		     _MASKED_BIT_ENABLE(INSTPM_TLB_INVALIDATE |
@@ -1787,8 +1788,8 @@ static void ring_release(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *dev_priv = engine->i915;
 
-	WARN_ON(INTEL_GEN(dev_priv) > 2 &&
-		(ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
+	drm_WARN_ON(&dev_priv->drm, INTEL_GEN(dev_priv) > 2 &&
+		    (ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
 
 	intel_engine_cleanup_common(engine);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index d2a3d935d186..c73b3aa27e10 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1026,7 +1026,8 @@ static bool chv_rps_enable(struct intel_rps *rps)
 	vlv_punit_put(i915);
 
 	/* RPS code assumes GPLL is used */
-	WARN_ONCE((val & GPLLENABLE) == 0, "GPLL not enabled\n");
+	drm_WARN_ONCE(&i915->drm, (val & GPLLENABLE) == 0,
+		      "GPLL not enabled\n");
 
 	DRM_DEBUG_DRIVER("GPLL enabled? %s\n", yesno(val & GPLLENABLE));
 	DRM_DEBUG_DRIVER("GPU status: 0x%08x\n", val);
@@ -1123,7 +1124,8 @@ static bool vlv_rps_enable(struct intel_rps *rps)
 	vlv_punit_put(i915);
 
 	/* RPS code assumes GPLL is used */
-	WARN_ONCE((val & GPLLENABLE) == 0, "GPLL not enabled\n");
+	drm_WARN_ONCE(&i915->drm, (val & GPLLENABLE) == 0,
+		      "GPLL not enabled\n");
 
 	DRM_DEBUG_DRIVER("GPLL enabled? %s\n", yesno(val & GPLLENABLE));
 	DRM_DEBUG_DRIVER("GPU status: 0x%08x\n", val);
@@ -1191,11 +1193,11 @@ void intel_rps_enable(struct intel_rps *rps)
 	if (!rps->enabled)
 		return;
 
-	WARN_ON(rps->max_freq < rps->min_freq);
-	WARN_ON(rps->idle_freq > rps->max_freq);
+	drm_WARN_ON(&i915->drm, rps->max_freq < rps->min_freq);
+	drm_WARN_ON(&i915->drm, rps->idle_freq > rps->max_freq);
 
-	WARN_ON(rps->efficient_freq < rps->min_freq);
-	WARN_ON(rps->efficient_freq > rps->max_freq);
+	drm_WARN_ON(&i915->drm, rps->efficient_freq < rps->min_freq);
+	drm_WARN_ON(&i915->drm, rps->efficient_freq > rps->max_freq);
 }
 
 static void gen6_rps_disable(struct intel_rps *rps)
@@ -1390,9 +1392,10 @@ static void chv_rps_init(struct intel_rps *rps)
 			BIT(VLV_IOSF_SB_NC) |
 			BIT(VLV_IOSF_SB_CCK));
 
-	WARN_ONCE((rps->max_freq | rps->efficient_freq | rps->rp1_freq |
-		   rps->min_freq) & 1,
-		  "Odd GPU freq values\n");
+	drm_WARN_ONCE(&i915->drm,
+		      (rps->max_freq | rps->efficient_freq | rps->rp1_freq |
+		       rps->min_freq) & 1,
+		      "Odd GPU freq values\n");
 }
 
 static void vlv_c0_read(struct intel_uncore *uncore, struct intel_rps_ei *ei)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 4e292d4bf7b9..5a7db279f702 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -827,7 +827,7 @@ wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
 		DRM_WARN("No common index found between subslice mask %x and L3 bank mask %x!\n",
 			 intel_sseu_get_subslices(sseu, slice), l3_en);
 		subslice = fls(l3_en);
-		WARN_ON(!subslice);
+		drm_WARN_ON(&i915->drm, !subslice);
 	}
 	subslice--;
 
diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 771420453f82..29eed8400647 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -134,11 +134,11 @@ void intel_vgpu_write_fence(struct intel_vgpu *vgpu,
 
 	assert_rpm_wakelock_held(&dev_priv->runtime_pm);
 
-	if (WARN_ON(fence >= vgpu_fence_sz(vgpu)))
+	if (drm_WARN_ON(&dev_priv->drm, fence >= vgpu_fence_sz(vgpu)))
 		return;
 
 	reg = vgpu->fence.regs[fence];
-	if (WARN_ON(!reg))
+	if (drm_WARN_ON(&dev_priv->drm, !reg))
 		return;
 
 	fence_reg_lo = FENCE_REG_GEN6_LO(reg->id);
@@ -167,7 +167,7 @@ static void free_vgpu_fence(struct intel_vgpu *vgpu)
 	struct i915_fence_reg *reg;
 	u32 i;
 
-	if (WARN_ON(!vgpu_fence_sz(vgpu)))
+	if (drm_WARN_ON(&dev_priv->drm, !vgpu_fence_sz(vgpu)))
 		return;
 
 	intel_runtime_pm_get(&dev_priv->runtime_pm);
diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 21a176cd8acc..73a2891114a4 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -1230,7 +1230,7 @@ static int gen8_decode_mi_display_flip(struct parser_exec_state *s,
 	dword2 = cmd_val(s, 2);
 
 	v = (dword0 & GENMASK(21, 19)) >> 19;
-	if (WARN_ON(v >= ARRAY_SIZE(gen8_plane_code)))
+	if (drm_WARN_ON(&dev_priv->drm, v >= ARRAY_SIZE(gen8_plane_code)))
 		return -EBADRQC;
 
 	info->pipe = gen8_plane_code[v].pipe;
@@ -1250,7 +1250,7 @@ static int gen8_decode_mi_display_flip(struct parser_exec_state *s,
 		info->stride_reg = SPRSTRIDE(info->pipe);
 		info->surf_reg = SPRSURF(info->pipe);
 	} else {
-		WARN_ON(1);
+		drm_WARN_ON(&dev_priv->drm, 1);
 		return -EBADRQC;
 	}
 	return 0;
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index e1c313da6c00..9a9329fb8d64 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -71,7 +71,8 @@ int pipe_is_enabled(struct intel_vgpu *vgpu, int pipe)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->dev_priv;
 
-	if (WARN_ON(pipe < PIPE_A || pipe >= I915_MAX_PIPES))
+	if (drm_WARN_ON(&dev_priv->drm,
+			pipe < PIPE_A || pipe >= I915_MAX_PIPES))
 		return -EINVAL;
 
 	if (vgpu_vreg_t(vgpu, PIPECONF(pipe)) & PIPECONF_ENABLE)
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 2477a1e5a166..b854bd243e11 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -67,11 +67,11 @@ static int vgpu_gem_get_pages(
 	u32 page_num;
 
 	fb_info = (struct intel_vgpu_fb_info *)obj->gvt_info;
-	if (WARN_ON(!fb_info))
+	if (drm_WARN_ON(&dev_priv->drm, !fb_info))
 		return -ENODEV;
 
 	vgpu = fb_info->obj->vgpu;
-	if (WARN_ON(!vgpu))
+	if (drm_WARN_ON(&dev_priv->drm, !vgpu))
 		return -ENODEV;
 
 	st = kmalloc(sizeof(*st), GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index 1fe6124918f1..97bf75890c7d 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -153,7 +153,7 @@ static int gmbus0_mmio_write(struct intel_vgpu *vgpu,
 		port = cnp_get_port_from_gmbus0(pin_select);
 	else
 		port = get_port_from_gmbus0(pin_select);
-	if (WARN_ON(port < 0))
+	if (drm_WARN_ON(&dev_priv->drm, port < 0))
 		return 0;
 
 	vgpu->display.i2c_edid.state = I2C_GMBUS;
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 8f37eefa0a02..d51684627f3d 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -267,7 +267,7 @@ void intel_gvt_clean_device(struct drm_i915_private *dev_priv)
 {
 	struct intel_gvt *gvt = to_gvt(dev_priv);
 
-	if (WARN_ON(!gvt))
+	if (drm_WARN_ON(&dev_priv->drm, !gvt))
 		return;
 
 	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
@@ -306,7 +306,7 @@ int intel_gvt_init_device(struct drm_i915_private *dev_priv)
 	struct intel_vgpu *vgpu;
 	int ret;
 
-	if (WARN_ON(dev_priv->gvt))
+	if (drm_WARN_ON(&dev_priv->drm, dev_priv->gvt))
 		return -EEXIST;
 
 	gvt = kzalloc(sizeof(struct intel_gvt), GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 6d28d72e6c7e..fbb46cc999b8 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -836,7 +836,7 @@ static int trigger_aux_channel_interrupt(struct intel_vgpu *vgpu,
 		 reg == i915_mmio_reg_offset(DP_AUX_CH_CTL(AUX_CH_D)))
 		event = AUX_CHANNEL_D;
 	else {
-		WARN_ON(true);
+		drm_WARN_ON(&dev_priv->drm, true);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index aaf15916d29a..a4a1de347af0 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -357,7 +357,7 @@ static void handle_tlb_pending_event(struct intel_vgpu *vgpu, int ring_id)
 	if (!regs)
 		return;
 
-	if (WARN_ON(ring_id >= cnt))
+	if (drm_WARN_ON(&dev_priv->drm, ring_id >= cnt))
 		return;
 
 	if (!test_and_clear_bit(ring_id, (void *)s->tlb_handle_pending))
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index f7385abdd74b..e9b42e962032 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1015,9 +1015,9 @@ bxt_get_dram_info(struct drm_i915_private *dev_priv)
 		bxt_get_dimm_info(&dimm, val);
 		type = bxt_get_dimm_type(val);
 
-		WARN_ON(type != INTEL_DRAM_UNKNOWN &&
-			dram_info->type != INTEL_DRAM_UNKNOWN &&
-			dram_info->type != type);
+		drm_WARN_ON(&dev_priv->drm, type != INTEL_DRAM_UNKNOWN &&
+			    dram_info->type != INTEL_DRAM_UNKNOWN &&
+			    dram_info->type != type);
 
 		DRM_DEBUG_KMS("CH%u DIMM size: %u GB, width: X%u, ranks: %u, type: %s\n",
 			      i - BXT_D_CR_DRP0_DUNIT_START,
@@ -1805,8 +1805,8 @@ int i915_suspend_switcheroo(struct drm_i915_private *i915, pm_message_t state)
 {
 	int error;
 
-	if (WARN_ON_ONCE(state.event != PM_EVENT_SUSPEND &&
-			 state.event != PM_EVENT_FREEZE))
+	if (drm_WARN_ON_ONCE(&i915->drm, state.event != PM_EVENT_SUSPEND &&
+			     state.event != PM_EVENT_FREEZE))
 		return -EINVAL;
 
 	if (i915->drm.switch_power_state == DRM_SWITCH_POWER_OFF)
@@ -2429,7 +2429,8 @@ static int vlv_suspend_complete(struct drm_i915_private *dev_priv)
 	vlv_wait_for_gt_wells(dev_priv, false);
 
 	mask = VLV_GTLC_RENDER_CTX_EXISTS | VLV_GTLC_MEDIA_CTX_EXISTS;
-	WARN_ON((I915_READ(VLV_GTLC_WAKE_CTRL) & mask) != mask);
+	drm_WARN_ON(&dev_priv->drm,
+		    (I915_READ(VLV_GTLC_WAKE_CTRL) & mask) != mask);
 
 	vlv_check_no_gt_access(dev_priv);
 
@@ -2495,7 +2496,7 @@ static int intel_runtime_suspend(struct device *kdev)
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	int ret = 0;
 
-	if (WARN_ON_ONCE(!HAS_RUNTIME_PM(dev_priv)))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !HAS_RUNTIME_PM(dev_priv)))
 		return -ENODEV;
 
 	DRM_DEBUG_KMS("Suspending device\n");
@@ -2580,12 +2581,12 @@ static int intel_runtime_resume(struct device *kdev)
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	int ret = 0;
 
-	if (WARN_ON_ONCE(!HAS_RUNTIME_PM(dev_priv)))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !HAS_RUNTIME_PM(dev_priv)))
 		return -ENODEV;
 
 	DRM_DEBUG_KMS("Resuming device\n");
 
-	WARN_ON_ONCE(atomic_read(&rpm->wakeref_count));
+	drm_WARN_ON_ONCE(&dev_priv->drm, atomic_read(&rpm->wakeref_count));
 	disable_rpm_wakeref_asserts(rpm);
 
 	intel_opregion_notify_adapter(dev_priv, PCI_D0);
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 94f993e4c12f..0a20083321a3 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1198,7 +1198,7 @@ void i915_gem_driver_release(struct drm_i915_private *dev_priv)
 
 	i915_gem_drain_freed_objects(dev_priv);
 
-	WARN_ON(!list_empty(&dev_priv->gem.contexts.list));
+	drm_WARN_ON(&dev_priv->drm, !list_empty(&dev_priv->gem.contexts.list));
 }
 
 static void i915_gem_init__mm(struct drm_i915_private *i915)
@@ -1226,7 +1226,7 @@ void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
 	i915_gem_drain_freed_objects(dev_priv);
 	GEM_BUG_ON(!llist_empty(&dev_priv->mm.free_list));
 	GEM_BUG_ON(atomic_read(&dev_priv->mm.free_count));
-	WARN_ON(dev_priv->mm.shrink_count);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->mm.shrink_count);
 }
 
 int i915_gem_freeze(struct drm_i915_private *dev_priv)
@@ -1266,7 +1266,8 @@ int i915_gem_freeze_late(struct drm_i915_private *i915)
 
 	list_for_each_entry(obj, &i915->mm.shrink_list, mm.link) {
 		i915_gem_object_lock(obj);
-		WARN_ON(i915_gem_object_set_to_cpu_domain(obj, true));
+		drm_WARN_ON(&i915->drm,
+			    i915_gem_object_set_to_cpu_domain(obj, true));
 		i915_gem_object_unlock(obj);
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 08c498ea4d0a..3aa1ddfdd69c 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -262,7 +262,7 @@ i915_hotplug_interrupt_update_locked(struct drm_i915_private *dev_priv,
 	u32 val;
 
 	lockdep_assert_held(&dev_priv->irq_lock);
-	WARN_ON(bits & ~mask);
+	drm_WARN_ON(&dev_priv->drm, bits & ~mask);
 
 	val = I915_READ(PORT_HOTPLUG_EN);
 	val &= ~mask;
@@ -305,9 +305,9 @@ void ilk_update_display_irq(struct drm_i915_private *dev_priv,
 
 	lockdep_assert_held(&dev_priv->irq_lock);
 
-	WARN_ON(enabled_irq_mask & ~interrupt_mask);
+	drm_WARN_ON(&dev_priv->drm, enabled_irq_mask & ~interrupt_mask);
 
-	if (WARN_ON(!intel_irqs_enabled(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm, !intel_irqs_enabled(dev_priv)))
 		return;
 
 	new_val = dev_priv->irq_mask;
@@ -336,9 +336,9 @@ static void bdw_update_port_irq(struct drm_i915_private *dev_priv,
 
 	lockdep_assert_held(&dev_priv->irq_lock);
 
-	WARN_ON(enabled_irq_mask & ~interrupt_mask);
+	drm_WARN_ON(&dev_priv->drm, enabled_irq_mask & ~interrupt_mask);
 
-	if (WARN_ON(!intel_irqs_enabled(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm, !intel_irqs_enabled(dev_priv)))
 		return;
 
 	old_val = I915_READ(GEN8_DE_PORT_IMR);
@@ -369,9 +369,9 @@ void bdw_update_pipe_irq(struct drm_i915_private *dev_priv,
 
 	lockdep_assert_held(&dev_priv->irq_lock);
 
-	WARN_ON(enabled_irq_mask & ~interrupt_mask);
+	drm_WARN_ON(&dev_priv->drm, enabled_irq_mask & ~interrupt_mask);
 
-	if (WARN_ON(!intel_irqs_enabled(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm, !intel_irqs_enabled(dev_priv)))
 		return;
 
 	new_val = dev_priv->de_irq_mask[pipe];
@@ -399,11 +399,11 @@ void ibx_display_interrupt_update(struct drm_i915_private *dev_priv,
 	sdeimr &= ~interrupt_mask;
 	sdeimr |= (~enabled_irq_mask & interrupt_mask);
 
-	WARN_ON(enabled_irq_mask & ~interrupt_mask);
+	drm_WARN_ON(&dev_priv->drm, enabled_irq_mask & ~interrupt_mask);
 
 	lockdep_assert_held(&dev_priv->irq_lock);
 
-	if (WARN_ON(!intel_irqs_enabled(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm, !intel_irqs_enabled(dev_priv)))
 		return;
 
 	I915_WRITE(SDEIMR, sdeimr);
@@ -425,13 +425,15 @@ u32 i915_pipestat_enable_mask(struct drm_i915_private *dev_priv,
 	 * On pipe A we don't support the PSR interrupt yet,
 	 * on pipe B and C the same bit MBZ.
 	 */
-	if (WARN_ON_ONCE(status_mask & PIPE_A_PSR_STATUS_VLV))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm,
+			     status_mask & PIPE_A_PSR_STATUS_VLV))
 		return 0;
 	/*
 	 * On pipe B and C we don't support the PSR interrupt yet, on pipe
 	 * A the same bit is for perf counters which we don't use either.
 	 */
-	if (WARN_ON_ONCE(status_mask & PIPE_B_PSR_STATUS_VLV))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm,
+			     status_mask & PIPE_B_PSR_STATUS_VLV))
 		return 0;
 
 	enable_mask &= ~(PIPE_FIFO_UNDERRUN_STATUS |
@@ -443,10 +445,11 @@ u32 i915_pipestat_enable_mask(struct drm_i915_private *dev_priv,
 		enable_mask |= SPRITE1_FLIP_DONE_INT_EN_VLV;
 
 out:
-	WARN_ONCE(enable_mask & ~PIPESTAT_INT_ENABLE_MASK ||
-		  status_mask & ~PIPESTAT_INT_STATUS_MASK,
-		  "pipe %c: enable_mask=0x%x, status_mask=0x%x\n",
-		  pipe_name(pipe), enable_mask, status_mask);
+	drm_WARN_ONCE(&dev_priv->drm,
+		      enable_mask & ~PIPESTAT_INT_ENABLE_MASK ||
+		      status_mask & ~PIPESTAT_INT_STATUS_MASK,
+		      "pipe %c: enable_mask=0x%x, status_mask=0x%x\n",
+		      pipe_name(pipe), enable_mask, status_mask);
 
 	return enable_mask;
 }
@@ -457,12 +460,12 @@ void i915_enable_pipestat(struct drm_i915_private *dev_priv,
 	i915_reg_t reg = PIPESTAT(pipe);
 	u32 enable_mask;
 
-	WARN_ONCE(status_mask & ~PIPESTAT_INT_STATUS_MASK,
-		  "pipe %c: status_mask=0x%x\n",
-		  pipe_name(pipe), status_mask);
+	drm_WARN_ONCE(&dev_priv->drm, status_mask & ~PIPESTAT_INT_STATUS_MASK,
+		      "pipe %c: status_mask=0x%x\n",
+		      pipe_name(pipe), status_mask);
 
 	lockdep_assert_held(&dev_priv->irq_lock);
-	WARN_ON(!intel_irqs_enabled(dev_priv));
+	drm_WARN_ON(&dev_priv->drm, !intel_irqs_enabled(dev_priv));
 
 	if ((dev_priv->pipestat_irq_mask[pipe] & status_mask) == status_mask)
 		return;
@@ -480,12 +483,12 @@ void i915_disable_pipestat(struct drm_i915_private *dev_priv,
 	i915_reg_t reg = PIPESTAT(pipe);
 	u32 enable_mask;
 
-	WARN_ONCE(status_mask & ~PIPESTAT_INT_STATUS_MASK,
-		  "pipe %c: status_mask=0x%x\n",
-		  pipe_name(pipe), status_mask);
+	drm_WARN_ONCE(&dev_priv->drm, status_mask & ~PIPESTAT_INT_STATUS_MASK,
+		      "pipe %c: status_mask=0x%x\n",
+		      pipe_name(pipe), status_mask);
 
 	lockdep_assert_held(&dev_priv->irq_lock);
-	WARN_ON(!intel_irqs_enabled(dev_priv));
+	drm_WARN_ON(&dev_priv->drm, !intel_irqs_enabled(dev_priv));
 
 	if ((dev_priv->pipestat_irq_mask[pipe] & status_mask) == 0)
 		return;
@@ -918,7 +921,7 @@ static void ivb_parity_work(struct work_struct *work)
 	mutex_lock(&dev_priv->drm.struct_mutex);
 
 	/* If we've screwed up tracking, just let the interrupt fire again */
-	if (WARN_ON(!dev_priv->l3_parity.which_slice))
+	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
 		goto out;
 
 	misccpctl = I915_READ(GEN7_MISCCPCTL);
@@ -929,7 +932,8 @@ static void ivb_parity_work(struct work_struct *work)
 		i915_reg_t reg;
 
 		slice--;
-		if (WARN_ON_ONCE(slice >= NUM_L3_SLICES(dev_priv)))
+		if (drm_WARN_ON_ONCE(&dev_priv->drm,
+				     slice >= NUM_L3_SLICES(dev_priv)))
 			break;
 
 		dev_priv->l3_parity.which_slice &= ~(1<<slice);
@@ -966,7 +970,7 @@ static void ivb_parity_work(struct work_struct *work)
 	I915_WRITE(GEN7_MISCCPCTL, misccpctl);
 
 out:
-	WARN_ON(dev_priv->l3_parity.which_slice);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->l3_parity.which_slice);
 	spin_lock_irq(&gt->irq_lock);
 	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
 	spin_unlock_irq(&gt->irq_lock);
@@ -1463,9 +1467,9 @@ static u32 i9xx_hpd_irq_ack(struct drm_i915_private *dev_priv)
 		I915_WRITE(PORT_HOTPLUG_STAT, hotplug_status);
 	}
 
-	WARN_ONCE(1,
-		  "PORT_HOTPLUG_STAT did not clear (0x%08x)\n",
-		  I915_READ(PORT_HOTPLUG_STAT));
+	drm_WARN_ONCE(&dev_priv->drm, 1,
+		      "PORT_HOTPLUG_STAT did not clear (0x%08x)\n",
+		      I915_READ(PORT_HOTPLUG_STAT));
 
 	return hotplug_status;
 }
@@ -1844,8 +1848,9 @@ static void icp_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
 		tc_port_hotplug_long_detect = icp_tc_port_hotplug_long_detect;
 		pins = hpd_icp;
 	} else {
-		WARN(!HAS_PCH_ICP(dev_priv),
-		     "Unrecognized PCH type 0x%x\n", INTEL_PCH_TYPE(dev_priv));
+		drm_WARN(&dev_priv->drm, !HAS_PCH_ICP(dev_priv),
+			 "Unrecognized PCH type 0x%x\n",
+			 INTEL_PCH_TYPE(dev_priv));
 
 		ddi_hotplug_trigger = pch_iir & SDE_DDI_MASK_ICP;
 		tc_hotplug_trigger = pch_iir & SDE_TC_MASK_ICP;
@@ -2686,7 +2691,7 @@ static void ibx_irq_pre_postinstall(struct drm_i915_private *dev_priv)
 	if (HAS_PCH_NOP(dev_priv))
 		return;
 
-	WARN_ON(I915_READ(SDEIER) != 0);
+	drm_WARN_ON(&dev_priv->drm, I915_READ(SDEIER) != 0);
 	I915_WRITE(SDEIER, 0xffffffff);
 	POSTING_READ(SDEIER);
 }
@@ -2733,7 +2738,7 @@ static void vlv_display_irq_postinstall(struct drm_i915_private *dev_priv)
 		enable_mask |= I915_DISPLAY_PIPE_C_EVENT_INTERRUPT |
 			I915_LPE_PIPE_C_INTERRUPT;
 
-	WARN_ON(dev_priv->irq_mask != ~0u);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->irq_mask != ~0u);
 
 	dev_priv->irq_mask = ~enable_mask;
 
@@ -3418,7 +3423,7 @@ static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
 {
 	u32 mask = SDE_GMBUS_ICP;
 
-	WARN_ON(I915_READ(SDEIER) != 0);
+	drm_WARN_ON(&dev_priv->drm, I915_READ(SDEIER) != 0);
 	I915_WRITE(SDEIER, 0xffffffff);
 	POSTING_READ(SDEIER);
 
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index f3ef6700a5f2..9f7f09ce1084 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -448,7 +448,7 @@ static void engine_event_destroy(struct perf_event *event)
 	engine = intel_engine_lookup_user(i915,
 					  engine_event_class(event),
 					  engine_event_instance(event));
-	if (WARN_ON_ONCE(!engine))
+	if (drm_WARN_ON_ONCE(&i915->drm, !engine))
 		return;
 
 	if (engine_event_sample(event) == I915_SAMPLE_BUSY &&
@@ -584,7 +584,7 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
 						  engine_event_class(event),
 						  engine_event_instance(event));
 
-		if (WARN_ON_ONCE(!engine)) {
+		if (drm_WARN_ON_ONCE(&i915->drm, !engine)) {
 			/* Do nothing */
 		} else if (sample == I915_SAMPLE_BUSY &&
 			   intel_engine_supports_stats(engine)) {
@@ -1169,7 +1169,7 @@ void i915_pmu_unregister(struct drm_i915_private *i915)
 	if (!pmu->base.event_init)
 		return;
 
-	WARN_ON(pmu->enable);
+	drm_WARN_ON(&i915->drm, pmu->enable);
 
 	hrtimer_cancel(&pmu->timer);
 
diff --git a/drivers/gpu/drm/i915/intel_csr.c b/drivers/gpu/drm/i915/intel_csr.c
index 09870a31b4f0..801181ad60ce 100644
--- a/drivers/gpu/drm/i915/intel_csr.c
+++ b/drivers/gpu/drm/i915/intel_csr.c
@@ -607,7 +607,7 @@ static void parse_csr_fw(struct drm_i915_private *dev_priv,
 
 static void intel_csr_runtime_pm_get(struct drm_i915_private *dev_priv)
 {
-	WARN_ON(dev_priv->csr.wakeref);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->csr.wakeref);
 	dev_priv->csr.wakeref =
 		intel_display_power_get(dev_priv, POWER_DOMAIN_INIT);
 }
@@ -783,7 +783,7 @@ void intel_csr_ucode_fini(struct drm_i915_private *dev_priv)
 		return;
 
 	intel_csr_ucode_suspend(dev_priv);
-	WARN_ON(dev_priv->csr.wakeref);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->csr.wakeref);
 
 	kfree(dev_priv->csr.dmc_payload);
 }
diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/intel_pch.c
index 4ed60e1f01db..344c65d77054 100644
--- a/drivers/gpu/drm/i915/intel_pch.c
+++ b/drivers/gpu/drm/i915/intel_pch.c
@@ -13,91 +13,108 @@ intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
 	switch (id) {
 	case INTEL_PCH_IBX_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found Ibex Peak PCH\n");
-		WARN_ON(!IS_GEN(dev_priv, 5));
+		drm_WARN_ON(&dev_priv->drm, !IS_GEN(dev_priv, 5));
 		return PCH_IBX;
 	case INTEL_PCH_CPT_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found CougarPoint PCH\n");
-		WARN_ON(!IS_GEN(dev_priv, 6) && !IS_IVYBRIDGE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_GEN(dev_priv, 6) && !IS_IVYBRIDGE(dev_priv));
 		return PCH_CPT;
 	case INTEL_PCH_PPT_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found PantherPoint PCH\n");
-		WARN_ON(!IS_GEN(dev_priv, 6) && !IS_IVYBRIDGE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_GEN(dev_priv, 6) && !IS_IVYBRIDGE(dev_priv));
 		/* PantherPoint is CPT compatible */
 		return PCH_CPT;
 	case INTEL_PCH_LPT_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found LynxPoint PCH\n");
-		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
-		WARN_ON(IS_HSW_ULT(dev_priv) || IS_BDW_ULT(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    IS_HSW_ULT(dev_priv) || IS_BDW_ULT(dev_priv));
 		return PCH_LPT;
 	case INTEL_PCH_LPT_LP_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found LynxPoint LP PCH\n");
-		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
-		WARN_ON(!IS_HSW_ULT(dev_priv) && !IS_BDW_ULT(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_HSW_ULT(dev_priv) && !IS_BDW_ULT(dev_priv));
 		return PCH_LPT;
 	case INTEL_PCH_WPT_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found WildcatPoint PCH\n");
-		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
-		WARN_ON(IS_HSW_ULT(dev_priv) || IS_BDW_ULT(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    IS_HSW_ULT(dev_priv) || IS_BDW_ULT(dev_priv));
 		/* WildcatPoint is LPT compatible */
 		return PCH_LPT;
 	case INTEL_PCH_WPT_LP_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found WildcatPoint LP PCH\n");
-		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
-		WARN_ON(!IS_HSW_ULT(dev_priv) && !IS_BDW_ULT(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_HSW_ULT(dev_priv) && !IS_BDW_ULT(dev_priv));
 		/* WildcatPoint is LPT compatible */
 		return PCH_LPT;
 	case INTEL_PCH_SPT_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found SunrisePoint PCH\n");
-		WARN_ON(!IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv));
 		return PCH_SPT;
 	case INTEL_PCH_SPT_LP_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found SunrisePoint LP PCH\n");
-		WARN_ON(!IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
-			!IS_COFFEELAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
+			    !IS_COFFEELAKE(dev_priv));
 		return PCH_SPT;
 	case INTEL_PCH_KBP_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found Kaby Lake PCH (KBP)\n");
-		WARN_ON(!IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
-			!IS_COFFEELAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
+			    !IS_COFFEELAKE(dev_priv));
 		/* KBP is SPT compatible */
 		return PCH_SPT;
 	case INTEL_PCH_CNP_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found Cannon Lake PCH (CNP)\n");
-		WARN_ON(!IS_CANNONLAKE(dev_priv) && !IS_COFFEELAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_CANNONLAKE(dev_priv) &&
+			    !IS_COFFEELAKE(dev_priv));
 		return PCH_CNP;
 	case INTEL_PCH_CNP_LP_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm,
 			    "Found Cannon Lake LP PCH (CNP-LP)\n");
-		WARN_ON(!IS_CANNONLAKE(dev_priv) && !IS_COFFEELAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm,
+			    !IS_CANNONLAKE(dev_priv) &&
+			    !IS_COFFEELAKE(dev_priv));
 		return PCH_CNP;
 	case INTEL_PCH_CMP_DEVICE_ID_TYPE:
 	case INTEL_PCH_CMP2_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found Comet Lake PCH (CMP)\n");
-		WARN_ON(!IS_COFFEELAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_COFFEELAKE(dev_priv));
 		/* CometPoint is CNP Compatible */
 		return PCH_CNP;
 	case INTEL_PCH_CMP_V_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found Comet Lake V PCH (CMP-V)\n");
-		WARN_ON(!IS_COFFEELAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_COFFEELAKE(dev_priv));
 		/* Comet Lake V PCH is based on KBP, which is SPT compatible */
 		return PCH_SPT;
 	case INTEL_PCH_ICP_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found Ice Lake PCH\n");
-		WARN_ON(!IS_ICELAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_ICELAKE(dev_priv));
 		return PCH_ICP;
 	case INTEL_PCH_MCC_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found Mule Creek Canyon PCH\n");
-		WARN_ON(!IS_ELKHARTLAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_ELKHARTLAKE(dev_priv));
 		return PCH_MCC;
 	case INTEL_PCH_TGP_DEVICE_ID_TYPE:
 	case INTEL_PCH_TGP2_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found Tiger Lake LP PCH\n");
-		WARN_ON(!IS_TIGERLAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_TIGERLAKE(dev_priv));
 		return PCH_TGP;
 	case INTEL_PCH_JSP_DEVICE_ID_TYPE:
 	case INTEL_PCH_JSP2_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found Jasper Lake PCH\n");
-		WARN_ON(!IS_ELKHARTLAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_ELKHARTLAKE(dev_priv));
 		return PCH_JSP;
 	default:
 		return PCH_NONE;
@@ -188,7 +205,8 @@ void intel_detect_pch(struct drm_i915_private *dev_priv)
 			pch_type = intel_pch_type(dev_priv, id);
 
 			/* Sanity check virtual PCH id */
-			if (WARN_ON(id && pch_type == PCH_NONE))
+			if (drm_WARN_ON(&dev_priv->drm,
+					id && pch_type == PCH_NONE))
 				id = 0;
 
 			dev_priv->pch_type = pch_type;
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index bd2d30ecc030..bd0272a8debe 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -1977,8 +1977,8 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 	sprite1_start = fifo_state->plane[PLANE_SPRITE0] + sprite0_start;
 	fifo_size = fifo_state->plane[PLANE_SPRITE1] + sprite1_start;
 
-	WARN_ON(fifo_state->plane[PLANE_CURSOR] != 63);
-	WARN_ON(fifo_size != 511);
+	drm_WARN_ON(&dev_priv->drm, fifo_state->plane[PLANE_CURSOR] != 63);
+	drm_WARN_ON(&dev_priv->drm, fifo_size != 511);
 
 	trace_vlv_fifo_size(crtc, sprite0_start, sprite1_start, fifo_size);
 
@@ -3417,7 +3417,7 @@ static void ilk_compute_wm_results(struct drm_i915_private *dev_priv,
 		 * level is disabled. Doing otherwise could cause underruns.
 		 */
 		if (INTEL_GEN(dev_priv) <= 6 && r->spr_val) {
-			WARN_ON(wm_lp != 1);
+			drm_WARN_ON(&dev_priv->drm, wm_lp != 1);
 			results->wm_lp_spr[wm_lp - 1] = WM1S_LP_EN | r->spr_val;
 		} else
 			results->wm_lp_spr[wm_lp - 1] = r->spr_val;
@@ -3429,7 +3429,7 @@ static void ilk_compute_wm_results(struct drm_i915_private *dev_priv,
 		const struct intel_wm_level *r =
 			&intel_crtc->wm.active.ilk.wm[0];
 
-		if (WARN_ON(!r->enable))
+		if (drm_WARN_ON(&dev_priv->drm, !r->enable))
 			continue;
 
 		results->wm_linetime[pipe] = intel_crtc->wm.active.ilk.linetime;
@@ -3874,7 +3874,7 @@ static u16 intel_get_ddb_size(struct drm_i915_private *dev_priv,
 	u64 total_data_bw;
 	u16 ddb_size = INTEL_INFO(dev_priv)->ddb_size;
 
-	WARN_ON(ddb_size == 0);
+	drm_WARN_ON(&dev_priv->drm, ddb_size == 0);
 
 	if (INTEL_GEN(dev_priv) < 11)
 		return ddb_size - 4; /* 4 blocks for bypass path allocation */
@@ -3917,7 +3917,7 @@ skl_ddb_get_pipe_allocation_limits(struct drm_i915_private *dev_priv,
 	u16 ddb_size;
 	u32 i;
 
-	if (WARN_ON(!state) || !crtc_state->hw.active) {
+	if (drm_WARN_ON(&dev_priv->drm, !state) || !crtc_state->hw.active) {
 		alloc->start = 0;
 		alloc->end = 0;
 		*num_active = hweight8(dev_priv->active_pipes);
@@ -4002,7 +4002,7 @@ skl_cursor_allocation(const struct intel_crtc_state *crtc_state,
 				    DRM_FORMAT_MOD_LINEAR,
 				    DRM_MODE_ROTATE_0,
 				    crtc_state->pixel_rate, &wp, 0);
-	WARN_ON(ret);
+	drm_WARN_ON(&dev_priv->drm, ret);
 
 	for (level = 0; level <= max_level; level++) {
 		skl_compute_plane_wm(crtc_state, level, &wp, &wm, &wm);
@@ -4294,7 +4294,7 @@ skl_allocate_pipe_ddb(struct intel_crtc_state *crtc_state,
 	memset(crtc_state->wm.skl.plane_ddb_y, 0, sizeof(crtc_state->wm.skl.plane_ddb_y));
 	memset(crtc_state->wm.skl.plane_ddb_uv, 0, sizeof(crtc_state->wm.skl.plane_ddb_uv));
 
-	if (WARN_ON(!state))
+	if (drm_WARN_ON(&dev_priv->drm, !state))
 		return 0;
 
 	if (!crtc_state->hw.active) {
@@ -4341,7 +4341,8 @@ skl_allocate_pipe_ddb(struct intel_crtc_state *crtc_state,
 
 			if (plane_id == PLANE_CURSOR) {
 				if (wm->wm[level].min_ddb_alloc > total[PLANE_CURSOR]) {
-					WARN_ON(wm->wm[level].min_ddb_alloc != U16_MAX);
+					drm_WARN_ON(&dev_priv->drm,
+						    wm->wm[level].min_ddb_alloc != U16_MAX);
 					blocks = U32_MAX;
 					break;
 				}
@@ -4406,7 +4407,7 @@ skl_allocate_pipe_ddb(struct intel_crtc_state *crtc_state,
 		alloc_size -= extra;
 		total_data_rate -= rate;
 	}
-	WARN_ON(alloc_size != 0 || total_data_rate != 0);
+	drm_WARN_ON(&dev_priv->drm, alloc_size != 0 || total_data_rate != 0);
 
 	/* Set the actual DDB start/end points for each plane */
 	start = alloc->start;
@@ -4420,7 +4421,8 @@ skl_allocate_pipe_ddb(struct intel_crtc_state *crtc_state,
 			continue;
 
 		/* Gen11+ uses a separate plane for UV watermarks */
-		WARN_ON(INTEL_GEN(dev_priv) >= 11 && uv_total[plane_id]);
+		drm_WARN_ON(&dev_priv->drm,
+			    INTEL_GEN(dev_priv) >= 11 && uv_total[plane_id]);
 
 		/* Leave disabled planes at (0,0) */
 		if (total[plane_id]) {
diff --git a/drivers/gpu/drm/i915/intel_sideband.c b/drivers/gpu/drm/i915/intel_sideband.c
index cbfb7171d62d..6de683ec884c 100644
--- a/drivers/gpu/drm/i915/intel_sideband.c
+++ b/drivers/gpu/drm/i915/intel_sideband.c
@@ -241,8 +241,9 @@ u32 vlv_dpio_read(struct drm_i915_private *i915, enum pipe pipe, int reg)
 	 * FIXME: There might be some registers where all 1's is a valid value,
 	 * so ideally we should check the register offset instead...
 	 */
-	WARN(val == 0xffffffff, "DPIO read pipe %c reg 0x%x == 0x%x\n",
-	     pipe_name(pipe), reg, val);
+	drm_WARN(&i915->drm, val == 0xffffffff,
+		 "DPIO read pipe %c reg 0x%x == 0x%x\n",
+		 pipe_name(pipe), reg, val);
 
 	return val;
 }
@@ -525,7 +526,7 @@ int skl_pcode_request(struct drm_i915_private *i915, u32 mbox, u32 request,
 	 */
 	drm_dbg_kms(&i915->drm,
 		    "PCODE timeout, retrying with preemption disabled\n");
-	WARN_ON_ONCE(timeout_base_ms > 3);
+	drm_WARN_ON_ONCE(&i915->drm, timeout_base_ms > 3);
 	preempt_disable();
 	ret = wait_for_atomic(COND, 50);
 	preempt_enable();
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 5f2cf6f43b8b..7a5a1461b9c0 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1613,7 +1613,7 @@ static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
 #undef fw_domain_init
 
 	/* All future platforms are expected to require complex power gating */
-	WARN_ON(!ret && uncore->fw_domains == 0);
+	drm_WARN_ON(&i915->drm, !ret && uncore->fw_domains == 0);
 
 out:
 	if (ret)
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
