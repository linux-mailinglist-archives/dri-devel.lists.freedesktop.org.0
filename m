Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A9C9F23CE
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 13:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7631910E37F;
	Sun, 15 Dec 2024 12:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fEVXMgzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A7E10E37F
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 12:40:26 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso3590448e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 04:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734266425; x=1734871225; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pVBSi3Z0EF1rBWl3rZ7UQW/azbUbH4SNSuJA50uH8ug=;
 b=fEVXMgzT4FfLV2aIh9ilkpmRy6fviwPMqnnom98BtHEth0KlCpIr0SM5OzVBCea7tm
 yk0DToh7qP8mUB1HJnDg/AQkSkyf+OeuSpNA1uq2kTFhMBb3atftQnblIM5UStp2nY9y
 Wmu2vrgZKwHWMcqo4ArfGQDWACypxh/MuwDAmKZFPZoly/yR3mY/2EG4NnE50N+De2Yx
 y8HniEdRWEzdTGvg4Jz998oSuVZl74JhBVfzhsLS8CCuQ/Fdh3Je2ADRvT1GBD0yOvx9
 71GGDHt1TmxUW9Z1Oo6MU4D/2vq5NU466gti5gSS/3A5Ursm1+QbR7oAy2Hajt9Xhe7/
 eZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734266425; x=1734871225;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVBSi3Z0EF1rBWl3rZ7UQW/azbUbH4SNSuJA50uH8ug=;
 b=bNt4yaKuI8HSZyislllCjQz44L+1UeoioJJZ5ti2zxTPCvVG4E2O6G3cO6udzj0na1
 U7o2yCp66aIbSqIP1Qy6sUtIQEwXc0fdHn0DKIi3Y3m8A+2OaZtrcpUxdGPf5EVS0OYd
 JG0qhpGqOzlriT66tqlOAhhN0arqpZQlfH0mqs5fIy0vWMVoZzVAtGSyawnBLzleMnev
 fSMpxQnVHHcLcKWTb/vrn8rirOp4DUeZFFKWg/faLnTSMUfmejPTIe50ALIFgKrtB0WM
 QxTwQu/4prXQOGk71msBSNPvX6jnjCe7ltWaZStlEaB7YpvRsEF07NilHyZUccscKqhN
 7EMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr6nXIBZAa7X57+YmbAo7vXdJxj3wukZaxzkYnoCsUndqISprmzZmu70JMymhKIJVI2X5bbK2+5O0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKlrzl/zQSlyyQvoeNQ4F07j3G15cbj41WmB+H7alyJdMQJlHY
 DXN5+FPlbB3hn5ZZgvOo2GWnewlq7YULfAmgSWrjsdqBxBGkzIJY7W8hWe+++DE=
X-Gm-Gg: ASbGncsVZKPS+gISwq0XUw4J7NS2v4LcfsWM/hzUwhSAquEpV9WC/N5U7xfh+DePdJ6
 /WSL6I1uI4J0YRGAHba4EY/1UcxjvuYQ/INkNbkyadhUv+PBkn+2Mli3NoDSi1DCRwyp4o8+mod
 pIO8fupcXHXEX7yMEExXBAY8ceYlXCTdxQhbjAef3YqCZkEpvdHB7HPnYK6UFs6BEPNuKLCra5y
 t76NjIl4SOZSYgjtYATn50Pln8o/6ubXniL+J6t7kbK1fj4PttirObf4tu97KP+
X-Google-Smtp-Source: AGHT+IHzmV9r+wjOgh2qYn++qpH4M57sleqsIS6Dus90suLQbSbB9mjBL9O9k20bKmBjZoWBEFIkOw==
X-Received: by 2002:a05:6512:2216:b0:540:3566:5b6a with SMTP id
 2adb3069b0e04-54035665bbcmr2625023e87.12.1734266424807; 
 Sun, 15 Dec 2024 04:40:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13be2sm491481e87.195.2024.12.15.04.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 04:40:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 15 Dec 2024 14:40:16 +0200
