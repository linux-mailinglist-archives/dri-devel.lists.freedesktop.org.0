Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6DCA3C80
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5BC10E977;
	Thu,  4 Dec 2025 13:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0ytpIOR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+oL2mGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF4A10E974
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:22:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4B0usT614190
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 13:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=; b=M0ytpIORLGdqjApB
 20VGEyKtaZ2OGYVEM/+D4Zuen664toCWCwharvhNSJo29UPUE6o0Zzo4r/1KFpIQ
 zTJPoGdY47+zDrcbptYbyazar4h3CaSZDn4TvEcsrefq5PUYaubQS0a1H0RGvxmd
 hWDOmO/3QaMCt2C/mLuEI7sSrpDQzOGGSZ3wiXIYbkloIywZsggcxCgdDQEPRLgH
 uorb4jWgx+Dyjh0y6Uk+AqN3oj5E1uqVM+f3Ds6I6DYCwi1ozVHdcal5iG/YOsG7
 miQRQnnvW3Dm/YYNQdzJgXC03F1TIkdgXjSUCxTKyNoroJar+pM6UrjJQ2GW9KHM
 8G9Asg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au9298bxt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 13:22:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-343daf0f488so1048340a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854545; x=1765459345;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
 b=J+oL2mGm70F8Q4nbvWbIufNP8Q+payylBLWb4GVG2hj8veyw2379j8G8QSh6R3lW/e
 xHSdPTgXD0ZdvIZx5RMAoEG8dCjLQh3MG7JKUfUW1xKU5dWaCthr5B2Ge0Rqs5BNaKg2
 1ETbcEGWdQsriQjX8rbbUTxK35gGi2weXApF47SzohlPA/9OM2RgSW05v3WCC+RXTlh4
 1qM2n78YV08GswlpTHpA2BEqh+LYoOKl4jkPBcqHBn+QPqC73ocHxueKVL+6yoV0XVZt
 pdcroYoC8oKiMbFPjpoBCJh4zO4EyJmjoB27qJhZ2bPP7KQsRAhssZ6oZ75LeO5oxbOz
 ldWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854545; x=1765459345;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
 b=obEaqSxpPeE7FeCUjJ4wy/Fat+/+vNyxaA0q362j3DueXe07WeOWCWREuRBQbIrreM
 XPaETEzAOtMpxDIlbFHmatViv20EWFrmzt16w83UNnzW+KGu1/0JP6JJr+PGl6ZG6NrL
 Q0uA/WDaL9aL2aLbCEJyEqwXpbHNFIICxnYEyX4fKbhIvECMIBca8wV492YK+qF5e+de
 p/F7qJzNB3kVPPVmoMxYulCwx0DKyxZuo8xql8msHgri9iiD3GFeO1nGNzPO53PqAPyN
 FpvZsUlo6989xFx8ONAFGfCvTuxvz9A/Cs3yUOrTheRMvD82j2up5LpLIrveDKMWNqy6
 Vwcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbmE+/ur2CB0QMDGyKShWyVe01zh3OXRYayVDm9yLZMfSPY+lATYTEEfkGyaNmokjeyQaWWZq3eQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ9pHcutZA6yYgoQfFDPnd/7FaKsdJ4mdDPIdQ7zTDZiVLJSLP
 BeOKHGi8zUULvl/+jAVwlOsHEMVkaeShR90a+G942N7/7fgPOhXA8BIYfY+zH7KHHrvozZbq2iz
 zUbbUdzt/BrdB2CyXu2RgrnT4VZ4fzp7VRAPMOA/SJYZRtu+3GlCB43hziUx5X0WcQHQQdfM=
X-Gm-Gg: ASbGncurXPNqq+Dub0Q7jHAw0mlqu6yVTr+cVJ69J+VUsyKocPjL6n/MVysNFLNY9fS
 1ru0QafmzWxnq+yNDe9gxQBiS3TDXYnSoBYgGy16AxbwDQxc03vL3UV652pEKhy3d4PJF/4n1o1
 DG+I+Mo4n42dRhJIQ2PNEOqVKvqZSiYYptIg6yRsPQMnFslV8BiAaPGJy48FCd/Dd8biMovz5Tz
 ZqF5NC+pcGl3B/Ks0LavA2lt2nEFX+BB7ILc35SiwsqFl+jNcyq828TLVhN48r1ZURjM7kQW7fF
 +RTlxg7LypX49rhBhss//ceHeING6AhvKdIeZAQ4EipzQqvd6mTjsD43yWNqSbaMnYSloUnuCDT
 cijMmsGcdVfTY0qS+nbD2QZgjFqdAAjJcdw==
