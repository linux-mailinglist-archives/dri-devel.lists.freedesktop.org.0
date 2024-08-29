Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A372796414B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B48510E61E;
	Thu, 29 Aug 2024 10:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RDohEStV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8202E10E61D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:20:16 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-70f624c6015so128941a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926816; x=1725531616; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y8bZPOFtZouu5Teru3SXjHUwrTGv8xZnRnBYE1IpFB0=;
 b=RDohEStVxZ85gO1uCu6fUys7gvJaW2DwL3IA13X/MexEV4SJ6U+/IIYDlcaBF0qLB3
 0Aidq9Y/JQP+4s5dN9B54CSqE1WCeoiOZUwtYnR546r8gDze8Wuvr5RMxBmWejWTgrsU
 YdzTw6GX/TfkgHFNfxwaZmpNTUIhfP5wGkdLvpjSrkLzXfpfdiqjReqtOvjKwNlTmAbK
 2LDx77Ub7WJ0qhFP4ytF9Kqd17qgvhWHQ1MBUWPc5k2Nl6kKXgJCHXEnqH1zEVInQnki
 DkEb6yZ3XUYx7tQfpeJ7GSgPiMlA2tHQ6CpO/DnZwqFfg07CAmZ9vTQVsy4aXDnvjXn0
 R33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926816; x=1725531616;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y8bZPOFtZouu5Teru3SXjHUwrTGv8xZnRnBYE1IpFB0=;
 b=u1aufPhxskgtKutGZLOJFFud3ocIfCPXw7tBDwoGGFtbXtQusd2avXdSAXgJwXps/x
 eRCwJ/iNiBPlxEvrwCGDHRQAd4LUtvLV8+NX/NGYUQPgQny0rmA77jtGnTm57EdhF99c
 TM4df+Ht3rAJX3KwqbHWXZdA18SvT/tPg1/8cYjSmS0f98WGgYwSTVwNpqcIPc8qodUt
 ZnTQ/tp7/ZwfST7a2/KG5RvbyEdpiDKabaMRlYZpk0We86dLfTD3LSFiJOB0tHydMU7B
 lG4geoW0fQItNB57aZG1tkrSlLX70PojLs2Co8qWxC4I0S0SOfFrJlkda/c5HN5f0uPa
 IYxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2n3msSrdG7IKmDihmdfBAwq1U2EuGeEAGAclWNU4Kd0zPdwAOCqblBkXREOVuGkxg0glz10G3uEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqRChBEY4wtTC2+eYLWJtb46ylgWm0IDHbL0FakF21un5OOtjT
 wODkgheXIohczL8aRF0cTTzhDmSuSkM9wANfEI4igYNCyvRBJ0aRaB2Ibb/nuDc=
X-Google-Smtp-Source: AGHT+IEym+LTunQTzfEmwfn9ioQibaynXV6VWyoQiFC3MErj3eUuTmWGKObCu8L9rZiNCDri6dHHhw==
X-Received: by 2002:a05:6358:29b:b0:1aa:b266:2a67 with SMTP id
 e5c5f4694b2df-1b603cce482mr233441555d.30.1724926815732; 
 Thu, 29 Aug 2024 03:20:15 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:20:15 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:37 +0800
Subject: [PATCH 08/21] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-8-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=1363;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=IWaQt7fOIuTYMO/sDj1ofTNDciH2u7nSLcam8JkLU5E=;
 b=ieBILLU/UCHYnkUeuzubKY3xpimkInETjb4hrSXsJVo68E0UyJbCNZUYZa/sf3Xf25pT23B2E
 G+zkaRPb8/1BUuBtPQa+vtVVb8HJTql3RoelmtRjCwo4R/VQBtzW6q+
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

in case of multiple mixer pairs

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a27e39c525d1a..d9f26e189eebf 100644
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

