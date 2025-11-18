Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA575C684EC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A9810E455;
	Tue, 18 Nov 2025 08:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NeT1kKaA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cac83TqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C5410E451
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:38 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI8lGjA2755891
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /7g2OKuSg98JcSl3vrLeYvBh8Jt1oxYXAVPORiW6MrY=; b=NeT1kKaABfzR/BB3
 2VCBkQpXFdyhy//kDa5VdFH4Tm9TIXCRGQOslpe5ZUgpM+PEBPBuJcrvXDXZPbJb
 x5BLEM0cf9La2d+O5knuwTK0JYuZYxz7k/tzT4ma2j1kEuFE33/MbjBlv8ejsxFh
 qe1raIfaeycqBUyXdGYekS2G7H+88krj2swwXxe31mFwSW4NkJNEaA8M+mMqqXb7
 DRW/okoPTIIDGIij2Zrn6dnrvfUqJnrIGqEP6K6yzNEg1Enhd41hh95GQTfB++Bo
 /oNxfiBSLdXs1/ZsbXoNiwU5xiS3/zSdvKxtzmZXDPwdAEoRkejAugCiomEuOJBF
 IoOEdA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj00j9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2956cdcdc17so63726215ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455956; x=1764060756;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/7g2OKuSg98JcSl3vrLeYvBh8Jt1oxYXAVPORiW6MrY=;
 b=Cac83TqR7x+LPsRde1l7Rn66HRih+odrn6yrhJX250S9rCDt4p70I17cJH7LHWK004
 Z28oHJzINxCcyb2Aj09WGdxqE98Lk2woHtTskupdNwTE4KH+9ux+oy+pJnPDCRDvWEc0
 3wlnldDHOZue5RfFrPjl4gssGs5W/c9V8eW7ObDzG3fn3QwG9PtLfAeFIFyfb7KkF28o
 GZ6Wl5n32sV4sB9qKeguBWIcExDMcEdxwNRdBFQ0FQws/4Pg6mu2DCwhp7sLXUalvqem
 KELxZDdyxJqcePd6hvcGPlgwIZjdPcHOQs5VEqmazM7Iebmgoi5GBwZ99Yq5Yi/wDMnh
 fefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455956; x=1764060756;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/7g2OKuSg98JcSl3vrLeYvBh8Jt1oxYXAVPORiW6MrY=;
 b=coBB7kk+SRu1q+DdGWtNpeHq3j5czYLObgnp+tSUjTq7u7/+NkfZWwp1H2qGaD2FqL
 1rrQQ9zaflXsres0iZc25rPu6TFpy2ajqxdl4x1jbxxmbUmCEn/wJsiUYoZ+Zhj+Wg6y
 TDnCqayQHUhTn4OahHBBxhrp/go0JCAXZLk00uIWY8yGGCUoWNN0om3/ji1Lkz4Gynqv
 VluDKj0k5De9G0hhTQMCpaCprrjS507IlC1Pip+VI4s74fHsthU35jG4+Oa+30ufK8Rv
 eFpRKHpu0XqxDiVkbWVwo3uHIxgFqAvkqAIZVh4u0ctVqlNMsA1dxQgkx8Uj79miQV8x
 9geA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDIZzNKvlXuycFYO8DsUEbmS3RI5p2EMX5QXBQ1SpgEtbq5o5wVeZeVNUV7ljqz03WUIMDphehY3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTRuYVWj1NSc4FNyu3ioPwTcm0lcDrfLK4wQLFzYiXwPFC7kUs
 3Jm2HN5bMH2PR8+6tJuN3ZIohYAlPHFy9nBkE099W986FnR86XgR+U5edAPQ0fa8sWRbDn91kGn
 AHFqouVVKUszPD1zJMfD5rqVJo494/ZFeyfx5SixKvGSlRTbcJ7i8Mg563sN4KERLbUsHSlo=
