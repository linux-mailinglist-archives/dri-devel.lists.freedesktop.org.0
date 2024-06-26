Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857D39199FA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264D210E9D8;
	Wed, 26 Jun 2024 21:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pA7HGSTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538B10E9D1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:15 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ec58040f39so47782771fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438373; x=1720043173; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6RUUv6QPzt7XzA46QfLVWzdO/kYhs4i+r+04SlOl4nE=;
 b=pA7HGSTaHLUcHPCZZsBDQ1Zz2QWl95JdzZdNV15ql+liz4zZBmZUm8zPZDNimiu1Q+
 5kfS+zuXzqkXJQd4vHBZ++ohqMqKWvQA54WW7G+aoX3IcHIdpy0ColvtoW9F5iq8ELh/
 uE9TrW9ajDqS9iXSjSDmWprf/HKfLJdK9DGYrNY6klEFnH2uhUgYZ/maY0+ARRVA8/Oq
 ksDVgY/RsxCJjyfjVWHGGJ5UJk4NwVCTiYnQApuTuxcj/QngKYHmoftNdXn6GBFV5tg+
 3Nj7K2RBTUyhQJG8/g6ZhY8TRg/DIvSOAa7ntZDV4/n3G9OPDgi3GRVqVTW/6mtchig0
 Dr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438373; x=1720043173;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6RUUv6QPzt7XzA46QfLVWzdO/kYhs4i+r+04SlOl4nE=;
 b=GKzQYw3D6wgZOMhtzEnPGVqCU0YwdXp9VGZN7xqAwD+96mXxCDsybm4yhoZdn5rB5B
 2sC82K+sKpqCgmQeRcUWDlNGEJ1glrdNMtLc6yuj+0xcy++gLADL62IxZdTZqJK9Wtph
 F/aeFExoDnmtgjOh6LTFy/NIKNCWf0uAyOCked7vweIlb9+3PZTaiWd1KKEGt+JnuZwj
 vNmswjDmvs5UTdm7XDHzaQNU745UF5zcKFADf6xvv4xv1zcQBeF3Xuyf/FsArSjEf+ds
 1iOjioHZiTNgK6PeX3OruKEBHb1IgQzoXUasOjgjs4bTNpEXaYeSzwXhilAVAVeWXOYK
 L5Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwmEH6MBuGNHiBEIHtGcoF1DkjCB6WYwVLZgqFTtXhG3F9uYsb5pPalyeyWLH2LbgD8n6KxtRlm57u2CDXl2jLNzgA+FAmKMFzCJo/WFBm
X-Gm-Message-State: AOJu0Ywyiv5b4muBgea/Ne217BjZguGvkxJI9hzJorTmYsUpPZtA+Dsf
 fjI3n4fdsE811kR2Lb32cpqGe1H6nFWr2F9JEcuY7MNQKMBgjYaLyOwARzsIfrI=
X-Google-Smtp-Source: AGHT+IFcYobwqjcwrUXn+MXupKiniSysaTFOXT74bVddR5hToi5ga/1eClag0WSAZb8PG98iBhjn4g==
X-Received: by 2002:a2e:a310:0:b0:2ed:136c:4ce8 with SMTP id
 38308e7fff4ca-2ed136c4d67mr23787221fa.6.1719438373397; 
 Wed, 26 Jun 2024 14:46:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:46:04 +0300
Subject: [PATCH v5 10/12] drm/msm/dpu: add support for virtual planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-10-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21488;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EHN34VJkW4Tsshf0z3nb48VHGRqnQtQh9hD7q2NKFyk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwZo4CvonZQXrzLOu0YdEpkDyA5J76bfmtGe
 Gi5OHH4rauJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGQAKCRCLPIo+Aiko
 1T+YCACPMOvmWcA9N88hQO2mLh2elfaqhy2jTLIoYLTzFNcVzGCM+RNPLOtHfBI7BTSAuyZRcKZ
 Tc6Mzg69uOpO5JzyblBQFAS6bAIDgG6ft/M8TIgWgfGQBgR8MRdpXzNOoIbsy+Wuc4CMs77IRfj
 acNyBQ47+Y2LdgeR3qdNDD6ggfmqOCZXdB1nOCL+7zZE2K4bT34EQw8niSRInprtKyGEA3PBg+Q
 TitigqVPH8v11Lku0awO95803XaVFepUjyKFqeNqX+pLyAQ6JI1ThTIOfkZ0Q7RIhcEoDOy5k3j
 0vFaEjZi2j4ztPU/vmzAsb2NzGpq/D+FaaD9crFjMYKWa25u
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only several SSPP blocks support such features as YUV output or scaling,
thus different DRM planes have different features.  Properly utilizing
all planes requires the attention of the compositor, who should
prefer simpler planes to YUV-supporting ones. Otherwise it is very easy
to end up in a situation when all featureful planes are already
allocated for simple windows, leaving no spare plane for YUV playback.

