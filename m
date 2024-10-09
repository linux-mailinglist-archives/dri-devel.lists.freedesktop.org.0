Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643F9963D6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5A410E6A8;
	Wed,  9 Oct 2024 08:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UDFS6Uxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE2010E6AA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:51:24 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-7db90a28cf6so474956a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 01:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463884; x=1729068684; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F3RVtVtcWQ38kTkihMst8OMHNbsHVAelds2Db2o3IYo=;
 b=UDFS6UxxSSra0Vl4Odk46dIqoPlxhj8J1Tzy95Sc2loOEEzuo19pBMDD9aP+cKXrxL
 brKVbvw2rGjIqQHm/vi+KYvfOKLgDJOEy0bPV5N3+bCaIBm/2tJPd13ej5ZiyWstKS6o
 TxxBAC/KyUMRGj1yAOYmRDzvL4QJPXqN6SrRhWnfBjgPwWSpzvES8H5KLDj5XCXfiE2z
 qvMg7zHel4vwXL4rrlY3zxln0vpY3tssRVziANYUx8BdHSCH9TvCf7v6Vmaw7P1UZzf7
 kSDErHsc4F4Zb3NS9X8clYX/ZH3BxCWhSB85/OkGELkD/BqdN6KdhSbPWflA52t/zCob
 a8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463884; x=1729068684;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F3RVtVtcWQ38kTkihMst8OMHNbsHVAelds2Db2o3IYo=;
 b=EKCK7JuTWtymvg4ZDv6ThwvRHFoxgDG6BKXioFjl+lQabCBiAuPdsB5+OsF6yqhojx
 HoXvIU3myRjzokE6EEr+j+LJBe6np301vNUtx1/GdaBrutq1S+ipC3CR2QLURtfRtvIz
 AjUWjDLHUbhNN5pWqWmRMex+vzMtJFUpt1dmpCQhwczZ1fVUtUW+c1t++jwmtU6WRPnY
 NEjTzdOjG2acxoyztJMWuIleZRyyWgXcBQmAuFlOPFm7XENogtRvsk3PwbH8VApnWlY8
 a+mFVbSbGAwjd5YTJDqxf956dut6Pq/u7BkjQOwVgwBPCaUH0F8LYSYB41/HgqpFjdW+
 Dhng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjH9rlxZw/bwl718kQyn1LLCcxMlkuJCeVLmGDDBeFN4mNCvuat/YKxxOG5C1TumdY5gnoxllpB1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytjgcA9pGSuf16plESFnErqBcuiSasM17d94SX7KFu9fFAE136
 +kVPmoSqCm3DpRhGUwP2WGqqvXLhbW3a1uQuetvWCoqfmtluuyderzU+1tleRjE=
X-Google-Smtp-Source: AGHT+IHvpp82pkdvaPTIW66VfEKItG5LVqsQe3Zkoe6/T3/uxKCH9ZD03Stms/drz+eJxsVEGQyKiA==
X-Received: by 2002:a17:90b:fd7:b0:2e2:91aa:e683 with SMTP id
 98e67ed59e1d1-2e2a084ca8amr2758796a91.13.1728463884302; 
 Wed, 09 Oct 2024 01:51:24 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:51:24 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:24 +0800
Subject: [PATCH v2 11/14] drm/msm/dpu: Share SSPP info for multi-rect case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-11-76d4f5d413bf@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1040;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=GMo45gPySZjy72Hc4Yw7xEv8zW3cyCFzGsnKJn8DLoY=;
 b=S5CivVtMEYLewBJNoQ4eLfAA051Szb5Ae40kwyuCmurPDIxSr7oJL65CcW9kP+NnxKrfSzSw/
 R6CxNMzFZddCCXWtYFQwLsGDsthBKAZQ35QcxpcHqcQtfuGd6WUQh18
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

Share SSPP info for multi-rect case if virtual plane is not enabled.
Otherwise, the 2nd half of DMA content is not displayed due to sspp
pointer of r_pipe is null.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 904ebec1c8a18..898fc2937954e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1042,6 +1042,11 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		pipe->multirect_index = DPU_SSPP_RECT_0;
 		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
+		/*
+		 * Signifies that r_pipe is to be used if the width of the 2nd
+		 * pipe is not 0. This does not apply to virtual plane case.
+		 */
+		r_pipe->sspp = pipe->sspp;
 		r_pipe->multirect_index = DPU_SSPP_RECT_1;
 		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 	}

-- 
2.34.1

