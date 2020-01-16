Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61C14050A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436616F429;
	Fri, 17 Jan 2020 08:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9426ECF4;
 Thu, 16 Jan 2020 13:10:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id p9so3712692wmc.2;
 Thu, 16 Jan 2020 05:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ojHCdletYXhWh+kTU9ZG+ChvhO2z/qjn8aMK0OJdOIA=;
 b=XCS3+qt5O/dheBksMM1i0XcWlmUd9nBrrQvgAifakOuuEGNRn1RqlpbdCXa3Lf/X0l
 hGmrRzWnkid+ERzXvUuef9xcdfHe66i4Q6MKU1rNdzhZGQD+9yLDCQkUlco/ROouA5x9
 22fxMZpuOzKz7/FNPSZSP3iU0dFy1qc16zUh3hoAiuztiHEvVO7tBQYwYIgCc41GS+j5
 92kWfdtqlkBMRDrcZc8SUQW9rbLN4WwdaMufzdPxAuOe/I+3NsCC2fPIzTdaMz6eMvsz
 PjuemryRDMQt2O088gM7bNUBVcvXFk1suilRim67TVXd6VlVEhdblI0gi+kSArHT8xPY
 zM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojHCdletYXhWh+kTU9ZG+ChvhO2z/qjn8aMK0OJdOIA=;
 b=rKnQF7hIPIg7AkktWPvtv0fnFcA+9D7iyXEtysWkFPgU7FWd7bHtabCg61P1adTo8z
 pid09hkPvntwwqeZUXA/kwD3YCl3jObmRKHgGthvnO/f67O4ZANRkn08MmPe7dPKTF2K
 RPc8ZJq46BGSlFvHHnfhp9ju9e5gecLzCBd5aMMyGhyvnZLA5z78VNxj1a00W3z+38DK
 wU1qfRIQ6K66HeJK1V2RU6SZEBBp5QbcBKlXfJjo9gldO4jRphYTsF6lU+8uDTRrjVkd
 WZrwIsmpioqufpRNEnd8plJesnBEm4Am38FAnUFTpOEP9tNNdssX3Bw8ncNaJIozRvz/
 g+Nw==
X-Gm-Message-State: APjAAAXWdwfjsnG0MVdfVcnrhCbnOKB+tYMkZjG3ISTizblHscDt/2EK
 3KrBvePv/AmAsSyc9AvW8Bw=
X-Google-Smtp-Source: APXvYqxfF9NelYrTBULszkTL3YK7Iz23NgwaFkhy9MzmAbwz9E5w/yXWPIapZ92ux6tczAqphFc/SA==
X-Received: by 2002:a05:600c:294:: with SMTP id
 20mr5912100wmk.97.1579180209080; 
 Thu, 16 Jan 2020 05:10:09 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id k8sm29087196wrl.3.2020.01.16.05.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:10:08 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 4/4] drm/i915/display: convert to new logging macros part 4.
