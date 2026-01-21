Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPXjIwOIcGkEYQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:02:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C9953329
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6286210E6D7;
	Wed, 21 Jan 2026 08:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NHcJTo++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4859E10E6D7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 08:02:08 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-29f30233d8aso41473285ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 00:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768982527; x=1769587327; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+ROwhGAC+uM/YVDPTZ7SWeJKccnx9vcVwkY+8qPNgeE=;
 b=NHcJTo++RyhSjNAcoX1HcDeC9cQxRW4hdNc/E5JGsAib5oD9cc5Z+dtzZ955VlHX6z
 QQGDsbk/7R5wjxf0q/uCow4IsBhrNQRwarycsE/2oHJDLYvxNI9aY3KE8mrnPA8wpdWY
 folrTETG3tFxEntCDCBgOEn2oH4Vv/QxZylXoFWd4MYKeABe5V6ac8qJuj8G8UcXdTuw
 550bC1X28+DIlzw6cZz3Vli2lT7Y9j8CG7xWSlxiA9bZ6sNZ+dcu1AaN6/aY1C995q0D
 MC5FyqN7beyeKOt+RXxWMC2ZQoinSE1HzH6zZ8sX8iNgnSRzw0JtIDUYb5vGHQq0Cso7
 bHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768982527; x=1769587327;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+ROwhGAC+uM/YVDPTZ7SWeJKccnx9vcVwkY+8qPNgeE=;
 b=WLIyVGYf/5MCdsPSB4gwstgHjweJP9gsJH77fwqIrgQ+YkuOOh3vZkS1/dkjolX29G
 vau+2RrPBe65GtKDkCRGuXc9Z+3QSEPYP2xDtVuhroPsYfjo4ZHo0G0Oqslij0duJjBV
 gQNMFUevEYnqCeZgdD9amlVLZ9kfLVfN0slrPL2h3WGjq00V+3CKYhbaHyLNp9ODWfXe
 ZdYUDf0W7KMy1Jw14uk8LmO+7EvH1coXR0gcrhI4mffA2RlAunUlFx++vdwb+oEkFkWD
 kejE6PY8dBYF1pGFZzlCdGfYeET60Vx2Q5g8J0LEzOOoKnytsHbs5wh2xHXbTAOEcMRu
 FBxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPJU1YjTvGDj6Uoec9E+tqj7DkgLX0AWaEc5iVl607VTCwn/7eJLouUsuJjRI7qkxb5yROYRXUusE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDyLBDDY7shheFAw9aa5De6jHnjE6eLfgnZNakVwHH/el5lwZJ
 QcyzGJ2qIsoZ0rroZnDpDPqu6hVDti1cloAbe8c6f4ijD4OB8L3leEjEqa+2ZlFV9EA=
X-Gm-Gg: AZuq6aKBqFArLhNPFtX99GMR7gLu7pS0I7nbD2No+57faaJZBe2C/sIdjibkdMg6vJx
 F/At+XWe0BPCc8/AyKxTknx2WISrqB6iLufxVwwcaN7OQkfjD0gc9C5DEtdg18nL6ZDav2CJx7H
 iDzVKHZrG+sRnUXfMF9qS5lq5J5e286Pmp3o86HvRQeVuYjc9VuTIbbdstiYd3Uq1Bb3liTM5XA
 Ugxf5cf9+4vAdGexHIxR97DWcarBqmCOsSYHDDlnbUSi2IhDQUx3qD0YRKWSVmtBOUMDDA2RXCp
 OSKZKIc9OTnfGlqiPIpUS559gcY6KkOBmbOx60kblltVrW4itz6fU/mUUDt2JiG2Ke6ERoDGISv
 OneMWG0xX+BwQ5wGg8/8pLIxjFoJvgsmUb8o9UX9VYgkQhqrOnT7drbpt4jiE
X-Received: by 2002:a17:903:120e:b0:2a7:a653:5203 with SMTP id
 d9443c01a7336-2a7a65357e2mr14021225ad.27.1768982527409; 
 Wed, 21 Jan 2026 00:02:07 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4039])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190d14cfsm146851545ad.38.2026.01.21.00.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 00:02:07 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 21 Jan 2026 16:01:50 +0800
Subject: [PATCH v17 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-msm-next-quad-pipe-split-v17-1-6eb6d8675ca2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768982516; l=3875;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=0lT7RY7u/q/OvDkV4Xni5NMBZEHeI41cYul1o1LxOgY=;
 b=juT6dM7+wS6bJ686Sz7r81JjtuD2R3kEK1T/TWFYvoeqbWMGUk0aI9oIPqlOt55UihLWbNWX1
 DtWFQDyewVcCrJu4auRZ6pmyKxxlrana1zeB0SWz3g0EqmIShha9sJk
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 37C9953329
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dpu_plane_atomic_check_nosspp() currently handles both plane
validation and plane splitting. For better simplicity and to
facilitate future refactoring, move the splitting logic into
its own dedicated function.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9b7a8b46bfa91..66f240ce29d07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -821,13 +821,8 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 {
 	int i, ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
-	uint32_t max_linewidth;
 
 	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
 	max_scale = MAX_DOWNSCALE_RATIO << 16;
@@ -850,14 +845,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	/* move the assignment here, to ease handling to another pairs later */
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
-
-	pipe_cfg->dst_rect = new_plane_state->dst;
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -879,6 +866,34 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
 			return -E2BIG;
 
+	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
+
+	return 0;
+}
+
+static int dpu_plane_split(struct drm_plane *plane,
+			   struct drm_plane_state *new_plane_state,
+			   const struct drm_crtc_state *crtc_state)
+{
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	uint32_t max_linewidth;
+
+	if (!new_plane_state->visible)
+		return 0;
+
+	/* move the assignment here, to ease handling to another pairs later */
+	pipe_cfg = &pstate->pipe_cfg[0];
+	r_pipe_cfg = &pstate->pipe_cfg[1];
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
+
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	drm_rect_rotate(&pipe_cfg->src_rect,
@@ -910,8 +925,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
 
-	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
-
 	return 0;
 }
 
@@ -1129,6 +1142,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	if (!new_plane_state->visible)
 		return 0;
 
@@ -1169,6 +1186,10 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	ret = dpu_plane_split(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	if (!plane_state->visible) {
 		/*
 		 * resources are freed by dpu_crtc_assign_plane_resources(),

-- 
2.43.0

