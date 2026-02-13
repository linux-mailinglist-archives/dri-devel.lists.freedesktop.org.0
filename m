Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFgWLEM7j2nHNAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:54:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9941374DA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677CC10E81B;
	Fri, 13 Feb 2026 14:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QG6zVDu9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3281010E819
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:54:56 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-354c19bf64bso460827a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 06:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770994496; x=1771599296; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uJRT2v8jR64TlQeKrM51Zo5YOhN2bxIL4OyBharSJp0=;
 b=QG6zVDu96gYrqGVGaY55PmIe4AyhIflcavXB/w06p3Hr2YWi7cQR1R38RHT+k0Q8mi
 M4sbOaBQM7wHCaUFW9+sdqDLLdm9hMcXNJDOrqyTJK58OJyCdQrv9cnccpLDyXMDnklR
 hjkK4TfE8qC1i5ZxmWizS3EZ4x+fYCBFUHTcHKh97IUU+LZXrAzIPvk2T8os+AGBEqDc
 FXSPC1O5EHq/Cv5OM8syCIJIlfBtwlZSlccgvlWoKouJRE1JaAQjCcEPfdrlGLeDhxRK
 X+j+N5gcKGpo39BCgevev7qm2svehoxeOALeM4USFLdumBmHKtXNPPtiNvMXca3PQUQu
 ypnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770994496; x=1771599296;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uJRT2v8jR64TlQeKrM51Zo5YOhN2bxIL4OyBharSJp0=;
 b=cZawhDFOI2f1tr3vPZGwTSbgFo7KtakdL2PtbSZV5sg1DP5+43imuOTudrBH92IQEx
 HIqR0MTE1PZY8vPjunLbxVK0DEK2d2ERWbNyG/fUzp/2+q4TH46nOSCaa3pgDVT0j3fs
 hsp3XmDMj554Nl0BAmwRbyDwJ+Aeu1bgbL8HbxYCR4c4evL1YA7QV3VJkEC7ut/V9d2r
 AFmtGUIo4g3Ocz4cU+5UtH1CD4TAT9ei8uYgpnRmeBvE6Tzo9a7IEqrImJPNZqIZr9C+
 oukY0eqsTqOUYP76mQ+9dK5FegF5J+cM97QTYe+/GlUcBlJtYABE2bE3rtyNfMGXZFkO
 P+sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNbSNbapgpmJjsmK/GIkCnmHv00eMFIn3YJWb6s2JNCt2a8Fhxb3wd6vRoZomqOw25gWDfB9FBcWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT31L/qShuE1oS/GbV65LdGXtQLHNGoITSa2AjXn9VGXZ+sFT4
 Bo6AigY++vHACSywuOp83AjgC4RJ3ENRxmQriI4eKNGkL3v1sPwDhWHOVM9e9OPT/+9eZ/wP0g+
 0lvb0TaznwqFu
X-Gm-Gg: AZuq6aLTx8s6p3AKJeKgE+6BJP7pDTpgorTbSisxbH0nC7ne9NpqcxdomrNIMlN2qRh
 Xsm6CuaUwEDKDlbvgNDok+z7PR8VUC+cmz7OQsMne74laC/uOp4VlN3zZu2ISJoMdqr2F3eTS96
 EKzbOXBNd0XdT4JaEZcjDtGq/AQ/yHSKKSQGLEBMBxJDzHn5nf7GW6vPkR8J4tiEuN+W4tHaX9e
 Wpc0bjxjL9ZDY5mW27zUFCsCA699HMwyAXaW28zBEu7zYCNnXlX4c9RvMxRTiksb+51/X3KciTj
 BDoHpZ3rMU/TtyJfLnJocvcUUuXy3I7YHvud/bDNcaskPBwcwga9JGvktmGE4HfNspaDZeeFjlR
 X9nNsNc5Doaptez3IG0NWdVBLuGCciQcSgQUIHa8q4u3hZ2mVsNhkPH0qwKgpbgtrdcv6olNO/S
 /3rcSo7SJoPpcqiDCO/3BD/u5cD/xZ6scJbBQrsaByBVnajsoW50dfJenf