To solve this problem make all planes virtual. Each plane is registered
as if it supports all possible features, but then at the runtime during
the atomic_check phase the driver selects backing SSPP block for each
plane.

As the planes are attached to the CRTC and not the the encoder, the
SSPP blocks are also allocated per CRTC ID (all other resources are
currently allocated per encoder ID). This also matches the hardware
requirement, where both rectangles of a single SSPP can only be used
with the LM pair.

Note, this does not provide support for using two different SSPP blocks
for a single plane or using two rectangles of an SSPP to drive two
planes. Each plane still gets its own SSPP and can utilize either a solo
rectangle or both multirect rectangles depending on the resolution.

Note #2: By default support for virtual planes is turned off and the
driver still uses old code path with preallocated SSPP block for each
plane. To enable virtual planes, pass 'msm.dpu_use_virtual_planes=1'
kernel parameter.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  50 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 236 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  16 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  77 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  27 ++++
 7 files changed, 391 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f2164782844..c438cf834320 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1168,6 +1168,49 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	return false;
 }
 
+static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
+{
+	int total_planes = crtc->dev->mode_config.num_total_plane;
+	struct drm_atomic_state *state = crtc_state->state;
+	struct dpu_global_state *global_state;
+	struct drm_plane_state **states;
+	struct drm_plane *plane;
+	int ret;
+
+	global_state = dpu_kms_get_global_state(crtc_state->state);
+	if (IS_ERR(global_state))
+		return PTR_ERR(global_state);
+
+	dpu_rm_release_all_sspp(global_state, crtc);
+
+	if (!crtc_state->enable)
+		return 0;
+
+	states = kcalloc(total_planes, sizeof(*states), GFP_KERNEL);
+	if (!states)
+		return -ENOMEM;
+
+	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
+		struct drm_plane_state *plane_state =
+			drm_atomic_get_plane_state(state, plane);
+
+		if (IS_ERR(plane_state)) {
+			ret = PTR_ERR(plane_state);
+			goto done;
+		}
+
+		states[plane_state->normalized_zpos] = plane_state;
+	}
+
+	ret = dpu_assign_plane_resources(global_state, state, crtc, states, total_planes);
+
+done:
+	kfree(states);
+	return ret;
+
+	return 0;
+}
+
 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		struct drm_atomic_state *state)
 {
@@ -1183,6 +1226,13 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
+	if (dpu_use_virtual_planes &&
+	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
+		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
+		if (rc < 0)
+			return rc;
+	}
+
 	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d1e2143110f2..449fdc0d33dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -51,6 +51,9 @@
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
+bool dpu_use_virtual_planes = false;
+module_param(dpu_use_virtual_planes, bool, 0);
+
 static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
@@ -814,8 +817,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			  type, catalog->sspp[i].features,
 			  catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR));
 
-		plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
-				       (1UL << max_crtc_count) - 1);
+		if (dpu_use_virtual_planes)
+			plane = dpu_plane_init_virtual(dev, type, (1UL << max_crtc_count) - 1);
+		else
+			plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
+					       (1UL << max_crtc_count) - 1);
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
 			ret = PTR_ERR(plane);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e2adc937ea63..195257660057 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -64,6 +64,8 @@
 #define ktime_compare_safe(A, B) \
 	ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
 
+extern bool dpu_use_virtual_planes;
+
 struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
