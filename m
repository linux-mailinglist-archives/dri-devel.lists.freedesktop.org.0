Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B2B0B5F7
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B3910E452;
	Sun, 20 Jul 2025 12:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbI3kRby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88CB10E452
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K8r3h5021359
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zkQB8f6TT4/0akOBeSV5TZlo3E+eXnCUBeL3PcJbZWM=; b=FbI3kRbyuH9rmZbB
 VVl300M/B9T9l2GASPF2kELCIm1n+rEKAIEJ8lqzgvn9Y3HT/4AAfU8Ln+AolVKj
 d6HjCcIxtM36j2O0JcXLDbaUk7Tg4QHit5u3+MPb72oqINrstb35GZ6VWNqmNYIk
 Q44RnCAUQkZZO1GP42rA9fRdYDX+U8rkD1NdXh6PeMd+aHkYI951pQRb0jhuAIW0
 lBVVIZh6lOP/OoUxYuH+U+jivlU2T1m/KvfYw+ZTQfSbUl8McC7hccnqm9txwtSE
 twwcBpuhfJblhBsSfVSJyhpaGaQBvvWBM/bXbqTibbhgSKt5VK6qATVfj1sB8gGr
 b5DnwQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804hmj42q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74943a7cd9aso5317167b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013875; x=1753618675;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zkQB8f6TT4/0akOBeSV5TZlo3E+eXnCUBeL3PcJbZWM=;
 b=RY1vN+jXDWX7oNcqmluP4JC111K94Y1piaUeXl+0I7BoeHxOFUSk+Xx1Ey6Mqy/BCT
 YoOiPpIlLjvgaJCN0dTVj529cq+1Q/vkn+MIAgD/Ob4HkTQTYugg5gp02TitlrbcHGXK
 AxbrN/cuOW5+4YvmjGReWf2y6Kf7YMukFn3FnGZrEW4DZI7qU+Y5WfIrp2eR81GjETtD
 OfWkraaRusmTIQpDv1dHNZunAzhnU8R3Wlo6GxfW0bkwRlj+uTPOrzsiznpBn6u9zFDS
 naR+Wyjx9IvyG22+c9VLvxdrkLQItFM3m2tFLyE5MPAxA5lYCTAETcUn8yPd9J3Rcr1N
 d9cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFyTxJn7I4eRogaubfCglm4WW6K+xtfPuiP2Xrcav1ArTp8A+heKe603hYQSAt2NI1ECNhQbf7aiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdXKbThCK2ladlBwZv4JvwGcIh1O5xyJIeYFPXao/LA821vxa2
 asLF7W4l6iqqGh74S+62DAYyqJKdi72+9umZIdKSF468iXlp5X14gTC3viMv3Vpkldx8dxsHYDC
 N2j+exVRWl1uihnsfcXDpLUW5TiC2+iJ8TkmHOg9rmsI3h17Y48rtVi4HoLg6oYdz/B/jw7w=
X-Gm-Gg: ASbGnctaKInj+9tPWB9/sCbKgoX1HgE4J6EZiz2NCX2trSB74RvLZB/v4RujPxs08D9
 6ZQx3Miw7VV8ZeL18BElUVz1q/mJjQL7dvTM0uZB1vK93PmxqTYIZsmlp1xhYPAg60SXGLg1dRF
 bgE4S//3SxpZ5O/4veL62xVeYx5FPD4naJ27rViUelgjVyWjud4GNanTQFmsar6Zo4qdWIouYU4
 7L0nQCJimLSyCpSdRsEPgRpmV3lwzHJEsqdLOHit75gId66wxK8fUWe7WTlJ1eeImpGKP/IsoD1
 7J2sM5vqh5wnDSjiCZrmQGclLaj9uB2F/ES3+or1zoiDP6+G8WnKnZ+lFQsjRrCS
X-Received: by 2002:a05:6a00:22cb:b0:736:5b85:a911 with SMTP id
 d2e1a72fcca58-7572397f739mr27238796b3a.8.1753013875154; 
 Sun, 20 Jul 2025 05:17:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0WZoU+iLBAJJXppgAEVCOgXXnjX/r5cxQSynmz0ouCT5c3+bBHxqAP6qwANDkHFW1nCgLxw==
X-Received: by 2002:a05:6a00:22cb:b0:736:5b85:a911 with SMTP id
 d2e1a72fcca58-7572397f739mr27238769b3a.8.1753013874693; 
 Sun, 20 Jul 2025 05:17:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:17 +0530
Subject: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=5427;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+Oc5oquiIV9BOoNSyw0uGzJ3RY7t5iwMjgUCmKMe6Bs=;
 b=qKyBu12DucagG3ZqsX/I8JppcE23Jav/m0yfbMJ5p/UuznTGQS1mH3Je+S1Y75lJVteUfU5aT
 pISUbHJ1sLGCOhGwDdQsyKlX7vhJwRjqsgTuQD6zIGVtSuW5WpvrVPC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: y1gfq0Q3Th0YaL-xoE6xr6HWnGQ0O6Ut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX8rXVdyxzu+Ly
 NI7Y6TD3Gqss87Ox/bsuDzDH1OlYJx0areBA8stR7zYvHuKqnwu978nN9f4pI5mTFgUFlBaI6CA
 5+8V1gtnZnEs+1jfWQwms1nzFOeVmUAsblKZxhVh4o2Q6uxZaQ3Eow8oLY2WXWZpauI8ihK94vE
 A8YNzp4q/L6+/i/HSV7C8JyLYwFBJdDYi8ABjC8YFrwimLqDJHqmoJIEZNkEmdidVH2bLYt7iL8
 XIYUuqQvqkTw+4iTBZmarSCkqrROm/LS64N0S9ThGvnPUU+byq45YrsoL7e3hXyo9m/1HxndGpz
 4O03OGmMlGnFP8SadmVzVlVUbuY/jvL5cApr0nOIAZKJCZYb3c4/wh9nuAd4RYrfnVX3DkgvzeT
 UFcj+bwmXtilH4eo6KUvKSq0VvnieRPgohK5U3girLNXYdKrU1mZswDZ3jcLoZtZA5v85Dyf
