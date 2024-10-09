Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA89963BC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7CA10E69A;
	Wed,  9 Oct 2024 08:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W9oq2YUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB55010E69A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:50:34 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2e28d7d44dbso1195664a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 01:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463834; x=1729068634; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rQUSJNvwZ/PY6GUH9AC1To+F9Rww7eBYxG8hGTmYBHA=;
 b=W9oq2YUVQAM9BPEPb9foUI2PTqSc8hKYywxYgErfPsK3BJjzSaEx+PoEcjOd1CLrg8
 usLO3dsdY5QW0+P0QzElXF4VFEQP9qPwMcO8zsY9YGqnBjTFIgxWJ5fjt6J/P/AIqu4F
 BIx1QTPVtRZMkkfvCL0nO8hp+xeqChHaWWB4p67GKBHZ4GMZerXUOJck8xa+dDuwoNEe
 Qy6KgtFkDlL6m7ALHbh/8Npp+sHP4nGE1uCwRdNQxqHzi6sFR1xeDI9GrA1D68TVZSBp
 47iQ/UzmUSK/0dG9umKgaGW2ctPuuWd/j1bLYegAwCYpwyglAlqUOQEaoRmVGms+vCYp
 udMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463834; x=1729068634;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQUSJNvwZ/PY6GUH9AC1To+F9Rww7eBYxG8hGTmYBHA=;
 b=PgJKL40mRMTNNC60izn54SXgO6aNmN1JW9/rQwtDTBNhd5zAJm60PXqrapeV+7u6jc
 XNj7u1JG4lsWYpT1ibJiwsNbOIN40B9pb9cI2vgBROVtatDda1+fW0TvaVNwnAUY4gzr
 vPGbT7CblaQl++YoiWYyFeVU5Hy3DH1Fgc1oxODOaO1N7leP+jrwM1nKh1b3RwGi1Kqv
 ZJXSFk9EIEsy2eQkg0FhDROsHx7Ktp6MP17zK2P8MvYbB1T9mnZ6ndMoB5aWLKVCBQgK
 C5CiIrmvnW09MfuVzDowp7rcATS6eElFlM1gumpkP3noRg46QTIhrBpmHQ8Pg4c5gS68
 fvhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVexZ5L24g3ztPAaGOTTU3pSilhRm/+KK/xR6YfqHUwMrcuituV/K/YYAFHZ1rKCfDTl8EZCxamYbk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtfjlETRBWg1UhzFrtMvuPtyTFL/AUswSPBoYwCpVgV3Hfzf1q
 cN8bqWucCY3DRnNZa2CSw0LOqRZGSIffgNdAtMGOw5rndBt6sqUMEopc1YAbT9EFfxIFn+yNmvJ
 fChaXHA==
X-Google-Smtp-Source: AGHT+IELZNGpZl+o9brSMTMV2R5qjLAQnLo4r4MZsTmntvKCuRTaaBljTAzcdiFMnYwOHsV1z7J9Aw==
X-Received: by 2002:a17:90b:1104:b0:2e2:9522:279e with SMTP id
 98e67ed59e1d1-2e2a25247e0mr2199871a91.31.1728463834283; 
 Wed, 09 Oct 2024 01:50:34 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:50:34 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:15 +0800
Subject: [PATCH v2 02/14] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-2-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1407;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=VkIAGwnZaBvIGk9O/Pd26yOaUH9F6U5Y+Vxq/wNMgsM=;
 b=aojPxprQ0psdASS4m8/E0MCuQj6okV8Fejiw7zVz4jm03ih52aCBaafWdJ/sa3xxRnZyuiX6W
 CVGfU1DgFG7D5QOSOi+332+U+ccsaaKBjtPHPV9UyH4D/pH/Nk9Dih0
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
index 7d0fff9472441..3e0e6e9757da5 100644
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

