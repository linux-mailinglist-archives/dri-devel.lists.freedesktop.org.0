Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58AC6853E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6559E10E464;
	Tue, 18 Nov 2025 08:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX9OV+3q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcDJdqrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FDD10E45C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:39 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI3NTDD375655
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NiwdJ5V4ogCq/DHvQLkyvy8HbVuHSuTsYnvBWvuu40o=; b=CX9OV+3qTwThkspi
 41+VDYMbvqq6sEpqjRkYhn5aEHyfJEQodhQMMZIXjAodpo1nB78vlpCTZjtj5SW6
 eHjXi/WYQZdpqq2xLDKXD7kaj+mRN7RjefqeZhoIC7m7Ec8JELmb9THlqONm5j4e
 mxXzzoBM4+rVIG5g8/GOmbjticyLGVXQ2oWJfLFOesl0cn3U9HdwB1whPbxB82Ny
 kfgd3ukbyLyKG1WWhi0uG7klrmUsL0JKq4Z0K9TUrsA2ePA25PxGdE7EBSyxPBkB
 7VXySQuzqJINlM5KlmrKsIVekRtMs+80SGKaTnxk3ovstseT2365TxYw5sLykV1b
 si1Pfg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njfy4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-295952a4dd6so81304645ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763456018; x=1764060818;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NiwdJ5V4ogCq/DHvQLkyvy8HbVuHSuTsYnvBWvuu40o=;
 b=CcDJdqrD84UyjpKL+OXmWBXHQvW56kQV7Csi6yj9wNNfbTXKCJajfn8aziZKpiDYpg
 hLcwcHcyFKX3JUwC0ULn0Zi3SBO0cCDCVXqj62Cvk7pNnShc0UA2Ads+8vazDSCZamLG
 N8R4JvaBJeWZnTlqbRA78s2Ay3Z2OqYTqy/yB3Rf5L0dGDbLw91sSJM+GVh/zFOMfESO
 vGI//S5JihI6X74Vb8m12hFFoa6t1AUbiDPEyjd9PPNVil52fVTue99GyzrYV2llB12E
 TlSpM/3at2eUF8RrPHDvpHlzihOH88YXIQ34EulEuQ4/9OtMeTNHbDDtFF4Nx6bqv9Zy
 CCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763456018; x=1764060818;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NiwdJ5V4ogCq/DHvQLkyvy8HbVuHSuTsYnvBWvuu40o=;
 b=Kibl8ocZvMVARa0n5hTgdqQLOjvkxL4DbctC7SYMPTwJxb9v5kooWpcecqdOT9+PXR
 XWXDTMgkzcFXxnD1z8Y3+3nZqko1+7HBYw0cz9TFNrfiHU0UsGDnGftoT63z2Hz4WNMH
 qmmwPs8hLQ+/x7sGTtJ9cfuEOkLMWXpeiYmCcLx5nbWyINoe6AfEhuSMfLHTQLfFNEhS
 ApZzRcu9mpnLgLkdXDuI5mx41KsP6rzE4zFXvIk5Jb9728kUb+IiEkW46jfxWg1j4qPL
 KZ6+bi6aRzXUu4gGK09TWIctsoExgi83fnFERCIdRwczW7o4GjvAPKgIEP6599EVy419
 Q4fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIDSSQV2Z5bvj21JSnXmV84KyzH5BZnzort1LndPKZ70m5R54bN663VwLydO1DRK5flHVp0wOkyAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYn0qrY3fxz0JLcUlB8NvDFA0lDxT/gW9AMnxoc1RLgsZg5Ch5
 XN7WSbAc13+dVgFQbtTTTL/m6BK3JYuxZkcXXlslVjm6Hsp0EPV3uEKNz0caB1Aeyl/jUvoIK/t
 8L5JXfPzZcLe+jnss38RgoUrNlgai6JbRhXzrvx0boSJmToYyJJGCFLn8oar4z2FZ0vTqwaY=
X-Gm-Gg: ASbGncsAfa4eCAid+6x/V/9GbzCSsB4qGWfw9IMKTr5skhrVWRJbVIFGAXJ2kUQ96tu
 MYbIk2nPV1ap5mKUcz25rTr3bx5snx8knRUmHkhb7KU74zlINmJFYSHYbW7ocQgqSxrU0XSxPvF
 05ZpbzRxQ8jo25xJg1i0cWJsq+08l2n9fSzTOPeA3+j7RPGO/2ipItO5o1BYiftlJLzpbQJNSdx
 uHvmqZ6jeAfgbfJDI6S1QxWlNfG7z7RDY6le7YFhWoAim/Ij8o8zDa+IhtN8j9SwAksBMThif6G
 hnIddaY2XCNdvbACSflI4mIDE/4UH7E8AVZ3S8zoPX8enYnIf2Asz9dpi1l3YkqwoE5vEqYdXjS
 o0613ABxUlnNcqNKMyhorq44=