X-Received: by 2002:a17:90b:3fcd:b0:349:162d:ae0c with SMTP id
 98e67ed59e1d1-357b5099fc2mr268604a91.4.1770994495516; 
 Fri, 13 Feb 2026 06:54:55 -0800 (PST)
Received: from [127.0.1.1] (210-61-187-172.hinet-ip.hinet.net.
 [210.61.187.172]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3567eba9b2esm8814759a91.9.2026.02.13.06.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 06:54:55 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 13 Feb 2026 22:54:26 +0800
Subject: [PATCH v18 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-msm-next-quad-pipe-split-v18-2-5815158d3635@linaro.org>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770994473; l=9685;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=i1RzzvrabPDykfHEg1NdrWB/7Psq7/tLp+Qwsh/cZPk=;
 b=nr7UC/X9qLl1fHVfTwnuqUJxOxnsm/m4g0kvNNqOcNxbzasp4NRSTg/+c8/2G4mlqNns6S52K
 H8bBOWmtDoPBjCp43KDF0ZfAOm/UtVlqmpvYNVPxnmYXvQVJSgFx1s9
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jun.nie@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 4C9941374DA
X-Rspamd-Action: no action

Currently, mapping plane to SSPP occurs during the plane check phase for
non-virtual plane case. The SSPP allocation and plane mapping occurs during
crtc check phase for virtual plane case. Defer these SSPP operations until
CRTC check stage to unify the 2 cases, and ease later revisement for
quad-pipe change.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 155 +++++++++++++-----------------
 2 files changed, 66 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6bf7c46379aed..797296b14264e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1534,8 +1534,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			return rc;
 	}
 
-	if (dpu_use_virtual_planes &&
-	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
+	if (crtc_state->planes_changed || crtc_state->zpos_changed) {
 		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
 		if (rc < 0)
 			return rc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 66f240ce29d07..be1a7fcf11b81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1119,102 +1119,24 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	int ret = 0;
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
-	const struct drm_crtc_state *crtc_state = NULL;
-	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
+	struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-
-	if (!pipe->sspp)
-		return -EINVAL;
-
 	ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
 	if (ret)
 		return ret;
 
-	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
-	if (ret)
-		return ret;
-
 	if (!new_plane_state->visible)
 		return 0;
 
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(new_plane_state->fb),
-					      max_linewidth)) {
-		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
-				" max_line:%u, can't use split source\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect),
-				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
-				max_linewidth);
-		return -E2BIG;
-	}
-
-	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
-}
-
-static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
-					  struct drm_atomic_state *state)
-{
-	struct drm_plane_state *plane_state =
-		drm_atomic_get_plane_state(state, plane);
-	struct drm_plane_state *old_plane_state =
-		drm_atomic_get_old_plane_state(state, plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
-	struct drm_crtc_state *crtc_state = NULL;
-	int ret, i;
-
-	if (IS_ERR(plane_state))
-		return PTR_ERR(plane_state);
-
-	if (plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   plane_state->crtc);
-
-	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
-	if (ret)
-		return ret;
-
-	ret = dpu_plane_split(plane, plane_state, crtc_state);
-	if (ret)
-		return ret;
-
-	if (!plane_state->visible) {
-		/*
-		 * resources are freed by dpu_crtc_assign_plane_resources(),
-		 * but clean them here.
-		 */
-		for (i = 0; i < PIPES_PER_PLANE; i++)
-			pstate->pipe[i].sspp = NULL;
-
-		return 0;
-	}
-
 	/*
-	 * Force resource reallocation if the format of FB or src/dst have
-	 * changed. We might need to allocate different SSPP or SSPPs for this
-	 * plane than the one used previously.
+	 * To trigger the callback of dpu_assign_plane_resources() to
+	 * finish the sspp assignment or allocation and check.
 	 */
-	if (!old_plane_state || !old_plane_state->fb ||
-	    old_plane_state->src_w != plane_state->src_w ||
-	    old_plane_state->src_h != plane_state->src_h ||
-	    old_plane_state->crtc_w != plane_state->crtc_w ||
-	    old_plane_state->crtc_h != plane_state->crtc_h ||
-	    msm_framebuffer_format(old_plane_state->fb) !=
-	    msm_framebuffer_format(plane_state->fb))
-		crtc_state->planes_changed = true;
-
+	crtc_state->planes_changed = true;
 	return 0;
 }
 
@@ -1261,9 +1183,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
 					      struct drm_plane_state *plane_state,
+					      const struct drm_crtc_state *crtc_state,
 					      struct drm_plane_state **prev_adjacent_plane_state)
 {
-	const struct drm_crtc_state *crtc_state = NULL;
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
@@ -1273,10 +1195,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	const struct msm_format *fmt;
 	int i, ret;
 
-	if (plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   plane_state->crtc);
-
 	pstate = to_dpu_plane_state(plane_state);
 	for (i = 0; i < STAGES_PER_PLANE; i++)
 		prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
@@ -1288,6 +1206,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	if (!plane_state->fb)
 		return -EINVAL;
 
+	ret = dpu_plane_split(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	fmt = msm_framebuffer_format(plane_state->fb);
 	reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
 	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
@@ -1318,14 +1240,56 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 
+static int dpu_plane_assign_resources(struct drm_crtc *crtc,
+				      struct dpu_global_state *global_state,
+				      struct drm_atomic_state *state,
+				      struct drm_plane_state *plane_state,
+				      const struct drm_crtc_state *crtc_state,
+				      struct drm_plane_state **prev_adjacent_plane_state)
+{
+	struct drm_plane *plane = plane_state->plane;
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
+	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	int ret;
+
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	if (!pipe->sspp)
+		return -EINVAL;
+
+	ret = dpu_plane_split(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
+	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+					      pipe->sspp,
+					      msm_framebuffer_format(plane_state->fb),
+					      dpu_kms->catalog->caps->max_linewidth)) {
+		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
+				" max_line:%u, can't use split source\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect),
+				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
+				dpu_kms->catalog->caps->max_linewidth);
+		return -E2BIG;
+	}
+
+	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
+}
+
 int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       struct drm_atomic_state *state,
 			       struct drm_crtc *crtc,
 			       struct drm_plane_state **states,
 			       unsigned int num_planes)
 {
-	unsigned int i;
 	struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
+	const struct drm_crtc_state *crtc_state = NULL;
+	unsigned int i;
+	int ret;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1334,8 +1298,19 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 		    !plane_state->visible)
 			continue;
 
-		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
+		if (plane_state->crtc)
+			crtc_state = drm_atomic_get_new_crtc_state(state,
+								   plane_state->crtc);
+
+		if (!dpu_use_virtual_planes)
+			ret = dpu_plane_assign_resources(crtc, global_state,
+							 state, plane_state,
+							 crtc_state,
+							 prev_adjacent_plane_state);
+		else
+			ret = dpu_plane_virtual_assign_resources(crtc, global_state,
 							     state, plane_state,
+							     crtc_state,
 							     prev_adjacent_plane_state);
 		if (ret)
 			return ret;
@@ -1772,7 +1747,7 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
 	.prepare_fb = dpu_plane_prepare_fb,
 	.cleanup_fb = dpu_plane_cleanup_fb,
-	.atomic_check = dpu_plane_virtual_atomic_check,
+	.atomic_check = dpu_plane_atomic_check,
 	.atomic_update = dpu_plane_atomic_update,
 };
 

-- 
2.43.0

