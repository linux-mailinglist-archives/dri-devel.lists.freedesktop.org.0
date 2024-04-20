Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16998AB962
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 06:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5B410F360;
	Sat, 20 Apr 2024 04:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a8AjWetZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E4910F3BB
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 04:01:21 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2db101c11beso30780031fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 21:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713585679; x=1714190479; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IlCR2/E8btYXcVN5ux6VZAFo+1MPQWKcOcJ/NXb0eoQ=;
 b=a8AjWetZa7SvUCfofdPDphJCRzPXcyQiR1Uo3VYf8MfjcQMJN+aclFd+/RYfHkkBPk
 eKdSFxye2xWOQNpNbLwUryiQTt0Y/KRKrGg75rpPz3+SCLWXF113dnoWfPXXcuUWSsCQ
 k3wi8K0uCbo2ImtW9ESMFk6tyTQ8Xb9VnDqKwMi3qJmtYkEjsmuNqDByXWev6Hvf93dO
 75RIGJDl9pjWuULM2E3FDKDvbbqGLgV7WQqqKV9Dj8tkXEuIPF3709/bpZ7SHKQ4T4zz
 Sq9h6eJHmXzCjH8wBm5xyFPqRXCW1mYoCqT+XOeR6kdChdETvbuu3HuUEfh2JtKb3fu1
 qR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713585679; x=1714190479;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IlCR2/E8btYXcVN5ux6VZAFo+1MPQWKcOcJ/NXb0eoQ=;
 b=N/XxeLFzesYhToTkidvvADMkBzJ/FXIn2ItXBEL4N37mKeRPAoaNp8b6BXM4vK1am7
 JzaNM1gYPam+MWnqN5in3++CFYV0h0fCdvtLdvnn/oJsNGjcN6uQOQzEi8DMBOuG87Mq
 7oGFKYLedxIBXrtqckiYdR7guGD/IiTbf4W5fLH4/gpavvm830j+zBkcqiq7jV5DFN4z
 hion6I2jBcrzG6FpWuu4suFujaHXffYP3PKkJj5sbyW2fV+O3CRjk4hDkqSwCUNWabPL
 JVpxGfxnNDQYmSodEBOAjX9nxGyc0TukxyjpaSIaYqrdbPhR9KKcDl38G+UMoRTU9R1R
 nlzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGt6wY6yQvQK/bChYK0zH56rY6gXHRO4juYR9QQ9BeV4Vuck+IcfjZNKblp/mT9BzREY8BwEXhpOed9PafRNCV+08bj7BulM4OGDf8l77d
X-Gm-Message-State: AOJu0YyORoDk8mW0Juj4QebbO7jAF1s7N33VSJli/TstkNYNNdzZJM8C
 49UHcCN5iFyEd6lfDgB4j9tkhs+wSxvWwmAAzhGRGm/0qu2G7ckxpg7MVP2FRmU=
X-Google-Smtp-Source: AGHT+IEpnHexbT35jn1HanPCop9w7Xea09PPWd6ix8/T7A9gwooJRKp8zobZrcMvHtM6+E2mzAqovA==
X-Received: by 2002:a05:6512:3b88:b0:519:6953:2ffc with SMTP id
 g8-20020a0565123b8800b0051969532ffcmr2870356lfv.42.1713585679380; 
 Fri, 19 Apr 2024 21:01:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n2-20020a0565120ac200b00518c9ccef2esm1003993lfu.22.2024.04.19.21.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 21:01:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 07:01:04 +0300
