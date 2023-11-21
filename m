Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F9C7F338C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 17:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF9F10E50B;
	Tue, 21 Nov 2023 16:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DDA10E505;
 Tue, 21 Nov 2023 16:21:52 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5bd5809f63aso3292901a12.3; 
 Tue, 21 Nov 2023 08:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700583711; x=1701188511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KTFRsgH40UD7MzukJZyHOiKKI64hMJVUbzazPe+Qj2U=;
 b=C1PoBxi9L5mv9K111An8CcnWsx++Ls5UELoRoCyT8XvnhPNTbSCbvsm20N7gZIWliQ
 4U/dfAPZIDmZXXMl5PnVUOS/5sBSmYzBVGo3wLUkTj6WXkxUHwgt154D2YM+4V4gl//b
 ECgLygtyefP+9FsoPZ5WJmios9PUOh3svzHe+XzjRkWzQUjQQuS0VdwVyKpGj/y4k/Dk
 uyB9ceAxtPxypgOkQi//TcNIVHNuSMhjfHgCy4CAq6RsJ78isleG6Cnx+obPqvahPW8V
 vqihkkx6Z5kSwSsP7mii2rpFTLMxfmS8LI6VnIGrS27lKLsJOYOhU7ARs1XUee9DoCOP
 pclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700583711; x=1701188511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KTFRsgH40UD7MzukJZyHOiKKI64hMJVUbzazPe+Qj2U=;
 b=T+WBWr1TqyByqPXx65Syjs4HVb4QShSPsY8ntcl8E1nB1g6BdNlnouY1z4/OBB6vF/
 2FmtwzX1RjYxSQlqAUqr8y51hTMQQEyLqroRXDyVTMy6Q5NXS1Ydofz+aQ6SCGLNz+WO
 QmB6HhSihWe/BQfZmSxDAyvR3gdSk3WVS4j0KfOrs5sTJf5iBg89UbMzb3shjL/wrDEr
 856f0mEorwTM8H6tt7ptgMOurnzdaaVqC9fk7IIAi7+e7DR7/7NLP/lw9nk59aLkRK8E
 EtYeIvuLulDTnHlomcVZCXQVXFKyYJ0ugsepqyYRlsgAN0llrCL+ebI4RiQHH/XcNcri
 8VmQ==
X-Gm-Message-State: AOJu0Yw9dHR2FyWJ0oD9dgMsrXCQGqbbEwMIt5O6n3N3coWMqW2th5BI
 UrkK86TTrkYnkHsD77eiesjHV0ImshI=
X-Google-Smtp-Source: AGHT+IGGtBENf9dS160s3wzmeIjVz/3q7r1rgfd53W48Vj7jDLdwxWWpKeJHhYrbHGCukPK/mmxSuA==
X-Received: by 2002:a17:90a:19c:b0:280:4f82:68ac with SMTP id
 28-20020a17090a019c00b002804f8268acmr8403000pjc.24.1700583710574; 
 Tue, 21 Nov 2023 08:21:50 -0800 (PST)
Received: from localhost ([47.215.232.245]) by smtp.gmail.com with ESMTPSA id
 t2-20020a17090aae0200b00274262bcf8dsm9306648pjq.41.2023.11.21.08.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:21:49 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a690: Fix reg values for a690
Date: Tue, 21 Nov 2023 08:21:34 -0800
Message-ID: <20231121162137.60488-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8176ea8da7a7..75e1ea0404d3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1326,6 +1326,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		amsbc = 1;
 		rgb565_predicator = 1;
 		uavflagprd_inv = 2;
+		ubwc_mode = 2;
 	}
 
 	if (adreno_is_7c3(adreno_gpu)) {
@@ -1741,7 +1742,9 @@ static int hw_init(struct msm_gpu *gpu)
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
@@ -1775,6 +1778,8 @@ static int hw_init(struct msm_gpu *gpu)
 	if (adreno_is_a730(adreno_gpu) ||
 	    adreno_is_a740_family(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
+	else if (adreno_is_a690(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x4fffff);
 	else if (adreno_is_a619(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
 	else if (adreno_is_a610(adreno_gpu))
@@ -1782,7 +1787,10 @@ static int hw_init(struct msm_gpu *gpu)
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);
 
-	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
+	if (adreno_is_a690(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 0x81);
+	else
+		gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
 
 	/* Set weights for bicubic filtering */
 	if (adreno_is_a650_family(adreno_gpu)) {
@@ -1808,12 +1816,17 @@ static int hw_init(struct msm_gpu *gpu)
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