Subject: [PATCH v8 1/3] drm/msm/dpu: add support for virtual planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241215-dpu-virtual-wide-v8-1-65221f213ce1@linaro.org>
References: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
In-Reply-To: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22519;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ezbqaOrF2y7Ca75CspR9J44P8kcSu10rCHb5ToxdUl0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rcOWNDO70Al48zeY6ERp46xsZU0+Yc8KrkarWo9/o1J
 5NWHI/vZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEWNTZ/8qJ7VTWkT1lO2Nb
 /fEX3395/Vg3OUri+faZR//2rT0o/0UgxOmI3Lec/ZuOOtgFHPZxVmKXn33Fpuawz4rPSXebtju
 5nRLv1eSSrP3GtO2uafGvZiOfw15GfRvS7sjddC71ssw//exl9y+O1PbdGpaLM6wPtN53FWsxiu
 q5lX1GtXBthS6jkdMJNbETC9J7vwrsSP79wlRng+Ksyn7ZmN3sp77M2lvI25XL1nmxPI/lTqLE4
 +bDmQtOiMT937j9dmBHZ+2b2kz+H0e2P+xjtK6Oc17m+M6gYPWDvQdY7ZjZa58diW2uZqlxm731
 pQdr3+bFP7sqbD6a+j+RdTc2Epihyym776tqoDfT7ve2AA==
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

As the planes are attached to the CRTC and not the encoder, the SSPP
blocks are also allocated per CRTC ID (all other resources are currently
allocated per encoder ID). This also matches the hardware requirement,
where both rectangles of a single SSPP can only be used with the LM
pair.

Note, this does not provide support for using two different SSPP blocks
for a single plane or using two rectangles of an SSPP to drive two
planes. Each plane still gets its own SSPP and can utilize either a solo
rectangle or both multirect rectangles depending on the resolution.

Note #2: By default support for virtual planes is turned off and the
driver still uses old code path with preallocated SSPP block for each
plane. To enable virtual planes, pass 'msm.dpu_use_virtual_planes=1'
kernel parameter.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  50 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 264 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  13 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  82 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  14 ++
 7 files changed, 399 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f6ffd344693ecfb633095772a31ada5613345dc..fcbcac00c8500cfff8546279524638e1f5ae3f18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1182,6 +1182,49 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
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
@@ -1197,6 +1240,13 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
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
index ca4847b2b73876c59dedff1e3ec4188ea70860a7..afb2ee309772b1aa7b93eddde960028bdb612a1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -51,6 +51,9 @@
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
+bool dpu_use_virtual_planes;
+module_param(dpu_use_virtual_planes, bool, 0);
+
 static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
@@ -829,8 +832,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
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
index 88d64d43ea1a8226b414f04bf76551f7dda94ef6..547cdb2c0c788a031685e397e2c8ef73ca6290d7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -54,6 +54,8 @@
 #define ktime_compare_safe(A, B) \
 	ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
 
+extern bool dpu_use_virtual_planes;
+
 struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
@@ -128,6 +130,8 @@ struct dpu_global_state {
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
 	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
 	uint32_t cdm_to_enc_id;
+
+	uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3ffac24333a2a5b01135d4ece418432d4a74dc04..309a8cdaafcf3dacd1c7ba4e0cddb7f3f56423c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -878,7 +878,7 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	drm_rect_rotate_inv(&pipe_cfg->src_rect,
 			    new_plane_state->fb->width, new_plane_state->fb->height,
 			    new_plane_state->rotation);
-	if (r_pipe_cfg->src_rect.x1 != 0)
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
 		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
 				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
@@ -1001,8 +1001,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
 
 	ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
 	if (ret)
@@ -1019,6 +1024,112 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
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
+	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
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
+	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
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
@@ -1335,12 +1446,15 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
-	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
-	drm_printf(p, "\tmultirect_index[0]=%s\n",
-		   dpu_get_multirect_index(pipe->multirect_index));
-	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
-	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	if (pipe->sspp) {
+		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
+		drm_printf(p, "\tmultirect_mode[0]=%s\n",
+			   dpu_get_multirect_mode(pipe->multirect_mode));
+		drm_printf(p, "\tmultirect_index[0]=%s\n",
+			   dpu_get_multirect_index(pipe->multirect_index));
+		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
+		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	}
 
 	if (r_pipe->sspp) {
 		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
@@ -1433,39 +1547,29 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 		.atomic_update = dpu_plane_atomic_update,
 };
 
-/**
- * dpu_plane_init - create new dpu plane for the given pipe
- * @dev:   Pointer to DRM device
- * @pipe:  dpu hardware pipe identifier
- * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
- * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
- *
- * Initialize the plane.
- */
-struct drm_plane *dpu_plane_init(struct drm_device *dev,
-		uint32_t pipe, enum drm_plane_type type,
-		unsigned long possible_crtcs)
+static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
+	.prepare_fb = dpu_plane_prepare_fb,
+	.cleanup_fb = dpu_plane_cleanup_fb,
+	.atomic_check = dpu_plane_virtual_atomic_check,
+	.atomic_update = dpu_plane_atomic_update,
+};
+
+/* initialize plane */
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
@@ -1491,7 +1595,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
 
