Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A04A472D7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 03:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B915410E2FC;
	Thu, 27 Feb 2025 02:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="APrKXpdq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9A510E2FC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 02:31:55 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-546210287c1so386147e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623513; x=1741228313; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pe28A92x1GiXAYhXNOQnMWm/JVmD+9I9ysLZzus4GUg=;
 b=APrKXpdqSDTs1R1jJnsNI2nLjggfM/yCm5BWuEfk4Yo7lzKR/INQLWYzHx0rwrV2TQ
 pS2wuI0f1Yo+LLw+P3Iavlix6YT0tjainX26olgrPsrLHnHTHxlmVqDRyR6QW/eUTkmU
 UENiYwL4LWBZTbFKlOvJeHzeK8da0nNte0MFMfhR+QWQNiyyrwpX4L9rSafB7dGJ6zT7
 +nz5XWAymWlG+iuFiSOB8kXW1R9+sY2Y3b8ClwaYBIfTyPfg4frJV7MQl944nzam1qZ4
 EEebeRKsLGIgkiDCgwfKHiNzD/CJ3/1lg6PZQzngNwmS39tXhR4tKGsYh2gE+WcWMadQ
 Ubxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623513; x=1741228313;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pe28A92x1GiXAYhXNOQnMWm/JVmD+9I9ysLZzus4GUg=;
 b=WABZAzDUGaaQvJ1cOlrWUR7oBGlclpRhi6U8EcP9RXWdyC+GiY8YpvGV8QsSWMkzS7
 QYRMtsKCEKpKShQLudsx99spVa227xU5IgjAxkh0VV4SOHdhr8iKLT4aortSVZmxOZGX
 I9bL1VcUVwL5WDnQ27oS52hrJw+2HkUrAGNwCtVvJxlpmdwlSZnDcX9rC/DqOAMKciG0
 DNQfCXEupsKNljwd4voDJ9AVtjzntm6wdtz6jWALNF6qO4dd0G/9T4bl5GVYIkPEfQr7
 OlivVemCW9d913sljQuVDoJj3UacmuDsDOsmOSW5bDeRqeikSgTmm22o4zD6nJg52XS5
 P3UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm5Lsc0cJGqeehbrRqZXkV/9LBmbwfeQZQK51QcUO+bn/meXJnfEtE1lSSduAeYUGxsid32kubP6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxwYZ/wIauit5fpQm8LPPZy5CWr+AFBUcpA3ZjsTBTDsoSjN02
 2vjiifwraDIqHuXUi3GmS8ZZZfLS7AH0rfxTSViV9iqWF27oTvnOny+KwZW0fSI=
X-Gm-Gg: ASbGncuT3M8CusGufG5lXt7iWySxwOqvd00lhgADCUs849oXUhT4yju2pDuQFuKFbQ6
 DPb6Vpuc6zc8sbV4FXAoFdE1/x+awXU8DPDkt3HyqQ90leau8D8qWjf3zQGa7TSGAbr1BK0wZxl
 z59Q8OET5z5/aVt6wWIsfWxIYo8VreCRwmX3FDgOU4a7prRmSV4ZY3QtPke5rP4FdPPuz3dwaeH
 29/J9S3vlvzyRccPtdo5HN0RWWYE+fLwdZxeeVZ+qa4qFkL/xq6ySI0M0DvbSs4dXLMaMTwxUc7
 IDIDQQI2mLsa67bqXXrJIFdSNsER8NxGxg==
X-Google-Smtp-Source: AGHT+IGsG9tTMBoFX+p4C5ZcgIDjAg5knIHTqwpKvZsGh7bP+qxxtuuQn/PArlbHj3skC9/mmGbWww==
X-Received: by 2002:a05:6512:3b2b:b0:545:a1a:5576 with SMTP id
 2adb3069b0e04-5483914012cmr11505631e87.22.1740623513446; 
 Wed, 26 Feb 2025 18:31:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443be377sm49269e87.167.2025.02.26.18.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 18:31:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:31:49 +0200
