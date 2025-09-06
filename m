Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E9B47525
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 19:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E4910E3CD;
	Sat,  6 Sep 2025 17:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IR+fer14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F322B10E3BA
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 17:05:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586Gcsbq008788
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Sep 2025 17:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Eq/ugOzPzZDWo21YZh0+MpdMusnbPy3yOVD
 //rcXzoQ=; b=IR+fer14v9yDBtJPkRBESiMwKjgF9NMuf2yjK+iuG1xnVzlAGaT
 6rni4xO7aZ69OOed2mhSFasEaMbhQCLutdDAsyvUvi+7fa5EY1FO53ygaCRUY84g
 qpZmdUqiKykeV4J4fTiiIOc4+cyj8p6hOCGtwmGWih5TXAAOsOCPYv13panPwH4r
 F05U+aVGek+wgk9n0oY3Cr2PCIzfgoO6FUgTXaB81HBP+t6/UsluUR4SmybI7T0F
 F3KlE4ovHpeP8O95tQZXB1i5RBKSDXjWN6IxjnfaLzcFUmq1GsKRAJJqVFoMTkkT
 gtl+l2l9OiBvLpMfcXdgIJFv2BVWFlfXa7Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aap95pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 17:05:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32bbacf6512so3583068a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 10:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757178351; x=1757783151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eq/ugOzPzZDWo21YZh0+MpdMusnbPy3yOVD//rcXzoQ=;
 b=J0nMRlXN5cD3rfD34ldSoHZpPHjq1eTmjErCNG35SGFucBIB9XemNQ924aFYItcOqn
 PXaNd4GhzADXBhMxfdhUDb+SmU/k3j0sGBwilf0B0z4BHdKeRoCa6l7Yb/dMDNu7Sy/K
 /KdFn1tnTK2WsKmoEMr3ZrmtWO/DVeXGREDvh2Z8pvffbPw/lIeosT69SXgtGvpbbALi
 UxQkjMmzNUte+iB/5dgc5g1s0l/iX4IG9OceRFV3DFB6DTKMTlCEE2zQKhu8hBAgmmJO
 8vPyG2gU268hv+0dRVCBZLcRDwPhf4SQg4OesJ2b1eqfExD0+frBhbwdHznQhgpzKz+N
 XGvg==
X-Gm-Message-State: AOJu0Yw64F4KFO5d9y8V8LazYNI31VS3RUUbeKxULaFPOLavK/rxGwEI
 F9dgh2sEYIMrJBsTP+6tSwDUtrvpmue3h82QE6GqDlx4cpyIW6wCzyo5GpUk6A1ZU8iDKZqaSt9
 7T7a33VoEU9gPcA/pNdYCxCl1nKKqtN25vRnr3tKCbzS6hcSpeRf7iA6vaoLHewNu3mjpKr2jEe
 IxSyE=
X-Gm-Gg: ASbGncuWWVZdgF9PJpNdR27WaY4REOxDCWI3FRRreyxMv12SorXaOgCBNlkMPakQgpg
 SsLp3FFnXBYJmd4TkTJBDGRCtTwU4dagYVUkp7+6Aof9D++/hEaCwzqHBf5CqGe38vk5XQ2pDWV
 bFI9Oy1B2gk77UEcIqEu068p3voeU/okmScq7o2IPKGV+2SDfNFH9mgOHqao1PcA9aub1qQ9gVw
 SVypbxYCtEcfAzBbbJmHhJml64PtHCqRa2bz9x8iOBfdZXxno6wnz0pFAe2hx64qglrZ9b9xtVy
 iebDL41VJ3zZPKR4+zut78Ux/YAK2yKihDSkoVMn4yIkQfUamzo=
X-Received: by 2002:a17:90a:da87:b0:31e:cc6b:320f with SMTP id
 98e67ed59e1d1-32d43ef6e0bmr3580941a91.5.1757178350259; 
 Sat, 06 Sep 2025 10:05:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrvIfMfZonfN1ZU+B4a3QJoJKxHtxgLEYO4kvY8id22xtLCayVfvdRWRYxNnB5/bTigt0Wjg==
X-Received: by 2002:a17:90a:da87:b0:31e:cc6b:320f with SMTP id
 98e67ed59e1d1-32d43ef6e0bmr3580874a91.5.1757178348893; 
 Sat, 06 Sep 2025 10:05:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329e6d6d4b2sm13732271a91.0.2025.09.06.10.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 10:05:48 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Karmjit Mahil <karmjit.mahil@igalia.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Sync GPU registers from mesa
Date: Sat,  6 Sep 2025 10:05:40 -0700
Message-ID: <20250906170542.481588-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bc69f1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8 a=vBIW4VKGqXjrlvqYCsUA:9
 a=7evNujvXw5NmUzgR:21 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: ScspNrK1Ei4ykTR30oUawRqzIC1Doz7U
X-Proofpoint-ORIG-GUID: ScspNrK1Ei4ykTR30oUawRqzIC1Doz7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX7E8lmhP9+/ne
 CkKDgy/ihJeYLM4OeX9znSO2/xA9K5vJZS1aQ/WSF1L7O0XhKJKz3s+5XRbfqv9uIFpBP54uZ2S
 qTzSjhVEgZtsT3S+ETp1Gs0ptE18tY/3UObnn5X7XMwmGVPYyg/xHJLGqiuhq32H8lStVWRGpUS
 wHEMGRO6zHDiSUz3iwXYFnciZ37Ifw+JH5s4vNFO31rhQ0GV8Nqjc0tsPv4fz1/GigUcmcEnzb2
 BMbJ7jAKYSAqmfhGsJDYEx8yYRSsVknso/xdVKsQbfUW5wjOAt8lvqMDoBgiWfGyDp7zbklMaD7
 8vtFN4y5hpGu6SYjxzO6ZFzsdUVtFeVpzMSpwx/6dRgynwQgsqtH89qatMlrdpHdFYyMAXU0w/1
 bzZzYHJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_06,2025-09-04_01,2025-03-28_01
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

In particular, to pull in a SP_READ_SEL_LOCATION bitfield size fix to
fix a7xx GPU snapshot.

Sync from mesa commit 76fece61c6ff ("freedreno/registers: Add A7XX_CX_DBGC")

Cc: Karmjit Mahil <karmjit.mahil@igalia.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  19 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   5 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 718 ++++++++++--------
 .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
 .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
 .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
 7 files changed, 524 insertions(+), 497 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index d8d1ba379c9b..e54cdb9399f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1345,11 +1345,11 @@ DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
 
 /* Applicable for X185, A750 */
 static const u32 a750_ifpc_reglist_regs[] = {
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
 	REG_A6XX_TPL1_NC_MODE_CNTL,
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2e2090f52e26..3f5c4bcf32cc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -247,8 +247,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	 * Needed for preemption
 	 */
 	OUT_PKT7(ring, CP_MEM_WRITE, 5);
-	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
-	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
+	OUT_RING(ring, lower_32_bits(memptr));
+	OUT_RING(ring, upper_32_bits(memptr));
 	OUT_RING(ring, lower_32_bits(ttbr));
 	OUT_RING(ring, upper_32_bits(ttbr));
 	OUT_RING(ring, ctx->seqno);
@@ -278,9 +278,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		 */
 		OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
 		OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
-		OUT_RING(ring, CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
-				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS));
-		OUT_RING(ring, CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0));
+		OUT_RING(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
+		OUT_RING(ring, 0);
 		OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
 		OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
 		OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
@@ -1320,14 +1319,14 @@ static int hw_init(struct msm_gpu *gpu)
 
 	/* Set weights for bicubic filtering */
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0), 0);
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
 			0x3fe05ff4);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
 			0x3fa0ebee);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
 			0x3f5193ed);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
 			0x3f0243f0);
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 796be5cd5cc0..585fc1b772e1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -111,9 +111,8 @@ static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
 
 	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
 	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
-	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
-				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
-	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
+	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS;
+	postamble[count++] = 0;
 	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
 	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
 	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 86fab2750ba7..9459b6038217 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -814,7 +814,7 @@ by a particular renderpass/blit.
 		<bitfield name="Y" low="16" high="29" type="uint"/>
 	</bitset>
 
-	<reg32 offset="0x8000" name="GRAS_CL_CNTL" usage="rp_blit">
+	<bitset name="a6xx_gras_cl_cntl" inline="yes">
 		<bitfield name="CLIP_DISABLE" pos="0" type="boolean"/>
 		<bitfield name="ZNEAR_CLIP_DISABLE" pos="1" type="boolean"/>
 		<bitfield name="ZFAR_CLIP_DISABLE" pos="2" type="boolean"/>
@@ -826,18 +826,20 @@ by a particular renderpass/blit.
 		<bitfield name="VP_CLIP_CODE_IGNORE" pos="7" type="boolean"/>
 		<bitfield name="VP_XFORM_DISABLE" pos="8" type="boolean"/>
 		<bitfield name="PERSP_DIVISION_DISABLE" pos="9" type="boolean"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x8000" name="GRAS_CL_CNTL" type="a6xx_gras_cl_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_xs_clip_cull_distance" inline="yes">
 		<bitfield name="CLIP_MASK" low="0" high="7"/>
 		<bitfield name="CULL_MASK" low="8" high="15"/>
 	</bitset>
-	<reg32 offset="0x8001" name="GRAS_CL_VS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit"/>
-	<reg32 offset="0x8002" name="GRAS_CL_DS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit"/>
-	<reg32 offset="0x8003" name="GRAS_CL_GS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit"/>
-	<reg32 offset="0x8004" name="GRAS_CL_ARRAY_SIZE" low="0" high="10" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x8001" name="GRAS_CL_VS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A6XX-A7XX" />
+	<reg32 offset="0x8002" name="GRAS_CL_DS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A6XX-A7XX" />
+	<reg32 offset="0x8003" name="GRAS_CL_GS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A6XX-A7XX" />
+	<reg32 offset="0x8004" name="GRAS_CL_ARRAY_SIZE" low="0" high="10" type="uint" usage="rp_blit" variants="A6XX-A7XX" />
 
-	<reg32 offset="0x8005" name="GRAS_CL_INTERP_CNTL" usage="rp_blit">
+	<bitset name="a6xx_gras_cl_interp_cntl" inline="yes">
 		<!-- see also RB_INTERP_CNTL -->
 		<bitfield name="IJ_PERSP_PIXEL" pos="0" type="boolean"/>
 		<bitfield name="IJ_PERSP_CENTROID" pos="1" type="boolean"/>
@@ -848,26 +850,69 @@ by a particular renderpass/blit.
 		<bitfield name="COORD_MASK" low="6" high="9" type="hex"/>
 		<bitfield name="UNK10" pos="10" type="boolean" variants="A7XX-"/>
 		<bitfield name="UNK11" pos="11" type="boolean" variants="A7XX-"/>
-	</reg32>
-	<reg32 offset="0x8006" name="GRAS_CL_GUARDBAND_CLIP_ADJ" usage="rp_blit">
+	</bitset>
+
+	<reg32 offset="0x8005" name="GRAS_CL_INTERP_CNTL" type="a6xx_gras_cl_interp_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_gras_cl_guardband_clip_adj" inline="true">
 		<bitfield name="HORZ" low="0" high="8" type="uint"/>
 		<bitfield name="VERT" low="10" high="18" type="uint"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x8006" name="GRAS_CL_GUARDBAND_CLIP_ADJ" type="a6xx_gras_cl_guardband_clip_adj" variants="A6XX-A7XX" usage="rp_blit"/>
 
 	<!-- Something connected to depth-stencil attachment size -->
 	<reg32 offset="0x8007" name="GRAS_UNKNOWN_8007" variants="A7XX-" usage="rp_blit"/>
 
-	<reg32 offset="0x8008" name="GRAS_UNKNOWN_8008" variants="A7XX-" usage="cmd"/>
+	<!-- the scale/offset is per view, with up to 6 views -->
+	<bitset name="a6xx_gras_bin_foveat" inline="yes">
+		<bitfield name="BINSCALEEN" pos="6" type="boolean"/>
+		<enum name="a7xx_bin_scale">
+			<value value="0" name="NOSCALE"/>
+			<value value="1" name="SCALE2X"/>
+			<value value="2" name="SCALE4X"/>
+		</enum>
+		<bitfield name="XSCALE_0" low="8" high="9" type="a7xx_bin_scale"/>
+		<bitfield name="YSCALE_0" low="10" high="11" type="a7xx_bin_scale"/>
+		<bitfield name="XSCALE_1" low="12" high="13" type="a7xx_bin_scale"/>
+		<bitfield name="YSCALE_1" low="14" high="15" type="a7xx_bin_scale"/>
+		<bitfield name="XSCALE_2" low="16" high="17" type="a7xx_bin_scale"/>
+		<bitfield name="YSCALE_2" low="18" high="19" type="a7xx_bin_scale"/>
+		<bitfield name="XSCALE_3" low="20" high="21" type="a7xx_bin_scale"/>
+		<bitfield name="YSCALE_3" low="22" high="23" type="a7xx_bin_scale"/>
+		<bitfield name="XSCALE_4" low="24" high="25" type="a7xx_bin_scale"/>
+		<bitfield name="YSCALE_4" low="26" high="27" type="a7xx_bin_scale"/>
+		<bitfield name="XSCALE_5" low="28" high="29" type="a7xx_bin_scale"/>
+		<bitfield name="YSCALE_5" low="30" high="31" type="a7xx_bin_scale"/>
+	</bitset>
 
