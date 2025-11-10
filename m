Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12325C49A46
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 23:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1045010E03D;
	Mon, 10 Nov 2025 22:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fwon7ef1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVjs3jFu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BB510E461
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAD0vAP3676815
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t11ssUgDOurcpwhnONJmRHjsqVR89oqVMtmwAK7VpRE=; b=Fwon7ef1rYlH99y3
 ntRd3RzAy8b+VeKyJ9IqsEjRI7U/ealww5uZv2kkgQn7o5wvHAZ0U0MCutE4/pEg
 AyLkqe+pLHDKhE8Ul+tOMjddXXteZ06sjL5fEahOlF+PFKv8iwpQ8CuLas4cyFs7
 7qoff8VdRgsqsaGBSdo8cZDuI6jSPG2N4GkShjr5l7VU0EduJ/pM1VGfdQhB6WKf
 Zt0sBq9Xpjq/Yml7lq1PlRsji1pec53UbOvBi3u7mVUhkXKmcywD5DCEei+JvSkU
 zZuK+mbMW9aljuS2AAynQmo1YOEzQ+ymF+nxMGvObsBfeYs/FTNvB3B3n+G0skrl
 h4Pg3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abgjh8q2h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-340d3b1baafso5796686a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792756; x=1763397556;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t11ssUgDOurcpwhnONJmRHjsqVR89oqVMtmwAK7VpRE=;
 b=hVjs3jFu/j1Fyos6iztflDpTSMwUHJjxgcRGqAi0TuA/me9SDzNQGuppmldvgc8Bmf
 kw1pJ2JR+bDpDIllxzg4emj2YHRzVIhAJXTck9b/9l8gU7N9uQzvR0TDP4edrTb8abtx
 vyuxg4TB0Vaf2bSSPtyAIu5/MbQrUcqoXGTCZdNi9el3ECdIQgWm2+Wk9NdM7Z2j2OA8
 r94zvDmPkM7tcZ+xntJP6dEIFsdyN8utTL37zrA8x3Bxrs0+Ag/s1dQnm86j9ZdAWcyd
 p9sRVgzPo7x8YGc/DwwZAXtHQkuXV4xhJSX9e34v7AkYlejgbhpzegj+q2mS8C093wAp
 P07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792756; x=1763397556;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t11ssUgDOurcpwhnONJmRHjsqVR89oqVMtmwAK7VpRE=;
 b=Vkzd+bha/GZ8CxplQsMg5xOLciMgZg2FAcLwmXVTlGMJ1gtdvt/kCggQywKab5hrnZ
 m+Kvtjo64XvWSEKQW69JNn14qyNOkiwN+czpDVTZ67XcbmC8VSaGsOEZ82+6iEiUkXUX
 Omrar7wSXk3wlQywzefCIqlcF14o6jRbyndEeCZTFcsUGcuR++I4tC9aLU2WiDI/GzjE
 iap/b8ocFA97bb8XGnjEjmynMsY426ctMABOFXtkh/O7VBF1tcfF073FSLi6BiRs5F+G
 pxz/1MXv2udOWQ5ZgJUssIGwiXpy1Wa3TVZnJYLOkQaI6CcXf40bR8Wqys+nxL9Ah63p
 xSSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHWooMm8SOrXn2lFR+ARJrdeRw8LfpbnSQUbQoxgJ3PN0boXtgtOH/8fyB4exQ+T1ndiGkCENRJy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/B++zktYRubvDTKFYJmCif0yANiTuWpdCeM376IS0C+pVTOk0
 kLfFreJxi3QEt2W6uw85Vbe1tFQsv1WqgYL02b/t3H8mjxHcvMLmuQM0hxblgRBSI2KYayf8qfn
 tY5Y8UZAEa/rXkTBejtdgylZY0lxjY/nKuXultnKtOi9JOcxCuyy3Otb1f3wBQTEn9+QNWjQ=
X-Gm-Gg: ASbGnctDjohx9OqBEI7Py2QIvEgsvELdqQ08sSXAOg/36M7165RWCFbQvtGlMZ2puWE
 ifPty2sEkZj6scHyThwhQWtDzIqupZCl3zm7e2wqME7pYgAiEwtO9HQBV66izYY62BfnVrNTga4
 AkD44E1fyatt6/V9us/TGMTDGL4MXVplIpF6bFpJIpqSiYA93N5znk5l4yS9mhX3tPHkiDvCsPk
 J/I+YPQ5Jfn7a8yNvA3DQvJQSYUfNzGG9czqBeujSxP+IXxU2ZcfjMieAdUCC5bFhQKLqL4sSyN
 YAtH34m8mUtVimncevdTN6THvig35JuHHg7ajFd7OrGYyjLMKEyMDlVA4kFWGbuZM4uUwM23C7C
 gaXjjwG9oq2+7eTSsELFFhXI=
X-Received: by 2002:a17:90b:1b12:b0:338:3d07:5174 with SMTP id
 98e67ed59e1d1-3436cb7cfbdmr11255848a91.5.1762792754500; 
 Mon, 10 Nov 2025 08:39:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZKBrr8StgNfkRu5/TABYTlvy6vYpKnywGNne+RgESnRtlrnQm99HoAkL7ygTlAjFxjIST6w==
X-Received: by 2002:a17:90b:1b12:b0:338:3d07:5174 with SMTP id
 98e67ed59e1d1-3436cb7cfbdmr11255763a91.5.1762792753581; 
 Mon, 10 Nov 2025 08:39:13 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:39:13 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:14 +0530
Subject: [PATCH v2 08/21] drm/msm/a6xx: Sync latest register definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-8-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=213778;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=yGngXiCZ8sb1m//TUvvv5uLLdAAW0/QXWIsotOuxvOk=;
 b=4v2BhuOTjniA+soodlRSDb5oAdl9k5m1iFjfJJtVCY9bdfOXzPogNVlhnTAZiRvnh2upQCj4y
 zR+9RL0ikcdB3yRxFTyp3u1pR1NUYUm0WzYBQWtYilv62K4pAbhSxRs
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXyqPv7MgSqOL2
 EBTppPxajfIoOzFKjyzSF55ErM1AwvbWRClfXnx+oC9twKwruAivs7HHt4q5yQ1Zn7WiNjmwTAX
 wbshrFJYozEw/MajwA9UCPBr1Zh3ldCsqU1u2zMoQu/S3+tzGalIi51h9Sg9Zf3IfiH/eMjg0XS
 jaCcj+dkKj1nT3/cUHUBu3kK8R73v6UwOKhem16s8zZ98rl9gazyQhTVYuCThgAcrtDHenYXSrl
 GQScxC6V94HDfbJoUe7FeFN4MFWR0eNqGIOfhEJwpTp+ogPTdLGHEuQuju12MUuzW1MSZr73pIf
 Iq2jL9hrGZnndFnH9HBK431Tev33pEid8B7iLc0/Occ9k/HG2rm2D2aNzydyJiWnrcCIFtC2Oh9
 h7ZHRcUmazc3DEwSBY2j1NmHHNJ+QQ==
X-Proofpoint-GUID: 8ZvsO6PGCksUudZ_4M8eftUxcBLThMBB
X-Proofpoint-ORIG-GUID: 8ZvsO6PGCksUudZ_4M8eftUxcBLThMBB
X-Authority-Analysis: v=2.4 cv=La8xKzfi c=1 sm=1 tr=0 ts=69121534 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=SSmOFEACAAAA:8 a=EUspDBNiAAAA:8
 a=vEUdr9KV3zqUqJRwHYAA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-Mailman-Approved-At: Mon, 10 Nov 2025 22:46:48 +0000
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

Sync the latest register definitions from Mesa which includes the
updates for A8x family.

Co-developed-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile                       |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   16 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |    8 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |    8 +-
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |    8 +-
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |    8 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1947 +++++++++++++++-----
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    2 +-
 .../drm/msm/registers/adreno/a8xx_descriptors.xml  |  120 ++
 .../gpu/drm/msm/registers/adreno/a8xx_enums.xml    |  289 +++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |    1 +
 11 files changed, 1894 insertions(+), 514 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 0c0dfb25f01b..7acf2cc13cd0 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -201,6 +201,7 @@ ADRENO_HEADERS = \
 	generated/a6xx_perfcntrs.xml.h \
 	generated/a7xx_enums.xml.h \
 	generated/a7xx_perfcntrs.xml.h \
+	generated/a8xx_enums.xml.h \
 	generated/a6xx_gmu.xml.h \
 	generated/adreno_common.xml.h \
 	generated/adreno_pm4.xml.h \
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 51d32c66512e..ef2f1f986718 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -381,7 +381,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		rbmemptr_stats(ring, index, alwayson_end));
 
 	/* Write the fence to the scratch register */
-	OUT_PKT4(ring, REG_A6XX_CP_SCRATCH_REG(2), 1);
+	OUT_PKT4(ring, REG_A6XX_CP_SCRATCH(2), 1);
 	OUT_RING(ring, submit->seqno);
 
 	/*
@@ -522,7 +522,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		rbmemptr_stats(ring, index, alwayson_end));
 
 	/* Write the fence to the scratch register */