@@ -138,6 +140,8 @@ struct dpu_global_state {
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
 	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
 	uint32_t cdm_to_enc_id;
+
+	uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6ad160295341..c72c65bf55e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -876,7 +876,7 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	drm_rect_rotate_inv(&pipe_cfg->src_rect,
 			    new_plane_state->fb->width, new_plane_state->fb->height,
 			    new_plane_state->rotation);
-	if (r_pipe_cfg->src_rect.x1 != 0)
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
 		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
 				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
@@ -999,8 +999,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-	r_pipe->sspp = NULL;
+	if (pdpu->pipe != SSPP_NONE) {
+		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+		r_pipe->sspp = NULL;
+	}
+
+	if (!pipe->sspp)
+		return -EINVAL;
 
 	ret = dpu_plane_atomic_check_nopipe(plane, new_plane_state, crtc_state);
 	if (ret)
@@ -1017,6 +1022,112 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
 }
 
+static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
+					  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state =
+		drm_atomic_get_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state =
+		drm_atomic_get_old_plane_state(state, plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	if (plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   plane_state->crtc);
+
+	ret = dpu_plane_atomic_check_nopipe(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
+	if (!plane_state->visible) {
+		/*
+		 * resources are freed by dpu_crtc_assign_plane_resources(),
+		 * but clean them here.
+		 */
+		pstate->pipe.sspp = NULL;
+		pstate->r_pipe.sspp = NULL;
+
+		return 0;
+	}
+
+	/* force resource reallocation if the format of FB has changed */
+	if (!old_plane_state || !old_plane_state->fb ||
+	    msm_framebuffer_format(old_plane_state->fb) !=
+	    msm_framebuffer_format(plane_state->fb))
+		crtc_state->planes_changed = true;
+
+	return 0;
+}
+
+static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
+					      struct dpu_global_state *global_state,
+					      struct drm_atomic_state *state,
+					      struct drm_plane_state *plane_state)
+{
+	const struct drm_crtc_state *crtc_state = NULL;
+	struct drm_plane *plane = plane_state->plane;
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_rm_sspp_requirements reqs;
+	struct dpu_plane_state *pstate;
+	struct dpu_sw_pipe *pipe;
+	struct dpu_sw_pipe *r_pipe;
+	const struct msm_format *fmt;
+
+	if (plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   plane_state->crtc);
+
+	pstate = to_dpu_plane_state(plane_state);
+	pipe = &pstate->pipe;
+	r_pipe = &pstate->r_pipe;
+
+	pipe->sspp = NULL;
+	r_pipe->sspp = NULL;
+
+	if (!plane_state->fb)
+		return -EINVAL;
+
+	fmt = msm_framebuffer_format(plane_state->fb);
+	reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
+	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
+		(plane_state->src_h >> 16 != plane_state->crtc_h);
+
+	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
+
+	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+	if (!pipe->sspp)
+		return -ENODEV;
+
+	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
+}
+
+int dpu_assign_plane_resources(struct dpu_global_state *global_state,
+			       struct drm_atomic_state *state,
+			       struct drm_crtc *crtc,
+			       struct drm_plane_state **states,
+			       unsigned int num_planes)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_planes; i++) {
+		struct drm_plane_state *plane_state = states[i];
+
+		if (!plane_state ||
+		    !plane_state->visible)
+			continue;
+
+		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
+							 state, plane_state);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
 {
 	const struct msm_format *format =
@@ -1337,12 +1448,14 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
-	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
-	drm_printf(p, "\tmultirect_index[0]=%s\n",
-		   dpu_get_multirect_index(pipe->multirect_index));
-	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
-	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	if (pipe->sspp) {
+		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
+		drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
+		drm_printf(p, "\tmultirect_index[0]=%s\n",
+			   dpu_get_multirect_index(pipe->multirect_index));
+		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
+		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	}
 
 	if (r_pipe->sspp) {
 		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
@@ -1431,31 +1544,29 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 		.atomic_update = dpu_plane_atomic_update,
 };
 
+static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
+	.prepare_fb = dpu_plane_prepare_fb,
+	.cleanup_fb = dpu_plane_cleanup_fb,
+	.atomic_check = dpu_plane_virtual_atomic_check,
+	.atomic_update = dpu_plane_atomic_update,
+};
+
 /* initialize plane */
