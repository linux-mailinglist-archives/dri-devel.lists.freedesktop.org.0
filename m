Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB494A385C6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE2E10E4E3;
	Mon, 17 Feb 2025 14:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SAQg2K3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBEF10E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:17:10 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22101839807so47939195ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801830; x=1740406630; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
 b=SAQg2K3EPB/xr/iL2e/2WCOG1ErnioRuyVOufaLhH6FzdPIDJwo/7y2fQeQBHnYfo5
 4mudiU8Zsl9xsCfFOb6uwuVIAS5ms3BoN3WWuK2alXcJ2wcZqtVTMEkuGu5dVbPbWgEG
 w6GJZNHEWiyxJXIUET7UAuJ9bq6i5HeINX+izSpLVBcBMNLySuDyHTB70pK4ctizcz5h
 Q7fIf7UXOkrdFHlRMEp7C59ovS75cE9be8fkNkSBCRKij7ytJgxlwJcfxW6Q0Iy7Q2yl
 Soqq9TuWpkqRDDpBKemiWyEAcJXKqziiXILdbeeCoLYo8txK5ria57PK53sMKOh0uw47
 woVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801830; x=1740406630;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
 b=MPu7ZHwZZ0OaEoJsNps/eZnSWDrDZH7HDWa+pGbnCjDA6YPKOxWSR2/tGFgz3wCmXC
 YgGjyUso32euMdn8q/wLpcrP0qsZrV303TwIGvSesRMA+oV+8myBK0cfPObcCtT4dZD7
 JAbbTkbbsG9n1kEB9DsgNHDfoME6kIQtvZq5Dcj+/6VpZB9ebrTJqM877FkDr054GrUB
 4eFAfLb/CIF3TN3LKcxC/kELJYuMnqrq5MHQZwIeSZNifOKIIoPRnB0YkxpxFfiM00Jl
 ktBmPjprYcZ8KorZDAIEO4G6CgAftIHohcesX5miKUKViaC+ykzaXLSFChkTYTpEgrK+
 EpUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjkFUMTqY/wQsw1EPMWvQ5Mo2IuuQaT9OnNshynGCiwbUpB7BE4mFJxxpD/aZveKOTkBlDwYrd07M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAJnA5uGJTdku6i1Sij5oh9eJtvOvNjgepBOUy+k73AzuhDRZf
 6P08/0f279ZxbhhvMf+pZSboXozAxJg9Sl2FUxKecFMYK6FrGBIp+2zpkv9idfw=
X-Gm-Gg: ASbGncuwQnb+seSXx6Y1QdybwGKTNhq9p0ciqtBvvzMkgIzoPvdUifANqvOa7DWBVof
 AZxwaxSQqs37EQgxhaCsElsONkO146I5DhdxSXW0CUiY0dWFJZ3gTfAbHQou1rbx3/Ru+CJKkck
 ZIMmIHRItSwFTIr3TmOuc2ndyjs+hSE2wkAW0NKlh/ISdaB0ossi2RGJiS2lYuODWVxyHYoQQYL
 933Xt8Fs6aX7t/8Ib2AG4fM7cjneIBhvDbi5ZOghUabItZ3jfy7oldPV49smUbCyB48IwYHIFym
 aO+iyDXQYeAt
X-Google-Smtp-Source: AGHT+IE9VGK9EgU1CxOnB42kWoFCngkyiKxATWGlwXIJ1zEtEGlL0r8wzHMxqCOdBQTbkw6fFe4mgA==
X-Received: by 2002:a17:903:28c:b0:220:f030:376b with SMTP id
 d9443c01a7336-22104057e3amr166616685ad.21.1739801830048; 
 Mon, 17 Feb 2025 06:17:10 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:17:09 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:54 +0800
Subject: [PATCH v6 05/15] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-5-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
 b=ndip+BiznQsCLk3gFRiHk2aOU+/6Y0wWrn1S88SeHOm2qcGPMaxjsFB0wWvmm9AhF3VwCkouo
 jobG/vDz4dhD4siduIn5Zlp9SCqd/s42zjGoVLwDm7AnDuDb+ikuCak
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

Currently, only one pair of mixers is supported, so a non-zero counter
value is sufficient to identify the correct mixer within that pair.
However, future implementations may involve multiple mixer pairs. With
the current implementation, all mixers within the second pair would be
incorrectly selected as right mixer. To correctly select the mixer
within a pair, test the least significant bit of the counter. If the
least significant bit is not set, select the mixer as left one;
otherwise, select the mixer as right one for all pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3a96f956d199398f12b2923e8c82..41c9d3e3e3c7c0c74ac9007a1ea6dcdde0b05f97 100644
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