X-Received: by 2002:a17:90b:5184:b0:330:7a32:3290 with SMTP id
 98e67ed59e1d1-34947f3218emr2946430a91.37.1764854544869; 
 Thu, 04 Dec 2025 05:22:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpJkp4s2aAYrupArV4VNXtGG2J6wvDwKoGHL7+mVcBFJ0xuwwN+MGHm+I7zlL5Cu2y9LwcSA==
X-Received: by 2002:a17:90b:5184:b0:330:7a32:3290 with SMTP id
 98e67ed59e1d1-34947f3218emr2946369a91.37.1764854544271; 
 Thu, 04 Dec 2025 05:22:24 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:22:23 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:53 +0530
Subject: [PATCH v4 1/8] drm/msm/a6xx: Retrieve gmu core range by index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-1-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=2432;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=s6on9o/skjgZYk/EfByxas/5bzu6gD5rmktEr0jM4TI=;
 b=aOVaHYAaQPP+UfzJ43LHuSjw7Mkpd7AcC5kYLwX74IeC2r7laNLPg/Bp+fujGk62zrgZS+t47
 cUzYWV7EX8SDXQEHFBSNAfvqE8B3fK1oKMg23IRPMTNrVrjRtjdG5MD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: AfUJJnYKPXVoOdC535YOnUzDYcud6YKG
X-Proofpoint-GUID: AfUJJnYKPXVoOdC535YOnUzDYcud6YKG
X-Authority-Analysis: v=2.4 cv=UddciaSN c=1 sm=1 tr=0 ts=69318b12 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bd0xcQFpMvvK09R9pDkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX4LjA0y99SPLN
 hfcdpSCt95sQeEYJ1Kg7pASI+bePngMrwkGbMcp6HUskfxWm+noCuUojork0UyG227aXuDVm9vb
 7LRAdPs60zBXZkByokVbf29bnLkwHzRwilDCWDqPh4sJBRfA8JSB4sHegqq7GgmI/u8V26CA8zM
 MAfcUg/R4SSq7zLMmI6OCayFwulaH8rdAeItAwMh/ujEfoGlr5UfBrASjZQD/woo2jdxainkycX
 o+OspLbdgV//5fc7AVH3pbzOvfOSwB0UqaCM3P7PSWkBUke02vr4Rwa4CTUoi8IwJ0WvXbxwyr4
 SR/QzvC7hIHqjHQPbvA7wFFqzj+jtBI+qE7/vCfa+mUaMXWQ0ZJFhk1FMQ00Qxr3FW67hqG091B
 YhONaS9NTvw0Wpt3iEcdOAWUmMgNxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108
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

Some GPUs like A612 doesn't use a named register range resource. This
is because the reg-name property is discouraged when there is just a
single resource.

To address this, retrieve the 'gmu' register range by its index. It is
always guaranteed to be at index 0.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5903cd891b495f20e521562358068c7eea6ae603..9662201cd2e9d075425ac98bfa7c60989d00337d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
 	return 0;
 }
 
-static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
-		const char *name, resource_size_t *start)
+static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
 {
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	void __iomem *ret;
-	struct resource *res = platform_get_resource_byname(pdev,
-			IORESOURCE_MEM, name);
 
 	if (!res) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to find the %s registers\n", name);
+		DRM_DEV_ERROR(&pdev->dev, "Unable to find the gmu core registers\n");
 		return ERR_PTR(-EINVAL);
 	}
 
 	ret = ioremap(res->start, resource_size(res));
 	if (!ret) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
+		DRM_DEV_ERROR(&pdev->dev, "Unable to map the gmu core registers\n");
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -2085,7 +2083,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->nr_clocks = ret;
 
 	/* Map the GMU registers */
-	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu", &start);
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
 		goto err_mmio;
@@ -2244,7 +2242,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_memory;
 
 	/* Map the GMU registers */
-	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu", &start);
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
 		goto err_memory;

-- 
2.51.0