-struct drm_plane *dpu_plane_init(struct drm_device *dev,
-		uint32_t pipe, enum drm_plane_type type,
-		unsigned long possible_crtcs)
+static struct drm_plane *dpu_plane_init_common(struct drm_device *dev,
+					       enum drm_plane_type type,
+					       unsigned long possible_crtcs,
+					       bool inline_rotation,
+					       const uint32_t *format_list,
+					       uint32_t num_formats,
+					       enum dpu_sspp pipe)
 {
 	struct drm_plane *plane = NULL;
-	const uint32_t *format_list;
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
-	struct dpu_hw_sspp *pipe_hw;
-	uint32_t num_formats;
 	uint32_t supported_rotations;
 	int ret;
 
-	/* initialize underlying h/w driver */
-	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
-	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
-		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
-		return ERR_PTR(-EINVAL);
-	}
-
-	format_list = pipe_hw->cap->sblk->format_list;
-	num_formats = pipe_hw->cap->sblk->num_formats;
-
 	pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
 				0xff, &dpu_plane_funcs,
 				format_list, num_formats,
@@ -1481,7 +1592,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
 
-	if (pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
+	if (inline_rotation)
 		supported_rotations |= DRM_MODE_ROTATE_MASK;
 
 	drm_plane_create_rotation_property(plane,
@@ -1489,10 +1600,81 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	drm_plane_enable_fb_damage_clips(plane);
 
-	/* success! finalize initialization */
+	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
+					pipe, plane->base.id);
+	return plane;
+}
+
+struct drm_plane *dpu_plane_init(struct drm_device *dev,
+				 uint32_t pipe, enum drm_plane_type type,
+				 unsigned long possible_crtcs)
+{
+	struct drm_plane *plane = NULL;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_kms *kms = to_dpu_kms(priv->kms);
+	struct dpu_hw_sspp *pipe_hw;
+
+	/* initialize underlying h/w driver */
+	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
+	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
+		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
+		return ERR_PTR(-EINVAL);
+	}
+
+
+	plane = dpu_plane_init_common(dev, type, possible_crtcs,
+				      pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION),
+				      pipe_hw->cap->sblk->format_list,
+				      pipe_hw->cap->sblk->num_formats,
+				      pipe);
+	if (IS_ERR(plane))
+		return plane;
+
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
+
+	return plane;
+}
+
+struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
+					 enum drm_plane_type type,
+					 unsigned long possible_crtcs)
+{
+	struct drm_plane *plane = NULL;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_kms *kms = to_dpu_kms(priv->kms);
+	bool has_inline_rotation = false;
+	const u32 *format_list = NULL;
+	u32 num_formats = 0;
+	int i;
+
+	/* Determine the largest configuration that we can implement */
+	for (i = 0; i < kms->catalog->sspp_count; i++) {
+		const struct dpu_sspp_cfg *cfg = &kms->catalog->sspp[i];
+
+		if (test_bit(DPU_SSPP_INLINE_ROTATION, &cfg->features))
+			has_inline_rotation = true;
+
+		if (!format_list ||
+		    cfg->sblk->csc_blk.len) {
+			format_list = cfg->sblk->format_list;
+			num_formats = cfg->sblk->num_formats;
+		}
+	}
+
+	plane = dpu_plane_init_common(dev, type, possible_crtcs,
+				      has_inline_rotation,
+				      format_list,
+				      num_formats,
+				      SSPP_NONE);
+	if (IS_ERR(plane))
+		return plane;
+
+	drm_plane_helper_add(plane, &dpu_plane_virtual_helper_funcs);
+
+	DPU_DEBUG("%s created virtual id:%u\n", plane->name, plane->base.id);
+
 	return plane;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index a3ae45dc95d0..e225d5baceb0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -75,6 +75,16 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
 		unsigned long possible_crtcs);
 
