Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7E3ABAF87
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 12:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4593110E2C1;
	Sun, 18 May 2025 10:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YH9M5aN8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1710E2B6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6hq0Y007579
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s43AYnQTwW4J7oqRdx3nxeEMScrPHOklY7aSbIfGh9M=; b=YH9M5aN8FpptgVmZ
 mPKUKAP/f09p0vQ4pUIJVu3Iv9S29Wsfa02sQp+Oy4S/XnPZnCOpr2wNNW8AzVIL
 tnXIfaWA4McAQqU4qTE5178s/g+85cZmDaTFjpoxG9aK9i6Q7PUCgpkmXXqJW5UT
 vCK094VPP69R6nyXy/gqZHc2pIqcmLfe0ir1XWwGv7l6yLVd58Hxc9NEkS/kdCFI
 r31JqMsFbmgG/gN2vmBT+Oc8oYtAbhq0lakJtvdyeNDjrLT+5kPmd5mc2QAaGScj
 pwUS7X37Sj+RUcG5h5vwxXg3Q0blFCU/CwaKsyq4rTYLndnpT60yZlgk8tAfrBYC
 eGg7XQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhvpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f6f5104d07so93371976d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 03:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565744; x=1748170544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s43AYnQTwW4J7oqRdx3nxeEMScrPHOklY7aSbIfGh9M=;
 b=GpwPDx5bM+OJyOggRO124Xw7EdABEP8wsjCmhhE8ICI/k7dDh8qad9gQIGH2AM/XB8
 BGTOZ/s14bxE/QnJopCN7GjwTFiBHsdYEwSue0ZfclbUo2FZ5QSSenJvpm6VPSnGV12Z
 /CFDqCCGPLm+uwW8bz1YGBodvaul3Z+4bEZcqoOdGIQIwqp3ItwIFKXo+6F1eFjOpPwa
 4JCoHQZ63zEhp467coM2XPkBEdyf1q/n77mNJPSxOs4JFMJfEERzn9KHYcYPJMPdtjZ0
 4kB34tE3AW2Li0vsc2e/rKhu7tIVazNzk8x0tOUYb9F6h2deRvHpIdNBuXb+dQcJRPz9
 UoUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz69eAsccAVHvZfpEBha3V+q/mLbNTl2luSH15zNK1C8biX05FsZFFr4nfBgQFTf1Rd2QBaIxJQO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySzn0FgZCHoHLHLxXwXqObaW7IZnOLLYz9fwrcp8ubIw6+UKgo
 xIDwFBETNzMmjL2JHWXC/jFG6yqYHbDINnD/PtzyXSLnRo0yeXnVlY4kzd+ZXEmkc/xGGmyXH4n
 Rvi93cLYHk+zi1ta2hOGulmaObjb7TEe21U/gSEpsPZDimbAtBqr2FFsjzHDxFKB3qbeNDd0=
X-Gm-Gg: ASbGncsk4o8aSNba6GsAEHBqTEOJPBaJi5YvFq/UuRCj1UplmkXAxpzYAEU3B/oW70b
 yxcpv+wEFqpOSWKGY7EylIpGhMFPBgDMKB/Ji84LGe5XGsnA+Oln90/suogxV2i2z1dGTqptVBv
 oVmdyfpggVxNiWq1srdymdESIOJYho7l5yHrb066hGDV9ms3C6uUQ8Q7kQnWb/jqRrfFUW7qMm3
 CDbKpSpnw/0kv0MhOH9ne2mR+kBWc7Pp2teAE1v0S6UOpZhW2dsgHWDEDyUjw1Vnvt9nVMdpf+Q
 mgIAdvDh9OZj5AvRgiLEk/Fzn0XjnrJEghFHpWNbT/RRBLJbjB13X5z79WtEFcZ21o/nm0LVA7W
 bW5x1oBEfDY7Wz/OfZfNzW/Bp
X-Received: by 2002:a0c:ec50:0:b0:6f8:c773:364 with SMTP id
 6a1803df08f44-6f8c7731425mr55254416d6.13.1747565743978; 
 Sun, 18 May 2025 03:55:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZVs328U/oaqIfAtV/KV1PhLWYNfoDEFrJCB9QB6KJiionU4mFbANh3W4R0YQqGBfXSkm3sw==
X-Received: by 2002:a0c:ec50:0:b0:6f8:c773:364 with SMTP id
 6a1803df08f44-6f8c7731425mr55253956d6.13.1747565743516; 
 Sun, 18 May 2025 03:55:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:28 +0300
