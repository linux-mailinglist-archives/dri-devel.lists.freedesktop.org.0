Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920AEB0B5E4
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E718410E366;
	Sun, 20 Jul 2025 12:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJzyONwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D0210E366
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K9UoTW014246
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SthMOvj/tgeikoDF1DaOQafMj/mya3JcY+MR5c3vfhY=; b=XJzyONwuCsAmdsVp
 uEWekU2mkMBk4NTwwSL9PejCmB3rrqq5cBzI1VJRBOZUvRCI7S4NmnHYRYAZVcOF
 8tk1Zt9QV2SlNNq1dKfGjLQc27saRaYg316BXpDQzXApdRMnwjYoV2U6srXv8B2j
 R7YBHu8tBMnwk4NiIYrTA8R1rIJliXww2wqFTZTNL/Eru1vy/S4obpD7b8jd8sgX
 9H9HfN4tu+vyvWQFWC30IQ1dIEP974jiM5kgPcmHP+FbTCD/aAFOhbzay/APWrjs
 ebsH8/tg1KAS653ZxrKu18MBlDMIZJtz7B1da/R5iOiCkYzFjrdsi68pUUJarbh+
 ZmtjKw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9t3pa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74943a7cd9aso5316822b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013847; x=1753618647;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SthMOvj/tgeikoDF1DaOQafMj/mya3JcY+MR5c3vfhY=;
 b=FOiX6nuXnbEq9MrlW36Py9C69BfWPF6edGiqotWVMXpbhc+p95CHm7xfFrGal28ZUj
 KTYWX+xV2C/U/leqZDaHELJdPOfO/aE7ipNicCN9ipFxRh7dSk6KuwPjrRuswe/zVcY9
 n7M2tbj0vr0EuFolQWc+yML6u2oHPmqIXAHAoYsl+ekoj7sDc7DK8hpCBKRjQv5gVklM
 ElgmEv0zOgeyQ+UQnIg6g5vcjD02VvN6jpVfWQHKSGagJ9L3qcvDpHG9Ml5eRawoNoqD
 ersivtrQMXQXd3vvY0hK/k3zUaQveUgdpq14dwmy+42I96a+d19SAaALWBhsn6LtYxOY
 n60Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXy3UliYw3R9cIfx6k2dc+27OQKmt0fJYnzSQ/C2uqoVXTKRZG4zXbA7QsLB3k+MP50gxEn/tAlII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjS/QRm+4s6lhQF6QRaWv2dzQJO5+B2ZOAO6SuCD7Lm5IsKh+w
 9bp/1kL4me7iF2H9zkeKz/833LFYT+/VB/9pGLwAn6S0cURBHpybOTPns7sJ2Kxr/a7weNcW3bQ
 NnPr03RRsmIFafA3cM6BVszveoUqrZka5ZbNuWlujjXnP+RbjXZfFmQbj2wcT/0IiwpEYry0=
X-Gm-Gg: ASbGncsK1rKjcWUII3hIf0pguGF1QDUro8wK2Gh2BFofdSJLGPBAymGx6zMvJA33tJm
 xk8TxA5aFD89UJjfu7H8fnj+la92GgdU7vvQyPaoY0+pwuat0IZw0ykcP/ABreNz7Mgdfa46hA2
 AcTmoYl6ScDbGNuAYEO+oxLEOm3pa+ywDwVwaIWayVL9nyfE0OFDV5l8fDT7zQIrVtbhOc9gKGa
 wdlRsaCVN3I0z3awYOIgg/qenkkHoVg90bl+dl/4MRXQwSbw46qCHd3Q6GZ3170JdxGa6fUmvCu
 oS7xHz72AcmNGpFCe6gZBm2e04K4viWGR5o2RyQR64rD2dxA98NgxCbBhjtmm24a
X-Received: by 2002:a05:6a00:98d:b0:755:9110:c00c with SMTP id
 d2e1a72fcca58-757250806bbmr27254982b3a.11.1753013846860; 
 Sun, 20 Jul 2025 05:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs1tuitviwC/J4/O6Bb16mbD1enJVUrTELkd81BeF8q+yHvYhQvPif6zen4HAAh/KoTrNivA==
X-Received: by 2002:a05:6a00:98d:b0:755:9110:c00c with SMTP id
 d2e1a72fcca58-757250806bbmr27254940b3a.11.1753013846439; 
 Sun, 20 Jul 2025 05:17:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:26 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:10 +0530
Subject: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2596;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wqJpkzMI0ES2mEy8nQuiLa2Vdj3zgdiMb0q9pTdHGtg=;
 b=dN5Ha5ZJ1vy2SWgzYUESebNz8sZiXP+h4UlpLjzQ6YYCuUUyAbxGHHl1x/rWbxhGlW5EP8351
 +4ZawQy9qRBAIE8eJ5Tx+2jrBUEsUpkB+yuxg9EPmPkcPOU7ILwLRhb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: CxlRhYfGQohaSV__vPZbac0k1bOZ_fAB
X-Proofpoint-ORIG-GUID: CxlRhYfGQohaSV__vPZbac0k1bOZ_fAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfXwSNwYkJl9W9v
 whqGf8M9rKVszRST+qPA2MPLEjU8Yib9TeX/k9eoPnmz98h8GxhJWM1S3NqheOouowugUCGis2N
 LHAcWS3h30heGlFpOYL+sUR+rDISJO+IOhup7vweSJlluYZTwMcNLXZ5KIW0woHzL0/U+CZS7CV
 aGZ7RATmIykyuQymlshPjfz3BSL1rZo2ShFG90AOi4vdFRz+N91jsyjow3mchd++6qNTt/DYRkO
 1EzhGcsaXX6QmM0FGTTJr7z80MqLUKeBICxFK56avII+eaVSQ7RezyIZihKDcITxBRI31GfiuNq
 TVXOMg+txfa1HcPcn5hcv9bnCw3E/CYX0rwUnZVab6aWwcFEnyXbHs7F1qqY/PdHpjYJsu1UV9b
 hZbazrxb6F+eZ1ZPGM5okN/QIVj4F7L3UiUlozAvQB1i3BN1idJvwqzbCYoI5tV6DHFHcAQB
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687cde5f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IO4KcYcNY2hykouNLhsA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200118
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

CP_ALWAYS_ON counter falls under GX domain which is collapsed during
IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
not impacted by IFPC. Both counters are clocked by same xo clock source.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3c92e590f14999d10d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -16,6 +16,19 @@
 
 #define GPU_PAS_ID 13
 
+static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
+{
+	u64 count_hi, count_lo, temp;
+
+	do {
+		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
+		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+	} while (count_hi != temp);
+
+	return (count_hi << 32) | count_lo;
+}
+
 static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
 {
 	/* Success if !writedropped0/1 */
@@ -358,8 +371,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 }
@@ -559,8 +571,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	}
 
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 
@@ -2246,16 +2257,7 @@ static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
-
-	/* Force the GPU power on so we can read this register */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
-
-	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	mutex_unlock(&a6xx_gpu->gmu.lock);
+	*value = read_gmu_ao_counter(a6xx_gpu);
 
 	return 0;
 }

-- 
2.50.1

