Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315EB486FF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AEF10E489;
	Mon,  8 Sep 2025 08:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iX3t+CH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C59C10E41E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NIWkC007291
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7S/gh1bczo3bWqSmVPBhR4GIaagB0w6uTNlcN/zUrto=; b=iX3t+CH30bsAcldE
 TcZmu7UIZKINgPzcGdV/H07bTHImQbuX2wKBAA2v6+Siu4wGk7aK8p82r8zbKOPQ
 AlfLIw34/7Zt/Y01LJd9WTGwEV3PNbzL0j5L3s1rHPRl+tO08EGeWI9/8mPjQQE3
 692jN4xXziXPvAjkqMhIbZSr55xlQtvLCTATdHQRKpBerPZxYyb4Ep/BjZL2wd8p
 sr1FTUGfuS3Z+AS3+7rSd8OOG4FIIwLUdPHbxXkzKRjHNskoUR8VYvHIn+ioyKiT
 9Unpv7Q2YT++okC7Z95gElY7rQ57h/oId68NvNOjME0buQuV9Zpj7od0pL2OEUQe
 tRNsyQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a3q2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4c72281674so3156670a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320077; x=1757924877;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7S/gh1bczo3bWqSmVPBhR4GIaagB0w6uTNlcN/zUrto=;
 b=R/TS+7beOCN42vnxgyoHo7wmJU0WldLmOqmNnAeY3atEKgSIsRv8DzAFjXYZdlD9r9
 mvzrqRv3xICuRbRLdBrzZ6BCLXL909kuzVt8ZKmYAAVTo1HgLDoMuc1S2B2W+FWalKDo
 32jakfT2dThdmgX8lVxminwx5Y3qb+OWBFZ0XDcXJaxGUdV0u+CtZaKGuNTl8ZabytD2
 G/c/cGZzBwOxq28/Uf9HMWA4qmPBckCqYVMaaW10rCqDFCbJG8AtZDl4Htr0D+AY2EZV
 DZFbNtLpPPepfeThlG/KMvwzpElx6HS1m069VI7HKOwODAAhrfU4BPu1znUVzD0W/84t
 TV/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM27MrKpCB68NlpM06hcdmm2TzjFD1erdsnfGVk/xAmr5NLBRJdnkscfuYspjARy5UqIXQGhNHSnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6D9tbv2N/IdFHlTBZqDWHig8WYjeakv/L7o+G5xuFpu3E4/as
 Pfkh0zbF0a7Rq7Rjzza7QAxYdPBNvnpVSjt8rgBuRyDpN9yJfpIQXKIHXcVHR6+inxxJ63phWCV
 36Wnnhc6q9Smty08AMy0nrVrvF6yWwvYSw13Yhzg68R93jE2SaqzgX/XCLvU5Mw4V8StKlIM=
X-Gm-Gg: ASbGncsWB+MdFKTsz/cvl1vwMYLT8GPZfDXiSzFcn/LNbo7rCfkA08oByu+ZtapslT0
 kgGe6XOtZZJx7vczVHC5qdkNndkoDgueNeMy43GWPG7L8nYnaADMAtl2LoCTP6QlffpapE+6FmP
 DUKCxJHTkmMbBM9fVsXZvSen6PuWVlvfbL2Gp6xz+z3Gdy2fax5J2aO+sQtyz4FWBCT5TqreoRw
 lZv99Hf63AxATDVVLXflRcJ1dky0ygWqKnLN7GpP9pkVMIQqZvdNhu8XAQcCN8ZRu78BYHxISjU
 Dawy1GWxB32p2JGhyFxoZf9DdDd5Y6c3qyBJKB4M+ozNpGKMeZ0UjfQHOUlA8hmN
X-Received: by 2002:a05:6a20:748a:b0:243:b190:d132 with SMTP id
 adf61e73a8af0-253444159eemr11053980637.59.1757320077068; 
 Mon, 08 Sep 2025 01:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZlFnS+EY2NJveViSCLM4wHil2v4/UFqOr6ytHlfYM/kiyIpu9c26cPUorjQ/8HOTDxcG2ag==
