Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1DA15385
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E647310EB31;
	Fri, 17 Jan 2025 16:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ql8k4v3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C7610EB26
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:02:37 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2166022c5caso40711915ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129697; x=1737734497; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f3yunoLlxWRJhy60D0YWe6I34aii3wtHTN9FRAZaIpc=;
 b=Ql8k4v3Acqfaen0bOpSsi+rE4GeLmaacMOJ1RyrRLieWb/vwaIfLjfe6CBC2k6uCDT
 xp5YuYLVTEZjBQa3+x5yNP4EmYB4KdS9LMmtYE2BtOdv/t84HB7fAOymZLvQwnDmCWZY
 Ktb+H/LgRn2QBh8kdna0DWJkw3/lHhF+g48g7rplNg4jq8q4Vjznl0X+WjXcuifCxKQM
 OOe3Gpnd/6U6e7DMt6Si2iCSjVmpiHNRTp5RQQblIKpWG1CyOwfIzzyS28bD874dTYWQ
 ftWsUNM+PNzX1i4pp8F4/g61DzBV0bDT4ysn6IRDCVrJ9urH09fffEj+TUZqRqgiUpke
 9ZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129697; x=1737734497;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3yunoLlxWRJhy60D0YWe6I34aii3wtHTN9FRAZaIpc=;
 b=l39z6jz7JA+arcMrWIIYK7Q6YVJbxoDSoDvSSr5FZ1XBLDh1Kqmv9msfXaPqSbJvxi
 sXRDw/KOtHEGt7Q+0+cbuxC5CzzEvVHGfi6GoZT7aiOy8khbvr2RD5vo1MtLaa5XJO9O
 ZG1y9RXRxDUdRWAVgEWyQuX9OX7foodmUkZ+E3fQgaGtP54l1d85m4Iv+LPzvOt8YfNG
 98Rkd+KuSUrVvtvP+o4gvQ0Qj5k9t4WUo1QPFrsazBrIzLjeBDgsCXiPmW/Lg8eL+L9v
 1ExIeSdYcTkRToQVRkqiSa35Zi6JLpUtci2Jk0u6BqMvmdnWb+Jq2aZ4uVFLzpIbUELd
 OWSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbn64pAPmZT7lRZs5CVqjkwE3bqtBog6j6yTd3UjbRzwUwihIwfF/GIayosogaTrQK6XMDwR65WB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1QZx4q+1bwNRdTLRsqBJ2+M854gRfjew/Y+menLoLnQPmfh7k
 p4nshiv65f2Vk1edqLZtbwAPaPMFeQ5IzYv1wDyO1W51bumQJWNwZJn2AI8NYbQ=
X-Gm-Gg: ASbGncsHp/MVpVTtrWtACK77xqdAS6lxh/huU5QoHc+8TdtIMld7svW83fhEcLULU05
 y3+OY0Ki0vf2Blpxv78L8iRXGp7yzFBzE5DmP2csSs+m3xkbun8rjKn2jcVLfFTyVTpY+6fSlpA
 aw4Hmko1ikKUWv9w333NZDuCi6ralTO3d0LtRuWAwhFdjo0wq/d+I036OIR66oe/wmhhWDNOKPL
 X2vQh8dJNY0rSWiMksBWZj0plblbKYQfrLQPzPQ20lJDhzI8N4kBg==
X-Google-Smtp-Source: AGHT+IHqJfGxJvCiAv1ftPN3BjOhgudESdN0Zw8GWxYpwMLaLfxmL+8riiyZMGiCbXS9vMyovccAhw==
X-Received: by 2002:a17:903:120a:b0:215:9f5a:a236 with SMTP id
 d9443c01a7336-21c351cfb3dmr35013005ad.6.1737129697086; 
 Fri, 17 Jan 2025 08:01:37 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:01:36 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:48 +0800
Subject: [PATCH v5 05/15] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-5-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1875;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=omFb8tC5BYgDB/DLsxGi5hvIkUiuwMAxXfTrryE65M4=;
 b=+PHLNBv4YKhyEsM/qQVuxxt94qq2IbjBKjJH4LJFXf/Nz2dVkh8zYljG1h8J2fPBZThfV6rt5
 xMwCi7Yrhu5CaTsFjVKn/HX3fJx7CVmZetg2lR6ArDl61jdsFuAyGnd
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