X-Gm-Gg: ASbGncs3hYdZuyDqj60dTDpGorP9emR7aZT4NW/hsgSTIPbjJE2c1zfnhvEHyfChnBO
 hlkpuvJgrEGhjZhMYjhnYdbUjCp7Pal49Pios15FHrkCPcZ2j1md4EfUzIBQrNZvxzBCttRIOLl
 AXtQ40hL+y8AjpJcDYOiz73YAkLWUQg7eVqePMOduGsYHhbDgr9vm2IliiywfyM4qbC5XPsJCdu
 1J0nhqlD1d2HhFTGT6LcpTehkAnoQaw6I9MITiPJ8oM6sBZ7cfvvni+SvhFHy/BXosccf+7SQmu
 SxFtQy+fCwVloO25aY2iGuDs92Jkbv6Zysr6F4k0ncJEx2hlBLZgtmZxFBQUdq7M2wJTVf13NWD
 JkcT5feoteL2tnUcNRLOc9G4=
X-Received: by 2002:a17:902:d60d:b0:27d:c542:fe25 with SMTP id
 d9443c01a7336-2986a7509eamr151666425ad.41.1763455955853; 
 Tue, 18 Nov 2025 00:52:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaKKWg8VTkLpLm+WIizjRhJugezguXDK0qYctBty2k8hhQ32oWKVMzXXPVlxFUxwv+CmFd5Q==
X-Received: by 2002:a17:902:d60d:b0:27d:c542:fe25 with SMTP id
 d9443c01a7336-2986a7509eamr151666035ad.41.1763455955222; 
 Tue, 18 Nov 2025 00:52:35 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:52:34 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:37 +0530
Subject: [PATCH v4 10/22] drm/msm/a6xx: Rebase GMU register offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-10-86eeb8e93fb6@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=31486;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LhwFqdN2Z7n0b/3haqROFi97DWeW1e45MN33dqohVcc=;
 b=7e9crv4DLPT0wO9wMvi4dYMu7aLs9kr9TMfInbJ3ERgGtSIBWG/rnkDjZ7dOt2hHFXZpHjZK6
 A9Q+4mcgrfuCsd+ltpwdQOgNJKnC+qa/AvXtOBidO2Pz5OYJFulzy7J
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: d5MG-vs3wQStwmjwBMH9yEeQ2HiXaK36
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX+R6GQnVxvLpa
 tlYNFM/7LIeRtoHIlr/lQQmip1f1JyKLrxPDMwJ+9ZQH1KEl97uQR+c/CC5+2mwFNK8KftEmKIu
 8ZCutT6KE0hdWaB1Zx13DVmSZiy6XguiZnJedE7XZhLGJtkuUo0mQdgvH9FbY2z0D0o4cq232Hl
 5gGnAJA4Kwq0AAyVB2C9o9W63JJRtPl2COd2e4ZvMCWT1G1OCJZGheLgxbs5N9BNuZjuXQMRFS5
 30qAiAiREDS2KtZRoh8cni/rFmgrwmSVsw0qmRkPv0xiAuyzC2I26El0cYvgohNr36xk2wISuoz
 Un67ipm6Gmfr/yxDuANl0jZoXbg1ZPOV5iZaikR2pJpapAYk802UMZAjlik0D4Xfyj1SshXQN7p
 DfwyREB/uGleaRpWzxzzROCT3b2J8Q==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c33d5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=-MIAqB6j9IGJsbAufOIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: d5MG-vs3wQStwmjwBMH9yEeQ2HiXaK36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h       |  56 ++---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
 4 files changed, 221 insertions(+), 203 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b0be246b44ab..a5aceb906827 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -610,22 +610,19 @@ static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
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
@@ -638,9 +635,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 		pdc_address_offset = 0x30080;
 
 	if (!pdc_in_aop) {
-		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
+		seqptr = devm_platform_ioremap_resource_byname(pdev, "gmu_pdc_seq");
 		if (IS_ERR(seqptr))
-			goto err;
+			return;
 	}
 
 	/* Disable SDE clock gating */
