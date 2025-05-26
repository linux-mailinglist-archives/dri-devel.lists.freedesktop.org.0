Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F785AC3CB6
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E131B10E307;
	Mon, 26 May 2025 09:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zdKJsx4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6351C10E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:28:45 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-742b0840d98so1292892b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748251725; x=1748856525; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=09EQIdwbqPWaqIZsSaoyN953CphfLgGdEAZpUMvdFt0=;
 b=zdKJsx4rOULlraT3t5++UkQHpQIgehfk2Op7XHsdMw65E0sDIqFW0hjQ2/1KAxlQlS
 Eb+Lh3O53zCVQXFIfCxMx8MMIw3XIwgL0BoeS0fe//wh1aJSSjlhlR71iFUUp/2vh+6n
 5h1HtlhzuTpSW99LeZQ5SIgF4CY4NoTtOy7DVqjjMtc84g8oiI62ZyDWimdZD+C74cXH
 z7KRenw/w+boBhJ/rasTS9/ASLyfRWog6UixhgEMMbhkXKr1qhvB2UJWf4gMvPi7m0/K
 yYh3lHMnYluZR0nWCVnB7vYX087dga6aLmcxmzHCeMquHBtWHSlduZ2Auh077RxiPsIb
 TauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748251725; x=1748856525;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09EQIdwbqPWaqIZsSaoyN953CphfLgGdEAZpUMvdFt0=;
 b=Y2BdJp96AviHcueFz8HQOfV0eCo2hLfFggxF7oxolNmRkq/nXJNBDj4thXcghHInfL
 u+7uBl3QsKx+gYJDf/HFqo/AIBeAwWTWmLPiYcEo67THQ3ZFTMoJZf8dQkDHF6Aor/38
 yoYfFeYhb3t/eVSb2HVf6KQOsCwohAR3MxA6+YGxjeUt2tHkPAjr2PshR+oFPbrFqVAA
 Mi0FSN8J0NP6sqSZX6uX7YLDdSX4HemQcA69bVceY/qrq+rmDyfl0NTNhDpIlaf+2qZn
 5uKcLARDAbU0MU8FXZRnDw0E7bnf/upJGeemhvcHLuPXKMQE0wqFXufUHnTrWKaefDuS
 kw6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIeUApfwD4RgHdcGYhzPpLQacWId07KeUU0wQzTcDt210lDml59+OR/7aNRZvq/gbHGLywk3MIA5Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye/PxBrLRN6EAYd+agq6QLU3NmFpv85UsiL+WdMZlaKMvuWduV
 1UDsBaIH253TAC5ZGkDbB5zCQFoyVmfXTDj9KbMFR+sXLa+iBrAnlTnTHuM/6Pk2ENY=
X-Gm-Gg: ASbGncvRgfMCpu13rvMzrv5ITilhTimdJYC/7oWxzY/xgKRDi4cZpCgkC4205eG826c
 zoDkdmGSJK1pv8GnqB7ym9nr2r3QTVvtCAsXn4lK7E06MXFAwNyQRGQTMULxnS96o6PNZFflrle
 LFcTz9WIipMCTqGXe1vvTMYtcYHe/4Y46PFtuCjOgD0Au81IjDlbTy0BL8Smo5cJZqBRdhsoFJ/
 UFck1MLIL70UYv+KYH5sfLAZTEfkJC1SXAHvhVAK7b8PP1z0Bxef5hJqqG9CV4KyQifn/Y5LBUa
 BFjZXBYUy5Kpyo95QKfNoGU6dDA6k/QZEM7uQn+rsBQehhV3wQ==
X-Google-Smtp-Source: AGHT+IEK7rjKy/mvMPI79Z4WD0PENogcKdMFyBxYzHit7/FRHxn6LqQKn7YKX9/af44617gled9kLw==
X-Received: by 2002:a05:6a21:458a:b0:215:f723:81b2 with SMTP id
 adf61e73a8af0-2188c291d4emr13919461637.21.1748251724931; 
 Mon, 26 May 2025 02:28:44 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:28:44 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:20 +0800
Subject: [PATCH v10 02/12] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-2-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=S7+JCdaVrPN/DIMlTCVGutgCbXcGk68o1VHEmTYxOSE=;
 b=DUdNxB0sCyTbGte5jKBqLS0uSxmc5nRMsJ9oKNzhyZSluKBN55Nfb6dKhKiY0NmrXktj394Os
 mj7wbw2RxNBCsqV0SEhfqN3JC/bKmjSSKSEeYgBXEQ7BNuasTvCvYJr
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
index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90941ff4104f620d1f4f18ec260418ee59dc16b2 100644
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

