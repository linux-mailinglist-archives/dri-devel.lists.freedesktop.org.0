Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0692B41C3D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFBC10E762;
	Wed,  3 Sep 2025 10:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4XdVORX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424F810E755
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 10:52:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839dcaP001375
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 10:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nz0DTYoq2i1CypDl+WSyYUknuifhStAAoZEZnTeJyVE=; b=g4XdVORXPXalDxYT
 xHKedkTlqNwsdYuYFkmVtOESx11F2WRIjdrPIYqsd9Cm2XE/WXdHs4L8PcfoDJm+
 iM32KMkh6FqEvaWr8ZdLwVdr05u82vzfKT7Og72cfBxpEHWCZKCw4nsF4onHnNJO
 fLsI5g3wU9LzDntvLmCIegVQGaAKXJxdBhEzNxKSkSeFHIe/7B27+0TGbnaBwX6i
 RBbOGEGg+8/9dj3/CEDbGkJ3FnXyujyuSr+yOL7LqRHetnYFHbV1J4ZOkyHAhfBg
 AFrGsKK7fR5/nLpSp0L6vpINOKHUj8QxraUixbWXSm6iBI1xuxw/5tDgS+NDk4gV
 jU1x3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy78ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 10:52:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b345aff439so47019951cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 03:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896719; x=1757501519;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nz0DTYoq2i1CypDl+WSyYUknuifhStAAoZEZnTeJyVE=;
 b=Myrs4wY/e3hJCwFKDK5oHVznD+lBB5dRV6kOzBuTHMBBfS4qLXu7CqCLsQN3CYCDoo
 l5Uvd6PZ4jv7Ruaw+23rFWQgY5elRboy4K5TnO3hQ97xFWTPc1HRHFTXqs/qMQxaZXxV
 xLAtU6bIniaKvL63KCDp+haSFgqKoi/aHaBiHJNuZrDz1TbbpHNNl9Yxn502c1fiO9qA
 OAWEYbYYPmA8WMhtPrvnlL8heLW5NMTbh/UWB77VUQmDPZFGkQKZw+k9um2yuuubEs58
 xvmfMYD8HhYBSBnJy/KSiKocDjeiYwAwomhpQPnBiSaQLvuh+BEn82DWdeZBEERZRtvZ
 HPbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUMWy5vGU9mrbnWEtH6Y2pGg/9CISuNVKo2hKkdyxHzo4b4xJB3EPgsXSmBBr9sSar26DT8d2fTjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXlNkUcFHOOBOb1zslQ72KApD+HoG75LlTtVMkO8BP94rN3Sxo
 K1TKkxOsLUVTiLIES9z3RWm9kKtNJfK8IpIHPOJj4nCaWgBjtqn0QBYaE4LU4XYevKc4KuRAZkm
 2cmAfeKY8QgUyOqfXaEYtqzxchayYuPWqUIiJyaVCVDydfjSn0LtCUld9e9pXus664fouNRA=
X-Gm-Gg: ASbGncvpmejuWAhVEv9I2pYsi6CcPHXrV6pDbcqS40y0pMwNmVp3E+Tjeu/S/Uq4TmI
 l5uLRpGWhtTK/QHLMnspIOaAszJ2ikQx420oLJc7bbVrKMq1DuYqjinmkl+XqYJ9NolqvjgP0nh
 VNSwLOs36gM5YC3o5IiWAa13/j/Zf3wcOSUOzXQCRXTvig/FFIDKhcQFwliHvLIKS31CG+TBKie
 ohvbpMBd8JDTs1MF8YOT/09gZZIIUIIVYt9WG1d6w07AdJkOr3qic4Tz6m1mj3LxHHAItUTQ1+E
 ygiGc6AqlTQIxKZVUwZTYD8nxH23WpnTpQx7G7KoU7iWfgAZnLxIZXxzLGd6xlNnwUfeTpyne4f
 J7P+AymD2CZVpWnIgU7+qZ3mKY/vBezzxOESXZ/bsyJEq6QpDUowO
