Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A30923E38
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9110710E1B0;
	Tue,  2 Jul 2024 12:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RCkaUmP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE63910E1AE;
 Tue,  2 Jul 2024 12:56:57 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-36786081ac8so338134f8f.0; 
 Tue, 02 Jul 2024 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719925016; x=1720529816; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
 b=RCkaUmP0XsjFf9zLcBn9trUi5ddW0HH6GdRVTm7DjcKSymmSua01Kz5yy0ePHrbBHs
 PXpH4jMDIrwPnwXA4jRVsCZq5j9to3ylR3aAPPCEZN4xM16CsSpzBDgJoscZvcF9+6Nl
 PIE/BmDf8Rqi2wAi6GXL0xBaG9BQ3E6fp+Zl3Ria5SmxAOxvQwWV1TB2Cylprj/YSaHa
 PfATNPoBVhRVzaUuOvwz6y/MjhN1/FBf5zeW/FK+wE/PRPoF0CDZoJz6q2PNeFOeQUBz
 NkVWVVTUdJ28sO5shTkF0h7fuFQzLkpUcmd+oi8un9ajKYRVgqlWdfSApTS+AFQLUtR4
 0t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719925016; x=1720529816;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
 b=KykMg8gzbnuGdHpjLn1dadjPr8ZAODBp2oV2cFnR8HYWJddVHZLMpZQAPxnEydr2bH
 q7tIz3bOLA9vBnLNz+YGGEGzzFcxty0rkEqj/WwIGip8NTJuozzJmNnB7FS20X7HrnNt
 s3Xtmc663Y0AXhGVtpM2YWlB6VV+6KUP3/OXzWiLSH/h6kbZYC611scwjEJFq/cIR7xQ
 Vu6GTXoqm4ehC7wwvk0sFdpVKu5IgrZQ5HPdl2zBU4Lzpyxnju6oYVuMM6A0BorBI3sf
 M+kp32JJsNdF6bX8ynkHdVXU2H4vMQf7YEwbwdHXXJuDQtMsL09jwfGasNqSZF5Q9Ue4
 ZWgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcg3UqGGqHMidsmdZzy78ClftZ66qt6FA8rSX77aKIX+vF53t3P7nFLRpLLfxel9Kut+J9IaGk2XOI2FQva80vtOrPH/j/uej+u323698PJHZgcQLsPw4nPKya4vjYUV/5tbKBJXSYuuER0jsbgLi1
X-Gm-Message-State: AOJu0Yz2BIeF5faxXAhQ4Tju0vne53XAutiD7pWH6HWwExgY4+DNRpBA
 3QDazHYYhYdbvDjAo6MjRsp4vn8qUhhDj/NlvnxiXILyUJ3iXIPQ
X-Google-Smtp-Source: AGHT+IH84ILGIU8atW89P0kwgpHmmjiN3dcdo+V/tPYzkg1LEi1HUO58sQ9arTekTI+CSIAsGWRiBA==
X-Received: by 2002:a5d:66c8:0:b0:367:8c22:5b7a with SMTP id
 ffacd0b85a97d-3678c22645emr651852f8f.22.1719925016068; 
 Tue, 02 Jul 2024 05:56:56 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fc429sm13145533f8f.68.2024.07.02.05.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 05:56:55 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 02 Jul 2024 13:56:32 +0100
Subject: [PATCH 3/3] drm/msm: Expose expanded UBWC config uapi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-msm-tiling-config-v1-3-adaa6a6e4523@gmail.com>
References: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
In-Reply-To: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719925012; l=1686;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=NRBL4jAN6hjfyxISVZD05E8syLttrXlZkKCLenRZkDQ=;
 b=ybJ3mkt0VhbHWnNkEva9LM6fnRAIfBOe/JvuqLyV8GmE1VAGCnuyd6L7FvFBJF1sKK1ewOAyS
 QI8ZcVxNW06BSRcjrglzlINcKMAv/rm0OvXoqfU5Zn0vguUWawmRzqN
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

