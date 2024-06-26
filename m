Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABFA9199EA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A78F10E9C7;
	Wed, 26 Jun 2024 21:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aDeX4ae/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EEA10E9C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:09 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ec10324791so86740521fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438367; x=1720043167; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4Y77eGqbRKhcTZYOAFZtERWR9uOufd9ItYTSL2OCah4=;
 b=aDeX4ae/OI9UiwoTnep7c/cd+l9i1OOA55V77qqC1ZSbtxuYuJhBcNC3A3o42yt71T
 WHeMvenYh2vLmFZW7j+AXdlNISnqGFdgS2F0iDQT+32YWIk25dpBXjDkT/m0fsbcbORj
 ZS7noL0gLvIdueXS9I9T+rGsgmPdFQh1TVXzTdLrS34iKEGqXEmKVcOjGZK9zxZJ1R0Z
 UFMOocvhLg8nHF+KSnEhS7Nt26mbw3iM4DZdFHOpQpvCUMmmV397z9/hrw91nRfGa9ND
 UqiWQMg+HTVJeTOv1WgrpGQYkvdBMsP/Zdm+m4tQPHa9roIRfDRPuFCNcDW1nOSl9FVu
 lggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438367; x=1720043167;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Y77eGqbRKhcTZYOAFZtERWR9uOufd9ItYTSL2OCah4=;
 b=TN4JhpWnudeLhY0P36RAzGFQ5MOF6gYoohkq5no+6U55oEfdzfRsFCDQ1P7hzApYZB
 Rzo5OjwZsl36odcco0FvKWHIb85jKbKx8JsXjknJXA3gR7f6QQcMLTztrJMjR8exDSkt
 Z2bvE1yQHlpfZJCudtZjTI2+Ei228EuPbBt9R1WHORfUWDW3yKx2Z7cEyThrQ5jBrw+V
 qhgVQryUB1ECqs1oT+5ign/pTQYkJZjsF8Ik69nQcrZhP7CiC/R1ezDzL6XokDZnKEME
 T01xxy6U2cSwDTfR/Q3MsJ5v6r0HfZwYBt/PJzhLSQNwzmB2PS6ZJDzH2sx2wYbBb+TC
 A1tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWATReoj9aL2ygqzt/Af6/gc3Ypwt09meYGDvxSFRG4PgBpzBrrqtxNIlbGB0sQuUz2RRVEN64uSOEyVfa6ayWNRvFShDSDvsSh2mpe49VC
X-Gm-Message-State: AOJu0YzGPZN9MZE3dFl4xWAj7qn7hpc2/L53A7scXXqo4x/z0t5NHrml
 s+pSyiIa5Of4CNyi6aELYIsdQwJT85+ULgsDHXJ3zRaT3LH3G7LqhltEoWNbJOo=
X-Google-Smtp-Source: AGHT+IHl87h5y7BdQMiyGdU96awBRn9SsFpVAPRjKIFrEljr2L29AbJFfqLCyOki5HDhIAa3XymKYA==
X-Received: by 2002:a2e:9f46:0:b0:2eb:d924:43fb with SMTP id
 38308e7fff4ca-2ec5b2dd3ebmr67752871fa.41.1719438367129; 
 Wed, 26 Jun 2024 14:46:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:45:59 +0300
Subject: [PATCH v5 05/12] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-5-5efb90cbb8be@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2729;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/RuCdxaOfzUqrs6fOdBxa45FoG97EDlhyPdr1MkoBOs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pNj0RGbgkjszHHxYVifTesr+383jQrxWLtGa4H3kt7X
 03/f+dkJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm4ivF/j+7TODFSobtN0Lt
 Ff7LLt3lv82IJ4p18cqdB5q9nSZ8Nv8soXk8U0P1YIZr5+HbmVrdX5d7pDLYXzWodc8XefXi5bc
 n2g9vrSnw+/0s2HXvLRfVpALtre7p/g4ti6wP77s16cQ7HZ6o0wcM3ykWNZXOtD0zfcI/Jcmba8
 LtEqdVFN0SSH6pFcWU1hH+SCSeU+2pvWhUcRGb8Aue8JBYjk9ZIr5/jQPfN79N7zcuLlbTf1YV/
 XXiIb1wowups240iTFds7FRSlvnuOXo//m3Jc6/aZw4/6lFUpC34r1vG0IqopUffr/Hbc98UO98
 e9DfkO5GIceSW7G6KodEZzi/1xDLe3V8cojXDUOxe1sbAA==
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

In preparation for virtualized planes support, move pstate->pipe
initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
case of virtual planes the plane's pipe will not be known up to the
point of atomic_check() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4abaf2bb8a08..325af392e6a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -805,13 +805,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
-	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
+	pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
+
+	if (!pipe->sspp)
+		return -EINVAL;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
 	min_scale = FRAC_16_16(1, sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -828,7 +837,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -1292,7 +1300,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1314,16 +1321,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	/*
-	 * Set the SSPP here until we have proper virtualized DPU planes.
-	 * This is the place where the state is allocated, so fill it fully.
-	 */
-	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	pstate->r_pipe.sspp = NULL;
-
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 

-- 
2.39.2

