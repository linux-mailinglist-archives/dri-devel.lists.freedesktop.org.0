Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993988AB96A
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 06:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BFD10F500;
	Sat, 20 Apr 2024 04:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JHAkX6jd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030FA10F360
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 04:01:18 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51abd9fcbf6so2366218e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 21:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713585677; x=1714190477; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OtnwvIi7m2udkO5swTa1PpH4MXUqpZLQfPtAfgSk/zs=;
 b=JHAkX6jdNfOc7OFETWAlkYdw2m/B0ymcghZGrcsneWirjfiEuwdTbh9a/wiAb5Dzsx
 uQ8/Xj1PY99gQpSctRwbUtv/1dlRfuGMNO8aWK+lalJqvZ+QZ0mgxaAqYNqiwwfMjCcX
 88mbAK+g+s4g/G9LOylSNbF5RBJ/aaIEvoxGmPJnTNFujUO0PyJ91V03523gv8m8z2cA
 Z0y0bqqiI7aWVYq0a9QQ0/Z/p2+bFALRnic+bkjN3JsUjg6CEnvg2IgVbhNtdFh3Bojp
 Gg227jBlb0LJsGSqho8/wSuQpzubSMfGloG8TsU5Qt+szMoFglE07MPq3P5GVjAOtcKj
 BdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713585677; x=1714190477;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OtnwvIi7m2udkO5swTa1PpH4MXUqpZLQfPtAfgSk/zs=;
 b=tr79cwhjvVpMpjO0g8MBVudhc8F5cMOjwgWmgdBC36MoKKytlAa+wkkgGRDdh5xoVD
 dHu0yM4maxiSu+s+7DhRQV2SSOdDOQq9XE1PE1TKAvfsW6BeQcGc73dQ2nggicMzNF3O
 cURIDVfSD0Gv+scT5sZqfJKcdO4t+VjkdFib4vRA2C1DCSk0QwJ7ycrkhPya0uHXF5tt
 fu1JdfvKn6SspAUFR8OmVOpx86WfQLDRuxOH3KNAGa48IF+5fgl2bGNWfcstp4im+ZPH
 ZdhIKn4R543jZnHBfXwBjAPoSmZaztRYuJ2oIxjSaqpRgj1dsYNSFbn/L/tWnG5UfSPF
 DBmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5kUAzJyXg/qnahn6PAUth71fEKp0DQXOtY+xsGKGUy7FPAmAt4ukiKjlw1V4LtmpGO2g/kvvbY6yx51Y/d1o41iiNjZmJoUvw9/SX/EK0
X-Gm-Message-State: AOJu0YyRPdjuz4ddzHLli13gNMWyEGYZ8eP/+lDhoDk/3pXdKA1Ao3Sd
 XnNqueTjLabMRFCc93Aru1AqsRywOKodShKvjY+dhWtVNypDZXyp0F4SIXggsmw=
X-Google-Smtp-Source: AGHT+IEY6yBPvQ6/Ig0Lh0N+mOKEJdVi++L9FpEplAKmMG8VL/Wza/4q/YbUa0SkhPMK7vQoipQlWQ==
X-Received: by 2002:ac2:46f6:0:b0:513:d5ec:afb with SMTP id
 q22-20020ac246f6000000b00513d5ec0afbmr3268808lfo.40.1713585677083; 
 Fri, 19 Apr 2024 21:01:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n2-20020a0565120ac200b00518c9ccef2esm1003993lfu.22.2024.04.19.21.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 21:01:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 07:01:01 +0300
Subject: [PATCH v2 4/9] drm/msm/dpu: pull format flag definitions to
 mdp_format.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dpu-format-v2-4-9e93226cbffd@linaro.org>
References: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
In-Reply-To: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=23282;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qIevGr/Wlyo3l0HE4Od+Pf9BeV0D/53dl6LcnL23BVE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5qyHcdiBolngdPrvr/eEfXtztljh0Qbt3Vp+yYbv/+pr
 Rc1Lcagk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT8X3KwdBdqOIgwKFg27Qq
 mrfXasaE4wKbvHmv3/j69g8bS8HH9RWvpKbJ17rGtl14a7o4aVPp7x8y6tLaT+cE9p2VVntyg0N
 53yeG8h8KTd9CzsTrrQ3l5He4alK2JW/x1NxIQ1Hvi6FJ4jt2n/lau+bsNJ49KqmdTMLvm5Vtr+
 oz/osISGD5KKN3e77M19R18/yWhTnp3tpRW5sdvGf1B1POTx3//GPWbZwnmD1l5YXve9Wmlnixx
 XjvsWx4KDgvYwlTr5FZ1tq6SInv0SJmS2X+Vc1hC3ny+0iyjxv7+mrR21tC9LfPlf2/sInX9n6D
 6IY789t8FIW+a7DP1Qg5F508aY66galuUNrXJjGJh4VPAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In preparation to merger of formats databases, pull format flag
