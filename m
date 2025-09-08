Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD9B48705
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5590B10E48A;
	Mon,  8 Sep 2025 08:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkQ0U1k/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D4F10E48A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5883kld8012537
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A0C4E7Nw7YzjCUNPjzfc7hGVXIhBZt+qciFyEW/6v7I=; b=bkQ0U1k/oSGFwyCO
 7bKvvgQDYYSGUqbaV9ebliIN33m4XHXaidp6cBUW94/UW+e8X/1Me81NFcJXKm2T
 RU+O9W6CsQUwsMQSkc/CEk/dM7tM7ihgVQMmghC7nudPoXL4lUmQOA6J9iEcplFH
 N7yLI4XLV8XioMG0N5rk8EJ6Nx0bs2msNu2KyqlpGuYDrl/vk8OTv17jsqFejwXW
 uxoXT3uCTeAMFjpsBzsjPy4ki4HFabsCqCCgbY+OdCGugrbuyHG5ZIBevR7eFFf9
 5VT5dWfvVUw8k9PCdO2Vtmj28CUQuArjvDy9hCGEFo0OMEqytflnWoELskI76X0J
 o6RhNQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdrncu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4fbb90b453so6991213a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320090; x=1757924890;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0C4E7Nw7YzjCUNPjzfc7hGVXIhBZt+qciFyEW/6v7I=;
 b=QbPhmZIqDWPOO7dMJXZJZ6E9fLL+BZnVkCHRuSlaTirgFY0aEp3+U/UN6pzLNFE26s
 YpMP3lLCqBK+fjC1g9e6ZKnG5Kj3wKuo2/unvht4eHoYBMLLTnvewivhi1T+oijnYvlw
 kc70EZsslIdL6ik6oMxkUxRa7dvNelOQ2UCxlanyK0IK44DVZZ2wEw1ffbhsVUj3cc6o
 FIp7qaeaWRC6NS2sYl2v3cvxIQAfceKBlK0Fw1j09QKYUaV9aWE9gy8HZ4b7jnzZlFx1
 zh68/R0/NeJ3B2xDdLH3GN7b+cioMXLNqklFYylxOyeqjFYKmnZJ3B5P8k7jcyeMVIPd
 1ATA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUdwLFGsluK0f1wTk0KqGy366fE9ePX9sDkD/5LzX/tLAyV+rnsObFoT/ET+8SHXBAt2WTuX1wmns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3XzqTPZZJOKgaS/aDRhzvzIaSmWJ7sjlNkYgUHzTG66uRbVYu
 +xFgageI3G4kU0btX+/R50EX50kMiTCwHjUfJ6ZuwizQzX0mop4adOZxB2vq1ihGnSFmRHkQ7oB
 +LLwzVQzJjRKIbxYHpAl7u1S90hnas3YYZ0CotZ47P8l+zPKp0Oqd2UTnjxHl+k3FeHl4J9U=
X-Gm-Gg: ASbGncvTey95QeapOjh5LPlVKU5M9kP8NDktd3WvL0IrlerUd+PdSt9mjbKHlMu9gLU
 pRIhkFTCBgzDrOqQv4yQOQmQz2FABBGu6VfYvm8Y9xX/4RwGKD89t1NlUw4fpAFW62d0IVQ+T2H
 kbnWmC6L+zlyaB3FqT8gQ4oe3aLz7VWfDxbAWhUczI5lNQANjSG2Xj7okL3aqvtxECkvbxFCOOi
 L5Bas2zbkrUcpZRm3C8zFBMoH46AmyZJua4Ac0vEmPYkDmNhdKwWURa8fD+DxyLYFlheaSLnNQ+
 mzezDzJYqWnSSNLQQJbyiTk762xR1raDVilCJ0TS2pxvds8/Tp6uKx0R1uuGfPD6
X-Received: by 2002:a05:6a21:998d:b0:246:2c:113 with SMTP id
 adf61e73a8af0-2533e573539mr9966588637.4.1757320090126; 
 Mon, 08 Sep 2025 01:28:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9eglLLYqQpIkbqR7FguLgctxfLEBzAKKqAMxb/nL1fgIXdEAQROcNKw3dgjcDi4rjeIiPMA==
X-Received: by 2002:a05:6a21:998d:b0:246:2c:113 with SMTP id
 adf61e73a8af0-2533e573539mr9966553637.4.1757320089627; 
 Mon, 08 Sep 2025 01:28:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:04 +0530
