Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CC79F7619
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F93710EC9E;
	Thu, 19 Dec 2024 07:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YJmc2ENs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD6A10EC9E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:49:57 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21644aca3a0so5552085ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 23:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594597; x=1735199397; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Kt1DlYp93VR60ha+vWGXO3XGir76XTQggij8rAuDIM0=;
 b=YJmc2ENsAGp3EcuiOA70FOgQzDgp18dJ/wnOueo+Y46BvnUfdoqAXbfP+ICUfJuotw
 eEIRNrJjVGQnT839czc3UL+J4V1p2FSxIX+uRY6UlH+rLtXRYa2m93c8FxjV0U40kb5w
 2SQyBCRrrnwcIFE/aMuO/szTKfPAxI7Bx5EF6iRaGCBFdMaCgkX65+Z1P7east73y1vk
 FFFJJrl/3Y6dbPLpmcbfGKwOA08SOU10m2HmsFC+13qO5n3s/hLGDWcUW+E3GMtqaWjf
 xEFncvbHJYT6lN3eWYZ6cgxS+Hin5ttODLWQmqNF/9oBTRP9/G5QNLDIZymhdxGx6xXv
 i1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594597; x=1735199397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kt1DlYp93VR60ha+vWGXO3XGir76XTQggij8rAuDIM0=;
 b=TpiHBEYJwbKKQTzcBFR/1uZbP+Wg5rdfB8I5QNGAgnUV5mHg5uhf2o6RC2r/9ve5rW
 BlsLDvOKrHOZI/KcG0oFloTbcusothjBSQ07v0A5EugMCuONUNhP11P4erUdeEH5Ed5W
 PIkcAXvmTDUH8FntABzMuDP7otNhPYPv43wc5D/4nHcu3lJJuriXVvPFDK901blUZ9Q4
 0UO1UbOlWnmpGQTHFhSUSxyMezfOdrYhUlexVTifZ9HL7x2440QTEnCSM06H4IlYkeb4
 iPm3mEwi6zT063QGLrd8GItVkPlCQJgaDbZcNeMyaXhIp5hHpcUVfcQANCU8FjweL33E
 NebA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWve7FEwm/YLKyMvj3gmMIs4JtjrRDMsCAQ3NvwT8ClP/uHBOBeQ/VrGzc2HyeJhxdrDpHNFwLL27Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX1TTbGU0bqzzPr+I6VUtW1RN0WFM/YtPoQL+ZjpAxyoyoXDvy
 f/oQ4ycnCo2NALxCZ5QUfUiFJIuMzuFPh9JhbRB8iC2+akTXElDs5eXqFbR5t34=
X-Gm-Gg: ASbGncvxLVwONMzGrkBQ7BOdkGzrthixzfZYZe/YZM5YI9+/Re+tjyJXfKNyoWqxydG
 kg+WveBnyNl0rOHfRIH2x6tFJdifIqP/My6g9rPikhFZvp+IJ7yklTejPD529bNwhrcsz37D5W4
 YoLdXX7B7OVildeDvm4cJu8xR5UArUgKYWtIpnNJt0phgfwIY85V4LEOD51xZWXuJ5/bT2x6TFl
 H+jf0+lu5kBpKIfjY9cZvmQBWEC3MGjEbXJBQS9wvK1D0kkfhltCA==
X-Google-Smtp-Source: AGHT+IEIuQm8BM3R5VmAdsk7F2I4BPZS0vz/z5taFEvNb6zAXkyIxwrf4C4EqP7xNztbzEzQR/bRgw==
X-Received: by 2002:a17:903:2b0c:b0:205:6a9b:7e3e with SMTP id
 d9443c01a7336-219d9901901mr40917305ad.56.1734594597497; 
 Wed, 18 Dec 2024 23:49:57 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:49:57 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:22 +0800
Subject: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=1407;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=SPyiBgL3hfMVngEeCufF2JBzxfqk/rbHqElyh4UjDxo=;
 b=pXN0nYxNuCAd3few9qkZw0NaAGt1iWhzQs66UXTaamXatgEGLwTZGiI8Z767QZ3Inz+g1Cy5J
 +a46j5hy40OC+6jLhxP11YqtKClm8L+DXz2Iar2rUdv0mCjmJ+T+eZ/
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

decide right side of a pair per last bit, in case of multiple
mixer pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3..41c9d3e3e3c7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 {
 	struct dpu_crtc_state *crtc_state;
-	int lm_idx, lm_horiz_position;
+	int lm_idx;
 
 	crtc_state = to_dpu_crtc_state(crtc->state);
 
-	lm_horiz_position = 0;
 	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
 		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
 		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
@@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1

