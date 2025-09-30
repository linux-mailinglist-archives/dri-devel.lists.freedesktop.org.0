Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF0BAB8DC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7262810E500;
	Tue, 30 Sep 2025 05:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHcgfdkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E3010E500
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:43 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HPXL009323
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NpA7cRx2piPd6l00sCub/GWmDyOBb2LGz//j2JJNMWE=; b=ZHcgfdkjeL6SIOA8
 VtQprgQas6w87d+LZI+NwmLN4+ko9DyFL454A9TLtULd6JuD1hQYzuI3dopes/yH
 BiVr0SIVfAmr0/bbFw/Id3reRD7YZjzaAwYArgwdMZL0LwmsVJtBHgkTUp55ai7A
 ek5psMoXWzH99JziV6ae8fjTSFfGOJIyPXpC2Extb1nT9Yk8/SuEcqq0TryRxRuX
 4xTag166bVGrXyXl5vV4mf+SxqFfl/XHdFUHSmQ/1P4RWo7MN5QrIRKSmDc4XdiH
 9WIIMVIF9SW9OPxkYbJATtvQDHItHZh8XtJWFozxEHU40otERqoQO6w5E7oy+l1G
 ljCjnA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977qj5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32eb864fe90so7861489a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211502; x=1759816302;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpA7cRx2piPd6l00sCub/GWmDyOBb2LGz//j2JJNMWE=;
 b=wgtxp0EFaocZXRtUE5Qau0b57KkGam0F/F89SfKWCackOnDn8shfEovCcYvN5jUM9H
 e0AaeSHLdPd1miXTFFJDG9Uv75w3QNxiSeJ6cvQTqeClgwUgBvqukkeTFDVp+uD9Dp98
 LfEuWDNzMiuxKaSRJwrg8Rtw3iZHMJAsnOwrjWvMwSwo0FsT0V46zyoNkmigyAh7uLaM
 waVnRKZ1eTWPbFg/sd+YSuayrbXxon37ftJUpg+3mr0xdU4ETVE0ECX88U3LjbtOIipg
 cRDs3wu1nHTqH5Lh3gutguhz2gk2uCmX+egp73Rp1uDlUZYFPbqxH14o63g13siBMrWi
 +CYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDyAKUZKizWqLeCPrQih+Vw9R38QAzGLeFWnzANEpk9ypUJSH2+1Wf2jtD+oTvJbfgNVAs3wKjRE8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWKnAuTYQuk8ZDfAz41BPfPuEY/VKS+eCq8JK3seVP4FmRHYTo
 aETxqVH/iGqyEFPn0e852H//0aPsDhTSV6Gzov03EblDPHRZiTthcwj/vRuBvNjtiS3UGRyETY6
 WJb1FS32XUITzhTt16BSg8lnrv53EEOVDmjFocfc7/wLAN3Ve8eIxIT+zhOX72vfR0vxklrg=
X-Gm-Gg: ASbGncv9KF2HNfklEaR/ueUSALYxSDD+H//C8GCjccQHrnCa/Q1NDrFirPJzhDmhbCo
 oDOwR34qBjG2HDVZHmO/p6yjVPs2vCuOSP8+yvB9PrOU/HNCqo4bXmq4/jskcK67/Lb7cPYZKUN
 zK4mB8gUceEM0EAX10ZE6sXPXxp8OF7yHk7Y0qwiSoH/UZYZDfOIduf4Q9u9ZFlY8A5bpbJCA+f
 xsN9P1b/LjyOaI7AZw0d4NKjRnJGmiUW1AlLAgmTq2frQmS6VPuDDPeKltMcFOhXrCwceME8C6v
 ohfJDcrYtuNuMkD1lPeMj2isLwwkaLMm1RwVyN46wQCwMVR+IefTk61strWNaCeRv38HEQ==
X-Received: by 2002:a17:90b:4c86:b0:32b:623d:ee91 with SMTP id
 98e67ed59e1d1-3342a79339cmr20563784a91.27.1759211501911; 
 Mon, 29 Sep 2025 22:51:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk+a6mDl8c2+qL3qeaLAv52uqJNABRBj7IAceU6HekQdYrgLtRlf003i7wMY4GUWbM+uBw7A==
X-Received: by 2002:a17:90b:4c86:b0:32b:623d:ee91 with SMTP id
 98e67ed59e1d1-3342a79339cmr20563742a91.27.1759211501416; 
 Mon, 29 Sep 2025 22:51:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:51:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:20 +0530
