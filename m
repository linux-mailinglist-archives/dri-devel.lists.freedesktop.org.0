Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5895C5A93B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC7E10E971;
	Thu, 13 Nov 2025 23:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOesNR/3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPQqHciE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B60C10E970
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMb3KM1431126
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s54gvATO6D8ni0BziC5bOrsJP88CdVIwOWTVNSqeo7Y=; b=hOesNR/3FKpyGMUY
 tqAxCg6z2iyIq7X0L+GjkgZpxkt/3dqtEeh51rY2UaV2zGx35sHZ6YtJalXFTw2M
 accSpWndjbVRJGkBnD7oqJKr9/Wv7fEAJ85c9CW/OO+tRZ5cnQHAzitUxwhfpda6
 9HqotUqQfZ5I9Z/nDfGOEKY7C/sXPONT0h6r0qVaE4NeDVLIwcnVwjsrIuaFV+DI
 8YsUNrOhhS3sRnzfBH5BahpL+e8QUU1chXXOxbUERR5sWx8PYaJnAfP5+iu2cJEa
 4nBOnsLzT7Mt9p7VUox5uDUbzIjz6yeuzX0zuyO+HpFb0ElAObgFvBADCBf1FQQL
 BsaeFA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g043e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7b80de683efso2759230b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076654; x=1763681454;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s54gvATO6D8ni0BziC5bOrsJP88CdVIwOWTVNSqeo7Y=;
 b=RPQqHciEssLMepRBjk7g4z0eJYLcgCayUXvV6s85cVqvUDlt4hnPvlDg2y6veYa1vb
 H7/OoXytOa9nnXx9LvGYqHsOtquneA7MP1ohV3yEgP41REdRmwc3ttauNvxl9z27bRVk
 ndl4Qjc8CYQzRx45Dz5vgXaUGUja2+nC33s0OpOLgulivplMoWZb6kgseIUT+OustF+J
 jXr23CpPIGxcFGM+H2FTXscV1XG4LJKYYRvEW+OR6RiBMRoR1Zx8wTLYFlAHleK55+pl
 QNPTaKy9Ou241rVBXlv6bqM3sR2maKQHm0oP/20zPRuF1hIuPh/Hf1W9gtvP3ZyezAmH
 n30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076654; x=1763681454;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s54gvATO6D8ni0BziC5bOrsJP88CdVIwOWTVNSqeo7Y=;
 b=CGOwjO8+fZs3gf3rb0KmyFpgrsgHHnVZ77u5jFyUe6VAo0+vTfQsje2lDgDlWumh9R
 2dLLCGAXCqtPSrpcaCHVyKaGKUjVRgwJXK96wNi31uhnJI/gsZgQ/z1hnFrvrFAxd/YV
 qzoVwwRXphV/np/gxFqO2PIAy4jU3bwKGUlFgk18COl91aEWf2mIr/70l9LwvN4Lc1/0
 MpJht3tG+TfvZ/8GeGpjgSnF7kASxpfTEbzqaGivlamcpGo8y7F/Wbfls0xpKRTSx8Gf
 7b/P7RkzyN59lzjBD0h1lwkLBhhELXWHW6KadDiCnwdEqRzZkPxJz9F73Nlaz/rRIYfo
 nyBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3/fMlddUA7DPmZIlWjhnVuMPH5uR/1Z4jHWDy+n7Kh+tebDvMC5FpJJzE9u3qKcypyDN7DKOV7yU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6Lc/5Xj3sLHnS2zHR4jqsmdZS4Bx92Q9ogox6sQR6ivfFPiRC
 zYEA1RY3lCvmZcgy8smCebGvF/i7Q+lH+1znndmiNpjg5fNCfnGj0dExIoyYr7kk6rMP7hj9H5i
 wNABojdHvOWWmMu/5Yr9lYrgqpJmGJFTPnzWuhjuRYDcDMcRzPDL8MJOtv6TvIx0w72k2N2c=
X-Gm-Gg: ASbGnctlpefWw+MP1zBbUC+Arqc13pGx9vc6uLMSXNZ6YlG1LbLt3mqqZ1lGHBRfiEo
 NblBMaFrHN+VdZcN3o4q4n4x5AJ8asFc0pwhWWUtAEdp2e8AAqgytkq1foPzEQvAl5n1YJ9Pgds
 O+MIAb5uVW+rey0CHoU8pJ+jE74i+BR76ZldjTWJXRm7faCaHHQ7XBClFVcyjglT38nURnLASnz
 wEPtzIEPOx7f2hdsW7h4fZSJKNGUeiMbFp4RC6hy5dPcfsMgXgryWpjNyYNRTEEGKfDnqi68Ibx
 Sa690cbXUVKafU6pulsavFCpCPTExnJAIn7fWiHtgK5XqAt6jmk7sKo4flbmUvGFM/jZ0ymx/mX
 h+60tmXPaAxXEfyhYmjQr0Fg=
X-Received: by 2002:a05:6a20:6a21:b0:340:fce2:a15c with SMTP id
 adf61e73a8af0-35b9f988cb1mr1591218637.9.1763076653920; 
 Thu, 13 Nov 2025 15:30:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0MJjZKOMSHlAEBEB+40pGENMNfFQ35ZzTVQS1vTUjFcdPIpEOasGE1UYzTpQD6dxKP+TsSA==