-	if (pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
+	if (inline_rotation)
 		supported_rotations |= DRM_MODE_ROTATE_MASK;
 
 	drm_plane_create_rotation_property(plane,
@@ -1499,10 +1603,98 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	drm_plane_enable_fb_damage_clips(plane);
 
-	/* success! finalize initialization */
+	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
+					pipe, plane->base.id);
+	return plane;
+}
+
+/**
+ * dpu_plane_init - create new dpu plane for the given pipe
+ * @dev:   Pointer to DRM device
+ * @pipe:  dpu hardware pipe identifier
+ * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
+ * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
+ *
+ * Initialize the plane.
+ */
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
+/**
+ * dpu_plane_init_virtual - create new virtualized DPU plane
+ * @dev:   Pointer to DRM device
+ * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
+ * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
+ *
+ * Initialize the virtual plane with no backing SSPP / pipe.
+ */
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
index 97090ca7842b41c697090665d89194a87c02cba1..acd5725175cdde4fcf7a9f71bb446251c5a14d22 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -62,10 +62,23 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
 		unsigned long possible_crtcs);
 
+struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
+					 enum drm_plane_type type,
+					 unsigned long possible_crtcs);
+
+int dpu_plane_color_fill(struct drm_plane *plane,
+		uint32_t color, uint32_t alpha);
+
 #ifdef CONFIG_DEBUG_FS
 void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
 #else
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
index c247af03dc8ef7174eedf3d5cc267d64f17a8656..2c325bcd328aa475cba9b9a2146ee3e009816551 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -725,6 +725,88 @@ int dpu_rm_reserve(
 	return ret;
 }
 
+static struct dpu_hw_sspp *dpu_rm_try_sspp(struct dpu_rm *rm,
+					   struct dpu_global_state *global_state,
+					   struct drm_crtc *crtc,
+					   struct dpu_rm_sspp_requirements *reqs,
+					   unsigned int type)
+{
+	uint32_t crtc_id = crtc->base.id;
+	struct dpu_hw_sspp *hw_sspp;
+	int i;
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
+		if (hw_sspp->cap->type != type)
+			continue;
+
+		if (reqs->scale && !hw_sspp->cap->sblk->scaler_blk.len)
+			continue;
+
+		// TODO: QSEED2 and RGB scalers are not yet supported
+		if (reqs->scale && !hw_sspp->ops.setup_scaler)
+			continue;
+
+		if (reqs->yuv && !hw_sspp->cap->sblk->csc_blk.len)
+			continue;
+
+		if (reqs->rot90 && !(hw_sspp->cap->features & DPU_SSPP_INLINE_ROTATION))
+			continue;
+
+		global_state->sspp_to_crtc_id[i] = crtc_id;
+
+		return rm->hw_sspp[i];
+	}
+
+	return NULL;
+}
+
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
+					struct dpu_rm_sspp_requirements *reqs)
+{
+	struct dpu_hw_sspp *hw_sspp = NULL;
+
+	if (!reqs->scale && !reqs->yuv)
+		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_DMA);
+	if (!hw_sspp && reqs->scale)
+		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_RGB);
+	if (!hw_sspp)
+		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_VIG);
+
+	return hw_sspp;
+}
+
+/**
+ * dpu_rm_release_all_sspp - Given the CRTC, release all SSPP
+ *	blocks previously reserved for that use case.
+ * @global_state: resources shared across multiple kms objects
+ * @crtc: DRM CRTC handle
+ */
+void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
+			     struct drm_crtc *crtc)
+{
+	uint32_t crtc_id = crtc->base.id;
+
+	_dpu_rm_clear_mapping(global_state->sspp_to_crtc_id,
+		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
+}
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index ea0e49cb7b0d3e05dfa57442784c83acb69c3ada..9cdfa53d7173d41dfefe985fdc77f1885dbec4ff 100644
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
  * struct msm_display_topology - defines a display topology pipeline
  * @num_lm:       number of layer mixers used
@@ -68,6 +74,14 @@ int dpu_rm_reserve(struct dpu_rm *rm,
 void dpu_rm_release(struct dpu_global_state *global_state,
 		struct drm_encoder *enc);
 
+struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
+					struct dpu_global_state *global_state,
+					struct drm_crtc *crtc,
+					struct dpu_rm_sspp_requirements *reqs);
+
+void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
+			     struct drm_crtc *crtc);
+
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);

-- 
2.39.5

