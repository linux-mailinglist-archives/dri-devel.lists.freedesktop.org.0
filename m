Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64A9AAE546
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74BF10E842;
	Wed,  7 May 2025 15:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JxUCwSmY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231C710E838;
 Wed,  7 May 2025 15:47:27 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b074d908e56so5147434a12.2; 
 Wed, 07 May 2025 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746632846; x=1747237646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LmkbRzm6/L2ISgCL3Ow+dZj/hCqoVpb93sMpickKofs=;
 b=JxUCwSmYx9ZMCyavBaHVGNQMV6ZsPXvWqA2Q3EZID3a935CLR7HZOayPn1ajeGHEhf
 K8ZMg0grotJOuR/yA1PjM0bjib6LsAVB59BkIHA3asIV1k3RxQeWd2+PV43LR0u1prEj
 5lnCA0LMBfxLtqSot6Y0CD8PmDPu2c7zHRrB3VlaxpcgzS0wEjueOHA08ufiIOo9fCZO
 5ZKjk5Hvss6OPXDNoPs8kxSgyzHO6c/PMhOVAVf9p8Hmb5sStX1VBT5JbDw5JznPFbZO
 vT7Onl8PG7gYB/szZQWVDFEmdH2rUtiYj36NZsW+ANcjaZdgOGRrf6iUFe4HhRjsgvP7
 DjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746632846; x=1747237646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LmkbRzm6/L2ISgCL3Ow+dZj/hCqoVpb93sMpickKofs=;
 b=RdvjtWRwqq6G6ytmidtzh9y11cu4WEqj1Z1lm0xsflUwXD+zttuHYvydmhOcukl68k
 IvpF4CCGYtnqrKKM7CXgbAe9rJ4EjVsSQwY7TMsYvskaeezOhda8b52esUVq1aeEG5fv
 QfQbCL3Pfq5KfE7C5LlO2j6ygeK9wbRG6amPYnVQ22uUv4HkB0bQ/kAby/Xm2M54eWh4
 8cCIFCQPuYPK4EiwSeHLkHH+DWobJ4INxd7FnVL1dwWricNoC2Vg/URahMTfrbaU0bRc
 DPAVueJ12dSUNkdF3v+0vr8fQ5zP2wL93KHshtQczlv8xWLs/5eDfSZ6hTDfvODi3qFG
 zraQ==
X-Gm-Message-State: AOJu0Yx79U/2O6GfGZOInmKmcai64krvV1QS2SdhaDuE/Gj4pk4isfYF
 YeMs/m5jL7lot1+f9C+3HfvPIoEyg6ipRlk0nXtZ69fwfLXFqre2qpoBmQ==
X-Gm-Gg: ASbGncv7zKBCKelxYM+4Z28/qL5HLNYsxZfKkFd63vnBCJjrDFWTupl0VnyNv6e7B6g
 7o/Gw8p8GmA3AgT9jbwHZJ/A83/dzLzkMdBu6AORAw4rjGr/TGWN+gtMwvGcorZjwmsc9mcUnOZ
 sNM+2bFFgcofqJRqfktyhWOJTUW9X18rDRLJllAOdmdkTgzUE49l0sZ/iFTeN96zKVnU7jCYfRn
 eZdXAbD6SgXXXxVDGVArSmc937msJk8nlYLJeY5QCS/lEPYCcXp6zjdBiEwaH155+mt/V6jkogp
 mJPG2Gl2InO+1ezJisW1WzJ6S/LhG5YT2uBJqR1s+ITwEyH1OkYZ6MZf8OdJsCaFrTLqy6wv9e5
 TnKFo2apwyHaLHXg=
X-Google-Smtp-Source: AGHT+IEjee61+V1bhnajLB99NRDjF86bj6+oLpOJxzBD/kzEvFWRPqLSBK91CgrPhNzavqWjuXF4TA==
X-Received: by 2002:a05:6a21:3944:b0:201:8a13:f392 with SMTP id
 adf61e73a8af0-2148c0f634bmr5732814637.20.1746632846056; 
 Wed, 07 May 2025 08:47:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74058d7ad7asm11852752b3a.11.2025.05.07.08.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:47:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Remove MODULE_FIRMWARE()'s
