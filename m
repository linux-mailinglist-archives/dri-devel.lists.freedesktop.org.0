Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD7E7F8DBE
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 20:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343A010E03F;
	Sat, 25 Nov 2023 19:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2208210E038;
 Sat, 25 Nov 2023 19:12:09 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35c690f6e00so5044905ab.1; 
 Sat, 25 Nov 2023 11:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700939527; x=1701544327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=InO944iGhkpnbZZ89M4jhM8BqOJsrw18SbpUTux2+2c=;
 b=UpypIZ7DjOF2B4XOpQpbeAhOKNkhss7c5pR6UBTZ7g/vk1E689eQAHl4FmsBd5yNhv
 m6qxLSfPAoj3GrUNJnF0C03ZFW3UwDk+iv+YOREvG4T4kogM42Gqnjyh+nWQR85B2wd2
 /2qCMu9MnWVgthigBh5P/xd1FmXfjew60Pk+kilCuYcggz0j8Y+qU4KYQb/cx8KcFviw
 zRfoP+Syse1ZI1NEvnDiYXzUQmYylIqy7inaEUIApj1cwFUneoupwE5OsV9DuOWEna5g
 oRRTVB1b5m6XP0TbXgimTkhTtJxh96M6BwXlzerFj9CFf5f+6flXyG0ObUDfnAWkcetx
 4rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700939527; x=1701544327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=InO944iGhkpnbZZ89M4jhM8BqOJsrw18SbpUTux2+2c=;
 b=h8gHC/ktoJXV2NbvjYzU0RXofb5BHGuBhXWJqPwbOQcmuBYz4hA61XH8Zpx6O//39n
 oMD2Lxs1X6yXMdMPqEDIb0HzAqIq2lmLxZ/ow7wPh9WjQDqNyuZdk/0jRF2CkvwD3l3N
 MLGCB8/zIeI6L+VwnVil/xHk35LlzvYec2cl1nzz3rKIB/oCRE7p4skZm1ZVhdAb3fnN
 q6EFvg0ERlQxNlQW3CShq/JnLXNwkyE7/889ZJf63f2Ak2CrZIZpouLeZzDLDBYV5w3k
 EvTdJu/qSrRpSnWivpfLgp/1lpkeaRGvpnjyJv0M8Z/IAVlt/WDyDcKdjB3hlo4HhVZq
 6S5w==
X-Gm-Message-State: AOJu0Yy8Kavj5q/70IoJtgwr9wpreiY4qB2R5wDiPSUzWWFN44d8+gXf
 UWIr42sy5mkJUFQfWUZQlx1UQFFVJ7U=
X-Google-Smtp-Source: AGHT+IFwE/dHHJzHe6umOUV9J8rWksNeOz/QBwxeptGGIiqOaT/t/oac6tTFX63Ey8kBhnkhJUYKeA==
X-Received: by 2002:a05:6e02:2142:b0:35c:9577:dee with SMTP id
 d2-20020a056e02214200b0035c95770deemr2672154ilv.1.1700939527119; 
 Sat, 25 Nov 2023 11:12:07 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d25-20020aa78159000000b006cbae51f335sm4817092pfn.144.2023.11.25.11.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 11:12:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm/a690: Fix reg values for a690
Date: Sat, 25 Nov 2023 11:11:51 -0800
Message-ID: <20231125191155.5375-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121162137.60488-1-robdclark@gmail.com>
References: <20231121162137.60488-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Danylo Piliaiev <dpiliaiev@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danylo Piliaiev <dpiliaiev@igalia.com>

KGSL doesn't support a690 so all reg values were the same as
on a660. Now we know the values and they are different from the
windows driver.

This fixes hangs on D3D12 games and some CTS tests.

Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d10b22eeda74..7784d7d39192 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1312,6 +1312,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	if (adreno_is_a650(adreno_gpu) ||
 	    adreno_is_a660(adreno_gpu) ||
+	    adreno_is_a690(adreno_gpu) ||
 	    adreno_is_a730(adreno_gpu) ||
 	    adreno_is_a740_family(adreno_gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
@@ -1321,13 +1322,6 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		uavflagprd_inv = 2;
 	}
 
-	if (adreno_is_a690(adreno_gpu)) {
-		hbb_lo = 2;
-		amsbc = 1;
-		rgb565_predicator = 1;
-		uavflagprd_inv = 2;
-	}
-
 	if (adreno_is_7c3(adreno_gpu)) {
 		hbb_lo = 1;
 		amsbc = 1;
@@ -1741,7 +1735,9 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Setting the primFifo thresholds default values,
 	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
 	*/
-	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu) || adreno_is_a690(adreno_gpu))
+	if (adreno_is_a690(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00800200);
+	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
 	else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
@@ -1775,6 +1771,8 @@ static int hw_init(struct msm_gpu *gpu)
 	if (adreno_is_a730(adreno_gpu) ||
 	    adreno_is_a740_family(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
+	else if (adreno_is_a690(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x4fffff);
 	else if (adreno_is_a619(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
 	else if (adreno_is_a610(adreno_gpu))
@@ -1808,12 +1806,17 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_cp_protect(gpu);
 
 	if (adreno_is_a660_family(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
+		if (adreno_is_a690(adreno_gpu))
+			gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x00028801);
+		else
+			gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
 	}
 
+	if (adreno_is_a690(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x90);
 	/* Set dualQ + disable afull for A660 GPU */
-	if (adreno_is_a660(adreno_gpu))
+	else if (adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
 	else if (adreno_is_a7xx(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG,
-- 
2.42.0