-	<reg32 offset="0x8009" name="GRAS_UNKNOWN_8009" variants="A7XX-" usage="cmd"/>
-	<reg32 offset="0x800a" name="GRAS_UNKNOWN_800A" variants="A7XX-" usage="cmd"/>
-	<reg32 offset="0x800b" name="GRAS_UNKNOWN_800B" variants="A7XX-" usage="cmd"/>
-	<reg32 offset="0x800c" name="GRAS_UNKNOWN_800C" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x8008" name="GRAS_BIN_FOVEAT" type="a6xx_gras_bin_foveat" variants="A7XX" usage="cmd"/>
+
+	<reg32 offset="0x8009" name="GRAS_BIN_FOVEAT_OFFSET_0" variants="A7XX-" usage="cmd">
+		<bitfield name="XOFFSET_0" low="0" high="9" shr="2" type="uint"/>
+		<bitfield name="XOFFSET_1" low="10" high="19" shr="2" type="uint"/>
+		<bitfield name="XOFFSET_2" low="20" high="29" shr="2" type="uint"/>
+	</reg32>
+	<reg32 offset="0x800a" name="GRAS_BIN_FOVEAT_OFFSET_1" variants="A7XX-" usage="cmd">
+		<bitfield name="XOFFSET_3" low="0" high="9" shr="2" type="uint"/>
+		<bitfield name="XOFFSET_4" low="10" high="19" shr="2" type="uint"/>
+		<bitfield name="XOFFSET_5" low="20" high="29" shr="2" type="uint"/>
+	</reg32>
+	<reg32 offset="0x800b" name="GRAS_BIN_FOVEAT_OFFSET_2" variants="A7XX-" usage="cmd">
+		<bitfield name="YOFFSET_0" low="0" high="9" shr="2" type="uint"/>
+		<bitfield name="YOFFSET_1" low="10" high="19" shr="2" type="uint"/>
+		<bitfield name="YOFFSET_2" low="20" high="29" shr="2" type="uint"/>
+	</reg32>
+	<reg32 offset="0x800c" name="GRAS_BIN_FOVEAT_OFFSET_3" variants="A7XX-" usage="cmd">
+		<bitfield name="YOFFSET_3" low="0" high="9" shr="2" type="uint"/>
+		<bitfield name="YOFFSET_4" low="10" high="19" shr="2" type="uint"/>
+		<bitfield name="YOFFSET_5" low="20" high="29" shr="2" type="uint"/>
+	</reg32>
 
 	<!-- <reg32 offset="0x80f0" name="GRAS_UNKNOWN_80F0" type="a6xx_reg_xy"/> -->
 
 	<!-- 0x8006-0x800f invalid -->
-	<array offset="0x8010" name="GRAS_CL_VIEWPORT" stride="6" length="16" usage="rp_blit">
+	<array offset="0x8010" name="GRAS_CL_VIEWPORT" stride="6" length="16" variants="A6XX-A7XX" usage="rp_blit">
 		<reg32 offset="0" name="XOFFSET" type="float"/>
 		<reg32 offset="1" name="XSCALE" type="float"/>
 		<reg32 offset="2" name="YOFFSET" type="float"/>
@@ -875,12 +920,13 @@ by a particular renderpass/blit.
 		<reg32 offset="4" name="ZOFFSET" type="float"/>
 		<reg32 offset="5" name="ZSCALE" type="float"/>
 	</array>
-	<array offset="0x8070" name="GRAS_CL_VIEWPORT_ZCLAMP" stride="2" length="16" usage="rp_blit">
+
+	<array offset="0x8070" name="GRAS_CL_VIEWPORT_ZCLAMP" stride="2" length="16" variants="A6XX-A7XX" usage="rp_blit">
 		<reg32 offset="0" name="MIN" type="float"/>
 		<reg32 offset="1" name="MAX" type="float"/>
 	</array>
 
-	<reg32 offset="0x8090" name="GRAS_SU_CNTL" usage="rp_blit">
+	<bitset name="a6xx_gras_su_cntl" varset="chip">
 		<bitfield name="CULL_FRONT" pos="0" type="boolean"/>
 		<bitfield name="CULL_BACK" pos="1" type="boolean"/>
 		<bitfield name="FRONT_CW" pos="2" type="boolean"/>
@@ -890,39 +936,66 @@ by a particular renderpass/blit.
 		<bitfield name="LINE_MODE" pos="13" type="a5xx_line_mode"/>
 		<bitfield name="UNK15" low="15" high="16"/>
 		<!--
-                        On gen1 only MULTIVIEW_ENABLE exists. On gen3 we have
-                        the ability to add the view index to either the RT array
-                        index or the viewport index, and it seems that
-                        MULTIVIEW_ENABLE doesn't do anything, instead we need to
-                        set at least one of RENDERTARGETINDEXINCR or
-                        VIEWPORTINDEXINCR to enable multiview. The blob still
-                        sets MULTIVIEW_ENABLE regardless.
-                        TODO: what about gen2 (a640)?
+			On gen1 only MULTIVIEW_ENABLE exists. On gen3 we have
+			the ability to add the view index to either the RT array
+			index or the viewport index, and it seems that
+			MULTIVIEW_ENABLE doesn't do anything, instead we need to
+			set at least one of RENDERTARGETINDEXINCR or
+			VIEWPORTINDEXINCR to enable multiview. The blob still
+			sets MULTIVIEW_ENABLE regardless.
+			TODO: what about gen2 (a640)?
 		-->
 		<bitfield name="MULTIVIEW_ENABLE" pos="17" type="boolean"/>
-		<bitfield name="RENDERTARGETINDEXINCR" pos="18" type="boolean"/>
-		<bitfield name="VIEWPORTINDEXINCR" pos="19" type="boolean"/>
-		<bitfield name="UNK20" low="20" high="22"/>
-	</reg32>
-	<reg32 offset="0x8091" name="GRAS_SU_POINT_MINMAX" usage="rp_blit">
+		<bitfield name="RENDERTARGETINDEXINCR" pos="18" type="boolean" variants="A6XX-A7XX"/>
+		<bitfield name="VIEWPORTINDEXINCR" pos="19" type="boolean" variants="A6XX-A7XX"/>
+		<bitfield name="UNK20" low="20" high="22" variants="A6XX-A7XX"/>
+	</bitset>
+	<reg32 offset="0x8090" name="GRAS_SU_CNTL" type="a6xx_gras_su_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_gras_su_point_minmax" inline="yes">
 		<bitfield name="MIN" low="0" high="15" type="ufixed" radix="4"/>
 		<bitfield name="MAX" low="16" high="31" type="ufixed" radix="4"/>
-	</reg32>
-	<reg32 offset="0x8092" name="GRAS_SU_POINT_SIZE" low="0" high="15" type="fixed" radix="4" usage="rp_blit"/>
+	</bitset>
+
+	<reg32 offset="0x8091" name="GRAS_SU_POINT_MINMAX" type="a6xx_gras_su_point_minmax" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8092" name="GRAS_SU_POINT_SIZE" low="0" high="15" type="fixed" radix="4" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_gras_su_depth_cntl" inline="yes">
+		<bitfield name="Z_TEST_ENABLE" pos="0" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x8114" name="GRAS_SU_DEPTH_CNTL" variants="A6XX-A7XX" type="a6xx_gras_su_depth_cntl" usage="rp_blit"/>
+
+	<bitset name="a6xx_gras_su_stencil_cntl" inline="yes">
+		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x8115" name="GRAS_SU_STENCIL_CNTL" type="a6xx_gras_su_stencil_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_gras_su_render_cntl" inline="yes">
+		<bitfield name="FS_DISABLE" pos="7" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x8116" name="GRAS_SU_RENDER_CNTL" type="a6xx_gras_su_render_cntl" variants="A7XX" usage="rp_blit"/>
+
 	<!-- 0x8093 invalid -->
-	<reg32 offset="0x8094" name="GRAS_SU_DEPTH_PLANE_CNTL" usage="rp_blit">
+	<bitset name="a6xx_depth_plane_cntl" inline="yes">
 		<bitfield name="Z_MODE" low="0" high="1" type="a6xx_ztest_mode"/>
-	</reg32>
-	<reg32 offset="0x8095" name="GRAS_SU_POLY_OFFSET_SCALE" type="float" usage="rp_blit"/>
-	<reg32 offset="0x8096" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float" usage="rp_blit"/>
-	<reg32 offset="0x8097" name="GRAS_SU_POLY_OFFSET_OFFSET_CLAMP" type="float" usage="rp_blit"/>
-	<!-- duplicates RB_DEPTH_BUFFER_INFO: -->
-	<reg32 offset="0x8098" name="GRAS_SU_DEPTH_BUFFER_INFO" usage="rp_blit">
+	</bitset>
+
+	<reg32 offset="0x8094" name="GRAS_SU_DEPTH_PLANE_CNTL" type="a6xx_depth_plane_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8095" name="GRAS_SU_POLY_OFFSET_SCALE" type="float" variants="A6XX-A7XX"  usage="rp_blit"/>
+	<reg32 offset="0x8096" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float" variants="A6XX-A7XX"  usage="rp_blit"/>
+	<reg32 offset="0x8097" name="GRAS_SU_POLY_OFFSET_OFFSET_CLAMP" type="float" variants="A6XX-A7XX" usage="rp_blit"/>
+	<bitset name="a6xx_depth_buffer_info" inline="yes">
 		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
 		<bitfield name="UNK3" pos="3"/>
-	</reg32>
+	</bitset>
 
-	<reg32 offset="0x8099" name="GRAS_SU_CONSERVATIVE_RAS_CNTL" usage="cmd">
+	<!-- duplicates RB_DEPTH_BUFFER_INFO: -->
+	<reg32 offset="0x8098" name="GRAS_SU_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_gras_su_conservative_ras_cntl" inline="yes">
 		<bitfield name="CONSERVATIVERASEN" pos="0" type="boolean"/>
 		<enum name="a6xx_shift_amount">
 			<value value="0" name="NO_SHIFT"/>
@@ -932,7 +1005,10 @@ by a particular renderpass/blit.
 		<bitfield name="SHIFTAMOUNT" low="1" high="2" type="a6xx_shift_amount"/>
 		<bitfield name="INNERCONSERVATIVERASEN" pos="3" type="boolean"/>
 		<bitfield name="UNK4" low="4" high="5"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x8099" name="GRAS_SU_CONSERVATIVE_RAS_CNTL" type="a6xx_gras_su_conservative_ras_cntl" variants="A6XX-A7XX" usage="cmd"/>
+
 	<reg32 offset="0x809a" name="GRAS_SU_PATH_RENDERING_CNTL">
 		<bitfield name="UNK0" pos="0" type="boolean"/>
 		<bitfield name="LINELENGTHEN" pos="1" type="boolean"/>
@@ -942,10 +1018,13 @@ by a particular renderpass/blit.
 		<bitfield name="WRITES_LAYER" pos="0" type="boolean"/>
 		<bitfield name="WRITES_VIEW" pos="1" type="boolean"/>
 	</bitset>
-	<reg32 offset="0x809b" name="GRAS_SU_VS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" usage="rp_blit"/>
-	<reg32 offset="0x809c" name="GRAS_SU_GS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" usage="rp_blit"/>
-	<reg32 offset="0x809d" name="GRAS_SU_DS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" usage="rp_blit"/>
-	<!-- 0x809e/0x809f invalid -->
+	<reg32 offset="0x809b" name="GRAS_SU_VS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x809c" name="GRAS_SU_GS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x809d" name="GRAS_SU_DS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_rast_cntl" inline="yes">
+		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
+	</bitset>
 
 	<enum name="a6xx_sequenced_thread_dist">
 		<value value="0x0" name="DIST_SCREEN_COORD"/>
@@ -993,7 +1072,7 @@ by a particular renderpass/blit.
 		<value value="0x3" name="RB_BT"/>
 	</enum>
 
-	<reg32 offset="0x80a0" name="GRAS_SC_CNTL" usage="rp_blit">
+	<bitset name="a6xx_gras_sc_cntl" inline="yes">
 		<bitfield name="CCUSINGLECACHELINESIZE" low="0" high="2"/>
 		<bitfield name="SINGLE_PRIM_MODE" low="3" high="4" type="a6xx_single_prim_mode"/>
 		<bitfield name="RASTER_MODE" pos="5" type="a6xx_raster_mode"/>
@@ -1003,7 +1082,9 @@ by a particular renderpass/blit.
 		<bitfield name="UNK9" pos="9" type="boolean"/>
 		<bitfield name="ROTATION" low="10" high="11" type="uint"/>
 		<bitfield name="EARLYVIZOUTEN" pos="12" type="boolean"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x80a0" name="GRAS_SC_CNTL" type="a6xx_gras_sc_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
 	<enum name="a6xx_render_mode">
 		<value value="0x0" name="RENDERING_PASS"/>
@@ -1024,7 +1105,7 @@ by a particular renderpass/blit.
 		<value value="0x4" name="LRZ_FEEDBACK_LATE_Z"/>
 	</enum>
 
-	<reg32 offset="0x80a1" name="GRAS_SC_BIN_CNTL" usage="rp_blit">
+	<bitset name="a6xx_bin_cntl" inline="yes">
 		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
 		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
 		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
@@ -1037,18 +1118,25 @@ by a particular renderpass/blit.
 			In sysmem mode GRAS_LRZ_CNTL.LRZ_WRITE is not considered.
 		</doc>
 		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26" type="a6xx_lrz_feedback_mask"/>
-		<bitfield name="UNK27" pos="27"/>
-	</reg32>
+		<bitfield name="FORCE_LRZ_DIS" pos="27" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x80a1" name="GRAS_SC_BIN_CNTL" type="a6xx_bin_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
-	<reg32 offset="0x80a2" name="GRAS_SC_RAS_MSAA_CNTL" usage="rp_blit">
+	<bitset name="a6xx_gras_sc_ras_msaa_cntl" inline="yes">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
 		<bitfield name="UNK2" pos="2"/>
 		<bitfield name="UNK3" pos="3"/>
-	</reg32>
-	<reg32 offset="0x80a3" name="GRAS_SC_DEST_MSAA_CNTL" usage="rp_blit">
+	</bitset>
+
+	<reg32 offset="0x80a2" name="GRAS_SC_RAS_MSAA_CNTL" type="a6xx_gras_sc_ras_msaa_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_gras_sc_dest_msaa_cntl" inline="yes">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
 		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x80a3" name="GRAS_SC_DEST_MSAA_CNTL" type="a6xx_gras_sc_dest_msaa_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
 	<bitset name="a6xx_msaa_sample_pos_cntl" inline="yes">
 		<bitfield name="UNK0" pos="0"/>
@@ -1066,30 +1154,35 @@ by a particular renderpass/blit.
 		<bitfield name="SAMPLE_3_Y" low="28" high="31" radix="4" type="fixed"/>
 	</bitset>
 
-	<reg32 offset="0x80a4" name="GRAS_SC_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" usage="rp_blit"/>
-	<reg32 offset="0x80a5" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" usage="rp_blit"/>
-	<reg32 offset="0x80a6" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" usage="rp_blit"/>
+	<reg32 offset="0x80a4" name="GRAS_SC_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x80a5" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x80a6" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" variants="A6XX-A7XX" usage="rp_blit"/>
 
-	<reg32 offset="0x80a7" name="GRAS_UNKNOWN_80A7" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x80a7" name="GRAS_ROTATION_CNTL" variants="A7XX" usage="cmd"/>
 