X-Received: by 2002:a05:6214:27c1:b0:70d:fa79:badd with SMTP id
 6a1803df08f44-70fac700e4dmr162313036d6.1.1756896719414; 
 Wed, 03 Sep 2025 03:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERcNbMyHymKYRYhD2rXGN/580BVDxHjeOBLjwZjYoJp/uEY6W4pidzM5XwJifmWBn/ESGhkw==
X-Received: by 2002:a05:6214:27c1:b0:70d:fa79:badd with SMTP id
 6a1803df08f44-70fac700e4dmr162312756d6.1.1756896718906; 
 Wed, 03 Sep 2025 03:51:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032df6sm9373431fa.39.2025.09.03.03.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 03:51:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 13:51:51 +0300
Subject: [PATCH v2 3/4] drm/msm: don't return NULL from msm_iommu_new()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-msm-no-iommu-v2-3-993016250104@oss.qualcomm.com>
References: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
In-Reply-To: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4554;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XgvG3m5kSIBDKvpU4SYyvFSPfDje3qBYowIpQvtgTjo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouB3HK7G1Yelqfd4C1ZDrJRWMaMOxFqX5XwrED
 QRcuPRwkSKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgdxwAKCRCLPIo+Aiko
 1a8CB/0Uqt4GrHsw8xZtlnCX9pyJGsEBV8fKm0L56473WWEkh714PrHlEu3qR6UJ3HBqcPeobKN
 W5pI/lyTMICWIaBakSGJzQ94qY69IH2XeyK3QeM/SR9Kd15yOMg66JzarcObQH0kD3X/4k0nfVL
 8HfK2gfSo7MXnNq5RQkWjtbTAvaM+sU8OIqNYNMu4zza/n1SodXUFt+dGkiPos+XIdBmbXBph7S
 LSmLsxTlZlpV4yYmC2JMR8S/0dpdZuiZT5RjeZcjX95xVPYUqUACts87Ujih4VQeV8K6+xnm/aE
 EL/m/Z+POW2Ry0x6IXPwgP9s6+4Hw2gC9dA4Zc5X5ogkxQT7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b81dd0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jfHkAfN2M7vHvxOhuUUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: QmUZBQs2zu98vdCa_W0wq1BifsdabV0D
X-Proofpoint-ORIG-GUID: QmUZBQs2zu98vdCa_W0wq1BifsdabV0D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX47dMeW3I/Hi/
 Xl02LtXxRVl6Ad7Xjrmo9P0LUrcYAqkf0YLhAsYATSk8HbvxFveCS6Nd+MgZbMyb2d06Q5UgfNk
 mIQc9jwA8eYitWjRAgWdV5JgypAVgPpA7rIqzZ51ci7E6OUDiBLtTJlO3rVi5FVn6bfM9rJEkT2
 D8pyHHvPDFzDs/5mJpZB+3NcmtH3iTIk7GXJ7wVAiQQVPcRJtvJoVJYsJFiW1O471oDZ9QdHtDf
 rZNn+BFEECnKTQBOXRLq0oTuITjRJ/NpgxwsQrUm4MaNT3cFdEBpiGuVDh1KH6tAfxuq1KYQjoG
 HIhnBp8CCVsc1AlF4KNRDs44e8jv89EesBpuh13y4gAsY6bpIedVwkHR8ykoeTKaRUhwlJ8H2cd
 9VcNdb24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

As we've dropped no-IOMMU support, there is no reason to specially
handle the no-IOMMU case inside msm_iommu_new(). Make it return -ENODEV
if there is no IOMMU (instead of returning NULL) and simplify all
calling sites accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |  2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  |  4 +---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 10 ++++++----
 drivers/gpu/drm/msm/msm_iommu.c          |  6 +++---
 drivers/gpu/drm/msm/msm_kms.c            | 12 ++++++------
 5 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 28e6705c6da682c7b41c748e375dda59a6551898..92958c73a5ee605a45314ebbcf2136754fe2fae7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1318,8 +1318,6 @@ static int a6xx_gmu_memory_probe(struct drm_device *drm, struct a6xx_gmu *gmu)
 	struct msm_mmu *mmu;
 
 	mmu = msm_iommu_new(gmu->dev, 0);
