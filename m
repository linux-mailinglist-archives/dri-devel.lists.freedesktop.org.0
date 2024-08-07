Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F6294A83B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A8010E4FA;
	Wed,  7 Aug 2024 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RdTSYjFT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDC510E505;
 Wed,  7 Aug 2024 13:05:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3683f56b9bdso1198774f8f.1; 
 Wed, 07 Aug 2024 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723035914; x=1723640714; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
 b=RdTSYjFTw/2OAUF9ax2hGfeP94rZBkVKxQ0D1LOP3Q79a9q/OfIMIZymPTKY6+Hm7c
 xC8CVrSGlTOLXPYDIz9/RZVRD8LlZf8X137pypvciavWlWHQ7RKVO9ZGTmBUdSYLXPbT
 soSTGNs7xv0sRn/XEFQhqTuykByPmRnG5nu0GEgt+6TFCfKaga3d4LCYOrve3Lqe2bq3
 75GnhtL3mcxCpjoQPufxXi2yhE6R72+1oD1enVHF8+KuB1aYDYAA6Pba4IXR0ASfXSeU
 erui/2ULvi5TJk857o5Jr1W/OiRTGDmsu274cbnINCyzKjBUlBA+oKZK+L+y5moutWB1
 PJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723035914; x=1723640714;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
 b=rWofoZBTfjbZ2wElAyABkETKCFhCoPNu75JlD1UfH4CO2w7SVQCQWvedfIIEkXiow3
 Xy5k6s8Hmo4dL/OpHx8Pj3nvNSu6wimOnIwcG71E9uOEfO8e3IRp5aTyz84E1LAM9u0N
 3U6xlO36yV1kwFhM4pneezzCrVQQyfVw5TLXQh9WdF3Q1+H0+yYZhhG5Wwe7vs/huazg
 qvPW69yvLbfBriAdqlKcEIptdWHh0cVH3lf7lWap7pfcl+tscuyQFF2nHu2rVqOq1xeL
 wbqGJ1RKUWVP/n1TI7LQeqKnyqO0QdewSGlJVw+a/bkI4sVsbMaqOOY1gN03y35Vv0Ku
 LL0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdWNMxG3X9ol2862PAHl7OknO85TsW3aWjjYY7BM8r3Il04vp3ds0cAU2DY4qWsEMvtuHx/tteiuMiB96KQ+wJGjjH2ys/qwuVZ5blKyI4lZWI/yoQ/2USVTrrNiYlIEcG406lODFRsj9wwibFcAvb
X-Gm-Message-State: AOJu0YyGNaAiXSWEJZ4fvyYrRy45Hkm1cBfQhXJUcvzoiY9e6+nE6Dkr
 z8wViv9IkeAJ4YuhWIPhyWZa3MgWZct63mwOAZDBwEKcav2FPa5l
X-Google-Smtp-Source: AGHT+IGryRxi5KmB9DpHFGsqNZJS7ZbVWGPc/xzxJkhPbGz4XRaLoFExWXIJS6YW/kfmgunxFy1xrQ==
X-Received: by 2002:adf:e607:0:b0:367:40b9:e9e6 with SMTP id
 ffacd0b85a97d-36bbc0f5b05mr11537555f8f.21.1723035913757; 
 Wed, 07 Aug 2024 06:05:13 -0700 (PDT)
Received: from [192.168.0.12]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd05980csm16072849f8f.76.2024.08.07.06.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 06:05:13 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 14:04:58 +0100
Subject: [PATCH v3 3/4] drm/msm: Expose expanded UBWC config uapi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-msm-tiling-config-v3-3-ef1bc26efb4c@gmail.com>
References: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
In-Reply-To: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723035909; l=1686;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=NRBL4jAN6hjfyxISVZD05E8syLttrXlZkKCLenRZkDQ=;
 b=s9YvQa4URwtRyyRrn7r60+3wWfDZ+grUkG7vbmYkOJLhXjDSyozklBEyFds/LrCkjLo+fgccq
 VsJdVKmVLtSBVAt+DGq2jmLUL9W1A2fTqbXbs2S866A04vNgzk3KETJ
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

This adds extra parameters that affect UBWC tiling that will be used by
the Mesa implementation of VK_EXT_host_image_copy.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++++++
 include/uapi/drm/msm_drm.h              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1c6626747b98..a4d3bc2de8df 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -379,6 +379,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_RAYTRACING:
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
+	case MSM_PARAM_UBWC_SWIZZLE:
+		*value = adreno_gpu->ubwc_config.ubwc_swizzle;
+		return 0;
+	case MSM_PARAM_MACROTILE_MODE:
+		*value = adreno_gpu->ubwc_config.macrotile_mode;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3fca72f73861..2377147b6af0 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -88,6 +88,8 @@ struct drm_msm_timespec {
 #define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
 #define MSM_PARAM_HIGHEST_BANK_BIT 0x10 /* RO */
 #define MSM_PARAM_RAYTRACING 0x11 /* RO */
+#define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
+#define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #

-- 
2.31.1

