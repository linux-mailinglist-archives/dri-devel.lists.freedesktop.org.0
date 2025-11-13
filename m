Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E49AC5A984
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BF410E960;
	Thu, 13 Nov 2025 23:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ma4ZdqkO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDaSW6D6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9123910E977
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMapJl1581530
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T7lL+wHRlVycIkfmdrmoL7r3zk2jcr0ixS997W6ENF4=; b=ma4ZdqkOFWK5JpVR
 NxAyWssPSxiaPkQMXjd+iy46jfJhOwhCFniUNeEvrd4K2xACE4Hn9MBrKRhfkIYg
 tWAdVORlZ6bJBGvBFXjOhd72wmLv0I+chYqHTBmXHAn1xJjiswFU2RTcECe6+kJh
 5qLQVZYyahSPonUopfe/jpTd91bCGPqxV+N/WPT9tKk9o9pBU5aNScRgT1OS/RRw
 7S3ZP9rmNq1hJIsrndO+RIlCgezfb5DJPPZ0vhWhjW3IepUdEI5qgteDke8DHWBW
 sbayo5ndCB6bXlwX0CiXpDgnd97tkUoXz5cw2O0BQqIHrQsmLBoEJ5yzH5howCLW
 xJghmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fr4bu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3416dc5754fso1905921a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076706; x=1763681506;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T7lL+wHRlVycIkfmdrmoL7r3zk2jcr0ixS997W6ENF4=;
 b=iDaSW6D6L8xAknjH/JsJ+ZGB2lf6anL9Vd3JQIKKBlTF3man9raCkbgCVfZTHZ/BN7
 V6XGrb5LbfBzwjSrWRXbc4KQ2JoYiNMInnZ/1/SpmapyrX6U0HPVv69geBvFaSp8oUov
 e/fYGrPs1ruATGwxzCL3m6Q+4TJm6/wfBx5KqBxS+JaOckot8wC2A2/p2DrvXhgznSMt
 xI+WYegWEzlG10JbEBd4aM8A4bOgXf3ncRrjuxuzAnVzEAxL+keKZQo2kjT6bpZTjTYl
 PySnPf/M5dBeSmk2nUm8cehQJtK623UJGBvc/WBEm6r+By8uw7Bp1MdXBwUr3xpbc6KU
 EV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076706; x=1763681506;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=T7lL+wHRlVycIkfmdrmoL7r3zk2jcr0ixS997W6ENF4=;
 b=sYBmnnqDfnA/EzLwNubW1s7GWokPfqwpdGVq4twgkTEQYChdxvqPyqEqAvwB578Gxj
 gI31ayn2lgc8MFuLyvdy4JpYXMcY40lKUbEBPOAWkbbKwvvDNTBTQfk8f6vRP5Py/y1x
 OhuAaaCS93fH6axuH4+c4obwQ6YDyoqC/jee+1nUbcVi/T63AkPHEpLzJ6WxQ5T/ky2U
 JI+OOyi6tjZhb3EGrp+UzO+H5MrmTnSnq5pElzD5tMKgbrykDo8XMX5zi6XoMux6rWcs
 6Gdq2g/q3rDJgfy8VHWlLKnGk56JgNHuiG8/PcCvLvZplLHqUc0+MnK3yZ5hechKTF+g
 DWdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAiSbB41fQp3rtrTFXbM9ueOLvl7zrD9uZQVT6JQnscmSLOLvUDGjVIpRQIoJwGMT6S0ebzn5XADI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL/jpNeJjPGV6E+EqzX9sniwXPdwHsfrTMAiER9N5FuvTa4azj
 /Vf2R+gUvpGPYUXok3mjVhjPPyb8V0/PGzozq1myMDkRC0E2a4TVlsB7AQXXXHaFYaQ2O8mYXmh
 P5eG+rq5dKqfWa31odHKmYZ7G9sjhlX0bTbz+5xmkV7ewUP5PZnJMY7soIS3yZsXUHse50SE=