@@ -730,12 +727,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
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
@@ -1821,27 +1812,6 @@ static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
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
@@ -1892,7 +1862,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	struct platform_device *pdev = to_platform_device(gmu->dev);
 
 	mutex_lock(&gmu->lock);
 	if (!gmu->initialized) {
@@ -1921,8 +1890,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 		qmp_put(gmu->qmp);
 
 	iounmap(gmu->mmio);
-	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
 	gmu->mmio = NULL;
 	gmu->rscc = NULL;
 
@@ -1949,10 +1916,38 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
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
@@ -1977,12 +1972,21 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->nr_clocks = ret;
 
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
@@ -2024,10 +2028,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
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
@@ -2122,15 +2129,24 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
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
@@ -2208,8 +2224,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
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
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 688b8ce02fdc..b49d8427b59e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -343,48 +343,48 @@ static const struct a6xx_registers a6xx_gbif_reglist =
 
 static const u32 a6xx_gmu_gx_registers[] = {
 	/* GMU GX */
-	0x0000, 0x0000, 0x0010, 0x0013, 0x0016, 0x0016, 0x0018, 0x001b,
-	0x001e, 0x001e, 0x0020, 0x0023, 0x0026, 0x0026, 0x0028, 0x002b,
-	0x002e, 0x002e, 0x0030, 0x0033, 0x0036, 0x0036, 0x0038, 0x003b,
-	0x003e, 0x003e, 0x0040, 0x0043, 0x0046, 0x0046, 0x0080, 0x0084,
-	0x0100, 0x012b, 0x0140, 0x0140,
+	0x1a800, 0x1a800, 0x1a810, 0x1a813, 0x1a816, 0x1a816, 0x1a818, 0x1a81b,
+	0x1a81e, 0x1a81e, 0x1a820, 0x1a823, 0x1a826, 0x1a826, 0x1a828, 0x1a82b,
+	0x1a82e, 0x1a82e, 0x1a830, 0x1a833, 0x1a836, 0x1a836, 0x1a838, 0x1a83b,
+	0x1a83e, 0x1a83e, 0x1a840, 0x1a843, 0x1a846, 0x1a846, 0x1a880, 0x1a884,
+	0x1a900, 0x1a92b, 0x1a940, 0x1a940,
 };
 
 static const u32 a6xx_gmu_cx_registers[] = {
 	/* GMU CX */
-	0x4c00, 0x4c07, 0x4c10, 0x4c12, 0x4d00, 0x4d00, 0x4d07, 0x4d0a,
-	0x5000, 0x5004, 0x5007, 0x5008, 0x500b, 0x500c, 0x500f, 0x501c,
-	0x5024, 0x502a, 0x502d, 0x5030, 0x5040, 0x5053, 0x5087, 0x5089,
-	0x50a0, 0x50a2, 0x50a4, 0x50af, 0x50c0, 0x50c3, 0x50d0, 0x50d0,
-	0x50e4, 0x50e4, 0x50e8, 0x50ec, 0x5100, 0x5103, 0x5140, 0x5140,
-	0x5142, 0x5144, 0x514c, 0x514d, 0x514f, 0x5151, 0x5154, 0x5154,
-	0x5157, 0x5158, 0x515d, 0x515d, 0x5162, 0x5162, 0x5164, 0x5165,
-	0x5180, 0x5186, 0x5190, 0x519e, 0x51c0, 0x51c0, 0x51c5, 0x51cc,
-	0x51e0, 0x51e2, 0x51f0, 0x51f0, 0x5200, 0x5201,
+	0x1f400, 0x1f407, 0x1f410, 0x1f412, 0x1f500, 0x1f500, 0x1f507, 0x1f50a,
+	0x1f800, 0x1f804, 0x1f807, 0x1f808, 0x1f80b, 0x1f80c, 0x1f80f, 0x1f81c,
+	0x1f824, 0x1f82a, 0x1f82d, 0x1f830, 0x1f840, 0x1f853, 0x1f887, 0x1f889,
+	0x1f8a0, 0x1f8a2, 0x1f8a4, 0x1f8af, 0x1f8c0, 0x1f8c3, 0x1f8d0, 0x1f8d0,
+	0x1f8e4, 0x1f8e4, 0x1f8e8, 0x1f8ec, 0x1f900, 0x1f903, 0x1f940, 0x1f940,
+	0x1f942, 0x1f944, 0x1f94c, 0x1f94d, 0x1f94f, 0x1f951, 0x1f954, 0x1f954,
+	0x1f957, 0x1f958, 0x1f95d, 0x1f95d, 0x1f962, 0x1f962, 0x1f964, 0x1f965,
+	0x1f980, 0x1f986, 0x1f990, 0x1f99e, 0x1f9c0, 0x1f9c0, 0x1f9c5, 0x1f9cc,
+	0x1f9e0, 0x1f9e2, 0x1f9f0, 0x1f9f0, 0x1fa00, 0x1fa01,
 	/* GMU AO */
-	0x9300, 0x9316, 0x9400, 0x9400,
+	0x23b00, 0x23b16, 0x23c00, 0x23c00,
 };
 
 static const u32 a6xx_gmu_gpucc_registers[] = {
 	/* GPU CC */
-	0x9800, 0x9812, 0x9840, 0x9852, 0x9c00, 0x9c04, 0x9c07, 0x9c0b,
-	0x9c15, 0x9c1c, 0x9c1e, 0x9c2d, 0x9c3c, 0x9c3d, 0x9c3f, 0x9c40,
-	0x9c42, 0x9c49, 0x9c58, 0x9c5a, 0x9d40, 0x9d5e, 0xa000, 0xa002,
-	0xa400, 0xa402, 0xac00, 0xac02, 0xb000, 0xb002, 0xb400, 0xb402,
-	0xb800, 0xb802,
+	0x24000, 0x24012, 0x24040, 0x24052, 0x24400, 0x24404, 0x24407, 0x2440b,
+	0x24415, 0x2441c, 0x2441e, 0x2442d, 0x2443c, 0x2443d, 0x2443f, 0x24440,
+	0x24442, 0x24449, 0x24458, 0x2445a, 0x24540, 0x2455e, 0x24800, 0x24802,
+	0x24c00, 0x24c02, 0x25400, 0x25402, 0x25800, 0x25802, 0x25c00, 0x25c02,
+	0x26000, 0x26002,
 	/* GPU CC ACD */
-	0xbc00, 0xbc16, 0xbc20, 0xbc27,
+	0x26400, 0x26416, 0x26420, 0x26427,
 };
 
 static const u32 a621_gmu_gpucc_registers[] = {
 	/* GPU CC */
-	0x9800, 0x980e, 0x9c00, 0x9c0e, 0xb000, 0xb004, 0xb400, 0xb404,
-	0xb800, 0xb804, 0xbc00, 0xbc05, 0xbc14, 0xbc1d, 0xbc2a, 0xbc30,
-	0xbc32, 0xbc32, 0xbc41, 0xbc55, 0xbc66, 0xbc68, 0xbc78, 0xbc7a,
-	0xbc89, 0xbc8a, 0xbc9c, 0xbc9e, 0xbca0, 0xbca3, 0xbcb3, 0xbcb5,
-	0xbcc5, 0xbcc7, 0xbcd6, 0xbcd8, 0xbce8, 0xbce9, 0xbcf9, 0xbcfc,
-	0xbd0b, 0xbd0c, 0xbd1c, 0xbd1e, 0xbd40, 0xbd70, 0xbe00, 0xbe16,
-	0xbe20, 0xbe2d,
+	0x24000, 0x2400e, 0x24400, 0x2440e, 0x25800, 0x25804, 0x25c00, 0x25c04,
+	0x26000, 0x26004, 0x26400, 0x26405, 0x26414, 0x2641d, 0x2642a, 0x26430,
+	0x26432, 0x26432, 0x26441, 0x26455, 0x26466, 0x26468, 0x26478, 0x2647a,
+	0x26489, 0x2648a, 0x2649c, 0x2649e, 0x264a0, 0x264a3, 0x264b3, 0x264b5,
+	0x264c5, 0x264c7, 0x264d6, 0x264d8, 0x264e8, 0x264e9, 0x264f9, 0x264fc,
+	0x2650b, 0x2650c, 0x2651c, 0x2651e, 0x26540, 0x26570, 0x26600, 0x26616,
+	0x26620, 0x2662d,
 };
 
 static const u32 a6xx_gmu_cx_rscc_registers[] = {
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

