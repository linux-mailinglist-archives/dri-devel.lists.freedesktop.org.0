Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CCDA15369
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA25910EB2C;
	Fri, 17 Jan 2025 16:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LOVATZtN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96E810EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:01:31 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-216634dd574so28907425ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129691; x=1737734491; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wr+B49KkVbsBteglGhqGqgQcYh/xCc0iV+7YbLbwVHE=;
 b=LOVATZtNhjENqMpoCFDf4bCaHqI9NNSnPpP39+B9QXRRb2vTy6c1FFt82XueVYPi+4
 UjbMcplJzSWVaehgqkYZmVtlcWRV1TjLmR3i6xp2xdYQIFFOlHAfEW9ZXW40svIM1g0K
 EuR8OZMA8bii21f3twzzVy5Tvn9dYcg1/+z7a/GyKh5Mk6fL+Guewl6pLIFIbrZg9zz4
 B4ll1yehJLQF4LjdSyzh/7Jraq/YkHegA4PNw01dze9kZjATEcl6ac5oXGbAcntLhP4q
 T7NBQAyYV1LYpyv2reK+ApyNxKjHNBTXsm9pPu8Ql7k6BhZUF9TyB7yh/q8HjB/tyNan
 FLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129691; x=1737734491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wr+B49KkVbsBteglGhqGqgQcYh/xCc0iV+7YbLbwVHE=;
 b=o3Umajrxs45/TGFmf9w3dKB/8CBL6TkrS8eEOYozJ//zAY9ne+lNVyWMpP4XB3GLyp
 gXZLMNdftqkFPBmlKNvVk3xWvvEClVwJRZQ8vVrumJcXWQOPzSlfs4hh8WVe1r9lDWvz
 gYiuOWDc5LNPrSyMxp10d7kO8fmiDMAkHhvEcA75CBIkycNKrB9sN33XutaEWpK6A+/B
 LR96iVktU0GzeQuhsl81mx4hZaBNvs3I1oSWHqXFUMmerqhE1w3AN7uICVol6FSQiJ6B
 pvdCT+BpO6az+rIOJ0q5iOD15wSRX5TMd5/c5I+hLIc38pIynoNbQ4T2Mqm8vknevLpx
 OJQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTy+k74PiVtPeU5RBqca8xKpfsC/TefsochmqvG4UWDsNzMA/ZYhT9lWBT+sGh1zwlVHriGrsTt0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7Uqo0vG3ynLyujmnXQ2A0yVAibMZxGXLwdU7fM32xxBCvcveg
 jCbMIYbAiFGaW+AEmSRy7R4gauY+q8ZJ8rsY2mRFmZ4bJNa767KRWB3r2mg0NS4=
X-Gm-Gg: ASbGncvoRI6XxZ83CXYvt61/2lIMAk9tNR1/E2O/mPKJjLcNY1ZcqbTsiJleGvFVh+S
 awNDtsPaJdWZVxkxE+1FIOV58iPIuuLvcRsPluixK7KHzJrx4yvTTNFpElgxZ+geOn3MNAkjE1k
 qUmDkQCANAwWvPZaOL6wsgRwOGrM3kL2dcoHt6nft0KX4L7lTxkqDJU8W1pqOitpp2HwK/nov8t
 7OdCKmwpQJJ/A3uPmTMJpiXDmMko5kvEN3KyLh7ED+Bkjw95Fz8uA==
X-Google-Smtp-Source: AGHT+IFCMBLEuNxUQlJAJyR5L/QLo/Ne+5PWgfbfHOTbZl7jUgVf3+h3V24vH5DOTyhflDZPVH8d4g==
X-Received: by 2002:a17:902:e74b:b0:218:a4ea:a786 with SMTP id
 d9443c01a7336-21c35607c4emr48378565ad.53.1737129691139; 
 Fri, 17 Jan 2025 08:01:31 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:01:30 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:47 +0800
Subject: [PATCH v5 04/15] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-4-9701a16340da@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=2149;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=GP+URSefhQuQ7yB4SyL/Yc7ro6P5CbwOt/8QO9JdOu8=;
 b=GdVRWPfAhthcVRZ02F6X+2Ov3TsWwSpgfj2Jf1xyfuUzYJJ2EhEUVlGB48tQYxK6K4WWoDW3/
 AjoA9FvPm/FCluHc2fLDvSFgUiZ8T+auBWHbMQkdFZ1ya0u1omdINRM
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

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a67ad58acd99f..24e085437039e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

