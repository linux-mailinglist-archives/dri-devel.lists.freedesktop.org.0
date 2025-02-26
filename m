Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD3A45F2A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9123F10E2DC;
	Wed, 26 Feb 2025 12:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lQ2At6fq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2369F10E2DC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:32:55 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fc6272259cso10802415a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573174; x=1741177974; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
 b=lQ2At6fqSW5XtzAPRmhFDp4ybAffyr7ARCXM5QNixbwlE0YolbPZoo0CdRHlbVZRoX
 1IlFxsuE49fv8l9rH8toZerJKL8ewB+N12Mzm7BNmvsNsYCopQwD2RCdC2PKOLU0tblt
 vJiJQn+Xp+PVGa9lTXHOUR9Rt19Sws9eFBOPERSSDwFc4ok9ZUCfa4s0s7hUysQtvsiZ
 T3Y4A0nGvSZg5o2Zlp1/KChhCCI70kxaYQBSCciyS8+RcsN2RS6oz7aVmPlG1GoxVhG4
 Vn6UMbRRd/VM9S1H6CXMKXXXctP84s9HwjRljiMWHo6HbViMnoddQne6WV1ahCN/2TDu
 hjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573174; x=1741177974;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
 b=IhfhYFTQLMUnsvqT/21ya7PvfrUfEAAuJXhNil17HvA1ZTIu6sSaj40yXdPIMM5dMj
 9JgVvD3dOqiWLfBrSsrS2LkZPnsOLqqP/LoZgkpIQm8rNSi2wrmj6gWhLDk2dAd/WP2R
 d+gV+mgwqzfD5ZjRjnq4q6lq78fkPcvgQpIyjX2qNoGoaETOaXMbOjJUYt0JjJlgU8cI
 YE3g52S9NpJOUTbKt86lBbbCsar5NbF6ETUHnOT6FyAr1Zw6lMC9xXyq5vtH+HuKvYRP
 wurQbkWPWLUFJnm0yFkK6qfYZgKocIAEe8T2WUyHuU5qM6dtFCr2/axYwyyD9eKJ+hEH
 o1JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe+hznKq/1Ntvy5tUQFe+rxiE7jLSOXV+b1Vy4ukPfbmDUwadToaq88DEk++G51o3pkZK98ylu5cU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjZmtvJxkedaYOr2BgH+ntf4qquzhc1Tk749MDq2GT0rOVX92d
 Y53s09k3EQTRCpg6cSbfcWyvnI7ZfY9PUVG+//o3wqR3fn6HVwvQM/sUJGIv7Y4=
X-Gm-Gg: ASbGncv1MTskHKVShEetF4v87UbvpZL4L2Okce5tUDP3tP46vCjW0xbrc7aQd43LvDp
 VAD33pr6PxLFEleZBSpUOvAUOCFzpuu1+xcMtKF/YPgXBchh7llDvMZIgN2rR33WkaKJEwPu+ZC
 DdZ0Sen8L+KC/Ty1lDnTG0m9MCSoFfbPGrVG7QDtDWc68jjNRFtRZRtMp3IXZ6luZ9FzdWSUe9O
 ETcnsx4QEYnVr/rqnzw5f4vqS1zjZkE7q/ai5sg15wxtv2mSZC+Zq9jtU3pZ+WdthJhJ4IYThdQ
 dn6uivvkKnhfKPMl4/QC/f8=
X-Google-Smtp-Source: AGHT+IF5L7rzBSpk5qpsdgsAUFke51js1iZjo1fChsxijAq1kVHbMpTBDgh9GnhBUEpzjWW9aGsJOw==
X-Received: by 2002:a17:90a:c88d:b0:2f4:f7f8:fc8b with SMTP id
 98e67ed59e1d1-2fe68bff7b9mr10849509a91.27.1740573174703; 
 Wed, 26 Feb 2025 04:32:54 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:32:54 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:54 +0800
Subject: [PATCH v7 05/15] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-5-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
 b=V/CkV7RfmMO2LWW73eg6oN53kkGMHGfvRe6idE6dRf7RLfIow3wlkAPeJrWmi8SDPXs0fCLVL
 pq6gm8FfMxWA+SjXyE5WFzO3MKcNwQq6WTfuXo1z9HFbqCHHOSYohl4
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

