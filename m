Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A620C48051
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FFA10E473;
	Mon, 10 Nov 2025 16:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9SJqo/c";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPYy6uHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7696C10E473
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAFhScU3985095
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s54gvATO6D8ni0BziC5bOrsJP88CdVIwOWTVNSqeo7Y=; b=B9SJqo/ccar0DWwm
 EpGN4e5nk45JX3Q3g/WSim1PyJ1W/UZeLzFZVzvYrV95RguJTnBRRIGqahHA+nDY
 PWnrB/2dV4UizaPrtinAqA6zb2s8IiOgqwfWc3GZ1RzU/scM0HQUlKS2khnljzfO
 7legFp+imW6wTUosyMVa4GtE5d9Fxw/QwhHvQ56I4HJlmqem43H/lVx/UhoCsWQJ
 201RSClraABtvjGwaj+GW5XDOq7yogfHkLUbQtEGybE7MSx6yTwAmyP7vv11jBep
 d2WF8/E4p2diJFAgn56Kb1RLzfyV2nnT7AIG/vp+jvJ0CCzSx7XtcuO9TdeI6KKj
 TVgz0A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjxqg6sp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-343823be748so1916842a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792762; x=1763397562;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s54gvATO6D8ni0BziC5bOrsJP88CdVIwOWTVNSqeo7Y=;
 b=aPYy6uHJJn2P6N76SGB6naYSvadPz9KNRGkGJ83hlVrqhPLZsregihKcIEmpMsahHK
 CjHO7rWcQmZ3zDXn2/Nh6vfcxCqLVqvaIgp9cNZjIS9Mxex86rxX6V8U1oDTq/xnxtaA
 yd9Cyv2ncEeBI77tsqndozPRNvL7q1uFS+2P7lhO19n0VxKuLV+GUVI5qgktvvlsyEay
 qYKhaplaMiV/NdFb/n6QLfgE5ZRy3PYXA+vtnhCYSF7S87T1+3KN5ImPmqitM9FeXy5Z
 JGIVxY6TRC4Bto8En7yz4demPrgT0Ism900RNtHuBM/80xmBDTci2AhnkJEFnatQITLI
 6fIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792762; x=1763397562;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s54gvATO6D8ni0BziC5bOrsJP88CdVIwOWTVNSqeo7Y=;
 b=RJHyCg7skxAe0Uf/J9Rv1E30dp6XlYmgmlu3n6wRrApHF5c9Lgu1dG9BKtua/UpOUe
 qbYQY+X4eGnwb4UIcN4Ldr7LXte3m5VikejYZ90HZCmUHssBwOqPHPI6+QjpIw3HdE3E
 14BNWvhFbJLm61p0N9w1sGjTGsSFvzOlBo3HZQNpUO//m9oD5eWgX0FSi0F5WhIj8h1M
 lwCwZwAtiAHyZLH/djJne9BdnS6Mmm6c5qcScytOUl8MGEagl5Tp4si3yTPkYFYuTV28
 5VER3s57dz3OLU9Hi+HZuegzNqOBvhAwx2fV19gAt5PNqLpo78B7O9MrSwxj56ijvXNw
 EGog==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8GGzVSEc7RECFLU+isibygz81giDV+KFZVkeX2jbnhKGJkgFpJwvVmsPdY7RgLSgNQcQlt+EeDIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj+KE0YxsGFaDdT7VB7NNwSaenXmPF6wu/aWi1lDycmTi4GGAS
 c0SHIfgrsOYSmPkiUiXgibA8gOVeQAUbyrNLZU+3N6hj9SDCBze0M/tjnmrBFDYyeYgqnU7KLLp
 MNLWyw+HRK4ySrLpjxLGCjHiaCVDKzKGnv5v+4QjCj8lCthBzCJ+Qw4JZRtyALmgPnimMy4M=
X-Gm-Gg: ASbGncvdPqtFZITORohoTlNMq6osGp+b0aUESu2YwN4knx61P8kUKFVdGgQDkTW0yA+
 uDAmA2zWOFPRB5O+NG4zCOo1kracaGWAYNk6hOQpeKZXOw76ko8g/Fx0RfjAHrFOJ/LX18aeDmP
 tRPwpJjBvZkX/n4cJBWllD2ifO6HQ0nziTZ+qrRlvMTKIpxDlhIaN1YuPN9j2SOf7o2Kc4+uLYK
 O+0TUj01IGe1A2YdrNnF84KZtxP5XEiSFpLSj93GutS/GKucMCEl/EPGjpRk+OrXJvDmiltY72I
 KsdfuU6zECyIf3fh/9p8F4hRLDqcHyILWiQr7cdOmmKXLt43UjblfBN0PDg18n4B3jeV4IP7tLw
 dBUjtsG029y9rHlQ5OWg7E+Q=
X-Received: by 2002:a17:90b:4f8b:b0:32e:d599:1f66 with SMTP id
 98e67ed59e1d1-3436ccfef31mr9815550a91.30.1762792762239; 
 Mon, 10 Nov 2025 08:39:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8T54Xq/plXK42McJSnIumoygP0uzqkucpZsWL3h9kKQjf++KmCwibd/524qGt+Z7/DHeBUw==
X-Received: by 2002:a17:90b:4f8b:b0:32e:d599:1f66 with SMTP id
 98e67ed59e1d1-3436ccfef31mr9815507a91.30.1762792761612; 
 Mon, 10 Nov 2025 08:39:21 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:39:21 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:15 +0530
Subject: [PATCH v2 09/21] drm/msm/a6xx: Rebase GMU register offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-9-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=27180;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=r5aNW3E/uItx4ZgEv5XbsTsCl67yqo8Wr7EDeQUCiVU=;
 b=KLRb/kV79oAUFE3WpjtQ7ul+kwRjNIKfTCiREgvTaOHu6rpx2bIefgyVIKWPboclvpvWlVi3H
 68lEJEFdVmVDQDAFGZFpKzsDu/jAThLwWOzVy397e8RaUXlnAlEXxSq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX6jc8hLU9Qi9F
 eAgIOElD+EddHXQb6oBpem7tAKvqkeC2mQdV+KP0NCpopcGclGUTbGzug1eEZYhcdEeapkjscfO
 QE/gj+f02v1xnOFYm3UDW75BqgrV9KxEUwOMaEhoQrr5lTgFaizAligtNfYlwAo2jAyhQya9VD1
 xkERTCQG7cUWq9+wMiGHJjDMxjDhO+EoLFFjK/8TjA987GDW5iiaGyyzY+EC0YJ2ed6QgMv8vIM
 jY8thAbFRcZXLGGI0ExtvKfqdxNGBlB2qou+2QRjv5YVqsMFk5w7cqvhXDrrY20U2rTPk9HG5RG
 A3qQzRsesl/zwbx13lPtA4kxKcBFqhCaeyIcHJ556URFUgLxPPhDq6+YbZSeN41NneIsjhoDzJu
 AIjU4CKIhkaXZBdMqxqcszFl3+4vyg==
X-Authority-Analysis: v=2.4 cv=CsKys34D c=1 sm=1 tr=0 ts=6912153b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=MFT4mc8oYmYGVuw2jiIA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 81Jd2lQU9-viSJjuYl4KFB-RfBPNAKh_
X-Proofpoint-GUID: 81Jd2lQU9-viSJjuYl4KFB-RfBPNAKh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