Subject: [PATCH v6] drm/msm/dpu: allow sharing SSPP between planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-dpu-share-sspp-v6-1-4d469910f399@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJTOv2cC/3XMQQrCQAyF4auUrI04oxOrK+8hXQxt2gakMyRal
 NK7O3bv8n/wvgWMVdjgWi2gPItJmkrQroJ2jNPAKF1p8Ad/ct4F7PILbYzKaJYznkMMRMytqwO
 UU1bu5b2B96b0KPZM+tn8OfzWv9Qc0CFR6DyRq4/95faQKWraJx2gWdf1C20uMr+tAAAA
X-Change-ID: 20241215-dpu-share-sspp-75a566eec185
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10508;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=luHG1Y5KsNSo/DhWFzwtutrMted5f6Dk0kFRk2t85Ng=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv86W44TO3Fj2x1ye0TDqmCpBPagsJ4F3ft1JR
 M/feYMd/SKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/OlgAKCRCLPIo+Aiko
 1ZTxB/9s+6yAAjS+vBIq/IS7czbaoyjphlANfKv5w/YKkG+fIrAk/OL+eqNN1gI5AHMZEwOmSyE
 p/DFI9mKilYWMkWlPrW9RLEzUoNZGu3taB3ldKhhw8ZWhYcpQb+6pYYEPqHpsDQFUR2TOlimoBc
 g+ZHeV82UGtHCAzSjSvVVesQo59vejgFTXXdu6OB+FjqJ3dyfDp3NMkWrF5Vw+6idkFlQ8UY4us
 bGr3kamsz7KljeTtmCFQMCdrZA7s/4HE8B7WrxQNavmtLJNMNFTuF3Xgt3X441E95COMGYcxKtl
 V5oqG5sSYwwEicrNtqhc6EyYPEpK7ZYz6O3bvTZi1oWfzK3L
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

Since SmartDMA planes provide two rectangles, it is possible to use them
to drive two different DRM planes, first plane getting the rect_0,
another one using rect_1 of the same SSPP. The sharing algorithm is
pretty simple, it requires that each of the planes can be driven by the
single rectangle and only consecutive planes are considered.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
This patch has been deferred from v4 of virtual wide patchset to
simplify the merging path. Now as the wide planes have been merged, pick
up the patch that allows sharing of the SSPPs between two planes.
---
Changes in v6:
- Fixed typo (consecutive) in the commit message (Abhinav)
- Renamed prev_plane_state to prev_adjancent_plane_state (Abhinav)
- Renamed prev_pstate to prev_adjancent_pstate as a followup to the
  previous change
- Link to v5: https://lore.kernel.org/r/20241215-dpu-share-sspp-v5-1-665d266183f9@linaro.org

Changes in v5:
- Rebased on top of the current msm-next-lumag
- Renamed dpu_plane_try_multirect() to dpu_plane_try_multirect_shared()
  (Abhinav)
- Link to v4: https://lore.kernel.org/dri-devel/20240314000216.392549-11-dmitry.baryshkov@linaro.org/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 156 +++++++++++++++++++++++++-----
 1 file changed, 130 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index af3e541f60c303eb5212524e877129359b5ca98c..11c4d5dfd9703b27b7ffde34e9b4f92ec956c3c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -887,10 +887,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	return 0;
 }
 
-static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
-						   struct dpu_sw_pipe_cfg *pipe_cfg,
-						   const struct msm_format *fmt,
-						   uint32_t max_linewidth)
+static int dpu_plane_is_multirect_capable(struct dpu_hw_sspp *sspp,
+					  struct dpu_sw_pipe_cfg *pipe_cfg,
+					  const struct msm_format *fmt)
 {
 	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
@@ -902,10 +901,6 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 	if (MSM_FORMAT_IS_YUV(fmt))
 		return false;
 
-	if (MSM_FORMAT_IS_UBWC(fmt) &&
-	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
-		return false;
-
 	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
 	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
 		return false;
@@ -913,6 +908,27 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 	return true;
 }
 
+static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
+					 const struct msm_format *fmt,
+					 uint32_t max_linewidth)
+{
+	if (MSM_FORMAT_IS_UBWC(fmt) &&
+	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
+		return false;
+
+	return true;
+}
+
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct msm_format *fmt,
+						   uint32_t max_linewidth)
+{
+	return dpu_plane_is_multirect_capable(sspp, pipe_cfg, fmt) &&
+		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
+}
+
+
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
 				       const struct drm_crtc_state *crtc_state)