+/**
+ * dpu_plane_init_virtual - create new dpu virtualized plane
+ * @dev:   Pointer to DRM device
+ * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
+ * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
+ */
+struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
+					 enum drm_plane_type type,
+					 unsigned long possible_crtcs);
+
 /**
  * dpu_plane_color_fill - enables color fill on plane
  * @plane:  Pointer to DRM plane object
@@ -91,4 +101,10 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
 static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
 #endif
 
+int dpu_assign_plane_resources(struct dpu_global_state *global_state,
+			       struct drm_atomic_state *state,
+			       struct drm_crtc *crtc,
+			       struct drm_plane_state **states,
+			       unsigned int num_planes);
+
 #endif /* _DPU_PLANE_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 44938ba7a2b7..dbf1f7229e45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -694,6 +694,83 @@ int dpu_rm_reserve(
 	return ret;
 }
 
+struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
+					struct dpu_global_state *global_state,
+					struct drm_crtc *crtc,
+					struct dpu_rm_sspp_requirements *reqs)
+{
+	uint32_t crtc_id = crtc->base.id;
+	unsigned int weight, best_weight = UINT_MAX;
+	struct dpu_hw_sspp *hw_sspp;
+	unsigned long mask = 0;
+	int i, best_idx = -1;
+
+	/*
+	 * Don't take cursor feature into consideration until there is proper support for SSPP_CURSORn.
+	 */
+	mask |= BIT(DPU_SSPP_CURSOR);
+
+	if (reqs->scale)
+		mask |= BIT(DPU_SSPP_SCALER_RGB) |
+			BIT(DPU_SSPP_SCALER_QSEED2) |
+			BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE);
+
+	if (reqs->yuv)
+		mask |= BIT(DPU_SSPP_CSC) |
+			BIT(DPU_SSPP_CSC_10BIT);
+
+	if (reqs->rot90)
+		mask |= BIT(DPU_SSPP_INLINE_ROTATION);
+
+	for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++) {
+		if (!rm->hw_sspp[i])
+			continue;
+
+		if (global_state->sspp_to_crtc_id[i])
+			continue;
+
+		hw_sspp = rm->hw_sspp[i];
+
+		/* skip incompatible planes */
+		if (reqs->scale && !hw_sspp->cap->sblk->scaler_blk.len)
+			continue;
+
+		if (reqs->yuv && !hw_sspp->cap->sblk->csc_blk.len)
+			continue;
+
+		if (reqs->rot90 && !(hw_sspp->cap->features & DPU_SSPP_INLINE_ROTATION))
+			continue;
+
+		/*
+		 * For non-yuv, non-scaled planes prefer simple (DMA or RGB)
+		 * plane, falling back to VIG only if there are no such planes.
+		 *
+		 * This way we'd leave VIG sspps to be later used for YUV formats.
+		 */
+		weight = hweight64(hw_sspp->cap->features & ~mask);
+		if (weight < best_weight) {
+			best_weight = weight;
+			best_idx = i;
+		}
+	}
+
+	if (best_idx < 0)
+		return NULL;
+
+	global_state->sspp_to_crtc_id[best_idx] = crtc_id;
+
+	return rm->hw_sspp[best_idx];
+}
+
+void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
+			     struct drm_crtc *crtc)
+{
+	uint32_t crtc_id = crtc->base.id;
+
+	_dpu_rm_clear_mapping(global_state->sspp_to_crtc_id,
+		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
+}
+
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index e63db8ace6b9..6edff89fe83a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -37,6 +37,12 @@ struct dpu_rm {
 	struct dpu_hw_blk *cdm_blk;
 };
 
+struct dpu_rm_sspp_requirements {
+	bool yuv;
+	bool scale;
+	bool rot90;
+};
+
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
@@ -82,6 +88,27 @@ int dpu_rm_reserve(struct dpu_rm *rm,
 void dpu_rm_release(struct dpu_global_state *global_state,
 		struct drm_encoder *enc);
 
+/**
+ * dpu_rm_reserve_sspp - Reserve the required SSPP for the provided CRTC
+ * @rm: DPU Resource Manager handle
+ * @global_state: private global state
+ * @crtc: DRM CRTC handle
+ * @reqs: SSPP required features
+ */
+struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
+					struct dpu_global_state *global_state,
+					struct drm_crtc *crtc,
+					struct dpu_rm_sspp_requirements *reqs);
+
+/**
+ * dpu_rm_release_all_sspp - Given the CRTC, release all SSPP
+ *	blocks previously reserved for that use case.
+ * @rm: DPU Resource Manager handle
+ * @crtc: DRM CRTC handle
+ */
+void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
+			     struct drm_crtc *crtc);
+
 /**
  * Get hw resources of the given type that are assigned to this encoder.
  */

-- 
2.39.2