definitions to mdp_format.h header, so that they are visibile to both
dpu and mdp drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 98 ++++++++++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 31 +++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  8 +--
 drivers/gpu/drm/msm/disp/mdp_format.c       |  6 +-
 drivers/gpu/drm/msm/disp/mdp_format.h       | 39 ++++++++++++
 drivers/gpu/drm/msm/disp/mdp_kms.h          |  4 +-
 drivers/gpu/drm/msm/msm_drv.h               |  4 --
 9 files changed, 109 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index caf536788ece..0c2afded0e56 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -44,8 +44,8 @@ bp, flg, fm, np)                                                          \
 	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -63,8 +63,8 @@ alpha, bp, flg, fm, np, th)                                               \
 	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -83,8 +83,8 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_tight = 1,                                                \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -101,8 +101,8 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_tight = 1,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -120,8 +120,8 @@ flg, fm, np, th)                                                          \
 	.unpack_tight = 1,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -138,8 +138,8 @@ flg, fm, np, th)                                                          \
 	.unpack_tight = 0,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -157,8 +157,8 @@ flg, fm, np, th)                                                          \
 	.unpack_tight = 0,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -177,8 +177,8 @@ flg, fm, np)                                                      \
 	.unpack_tight = 1,                                                \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -365,115 +365,115 @@ static const struct dpu_format dpu_format_map[] = {
 	INTERLEAVED_RGB_FMT(BGRA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, DPU_FORMAT_FLAG_DX,
+		true, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, DPU_FORMAT_FLAG_DX,
+		true, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX,
+		true, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX,
+		true, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, DPU_FORMAT_FLAG_DX,
+		false, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGRX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, DPU_FORMAT_FLAG_DX,
+		false, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, DPU_FORMAT_FLAG_DX,
+		false, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, DPU_FORMAT_FLAG_DX,
+		false, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	PSEUDO_YUV_FMT(NV12,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, DPU_FORMAT_FLAG_YUV,
+		CHROMA_420, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT(NV21,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_420, DPU_FORMAT_FLAG_YUV,
+		CHROMA_420, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT(NV16,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_H2V1, DPU_FORMAT_FLAG_YUV,
+		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT(NV61,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_H2V1, DPU_FORMAT_FLAG_YUV,
+		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT_LOOSE(P010,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_YUV,
+		CHROMA_420, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(VYUY,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(UYVY,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(YUYV,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
-		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(YVYU,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
-		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	PLANAR_YUV_FMT(YUV420,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb, C0_G_Y,
-		false, CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 3),
 
 	PLANAR_YUV_FMT(YVU420,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr, C0_G_Y,
-		false, CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 3),
 };
 
@@ -487,13 +487,13 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, DPU_FORMAT_FLAG_COMPRESSED,
+		false, 2, MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
@@ -503,37 +503,37 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, DPU_FORMAT_FLAG_COMPRESSED,
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, DPU_FORMAT_FLAG_COMPRESSED,
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
@@ -543,22 +543,22 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, DPU_FORMAT_FLAG_YUV |
-				DPU_FORMAT_FLAG_COMPRESSED,
+		CHROMA_420, MSM_FORMAT_FLAG_YUV |
+				MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 4, DPU_TILE_HEIGHT_NV12),
 
 	PSEUDO_YUV_FMT_TILED(P010,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, DPU_FORMAT_FLAG_DX |
-				DPU_FORMAT_FLAG_YUV |
-				DPU_FORMAT_FLAG_COMPRESSED,
+		CHROMA_420, MSM_FORMAT_FLAG_DX |
+				MSM_FORMAT_FLAG_YUV |
+				MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 4, DPU_TILE_HEIGHT_UBWC),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index ed5206652413..aa639a43941f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -9,7 +9,8 @@
 #include <linux/err.h>
 
 #include "msm_drv.h"
-#include "mdp_common.xml.h"
+
+#include "disp/mdp_format.h"
 
 #define DPU_DBG_NAME			"dpu"
 
@@ -36,25 +37,11 @@
 #define DPU_MAX_DE_CURVES		3
 #endif
 
-enum dpu_format_flags {
-	DPU_FORMAT_FLAG_YUV_BIT,
-	DPU_FORMAT_FLAG_DX_BIT,
-	DPU_FORMAT_FLAG_COMPRESSED_BIT,
-};
-
-#define DPU_FORMAT_FLAG_YUV		BIT(DPU_FORMAT_FLAG_YUV_BIT)
-#define DPU_FORMAT_FLAG_DX		BIT(DPU_FORMAT_FLAG_DX_BIT)
-#define DPU_FORMAT_FLAG_COMPRESSED	BIT(DPU_FORMAT_FLAG_COMPRESSED_BIT)
-
-#define DPU_FORMAT_IS_YUV(X)		((X)->flags & DPU_FORMAT_FLAG_YUV)
-#define DPU_FORMAT_IS_DX(X)		((X)->flags & DPU_FORMAT_FLAG_DX)
-#define DPU_FORMAT_IS_LINEAR(X)		((X)->fetch_mode == MDP_FETCH_LINEAR)
-#define DPU_FORMAT_IS_TILE(X) \
-	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
-	 !((X)->flags & DPU_FORMAT_FLAG_COMPRESSED))
-#define DPU_FORMAT_IS_UBWC(X) \
-	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
-	 ((X)->flags & DPU_FORMAT_FLAG_COMPRESSED))
+#define DPU_FORMAT_IS_YUV(X)		MSM_FORMAT_IS_YUV(&(X)->base)
+#define DPU_FORMAT_IS_DX(X)		MSM_FORMAT_IS_DX(&(X)->base)
+#define DPU_FORMAT_IS_LINEAR(X)		MSM_FORMAT_IS_LINEAR(&(X)->base)
+#define DPU_FORMAT_IS_TILE(X)		MSM_FORMAT_IS_TILE(&(X)->base)
+#define DPU_FORMAT_IS_UBWC(X)		MSM_FORMAT_IS_UBWC(&(X)->base)
 
 #define DPU_BLEND_FG_ALPHA_FG_CONST	(0 << 0)
 #define DPU_BLEND_FG_ALPHA_BG_CONST	(1 << 0)
@@ -331,8 +318,6 @@ enum dpu_3d_blend_mode {
  * @bpp: bytes per pixel
  * @alpha_enable: whether the format has an alpha channel
  * @num_planes: number of planes (including meta data planes)
- * @fetch_mode: linear, tiled, or ubwc hw fetch behavior
- * @flags: usage bit flags
  * @tile_width: format tile width
  * @tile_height: format tile height
  */
@@ -348,8 +333,6 @@ struct dpu_format {
 	u8 bpp;
 	u8 alpha_enable;
 	u8 num_planes;
-	enum mdp_fetch_mode fetch_mode;
-	unsigned long flags;
 	u16 tile_width;
 	u16 tile_height;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 896fb576f5b5..d19fffa3d97e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -267,10 +267,10 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		(fmt->unpack_align_msb << 18) |
 		((fmt->bpp - 1) << 9);
 
-	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
+	if (!DPU_FORMAT_IS_LINEAR(fmt)) {
 		if (DPU_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
-		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
+		src_format |= (fmt->base.fetch_mode & 3) << 30; /*FRAME_FORMAT */
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			ctx->ubwc->highest_bank_bit << 18);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index daaf6fe7e904..e6c9b4f2a0e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -294,14 +294,14 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 
 	trace_dpu_perf_set_danger_luts(pdpu->pipe - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
-			(fmt) ? fmt->fetch_mode : 0,
+			(fmt) ? fmt->base.fetch_mode : 0,
 			cfg.danger_lut,
 			cfg.safe_lut);
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %p4cc mode:%d luts[0x%x, 0x%x]\n",
 			pdpu->pipe - SSPP_VIG0,
 			fmt ? &fmt->base.pixel_format : NULL,
-			fmt ? fmt->fetch_mode : -1,
+			fmt ? fmt->base.fetch_mode : -1,
 			cfg.danger_lut,
 			cfg.safe_lut);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index aa8342d93393..e40f6d1d5433 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -634,10 +634,10 @@ static uint32_t get_scale_config(const struct mdp_format *format,
 		uint32_t src, uint32_t dst, bool horz)
 {
 	const struct drm_format_info *info = drm_format_info(format->base.pixel_format);
-	bool scaling = format->is_yuv ? true : (src != dst);
+	bool yuv = MDP_FORMAT_IS_YUV(format);
+	bool scaling = yuv ? true : (src != dst);
 	uint32_t sub;
 	uint32_t ya_filter, uv_filter;
-	bool yuv = format->is_yuv;
 
 	if (!scaling)
 		return 0;
@@ -666,7 +666,7 @@ static void calc_pixel_ext(const struct mdp_format *format,
 		int pix_ext_edge1[COMP_MAX], int pix_ext_edge2[COMP_MAX],
 		bool horz)
 {
-	bool scaling = format->is_yuv ? true : (src != dst);
+	bool scaling = MDP_FORMAT_IS_YUV(format) ? true : (src != dst);
 	int i;
 
 	/*
@@ -696,7 +696,7 @@ static void mdp5_write_pixel_ext(struct mdp5_kms *mdp5_kms, enum mdp5_pipe pipe,
 		uint32_t roi_w = src_w;
 		uint32_t roi_h = src_h;
 
-		if (format->is_yuv && i == COMP_1_2) {
+		if (MDP_FORMAT_IS_YUV(format) && i == COMP_1_2) {
 			roi_w /= info->hsub;
 			roi_h /= info->vsub;
 		}
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 69ab5bcff1a9..30919641c813 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -63,7 +63,10 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 };
 
 #define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, tight, c, cnt, fp, cs, yuv) { \
-		.base = { .pixel_format = DRM_FORMAT_ ## name }, \
+		.base = {                                        \
+			.pixel_format = DRM_FORMAT_ ## name,     \
+			.flags = yuv ? MSM_FORMAT_FLAG_YUV : 0,  \
+		},                                               \
 		.bpc_a = BPC ## a ## A,                          \
 		.bpc_r = BPC ## r,                               \
 		.bpc_g = BPC ## g,                               \
@@ -75,7 +78,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 		.unpack_count = cnt,                             \
 		.fetch_type = fp,                                \
 		.chroma_sample = cs,                             \
-		.is_yuv = yuv,                                   \
 }
 
 #define BPC0A 0
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.h b/drivers/gpu/drm/msm/disp/mdp_format.h
new file mode 100644
index 000000000000..b1f199d4a079
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/mdp_format.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#ifndef __MSM_FORMAT_H__
+#define __MSM_FORMAT_H__
+
+#include "mdp_common.xml.h"
+
+enum msm_format_flags {
+	MSM_FORMAT_FLAG_YUV_BIT,
+	MSM_FORMAT_FLAG_DX_BIT,
+	MSM_FORMAT_FLAG_COMPRESSED_BIT,
+};
+
+#define MSM_FORMAT_FLAG_YUV		BIT(MSM_FORMAT_FLAG_YUV_BIT)
+#define MSM_FORMAT_FLAG_DX		BIT(MSM_FORMAT_FLAG_DX_BIT)
+#define MSM_FORMAT_FLAG_COMPRESSED	BIT(MSM_FORMAT_FLAG_COMPRESSED_BIT)
+
+struct msm_format {
+	uint32_t pixel_format;
+	unsigned long flags;
+	enum mdp_fetch_mode fetch_mode;
+};
+
+#define MSM_FORMAT_IS_YUV(X)		((X)->flags & MSM_FORMAT_FLAG_YUV)
+#define MSM_FORMAT_IS_DX(X)		((X)->flags & MSM_FORMAT_FLAG_DX)
+#define MSM_FORMAT_IS_LINEAR(X)		((X)->fetch_mode == MDP_FETCH_LINEAR)
+#define MSM_FORMAT_IS_TILE(X) \
+	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
+	 !((X)->flags & MSM_FORMAT_FLAG_COMPRESSED))
+#define MSM_FORMAT_IS_UBWC(X) \
+	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
+	 ((X)->flags & MSM_FORMAT_FLAG_COMPRESSED))
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index d0718c16de3e..b6e68a343336 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
+#include "mdp_format.h"
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "mdp_common.xml.h"
@@ -86,10 +87,9 @@ struct mdp_format {
 	uint8_t cpp, unpack_count;
 	enum mdp_fetch_type fetch_type;
 	enum mdp_chroma_samp_type chroma_sample;
-	bool is_yuv;
 };
 #define to_mdp_format(x) container_of(x, struct mdp_format, base)
-#define MDP_FORMAT_IS_YUV(mdp_format) ((mdp_format)->is_yuv)
+#define MDP_FORMAT_IS_YUV(mdp_format) (MSM_FORMAT_IS_YUV(&(mdp_format)->base))
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 65f213660452..f66faff17a60 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -239,10 +239,6 @@ struct msm_drm_private {
 	bool disable_err_irq;
 };
 
-struct msm_format {
-	uint32_t pixel_format;
-};
-
 struct msm_pending_timer;
 
 int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,

-- 
2.39.2