@@ -1001,6 +1017,69 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
 	return true;
 }
 
+static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
+					  struct dpu_plane_state *prev_adjancent_pstate,
+					  const struct msm_format *fmt,
+					  uint32_t max_linewidth)
+{
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe *prev_pipe = &prev_adjancent_pstate->pipe;
+	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjancent_pstate->pipe_cfg;
+	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjancent_pstate->base.fb);
+	u16 max_tile_height = 1;
+
+	if (prev_adjancent_pstate->r_pipe.sspp != NULL ||
+	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
+		return false;
+
+	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
+	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
+		return false;
+
+	if (MSM_FORMAT_IS_UBWC(fmt))
+		max_tile_height = max(max_tile_height, fmt->tile_height);
+
+	if (MSM_FORMAT_IS_UBWC(prev_fmt))
+		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
+
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	r_pipe->sspp = NULL;
+
+	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
+	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
+	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
+	     prev_pipe_cfg->dst_rect.x1 >= pipe_cfg->dst_rect.x2)) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		return true;
+	}
+
+	if (pipe_cfg->dst_rect.y1 >= prev_pipe_cfg->dst_rect.y2 + 2 * max_tile_height ||
+	    prev_pipe_cfg->dst_rect.y1 >= pipe_cfg->dst_rect.y2 + 2 * max_tile_height) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		return true;
+	}
+
+	return false;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -1098,13 +1177,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
-					      struct drm_plane_state *plane_state)
+					      struct drm_plane_state *plane_state,
+					      struct drm_plane_state *prev_adjancent_plane_state)
 {
 	const struct drm_crtc_state *crtc_state = NULL;
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
-	struct dpu_plane_state *pstate;
+	struct dpu_plane_state *pstate, *prev_adjancent_pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
@@ -1116,6 +1196,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 							   plane_state->crtc);
 
 	pstate = to_dpu_plane_state(plane_state);
+	prev_adjancent_pstate = prev_adjancent_plane_state ?
+		to_dpu_plane_state(prev_adjancent_plane_state) : NULL;
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
 	pipe_cfg = &pstate->pipe_cfg;
@@ -1134,24 +1216,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
+	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
+		if (!prev_adjancent_pstate ||
+		    !dpu_plane_try_multirect_shared(pstate, prev_adjancent_pstate, fmt,
+						    dpu_kms->catalog->caps->max_linewidth)) {
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
 
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
+			r_pipe->sspp = NULL;
+
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
+	} else {
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!pipe->sspp)
 			return -ENODEV;
 
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+						      pipe->sspp,
+						      msm_framebuffer_format(plane_state->fb),
+						      dpu_kms->catalog->caps->max_linewidth)) {
+			/* multirect is not possible, use two SSPP blocks */
+			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!r_pipe->sspp)
+				return -ENODEV;
 
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
@@ -1164,6 +1264,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       unsigned int num_planes)
 {
 	unsigned int i;
+	struct drm_plane_state *prev_adjancent_plane_state = NULL;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1173,9 +1274,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			continue;
 
 		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
-							 state, plane_state);
+							     state, plane_state,
+							     prev_adjancent_plane_state);
 		if (ret)
-			return ret;
+			break;
+
+		prev_adjancent_plane_state = plane_state;
 	}
 
 	return 0;

---
base-commit: 89839e69f6154feecd79bd01171375225b0296e9
change-id: 20241215-dpu-share-sspp-75a566eec185

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