Subject: [PATCH v2 7/9] drm/msm: convert msm_format::unpack_align_msb to
 the flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dpu-format-v2-7-9e93226cbffd@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8913;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xqaqEfOaXrzm0qh8jMjmh7qB545I7zB6szsBh+ORuJc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIz4JhH4dVZgtWEhN5C0adIfxXHR8f3DQj3CIg
 U5XJ9WN+a2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiM+CQAKCRCLPIo+Aiko
 1Us+CACvz1UirPYuyhcyJFgzN0KnjuTJQ+G8OEfJLLeMkoGMfUKgpGdElvxy73tS1kEAq9ira8P
 k/SAWlvFlgiCs9scgjRSgaiAjl8llqZYmMaAS39PM1LW5PD9snvXAkFInPD3KO1p5COrKtJCHKZ
 jVuGuLOuN0jJAY48WLaBny1Hf4FDldwFm5qFTdcbcGUe3jtooXgxqBwlD9O91zUbKSXr5P1/BQs
 D6s+C5IeRmph2wIYyw90fQOTQTYi1jIQkzfqpv5UShby5j0/DtlCtozXdPY7N26QY/HsvSU8Vwq
 rKHfCfN6ChGH4B5Fc6QA9owWCnwKFf+cEPjh55IPH0DXrwxm
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

Instead of having a u8 or bool field unpack_align_msb, convert it to the
flag, this save space in the tables and allows us to handle all booleans
in the same way.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  2 +-
 drivers/gpu/drm/msm/disp/mdp_format.h       |  4 ++--
 4 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 705b91582b0f..2bb1584920c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -43,7 +43,6 @@ bp, flg, fm, np)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
@@ -64,7 +63,6 @@ alpha, bp, flg, fm, np, th)                                               \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
@@ -86,7 +84,6 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
@@ -106,7 +103,6 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
@@ -127,7 +123,6 @@ flg, fm, np, th)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
@@ -147,11 +142,10 @@ flg, fm, np, th)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 1,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -168,11 +162,10 @@ flg, fm, np, th)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 1,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -190,7 +183,6 @@ flg, fm, np)                                                      \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d411d70b8cd8..f4b4cd084282 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -264,7 +264,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		(fmt->element[1] << 8) | (fmt->element[0] << 0);
 	src_format |= ((fmt->unpack_count - 1) << 12) |
 		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
-		(fmt->unpack_align_msb << 18) |
+		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB ? 1 : 0) << 18) |
 		((fmt->bpp - 1) << 9);
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 19163634855f..93ff01c889b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -97,7 +97,7 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
 		(fmt->element[1] << 8)  |
 		(fmt->element[0] << 0);
 
-	dst_format |= (fmt->unpack_align_msb << 18) |
+	dst_format |= ((fmt->flags & MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB ? 1 : 0) << 18) |
 		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
 		((fmt->unpack_count - 1) << 12) |
 		((fmt->bpp - 1) << 9);
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.h b/drivers/gpu/drm/msm/disp/mdp_format.h
index 18b2822dd552..d17f63c045a7 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.h
+++ b/drivers/gpu/drm/msm/disp/mdp_format.h
@@ -15,12 +15,14 @@ enum msm_format_flags {
 	MSM_FORMAT_FLAG_DX_BIT,
 	MSM_FORMAT_FLAG_COMPRESSED_BIT,
 	MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT,
+	MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT,
 };
 
 #define MSM_FORMAT_FLAG_YUV		BIT(MSM_FORMAT_FLAG_YUV_BIT)
 #define MSM_FORMAT_FLAG_DX		BIT(MSM_FORMAT_FLAG_DX_BIT)
 #define MSM_FORMAT_FLAG_COMPRESSED	BIT(MSM_FORMAT_FLAG_COMPRESSED_BIT)
 #define MSM_FORMAT_FLAG_UNPACK_TIGHT	BIT(MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT)
+#define MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB BIT(MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT)
 
 /**
  * struct msm_format: defines the format configuration
@@ -29,7 +31,6 @@ enum msm_format_flags {
  * @fetch_type: how the color components are packed in pixel format
  * @chroma_sample: chroma sub-samplng type
  * @alpha_enable: whether the format has an alpha channel
- * @unpack_align_msb: unpack aligned to LSB or MSB
  * @unpack_count: number of the components to unpack
  * @bpp: bytes per pixel
  * @flags: usage bit flags
@@ -45,7 +46,6 @@ struct msm_format {
 	enum mdp_fetch_type fetch_type;
 	enum mdp_chroma_samp_type chroma_sample;
 	bool alpha_enable;
-	u8 unpack_align_msb;
 	u8 unpack_count;
 	u8 bpp;
 	unsigned long flags;

-- 
2.39.2