-	<!-- 0x80a7-0x80ae invalid -->
-	<reg32 offset="0x80af" name="GRAS_UNKNOWN_80AF" pos="0" usage="cmd"/>
+	<bitset name="a6xx_screen_scissor_cntl" inline="yes">
+		<bitfield name="SCISSOR_DISABLE" pos="0" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x80af" name="GRAS_SC_SCREEN_SCISSOR_CNTL" type="a6xx_screen_scissor_cntl" variants="A6XX-A7XX" pos="0" usage="cmd"/>
 
 	<bitset name="a6xx_scissor_xy" inline="yes">
 		<bitfield name="X" low="0" high="15" type="uint"/>
 		<bitfield name="Y" low="16" high="31" type="uint"/>
 	</bitset>
-	<array offset="0x80b0" name="GRAS_SC_SCREEN_SCISSOR" stride="2" length="16" usage="rp_blit">
+
+	<array offset="0x80b0" name="GRAS_SC_SCREEN_SCISSOR" stride="2" length="16" variants="A6XX-A7XX" usage="rp_blit">
 		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
 		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
 	</array>
-	<array offset="0x80d0" name="GRAS_SC_VIEWPORT_SCISSOR" stride="2" length="16" usage="rp_blit">
+
+	<array offset="0x80d0" name="GRAS_SC_VIEWPORT_SCISSOR" stride="2" length="16" variants="A6XX-A7XX" usage="rp_blit">
 		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
 		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
 	</array>
 
-	<reg32 offset="0x80f0" name="GRAS_SC_WINDOW_SCISSOR_TL" type="a6xx_reg_xy" usage="rp_blit"/>
-	<reg32 offset="0x80f1" name="GRAS_SC_WINDOW_SCISSOR_BR" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x80f0" name="GRAS_SC_WINDOW_SCISSOR_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x80f1" name="GRAS_SC_WINDOW_SCISSOR_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
 
 	<enum name="a6xx_fsr_combiner">
 		<value value="0" name="FSR_COMBINER_OP_KEEP"/>
@@ -1099,7 +1192,7 @@ by a particular renderpass/blit.
 		<value value="4" name="FSR_COMBINER_OP_MUL"/>
 	</enum>
 
-	<reg32 offset="0x80f4" name="GRAS_VRS_CONFIG" variants="A7XX-" usage="rp_blit">
+	<bitset name="a6xx_gras_vrs_config">
 		<bitfield name="PIPELINE_FSR_ENABLE" pos="0" type="boolean"/>
 		<bitfield name="FRAG_SIZE_X" low="1" high="2" type="uint"/>
 		<bitfield name="FRAG_SIZE_Y" low="3" high="4" type="uint"/>
@@ -1107,20 +1200,32 @@ by a particular renderpass/blit.
 		<bitfield name="COMBINER_OP_2" low="8" high="10" type="a6xx_fsr_combiner"/>
 		<bitfield name="ATTACHMENT_FSR_ENABLE" pos="13" type="boolean"/>
 		<bitfield name="PRIMITIVE_FSR_ENABLE" pos="20" type="boolean"/>
-	</reg32>
-	<reg32 offset="0x80f5" name="GRAS_QUALITY_BUFFER_INFO" variants="A7XX-" usage="rp_blit">
+	</bitset>
+
+	<reg32 offset="0x80f4" name="GRAS_VRS_CONFIG" type="a6xx_gras_vrs_config" variants="A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_gras_quality_buffer_info" inline="yes">
 		<bitfield name="LAYERED" pos="0" type="boolean"/>
 		<bitfield name="TILE_MODE" low="1" high="2" type="a6xx_tile_mode"/>
-	</reg32>
-	<reg32 offset="0x80f6" name="GRAS_QUALITY_BUFFER_DIMENSION" variants="A7XX-" usage="rp_blit">
+	</bitset>
+
+	<reg32 offset="0x80f5" name="GRAS_QUALITY_BUFFER_INFO" type="a6xx_gras_quality_buffer_info" variants="A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_gras_quality_buffer_dimension" inline="yes">
 		<bitfield name="WIDTH" low="0" high="15" type="uint"/>
 		<bitfield name="HEIGHT" low="16" high="31" type="uint"/>
-	</reg32>
-	<reg64 offset="0x80f8" name="GRAS_QUALITY_BUFFER_BASE" variants="A7XX-" type="waddress" usage="rp_blit"/>
-	<reg32 offset="0x80fa" name="GRAS_QUALITY_BUFFER_PITCH" variants="A7XX-" usage="rp_blit">
+	</bitset>
+
+	<reg32 offset="0x80f6" name="GRAS_QUALITY_BUFFER_DIMENSION" type="a6xx_gras_quality_buffer_dimension" variants="A7XX" usage="rp_blit"/>
+
+	<reg64 offset="0x80f8" name="GRAS_QUALITY_BUFFER_BASE" variants="A7XX" type="waddress" usage="rp_blit"/>
+
+	<bitset name="a6xx_gras_quality_buffer_pitch" inline="yes">
 		<bitfield name="PITCH" shr="6" low="0" high="7" type="uint"/>
 		<bitfield name="ARRAY_PITCH" shr="6" low="10" high="28" type="uint"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x80fa" name="GRAS_QUALITY_BUFFER_PITCH" type="a6xx_gras_quality_buffer_pitch" variants="A7XX" usage="rp_blit"/>
 
 	<enum name="a6xx_lrz_dir_status">
 		<value value="0x1" name="LRZ_DIR_LE"/>
@@ -1128,7 +1233,7 @@ by a particular renderpass/blit.
 		<value value="0x3" name="LRZ_DIR_INVALID"/>
 	</enum>
 
-	<reg32 offset="0x8100" name="GRAS_LRZ_CNTL" usage="rp_blit">
+	<bitset name="a6xx_gras_lrz_cntl" inline="yes">
 		<bitfield name="ENABLE" pos="0" type="boolean"/>
 		<doc>LRZ write also disabled for blend/etc.</doc>
 		<bitfield name="LRZ_WRITE" pos="1" type="boolean"/>
@@ -1155,26 +1260,36 @@ by a particular renderpass/blit.
 		</doc>
 		<bitfield name="DISABLE_ON_WRONG_DIR" pos="9" type="boolean" variants="A6XX"/>
 		<bitfield name="Z_FUNC" low="11" high="13" type="adreno_compare_func" variants="A7XX-"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x8100" name="GRAS_LRZ_CNTL" type="a6xx_gras_lrz_cntl" usage="rp_blit" variants="A6XX-A7XX"/>
 
 	<enum name="a6xx_fragcoord_sample_mode">
 		<value value="0" name="FRAGCOORD_CENTER"/>
 		<value value="3" name="FRAGCOORD_SAMPLE"/>
 	</enum>
 
-	<reg32 offset="0x8101" name="GRAS_LRZ_PS_INPUT_CNTL" low="0" high="2" usage="rp_blit">
+	<bitset name="a6xx_gras_lrz_ps_input_cntl" inline="yes">
 		<bitfield name="SAMPLEID" pos="0" type="boolean"/>
 		<bitfield name="FRAGCOORDSAMPLEMODE" low="1" high="2" type="a6xx_fragcoord_sample_mode"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x8101" name="GRAS_LRZ_PS_INPUT_CNTL" type="a6xx_gras_lrz_ps_input_cntl" usage="rp_blit" variants="A6XX-A7XX"/>
 
-	<reg32 offset="0x8102" name="GRAS_LRZ_MRT_BUFFER_INFO_0" usage="rp_blit">
+	<bitset name="a6xx_gras_lrz_mrt_buffer_info_0" inline="yes">
 		<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
-	</reg32>
-	<reg64 offset="0x8103" name="GRAS_LRZ_BUFFER_BASE" align="256" type="waddress" usage="rp_blit"/>
-	<reg32 offset="0x8105" name="GRAS_LRZ_BUFFER_PITCH" usage="rp_blit">
+	</bitset>
+
+	<reg32 offset="0x8102" name="GRAS_LRZ_MRT_BUFFER_INFO_0" type="a6xx_gras_lrz_mrt_buffer_info_0" usage="rp_blit" variants="A6XX-A7XX"/>
+
+	<reg64 offset="0x8103" name="GRAS_LRZ_BUFFER_BASE" align="256" type="waddress" usage="rp_blit" variants="A6XX-A7XX"/>
+
+	<bitset name="a6xx_gras_lrz_buffer_pitch" inline="yes">
 		<bitfield name="PITCH" low="0" high="7" shr="5" type="uint"/>
 		<bitfield name="ARRAY_PITCH" low="10" high="28" shr="8" type="uint"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x8105" name="GRAS_LRZ_BUFFER_PITCH" type="a6xx_gras_lrz_buffer_pitch" usage="rp_blit" variants="A6XX-A7XX"/>
 
 	<!--
 	The LRZ "fast clear" buffer is initialized to zero's by blob, and
@@ -1207,7 +1322,6 @@ by a particular renderpass/blit.
 	not.
 	 -->
 	<reg64 offset="0x8106" name="GRAS_LRZ_FAST_CLEAR_BUFFER_BASE" align="64" type="waddress" usage="rp_blit"/>
-	<!-- 0x8108 invalid -->
 	<reg32 offset="0x8109" name="GRAS_LRZ_PS_SAMPLEFREQ_CNTL" usage="rp_blit">
 		<bitfield name="PER_SAMP_MODE" pos="0" type="boolean"/>
 	</reg32>
@@ -1232,19 +1346,20 @@ by a particular renderpass/blit.
 
 	<!-- 0x810c-0x810f invalid -->
 
-	<reg32 offset="0x8110" name="GRAS_UNKNOWN_8110" low="0" high="1" usage="cmd"/>
+	<reg32 offset="0x8110" name="GRAS_MODE_CNTL" low="0" high="1" variants="A6XX-A7XX" usage="cmd"/>
 
 	<!-- A bit tentative but it's a color and it is followed by LRZ_CLEAR -->
-	<reg32 offset="0x8111" name="GRAS_LRZ_DEPTH_CLEAR" type="float" variants="A7XX-"/>
+	<reg32 offset="0x8111" name="GRAS_LRZ_DEPTH_CLEAR" type="float" variants="A7XX"/>
 
-	<reg32 offset="0x8113" name="GRAS_LRZ_DEPTH_BUFFER_INFO" variants="A7XX-" usage="rp_blit">
+	<bitset name="a6xx_gras_lrz_depth_buffer_info" inline="yes">
 		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
 		<bitfield name="UNK3" pos="3"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x8113" name="GRAS_LRZ_DEPTH_BUFFER_INFO" type="a6xx_gras_lrz_depth_buffer_info" variants="A7XX" usage="rp_blit"/>
 
-	<!-- Always written together and always equal 09510840 00000a62 -->
-	<reg32 offset="0x8120" name="GRAS_UNKNOWN_8120" variants="A7XX-" usage="cmd"/>
-	<reg32 offset="0x8121" name="GRAS_UNKNOWN_8121" variants="A7XX-" usage="cmd"/>
+	<doc>LUT used to convert quality buffer values to HW shading rate values. An array of 4-bit values.</doc>
+	<array offset="0x8120" name="GRAS_LRZ_QUALITY_LOOKUP_TABLE" variants="A7XX-" stride="1" length="2"/>
 
 	<!-- 0x8112-0x83ff invalid -->
 
@@ -1269,28 +1384,29 @@ by a particular renderpass/blit.
 		<bitfield name="D24S8" pos="19" type="boolean"/>
 		<!-- some sort of channel mask, disabled channels are set to zero ? -->
 		<bitfield name="MASK" low="20" high="23"/>
-		<bitfield name="IFMT" low="24" high="28" type="a6xx_2d_ifmt"/>
+		<bitfield name="IFMT" low="24" high="26" type="a6xx_2d_ifmt"/>
+		<bitfield name="UNK27" pos="27" type="boolean"/>
+		<bitfield name="UNK28" pos="28" type="boolean"/>
 		<bitfield name="RASTER_MODE" pos="29" type="a6xx_raster_mode"/>
-		<bitfield name="UNK30" pos="30" type="boolean" variants="A7XX-"/>
+		<bitfield name="COPY" pos="30" type="boolean" variants="A7XX-"/>
 	</bitset>
 
-	<reg32 offset="0x8400" name="GRAS_A2D_BLT_CNTL" type="a6xx_a2d_bit_cntl" usage="rp_blit"/>
+	<reg32 offset="0x8400" name="GRAS_A2D_BLT_CNTL" type="a6xx_a2d_bit_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<!-- note: the low 8 bits for src coords are valid, probably fixed point
 	     it would be a bit weird though, since we subtract 1 from BR coords
 	     apparently signed, gallium driver uses negative coords and it works?
 	 -->
-	<reg32 offset="0x8401" name="GRAS_A2D_SRC_XMIN" low="8" high="24" type="int" usage="rp_blit"/>
-	<reg32 offset="0x8402" name="GRAS_A2D_SRC_XMAX" low="8" high="24" type="int" usage="rp_blit"/>
-	<reg32 offset="0x8403" name="GRAS_A2D_SRC_YMIN" low="8" high="24" type="int" usage="rp_blit"/>
-	<reg32 offset="0x8404" name="GRAS_A2D_SRC_YMAX" low="8" high="24" type="int" usage="rp_blit"/>
-	<reg32 offset="0x8405" name="GRAS_A2D_DEST_TL" type="a6xx_reg_xy" usage="rp_blit"/>
-	<reg32 offset="0x8406" name="GRAS_A2D_DEST_BR" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x8401" name="GRAS_A2D_SRC_XMIN" low="8" high="24" type="int" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8402" name="GRAS_A2D_SRC_XMAX" low="8" high="24" type="int" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8403" name="GRAS_A2D_SRC_YMIN" low="8" high="24" type="int" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8404" name="GRAS_A2D_SRC_YMAX" low="8" high="24" type="int" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8405" name="GRAS_A2D_DEST_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8406" name="GRAS_A2D_DEST_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x8407" name="GRAS_2D_UNKNOWN_8407" low="0" high="31"/>
 	<reg32 offset="0x8408" name="GRAS_2D_UNKNOWN_8408" low="0" high="31"/>
 	<reg32 offset="0x8409" name="GRAS_2D_UNKNOWN_8409" low="0" high="31"/>
-	<reg32 offset="0x840a" name="GRAS_A2D_SCISSOR_TL" type="a6xx_reg_xy" usage="rp_blit"/>
-	<reg32 offset="0x840b" name="GRAS_A2D_SCISSOR_BR" type="a6xx_reg_xy" usage="rp_blit"/>
-	<!-- 0x840c-0x85ff invalid -->
+	<reg32 offset="0x840a" name="GRAS_A2D_SCISSOR_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x840b" name="GRAS_A2D_SCISSOR_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
 
 	<!-- always 0x880 ? (and 0 in a640/a650 traces?) -->
 	<reg32 offset="0x8600" name="GRAS_DBG_ECO_CNTL" usage="cmd">