X-Received: by 2002:a05:6a20:6a21:b0:340:fce2:a15c with SMTP id
 adf61e73a8af0-35b9f988cb1mr1591169637.9.1763076653314; 
 Thu, 13 Nov 2025 15:30:53 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:30:52 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:06 +0530
Subject: [PATCH v3 09/20] drm/msm/a6xx: Rebase GMU register offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-9-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=27180;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=r5aNW3E/uItx4ZgEv5XbsTsCl67yqo8Wr7EDeQUCiVU=;
 b=Mpo5npm8PkJ7Kqr6lGQlu+S8BmTkp7dbLlZ1Rj0UBcaIStrzAgZn/nDOwLT1QP4KLrNi/e3Mu
 otuthgUK/G+CfFeHQBeuDffR+K/Q8EvhEspEpbmmAXO4C2cU65Q/NMN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69166a2f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=MFT4mc8oYmYGVuw2jiIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX7oPNWBhdDa0w
 JJuYcl4tht5sVJC/Gf6svZfW+gLIbo48IKy3Jkdk7lZlTAtvOqQnuj6qBeNWfQJiamse17upSvY
 6GTP7mT2HKONz8Jx4zqCYzBTcqSDSQA+3G4kaYt3c4ztb3Ka7lCSpOISjuI0jW8rpcjmHkjQhLz
 l7u+3T20u6ibr8l/Wg6uWplDRfGZaNNtqiQjPlQfHsge49zwrDiKWSgW34PHvzF/HZEWnbNa31O
 dbON3UoUcCt2ChuHhuukAa+6F2cGXf6fEeawDYgAK9Mr2+9iqUqZ76dvRQWEUB4LXwJJ+jFqbWC
 pP0GQfqcG7icEJDsXUs3u0PUW2dUtfl61syNQ5f9t5yhbYDOr8IMAVoskOoHpmx3CaJoN2pMMmf
 QXa3Er5eK0eU6npc75FGYAwdxt0OuA==
X-Proofpoint-ORIG-GUID: 9s0RrdSqY8CiZv7l-XjTwMsWvj6_gZ_B
X-Proofpoint-GUID: 9s0RrdSqY8CiZv7l-XjTwMsWvj6_gZ_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
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

GMU registers are always at a fixed offset from the GPU base address,
a consistency maintained at least within a given architecture generation.
In A8x family, the base address of the GMU has changed, but the offsets
of the gmu registers remain largely the same. To enable reuse of the gmu
code for A8x chipsets, update the gmu register offsets to be relative
to the GPU's base address instead of GMU's.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 100 +++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
 3 files changed, 193 insertions(+), 175 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 306fc08492e4..1495f874e30e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -584,22 +584,19 @@ static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
 	writel(value, ptr + (offset << 2));
 }
 
-static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
-		const char *name);
-
 static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct platform_device *pdev = to_platform_device(gmu->dev);
-	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
+	void __iomem *pdcptr = devm_platform_ioremap_resource_byname(pdev, "gmu_pdc");
 	u32 seqmem0_drv0_reg = REG_A6XX_RSCC_SEQ_MEM_0_DRV0;
 	void __iomem *seqptr = NULL;
 	uint32_t pdc_address_offset;
 	bool pdc_in_aop = false;
 
 	if (IS_ERR(pdcptr))
-		goto err;
+		return;
 
 	if (adreno_is_a650_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu))
@@ -612,9 +609,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 		pdc_address_offset = 0x30080;
 
 	if (!pdc_in_aop) {
-		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
+		seqptr = devm_platform_ioremap_resource_byname(pdev, "gmu_pdc_seq");
 		if (IS_ERR(seqptr))
-			goto err;
+			return;
 	}
 
 	/* Disable SDE clock gating */
@@ -704,12 +701,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	/* ensure no writes happen before the uCode is fully written */
 	wmb();
-
-err:
-	if (!IS_ERR_OR_NULL(pdcptr))
-		iounmap(pdcptr);
-	if (!IS_ERR_OR_NULL(seqptr))
-		iounmap(seqptr);
 }
 
 /*
@@ -1795,27 +1786,6 @@ static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
 	return 0;
 }
 
-static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
-		const char *name)
-{
-	void __iomem *ret;
-	struct resource *res = platform_get_resource_byname(pdev,
-			IORESOURCE_MEM, name);
-
-	if (!res) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to find the %s registers\n", name);
-		return ERR_PTR(-EINVAL);
-	}
-
-	ret = ioremap(res->start, resource_size(res));
-	if (!ret) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
-		return ERR_PTR(-EINVAL);
-	}
-
-	return ret;
-}
-
 static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 		const char *name, irq_handler_t handler)
 {
@@ -1866,7 +1836,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	struct platform_device *pdev = to_platform_device(gmu->dev);
 
 	mutex_lock(&gmu->lock);
 	if (!gmu->initialized) {
@@ -1895,8 +1864,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 		qmp_put(gmu->qmp);
 
 	iounmap(gmu->mmio);
-	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
 	gmu->mmio = NULL;
 	gmu->rscc = NULL;
 
@@ -1922,10 +1889,38 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
 	return 0;
 }
 
+static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
+		const char *name, resource_size_t *start)
+{
+	void __iomem *ret;
+	struct resource *res = platform_get_resource_byname(pdev,
+			IORESOURCE_MEM, name);
+
+	if (!res) {
+		DRM_DEV_ERROR(&pdev->dev, "Unable to find the %s registers\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	ret = ioremap(res->start, resource_size(res));
+	if (!ret) {
+		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (start)
+		*start = res->start;
+
+	return ret;
+}
+
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 {
 	struct platform_device *pdev = of_find_device_by_node(node);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	resource_size_t start;
+	struct resource *res;
 	int ret;
 
 	if (!pdev)
@@ -1943,12 +1938,21 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->legacy = true;
 
 	/* Map the GMU registers */
