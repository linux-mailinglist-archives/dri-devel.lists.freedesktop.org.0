Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3386B0B5F4
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B583D10E454;
	Sun, 20 Jul 2025 12:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kd4pPR/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACA710E379
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K5eKLM004187
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zIlFhVtMPva9g73WCL+BKRvthw5mdCGh7uZx0QqR8W4=; b=kd4pPR/f41RYCt2A
 36fpS11csKd0GALbhNeiTOLzzqtStFNgYpWDPLd+8ogzwiQMZ+2XYb2TXBsRyBq5
 onch4Nl0zaPgWm3zdwDBJFtnwzKRDWZfNVOOiEU0k0JHTGGSdMhHhQczQyc0K0xi
 AudpxwtxXxjRCYM/cDWjXvbxuzPJiTgUmOsRhXAAIFTAjZe84m/f4n4a207u+LFV
 BOl6CTOb/M0uOl9/TN77SOig04UAUDfO7yU6PIk42KjBO8NXI7l83R6KUyMxChVk
 7pOq/lRC0C1SDBNgMJ10JtMmxmmYhCCW0qkKK6z6dq68S8zwFNKeD3nIjMhpQGYS
 +73bzQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451a5ht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74b537e8d05so3171575b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013843; x=1753618643;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zIlFhVtMPva9g73WCL+BKRvthw5mdCGh7uZx0QqR8W4=;
 b=Q9TXZN65OXYLuz+Nop8Z8JQgXwtEMBvH8dlYWrOI63pZh+oQs+dIuQnrrUTDDDbZxd
 GO3ftf5qq01wYr78zlSu5o37wASMApArnrNnyHL4pooiPWRIQnHJT5t3gvIWQ4iytevi
 oMiFEfPbXeDpSp9qugK1LXHXw5M2Um3PgR5LgRs/viOfr8JiXB3vY2kbFSCkHPYpLxa5
 KRiGOtgkOcAm1kRrz31SJMSZ9nur89eZwWvHOIbf/eThmTNhQhJ7LHe/kIsbPk36+yXu
 tH3SAhFXYdT7HHuK3QU3YaswCu9RvP3FQbDMaccVjjQ8B78y/UXUde2EMvKpUl0pej7R
 DGAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdAHjgLuWnJKsaoteu7CMFyuCpyIS0t/RKFCtDGHfHNU9OGyrzgF7uQjFrYt0AHPc0MeTRgUvC/W4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5AsWKgABKxhhU6VQ5S5nTp+TtwK789D6DErsV3ye1Z/oAm8Kp
 px6ViFAbp9RcwsfrUA7vOnAhcMGq+KLyl80r/RLAQJwx3aWt49rWoh9Kyqbqke8KHPkLMmgGoxQ
 CZzi8Pkx8aH7Mv05HImuCWbprwaFvPHVkLBtr4K26DMF+vh80kZu0hvfs800i5ghOAC86QoBSfj
 XSsBs=
X-Gm-Gg: ASbGncsao3deCbXBjoFlDPPLgK+SMul6QntUW5zZiCOsvyZqYUpjmjmgHJSkuu1FqUr
 U5fWHEQ+6P6LNnrocgyMHBnmGEudabKe1rOCMZJvve/AFEJt6oAd0xb2sWv2JatY7CyFTgovagS
 M1eSML8E4X6kQ9JuDUp3EqWsde+Irg0EsFQzuUBowb4zzNBZCeomveB68PvGrnASELnA9ogk4Xx
 MOf07BWE7FoYi1PD0bz4zlQz6hBe16szcnOoC8ewO2dMq6XLOCa4cey0qUPTQ/4nEYsi2WMeWJL
 I63NxPAYYWfQupbhieIOu+vIoyjn9ksK+ht9xdtNVEzO2CD5/S2ItEIN0fh9xrRf
X-Received: by 2002:a05:6a00:4fc6:b0:74d:3a57:81d9 with SMTP id
 d2e1a72fcca58-756e8774764mr28844374b3a.8.1753013842885; 
 Sun, 20 Jul 2025 05:17:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+dff0wC6yk78/zh6Z0LR/Oz7ll4GcPD9J6HRYOPTcKOEyWFjaSRZxIDnJ6zvTBqZdlaH8/Q==
X-Received: by 2002:a05:6a00:4fc6:b0:74d:3a57:81d9 with SMTP id
 d2e1a72fcca58-756e8774764mr28844327b3a.8.1753013842347; 
 Sun, 20 Jul 2025 05:17:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:09 +0530
Subject: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=4178;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5WN+YTgGLUAz34bLQCiSFG4GiRXYUb0V+n8R8umq5F4=;
 b=+HJXVulS9n4IHWq7gCAyvF8Sl8e8EdrE15CFfVY4gzIR6YXtHrApufIpa2k9sllyHyOGepKw2
 nK4O9L1UobtAN3evT91jG2UkGa7aPccuJrR1XGddAnbnPjTKgn2h9kV
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687cde67 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5Q2Y62x1ezTeZjwjAHsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 7mg-TgCq0e9dgz9iDvJzGp6a813vy3FA
X-Proofpoint-GUID: 7mg-TgCq0e9dgz9iDvJzGp6a813vy3FA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX4So9sPBk7y+1
 Aa7zYqcDzixpY+nKsh8YbP9hOPRqnIohR62GNO9uh/Q49U9SXUW9K3Awj0AealLx/I3jxxZlRxM
 0RUnp7wEb+AkyAWlY0c1FCey7eUA/rFfUgc4nuRYkRzROlhy4oodcB8UfHSMd5Pl6MGiCjOGRZk
 h1ENIg8ameBvsPIlCATGRBeeeCIQmyZWBrZVCfk+nCJ6GNIooI3xnhrhDGsAnrLIFwNFv4i/V6Q
 wH8+NNr2uEp1eeTkN1CRxQ+SMu4LzjdZ133xqGHJle1DypEzIZezmCZpa0eH6zmel/0om7qObqp
 7RtmfuNPSxdST5/wL/s+LLdArqiMTguz9ylaIUtSxI6T//amw+4zZhQ47G0zEEaC+zKn/wTSvAY
 hLkg3j6H7QILEdaANvFH27/V5nZY+eJwSaz7mGCBrKxuE9HOAETf11E6mTndPgsTNIVayB3+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Set Keepalive votes at appropriate places to block IFPC power collapse
until we access all the required registers. This is required during gpu
IRQ handling and also during preemption.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8c004fc3abd2896d467a9728b34e99e4ed944dc4..6770f0363e7284e4596b1188637a4615d2c0779b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1752,8 +1752,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
 
 static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 
 	/*
@@ -1765,13 +1763,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
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
@@ -1810,9 +1801,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
 	}
 }
 
+static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
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
+	set_keepalive_vote(gpu, true);
+
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
@@ -1849,6 +1855,8 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
 		a6xx_preempt_irq(gpu);
 
+	set_keepalive_vote(gpu, false);
+
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 5b0fd510ff58d989ab285f1a2497f6f522a6b187..1c8ec1911010c00a000d195116fc950c4d947cac 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
 	a6xx_gpu->postamble_enabled = false;
 }
 
+/*
+ * Set preemption keepalive vote. Please note that this vote is different from the one used in
+ * a6xx_irq()
+ */
+static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
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
 
+	set_keepalive_vote(gpu, false);
+
 	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
 
 	/*
@@ -302,6 +319,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
+	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
+	set_keepalive_vote(gpu, true);
+
 	a6xx_fenced_write(a6xx_gpu,
 		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
 		BIT(1), true);

-- 
2.50.1

