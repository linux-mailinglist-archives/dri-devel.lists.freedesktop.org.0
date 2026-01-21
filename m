Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLf3LQmIcGmCYQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:02:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4D5333F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869D210E6DA;
	Wed, 21 Jan 2026 08:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o/hmigDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C334610E6DA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 08:02:13 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a0c09bb78cso4701165ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 00:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768982533; x=1769587333; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kdmamm1Mw3J6iuJZD1u6/ZinuaX8sHh3/XSQfKccNq4=;
 b=o/hmigDW1vvkoTbblY7GTA1cl8GmQYfboC9NqOFuXn96DzXYB4UbsHAmAbsq01rXdF
 s7n0KPCEy54dicS0bbrYZqCH/BfxpOUFjiBgmV1N4PUbY1OqDSSuXlviIACfl6jlefUT
 GssptD1n+0O9xIzYMxr9vgal6Dl7kiHUS4BuaAxkwPmk+H0RDb+W1gwxRw/vTSACfAxj
 4Uqceo97XuBIqXXGd0rmTdtbB+hlYdu51eZ6dKan7c0ggn6QgC3AnEFFOfDBQ4kg7Q6O
 vt69cCbRTIJS1l37eX2MOD4GH9DebnaKqXTWVrY41iJKmbpg9rSb/NhB98TtAbB8+W2a
 FfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768982533; x=1769587333;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kdmamm1Mw3J6iuJZD1u6/ZinuaX8sHh3/XSQfKccNq4=;
 b=woluFFHGt4xSprVCHQ0t8qglBqpX3YDBQnLuUD1+wfk2tZuamdcZlP5Sc+t4n5+hkv
 VRT8fUWrHRbIYPBWbpujtB7Hym+ge4VjlqSrf0HGmhuwi1+xYpraR1j8nRpCw34PZdwy
 /XGpGQDYdRbYYYkDYRP0ESIKIjP4z30zig/vllb3lcm/BbRyapVgnbUZ6wFbUz9vFOEj
 N6laggfUF7tYIKSUR4cqYPG5n0CKcidwv50TcjpVxZ/4fhr58hhJHu/W8DqMtn8AUe7S
 w5Mro5TTyi+YiD8bD6UJdxfby40t4mhbgl20acw1//IGi6LwP889oTUdYB55hLbb6LLJ
 y1DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1SPAc9u94fu2LCSaSrL2mUYW//NpVKQPQ4tgwjAaV77L5C9/5tMU15DIzKbosBKLFEAogzbRUO0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJI4YBOvTnqqHPZhQ64Iz3FZQSECOlVuHuWxj3yjtcwj2/q5hN
 oKOGKaViAYZ2uDLHMESSKt8U09/5/dxqLjz5kbJ7eQhRxH93ZHyGUWosjFo6wog76cQ=
X-Gm-Gg: AZuq6aL6K355VAqpIuIv4cWzP0KpjkYwMpc0F7ocK5pWAdcBcxcwIG6VhE7sb68zHxj
 GoG2T5QPqQCGdAFugYGBYKjnLFCg4Vb/0nXz9lDVltjzXy6WY/UEj6AS+vokvmerMqkhbh0s1z8
 kFNmq+8jRvskBWK7UI69N2Tay+lm9o1gbd1OPhM1fS6DQD+w8XiuIks+pJqTgHLjKfyHlImwKqB
 n0vfyexSH9n8Njq90Y19JYiIhjr1ApyyuGLQOADp9CzRW/hejVgMUqpc/4C/bCDcQlfuCf6/xP0
 Z02UbFjnqC0Lty7ih5pyxgdhP1vaJSA+GK6SzhJDt4kjPDgxHe17EgFmKs4sZADZaOuQpszn7pg
 fB3ogP/aCIlg7DuTB0tOfhZtwFiXkOpElYozHr1qtWixhBkJzgf+wBMN+fmfF
X-Received: by 2002:a17:902:ea09:b0:29f:2734:837d with SMTP id
 d9443c01a7336-2a700a51209mr183205965ad.28.1768982532816; 
 Wed, 21 Jan 2026 00:02:12 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4039])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190d14cfsm146851545ad.38.2026.01.21.00.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 00:02:12 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 21 Jan 2026 16:01:51 +0800
Subject: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
In-Reply-To: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768982516; l=7971;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=znEAFclRJeKN3r3dai1PBNwwtP0DNzX4Fuq5vltavGs=;
 b=tcPd/napQSxPPJ5WWGUlFaphNEXjLvFq5w7lE25kc5GxovGdQajJx/rJh594UFM2VsYG/pf/j
 1w1Bw0ZbFYvAYR9Z5dAzEnW3xFRW5HfcnKTM1WVBOlEme/bcghTR+Fq
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jun.nie@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 5BA4D5333F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, plane splitting and SSPP allocation occur during the plane
check phase. Defer these operations until dpu_assign_plane_resources()
is called from the CRTC side to ensure the topology information from
the CRTC check is available.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 112 +++++++++++++++++++-----------
 2 files changed, 71 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2d06c950e8143..debdbbe6160dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1484,8 +1484,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			return rc;
 	}
 
-	if (dpu_use_virtual_planes &&
-	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
+	if (crtc_state->planes_changed || crtc_state->zpos_changed) {
 		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
 		if (rc < 0)
 			return rc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 66f240ce29d07..3c629f4df461d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1119,49 +1119,25 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
+	/*
+	 * To trigger the callback of dpu_assign_plane_resources() to
+	 * finish the deferred sspp check
+	 */
+	crtc_state->planes_changed = true;
+	return 0;
 }
 
 static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
@@ -1186,10 +1162,6 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	ret = dpu_plane_split(plane, plane_state, crtc_state);
-	if (ret)
-		return ret;
-
 	if (!plane_state->visible) {
 		/*
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
@@ -1261,9 +1233,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
@@ -1273,10 +1245,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	const struct msm_format *fmt;
 	int i, ret;
 
-	if (plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   plane_state->crtc);
-
 	pstate = to_dpu_plane_state(plane_state);
 	for (i = 0; i < STAGES_PER_PLANE; i++)
 		prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
@@ -1288,6 +1256,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	if (!plane_state->fb)
 		return -EINVAL;
 
+	ret = dpu_plane_split(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	fmt = msm_framebuffer_format(plane_state->fb);
 	reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
 	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
@@ -1318,14 +1290,59 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
+	if (!plane_state->visible)
+		return 0;
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
@@ -1334,8 +1351,19 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
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

-- 
2.43.0