-	OUT_PKT4(ring, REG_A6XX_CP_SCRATCH_REG(2), 1);
+	OUT_PKT4(ring, REG_A6XX_CP_SCRATCH(2), 1);
 	OUT_RING(ring, submit->seqno);
 
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
@@ -1291,7 +1291,7 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	if (adreno_is_a660_family(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
+		gpu_write(gpu, REG_A7XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
 
 	/* Setting the mem pool size */
 	if (adreno_is_a610(adreno_gpu)) {
@@ -1556,7 +1556,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 		for (i = 0; i < 8; i++)
 			DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
-				gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(i)));
+				gpu_read(gpu, REG_A6XX_CP_SCRATCH(i)));
 
 		if (hang_debug)
 			a6xx_dump(gpu);
@@ -1743,10 +1743,10 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
 	const char *block = "unknown";
 
 	u32 scratch[] = {
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH(4)),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH(5)),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH(6)),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH(7)),
 	};
 
 	if (info)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 4c5fe627d368..688b8ce02fdc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -71,8 +71,8 @@ static const struct a6xx_cluster {
 	u32 sel_val;
 } a6xx_clusters[] = {
 	CLUSTER(CLUSTER_GRAS, a6xx_gras_cluster, 0, 0),
-	CLUSTER(CLUSTER_PS, a6xx_ps_cluster_rac, REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD, 0x0),
-	CLUSTER(CLUSTER_PS, a6xx_ps_cluster_rbp, REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD, 0x9),
+	CLUSTER(CLUSTER_PS, a6xx_ps_cluster_rac, REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_CD, 0x0),
+	CLUSTER(CLUSTER_PS, a6xx_ps_cluster_rbp, REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_CD, 0x9),
 	CLUSTER(CLUSTER_PS, a6xx_ps_cluster, 0, 0),
 	CLUSTER(CLUSTER_FE, a6xx_fe_cluster, 0, 0),
 	CLUSTER(CLUSTER_PC_VS, a6xx_pc_vs_cluster, 0, 0),
@@ -303,8 +303,8 @@ static const u32 a660_registers[] = {
 static const struct a6xx_registers a6xx_reglist[] = {
 	REGS(a6xx_registers, 0, 0),
 	REGS(a660_registers, 0, 0),
-	REGS(a6xx_rb_rac_registers, REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD, 0),
-	REGS(a6xx_rb_rbp_registers, REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD, 9),
+	REGS(a6xx_rb_rac_registers, REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_CD, 0),
+	REGS(a6xx_rb_rbp_registers, REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_CD, 9),
 };
 
 static const u32 a6xx_ahb_registers[] = {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
index 087473679893..d513e03fef08 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
@@ -691,14 +691,14 @@ static const u32 gen7_0_0_tpl1_noncontext_pipe_lpac_registers[] = {
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_lpac_registers), 8));
 
 static const struct gen7_sel_reg  gen7_0_0_rb_rac_sel = {
-	.host_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_HOST,
-	.cd_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD,
+	.host_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_HOST,
+	.cd_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_CD,
 	.val = 0x0,
 };
 
 static const struct gen7_sel_reg gen7_0_0_rb_rbp_sel = {
-	.host_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_HOST,
-	.cd_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD,
+	.host_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_HOST,
+	.cd_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_CD,
 	.val = 0x9,
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
index 9bec75e830a3..7897622ea6f7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
@@ -478,14 +478,14 @@ static const u32 gen7_2_0_sp_noncontext_pipe_lpac_hlsq_state_registers[] = {
 static_assert(IS_ALIGNED(sizeof(gen7_2_0_sp_noncontext_pipe_lpac_hlsq_state_registers), 8));
 
 static const struct gen7_sel_reg  gen7_2_0_rb_rac_sel = {
-	.host_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_HOST,
-	.cd_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD,
+	.host_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_HOST,
+	.cd_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_CD,
 	.val = 0x0,
 };
 
 static const struct gen7_sel_reg gen7_2_0_rb_rbp_sel = {
-	.host_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_HOST,
-	.cd_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD,
+	.host_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_HOST,
+	.cd_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_CD,
 	.val = 0x9,
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
index 70805a5121be..20125d1aa21d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
@@ -1105,14 +1105,14 @@ static const u32 gen7_9_0_tpl1_pipe_lpac_cluster_sp_ps_usptp_registers[] = {
 static_assert(IS_ALIGNED(sizeof(gen7_9_0_tpl1_pipe_lpac_cluster_sp_ps_usptp_registers), 8));
 
 static const struct gen7_sel_reg gen7_9_0_rb_rac_sel = {
-	.host_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_HOST,
-	.cd_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD,
+	.host_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_HOST,
+	.cd_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_CD,
 	.val = 0,
 };
 
 static const struct gen7_sel_reg gen7_9_0_rb_rbp_sel = {
-	.host_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_HOST,
-	.cd_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD,
+	.host_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_HOST,
+	.cd_reg = REG_A6XX_RB_SUB_BLOCK_SEL_CNTL_CD,
 	.val = 0x9,
 };
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 369b96d7f7c9..b4d65f474cb9 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -7,9 +7,11 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 <import file="adreno/adreno_pm4.xml"/>
 <import file="adreno/a6xx_enums.xml"/>
 <import file="adreno/a7xx_enums.xml"/>
+<import file="adreno/a8xx_enums.xml"/>
 <import file="adreno/a6xx_perfcntrs.xml"/>
 <import file="adreno/a7xx_perfcntrs.xml"/>
 <import file="adreno/a6xx_descriptors.xml"/>
+<import file="adreno/a8xx_descriptors.xml"/>
 
 <!--
 Each register that is actually being used by driver should have "usage" defined,
@@ -86,27 +88,124 @@ by a particular renderpass/blit.
 
 	<reg64 offset="0x0800" name="CP_RB_BASE"/>
 	<reg32 offset="0x0802" name="CP_RB_CNTL"/>
+	<reg32 offset="0x0803" name="CP_RB_RPTR_WR" variants="A7XX-"/>
 	<reg64 offset="0x0804" name="CP_RB_RPTR_ADDR"/>
 	<reg32 offset="0x0806" name="CP_RB_RPTR"/>
 	<reg32 offset="0x0807" name="CP_RB_WPTR"/>
-	<reg32 offset="0x0808" name="CP_SQE_CNTL"/>
-	<reg32 offset="0x0812" name="CP_CP2GMU_STATUS">
+	<reg32 offset="0x0808" name="CP_RB_RPTR_ADDR_BV" variants="A8XX-"/>
+	<reg32 offset="0x080a" name="CP_RB_RPTR_BV" variants="A8XX-"/>
+	<reg64 offset="0x080b" name="CP_RB_BASE_LPAC" variants="A8XX-"/>
+	<reg32 offset="0x080d" name="CP_RB_CNTL_LPAC" variants="A8XX-"/>
+	<reg32 offset="0x080e" name="CP_RB_RPTR_WR_LPAC" variants="A8XX-"/>
+	<reg64 offset="0x080f" name="CP_RB_RPTR_ADDR_LPAC" variants="A8XX-"/>
+	<reg32 offset="0x0811" name="CP_RB_RPTR_LPAC" variants="A8XX-"/>
+	<reg32 offset="0x0812" name="CP_RB_WPTR_LPAC" variants="A8XX-"/>
+	<reg32 offset="0x0814" name="CP_SMMU_STREAM_ID_LPAC" variants="A8XX-"/>
+	<reg32 offset="0x0808" name="CP_SQE_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0815" name="CP_SQE_CNTL" variants="A8XX-"/>
+	<reg64 offset="0x0816" name="CP_SQE_INSTR_BASE" variants="A8XX-"/>
+	<reg64 offset="0x0818" name="CP_AQE_INSTR_BASE_0" variants="A8XX-"/>
+	<reg64 offset="0x081a" name="CP_AQE_INSTR_BASE_1" variants="A8XX-"/>
+	<reg32 offset="0x0812" name="CP_CP2GMU_STATUS" variants="A6XX-A7XX">
+		<!-- Note, layout defined by microcode -->
 		<bitfield name="IFPC" pos="0" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x0821" name="CP_HW_FAULT"/>
-	<reg32 offset="0x0823" name="CP_INTERRUPT_STATUS" type="A6XX_CP_INT"/>
-	<reg32 offset="0x0824" name="CP_PROTECT_STATUS"/>
-	<reg32 offset="0x0825" name="CP_STATUS_1"/>
-	<reg64 offset="0x0830" name="CP_SQE_INSTR_BASE"/>
-	<reg32 offset="0x0840" name="CP_MISC_CNTL"/>
-	<reg32 offset="0x0844" name="CP_APRIV_CNTL">
+	<reg32 offset="0x0822" name="CP_CP2GMU_STATUS" variants="A8XX-">
+		<bitfield name="IFPC" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0821" name="CP_HW_FAULT" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0823" name="CP_INTERRUPT_STATUS" type="A6XX_CP_INT" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0824" name="CP_PROTECT_STATUS" variants="A6XX-A7XX"/>
+	<reg32 offset="0x084f" name="CP_PROTECT_STATUS_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x0825" name="CP_STATUS_1" variants="A6XX-A7XX"/>
+
+	<reg32 offset="0x0825" name="CP_SEMAPHORE_REG_0" variants="A8XX-"/>
+	<array offset="0x082a" name="CP_SCRATCH_GLOBAL" stride="1" length="4" variants="A8XX-">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x0830" name="CP_SCRATCH_PIPE" stride="1" length="5" variants="A8XX-">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+
+	<reg32 offset="0x0840" name="CP_RL_ERROR_DETAILS_0" variants="A8XX-"/>
+	<reg32 offset="0x0841" name="CP_RL_ERROR_DETAILS_1" variants="A8XX-"/>
+
+	<reg64 offset="0x0830" name="CP_SQE_INSTR_BASE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0840" name="CP_MISC_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x084c" name="CP_MISC_CNTL" variants="A8XX-"/>
+
+	<reg32 offset="0x08b0" name="CP_SQE_ICACHE_CNTL_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08b1" name="CP_SQE_DCACHE_CNTL_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08b3" name="CP_HW_FAULT_STATUS_PIPE" variants="A8XX-"/>
+
+	<bitset name="A8XX_CP_HW_FAULT_STATUS_MASK_PIPE" inline="no" varset="chip">
+		<bitfield name="CSFRBFAULT" pos="0" type="boolean"/>
+		<bitfield name="CSFIB1FAULT" pos="1" type="boolean"/>
+		<bitfield name="CSFIB2FAULT" pos="2" type="boolean"/>
+		<bitfield name="CSFIB3FAULT" pos="3" type="boolean"/>
+		<bitfield name="CSFSDSFAULT" pos="4" type="boolean"/>
+		<bitfield name="CSFMRBFAULT" pos="5" type="boolean"/>
+		<bitfield name="CSFVSDFAULT" pos="6" type="boolean"/>
+		<bitfield name="SQEREADBURSTOVF" pos="8" type="boolean"/>
+		<bitfield name="EVENTENGINEOVF" pos="9" type="boolean"/>
+		<bitfield name="UCODEERROR" pos="10" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x08b4" name="CP_HW_FAULT_STATUS_MASK_PIPE" type="A8XX_CP_HW_FAULT_STATUS_MASK_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08b5" name="CP_INTERRUPT_STATUS_GLOBAL" variants="A8XX-"/>
+
+	<bitset name="A8XX_CP_GLOBAL_INT_MASK" inline="no" varset="chip">
+		<bitfield name="HWFAULTBR" pos="0" type="boolean"/>
+		<bitfield name="HWFAULTBV" pos="1" type="boolean"/>
+		<bitfield name="HWFAULTLPAC" pos="2" type="boolean"/>
+		<bitfield name="HWFAULTAQE0" pos="3" type="boolean"/>
+		<bitfield name="HWFAULTAQE1" pos="4" type="boolean"/>
+		<bitfield name="HWFAULTDDEBR" pos="5" type="boolean"/>
+		<bitfield name="HWFAULTDDEBV" pos="6" type="boolean"/>
+		<bitfield name="SWFAULTBR" pos="16" type="boolean"/>
+		<bitfield name="SWFAULTBV" pos="17" type="boolean"/>
+		<bitfield name="SWFAULTLPAC" pos="18" type="boolean"/>
+		<bitfield name="SWFAULTAQE0" pos="19" type="boolean"/>
+		<bitfield name="SWFAULTAQE1" pos="20" type="boolean"/>
+		<bitfield name="SWFAULTDDEBR" pos="21" type="boolean"/>
+		<bitfield name="SWFAULTDDEBV" pos="22" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x08b6" name="CP_INTERRUPT_STATUS_MASK_GLOBAL" type="A8XX_CP_GLOBAL_INT_MASK" variants="A8XX-"/>
+	<reg32 offset="0x08b7" name="CP_INTERRUPT_STATUS_PIPE" variants="A8XX-"/>
+
+	<bitset name="A8XX_CP_INTERRUPT_STATUS_MASK_PIPE" inline="no" varset="chip">
+		<bitfield name="CSFRBWRAP" pos="0" type="boolean"/>
+		<bitfield name="CSFIB1WRAP" pos="1" type="boolean"/>
+		<bitfield name="CSFIB2WRAP" pos="2" type="boolean"/>
+		<bitfield name="CSFIB3WRAP" pos="3" type="boolean"/>
+		<bitfield name="CSFSDSWRAP" pos="4" type="boolean"/>
+		<bitfield name="CSFMRBWRAP" pos="5" type="boolean"/>
+		<bitfield name="CSFVSDWRAP" pos="6" type="boolean"/>
+		<bitfield name="OPCODEERROR" pos="8" type="boolean"/>
+		<bitfield name="VSDPARITYERROR" pos="9" type="boolean"/>
+		<bitfield name="REGISTERPROTECTIONERROR" pos="10" type="boolean"/>
+		<bitfield name="ILLEGALINSTRUCTION" pos="11" type="boolean"/>
+		<bitfield name="SMMUFAULT" pos="12" type="boolean"/>
+		<bitfield name="VBIFRESP" pos="22" type="boolean"/>
+		<bitfield name="RTWROVF" pos="23" type="boolean"/>
+		<bitfield name="LRZRTWROVF" pos="24" type="boolean"/>
+		<bitfield name="LRZRTREFCNTOVF" pos="25" type="boolean"/>
+		<bitfield name="LRZRTCLRRESMISS" pos="26" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x08b8" name="CP_INTERRUPT_STATUS_MASK_PIPE" type="A8XX_CP_INTERRUPT_STATUS_MASK_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08b9" name="CP_PIPE_STATUS_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08ba" name="CP_GPU_BATCH_ID_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08bb" name="CP_SQE_STATUS_PIPE" variants="A8XX-"/>
+
+	<bitset name="a6xx_cp_apriv_cntl" inline="yes">
 		<!-- Crashdumper writes -->
 		<bitfield pos="6" name="CDWRITE" type="boolean"/>
 		<!-- Crashdumper reads -->
 		<bitfield pos="5" name="CDREAD" type="boolean"/>
-
-		<!-- 4 is unknown -->
-
+		<!-- CP Scratch reg copy to mem -->
+		<bitfield pos="4" name="SCRATCHWT" type="boolean"/>
 		<!-- RPTR shadow writes -->
 		<bitfield pos="3" name="RBRPWB" type="boolean"/>
 		<!-- Memory accesses from PM4 packets in the ringbuffer -->
@@ -115,11 +214,16 @@ by a particular renderpass/blit.
 		<bitfield pos="1" name="RBFETCH" type="boolean"/>
 		<!-- Instruction cache fetches -->
 		<bitfield pos="0" name="ICACHE" type="boolean"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x0844" name="CP_APRIV_CNTL" type="a6xx_cp_apriv_cntl" variants="A6XX-A7XX"/>
+	<reg32 offset="0x084d" name="CP_APRIV_CNTL_PIPE" type="a6xx_cp_apriv_cntl" variants="A8XX-"/>
+
 	<!-- Preemptions taking longer than this threshold increment PERF_CP_LONG_PREEMPTIONS: -->
-	<reg32 offset="0x08C0" name="CP_PREEMPT_THRESHOLD"/>
+	<reg32 offset="0x08c0" name="CP_PREEMPT_THRESHOLD" variants="A6XX-A7XX"/>
+	<reg32 offset="0x08ec" name="CP_PREEMPT_THRESHOLD" variants="A8XX-"/>
 	<!-- all the threshold values seem to be in units of quad-dwords: -->
-	<reg32 offset="0x08C1" name="CP_ROQ_THRESHOLDS_1">
+	<reg32 offset="0x08c1" name="CP_ROQ_THRESHOLDS_1" variants="A6XX">
 		<doc>
 			b0..7 identifies where MRB data starts (and RB data ends)
 			b8.15 identifies where VSD data starts (and MRB data ends)
@@ -131,7 +235,7 @@ by a particular renderpass/blit.
 		<bitfield name="IB1_START" low="16" high="23" shr="2"/>
 		<bitfield name="IB2_START" low="24" high="31" shr="2"/>
 	</reg32>
-	<reg32 offset="0x08C2" name="CP_ROQ_THRESHOLDS_2">
+	<reg32 offset="0x08c2" name="CP_ROQ_THRESHOLDS_2" variants="A6XX">
 		<doc>
 			low bits identify where CP_SET_DRAW_STATE stateobj
 			processing starts (and IB2 data ends). I'm guessing
@@ -147,176 +251,275 @@ by a particular renderpass/blit.
 		<!-- total ROQ size: -->
 		<bitfield name="ROQ_SIZE" low="16" high="31" shr="2"/>
 	</reg32>
-	<reg32 offset="0x08C3" name="CP_MEM_POOL_SIZE"/>
-	<reg32 offset="0x0841" name="CP_CHICKEN_DBG"/>
-	<reg32 offset="0x0842" name="CP_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
-	<reg32 offset="0x0843" name="CP_DBG_ECO_CNTL"/>
-	<reg32 offset="0x084F" name="CP_PROTECT_CNTL">
+	<reg32 offset="0x08C3" name="CP_MEM_POOL_SIZE" variants="A6XX"/>
+	<reg32 offset="0x0841" name="CP_CHICKEN_DBG" variants="A6XX-A7XX"/>
+	<reg32 offset="0x08b2" name="CP_CHICKEN_DBG_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x0842" name="CP_ADDR_MODE_CNTL" type="a5xx_address_mode" variants="A6XX"/>
+	<reg32 offset="0x0843" name="CP_DBG_ECO_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x084b" name="CP_DBG_ECO_CNTL" variants="A8XX-"/>
+
+	<bitset name="a6xx_cp_protect_cntl" inline="yes">
 		<bitfield pos="3" name="LAST_SPAN_INF_RANGE" type="boolean"/>
 		<bitfield pos="1" name="ACCESS_FAULT_ON_VIOL_EN" type="boolean"/>
 		<bitfield pos="0" name="ACCESS_PROT_EN" type="boolean"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x084f" name="CP_PROTECT_CNTL" type="a6xx_cp_protect_cntl" variants="A6XX-A7XX"/>
 
-	<array offset="0x0883" name="CP_SCRATCH" stride="1" length="8">
+	<bitset name="a8xx_cp_protect_cntl" inline="yes">
+		<bitfield name="HALT_SQE_RANGE" low="16" high="31"/>
+		<bitfield name="LAST_SPAN_INF_RANGE" pos="3" type="boolean"/>
+		<bitfield name="ACCESS_FAULT_ON_VIOL_EN" pos="1" type="boolean"/>
+		<bitfield name="ACCESS_PROT_EN" pos="0" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x084e" name="CP_PROTECT_CNTL_PIPE" type="a8xx_cp_protect_cntl" variants="A8XX-"/>
+
+	<array offset="0x0883" name="CP_SCRATCH" stride="1" length="8" variants="A6XX-A7XX">
 		<reg32 offset="0x0" name="REG" type="uint"/>
 	</array>
-	<array offset="0x0850" name="CP_PROTECT" stride="1" length="32">
+	<array offset="0x0850" name="CP_PROTECT" stride="1" length="32" variants="A6XX-A7XX">
+		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
+	</array>
+	<array offset="0x0850" name="CP_PROTECT_GLOBAL" stride="1" length="64" variants="A8XX-">
+		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
+	</array>
+	<array offset="0x08a0" name="CP_PROTECT_PIPE" stride="1" length="16" variants="A8XX-">
 		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
 	</array>
 
-	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL">
+	<bitset name="a6xx_cp_context_switch_cntl" inline="yes">
 		<bitfield name="STOP" pos="0" type="boolean"/>
 		<bitfield name="LEVEL" low="6" high="7"/>
 		<bitfield name="USES_GMEM" pos="8" type="boolean"/>
 		<bitfield name="SKIP_SAVE_RESTORE" pos="9" type="boolean"/>
-	</reg32>
-	<reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
-	<reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
-	<reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>
-	<reg64 offset="0x08A7" name="CP_CONTEXT_SWITCH_NON_PRIV_RESTORE_ADDR"/>
-	<reg32 offset="0x08ab" name="CP_CONTEXT_SWITCH_LEVEL_STATUS" variants="A7XX-"/>
-	<array offset="0x08D0" name="CP_PERFCTR_CP_SEL" stride="1" length="14"/>
-	<array offset="0x08e0" name="CP_BV_PERFCTR_CP_SEL" stride="1" length="7" variants="A7XX-"/>
-	<reg64 offset="0x0900" name="CP_CRASH_DUMP_SCRIPT_BASE"/>
-	<reg32 offset="0x0902" name="CP_CRASH_DUMP_CNTL"/>
-	<reg32 offset="0x0903" name="CP_CRASH_DUMP_STATUS"/>
-	<reg32 offset="0x0908" name="CP_SQE_STAT_ADDR"/>
-	<reg32 offset="0x0909" name="CP_SQE_STAT_DATA"/>
-	<reg32 offset="0x090A" name="CP_DRAW_STATE_ADDR"/>
-	<reg32 offset="0x090B" name="CP_DRAW_STATE_DATA"/>
-	<reg32 offset="0x090C" name="CP_ROQ_DBG_ADDR"/>
-	<reg32 offset="0x090D" name="CP_ROQ_DBG_DATA"/>
-	<reg32 offset="0x090E" name="CP_MEM_POOL_DBG_ADDR"/>
-	<reg32 offset="0x090F" name="CP_MEM_POOL_DBG_DATA"/>
-	<reg32 offset="0x0910" name="CP_SQE_UCODE_DBG_ADDR"/>
-	<reg32 offset="0x0911" name="CP_SQE_UCODE_DBG_DATA"/>
-	<reg64 offset="0x0928" name="CP_IB1_BASE"/>
-	<reg32 offset="0x092A" name="CP_IB1_REM_SIZE"/>
-	<reg64 offset="0x092B" name="CP_IB2_BASE"/>
-	<reg32 offset="0x092D" name="CP_IB2_REM_SIZE"/>
+	</bitset>
+
+	<reg32 offset="0x08a0" name="CP_CONTEXT_SWITCH_CNTL" type="a6xx_cp_context_switch_cntl" variants="A6XX-A7XX"/>
+	<reg32 offset="0x08c0" name="CP_CONTEXT_SWITCH_CNTL" type="a6xx_cp_context_switch_cntl" variants="A8XX-"/>
+
+	<reg64 offset="0x08a1" name="CP_CONTEXT_SWITCH_SMMU_INFO" variants="A6XX-A7XX"/>
+	<reg64 offset="0x08a3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR" variants="A6XX-A7XX"/>
+	<reg64 offset="0x08a5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR" variants="A6XX-A7XX"/>
+	<reg64 offset="0x08a7" name="CP_CONTEXT_SWITCH_NON_PRIV_RESTORE_ADDR" variants="A6XX-A7XX"/>
+	<reg32 offset="0x08ab" name="CP_CONTEXT_SWITCH_LEVEL_STATUS" variants="A7XX"/>
+
+	<reg64 offset="0x08c1" name="CP_CONTEXT_SWITCH_SMMU_INFO" variants="A8XX-"/>
+	<reg64 offset="0x08c3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR" variants="A8XX-"/>
+	<reg64 offset="0x08c5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR" variants="A8XX-"/>
+	<reg64 offset="0x08c7" name="CP_CONTEXT_SWITCH_NON_PRIV_RESTORE_ADDR" variants="A8XX-"/>
+	<reg32 offset="0x08cb" name="CP_CONTEXT_SWITCH_LEVEL_STATUS" variants="A8XX-"/>
+
+	<array offset="0x08d0" name="CP_PERFCTR_CP_SEL" stride="1" length="14" variants="A6XX-A7XX"/>
+	<array offset="0x08d0" name="CP_PERFCTR_CP_SEL" stride="1" length="21" variants="A8XX-"/>
+	<array offset="0x08e0" name="CP_BV_PERFCTR_CP_SEL" stride="1" length="7" variants="A7XX"/>
+	<reg64 offset="0x0900" name="CP_CRASH_DUMP_SCRIPT_BASE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0902" name="CP_CRASH_DUMP_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0903" name="CP_CRASH_DUMP_STATUS" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0842" name="CP_CRASH_DUMP_SCRIPT_BASE" variants="A8XX-"/>
+	<reg32 offset="0x0844" name="CP_CRASH_DUMP_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x0845" name="CP_CRASH_DUMP_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x0908" name="CP_SQE_STAT_ADDR" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0909" name="CP_SQE_STAT_DATA" variants="A6XX-A7XX"/>
+	<reg32 offset="0x090a" name="CP_DRAW_STATE_ADDR" variants="A6XX-A7XX"/>
+	<reg32 offset="0x090b" name="CP_DRAW_STATE_DATA" variants="A6XX-A7XX"/>
+	<reg32 offset="0x090c" name="CP_ROQ_DBG_ADDR" variants="A6XX-A7XX"/>
+	<reg32 offset="0x090d" name="CP_ROQ_DBG_DATA" variants="A6XX-A7XX"/>
+	<reg32 offset="0x090e" name="CP_MEM_POOL_DBG_ADDR" variants="A6XX-A7XX"/>
+	<reg32 offset="0x090f" name="CP_MEM_POOL_DBG_DATA" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0910" name="CP_SQE_UCODE_DBG_ADDR" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0911" name="CP_SQE_UCODE_DBG_DATA" variants="A6XX-A7XX"/>
+
+	<reg32 offset="0x08f0" name="CP_SQE_STAT_ADDR_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08f1" name="CP_SQE_STAT_DATA_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08f2" name="CP_DRAW_STATE_ADDR_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08f3" name="CP_DRAW_STATE_DATA_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08f4" name="CP_ROQ_DBG_ADDR_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08f5" name="CP_ROQ_DBG_DATA_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08f6" name="CP_MEM_POOL_DBG_ADDR_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08f7" name="CP_MEM_POOL_DBG_DATA_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08f8" name="CP_SQE_UCODE_DBG_ADDR_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08f9" name="CP_SQE_UCODE_DBG_DATA_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08fa" name="CP_RESOURCE_TABLE_DBG_ADDR_BV" variants="A8XX-"/>
+	<reg32 offset="0x08fb" name="CP_RESOURCE_TABLE_DBG_DATA_BV" variants="A8XX-"/>
+	<reg32 offset="0x08fc" name="CP_FIFO_DBG_ADDR_LPAC" variants="A8XX-"/>
+	<reg32 offset="0x08fd" name="CP_FIFO_DBG_DATA_LPAC" variants="A8XX-"/>
+	<reg32 offset="0x08fe" name="CP_FIFO_DBG_ADDR_DDE_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x08ff" name="CP_FIFO_DBG_DATA_DDE_PIPE" variants="A8XX-"/>
+
+	<reg32 offset="0x0b00" name="CP_SLICE_MEM_POOL_DBG_ADDR_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x0b01" name="CP_SLICE_MEM_POOL_DBG_DATA_PIPE" variants="A8XX-"/>
+	<reg32 offset="0x0b93" name="CP_SLICE_CHICKEN_DBG_PIPE" variants="A8XX-"/>
+
+	<reg64 offset="0x0928" name="CP_IB1_BASE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x092a" name="CP_IB1_REM_SIZE" variants="A6XX-A7XX"/>
+	<reg64 offset="0x092b" name="CP_IB2_BASE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x092d" name="CP_IB2_REM_SIZE" variants="A6XX-A7XX"/>
 	<!-- SDS == CP_SET_DRAW_STATE: -->
-	<reg64 offset="0x092e" name="CP_SDS_BASE"/>
-	<reg32 offset="0x0930" name="CP_SDS_REM_SIZE"/>
+	<reg64 offset="0x092e" name="CP_SDS_BASE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0930" name="CP_SDS_REM_SIZE" variants="A6XX-A7XX"/>
 	<!-- MRB == MEM_READ_ADDR/$addr in SQE firmware -->
-	<reg64 offset="0x0931" name="CP_MRB_BASE"/>
-	<reg32 offset="0x0933" name="CP_MRB_REM_SIZE"/>
+	<reg64 offset="0x0931" name="CP_MRB_BASE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0933" name="CP_MRB_REM_SIZE" variants="A6XX-A7XX"/>
 	<!--
 	VSD == Visibility Stream Decode
 	This is used by CP to read the draw stream and skip empty draws
 	-->
-	<reg64 offset="0x0934" name="CP_VSD_BASE"/>
+	<reg64 offset="0x0934" name="CP_VSD_BASE" variants="A6XX-A7XX"/>
+
+	<reg64 offset="0x0900" name="CP_IB1_BASE" variants="A8XX-"/>
+	<reg32 offset="0x0902" name="CP_IB1_REM_SIZE" variants="A8XX-"/>
+	<reg32 offset="0x0903" name="CP_IB1_INIT_SIZE" variants="A8XX-"/>
+	<reg64 offset="0x0904" name="CP_IB2_BASE" variants="A8XX-"/>
+	<reg32 offset="0x0906" name="CP_IB2_REM_SIZE" variants="A8XX-"/>
+	<reg32 offset="0x0907" name="CP_IB2_INIT_SIZE" variants="A8XX-"/>
+	<reg64 offset="0x0908" name="CP_IB3_BASE" variants="A8XX-"/>
+	<reg32 offset="0x090a" name="CP_IB3_REM_SIZE" variants="A8XX-"/>
+	<reg32 offset="0x090b" name="CP_IB3_INIT_SIZE" variants="A8XX-"/>
+	<reg64 offset="0x090c" name="CP_SDS_BASE" variants="A8XX-"/>
+	<reg32 offset="0x090e" name="CP_SDS_REM_SIZE" variants="A8XX-"/>
+	<reg32 offset="0x090f" name="CP_SDS_INIT_SIZE" variants="A8XX-"/>
+	<reg64 offset="0x0910" name="CP_MRB_BASE" variants="A8XX-"/>
+	<reg32 offset="0x0912" name="CP_MRB_REM_SIZE" variants="A8XX-"/>
+	<reg32 offset="0x0913" name="CP_MRB_INIT_SIZE" variants="A8XX-"/>
+	<reg64 offset="0x0914" name="CP_VSD_BASE" variants="A8XX-"/>
+	<reg32 offset="0x0916" name="CP_VSD_REM_SIZE" variants="A8XX-"/>
+	<reg32 offset="0x0917" name="CP_VSD_INIT_SIZE" variants="A8XX-"/>
 
 	<bitset name="a6xx_roq_status" inline="yes">
 		<bitfield name="RPTR" low="0" high="9"/>
 		<bitfield name="WPTR" low="16" high="25"/>
 	</bitset>
-	<reg32 offset="0x0939" name="CP_ROQ_RB_STATUS" type="a6xx_roq_status"/>
-	<reg32 offset="0x093a" name="CP_ROQ_IB1_STATUS" type="a6xx_roq_status"/>
-	<reg32 offset="0x093b" name="CP_ROQ_IB2_STATUS" type="a6xx_roq_status"/>
-	<reg32 offset="0x093c" name="CP_ROQ_SDS_STATUS" type="a6xx_roq_status"/>
-	<reg32 offset="0x093d" name="CP_ROQ_MRB_STATUS" type="a6xx_roq_status"/>
-	<reg32 offset="0x093e" name="CP_ROQ_VSD_STATUS" type="a6xx_roq_status"/>
-
-	<reg32 offset="0x0943" name="CP_IB1_INIT_SIZE"/>
-	<reg32 offset="0x0944" name="CP_IB2_INIT_SIZE"/>
-	<reg32 offset="0x0945" name="CP_SDS_INIT_SIZE"/>
-	<reg32 offset="0x0946" name="CP_MRB_INIT_SIZE"/>
-	<reg32 offset="0x0947" name="CP_VSD_INIT_SIZE"/>
-
-	<reg32 offset="0x0948" name="CP_ROQ_AVAIL_RB">
-		<doc>number of remaining dwords incl current dword being consumed?</doc>
-		<bitfield name="REM" low="16" high="31"/>
-	</reg32>
-	<reg32 offset="0x0949" name="CP_ROQ_AVAIL_IB1">
-		<doc>number of remaining dwords incl current dword being consumed?</doc>
-		<bitfield name="REM" low="16" high="31"/>
-	</reg32>
-	<reg32 offset="0x094a" name="CP_ROQ_AVAIL_IB2">
-		<doc>number of remaining dwords incl current dword being consumed?</doc>
-		<bitfield name="REM" low="16" high="31"/>
-	</reg32>
-	<reg32 offset="0x094b" name="CP_ROQ_AVAIL_SDS">
-		<doc>number of remaining dwords incl current dword being consumed?</doc>
-		<bitfield name="REM" low="16" high="31"/>
-	</reg32>
-	<reg32 offset="0x094c" name="CP_ROQ_AVAIL_MRB">
-		<doc>number of dwords that have already been read but haven't been consumed by $addr</doc>
-		<bitfield name="REM" low="16" high="31"/>
-	</reg32>
-	<reg32 offset="0x094d" name="CP_ROQ_AVAIL_VSD">
+	<reg32 offset="0x0939" name="CP_ROQ_RB_STATUS" type="a6xx_roq_status" variants="A6XX-A7XX"/>
+	<reg32 offset="0x093a" name="CP_ROQ_IB1_STATUS" type="a6xx_roq_status" variants="A6XX-A7XX"/>
+	<reg32 offset="0x093b" name="CP_ROQ_IB2_STATUS" type="a6xx_roq_status" variants="A6XX-A7XX"/>
+	<reg32 offset="0x093c" name="CP_ROQ_SDS_STATUS" type="a6xx_roq_status" variants="A6XX-A7XX"/>
+	<reg32 offset="0x093d" name="CP_ROQ_MRB_STATUS" type="a6xx_roq_status" variants="A6XX-A7XX"/>
+	<reg32 offset="0x093e" name="CP_ROQ_VSD_STATUS" type="a6xx_roq_status" variants="A6XX-A7XX"/>
+
+	<reg32 offset="0x0920" name="CP_ROQ_RB_STATUS" type="a6xx_roq_status" variants="A8XX-"/>
+	<reg32 offset="0x0921" name="CP_ROQ_IB1_STATUS" type="a6xx_roq_status" variants="A8XX-"/>
+	<reg32 offset="0x0922" name="CP_ROQ_IB2_STATUS" type="a6xx_roq_status" variants="A8XX-"/>
+	<reg32 offset="0x0923" name="CP_ROQ_IB3_STATUS" type="a6xx_roq_status" variants="A8XX-"/>
+	<reg32 offset="0x0924" name="CP_ROQ_SDS_STATUS" type="a6xx_roq_status" variants="A8XX-"/>
+	<reg32 offset="0x0925" name="CP_ROQ_MRB_STATUS" type="a6xx_roq_status" variants="A8XX-"/>
+	<reg32 offset="0x0926" name="CP_ROQ_VSD_STATUS" type="a6xx_roq_status" variants="A8XX-"/>
+
+	<reg32 offset="0x0943" name="CP_IB1_INIT_SIZE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0944" name="CP_IB2_INIT_SIZE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0945" name="CP_SDS_INIT_SIZE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0946" name="CP_MRB_INIT_SIZE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0947" name="CP_VSD_INIT_SIZE" variants="A6XX-A7XX"/>
+
+	<bitset name="a6xx_cp_roq_avail" inline="yes">
 		<doc>number of remaining dwords incl current dword being consumed?</doc>
 		<bitfield name="REM" low="16" high="31"/>
-	</reg32>
+	</bitset>
+
+	<reg32 offset="0x0948" name="CP_ROQ_AVAIL_RB" type="a6xx_cp_roq_avail" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0949" name="CP_ROQ_AVAIL_IB1" type="a6xx_cp_roq_avail" variants="A6XX-A7XX"/>
+	<reg32 offset="0x094a" name="CP_ROQ_AVAIL_IB2" type="a6xx_cp_roq_avail" variants="A6XX-A7XX"/>
+	<reg32 offset="0x094b" name="CP_ROQ_AVAIL_SDS" type="a6xx_cp_roq_avail" variants="A6XX-A7XX"/>
+	<reg32 offset="0x094c" name="CP_ROQ_AVAIL_MRB" type="a6xx_cp_roq_avail" variants="A6XX-A7XX"/>
+	<reg32 offset="0x094d" name="CP_ROQ_AVAIL_VSD" type="a6xx_cp_roq_avail" variants="A6XX-A7XX"/>
+
+	<reg32 offset="0x0918" name="CP_ROQ_AVAIL_RB" type="a6xx_cp_roq_avail" variants="A8XX-"/>
+	<reg32 offset="0x0919" name="CP_ROQ_AVAIL_IB1" type="a6xx_cp_roq_avail" variants="A8XX-"/>
+	<reg32 offset="0x091a" name="CP_ROQ_AVAIL_IB2" type="a6xx_cp_roq_avail" variants="A8XX-"/>
+	<reg32 offset="0x091b" name="CP_ROQ_AVAIL_IB3" type="a6xx_cp_roq_avail" variants="A8XX-"/>
+	<reg32 offset="0x091c" name="CP_ROQ_AVAIL_SDS" type="a6xx_cp_roq_avail" variants="A8XX-"/>
+	<reg32 offset="0x091d" name="CP_ROQ_AVAIL_MRB" type="a6xx_cp_roq_avail" variants="A8XX-"/>
+	<reg32 offset="0x091e" name="CP_ROQ_AVAIL_VSD" type="a6xx_cp_roq_avail" variants="A8XX-"/>
 
 	<bitset name="a7xx_aperture_cntl" inline="yes">
 		<bitfield name="PIPE" low="12" high="13" type="adreno_pipe"/>
 		<bitfield name="CLUSTER" low="8" high="10" type="a7xx_cluster"/>
 		<bitfield name="CONTEXT" low="4" high="5"/>
 	</bitset>
-	<reg64 offset="0x0980" name="CP_ALWAYS_ON_COUNTER"/>
-	<reg32 offset="0x098D" name="CP_AHB_CNTL"/>
+	<reg64 offset="0x0980" name="CP_ALWAYS_ON_COUNTER" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0982" name="CP_ALWAYS_ON_CONTEXT" variants="A6XX-A7XX"/>
+	<reg64 offset="0x08e7" name="CP_ALWAYS_ON_COUNTER" variants="A8XX-"/>
+	<reg64 offset="0x08e9" name="CP_ALWAYS_ON_CONTEXT" variants="A8XX-"/>
+	<reg32 offset="0x098d" name="CP_AHB_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0838" name="CP_AHB_CNTL" variants="A8XX-"/>
 	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" variants="A6XX"/>
-	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" type="a7xx_aperture_cntl" variants="A7XX-"/>
+	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" type="a7xx_aperture_cntl" variants="A7XX"/>
 	<reg32 offset="0x0A01" name="CP_APERTURE_CNTL_SQE" variants="A6XX"/>
 	<reg32 offset="0x0A03" name="CP_APERTURE_CNTL_CD" variants="A6XX"/>
-	<reg32 offset="0x0A03" name="CP_APERTURE_CNTL_CD" type="a7xx_aperture_cntl" variants="A7XX-"/>
-
-	<reg32 offset="0x0a61" name="CP_BV_PROTECT_STATUS" variants="A7XX-"/>
-	<reg32 offset="0x0a64" name="CP_BV_HW_FAULT" variants="A7XX-"/>
-	<reg32 offset="0x0a81" name="CP_BV_DRAW_STATE_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0a82" name="CP_BV_DRAW_STATE_DATA" variants="A7XX-"/>
-	<reg32 offset="0x0a83" name="CP_BV_ROQ_DBG_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0a84" name="CP_BV_ROQ_DBG_DATA" variants="A7XX-"/>
-	<reg32 offset="0x0a85" name="CP_BV_SQE_UCODE_DBG_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0a86" name="CP_BV_SQE_UCODE_DBG_DATA" variants="A7XX-"/>
-	<reg32 offset="0x0a87" name="CP_BV_SQE_STAT_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0a88" name="CP_BV_SQE_STAT_DATA" variants="A7XX-"/>
-	<reg32 offset="0x0a96" name="CP_BV_MEM_POOL_DBG_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0a97" name="CP_BV_MEM_POOL_DBG_DATA" variants="A7XX-"/>
-	<reg64 offset="0x0a98" name="CP_BV_RB_RPTR_ADDR" variants="A7XX-"/>
-
-	<reg32 offset="0x0a9a" name="CP_RESOURCE_TABLE_DBG_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0a9b" name="CP_RESOURCE_TABLE_DBG_DATA" variants="A7XX-"/>
-	<reg32 offset="0x0ad0" name="CP_BV_APRIV_CNTL" variants="A7XX-"/>
-	<reg32 offset="0x0ada" name="CP_BV_CHICKEN_DBG" variants="A7XX-"/>
-
-	<reg32 offset="0x0b0a" name="CP_LPAC_DRAW_STATE_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0b0b" name="CP_LPAC_DRAW_STATE_DATA" variants="A7XX-"/>
-	<reg32 offset="0x0b0c" name="CP_LPAC_ROQ_DBG_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0b27" name="CP_SQE_AC_UCODE_DBG_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0b28" name="CP_SQE_AC_UCODE_DBG_DATA" variants="A7XX-"/>
-	<reg32 offset="0x0b29" name="CP_SQE_AC_STAT_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0b2a" name="CP_SQE_AC_STAT_DATA" variants="A7XX-"/>
-
-	<reg32 offset="0x0b31" name="CP_LPAC_APRIV_CNTL" variants="A7XX-"/>
-	<reg32 offset="0x0B34" name="CP_LPAC_PROG_FIFO_SIZE"/>
-	<reg32 offset="0x0b35" name="CP_LPAC_ROQ_DBG_DATA" variants="A7XX-"/>
-	<reg32 offset="0x0b36" name="CP_LPAC_FIFO_DBG_DATA" variants="A7XX-"/>
-	<reg32 offset="0x0b40" name="CP_LPAC_FIFO_DBG_ADDR" variants="A7XX-"/>
-	<reg32 offset="0x0b81" name="CP_LPAC_SQE_CNTL"/>
-	<reg64 offset="0x0b82" name="CP_LPAC_SQE_INSTR_BASE"/>
-
-	<reg64 offset="0x0b70" name="CP_AQE_INSTR_BASE_0" variants="A7XX-"/>
-	<reg64 offset="0x0b72" name="CP_AQE_INSTR_BASE_1" variants="A7XX-"/>
-	<reg32 offset="0x0b78" name="CP_AQE_APRIV_CNTL" variants="A7XX-"/>
-
-	<reg32 offset="0x0ba8" name="CP_AQE_ROQ_DBG_ADDR_0" variants="A7XX-"/>
-	<reg32 offset="0x0ba9" name="CP_AQE_ROQ_DBG_ADDR_1" variants="A7XX-"/>
-	<reg32 offset="0x0bac" name="CP_AQE_ROQ_DBG_DATA_0" variants="A7XX-"/>
-	<reg32 offset="0x0bad" name="CP_AQE_ROQ_DBG_DATA_1" variants="A7XX-"/>
-	<reg32 offset="0x0bb0" name="CP_AQE_UCODE_DBG_ADDR_0" variants="A7XX-"/>
-	<reg32 offset="0x0bb1" name="CP_AQE_UCODE_DBG_ADDR_1" variants="A7XX-"/>
-	<reg32 offset="0x0bb4" name="CP_AQE_UCODE_DBG_DATA_0" variants="A7XX-"/>
-	<reg32 offset="0x0bb5" name="CP_AQE_UCODE_DBG_DATA_1" variants="A7XX-"/>
-	<reg32 offset="0x0bb8" name="CP_AQE_STAT_ADDR_0" variants="A7XX-"/>
-	<reg32 offset="0x0bb9" name="CP_AQE_STAT_ADDR_1" variants="A7XX-"/>
-	<reg32 offset="0x0bbc" name="CP_AQE_STAT_DATA_0" variants="A7XX-"/>
-	<reg32 offset="0x0bbd" name="CP_AQE_STAT_DATA_1" variants="A7XX-"/>
-
-	<reg32 offset="0x0C01" name="VSC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
-	<reg32 offset="0x0018" name="RBBM_GPR0_CNTL"/>
-	<reg32 offset="0x0201" name="RBBM_INT_0_STATUS" type="A6XX_RBBM_INT_0_MASK"/>
-	<reg32 offset="0x0210" name="RBBM_STATUS">
+	<reg32 offset="0x0A03" name="CP_APERTURE_CNTL_CD" type="a7xx_aperture_cntl" variants="A7XX"/>
+
+	<array offset="0x0a9c" name="CP_RESERVED_REG" stride="1" length="4" variants="A7XX"/>
+	<array offset="0x0958" name="CP_RESERVED_REG" stride="1" length="4" variants="A8XX-"/>
+
+	<bitset name="a8xx_aperture_cntl" inline="yes">
+		<bitfield name="CONTEXTID3D" low="4" high="5"/>
+		<bitfield name="CLUSTERID" low="8" high="11"/>
+		<bitfield name="PIPEID" low="12" high="15"/>
+		<bitfield name="SLICEID" low="16" high="18"/>
+		<bitfield name="USESLICEID" pos="23" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x081c" name="CP_APERTURE_CNTL_HOST" type="a8xx_aperture_cntl" variants="A8XX-"/>
+	<reg32 offset="0x081d" name="CP_APERTURE_CNTL_GMU" type="a8xx_aperture_cntl" variants="A8XX-"/>
+	<reg32 offset="0x081e" name="CP_APERTURE_CNTL_CD" type="a8xx_aperture_cntl" variants="A8XX-"/>
+
+	<reg32 offset="0x0a61" name="CP_BV_PROTECT_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0a64" name="CP_BV_HW_FAULT" variants="A7XX"/>
+	<reg32 offset="0x0a81" name="CP_BV_DRAW_STATE_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0a82" name="CP_BV_DRAW_STATE_DATA" variants="A7XX"/>
+	<reg32 offset="0x0a83" name="CP_BV_ROQ_DBG_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0a84" name="CP_BV_ROQ_DBG_DATA" variants="A7XX"/>
+	<reg32 offset="0x0a85" name="CP_BV_SQE_UCODE_DBG_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0a86" name="CP_BV_SQE_UCODE_DBG_DATA" variants="A7XX"/>
+	<reg32 offset="0x0a87" name="CP_BV_SQE_STAT_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0a88" name="CP_BV_SQE_STAT_DATA" variants="A7XX"/>
+	<reg32 offset="0x0a96" name="CP_BV_MEM_POOL_DBG_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0a97" name="CP_BV_MEM_POOL_DBG_DATA" variants="A7XX"/>
+	<reg64 offset="0x0a98" name="CP_BV_RB_RPTR_ADDR" variants="A7XX"/>
+
+	<reg32 offset="0x0a9a" name="CP_RESOURCE_TABLE_DBG_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0a9b" name="CP_RESOURCE_TABLE_DBG_DATA" variants="A7XX"/>
+	<reg32 offset="0x0ad0" name="CP_BV_APRIV_CNTL" variants="A7XX"/>
+	<reg32 offset="0x0ada" name="CP_BV_CHICKEN_DBG" variants="A7XX"/>
+
+	<reg32 offset="0x0b0a" name="CP_LPAC_DRAW_STATE_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0b0b" name="CP_LPAC_DRAW_STATE_DATA" variants="A7XX"/>
+	<reg32 offset="0x0b0c" name="CP_LPAC_ROQ_DBG_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0b27" name="CP_SQE_AC_UCODE_DBG_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0b28" name="CP_SQE_AC_UCODE_DBG_DATA" variants="A7XX"/>
+	<reg32 offset="0x0b29" name="CP_SQE_AC_STAT_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0b2a" name="CP_SQE_AC_STAT_DATA" variants="A7XX"/>
+
+	<reg32 offset="0x0b31" name="CP_LPAC_APRIV_CNTL" variants="A7XX"/>
+	<reg32 offset="0x0b34" name="CP_LPAC_PROG_FIFO_SIZE" variants="A7XX"/>
+	<reg32 offset="0x0b35" name="CP_LPAC_ROQ_DBG_DATA" variants="A7XX"/>
+	<reg32 offset="0x0b36" name="CP_LPAC_FIFO_DBG_DATA" variants="A7XX"/>
+	<reg32 offset="0x0b40" name="CP_LPAC_FIFO_DBG_ADDR" variants="A7XX"/>
+	<reg32 offset="0x0b81" name="CP_LPAC_SQE_CNTL" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0b82" name="CP_LPAC_SQE_INSTR_BASE" variants="A6XX-A7XX"/>
+
+	<reg64 offset="0x0b70" name="CP_AQE_INSTR_BASE_0" variants="A7XX"/>
+	<reg64 offset="0x0b72" name="CP_AQE_INSTR_BASE_1" variants="A7XX"/>
+	<reg32 offset="0x0b78" name="CP_AQE_APRIV_CNTL" variants="A7XX"/>
+
+	<reg32 offset="0x0ba8" name="CP_AQE_ROQ_DBG_ADDR_0" variants="A7XX"/>
+	<reg32 offset="0x0ba9" name="CP_AQE_ROQ_DBG_ADDR_1" variants="A7XX"/>
+	<reg32 offset="0x0bac" name="CP_AQE_ROQ_DBG_DATA_0" variants="A7XX"/>
+	<reg32 offset="0x0bad" name="CP_AQE_ROQ_DBG_DATA_1" variants="A7XX"/>
+	<reg32 offset="0x0bb0" name="CP_AQE_UCODE_DBG_ADDR_0" variants="A7XX"/>
+	<reg32 offset="0x0bb1" name="CP_AQE_UCODE_DBG_ADDR_1" variants="A7XX"/>
+	<reg32 offset="0x0bb4" name="CP_AQE_UCODE_DBG_DATA_0" variants="A7XX"/>
+	<reg32 offset="0x0bb5" name="CP_AQE_UCODE_DBG_DATA_1" variants="A7XX"/>
+	<reg32 offset="0x0bb8" name="CP_AQE_STAT_ADDR_0" variants="A7XX"/>
+	<reg32 offset="0x0bb9" name="CP_AQE_STAT_ADDR_1" variants="A7XX"/>
+	<reg32 offset="0x0bbc" name="CP_AQE_STAT_DATA_0" variants="A7XX"/>
+	<reg32 offset="0x0bbd" name="CP_AQE_STAT_DATA_1" variants="A7XX"/>
+
+	<reg32 offset="0x0C01" name="VSC_ADDR_MODE_CNTL" type="a5xx_address_mode" variants="A6XX"/>
+	<reg32 offset="0x0018" name="RBBM_GPR0_CNTL" variants="A6XX"/>
+	<reg32 offset="0x0201" name="RBBM_INT_0_STATUS" type="A6XX_RBBM_INT_0_MASK" variants="A6XX-A7XX"/>
+	<reg32 offset="0x006a" name="RBBM_INT_0_STATUS" type="A6XX_RBBM_INT_0_MASK" variants="A8XX-"/>
+	<reg32 offset="0x0210" name="RBBM_STATUS" variants="A6XX-A7XX">
 		<bitfield pos="23" name="GPU_BUSY_IGN_AHB" type="boolean"/>
 		<bitfield pos="22" name="GPU_BUSY_IGN_AHB_CP" type="boolean"/>
 		<bitfield pos="21" name="HLSQ_BUSY" type="boolean"/>
@@ -342,22 +545,59 @@ by a particular renderpass/blit.
 		<bitfield pos="1"  name="CP_AHB_BUSY_CP_MASTER" type="boolean"/>
 		<bitfield pos="0"  name="CP_AHB_BUSY_CX_MASTER" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x0211" name="RBBM_STATUS1"/>
-	<reg32 offset="0x0212" name="RBBM_STATUS2"/>
-	<reg32 offset="0x0213" name="RBBM_STATUS3">
+	<reg32 offset="0x0211" name="RBBM_STATUS1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0212" name="RBBM_STATUS2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0213" name="RBBM_STATUS3" variants="A6XX-A7XX">
 		<bitfield pos="24" name="SMMU_STALLED_ON_FAULT" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x0215" name="RBBM_VBIF_GX_RESET_STATUS"/>
 
-	<reg32 offset="0x0260" name="RBBM_CLOCK_MODE_CP" variants="A7XX-"/>
-	<reg32 offset="0x0284" name="RBBM_CLOCK_MODE_BV_LRZ" variants="A7XX-"/>
-	<reg32 offset="0x0285" name="RBBM_CLOCK_MODE_BV_GRAS" variants="A7XX-"/>
-	<reg32 offset="0x0286" name="RBBM_CLOCK_MODE2_GRAS" variants="A7XX-"/>
-	<reg32 offset="0x0287" name="RBBM_CLOCK_MODE_BV_VFD" variants="A7XX-"/>
-	<reg32 offset="0x0288" name="RBBM_CLOCK_MODE_BV_GPC" variants="A7XX-"/>
+	<reg32 offset="0x012" name="RBBM_STATUS" variants="A8XX-">
+		<bitfield pos="23" name="GPU_BUSY_IGN_AHB" type="boolean"/>
+		<bitfield pos="22" name="GPU_BUSY_IGN_AHB_CP" type="boolean"/>
+		<bitfield pos="21" name="SLICE_BUSY_IGN_CP" type="boolean"/>
+		<bitfield pos="20" name="CP_SLICE_BUSY" type="boolean"/>
+		<bitfield pos="19" name="UNSLICE_BUSY_IGN_AHB" type="boolean"/>
+		<bitfield pos="18" name="UNSLICE_BUSY_IGN_AHB_CP" type="boolean"/>
+		<bitfield pos="17" name="CP_SLICE_RL_BUSY" type="boolean"/>
+		<bitfield pos="14" name="UNSLICE_TOP_BUSY" type="boolean"/>
+		<bitfield pos="13" name="UFC_BUSY" type="boolean"/>
+		<bitfield pos="12" name="HLSQ_BUSY" type="boolean"/>
+		<bitfield pos="11" name="VSC_BUSY" type="boolean"/>
+		<bitfield pos="10" name="UCHE_BUSY" type="boolean"/>
+		<bitfield pos="9"  name="VPC_BUSY" type="boolean"/>
+		<bitfield pos="8"  name="PC_BUSY" type="boolean"/>
+		<bitfield pos="7"  name="CMP_BUSY" type="boolean"/>
+		<bitfield pos="6"  name="DCMP_BUSY" type="boolean"/>
+		<bitfield pos="5"  name="VBIF_GX_BUSY" type="boolean"/>
+		<bitfield pos="4"  name="DBGC_PERF_BUSY" type="boolean"/>
+		<bitfield pos="3"  name="GFX_DBGC_BUSY" type="boolean"/>
+		<bitfield pos="2"  name="CP_BUSY" type="boolean"/>
+		<bitfield pos="1"  name="CP_AHB_BUSY_CP_MASTER" type="boolean"/>
+		<bitfield pos="0"  name="CP_AHB_BUSY_CX_MASTER" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x013" name="RBBM_STATUS1" variants="A8XX-"/>
+	<reg32 offset="0x015" name="RBBM_GFX_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x016" name="RBBM_GFX_STATUS1" variants="A8XX-"/>
+	<reg32 offset="0x018" name="RBBM_LPAC_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x01a" name="RBBM_GFX_BR_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x01c" name="RBBM_GFX_BV_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x01e" name="RBBM_MISC_STATUS" variants="A8XX-">
+		<bitfield pos="0" name="SMMU_STALLED_ON_FAULT" type="boolean"/>
+	</reg32>
 
-	<reg32 offset="0x02c0" name="RBBM_SW_FUSE_INT_STATUS" variants="A7XX-"/>
-	<reg32 offset="0x02c1" name="RBBM_SW_FUSE_INT_MASK" variants="A7XX-"/>
+	<reg32 offset="0x0215" name="RBBM_VBIF_GX_RESET_STATUS" variants="A6XX"/>
+
+	<reg32 offset="0x0260" name="RBBM_CLOCK_MODE_CP" variants="A7XX"/>
+	<reg32 offset="0x0284" name="RBBM_CLOCK_MODE_BV_LRZ" variants="A7XX"/>
+	<reg32 offset="0x0285" name="RBBM_CLOCK_MODE_BV_GRAS" variants="A7XX"/>
+	<reg32 offset="0x0286" name="RBBM_CLOCK_MODE2_GRAS" variants="A7XX"/>
+	<reg32 offset="0x0287" name="RBBM_CLOCK_MODE_BV_VFD" variants="A7XX"/>
+	<reg32 offset="0x0288" name="RBBM_CLOCK_MODE_BV_GPC" variants="A7XX"/>
+
+	<reg32 offset="0x02c0" name="RBBM_SW_FUSE_INT_STATUS" variants="A7XX"/>
+	<reg32 offset="0x02c1" name="RBBM_SW_FUSE_INT_MASK" variants="A7XX"/>
+	<reg32 offset="0x0071" name="RBBM_SW_FUSE_INT_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x0072" name="RBBM_SW_FUSE_INT_MASK" variants="A8XX-"/>
 
 	<array offset="0x0400" name="RBBM_PERFCTR_CP" stride="2" length="14" variants="A6XX"/>
 	<array offset="0x041c" name="RBBM_PERFCTR_RBBM" stride="2" length="4" variants="A6XX"/>
@@ -376,49 +616,96 @@ by a particular renderpass/blit.
 	<array offset="0x04ea" name="RBBM_PERFCTR_LRZ" stride="2" length="4" variants="A6XX"/>
 	<array offset="0x04f2" name="RBBM_PERFCTR_CMP" stride="2" length="4" variants="A6XX"/>
 
-	<array offset="0x0300" name="RBBM_PERFCTR_CP" stride="2" length="14" variants="A7XX-"/>
-	<array offset="0x031c" name="RBBM_PERFCTR_RBBM" stride="2" length="4" variants="A7XX-"/>
-	<array offset="0x0324" name="RBBM_PERFCTR_PC" stride="2" length="8" variants="A7XX-"/>
-	<array offset="0x0334" name="RBBM_PERFCTR_VFD" stride="2" length="8" variants="A7XX-"/>
-	<array offset="0x0344" name="RBBM_PERFCTR_HLSQ" stride="2" length="6" variants="A7XX-"/>
-	<array offset="0x0350" name="RBBM_PERFCTR_VPC" stride="2" length="6" variants="A7XX-"/>
-	<array offset="0x035c" name="RBBM_PERFCTR_CCU" stride="2" length="5" variants="A7XX-"/>
-	<array offset="0x0366" name="RBBM_PERFCTR_TSE" stride="2" length="4" variants="A7XX-"/>
-	<array offset="0x036e" name="RBBM_PERFCTR_RAS" stride="2" length="4" variants="A7XX-"/>
-	<array offset="0x0376" name="RBBM_PERFCTR_UCHE" stride="2" length="12" variants="A7XX-"/>
-	<array offset="0x038e" name="RBBM_PERFCTR_TP" stride="2" length="12" variants="A7XX-"/>
-	<array offset="0x03a6" name="RBBM_PERFCTR_SP" stride="2" length="24" variants="A7XX-"/>
-	<array offset="0x03d6" name="RBBM_PERFCTR_RB" stride="2" length="8" variants="A7XX-"/>
-	<array offset="0x03e6" name="RBBM_PERFCTR_VSC" stride="2" length="2" variants="A7XX-"/>
-	<array offset="0x03ea" name="RBBM_PERFCTR_LRZ" stride="2" length="4" variants="A7XX-"/>
-	<array offset="0x03f2" name="RBBM_PERFCTR_CMP" stride="2" length="4" variants="A7XX-"/>
-	<array offset="0x03fa" name="RBBM_PERFCTR_UFC" stride="2" length="4" variants="A7XX-"/>
-	<array offset="0x0410" name="RBBM_PERFCTR2_HLSQ" stride="2" length="6" variants="A7XX-"/>
-	<array offset="0x041c" name="RBBM_PERFCTR2_CP" stride="2" length="7" variants="A7XX-"/>
-	<array offset="0x042a" name="RBBM_PERFCTR2_SP" stride="2" length="12" variants="A7XX-"/>
-	<array offset="0x0442" name="RBBM_PERFCTR2_TP" stride="2" length="6" variants="A7XX-"/>
-	<array offset="0x044e" name="RBBM_PERFCTR2_UFC" stride="2" length="2" variants="A7XX-"/>
-	<array offset="0x0460" name="RBBM_PERFCTR_BV_PC" stride="2" length="8" variants="A7XX-"/>
-	<array offset="0x0470" name="RBBM_PERFCTR_BV_VFD" stride="2" length="8" variants="A7XX-"/>
-	<array offset="0x0480" name="RBBM_PERFCTR_BV_VPC" stride="2" length="6" variants="A7XX-"/>
-	<array offset="0x048c" name="RBBM_PERFCTR_BV_TSE" stride="2" length="4" variants="A7XX-"/>
-	<array offset="0x0494" name="RBBM_PERFCTR_BV_RAS" stride="2" length="4" variants="A7XX-"/>
-	<array offset="0x049c" name="RBBM_PERFCTR_BV_LRZ" stride="2" length="4" variants="A7XX-"/>
-
-	<reg32 offset="0x0500" name="RBBM_PERFCTR_CNTL"/>
-	<reg32 offset="0x0501" name="RBBM_PERFCTR_LOAD_CMD0"/>
-	<reg32 offset="0x0502" name="RBBM_PERFCTR_LOAD_CMD1"/>
-	<reg32 offset="0x0503" name="RBBM_PERFCTR_LOAD_CMD2"/>
-	<reg32 offset="0x0504" name="RBBM_PERFCTR_LOAD_CMD3"/>
-	<reg32 offset="0x0505" name="RBBM_PERFCTR_LOAD_VALUE_LO"/>
-	<reg32 offset="0x0506" name="RBBM_PERFCTR_LOAD_VALUE_HI"/>
-	<array offset="0x0507" name="RBBM_PERFCTR_RBBM_SEL" stride="1" length="4"/>
-	<reg32 offset="0x050B" name="RBBM_PERFCTR_GPU_BUSY_MASKED"/>
-	<reg32 offset="0x050e" name="RBBM_PERFCTR_SRAM_INIT_CMD"/>
-	<reg32 offset="0x050f" name="RBBM_PERFCTR_SRAM_INIT_STATUS"/>
-	<reg32 offset="0x0533" name="RBBM_ISDB_CNT"/>
-	<reg32 offset="0x0534" name="RBBM_NC_MODE_CNTL"/>
-	<reg32 offset="0x0535" name="RBBM_SNAPSHOT_STATUS" variants="A7XX-"/>
+	<array offset="0x0300" name="RBBM_PERFCTR_CP" stride="2" length="14" variants="A7XX"/>
+	<array offset="0x031c" name="RBBM_PERFCTR_RBBM" stride="2" length="4" variants="A7XX"/>
+	<array offset="0x0324" name="RBBM_PERFCTR_PC" stride="2" length="8" variants="A7XX"/>
+	<array offset="0x0334" name="RBBM_PERFCTR_VFD" stride="2" length="8" variants="A7XX"/>
+	<array offset="0x0344" name="RBBM_PERFCTR_HLSQ" stride="2" length="6" variants="A7XX"/>
+	<array offset="0x0350" name="RBBM_PERFCTR_VPC" stride="2" length="6" variants="A7XX"/>
+	<array offset="0x035c" name="RBBM_PERFCTR_CCU" stride="2" length="5" variants="A7XX"/>
+	<array offset="0x0366" name="RBBM_PERFCTR_TSE" stride="2" length="4" variants="A7XX"/>
+	<array offset="0x036e" name="RBBM_PERFCTR_RAS" stride="2" length="4" variants="A7XX"/>
+	<array offset="0x0376" name="RBBM_PERFCTR_UCHE" stride="2" length="12" variants="A7XX"/>
+	<array offset="0x038e" name="RBBM_PERFCTR_TP" stride="2" length="12" variants="A7XX"/>
+	<array offset="0x03a6" name="RBBM_PERFCTR_SP" stride="2" length="24" variants="A7XX"/>
+	<array offset="0x03d6" name="RBBM_PERFCTR_RB" stride="2" length="8" variants="A7XX"/>
+	<array offset="0x03e6" name="RBBM_PERFCTR_VSC" stride="2" length="2" variants="A7XX"/>
+	<array offset="0x03ea" name="RBBM_PERFCTR_LRZ" stride="2" length="4" variants="A7XX"/>
+	<array offset="0x03f2" name="RBBM_PERFCTR_CMP" stride="2" length="4" variants="A7XX"/>
+	<array offset="0x03fa" name="RBBM_PERFCTR_UFC" stride="2" length="4" variants="A7XX"/>
+	<array offset="0x0410" name="RBBM_PERFCTR2_HLSQ" stride="2" length="6" variants="A7XX"/>
+	<array offset="0x041c" name="RBBM_PERFCTR2_CP" stride="2" length="7" variants="A7XX"/>
+	<array offset="0x042a" name="RBBM_PERFCTR2_SP" stride="2" length="12" variants="A7XX"/>
+	<array offset="0x0442" name="RBBM_PERFCTR2_TP" stride="2" length="6" variants="A7XX"/>
+	<array offset="0x044e" name="RBBM_PERFCTR2_UFC" stride="2" length="2" variants="A7XX"/>
+	<array offset="0x0460" name="RBBM_PERFCTR_BV_PC" stride="2" length="8" variants="A7XX"/>
+	<array offset="0x0470" name="RBBM_PERFCTR_BV_VFD" stride="2" length="8" variants="A7XX"/>
+	<array offset="0x0480" name="RBBM_PERFCTR_BV_VPC" stride="2" length="6" variants="A7XX"/>
+	<array offset="0x048c" name="RBBM_PERFCTR_BV_TSE" stride="2" length="4" variants="A7XX"/>
+	<array offset="0x0494" name="RBBM_PERFCTR_BV_RAS" stride="2" length="4" variants="A7XX"/>
+	<array offset="0x049c" name="RBBM_PERFCTR_BV_LRZ" stride="2" length="4" variants="A7XX"/>
+
+	<array offset="0x01b0" name="RBBM_PERFCTR_CP" stride="2" length="14" variants="A8XX"/>
+	<array offset="0x01cc" name="RBBM_PERFCTR_RBBM" stride="2" length="4" variants="A8XX"/>
+	<array offset="0x01d4" name="RBBM_PERFCTR_PC" stride="2" length="8" variants="A8XX"/>
+	<array offset="0x01e4" name="RBBM_PERFCTR_VFD" stride="2" length="8" variants="A8XX"/>
+	<array offset="0x01f4" name="RBBM_PERFCTR_HLSQ" stride="2" length="6" variants="A8XX"/>
+	<array offset="0x0200" name="RBBM_PERFCTR_VPC" stride="2" length="6" variants="A8XX"/>
+	<array offset="0x020c" name="RBBM_PERFCTR_CCU" stride="2" length="5" variants="A8XX"/>
+	<array offset="0x0216" name="RBBM_PERFCTR_TSE" stride="2" length="4" variants="A8XX"/>
+	<array offset="0x021e" name="RBBM_PERFCTR_RAS" stride="2" length="4" variants="A8XX"/>
+	<array offset="0x0226" name="RBBM_PERFCTR_UCHE" stride="2" length="24" variants="A8XX"/>
+	<array offset="0x0256" name="RBBM_PERFCTR_TP" stride="2" length="12" variants="A8XX"/>
+	<array offset="0x026e" name="RBBM_PERFCTR_SP" stride="2" length="24" variants="A8XX"/>
+	<array offset="0x029e" name="RBBM_PERFCTR_RB" stride="2" length="8" variants="A8XX"/>
+	<array offset="0x02ae" name="RBBM_PERFCTR_VSC" stride="2" length="2" variants="A8XX"/>
+	<array offset="0x02b2" name="RBBM_PERFCTR_LRZ" stride="2" length="4" variants="A8XX"/>
+	<array offset="0x02ba" name="RBBM_PERFCTR_CMP" stride="2" length="4" variants="A8XX"/>
+	<array offset="0x02c2" name="RBBM_PERFCTR_UFC" stride="2" length="4" variants="A8XX"/>
+	<array offset="0x02e2" name="RBBM_PERFCTR2_HLSQ" stride="2" length="6" variants="A8XX"/>
+	<array offset="0x02ee" name="RBBM_PERFCTR2_CP" stride="2" length="7" variants="A8XX"/>
+	<array offset="0x02fc" name="RBBM_PERFCTR2_SP" stride="2" length="12" variants="A8XX"/>
+	<array offset="0x0314" name="RBBM_PERFCTR2_TP" stride="2" length="8" variants="A8XX"/>
+	<array offset="0x0324" name="RBBM_PERFCTR2_UFC" stride="2" length="2" variants="A8XX"/>
+	<array offset="0x0328" name="RBBM_PERFCTR_BV_PC" stride="2" length="8" variants="A8XX"/>
+	<array offset="0x0338" name="RBBM_PERFCTR_BV_VFD" stride="2" length="8" variants="A8XX"/>
+	<array offset="0x0348" name="RBBM_PERFCTR_BV_VPC" stride="2" length="6" variants="A8XX"/>
+	<array offset="0x0354" name="RBBM_PERFCTR_BV_TSE" stride="2" length="4" variants="A8XX"/>
+	<array offset="0x035c" name="RBBM_PERFCTR_BV_RAS" stride="2" length="4" variants="A8XX"/>
+	<array offset="0x0364" name="RBBM_PERFCTR_BV_LRZ" stride="2" length="4" variants="A8XX"/>
+	<array offset="0x036c" name="RBBM_PERFCTR_BV_CCU" stride="2" length="3" variants="A8XX"/>
+	<array offset="0x0372" name="RBBM_PERFCTR_BV_RB" stride="2" length="6" variants="A8XX"/>
+
+	<reg32 offset="0x0500" name="RBBM_PERFCTR_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0460" name="RBBM_PERFCTR_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x0501" name="RBBM_PERFCTR_LOAD_CMD0" variants="A6XX"/>
+	<reg32 offset="0x0502" name="RBBM_PERFCTR_LOAD_CMD1" variants="A6XX"/>
+	<reg32 offset="0x0503" name="RBBM_PERFCTR_LOAD_CMD2" variants="A6XX"/>
+	<reg32 offset="0x0504" name="RBBM_PERFCTR_LOAD_CMD3" variants="A6XX"/>
+	<reg64 offset="0x0505" name="RBBM_PERFCTR_LOAD_VALUE" variants="A6XX"/>
+	<array offset="0x0507" name="RBBM_PERFCTR_RBBM_SEL" stride="1" length="4" variants="A6XX-A7XX"/>
+	<array offset="0x0441" name="RBBM_PERFCTR_RBBM_SEL" stride="1" length="4" variants="A8XX-"/>
+	<reg32 offset="0x050B" name="RBBM_PERFCTR_GPU_BUSY_MASKED" variants="A6XX-A7XX"/>
+	<reg32 offset="0x019e" name="RBBM_PERFCTR_GPU_BUSY_MASKED" variants="A8XX-"/>
+	<reg32 offset="0x050e" name="RBBM_PERFCTR_SRAM_INIT_CMD" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0449" name="RBBM_PERFCTR_SRAM_INIT_CMD" variants="A8XX-"/>
+	<reg32 offset="0x050f" name="RBBM_PERFCTR_SRAM_INIT_STATUS" variants="A6XX-A7XX"/>
+	<reg32 offset="0x019f" name="RBBM_PERFCTR_SRAM_INIT_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x01a1" name="RBBM_PERFCTR_FLUSH_HOST_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x044c" name="RBBM_PERFCTR_FLUSH_HOST_CMD" variants="A8XX-"/>
+	<reg32 offset="0x0533" name="RBBM_ISDB_CNT" variants="A6XX-A7XX"/>
+	<reg32 offset="0x002d" name="RBBM_ISDB_CNT" variants="A8XX-"/>
+	<reg32 offset="0x0534" name="RBBM_NC_MODE_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0440" name="RBBM_NC_MODE_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x0535" name="RBBM_SNAPSHOT_STATUS" variants="A7XX"/>
+	<reg32 offset="0x002e" name="RBBM_SNAPSHOT_STATUS" variants="A8XX-"/>
+
+	<reg32 offset="0x500" name="RBBM_SLICE_PERFCTR_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x58f" name="RBBM_SLICE_INTERFACE_HANG_INT_CNTL" variants="A8XX-"/>
+	<array offset="0x5e0" name="RBBM_SLICE_PERFCTR_RBBM_SEL" stride="1" length="4" variants="A8XX-"/>
+	<reg32 offset="0x5e8" name="RBBM_SLICE_PERFCTR_SRAM_INIT_CMD" variants="A8XX-"/>
+	<reg32 offset="0x5eb" name="RBBM_SLICE_PERFCTR_FLUSH_HOST_CMD" variants="A8XX-"/>
+	<reg32 offset="0x5ec" name="RBBM_SLICE_NC_MODE_CNTL" variants="A8XX-"/>
 
 	<!---
 	    This block of registers aren't tied to perf counters. They
@@ -426,170 +713,211 @@ by a particular renderpass/blit.
 	    vertices in, number of primnitives assembled etc.
 	-->
 
-	<reg64 offset="0x0540" name="RBBM_PIPESTAT_IAVERTICES"/>
-	<reg64 offset="0x0542" name="RBBM_PIPESTAT_IAPRIMITIVES"/>
-	<reg64 offset="0x0544" name="RBBM_PIPESTAT_VSINVOCATIONS"/>
-	<reg64 offset="0x0546" name="RBBM_PIPESTAT_HSINVOCATIONS"/>
-	<reg64 offset="0x0548" name="RBBM_PIPESTAT_DSINVOCATIONS"/>
-	<reg64 offset="0x054a" name="RBBM_PIPESTAT_GSINVOCATIONS"/>
-	<reg64 offset="0x054c" name="RBBM_PIPESTAT_GSPRIMITIVES"/>
-	<reg64 offset="0x054e" name="RBBM_PIPESTAT_CINVOCATIONS"/>
-	<reg64 offset="0x0550" name="RBBM_PIPESTAT_CPRIMITIVES"/>
-	<reg64 offset="0x0552" name="RBBM_PIPESTAT_PSINVOCATIONS"/>
-	<reg64 offset="0x0554" name="RBBM_PIPESTAT_CSINVOCATIONS"/>
+	<reg64 offset="0x0540" name="RBBM_PIPESTAT_IAVERTICES" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0542" name="RBBM_PIPESTAT_IAPRIMITIVES" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0544" name="RBBM_PIPESTAT_VSINVOCATIONS" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0546" name="RBBM_PIPESTAT_HSINVOCATIONS" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0548" name="RBBM_PIPESTAT_DSINVOCATIONS" variants="A6XX-A7XX"/>
+	<reg64 offset="0x054a" name="RBBM_PIPESTAT_GSINVOCATIONS" variants="A6XX-A7XX"/>
+	<reg64 offset="0x054c" name="RBBM_PIPESTAT_GSPRIMITIVES" variants="A6XX-A7XX"/>
+	<reg64 offset="0x054e" name="RBBM_PIPESTAT_CINVOCATIONS" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0550" name="RBBM_PIPESTAT_CPRIMITIVES" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0552" name="RBBM_PIPESTAT_PSINVOCATIONS" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0554" name="RBBM_PIPESTAT_CSINVOCATIONS" variants="A6XX-A7XX"/>
+
+	<reg64 offset="0x0380" name="RBBM_PIPESTAT_IAVERTICES" variants="A8XX-"/>
+	<reg64 offset="0x0382" name="RBBM_PIPESTAT_IAPRIMITIVES" variants="A8XX-"/>
+	<reg64 offset="0x0384" name="RBBM_PIPESTAT_VSINVOCATIONS" variants="A8XX-"/>
+	<reg64 offset="0x0386" name="RBBM_PIPESTAT_GSINVOCATIONS" variants="A8XX-"/>
+	<reg64 offset="0x0388" name="RBBM_PIPESTAT_GSPRIMITIVES" variants="A8XX-"/>
+	<reg64 offset="0x038a" name="RBBM_PIPESTAT_CINVOCATIONS" variants="A8XX-"/>
+	<reg64 offset="0x038c" name="RBBM_PIPESTAT_CPRIMITIVES" variants="A8XX-"/>
+	<reg64 offset="0x038e" name="RBBM_PIPESTAT_PSINVOCATIONS" variants="A8XX-"/>
+	<reg64 offset="0x0390" name="RBBM_PIPESTAT_HSINVOCATIONS" variants="A8XX-"/>
+	<reg64 offset="0x0392" name="RBBM_PIPESTAT_DSINVOCATIONS" variants="A8XX-"/>
+	<reg64 offset="0x0394" name="RBBM_PIPESTAT_CSINVOCATIONS" variants="A8XX-"/>
+	<reg64 offset="0x0396" name="RBBM_PIPESTAT_ASINVOCATIONS" variants="A8XX-"/>
+	<reg64 offset="0x0398" name="RBBM_PIPESTAT_MSINVOCATIONS" variants="A8XX-"/>
+	<reg64 offset="0x039a" name="RBBM_PIPESTAT_MSPRIMITIVES" variants="A8XX-"/>
 
 	<reg32 offset="0xF400" name="RBBM_SECVID_TRUST_CNTL"/>
 	<reg64 offset="0xF800" name="RBBM_SECVID_TSB_TRUSTED_BASE"/>
 	<reg32 offset="0xF802" name="RBBM_SECVID_TSB_TRUSTED_SIZE"/>
 	<reg32 offset="0xF803" name="RBBM_SECVID_TSB_CNTL"/>
-	<reg32 offset="0xF810" name="RBBM_SECVID_TSB_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0xF810" name="RBBM_SECVID_TSB_ADDR_MODE_CNTL" type="a5xx_address_mode" variants="A6XX"/>
 	<reg64 offset="0xfc00" name="RBBM_SECVID_TSB_STATUS" variants="A7XX-"/>
-	<reg32 offset="0x00010" name="RBBM_VBIF_CLIENT_QOS_CNTL"/>
-	<reg32 offset="0x00011" name="RBBM_GBIF_CLIENT_QOS_CNTL"/>
-	<reg32 offset="0x00016" name="RBBM_GBIF_HALT"/>
-	<reg32 offset="0x00017" name="RBBM_GBIF_HALT_ACK"/>
-	<reg32 offset="0x0001c" name="RBBM_WAIT_FOR_GPU_IDLE_CMD">
+	<reg32 offset="0x00010" name="RBBM_VBIF_CLIENT_QOS_CNTL" variants="A6XX"/>
+	<reg32 offset="0x00011" name="RBBM_GBIF_CLIENT_QOS_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00008" name="RBBM_GBIF_CLIENT_QOS_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x00016" name="RBBM_GBIF_HALT" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0000a" name="RBBM_GBIF_HALT" variants="A8XX-"/>
+	<reg32 offset="0x00017" name="RBBM_GBIF_HALT_ACK" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0000b" name="RBBM_GBIF_HALT_ACK" variants="A8XX-"/>
+	<reg32 offset="0x0001c" name="RBBM_WAIT_FOR_GPU_IDLE_CMD" variants="A6XX">
 		<bitfield pos="0" name="WAIT_GPU_IDLE" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0x00016" name="RBBM_GBIF_HALT" variants="A7XX-"/>
-	<reg32 offset="0x00017" name="RBBM_GBIF_HALT_ACK" variants="A7XX-"/>
-	<reg32 offset="0x0001f" name="RBBM_INTERFACE_HANG_INT_CNTL"/>
-	<reg32 offset="0x00037" name="RBBM_INT_CLEAR_CMD" type="A6XX_RBBM_INT_0_MASK"/>
-	<reg32 offset="0x00038" name="RBBM_INT_0_MASK" type="A6XX_RBBM_INT_0_MASK"/>
-	<reg32 offset="0x0003a" name="RBBM_INT_2_MASK" variants="A7XX-"/>
-	<reg32 offset="0x00042" name="RBBM_SP_HYST_CNT"/>
-	<reg32 offset="0x00043" name="RBBM_SW_RESET_CMD"/>
-	<reg32 offset="0x00044" name="RBBM_RAC_THRESHOLD_CNT"/>
-	<reg32 offset="0x00045" name="RBBM_BLOCK_SW_RESET_CMD"/>
-	<reg32 offset="0x00046" name="RBBM_BLOCK_SW_RESET_CMD2"/>
-	<reg32 offset="0x000ad" name="RBBM_CLOCK_CNTL_GLOBAL" variants="A7XX-"/>
-	<reg32 offset="0x000ae" name="RBBM_CLOCK_CNTL"/>
-	<reg32 offset="0x000b0" name="RBBM_CLOCK_CNTL_SP0"/>
-	<reg32 offset="0x000b1" name="RBBM_CLOCK_CNTL_SP1"/>
-	<reg32 offset="0x000b2" name="RBBM_CLOCK_CNTL_SP2"/>
-	<reg32 offset="0x000b3" name="RBBM_CLOCK_CNTL_SP3"/>
-	<reg32 offset="0x000b4" name="RBBM_CLOCK_CNTL2_SP0"/>
-	<reg32 offset="0x000b5" name="RBBM_CLOCK_CNTL2_SP1"/>
-	<reg32 offset="0x000b6" name="RBBM_CLOCK_CNTL2_SP2"/>
-	<reg32 offset="0x000b7" name="RBBM_CLOCK_CNTL2_SP3"/>
-	<reg32 offset="0x000b8" name="RBBM_CLOCK_DELAY_SP0"/>
-	<reg32 offset="0x000b9" name="RBBM_CLOCK_DELAY_SP1"/>
-	<reg32 offset="0x000ba" name="RBBM_CLOCK_DELAY_SP2"/>
-	<reg32 offset="0x000bb" name="RBBM_CLOCK_DELAY_SP3"/>
-	<reg32 offset="0x000bc" name="RBBM_CLOCK_HYST_SP0"/>
-	<reg32 offset="0x000bd" name="RBBM_CLOCK_HYST_SP1"/>
-	<reg32 offset="0x000be" name="RBBM_CLOCK_HYST_SP2"/>
-	<reg32 offset="0x000bf" name="RBBM_CLOCK_HYST_SP3"/>
-	<reg32 offset="0x000c0" name="RBBM_CLOCK_CNTL_TP0"/>
-	<reg32 offset="0x000c1" name="RBBM_CLOCK_CNTL_TP1"/>
-	<reg32 offset="0x000c2" name="RBBM_CLOCK_CNTL_TP2"/>
-	<reg32 offset="0x000c3" name="RBBM_CLOCK_CNTL_TP3"/>
-	<reg32 offset="0x000c4" name="RBBM_CLOCK_CNTL2_TP0"/>
-	<reg32 offset="0x000c5" name="RBBM_CLOCK_CNTL2_TP1"/>
-	<reg32 offset="0x000c6" name="RBBM_CLOCK_CNTL2_TP2"/>
-	<reg32 offset="0x000c7" name="RBBM_CLOCK_CNTL2_TP3"/>
-	<reg32 offset="0x000c8" name="RBBM_CLOCK_CNTL3_TP0"/>
-	<reg32 offset="0x000c9" name="RBBM_CLOCK_CNTL3_TP1"/>
-	<reg32 offset="0x000ca" name="RBBM_CLOCK_CNTL3_TP2"/>
-	<reg32 offset="0x000cb" name="RBBM_CLOCK_CNTL3_TP3"/>
-	<reg32 offset="0x000cc" name="RBBM_CLOCK_CNTL4_TP0"/>
-	<reg32 offset="0x000cd" name="RBBM_CLOCK_CNTL4_TP1"/>
-	<reg32 offset="0x000ce" name="RBBM_CLOCK_CNTL4_TP2"/>
-	<reg32 offset="0x000cf" name="RBBM_CLOCK_CNTL4_TP3"/>
-	<reg32 offset="0x000d0" name="RBBM_CLOCK_DELAY_TP0"/>
-	<reg32 offset="0x000d1" name="RBBM_CLOCK_DELAY_TP1"/>
-	<reg32 offset="0x000d2" name="RBBM_CLOCK_DELAY_TP2"/>
-	<reg32 offset="0x000d3" name="RBBM_CLOCK_DELAY_TP3"/>
-	<reg32 offset="0x000d4" name="RBBM_CLOCK_DELAY2_TP0"/>
-	<reg32 offset="0x000d5" name="RBBM_CLOCK_DELAY2_TP1"/>
-	<reg32 offset="0x000d6" name="RBBM_CLOCK_DELAY2_TP2"/>
-	<reg32 offset="0x000d7" name="RBBM_CLOCK_DELAY2_TP3"/>
-	<reg32 offset="0x000d8" name="RBBM_CLOCK_DELAY3_TP0"/>
-	<reg32 offset="0x000d9" name="RBBM_CLOCK_DELAY3_TP1"/>
-	<reg32 offset="0x000da" name="RBBM_CLOCK_DELAY3_TP2"/>
-	<reg32 offset="0x000db" name="RBBM_CLOCK_DELAY3_TP3"/>
-	<reg32 offset="0x000dc" name="RBBM_CLOCK_DELAY4_TP0"/>
-	<reg32 offset="0x000dd" name="RBBM_CLOCK_DELAY4_TP1"/>
-	<reg32 offset="0x000de" name="RBBM_CLOCK_DELAY4_TP2"/>
-	<reg32 offset="0x000df" name="RBBM_CLOCK_DELAY4_TP3"/>
-	<reg32 offset="0x000e0" name="RBBM_CLOCK_HYST_TP0"/>
-	<reg32 offset="0x000e1" name="RBBM_CLOCK_HYST_TP1"/>
-	<reg32 offset="0x000e2" name="RBBM_CLOCK_HYST_TP2"/>
-	<reg32 offset="0x000e3" name="RBBM_CLOCK_HYST_TP3"/>
-	<reg32 offset="0x000e4" name="RBBM_CLOCK_HYST2_TP0"/>
-	<reg32 offset="0x000e5" name="RBBM_CLOCK_HYST2_TP1"/>
-	<reg32 offset="0x000e6" name="RBBM_CLOCK_HYST2_TP2"/>
-	<reg32 offset="0x000e7" name="RBBM_CLOCK_HYST2_TP3"/>
-	<reg32 offset="0x000e8" name="RBBM_CLOCK_HYST3_TP0"/>
-	<reg32 offset="0x000e9" name="RBBM_CLOCK_HYST3_TP1"/>
-	<reg32 offset="0x000ea" name="RBBM_CLOCK_HYST3_TP2"/>
-	<reg32 offset="0x000eb" name="RBBM_CLOCK_HYST3_TP3"/>
-	<reg32 offset="0x000ec" name="RBBM_CLOCK_HYST4_TP0"/>
-	<reg32 offset="0x000ed" name="RBBM_CLOCK_HYST4_TP1"/>
-	<reg32 offset="0x000ee" name="RBBM_CLOCK_HYST4_TP2"/>
-	<reg32 offset="0x000ef" name="RBBM_CLOCK_HYST4_TP3"/>
-	<reg32 offset="0x000f0" name="RBBM_CLOCK_CNTL_RB0"/>
-	<reg32 offset="0x000f1" name="RBBM_CLOCK_CNTL_RB1"/>
-	<reg32 offset="0x000f2" name="RBBM_CLOCK_CNTL_RB2"/>
-	<reg32 offset="0x000f3" name="RBBM_CLOCK_CNTL_RB3"/>
-	<reg32 offset="0x000f4" name="RBBM_CLOCK_CNTL2_RB0"/>
-	<reg32 offset="0x000f5" name="RBBM_CLOCK_CNTL2_RB1"/>
-	<reg32 offset="0x000f6" name="RBBM_CLOCK_CNTL2_RB2"/>
-	<reg32 offset="0x000f7" name="RBBM_CLOCK_CNTL2_RB3"/>
-	<reg32 offset="0x000f8" name="RBBM_CLOCK_CNTL_CCU0"/>
-	<reg32 offset="0x000f9" name="RBBM_CLOCK_CNTL_CCU1"/>
-	<reg32 offset="0x000fa" name="RBBM_CLOCK_CNTL_CCU2"/>
-	<reg32 offset="0x000fb" name="RBBM_CLOCK_CNTL_CCU3"/>
-	<reg32 offset="0x00100" name="RBBM_CLOCK_HYST_RB_CCU0"/>
-	<reg32 offset="0x00101" name="RBBM_CLOCK_HYST_RB_CCU1"/>
-	<reg32 offset="0x00102" name="RBBM_CLOCK_HYST_RB_CCU2"/>
-	<reg32 offset="0x00103" name="RBBM_CLOCK_HYST_RB_CCU3"/>
-	<reg32 offset="0x00104" name="RBBM_CLOCK_CNTL_RAC"/>
-	<reg32 offset="0x00105" name="RBBM_CLOCK_CNTL2_RAC"/>
-	<reg32 offset="0x00106" name="RBBM_CLOCK_DELAY_RAC"/>
-	<reg32 offset="0x00107" name="RBBM_CLOCK_HYST_RAC"/>
-	<reg32 offset="0x00108" name="RBBM_CLOCK_CNTL_TSE_RAS_RBBM"/>
-	<reg32 offset="0x00109" name="RBBM_CLOCK_DELAY_TSE_RAS_RBBM"/>
-	<reg32 offset="0x0010a" name="RBBM_CLOCK_HYST_TSE_RAS_RBBM"/>
-	<reg32 offset="0x0010b" name="RBBM_CLOCK_CNTL_UCHE"/>
-	<reg32 offset="0x0010c" name="RBBM_CLOCK_CNTL2_UCHE"/>
-	<reg32 offset="0x0010d" name="RBBM_CLOCK_CNTL3_UCHE"/>
-	<reg32 offset="0x0010e" name="RBBM_CLOCK_CNTL4_UCHE"/>
-	<reg32 offset="0x0010f" name="RBBM_CLOCK_DELAY_UCHE"/>
-	<reg32 offset="0x00110" name="RBBM_CLOCK_HYST_UCHE"/>
-	<reg32 offset="0x00111" name="RBBM_CLOCK_MODE_VFD"/>
-	<reg32 offset="0x00112" name="RBBM_CLOCK_DELAY_VFD"/>
-	<reg32 offset="0x00113" name="RBBM_CLOCK_HYST_VFD"/>
-	<reg32 offset="0x00114" name="RBBM_CLOCK_MODE_GPC"/>
-	<reg32 offset="0x00115" name="RBBM_CLOCK_DELAY_GPC"/>
-	<reg32 offset="0x00116" name="RBBM_CLOCK_HYST_GPC"/>
-	<reg32 offset="0x00117" name="RBBM_CLOCK_DELAY_HLSQ_2"/>
-	<reg32 offset="0x00118" name="RBBM_CLOCK_CNTL_GMU_GX"/>
-	<reg32 offset="0x00119" name="RBBM_CLOCK_DELAY_GMU_GX"/>
-	<reg32 offset="0x0011a" name="RBBM_CLOCK_HYST_GMU_GX"/>
-	<reg32 offset="0x0011b" name="RBBM_CLOCK_MODE_HLSQ"/>
-	<reg32 offset="0x0011c" name="RBBM_CLOCK_DELAY_HLSQ"/>
-	<reg32 offset="0x0011d" name="RBBM_CLOCK_HYST_HLSQ"/>
-	<reg32 offset="0x0011e" name="RBBM_CGC_GLOBAL_LOAD_CMD" variants="A7XX-"/>
-	<reg32 offset="0x0011f" name="RBBM_CGC_P2S_TRIG_CMD" variants="A7XX-"/>
-	<reg32 offset="0x00120" name="RBBM_CLOCK_CNTL_TEX_FCHE"/>
-	<reg32 offset="0x00121" name="RBBM_CLOCK_DELAY_TEX_FCHE"/>
+	<reg32 offset="0x01a" name="RBBM_WAIT_IDLE_CLOCKS_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x01b" name="RBBM_WAIT_IDLE_CLOCKS_CNTL2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x010" name="RBBM_WAIT_IDLE_CLOCKS_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x011" name="RBBM_WAIT_IDLE_CLOCKS_CNTL2" variants="A8XX-"/>
+
+	<reg32 offset="0x0001f" name="RBBM_INTERFACE_HANG_INT_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0002f" name="RBBM_INTERFACE_HANG_INT_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x00037" name="RBBM_INT_CLEAR_CMD" type="A6XX_RBBM_INT_0_MASK" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00061" name="RBBM_INT_CLEAR_CMD" type="A6XX_RBBM_INT_0_MASK" variants="A8XX-"/>
+	<reg32 offset="0x00038" name="RBBM_INT_0_MASK" type="A6XX_RBBM_INT_0_MASK" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00062" name="RBBM_INT_0_MASK" type="A6XX_RBBM_INT_0_MASK" variants="A8XX-"/>
+	<reg32 offset="0x0003a" name="RBBM_INT_2_MASK" variants="A7XX"/>
+	<reg32 offset="0x00064" name="RBBM_INT_2_MASK" variants="A8XX-"/>
+	<reg32 offset="0x00042" name="RBBM_SP_HYST_CNT" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00043" name="RBBM_SW_RESET_CMD" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00073" name="RBBM_SW_RESET_CMD" variants="A8XX-"/>
+	<reg32 offset="0x00044" name="RBBM_RAC_THRESHOLD_CNT" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00029" name="RBBM_RAC_THRESHOLD_CNT" variants="A8XX-"/>
+	<reg32 offset="0x00045" name="RBBM_BLOCK_SW_RESET_CMD" variants="A6XX"/>
+	<reg32 offset="0x00046" name="RBBM_BLOCK_SW_RESET_CMD2" variants="A6XX"/>
+	<reg32 offset="0x000ad" name="RBBM_CLOCK_CNTL_GLOBAL" variants="A7XX"/>
+	<reg32 offset="0x0009a" name="RBBM_CLOCK_CNTL_GLOBAL" variants="A8XX-"/>
+	<reg32 offset="0x07d" name="RBBM_POWER_UP_RESET_SW_OVERRIDE" variants="A8XX-"/>
+	<reg32 offset="0x07e" name="RBBM_POWER_UP_RESET_SW_BV_OVERRIDE" variants="A8XX-"/>
+	<reg32 offset="0x000ae" name="RBBM_CLOCK_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000b0" name="RBBM_CLOCK_CNTL_SP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000b1" name="RBBM_CLOCK_CNTL_SP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000b2" name="RBBM_CLOCK_CNTL_SP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000b3" name="RBBM_CLOCK_CNTL_SP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000b4" name="RBBM_CLOCK_CNTL2_SP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000b5" name="RBBM_CLOCK_CNTL2_SP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000b6" name="RBBM_CLOCK_CNTL2_SP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000b7" name="RBBM_CLOCK_CNTL2_SP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000b8" name="RBBM_CLOCK_DELAY_SP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000b9" name="RBBM_CLOCK_DELAY_SP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000ba" name="RBBM_CLOCK_DELAY_SP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000bb" name="RBBM_CLOCK_DELAY_SP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000bc" name="RBBM_CLOCK_HYST_SP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000bd" name="RBBM_CLOCK_HYST_SP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000be" name="RBBM_CLOCK_HYST_SP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000bf" name="RBBM_CLOCK_HYST_SP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000c0" name="RBBM_CLOCK_CNTL_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000c1" name="RBBM_CLOCK_CNTL_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000c2" name="RBBM_CLOCK_CNTL_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000c3" name="RBBM_CLOCK_CNTL_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000c4" name="RBBM_CLOCK_CNTL2_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000c5" name="RBBM_CLOCK_CNTL2_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000c6" name="RBBM_CLOCK_CNTL2_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000c7" name="RBBM_CLOCK_CNTL2_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000c8" name="RBBM_CLOCK_CNTL3_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000c9" name="RBBM_CLOCK_CNTL3_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000ca" name="RBBM_CLOCK_CNTL3_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000cb" name="RBBM_CLOCK_CNTL3_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000cc" name="RBBM_CLOCK_CNTL4_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000cd" name="RBBM_CLOCK_CNTL4_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000ce" name="RBBM_CLOCK_CNTL4_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000cf" name="RBBM_CLOCK_CNTL4_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000d0" name="RBBM_CLOCK_DELAY_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000d1" name="RBBM_CLOCK_DELAY_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000d2" name="RBBM_CLOCK_DELAY_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000d3" name="RBBM_CLOCK_DELAY_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000d4" name="RBBM_CLOCK_DELAY2_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000d5" name="RBBM_CLOCK_DELAY2_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000d6" name="RBBM_CLOCK_DELAY2_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000d7" name="RBBM_CLOCK_DELAY2_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000d8" name="RBBM_CLOCK_DELAY3_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000d9" name="RBBM_CLOCK_DELAY3_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000da" name="RBBM_CLOCK_DELAY3_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000db" name="RBBM_CLOCK_DELAY3_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000dc" name="RBBM_CLOCK_DELAY4_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000dd" name="RBBM_CLOCK_DELAY4_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000de" name="RBBM_CLOCK_DELAY4_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000df" name="RBBM_CLOCK_DELAY4_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000e0" name="RBBM_CLOCK_HYST_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000e1" name="RBBM_CLOCK_HYST_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000e2" name="RBBM_CLOCK_HYST_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000e3" name="RBBM_CLOCK_HYST_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000e4" name="RBBM_CLOCK_HYST2_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000e5" name="RBBM_CLOCK_HYST2_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000e6" name="RBBM_CLOCK_HYST2_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000e7" name="RBBM_CLOCK_HYST2_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000e8" name="RBBM_CLOCK_HYST3_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000e9" name="RBBM_CLOCK_HYST3_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000ea" name="RBBM_CLOCK_HYST3_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000eb" name="RBBM_CLOCK_HYST3_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000ec" name="RBBM_CLOCK_HYST4_TP0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000ed" name="RBBM_CLOCK_HYST4_TP1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000ee" name="RBBM_CLOCK_HYST4_TP2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000ef" name="RBBM_CLOCK_HYST4_TP3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000f0" name="RBBM_CLOCK_CNTL_RB0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000f1" name="RBBM_CLOCK_CNTL_RB1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000f2" name="RBBM_CLOCK_CNTL_RB2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000f3" name="RBBM_CLOCK_CNTL_RB3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000f4" name="RBBM_CLOCK_CNTL2_RB0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000f5" name="RBBM_CLOCK_CNTL2_RB1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000f6" name="RBBM_CLOCK_CNTL2_RB2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000f7" name="RBBM_CLOCK_CNTL2_RB3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000f8" name="RBBM_CLOCK_CNTL_CCU0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000f9" name="RBBM_CLOCK_CNTL_CCU1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000fa" name="RBBM_CLOCK_CNTL_CCU2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x000fb" name="RBBM_CLOCK_CNTL_CCU3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00100" name="RBBM_CLOCK_HYST_RB_CCU0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00101" name="RBBM_CLOCK_HYST_RB_CCU1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00102" name="RBBM_CLOCK_HYST_RB_CCU2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00103" name="RBBM_CLOCK_HYST_RB_CCU3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00104" name="RBBM_CLOCK_CNTL_RAC" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00105" name="RBBM_CLOCK_CNTL2_RAC" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00106" name="RBBM_CLOCK_DELAY_RAC" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00107" name="RBBM_CLOCK_HYST_RAC" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00108" name="RBBM_CLOCK_CNTL_TSE_RAS_RBBM" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00109" name="RBBM_CLOCK_DELAY_TSE_RAS_RBBM" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0010a" name="RBBM_CLOCK_HYST_TSE_RAS_RBBM" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0010b" name="RBBM_CLOCK_CNTL_UCHE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0010c" name="RBBM_CLOCK_CNTL2_UCHE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0010d" name="RBBM_CLOCK_CNTL3_UCHE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0010e" name="RBBM_CLOCK_CNTL4_UCHE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0010f" name="RBBM_CLOCK_DELAY_UCHE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00110" name="RBBM_CLOCK_HYST_UCHE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00111" name="RBBM_CLOCK_MODE_VFD" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00112" name="RBBM_CLOCK_DELAY_VFD" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00113" name="RBBM_CLOCK_HYST_VFD" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00114" name="RBBM_CLOCK_MODE_GPC" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00115" name="RBBM_CLOCK_DELAY_GPC" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00116" name="RBBM_CLOCK_HYST_GPC" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00117" name="RBBM_CLOCK_DELAY_HLSQ_2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00118" name="RBBM_CLOCK_CNTL_GMU_GX" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00119" name="RBBM_CLOCK_DELAY_GMU_GX" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0011a" name="RBBM_CLOCK_HYST_GMU_GX" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0011b" name="RBBM_CLOCK_MODE_HLSQ" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0011c" name="RBBM_CLOCK_DELAY_HLSQ" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0011d" name="RBBM_CLOCK_HYST_HLSQ" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0011e" name="RBBM_CGC_GLOBAL_LOAD_CMD" variants="A7XX"/>
+	<reg32 offset="0x0009b" name="RBBM_CGC_GLOBAL_LOAD_CMD" variants="A8XX-"/>
+	<reg32 offset="0x0011f" name="RBBM_CGC_P2S_TRIG_CMD" variants="A7XX"/>
+	<reg32 offset="0x0009c" name="RBBM_CGC_P2S_TRIG_CMD" variants="A8XX-"/>
+	<reg32 offset="0x00120" name="RBBM_CGC_P2S_CNTL" variants="A7XX"/>
+	<reg32 offset="0x0009d" name="RBBM_CGC_P2S_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x00120" name="RBBM_CLOCK_CNTL_TEX_FCHE" variants="A6XX"/>
+	<reg32 offset="0x00121" name="RBBM_CLOCK_DELAY_TEX_FCHE" variants="A6XX-A7XX"/>
 	<reg32 offset="0x00122" name="RBBM_CLOCK_HYST_TEX_FCHE" variants="A6XX"/>
-	<reg32 offset="0x00122" name="RBBM_CGC_P2S_STATUS" variants="A7XX-">
+	<reg32 offset="0x00122" name="RBBM_CGC_P2S_STATUS" variants="A7XX">
+		<bitfield name="TXDONE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x09f" name="RBBM_CGC_P2S_STATUS" variants="A8XX-">
 		<bitfield name="TXDONE" pos="0" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x00123" name="RBBM_CLOCK_CNTL_FCHE"/>
-	<reg32 offset="0x00124" name="RBBM_CLOCK_DELAY_FCHE"/>
-	<reg32 offset="0x00125" name="RBBM_CLOCK_HYST_FCHE"/>
-	<reg32 offset="0x00126" name="RBBM_CLOCK_CNTL_MHUB"/>
-	<reg32 offset="0x00127" name="RBBM_CLOCK_DELAY_MHUB"/>
-	<reg32 offset="0x00128" name="RBBM_CLOCK_HYST_MHUB"/>
-	<reg32 offset="0x00129" name="RBBM_CLOCK_DELAY_GLC"/>
-	<reg32 offset="0x0012a" name="RBBM_CLOCK_HYST_GLC"/>
-	<reg32 offset="0x0012b" name="RBBM_CLOCK_CNTL_GLC"/>
-	<reg32 offset="0x0012f" name="RBBM_CLOCK_HYST2_VFD" variants="A7XX-"/>
-	<reg32 offset="0x005ff" name="RBBM_LPAC_GBIF_CLIENT_QOS_CNTL"/>
+	<reg32 offset="0x00123" name="RBBM_CLOCK_CNTL_FCHE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00124" name="RBBM_CLOCK_DELAY_FCHE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00125" name="RBBM_CLOCK_HYST_FCHE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00126" name="RBBM_CLOCK_CNTL_MHUB" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00127" name="RBBM_CLOCK_DELAY_MHUB" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00128" name="RBBM_CLOCK_HYST_MHUB" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00129" name="RBBM_CLOCK_DELAY_GLC" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0012a" name="RBBM_CLOCK_HYST_GLC" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0012b" name="RBBM_CLOCK_CNTL_GLC" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0012f" name="RBBM_CLOCK_HYST2_VFD" variants="A7XX"/>
+	<reg32 offset="0x00195" name="RBBM_CGC_0_PC" variants="A7XX"/>
+	<reg32 offset="0x0010b" name="RBBM_CGC_0_PC" variants="A8XX-"/>
+
+	<reg32 offset="0x005ff" name="RBBM_LPAC_GBIF_CLIENT_QOS_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x00009" name="RBBM_LPAC_GBIF_CLIENT_QOS_CNTL" variants="A8XX-"/>
 
 	<reg32 offset="0x0600" name="DBGC_CFG_DBGBUS_SEL_A"/>
 	<reg32 offset="0x0601" name="DBGC_CFG_DBGBUS_SEL_B"/>
@@ -610,6 +938,8 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0605" name="DBGC_CFG_DBGBUS_CNTLM">
 		<bitfield high="27" low="24" name="ENABLE"/>
 	</reg32>
+	<reg32 offset="0x0606" name="DBGC_CFG_DBGBUS_OPL"/>
+	<reg32 offset="0x0607" name="DBGC_CFG_DBGBUS_OPE"/>
 	<reg32 offset="0x0608" name="DBGC_CFG_DBGBUS_IVTL_0"/>
 	<reg32 offset="0x0609" name="DBGC_CFG_DBGBUS_IVTL_1"/>
 	<reg32 offset="0x060a" name="DBGC_CFG_DBGBUS_IVTL_2"/>
@@ -638,72 +968,277 @@ by a particular renderpass/blit.
 		<bitfield high="27" low="24" name="BYTEL14"/>
 		<bitfield high="31" low="28" name="BYTEL15"/>
 	</reg32>
+	<reg32 offset="0x0612" name="DBGC_CFG_DBGBUS_IVTE_0"/>
+	<reg32 offset="0x0613" name="DBGC_CFG_DBGBUS_IVTE_1"/>
+	<reg32 offset="0x0614" name="DBGC_CFG_DBGBUS_IVTE_2"/>
+	<reg32 offset="0x0615" name="DBGC_CFG_DBGBUS_IVTE_3"/>
+	<reg32 offset="0x0616" name="DBGC_CFG_DBGBUS_MASKE_0"/>
+	<reg32 offset="0x0617" name="DBGC_CFG_DBGBUS_MASKE_1"/>
+	<reg32 offset="0x0618" name="DBGC_CFG_DBGBUS_MASKE_2"/>
+	<reg32 offset="0x0619" name="DBGC_CFG_DBGBUS_MASKE_3"/>
+	<reg32 offset="0x061a" name="DBGC_CFG_DBGBUS_NIBBLEE"/>
+	<reg32 offset="0x061b" name="DBGC_CFG_DBGBUS_PTRC0"/>
+	<reg32 offset="0x061c" name="DBGC_CFG_DBGBUS_PTRC1"/>
+	<reg32 offset="0x061d" name="DBGC_CFG_DBGBUS_LOADREG"/>
+	<reg32 offset="0x061e" name="DBGC_CFG_DBGBUS_IDX"/>
+	<reg32 offset="0x061f" name="DBGC_CFG_DBGBUS_CLRC"/>
+	<reg32 offset="0x0620" name="DBGC_CFG_DBGBUS_LOADIVT"/>
+	<reg32 offset="0x0621" name="DBGC_VBIF_DBG_CNTL"/>
+	<reg32 offset="0x0622" name="DBGC_DBG_LO_HI_GPIO"/>
+	<reg32 offset="0x0623" name="DBGC_EXT_TRACE_BUS_CNTL"/>
+	<reg32 offset="0x0624" name="DBGC_READ_AHB_THROUGH_DBG"/>
+	<reg32 offset="0x0625" name="DBGC_CFG_DBGBUS_EVENT_LOGIC"/>
+	<reg32 offset="0x0626" name="DBGC_CFG_DBGBUS_OVER"/>
+	<reg32 offset="0x0627" name="DBGC_CFG_DBGBUS_COUNT0"/>
+	<reg32 offset="0x0628" name="DBGC_CFG_DBGBUS_COUNT1"/>
+	<reg32 offset="0x0629" name="DBGC_CFG_DBGBUS_COUNT2"/>
+	<reg32 offset="0x062a" name="DBGC_CFG_DBGBUS_COUNT3"/>
+	<reg32 offset="0x062b" name="DBGC_CFG_DBGBUS_COUNT4"/>
+	<reg32 offset="0x062c" name="DBGC_CFG_DBGBUS_COUNT5"/>
+	<reg32 offset="0x062d" name="DBGC_CFG_DBGBUS_TRACE_ADDR"/>
+	<reg32 offset="0x062e" name="DBGC_CFG_DBGBUS_TRACE_BUF0"/>
 	<reg32 offset="0x062f" name="DBGC_CFG_DBGBUS_TRACE_BUF1"/>
 	<reg32 offset="0x0630" name="DBGC_CFG_DBGBUS_TRACE_BUF2"/>
-	<array offset="0x0CD8" name="VSC_PERFCTR_VSC_SEL" stride="1" length="2" variants="A6XX"/>
-	<reg32 offset="0x0CD8" name="VSC_UNKNOWN_0CD8" variants="A7XX">
-		<doc>
-			Set to true when binning, isn't changed afterwards
-		</doc>
-		<bitfield name="BINNING" pos="0" type="boolean"/>
-	</reg32>
+	<reg32 offset="0x0631" name="DBGC_CFG_DBGBUS_TRACE_BUF3"/>
+	<reg32 offset="0x0632" name="DBGC_CFG_DBGBUS_TRACE_BUF4"/>
+	<reg32 offset="0x0633" name="DBGC_CFG_DBGBUS_MISR0"/>
+	<reg32 offset="0x0634" name="DBGC_CFG_DBGBUS_MISR1"/>
+	<reg32 offset="0x0635" name="DBGC_EVT_CFG"/>
+	<reg32 offset="0x0636" name="DBGC_EVT_INTF_SEL_0"/>
+	<reg32 offset="0x0637" name="DBGC_EVT_INTF_SEL_1"/>
+	<reg32 offset="0x0638" name="DBGC_EVT_SLICE_CFG"/>
+	<reg32 offset="0x0639" name="DBGC_QDSS_TIMESTAMP_0"/>
+	<reg32 offset="0x063a" name="DBGC_QDSS_TIMESTAMP_1"/>
+	<reg32 offset="0x063b" name="DBGC_ECO_CNTL"/>
+	<reg32 offset="0x063c" name="DBGC_AHB_DBG_CNTL"/>
+	<reg32 offset="0x063d" name="DBGC_EVT_INTF_SEL_2"/>
+	<reg32 offset="0x0640" name="DBGC_CFG_DBGBUS_PONG_SEL_A"/>
+	<reg32 offset="0x0641" name="DBGC_CFG_DBGBUS_PONG_SEL_B"/>
+	<reg32 offset="0x0642" name="DBGC_CFG_DBGBUS_PONG_SEL_C"/>
+	<reg32 offset="0x0643" name="DBGC_CFG_DBGBUS_PONG_SEL_D"/>
+	<reg32 offset="0x0644" name="DBGC_CFG_DBGBUS_MISC_MODE"/>
+	<reg32 offset="0x0650" name="DBGC_EVT_INTF_SEL_3_0"/>
+	<reg32 offset="0x0651" name="DBGC_EVT_INTF_SEL_3_1"/>
+	<reg32 offset="0x0652" name="DBGC_EVT_INTF_SEL_3_2"/>
+	<reg32 offset="0x0653" name="DBGC_EVT_INTF_SEL_3_3"/>
+	<reg32 offset="0x0654" name="DBGC_EVT_INTF_SEL_3_4"/>
+	<reg32 offset="0x0655" name="DBGC_EVT_INTF_SEL_3_5"/>
+	<reg32 offset="0x0660" name="DBGC_TRACE_BUFFER_STATUS"/>
+	<reg32 offset="0x0661" name="DBGC_TRACE_BUFFER_CMD"/>
+	<reg32 offset="0x0662" name="DBGC_DBG_TRACE_BUFFER_RD_ADDR"/>
+	<reg32 offset="0x0663" name="DBGC_DBG_TRACE_BUFFER_RD_DATA"/>
+	<reg32 offset="0x0664" name="DBGC_TRACE_BUFFER_ATB_RD_STATUS"/>
+	<reg32 offset="0x0665" name="DBGC_SMMU_FAULT_BLOCK_HALT_CFG"/>
+	<reg32 offset="0x0666" name="DBGC_DBG_LOPC_SB_RD_ADDR"/>
+	<reg32 offset="0x0667" name="DBGC_DBG_LOPC_SB_RD_DATA"/>
+	<reg32 offset="0x0668" name="DBGC_DBG_LOPC_SB_WR_ADDR"/>
+	<reg32 offset="0x0669" name="DBGC_DBG_LOPC_SB_WR_DATA"/>
+	<reg32 offset="0x066a" name="DBGC_INTERRUPT_STATUS"/>
+	<reg64 offset="0x0680" name="DBGC_GBIF_DBG_BASE"/>
+	<reg32 offset="0x0682" name="DBGC_GBIF_DBG_BUFF_SIZE"/>
+	<reg32 offset="0x0683" name="DBGC_GBIF_DBG_CNTL"/>
+	<reg32 offset="0x0684" name="DBGC_GBIF_DBG_CMD"/>
+	<reg32 offset="0x0685" name="DBGC_GBIF_DBG_STATUS"/>
+
+	<reg32 offset="0x0700" name="DBGC_SCOPE_PERF_COUNTER_CFG_US" variants="A8XX-"/>
+	<reg32 offset="0x0701" name="DBGC_CFG_PERF_TRIG_CLUSTER_FE_US" variants="A8XX-"/>
+	<reg32 offset="0x0702" name="DBGC_CFG_PERF_TRIG_CLUSTER_VPC_US" variants="A8XX-"/>
+	<reg32 offset="0x0703" name="DBGC_CFG_PERF_TRIG_CLUSTER_SP_VS_US" variants="A8XX-"/>
+	<reg32 offset="0x0704" name="DBGC_CFG_PERF_TRIG_CLUSTER_SP_PS_US" variants="A8XX-"/>
+	<reg32 offset="0x0707" name="DBGC_CFG_PERF_TRIG_CLUSTER_NONE_US" variants="A8XX-"/>
+	<reg32 offset="0x0708" name="DBGC_CFG_BV_PERF_TRIG_CLUSTER_FE_US" variants="A8XX-"/>
+	<reg32 offset="0x0709" name="DBGC_CFG_BV_PERF_TRIG_CLUSTER_VPC_US" variants="A8XX-"/>
+	<reg32 offset="0x070a" name="DBGC_CFG_BV_PERF_TRIG_CLUSTER_SP_VS_US" variants="A8XX-"/>
+	<reg32 offset="0x070f" name="DBGC_CFG_BV_PERF_TRIG_CLUSTER_NONE_US" variants="A8XX-"/>
+	<reg32 offset="0x0710" name="DBGC_CFG_PERF_COUNTER_SEL_FE_US" variants="A8XX-"/>
+	<reg32 offset="0x0711" name="DBGC_CFG_PERF_COUNTER_SEL_FE_US_1" variants="A8XX-"/>
+	<reg32 offset="0x0712" name="DBGC_CFG_PERF_COUNTER_SEL_FE_US_2" variants="A8XX-"/>
+	<reg32 offset="0x0713" name="DBGC_CFG_PERF_COUNTER_SEL_VPC_US" variants="A8XX-"/>
+	<reg32 offset="0x0714" name="DBGC_CFG_PERF_COUNTER_SEL_VPC_US_1" variants="A8XX-"/>
+	<reg32 offset="0x0715" name="DBGC_CFG_PERF_COUNTER_SEL_SP_VS_US" variants="A8XX-"/>
+	<reg32 offset="0x0716" name="DBGC_CFG_PERF_COUNTER_SEL_SP_PS_US" variants="A8XX-"/>
+	<reg32 offset="0x0720" name="DBGC_CFG_PERF_COUNTER_SEL_NONE_US" variants="A8XX-"/>
+	<reg32 offset="0x0721" name="DBGC_CFG_PERF_COUNTER_SEL_NONE_US_1" variants="A8XX-"/>
+	<reg32 offset="0x0722" name="DBGC_CFG_BV_PERF_COUNTER_SEL_FE_US" variants="A8XX-"/>
+	<reg32 offset="0x0723" name="DBGC_CFG_BV_PERF_COUNTER_SEL_FE_US_1" variants="A8XX-"/>
+	<reg32 offset="0x0724" name="DBGC_CFG_BV_PERF_COUNTER_SEL_FE_US_2" variants="A8XX-"/>
+	<reg32 offset="0x0730" name="DBGC_CFG_BV_PERF_COUNTER_SEL_VPC_US" variants="A8XX-"/>
+	<reg32 offset="0x0731" name="DBGC_CFG_BV_PERF_COUNTER_SEL_VPC_US_1" variants="A8XX-"/>
+	<reg32 offset="0x0732" name="DBGC_CFG_BV_PERF_COUNTER_SEL_SP_VS_US" variants="A8XX-"/>
+	<reg32 offset="0x0740" name="DBGC_CFG_BV_PERF_COUNTER_SEL_NONE_US" variants="A8XX-"/>
+	<reg32 offset="0x0742" name="DBGC_CFG_PERF_TIMESTAMP_TRIG_SEL_US" variants="A8XX-"/>
+	<reg32 offset="0x0743" name="DBGC_CFG_BV_PERF_TIMESTAMP_TRIG_SEL_US" variants="A8XX-"/>
+	<reg64 offset="0x0744" name="DBGC_CFG_GBIF_BR_PERF_CNTR_BASE" variants="A8XX-"/>
+	<reg32 offset="0x0746" name="DBGC_CFG_GBIF_BR_BUFFER_SIZE" variants="A8XX-"/>
+	<reg64 offset="0x0747" name="DBGC_CFG_GBIF_BV_PERF_CNTR_BASE" variants="A8XX-"/>
+	<reg32 offset="0x0749" name="DBGC_CFG_GBIF_BV_BUFFER_SIZE" variants="A8XX-"/>
+	<reg32 offset="0x074a" name="DBGC_CFG_GBIF_QOS_CTRL" variants="A8XX-"/>
+	<reg32 offset="0x0750" name="DBGC_GBIF_BR_PERF_CNTR_WRITE_POINTER" variants="A8XX-"/>
+	<reg32 offset="0x0751" name="DBGC_GBIF_BV_PERF_CNTR_WRITE_POINTER" variants="A8XX-"/>
+	<reg32 offset="0x0752" name="DBGC_PERF_COUNTER_FE_LOCAL_BATCH_ID" variants="A8XX-"/>
+	<reg32 offset="0x0753" name="DBGC_CFG_PERF_WAIT_IDLE_CLOCKS_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x0754" name="DBGC_PERF_COUNTER_SCOPING_CMD_US" variants="A8XX-"/>
+	<reg32 offset="0x0755" name="DBGC_PERF_SKEW_BUFFER_INIT_CMD" variants="A8XX-"/>
+	<reg32 offset="0x0759" name="DBGC_LOPC_INTERRUPT_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x075a" name="DBGC_LOPC_BUFFER_PTR_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x075b" name="DBGC_PERF_SCOPING_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x075c" name="DBGC_PERF_COUNTER_PKT_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x0760" name="DBGC_GC_LIVE_MBX_PKT_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x0761" name="DBGC_GC_ALW_MBX_PKT_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x0762" name="DBGC_AO_CNTR_LO_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x0763" name="DBGC_AO_CNTR_HI_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x0770" name="DBGC_LOPC_GC_SB_DEPTH_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x0780" name="DBGC_LPAC_SCOPE_PERF_COUNTER_CFG_US" variants="A8XX-"/>
+	<reg32 offset="0x0781" name="DBGC_CFG_PERF_TRIG_LPAC_US" variants="A8XX-"/>
+	<reg32 offset="0x0782" name="DBGC_CFG_PERF_COUNTER_SEL_LPAC_US" variants="A8XX-"/>
+	<reg32 offset="0x0783" name="DBGC_CFG_PERF_COUNTER_SEL_LPAC_US_1" variants="A8XX-"/>
+	<reg32 offset="0x0784" name="DBGC_CFG_PERF_COUNTER_SEL_LPAC_US_2" variants="A8XX-"/>
+	<reg32 offset="0x0785" name="DBGC_CFG_PERF_TIMESTAMP_TRIG_SEL_LPAC_US" variants="A8XX-"/>
+	<reg64 offset="0x0786" name="DBGC_CFG_GBIF_LPAC_PERF_CNTR_BASE" variants="A8XX-"/>
+	<reg32 offset="0x0788" name="DBGC_CFG_GBIF_LPAC_BUFFER_SIZE" variants="A8XX-"/>
+	<reg32 offset="0x0789" name="DBGC_GBIF_LPAC_PERF_CNTR_WRITE_POINTER" variants="A8XX-"/>
+	<reg32 offset="0x078a" name="DBGC_CFG_LPAC_PERF_WAIT_IDLE_CLOCKS_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x078b" name="DBGC_LPAC_PERF_COUNTER_SCOPING_CMD_US" variants="A8XX-"/>
+	<reg32 offset="0x078c" name="DBGC_LPAC_MBX_PKT_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x078d" name="DBGC_LPAC_PERF_SCOPING_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x0790" name="DBGC_LOPC_LPAC_SB_DEPTH_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x07a0" name="DBGC_SCOPE_PERF_COUNTER_CFG_S" variants="A8XX-"/>
+	<reg32 offset="0x07a1" name="DBGC_CFG_PERF_TRIG_CLUSTER_FE_S" variants="A8XX-"/>
+	<reg32 offset="0x07a2" name="DBGC_CFG_PERF_TRIG_CLUSTER_SP_VS" variants="A8XX-"/>
+	<reg32 offset="0x07a3" name="DBGC_CFG_PERF_TRIG_CLUSTER_VPC_VS" variants="A8XX-"/>
+	<reg32 offset="0x07a4" name="DBGC_CFG_PERF_TRIG_CLUSTER_GRAS" variants="A8XX-"/>
+	<reg32 offset="0x07a5" name="DBGC_CFG_PERF_TRIG_CLUSTER_SP_PS" variants="A8XX-"/>
+	<reg32 offset="0x07a6" name="DBGC_CFG_PERF_TRIG_CLUSTER_VPC_PS" variants="A8XX-"/>
+	<reg32 offset="0x07a7" name="DBGC_CFG_PERF_TRIG_CLUSTER_PS" variants="A8XX-"/>
+	<reg32 offset="0x07a8" name="DBGC_CFG_BV_PERF_TRIG_CLUSTER_FE_S" variants="A8XX-"/>
+	<reg32 offset="0x07a9" name="DBGC_CFG_BV_PERF_TRIG_CLUSTER_SP_VS" variants="A8XX-"/>
+	<reg32 offset="0x07aa" name="DBGC_CFG_BV_PERF_TRIG_CLUSTER_VPC_VS" variants="A8XX-"/>
+	<reg32 offset="0x07ab" name="DBGC_CFG_BV_PERF_TRIG_CLUSTER_GRAS" variants="A8XX-"/>
+	<reg32 offset="0x07ac" name="DBGC_CFG_BV_PERF_TRIG_CLUSTER_VPC_PS" variants="A8XX-"/>
+	<reg32 offset="0x07ad" name="DBGC_CFG_PERF_COUNTER_SEL_FE_S" variants="A8XX-"/>
+	<reg32 offset="0x07ae" name="DBGC_CFG_PERF_COUNTER_SEL_FE_S_1" variants="A8XX-"/>
+	<reg32 offset="0x07af" name="DBGC_CFG_PERF_COUNTER_SEL_FE_S_2" variants="A8XX-"/>
+	<reg32 offset="0x07b0" name="DBGC_CFG_PERF_COUNTER_SEL_FE_S_3" variants="A8XX-"/>
+	<reg32 offset="0x07b1" name="DBGC_CFG_PERF_COUNTER_SEL_SP_VS" variants="A8XX-"/>
+	<reg32 offset="0x07b2" name="DBGC_CFG_PERF_COUNTER_SEL_SP_VS_1" variants="A8XX-"/>
+	<reg32 offset="0x07b3" name="DBGC_CFG_PERF_COUNTER_SEL_SP_VS_2" variants="A8XX-"/>
+	<reg32 offset="0x07b4" name="DBGC_CFG_PERF_COUNTER_SEL_SP_VS_3" variants="A8XX-"/>
+	<reg32 offset="0x07b5" name="DBGC_CFG_PERF_COUNTER_SEL_VPC_VS" variants="A8XX-"/>
+	<reg32 offset="0x07b6" name="DBGC_CFG_PERF_COUNTER_SEL_VPC_VS_1" variants="A8XX-"/>
+	<reg32 offset="0x07b7" name="DBGC_CFG_PERF_COUNTER_SEL_GRAS" variants="A8XX-"/>
+	<reg32 offset="0x07b8" name="DBGC_CFG_PERF_COUNTER_SEL_GRAS_1" variants="A8XX-"/>
+	<reg32 offset="0x07b9" name="DBGC_CFG_PERF_COUNTER_SEL_GRAS_2" variants="A8XX-"/>
+	<reg32 offset="0x07ba" name="DBGC_CFG_PERF_COUNTER_SEL_SP_PS" variants="A8XX-"/>
+	<reg32 offset="0x07bb" name="DBGC_CFG_PERF_COUNTER_SEL_SP_PS_1" variants="A8XX-"/>
+	<reg32 offset="0x07bc" name="DBGC_CFG_PERF_COUNTER_SEL_SP_PS_2" variants="A8XX-"/>
+	<reg32 offset="0x07bd" name="DBGC_CFG_PERF_COUNTER_SEL_SP_PS_3" variants="A8XX-"/>
+	<reg32 offset="0x07be" name="DBGC_CFG_PERF_COUNTER_SEL_VPC_PS" variants="A8XX-"/>
+	<reg32 offset="0x07bf" name="DBGC_CFG_PERF_COUNTER_SEL_VPC_PS_1" variants="A8XX-"/>
+	<reg32 offset="0x07c0" name="DBGC_CFG_PERF_COUNTER_SEL_PS" variants="A8XX-"/>
+	<reg32 offset="0x07c1" name="DBGC_CFG_PERF_COUNTER_SEL_PS_1" variants="A8XX-"/>
+	<reg32 offset="0x07c2" name="DBGC_CFG_PERF_COUNTER_SEL_PS_2" variants="A8XX-"/>
+	<reg32 offset="0x07c3" name="DBGC_CFG_PERF_COUNTER_SEL_PS_3" variants="A8XX-"/>
+	<reg32 offset="0x07c4" name="DBGC_CFG_PERF_TIMESTAMP_TRIG_SEL_S" variants="A8XX-"/>
+	<reg32 offset="0x07c5" name="DBGC_CFG_BV_PERF_COUNTER_SEL_FE_S" variants="A8XX-"/>
+	<reg32 offset="0x07c6" name="DBGC_CFG_BV_PERF_COUNTER_SEL_FE_S_1" variants="A8XX-"/>
+	<reg32 offset="0x07c7" name="DBGC_CFG_BV_PERF_COUNTER_SEL_FE_S_2" variants="A8XX-"/>
+	<reg32 offset="0x07c8" name="DBGC_CFG_BV_PERF_COUNTER_SEL_FE_S_3" variants="A8XX-"/>
+	<reg32 offset="0x07c9" name="DBGC_CFG_BV_PERF_COUNTER_SEL_SP_VS" variants="A8XX-"/>
+	<reg32 offset="0x07ca" name="DBGC_CFG_BV_PERF_COUNTER_SEL_SP_VS_1" variants="A8XX-"/>
+	<reg32 offset="0x07cb" name="DBGC_CFG_BV_PERF_COUNTER_SEL_SP_VS_2" variants="A8XX-"/>
+	<reg32 offset="0x07cc" name="DBGC_CFG_BV_PERF_COUNTER_SEL_SP_VS_3" variants="A8XX-"/>
+	<reg32 offset="0x07cd" name="DBGC_CFG_BV_PERF_COUNTER_SEL_VPC_VS" variants="A8XX-"/>
+	<reg32 offset="0x07ce" name="DBGC_CFG_BV_PERF_COUNTER_SEL_VPC_VS_1" variants="A8XX-"/>
+	<reg32 offset="0x07cf" name="DBGC_CFG_BV_PERF_COUNTER_SEL_GRAS" variants="A8XX-"/>
+	<reg32 offset="0x07d0" name="DBGC_CFG_BV_PERF_COUNTER_SEL_GRAS_1" variants="A8XX-"/>
+	<reg32 offset="0x07d1" name="DBGC_CFG_BV_PERF_COUNTER_SEL_GRAS_2" variants="A8XX-"/>
+	<reg32 offset="0x07d2" name="DBGC_CFG_BV_PERF_COUNTER_SEL_VPC_PS" variants="A8XX-"/>
+	<reg32 offset="0x07d3" name="DBGC_CFG_BV_PERF_COUNTER_SEL_VPC_PS_1" variants="A8XX-"/>
+	<reg32 offset="0x07d4" name="DBGC_CFG_BV_PERF_TIMESTAMP_TRIG_SEL_S" variants="A8XX-"/>
+	<reg32 offset="0x07d5" name="DBGC_PERF_COUNTER_SCOPING_CMD_S" variants="A8XX-"/>
+	<reg32 offset="0x07e0" name="DBGC_LPAC_SCOPE_PERF_COUNTER_CFG_S" variants="A8XX-"/>
+	<reg32 offset="0x07e1" name="DBGC_CFG_PERF_TRIG_LPAC_S" variants="A8XX-"/>
+	<reg32 offset="0x07e2" name="DBGC_CFG_PERF_COUNTER_SEL_LPAC_S" variants="A8XX-"/>
+	<reg32 offset="0x07e3" name="DBGC_CFG_PERF_COUNTER_SEL_LPAC_S_1" variants="A8XX-"/>
+	<reg32 offset="0x07e4" name="DBGC_CFG_PERF_COUNTER_SEL_LPAC_S_2" variants="A8XX-"/>
+	<reg32 offset="0x07e5" name="DBGC_CFG_PERF_TIMESTAMP_TRIG_SEL_LPAC_S" variants="A8XX-"/>
+	<reg32 offset="0x07e6" name="DBGC_LPAC_PERF_COUNTER_SCOPING_CMD_S" variants="A8XX-"/>
+
+	<array offset="0x0CD8" name="VSC_PERFCTR_VSC_SEL" stride="1" length="2"/>
 	<reg32 offset="0xC800" name="HLSQ_DBG_AHB_READ_APERTURE"/>
 	<reg32 offset="0xD000" name="HLSQ_DBG_READ_SEL"/>
-	<reg32 offset="0x0E00" name="UCHE_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0E00" name="UCHE_ADDR_MODE_CNTL" type="a5xx_address_mode" variants="A6XX"/>
 	<reg32 offset="0x0E01" name="UCHE_MODE_CNTL"/>
-	<reg64 offset="0x0E05" name="UCHE_WRITE_RANGE_MAX"/>
-	<reg64 offset="0x0E07" name="UCHE_WRITE_THRU_BASE"/>
-	<reg64 offset="0x0E09" name="UCHE_TRAP_BASE"/>
-	<reg64 offset="0x0E0B" name="UCHE_GMEM_RANGE_MIN"/>
-	<reg64 offset="0x0E0D" name="UCHE_GMEM_RANGE_MAX"/>
-	<reg32 offset="0x0E17" name="UCHE_CACHE_WAYS" usage="cmd"/>
+
+	<reg64 offset="0x0E05" name="UCHE_WRITE_RANGE_MAX" variants="A6XX"/>
+	<reg64 offset="0x0E07" name="UCHE_WRITE_THRU_BASE" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0E06" name="UCHE_WRITE_THRU_BASE" variants="A8XX-"/>
+	<reg64 offset="0x0E09" name="UCHE_TRAP_BASE" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0E08" name="UCHE_TRAP_BASE" variants="A8XX-"/>
+	<reg64 offset="0x0E0B" name="UCHE_GMEM_RANGE_MIN" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0E0D" name="UCHE_GMEM_RANGE_MAX" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0e17" name="UCHE_CACHE_WAYS" variants="A6XX-A7XX" usage="cmd"/>
+	<reg32 offset="0x0e04" name="UCHE_CACHE_WAYS" variants="A8XX-"/>
 	<reg32 offset="0x0E18" name="UCHE_FILTER_CNTL"/>
-	<reg32 offset="0x0E19" name="UCHE_CLIENT_PF" usage="cmd">
+	<reg32 offset="0x0e19" name="UCHE_CLIENT_PF" variants="A6XX-A7XX" usage="cmd">
 		<bitfield high="7" low="0" name="PERFSEL"/>
 	</reg32>
-	<array offset="0x0E1C" name="UCHE_PERFCTR_UCHE_SEL" stride="1" length="12"/>
-	<reg32 offset="0x0e3a" name="UCHE_GBIF_GX_CONFIG"/>
-	<reg32 offset="0x0e3c" name="UCHE_CMDQ_CONFIG"/>
+	<array offset="0x0e1c" name="UCHE_PERFCTR_UCHE_SEL" stride="1" length="12" variants="A6XX-A7XX"/>
+	<array offset="0x0e20" name="UCHE_PERFCTR_UCHE_SEL" stride="1" length="24" variants="A8XX-"/>
+	<reg32 offset="0x0e3a" name="UCHE_GBIF_GX_CONFIG" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0e12" name="UCHE_GBIF_GX_CONFIG" variants="A8XX-"/>
+	<reg32 offset="0x0e3c" name="UCHE_CMDQ_CONFIG" variants="A6XX-A7XX"/>
+
+	<reg32 offset="0x0f01" name="UCHE_CCHE_MODE_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x0f02" name="UCHE_CCHE_CACHE_WAYS" variants="A8XX-"/>
+	<reg64 offset="0x0f04" name="UCHE_CCHE_WRITE_THRU_BASE" variants="A8XX-"/>
+	<reg64 offset="0x0f06" name="UCHE_CCHE_TRAP_BASE" variants="A8XX-"/>
+	<reg64 offset="0x0f08" name="UCHE_CCHE_GC_GMEM_RANGE_MIN" variants="A8XX-"/>
+	<reg64 offset="0x0f0a" name="UCHE_CCHE_LPAC_GMEM_RANGE_MIN" variants="A8XX-"/>
+	<reg32 offset="0x0f0c" name="UCHE_CCHE_HW_DBG_CNTL" variants="A8XX-"/>
 
-	<reg32 offset="0x3000" name="VBIF_VERSION"/>
-	<reg32 offset="0x3001" name="VBIF_CLKON">
+	<!-- VBIF only existed on early a6xx, and was later replaced with GBIF -->
+
+	<reg32 offset="0x3000" name="VBIF_VERSION" variants="A6XX"/>
+	<reg32 offset="0x3001" name="VBIF_CLKON" variants="A6XX">
 		<bitfield pos="1" name="FORCE_ON_TESTBUS" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x302A" name="VBIF_GATE_OFF_WRREQ_EN"/>
-	<reg32 offset="0x3080" name="VBIF_XIN_HALT_CTRL0"/>
-	<reg32 offset="0x3081" name="VBIF_XIN_HALT_CTRL1"/>
-	<reg32 offset="0x3084" name="VBIF_TEST_BUS_OUT_CTRL"/>
-	<reg32 offset="0x3085" name="VBIF_TEST_BUS1_CTRL0"/>
-	<reg32 offset="0x3086" name="VBIF_TEST_BUS1_CTRL1">
+	<reg32 offset="0x302A" name="VBIF_GATE_OFF_WRREQ_EN" variants="A6XX"/>
+	<reg32 offset="0x3080" name="VBIF_XIN_HALT_CTRL0" variants="A6XX"/>
+	<reg32 offset="0x3081" name="VBIF_XIN_HALT_CTRL1" variants="A6XX"/>
+	<reg32 offset="0x3084" name="VBIF_TEST_BUS_OUT_CTRL" variants="A6XX"/>
+	<reg32 offset="0x3085" name="VBIF_TEST_BUS1_CTRL0" variants="A6XX"/>
+	<reg32 offset="0x3086" name="VBIF_TEST_BUS1_CTRL1" variants="A6XX">
 		<bitfield low="0" high="3" name="DATA_SEL"/>
 	</reg32>
-	<reg32 offset="0x3087" name="VBIF_TEST_BUS2_CTRL0"/>
-	<reg32 offset="0x3088" name="VBIF_TEST_BUS2_CTRL1">
+	<reg32 offset="0x3087" name="VBIF_TEST_BUS2_CTRL0" variants="A6XX"/>
+	<reg32 offset="0x3088" name="VBIF_TEST_BUS2_CTRL1" variants="A6XX">
 		<bitfield low="0" high="8" name="DATA_SEL"/>
 	</reg32>
-	<reg32 offset="0x308c" name="VBIF_TEST_BUS_OUT"/>
-	<reg32 offset="0x30d0" name="VBIF_PERF_CNT_SEL0"/>
-	<reg32 offset="0x30d1" name="VBIF_PERF_CNT_SEL1"/>
-	<reg32 offset="0x30d2" name="VBIF_PERF_CNT_SEL2"/>
-	<reg32 offset="0x30d3" name="VBIF_PERF_CNT_SEL3"/>
-	<reg32 offset="0x30d8" name="VBIF_PERF_CNT_LOW0"/>
-	<reg32 offset="0x30d9" name="VBIF_PERF_CNT_LOW1"/>
-	<reg32 offset="0x30da" name="VBIF_PERF_CNT_LOW2"/>
-	<reg32 offset="0x30db" name="VBIF_PERF_CNT_LOW3"/>
-	<reg32 offset="0x30e0" name="VBIF_PERF_CNT_HIGH0"/>
-	<reg32 offset="0x30e1" name="VBIF_PERF_CNT_HIGH1"/>
-	<reg32 offset="0x30e2" name="VBIF_PERF_CNT_HIGH2"/>
-	<reg32 offset="0x30e3" name="VBIF_PERF_CNT_HIGH3"/>
-	<reg32 offset="0x3100" name="VBIF_PERF_PWR_CNT_EN0"/>
-	<reg32 offset="0x3101" name="VBIF_PERF_PWR_CNT_EN1"/>
-	<reg32 offset="0x3102" name="VBIF_PERF_PWR_CNT_EN2"/>
-	<reg32 offset="0x3110" name="VBIF_PERF_PWR_CNT_LOW0"/>
-	<reg32 offset="0x3111" name="VBIF_PERF_PWR_CNT_LOW1"/>
-	<reg32 offset="0x3112" name="VBIF_PERF_PWR_CNT_LOW2"/>
-	<reg32 offset="0x3118" name="VBIF_PERF_PWR_CNT_HIGH0"/>
-	<reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1"/>
-	<reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2"/>
-
+	<reg32 offset="0x308c" name="VBIF_TEST_BUS_OUT" variants="A6XX"/>
+	<reg32 offset="0x30d0" name="VBIF_PERF_CNT_SEL0" variants="A6XX"/>
+	<reg32 offset="0x30d1" name="VBIF_PERF_CNT_SEL1" variants="A6XX"/>
+	<reg32 offset="0x30d2" name="VBIF_PERF_CNT_SEL2" variants="A6XX"/>
+	<reg32 offset="0x30d3" name="VBIF_PERF_CNT_SEL3" variants="A6XX"/>
+	<reg32 offset="0x30d8" name="VBIF_PERF_CNT_LOW0" variants="A6XX"/>
+	<reg32 offset="0x30d9" name="VBIF_PERF_CNT_LOW1" variants="A6XX"/>
+	<reg32 offset="0x30da" name="VBIF_PERF_CNT_LOW2" variants="A6XX"/>
+	<reg32 offset="0x30db" name="VBIF_PERF_CNT_LOW3" variants="A6XX"/>
+	<reg32 offset="0x30e0" name="VBIF_PERF_CNT_HIGH0" variants="A6XX"/>
+	<reg32 offset="0x30e1" name="VBIF_PERF_CNT_HIGH1" variants="A6XX"/>
+	<reg32 offset="0x30e2" name="VBIF_PERF_CNT_HIGH2" variants="A6XX"/>
+	<reg32 offset="0x30e3" name="VBIF_PERF_CNT_HIGH3" variants="A6XX"/>
+	<reg32 offset="0x3100" name="VBIF_PERF_PWR_CNT_EN0" variants="A6XX"/>
+	<reg32 offset="0x3101" name="VBIF_PERF_PWR_CNT_EN1" variants="A6XX"/>
+	<reg32 offset="0x3102" name="VBIF_PERF_PWR_CNT_EN2" variants="A6XX"/>
+	<reg32 offset="0x3110" name="VBIF_PERF_PWR_CNT_LOW0" variants="A6XX"/>
+	<reg32 offset="0x3111" name="VBIF_PERF_PWR_CNT_LOW1" variants="A6XX"/>
+	<reg32 offset="0x3112" name="VBIF_PERF_PWR_CNT_LOW2" variants="A6XX"/>
+	<reg32 offset="0x3118" name="VBIF_PERF_PWR_CNT_HIGH0" variants="A6XX"/>
+	<reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1" variants="A6XX"/>
+	<reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2" variants="A6XX"/>
+
+	<reg32 offset="0x3c00" name="GBIF_CX_CONFIG" variants="A8XX-"/>
 	<reg32 offset="0x3c01" name="GBIF_SCACHE_CNTL0"/>
 	<reg32 offset="0x3c02" name="GBIF_SCACHE_CNTL1"/>
 	<reg32 offset="0x3c03" name="GBIF_QSB_SIDE0"/>
@@ -712,26 +1247,55 @@ by a particular renderpass/blit.
 	<reg32 offset="0x3c06" name="GBIF_QSB_SIDE3"/>
 	<reg32 offset="0x3c45" name="GBIF_HALT"/>
 	<reg32 offset="0x3c46" name="GBIF_HALT_ACK"/>
+	<reg32 offset="0x3c49" name="GBIF_REINIT_ENABLE" variants="A8XX-"/>
+	<reg32 offset="0x3c4a" name="GBIF_REINIT_DONE" variants="A8XX-"/>
 	<reg32 offset="0x3cc0" name="GBIF_PERF_PWR_CNT_EN"/>
 	<reg32 offset="0x3cc1" name="GBIF_PERF_PWR_CNT_CLR"/>
 	<reg32 offset="0x3cc2" name="GBIF_PERF_CNT_SEL"/>
-	<reg32 offset="0x3cc3" name="GBIF_PERF_PWR_CNT_SEL"/>
-	<reg32 offset="0x3cc4" name="GBIF_PERF_CNT_LOW0"/>
-	<reg32 offset="0x3cc5" name="GBIF_PERF_CNT_LOW1"/>
-	<reg32 offset="0x3cc6" name="GBIF_PERF_CNT_LOW2"/>
-	<reg32 offset="0x3cc7" name="GBIF_PERF_CNT_LOW3"/>
-	<reg32 offset="0x3cc8" name="GBIF_PERF_CNT_HIGH0"/>
-	<reg32 offset="0x3cc9" name="GBIF_PERF_CNT_HIGH1"/>
-	<reg32 offset="0x3cca" name="GBIF_PERF_CNT_HIGH2"/>
-	<reg32 offset="0x3ccb" name="GBIF_PERF_CNT_HIGH3"/>
-	<reg32 offset="0x3ccc" name="GBIF_PWR_CNT_LOW0"/>
-	<reg32 offset="0x3ccd" name="GBIF_PWR_CNT_LOW1"/>
-	<reg32 offset="0x3cce" name="GBIF_PWR_CNT_LOW2"/>
-	<reg32 offset="0x3ccf" name="GBIF_PWR_CNT_HIGH0"/>
-	<reg32 offset="0x3cd0" name="GBIF_PWR_CNT_HIGH1"/>
-	<reg32 offset="0x3cd1" name="GBIF_PWR_CNT_HIGH2"/>
+	<reg32 offset="0x3cc3" name="GBIF_PERF_CNT_SEL_1" variants="A8XX-"/>
+
+	<reg32 offset="0x3cc3" name="GBIF_PERF_PWR_CNT_SEL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3cc4" name="GBIF_PERF_CNT_LOW0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3cc5" name="GBIF_PERF_CNT_LOW1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3cc6" name="GBIF_PERF_CNT_LOW2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3cc7" name="GBIF_PERF_CNT_LOW3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3cc8" name="GBIF_PERF_CNT_HIGH0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3cc9" name="GBIF_PERF_CNT_HIGH1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3cca" name="GBIF_PERF_CNT_HIGH2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3ccb" name="GBIF_PERF_CNT_HIGH3" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3ccc" name="GBIF_PWR_CNT_LOW0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3ccd" name="GBIF_PWR_CNT_LOW1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3cce" name="GBIF_PWR_CNT_LOW2" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3ccf" name="GBIF_PWR_CNT_HIGH0" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3cd0" name="GBIF_PWR_CNT_HIGH1" variants="A6XX-A7XX"/>
+	<reg32 offset="0x3cd1" name="GBIF_PWR_CNT_HIGH2" variants="A6XX-A7XX"/>
+
+	<reg32 offset="0x3cc4" name="GBIF_PWR_CNT_SEL" variants="A8XX"/>
+	<reg32 offset="0x3cc6" name="GBIF_PERF_CNT_LO_0" variants="A8XX"/>
+	<reg32 offset="0x3cc7" name="GBIF_PERF_CNT_HI_0" variants="A8XX"/>
+	<reg32 offset="0x3cc8" name="GBIF_PERF_CNT_LO_1" variants="A8XX"/>
+	<reg32 offset="0x3cc9" name="GBIF_PERF_CNT_HI_1" variants="A8XX"/>
+	<reg32 offset="0x3cca" name="GBIF_PERF_CNT_LO_2" variants="A8XX"/>
+	<reg32 offset="0x3ccb" name="GBIF_PERF_CNT_HI_2" variants="A8XX"/>
+	<reg32 offset="0x3ccc" name="GBIF_PERF_CNT_LO_3" variants="A8XX"/>
+	<reg32 offset="0x3ccd" name="GBIF_PERF_CNT_HI_3" variants="A8XX"/>
+	<reg32 offset="0x3cce" name="GBIF_PERF_CNT_LO_4" variants="A8XX"/>
+	<reg32 offset="0x3ccf" name="GBIF_PERF_CNT_HI_4" variants="A8XX"/>
+	<reg32 offset="0x3cd0" name="GBIF_PERF_CNT_LO_5" variants="A8XX"/>
+	<reg32 offset="0x3cd1" name="GBIF_PERF_CNT_HI_5" variants="A8XX"/>
+	<reg32 offset="0x3cd2" name="GBIF_PERF_CNT_LO_6" variants="A8XX"/>
+	<reg32 offset="0x3cd3" name="GBIF_PERF_CNT_HI_6" variants="A8XX"/>
+	<reg32 offset="0x3cd4" name="GBIF_PERF_CNT_LO_7" variants="A8XX"/>
+	<reg32 offset="0x3cd5" name="GBIF_PERF_CNT_HI_7" variants="A8XX"/>
+	<reg32 offset="0x3ce0" name="GBIF_PWR_CNT_LO_0" variants="A8XX"/>
+	<reg32 offset="0x3ce1" name="GBIF_PWR_CNT_LO_1" variants="A8XX"/>
+	<reg32 offset="0x3ce2" name="GBIF_PWR_CNT_LO_2" variants="A8XX"/>
+	<reg32 offset="0x3ce3" name="GBIF_PWR_CNT_HI_0" variants="A8XX"/>
+	<reg32 offset="0x3ce4" name="GBIF_PWR_CNT_HI_1" variants="A8XX"/>
+	<reg32 offset="0x3ce5" name="GBIF_PWR_CNT_HI_2" variants="A8XX"/>
 
 	<reg32 offset="0x0c00" name="VSC_DBG_ECO_CNTL"/>
+	<reg32 offset="0x0df0" name="VSC_KMD_DBG_ECO_CNTL" variants="A8XX-"/>
 	<reg32 offset="0x0c02" name="VSC_BIN_SIZE" usage="rp_blit">
 		<bitfield name="WIDTH" low="0" high="7" shr="5" type="uint"/>
 		<bitfield name="HEIGHT" low="8" high="16" shr="4" type="uint"/>
@@ -803,10 +1367,14 @@ by a particular renderpass/blit.
 
 	<reg32 offset="0x0d08" name="VSC_UNKNOWN_0D08" variants="A7XX-" usage="rp_blit"/>
 
-	<reg32 offset="0x0E10" name="UCHE_UNKNOWN_0E10" variants="A7XX-" usage="cmd"/>
-	<reg32 offset="0x0E11" name="UCHE_UNKNOWN_0E11" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x0e10" name="UCHE_UNKNOWN_0E10" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0x0e10" name="UCHE_VARB_IDLE_TIMEOUT" variants="A8XX-"/>
+	<reg32 offset="0x0e11" name="UCHE_UNKNOWN_0E11" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0x0e11" name="UCHE_CLIENT_PF" variants="A8XX-"/>
 	<!-- always 0x03200000 ? -->
-	<reg32 offset="0x0e12" name="UCHE_UNKNOWN_0E12"  usage="cmd"/>
+	<reg32 offset="0x0e12" name="UCHE_UNKNOWN_0E12" variants="A6XX-A7XX" usage="cmd"/>
+	<reg32 offset="0x0e15" name="UCHE_DBG_ECO_CNTL_0" variants="A8XX-"/>
+	<reg32 offset="0x0e16" name="UCHE_HW_DBG_CNTL" variants="A8XX-"/>
 
 	<!-- adreno_reg_xy has 15 bits per coordinate, but a6xx registers only have 14 -->
 	<bitset name="a6xx_reg_xy" inline="yes">
@@ -829,6 +1397,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8000" name="GRAS_CL_CNTL" type="a6xx_gras_cl_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8200" name="GRAS_CL_CNTL" type="a6xx_gras_cl_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_xs_clip_cull_distance" inline="yes">
 		<bitfield name="CLIP_MASK" low="0" high="7"/>
@@ -839,6 +1408,18 @@ by a particular renderpass/blit.
 	<reg32 offset="0x8003" name="GRAS_CL_GS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A6XX-A7XX" />
 	<reg32 offset="0x8004" name="GRAS_CL_ARRAY_SIZE" low="0" high="10" type="uint" usage="rp_blit" variants="A6XX-A7XX" />
 
+	<reg32 offset="0x8201" name="GRAS_CL_VS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A8XX" />
+	<reg32 offset="0x8202" name="GRAS_CL_DS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A8XX" />
+	<reg32 offset="0x8203" name="GRAS_CL_GS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A8XX" />
+	<reg32 offset="0x8204" name="GRAS_CL_ARRAY_SIZE" low="0" high="10" type="uint" usage="rp_blit" variants="A8XX" />
+
+	<reg32 offset="0x8228" name="GRAS_UNKNOWN_8228" variants="A8XX-"/>
+	<reg32 offset="0x8229" name="GRAS_UNKNOWN_8229" variants="A8XX-"/>
+	<reg32 offset="0x822a" name="GRAS_UNKNOWN_822A" variants="A8XX-"/>
+	<reg32 offset="0x822b" name="GRAS_UNKNOWN_822B" variants="A8XX-"/>
+	<reg32 offset="0x822c" name="GRAS_UNKNOWN_822C" variants="A8XX-"/>
+	<reg32 offset="0x822d" name="GRAS_UNKNOWN_822D" variants="A8XX-"/>
+
 	<bitset name="a6xx_gras_cl_interp_cntl" inline="yes">
 		<!-- see also RB_INTERP_CNTL -->
 		<bitfield name="IJ_PERSP_PIXEL" pos="0" type="boolean"/>
@@ -853,6 +1434,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8005" name="GRAS_CL_INTERP_CNTL" type="a6xx_gras_cl_interp_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8080" name="GRAS_CL_INTERP_CNTL" type="a6xx_gras_cl_interp_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_cl_guardband_clip_adj" inline="true">
 		<bitfield name="HORZ" low="0" high="8" type="uint"/>
@@ -860,9 +1442,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8006" name="GRAS_CL_GUARDBAND_CLIP_ADJ" type="a6xx_gras_cl_guardband_clip_adj" variants="A6XX-A7XX" usage="rp_blit"/>
-
-	<!-- Something connected to depth-stencil attachment size -->
-	<reg32 offset="0x8007" name="GRAS_UNKNOWN_8007" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0x8205" name="GRAS_CL_GUARDBAND_CLIP_ADJ" type="a6xx_gras_cl_guardband_clip_adj" variants="A8XX-" usage="rp_blit"/>
 
 	<!-- the scale/offset is per view, with up to 6 views -->
 	<bitset name="a6xx_gras_bin_foveat" inline="yes">
@@ -887,6 +1467,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8008" name="GRAS_BIN_FOVEAT" type="a6xx_gras_bin_foveat" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0x8206" name="GRAS_BIN_FOVEAT" type="a6xx_gras_bin_foveat" variants="A8XX-" usage="cmd"/>
 
 	<reg32 offset="0x8009" name="GRAS_BIN_FOVEAT_OFFSET_0" variants="A7XX-" usage="cmd">
 		<bitfield name="XOFFSET_0" low="0" high="9" shr="2" type="uint"/>
@@ -921,10 +1502,23 @@ by a particular renderpass/blit.
 		<reg32 offset="5" name="ZSCALE" type="float"/>
 	</array>
 
+	<array offset="0x82d0" name="GRAS_CL_VIEWPORT" stride="6" length="16" variants="A8XX-" usage="rp_blit">
+		<reg32 offset="0" name="XOFFSET" type="float"/>
+		<reg32 offset="1" name="XSCALE" type="float"/>
+		<reg32 offset="2" name="YOFFSET" type="float"/>
+		<reg32 offset="3" name="YSCALE" type="float"/>
+		<reg32 offset="4" name="ZOFFSET" type="float"/>
+		<reg32 offset="5" name="ZSCALE" type="float"/>
+	</array>
+
 	<array offset="0x8070" name="GRAS_CL_VIEWPORT_ZCLAMP" stride="2" length="16" variants="A6XX-A7XX" usage="rp_blit">
 		<reg32 offset="0" name="MIN" type="float"/>
 		<reg32 offset="1" name="MAX" type="float"/>
 	</array>
+	<array offset="0x80c0" name="GRAS_CL_VIEWPORT_ZCLAMP" stride="2" length="16" variants="A8XX-" usage="rp_blit">
+		<reg32 offset="0" name="MIN" type="float"/>
+		<reg32 offset="1" name="MAX" type="float"/>
+	</array>
 
 	<bitset name="a6xx_gras_su_cntl" varset="chip">
 		<bitfield name="CULL_FRONT" pos="0" type="boolean"/>
@@ -951,6 +1545,13 @@ by a particular renderpass/blit.
 		<bitfield name="UNK20" low="20" high="22" variants="A6XX-A7XX"/>
 	</bitset>
 	<reg32 offset="0x8090" name="GRAS_SU_CNTL" type="a6xx_gras_su_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8209" name="GRAS_SU_CNTL" type="a6xx_gras_su_cntl" variants="A8XX-" usage="rp_blit"/>
+
+	<!-- Fields moved from GRAS_SU_CNTL on earlier gens: -->
+	<reg32 offset="0x820c" name="GRAS_SU_STEREO_CNTL" variants="A8XX-" usage="rp_blit">
+		<bitfield name="RENDERTARGETINDEXINCR" pos="18" type="boolean"/>
+		<bitfield name="VIEWPORTINDEXINCR" pos="19" type="boolean"/>
+	</reg32>
 
 	<bitset name="a6xx_gras_su_point_minmax" inline="yes">
 		<bitfield name="MIN" low="0" high="15" type="ufixed" radix="4"/>
@@ -958,25 +1559,31 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8091" name="GRAS_SU_POINT_MINMAX" type="a6xx_gras_su_point_minmax" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x820a" name="GRAS_SU_POINT_MINMAX" type="a6xx_gras_su_point_minmax" variants="A8XX-" usage="rp_blit"/>
+
 	<reg32 offset="0x8092" name="GRAS_SU_POINT_SIZE" low="0" high="15" type="fixed" radix="4" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x820b" name="GRAS_SU_POINT_SIZE" low="0" high="15" type="fixed" radix="4" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_su_depth_cntl" inline="yes">
 		<bitfield name="Z_TEST_ENABLE" pos="0" type="boolean"/>
 	</bitset>
 
 	<reg32 offset="0x8114" name="GRAS_SU_DEPTH_CNTL" variants="A6XX-A7XX" type="a6xx_gras_su_depth_cntl" usage="rp_blit"/>
+	<reg32 offset="0x8086" name="GRAS_SU_DEPTH_CNTL" variants="A8XX-" type="a6xx_gras_su_depth_cntl" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_su_stencil_cntl" inline="yes">
 		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
 	</bitset>
 
 	<reg32 offset="0x8115" name="GRAS_SU_STENCIL_CNTL" type="a6xx_gras_su_stencil_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8087" name="GRAS_SU_STENCIL_CNTL" type="a6xx_gras_su_stencil_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_su_render_cntl" inline="yes">
 		<bitfield name="FS_DISABLE" pos="7" type="boolean"/>
 	</bitset>
 
 	<reg32 offset="0x8116" name="GRAS_SU_RENDER_CNTL" type="a6xx_gras_su_render_cntl" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8088" name="GRAS_SU_RENDER_CNTL" type="a6xx_gras_su_render_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<!-- 0x8093 invalid -->
 	<bitset name="a6xx_depth_plane_cntl" inline="yes">
@@ -984,9 +1591,17 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8094" name="GRAS_SU_DEPTH_PLANE_CNTL" type="a6xx_depth_plane_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8089" name="GRAS_SU_DEPTH_PLANE_CNTL" type="a6xx_depth_plane_cntl" variants="A8XX-" usage="rp_blit"/>
+
 	<reg32 offset="0x8095" name="GRAS_SU_POLY_OFFSET_SCALE" type="float" variants="A6XX-A7XX"  usage="rp_blit"/>
+	<reg32 offset="0x808a" name="GRAS_SU_POLY_OFFSET_SCALE" type="float" variants="A8XX-"  usage="rp_blit"/>
+
 	<reg32 offset="0x8096" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float" variants="A6XX-A7XX"  usage="rp_blit"/>
+	<reg32 offset="0x808b" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float" variants="A8XX-"  usage="rp_blit"/>
+
 	<reg32 offset="0x8097" name="GRAS_SU_POLY_OFFSET_OFFSET_CLAMP" type="float" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x808c" name="GRAS_SU_POLY_OFFSET_OFFSET_CLAMP" type="float" variants="A8XX-" usage="rp_blit"/>
+
 	<bitset name="a6xx_depth_buffer_info" inline="yes">
 		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
 		<bitfield name="UNK3" pos="3"/>
@@ -994,6 +1609,7 @@ by a particular renderpass/blit.
 
 	<!-- duplicates RB_DEPTH_BUFFER_INFO: -->
 	<reg32 offset="0x8098" name="GRAS_SU_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x808d" name="GRAS_SU_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_su_conservative_ras_cntl" inline="yes">
 		<bitfield name="CONSERVATIVERASEN" pos="0" type="boolean"/>
@@ -1008,6 +1624,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8099" name="GRAS_SU_CONSERVATIVE_RAS_CNTL" type="a6xx_gras_su_conservative_ras_cntl" variants="A6XX-A7XX" usage="cmd"/>
+	<reg32 offset="0x820d" name="GRAS_SU_CONSERVATIVE_RAS_CNTL" type="a6xx_gras_su_conservative_ras_cntl" variants="A8XX-" usage="cmd"/>
 
 	<reg32 offset="0x809a" name="GRAS_SU_PATH_RENDERING_CNTL">
 		<bitfield name="UNK0" pos="0" type="boolean"/>
@@ -1022,10 +1639,16 @@ by a particular renderpass/blit.
 	<reg32 offset="0x809c" name="GRAS_SU_GS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x809d" name="GRAS_SU_DS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
+	<reg32 offset="0x820e" name="GRAS_SU_VS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A8XX" usage="rp_blit"/>
+	<reg32 offset="0x820f" name="GRAS_SU_GS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A8XX" usage="rp_blit"/>
+	<reg32 offset="0x8210" name="GRAS_SU_DS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A8XX" usage="rp_blit"/>
+
 	<bitset name="a6xx_rast_cntl" inline="yes">
 		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
 	</bitset>
 
+	<reg32 offset="0x8211" name="GRAS_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX-" usage="rp_blit"/>
+
 	<enum name="a6xx_sequenced_thread_dist">
 		<value value="0x0" name="DIST_SCREEN_COORD"/>
 		<value value="0x1" name="DIST_ALL_TO_RB0"/>
@@ -1085,6 +1708,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x80a0" name="GRAS_SC_CNTL" type="a6xx_gras_sc_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8230" name="GRAS_SC_CNTL" type="a6xx_gras_sc_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<enum name="a6xx_render_mode">
 		<value value="0x0" name="RENDERING_PASS"/>
@@ -1123,6 +1747,23 @@ by a particular renderpass/blit.
 
 	<reg32 offset="0x80a1" name="GRAS_SC_BIN_CNTL" type="a6xx_bin_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
+	<bitset name="a8xx_bin_cntl" inline="yes">
+		<bitfield name="BINW" low="0" high="9" shr="5" type="uint"/>
+		<bitfield name="BINH" low="16" high="26" shr="4" type="uint"/>
+		<bitfield name="RENDER_MODE" low="11" high="13" type="a6xx_render_mode"/>
+		<doc>Disable LRZ feedback writes</doc>
+		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="14" type="boolean"/>
+		<doc>
+			Allows draws that don't have GRAS_LRZ_CNTL.LRZ_WRITE but have
+			GRAS_LRZ_CNTL.ENABLE to contribute to LRZ during RENDERING pass.
+			In sysmem mode GRAS_LRZ_CNTL.LRZ_WRITE is not considered.
+		</doc>
+		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="28" high="30" type="a6xx_lrz_feedback_mask"/>
+		<bitfield name="FORCE_LRZ_DIS" pos="31" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x8231" name="GRAS_SC_BIN_CNTL" type="a8xx_bin_cntl" variants="A8XX-" usage="rp_blit"/>
+
 	<bitset name="a6xx_gras_sc_ras_msaa_cntl" inline="yes">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
 		<bitfield name="UNK2" pos="2"/>
@@ -1130,6 +1771,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x80a2" name="GRAS_SC_RAS_MSAA_CNTL" type="a6xx_gras_sc_ras_msaa_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8232" name="GRAS_SC_RAS_MSAA_CNTL" type="a6xx_gras_sc_ras_msaa_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_sc_dest_msaa_cntl" inline="yes">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
@@ -1137,6 +1779,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x80a3" name="GRAS_SC_DEST_MSAA_CNTL" type="a6xx_gras_sc_dest_msaa_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8233" name="GRAS_SC_DEST_MSAA_CNTL" type="a6xx_gras_sc_dest_msaa_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_msaa_sample_pos_cntl" inline="yes">
 		<bitfield name="UNK0" pos="0"/>
@@ -1158,13 +1801,21 @@ by a particular renderpass/blit.
 	<reg32 offset="0x80a5" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x80a6" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" variants="A6XX-A7XX" usage="rp_blit"/>
 
+	<reg32 offset="0x8237" name="GRAS_SC_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8238" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8239" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x823a" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_2" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x823b" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_3" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="rp_blit"/>
+
 	<reg32 offset="0x80a7" name="GRAS_ROTATION_CNTL" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0x8207" name="GRAS_ROTATION_CNTL" variants="A8XX-" usage="cmd"/>
 
 	<bitset name="a6xx_screen_scissor_cntl" inline="yes">
 		<bitfield name="SCISSOR_DISABLE" pos="0" type="boolean"/>
 	</bitset>
 
 	<reg32 offset="0x80af" name="GRAS_SC_SCREEN_SCISSOR_CNTL" type="a6xx_screen_scissor_cntl" variants="A6XX-A7XX" pos="0" usage="cmd"/>
+	<reg32 offset="0x8234" name="GRAS_SC_SCREEN_SCISSOR_CNTL" type="a6xx_screen_scissor_cntl" variants="A8XX-" pos="0" usage="cmd"/>
 
 	<bitset name="a6xx_scissor_xy" inline="yes">
 		<bitfield name="X" low="0" high="15" type="uint"/>
@@ -1176,14 +1827,26 @@ by a particular renderpass/blit.
 		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
 	</array>
 
+	<array offset="0x8240" name="GRAS_SC_SCREEN_SCISSOR" stride="2" length="16" variants="A8XX-" usage="rp_blit">
+		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
+		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
+	</array>
+
 	<array offset="0x80d0" name="GRAS_SC_VIEWPORT_SCISSOR" stride="2" length="16" variants="A6XX-A7XX" usage="rp_blit">
 		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
 		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
 	</array>
+	<array offset="0x8270" name="GRAS_SC_VIEWPORT_SCISSOR" stride="2" length="16" variants="A8XX-" usage="rp_blit">
+		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
+		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
+	</array>
 
 	<reg32 offset="0x80f0" name="GRAS_SC_WINDOW_SCISSOR_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x80f1" name="GRAS_SC_WINDOW_SCISSOR_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
 
+	<reg32 offset="0x8235" name="GRAS_SC_WINDOW_SCISSOR_TL" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8236" name="GRAS_SC_WINDOW_SCISSOR_BR" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
+
 	<enum name="a6xx_fsr_combiner">
 		<value value="0" name="FSR_COMBINER_OP_KEEP"/>
 		<value value="1" name="FSR_COMBINER_OP_REPLACE"/>
@@ -1203,6 +1866,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x80f4" name="GRAS_VRS_CONFIG" type="a6xx_gras_vrs_config" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8208" name="GRAS_VRS_CONFIG" type="a6xx_gras_vrs_config" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_quality_buffer_info" inline="yes">
 		<bitfield name="LAYERED" pos="0" type="boolean"/>
@@ -1210,6 +1874,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x80f5" name="GRAS_QUALITY_BUFFER_INFO" type="a6xx_gras_quality_buffer_info" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x808e" name="GRAS_QUALITY_BUFFER_INFO" type="a6xx_gras_quality_buffer_info" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_quality_buffer_dimension" inline="yes">
 		<bitfield name="WIDTH" low="0" high="15" type="uint"/>
@@ -1217,8 +1882,10 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x80f6" name="GRAS_QUALITY_BUFFER_DIMENSION" type="a6xx_gras_quality_buffer_dimension" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x808f" name="GRAS_QUALITY_BUFFER_DIMENSION" type="a6xx_gras_quality_buffer_dimension" variants="A8XX-" usage="rp_blit"/>
 
 	<reg64 offset="0x80f8" name="GRAS_QUALITY_BUFFER_BASE" variants="A7XX" type="waddress" usage="rp_blit"/>
+	<reg64 offset="0x8090" name="GRAS_QUALITY_BUFFER_BASE" variants="A8XX-" type="waddress" usage="rp_blit"/>
 
 	<bitset name="a6xx_gras_quality_buffer_pitch" inline="yes">
 		<bitfield name="PITCH" shr="6" low="0" high="7" type="uint"/>
@@ -1226,6 +1893,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x80fa" name="GRAS_QUALITY_BUFFER_PITCH" type="a6xx_gras_quality_buffer_pitch" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8092" name="GRAS_QUALITY_BUFFER_PITCH" type="a6xx_gras_quality_buffer_pitch" variants="A8XX-" usage="rp_blit"/>
 
 	<enum name="a6xx_lrz_dir_status">
 		<value value="0x1" name="LRZ_DIR_LE"/>
@@ -1263,6 +1931,12 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8100" name="GRAS_LRZ_CNTL" type="a6xx_gras_lrz_cntl" usage="rp_blit" variants="A6XX-A7XX"/>
+	<reg32 offset="0x8212" name="GRAS_LRZ_CNTL" type="a6xx_gras_lrz_cntl" usage="rp_blit" variants="A8XX-"/>
+
+	<reg32 offset="0x8007" name="GRAS_LRZ_CB_CNTL" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8101" name="GRAS_LRZ_CB_CNTL" usage="rp_blit" variants="A8XX-">
+		<bitfield name="DOUBLE_BUFFER_PITCH" low="8" high="31" shr="8"/>
+	</reg32>
 
 	<enum name="a6xx_fragcoord_sample_mode">
 		<value value="0" name="FRAGCOORD_CENTER"/>
@@ -1275,14 +1949,17 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8101" name="GRAS_LRZ_PS_INPUT_CNTL" type="a6xx_gras_lrz_ps_input_cntl" usage="rp_blit" variants="A6XX-A7XX"/>
+	<reg32 offset="0x8102" name="GRAS_LRZ_PS_INPUT_CNTL" type="a6xx_gras_lrz_ps_input_cntl" usage="rp_blit" variants="A8XX-"/>
 
 	<bitset name="a6xx_gras_lrz_mrt_buffer_info_0" inline="yes">
 		<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
 	</bitset>
 
 	<reg32 offset="0x8102" name="GRAS_LRZ_MRT_BUFFER_INFO_0" type="a6xx_gras_lrz_mrt_buffer_info_0" usage="rp_blit" variants="A6XX-A7XX"/>
+	<reg32 offset="0x8103" name="GRAS_LRZ_MRT_BUFFER_INFO_0" type="a6xx_gras_lrz_mrt_buffer_info_0" usage="rp_blit" variants="A8XX-"/>
 
 	<reg64 offset="0x8103" name="GRAS_LRZ_BUFFER_BASE" align="256" type="waddress" usage="rp_blit" variants="A6XX-A7XX"/>
+	<reg64 offset="0x8104" name="GRAS_LRZ_BUFFER_BASE" align="256" type="waddress" usage="rp_blit" variants="A8XX-"/>
 
 	<bitset name="a6xx_gras_lrz_buffer_pitch" inline="yes">
 		<bitfield name="PITCH" low="0" high="7" shr="5" type="uint"/>
@@ -1290,6 +1967,9 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8105" name="GRAS_LRZ_BUFFER_PITCH" type="a6xx_gras_lrz_buffer_pitch" usage="rp_blit" variants="A6XX-A7XX"/>
+	<reg32 offset="0x8108" name="GRAS_LRZ_BUFFER_PITCH" type="a6xx_gras_lrz_buffer_pitch" usage="rp_blit" variants="A8XX-"/>
+
+	<reg32 offset="0x810e" name="GRAS_LRZ_BUFFER_STRIDE" usage="rp_blit" low="0" high="16" shr="12" variants="A8XX-"/>
 
 	<!--
 	The LRZ "fast clear" buffer is initialized to zero's by blob, and
@@ -1346,10 +2026,14 @@ by a particular renderpass/blit.
 
 	<!-- 0x810c-0x810f invalid -->
 
+	<reg32 offset="0x8110" name="GRAS_LRZ_BUFFER_SLICE_PITCH" low="8" high="31" shr="8" variants="A8XX-"/>
+
 	<reg32 offset="0x8110" name="GRAS_MODE_CNTL" low="0" high="1" variants="A6XX-A7XX" usage="cmd"/>
+	<reg32 offset="0x8213" name="GRAS_MODE_CNTL" low="0" high="1" variants="A8XX-" usage="cmd"/>
 
 	<!-- A bit tentative but it's a color and it is followed by LRZ_CLEAR -->
 	<reg32 offset="0x8111" name="GRAS_LRZ_DEPTH_CLEAR" type="float" variants="A7XX"/>
+	<reg32 offset="0x810d" name="GRAS_LRZ_DEPTH_CLEAR" type="float" variants="A8XX-"/>
 
 	<bitset name="a6xx_gras_lrz_depth_buffer_info" inline="yes">
 		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
@@ -1357,11 +2041,11 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8113" name="GRAS_LRZ_DEPTH_BUFFER_INFO" type="a6xx_gras_lrz_depth_buffer_info" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x810f" name="GRAS_LRZ_DEPTH_BUFFER_INFO" type="a6xx_gras_lrz_depth_buffer_info" variants="A8XX" usage="rp_blit"/>
 
 	<doc>LUT used to convert quality buffer values to HW shading rate values. An array of 4-bit values.</doc>
-	<array offset="0x8120" name="GRAS_LRZ_QUALITY_LOOKUP_TABLE" variants="A7XX-" stride="1" length="2"/>
-
-	<!-- 0x8112-0x83ff invalid -->
+	<array offset="0x8120" name="GRAS_LRZ_QUALITY_LOOKUP_TABLE" variants="A7XX" stride="1" length="2"/>
+	<array offset="0x8130" name="GRAS_LRZ_QUALITY_LOOKUP_TABLE" variants="A8XX-" stride="1" length="2"/>
 
 	<enum name="a6xx_rotation">
 		<value value="0x0" name="ROTATE_0"/>
@@ -1408,16 +2092,35 @@ by a particular renderpass/blit.
 	<reg32 offset="0x840a" name="GRAS_A2D_SCISSOR_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x840b" name="GRAS_A2D_SCISSOR_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
 
+	<reg32 offset="0x8500" name="GRAS_A2D_BLT_CNTL" type="a6xx_a2d_bit_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8501" name="GRAS_A2D_SRC_XMIN" low="8" high="24" type="int" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8502" name="GRAS_A2D_SRC_XMAX" low="8" high="24" type="int" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8503" name="GRAS_A2D_SRC_YMIN" low="8" high="24" type="int" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8504" name="GRAS_A2D_SRC_YMAX" low="8" high="24" type="int" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8505" name="GRAS_A2D_DEST_TL" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8506" name="GRAS_A2D_DEST_BR" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8507" name="GRAS_A2D_SCISSOR_TL" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8508" name="GRAS_A2D_SCISSOR_BR" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
+
 	<!-- always 0x880 ? (and 0 in a640/a650 traces?) -->
-	<reg32 offset="0x8600" name="GRAS_DBG_ECO_CNTL" usage="cmd">
+	<reg32 offset="0x8600" name="GRAS_DBG_ECO_CNTL" usage="cmd" variants="A6XX-A7XX">
 		<bitfield name="UNK7" pos="7" type="boolean"/>
 		<bitfield name="LRZCACHELOCKDIS" pos="11" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x8601" name="GRAS_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode"/>
-	<reg32 offset="0x8602" name="GRAS_NC_MODE_CNTL" variants="A7XX-"/>
-	<array offset="0x8610" name="GRAS_PERFCTR_TSE_SEL" stride="1" length="4"/>
-	<array offset="0x8614" name="GRAS_PERFCTR_RAS_SEL" stride="1" length="4"/>
-	<array offset="0x8618" name="GRAS_PERFCTR_LRZ_SEL" stride="1" length="4"/>
+	<reg32 offset="0x8600" name="GRAS_TSEFE_DBG_ECO_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x8702" name="GRAS_DBG_ECO_CNTL" variants="A8XX"/>
+	<reg32 offset="0x8601" name="GRAS_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode" variants="A6XX"/>
+	<reg32 offset="0x8602" name="GRAS_NC_MODE_CNTL" variants="A7XX"/>
+	<reg32 offset="0x8700" name="GRAS_NC_MODE_CNTL" variants="A8XX-"/>
+	<array offset="0x8610" name="GRAS_PERFCTR_TSE_SEL" stride="1" length="4" variants="A6XX-A7XX"/>
+	<array offset="0x8614" name="GRAS_PERFCTR_RAS_SEL" stride="1" length="4" variants="A6XX-A7XX"/>
+	<array offset="0x8618" name="GRAS_PERFCTR_LRZ_SEL" stride="1" length="4" variants="A6XX-A7XX"/>
+
+	<array offset="0x8610" name="GRAS_PERFCTR_TSEFE_SEL" stride="1" length="6" variants="A8XX-"/>
+	<array offset="0x8710" name="GRAS_PERFCTR_TSE_SEL" stride="1" length="6" variants="A8XX-"/>
+	<array offset="0x8720" name="GRAS_PERFCTR_RAS_SEL" stride="1" length="4" variants="A8XX-"/>
+	<array offset="0x8730" name="GRAS_PERFCTR_LRZ_SEL" stride="1" length="6" variants="A8XX-"/>
+
 
 	<!-- note 0x8620-0x87ff are not all invalid
 	(in particular, 0x8631/0x8632 have 0x3fff3fff mask and would be xy coords)
@@ -1425,6 +2128,7 @@ by a particular renderpass/blit.
 
 	<!-- same as GRAS_BIN_CONTROL, but without bit 27: -->
 	<reg32 offset="0x8800" name="RB_CNTL" variants="A6XX-A7XX" type="a6xx_bin_cntl" usage="rp_blit"/>
+	<reg32 offset="0x8800" name="RB_CNTL" variants="A8XX-" type="a8xx_bin_cntl" usage="rp_blit"/>
 
 	<reg32 offset="0x8801" name="RB_RENDER_CNTL" variants="A6XX" usage="rp_blit">
 		<bitfield name="CCUSINGLECACHELINESIZE" low="3" high="5"/>
@@ -1534,8 +2238,32 @@ by a particular renderpass/blit.
 	<reg32 offset="0x8810" name="RB_PS_SAMPLEFREQ_CNTL" usage="rp_blit">
 		<bitfield name="PER_SAMP_MODE" pos="0" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x8811" name="RB_UNKNOWN_8811" low="4" high="6" usage="cmd"/>
-	<reg32 offset="0x8812" name="RB_UNKNOWN_8812" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0x8811" name="RB_MODE_CNTL" low="4" high="6" usage="cmd"/>
+	<reg32 offset="0x8812" name="RB_BUFFER_CNTL" variants="A7XX-" usage="rp_blit">
+		<bitfield name="Z_SYSMEM" pos="0" type="boolean"/>
+		<bitfield name="S_SYSMEM" pos="1" type="boolean"/>
+		<bitfield name="RT0_SYSMEM" pos="2" type="boolean"/>
+		<bitfield name="RT1_SYSMEM" pos="3" type="boolean"/>
+		<bitfield name="RT2_SYSMEM" pos="4" type="boolean"/>
+		<bitfield name="RT3_SYSMEM" pos="5" type="boolean"/>
+		<bitfield name="RT4_SYSMEM" pos="6" type="boolean"/>
+		<bitfield name="RT5_SYSMEM" pos="7" type="boolean"/>
+		<bitfield name="RT6_SYSMEM" pos="8" type="boolean"/>
+		<bitfield name="RT7_SYSMEM" pos="9" type="boolean"/>
+		<bitfield name="Z_FULL_IN_GMEM" pos="10" type="boolean" variants="A8XX-"/>
+		<bitfield name="S_FULL_IN_GMEM" pos="11" type="boolean" variants="A8XX-"/>
+		<bitfield name="RT0_FULL_IN_GMEM" pos="12" type="boolean" variants="A8XX-"/>
+		<bitfield name="RT1_FULL_IN_GMEM" pos="13" type="boolean" variants="A8XX-"/>
+		<bitfield name="RT2_FULL_IN_GMEM" pos="14" type="boolean" variants="A8XX-"/>
+		<bitfield name="RT3_FULL_IN_GMEM" pos="15" type="boolean" variants="A8XX-"/>
+		<bitfield name="RT4_FULL_IN_GMEM" pos="16" type="boolean" variants="A8XX-"/>
+		<bitfield name="RT5_FULL_IN_GMEM" pos="17" type="boolean" variants="A8XX-"/>
+		<bitfield name="RT6_FULL_IN_GMEM" pos="18" type="boolean" variants="A8XX-"/>
+		<bitfield name="RT7_FULL_IN_GMEM" pos="19" type="boolean" variants="A8XX-"/>
+	</reg32>
+
+	<reg32 offset="0x8816" name="RB_RESOLVE_CR_CNTL" variants="A8XX-" usage="rp_blit"/>
+
 	<!-- 0x8813-0x8817 invalid -->
 	<!-- always 0x0 ? -->
 	<reg32 offset="0x8818" name="RB_UNKNOWN_8818" low="0" high="6" usage="cmd"/>
@@ -1627,6 +2355,8 @@ by a particular renderpass/blit.
 		</doc>
 		<bitfield name="Z_READ_ENABLE" pos="6" type="boolean"/>
 		<bitfield name="Z_BOUNDS_ENABLE" pos="7" type="boolean"/>
+		<!-- clamp shader depth out to [0, 1] (instead of RB_VIEWPORT_ZCLAMP_MIN/MAX)-->
+		<bitfield name="O_DEPTH_01_CLAMP_EN" pos="8" type="boolean" variants="A8XX-"/>
 	</reg32>
 
 	<!-- duplicates GRAS_SU_DEPTH_BUFFER_INFO: -->
@@ -1708,6 +2438,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x88c0" name="RB_VIEWPORT_ZCLAMP_MIN" type="float" usage="rp_blit" variants="A6XX-A7XX"/>
 	<reg32 offset="0x88c1" name="RB_VIEWPORT_ZCLAMP_MAX" type="float" usage="rp_blit" variants="A6XX-A7XX"/>
 
+<!-- todo allow type="float" on an <array/> -->
+	<array offset="0x88b0" name="RB_VIEWPORT_ZCLAMP_MIN" stride="1" length="16" usage="rp_blit" variants="A8XX-">
+		<reg32 offset="0" name="REG" type="float"/>
+	</array>
+	<array offset="0x88c0" name="RB_VIEWPORT_ZCLAMP_MAX" stride="1" length="16" usage="rp_blit" variants="A8XX-">
+		<reg32 offset="0" name="REG" type="float"/>
+	</array>
+
 	<!-- 0x88c2-0x88cf invalid-->
 	<reg32 offset="0x88d0" name="RB_RESOLVE_CNTL_0" usage="rp_blit">
 		<bitfield name="UNK0" low="0" high="12"/>
@@ -1720,6 +2458,14 @@ by a particular renderpass/blit.
 		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
 		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
 	</reg32>
+
+	<bitset name="a8xx_bin_size" inline="yes">
+		<bitfield name="BINW" low="0" high="9" shr="5" type="uint"/>
+		<bitfield name="BINH" low="16" high="26" shr="4" type="uint"/>
+	</bitset>
+
+	<reg32 offset="0x88d3" name="RB_RESOLVE_CNTL_3" type="a8xx_bin_size" variants="A8XX-" usage="rp_blit"/>
+
 	<reg32 offset="0x88d4" name="RB_RESOLVE_WINDOW_OFFSET" type="a6xx_reg_xy" usage="rp_blit"/>
 	<reg32 offset="0x88d5" name="RB_RESOLVE_GMEM_BUFFER_INFO" usage="rp_blit">
 		<bitfield name="SAMPLES" low="3" high="4" type="a3xx_msaa_samples"/>
@@ -1799,7 +2545,7 @@ by a particular renderpass/blit.
 		<value value="0x2" name="CCU_CACHE_SIZE_QUARTER"/>
 		<value value="0x3" name="CCU_CACHE_SIZE_EIGHTH"/>
 	</enum>
-	<reg32 offset="0x88e5" name="RB_CCU_CACHE_CNTL" variants="A7XX-" usage="cmd">
+	<reg32 offset="0x88e5" name="RB_CCU_CACHE_CNTL" variants="A7XX" usage="cmd">
 		<bitfield name="DEPTH_OFFSET_HI" pos="0" type="hex"/>
 		<bitfield name="COLOR_OFFSET_HI" pos="2" type="hex"/>
 		<bitfield name="DEPTH_CACHE_SIZE" low="10" high="11" type="a6xx_ccu_cache_size"/>
@@ -1814,7 +2560,17 @@ by a particular renderpass/blit.
 		-->
 		<bitfield name="COLOR_OFFSET" low="23" high="31" shr="12" type="hex"/>
 	</reg32>
-	<!-- 0x88e6-0x88ef invalid -->
+	<reg32 offset="0x88e5" name="RB_CCU_CACHE_CNTL" variants="A8XX-" usage="cmd">
+		<bitfield name="COLOR_OFFSET" low="0" high="13" shr="12" type="hex"/>
+		<bitfield name="COLOR_CACHE_SIZE" low="14" high="15" type="a6xx_ccu_cache_size"/>
+		<bitfield name="DEPTH_OFFSET" low="16" high="29" shr="12" type="hex"/>
+		<bitfield name="DEPTH_CACHE_SIZE" low="30" high="31" type="a6xx_ccu_cache_size"/>
+	</reg32>
+
+	<reg32 offset="0x88e6" name="RB_RESOLVE_GMEM_BUFFER_CNTL" variants="A8XX-">
+		<bitfield name="FULL_IN_GMEM" pos="0" type="boolean"/>
+	</reg32>
+
 	<!-- always 0x0 ? -->
 	<reg32 offset="0x88f0" name="RB_UNKNOWN_88F0" low="0" high="11" usage="cmd"/>
 	<!-- could be for separate stencil? (or may not be a flag buffer at all) -->
@@ -1849,9 +2605,19 @@ by a particular renderpass/blit.
 		the address is specified through CP_EVENT_WRITE7::WRITE_SAMPLE_COUNT.
 	</doc>
 	<reg64 offset="0x8927" name="RB_SAMPLE_COUNTER_BASE" type="waddress" align="16" usage="cmd"/>
-	<!-- 0x8929-0x89ff invalid -->
 
-	<!-- TODO: there are some registers in the 0x8a00-0x8bff range -->
+	<bitset name="a8xx_gmem_dimension" inline="yes">
+		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
+		<bitfield name="HEIGHT" low="16" high="30" type="uint"/>
+	</bitset>
+
+	<reg32 offset="0x8813" name="RB_DEPTH_GMEM_DIMENSION" type="a8xx_gmem_dimension" variants="A8XX-"/>
+	<reg32 offset="0x8814" name="RB_STENCIL_GMEM_DIMENSION" type="a8xx_gmem_dimension" variants="A8XX-"/>
+	<reg32 offset="0x8815" name="RB_RESOLVE_GMEM_DIMENSION" type="a8xx_gmem_dimension" variants="A8XX-"/>
+
+	<array offset="0x8930" name="RB_MRT_GMEM_DIMENSION" variants="A8XX-" stride="1" length="8">
+		<reg32 offset="0" name="REG" type="a8xx_gmem_dimension"/>
+	</array>
 
 	<!--
 		These show up in a6xx gen3+ but so far haven't found an example of
@@ -1921,10 +2687,10 @@ by a particular renderpass/blit.
 	<!-- 0x8c35-0x8dff invalid -->
 
 	<!-- always 0x1 ? either doesn't exist for a650 or write-only: -->
-	<reg32 offset="0x8e01" name="RB_UNKNOWN_8E01" usage="cmd"/>
+	<reg32 offset="0x8e01" name="RB_RBP_CNTL" usage="cmd"/>
 	<!-- 0x8e00-0x8e03 invalid -->
 	<reg32 offset="0x8e04" name="RB_DBG_ECO_CNTL" usage="cmd"/> <!-- TODO: valid mask 0xfffffeff -->
-	<reg32 offset="0x8e05" name="RB_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode"/>
+	<reg32 offset="0x8e05" name="RB_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode" variants="A6XX"/>
 	<!-- 0x02080000 in GMEM, zero otherwise?  -->
 	<reg32 offset="0x8e06" name="RB_CCU_DBG_ECO_CNTL" variants="A7XX-" usage="cmd"/>
 
@@ -1963,7 +2729,7 @@ by a particular renderpass/blit.
 		<bitfield name="CONCURRENT_UNRESOLVE_MODE" low="5" high="6" type="a7xx_concurrent_unresolve_mode"/>
 		<!-- rest of the bits were moved to RB_CCU_CACHE_CNTL -->
 	</reg32>
-	<reg32 offset="0x8e08" name="RB_NC_MODE_CNTL">
+	<reg32 offset="0x8e08" name="RB_NC_MODE_CNTL" variants="A6XX-A7XX">
 		<bitfield name="MODE" pos="0" type="boolean"/>
 		<bitfield name="LOWER_BIT" low="1" high="2" type="uint"/>
 		<bitfield name="MIN_ACCESS_LENGTH" pos="3" type="boolean"/> <!-- true=64b false=32b -->
@@ -1972,26 +2738,40 @@ by a particular renderpass/blit.
 		<bitfield name="RGB565_PREDICATOR" pos="11" type="boolean"/>
 		<bitfield name="UNK12" low="12" high="13"/>
 	</reg32>
-	<reg32 offset="0x8e09" name="RB_UNKNOWN_8E09" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x8e08" name="RB_CCU_NC_MODE_CNTL" variants="A8XX-"/>
+
+	<reg32 offset="0x8e09" name="RB_UNKNOWN_8E09" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0x8e09" name="RB_GC_GMEM_PROTECT" variants="A8XX-"/>
+	<reg32 offset="0x8e0a" name="RB_LPAC_GMEM_PROTECT" variants="A8XX-"/>
 	<!-- 0x8e09-0x8e0f invalid -->
 	<array offset="0x8e10" name="RB_PERFCTR_RB_SEL" stride="1" length="8"/>
 	<array offset="0x8e18" name="RB_PERFCTR_CCU_SEL" stride="1" length="5"/>
 	<!-- 0x8e1d-0x8e1f invalid -->
 	<!-- 0x8e20-0x8e25 more perfcntr sel? -->
 	<!-- 0x8e26-0x8e27 invalid -->
-	<reg32 offset="0x8e28" name="RB_CMP_DBG_ECO_CNTL"/>
+
+	<reg32 offset="0x8f00" name="RB_CMP_NC_MODE_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x8f01" name="RB_RESOLVE_PREFETCH_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x8f02" name="RB_CMP_DBG_ECO_CNTL" variants="A8XX-"/>
+
+	<reg32 offset="0x8f03" name="RB_UNSLICE_STATUS" variants="A8XX-"/>
+	<reg32 offset="0x8e28" name="RB_CMP_DBG_ECO_CNTL" variants="A6XX-A7XX"/>
 	<!-- 0x8e29-0x8e2b invalid -->
-	<array offset="0x8e2c" name="RB_PERFCTR_CMP_SEL" stride="1" length="4"/>
-	<array offset="0x8e30" name="RB_PERFCTR_UFC_SEL" stride="1" length="6" variants="A7XX-"/>
-	<reg32 offset="0x8e3b" name="RB_RB_SUB_BLOCK_SEL_CNTL_HOST"/>
-	<reg32 offset="0x8e3d" name="RB_RB_SUB_BLOCK_SEL_CNTL_CD"/>
+	<array offset="0x8e2c" name="RB_PERFCTR_CMP_SEL" stride="1" length="4" variants="A6XX-A7XX"/>
+	<array offset="0x8e30" name="RB_PERFCTR_UFC_SEL" stride="1" length="6" variants="A7XX"/>
+	<array offset="0x8f04" name="RB_PERFCTR_CMP_SEL" stride="1" length="4" variants="A8XX-"/>
+	<array offset="0x8f10" name="RB_PERFCTR_UFC_SEL" stride="1" length="6" variants="A8XX-"/>
+	<reg32 offset="0x8e3b" name="RB_SUB_BLOCK_SEL_CNTL_HOST"/>
+	<reg32 offset="0x8e3d" name="RB_SUB_BLOCK_SEL_CNTL_CD"/>
+	<reg32 offset="0x8f29" name="RB_UFC_DBG_CNTL" variants="A8XX-"/>
 	<!-- 0x8e3e-0x8e4f invalid -->
 	<!-- GMEM save/restore for preemption: -->
 	<reg32 offset="0x8e50" name="RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE" pos="0" type="boolean"/>
 	<!-- address for GMEM save/restore? -->
 	<reg32 offset="0x8e51" name="RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ADDR" type="waddress" align="1"/>
-	<!-- 0x8e53-0x8e7f invalid -->
-	<reg32 offset="0x8e79" name="RB_UNKNOWN_8E79" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x8e77" name="RB_SLICE_UFC_PREFETCH_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x8e78" name="RB_SLICE_UFC_DBG_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x8e79" name="RB_UNKNOWN_8E79" variants="A7XX" usage="cmd"/>
 	<!-- 0x8e80-0x8e83 are valid -->
 	<!-- 0x8e84-0x90ff invalid -->
 
@@ -2014,6 +2794,10 @@ by a particular renderpass/blit.
 	<reg32 offset="0x9102" name="VPC_GS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x9103" name="VPC_DS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
+	<reg32 offset="0x9307" name="VPC_VS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A8XX" usage="rp_blit"/>
+	<reg32 offset="0x9308" name="VPC_GS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A8XX" usage="rp_blit"/>
+	<reg32 offset="0x9309" name="VPC_DS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A8XX" usage="rp_blit"/>
+
 	<reg32 offset="0x9311" name="VPC_VS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x9312" name="VPC_GS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x9313" name="VPC_DS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
@@ -2028,6 +2812,9 @@ by a particular renderpass/blit.
 	<reg32 offset="0x9105" name="VPC_GS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x9106" name="VPC_DS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
+	<reg32 offset="0x930a" name="VPC_VS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x930b" name="VPC_GS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x930c" name="VPC_DS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<reg32 offset="0x9314" name="VPC_VS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x9315" name="VPC_GS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
@@ -2042,6 +2829,7 @@ by a particular renderpass/blit.
 
 	<reg32 offset="0x9980" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A6XX" usage="rp_blit"/>
 	<reg32 offset="0x9107" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x930d" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A8XX-" usage="rp_blit"/>
 	<reg32 offset="0x9317" name="VPC_RAST_STREAM_CNTL_V2" type="a6xx_vpc_rast_stream_cntl" variants="A7XX" usage="rp_blit"/>
 
 	<reg32 offset="0x9107" name="VPC_UNKNOWN_9107" variants="A6XX" usage="rp_blit">
@@ -2051,6 +2839,7 @@ by a particular renderpass/blit.
 	</reg32>
 
 	<reg32 offset="0x9108" name="VPC_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x930e" name="VPC_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX-" usage="rp_blit"/>
 	<bitset name="a6xx_pc_cntl" inline="yes">
 		<bitfield name="PRIMITIVE_RESTART" pos="0" type="boolean"/>
 		<bitfield name="PROVOKING_VTX_LAST" pos="1" type="boolean"/>
@@ -2091,9 +2880,13 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x9109" name="VPC_PC_CNTL" type="a6xx_pc_cntl" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x930f" name="VPC_PC_CNTL" type="a6xx_pc_cntl" variants="A8XX-" usage="rp_blit"/>
 	<reg32 offset="0x910a" name="VPC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x90c0" name="VPC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A8XX-" usage="rp_blit"/>
 	<reg32 offset="0x910b" name="VPC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x90c1" name="VPC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A8XX-" usage="rp_blit"/>
 	<reg32 offset="0x910c" name="VPC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x931a" name="VPC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<enum name="a6xx_varying_interp_mode">
 		<value value="0" name="INTERP_SMOOTH"/>
@@ -2119,6 +2912,15 @@ by a particular renderpass/blit.
 		<reg32 offset="0x0" name="MODE"/>
 	</array>
 
+	<array offset="0x9240" name="VPC_VARYING_INTERP_MODE" stride="1" length="8" variants="A8XX-" usage="rp_blit">
+		<doc>Packed array of a6xx_varying_interp_mode</doc>
+		<reg32 offset="0x0" name="MODE"/>
+	</array>
+	<array offset="0x9248" name="VPC_VARYING_REPLACE_MODE" stride="1" length="8" variants="A8XX-" usage="rp_blit">
+		<doc>Packed array of a6xx_varying_ps_repl_mode</doc>
+		<reg32 offset="0x0" name="MODE"/>
+	</array>
+
 	<!-- always 0x0 -->
 	<reg32 offset="0x9210" name="VPC_UNKNOWN_9210" low="0" high="31" variants="A6XX" usage="cmd"/>
 	<reg32 offset="0x9211" name="VPC_UNKNOWN_9211" low="0" high="31" variants="A6XX" usage="cmd"/>
@@ -2128,6 +2930,11 @@ by a particular renderpass/blit.
 		<reg32 offset="0" name="DISABLE"/>
 	</array>
 
+	<array offset="0x9252" name="VPC_VARYING_LM_TRANSFER_CNTL" stride="1" length="4" variants="A8XX-" usage="rp_blit">
+		<!-- one bit per varying component: -->
+		<reg32 offset="0" name="DISABLE"/>
+	</array>
+
 	<bitset name="a6xx_vpc_so_mapping_wptr" inline="yes">
 		<!--
 			Choose which DWORD to write to. There is an array of
@@ -2158,6 +2965,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x9216" name="VPC_SO_MAPPING_WPTR" type="a6xx_vpc_so_mapping_wptr" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9180" name="VPC_SO_MAPPING_WPTR" type="a6xx_vpc_so_mapping_wptr" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_vpc_so_mapping_port" inline="yes">
 		<bitfield name="A_BUF" low="0" high="1" type="uint"/>
@@ -2170,8 +2978,10 @@ by a particular renderpass/blit.
 
 	<!-- special register, write multiple times to load SO program (not readable) -->
 	<reg32 offset="0x9217" name="VPC_SO_MAPPING_PORT" type="a6xx_vpc_so_mapping_port" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9181" name="VPC_SO_MAPPING_PORT" type="a6xx_vpc_so_mapping_port" variants="A8XX-" usage="rp_blit"/>
 
 	<reg64 offset="0x9218" name="VPC_SO_QUERY_BASE" type="waddress" align="32" variants="A6XX-A7XX" usage="cmd"/>
+	<reg64 offset="0x9182" name="VPC_SO_QUERY_BASE" type="waddress" align="32" variants="A8XX-" usage="cmd"/>
 
 	<array offset="0x921a" name="VPC_SO" stride="7" length="4" variants="A6XX-A7XX" usage="cmd">
 		<reg64 offset="0" name="BUFFER_BASE" type="waddress" align="32"/>
@@ -2181,13 +2991,23 @@ by a particular renderpass/blit.
 		<reg64 offset="5" name="FLUSH_BASE" type="waddress" align="32"/>
 	</array>
 
+	<array offset="0x9184" name="VPC_SO" stride="7" length="4" variants="A8XX-" usage="cmd">
+		<reg64 offset="0" name="BUFFER_BASE" type="waddress" align="32"/>
+		<reg32 offset="2" name="BUFFER_SIZE" low="2" high="31" shr="2"/>
+		<reg32 offset="3" name="BUFFER_STRIDE" low="0" high="9" shr="2"/>
+		<reg32 offset="4" name="BUFFER_OFFSET" low="2" high="31" shr="2"/>
+		<reg64 offset="5" name="FLUSH_BASE" type="waddress" align="32"/>
+	</array>
+
 	<bitset name="a6xx_vpc_replace_mode_cntl" inline="yes">
 		<bitfield name="INVERT" pos="0" type="boolean"/>
 	</bitset>
 
 	<reg32 offset="0x9236" name="VPC_REPLACE_MODE_CNTL" type="a6xx_vpc_replace_mode_cntl" variants="A6XX-A7XX" usage="cmd"/>
+	<reg32 offset="0x9310" name="VPC_REPLACE_MODE_CNTL" type="a6xx_vpc_replace_mode_cntl" variants="A8XX-" usage="cmd"/>
 
 	<reg32 offset="0x9300" name="VPC_ROTATION_CNTL" low="0" high="2" variants="A6XX-A7XX" usage="cmd"/>
+	<reg32 offset="0x9312" name="VPC_ROTATION_CNTL" low="0" high="2" variants="A8XX-" usage="cmd"/>
 
 	<bitset name="a6xx_vpc_xs_cntl" inline="yes">
 		<doc>
@@ -2211,6 +3031,10 @@ by a particular renderpass/blit.
 	<reg32 offset="0x9302" name="VPC_GS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x9303" name="VPC_DS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
+	<reg32 offset="0x9300" name="VPC_VS_CNTL" type="a6xx_vpc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9301" name="VPC_GS_CNTL" type="a6xx_vpc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9302" name="VPC_DS_CNTL" type="a6xx_vpc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
+
 	<bitset name="a6xx_vpc_ps_cntl" inline="yes">
 		<bitfield name="NUMNONPOSVAR" low="0" high="7" type="uint"/>
 		<!-- for fixed-function (i.e. no GS) gl_PrimitiveID in FS -->
@@ -2231,6 +3055,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x9304" name="VPC_PS_CNTL" type="a6xx_vpc_ps_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9303" name="VPC_PS_CNTL" type="a6xx_vpc_ps_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_vpc_so_cntl" inline="yes">
 		<!--
@@ -2244,40 +3069,69 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x9305" name="VPC_SO_CNTL" type="a6xx_vpc_so_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9304" name="VPC_SO_CNTL" type="a6xx_vpc_so_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_so_override" inline="yes">
 		<bitfield name="DISABLE" pos="0" type="boolean"/>
 	</bitset>
 
 	<reg32 offset="0x9306" name="VPC_SO_OVERRIDE" type="a6xx_so_override" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9305" name="VPC_SO_OVERRIDE" type="a6xx_so_override" variants="A8XX-" usage="rp_blit"/>
 
 	<reg32 offset="0x9807" name="PC_DGEN_SO_OVERRIDE" type="a6xx_so_override" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b0a" name="PC_DGEN_SO_OVERRIDE" type="a6xx_so_override" variants="A8XX-" usage="rp_blit"/>
 
 	<reg32 offset="0x9307" name="VPC_PS_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9306" name="VPC_PS_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<reg32 offset="0x9308" name="VPC_ATTR_BUF_GMEM_SIZE" variants="A7XX" type="uint" usage="rp_blit"/>
 	<reg32 offset="0x9309" name="VPC_ATTR_BUF_GMEM_BASE" variants="A7XX" type="uint" usage="rp_blit"/>
 
+	<reg32 offset="0x9314" name="VPC_ATTR_BUF_GMEM_SIZE" variants="A8XX-" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x9315" name="VPC_ATTR_BUF_GMEM_BASE" variants="A8XX-" type="uint" usage="rp_blit"/>
+
+	<reg32 offset="0x9316" name="VPC_POS_BUF_GMEM_SIZE" variants="A8XX-" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x9317" name="VPC_POS_BUF_GMEM_BASE" variants="A8XX-" type="uint" usage="rp_blit"/>
+
 	<reg32 offset="0x9b09" name="PC_ATTR_BUF_GMEM_SIZE" variants="A7XX" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x9b16" name="PC_ATTR_BUF_GMEM_SIZE" variants="A8XX-" type="uint" usage="rp_blit"/>
+
+	<reg32 offset="0x9b17" name="PC_POS_BUF_GMEM_SIZE" variants="A8XX-" type="uint" usage="rp_blit"/>
 
 	<reg32 offset="0x930a" name="VPC_UNKNOWN_930A" variants="A7XX"/>
 
+	<reg32 offset="0x9313" name="VPC_UNKNOWN_9313" variants="A8XX-"/>
+	<reg32 offset="0x9e17" name="PC_UNKNOWN_9E17" variants="A8XX-"/>
+
 	<reg32 offset="0x960a" name="VPC_FLATSHADE_MODE_CNTL" variants="A7XX"/>
+	<reg32 offset="0x9741" name="VPC_FLATSHADE_MODE_CNTL" variants="A8XX-"/>
 
 	<!-- 0x9307-0x95ff invalid -->
 
 	<!-- TODO: 0x9600-0x97ff range -->
-	<reg32 offset="0x9600" name="VPC_DBG_ECO_CNTL" usage="cmd"/> <!-- always 0x0 ? TODO: 0x1fbf37ff valid mask -->
-	<reg32 offset="0x9601" name="VPC_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode" usage="cmd"/>
-	<reg32 offset="0x9602" name="VPC_UNKNOWN_9602" pos="0" usage="cmd"/> <!-- always 0x0 ? -->
-	<reg32 offset="0x9603" name="VPC_UNKNOWN_9603" low="0" high="26"/>
+	<reg32 offset="0x9600" name="VPC_DBG_ECO_CNTL" variants="A6XX-A7XX" usage="cmd"/> <!-- always 0x0 ? TODO: 0x1fbf37ff valid mask -->
+	<reg32 offset="0x9601" name="VPC_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode" usage="cmd" variants="A6XX"/>
+	<reg32 offset="0x9680" name="VPC_DBG_ECO_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x9604" name="VPC_DBG_ECO_CNTL_2" variants="A8XX-"/>
+	<reg32 offset="0x9742" name="VPC_DBG_ECO_CNTL_1" variants="A8XX-"/>
+	<reg32 offset="0x9745" name="VPC_DBG_ECO_CNTL_3" variants="A8XX-"/>
+	<reg32 offset="0x9602" name="VPC_LB_MODE_CNTL" pos="0" variants="A6XX-A7XX" usage="cmd"/> <!-- always 0x0 ? -->
+	<reg32 offset="0x9740" name="VPC_LB_MODE_CNTL" pos="0" variants="A8XX-" usage="cmd"/>
+	<reg32 offset="0x9603" name="VPC_STATUS" low="0" high="26" variants="A6XX-A7XX"/>
+	<reg32 offset="0x9600" name="VPC_STATUS" low="0" high="26" variants="A8XX-"/>
 	<array offset="0x9604" name="VPC_PERFCTR_VPC_SEL" stride="1" length="6" variants="A6XX"/>
-	<array offset="0x960b" name="VPC_PERFCTR_VPC_SEL" stride="1" length="12" variants="A7XX-"/>
-	<!-- 0x960a-0x9623 invalid -->
-	<!-- TODO: regs from 0x9624-0x963a -->
-	<!-- 0x963b-0x97ff invalid -->
+	<array offset="0x960b" name="VPC_PERFCTR_VPC_SEL" stride="1" length="12" variants="A7XX"/>
+	<array offset="0x9670" name="VPC_PERFCTR_VPC_SEL_2" stride="1" length="12" variants="A8XX-"/>
+	<array offset="0x9690" name="VPC_PERFCTR_VPC_SEL" stride="1" length="12" variants="A8XX-"/>
+	<array offset="0x9750" name="VPC_PERFCTR_VPC_SEL_1" stride="1" length="12" variants="A8XX-"/>
+
+	<reg64 offset="0x9634" name="VPC_CONTEXT_SWITCH_SO_SAVE_ADDR" type="waddress" variants="A6XX-A7XX"/>
+	<reg64 offset="0x9602" name="VPC_CONTEXT_SWITCH_SO_SAVE_ADDR" type="waddress" variants="A8XX-"/>
+
+	<reg32 offset="0x980b" name="PC_UNKNOWN_980B" variants="A8XX-"/>
 
 	<reg32 offset="0x9800" name="PC_HS_PARAM_0" low="0" high="5" type="uint" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b10" name="PC_HS_PARAM_0" low="0" high="5" type="uint" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_pc_hs_param_1" inline="yes">
 		<bitfield name="SIZE" low="0" high="10" type="uint"/>
@@ -2285,6 +3139,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x9801" name="PC_HS_PARAM_1" type="a6xx_pc_hs_param_1" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b11" name="PC_HS_PARAM_1" type="a6xx_pc_hs_param_1" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_pc_ds_param" inline="yes">
 		<bitfield name="SPACING" low="0" high="1" type="a6xx_tess_spacing"/>
@@ -2292,10 +3147,13 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x9802" name="PC_DS_PARAM" type="a6xx_pc_ds_param" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b12" name="PC_DS_PARAM" type="a6xx_pc_ds_param" variants="A8XX-" usage="rp_blit"/>
 
 	<reg32 offset="0x9803" name="PC_RESTART_INDEX" low="0" high="31" type="uint" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b15" name="PC_RESTART_INDEX" low="0" high="31" type="uint" variants="A8XX-" usage="rp_blit"/>
 
 	<reg32 offset="0x9804" name="PC_MODE_CNTL" low="0" high="7" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b00" name="PC_MODE_CNTL" low="0" high="14" variants="A8XX" usage="rp_blit"/>
 
 	<reg32 offset="0x9805" name="PC_POWER_CNTL" low="0" high="2" usage="rp_blit"/>
 
@@ -2304,6 +3162,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x9806" name="PC_PS_CNTL" type="a6xx_pc_ps_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b06" name="PC_PS_CNTL" type="a6xx_pc_ps_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_pc_dgen_so_cntl" inline="yes">
 		<bitfield name="STREAM_ENABLE" low="15" high="18" type="hex"/>
@@ -2311,12 +3170,19 @@ by a particular renderpass/blit.
 
 	<!-- New in a6xx gen3+ -->
 	<reg32 offset="0x9808" name="PC_DGEN_SO_CNTL" type="a6xx_pc_dgen_so_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b0b" name="PC_DGEN_SO_CNTL" type="a6xx_pc_dgen_so_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_pc_dgen_su_conservative_ras_cntl" inline="yes">
 		<bitfield name="CONSERVATIVERASEN" pos="0" type="boolean"/>
 	</bitset>
 
 	<reg32 offset="0x980a" name="PC_DGEN_SU_CONSERVATIVE_RAS_CNTL" type="a6xx_pc_dgen_su_conservative_ras_cntl" variants="A6XX-A7XX"/>
+	<reg32 offset="0x9b08" name="PC_DGEN_SU_CONSERVATIVE_RAS_CNTL" type="a6xx_pc_dgen_su_conservative_ras_cntl" variants="A8XX-"/>
+
+	<reg32 offset="0x9b0c" name="PC_VS_INPUT_CNTL" variants="A8XX-" usage="rp_blit">
+		<bitfield name="INSTR_CNT" low="0" high="5" type="uint"/>
+		<bitfield name="SIDEBAND_CNT" low="6" high="8" type="uint"/>
+	</reg32>
 
 	<!-- 0x9840 - 0x9842 are not readable -->
 	<bitset name="a6xx_draw_initiator" inline="yes">
@@ -2326,6 +3192,9 @@ by a particular renderpass/blit.
 	<reg32 offset="0x9840" name="PC_DRAW_INITIATOR" type="a6xx_draw_initiator" variants="A6XX-A7XX"/>
 	<reg32 offset="0x9841" name="PC_KERNEL_INITIATOR" type="a6xx_draw_initiator" variants="A6XX-A7XX"/>
 
+	<reg32 offset="0x9800" name="PC_DRAW_INITIATOR" type="a6xx_draw_initiator" variants="A8XX-"/>
+	<reg32 offset="0x9801" name="PC_KERNEL_INITIATOR" type="a6xx_draw_initiator" variants="A8XX-"/>
+
 	<bitset name="a6xx_event_initiator" inline="yes">
 		<!-- I think only the low bit is actually used? -->
 		<bitfield name="STATE_ID" low="16" high="23"/>
@@ -2333,6 +3202,7 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x9842" name="PC_EVENT_INITIATOR" type="a6xx_event_initiator" variants="A6XX-A7XX"/>
+	<reg32 offset="0x9802" name="PC_EVENT_INITIATOR" type="a6xx_event_initiator" variants="A8XX-"/>
 
 	<!--
 		0x9880 written in a lot of places by SQE, same value gets written
@@ -2345,19 +3215,23 @@ by a particular renderpass/blit.
 
 	<reg32 offset="0x9981" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX" usage="rp_blit"/>
 	<reg32 offset="0x9809" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9812" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX" usage="rp_blit"/>
 
 	<!-- Both are a750+.
 	     Probably needed to correctly overlap execution of several draws.
 	-->
 	<reg32 offset="0x9885" name="PC_HS_BUFFER_SIZE" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0x9814" name="PC_HS_BUFFER_SIZE" variants="A8XX-" usage="cmd"/>
 	<!-- Blob adds a bit more space {0x10, 0x20, 0x30, 0x40} bytes, but the meaning of
 	     this additional space is not known.
 	-->
 	<reg32 offset="0x9886" name="PC_TF_BUFFER_SIZE" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0x9815" name="PC_TF_BUFFER_SIZE" variants="A8XX-" usage="cmd"/>
 
 	<!-- 0x9982-0x9aff invalid -->
 
 	<reg32 offset="0x9b00" name="PC_CNTL" type="a6xx_pc_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b01" name="PC_CNTL" type="a6xx_pc_cntl" variants="A8XX-" usage="rp_blit"/>
 
 	<bitset name="a6xx_pc_xs_cntl" inline="yes">
 		<doc>
@@ -2381,7 +3255,13 @@ by a particular renderpass/blit.
 	<reg32 offset="0x9b03" name="PC_HS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 	<reg32 offset="0x9b04" name="PC_DS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
 
+	<reg32 offset="0x9b02" name="PC_VS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9b03" name="PC_GS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9b04" name="PC_HS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9b05" name="PC_DS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
+
 	<reg32 offset="0x9b05" name="PC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b13" name="PC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A8XX-" usage="rp_blit"/>
 
 	<reg32 offset="0x9b06" name="PC_PRIMITIVE_CNTL_6" variants="A6XX" usage="rp_blit">
 		<doc>
@@ -2391,24 +3271,37 @@ by a particular renderpass/blit.
 	</reg32>
 
 	<reg32 offset="0x9b07" name="PC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b09" name="PC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A8XX-" usage="rp_blit"/>
 	<!-- mask of enabled views, doesn't exist on A630 -->
 	<reg32 offset="0x9b08" name="PC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b0d" name="PC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A8XX-" usage="rp_blit"/>
 	<!-- 0x9b09-0x9bff invalid -->
 	<reg32 offset="0x9c00" name="PC_2D_EVENT_CMD">
 		<!-- special register (but note first 8 bits can be written/read) -->
 		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
 		<bitfield name="STATE_ID" low="8" high="15"/>
 	</reg32>
-	<!-- 0x9c01-0x9dff invalid -->
-	<!-- TODO: 0x9e00-0xa000 range incomplete -->
-	<reg32 offset="0x9e00" name="PC_DBG_ECO_CNTL"/>
-	<reg32 offset="0x9e01" name="PC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+
+	<reg32 offset="0x9e50" name="PC_CHICKEN_BITS_1" variants="A8XX-"/>
+	<reg32 offset="0x9f20" name="PC_CHICKEN_BITS_2" variants="A8XX-"/>
+	<reg32 offset="0x9e22" name="PC_CHICKEN_BITS_3" variants="A8XX-"/>
+	<reg32 offset="0x9e23" name="PC_CHICKEN_BITS_4" variants="A8XX-"/>
+	<reg32 offset="0x9f23" name="PC_CHICKEN_BITS_5" variants="A8XX-"/>
+
+	<reg32 offset="0x9e00" name="PC_DBG_ECO_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x9e53" name="PC_DBG_ECO_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x9e01" name="PC_ADDR_MODE_CNTL" type="a5xx_address_mode" variants="A6XX"/>
 	<reg64 offset="0x9e04" name="PC_DMA_BASE" type="address" variants="A6XX-A7XX"/>
 	<reg32 offset="0x9e06" name="PC_DMA_OFFSET" type="uint" variants="A6XX-A7XX"/>
 	<reg32 offset="0x9e07" name="PC_DMA_SIZE" type="uint" variants="A6XX-A7XX"/>
 
+	<reg64 offset="0x9e06" name="PC_DMA_BASE" type="address" variants="A8XX-"/>
+	<reg32 offset="0x9e08" name="PC_DMA_OFFSET" type="uint" variants="A8XX-"/>
+	<reg32 offset="0x9e09" name="PC_DMA_SIZE" type="uint" variants="A8XX-"/>
+
 	<reg64 offset="0x9e08" name="PC_TESS_BASE" variants="A6XX" type="waddress" align="32" usage="cmd"/>
 	<reg64 offset="0x9810" name="PC_TESS_BASE" variants="A7XX" type="waddress" align="32" usage="cmd"/>
+	<reg64 offset="0x9816" name="PC_TESS_BASE" variants="A8XX-" type="waddress" align="32" usage="cmd"/>
 
 	<reg32 offset="0x9e0b" name="PC_DRAWCALL_CNTL" type="vgt_draw_initiator_a4xx" variants="A6XX-A7XX">
 		<doc>
@@ -2419,6 +3312,10 @@ by a particular renderpass/blit.
 	<reg32 offset="0x9e0c" name="PC_DRAWCALL_INSTANCE_NUM" type="uint" variants="A6XX-A7XX"/>
 	<reg32 offset="0x9e0d" name="PC_DRAWCALL_SIZE" type="uint" variants="A6XX-A7XX"/>
 
+	<reg32 offset="0x9e00" name="PC_DRAWCALL_CNTL" type="vgt_draw_initiator_a4xx" variants="A8XX-"/>
+	<reg32 offset="0x9e01" name="PC_DRAWCALL_INSTANCE_NUM" type="uint" variants="A8XX-"/>
+	<reg32 offset="0x9e02" name="PC_DRAWCALL_SIZE" type="uint" variants="A8XX-"/>
+
 	<!-- These match the contents of CP_SET_BIN_DATA (not written directly) -->
 	<bitset name="a6xx_pc_vis_stream_cntl" inline="yes">
 		<bitfield name="UNK0" low="0" high="15"/>
@@ -2430,20 +3327,30 @@ by a particular renderpass/blit.
 	<reg64 offset="0x9e12" name="PC_PVIS_STREAM_BIN_BASE" type="waddress" align="32" variants="A6XX-A7XX"/>
 	<reg64 offset="0x9e14" name="PC_DVIS_STREAM_BIN_BASE" type="waddress" align="32" variants="A6XX-A7XX"/>
 
+	<reg32 offset="0x9e0a" name="PC_AUTO_VERTEX_STRIDE"/>
+	<reg32 offset="0x9e0d" name="PC_VIS_STREAM_CNTL" type="a6xx_pc_vis_stream_cntl" variants="A8XX-"/>
+	<reg64 offset="0x9e0e" name="PC_PVIS_STREAM_BIN_BASE" type="waddress" align="32" variants="A8XX-"/>
+	<reg64 offset="0x9e10" name="PC_DVIS_STREAM_BIN_BASE" type="waddress" align="32" variants="A8XX-"/>
+
 	<bitset name="a6xx_pc_drawcall_cntl_override" inline="yes">
 		<doc>Written by CP_SET_VISIBILITY_OVERRIDE handler</doc>
 		<bitfield name="OVERRIDE" pos="0" type="boolean"/>
 	</bitset>
 
 	<reg32 offset="0x9e1c" name="PC_DRAWCALL_CNTL_OVERRIDE" type="a6xx_pc_drawcall_cntl_override" variants="A6XX-A7XX"/>
+	<reg32 offset="0x9e04" name="PC_DRAWCALL_CNTL_OVERRIDE" type="a6xx_pc_drawcall_cntl_override" variants="A8XX-"/>
 
 	<reg32 offset="0x9e24" name="PC_UNKNOWN_9E24" variants="A7XX-" usage="cmd"/>
 
 	<array offset="0x9e34" name="PC_PERFCTR_PC_SEL" stride="1" length="8" variants="A6XX"/>
-	<array offset="0x9e42" name="PC_PERFCTR_PC_SEL" stride="1" length="16" variants="A7XX-"/>
+	<array offset="0x9e42" name="PC_PERFCTR_PC_SEL" stride="1" length="16" variants="A7XX"/>
+	<array offset="0x9e30" name="PC_PERFCTR_PC_SEL" stride="1" length="16" variants="A8XX-"/>
+	<array offset="0x9f00" name="PC_SLICE_PERFCTR_PC_SEL" stride="1" length="16" variants="A8XX-"/>
 
 	<!-- always 0x0 -->
-	<reg32 offset="0x9e72" name="PC_UNKNOWN_9E72" usage="cmd"/>
+	<reg32 offset="0x9e72" name="PC_CONTEXT_SWITCH_GFX_PREEMPTION_MODE" variants="A6XX-A7XX" usage="cmd"/>
+	<reg32 offset="0x9e63" name="PC_CONTEXT_SWITCH_GFX_PREEMPTION_MODE" variants="A8XX-" usage="cmd"/>
+	<reg32 offset="0x9e64" name="PC_CONTEXT_SWITCH_STABILIZE_CNTL_1" variants="A8XX-"/>
 
 	<reg32 offset="0xa000" name="VFD_CNTL_0" usage="rp_blit">
 		<bitfield name="FETCH_CNT" low="0" high="5" type="uint"/>
@@ -2532,9 +3439,13 @@ by a particular renderpass/blit.
 
 	<reg32 offset="0xa600" name="VFD_DBG_ECO_CNTL" variants="A7XX-" usage="cmd"/>
 
-	<reg32 offset="0xa601" name="VFD_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0xa601" name="VFD_ADDR_MODE_CNTL" type="a5xx_address_mode" variants="A6XX"/>
 	<array offset="0xa610" name="VFD_PERFCTR_VFD_SEL" stride="1" length="8" variants="A6XX"/>
 	<array offset="0xa610" name="VFD_PERFCTR_VFD_SEL" stride="1" length="16" variants="A7XX-"/>
+	<reg32 offset="0xa639" name="VFD_CB_BV_THRESHOLD" variants="A8XX-"/>
+	<reg32 offset="0xa63a" name="VFD_CB_BR_THRESHOLD" variants="A8XX-"/>
+	<reg32 offset="0xa63b" name="VFD_CB_BUSY_REQ_CNT" variants="A8XX-"/>
+	<reg32 offset="0xa63c" name="VFD_CB_LP_REQ_CNT" variants="A8XX-"/>
 
 	<!--
 	Note: this seems to always be paired with another bit in another
@@ -2729,6 +3640,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xa823" name="SP_VS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
 	<reg32 offset="0xa824" name="SP_VS_INSTR_SIZE" low="0" high="27" type="uint" usage="rp_blit"/>
 	<reg32 offset="0xa825" name="SP_VS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa826" name="SP_UNKNOWN_A826"/>
 	<reg32 offset="0xa82d" name="SP_VS_VGS_CNTL" variants="A7XX-" usage="cmd"/>
 
 	<reg32 offset="0xa830" name="SP_HS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="rp_blit">
@@ -2754,6 +3666,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xa83b" name="SP_HS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
 	<reg32 offset="0xa83c" name="SP_HS_INSTR_SIZE" low="0" high="27" type="uint" usage="rp_blit"/>
 	<reg32 offset="0xa83d" name="SP_HS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa83e" name="SP_HS_UNKNOWN_A83E"/>
 	<reg32 offset="0xa82f" name="SP_HS_VGS_CNTL" variants="A7XX-" usage="cmd"/>
 
 	<reg32 offset="0xa840" name="SP_DS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="rp_blit">
@@ -2791,6 +3704,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xa863" name="SP_DS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
 	<reg32 offset="0xa864" name="SP_DS_INSTR_SIZE" low="0" high="27" type="uint" usage="rp_blit"/>
 	<reg32 offset="0xa865" name="SP_DS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa866" name="SP_DS_UNKNOWN_A866"/>
 	<reg32 offset="0xa868" name="SP_DS_VGS_CNTL" variants="A7XX-" usage="cmd"/>
 
 	<reg32 offset="0xa870" name="SP_GS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="rp_blit">
@@ -2843,6 +3757,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xa894" name="SP_GS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
 	<reg32 offset="0xa895" name="SP_GS_INSTR_SIZE" low="0" high="27" type="uint" usage="rp_blit"/>
 	<reg32 offset="0xa896" name="SP_GS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa897" name="SP_GS_UNKNOWN_A897"/>
 	<reg32 offset="0xa899" name="SP_GS_VGS_CNTL" variants="A7XX-" usage="cmd"/>
 
 	<reg64 offset="0xa8a0" name="SP_VS_SAMPLER_BASE" type="address" align="16" usage="cmd"/>
@@ -2997,9 +3912,6 @@ by a particular renderpass/blit.
 
 	<!-- TODO: unknown bool register at 0xa9aa, likely same as 0xa8c0-0xa8c3 but for FS -->
 
-
-
-
 	<reg32 offset="0xa9b0" name="SP_CS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="cmd">
 		<bitfield name="THREADSIZE" pos="20" type="a6xx_threadsize"/>
 		<!-- seems to make SP use less concurrent threads when possible? -->
@@ -3036,6 +3948,7 @@ by a particular renderpass/blit.
 				must be at least the actual CONSTLEN.
 			</doc>
 		</bitfield>
+		<bitfield name="ALT_LM_ENCODE" pos="26" type="boolean"/>
 	</reg32>
 	<reg32 offset="0xa9b2" name="SP_CS_BOOLEAN_CF_MASK" type="hex" usage="cmd"/>
 	<reg32 offset="0xa9b3" name="SP_CS_PROGRAM_COUNTER_OFFSET" type="uint" usage="cmd"/>
@@ -3158,6 +4071,18 @@ by a particular renderpass/blit.
 		<bitfield name="RT7" low="28" high="31"/>
 	</reg32>
 
+	<array offset="0xaa04" name="SP_MRT_BLEND_CNTL" stride="1" length="8" variants="A8XX-">
+		<reg32 offset="0" name="REG">
+			<bitfield name="COLOR_BLEND_EN" pos="0" type="boolean"/>
+			<bitfield name="ALPHA_BLEND_EN" pos="1" type="boolean"/>
+			<bitfield name="COMPONENT_WRITE_MASK" low="7" high="10"/>
+		</reg32>
+	</array>
+
+	<reg32 offset="0xaa0c" name="SP_ALPHA_TEST_CNTL" variants="A8XX-">
+		<bitfield name="ALPHA_TEST" pos="8" type="boolean"/>
+	</reg32>
+
 	<reg32 offset="0xaaf2" name="SP_UNKNOWN_AAF2" type="uint" usage="cmd"/>
 
 	<!--
@@ -3191,6 +4116,8 @@ by a particular renderpass/blit.
 	<reg32 offset="0xab04" name="SP_PS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
 	<reg32 offset="0xab05" name="SP_PS_INSTR_SIZE" low="0" high="27" type="uint" usage="rp_blit"/>
 
+	<reg32 offset="0xab06" name="SP_BIN_SIZE" type="a8xx_bin_size" variants="A8XX-" usage="rp_blit"/>
+
 	<array offset="0xab10" name="SP_GFX_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="rp_blit">
 		<reg64 offset="0" name="DESCRIPTOR" variants="A6XX">
 			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
@@ -3210,9 +4137,12 @@ by a particular renderpass/blit.
 	 -->
 	<reg64 offset="0xab1a" name="SP_GFX_UAV_BASE" type="address" align="16" usage="cmd"/>
 	<reg32 offset="0xab20" name="SP_GFX_USIZE" low="0" high="6" type="uint" variants="A6XX-A7XX" usage="cmd"/>
+	<reg32 offset="0xab09" name="SP_GFX_USIZE" low="0" high="6" type="uint" variants="A8XX-" usage="cmd"/>
 
 	<reg32 offset="0xab22" name="SP_UNKNOWN_AB22" variants="A7XX" usage="cmd"/>
 
+	<reg32 offset="0xab23" name="SP_UNKNOWN_AB23" variants="A8XX-"/>
+
 	<enum name="a6xx_sp_a2d_output_ifmt_type">
 		<value name="OUTPUT_IFMT_2D_FLOAT" value="0"/>
 		<value name="OUTPUT_IFMT_2D_SINT" value="1"/>
@@ -3235,7 +4165,8 @@ by a particular renderpass/blit.
 	<reg32 offset="0xa9bf" name="SP_A2D_OUTPUT_INFO" type="a6xx_sp_a2d_output_info" variants="A7XX-" usage="rp_blit"/>
 
 	<reg32 offset="0xae00" name="SP_DBG_ECO_CNTL" usage="cmd"/>
-	<reg32 offset="0xae01" name="SP_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode"/>
+	<reg32 offset="0xae01" name="SP_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode" variants="A6XX"/>
+	<reg32 offset="0xae01" name="SP_SHADER_PROFILING" variants="A8XX-"/>
 	<reg32 offset="0xae02" name="SP_NC_MODE_CNTL">
 		<!-- TODO: valid bits 0x3c3f, see kernel -->
 	</reg32>
@@ -3244,10 +4175,14 @@ by a particular renderpass/blit.
 		<bitfield name="F16_NO_INF" pos="3" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0xae06" name="SP_UNKNOWN_AE06" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae05" name="SP_SS_CHICKEN_BITS_0" variants="A8XX-"/>
+	<reg32 offset="0xae06" name="SP_ISDB_CNTL" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae07" name="SP_PERFCTR_CNTL"/>
 	<reg32 offset="0xae08" name="SP_CHICKEN_BITS_1" variants="A7XX-" usage="cmd"/>
 	<reg32 offset="0xae09" name="SP_CHICKEN_BITS_2" variants="A7XX-" usage="cmd"/>
 	<reg32 offset="0xae0a" name="SP_CHICKEN_BITS_3" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae0b" name="SP_CHICKEN_BITS_4" variants="A8XX-"/>
+	<reg32 offset="0xae0c" name="SP_STATUS"/>
 
 	<reg32 offset="0xae0f" name="SP_PERFCTR_SHADER_MASK" usage="cmd">
 		<!-- some perfcntrs are affected by a per-stage enable bit
@@ -3260,12 +4195,14 @@ by a particular renderpass/blit.
 		<bitfield name="FS" pos="4" type="boolean"/>
 		<bitfield name="CS" pos="5" type="boolean"/>
 	</reg32>
-	<array offset="0xae10" name="SP_PERFCTR_SP_SEL" stride="1" length="24"/>
+	<array offset="0xae10" name="SP_PERFCTR_SP_SEL" stride="1" length="24" variants="A6XX"/>
 	<array offset="0xae60" name="SP_PERFCTR_HLSQ_SEL" stride="1" length="6" variants="A7XX-"/>
 	<reg32 offset="0xae6a" name="SP_UNKNOWN_AE6A" variants="A7XX-" usage="cmd"/>
-	<reg32 offset="0xae6b" name="SP_UNKNOWN_AE6B" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae6b" name="SP_HLSQ_TIMEOUT_THRESHOLD_DP" variants="A7XX-" usage="cmd"/>
 	<reg32 offset="0xae6c" name="SP_HLSQ_DBG_ECO_CNTL" variants="A7XX-" usage="cmd"/>
 	<reg32 offset="0xae6d" name="SP_READ_SEL" variants="A7XX-">
+		<bitfield name="CONTEXT" low="26" high="30"/>
+		<bitfield name="SLICE" low="21" high="25"/>
 		<bitfield name="LOCATION" low="18" high="20" type="a7xx_state_location"/>
 		<bitfield name="PIPE" low="16" high="17" type="adreno_pipe"/>
 		<bitfield name="STATETYPE" low="8" high="15" type="a7xx_statetype_id"/>
@@ -3273,11 +4210,32 @@ by a particular renderpass/blit.
 		<bitfield name="SPTP" low="0" high="3"/>
 	</reg32>
 	<reg32 offset="0xae71" name="SP_DBG_CNTL" variants="A7XX-"/>
-	<reg32 offset="0xae73" name="SP_UNKNOWN_AE73" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae73" name="SP_HLSQ_DBG_ECO_CNTL_1" variants="A7XX-"/>
+	<reg32 offset="0xae74" name="SP_HLSQ_DBG_ECO_CNTL_2" variants="A7XX-"/>
+	<reg32 offset="0xae76" name="SP_HLSQ_DBG_ECO_CNTL_3" variants="A8XX-"/>
 	<array offset="0xae80" name="SP_PERFCTR_SP_SEL" stride="1" length="36" variants="A7XX-"/>
 	<!-- TODO: there are 4 more percntr select registers (0xae28-0xae2b) -->
 	<!-- TODO: there are a few unknown registers in the 0xae30-0xae52 range -->
-	<reg32 offset="0xbe22" name="SP_CONTEXT_SWITCH_GFX_PREEMPTION_SAFE_MODE"/>
+	<reg32 offset="0xae52" name="SP_CONTEXT_SWITCH_GFX_PREEMPTION_SAFE_MODE"/>
+
+	<reg64 offset="0xae10" name="SP_HLSQ_GC_GMEM_RANGE_MIN" variants="A8XX-"/>
+	<reg64 offset="0xae12" name="SP_HLSQ_LPAC_GMEM_RANGE_MIN" variants="A8XX-"/>
+	<reg32 offset="0xae15" name="SP_LPAC_CPI_STATUS" variants="A8XX-"/>
+	<reg32 offset="0xae16" name="SP_LPAC_DBG_STATUS" variants="A8XX-"/>
+	<reg32 offset="0xae17" name="SP_LPAC_ISDB_BATCH_COUNT" variants="A8XX-"/>
+	<reg32 offset="0xae18" name="SP_LPAC_ISDB_BATCH_COUNT_INCR_EN" variants="A8XX-"/>
+	<reg32 offset="0xae19" name="SP_LPAC_ISDB_BATCH_COUNT_SHADERS" variants="A8XX-"/>
+	<reg32 offset="0xae30" name="SP_ISDB_BATCH_COUNT" variants="A7XX-"/>
+	<reg32 offset="0xae31" name="SP_ISDB_BATCH_COUNT_INCR_EN" variants="A7XX-"/>
+	<reg32 offset="0xae32" name="SP_ISDB_BATCH_COUNT_SHADERS" variants="A7XX-"/>
+	<reg32 offset="0xae35" name="SP_ISDB_DEBUG_CONFIG" variants="A7XX-"/>
+
+	<reg32 offset="0xae3a" name="SP_SELF_THROTTLE_CONTROL" variants="A7XX-"/>
+	<reg32 offset="0xae3b" name="SP_DISPATCH_CNTL" variants="A7XX-"/>
+	<reg64 offset="0xae3c" name="SP_SW_DEBUG_ADDR" variants="A7XX-"/>
+	<reg64 offset="0xae3e" name="SP_ISDB_DEBUG_ADDR" variants="A7XX-"/>
+
+	<array offset="0xaec0" name="SP_PERFCTR_HLSQ_SEL_2_0" stride="1" length="6" variants="A7XX-"/>
 
 	<!--
 	The downstream kernel calls the debug cluster of registers
@@ -3285,12 +4243,15 @@ by a particular renderpass/blit.
 	color base for compute shaders.
 	-->
 	<reg64 offset="0xb180" name="TPL1_CS_BORDER_COLOR_BASE" type="address" align="128" usage="cmd"/>
-	<reg32 offset="0xb182" name="SP_UNKNOWN_B182" low="0" high="2" usage="cmd"/>
-	<reg32 offset="0xb183" name="SP_UNKNOWN_B183" low="0" high="23" usage="cmd"/>
+	<reg32 offset="0xb182" name="TPL1_PS_ROTATION_CNTL" low="0" high="2" usage="cmd"/>
+	<reg32 offset="0xb183" name="TPL1_PS_SWIZZLE_CNTL" low="0" high="23" usage="cmd"/>
 
 	<reg32 offset="0xb190" name="SP_UNKNOWN_B190"/>
 	<reg32 offset="0xb191" name="SP_UNKNOWN_B191"/>
 
+	<reg32 offset="0xb2d6" name="TPL1_A2D_BIN_SIZE" type="a8xx_bin_size" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0xb2d7" name="TPL1_A2D_FILTER_CNTL" variants="A8XX-" usage="rp_blit"/>
+
 	<reg32 offset="0xb300" name="TPL1_RAS_MSAA_CNTL" usage="rp_blit">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
 		<bitfield name="UNK2" low="2" high="3"/>
@@ -3307,6 +4268,8 @@ by a particular renderpass/blit.
 	<reg32 offset="0xb306" name="TPL1_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" usage="rp_blit"/>
 	<reg32 offset="0xb307" name="TPL1_WINDOW_OFFSET" type="a6xx_reg_xy" usage="rp_blit"/>
 
+	<reg32 offset="0xb304" name="TPL1_BIN_SIZE" type="a8xx_bin_size" variants="A8XX-" usage="rp_blit"/>
+
 	<enum name="a6xx_coord_round">
 		<value value="0" name="COORD_TRUNCATE"/>
 		<value value="1" name="COORD_ROUND_NEAREST_EVEN"/>
@@ -3387,10 +4350,11 @@ by a particular renderpass/blit.
 		<bitfield name="TYPE" low="29" high="31" type="a6xx_tex_type"/>
 	</reg32>
 	<reg32 offset="0xab21" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0xab07" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
 
 	<!-- always 0x100000 or 0x1000000? -->
 	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" low="0" high="25" usage="cmd"/>
-	<reg32 offset="0xb601" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0xb601" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode" variants="A6XX"/>
 	<reg32 offset="0xb602" name="TPL1_DBG_ECO_CNTL1" usage="cmd">
 		<!-- Affects UBWC in some way, if BLIT_OP_SCALE is done with this bit set
 		     and if other blit is done without it - UBWC image may be copied incorrectly.
@@ -3414,8 +4378,13 @@ by a particular renderpass/blit.
 		<reg32 offset="0" name="REG" low="0" high="29" usage="cmd"/>
 	</array>
 
+	<array offset="0xb606" name="TPL1_BICUBIC_WEIGHTS_TABLE" stride="1" length="25" variants="A8XX">
+		<reg32 offset="0" name="REG" low="0" high="29"/>
+	</array>
+
 	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="12" variants="A6XX"/>
 	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="18" variants="A7XX"/>
+	<array offset="0xb620" name="TPL1_PERFCTR_TP_SEL" stride="1" length="20" variants="A8XX"/>
 
 	<!-- TODO: 4 more perfcntr sel at 0xb620 ? -->
 
@@ -3458,10 +4427,8 @@ by a particular renderpass/blit.
 
 	<reg32 offset="0xa9ae" name="SP_PS_CNTL_1" variants="A7XX-" usage="rp_blit">
 		<bitfield name="SYSVAL_REGS_COUNT" low="0" high="7" type="uint"/>
-		<!-- UNK8 is set on a730/a740 -->
-		<bitfield name="UNK8" pos="8" type="boolean"/>
-		<!-- UNK9 is set on a750 -->
-		<bitfield name="UNK9" pos="9" type="boolean"/>
+		<bitfield name="DEFER_WAVE_ALLOC_DIS" pos="8" type="boolean"/>
+		<bitfield name="EVICT_BUF_MODE" low="9" high="10"/>
 	</reg32>
 
 	<reg32 offset="0xb820" name="HLSQ_LOAD_STATE_GEOM_CMD"/>
@@ -3745,6 +4712,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xab03" name="SP_PS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="rp_blit"/>
 
 	<array offset="0xab40" name="SP_SHARED_CONSTANT_GFX" stride="1" length="64" variants="A7XX"/>
+	<array offset="0xab30" name="SP_SHARED_CONSTANT_GFX" stride="1" length="64" variants="A8XX-"/>
 
 	<reg32 offset="0xbb11" name="HLSQ_SHARED_CONSTS" variants="A6XX" usage="cmd">
 		<doc>
@@ -3784,12 +4752,12 @@ by a particular renderpass/blit.
 	<reg32 offset="0xbe00" name="HLSQ_UNKNOWN_BE00" variants="A6XX" usage="cmd"/> <!-- all bits valid except bit 29 -->
 	<reg32 offset="0xbe01" name="HLSQ_UNKNOWN_BE01" low="4" high="6" variants="A6XX" usage="cmd"/>
 	<reg32 offset="0xbe04" name="HLSQ_DBG_ECO_CNTL" variants="A6XX" usage="cmd"/>
-	<reg32 offset="0xbe05" name="HLSQ_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0xbe05" name="HLSQ_ADDR_MODE_CNTL" type="a5xx_address_mode" variants="A6XX"/>
 	<reg32 offset="0xbe08" name="HLSQ_UNKNOWN_BE08" low="0" high="15"/>
 	<array offset="0xbe10" name="HLSQ_PERFCTR_HLSQ_SEL" stride="1" length="6"/>
 
 	<!-- TODO: some valid registers between 0xbe20 and 0xbe33 -->
-	<reg32 offset="0xbe22" name="HLSQ_CONTEXT_SWITCH_GFX_PREEMPTION_SAFE_MODE"/>
+	<reg32 offset="0xbe22" name="HLSQ_CONTEXT_SWITCH_GFX_PREEMPTION_SAFE_MODE" variants="A6XX"/>
 
 	<reg32 offset="0xc000" name="SP_AHB_READ_APERTURE" variants="A7XX-"/>
 
@@ -3918,6 +4886,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
 	<reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
 	<reg32 offset="0x0039" name="CX_MISC_TCM_RET_CNTL" variants="A7XX-"/>
+	<reg32 offset="0x0087" name="CX_MISC_SLICE_ENABLE_FINAL" variants="A8XX"/>
 	<reg32 offset="0x0400" name="CX_MISC_SW_FUSE_VALUE" variants="A7XX-">
 		<bitfield pos="0" name="FASTBLEND" type="boolean"/>
 		<bitfield pos="1" name="LPAC" type="boolean"/>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
index 4e42f055b85f..81538831dc19 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
@@ -303,7 +303,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 </enum>
 
 <!--
-Used in a6xx_a2d_bit_cntl.. the value mostly seems to correlate to the
+Used in a6xx_a2d_blt_cntl.. the value mostly seems to correlate to the
 component type/size, so I think it relates to internal format used for
 blending?  The one exception is that 16b unorm and 32b float use the
 same value... maybe 16b unorm is uncommon enough that it was just easier
diff --git a/drivers/gpu/drm/msm/registers/adreno/a8xx_descriptors.xml b/drivers/gpu/drm/msm/registers/adreno/a8xx_descriptors.xml
new file mode 100644
index 000000000000..4c1526822883
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a8xx_descriptors.xml
@@ -0,0 +1,120 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="adreno/adreno_common.xml"/>
+<import file="adreno/adreno_pm4.xml"/>
+<import file="adreno/a6xx_enums.xml"/>
+
+<domain name="A8XX_TEX_SAMP" width="32">
+	<doc>Texture sampler dwords</doc>
+	<reg32 offset="0" name="0">
+		<bitfield name="MIPFILTER_LINEAR_NEAR" pos="0" type="boolean"/>
+		<bitfield name="MIPMAPING_DIS" pos="1" type="boolean"/>
+		<bitfield name="XY_MAG" low="2" high="3" type="a6xx_tex_filter"/>
+		<bitfield name="XY_MIN" low="4" high="5" type="a6xx_tex_filter"/>
+		<bitfield name="WRAP_S" low="6" high="8" type="a6xx_tex_clamp"/>
+		<bitfield name="WRAP_T" low="9" high="11" type="a6xx_tex_clamp"/>
+		<bitfield name="WRAP_R" low="12" high="14" type="a6xx_tex_clamp"/>
+		<bitfield name="MSAA_BOX_FILTERING" pos="15" type="boolean"/>
+		<bitfield name="LOD_BIAS" low="16" high="28" type="fixed" radix="8"/>
+		<bitfield name="ANISO" low="29" high="31" type="a6xx_tex_aniso"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="MAX_LOD" low="0" high="11" type="ufixed" radix="8"/>
+		<bitfield name="MIN_LOD" low="12" high="23" type="ufixed" radix="8"/>
+		<bitfield name="REDUCTION_MODE" low="24" high="25" type="a6xx_reduction_mode"/>
+		<bitfield name="COMPARE_FUNC" low="26" high="28" type="adreno_compare_func"/>
+		<bitfield name="CHROMA_LINEAR" pos="29" type="boolean"/>
+		<bitfield name="CUBEMAPSEAMLESSFILTOFF" pos="30" type="boolean"/>
+		<bitfield name="UNNORM_COORDS" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="FASTBORDERCOLOREN" pos="0" type="boolean"/>
+		<bitfield name="FASTBORDERCOLOR" low="1" high="2" type="a6xx_fast_border_color"/>
+		<bitfield name="BCOLOR" low="7" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3"/>
+</domain>
+
+<domain name="A8XX_TEX_MEMOBJ" width="32" varset="chip">
+	<doc>Texture memobj dwords</doc>
+	<reg32 offset="0" name="0">
+		<bitfield name="BASE_LO" low="6" high="31" shr="6"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="BASE_HI" low="0" high="16"/>
+		<bitfield name="TYPE" low="17" high="19" type="a6xx_tex_type"/>
+		<bitfield name="DEPTH" low="20" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
+		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
+		<bitfield name="SAMPLES" low="30" high="31" type="a3xx_msaa_samples"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="FMT" low="0" high="7" type="a6xx_format"/>
+		<bitfield name="SWAP" low="8" high="9" type="a3xx_color_swap"/>
+		<bitfield name="SWIZ_X" low="10" high="12" type="a6xx_tex_swiz"/>
+		<bitfield name="SWIZ_Y" low="13" high="15" type="a6xx_tex_swiz"/>
+		<bitfield name="SWIZ_Z" low="16" high="18" type="a6xx_tex_swiz"/>
+		<bitfield name="SWIZ_W" low="19" high="21" type="a6xx_tex_swiz"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="TILE_MODE" low="0" high="1" type="a6xx_tile_mode"/>
+		<bitfield name="FLAG" pos="2" type="boolean"/>
+		<bitfield name="PRT_EN" pos="3" type="boolean"/>
+		<bitfield name="TILE_ALL" pos="4" type="boolean"/>
+		<bitfield name="SRGB" pos="5" type="boolean"/>
+		<bitfield name="FLAG_LO" low="6" high="31" shr="6"/>
+		<!-- For multiplanar: -->
+		<bitfield name="BASE_U_LO" low="6" high="31" shr="6"/>
+	</reg32>
+	<reg32 offset="5" name="5">
+		<bitfield name="FLAG_HI" low="0" high="16"/>
+		<!-- For multiplanar: -->
+		<bitfield name="BASE_U_HI" low="0" high="16"/>
+		<bitfield name="FLAG_BUFFER_PITCH" low="17" high="24" shr="6" type="uint"/>
+		<bitfield name="ALL_SAMPLES_CENTER" pos="29" type="boolean"/>
+		<bitfield name="MUTABLEEN" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="6" name="6">
+		<bitfield name="TEX_LINE_OFFSET" low="0" high="23" type="uint"/> <!-- PITCH -->
+		<bitfield name="MIN_LINE_OFFSET" low="24" high="27" type="uint"/> <!-- PITCHALIGN -->
+		<bitfield name="MIPLVLS" low="28" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="7" name="7">
+		<bitfield name="ARRAY_SLICE_OFFSET" low="0" high="22" shr="12" type="uint"/> <!-- ARRAY_PITCH -->
+		<bitfield name="ASO_UNIT" pos="23"/> <!-- 4KB or 32B ? -->
+		<bitfield name="MIN_ARRAY_SLIZE_OFFSET" low="24" high="27" shr="12"/> <!-- MIN_LAYERSZ -->
+		<bitfield name="GMEM_TILING_FALLBACK_EN" pos="28" type="boolean"/>
+		<bitfield name="CORNER_BASED_EN" pos="30" type="boolean"/>
+		<bitfield name="GMEM_FULL_SURF" pos="31" type="boolean"/>
+		<!-- For multiplanar.  This overlaps other single-planar fields: -->
+		<bitfield name="UV_OFFSET_H" low="24" high="25" type="ufixed" radix="2"/> <!-- CHROMA_MIDPOINT_X -->
+		<bitfield name="UV_OFFSET_V" low="26" high="27" type="ufixed" radix="2"/> <!-- CHROMA_MIDPOINT_Y -->
+	</reg32>
+	<reg32 offset="8" name="8">
+		<bitfield name="FLAG_ARRAY_PITCH" low="0" high="14" shr="4" type="uint"/> <!-- FLAG_BUFFER_ARRAY_PITCH -->
+		<!-- log2 size of the first level, required for mipmapping -->
+		<bitfield name="FLAG_BUFFER_LOGW" low="24" high="27" type="uint"/>
+		<bitfield name="FLAG_BUFFER_LOGH" low="28" high="31" type="uint"/>
+		<!-- For multiplanar.  This overlaps other single-planar fields: -->
+		<bitfield name="BASE_V_LO" low="6" high="31" shr="6"/>
+	</reg32>
+	<reg32 offset="9" name="9">
+		<bitfield name="MIN_LOD_CLAMP" low="19" high="30" type="ufixed" radix="8"/>
+		<!-- For multiplanar, this overlaps other fields: -->
+		<bitfield name="BASE_V_HI" low="0" high="16"/>
+		<bitfield name="UV_PITCH" low="17" high="26"/> <!-- PLANE_PITCH -->
+	</reg32>
+	<reg32 offset="10" name="10"/>
+	<reg32 offset="11" name="11"/>
+	<reg32 offset="12" name="12"/>
+	<reg32 offset="13" name="13"/>
+	<reg32 offset="14" name="14"/>
+	<reg32 offset="15" name="15"/>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a8xx_enums.xml b/drivers/gpu/drm/msm/registers/adreno/a8xx_enums.xml
new file mode 100644
index 000000000000..aee8871d006f
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a8xx_enums.xml
@@ -0,0 +1,289 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="adreno/adreno_common.xml"/>
+<import file="adreno/adreno_pm4.xml"/>
+
+<enum name="a8xx_statetype_id">
+	<value value="0" name="A8XX_TP0_NCTX_REG"/>
+	<value value="1" name="A8XX_TP0_CTX0_3D_CVS_REG"/>
+	<value value="2" name="A8XX_TP0_CTX0_3D_CPS_REG"/>
+	<value value="3" name="A8XX_TP0_CTX1_3D_CVS_REG"/>
+	<value value="4" name="A8XX_TP0_CTX1_3D_CPS_REG"/>
+	<value value="5" name="A8XX_TP0_CTX2_3D_CPS_REG"/>
+	<value value="6" name="A8XX_TP0_CTX3_3D_CPS_REG"/>
+	<value value="9" name="A8XX_TP0_TMO_DATA"/>
+	<value value="10" name="A8XX_TP0_SMO_DATA"/>
+	<value value="11" name="A8XX_TP0_MIPMAP_BASE_DATA"/>
+	<value value="12" name="A8XX_TP_3D_CVS_REG"/>
+	<value value="13" name="A8XX_TP_3D_CPS_REG"/>
+	<value value="16" name="A8XX_SP_3D_CVS_REG"/>
+	<value value="17" name="A8XX_SP_3D_CPS_REG"/>
+	<value value="22" name="A8XX_SP_LB_DATA_RAM"/>
+	<value value="23" name="A8XX_SP_INST_DATA_RAM"/>
+	<value value="24" name="A8XX_SP_STH"/>
+	<value value="25" name="A8XX_SP_EVQ"/>
+	<value value="26" name="A8XX_SP_CONSMNG"/>
+	<value value="30" name="A8XX_HLSQ_INST_DATA_RAM"/>
+	<value value="31" name="A8XX_SP_INST_DATA_3"/>
+	<value value="32" name="A8XX_SP_NCTX_REG"/>
+	<value value="33" name="A8XX_SP_CTX0_3D_CVS_REG"/>
+	<value value="34" name="A8XX_SP_CTX0_3D_CPS_REG"/>
+	<value value="35" name="A8XX_SP_CTX1_3D_CVS_REG"/>
+	<value value="36" name="A8XX_SP_CTX1_3D_CPS_REG"/>
+	<value value="37" name="A8XX_SP_CTX2_3D_CPS_REG"/>
+	<value value="38" name="A8XX_SP_CTX3_3D_CPS_REG"/>
+	<value value="39" name="A8XX_SP_INST_DATA"/>
+	<value value="40" name="A8XX_SP_INST_DATA_1"/>
+	<value value="41" name="A8XX_SP_LB_0_DATA"/>
+	<value value="42" name="A8XX_SP_LB_1_DATA"/>
+	<value value="43" name="A8XX_SP_LB_2_DATA"/>
+	<value value="44" name="A8XX_SP_LB_3_DATA"/>
+	<value value="45" name="A8XX_SP_LB_4_DATA"/>
+	<value value="46" name="A8XX_SP_LB_5_DATA"/>
+	<value value="47" name="A8XX_SP_LB_6_DATA"/>
+	<value value="48" name="A8XX_SP_LB_7_DATA"/>
+	<value value="49" name="A8XX_SP_CB_RAM"/>
+	<value value="50" name="A8XX_SP_LB_13_DATA"/>
+	<value value="51" name="A8XX_SP_LB_14_DATA"/>
+	<value value="52" name="A8XX_SP_INST_TAG"/>
+	<value value="53" name="A8XX_SP_INST_DATA_2"/>
+	<value value="54" name="A8XX_SP_TMO_TAG"/>
+	<value value="55" name="A8XX_SP_SMO_TAG"/>
+	<value value="56" name="A8XX_SP_STATE_DATA"/>
+	<value value="57" name="A8XX_SP_HWAVE_RAM"/>
+	<value value="58" name="A8XX_SP_L0_INST_BUF"/>
+	<value value="59" name="A8XX_SP_LB_8_DATA"/>
+	<value value="60" name="A8XX_SP_LB_9_DATA"/>
+	<value value="61" name="A8XX_SP_LB_10_DATA"/>
+	<value value="62" name="A8XX_SP_LB_11_DATA"/>
+	<value value="63" name="A8XX_SP_LB_12_DATA"/>
+	<value value="64" name="A8XX_HLSQ_DATAPATH_DSTR_META"/>
+	<value value="65" name="A8XX_HLSQ_DESC_REMAP_META"/>
+	<value value="66" name="A8XX_HLSQ_SLICE_TOP_META"/>
+	<value value="67" name="A8XX_HLSQ_L2STC_TAG_RAM"/>
+	<value value="68" name="A8XX_HLSQ_L2STC_INFO_CMD"/>
+	<value value="69" name="A8XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG"/>
+	<value value="70" name="A8XX_HLSQ_CPS_BE_CTXT_BUF_RAM_TAG"/>
+	<value value="71" name="A8XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM"/>
+	<value value="72" name="A8XX_HLSQ_GFX_CPS_BE_CTXT_BUF_RAM"/>
+	<value value="73" name="A8XX_HLSQ_CHUNK_CVS_RAM"/>
+	<value value="74" name="A8XX_HLSQ_CHUNK_CPS_RAM"/>
+	<value value="75" name="A8XX_HLSQ_CHUNK_CVS_RAM_TAG"/>
+	<value value="76" name="A8XX_HLSQ_CHUNK_CPS_RAM_TAG"/>
+	<value value="77" name="A8XX_HLSQ_ICB_CVS_CB_BASE_TAG"/>
+	<value value="78" name="A8XX_HLSQ_ICB_CPS_CB_BASE_TAG"/>
+	<value value="79" name="A8XX_HLSQ_CVS_MISC_RAM"/>
+	<value value="80" name="A8XX_HLSQ_CPS_MISC_RAM"/>
+	<value value="81" name="A8XX_HLSQ_CPS_MISC_RAM_1"/>
+	<value value="82" name="A8XX_HLSQ_INST_RAM"/>
+	<value value="83" name="A8XX_HLSQ_GFX_CVS_CONST_RAM"/>
+	<value value="84" name="A8XX_HLSQ_GFX_CPS_CONST_RAM"/>
+	<value value="85" name="A8XX_HLSQ_CVS_MISC_RAM_TAG"/>
+	<value value="86" name="A8XX_HLSQ_CPS_MISC_RAM_TAG"/>
+	<value value="87" name="A8XX_HLSQ_INST_RAM_TAG"/>
+	<value value="88" name="A8XX_HLSQ_GFX_CVS_CONST_RAM_TAG"/>
+	<value value="89" name="A8XX_HLSQ_GFX_CPS_CONST_RAM_TAG"/>
+	<value value="90" name="A8XX_HLSQ_GFX_LOCAL_MISC_RAM"/>
+	<value value="91" name="A8XX_HLSQ_GFX_LOCAL_MISC_RAM_TAG"/>
+	<value value="92" name="A8XX_HLSQ_INST_RAM_1"/>
+	<value value="93" name="A8XX_HLSQ_STPROC_META"/>
+	<value value="94" name="A8XX_HLSQ_SLICE_BACKEND_META"/>
+	<value value="95" name="A8XX_HLSQ_INST_RAM_2"/>
+	<value value="96" name="A8XX_HLSQ_DATAPATH_META"/>
+	<value value="97" name="A8XX_HLSQ_FRONTEND_META"/>
+	<value value="98" name="A8XX_HLSQ_INDIRECT_META"/>
+	<value value="99" name="A8XX_HLSQ_BACKEND_META"/>
+</enum>
+
+<enum name="a8xx_state_location">
+	<value value="0" name="A8XX_HLSQ_STATE"/>
+	<value value="1" name="A8XX_HLSQ_DP"/>
+	<value value="2" name="A8XX_SP_TOP"/>
+	<value value="3" name="A8XX_USPTP"/>
+	<value value="4" name="A8XX_HLSQ_DP_STR"/>
+</enum>
+
+<enum name="a8xx_cluster">
+	<value value="0" name="A8XX_CLUSTER_NONE"/>
+	<value value="1" name="A8XX_CLUSTER_FE_US"/>
+	<value value="2" name="A8XX_CLUSTER_FE_S"/>
+	<value value="3" name="A8XX_CLUSTER_SP_VS"/>
+	<value value="4" name="A8XX_CLUSTER_VPC_VS"/>
+	<value value="5" name="A8XX_CLUSTER_VPC_US"/>
+	<value value="6" name="A8XX_CLUSTER_GRAS"/>
+	<value value="7" name="A8XX_CLUSTER_SP_PS"/>
+	<value value="8" name="A8XX_CLUSTER_VPC_PS"/>
+	<value value="9" name="A8XX_CLUSTER_PS"/>
+</enum>
+
+<enum name="a8xx_debugbus_id">
+	<value value="1" name="A8XX_DEBUGBUS_GBIF_CX_GC_US_I_0"/>
+	<value value="2" name="A8XX_DEBUGBUS_GMU_CX_GC_US_I_0"/>
+	<value value="3" name="A8XX_DEBUGBUS_CX_GC_US_I_0"/>
+	<value value="8" name="A8XX_DEBUGBUS_GBIF_GX_GC_US_I_0"/>
+	<value value="9" name="A8XX_DEBUGBUS_GMU_GX_GC_US_I_0"/>
+	<value value="10" name="A8XX_DEBUGBUS_DBGC_GC_US_I_0"/>
+	<value value="11" name="A8XX_DEBUGBUS_RBBM_GC_US_I_0"/>
+	<value value="12" name="A8XX_DEBUGBUS_LARC_GC_US_I_0"/>
+	<value value="13" name="A8XX_DEBUGBUS_COM_GC_US_I_0"/>
+	<value value="14" name="A8XX_DEBUGBUS_HLSQ_GC_US_I_0"/>
+	<value value="15" name="A8XX_DEBUGBUS_CGC_GC_US_I_0"/>
+	<value value="20" name="A8XX_DEBUGBUS_VSC_GC_US_I_0_0"/>
+	<value value="21" name="A8XX_DEBUGBUS_VSC_GC_US_I_0_1"/>
+	<value value="24" name="A8XX_DEBUGBUS_UFC_GC_US_I_0"/>
+	<value value="25" name="A8XX_DEBUGBUS_UFC_GC_US_I_1"/>
+	<value value="40" name="A8XX_DEBUGBUS_CP_GC_US_I_0_0"/>
+	<value value="41" name="A8XX_DEBUGBUS_CP_GC_US_I_0_1"/>
+	<value value="42" name="A8XX_DEBUGBUS_CP_GC_US_I_0_2"/>
+	<value value="56" name="A8XX_DEBUGBUS_PC_BR_US_I_0"/>
+	<value value="57" name="A8XX_DEBUGBUS_PC_BV_US_I_0"/>
+	<value value="58" name="A8XX_DEBUGBUS_GPC_BR_US_I_0"/>
+	<value value="59" name="A8XX_DEBUGBUS_GPC_BV_US_I_0"/>
+	<value value="60" name="A8XX_DEBUGBUS_VPC_BR_US_I_0"/>
+	<value value="61" name="A8XX_DEBUGBUS_VPC_BV_US_I_0"/>
+	<value value="80" name="A8XX_DEBUGBUS_UCHE_WRAPPER_GC_US_I_0"/>
+	<value value="81" name="A8XX_DEBUGBUS_UCHE_GC_US_I_0"/>
+	<value value="82" name="A8XX_DEBUGBUS_UCHE_GC_US_I_1"/>
+	<value value="83" name="A8XX_DEBUGBUS_UCHE_GC_US_I_0_1"/>
+	<value value="84" name="A8XX_DEBUGBUS_UCHE_GC_US_I_1_1"/>
+	<value value="128" name="A8XX_DEBUGBUS_CP_GC_S_0_I_0"/>
+	<value value="129" name="A8XX_DEBUGBUS_PC_BR_S_0_I_0"/>
+	<value value="130" name="A8XX_DEBUGBUS_PC_BV_S_0_I_0"/>
+	<value value="131" name="A8XX_DEBUGBUS_TESS_GC_S_0_I_0"/>
+	<value value="132" name="A8XX_DEBUGBUS_TSEFE_GC_S_0_I_0"/>
+	<value value="133" name="A8XX_DEBUGBUS_TSEBE_GC_S_0_I_0"/>
+	<value value="134" name="A8XX_DEBUGBUS_RAS_GC_S_0_I_0"/>
+	<value value="135" name="A8XX_DEBUGBUS_LRZ_BR_S_0_I_0"/>
+	<value value="136" name="A8XX_DEBUGBUS_LRZ_BV_S_0_I_0"/>
+	<value value="137" name="A8XX_DEBUGBUS_VFDP_GC_S_0_I_0"/>
+	<value value="138" name="A8XX_DEBUGBUS_GPC_BR_S_0_I_0"/>
+	<value value="139" name="A8XX_DEBUGBUS_GPC_BV_S_0_I_0"/>
+	<value value="140" name="A8XX_DEBUGBUS_VPCFE_BR_S_0_I_0"/>
+	<value value="141" name="A8XX_DEBUGBUS_VPCFE_BV_S_0_I_0"/>
+	<value value="142" name="A8XX_DEBUGBUS_VPCBE_BR_S_0_I_0"/>
+	<value value="143" name="A8XX_DEBUGBUS_VPCBE_BV_S_0_I_0"/>
+	<value value="144" name="A8XX_DEBUGBUS_CCHE_GC_S_0_I_0"/>
+	<value value="145" name="A8XX_DEBUGBUS_DBGC_GC_S_0_I_0"/>
+	<value value="146" name="A8XX_DEBUGBUS_LARC_GC_S_0_I_0"/>
+	<value value="147" name="A8XX_DEBUGBUS_RBBM_GC_S_0_I_0"/>
+	<value value="148" name="A8XX_DEBUGBUS_CCRE_GC_S_0_I_0"/>
+	<value value="149" name="A8XX_DEBUGBUS_CGC_GC_S_0_I_0"/>
+	<value value="150" name="A8XX_DEBUGBUS_GMU_GC_S_0_I_0"/>
+	<value value="151" name="A8XX_DEBUGBUS_SLICE_GC_S_0_I_0"/>
+	<value value="152" name="A8XX_DEBUGBUS_HLSQ_SPTP_STAR_GC_S_0_I_0"/>
+	<value value="160" name="A8XX_DEBUGBUS_USP_GC_S_0_I_0"/>
+	<value value="161" name="A8XX_DEBUGBUS_USP_GC_S_0_I_1"/>
+	<value value="166" name="A8XX_DEBUGBUS_USPTP_GC_S_0_I_0"/>
+	<value value="167" name="A8XX_DEBUGBUS_USPTP_GC_S_0_I_1"/>
+	<value value="168" name="A8XX_DEBUGBUS_USPTP_GC_S_0_I_2"/>
+	<value value="169" name="A8XX_DEBUGBUS_USPTP_GC_S_0_I_3"/>
+	<value value="178" name="A8XX_DEBUGBUS_TP_GC_S_0_I_0"/>
+	<value value="179" name="A8XX_DEBUGBUS_TP_GC_S_0_I_1"/>
+	<value value="180" name="A8XX_DEBUGBUS_TP_GC_S_0_I_2"/>
+	<value value="181" name="A8XX_DEBUGBUS_TP_GC_S_0_I_3"/>
+	<value value="190" name="A8XX_DEBUGBUS_RB_GC_S_0_I_0"/>
+	<value value="191" name="A8XX_DEBUGBUS_RB_GC_S_0_I_1"/>
+	<value value="196" name="A8XX_DEBUGBUS_CCU_GC_S_0_I_0"/>
+	<value value="197" name="A8XX_DEBUGBUS_CCU_GC_S_0_I_1"/>
+	<value value="202" name="A8XX_DEBUGBUS_HLSQ_GC_S_0_I_0"/>
+	<value value="203" name="A8XX_DEBUGBUS_HLSQ_GC_S_0_I_1"/>
+	<value value="208" name="A8XX_DEBUGBUS_VFD_GC_S_0_I_0"/>
+	<value value="209" name="A8XX_DEBUGBUS_VFD_GC_S_0_I_1"/>
+	<value value="256" name="A8XX_DEBUGBUS_CP_GC_S_1_I_0"/>
+	<value value="257" name="A8XX_DEBUGBUS_PC_BR_S_1_I_0"/>
+	<value value="258" name="A8XX_DEBUGBUS_PC_BV_S_1_I_0"/>
+	<value value="259" name="A8XX_DEBUGBUS_TESS_GC_S_1_I_0"/>
+	<value value="260" name="A8XX_DEBUGBUS_TSEFE_GC_S_1_I_0"/>
+	<value value="261" name="A8XX_DEBUGBUS_TSEBE_GC_S_1_I_0"/>
+	<value value="262" name="A8XX_DEBUGBUS_RAS_GC_S_1_I_0"/>
+	<value value="263" name="A8XX_DEBUGBUS_LRZ_BR_S_1_I_0"/>
+	<value value="264" name="A8XX_DEBUGBUS_LRZ_BV_S_1_I_0"/>
+	<value value="265" name="A8XX_DEBUGBUS_VFDP_GC_S_1_I_0"/>
+	<value value="266" name="A8XX_DEBUGBUS_GPC_BR_S_1_I_0"/>
+	<value value="267" name="A8XX_DEBUGBUS_GPC_BV_S_1_I_0"/>
+	<value value="268" name="A8XX_DEBUGBUS_VPCFE_BR_S_1_I_0"/>
+	<value value="269" name="A8XX_DEBUGBUS_VPCFE_BV_S_1_I_0"/>
+	<value value="270" name="A8XX_DEBUGBUS_VPCBE_BR_S_1_I_0"/>
+	<value value="271" name="A8XX_DEBUGBUS_VPCBE_BV_S_1_I_0"/>
+	<value value="272" name="A8XX_DEBUGBUS_CCHE_GC_S_1_I_0"/>
+	<value value="273" name="A8XX_DEBUGBUS_DBGC_GC_S_1_I_0"/>
+	<value value="274" name="A8XX_DEBUGBUS_LARC_GC_S_1_I_0"/>
+	<value value="275" name="A8XX_DEBUGBUS_RBBM_GC_S_1_I_0"/>
+	<value value="276" name="A8XX_DEBUGBUS_CCRE_GC_S_1_I_0"/>
+	<value value="277" name="A8XX_DEBUGBUS_CGC_GC_S_1_I_0"/>
+	<value value="278" name="A8XX_DEBUGBUS_GMU_GC_S_1_I_0"/>
+	<value value="279" name="A8XX_DEBUGBUS_SLICE_GC_S_1_I_0"/>
+	<value value="280" name="A8XX_DEBUGBUS_HLSQ_SPTP_STAR_GC_S_1_I_0"/>
+	<value value="288" name="A8XX_DEBUGBUS_USP_GC_S_1_I_0"/>
+	<value value="289" name="A8XX_DEBUGBUS_USP_GC_S_1_I_1"/>
+	<value value="294" name="A8XX_DEBUGBUS_USPTP_GC_S_1_I_0"/>
+	<value value="295" name="A8XX_DEBUGBUS_USPTP_GC_S_1_I_1"/>
+	<value value="296" name="A8XX_DEBUGBUS_USPTP_GC_S_1_I_2"/>
+	<value value="297" name="A8XX_DEBUGBUS_USPTP_GC_S_1_I_3"/>
+	<value value="306" name="A8XX_DEBUGBUS_TP_GC_S_1_I_0"/>
+	<value value="307" name="A8XX_DEBUGBUS_TP_GC_S_1_I_1"/>
+	<value value="308" name="A8XX_DEBUGBUS_TP_GC_S_1_I_2"/>
+	<value value="309" name="A8XX_DEBUGBUS_TP_GC_S_1_I_3"/>
+	<value value="318" name="A8XX_DEBUGBUS_RB_GC_S_1_I_0"/>
+	<value value="319" name="A8XX_DEBUGBUS_RB_GC_S_1_I_1"/>
+	<value value="324" name="A8XX_DEBUGBUS_CCU_GC_S_1_I_0"/>
+	<value value="325" name="A8XX_DEBUGBUS_CCU_GC_S_1_I_1"/>
+	<value value="330" name="A8XX_DEBUGBUS_HLSQ_GC_S_1_I_0"/>
+	<value value="331" name="A8XX_DEBUGBUS_HLSQ_GC_S_1_I_1"/>
+	<value value="336" name="A8XX_DEBUGBUS_VFD_GC_S_1_I_0"/>
+	<value value="337" name="A8XX_DEBUGBUS_VFD_GC_S_1_I_1"/>
+	<value value="384" name="A8XX_DEBUGBUS_CP_GC_S_2_I_0"/>
+	<value value="385" name="A8XX_DEBUGBUS_PC_BR_S_2_I_0"/>
+	<value value="386" name="A8XX_DEBUGBUS_PC_BV_S_2_I_0"/>
+	<value value="387" name="A8XX_DEBUGBUS_TESS_GC_S_2_I_0"/>
+	<value value="388" name="A8XX_DEBUGBUS_TSEFE_GC_S_2_I_0"/>
+	<value value="389" name="A8XX_DEBUGBUS_TSEBE_GC_S_2_I_0"/>
+	<value value="390" name="A8XX_DEBUGBUS_RAS_GC_S_2_I_0"/>
+	<value value="391" name="A8XX_DEBUGBUS_LRZ_BR_S_2_I_0"/>
+	<value value="392" name="A8XX_DEBUGBUS_LRZ_BV_S_2_I_0"/>
+	<value value="393" name="A8XX_DEBUGBUS_VFDP_GC_S_2_I_0"/>
+	<value value="394" name="A8XX_DEBUGBUS_GPC_BR_S_2_I_0"/>
+	<value value="395" name="A8XX_DEBUGBUS_GPC_BV_S_2_I_0"/>
+	<value value="396" name="A8XX_DEBUGBUS_VPCFE_BR_S_2_I_0"/>
+	<value value="397" name="A8XX_DEBUGBUS_VPCFE_BV_S_2_I_0"/>
+	<value value="398" name="A8XX_DEBUGBUS_VPCBE_BR_S_2_I_0"/>
+	<value value="399" name="A8XX_DEBUGBUS_VPCBE_BV_S_2_I_0"/>
+	<value value="400" name="A8XX_DEBUGBUS_CCHE_GC_S_2_I_0"/>
+	<value value="401" name="A8XX_DEBUGBUS_DBGC_GC_S_2_I_0"/>
+	<value value="402" name="A8XX_DEBUGBUS_LARC_GC_S_2_I_0"/>
+	<value value="403" name="A8XX_DEBUGBUS_RBBM_GC_S_2_I_0"/>
+	<value value="404" name="A8XX_DEBUGBUS_CCRE_GC_S_2_I_0"/>
+	<value value="405" name="A8XX_DEBUGBUS_CGC_GC_S_2_I_0"/>
+	<value value="406" name="A8XX_DEBUGBUS_GMU_GC_S_2_I_0"/>
+	<value value="407" name="A8XX_DEBUGBUS_SLICE_GC_S_2_I_0"/>
+	<value value="408" name="A8XX_DEBUGBUS_HLSQ_SPTP_STAR_GC_S_2_I_0"/>
+	<value value="416" name="A8XX_DEBUGBUS_USP_GC_S_2_I_0"/>
+	<value value="417" name="A8XX_DEBUGBUS_USP_GC_S_2_I_1"/>
+	<value value="422" name="A8XX_DEBUGBUS_USPTP_GC_S_2_I_0"/>
+	<value value="423" name="A8XX_DEBUGBUS_USPTP_GC_S_2_I_1"/>
+	<value value="424" name="A8XX_DEBUGBUS_USPTP_GC_S_2_I_2"/>
+	<value value="425" name="A8XX_DEBUGBUS_USPTP_GC_S_2_I_3"/>
+	<value value="434" name="A8XX_DEBUGBUS_TP_GC_S_2_I_0"/>
+	<value value="435" name="A8XX_DEBUGBUS_TP_GC_S_2_I_1"/>
+	<value value="436" name="A8XX_DEBUGBUS_TP_GC_S_2_I_2"/>
+	<value value="437" name="A8XX_DEBUGBUS_TP_GC_S_2_I_3"/>
+	<value value="446" name="A8XX_DEBUGBUS_RB_GC_S_2_I_0"/>
+	<value value="447" name="A8XX_DEBUGBUS_RB_GC_S_2_I_1"/>
+	<value value="452" name="A8XX_DEBUGBUS_CCU_GC_S_2_I_0"/>
+	<value value="453" name="A8XX_DEBUGBUS_CCU_GC_S_2_I_1"/>
+	<value value="458" name="A8XX_DEBUGBUS_HLSQ_GC_S_2_I_0"/>
+	<value value="459" name="A8XX_DEBUGBUS_HLSQ_GC_S_2_I_1"/>
+	<value value="464" name="A8XX_DEBUGBUS_VFD_GC_S_2_I_0"/>
+	<value value="465" name="A8XX_DEBUGBUS_VFD_GC_S_2_I_1"/>
+</enum>
+
+<enum name="a8xx_usptp_id">
+	<value value="0" name="A8XX_uSPTP0"/>
+	<value value="1" name="A8XX_uSPTP1"/>
+	<value value="15" name="A8XX_SPTOP"/>
+</enum>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
index 06020dc1df44..79d204f1e400 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
@@ -11,6 +11,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<value name="A5XX" value="5"/>
 	<value name="A6XX" value="6"/>
 	<value name="A7XX" value="7"/>
+	<value name="A8XX" value="8"/>
 </enum>
 
 <enum name="adreno_pa_su_sc_draw">

-- 
2.51.0

