Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C88E925A15
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410210E77E;
	Wed,  3 Jul 2024 10:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NOXxJC9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F06D10E791;
 Wed,  3 Jul 2024 10:54:06 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so63648691fa.3; 
 Wed, 03 Jul 2024 03:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720004044; x=1720608844; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
 b=NOXxJC9B1TmND8obaP+M3r7NueNvnc+D83yAZ7AVGBLk0nUAB6DG9kqU3OQc3BG6a6
 y0gEPT9m3CMNe6911OUOXI7XmZ3wjSQPVPjCIbvO54W8aZoBzHBZvCpEGLY+/CCiMm1M
 ACJ+DBDnFkVi+PAxFHDSeAGVJ42zj5Zeci76IkiqFJBlIKhTzW6UaUADoWYiNvfdk23f
 DNCV9hCov7Tf+poLQ5sFPBALQoavrezB5RYmQ+eLiNCmmmmUyY5SQHwkrtQoh2yRgPYJ
 Y5xyYZ0R4tnmzBOBO2iLKEJea8wsdUiUlVllMv7a6mli41iOi+mc5sx8OMW2XwNK4yRE
 VDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720004044; x=1720608844;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
 b=OYQEnBQB6kIHSkligEhBei1VdaiEoykqruwjn1StfcGHgmr83eXPCRdxX/Mo8KnIUh
 Y7/eq4qD8clkG5i749waWlRZ0LR60DMHehNiA9Wf0SeCWZAnV8KPMOifG5A8xoWoWNmb
 ZgmC7YVJL9EU8Of+r77xhV3/pbavE/cc4cIhTw/ZTw15KZgR6CEXrWUmGizMWNTgRhLh
 j7UOdze5jch5KioKFOImSb346Ls0Z3c9bLHXgmJnhgHxm41d7Ozy7iE5GRtGEcWHqlhA
 c9Nu620BK2uVPKlnWwWNkOkUNCnQtzMbgXYilf6BcwDbD1jhP6az5fqy2DuUT1ni+e08
 1eGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUThOe3xV3nQAMMKGvzVq+7dk4IdC5d0sUwC5cU3Y9XE52aGYpz/ElWbt+d+xFgM3Fm0ja6Z3s5EjaOSKM1exeXoOr8NqBCaJAPmYMbFiatZqLFYZ5Quz/zWyFS7fNz+sfSdHqFDa+LbsG6ZXIcpGC5
X-Gm-Message-State: AOJu0Yx08x2UmlEeQ4HLPe/h4PcSK8gNnQcpqGfdcEdssHE58e/SIrg8
 UNFYAXDbz80J4BwEcmymnAsEj2v5AicKa1PWyrjsDCzmSjofM82Ukbrh16f7
X-Google-Smtp-Source: AGHT+IGkQhYp6C4iCdcLdDXmR0eESMCPMl+aTQRH6S1hhLyjnuBSp92V5VZ53UeIKqFXa98xzrHVjQ==
X-Received: by 2002:a2e:b169:0:b0:2ee:8817:422b with SMTP id
 38308e7fff4ca-2ee8817435emr4552951fa.19.1720004043456; 
 Wed, 03 Jul 2024 03:54:03 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0d9b1dsm15644879f8f.42.2024.07.03.03.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:54:03 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 03 Jul 2024 11:53:49 +0100
Subject: [PATCH v2 3/3] drm/msm: Expose expanded UBWC config uapi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-msm-tiling-config-v2-3-b9da29ab6608@gmail.com>
References: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
In-Reply-To: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720004038; l=1686;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=NRBL4jAN6hjfyxISVZD05E8syLttrXlZkKCLenRZkDQ=;
 b=uOMD0cQHXWYYxQeOFr04/892ck5b1ocEmyn8AQq69zm16OKeU85kklfqTCge7b1j1knvXHGK9
 i3zfAdgB7EvBAenyVHWZ44zjKbL20RNSaqmk08J4cUdCWs+BruErspQ
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