Subject: [PATCH v2 11/16] drm/msm: Add support for IFPC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-11-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=3943;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hcHfihbqCnMNLjvYKeukB8x/8H4c4Vf9wDORLxifp3c=;
 b=zetP+yadiCZUchc7jrkjvEtlnEQLCrAdJRJ9OKW+7RAA2wjN8liFMXKKKEZUWHObTkaKk2Ca8
 MK+E5Cj5o6FCtx2/8H6Jur1dX2zKxzqN72jjx1EOQ+/Q0RiOe5BPvNn
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: uT-sK8kLU0_Fip8nXBl3T8UNLQ47Mh-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX7DaBqhgzfUs0
 MynvCRYVWde+2KM3N74rZVewt/n2soytbVgyxZlVFit2RYb9FVKTes2AfhL4LBwTs0r4vdRE75B
 9V7p6mgITH3i4ek5WqDpURias1Sna3SC+7DkclQKiADo/LJQppkEcUYF/hhVwbxeIZeAxBLqoBs
 604ec5cORQg39EpTLOQqceUMst2Id+1/ztNYCAGvdv9XOohTsGxwGv5IZqfkZSxTDpQTUMVqygq
 5TEII0kp0VWN34gMUIJtHzentIO6Gegbj69vbYKCsvMfvsUAqyWR2SPuauIa7GKL2aCk63TsqPA
 WvgiVU0PLuoOSkRsPggn/cy7wgEulfMAGHHPiPimC7ZAtRAHuMb3kIf2NiK7MVExr7Dyrwo87Eh
 8Ux6Demw
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68be939b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=P3MwbOLga73G8009EeoA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: uT-sK8kLU0_Fip8nXBl3T8UNLQ47Mh-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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

Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
for a gpu. Based on this flag send the feature ctrl hfi message to
GMU to enable IFPC support.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  5 +++--
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 34 +++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 18f5fc2c28e33d81ccc248216cc018300c81eb77..d6297cc7fe664a74224c441e877050612714a3e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1961,8 +1961,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		return ret;
 
-	/* Fow now, don't do anything fancy until we get our feet under us */
-	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
+	/* Set GMU idle level */
+	gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
+		GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;
 
 	pm_runtime_enable(gmu->dev);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 8e69b1e8465711837151725c8f70e7b4b16a368e..550de6ad68effacaea09751891c2528464bdfcc5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -21,6 +21,7 @@ static const char * const a6xx_hfi_msg_id[] = {
 	HFI_MSG_ID(HFI_H2F_MSG_PERF_TABLE),
 	HFI_MSG_ID(HFI_H2F_MSG_TEST),
 	HFI_MSG_ID(HFI_H2F_MSG_START),
+	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
 	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
 	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
 	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
@@ -765,23 +766,40 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+static int a6xx_hfi_feature_ctrl_msg(struct a6xx_gmu *gmu, u32 feature, u32 enable, u32 data)
+{
+	struct a6xx_hfi_msg_feature_ctrl msg = {
+		.feature = feature,
+		.enable = enable,
+		.data = data,
+	};
+
+	return a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
+}
+
+#define HFI_FEATURE_IFPC 9
+#define IFPC_LONG_HYST 0x1680
+
+static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
+{
+	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
+		return 0;
+
+	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, IFPC_LONG_HYST);
+}
+
 #define HFI_FEATURE_ACD 12
 
 static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
-	struct a6xx_hfi_msg_feature_ctrl msg = {
-		.feature = HFI_FEATURE_ACD,
-		.enable = 1,
-		.data = 0,
-	};
 	int ret;
 
 	if (!acd_table->enable_by_level)
 		return 0;
 
 	/* Enable ACD feature at GMU */
-	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
+	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_ACD, 1, 0);
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
 		return ret;
@@ -898,6 +916,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
 	if (ret)
 		return ret;
 
+	ret = a6xx_hfi_enable_ifpc(gmu);
+	if (ret)
+		return ret;
+
 	ret = a6xx_hfi_send_core_fw_start(gmu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9dc93c247196d5b8b3659157f7aeea81809d4056..390fa6720d9b096f4fa7d1639645d453d43b153a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -59,6 +59,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
 #define ADRENO_QUIRK_4GB_VA			BIT(6)
+#define ADRENO_QUIRK_IFPC			BIT(7)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.

-- 
2.50.1

