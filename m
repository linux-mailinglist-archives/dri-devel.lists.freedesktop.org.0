Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8BDB48702
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CA010E469;
	Mon,  8 Sep 2025 08:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L++RGMzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F1910E45C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5880IP3k028868
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Y9+0w6aj+VovrkvZGEnCwhaFMPQwBRAyOTuHjX1iCig=; b=L++RGMzf4+i5QMbk
 HVQTrDGcieweY9nc7/oe3xuD4kyBVRiQkjB7X7NfM6AxF4Ae3NcTj18o2x0nrTJA
 YuYbr+BsNUqXhcOH+LVhfyE0ruUeFNLPwa/b9OoLCYpt61nl+j+xS8KLj0ffu+RJ
 QVjpvPtuCrf9mhw9yM1z/B6MoHyk+/eejBszs1kG9jvjK7gWmBEaO/85StJBQK0D
 ZpO9equwUTDmGOcTaJzshcz8GD1TmGMR/HJcBvhtqRymKc/rBz/+2cWXr3Y2GTB6
 DZPO+eDw8/5IHo6R3xkQzzXJGLChzxe1XGALuTBB5pCd2kdQnVRuigKvNGmRmbSH
 OR0Dlw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapc20h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-324e4c3af5fso4286266a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320086; x=1757924886;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9+0w6aj+VovrkvZGEnCwhaFMPQwBRAyOTuHjX1iCig=;
 b=kPzWrzlQtYHEi7upXe03/tqva/9eWtFhnIm7uMiyhk4ZKSMZwHrFTqXiW4AxK3HbGh
 dR9bAvGQ7MJPnuIvrlhpR0YT5M1oMBvIhHhG//qIyD4/1ffifJD1t7jI1SkIleMaPE+N
 pGPLWXHPprgZiEHhwkqGftd2i9PntnY6m1ictjZtuxYzTgKfNdzzXIgbEmiex3j2XreN
 5akK40RAayvkB3fRb/tUOd91Lbn2yoNBEdySYD/bweH2n7TQjHkKWsaS3eZEuEuoSsMS
 TtKgsUR2GBIK36A09MivYWu6CSusMwOh6KguwutSoqHb6WV7Jx6xDI6pt4STPNgHKsi7
 Vhdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKrbsnqQBq9hksNeJdNRxl+2Xsm9NTXau8Y/EOTVXhA1NjfZGCHIuko/4t1ic5jUDyLQ10dAoU/CA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrVhKjfWdwCeVk82ylXMEbUC4eB6eK1ejagqFb2asRPh9fb7PU
 Zi3m4vxLLShd5y0B7B2hvcTbVoau+4DxHb2Y1WhcjcpWxA7OQf6AUyL/TXUA4j8t7ciHNCK34rL
 KNxNVH2F3lE0tP/RsqBwLN9LTUaoGvVimjWuBVsCRKKeJkYjsdzWZ3U/c0hRB7reajMU9kLA=
X-Gm-Gg: ASbGncvS7SSeZ0CkwsDuWKq2wqB7LfMwy0HuPeOWtXzpOKX2QmCj1S+ywBywmSBR3g7
 ZNX+HbyE+YU7MRT8EUo6J7YvADSfdV1ILF6xEiowbuURmttLHWN23umMbwKwIsCmZ3ZXTOzIO55
 sM9kUOBy/+L6n0frDmSxcUKNFwnTIxhOS6rME4MZ5PaOnTP1PRrPmweQ5ujV2+3tksKyXy32u8u
 UT/OazrjJK1rpjT7bJh7TRwgoDju26OMCu9t8z49oehLRTJC9nw7y8ELS3KIzJK8sxKPYmT7Dbh
 Z0dYj6/6fqazYzgmdikmQk2bA7WFosu7M9kS8PWdz9SifTmO6Tl5j35pJTZ0wYKc
X-Received: by 2002:a17:90b:1343:b0:32b:58d4:e9d0 with SMTP id
 98e67ed59e1d1-32d43f98ca9mr9661451a91.23.1757320085845; 
 Mon, 08 Sep 2025 01:28:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG48xqx8usx8On3LNc8R0d6aOc3he+bmmqnXldSJTuYe4L9QKMkwfBMWCQU7leDED5ti62huQ==