@@ -1308,22 +1424,7 @@ by a particular renderpass/blit.
 	-->
 
 	<!-- same as GRAS_BIN_CONTROL, but without bit 27: -->
-	<reg32 offset="0x8800" name="RB_CNTL" variants="A6XX" usage="rp_blit">
-		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
-		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
-		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
-		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
-		<bitfield name="BUFFERS_LOCATION" low="22" high="23" type="a6xx_buffers_location"/>
-		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26" type="a6xx_lrz_feedback_mask"/>
-	</reg32>
-
-	<reg32 offset="0x8800" name="RB_CNTL" variants="A7XX-" usage="rp_blit">
-		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
-		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
-		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
-		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
-		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26" type="a6xx_lrz_feedback_mask"/>
-	</reg32>
+	<reg32 offset="0x8800" name="RB_CNTL" variants="A6XX-A7XX" type="a6xx_bin_cntl" usage="rp_blit"/>
 
 	<reg32 offset="0x8801" name="RB_RENDER_CNTL" variants="A6XX" usage="rp_blit">
 		<bitfield name="CCUSINGLECACHELINESIZE" low="3" high="5"/>
@@ -1347,9 +1448,6 @@ by a particular renderpass/blit.
 		<bitfield name="CONSERVATIVERASEN" pos="11" type="boolean"/>
 		<bitfield name="INNERCONSERVATIVERASEN" pos="12" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x8116" name="GRAS_SU_RENDER_CNTL" variants="A7XX-" usage="rp_blit">
-		<bitfield name="FS_DISABLE" pos="7" type="boolean"/>
-	</reg32>
 
 	<reg32 offset="0x8802" name="RB_RAS_MSAA_CNTL" usage="rp_blit">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
@@ -1516,9 +1614,7 @@ by a particular renderpass/blit.
 		<bitfield name="SAMPLE_MASK" low="16" high="31"/>
 	</reg32>
 	<!-- 0x8866-0x886f invalid -->
-	<reg32 offset="0x8870" name="RB_DEPTH_PLANE_CNTL" usage="rp_blit">
-		<bitfield name="Z_MODE" low="0" high="1" type="a6xx_ztest_mode"/>
-	</reg32>
+	<reg32 offset="0x8870" name="RB_DEPTH_PLANE_CNTL" type="a6xx_depth_plane_cntl" usage="rp_blit"/>
 
 	<reg32 offset="0x8871" name="RB_DEPTH_CNTL" usage="rp_blit">
 		<bitfield name="Z_TEST_ENABLE" pos="0" type="boolean"/>
@@ -1532,14 +1628,9 @@ by a particular renderpass/blit.
 		<bitfield name="Z_READ_ENABLE" pos="6" type="boolean"/>
 		<bitfield name="Z_BOUNDS_ENABLE" pos="7" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x8114" name="GRAS_SU_DEPTH_CNTL" usage="rp_blit">
-		<bitfield name="Z_TEST_ENABLE" pos="0" type="boolean"/>
-	</reg32>
+
 	<!-- duplicates GRAS_SU_DEPTH_BUFFER_INFO: -->
-	<reg32 offset="0x8872" name="RB_DEPTH_BUFFER_INFO" variants="A6XX" usage="rp_blit">
-		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
-		<bitfield name="UNK3" low="3" high="4"/>
-	</reg32>
+	<reg32 offset="0x8872" name="RB_DEPTH_BUFFER_INFO" variants="A6XX" type="a6xx_depth_buffer_info" usage="rp_blit"/>
 	<!-- first 4 bits duplicates GRAS_SU_DEPTH_BUFFER_INFO -->
 	<reg32 offset="0x8872" name="RB_DEPTH_BUFFER_INFO" variants="A7XX-" usage="rp_blit">
 		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
@@ -1575,9 +1666,7 @@ by a particular renderpass/blit.
 		<bitfield name="ZPASS_BF" low="26" high="28" type="adreno_stencil_op"/>
 		<bitfield name="ZFAIL_BF" low="29" high="31" type="adreno_stencil_op"/>
 	</reg32>
-	<reg32 offset="0x8115" name="GRAS_SU_STENCIL_CNTL" usage="rp_blit">
-		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
-	</reg32>
+
 	<reg32 offset="0x8881" name="RB_STENCIL_BUFFER_INFO" variants="A6XX" usage="rp_blit">
 		<bitfield name="SEPARATE_STENCIL" pos="0" type="boolean"/>
 		<bitfield name="UNK1" pos="1" type="boolean"/>
@@ -1616,8 +1705,9 @@ by a particular renderpass/blit.
 	<reg32 offset="0x8899" name="RB_UNKNOWN_8899" variants="A7XX-" usage="cmd"/>
 	<!-- 0x8899-0x88bf invalid -->
 	<!-- clamps depth value for depth test/write -->
-	<reg32 offset="0x88c0" name="RB_VIEWPORT_ZCLAMP_MIN" type="float" usage="rp_blit"/>
-	<reg32 offset="0x88c1" name="RB_VIEWPORT_ZCLAMP_MAX" type="float" usage="rp_blit"/>
+	<reg32 offset="0x88c0" name="RB_VIEWPORT_ZCLAMP_MIN" type="float" usage="rp_blit" variants="A6XX-A7XX"/>
+	<reg32 offset="0x88c1" name="RB_VIEWPORT_ZCLAMP_MAX" type="float" usage="rp_blit" variants="A6XX-A7XX"/>
+
 	<!-- 0x88c2-0x88cf invalid-->
 	<reg32 offset="0x88d0" name="RB_RESOLVE_CNTL_0" usage="rp_blit">
 		<bitfield name="UNK0" low="0" high="12"/>
@@ -1626,7 +1716,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x88d1" name="RB_RESOLVE_CNTL_1" type="a6xx_reg_xy" usage="rp_blit"/>
 	<reg32 offset="0x88d2" name="RB_RESOLVE_CNTL_2" type="a6xx_reg_xy" usage="rp_blit"/>
 	<!-- weird to duplicate other regs from same block?? -->
-	<reg32 offset="0x88d3" name="RB_RESOLVE_CNTL_3" usage="rp_blit">
+	<reg32 offset="0x88d3" name="RB_RESOLVE_CNTL_3" variants="A6XX-A7XX" usage="rp_blit">
 		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
 		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
 	</reg32>
@@ -1650,10 +1740,13 @@ by a particular renderpass/blit.
 	<!-- array-pitch is size of layer -->
 	<reg32 offset="0x88db" name="RB_RESOLVE_SYSTEM_BUFFER_ARRAY_PITCH" low="0" high="28" shr="6" type="uint" usage="rp_blit"/>
 	<reg64 offset="0x88dc" name="RB_RESOLVE_SYSTEM_FLAG_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
-	<reg32 offset="0x88de" name="RB_RESOLVE_SYSTEM_FLAG_BUFFER_PITCH" usage="rp_blit">
+
+	<bitset name="a6xx_flag_buffer_pitch" inline="yes">
 		<bitfield name="PITCH" low="0" high="10" shr="6" type="uint"/>
-		<bitfield name="ARRAY_PITCH" low="11" high="27" shr="7" type="uint"/>
-	</reg32>
+		<bitfield name="ARRAY_PITCH" low="11" high="28" shr="7" type="uint"/>
+	</bitset>
+
+	<reg32 offset="0x88de" name="RB_RESOLVE_SYSTEM_FLAG_BUFFER_PITCH" type="a6xx_flag_buffer_pitch" usage="rp_blit"/>
 
 	<reg32 offset="0x88df" name="RB_RESOLVE_CLEAR_COLOR_DW0" usage="rp_blit"/>
 	<reg32 offset="0x88e0" name="RB_RESOLVE_CLEAR_COLOR_DW1" usage="rp_blit"/>
@@ -1726,10 +1819,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x88f0" name="RB_UNKNOWN_88F0" low="0" high="11" usage="cmd"/>
 	<!-- could be for separate stencil? (or may not be a flag buffer at all) -->
 	<reg64 offset="0x88f1" name="RB_UNK_FLAG_BUFFER_BASE" type="waddress" align="64"/>
-	<reg32 offset="0x88f3" name="RB_UNK_FLAG_BUFFER_PITCH">
-		<bitfield name="PITCH" low="0" high="10" shr="6" type="uint"/>
-		<bitfield name="ARRAY_PITCH" low="11" high="23" shr="7" type="uint"/>
-	</reg32>
+	<reg32 offset="0x88f3" name="RB_UNK_FLAG_BUFFER_PITCH" type="a6xx_flag_buffer_pitch"/>
 
 	<reg32 offset="0x88f4" name="RB_VRS_CONFIG" usage="rp_blit">
 		<bitfield name="UNK2" pos="2" type="boolean"/>
@@ -1737,8 +1827,9 @@ by a particular renderpass/blit.
 		<bitfield name="ATTACHMENT_FSR_ENABLE" pos="5" type="boolean"/>
 		<bitfield name="PRIMITIVE_FSR_ENABLE" pos="18" type="boolean"/>
 	</reg32>
-	<!-- Connected to VK_EXT_fragment_density_map? -->
-	<reg32 offset="0x88f5" name="RB_UNKNOWN_88F5" variants="A7XX-"/>
+	<reg32 offset="0x88f5" name="RB_BIN_FOVEAT" variants="A7XX-" usage="cmd">
+		<bitfield name="BINSCALEEN" pos="6" type="boolean"/>
+	</reg32>
 	<!-- 0x88f6-0x88ff invalid -->
 	<reg64 offset="0x8900" name="RB_DEPTH_FLAG_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
 	<reg32 offset="0x8902" name="RB_DEPTH_FLAG_BUFFER_PITCH" usage="rp_blit">
@@ -1747,12 +1838,10 @@ by a particular renderpass/blit.
 		<bitfield name="UNK8" low="8" high="10"/>
 		<bitfield name="ARRAY_PITCH" low="11" high="27" shr="7" type="uint"/>
 	</reg32>
+
 	<array offset="0x8903" name="RB_COLOR_FLAG_BUFFER" stride="3" length="8" usage="rp_blit">
 		<reg64 offset="0" name="ADDR" type="waddress" align="64"/>
-		<reg32 offset="2" name="PITCH">
-			<bitfield name="PITCH" low="0" high="10" shr="6" type="uint"/>
-			<bitfield name="ARRAY_PITCH" low="11" high="28" shr="7" type="uint"/>
-		</reg32>
+		<reg32 offset="2" name="PITCH" type="a6xx_flag_buffer_pitch"/>
 	</array>
 	<!-- 0x891b-0x8926 invalid -->
 	<doc>
@@ -1815,7 +1904,7 @@ by a particular renderpass/blit.
 	<reg64 offset="0x8c1e" name="RB_A2D_DEST_BUFFER_BASE_2" type="waddress" align="64" usage="rp_blit"/>
 
 	<reg64 offset="0x8c20" name="RB_A2D_DEST_FLAG_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
-	<reg32 offset="0x8c22" name="RB_A2D_DEST_FLAG_BUFFER_PITCH" low="0" high="7" shr="6" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x8c22" name="RB_A2D_DEST_FLAG_BUFFER_PITCH" type="a6xx_flag_buffer_pitch" usage="rp_blit"/>
 	<!-- this is a guess but seems likely (for NV12 with UBWC): -->
 	<reg64 offset="0x8c23" name="RB_A2D_DEST_FLAG_BUFFER_BASE_1" type="waddress" align="64" usage="rp_blit"/>
 	<reg32 offset="0x8c25" name="RB_A2D_DEST_FLAG_BUFFER_PITCH_1" low="0" high="7" shr="6" type="uint" usage="rp_blit"/>
@@ -1921,13 +2010,13 @@ by a particular renderpass/blit.
 		<bitfield name="CLIP_DIST_03_LOC" low="8" high="15" type="uint"/>
 		<bitfield name="CLIP_DIST_47_LOC" low="16" high="23" type="uint"/>
 	</bitset>
-	<reg32 offset="0x9101" name="VPC_VS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9102" name="VPC_GS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9103" name="VPC_DS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9101" name="VPC_VS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9102" name="VPC_GS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9103" name="VPC_DS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
-	<reg32 offset="0x9311" name="VPC_VS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9312" name="VPC_GS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9313" name="VPC_DS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9311" name="VPC_VS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9312" name="VPC_GS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9313" name="VPC_DS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
 	<bitset name="a6xx_vpc_xs_siv_cntl" inline="yes">
 		<bitfield name="LAYERLOC" low="0" high="7" type="uint"/>
@@ -1935,23 +2024,33 @@ by a particular renderpass/blit.
 		<bitfield name="SHADINGRATELOC" low="16" high="23" type="uint" variants="A7XX-"/>
 	</bitset>
 
-	<reg32 offset="0x9104" name="VPC_VS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9105" name="VPC_GS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9106" name="VPC_DS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9104" name="VPC_VS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9105" name="VPC_GS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9106" name="VPC_DS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
 
-	<reg32 offset="0x9314" name="VPC_VS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9315" name="VPC_GS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9316" name="VPC_DS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9314" name="VPC_VS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9315" name="VPC_GS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9316" name="VPC_DS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_vpc_rast_stream_cntl" inline="yes">
+		<!-- which stream to send to GRAS -->
+		<bitfield name="STREAM" low="0" high="1" type="uint"/>
+		<!-- discard primitives before rasterization -->
+		<bitfield name="DISCARD" pos="2" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x9980" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0x9107" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9317" name="VPC_RAST_STREAM_CNTL_V2" type="a6xx_vpc_rast_stream_cntl" variants="A7XX" usage="rp_blit"/>
 
 	<reg32 offset="0x9107" name="VPC_UNKNOWN_9107" variants="A6XX" usage="rp_blit">
 		<!-- this mirrors VPC_RAST_STREAM_CNTL::DISCARD, although it seems it's unused -->
 		<bitfield name="RASTER_DISCARD" pos="0" type="boolean"/>
 		<bitfield name="UNK2" pos="2" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x9108" name="VPC_RAST_CNTL" usage="rp_blit">
-		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
-	</reg32>
 
+	<reg32 offset="0x9108" name="VPC_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<bitset name="a6xx_pc_cntl" inline="yes">
 		<bitfield name="PRIMITIVE_RESTART" pos="0" type="boolean"/>
 		<bitfield name="PROVOKING_VTX_LAST" pos="1" type="boolean"/>
