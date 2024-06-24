Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6549991588D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CFE10E4F9;
	Mon, 24 Jun 2024 21:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sTZNFQBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1352710E0C3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:51 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cd6784aa4so3770064e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263629; x=1719868429; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r3jPJKGj8OxSKPS5o2ejJIGV+0itdtJDT4TJvhzbiLM=;
 b=sTZNFQBCmzDMyDdWduCwLaQGojqVMI3xBcuJQusmomd+xGkzE9jUOVa4dqBgq0bJRR
 epDlHPdEHhzOMoXCTZJnCgTqpVYgN0aTJoqOWP9732r05pzpxiJOP7tvTcmBqIwKw5Dj
 4O5m2e9TrlCbsAXh7fuY+DojtpajzatAchl9VnlSV6bokNQINYEvEXfCDCNr5/nzmYT+
 MbfCS6jyoLIcyc8OULY8PItUPxYrtI6BLbIkHYwmeDZb1qT6sfMlmHOz/fK67jkhvdR4
 SqpvQJSpzRI8Zn04wIGYEfwdVcllXwbv+KZvqPuBpv98hG4saaYD03czfY1e7rn0SiNw
 Miaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263629; x=1719868429;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3jPJKGj8OxSKPS5o2ejJIGV+0itdtJDT4TJvhzbiLM=;
 b=rxpxCk76N3iyBoasikX43pZeBi7C8SALh0j0htHaGXKdZQNmk04mLUcWsuPPNkg1qb
 xQfRufUUR0BbURygwn9/5IS27YZ40m1AZW6zZMhMRpN7uZ/CS1wxOd/gYFIRhw7L4rP8
 TMQV7wPPa6ty1WfoGXeB54UuABqm+zjYxtDns6Nt5+tFlF6K0hHroTBT6KuCyKPk/BgR
 cl6/+KSDYBeWVceWJSAZ43Q3+M2Lpmtu5lNLeeoKb9kunLs3M0qpJovlDpsxGW6iicV8
 JcilMd2UAZ6TrYInG8934qI5tD3uAOqeS5Gvek5CT79SDeZCLHPW5K99bC2AxNls3dAD
 clfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE+W7rRYzk6L+9ryK0oDHitKWhfK2Olc/84z/UmoeA9MGB7oKd8gUKedfcoB6kM3mX0iWVgz9iw1InPmUIxyLCqmPmeltouFxinbNbiXhX
X-Gm-Message-State: AOJu0YzTlGu5ujwlNw+dy16+FL1F20rAo6OUa5go2OwMGpBg1YEKp6Pl
 xr2eUkFJIKM6vDIRALjf7qdIMFrBz+Ip0pOfd7zVIrJKIxiTLUCGXT3daBS9OOY=
X-Google-Smtp-Source: AGHT+IE2ksgrDvI2ZK/rqxLb1NZpwPHMzcv2tHAiT2lYswFBq8Xa1yemNgrnfbOYnplhOqbCASj/SQ==
X-Received: by 2002:ac2:58fa:0:b0:52c:d7d1:7398 with SMTP id
 2adb3069b0e04-52ce1834ef3mr2796862e87.28.1719263629196; 
 Mon, 24 Jun 2024 14:13:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:44 +0300
Subject: [PATCH v5 04/16] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-4-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGHau3jG+LHhLUbXqLeJ1OV9spwALOWi1bbP
 +1TF85YuxyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhwAKCRCLPIo+Aiko
 1QWRCACbAk5hQzAEAVWL5uiUIL3qm2Adjsb+y+gWBdCiFk+W4IpeMiY/PzZ7ydcGwVV+z0pZb+J
 Png8NJ74FzJygTc3VAzZebSU+TgIFDJMUt3wGtzWxudsmHvICA3xbIZyMFkLucCMODBXzsQKkA1
 DkitOcOwm6y/wMxtebhTr4Z3ihVpJjcJx+oLepapyz7IhqyketyHShfRggOKW7ecCs9yn4RgL5i
 mNdnJUesMHklqHlIzJz1ILbSYrJye0jTZZ0RWW6iQeBduOh2wcrwxPV2srQOl6lCjMt7/aztwzH
 ettdNEtUkVD7CjoAF6OAKN3YU6KjbmkINCpVOj0mtqazZ2TL
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