X-Gm-Gg: ASbGncutDqE+K8+IIXhi74fgHVU15kxR442gNy0yU4bNKwu6EsP9Zjse3SEPUXTpSAJ
 dPHZd/FDhxkxcfjXpS45+Mf36uWIIvZr2eWCiXgZnpzVR8MoeCQ7qH48Vf857hZbrw40HFo3fYm
 z4jank28CkG2bHxtxZPKHpjEZUj2xmTX1CH/vasdcD0dAy/FhcvFvJ+g2Lmbmv9DcJjCTCBYykX
 94EzcF56PCXtx/CUzPKoWxjsiuLjpxpZQYKlTP+4qoVv4LjluEGI+W7eIGoh8X10jSWnUHDkumY
 O21zv3C+XevYgivQWO5rceVyL1pU7G9JVX+dMT3NKO+O3wZZKo+MWVDwSzR/MnhosC47QBpTFl/
 y8maPpdb/2A1Xay3Fczo7rR8=
X-Received: by 2002:a17:90b:51cb:b0:340:ec6f:5ac5 with SMTP id
 98e67ed59e1d1-343f9e915bbmr860664a91.2.1763076706280; 
 Thu, 13 Nov 2025 15:31:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTwFM9CCphaQ5whCinTvXn5LPKMniluHIK/piKQ6bwD0tNBssWX7/1U80c08tDatxvglqrbQ==
X-Received: by 2002:a17:90b:51cb:b0:340:ec6f:5ac5 with SMTP id
 98e67ed59e1d1-343f9e915bbmr860629a91.2.1763076705747; 
 Thu, 13 Nov 2025 15:31:45 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:31:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:13 +0530
Subject: [PATCH v3 16/20] drm/msm/adreno: Do CX GBIF config before GMU
 start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-16-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=10308;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+vVNaPuZ+LbXCAiwTgYpXS3jmsHZyAtK5v4jSdPMdI8=;
 b=KYaJqUY7HtLKnHvUnLHMX6bKlSmvByb4fO6Gwh6IVrs8Ou3WPwvlS5DCCTur3SRXsAodquqV9
 qCpl1V2T0lZAIRKPk1pYVNcWOcz8G8TfQbCwfKCo0EcJ8rhiJvDmu+7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69166a63 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ntF6p7UtnlAjiWeDXbsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: xw4dXgOf663ZTXIlDL9OOT9ka9AfdIyd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX3kd/wB5ch+UC
 ixV5i20WlWt3nVzbQoJ/QzACjSxz8hNAIubPeKD1QGpnJ4U0JvTzfT4Qk4AbcbBzhQSIXlmTJez
 FuRfWRH7NN6mZeOgOBa72Xih3SmQDxzCpB3zF4bywy1cNwLZo5uhrZPDzYyDaAOUq/pjbnK/i1+
 0QOywU3VNWHz7t2FIVzbePKPwTjyHExtXzUPm7HE3Qd378P35jvOQnZEJV1yt9CAj5KE7mtDKF9
 K7qM1Bv9uxzwbGWu4BfxXeZn5j54fCtVVq7Io/5PKiUZ8gpUWWvnOAFjlcv0OhfP37/PJtUWT5E
 3765g4veBacNa4g2It6+tzHjLxt3ryotUd8Vn5JhgrZYJQvEZR4CzPk/Y1H/HsyDTgDgDj4e2ac
 Ni8GgYvW/VwLCsYoF0+6kl5gd8pI7w==
X-Proofpoint-ORIG-GUID: xw4dXgOf663ZTXIlDL9OOT9ka9AfdIyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
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

GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
configurations before GMU wakes up. This was not a problem so far, but
A840 GPU is very sensitive to this requirement. Also, move these
registers to the catalog.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 32 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 +++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |  7 -------
 5 files changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index ffd977cc4ea5..f064ef6b8be1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -672,6 +672,14 @@ static const u32 a690_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a690_protect, 48);
 
+static const struct adreno_reglist a640_gbif[] = {
+	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071620 },
+	{ },
+};
+
 static const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -688,6 +696,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
 			.protect = &a630_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00080000,
 		},
