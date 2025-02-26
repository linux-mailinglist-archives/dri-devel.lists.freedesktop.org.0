Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4167A45F2C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA3C10E2E4;
	Wed, 26 Feb 2025 12:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ByQB1b7i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59DC10E2D6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:33:01 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2fe77285e12so2471833a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 04:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573181; x=1741177981; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZEgnok+ywGlBannr6oE9rIQ6mvdj6w1AkrRgjoSATVE=;
 b=ByQB1b7iVEF5ka4ax/bJL4Iln0OTY/LcoRUQI5nAsuDNfllX3y5TledpIRGH9udhK8
 E+uYDL/w4wqWLItnjUU3wM+dU+4JPi1ByJf3IkRb2BU5dsLjP/k+mPflB/KbrOZ1XySI
 TqfKDDrWzuNwKwoxtmaoCGB2a+Ve4Ckg6cE3IKyrDigQUjFie9cwIlacADt2GOSYLIvA
 TtI2x8mBXRcad27zzilPqS4pvx2Hj5avvk/S2X3EC0K+7Z1sq/EDxB5Q/bfU7OjwLMZs
 YJrisK5ihup/7p9KrqqYolrfr9lUo4Gdw6+++Uazja/BVrDMJxSNVKQWVtUADo2HMScX
 BtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573181; x=1741177981;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZEgnok+ywGlBannr6oE9rIQ6mvdj6w1AkrRgjoSATVE=;
 b=ufGXJTWs68iUgisFU2nKzsjAbyMXJFx8VA1nHbemy4f9r5K2RikN8q10k+EEeMBH8Z
 18d07UPoh6m3Xe4kRsn0yvsyrwjQi4O0N4HDLoGw7omN8GCtdjtmAsfD6Y+9OpIcNNE3
 jZDS58+nDRqqeba6sGTttIzftAWRn6cypUq07bmtXFGKdcNIE6FYGvZKdQzzFS4Li+Mk
 Kh4EJuvVb1xAbd+mYwaRE3gzTcAeBGs8qiHAbc64k1yLYDqgcfzRCx/++Gv8vv+CRv0I
 whXAIzO8eBrTHVXdv6QAChBjJNINgpwNm71wx89rng2LyLGCcVm3zNYBjLNx9RA9zuCk
 hkww==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/+haAEtRHFYci3EKoL+9NNqlcgp46/bjid7C0Dyi3jeapSiCCnqKGClwFxuHas0X7sSdGK4Q9oG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyvh69IbPed57k3muxrukZumrtkMin1wmIRqKdgLsAY/o8no+ii
 LOGzooFpDGEDGPO6WcNOAvIXcSnBkj8Sxyom3V6Th9B+t1SBsfYs1wOYCVoVGTE=
X-Gm-Gg: ASbGncsSmrNzFe77oYI09pqEoVh4U361aid/EXgrJ/DWFWyYE9K0Jlkf83pXwUDJ7s1
 o3tg3puvk725SVUHeTKU5Ay4vRiqU9AZEhu4FuRKp6xI+9w3ZvWP8D2mOeHAnAI3m1OSe9WyR8l
 pejTA7/toqxP1Amw9rIfAmAcYSg93H5v12dMvutikV28rTAncHI0ANa1+VS771wJmgKPuFYrCam
 a8O9svw4isn25OtaZDjlklYo+A4gs/5K+quvdQCsIJWQuy79TVM6EF2kLNcKghfzCcvUDzSXm1s
 +wFeXt46kuZ6MJlZN5/ZzHU=
X-Google-Smtp-Source: AGHT+IFmJoY2mBo0xxfFQ7Ywn1i3nU3kAa1LrI5vEVOIHrTlfQRoikIpN0oY87mAPA0Vd9oR9ShShw==
X-Received: by 2002:a17:90b:6cc:b0:2ee:ad18:b309 with SMTP id
 98e67ed59e1d1-2fe68accf77mr10373331a91.3.1740573181355; 
 Wed, 26 Feb 2025 04:33:01 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:33:01 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:55 +0800
Subject: [PATCH v7 06/15] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-6-8d5f5f426eb2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=6KiLXjEpLod6o/Ty8ouIA+JWP5hGEqwM+aKGxHjhLOQ=;
 b=ZO2ghG0JyyoYcOLf/+8cCAyyspMD2kjL3PJ/FnFqbVZ/KuisT8Y7WJMpntuXCbFT654tzlfaj
 DsEgNa1WhsPBBzBPJQT+aa8yx3WzEHxSFrGA0OxCn9gIQF9pcY5QOaY
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

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 24e085437039e677e0fb4bbd755a8cb3852300a4..3b3660d0b166d9b0e947b2c918e37adaae8b76d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -321,7 +321,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1