Date: Thu, 16 Jan 2020 16:09:47 +0300
Message-Id: <20200116130947.15464-5-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116130947.15464-1-wambui.karugax@gmail.com>
References: <20200116130947.15464-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:13:08 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch provides the final conversion of most of the printk based
logging macros instances in drm/i915/display/intel_display.c to the
struct drm_device based logging macros. The struct drm_i915_private
device is extracted from various intel types and used in the new logging
macros.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 167 +++++++++++--------
 1 file changed, 102 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 58d5333d3ad9..b871cdd9f1cf 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -3890,6 +3890,8 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 
 static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
 {
+	struct drm_i915_private *i915 =
+		to_i915(plane_state->uapi.plane->dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 	int uv_plane = 1;
@@ -3907,8 +3909,9 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
 
 	/* FIXME not quite sure how/if these apply to the chroma plane */
 	if (w > max_width || h > max_height) {
-		DRM_DEBUG_KMS("CbCr source size %dx%d too big (limit %dx%d)\n",
-			      w, h, max_width, max_height);
+		drm_dbg_kms(&i915->drm,
+			    "CbCr source size %dx%d too big (limit %dx%d)\n",
+			    w, h, max_width, max_height);
 		return -EINVAL;
 	}
 
@@ -3937,7 +3940,8 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
 
 		if (x != plane_state->color_plane[ccs_plane].x ||
 		    y != plane_state->color_plane[ccs_plane].y) {
-			DRM_DEBUG_KMS("Unable to find suitable display surface offset due to CCS\n");
+			drm_dbg_kms(&i915->drm,
+				    "Unable to find suitable display surface offset due to CCS\n");
 			return -EINVAL;
 		}
 	}
@@ -7621,10 +7625,10 @@ static void intel_connector_verify_state(struct intel_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
-		      connector->base.base.id,
-		      connector->base.name);
+	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s]\n",
+		    connector->base.base.id, connector->base.name);
 
 	if (connector->get_hw_state(connector)) {
 		struct intel_encoder *encoder = connector->encoder;
@@ -7745,6 +7749,7 @@ static int ilk_fdi_compute_config(struct intel_crtc *intel_crtc,
 				  struct intel_crtc_state *pipe_config)
 {
 	struct drm_device *dev = intel_crtc->base.dev;
+	struct drm_i915_private *i915 = to_i915(dev);
 	const struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	int lane, link_bw, fdi_dotclock, ret;
 	bool needs_recompute = false;
@@ -7757,7 +7762,7 @@ static int ilk_fdi_compute_config(struct intel_crtc *intel_crtc,
 	 * Hence the bw of each lane in terms of the mode signal
 	 * is:
 	 */
-	link_bw = intel_fdi_link_freq(to_i915(dev), pipe_config);
+	link_bw = intel_fdi_link_freq(i915, pipe_config);
 
 	fdi_dotclock = adjusted_mode->crtc_clock;
 
@@ -7775,8 +7780,9 @@ static int ilk_fdi_compute_config(struct intel_crtc *intel_crtc,
 
 	if (ret == -EINVAL && pipe_config->pipe_bpp > 6*3) {
 		pipe_config->pipe_bpp -= 2*3;
-		DRM_DEBUG_KMS("fdi link bw constraint, reducing pipe bpp to %i\n",
-			      pipe_config->pipe_bpp);
+		drm_dbg_kms(&i915->drm,
+			    "fdi link bw constraint, reducing pipe bpp to %i\n",
+			    pipe_config->pipe_bpp);
 		needs_recompute = true;
 		pipe_config->bw_constrained = true;
 
@@ -8195,6 +8201,7 @@ static void intel_cpu_transcoder_set_m_n(const struct intel_crtc_state *crtc_sta
 void intel_dp_set_m_n(const struct intel_crtc_state *crtc_state, enum link_m_n_set m_n)
 {
 	const struct intel_link_m_n *dp_m_n, *dp_m2_n2 = NULL;
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
 
 	if (m_n == M1_N1) {
 		dp_m_n = &crtc_state->dp_m_n;
@@ -8207,7 +8214,7 @@ void intel_dp_set_m_n(const struct intel_crtc_state *crtc_state, enum link_m_n_s
 		 */
 		dp_m_n = &crtc_state->dp_m2_n2;
 	} else {
-		DRM_ERROR("Unsupported divider value\n");
+		drm_err(&i915->drm, "Unsupported divider value\n");
 		return;
 	}
 
@@ -9031,6 +9038,7 @@ static int chv_crtc_compute_clock(struct intel_crtc *crtc,
 {
 	int refclk = 100000;
 	const struct intel_limit *limit = &intel_limits_chv;
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
 
 	memset(&crtc_state->dpll_hw_state, 0,
 	       sizeof(crtc_state->dpll_hw_state));
@@ -9038,7 +9046,7 @@ static int chv_crtc_compute_clock(struct intel_crtc *crtc,
 	if (!crtc_state->clock_set &&
 	    !chv_find_best_dpll(limit, crtc_state, crtc_state->port_clock,
 				refclk, NULL, &crtc_state->dpll)) {
-		DRM_ERROR("Couldn't find PLL settings for mode!\n");
+		drm_err(&i915->drm, "Couldn't find PLL settings for mode!\n");
 		return -EINVAL;
 	}
 
@@ -9052,6 +9060,7 @@ static int vlv_crtc_compute_clock(struct intel_crtc *crtc,
 {
 	int refclk = 100000;
 	const struct intel_limit *limit = &intel_limits_vlv;
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
 
 	memset(&crtc_state->dpll_hw_state, 0,
 	       sizeof(crtc_state->dpll_hw_state));
@@ -9059,7 +9068,7 @@ static int vlv_crtc_compute_clock(struct intel_crtc *crtc,
 	if (!crtc_state->clock_set &&
 	    !vlv_find_best_dpll(limit, crtc_state, crtc_state->port_clock,
 				refclk, NULL, &crtc_state->dpll)) {
-		DRM_ERROR("Couldn't find PLL settings for mode!\n");
+		drm_err(&i915->drm, "Couldn't find PLL settings for mode!\n");
 		return -EINVAL;
 	}
 
@@ -11251,10 +11260,11 @@ static int intel_check_cursor(struct intel_crtc_state *crtc_state,
 			      struct intel_plane_state *plane_state)
 {
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
 	int ret;
 
 	if (fb && fb->modifier != DRM_FORMAT_MOD_LINEAR) {
-		DRM_DEBUG_KMS("cursor cannot be tiled\n");
+		drm_dbg_kms(&i915->drm, "cursor cannot be tiled\n");
 		return -EINVAL;
 	}
 
@@ -11325,6 +11335,7 @@ static int i845_check_cursor(struct intel_crtc_state *crtc_state,
 			     struct intel_plane_state *plane_state)
 {
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
 	int ret;
 
 	ret = intel_check_cursor(crtc_state, plane_state);
@@ -11337,9 +11348,10 @@ static int i845_check_cursor(struct intel_crtc_state *crtc_state,
 
 	/* Check for which cursor types we support */
 	if (!i845_cursor_size_ok(plane_state)) {
-		DRM_DEBUG("Cursor dimension %dx%d not supported\n",
-			  drm_rect_width(&plane_state->uapi.dst),
-			  drm_rect_height(&plane_state->uapi.dst));
+		drm_dbg_kms(&i915->drm,
+			    "Cursor dimension %dx%d not supported\n",
+			    drm_rect_width(&plane_state->uapi.dst),
+			    drm_rect_height(&plane_state->uapi.dst));
 		return -EINVAL;
 	}
 
@@ -11353,8 +11365,8 @@ static int i845_check_cursor(struct intel_crtc_state *crtc_state,
 	case 2048:
 		break;
 	default:
-		DRM_DEBUG_KMS("Invalid cursor stride (%u)\n",
-			      fb->pitches[0]);
+		drm_dbg_kms(&i915->drm, "Invalid cursor stride (%u)\n",
+			    fb->pitches[0]);
 		return -EINVAL;
 	}
 
@@ -11920,20 +11932,22 @@ void intel_release_load_detect_pipe(struct drm_connector *connector,
 {
 	struct intel_encoder *intel_encoder =
 		intel_attached_encoder(connector);
+	struct drm_i915_private *i915 = to_i915(intel_encoder->base.dev);
 	struct drm_encoder *encoder = &intel_encoder->base;
 	struct drm_atomic_state *state = old->restore_state;
 	int ret;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
-		      connector->base.id, connector->name,
-		      encoder->base.id, encoder->name);
+	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
+		    connector->base.id, connector->name,
+		    encoder->base.id, encoder->name);
 
 	if (!state)
 		return;
 
 	ret = drm_atomic_helper_commit_duplicated_state(state, ctx);
 	if (ret)
-		DRM_DEBUG_KMS("Couldn't release load detect pipe: %i\n", ret);
+		drm_dbg_kms(&i915->drm,
+			    "Couldn't release load detect pipe: %i\n", ret);
 	drm_atomic_state_put(state);
 }
 
@@ -12704,6 +12718,7 @@ compute_sink_pipe_bpp(const struct drm_connector_state *conn_state,
 		      struct intel_crtc_state *pipe_config)
 {
 	struct drm_connector *connector = conn_state->connector;
+	struct drm_i915_private *i915 = to_i915(pipe_config->uapi.crtc->dev);
 	const struct drm_display_info *info = &connector->display_info;
 	int bpp;
 
@@ -12725,11 +12740,12 @@ compute_sink_pipe_bpp(const struct drm_connector_state *conn_state,
 	}
 
 	if (bpp < pipe_config->pipe_bpp) {
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Limiting display bpp to %d instead of "
-			      "EDID bpp %d, requested bpp %d, max platform bpp %d\n",
-			      connector->base.id, connector->name,
-			      bpp, 3 * info->bpc, 3 * conn_state->max_requested_bpc,
-			      pipe_config->pipe_bpp);
+		drm_dbg_kms(&i915->drm,
+			    "[CONNECTOR:%d:%s] Limiting display bpp to %d instead of "
+			    "EDID bpp %d, requested bpp %d, max platform bpp %d\n",
+			    connector->base.id, connector->name, bpp,
+			    3 * info->bpc, 3 * conn_state->max_requested_bpc,
+			    pipe_config->pipe_bpp);
 
 		pipe_config->pipe_bpp = bpp;
 	}
@@ -12789,10 +12805,13 @@ intel_dump_m_n_config(const struct intel_crtc_state *pipe_config,
 		      const char *id, unsigned int lane_count,
 		      const struct intel_link_m_n *m_n)
 {
-	DRM_DEBUG_KMS("%s: lanes: %i; gmch_m: %u, gmch_n: %u, link_m: %u, link_n: %u, tu: %u\n",
-		      id, lane_count,
-		      m_n->gmch_m, m_n->gmch_n,
-		      m_n->link_m, m_n->link_n, m_n->tu);
+	struct drm_i915_private *i915 = to_i915(pipe_config->uapi.crtc->dev);
+
+	drm_dbg_kms(&i915->drm,
+		    "%s: lanes: %i; gmch_m: %u, gmch_n: %u, link_m: %u, link_n: %u, tu: %u\n",
+		    id, lane_count,
+		    m_n->gmch_m, m_n->gmch_n,
+		    m_n->link_m, m_n->link_n, m_n->tu);
 }
 
 static void
@@ -12868,27 +12887,31 @@ static const char *output_formats(enum intel_output_format format)
 static void intel_dump_plane_state(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	struct drm_format_name_buf format_name;
 
 	if (!fb) {
-		DRM_DEBUG_KMS("[PLANE:%d:%s] fb: [NOFB], visible: %s\n",
-			      plane->base.base.id, plane->base.name,
-			      yesno(plane_state->uapi.visible));
+		drm_dbg_kms(&i915->drm,
+			    "[PLANE:%d:%s] fb: [NOFB], visible: %s\n",
+			    plane->base.base.id, plane->base.name,
+			    yesno(plane_state->uapi.visible));
 		return;
 	}
 
-	DRM_DEBUG_KMS("[PLANE:%d:%s] fb: [FB:%d] %ux%u format = %s, visible: %s\n",
-		      plane->base.base.id, plane->base.name,
-		      fb->base.id, fb->width, fb->height,
-		      drm_get_format_name(fb->format->format, &format_name),
-		      yesno(plane_state->uapi.visible));
-	DRM_DEBUG_KMS("\trotation: 0x%x, scaler: %d\n",
-		      plane_state->hw.rotation, plane_state->scaler_id);
+	drm_dbg_kms(&i915->drm,
+		    "[PLANE:%d:%s] fb: [FB:%d] %ux%u format = %s, visible: %s\n",
+		    plane->base.base.id, plane->base.name,
+		    fb->base.id, fb->width, fb->height,
+		    drm_get_format_name(fb->format->format, &format_name),
+		    yesno(plane_state->uapi.visible));
+	drm_dbg_kms(&i915->drm, "\trotation: 0x%x, scaler: %d\n",
+		    plane_state->hw.rotation, plane_state->scaler_id);
 	if (plane_state->uapi.visible)
-		DRM_DEBUG_KMS("\tsrc: " DRM_RECT_FP_FMT " dst: " DRM_RECT_FMT "\n",
-			      DRM_RECT_FP_ARG(&plane_state->uapi.src),
-			      DRM_RECT_ARG(&plane_state->uapi.dst));
+		drm_dbg_kms(&i915->drm,
+			    "\tsrc: " DRM_RECT_FP_FMT " dst: " DRM_RECT_FMT "\n",
+			    DRM_RECT_FP_ARG(&plane_state->uapi.src),
+			    DRM_RECT_ARG(&plane_state->uapi.dst));
 }
 
 static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
@@ -13172,6 +13195,7 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 {
 	struct drm_crtc *crtc = pipe_config->uapi.crtc;
 	struct drm_atomic_state *state = pipe_config->uapi.state;
+	struct drm_i915_private *i915 = to_i915(pipe_config->uapi.crtc->dev);
 	struct intel_encoder *encoder;
 	struct drm_connector *connector;
 	struct drm_connector_state *connector_state;
@@ -13221,7 +13245,8 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 		encoder = to_intel_encoder(connector_state->best_encoder);
 
 		if (!check_single_encoder_cloning(state, to_intel_crtc(crtc), encoder)) {
-			DRM_DEBUG_KMS("rejecting invalid cloning configuration\n");
+			drm_dbg_kms(&i915->drm,
+				    "rejecting invalid cloning configuration\n");
 			return -EINVAL;
 		}
 
@@ -13275,8 +13300,8 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 		ret = icl_compute_port_sync_crtc_state(connector, pipe_config,
 						       num_tiled_conns);
 		if (ret) {
-			DRM_DEBUG_KMS("Cannot assign Sync Mode CRTCs: %d\n",
-				      ret);
+			drm_dbg_kms(&i915->drm,
+				    "Cannot assign Sync Mode CRTCs: %d\n", ret);
 			return ret;
 		}
 
@@ -13285,8 +13310,9 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 					      connector_state);
 		if (ret < 0) {
 			if (ret != -EDEADLK)
-				DRM_DEBUG_KMS("Encoder config failure: %d\n",
-					      ret);
+				drm_dbg_kms(&i915->drm,
+					    "Encoder config failure: %d\n",
+					    ret);
 			return ret;
 		}
 	}
@@ -13301,7 +13327,7 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 	if (ret == -EDEADLK)
 		return ret;
 	if (ret < 0) {
-		DRM_DEBUG_KMS("CRTC fixup failed\n");
+		drm_dbg_kms(&i915->drm, "CRTC fixup failed\n");
 		return ret;
 	}
 
@@ -13309,7 +13335,7 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 		if (WARN(!retry, "loop in pipe configuration computation\n"))
 			return -EINVAL;
 
-		DRM_DEBUG_KMS("CRTC bw constrained, retrying\n");
+		drm_dbg_kms(&i915->drm, "CRTC bw constrained, retrying\n");
 		retry = false;
 		goto encoder_retry;
 	}
@@ -13320,8 +13346,9 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 	 */
 	pipe_config->dither = (pipe_config->pipe_bpp == 6*3) &&
 		!pipe_config->dither_force_disable;
-	DRM_DEBUG_KMS("hw max bpp: %i, pipe bpp: %i, dithering: %i\n",
-		      base_bpp, pipe_config->pipe_bpp, pipe_config->dither);
+	drm_dbg_kms(&i915->drm,
+		    "hw max bpp: %i, pipe bpp: %i, dithering: %i\n",
+		    base_bpp, pipe_config->pipe_bpp, pipe_config->dither);
 
 	/*
 	 * Make drm_calc_timestamping_constants in
@@ -13429,6 +13456,7 @@ static void __printf(4, 5)
 pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 		     const char *name, const char *format, ...)
 {
+	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
 	struct va_format vaf;
 	va_list args;
 
@@ -13437,11 +13465,12 @@ pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 	vaf.va = &args;
 
 	if (fastset)
-		DRM_DEBUG_KMS("[CRTC:%d:%s] fastset mismatch in %s %pV\n",
-			      crtc->base.base.id, crtc->base.name, name, &vaf);
+		drm_dbg_kms(&i915->drm,
+			    "[CRTC:%d:%s] fastset mismatch in %s %pV\n",
+			    crtc->base.base.id, crtc->base.name, name, &vaf);
 	else
-		DRM_ERROR("[CRTC:%d:%s] mismatch in %s %pV\n",
-			  crtc->base.base.id, crtc->base.name, name, &vaf);
+		drm_err(&i915->drm, "[CRTC:%d:%s] mismatch in %s %pV\n",
+			crtc->base.base.id, crtc->base.name, name, &vaf);
 
 	va_end(args);
 }
@@ -14519,8 +14548,9 @@ static int intel_atomic_check_planes(struct intel_atomic_state *state,
 	for_each_new_intel_plane_in_state(state, plane, plane_state, i) {
 		ret = intel_plane_atomic_check(state, plane);
 		if (ret) {
-			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] atomic driver check failed\n",
-					 plane->base.base.id, plane->base.name);
+			drm_dbg_atomic(&dev_priv->drm,
+				       "[PLANE:%d:%s] atomic driver check failed\n",
+				       plane->base.base.id, plane->base.name);
 			return ret;
 		}
 	}
@@ -14565,15 +14595,18 @@ static int intel_atomic_check_planes(struct intel_atomic_state *state,
 
 static int intel_atomic_check_crtcs(struct intel_atomic_state *state)
 {
+	struct drm_i915_private *i915 = to_i915(state->base.dev);
 	struct intel_crtc_state *crtc_state;
 	struct intel_crtc *crtc;
 	int i;
 
 	for_each_new_intel_crtc_in_state(state, crtc, crtc_state, i) {
 		int ret = intel_crtc_atomic_check(state, crtc);
+
 		if (ret) {
-			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] atomic driver check failed\n",
-					 crtc->base.base.id, crtc->base.name);
+			drm_dbg_atomic(&i915->drm,
+				       "[CRTC:%d:%s] atomic driver check failed\n",
+				       crtc->base.base.id, crtc->base.name);
 			return ret;
 		}
 	}
@@ -15182,6 +15215,7 @@ static void intel_update_trans_port_sync_crtcs(struct intel_crtc *crtc,
 					       struct intel_crtc_state *old_crtc_state,
 					       struct intel_crtc_state *new_crtc_state)
 {
+	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
 	struct intel_crtc *slave_crtc = intel_get_slave_crtc(new_crtc_state);
 	struct intel_crtc_state *new_slave_crtc_state =
 		intel_atomic_get_new_crtc_state(state, slave_crtc);
@@ -15191,9 +15225,10 @@ static void intel_update_trans_port_sync_crtcs(struct intel_crtc *crtc,
 	WARN_ON(!slave_crtc || !new_slave_crtc_state ||
 		!old_slave_crtc_state);
 
-	DRM_DEBUG_KMS("Updating Transcoder Port Sync Master CRTC = %d %s and Slave CRTC %d %s\n",
-		      crtc->base.base.id, crtc->base.name, slave_crtc->base.base.id,
-		      slave_crtc->base.name);
+	drm_dbg_kms(&i915->drm,
+		    "Updating Transcoder Port Sync Master CRTC = %d %s and Slave CRTC %d %s\n",
+		    crtc->base.base.id, crtc->base.name,
+		    slave_crtc->base.base.id, slave_crtc->base.name);
 
 	/* Enable seq for slave with with DP_TP_CTL left Idle until the
 	 * master is ready
@@ -16981,9 +17016,11 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 						unsigned int *handle)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
 	if (obj->userptr.mm) {
-		DRM_DEBUG("attempting to use a userptr for a framebuffer, denied\n");
+		drm_dbg(&i915->drm,
+			"attempting to use a userptr for a framebuffer, denied\n");
 		return -EINVAL;
 	}
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