X-Received: by 2002:a17:903:181:b0:298:88:c006 with SMTP id
 d9443c01a7336-299f54f427dmr31862075ad.4.1763456017699; 
 Tue, 18 Nov 2025 00:53:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4yjheusxWEGK1j6I2ahdrWYG6vgGy+xcJ0mgWyvE3rEltRWujAgYl2aUuH+HKHgQpTZoJQw==
X-Received: by 2002:a17:903:181:b0:298:88:c006 with SMTP id
 d9443c01a7336-299f54f427dmr31861625ad.4.1763456017115; 
 Tue, 18 Nov 2025 00:53:37 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:53:36 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:45 +0530
Subject: [PATCH v4 18/22] drm/msm/a8xx: Add support for Adreno X2-85 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-18-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=8850;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=US/5Bb4T/7jdnRH8DwZLcwKJwkkGa8K0y+a5nn4OTFw=;
 b=y6Z+S8skgS0m0Af/1e5VQzBbzLt3Z9uhlmnO8Xo9w2GEqypFoUQFTDi2uOf5Evo3mdULLx9dw
 roHVNzEXWg+CMGw620SjfD/P1KviPGMvGPTo0K7VsO4uN7Ex61ddQw0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX6yFyupBe1PBh
 4/OB5TT9zkC8aLXg2n/rd5GjLE4qMEN5hzUpurvclup6kKyybtTJLUr3HXaHgQpr8PpZxlGlXjq
 zgbE9qWzi0o2N0VM9nu6adbUr/mbRAs8CfI+6xsGqdPHxlEPxnFurMmkZdhfb/VlGu354G5R/K6
 3NB8kco/4An0x1p6G3GdLUj/tSIfZngXi41Eaqlm/tm13EYEZokFzj/Di6ljXrppLlylamhPzmW
 nC0Raj+3PwtJ4NH2KcjhLKMN2KdwluXBIUGUjFvnHuhVt2TIA3p+bKTw2Df0BlNvGLAtiskyNLv
 zfztEuC46he6dgYQF1CVFyZMd0Ho2ZXY5cIm3Q5r6SkaQWuje3Tkl5i2tFQ0WRwOyhqI39krZ4x
 2QP845GltBdia6fP5meoh0sFV20/ZQ==
X-Proofpoint-GUID: Wte3lBj5_lIadtj5Fu2PRfnsh0dcQN7z
X-Proofpoint-ORIG-GUID: Wte3lBj5_lIadtj5Fu2PRfnsh0dcQN7z
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c3412 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vUcRZ7zKRWKu6Gx-IyYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
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

Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
on the new A8x slice architecture and features up to 4 slices. Due to
the wider 12 channel DDR support, there is higher DDR bandwidth available
than previous generation to improve performance.

Add a new entry in the catalog along with the necessary register
configurations to enable support for it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 132 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |   3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 ++
 3 files changed, 140 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index e0bb2c334301..29107b362346 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1650,6 +1650,108 @@ static const struct adreno_info a7xx_gpus[] = {
 };
 DECLARE_ADRENO_GPULIST(a7xx);
 
+static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
+	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
+	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
+	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, 0x0fffffff, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
+	/* Disable CS dead batch merge */
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2, BIT(31), BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
+	/* BIT(26): Disable final clamp for bicubic filtering */
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
+	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00000020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ },
+};
+
+static const u32 x285_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
+	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
+	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
+	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
+	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
+	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
+	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
+	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
+	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
+	A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
+	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
+	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
+	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
+	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
+	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
+	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
+	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
+	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
+	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
+	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
+	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
+	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
+	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
+	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
+	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
+	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
+	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
+	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
+	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
+	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
+	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
+	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
+	A6XX_PROTECT_NORDWR(0x27882, 0x000a),
+	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
+};
+
+DECLARE_ADRENO_PROTECT(x285_protect, 64);
+
 static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
 	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -1782,6 +1884,36 @@ static const struct adreno_reglist a840_gbif[] = {
 
 static const struct adreno_info a8xx_gpus[] = {
 	{
+		.chip_ids = ADRENO_CHIP_IDS(0x44070001),
+		.family = ADRENO_8XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
+			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
+		},
+		.gmem = 21 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.funcs = &a8xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &x285_protect,
+			.nonctxt_reglist = x285_nonctxt_regs,
+			.gbif_cx = a840_gbif,
+			.max_slices = 4,
+			.gmu_chipid = 0x8010100,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x44050a01),
 		.family = ADRENO_8XX_GEN2,
 		.fw = {
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 43b886ff576d..30de078e9dfd 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -190,6 +190,9 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 val;
 
+	if (adreno_is_x285(adreno_gpu) && state)
+		gpu_write(gpu, REG_A8XX_RBBM_CGC_0_PC, 0x00000702);
+
 	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
 			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
 	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 7a8cb1ea2a38..0f8d3de97636 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -580,6 +580,11 @@ static inline int adreno_is_a8xx(struct adreno_gpu *gpu)
 	return gpu->info->family >= ADRENO_8XX_GEN1;
 }
 
+static inline int adreno_is_x285(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x44070001;
+}
+
 static inline int adreno_is_a840(struct adreno_gpu *gpu)
 {
 	return gpu->info->chip_ids[0] == 0x44050a01;

-- 
2.51.0

