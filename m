Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F1744A82
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 18:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65B910E0D6;
	Sat,  1 Jul 2023 16:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E9810E0F4;
 Sat,  1 Jul 2023 16:20:57 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b801e6ce85so18669115ad.1; 
 Sat, 01 Jul 2023 09:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688228456; x=1690820456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5O8JTAv4YKw7uBry2NnIZyVDnMiMWTmml9N1ztNufp0=;
 b=nSgSStXrnBPo1GTiqMuJEqk85ex8UyRMBoWaZWBjI+ocKbZH5y8hhBzkJ/SRKD2/bf
 l6OGMMp7W3tj7d2e+XibgAYckXE9Kl+BFxTOJp4/1F1lnnlAlT5tZL0dmBS9Gf0jPZHI
 8EKYmS9bIzIIAGXx8AjCnMiYpjkYXnOrJq7oXx5KBL9gksqGdzS6b7TY62KcD0Tababi
 Qrf1iv2BpJCwNrVbVF6aAwcgpz5+k0faun9aTIGtHIRdxWdrXlD+AYzlWz8xmENplzxz
 r3LvTB4/otqQiZKfIs87CH4lznWP8jivrX+zhf3T8kOXCPzUlrVt0j0+KEqL25MB1022
 ZCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688228456; x=1690820456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5O8JTAv4YKw7uBry2NnIZyVDnMiMWTmml9N1ztNufp0=;
 b=OtUpT/Tg8T7f0rdUrjSKGUKQwVl06ZTb/55KGczPoTCniMx9Xuou+whpivaysCgbZp
 aBBN4o++JcVEPAI3tKotFM1CbK3Ncb7yjIZRHkJJAZkn95hWmwDCjjNc1Z4Z5sw8y2Pi
 tONK2CYPyPCaMpcPJIMNOtBECA2qvfd0b3pucUB4ydeTRZnt5tqDAWs2NbMd9pqeXqXp
 5vJ7o3V7ygFuw5mPpzhGfytylLW3ZSqJJG6vbdex17qEtbrVESDLhIflmW1Pu+9pHhq1
 LqU8fitebsFXzfHenxlaKBmNAooaMhSbtevkzH8zIxyfxIGMxwDSJGiJsbTFJbrTuAgV
 ShMA==
X-Gm-Message-State: ABy/qLZIzO29nNrUsaLkSylBazCamU9CCS/O5ZmPVacsY1G+aMhAbDRQ
 2Ra+t7Mxtozx9uaKSqHK1dzko1b0Vds=
X-Google-Smtp-Source: APBJJlEkYzb4+ziqA6o0isUYA/IlAPGUGt5QLGTOuwq8cIvD/a7RCSRTrtqk5LiDl6HTuLay0SytTg==
X-Received: by 2002:a17:902:c406:b0:1b6:783d:9ba7 with SMTP id
 k6-20020a170902c40600b001b6783d9ba7mr8803589plk.27.1688228456021; 
 Sat, 01 Jul 2023 09:20:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a170902aa8400b001b7feed285csm10599352plr.36.2023.07.01.09.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 09:20:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a690: Remove revn and name
Date: Sat,  1 Jul 2023 09:20:48 -0700
Message-ID: <20230701162048.6271-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

These fields are deprecated.  But any userspace new enough to support
a690 also knows how to identify the GPU based on chip-id.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 3 ++-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ab5c446e4409..a537a3872f01 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2102,7 +2102,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	info = adreno_info(config->rev);
 
 	if (info && (info->revn == 650 || info->revn == 660 ||
-		     info->revn == 690 ||
+		     adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), info->rev) ||
 		     adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
 		adreno_gpu->base.hw_apriv = true;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index e5a865024e94..ff9f5321f2e6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -357,8 +357,6 @@ static const struct adreno_info gpulist[] = {
 		.hwcg = a640_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
-		.revn = 690,
-		.name = "A690",
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a690_gmu.bin",
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ac9c429ca07b..506001080374 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -274,7 +274,8 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a690(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 690;
+	/* The order of args is important here to handle ANY_ID correctly */
+	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
 };
 
 /* check for a615, a616, a618, a619 or any derivatives */
-- 
2.41.0

