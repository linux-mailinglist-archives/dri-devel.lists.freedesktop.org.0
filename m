Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A901E9150A1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C871D10E4A0;
	Mon, 24 Jun 2024 14:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ly1Q63vk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8F610E484
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:18 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52cdfb69724so2032227e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240436; x=1719845236; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r3jPJKGj8OxSKPS5o2ejJIGV+0itdtJDT4TJvhzbiLM=;
 b=ly1Q63vkA5bzu0Diulr9wEQRbFJtYUwhZJq283cXOS7K8yElSQNMeUUrYST8HxXbCM
 iAvRakZ+Vbg3z5lztkKjinHMtIQvlLGMm+k/NQnf/KaJaVBH/oV/V7rmzaxE5Bt054Q2
 loF9uUaesKwemm/9fj4DAva+FL992xfNV4VYVCYg87sxAepLxCNAKZALZXk+gVCa3Yau
 Mf/PIfwPKWqkgKbRmPR7nXcTiHF3FPV+F18Xpv9NDBP7nFSn48sIrFfVjhI3DGpr3fyz
 4PdXA0E4kIuiG+mRXw6Tg6mutvLxnRKoTQH1MNGxd5WNEBUeGb5BFkyBHkoSYa2Wf70Z
 JEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240436; x=1719845236;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3jPJKGj8OxSKPS5o2ejJIGV+0itdtJDT4TJvhzbiLM=;
 b=el+WINsql7xABQtsOodyxKu9/mzCFZWNxKtGg5ett0mizMSGQrMtz+cyo1cFzXVeX7
 cvePmAK4F4FlACF/ZwtLve2nuIbYECqpTLMiZ94PH8JUe2bQ2h0aX4vETAVnvBgUMRzT
 CFGj86WX+TjtIkoBkngfO1MLGClDOqF1Cw7GIJij0vZksAT3syapYTCjU1+ve1tiVZNH
 Q5deqGQUbEs6PS1i6YZJaOycfC/kvfGE8qS1v+gHCHtDixgIiVCAyyBEOltJ9uqyYYBN
 oR+TSHP7GI99GwM3E1kQV4IFCU6sRvMt7VvDVJYdysUJpaUcoAThFLJFpAQsiNWvmF2T
 gbrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZgdVZ1K7zLj/U2AT73Kha/gJNnphMFKYrDTWnw+wrw00kqKH5Kj10EV3ATNgtggR/6KQxQGbrRd2qHmrJrrTuuNeHL5aAYmf/FGSeiD5Z
X-Gm-Message-State: AOJu0YwusQIRHvwmm56CBwIOzkGKBIjIace8n5kJTuyNs4PTCAgNvL0p
 l3cNCjuIEy+fgNTBGO/a/d4HzjshAvlPv4R7KC0pdAzkMUzJK8RdEMqkjDQ3tKc=
X-Google-Smtp-Source: AGHT+IG2rVpRnuC/or1aoJ3OgIsBYkfVlsZjqYs6+9vSqSRP0WPwAHekhHe2O4QoX9mTOt+dKai73w==
X-Received: by 2002:a19:911e:0:b0:52c:de9e:194 with SMTP id
 2adb3069b0e04-52ce1835b48mr2505822e87.28.1719240436733; 
 Mon, 24 Jun 2024 07:47:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:10 +0300
Subject: [PATCH v4 04/16] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-4-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CZE5vDwajgZiWlqIb9olYzIUdaIeeSo/h+Ci8Lw3dmw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbv8tPawkIlNzBU4WuRY5zvu7hLWv5V80J4r
 b43g5OLjhqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7wAKCRCLPIo+Aiko
 1aLOB/9TRPnoQotfNBwvjifZD/Pvgrbrm8iQ5GUzJNnUHUiyeYJvB1iNjVIOcXqvtv4T/QeaNQP
 Khr5m8POepERwJDFEt/ZTbPdHsaQ7l7piTZ+F7MGFvG6m6zQ01ng/NqeD8UNDju1QLGhjD9GhVK
 qyiBtOiJEfrTP6tYmBLh9fsNE9Cb9Pr7mDZW9p4x/prlW05o11nxvQvxHt4gQlbiknlb6AA6ZNQ
 JrbbDfVV1K9Whyu9HS5tdnPh5DSq6/4nHP6l1lco2dGyiz3RKPmNnbWHr7uSQaZlAbkWeuRUbcR
 cMYfWBjBS6IQpYWumvOaiyRvRTpTXHJy7ig1882+S834duvo
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
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7399794d75eb..2a87dd7188b8 100644
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
@@ -1194,8 +1200,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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

