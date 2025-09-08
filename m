Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C557B48700
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D39710E415;
	Mon,  8 Sep 2025 08:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BnHMSviT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30D610E415
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MMfhi013584
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WZyO3Nq93Bf/xQ1FnubJPlIMWCRx8r4Toxq5+4c0O5k=; b=BnHMSviTEesJu1Az
 snAreBs3+0WgA3WFrF2l5dpD/ZKSciieP5EARfjD5pZAErEWC0Cdnd8/iI6ppJ9L
 ZekdmBqXOEZ1tr4bC+XBZOD3ULLsieH3UOnLnCODkhtZNRsMciNoZySZn9sgynul
 fOT+ug0FK7Jr8FTvur3X5xt6B3ANZcfJ3P6joY9EC5CmnlIaZUI+4X6vZJgZ2LwE
 FO3kIWDfwt6YEY04F3raSr7TQZ57mj01I/RG8KfjK2pzh3uvBiznnzDTLYvEKiX/
 EIbzbuFUs/MNNBAT1WRUQmcnHrd5PuPo8tEQ/L3lOp3LxDjMwJ2LqibBHY5Yeal6
 qlqhQg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws3v9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77278d3789cso9199309b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320081; x=1757924881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WZyO3Nq93Bf/xQ1FnubJPlIMWCRx8r4Toxq5+4c0O5k=;
 b=IqDix/gWk6HzTIYp32iLJ7NxZa7hlEaOWswUKB1V3zg03dxEMBJ9cF2r5t9PnE0zvm
 HqDyD6xIhHTGKEGEMkL7XOdEmvorUXdE8UiPNtAWQ476H2Rd40qL5usZ4cIGSEpFIllA
 5hAIh1Zd3lKi9cGoMb6GdvlaMFC975u8AlOHotCqLNBDDLqzJFIkcKkWX1HCLZ2K7wOq
 C35Pqgw43hjxEv24BwdBvHkZYZg9gWGa3vHZNRVhb5TEpD/S6UqCEvbc/JEJq8WTqgvy
 c4B6cCaVPukiHlg2Ab/V8TrKOveFurJSJzuiI+J4eajQwd9Qk7s+VFhR6D+eusnPFhlo
 9iXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV8GfuFVAT8gbMG2TgjQYny3QtTocRaV5pDkcVKsYuNFOOEW7Sv6L6FnYSIIIGqGna86C8SVYg9js=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIK1ZFhIhOeLJEXKBXrIfLUkZqCaYN7j7zUzDlgrQJ0b5/D7Vl
 P0gewxCF/r7vRbbGIoZhXLgRK/Agboiv9SWKxkLsA7GZSnqtb6RKjtKr5671/qadIRoABtPkNvy
 hT8tOHt84JKhLz20KgY98l/1hbZmfj5+Uv7N2c/qC6+ItsZVsCGtvEyNdB0XsCcGvpLuvkA4=
X-Gm-Gg: ASbGncviS9wkb3PAam4nOSXNEzTT+8csPD+/3VrtfZx45NI2TNgPhMug+gTI2l7hZTJ
 4ssNbf74Vn+CjSg1HSUZzotOhMoUlHhoh16O38hkPUryye+/PrpQmyIaqBcDyMflahR2JB7HFVK
 BzsebTymTXFSXNGx/bolKkNfrVe64O37tBsZ1Jz//wEI978ECab6eCA9FGuOuvSeC/8gghaIaK6
 Qjy9SDqOaypJVyW8QN8JNTH4tcH7vjz5zo9e3p13gqqjg5hnRvVw8r17+I2KPP74l5tlDxJhn9z
 q3wSSXxpzZqL+aRKI5dhVteyeH4qhhDm7h7Ozg4U7xlX9p0k2NyZ+KRL8UxS90vB
X-Received: by 2002:a05:6a00:1489:b0:774:20a0:dd65 with SMTP id
 d2e1a72fcca58-7742def5affmr9598643b3a.18.1757320081348; 
 Mon, 08 Sep 2025 01:28:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA/YHKsqfgyAor24HUBSKnNnWTsB78uSq0VADVG8FDB/BKgowEMs4Q/v/ZpMOJN0/Ze4YAVw==
X-Received: by 2002:a05:6a00:1489:b0:774:20a0:dd65 with SMTP id
 d2e1a72fcca58-7742def5affmr9598614b3a.18.1757320080912; 
 Mon, 08 Sep 2025 01:28:00 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:02 +0530
Subject: [PATCH v2 09/16] drm/msm/a6xx: Switch to GMU AO counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-9-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2606;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=BnBwOePYgAk3DH3Xs1s99xX8yvtkGViS+FKVC0Tm+Fs=;
 b=J31mz5s4viqszzEmkcEfZjUtCxH2Yw01ajJbFJ25U/VAJMLlEvOdpS0BogFIDeLhaY3SaHt1M
 MwcJWKugZ1QB2hkmvF0EeEVLF3Hs0+joMGgptu4DLTNtzaUEzS9JIkk
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 5M_BULtipnZRbb8gpujP6C5GuNV_YbwU
X-Proofpoint-GUID: 5M_BULtipnZRbb8gpujP6C5GuNV_YbwU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX5qtTX0bCt6+c
 wqbQzo8UjFrv0mUDCT1eQHZzmANuYcnslrDMBCDaewVGTqpTJBLegiPJlQJCxVeWxvBP/Otw74x
 8u7sLzzEpqRc6ncVKjeiQM4JNmI4rcHWjNd7itp97bf+qco0jUUQB/75yZsnGFTxqlS4rOdiJM/
 mcjiLQIac4o5efaHbAOAa4CmysO/YDv8Q9X0RXWQhWojSeoTRLqSKbc7eq077RgFh+EXcdNI/0a
 H/HWyeI3XBW3hgbH1GBchyhrKbHyeph2Q+CgYuqFoACjSTF9n/j+ZS21dss34iMU0CP2ylI2l42
 +xMtJ6tYQ4XUowLkKv/kpIdC3caZDc7mBNMeFiAuh25Y22meXBT0Gp8wnOz2rxKL0j+TLVd/UtT
 BszHUyNc
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68be9392 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IO4KcYcNY2hykouNLhsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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
index 33a26bbd245ff49784bf1219a584936b4caa62b6..c64c84affa6821f79ea74b80b2f2014df38ec918 100644
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
+	} while (unlikely(count_hi != temp));
+
+	return (count_hi << 32) | count_lo;
+}
+
 static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
 {
 	/* Success if !writedropped0/1 */
@@ -376,8 +389,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 }
@@ -577,8 +589,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	}
 
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 
@@ -2265,16 +2276,7 @@ static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
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