Subject: [PATCH v3 10/11] drm/msm: enable separate binding of GPU and
 display devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-10-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5220;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=c8ydcyDO/BqF2oOo3z5sqYBctAmcpc0ltuKnWJ+WQEo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyaRdSB02zKvPq4UwWXD+YF8pWpYeFOkXSUG
 J9PpnJZKuaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1RomCACPGsiSyB0yMMNsAQd0cnrf7rjgX6ZBJQBPS3cnk8zgBqIZlIRB5Kb55ZVapPEYxSX588S
 jKsiWCV+7NjviMSGSGZeSW5TBUI7dYOwsBQe/ooY/LdZ8/3T5ou/vvmV1hEZxDGsMjQpXKRfiIf
 nPuud3RgQll7DR63tfifpCR0YhUdfTthgox1l4S+1ESPO3F+8+YYcXobo2cSoJ+s40WwWpoUGAt
 jkAT2RTTAqND1MWBJQyoco3Lrv8MU0tyXxGlgqEFGR/rapd8271EJG05BGFhClirwtmPjl1MfbT
 UKkLbOerb6zvSFbH0odrT1cpPcdJgH6ZOeS2TgKJuVmaVhkD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: gkE0wspGXFMU2GLfrqpFJHwwjdww7Hs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX9JpjzrD3Kfax
 GM7vXfyX1P2HbRAywEHVvx4QUw9NZPEbrYmTuzRL0wUNHRf/IsVHdXMXgDObx7TPFx0BKVygvzo
 aymsSV3EwGO5ZRFMTXKQj8V+Hg23flcW8GGsMiVrNx6+NisUgK8gYNV+EQxflgr3qPOUfmf/cLu
 7ZpmUhYZuZ1BS2ziL/TjVY16s7UWW9hHcIUNCMNq8aFEL3jEYmb4Bt2of6dcgHSqsVr3Xhuztha
 9FA9X7os073qhVybA5my1Gfiz52TQazpPF9yIRyZTnWrKBRvW5UlZydoofhy5lhFRZ8nx7b8Vlu
 0JzE612q/M7LjGyk3jbPKs7Mq9AAywsvvN9C/sGMDylc+DRx3Jd3CjN9Cdd67Xrtv80ywuy6+xr
 qplskn52F6JwF3vuSzQ3rUfbrW4/9BpZCPLn5tmleeXWrewTqvIR8+1wHCQ3iTta4XijJiAk
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829bcb1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=d3EbUlffPpwbv2rupc8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: gkE0wspGXFMU2GLfrqpFJHwwjdww7Hs8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104
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

There are cases when we want to have separate DRM devices for GPU and
display pipelines.
One example is development, when it is beneficial to be able to bind the
GPU driver separately, without the display pipeline (and without the
hacks adding "amd,imageon" to the compatible string).
Another example is some of Qualcomm platforms, which have two MDSS
units, but only one GPU. With current approach it is next to impossible
to support this usecase properly, while separate binding allows users to
have three DRM devices: two for MDSS units and a single headless GPU.

Add kernel param msm.separate_gpu_drm, which if set to true forces
creation of separate display and GPU DRM devices. Mesa supports this
setup by using the kmsro wrapper.

The param is disabled by default, in order to be able to test userspace
for the compatibility issues. Simple clients are able to handle this
setup automatically.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +-
 drivers/gpu/drm/msm/msm_drv.c              | 47 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h              |  2 ++
 3 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 574bc452f3df539cc8e03e161043b310d83c624f..142c321b57692649cfb8f2fc3b0ff3b4a6012c1c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -247,7 +247,8 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
+	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
+	    msm_gpu_no_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 804b594ba1e7df9d9aec53a9be1451f1167fc77a..45953affccc73c622a805a139902ebedcdf38b86 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -59,9 +59,18 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+static bool separate_gpu_drm;
+MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
+module_param(separate_gpu_drm, bool, 0400);
+
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
+bool msm_gpu_no_components(void)
+{
+	return separate_gpu_drm;
+}
+
 static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -898,6 +907,30 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
+static const struct drm_driver msm_kms_driver = {
+	.driver_features    = DRIVER_GEM |
+				DRIVER_ATOMIC |
+				DRIVER_MODESET,
+	.open               = msm_open,
+	.postclose          = msm_postclose,
+	.dumb_create        = msm_gem_dumb_create,
+	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = msm_debugfs_init,
+#endif
+	MSM_FBDEV_DRIVER_OPS,
+	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
+	.fops               = &fops,
+	.name               = "msm-kms",
+	.desc               = "MSM Snapdragon DRM",
+	.major              = MSM_VERSION_MAJOR,
+	.minor              = MSM_VERSION_MINOR,
+	.patchlevel         = MSM_VERSION_PATCHLEVEL,
+};
+
 static const struct drm_driver msm_gpu_driver = {
 	.driver_features    = DRIVER_GEM |
 				DRIVER_RENDER |
@@ -1044,7 +1077,11 @@ static int add_gpu_components(struct device *dev,
 
 static int msm_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev, &msm_driver, NULL);
+	return msm_drm_init(dev,
+			    msm_gpu_no_components() ?
+				    &msm_kms_driver :
+				    &msm_driver,
+			    NULL);
 }
 
 static void msm_drm_unbind(struct device *dev)
@@ -1080,9 +1117,11 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
-	ret = add_gpu_components(master_dev, &match);
-	if (ret)
-		return ret;
+	if (!msm_gpu_no_components()) {
+		ret = add_gpu_components(master_dev, &match);
+		if (ret)
+			return ret;
+	}
 
 	/* on all devices that I am aware of, iommu's which can map
 	 * any address the cpu can see are used:
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e7d8715bc61ccdee822bc6a1a0b0bbe7c8ff3552..1ff799f0c78133e73c6857e3692c2dca2c5e60fa 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -543,4 +543,6 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
+bool msm_gpu_no_components(void);
+
 #endif /* __MSM_DRV_H__ */

-- 
2.39.5