X-Received: by 2002:a05:6a20:748a:b0:243:b190:d132 with SMTP id
 adf61e73a8af0-253444159eemr11053946637.59.1757320076598; 
 Mon, 08 Sep 2025 01:27:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:01 +0530
Subject: [PATCH v2 08/16] drm/msm/a6xx: Set Keep-alive votes to block IFPC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-8-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=4220;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IMBo6N4wzsS8MDmukZdsfvnrZM7EWF31g5XLtxm04N4=;
 b=+VgSWY81nQLwZQD5J4hnvjnTyQ0hi5MRgtxHYndfiyxkmyBM47dDIsffcPx/aUo5/5YNVE8jL
 e0kAaPyzkRwBxp02eDBLkp+Ho+QDDfw6mTSvxLz87SMovajI8VRQ3LR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68be938e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nUj6x6g8p96gposalbYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: T5MSzq8Q66e0Phcd_MrVBi-tIhZgHg5e
X-Proofpoint-ORIG-GUID: T5MSzq8Q66e0Phcd_MrVBi-tIhZgHg5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX2fK2JIAdYIis
 ywZb9NCQSR+kBs9Thq91iNQzWu/3MWA/5MAssoUMJmHNCsPfJyT2YMLiiunZjjG1GtHriQeZfRn
 kNyI/YTAUsdTo2W+pOwtWnK9EoQ/W52wXwfudHdMrhyqJezAJeNjX2JTaPhNn+oKGt64MsHAjto
 XBxRPgVuDkbNaIkTTX5Pny0IWnAvBCOmqQHBeCCnx8X12Q4qoTjqFrysv58oJZfvgmQ5o1gWaHe
 xRuABQYqHHbhtaU56SGk73r+XR+fcbNwyQUvJ3+YwK0zZSKV+M1XGrz7owoEjI0Ek/VWqU7iAlT
 GzSZOeop/fi5IQt5PKV7KRMiX4rlmbm55L/YrqCKEcZtfWgNpkhsDjHhWi4iR5P1fHEFF7tyyRv
 Hsp8pG6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

Set Keepalive votes at appropriate places to block IFPC power collapse
until we access all the required registers. This is required during gpu
IRQ handling and also during preemption.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a63dad80ef461da45d5c41a042ed4f19d8282ef5..33a26bbd245ff49784bf1219a584936b4caa62b6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1771,8 +1771,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
 
 static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 
 	/*
@@ -1784,13 +1782,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
 		return;
 
-	/*
-	 * Force the GPU to stay on until after we finish
-	 * collecting information
-	 */
-	if (!adreno_has_gmu_wrapper(adreno_gpu))
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
-
 	DRM_DEV_ERROR(&gpu->pdev->dev,
 		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
 		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
@@ -1829,9 +1820,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
 	}
 }
 
+static void a6xx_gpu_keepalive_vote(struct msm_gpu *gpu, bool on)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return;
+
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
+}
+
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+
+	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
+	a6xx_gpu_keepalive_vote(gpu, true);
+
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
@@ -1868,6 +1874,8 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
 		a6xx_preempt_irq(gpu);
 
+	a6xx_gpu_keepalive_vote(gpu, false);
+
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 10625ffbc4cfc26edc36efcf11dbb4efd55ab3e0..2ce073d1cf8cfd7c774918851de03d6e367e5625 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
 	a6xx_gpu->postamble_enabled = false;
 }
 
+/*
+ * Set preemption keepalive vote. Please note that this vote is different from the one used in
+ * a6xx_irq()
+ */
+static void a6xx_preempt_keepalive_vote(struct msm_gpu *gpu, bool on)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return;
+
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_PWR_COL_PREEMPT_KEEPALIVE, on);
+}
+
 void a6xx_preempt_irq(struct msm_gpu *gpu)
 {
 	uint32_t status;
@@ -176,6 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	a6xx_preempt_keepalive_vote(gpu, false);
+
 	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
 
 	/*
@@ -302,6 +319,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
+	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
+	a6xx_preempt_keepalive_vote(gpu, true);
+
 	a6xx_fenced_write(a6xx_gpu,
 		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
 		BIT(1), true);

-- 
2.50.1