@@ -1991,10 +2090,10 @@ by a particular renderpass/blit.
 		<bitfield name="VIEWS" low="2" high="6" type="uint"/>
 	</bitset>
 
-	<reg32 offset="0x9109" name="VPC_PC_CNTL" type="a6xx_pc_cntl" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0x910a" name="VPC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0x910b" name="VPC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0x910c" name="VPC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0x9109" name="VPC_PC_CNTL" type="a6xx_pc_cntl" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x910a" name="VPC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x910b" name="VPC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x910c" name="VPC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A7XX" usage="rp_blit"/>
 
 	<enum name="a6xx_varying_interp_mode">
 		<value value="0" name="INTERP_SMOOTH"/>
@@ -2011,11 +2110,11 @@ by a particular renderpass/blit.
 	</enum>
 
 	<!-- 0x9109-0x91ff invalid -->
-	<array offset="0x9200" name="VPC_VARYING_INTERP_MODE" stride="1" length="8" usage="rp_blit">
+	<array offset="0x9200" name="VPC_VARYING_INTERP_MODE" stride="1" length="8" variants="A6XX-A7XX" usage="rp_blit">
 		<doc>Packed array of a6xx_varying_interp_mode</doc>
 		<reg32 offset="0x0" name="MODE"/>
 	</array>
-	<array offset="0x9208" name="VPC_VARYING_REPLACE_MODE_0" stride="1" length="8" usage="rp_blit">
+	<array offset="0x9208" name="VPC_VARYING_REPLACE_MODE" stride="1" length="8" variants="A6XX-A7XX" usage="rp_blit">
 		<doc>Packed array of a6xx_varying_ps_repl_mode</doc>
 		<reg32 offset="0x0" name="MODE"/>
 	</array>
@@ -2024,12 +2123,12 @@ by a particular renderpass/blit.
 	<reg32 offset="0x9210" name="VPC_UNKNOWN_9210" low="0" high="31" variants="A6XX" usage="cmd"/>
 	<reg32 offset="0x9211" name="VPC_UNKNOWN_9211" low="0" high="31" variants="A6XX" usage="cmd"/>
 
-	<array offset="0x9212" name="VPC_VARYING_LM_TRANSFER_CNTL_0" stride="1" length="4" usage="rp_blit">
+	<array offset="0x9212" name="VPC_VARYING_LM_TRANSFER_CNTL" stride="1" length="4" variants="A6XX-A7XX" usage="rp_blit">
 		<!-- one bit per varying component: -->
 		<reg32 offset="0" name="DISABLE"/>
 	</array>
 
-	<reg32 offset="0x9216" name="VPC_SO_MAPPING_WPTR" usage="rp_blit">
+	<bitset name="a6xx_vpc_so_mapping_wptr" inline="yes">
 		<!--
 			Choose which DWORD to write to. There is an array of
 			(4 * 64) DWORD's, dumped in the devcoredump at
@@ -2056,20 +2155,25 @@ by a particular renderpass/blit.
 		<bitfield name="ADDR" low="0" high="7" type="hex"/>
 		<!-- clear all A_EN and B_EN bits for all DWORD's -->
 		<bitfield name="RESET" pos="16" type="boolean"/>
-	</reg32>
-	<!-- special register, write multiple times to load SO program (not readable) -->
-	<reg32 offset="0x9217" name="VPC_SO_MAPPING_PORT" usage="rp_blit">
+	</bitset>
+
+	<reg32 offset="0x9216" name="VPC_SO_MAPPING_WPTR" type="a6xx_vpc_so_mapping_wptr" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_vpc_so_mapping_port" inline="yes">
 		<bitfield name="A_BUF" low="0" high="1" type="uint"/>
 		<bitfield name="A_OFF" low="2" high="10" shr="2" type="uint"/>
 		<bitfield name="A_EN" pos="11" type="boolean"/>
 		<bitfield name="B_BUF" low="12" high="13" type="uint"/>
 		<bitfield name="B_OFF" low="14" high="22" shr="2" type="uint"/>
 		<bitfield name="B_EN" pos="23" type="boolean"/>
-	</reg32>
+	</bitset>
+
+	<!-- special register, write multiple times to load SO program (not readable) -->
+	<reg32 offset="0x9217" name="VPC_SO_MAPPING_PORT" type="a6xx_vpc_so_mapping_port" variants="A6XX-A7XX" usage="rp_blit"/>
 
-	<reg64 offset="0x9218" name="VPC_SO_QUERY_BASE" type="waddress" align="32" usage="cmd"/>
+	<reg64 offset="0x9218" name="VPC_SO_QUERY_BASE" type="waddress" align="32" variants="A6XX-A7XX" usage="cmd"/>
 
-	<array offset="0x921a" name="VPC_SO" stride="7" length="4" usage="cmd">
+	<array offset="0x921a" name="VPC_SO" stride="7" length="4" variants="A6XX-A7XX" usage="cmd">
 		<reg64 offset="0" name="BUFFER_BASE" type="waddress" align="32"/>
 		<reg32 offset="2" name="BUFFER_SIZE" low="2" high="31" shr="2"/>
 		<reg32 offset="3" name="BUFFER_STRIDE" low="0" high="9" shr="2"/>
@@ -2077,12 +2181,13 @@ by a particular renderpass/blit.
 		<reg64 offset="5" name="FLUSH_BASE" type="waddress" align="32"/>
 	</array>
 
-	<reg32 offset="0x9236" name="VPC_REPLACE_MODE_CNTL" usage="cmd">
+	<bitset name="a6xx_vpc_replace_mode_cntl" inline="yes">
 		<bitfield name="INVERT" pos="0" type="boolean"/>
-	</reg32>
-	<!-- 0x9237-0x92ff invalid -->
-	<!-- always 0x0 ? -->
-	<reg32 offset="0x9300" name="VPC_UNKNOWN_9300" low="0" high="2" usage="cmd"/>
+	</bitset>
+
+	<reg32 offset="0x9236" name="VPC_REPLACE_MODE_CNTL" type="a6xx_vpc_replace_mode_cntl" variants="A6XX-A7XX" usage="cmd"/>
+
+	<reg32 offset="0x9300" name="VPC_ROTATION_CNTL" low="0" high="2" variants="A6XX-A7XX" usage="cmd"/>
 
 	<bitset name="a6xx_vpc_xs_cntl" inline="yes">
 		<doc>
@@ -2101,11 +2206,12 @@ by a particular renderpass/blit.
 			</doc>
 		</bitfield>
 	</bitset>
-	<reg32 offset="0x9301" name="VPC_VS_CNTL" type="a6xx_vpc_xs_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9302" name="VPC_GS_CNTL" type="a6xx_vpc_xs_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9303" name="VPC_DS_CNTL" type="a6xx_vpc_xs_cntl" usage="rp_blit"/>
 
-	<reg32 offset="0x9304" name="VPC_PS_CNTL" usage="rp_blit">
+	<reg32 offset="0x9301" name="VPC_VS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9302" name="VPC_GS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9303" name="VPC_DS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_vpc_ps_cntl" inline="yes">
 		<bitfield name="NUMNONPOSVAR" low="0" high="7" type="uint"/>
 		<!-- for fixed-function (i.e. no GS) gl_PrimitiveID in FS -->
 		<bitfield name="PRIMIDLOC" low="8" high="15" type="uint"/>
@@ -2122,9 +2228,11 @@ by a particular renderpass/blit.
 				ViewID through the VS.
 			</doc>
 		</bitfield>
-	</reg32>
+	</bitset>
 
-	<reg32 offset="0x9305" name="VPC_SO_CNTL" usage="rp_blit">
+	<reg32 offset="0x9304" name="VPC_PS_CNTL" type="a6xx_vpc_ps_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_vpc_so_cntl" inline="yes">
 		<!--
 		It's offset by 1, and 0 means "disabled"
 		-->
@@ -2133,22 +2241,28 @@ by a particular renderpass/blit.
 		<bitfield name="BUF2_STREAM" low="6" high="8" type="uint"/>
 		<bitfield name="BUF3_STREAM" low="9" high="11" type="uint"/>
 		<bitfield name="STREAM_ENABLE" low="15" high="18" type="hex"/>
-	</reg32>
-	<reg32 offset="0x9306" name="VPC_SO_OVERRIDE" usage="rp_blit">
+	</bitset>
+
+	<reg32 offset="0x9305" name="VPC_SO_CNTL" type="a6xx_vpc_so_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_so_override" inline="yes">
 		<bitfield name="DISABLE" pos="0" type="boolean"/>
-	</reg32>
-	<reg32 offset="0x9307" name="VPC_PS_RAST_CNTL" variants="A6XX-" usage="rp_blit"> <!-- A702 + A7xx -->
-		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
-	</reg32>
-	<reg32 offset="0x9308" name="VPC_ATTR_BUF_GMEM_SIZE" variants="A7XX-" usage="rp_blit">
-		<bitfield name="SIZE_GMEM" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="0x9309" name="VPC_ATTR_BUF_GMEM_BASE" variants="A7XX-" usage="rp_blit">
-		<bitfield name="BASE_GMEM" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="0x9b09" name="PC_ATTR_BUF_GMEM_SIZE" variants="A7XX-" usage="rp_blit">
-		<bitfield name="SIZE_GMEM" low="0" high="31"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x9306" name="VPC_SO_OVERRIDE" type="a6xx_so_override" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<reg32 offset="0x9807" name="PC_DGEN_SO_OVERRIDE" type="a6xx_so_override" variants="A7XX" usage="rp_blit"/>
+
+	<reg32 offset="0x9307" name="VPC_PS_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<reg32 offset="0x9308" name="VPC_ATTR_BUF_GMEM_SIZE" variants="A7XX" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x9309" name="VPC_ATTR_BUF_GMEM_BASE" variants="A7XX" type="uint" usage="rp_blit"/>
+
+	<reg32 offset="0x9b09" name="PC_ATTR_BUF_GMEM_SIZE" variants="A7XX" type="uint" usage="rp_blit"/>
+
+	<reg32 offset="0x930a" name="VPC_UNKNOWN_930A" variants="A7XX"/>
+
+	<reg32 offset="0x960a" name="VPC_FLATSHADE_MODE_CNTL" variants="A7XX"/>
 
 	<!-- 0x9307-0x95ff invalid -->
 
@@ -2163,52 +2277,62 @@ by a particular renderpass/blit.
 	<!-- TODO: regs from 0x9624-0x963a -->
 	<!-- 0x963b-0x97ff invalid -->
 
-	<reg32 offset="0x9800" name="PC_HS_PARAM_0" low="0" high="5" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x9800" name="PC_HS_PARAM_0" low="0" high="5" type="uint" variants="A6XX-A7XX" usage="rp_blit"/>
 
-	<!-- always 0x0 ? -->
-	<reg32 offset="0x9801" name="PC_HS_PARAM_1" usage="rp_blit">
+	<bitset name="a6xx_pc_hs_param_1" inline="yes">
 		<bitfield name="SIZE" low="0" high="10" type="uint"/>
 		<bitfield name="UNK13" pos="13"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x9801" name="PC_HS_PARAM_1" type="a6xx_pc_hs_param_1" variants="A6XX-A7XX" usage="rp_blit"/>
 
-	<reg32 offset="0x9802" name="PC_DS_PARAM" usage="rp_blit">
+	<bitset name="a6xx_pc_ds_param" inline="yes">
 		<bitfield name="SPACING" low="0" high="1" type="a6xx_tess_spacing"/>
 		<bitfield name="OUTPUT" low="2" high="3" type="a6xx_tess_output"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x9802" name="PC_DS_PARAM" type="a6xx_pc_ds_param" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<reg32 offset="0x9803" name="PC_RESTART_INDEX" low="0" high="31" type="uint" variants="A6XX-A7XX" usage="rp_blit"/>
 
-	<reg32 offset="0x9803" name="PC_RESTART_INDEX" low="0" high="31" type="uint" usage="rp_blit"/>
-	<reg32 offset="0x9804" name="PC_MODE_CNTL" low="0" high="7" usage="rp_blit"/>
+	<reg32 offset="0x9804" name="PC_MODE_CNTL" low="0" high="7" variants="A6XX-A7XX" usage="rp_blit"/>
 
 	<reg32 offset="0x9805" name="PC_POWER_CNTL" low="0" high="2" usage="rp_blit"/>
 
-	<reg32 offset="0x9806" name="PC_PS_CNTL" usage="rp_blit">
+	<bitset name="a6xx_pc_ps_cntl" inline="yes">
 		<bitfield name="PRIMITIVEIDEN" pos="0" type="boolean"/>
-	</reg32>
+	</bitset>
 
-	<!-- New in a6xx gen3+ -->
-	<reg32 offset="0x9808" name="PC_DGEN_SO_CNTL" usage="rp_blit">
+	<reg32 offset="0x9806" name="PC_PS_CNTL" type="a6xx_pc_ps_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+
+	<bitset name="a6xx_pc_dgen_so_cntl" inline="yes">
 		<bitfield name="STREAM_ENABLE" low="15" high="18" type="hex"/>
-	</reg32>
+	</bitset>
+
+	<!-- New in a6xx gen3+ -->
+	<reg32 offset="0x9808" name="PC_DGEN_SO_CNTL" type="a6xx_pc_dgen_so_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
-	<reg32 offset="0x980a" name="PC_DGEN_SU_CONSERVATIVE_RAS_CNTL">
+	<bitset name="a6xx_pc_dgen_su_conservative_ras_cntl" inline="yes">
 		<bitfield name="CONSERVATIVERASEN" pos="0" type="boolean"/>
-	</reg32>
-	<!-- 0x980b-0x983f invalid -->
+	</bitset>
+
+	<reg32 offset="0x980a" name="PC_DGEN_SU_CONSERVATIVE_RAS_CNTL" type="a6xx_pc_dgen_su_conservative_ras_cntl" variants="A6XX-A7XX"/>
 
 	<!-- 0x9840 - 0x9842 are not readable -->
-	<reg32 offset="0x9840" name="PC_DRAW_INITIATOR">
+	<bitset name="a6xx_draw_initiator" inline="yes">
 		<bitfield name="STATE_ID" low="0" high="7"/>
-	</reg32>
+	</bitset>
 
-	<reg32 offset="0x9841" name="PC_KERNEL_INITIATOR">
-		<bitfield name="STATE_ID" low="0" high="7"/>
-	</reg32>
+	<reg32 offset="0x9840" name="PC_DRAW_INITIATOR" type="a6xx_draw_initiator" variants="A6XX-A7XX"/>
+	<reg32 offset="0x9841" name="PC_KERNEL_INITIATOR" type="a6xx_draw_initiator" variants="A6XX-A7XX"/>
 