@@ -878,6 +887,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a620_hwcg,
 			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00010000,
 		},
@@ -900,6 +910,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00010000,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -982,6 +993,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
 			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00300200,
 		},
@@ -1008,6 +1020,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020000,
 			.prim_fifo_threshold = 0x00300200,
 		},
@@ -1026,6 +1039,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a660_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
@@ -1050,6 +1064,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
@@ -1096,6 +1111,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a690_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00800200,
 		},
@@ -1431,6 +1447,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
 			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x0000c000,
 		},
@@ -1458,6 +1475,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020000,
 		},
 		.preempt_record_size = 2860 * SZ_1K,
@@ -1479,6 +1497,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1513,6 +1532,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1554,6 +1574,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1586,6 +1607,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x70f0000,
 			.gmu_cgc_mode = 0x00020222,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1733,6 +1755,15 @@ static const u32 a840_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a840_protect, 15);
 
+static const struct adreno_reglist a840_gbif[] = {
+	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
+	{ REG_A8XX_GBIF_CX_CONFIG, 0x20023000 },
+	{ },
+};
+
 static const struct adreno_info a8xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x44050a01),
@@ -1750,6 +1781,7 @@ static const struct adreno_info a8xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a840_protect,
 			.nonctxt_reglist = a840_nonctxt_regs,
+			.gbif_cx = a840_gbif,
 			.max_slices = 3,
 			.gmu_chipid = 0x8020100,
 			.bcms = (const struct a6xx_bcm[]) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 063dfc392b9d..cc2bb844cfb4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -868,7 +868,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
 	const struct a6xx_info *a6xx_info = adreno_gpu->info->a6xx;
+	const struct adreno_reglist *gbif_cx = a6xx_info->gbif_cx;
 	u32 fence_range_lower, fence_range_upper;
 	u32 chipid = 0;
 	int ret;
@@ -964,6 +966,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 			  gmu->log.iova | (gmu->log.size / SZ_4K - 1));
 	}
 
+	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
+	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
+		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
+
+	if (adreno_is_a8xx(adreno_gpu)) {
+		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
+		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
+	}
+
 	/* Set up the lowest idle level on the GMU */
 	a6xx_gmu_power_config(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ef79f4cfb80b..53187a228db3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1265,17 +1265,20 @@ static int hw_init(struct msm_gpu *gpu)
 	/* enable hardware clockgating */
 	a6xx_set_hwcg(gpu, true);
 
-	/* VBIF/GBIF start*/
-	if (adreno_is_a610_family(adreno_gpu) ||
-	    adreno_is_a640_family(adreno_gpu) ||
-	    adreno_is_a650_family(adreno_gpu) ||
-	    adreno_is_a7xx(adreno_gpu)) {
+	/* For gmuwrapper implementations, do the VBIF/GBIF CX configuration here */
+	if (adreno_is_a610_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
-		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
-			  adreno_is_a7xx(adreno_gpu) ? 0x2120212 : 0x3);
+	}
+
+	if (adreno_is_a610_family(adreno_gpu) ||
+	    adreno_is_a640_family(adreno_gpu) ||
+	    adreno_is_a650_family(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
+	} else if (adreno_is_a7xx(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x2120212);
 	} else {
 		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 0ec265d4b91a..6820216ec5fc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -46,6 +46,7 @@ struct a6xx_info {
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
 	const struct adreno_reglist_list *ifpc_reglist;
+	const struct adreno_reglist *gbif_cx;
 	const struct adreno_reglist_pipe *nonctxt_reglist;
 	u32 max_slices;
 	u32 gmu_chipid;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 78b38b52da91..386ee1207622 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -523,13 +523,6 @@ static int hw_init(struct msm_gpu *gpu)
 	gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE, 0x00000000);
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
 
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
-	gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
-	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
-
 	/* Make all blocks contribute to the GPU BUSY perf counter */
 	gpu_write(gpu, REG_A8XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff);
 

-- 
2.51.0