X-Received: by 2002:a17:90b:1343:b0:32b:58d4:e9d0 with SMTP id
 98e67ed59e1d1-32d43f98ca9mr9661406a91.23.1757320085236; 
 Mon, 08 Sep 2025 01:28:05 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:03 +0530
Subject: [PATCH v2 10/16] drm/msm/a6xx: Poll AHB fence status in GPU IRQ
 handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-10-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=3161;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JP84fQZ5StXytXsVMM5Llki3XcWXp1F96tEU7pXVga0=;
 b=LUsR+1o2QFjjj1wszOZBM2K/4buHS5h/22KptVTEaPnZgom85L4OkJTAc+9iGWqfJJZ9neMGZ
 1wvGFoFffvxDQH89Z9ppr4a3DtDHgPViBiVvhp22e8yXWmes4TkkLZe
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68be9397 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tkQJxTYZj4y7NR_BhXkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: BO_yY0nQxzUcJnPuCQvni7MlDr_CbpFh
X-Proofpoint-ORIG-GUID: BO_yY0nQxzUcJnPuCQvni7MlDr_CbpFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXwa2CIe6EmQur
 aIGHqMJf/xK3r8wwIeFKVerYaaJC8GybWhwGIJHFOvhQ7SzjuLR+KILj+ALmRaLUtRikCznHNRt
 p8mUDpVF9gfZWHUOOFRlTbVW82ip/Ci9B/iHtT7hVbAOYn0x7a+RZj5wjtnIxyWBjkZGLazcVBr
 44oZy6Ecn3T4F5LfUtKX0FFNmi2Cf/+ZKmj2RtmMJuCvYP7vh106FyVp0EqTOeBSMUvqLJ0pIaG
 AZWtbdrNNGr58sYlRWTNLs2oNtl6GzBssMric91bTYqdicdARYh8Vl6XLMHQ6xVU5moh3qhSDhm
 HfuEZ1q+et35vhzbyWVz/yPmYVm1Lvv/z4GTXtgZOJ5XzIDzvs1T2YIDMfb1oRr8TYiN51Y4vG6
 R58rUGik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

Even though the GX power domain is kept ON when there is a pending GPU
interrupt, there is a small window of potential race with GMU where it
may move the AHB fence to 'Drop' mode. Once the GMU sees the pending IRQ,
it will move back the fence state to ALLOW mode. Close this race window
by polling for AHB fence to ensure that it is in 'Allow' mode.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  3 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 9494bbed9a1ff86b19acec139d7ab27697d7ec8a..40c4c0445b8e4349c9111850df9c0b1d355f0b73 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -167,6 +167,9 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
 #define gmu_poll_timeout(gmu, addr, val, cond, interval, timeout) \
 	readl_poll_timeout((gmu)->mmio + ((addr) << 2), val, cond, \
 		interval, timeout)
+#define gmu_poll_timeout_atomic(gmu, addr, val, cond, interval, timeout) \
+	readl_poll_timeout_atomic((gmu)->mmio + ((addr) << 2), val, cond, \
+		interval, timeout)
 
 static inline u32 gmu_read_rscc(struct a6xx_gmu *gmu, u32 offset)
 {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c64c84affa6821f79ea74b80b2f2014df38ec918..bba09c02f9809ed24b4a9c30b1eb993ce01c7ec0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1842,6 +1842,28 @@ static void a6xx_gpu_keepalive_vote(struct msm_gpu *gpu, bool on)
 	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
 }
 
+static int irq_poll_fence(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 status;
+
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return 0;
+
+	if (gmu_poll_timeout_atomic(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, status, !status, 1, 100)) {
+		u32 rbbm_unmasked = gmu_read(gmu, REG_A6XX_GMU_RBBM_INT_UNMASKED_STATUS);
+
+		dev_err_ratelimited(&gpu->pdev->dev,
+				"irq fence poll timeout, fence_ctrl=0x%x, unmasked_status=0x%x\n",
+				status, rbbm_unmasked);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
@@ -1849,6 +1871,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
 	a6xx_gpu_keepalive_vote(gpu, true);
 
+	if (irq_poll_fence(gpu))
+		goto done;
+
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
@@ -1885,6 +1910,7 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
 		a6xx_preempt_irq(gpu);
 
+done:
 	a6xx_gpu_keepalive_vote(gpu, false);
 
 	return IRQ_HANDLED;

-- 
2.50.1