-	<reg32 offset="0x9842" name="PC_EVENT_INITIATOR">
+	<bitset name="a6xx_event_initiator" inline="yes">
 		<!-- I think only the low bit is actually used? -->
 		<bitfield name="STATE_ID" low="16" high="23"/>
 		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x9842" name="PC_EVENT_INITIATOR" type="a6xx_event_initiator" variants="A6XX-A7XX"/>
 
 	<!--
 		0x9880 written in a lot of places by SQE, same value gets written
@@ -2219,45 +2343,21 @@ by a particular renderpass/blit.
 
 	<!-- 0x9843-0x997f invalid -->
 
-	<reg32 offset="0x9981" name="PC_DGEN_RAST_CNTL" variants="A6XX" usage="rp_blit">
-		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
-	</reg32>
-	<reg32 offset="0x9809" name="PC_DGEN_RAST_CNTL" variants="A7XX-" usage="rp_blit">
-		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
-	</reg32>
-
-	<reg32 offset="0x9980" name="VPC_RAST_STREAM_CNTL" variants="A6XX" usage="rp_blit">
-		<!-- which stream to send to GRAS -->
-		<bitfield name="STREAM" low="0" high="1" type="uint"/>
-		<!-- discard primitives before rasterization -->
-		<bitfield name="DISCARD" pos="2" type="boolean"/>
-	</reg32>
-	<!-- VPC_RAST_STREAM_CNTL -->
-	<reg32 offset="0x9107" name="VPC_RAST_STREAM_CNTL" variants="A7XX-" usage="rp_blit">
-		<!-- which stream to send to GRAS -->
-		<bitfield name="STREAM" low="0" high="1" type="uint"/>
-		<!-- discard primitives before rasterization -->
-		<bitfield name="DISCARD" pos="2" type="boolean"/>
-	</reg32>
-	<reg32 offset="0x9317" name="VPC_RAST_STREAM_CNTL_V2" variants="A7XX-" usage="rp_blit">
-		<!-- which stream to send to GRAS -->
-		<bitfield name="STREAM" low="0" high="1" type="uint"/>
-		<!-- discard primitives before rasterization -->
-		<bitfield name="DISCARD" pos="2" type="boolean"/>
-	</reg32>
+	<reg32 offset="0x9981" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0x9809" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A7XX" usage="rp_blit"/>
 
 	<!-- Both are a750+.
 	     Probably needed to correctly overlap execution of several draws.
 	-->
-	<reg32 offset="0x9885" name="PC_HS_BUFFER_SIZE" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x9885" name="PC_HS_BUFFER_SIZE" variants="A7XX" usage="cmd"/>
 	<!-- Blob adds a bit more space {0x10, 0x20, 0x30, 0x40} bytes, but the meaning of
 	     this additional space is not known.
 	-->
-	<reg32 offset="0x9886" name="PC_TF_BUFFER_SIZE" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x9886" name="PC_TF_BUFFER_SIZE" variants="A7XX" usage="cmd"/>
 
 	<!-- 0x9982-0x9aff invalid -->
 
-	<reg32 offset="0x9b00" name="PC_CNTL" type="a6xx_pc_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9b00" name="PC_CNTL" type="a6xx_pc_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
 	<bitset name="a6xx_pc_xs_cntl" inline="yes">
 		<doc>
@@ -2270,18 +2370,18 @@ by a particular renderpass/blit.
 		<bitfield name="LAYER" pos="9" type="boolean"/>
 		<bitfield name="VIEW" pos="10" type="boolean"/>
 		<!-- note: PC_VS_CNTL doesn't have the PRIMITIVE_ID bit -->
+		<!-- since HS can't output anything, only PRIMITIVE_ID is valid -->
 		<bitfield name="PRIMITIVE_ID" pos="11" type="boolean"/>
 		<bitfield name="CLIP_MASK" low="16" high="23" type="uint"/>
 		<bitfield name="SHADINGRATE" pos="24" type="boolean" variants="A7XX-"/>
 	</bitset>
 
-	<reg32 offset="0x9b01" name="PC_VS_CNTL" type="a6xx_pc_xs_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9b02" name="PC_GS_CNTL" type="a6xx_pc_xs_cntl" usage="rp_blit"/>
-	<!-- since HS can't output anything, only PRIMITIVE_ID is valid -->
-	<reg32 offset="0x9b03" name="PC_HS_CNTL" type="a6xx_pc_xs_cntl" usage="rp_blit"/>
-	<reg32 offset="0x9b04" name="PC_DS_CNTL" type="a6xx_pc_xs_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9b01" name="PC_VS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b02" name="PC_GS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b03" name="PC_HS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b04" name="PC_DS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
-	<reg32 offset="0x9b05" name="PC_GS_PARAM_0" type="a6xx_gs_param_0" usage="rp_blit"/>
+	<reg32 offset="0x9b05" name="PC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A6XX-A7XX" usage="rp_blit"/>
 
 	<reg32 offset="0x9b06" name="PC_PRIMITIVE_CNTL_6" variants="A6XX" usage="rp_blit">
 		<doc>
@@ -2290,9 +2390,9 @@ by a particular renderpass/blit.
 		<bitfield name="STRIDE_IN_VPC" low="0" high="10" type="uint"/>
 	</reg32>
 
-	<reg32 offset="0x9b07" name="PC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9b07" name="PC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<!-- mask of enabled views, doesn't exist on A630 -->
-	<reg32 offset="0x9b08" name="PC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" usage="rp_blit"/>
+	<reg32 offset="0x9b08" name="PC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A6XX-A7XX" usage="rp_blit"/>
 	<!-- 0x9b09-0x9bff invalid -->
 	<reg32 offset="0x9c00" name="PC_2D_EVENT_CMD">
 		<!-- special register (but note first 8 bits can be written/read) -->
@@ -2303,34 +2403,39 @@ by a particular renderpass/blit.
 	<!-- TODO: 0x9e00-0xa000 range incomplete -->
 	<reg32 offset="0x9e00" name="PC_DBG_ECO_CNTL"/>
 	<reg32 offset="0x9e01" name="PC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
-	<reg64 offset="0x9e04" name="PC_DMA_BASE"/>
-	<reg32 offset="0x9e06" name="PC_DMA_OFFSET" type="uint"/>
-	<reg32 offset="0x9e07" name="PC_DMA_SIZE" type="uint"/>
+	<reg64 offset="0x9e04" name="PC_DMA_BASE" type="address" variants="A6XX-A7XX"/>
+	<reg32 offset="0x9e06" name="PC_DMA_OFFSET" type="uint" variants="A6XX-A7XX"/>
+	<reg32 offset="0x9e07" name="PC_DMA_SIZE" type="uint" variants="A6XX-A7XX"/>
+
 	<reg64 offset="0x9e08" name="PC_TESS_BASE" variants="A6XX" type="waddress" align="32" usage="cmd"/>
-	<reg64 offset="0x9810" name="PC_TESS_BASE" variants="A7XX-" type="waddress" align="32" usage="cmd"/>
+	<reg64 offset="0x9810" name="PC_TESS_BASE" variants="A7XX" type="waddress" align="32" usage="cmd"/>
 
-	<reg32 offset="0x9e0b" name="PC_DRAWCALL_CNTL" type="vgt_draw_initiator_a4xx">
+	<reg32 offset="0x9e0b" name="PC_DRAWCALL_CNTL" type="vgt_draw_initiator_a4xx" variants="A6XX-A7XX">
 		<doc>
 			Possibly not really "initiating" the draw but the layout is similar
 			to VGT_DRAW_INITIATOR on older gens
 		</doc>
 	</reg32>
-	<reg32 offset="0x9e0c" name="PC_DRAWCALL_INSTANCE_NUM" type="uint"/>
-	<reg32 offset="0x9e0d" name="PC_DRAWCALL_SIZE" type="uint"/>
+	<reg32 offset="0x9e0c" name="PC_DRAWCALL_INSTANCE_NUM" type="uint" variants="A6XX-A7XX"/>
+	<reg32 offset="0x9e0d" name="PC_DRAWCALL_SIZE" type="uint" variants="A6XX-A7XX"/>
 
 	<!-- These match the contents of CP_SET_BIN_DATA (not written directly) -->
-	<reg32 offset="0x9e11" name="PC_VIS_STREAM_CNTL">
+	<bitset name="a6xx_pc_vis_stream_cntl" inline="yes">
 		<bitfield name="UNK0" low="0" high="15"/>
 		<bitfield name="VSC_SIZE" low="16" high="21" type="uint"/>
 		<bitfield name="VSC_N" low="22" high="26" type="uint"/>
-	</reg32>
-	<reg64 offset="0x9e12" name="PC_PVIS_STREAM_BIN_BASE" type="waddress" align="32"/>
-	<reg64 offset="0x9e14" name="PC_DVIS_STREAM_BIN_BASE" type="waddress" align="32"/>
+	</bitset>
+
+	<reg32 offset="0x9e11" name="PC_VIS_STREAM_CNTL" type="a6xx_pc_vis_stream_cntl" variants="A6XX-A7XX"/>
+	<reg64 offset="0x9e12" name="PC_PVIS_STREAM_BIN_BASE" type="waddress" align="32" variants="A6XX-A7XX"/>
+	<reg64 offset="0x9e14" name="PC_DVIS_STREAM_BIN_BASE" type="waddress" align="32" variants="A6XX-A7XX"/>
 
-	<reg32 offset="0x9e1c" name="PC_DRAWCALL_CNTL_OVERRIDE">
+	<bitset name="a6xx_pc_drawcall_cntl_override" inline="yes">
 		<doc>Written by CP_SET_VISIBILITY_OVERRIDE handler</doc>
 		<bitfield name="OVERRIDE" pos="0" type="boolean"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x9e1c" name="PC_DRAWCALL_CNTL_OVERRIDE" type="a6xx_pc_drawcall_cntl_override" variants="A6XX-A7XX"/>
 
 	<reg32 offset="0x9e24" name="PC_UNKNOWN_9E24" variants="A7XX-" usage="cmd"/>
 
@@ -2936,7 +3041,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xa9b3" name="SP_CS_PROGRAM_COUNTER_OFFSET" type="uint" usage="cmd"/>
 	<reg64 offset="0xa9b4" name="SP_CS_BASE" type="address" align="32" usage="cmd"/>
 	<reg32 offset="0xa9b6" name="SP_CS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="cmd"/>
-	<reg64 offset="0xa9b7" name="SP_CS_PVT_MEM_BASE" align="32" usage="cmd"/>
+	<reg64 offset="0xa9b7" name="SP_CS_PVT_MEM_BASE" type="waddress" align="32" usage="cmd"/>
 	<reg32 offset="0xa9b9" name="SP_CS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="cmd"/>
 	<reg32 offset="0xa9ba" name="SP_CS_TSIZE" low="0" high="7" type="uint" usage="cmd"/>
 	<reg32 offset="0xa9bb" name="SP_CS_CONFIG" type="a6xx_sp_xs_config" usage="cmd"/>
@@ -3021,7 +3126,7 @@ by a particular renderpass/blit.
 	UAV state for compute shader:
 	 -->
 	<reg64 offset="0xa9f2" name="SP_CS_UAV_BASE" type="address" align="16" variants="A6XX"/>
-	<reg64 offset="0xa9f8" name="SP_CS_UAV_BASE" type="address" align="16" variants="A7XX"/>
+	<reg64 offset="0xa9f8" name="SP_CS_UAV_BASE" type="address" align="16" variants="A7XX-"/>
 	<reg32 offset="0xaa00" name="SP_CS_USIZE" low="0" high="6" type="uint"/>
 
 	<!-- Correlated with avgs/uvgs usage in FS -->
@@ -3104,14 +3209,19 @@ by a particular renderpass/blit.
 	instructions VS/HS/DS/GS/FS.  See SP_CS_UAV_BASE_* for compute shaders.
 	 -->
 	<reg64 offset="0xab1a" name="SP_GFX_UAV_BASE" type="address" align="16" usage="cmd"/>
-	<reg32 offset="0xab20" name="SP_GFX_USIZE" low="0" high="6" type="uint" usage="cmd"/>
+	<reg32 offset="0xab20" name="SP_GFX_USIZE" low="0" high="6" type="uint" variants="A6XX-A7XX" usage="cmd"/>
 
-	<reg32 offset="0xab22" name="SP_UNKNOWN_AB22" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xab22" name="SP_UNKNOWN_AB22" variants="A7XX" usage="cmd"/>
+
+	<enum name="a6xx_sp_a2d_output_ifmt_type">
+		<value name="OUTPUT_IFMT_2D_FLOAT" value="0"/>
+		<value name="OUTPUT_IFMT_2D_SINT" value="1"/>
+		<value name="OUTPUT_IFMT_2D_UINT" value="2"/>
+	</enum>
 
 	<bitset name="a6xx_sp_a2d_output_info" inline="yes">
-		<bitfield name="NORM" pos="0" type="boolean"/>
-		<bitfield name="SINT" pos="1" type="boolean"/>
-		<bitfield name="UINT" pos="2" type="boolean"/>
+		<bitfield name="HALF_PRECISION" pos="0" type="boolean"/>
+		<bitfield name="IFMT_TYPE" low="1" high="2" type="a6xx_sp_a2d_output_ifmt_type"/>
 		<!-- looks like HW only cares about the base type of this format,
 		     which matches the ifmt? -->
 		<bitfield name="COLOR_FORMAT" low="3" high="10" type="a6xx_format"/>
@@ -3156,7 +3266,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xae6b" name="SP_UNKNOWN_AE6B" variants="A7XX-" usage="cmd"/>
 	<reg32 offset="0xae6c" name="SP_HLSQ_DBG_ECO_CNTL" variants="A7XX-" usage="cmd"/>
 	<reg32 offset="0xae6d" name="SP_READ_SEL" variants="A7XX-">
-		<bitfield name="LOCATION" low="18" high="19" type="a7xx_state_location"/>
+		<bitfield name="LOCATION" low="18" high="20" type="a7xx_state_location"/>
 		<bitfield name="PIPE" low="16" high="17" type="a7xx_pipe"/>
 		<bitfield name="STATETYPE" low="8" high="15" type="a7xx_statetype_id"/>
 		<bitfield name="USPTP" low="4" high="7"/>
@@ -3192,7 +3302,7 @@ by a particular renderpass/blit.
 
 	<!-- looks to work in the same way as a5xx: -->
 	<reg64 offset="0xb302" name="TPL1_GFX_BORDER_COLOR_BASE" type="address" align="128" usage="cmd"/>