X-Authority-Analysis: v=2.4 cv=Navm13D4 c=1 sm=1 tr=0 ts=687cde74 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4fggu-2iGV-6hGlykgMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: y1gfq0Q3Th0YaL-xoE6xr6HWnGQ0O6Ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=912 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118
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

Add the IFPC restore register list and enable IFPC support on Adreno
X1-85 gpu.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 3 files changed, 78 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
 
 DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
 
+/* Applicable for X185, A750 */
+static const u32 a750_ifpc_reglist_regs[] = {
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
+	REG_A6XX_TPL1_NC_MODE_CNTL,
+	REG_A6XX_SP_NC_MODE_CNTL,
+	REG_A6XX_CP_DBG_ECO_CNTL,
+	REG_A6XX_CP_PROTECT_CNTL,
+	REG_A6XX_CP_PROTECT(0),
+	REG_A6XX_CP_PROTECT(1),
+	REG_A6XX_CP_PROTECT(2),
+	REG_A6XX_CP_PROTECT(3),
+	REG_A6XX_CP_PROTECT(4),
+	REG_A6XX_CP_PROTECT(5),
+	REG_A6XX_CP_PROTECT(6),
+	REG_A6XX_CP_PROTECT(7),
+	REG_A6XX_CP_PROTECT(8),
+	REG_A6XX_CP_PROTECT(9),
+	REG_A6XX_CP_PROTECT(10),
+	REG_A6XX_CP_PROTECT(11),
+	REG_A6XX_CP_PROTECT(12),
+	REG_A6XX_CP_PROTECT(13),
+	REG_A6XX_CP_PROTECT(14),
+	REG_A6XX_CP_PROTECT(15),
+	REG_A6XX_CP_PROTECT(16),
+	REG_A6XX_CP_PROTECT(17),
+	REG_A6XX_CP_PROTECT(18),
+	REG_A6XX_CP_PROTECT(19),
+	REG_A6XX_CP_PROTECT(20),
+	REG_A6XX_CP_PROTECT(21),
+	REG_A6XX_CP_PROTECT(22),
+	REG_A6XX_CP_PROTECT(23),
+	REG_A6XX_CP_PROTECT(24),
+	REG_A6XX_CP_PROTECT(25),
+	REG_A6XX_CP_PROTECT(26),
+	REG_A6XX_CP_PROTECT(27),
+	REG_A6XX_CP_PROTECT(28),
+	REG_A6XX_CP_PROTECT(29),
+	REG_A6XX_CP_PROTECT(30),
+	REG_A6XX_CP_PROTECT(31),
+	REG_A6XX_CP_PROTECT(32),
+	REG_A6XX_CP_PROTECT(33),
+	REG_A6XX_CP_PROTECT(34),
+	REG_A6XX_CP_PROTECT(35),
+	REG_A6XX_CP_PROTECT(36),
+	REG_A6XX_CP_PROTECT(37),
+	REG_A6XX_CP_PROTECT(38),
+	REG_A6XX_CP_PROTECT(39),
+	REG_A6XX_CP_PROTECT(40),
+	REG_A6XX_CP_PROTECT(41),
+	REG_A6XX_CP_PROTECT(42),
+	REG_A6XX_CP_PROTECT(43),
+	REG_A6XX_CP_PROTECT(44),
+	REG_A6XX_CP_PROTECT(45),
+	REG_A6XX_CP_PROTECT(46),
+	REG_A6XX_CP_PROTECT(47),
+};
+
+DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
+
 static const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
@@ -1432,12 +1495,13 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+			  ADRENO_QUIRK_PREEMPTION | ADRENO_QUIRK_IFPC,
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.ifpc_reglist = &a750_ifpc_reglist,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
 		},
@@ -1459,6 +1523,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.ifpc_reglist = &a750_ifpc_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 54decb9908fe526ac7f150465034b03ba688aa6d..bc9463840c02c3c3ee3ae0431eff147ae97edc88 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -809,11 +809,10 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	u32 *dest = (u32 *)&lock->regs[0];
 	int i;
 
-	reglist = adreno_gpu->info->a6xx->pwrup_reglist;
-
 	lock->gpu_req = lock->cpu_req = lock->turn = 0;
-	lock->ifpc_list_len = 0;
-	lock->preemption_list_len = reglist->count;
+
+	reglist = adreno_gpu->info->a6xx->ifpc_reglist;
+	lock->ifpc_list_len = reglist->count;
 
 	/*
 	 * For each entry in each of the lists, write the offset and the current
@@ -824,6 +823,14 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 		*dest++ = gpu_read(gpu, reglist->regs[i]);
 	}
 
+	reglist = adreno_gpu->info->a6xx->pwrup_reglist;
+	lock->preemption_list_len = reglist->count;
+
+	for (i = 0; i < reglist->count; i++) {
+		*dest++ = reglist->regs[i];
+		*dest++ = gpu_read(gpu, reglist->regs[i]);
+	}
+
 	/*
 	 * The overall register list is composed of
 	 * 1. Static IFPC-only registers
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index bd1194bd15bf013489140c5f9f6b9f8582532a13..ed98dd1bd887bd160f73f320366a7b8b2c9f874e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -41,6 +41,7 @@ struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
+	const struct adreno_reglist_list *ifpc_reglist;
 	u32 gmu_chipid;
 	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;

-- 
2.50.1