Date: Wed,  7 May 2025 08:47:22 -0700
Message-ID: <20250507154723.275987-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Rob Clark <robdclark@chromium.org>

The driver handles the case where gpu fw is not in the initrd.  OTOH it
doesn't always handle the case where _some_ fw is in the initrd, but
others are not.  In particular the zap fw tends to be signed with an OEM
specific key, so the paths/names differ across devices with the same
SoC/GPU, so we cannot sanely list them with MODULE_FIRMWARE().

So MODULE_FIRMWARE() just ends up causing problems without actually
solving anything.  Remove them!

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c |  5 -----
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c |  5 -----
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c |  3 ---
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c |  9 ---------
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 -----------
 5 files changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
index 9ddb7b31fd98..5ddd015f930d 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
@@ -45,8 +45,3 @@ static const struct adreno_info a2xx_gpus[] = {
 	}
 };
 DECLARE_ADRENO_GPULIST(a2xx);
-
-MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
-MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
-MODULE_FIRMWARE("qcom/yamato_pfp.fw");
-MODULE_FIRMWARE("qcom/yamato_pm4.fw");
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
index 2eb6c3e93748..1498e6532f62 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
@@ -85,8 +85,3 @@ static const struct adreno_info a3xx_gpus[] = {
 	}
 };
 DECLARE_ADRENO_GPULIST(a3xx);
-
-MODULE_FIRMWARE("qcom/a300_pm4.fw");
-MODULE_FIRMWARE("qcom/a300_pfp.fw");
-MODULE_FIRMWARE("qcom/a330_pm4.fw");
-MODULE_FIRMWARE("qcom/a330_pfp.fw");
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_catalog.c b/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
index 93519f807f87..09f9f228b75e 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
@@ -45,6 +45,3 @@ static const struct adreno_info a4xx_gpus[] = {
 	}
 };
 DECLARE_ADRENO_GPULIST(a4xx);
-
-MODULE_FIRMWARE("qcom/a420_pm4.fw");
-MODULE_FIRMWARE("qcom/a420_pfp.fw");
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index 633f31539162..b48a636d8237 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -150,12 +150,3 @@ static const struct adreno_info a5xx_gpus[] = {
 	}
 };
 DECLARE_ADRENO_GPULIST(a5xx);
-
-MODULE_FIRMWARE("qcom/a530_pm4.fw");
-MODULE_FIRMWARE("qcom/a530_pfp.fw");
-MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
-MODULE_FIRMWARE("qcom/a530_zap.mdt");
-MODULE_FIRMWARE("qcom/a530_zap.b00");
-MODULE_FIRMWARE("qcom/a530_zap.b01");
-MODULE_FIRMWARE("qcom/a530_zap.b02");
-MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3b996837b178..bc8e6f621b70 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1092,17 +1092,6 @@ static const struct adreno_info a6xx_gpus[] = {
 };
 DECLARE_ADRENO_GPULIST(a6xx);
 
-MODULE_FIRMWARE("qcom/a615_zap.mbn");
-MODULE_FIRMWARE("qcom/a619_gmu.bin");
-MODULE_FIRMWARE("qcom/a630_sqe.fw");
-MODULE_FIRMWARE("qcom/a630_gmu.bin");
-MODULE_FIRMWARE("qcom/a630_zap.mbn");
-MODULE_FIRMWARE("qcom/a640_gmu.bin");
-MODULE_FIRMWARE("qcom/a650_gmu.bin");
-MODULE_FIRMWARE("qcom/a650_sqe.fw");
-MODULE_FIRMWARE("qcom/a660_gmu.bin");
-MODULE_FIRMWARE("qcom/a660_sqe.fw");
-
 static const struct adreno_reglist a702_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
-- 
2.49.0

