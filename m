Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB037A133D1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3213610E1D2;
	Thu, 16 Jan 2025 07:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zsrIYJd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D2F10E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:27:38 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-216728b1836so8943915ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012398; x=1737617198; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qTdhq4VV1p8sI/sD4KKAgTBHIjk6vqmhDBvjFFMXUWo=;
 b=zsrIYJd62Mq9+Dvj4yXKH6mIzSm0J6hUFQKplQ64OWUXnU0ZEkNjRn9OJrhwVdxEPx
 IjPrsbaFv0iz2kWqXAWwo+xqpdr48QfrYGFf8Ode8ksFgA70sX+X1VeObEpqNuL5TTtL
 OuZIrt2vPRgTgZuCIacbAc25SZuUM/Zz4qXCPVaVNz4aDnm7ez7y6/cpQHT8gfPQw8rt
 rsBqplwJORSANeJFwucfs3VfdWZIXSmwhLo3Kf4cH/oreDhapPDGX5XOzJelIolKapYk
 ak5K/wXJBLqQH6nQGOvRKL30/EsE0vqnppY/LOn3cZPssFH5JNTxhvod+e1J6oR72LKP
 Igrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012398; x=1737617198;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qTdhq4VV1p8sI/sD4KKAgTBHIjk6vqmhDBvjFFMXUWo=;
 b=vaZnOFJMo85YDal6vOjRXu8GO4CEs1KKM9GzcrLHj4DlpSL+0hCRZWWiesYxgw8e/l
 WxbdzAzVIsLwjI/ZdpdaApe1ggTCb+w+nLfumCdBY9ZdJAS9BmsNGUiU2h+6urOK34EF
 eC6RtytZvMcAipWhQUMnPklKuxErOvG3dmT1hvc0M6+S8pY0h0zw0W9WIf3a/lOBI3rg
 jKxLcSeP20AnBNsaoJD2JLEDctsC2L6TQDB7uWako+c+FdqHpsuC9DCKw1API+6djrX8
 E2loWf+uCE3hXsG0Q4gznrQGjLM+hwx1g0GgKl/LppTwDIupqHcPiRu+hdJW6NCsq9bt
 STow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC/jFQWKKmzneo7aqUegrXnJQtgh9Ut1ptKv0SKtDNpURd6yzfYOwDXgFLg6qj/ZN2c8VhB0fqNpE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxykU0UOdvuU2eG131i0THmvWc1ylzfB1FsYD5xHflQ03aLDRH6
 M4VW4kJeKjfej2WO23A7W50XFPa1GgELb8A9twotWay5Mj1L5dZvrqJ3+368sIo=
X-Gm-Gg: ASbGncsJeGLNqQp7po2IE2yRKXPHZrQy1A6XwDY/YtzP1TpYNIGieyc5B8TtxObsWKY
 zn42xx8o7fiYvv0eSo2zYPVkHG2d1Dg4+Jtmr46sR7DTuTAMMU3kZcz0bDcb3iMKMCbdOPYBDMo
 2ZGFf+8Jg/DliZyswm66fxM0+9LICDGGLSOEFWf4+qSJ9XiEui+zh5yVTHx4RMFvOAUXrQcmdNs
 CZgD7DlnSblKlcfL+ylwwC9clrU1JFOBQH0nI1yiqSXBbkG8m4dVw==
X-Google-Smtp-Source: AGHT+IEFmwa9UMtJBS31GZ/YSfTUIQ36PDJ5YXIw4rQjOAGVHhUtIXvnJoh3fGD0O425TbwZLWZnYQ==
X-Received: by 2002:a05:6a21:100c:b0:1e0:c50c:9838 with SMTP id
 adf61e73a8af0-1e88cf7f7b0mr52730195637.6.1737012397875; 
 Wed, 15 Jan 2025 23:26:37 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:37 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:54 +0800
Subject: [PATCH v4 05/16] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-5-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1861;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=qAgqtHlAOwpHUqDerS0/cJCFiuhdtKhvQGxQ85X3hzU=;
 b=nYX+t2iPxxESGggCq7MDSq8ZVJaS7lbw3oFXd2oP1CtmPX5VVvQzojjKlCNyFNN7R1IFwBSja
 ZHoRK/9d66RADU+ceupfeIO77JvcZmJ8lIbwdrN0o4K56z0RIuJ5HT8
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
least significant bit is not set, select the left mixer; otherwise,
select the right mixer for all pairs.

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