-	<reg32 offset="0xb304" name="TPL1_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" usage="rp_blit"/>
+	<reg32 offset="0xb304" name="TPL1_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0xb305" name="TPL1_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" usage="rp_blit"/>
 	<reg32 offset="0xb306" name="TPL1_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" usage="rp_blit"/>
 	<reg32 offset="0xb307" name="TPL1_WINDOW_OFFSET" type="a6xx_reg_xy" usage="rp_blit"/>
@@ -3232,12 +3342,12 @@ by a particular renderpass/blit.
 	</reg32>
 
 	<reg32 offset="0xb2c0" name="TPL1_A2D_SRC_TEXTURE_INFO" type="a6xx_a2d_src_texture_info" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xb2c1" name="TPL1_A2D_SRC_TEXTURE_SIZE" variants="A7XX">
+	<reg32 offset="0xb2c1" name="TPL1_A2D_SRC_TEXTURE_SIZE" variants="A7XX-">
 		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
 		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
 	</reg32>
 	<reg64 offset="0xb2c2" name="TPL1_A2D_SRC_TEXTURE_BASE" type="address" align="16" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xb2c4" name="TPL1_A2D_SRC_TEXTURE_PITCH" variants="A7XX">
+	<reg32 offset="0xb2c4" name="TPL1_A2D_SRC_TEXTURE_PITCH" variants="A7XX-">
 		<!--
 		Bits from 3..9 must be zero unless 'TPL1_A2D_BLT_CNTL::TYPE'
 		is A6XX_TEX_IMG_BUFFER, which allows for lower alignment.
@@ -3270,13 +3380,13 @@ by a particular renderpass/blit.
 	<reg32 offset="0xb2ce" name="SP_PS_UNKNOWN_B4CE" low="0" high="31" variants="A7XX"/>
 	<reg32 offset="0xb2cf" name="SP_PS_UNKNOWN_B4CF" low="0" high="30" variants="A7XX"/>
 	<reg32 offset="0xb2d0" name="SP_PS_UNKNOWN_B4D0" low="0" high="29" variants="A7XX"/>
-	<reg32 offset="0xb2d1" name="TPL1_A2D_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX"/>
+	<reg32 offset="0xb2d1" name="TPL1_A2D_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX-"/>
 	<reg32 offset="0xb2d2" name="TPL1_A2D_BLT_CNTL" variants="A7XX-" usage="rp_blit">
 		<bitfield name="RAW_COPY" pos="0" type="boolean"/>
 		<bitfield name="START_OFFSET_TEXELS" low="16" high="21"/>
 		<bitfield name="TYPE" low="29" high="31" type="a6xx_tex_type"/>
 	</reg32>
-	<reg32 offset="0xab21" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xab21" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX" usage="rp_blit"/>
 
 	<!-- always 0x100000 or 0x1000000? -->
 	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" low="0" high="25" usage="cmd"/>
@@ -3296,17 +3406,13 @@ by a particular renderpass/blit.
 	</reg32>
 	<reg32 offset="0xb605" name="TPL1_UNKNOWN_B605" low="0" high="7" type="uint" variants="A6XX" usage="cmd"/> <!-- always 0x0 or 0x44 ? -->
 
-	<reg32 offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE_0" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb609" name="TPL1_BICUBIC_WEIGHTS_TABLE_1" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb60a" name="TPL1_BICUBIC_WEIGHTS_TABLE_2" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb60b" name="TPL1_BICUBIC_WEIGHTS_TABLE_3" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb60c" name="TPL1_BICUBIC_WEIGHTS_TABLE_4" low="0" high="29" variants="A6XX"/>
+	<array offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE" stride="1" length="5" variants="A6XX">
+		<reg32 offset="0" name="REG" low="0" high="29"/>
+	</array>
 
-	<reg32 offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE_0" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb609" name="TPL1_BICUBIC_WEIGHTS_TABLE_1" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb60a" name="TPL1_BICUBIC_WEIGHTS_TABLE_2" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb60b" name="TPL1_BICUBIC_WEIGHTS_TABLE_3" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb60c" name="TPL1_BICUBIC_WEIGHTS_TABLE_4" low="0" high="29" variants="A7XX" usage="cmd"/>
+	<array offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE" stride="1" length="5" variants="A7XX">
+		<reg32 offset="0" name="REG" low="0" high="29" usage="cmd"/>
+	</array>
 
 	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="12" variants="A6XX"/>
 	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="18" variants="A7XX"/>
@@ -3638,7 +3744,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xbb10" name="SP_PS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="rp_blit"/>
 	<reg32 offset="0xab03" name="SP_PS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="rp_blit"/>
 
-	<array offset="0xab40" name="SP_SHARED_CONSTANT_GFX_0" stride="1" length="64" variants="A7XX-"/>
+	<array offset="0xab40" name="SP_SHARED_CONSTANT_GFX" stride="1" length="64" variants="A7XX"/>
 
 	<reg32 offset="0xbb11" name="HLSQ_SHARED_CONSTS" variants="A6XX" usage="cmd">
 		<doc>
@@ -3800,7 +3906,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0030" name="CFG_DBGBUS_TRACE_BUF2"/>
 </domain>
 
-<domain name="A7XX_CX_DBGC" width="32">
+<domain name="A7XX_CX_DBGC" width="32" varset="chip">
 	<!-- Bitfields shifted, but otherwise the same: -->
 	<reg32 offset="0x0000" name="CFG_DBGBUS_SEL_A" variants="A7XX-">
 		<bitfield high="7" low="0" name="PING_INDEX"/>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml
index 307d43dda8a2..56cfaff614a4 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml
@@ -9,38 +9,6 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 
 <domain name="A6XX_TEX_SAMP" width="32">
 	<doc>Texture sampler dwords</doc>
-	<enum name="a6xx_tex_filter"> <!-- same as a4xx? -->
-		<value name="A6XX_TEX_NEAREST" value="0"/>
-		<value name="A6XX_TEX_LINEAR" value="1"/>
-		<value name="A6XX_TEX_ANISO" value="2"/>
-		<value name="A6XX_TEX_CUBIC" value="3"/> <!-- a650 only -->
-	</enum>
-	<enum name="a6xx_tex_clamp"> <!-- same as a4xx? -->
-		<value name="A6XX_TEX_REPEAT" value="0"/>
-		<value name="A6XX_TEX_CLAMP_TO_EDGE" value="1"/>
-		<value name="A6XX_TEX_MIRROR_REPEAT" value="2"/>
-		<value name="A6XX_TEX_CLAMP_TO_BORDER" value="3"/>
-		<value name="A6XX_TEX_MIRROR_CLAMP" value="4"/>
-	</enum>
-	<enum name="a6xx_tex_aniso"> <!-- same as a4xx? -->
-		<value name="A6XX_TEX_ANISO_1" value="0"/>
-		<value name="A6XX_TEX_ANISO_2" value="1"/>
-		<value name="A6XX_TEX_ANISO_4" value="2"/>
-		<value name="A6XX_TEX_ANISO_8" value="3"/>
-		<value name="A6XX_TEX_ANISO_16" value="4"/>
-	</enum>
-	<enum name="a6xx_reduction_mode">
-		<value name="A6XX_REDUCTION_MODE_AVERAGE" value="0"/>
-		<value name="A6XX_REDUCTION_MODE_MIN" value="1"/>
-		<value name="A6XX_REDUCTION_MODE_MAX" value="2"/>
-	</enum>
-	<enum name="a6xx_fast_border_color">
-		<!--                           R B G A -->
-		<value name="A6XX_BORDER_COLOR_0_0_0_0" value="0"/>
-		<value name="A6XX_BORDER_COLOR_0_0_0_1" value="1"/>
-		<value name="A6XX_BORDER_COLOR_1_1_1_0" value="2"/>
-		<value name="A6XX_BORDER_COLOR_1_1_1_1" value="3"/>
-	</enum>
 
 	<reg32 offset="0" name="0">
 		<bitfield name="MIPFILTER_LINEAR_NEAR" pos="0" type="boolean"/>
@@ -79,14 +47,6 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 
 <domain name="A6XX_TEX_CONST" width="32" varset="chip">
 	<doc>Texture constant dwords</doc>
-	<enum name="a6xx_tex_swiz"> <!-- same as a4xx? -->
-		<value name="A6XX_TEX_X" value="0"/>
-		<value name="A6XX_TEX_Y" value="1"/>
-		<value name="A6XX_TEX_Z" value="2"/>
-		<value name="A6XX_TEX_W" value="3"/>
-		<value name="A6XX_TEX_ZERO" value="4"/>
-		<value name="A6XX_TEX_ONE" value="5"/>
-	</enum>
 	<reg32 offset="0" name="0">
 		<bitfield name="TILE_MODE" low="0" high="1" type="a6xx_tile_mode"/>
 		<bitfield name="SRGB" pos="2" type="boolean"/>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
index 665539b098c6..4e42f055b85f 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
@@ -320,14 +320,14 @@ to upconvert to 32b float internally?
 16b float:   3
  -->
 <enum name="a6xx_2d_ifmt">
-	<value value="0x10" name="R2D_UNORM8"/>
 	<value value="0x7"  name="R2D_INT32"/>
 	<value value="0x6"  name="R2D_INT16"/>
 	<value value="0x5"  name="R2D_INT8"/>
 	<value value="0x4"  name="R2D_FLOAT32"/>
 	<value value="0x3"  name="R2D_FLOAT16"/>
+	<value value="0x2"  name="R2D_SNORM8"/>
 	<value value="0x1"  name="R2D_UNORM8_SRGB"/>
-	<value value="0x0"  name="R2D_RAW"/>
+	<value value="0x0"  name="R2D_UNORM8"/>
 </enum>
 
 <enum name="a6xx_tex_type">
@@ -380,4 +380,50 @@ to upconvert to 32b float internally?
 	<value value="0x3" name="TESS_CCW_TRIS"/>
 </enum>
 
+<enum name="a6xx_tex_filter"> <!-- same as a4xx? -->
+	<value name="A6XX_TEX_NEAREST" value="0"/>
+	<value name="A6XX_TEX_LINEAR" value="1"/>
+	<value name="A6XX_TEX_ANISO" value="2"/>
+	<value name="A6XX_TEX_CUBIC" value="3"/> <!-- a650 only -->
+</enum>
+
+<enum name="a6xx_tex_clamp"> <!-- same as a4xx? -->
+	<value name="A6XX_TEX_REPEAT" value="0"/>
+	<value name="A6XX_TEX_CLAMP_TO_EDGE" value="1"/>
+	<value name="A6XX_TEX_MIRROR_REPEAT" value="2"/>
+	<value name="A6XX_TEX_CLAMP_TO_BORDER" value="3"/>
+	<value name="A6XX_TEX_MIRROR_CLAMP" value="4"/>
+</enum>
+
+<enum name="a6xx_tex_aniso"> <!-- same as a4xx? -->
+	<value name="A6XX_TEX_ANISO_1" value="0"/>
+	<value name="A6XX_TEX_ANISO_2" value="1"/>
+	<value name="A6XX_TEX_ANISO_4" value="2"/>
+	<value name="A6XX_TEX_ANISO_8" value="3"/>
+	<value name="A6XX_TEX_ANISO_16" value="4"/>
+</enum>
+
+<enum name="a6xx_reduction_mode">
+	<value name="A6XX_REDUCTION_MODE_AVERAGE" value="0"/>
+	<value name="A6XX_REDUCTION_MODE_MIN" value="1"/>
+	<value name="A6XX_REDUCTION_MODE_MAX" value="2"/>
+</enum>
+
+<enum name="a6xx_fast_border_color">
+	<!--                           R B G A -->
+	<value name="A6XX_BORDER_COLOR_0_0_0_0" value="0"/>
+	<value name="A6XX_BORDER_COLOR_0_0_0_1" value="1"/>
+	<value name="A6XX_BORDER_COLOR_1_1_1_0" value="2"/>
+	<value name="A6XX_BORDER_COLOR_1_1_1_1" value="3"/>
+</enum>
+
+<enum name="a6xx_tex_swiz"> <!-- same as a4xx? -->
+	<value name="A6XX_TEX_X" value="0"/>
+	<value name="A6XX_TEX_Y" value="1"/>
+	<value name="A6XX_TEX_Z" value="2"/>
+	<value name="A6XX_TEX_W" value="3"/>
+	<value name="A6XX_TEX_ZERO" value="4"/>
+	<value name="A6XX_TEX_ONE" value="5"/>
+</enum>
+
 </database>
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index 7abc08635495..0e10e1c6d263 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -120,12 +120,12 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<value name="LRZ_FLUSH" value="38" variants="A5XX-"/>
 	<value name="BLIT_OP_FILL_2D" value="39" variants="A5XX-"/>
 	<value name="BLIT_OP_COPY_2D" value="40" variants="A5XX-A6XX"/>
-	<value name="UNK_40" value="40" variants="A7XX"/>
+	<value name="LRZ_CACHE_INVALIDATE" value="40" variants="A7XX"/>
 	<value name="LRZ_Q_CACHE_INVALIDATE" value="41" variants="A7XX"/>
 	<value name="BLIT_OP_SCALE_2D" value="42" variants="A5XX-"/>
 	<value name="CONTEXT_DONE_2D" value="43" variants="A5XX-"/>
-	<value name="UNK_2C" value="44" variants="A5XX-"/>
-	<value name="UNK_2D" value="45" variants="A5XX-"/>
+	<value name="VSC_BINNING_START" value="44" variants="A5XX-"/>
+	<value name="VSC_BINNING_END" value="45" variants="A5XX-"/>
 
 	<!-- a6xx events -->
 	<doc>
@@ -523,7 +523,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<!--
 	Seems to set the mode flags which control which CP_SET_DRAW_STATE
 	packets are executed, based on their ENABLE_MASK values
-	
+
 	CP_SET_MODE w/ payload of 0x1 seems to cause CP_SET_DRAW_STATE
 	packets w/ ENABLE_MASK & 0x6 to execute immediately
 	 -->
@@ -640,8 +640,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<value name="CP_BV_BR_COUNT_OPS" value="0x1b" variants="A7XX-"/>
 	<doc> Clears, adds to local, or adds to global timestamp </doc>
 	<value name="CP_MODIFY_TIMESTAMP" value="0x1c" variants="A7XX-"/>
-	<!-- similar to CP_CONTEXT_REG_BUNCH, but discards first two dwords?? -->
-	<value name="CP_CONTEXT_REG_BUNCH2" value="0x5d" variants="A7XX-"/>
+	<value name="CP_NON_CONTEXT_REG_BUNCH" value="0x5d" variants="A7XX-"/>
 	<doc>
 		Write to a scratch memory that is read by CP_REG_TEST with
 		SOURCE_SCRATCH_MEM set. It's not the same scratch as scratch registers.
