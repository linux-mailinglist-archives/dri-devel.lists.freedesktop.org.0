Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03238907EEE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDB510EBE4;
	Thu, 13 Jun 2024 22:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lnT6vuIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECA510EBE3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 22:36:26 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so19990611fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 15:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718318184; x=1718922984; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d7jMEkdSEDz299yHKQKIQ1jrFL+ApUnOqabXFYC3R64=;
 b=lnT6vuIXwL5eWniLMeEAdo7xiVLvQ492NRnoCda0wY01p8L3KkXKLeKhNNramlL6br
 GuM/MGMBrfKsf7F4akUdRjX/cxgDmyaYBkoHx/eYR9GKkGkm47+wv6zQJxtNdLuNaXun
 8JF2k6l1qGlhKsYvxl/XL2lC4PJRTHI5kR0wquJayZkPmOrD4EOTnmGU4tBHN1w4eIUD
 mRhqGXkc27W+eCWEpK8yenHyy+lsXk8VX9XpnbAjqELT//9ed66DQubs6PFUHskO704k
 9q5972SwkgnAahDcZpxjYI23iyqrD5rd+dpWQ73JDZIEMI7n8KXI7KCo8B5Q7+o6lm72
 V36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718318184; x=1718922984;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d7jMEkdSEDz299yHKQKIQ1jrFL+ApUnOqabXFYC3R64=;
 b=xJ1ZFLJobhGizTDrxBhJPV4vSBRWyu9rywvYZBns6xCEF8gBDXtGsxwPtD5YPIBiFh
 HBehYrDKu+3ZBjjnNf3voBBMMm5nu6QGElm7pW6WbxoPW05NKRK6autRV+kKo6f8vXRO
 5LfeNpvKfC6qvp098y8VvxEia3hrLaFzwwpaDtAWMdw+seYBVK8hn261cZeUzUAYDKS6
 btjZRJ1KnjqvwinZGgOBHWWinPonW1aQMTWkI6QRck1ZXA1uKCtwKVU7/sC9YhEC+LDo
 KrkJwVQ9CAQnMF/eUogoqAQPHFP4FmnB/9x7kfIV21pJ1Uc71+6W3A1HxqA121nuhh55
 Z7WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFJPRT5dffXNQ1phPUX+9UDGJvDA0OGKk7NrpXJqT14apPaXBJVzSU0kvxurMTjjKnyl1iI04K963ICpFiEynBLyAlXOMFLN/300AJDjxn
X-Gm-Message-State: AOJu0YwEhGHb2FCj5YKMVjTpB9QcKqzTijMhwgHHRbQuVkFnlvaxdq4A
 Mpy+A0HUGdm+if4l3rBlWlf3ee+6tscqzKmgcvDs5TAd+Aaw6k2UQ7jJzg6GTbE=
X-Google-Smtp-Source: AGHT+IFgPLu1htnP2BmoSQebGt9vmn8eoCydTJyPqNrbYznyW63TchUlHfy0rHpjJiXh+A/1b1oLlQ==
X-Received: by 2002:a2e:7018:0:b0:2ea:e56c:f898 with SMTP id
 38308e7fff4ca-2ec0e600462mr6546041fa.33.1718318184487; 
 Thu, 13 Jun 2024 15:36:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 15:36:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:02 +0300
Subject: [PATCH v3 1/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-1-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=k5AxVBAg751483RoZdOy+nlKC8NcuvgV+fnhcffv2Yw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RlW49OCTPpG27+0A2iHGeKFky/sqczxDH6O
 H6UZukjW32JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZQAKCRCLPIo+Aiko
 1UlbB/99EudEEatLMPGrK0OVB23kjtre2i0vranT3Ug9A2So+6arY6Mc+OqDNo1nh0tbLgH6Iuq
 bzI8z4a9F3qBS2SXWbWXWacjMsA2L7Ot9qMVc9Y222EIsFho8e8jZBG0L+7bQ0VCeemUt0TNab0
 jNW7LlCCXNxDYngjhj2WOKdwYB1hgKn02eLQOelFo+184NQWQNV752fbxRHT5DQp76fq+8AaHEp
 w1bLZ+RERCUt6ZhWeNFWJfdfdysa5mneSQl66WG5M1mf8hhR6nyQZ9dRRjPaIm5PxAdUqQBa45O
 Y2GH1SEPDeEXMDXr7Y6RWjRHCTDK58hY/gM6ugOYJv8eg1oz
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

Make _dpu_crtc_setup_lm_bounds() check that CRTC width is not
overflowing LM requirements. Rename the function accordingly.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f2164782844..b0d81e8ea765 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
-static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
+static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
 	struct drm_display_mode *adj_mode = &state->adjusted_mode;
 	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	int i;
 
 	for (i = 0; i < cstate->num_mixers; i++) {
@@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 		r->y2 = adj_mode->vdisplay;
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
+
+		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
+			return -E2BIG;
 	}
+
+	return 0;
 }
 
 static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
@@ -803,7 +809,7 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
-	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
+	_dpu_crtc_check_and_setup_lm_bounds(crtc, crtc->state);
 
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
@@ -1197,8 +1203,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->active_changed)
 		crtc_state->mode_changed = true;
 
-	if (cstate->num_mixers)
-		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
+	if (cstate->num_mixers) {
+		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
+		if (rc)
+			return rc;
+	}
 
 	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {

-- 
2.39.2