-	if (!mmu)
-		return -ENODEV;
 	if (IS_ERR(mmu))
 		return PTR_ERR(mmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f1230465bf0d0840274a6eb03a10c4df3a7a68d3..21b4951b065ba51b2a4d1bcf63f912f220d3a1f0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -209,9 +209,7 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	u64 start, size;
 
 	mmu = msm_iommu_gpu_new(&pdev->dev, gpu, quirks);
-	if (!mmu)
-		return ERR_PTR(-ENODEV);
-	else if (IS_ERR_OR_NULL(mmu))
+	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
 	geometry = msm_iommu_get_geometry(mmu);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 4d1ea9b2619170335ab4d2a2ee46f31e785b2c02..66bfa96965be275270751cba770521cfde2a7004 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -458,14 +458,16 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_disable(mdp4_kms);
 	mdelay(16);
 
+	if (!device_iommu_mapped(&pdev->dev)) {
+		DRM_DEV_INFO(dev->dev, "no IOMMU, bailing out\n");
+		ret = -ENODEV;
+		goto fail;
+	}
+
 	mmu = msm_iommu_new(&pdev->dev, 0);
 	if (IS_ERR(mmu)) {
 		ret = PTR_ERR(mmu);
 		goto fail;
-	} else if (!mmu) {
-		DRM_DEV_INFO(dev->dev, "no IOMMU, bailing out\n");
-		ret = -ENODEV;
-		goto fail;
 	} else {
 		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
 					0x1000, 0x100000000 - 0x1000,
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 76cdd5ea06a02eafa6f76e1c3fb03e0cdc7fd469..6b3d840d8d6786e60b0cb6670f62605969db6a9a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -721,7 +721,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 	int ret;
 
 	if (!device_iommu_mapped(dev))
-		return NULL;
+		return ERR_PTR(-ENODEV);
 
 	domain = iommu_paging_domain_alloc(dev);
 	if (IS_ERR(domain))
@@ -756,7 +756,7 @@ struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks)
 	struct msm_mmu *mmu;
 
 	mmu = msm_iommu_new(dev, quirks);
-	if (IS_ERR_OR_NULL(mmu))
+	if (IS_ERR(mmu))
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);
@@ -772,7 +772,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 	struct msm_mmu *mmu;
 
 	mmu = msm_iommu_new(dev, quirks);
-	if (IS_ERR_OR_NULL(mmu))
+	if (IS_ERR(mmu))
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 4c4dcb095c4df97de42d0673aa2842010a249dca..725367157d90e45854cb8a22ea25a3fa3bb218be 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -193,17 +193,17 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 	 */
 	if (device_iommu_mapped(mdp_dev))
 		iommu_dev = mdp_dev;
-	else
+	else if (device_iommu_mapped(mdss_dev))
 		iommu_dev = mdss_dev;
-	mmu = msm_iommu_disp_new(iommu_dev, 0);
-	if (IS_ERR(mmu))
-		return ERR_CAST(mmu);
-
-	if (!mmu) {
+	else {
 		drm_info(dev, "no IOMMU, bailing out\n");
 		return ERR_PTR(-ENODEV);
 	}
 
+	mmu = msm_iommu_disp_new(iommu_dev, 0);
+	if (IS_ERR(mmu))
+		return ERR_CAST(mmu);
+
 	vm = msm_gem_vm_create(dev, mmu, "mdp_kms",
 			       0x1000, 0x100000000 - 0x1000, true);
 	if (IS_ERR(vm)) {

-- 
2.47.2

