Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF7DA4C486
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC98810E45C;
	Mon,  3 Mar 2025 15:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mb4QrlPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D791810E45D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:15:23 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-22334203781so87775035ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 07:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014923; x=1741619723; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
 b=Mb4QrlPLqlh3yyl7+MFhTyPDCtZ9D3Z6lnN7D9jALafacJ/KriVom289FPnAcZ1+VW
 TTugWkfhA7Y8PAM45jDz50kMGvzH4A7OQxjvJbyZ4E98f26Sb0kMGPHp3se1VeyAcsui
 zUXhl+d0ZKI9Du2IkUxUpBNhl3/yYjYK5pFxpUKmqEGVhM9gMNrBmupAtC3gp2mCqglV
 iiHx3bDit+JH30/1Pdze+5NEZtPaTN4EfyR9FwcDWEjxOd1eZox7UKAaU8HRFANwY8lZ
 bQEVaWADfY1TsayWFa8p+y1PS1BDsQ7mXx+607YxF+RQMXaPcy967+OnTaRI9My2iYYG
 OTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014923; x=1741619723;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
 b=ao4Hox4Z50UIqO1vgY7l1tu2vH2Gn8i3fKWJ3Durm/0m4dIM+67pCp+tOhDBFw4G/a
 dCHyVa4lOoAfQ2FuJZ5xNuT/FmDNmBupRjlpIOtLaFZujwQ0peM61Z0l77QVcIEavhHm
 kKuHj8Z72llh/vA+t3PhcLgdVScxB1UmLP8FObiUlrJPAh0p97UPqWFlyPyHN+DXNfjv
 xU5rmkjG6APMB9WjxPgv+xeik1flPHGJXypvvo5o76WJ3G5q9OLIbZF4npTtADatD2mO
 XnIFIbE3SMaarejcqJD+4uZnp5mimo0DkY2/h9x6S8iXIvl7tuP8MIKae1++2uUJuEMt
 QfKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmnViiv8Bjt7I/B3j81o5eDe4AjydTBIXUoCQnUfQlvrv1DSLPUHt2E+fcPHIVQRND/PefZtkrkmE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf8EbdKKuRpIefNTjeLkfdt2q9lm5a8yKedB72ycVWXrsOh6Vw
 Hml7GJLxXCMJ+v5h7dOpCJxMNeiYIbzjOQXaOoT2715pyOzrvzN+oJ+UKVA6hhg=
X-Gm-Gg: ASbGnct/A8ulfzbqeq/4DmWm3ZzRzoiuRhKWx4mtsdGMlGVeHvTxKxEHLJYJIpDj3rp
 YN3I1cyjBUc/avMeJW6qwQSmjpaWEjEaRBujiq1zogBXB6k8MoGGX9ZNEF0q5s8jj5ZbRZNMQVa
 +IT2dcU5gGfANXphokkvsUOnlQ43JuEcgy2MA7/+GFsZSdzhL/YKGX1RYs1B7U4GiZdAdaq+GjT
 tQm8GcJkztspFacYVVrAHQ7W833p7cr0qBBtwMxsAul3pKfwJOjIE/T0i9c5bBqApmCkDmZh03x
 mr548bkkfkIDqayPIqk60icP4jUXn4Ah52nMTWHo3Q==
X-Google-Smtp-Source: AGHT+IH8ciiBAiPz51W2tR23I7EbaKEiqHRlhwb3pmWcoE72Do5A2AxJD4u+8qKk0YjyQanKYtbzqw==
X-Received: by 2002:a05:6a00:1310:b0:727:39a4:30cc with SMTP id
 d2e1a72fcca58-7349d1a73e0mr28617699b3a.1.1741014923366; 
 Mon, 03 Mar 2025 07:15:23 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:15:22 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:34 +0800
Subject: [PATCH v8 05/15] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-5-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
 b=0UvNk46EPZ4R1btXvQ5qsC6M/xPiIKiZt74mBiD/8nGd1TCcQLFWDWnxpVruAaubbFg3jMisl
 7JN9ORSQifZDKqYz0JrteTdbTxfJa1MxXbP6jYP/s4c7/Fji7JTh7T9
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