Subject: [PATCH 15/17] drm/msm/adreno: Do CX GBIF config before GMU start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=8532;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Ogi6WR+AUJ+HMPIbw08XT0QOUtgRv7szxAr4+cB63z8=;
 b=aU6ou0n3j1WE8uEgt6sbBfH2XVEzomkhB+50ezu00MWrg1u4DendU6H2/IFwMjJ3AqbO1/+Tk
 4O3wG4PUNXLA5tAveUm/OwwWZmwL8hNp+F+ifJwo8s9TZDD9flYqGuu
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: elbAoMsqV9wYjmhYv3ue1Wn9tp8lRS1s
X-Proofpoint-ORIG-GUID: elbAoMsqV9wYjmhYv3ue1Wn9tp8lRS1s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX4eGTVc1J67Ls
 M8g5rmXl8WXS1mvJf38Aedy52B5oNblQBH5ClFG7e3U8vGvVdO1jSK77KQbcPMU4rr7Q43ynX6N
 PXlNt0R2zTlJeTjIz9dmXCjqbXzRRxMizqE7S+vUuTGrm8otciyasWzvdpMZoVQi6iLRD6e9WBq
 iqemO2KunYD2JrSoFzkzlscErziz+HgGV92Y/n1siS+XaPAkrFAJPaKeqFdoG7UP5s/AHRgSKvV
 W2Zb71TU/aqDF9dWA7bbQ4gMEkCeFrpmcxMuDLyDKEkdsf6vSqTNUUyPgJKbXDVnhfbhTccONjd
 CBLhOGQwjkJSEX52Y5JSfl9+SRiGH/yUU+YTPOENg9jlzg/zraqhZOKQqJFCoCwIU9iLtoxdB1l
 qRnCBB3OXlk6heryu+6kJ8b1tJpreQ==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68db6fee cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YA97rT-oG-3-htpHkkkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
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
configurations before GMU wakes up. Also, move these registers to
the catalog.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 12 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 ++++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 10 +++-------
 5 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index acd0ff2efde5ee9f1ccef7cf9f4d2793179a8b3b..b61354cb1eb87cbaafce92c50a4de740f3006633 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1336,6 +1336,14 @@ static const u32 a730_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a730_protect, 48);
 
+static const struct adreno_reglist a730_gbif[] = {
+	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071620 },
+	{ },
+};
+
 static const uint32_t a7xx_pwrup_reglist_regs[] = {
 	REG_A6XX_UCHE_TRAP_BASE,
 	REG_A6XX_UCHE_TRAP_BASE + 1,
@@ -1463,6 +1471,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_cgc_mode = 0x00020000,
 		},
 		.preempt_record_size = 2860 * SZ_1K,
@@ -1484,6 +1493,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1518,6 +1528,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1559,6 +1570,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1591,6 +1603,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x70f0000,
 			.gmu_cgc_mode = 0x00020222,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1789,6 +1802,15 @@ static const u32 a840_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a840_protect, 64);
 
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
 		.chip_ids = ADRENO_CHIP_IDS(0x44050a31),
@@ -1807,6 +1829,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			.protect = &a840_protect,
 			.pwrup_reglist = &a840_pwrup_reglist,
 			.nonctxt_reglist = a840_nonctxt_regs,
+			.gbif_cx = a840_gbif,
 			.gmu_chipid = 0x8020100,
 			.bcms = (const struct a6xx_bcm[]) {
 				{ .name = "SH0", .buswidth = 16 },
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f24b88fb8500a2ff2aef3afa9ecd5392c67e1bac..a176c0fd2e53e48b63b442455147425341309e2a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -872,7 +872,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
 	const struct a6xx_info *a6xx_info = adreno_gpu->info->a6xx;
+	const struct adreno_reglist *gbif_cx = a6xx_info->gbif_cx;
 	u32 fence_range_lower, fence_range_upper;
 	u32 chipid = 0;
 	int ret;
@@ -968,6 +970,16 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 			  gmu->log.iova | (gmu->log.size / SZ_4K - 1));
 	}
 
+	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
+	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
+		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
+
+	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
+	if (adreno_is_a8xx(adreno_gpu)) {
+		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
+		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
+	}
+
 	/* Set up the lowest idle level on the GMU */
 	a6xx_gmu_power_config(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 07ac5be9d0bccf4d2345eb76b08851a94187e861..e4e3e12fff952209aa831fb491bac42aa554b4a3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1261,17 +1261,20 @@ static int hw_init(struct msm_gpu *gpu)
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
index a6ef8381abe5dd3eb202a645bb87a3bc352df047..e6c8b98ae16e998170d8f6eeabfe09b4af150946 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -46,6 +46,7 @@ struct a6xx_info {
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
 	const struct adreno_reglist_list *ifpc_reglist;
+	const struct adreno_reglist *gbif_cx;
 	const struct adreno_reglist_pipe *nonctxt_reglist;
 	u32 gmu_chipid;
 	u32 gmu_cgc_mode;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 9a09ce37687aba2f720637ec3845a25d72d2fff7..9675769beccf6b6b22df2a688540fe826f9d2f8a 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -484,6 +484,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	/* Increase priority of GMU traffic over GPU traffic */
+	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -492,13 +495,6 @@ static int hw_init(struct msm_gpu *gpu)
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

