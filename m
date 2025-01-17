Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FAEA15386
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DF010EB2D;
	Fri, 17 Jan 2025 16:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LJtdXVVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A9110EB2D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:02:43 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-21619108a6bso41287625ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129703; x=1737734503; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MEf37YiQnbvCQ7bZ2njtxuZKF/UJvCXNFAR5fUzDSTs=;
 b=LJtdXVVJVG+0ykrfnetq1c6lSFd8YOhlxJ1LKbw5VfJEDffMfu/SP4HAjnxWsuH4ig
 fSE3DPK6MGlPl3ovmUldjV5mmXqQsDdV97cr7EXvBSwN2FbH/QUhhGfSvCAT+1JLGIZY
 QloJzazd41wd3J2B/Uv2KnTA6nLGwxpleFwWmotloN8oOMQG9bRP5DQbGazFA8c33phF
 4FDnoMAiJ+wCHwvfbPY8sksTE8UZagtTdkqJsQ8gOzIwe0gLgsf6KlrDaLxfiCGk8Ma7
 VrkXmsbhi0AVUbTmRJTN6cH+8qTfFyaG+4pbFOq9kkyXDGGlLryClsxruZHUvqnQ9UMR
 7SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129703; x=1737734503;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MEf37YiQnbvCQ7bZ2njtxuZKF/UJvCXNFAR5fUzDSTs=;
 b=VR5OyldjFsQUAJQBDSCp+TVjMvcaAuOO4uFwOIaMT4Hl2jWuhecyfQsevzpR3+mBf+
 n2zxWrdMgyFKZs+TlTY+9qdtFsHKSMRISUCxJwXki+vU4vVJs0F+UJTBX2DNkHtkK+fm
 KaZIZay4SYqW6E/jqBsTpaPa9/teLs45Gjjf19mRdNJq0x91eybN8dkS5q9WRtc/B7y6
 2R8mzPs5LeMPBBO9j6C4TDMk9QNvKjsALn5GdirPQnOQti3+tChHUkSZtD3VTWTo/GpG
 XJgbiZYWLrkicKtOZQmujztlSCd4J0jFNBJTUN/vdqcL3Oz944ZC2obhEk2gRVBV/J6n
 LAjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUscXh3/WvF29bO6YsP5uhYJpMg29hPCxICqgg+xDTO41MIe7X2L0zVjYZ4xVKVxk3++JNViUvQmHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAngOCzxuIL7M1VBBHW4re4xcnlwt9WbLbDcUOEiLn/nFD3tkc
 CSlwoNN89JaTeYpD7Eg1r3kGtzdjQejdseQcFmgvEVdnZsHgabmV8UoQDnaHuG0=
X-Gm-Gg: ASbGncuCzi6CqnqBAXiMgqSxNr6YdckLQsAHEZTcl7Jf5Tcx0381ooLtGfu7cJE1J/S
 gqtCCkZcgnrRe1Q4ySH9F6jnFvUfkDEMtUppDfC1QcT+iUavcJuENolqwekW3AZJNkmVNKrz0rW
 TAewVaW73FwspVXlSRtLssbswNxMZRKdW6ncSEvU36wAEnPSBm2gRMTTA+0RdnlJfjVdcMNtylf
 VRAwgdrDWzbe2NXkep6uZ4Cn+wlk2Tn7IH5DYFSC6nyTCpaFnsDOQ==
X-Google-Smtp-Source: AGHT+IEJZ2kI5uBRDML1k/NgyZDQ0oAP/B2bCqDRMPIUXnBmIZcuvSdH13kMnK8Z68XMSLJ3NNyC4Q==
X-Received: by 2002:a17:902:ea02:b0:215:19ae:77bf with SMTP id
 d9443c01a7336-21c355028e9mr53606705ad.19.1737129702982; 
 Fri, 17 Jan 2025 08:01:42 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:01:42 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:49 +0800
Subject: [PATCH v5 06/15] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-6-9701a16340da@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1195;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=PxddNtBEA4VAAhtLK+nYutVGLEKgnoRp41bcJi/iMzA=;
 b=p8ecOW+PR5hW+4VzbQheLYOLcsmGULaSOX4TeuTvLGFdCcOz3AFZ86zrqMqAnGU6Jcfj8eEgt
 yEGFx2lO2SlB8pL6GZ0RPhJhob8OZHkj8jiovg3LIPolEOT9T684vwY
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 24e085437039e..3b3660d0b166d 100644
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

