Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6687FEA9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 14:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5429910FAAC;
	Tue, 19 Mar 2024 13:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KFxKM86E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5914B10FAB3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 13:22:10 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d4979cd8c8so30649471fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 06:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710854528; x=1711459328; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dNAKoiDHewNcwvkzDamm6bm6LBy8ay/1mKzk8jCSgik=;
 b=KFxKM86EdHFHJo1vP+KFtVs3CX5aYxpD0CQ9m2AITYLiWyGvza+tGXDPOQIeXOF38L
 jsuKX9SeoIfb09MSDIGbAj9+/m4eUwBF3Gnq3oum9IaQ3ORP540MrVEjZtyXSoBEl+rN
 8aqk6QvKp3RimjosQjcWGxDLR+qqc+Qr3dXMvR3P1jD1pWsxJ5O1XBf13yWGtSKMs54E
 M258FAA6dpKZf9UD87kJINlLiaxVLifeDKV0FNZTS8VLJgn8xUxWajOZc18p4VGgAbbZ
 vk3SUjn40EqykBqD+Pa7zRwf5DR65ejNo3DRE1Aa0+4pyxzyce5tmquEXrza/oR17teg
 nyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710854528; x=1711459328;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dNAKoiDHewNcwvkzDamm6bm6LBy8ay/1mKzk8jCSgik=;
 b=ffUG1KNE0yYWE4aIRLF0vp65l8iGIQc4bDgNEW5ASExA5c6Cg62hrcSgSSMWwMbXjO
 qqeu41D+jQddCvSO22Qv2HB5q2+Rke6ghW4sVNbL8j/BxVFzlTpgqLJ6E0F73SwfRKWc
 2tpnB54hVg281AMVi9shKYb/LM19IqCqBBYx7vwX3b7stz0g83Clz/y9dFVhlwNZcg2f
 xwSpLMRMNa5jjcgoyMrM3wz+9GkvRV6BEJGjkgMbzSqifIVp/fv0bYpCI38/c01S7TlS
 iNtmZthgwYnS2yoM2KZUZmMdDecsfsLV2qoriI1roL7rZ0B9xCYsTUKbLUirBwYwJRdU
 0JEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj5LtBdbmdbBil3oxaRa8i6DsR7296DF5s8VHN1AG+tK2RanXpeP75AFWQClNcAqdk+i4JfPYpRUri394pRu+Jt/NKdhVFKh7EwXUFGjTL
X-Gm-Message-State: AOJu0YzhL8dMYkFQrDuTm2O1mFuYo9tIR58afzv8fLINWi8wzHTAXlqc
 o7YSwuvX7BEtCjL5WeyWsaDRHsg8rWZ9hwyYKMIL0pPh+99NDmy+vaiyrbSn0412NOy9drl9SQu
 W
X-Google-Smtp-Source: AGHT+IGa1lacsRP3poDQ2kM+iUBKGdvnsRXaJcUx3u8Mbmmxifx6l0Z6sDcpXYXh9V2xDGQRRGj5og==
X-Received: by 2002:a2e:2e06:0:b0:2d3:17e6:3b4a with SMTP id
 u6-20020a2e2e06000000b002d317e63b4amr977739lju.23.1710854528370; 
 Tue, 19 Mar 2024 06:22:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 06:22:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:05 +0200
Subject: [PATCH 7/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-7-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3qmqU6bSN0cRP9BWJnA7iPyjYtQle9jNYPKUby6bjiA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rPiRUW0/52N5rue6gUIPaqUEw9ofQaS7twUuvWyu2ps
 fsZXoR2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi0yQ4GBZyCyWyNrNGR53z
 tbnWdmNZcsWFw7evf1nrpvl2QensCy9FpNxMDVJ/8M/cs79JYZaZ3MfXx/muTlXwX8Lgp1XCcub
 dj6rJu0oSzP6zsgT3xvrXmU+6odx52ULBKljDVuvbpvhpbz8aH1aPMdt0OVh9Jv/sh9Fdqjk+pS
 Ff0y5be+zZG75of/kt0w67CWf/T7h6oaxotpvvt7ob4e/04nfU6+3f9fJGjfOyuEeHXrRdW/mEW
 exFMEvZ7soCMfOIu9tLZGeX8mbvKi4KCD71qlO9xqzGLjenWn8lwxwuJ8H54eoC/EJb/qvk+jie
 +Lw6+sCWfYptlUa7eb5Evt1/RUYrwUlIZ0WS75n5a5wEAQ==
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

Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
LM requirements.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 64befead366f..2fc1c2729bfd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
-static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
+static int _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
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
@@ -1195,8 +1201,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->active_changed)
 		crtc_state->mode_changed = true;
 
-	if (cstate->num_mixers)
-		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
+	if (cstate->num_mixers) {
+		rc = _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
+		if (rc)
+			return rc;
+	}
 
 	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {

-- 
2.39.2