-	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu", &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
 		goto err_mmio;
 	}
 
+	res = platform_get_resource_byname(gpu->pdev, IORESOURCE_MEM, "kgsl_3d0_reg_memory");
+	if (!res) {
+		ret = -EINVAL;
+		goto err_mmio;
+	}
+
+	/* Identify gmu base offset from gpu base address */
+	gmu->mmio_offset = (u32)(start - res->start);
+
 	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
 	if (IS_ERR(gmu->cxpd)) {
 		ret = PTR_ERR(gmu->cxpd);
@@ -1989,10 +1993,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 {
+	struct platform_device *pdev = of_find_device_by_node(node);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	struct platform_device *pdev = of_find_device_by_node(node);
 	struct device_link *link;
+	resource_size_t start;
+	struct resource *res;
 	int ret;
 
 	if (!pdev)
@@ -2087,15 +2094,24 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_memory;
 
 	/* Map the GMU registers */
-	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu", &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
 		goto err_memory;
 	}
 
+	res = platform_get_resource_byname(gpu->pdev, IORESOURCE_MEM, "kgsl_3d0_reg_memory");
+	if (!res) {
+		ret = -EINVAL;
+		goto err_mmio;
+	}
+
+	/* Identify gmu base offset from gpu base address */
+	gmu->mmio_offset = (u32)(start - res->start);
+
 	if (adreno_is_a650_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu)) {
-		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
+		gmu->rscc = devm_platform_ioremap_resource_byname(pdev, "rscc");
 		if (IS_ERR(gmu->rscc)) {
 			ret = -ENODEV;
 			goto err_mmio;
@@ -2173,8 +2189,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 err_mmio:
 	iounmap(gmu->mmio);
-	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 06cfc294016f..55b1c78daa8b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -68,6 +68,7 @@ struct a6xx_gmu {
 	struct drm_gpuvm *vm;
 
 	void __iomem *mmio;
+	u32 mmio_offset;
 	void __iomem *rscc;
 
 	int hfi_irq;
@@ -130,20 +131,23 @@ struct a6xx_gmu {
 	unsigned long status;
 };
 
+#define GMU_BYTE_OFFSET(gmu, offset) (((offset) << 2) - (gmu)->mmio_offset)
+
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
 {
-	return readl(gmu->mmio + (offset << 2));
+	/* The 'offset' is based on GPU's start address. Adjust it */
+	return readl(gmu->mmio + GMU_BYTE_OFFSET(gmu, offset));
 }
 
 static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
 {
-	writel(value, gmu->mmio + (offset << 2));
+	writel(value, gmu->mmio + GMU_BYTE_OFFSET(gmu, offset));
 }
 
 static inline void
 gmu_write_bulk(struct a6xx_gmu *gmu, u32 offset, const u32 *data, u32 size)
 {
-	memcpy_toio(gmu->mmio + (offset << 2), data, size);
+	memcpy_toio(gmu->mmio + GMU_BYTE_OFFSET(gmu, offset), data, size);
 	wmb();
 }
 
@@ -160,17 +164,17 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
 {
 	u64 val;
 
-	val = (u64) readl(gmu->mmio + (lo << 2));
-	val |= ((u64) readl(gmu->mmio + (hi << 2)) << 32);
+	val = gmu_read(gmu, lo);
+	val |= ((u64) gmu_read(gmu, hi) << 32);
 
 	return val;
 }
 
 #define gmu_poll_timeout(gmu, addr, val, cond, interval, timeout) \
-	readl_poll_timeout((gmu)->mmio + ((addr) << 2), val, cond, \
-		interval, timeout)
+	readl_poll_timeout((gmu)->mmio + (GMU_BYTE_OFFSET(gmu, addr)), val, \
+		cond, interval, timeout)
 #define gmu_poll_timeout_atomic(gmu, addr, val, cond, interval, timeout) \
-	readl_poll_timeout_atomic((gmu)->mmio + ((addr) << 2), val, cond, \
+	readl_poll_timeout_atomic((gmu)->mmio + (GMU_BYTE_OFFSET(gmu, addr)), val, cond, \
 		interval, timeout)
 
 static inline u32 gmu_read_rscc(struct a6xx_gmu *gmu, u32 offset)
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index b15a242d974d..09b8a0b9c0de 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -40,56 +40,56 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="IRQ_MASK_BIT" pos="0" />
 	</bitset>
 
-	<reg32 offset="0x80" name="GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL"/>
-	<reg32 offset="0x81" name="GMU_GX_SPTPRAC_POWER_CONTROL"/>
-	<reg32 offset="0xc00" name="GMU_CM3_ITCM_START"/>
-	<reg32 offset="0x1c00" name="GMU_CM3_DTCM_START"/>
-	<reg32 offset="0x23f0" name="GMU_NMI_CONTROL_STATUS"/>
-	<reg32 offset="0x23f8" name="GMU_BOOT_SLUMBER_OPTION"/>
-	<reg32 offset="0x23f9" name="GMU_GX_VOTE_IDX"/>
-	<reg32 offset="0x23fa" name="GMU_MX_VOTE_IDX"/>
-	<reg32 offset="0x23fc" name="GMU_DCVS_ACK_OPTION"/>
-	<reg32 offset="0x23fd" name="GMU_DCVS_PERF_SETTING"/>
-	<reg32 offset="0x23fe" name="GMU_DCVS_BW_SETTING"/>
-	<reg32 offset="0x23ff" name="GMU_DCVS_RETURN"/>
-	<reg32 offset="0x2bf8" name="GMU_CORE_FW_VERSION">
+	<reg32 offset="0x1a880" name="GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL"/>
+	<reg32 offset="0x1a881" name="GMU_GX_SPTPRAC_POWER_CONTROL"/>
+	<reg32 offset="0x1b400" name="GMU_CM3_ITCM_START"/>
+	<reg32 offset="0x1c400" name="GMU_CM3_DTCM_START"/>
+	<reg32 offset="0x1cbf0" name="GMU_NMI_CONTROL_STATUS"/>
+	<reg32 offset="0x1cbf8" name="GMU_BOOT_SLUMBER_OPTION"/>
+	<reg32 offset="0x1cbf9" name="GMU_GX_VOTE_IDX"/>
+	<reg32 offset="0x1cbfa" name="GMU_MX_VOTE_IDX"/>
+	<reg32 offset="0x1cbfc" name="GMU_DCVS_ACK_OPTION"/>
+	<reg32 offset="0x1cbfd" name="GMU_DCVS_PERF_SETTING"/>
+	<reg32 offset="0x1cbfe" name="GMU_DCVS_BW_SETTING"/>
+	<reg32 offset="0x1cbff" name="GMU_DCVS_RETURN"/>
+	<reg32 offset="0x1d3f8" name="GMU_CORE_FW_VERSION">
 		<bitfield name="MAJOR" low="28" high="31"/>
 		<bitfield name="MINOR" low="16" high="27"/>
 		<bitfield name="STEP" low="0" high="15"/>
 	</reg32>
-	<reg32 offset="0x4c00" name="GMU_ICACHE_CONFIG"/>
-	<reg32 offset="0x4c01" name="GMU_DCACHE_CONFIG"/>
-	<reg32 offset="0x4c0f" name="GMU_SYS_BUS_CONFIG"/>
-	<reg32 offset="0x5000" name="GMU_CM3_SYSRESET"/>
-	<reg32 offset="0x5001" name="GMU_CM3_BOOT_CONFIG"/>
-	<reg32 offset="0x501a" name="GMU_CM3_FW_BUSY"/>
-	<reg32 offset="0x501c" name="GMU_CM3_FW_INIT_RESULT"/>
-	<reg32 offset="0x502d" name="GMU_CM3_CFG"/>
-	<reg32 offset="0x5040" name="GMU_CX_GMU_POWER_COUNTER_ENABLE"/>
-	<reg32 offset="0x5041" name="GMU_CX_GMU_POWER_COUNTER_SELECT_0"/>
-	<reg32 offset="0x5042" name="GMU_CX_GMU_POWER_COUNTER_SELECT_1"/>
-	<reg32 offset="0x5044" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L"/>
-	<reg32 offset="0x5045" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H"/>
-	<reg32 offset="0x5046" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_1_L"/>
-	<reg32 offset="0x5047" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_1_H"/>
-	<reg32 offset="0x5048" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_2_L"/>
-	<reg32 offset="0x5049" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_2_H"/>
-	<reg32 offset="0x504a" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_L"/>
-	<reg32 offset="0x504b" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_H"/>
-	<reg32 offset="0x504c" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L"/>
-	<reg32 offset="0x504d" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_H"/>
-	<reg32 offset="0x504e" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_L"/>
-	<reg32 offset="0x504f" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_H"/>
-	<reg32 offset="0x50c0" name="GMU_PWR_COL_INTER_FRAME_CTRL">
+	<reg32 offset="0x1f400" name="GMU_ICACHE_CONFIG"/>
+	<reg32 offset="0x1f401" name="GMU_DCACHE_CONFIG"/>
+	<reg32 offset="0x1f40f" name="GMU_SYS_BUS_CONFIG"/>
+	<reg32 offset="0x1f800" name="GMU_CM3_SYSRESET"/>
+	<reg32 offset="0x1f801" name="GMU_CM3_BOOT_CONFIG"/>
+	<reg32 offset="0x1f81a" name="GMU_CM3_FW_BUSY"/>
+	<reg32 offset="0x1f81c" name="GMU_CM3_FW_INIT_RESULT"/>
+	<reg32 offset="0x1f82d" name="GMU_CM3_CFG"/>
+	<reg32 offset="0x1f840" name="GMU_CX_GMU_POWER_COUNTER_ENABLE"/>
+	<reg32 offset="0x1f841" name="GMU_CX_GMU_POWER_COUNTER_SELECT_0"/>
+	<reg32 offset="0x1f842" name="GMU_CX_GMU_POWER_COUNTER_SELECT_1"/>
+	<reg32 offset="0x1f844" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L"/>
+	<reg32 offset="0x1f845" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H"/>
+	<reg32 offset="0x1f846" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_1_L"/>
+	<reg32 offset="0x1f847" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_1_H"/>
+	<reg32 offset="0x1f848" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_2_L"/>
+	<reg32 offset="0x1f849" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_2_H"/>
+	<reg32 offset="0x1f84a" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_L"/>
+	<reg32 offset="0x1f84b" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_H"/>
+	<reg32 offset="0x1f84c" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L"/>
+	<reg32 offset="0x1f84d" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_H"/>
+	<reg32 offset="0x1f84e" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_L"/>
+	<reg32 offset="0x1f84f" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_H"/>
+	<reg32 offset="0x1f8c0" name="GMU_PWR_COL_INTER_FRAME_CTRL">
 		<bitfield name="IFPC_ENABLE" pos="0" type="boolean"/>
 		<bitfield name="HM_POWER_COLLAPSE_ENABLE" pos="1" type="boolean"/>
 		<bitfield name="SPTPRAC_POWER_CONTROL_ENABLE" pos="2" type="boolean"/>
 		<bitfield name="NUM_PASS_SKIPS" low="10" high="13"/>
 		<bitfield name="MIN_PASS_LENGTH" low="14" high="31"/>
 	</reg32>
-	<reg32 offset="0x50c1" name="GMU_PWR_COL_INTER_FRAME_HYST"/>
-	<reg32 offset="0x50c2" name="GMU_PWR_COL_SPTPRAC_HYST"/>
-	<reg32 offset="0x50d0" name="GMU_SPTPRAC_PWR_CLK_STATUS">
+	<reg32 offset="0x1f8c1" name="GMU_PWR_COL_INTER_FRAME_HYST"/>
+	<reg32 offset="0x1f8c2" name="GMU_PWR_COL_SPTPRAC_HYST"/>
+	<reg32 offset="0x1f8d0" name="GMU_SPTPRAC_PWR_CLK_STATUS">
 		<bitfield name="SPTPRAC_GDSC_POWERING_OFF" pos="0" type="boolean"/>
 		<bitfield name="SPTPRAC_GDSC_POWERING_ON" pos="1" type="boolean"/>
 		<bitfield name="SPTPRAC_GDSC_POWER_OFF" pos="2" type="boolean"/>
@@ -99,15 +99,15 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="6" type="boolean"/>
 		<bitfield name="GX_HM_CLK_OFF" pos="7" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x50d0" name="GMU_SPTPRAC_PWR_CLK_STATUS" variants="A7XX">
+	<reg32 offset="0x1f8d0" name="GMU_SPTPRAC_PWR_CLK_STATUS" variants="A7XX-">
 		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="0" type="boolean"/>
 		<bitfield name="GX_HM_CLK_OFF" pos="1" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x50e4" name="GMU_GPU_NAP_CTRL">
+	<reg32 offset="0x1f8e4" name="GMU_GPU_NAP_CTRL">
 		<bitfield name="HW_NAP_ENABLE" pos="0"/>
 		<bitfield name="SID" low="4" high="8"/>
 	</reg32>
-	<reg32 offset="0x50e8" name="GMU_RPMH_CTRL">
+	<reg32 offset="0x1f8e8" name="GMU_RPMH_CTRL">
 		<bitfield name="RPMH_INTERFACE_ENABLE" pos="0" type="boolean"/>
 		<bitfield name="LLC_VOTE_ENABLE" pos="4" type="boolean"/>
 		<bitfield name="DDR_VOTE_ENABLE" pos="8" type="boolean"/>
@@ -119,71 +119,71 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="CX_MIN_VOTE_ENABLE" pos="14" type="boolean"/>
 		<bitfield name="GFX_MIN_VOTE_ENABLE" pos="15" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x50e9" name="GMU_RPMH_HYST_CTRL"/>
-	<reg32 offset="0x50ec" name="GPU_GMU_CX_GMU_RPMH_POWER_STATE"/>
-	<reg32 offset="0x50f0" name="GPU_GMU_CX_GMU_CX_FAL_INTF"/>
-	<reg32 offset="0x50f1" name="GPU_GMU_CX_GMU_CX_FALNEXT_INTF"/>
-	<reg32 offset="0x5100" name="GPU_GMU_CX_GMU_PWR_COL_CP_MSG"/>
-	<reg32 offset="0x5101" name="GPU_GMU_CX_GMU_PWR_COL_CP_RESP"/>
-	<reg32 offset="0x51f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
-	<reg32 offset="0x5157" name="GMU_LLM_GLM_SLEEP_CTRL"/>
-	<reg32 offset="0x5158" name="GMU_LLM_GLM_SLEEP_STATUS"/>
-	<reg32 offset="0x5088" name="GMU_ALWAYS_ON_COUNTER_L"/>
-	<reg32 offset="0x5089" name="GMU_ALWAYS_ON_COUNTER_H"/>
-	<reg32 offset="0x50c3" name="GMU_GMU_PWR_COL_KEEPALIVE"/>
-	<reg32 offset="0x50c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE"/>
-	<reg32 offset="0x5180" name="GMU_HFI_CTRL_STATUS"/>
-	<reg32 offset="0x5181" name="GMU_HFI_VERSION_INFO"/>
-	<reg32 offset="0x5182" name="GMU_HFI_SFR_ADDR"/>
-	<reg32 offset="0x5183" name="GMU_HFI_MMAP_ADDR"/>
-	<reg32 offset="0x5184" name="GMU_HFI_QTBL_INFO"/>
-	<reg32 offset="0x5185" name="GMU_HFI_QTBL_ADDR"/>
-	<reg32 offset="0x5186" name="GMU_HFI_CTRL_INIT"/>
-	<reg32 offset="0x5190" name="GMU_GMU2HOST_INTR_SET"/>
-	<reg32 offset="0x5191" name="GMU_GMU2HOST_INTR_CLR"/>
-	<reg32 offset="0x5192" name="GMU_GMU2HOST_INTR_INFO">
+	<reg32 offset="0x1f8e9" name="GMU_RPMH_HYST_CTRL"/>
+	<reg32 offset="0x1f8ec" name="GPU_GMU_CX_GMU_RPMH_POWER_STATE"/>
+	<reg32 offset="0x1f8f0" name="GPU_GMU_CX_GMU_CX_FAL_INTF"/>
+	<reg32 offset="0x1f8f1" name="GPU_GMU_CX_GMU_CX_FALNEXT_INTF"/>
+	<reg32 offset="0x1f900" name="GPU_GMU_CX_GMU_PWR_COL_CP_MSG"/>
+	<reg32 offset="0x1f901" name="GPU_GMU_CX_GMU_PWR_COL_CP_RESP"/>
+	<reg32 offset="0x1f9f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
+	<reg32 offset="0x1f957" name="GMU_LLM_GLM_SLEEP_CTRL"/>
+	<reg32 offset="0x1f958" name="GMU_LLM_GLM_SLEEP_STATUS"/>
+	<reg32 offset="0x1f888" name="GMU_ALWAYS_ON_COUNTER_L"/>
+	<reg32 offset="0x1f889" name="GMU_ALWAYS_ON_COUNTER_H"/>
+	<reg32 offset="0x1f8c3" name="GMU_GMU_PWR_COL_KEEPALIVE"/>
+	<reg32 offset="0x1f8c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE"/>
+	<reg32 offset="0x1f980" name="GMU_HFI_CTRL_STATUS"/>
+	<reg32 offset="0x1f981" name="GMU_HFI_VERSION_INFO"/>
+	<reg32 offset="0x1f982" name="GMU_HFI_SFR_ADDR"/>
+	<reg32 offset="0x1f983" name="GMU_HFI_MMAP_ADDR"/>
+	<reg32 offset="0x1f984" name="GMU_HFI_QTBL_INFO"/>
+	<reg32 offset="0x1f985" name="GMU_HFI_QTBL_ADDR"/>
+	<reg32 offset="0x1f986" name="GMU_HFI_CTRL_INIT"/>
+	<reg32 offset="0x1f990" name="GMU_GMU2HOST_INTR_SET"/>
+	<reg32 offset="0x1f991" name="GMU_GMU2HOST_INTR_CLR"/>
+	<reg32 offset="0x1f992" name="GMU_GMU2HOST_INTR_INFO">
 		<bitfield name="MSGQ" pos="0" type="boolean"/>
 		<bitfield name="CM3_FAULT" pos="23" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x5193" name="GMU_GMU2HOST_INTR_MASK"/>
-	<reg32 offset="0x5194" name="GMU_HOST2GMU_INTR_SET"/>
-	<reg32 offset="0x5195" name="GMU_HOST2GMU_INTR_CLR"/>
-	<reg32 offset="0x5196" name="GMU_HOST2GMU_INTR_RAW_INFO"/>
-	<reg32 offset="0x5197" name="GMU_HOST2GMU_INTR_EN_0"/>
-	<reg32 offset="0x5198" name="GMU_HOST2GMU_INTR_EN_1"/>
-	<reg32 offset="0x5199" name="GMU_HOST2GMU_INTR_EN_2"/>
-	<reg32 offset="0x519a" name="GMU_HOST2GMU_INTR_EN_3"/>
-	<reg32 offset="0x519b" name="GMU_HOST2GMU_INTR_INFO_0"/>
-	<reg32 offset="0x519c" name="GMU_HOST2GMU_INTR_INFO_1"/>
-	<reg32 offset="0x519d" name="GMU_HOST2GMU_INTR_INFO_2"/>
-	<reg32 offset="0x519e" name="GMU_HOST2GMU_INTR_INFO_3"/>
-	<reg32 offset="0x51c5" name="GMU_GENERAL_0"/>
-	<reg32 offset="0x51c6" name="GMU_GENERAL_1"/>
-	<reg32 offset="0x51cb" name="GMU_GENERAL_6"/>
-	<reg32 offset="0x51cc" name="GMU_GENERAL_7"/>
-	<reg32 offset="0x51cd" name="GMU_GENERAL_8" variants="A7XX"/>
-	<reg32 offset="0x51ce" name="GMU_GENERAL_9" variants="A7XX"/>
-	<reg32 offset="0x51cf" name="GMU_GENERAL_10" variants="A7XX"/>
-	<reg32 offset="0x515d" name="GMU_ISENSE_CTRL"/>
-	<reg32 offset="0x8920" name="GPU_CS_ENABLE_REG"/>
-	<reg32 offset="0x515d" name="GPU_GMU_CX_GMU_ISENSE_CTRL"/>
-	<reg32 offset="0x8578" name="GPU_CS_AMP_CALIBRATION_CONTROL3"/>
-	<reg32 offset="0x8558" name="GPU_CS_AMP_CALIBRATION_CONTROL2"/>
-	<reg32 offset="0x8580" name="GPU_CS_A_SENSOR_CTRL_0"/>
-	<reg32 offset="0x27ada" name="GPU_CS_A_SENSOR_CTRL_2"/>
-	<reg32 offset="0x881a" name="GPU_CS_SENSOR_GENERAL_STATUS"/>
-	<reg32 offset="0x8957" name="GPU_CS_AMP_CALIBRATION_CONTROL1"/>
-	<reg32 offset="0x881a" name="GPU_CS_SENSOR_GENERAL_STATUS"/>
-	<reg32 offset="0x881d" name="GPU_CS_AMP_CALIBRATION_STATUS1_0"/>
-	<reg32 offset="0x881f" name="GPU_CS_AMP_CALIBRATION_STATUS1_2"/>
-	<reg32 offset="0x8821" name="GPU_CS_AMP_CALIBRATION_STATUS1_4"/>
-	<reg32 offset="0x8965" name="GPU_CS_AMP_CALIBRATION_DONE"/>
-	<reg32 offset="0x896d" name="GPU_CS_AMP_PERIOD_CTRL"/>
-	<reg32 offset="0x8965" name="GPU_CS_AMP_CALIBRATION_DONE"/>
-	<reg32 offset="0x514d" name="GPU_GMU_CX_GMU_PWR_THRESHOLD"/>
-	<reg32 offset="0x9303" name="GMU_AO_INTERRUPT_EN"/>
-	<reg32 offset="0x9304" name="GMU_AO_HOST_INTERRUPT_CLR"/>
-	<reg32 offset="0x9305" name="GMU_AO_HOST_INTERRUPT_STATUS">
+	<reg32 offset="0x1f993" name="GMU_GMU2HOST_INTR_MASK"/>
+	<reg32 offset="0x1f994" name="GMU_HOST2GMU_INTR_SET"/>
+	<reg32 offset="0x1f995" name="GMU_HOST2GMU_INTR_CLR"/>
+	<reg32 offset="0x1f996" name="GMU_HOST2GMU_INTR_RAW_INFO"/>
+	<reg32 offset="0x1f997" name="GMU_HOST2GMU_INTR_EN_0"/>
+	<reg32 offset="0x1f998" name="GMU_HOST2GMU_INTR_EN_1"/>
+	<reg32 offset="0x1f999" name="GMU_HOST2GMU_INTR_EN_2"/>
+	<reg32 offset="0x1f99a" name="GMU_HOST2GMU_INTR_EN_3"/>
+	<reg32 offset="0x1f99b" name="GMU_HOST2GMU_INTR_INFO_0"/>
+	<reg32 offset="0x1f99c" name="GMU_HOST2GMU_INTR_INFO_1"/>
+	<reg32 offset="0x1f99d" name="GMU_HOST2GMU_INTR_INFO_2"/>
+	<reg32 offset="0x1f99e" name="GMU_HOST2GMU_INTR_INFO_3"/>
+	<reg32 offset="0x1f9c5" name="GMU_GENERAL_0"/>
+	<reg32 offset="0x1f9c6" name="GMU_GENERAL_1"/>
+	<reg32 offset="0x1f9cb" name="GMU_GENERAL_6"/>
+	<reg32 offset="0x1f9cc" name="GMU_GENERAL_7"/>
+	<reg32 offset="0x1f9cd" name="GMU_GENERAL_8" variants="A7XX"/>
+	<reg32 offset="0x1f9ce" name="GMU_GENERAL_9" variants="A7XX"/>
+	<reg32 offset="0x1f9cf" name="GMU_GENERAL_10" variants="A7XX"/>
+	<reg32 offset="0x1f95d" name="GMU_ISENSE_CTRL"/>
+	<reg32 offset="0x23120" name="GPU_CS_ENABLE_REG"/>
+	<reg32 offset="0x1f95d" name="GPU_GMU_CX_GMU_ISENSE_CTRL"/>
+	<reg32 offset="0x22d78" name="GPU_CS_AMP_CALIBRATION_CONTROL3"/>
+	<reg32 offset="0x22d58" name="GPU_CS_AMP_CALIBRATION_CONTROL2"/>
+	<reg32 offset="0x22d80" name="GPU_CS_A_SENSOR_CTRL_0"/>
+	<reg32 offset="0x422da" name="GPU_CS_A_SENSOR_CTRL_2"/>
+	<reg32 offset="0x2301a" name="GPU_CS_SENSOR_GENERAL_STATUS"/>
+	<reg32 offset="0x23157" name="GPU_CS_AMP_CALIBRATION_CONTROL1"/>
+	<reg32 offset="0x2301a" name="GPU_CS_SENSOR_GENERAL_STATUS"/>
+	<reg32 offset="0x2301d" name="GPU_CS_AMP_CALIBRATION_STATUS1_0"/>
+	<reg32 offset="0x2301f" name="GPU_CS_AMP_CALIBRATION_STATUS1_2"/>
+	<reg32 offset="0x23021" name="GPU_CS_AMP_CALIBRATION_STATUS1_4"/>
+	<reg32 offset="0x23165" name="GPU_CS_AMP_CALIBRATION_DONE"/>
+	<reg32 offset="0x2316d" name="GPU_CS_AMP_PERIOD_CTRL"/>
+	<reg32 offset="0x23165" name="GPU_CS_AMP_CALIBRATION_DONE"/>
+	<reg32 offset="0x1f94d" name="GPU_GMU_CX_GMU_PWR_THRESHOLD"/>
+	<reg32 offset="0x23b03" name="GMU_AO_INTERRUPT_EN"/>
+	<reg32 offset="0x23b04" name="GMU_AO_HOST_INTERRUPT_CLR"/>
+	<reg32 offset="0x23b05" name="GMU_AO_HOST_INTERRUPT_STATUS">
 		<bitfield name="WDOG_BITE" pos="0" type="boolean"/>
 		<bitfield name="RSCC_COMP" pos="1" type="boolean"/>
 		<bitfield name="VDROOP" pos="2" type="boolean"/>
@@ -191,27 +191,27 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="DBD_WAKEUP" pos="4" type="boolean"/>
 		<bitfield name="HOST_AHB_BUS_ERROR" pos="5" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x9306" name="GMU_AO_HOST_INTERRUPT_MASK"/>
-	<reg32 offset="0x9309" name="GPU_GMU_AO_GMU_CGC_MODE_CNTL"/>
-	<reg32 offset="0x930a" name="GPU_GMU_AO_GMU_CGC_DELAY_CNTL"/>
-	<reg32 offset="0x930b" name="GPU_GMU_AO_GMU_CGC_HYST_CNTL"/>
-	<reg32 offset="0x930c" name="GPU_GMU_AO_GPU_CX_BUSY_STATUS">
+	<reg32 offset="0x23b06" name="GMU_AO_HOST_INTERRUPT_MASK"/>
+	<reg32 offset="0x23b09" name="GPU_GMU_AO_GMU_CGC_MODE_CNTL"/>
+	<reg32 offset="0x23b0a" name="GPU_GMU_AO_GMU_CGC_DELAY_CNTL"/>
+	<reg32 offset="0x23b0b" name="GPU_GMU_AO_GMU_CGC_HYST_CNTL"/>
+	<reg32 offset="0x23b0c" name="GPU_GMU_AO_GPU_CX_BUSY_STATUS">
 		<bitfield name = "GPUBUSYIGNAHB" pos="23" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x930d" name="GPU_GMU_AO_GPU_CX_BUSY_STATUS2"/>
-	<reg32 offset="0x930e" name="GPU_GMU_AO_GPU_CX_BUSY_MASK"/>
-	<reg32 offset="0x9310" name="GMU_AO_AHB_FENCE_CTRL"/>
-	<reg32 offset="0x9313" name="GMU_AHB_FENCE_STATUS"/>
-	<reg32 offset="0x9314" name="GMU_AHB_FENCE_STATUS_CLR"/>
-	<reg32 offset="0x9315" name="GMU_RBBM_INT_UNMASKED_STATUS"/>
-	<reg32 offset="0x9316" name="GMU_AO_SPARE_CNTL"/>
-	<reg32 offset="0x9307" name="GMU_RSCC_CONTROL_REQ"/>
-	<reg32 offset="0x9308" name="GMU_RSCC_CONTROL_ACK"/>
-	<reg32 offset="0x9311" name="GMU_AHB_FENCE_RANGE_0"/>
-	<reg32 offset="0x9312" name="GMU_AHB_FENCE_RANGE_1"/>
-	<reg32 offset="0x9c03" name="GPU_CC_GX_GDSCR"/>
-	<reg32 offset="0x9d42" name="GPU_CC_GX_DOMAIN_MISC"/>
-	<reg32 offset="0xc001" name="GPU_CPR_FSM_CTL"/>
+	<reg32 offset="0x23b0d" name="GPU_GMU_AO_GPU_CX_BUSY_STATUS2"/>
+	<reg32 offset="0x23b0e" name="GPU_GMU_AO_GPU_CX_BUSY_MASK"/>
+	<reg32 offset="0x23b10" name="GMU_AO_AHB_FENCE_CTRL"/>
+	<reg32 offset="0x23b13" name="GMU_AHB_FENCE_STATUS"/>
+	<reg32 offset="0x23b14" name="GMU_AHB_FENCE_STATUS_CLR"/>
+	<reg32 offset="0x23b15" name="GMU_RBBM_INT_UNMASKED_STATUS"/>
+	<reg32 offset="0x23b16" name="GMU_AO_SPARE_CNTL"/>
+	<reg32 offset="0x23b07" name="GMU_RSCC_CONTROL_REQ"/>
+	<reg32 offset="0x23b08" name="GMU_RSCC_CONTROL_ACK"/>
+	<reg32 offset="0x23b11" name="GMU_AHB_FENCE_RANGE_0"/>
+	<reg32 offset="0x23b12" name="GMU_AHB_FENCE_RANGE_1"/>
+	<reg32 offset="0x24403" name="GPU_CC_GX_GDSCR"/>
+	<reg32 offset="0x24542" name="GPU_CC_GX_DOMAIN_MISC"/>
+	<reg32 offset="0x26801" name="GPU_CPR_FSM_CTL"/>
 
 	<!-- starts at offset 0x8c00 on most gpus -->
 	<reg32 offset="0x0004" name="GPU_RSCC_RSC_STATUS0_DRV0"/>

-- 
2.51.0