@@ -918,12 +917,6 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 
 	<stripe varset="chip" variants="A5XX-">
-		<reg32 offset="4" name="4">
-			<bitfield name="INDX_BASE_LO" low="0" high="31"/>
-		</reg32>
-		<reg32 offset="5" name="5">
-			<bitfield name="INDX_BASE_HI" low="0" high="31"/>
-		</reg32>
 		<reg64 offset="4" name="INDX_BASE" type="address"/>
 		<reg32 offset="6" name="6">
 			<!-- max # of elements in index buffer -->
@@ -1099,8 +1092,10 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 			<bitfield name="BINNING" pos="20" varset="chip" variants="A6XX-" type="boolean"/>
 			<bitfield name="GMEM" pos="21" varset="chip" variants="A6XX-" type="boolean"/>
 			<bitfield name="SYSMEM" pos="22" varset="chip" variants="A6XX-" type="boolean"/>
-			<bitfield name="GROUP_ID" low="24" high="28" type="uint"/>
+			<!-- high bit is 28 until a750: -->
+			<bitfield name="GROUP_ID" low="24" high="29" type="uint"/>
 		</reg32>
+		<reg64 offset="1" name="ADDR" type="address"/>
 		<reg32 offset="1" name="1">
 			<bitfield name="ADDR_LO" low="0" high="31" type="hex"/>
 		</reg32>
@@ -1166,26 +1161,11 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 	<stripe varset="a7xx_abs_mask_mode" variants="NO_ABS_MASK">
 		<!-- BIN_DATA_ADDR -> VSC_PIPE[p].DATA_ADDRESS -->
-		<reg32 offset="1" name="1">
-			<bitfield name="BIN_DATA_ADDR_LO" low="0" high="31" type="hex"/>
-		</reg32>
-		<reg32 offset="2" name="2">
-			<bitfield name="BIN_DATA_ADDR_HI" low="0" high="31" type="hex"/>
-		</reg32>
+		<reg64 offset="1" name="BIN_DATA_ADDR" type="address"/>
 		<!-- BIN_SIZE_ADDRESS -> VSC_SIZE_ADDRESS + (p * 4)-->
-		<reg32 offset="3" name="3">
-			<bitfield name="BIN_SIZE_ADDRESS_LO" low="0" high="31"/>
-		</reg32>
-		<reg32 offset="4" name="4">
-			<bitfield name="BIN_SIZE_ADDRESS_HI" low="0" high="31"/>
-		</reg32>
+		<reg64 offset="3" name="BIN_SIZE_ADDR" type="address"/>
 		<!-- new on a6xx, where BIN_DATA_ADDR is the DRAW_STRM: -->
-		<reg32 offset="5" name="5">
-			<bitfield name="BIN_PRIM_STRM_LO" low="0" high="31"/>
-		</reg32>
-		<reg32 offset="6" name="6">
-			<bitfield name="BIN_PRIM_STRM_HI" low="0" high="31"/>
-		</reg32>
+		<reg64 offset="5" name="BIN_PRIM_STRM" type="address"/>
 		<!--
 			a7xx adds a few more addresses to the end of the pkt
 		 -->
@@ -1195,26 +1175,11 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	<stripe varset="a7xx_abs_mask_mode" variants="ABS_MASK">
 		<reg32 offset="1" name="ABS_MASK"/>
 		<!-- BIN_DATA_ADDR -> VSC_PIPE[p].DATA_ADDRESS -->
-		<reg32 offset="2" name="2">
-			<bitfield name="BIN_DATA_ADDR_LO" low="0" high="31" type="hex"/>
-		</reg32>
-		<reg32 offset="3" name="3">
-			<bitfield name="BIN_DATA_ADDR_HI" low="0" high="31" type="hex"/>
-		</reg32>
+		<reg64 offset="2" name="BIN_DATA_ADDR" type="address"/>
 		<!-- BIN_SIZE_ADDRESS -> VSC_SIZE_ADDRESS + (p * 4)-->
-		<reg32 offset="4" name="4">
-			<bitfield name="BIN_SIZE_ADDRESS_LO" low="0" high="31"/>
-		</reg32>
-		<reg32 offset="5" name="5">
-			<bitfield name="BIN_SIZE_ADDRESS_HI" low="0" high="31"/>
-		</reg32>
+		<reg64 offset="4" name="BIN_SIZE_ADDR" type="address"/>
 		<!-- new on a6xx, where BIN_DATA_ADDR is the DRAW_STRM: -->
-		<reg32 offset="6" name="6">
-			<bitfield name="BIN_PRIM_STRM_LO" low="0" high="31"/>
-		</reg32>
-		<reg32 offset="7" name="7">
-			<bitfield name="BIN_PRIM_STRM_HI" low="0" high="31"/>
-		</reg32>
+		<reg64 offset="6" name="BIN_PRIM_STRM" type="address"/>
 		<!--
 			a7xx adds a few more addresses to the end of the pkt
 		 -->
@@ -1300,7 +1265,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 </domain>
 
-<domain name="CP_REG_TO_MEM" width="32">
+<domain name="CP_REG_TO_MEM" width="32" prefix="chip">
 	<reg32 offset="0" name="0">
 		<bitfield name="REG" low="0" high="17" type="hex"/>
 		<!-- number of registers/dwords copied is max(CNT, 1). -->
@@ -1308,12 +1273,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		<bitfield name="64B" pos="30" type="boolean"/>
 		<bitfield name="ACCUMULATE" pos="31" type="boolean"/>
 	</reg32>
-	<reg32 offset="1" name="1">
-		<bitfield name="DEST" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="2" name="2" varset="chip" variants="A5XX-">
-		<bitfield name="DEST_HI" low="0" high="31"/>
-	</reg32>
+	<stripe varset="chip" variants="A2XX-A4XX">
+		<reg32 offset="1" name="DEST" type="address"/>
+	</stripe>
+	<stripe varset="chip" variants="A5XX-">
+		<reg64 offset="1" name="DEST" type="address"/>
+	</stripe>
 </domain>
 
 <domain name="CP_REG_TO_MEM_OFFSET_REG" width="32">
@@ -1329,12 +1294,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		<bitfield name="64B" pos="30" type="boolean"/>
 		<bitfield name="ACCUMULATE" pos="31" type="boolean"/>
 	</reg32>
-	<reg32 offset="1" name="1">
-		<bitfield name="DEST" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="2" name="2" varset="chip" variants="A5XX-">
-		<bitfield name="DEST_HI" low="0" high="31"/>
-	</reg32>
+	<reg64 offset="1" name="DEST" type="waddress"/>
 	<reg32 offset="3" name="3">
 		<bitfield name="OFFSET0" low="0" high="17" type="hex"/>
 		<bitfield name="OFFSET0_SCRATCH" pos="19" type="boolean"/>
@@ -1354,18 +1314,8 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		<bitfield name="64B" pos="30" type="boolean"/>
 		<bitfield name="ACCUMULATE" pos="31" type="boolean"/>
 	</reg32>
-	<reg32 offset="1" name="1">
-		<bitfield name="DEST" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="2" name="2" varset="chip" variants="A5XX-">
-		<bitfield name="DEST_HI" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="3" name="3">
-		<bitfield name="OFFSET_LO" low="0" high="31" type="hex"/>
-	</reg32>
-	<reg32 offset="4" name="4">
-		<bitfield name="OFFSET_HI" low="0" high="31" type="hex"/>
-	</reg32>
+	<reg64 offset="1" name="DEST" type="waddress"/>
+	<reg64 offset="3" name="OFFSET" type="waddress"/>
 </domain>
 
 <domain name="CP_MEM_TO_REG" width="32">
@@ -1378,12 +1328,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		<!-- does the same thing as CP_MEM_TO_MEM::UNK31 -->
 		<bitfield name="UNK31" pos="31" type="boolean"/>
 	</reg32>
-	<reg32 offset="1" name="1">
-		<bitfield name="SRC" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="2" name="2" varset="chip" variants="A5XX-">
-		<bitfield name="SRC_HI" low="0" high="31"/>
-	</reg32>
+	<stripe varset="chip" variants="A2XX-A4XX">
+		<reg32 offset="1" name="SRC" type="address"/>
+	</stripe>
+	<stripe varset="chip" variants="A5XX-">
+		<reg64 offset="1" name="SRC" type="address"/>
+	</stripe>
 </domain>
 
 <domain name="CP_MEM_TO_MEM" width="32">
@@ -1403,6 +1353,10 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		<!-- some other kind of wait -->
 		<bitfield name="UNK31" pos="31" type="boolean"/>
 	</reg32>
+	<reg64 offset="1" name="DST" type="waddress"/>
+	<reg64 offset="3" name="SRC_A" type="address"/>
+	<reg64 offset="5" name="SRC_B" type="address"/>
+	<reg64 offset="7" name="SRC_C" type="address"/>
 	<!--
 	followed by sequence of addresses.. the first is the
 	destination and the rest are N src addresses which are
@@ -1461,12 +1415,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 </domain>
 
 <domain name="CP_MEM_WRITE" width="32">
-	<reg32 offset="0" name="0">
-		<bitfield name="ADDR_LO" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="1" name="1">
-		<bitfield name="ADDR_HI" low="0" high="31"/>
-	</reg32>
+	<stripe varset="chip" variants="A2XX-A4XX">
+		<reg32 offset="0" name="ADDR" type="address"/>
+	</stripe>
+	<stripe varset="chip" variants="A5XX-">
+		<reg64 offset="0" name="ADDR" type="address"/>
+	</stripe>
 	<!-- followed by the DWORDs to write -->
 </domain>
 
@@ -1518,24 +1472,14 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		<bitfield name="POLL" low="4" high="5" type="poll_memory_type"/>
 		<bitfield name="WRITE_MEMORY" pos="8" type="boolean"/>
 	</reg32>
-	<reg32 offset="1" name="1">
-		<bitfield name="POLL_ADDR_LO" low="0" high="31" type="hex"/>
-	</reg32>
-	<reg32 offset="2" name="2">
-		<bitfield name="POLL_ADDR_HI" low="0" high="31" type="hex"/>
-	</reg32>
+	<reg64 offset="1" name="POLL_ADDR" type="address"/>
 	<reg32 offset="3" name="3">
 		<bitfield name="REF" low="0" high="31"/>
 	</reg32>
 	<reg32 offset="4" name="4">
 		<bitfield name="MASK" low="0" high="31"/>
 	</reg32>
-	<reg32 offset="5" name="5">
-		<bitfield name="WRITE_ADDR_LO" low="0" high="31" type="hex"/>
-	</reg32>
-	<reg32 offset="6" name="6">
-		<bitfield name="WRITE_ADDR_HI" low="0" high="31" type="hex"/>
-	</reg32>
+	<reg64 offset="5" name="WRITE_ADDR" type="waddress"/>
 	<reg32 offset="7" name="7">
 		<bitfield name="WRITE_DATA" low="0" high="31"/>
 	</reg32>
@@ -1550,12 +1494,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		<!-- Reserved for flags, presumably? Unused in FW -->
 		<bitfield name="RESERVED" low="0" high="31" type="hex"/>
 	</reg32>
-	<reg32 offset="1" name="1">
-		<bitfield name="POLL_ADDR_LO" low="0" high="31" type="hex"/>
-	</reg32>
-	<reg32 offset="2" name="2">
-		<bitfield name="POLL_ADDR_HI" low="0" high="31" type="hex"/>
-	</reg32>
+	<reg64 offset="1" name="POLL_ADDR" type="address"/>
 	<reg32 offset="3" name="3">
 		<bitfield name="REF" low="0" high="31"/>
 	</reg32>
@@ -1573,12 +1512,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		<bitfield name="POLL" low="4" high="5" type="poll_memory_type"/>
 		<bitfield name="WRITE_MEMORY" pos="8" type="boolean"/>
 	</reg32>
-	<reg32 offset="1" name="1">
-		<bitfield name="POLL_ADDR_LO" low="0" high="31" type="hex"/>
-	</reg32>
-	<reg32 offset="2" name="2">
-		<bitfield name="POLL_ADDR_HI" low="0" high="31" type="hex"/>
-	</reg32>
+	<reg64 offset="1" name="POLL_ADDR" type="address"/>
 	<reg32 offset="3" name="3">
 		<bitfield name="REF" low="0" high="31"/>
 	</reg32>
@@ -1712,12 +1646,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	TODO what is gpuaddr for, seems to be all 0's.. maybe needed for
 	context switch?
 	 -->
-	<reg32 offset="1" name="1">
-		<bitfield name="ADDR_0_LO" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="2" name="2">
-		<bitfield name="ADDR_0_HI" low="0" high="31"/>
-	</reg32>
+	<reg64 offset="1" name="ADDR" type="waddress"/>
 	<reg32 offset="3" name="3">
 		<!-- ??? -->
 	</reg32>
@@ -1832,9 +1761,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	<reg32 offset="0" name="0">
 	</reg32>
 	<stripe varset="chip" variants="A4XX">
-		<reg32 offset="1" name="1">
-			<bitfield name="ADDR" low="0" high="31"/>
-		</reg32>
+		<reg32 offset="1" name="ADDR" type="address"/>
 		<reg32 offset="2" name="2">
 			<!-- localsize is value minus one: -->
 			<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
@@ -1843,12 +1770,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		</reg32>
 	</stripe>
 	<stripe varset="chip" variants="A5XX-">
-		<reg32 offset="1" name="1">
-			<bitfield name="ADDR_LO" low="0" high="31"/>
-		</reg32>
-		<reg32 offset="2" name="2">
-			<bitfield name="ADDR_HI" low="0" high="31"/>
-		</reg32>
+		<reg64 offset="1" name="ADDR" type="address"/>
 		<reg32 offset="3" name="3">
 			<!-- localsize is value minus one: -->
 			<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
@@ -2161,12 +2083,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 			</doc>
 		</value>
 	</enum>
-	<reg32 offset="0" name="0">
-		<bitfield name="ADDR_LO" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="1" name="1">
-		<bitfield name="ADDR_HI" low="0" high="31"/>
-	</reg32>
+	<reg64 offset="0" name="ADDR" type="address"/>
 	<reg32 offset="2" name="2">
 		<bitfield name="DWORDS" low="0" high="19" type="uint"/>
 		<bitfield name="TYPE" low="20" high="21" type="amble_type"/>
-- 
2.51.0

