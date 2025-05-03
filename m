Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8C5AA7F1E
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4267010E379;
	Sat,  3 May 2025 07:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALe8Dcqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EE710E386
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 07:17:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436DMHp029323
 for <dri-devel@lists.freedesktop.org>; Sat, 3 May 2025 07:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FjWHORKehJBI8n1hI3yF8rZTWsoCKV6hCnRHxz0Vk+w=; b=ALe8Dcqd+LnzAGCv
 JX43vDb6czVQIJrkOpOJBK+y4xuMCRWJB/Lm8R3wB1H/ilV19gaTcdrtcuwyrw7R
 /JSWkW7GaCOKgymc+tooo7JrNXUnJPaKhvBC6Eg7gn0wydQtAQE5/f3UXCMvh7hf
 vGGlrMgSY9Rzo+rYFH1FxtpY3aNqiZ7i0DBgYGpNk8unpaVwFAhODvfMCCnXljCt
 7RyxxO4nnEliDL2HflNnakmogIgvnhorcCLMWW8AgfC4zQShRrfVIy0AxVoell2u
 DoYRZsXbqcTBjIedBYzgvSkQugktzSHSySOc8FFX9eljfEEA6VV+8wn922Pna7Ko
 HCWxRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce98584-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 07:17:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-478f78ff9beso3494111cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 00:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746256650; x=1746861450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FjWHORKehJBI8n1hI3yF8rZTWsoCKV6hCnRHxz0Vk+w=;
 b=qxBYoa9f6tB5fhH8w/S4a+PWHv7VmaYgHlSIyrRNaSk8NFAa1Q1FLWBJoqrL/2Lp4I
 HkkjW55lbXWNUvFtfHAEqa5J1X/FF7daPAkteoZtJaTV2QURVlrUw7UO8cpE2bS4okVG
 FCbO4ai2/b1QDVFghl0k5kXMTsG5iHz8fiaA1UTxpZCaHLA4wO/XOq2JWI8MfCSaz578
 cYtfhX3HPRri5D5Z/um6EFSyK/OETD9XXHmSYC3rSNpICZ2BNTQ8dkFAJefEiWKBxdE5
 tMtrA6VNLixQyGKhNgkFm9s5VLSq/C4TpOYQaHjYao0tADtILCmfkb1Uy+xOfM7qQcLm
 Psxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWejMj60s9An4OEioWOhMA3wzYCjNeYoZzc3nrjCRA/P58si4xzIA3GRkAFA/lrFUUWNCJiFCYgarA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5ArqDGQNq8DwHRVklL8LMz2s7TWl0Sp4qEaopeZinLI3GQAE4
 IsrdK8KoIxPzNsJzUpxjz/vfJuzS1A0J0OLC28gqecI02tW8iuGBn1r7NlrEM/8YVD0npilRcts
 ztISlIMQfayMrdzaKy+V7pCuYEsWIaaVx9R7Hf64TqDGKTNi/PrV/M3TCgzU0dDKKYXA=
X-Gm-Gg: ASbGncsHx7lR51cdUKORL4Q64bVOwPhiKwrIUGf8uQWJrv7fWGPdq2hREjWimHod/OT
 z1o3sSI+qcyhhN08n+JU97z+GufpDObh0olKgdQF0DDdzQN49Kis9zLp01IaRe9DnlfueRMmfFe
 P6MaEH2Wtu4gmZ799DGhsMq8X4vlhWJcfTtvJwteTiPoCwH8EIBBnj1Mc+0l/RLvFhXDXoaBPmj
 g3SufGO26qEUm0s5N4k1bSUQ7c0TiFaqwvnEjkMU/g6iu1To8CyQYXQ74EUYlEAbGosna5lteiX
 DN2VdrcdTDVfJNDVL9sFgE53y8qYeeJbSMAz+qaLaGUYUvbC2IbqilprGCh8OqxBUmC2e/CJOPl
 WDWChyZG33ypsLZScZ0Re6MT9
X-Received: by 2002:a05:622a:22a7:b0:476:97d3:54f with SMTP id
 d75a77b69052e-48dff4de974mr1620531cf.14.1746256649917; 
 Sat, 03 May 2025 00:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1bzAAdQlXhBzA5PTRId/zIWytzDLkPwsjKAlBtMNTIcrcDvoywr254sWtwJFp/iqar13fZg==
X-Received: by 2002:a05:622a:22a7:b0:476:97d3:54f with SMTP id
 d75a77b69052e-48dff4de974mr1620231cf.14.1746256649610; 
 Sat, 03 May 2025 00:17:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 00:17:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:08 +0300
Subject: [PATCH v2 09/11] drm/msm: rework binding of Imageon GPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-9-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8539;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LygQOxLEQsPD0oOqeYPZ0TpNniR5HQkElGX4sNXvTkw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4booXccTgyqU9uqPO7yxuZXOEpuavKdezmDO/35IpcZW
 suz9vZ1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAirbrs/2vbHMPmpH88qxut
 yDf50ppFZzLMlVo2dfxyXVb+tt7Fe3/t4Zqd0v12R5u26324+P3mv+vyHpcbv8wokxGsK4rQ3PF
 F0+ZVitsErb9/dwvP6nixPebNj6w3bV7JJRWVibW5F9k1S98/ZpolWiF8uKvkxZGpL/aLvW8xfr
 0iurfStH/ZpLDsZ835ce8zslnTv76/0NqkLHZjjcyyBtUDz1dFO+1dly39LuejzcrVW7rOd7cyJ
 tf5urFJdFxbEJsXUtBV+Oqh2lPnBzJezjKvGF5xuhQskxP/fp/NSe6yLHf944azVeouasp9rz14
 yl5rJf26nudqkF3RcOqghOFjn0Lu9wYKEv6bNJ72nygBAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MiBTYWx0ZWRfX4j3gWrA3dxRm
 ehn2SVilJ1qIWE+2rYbJ8HlxasVwBkKeQMAOD98/pbRgfy5Eo97aCJQhG4Bd/NrXjnv7FN5wJ/5
 w4/JSAnvYt6TJiANqyqprbNflL5OL4QVb+vrf6zK8kySTk1n6eW62qR9tUUCCNZbwYEaTAZTj2S
 ADvV+DlC+lixaL5FMJ/j7FaPCDEfZTt1ZJ2UmJRdswqI9CmQn0+xi4AZmBO5S6peJhQ9fQLOqYn
 5ScTfaD0pKHgRYEeBqx2/jVju2eM6KNfTbNIKbU8FsHsisjIGWUr68+hyTi9iYlILFucO2LUeu2
 xhGVkT7sb7mrioPfVvZq3p6xL1diN4jcEiwJgq7KC+crTUt0VXsROqlPn/ilwyZD9V3dlM5iHMb
 52aggnFAHS3rOBoKDHTh+s2r65qB76zY9RKTwlxyQ0lKNVPyXt+M9m+58I+l9VzWXahdCgfG
X-Proofpoint-ORIG-GUID: 4_k-6uoy5eMWUjAm0emO_EZyselsBBRp
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6815c312 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WrGWoQF6NLblfNs28g4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 4_k-6uoy5eMWUjAm0emO_EZyselsBBRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030062
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

Currently the msm driver creates an extra interim platform device for
Imageon GPUs. This is not ideal, as the device doesn't have
corresponding OF node. If the headless mode is used for newer GPUs, then
the msm_use_mmu() function can not detect corresponding IOMMU devices.
Also the DRM device (although it's headless) is created with modesetting
flags being set.

To solve all these issues, rework the way the Imageon devices are bound.
Remove the interim device, don't register a component and instead use a
cut-down version of the normal functions to probe or remove the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 36 +++---------
 drivers/gpu/drm/msm/msm_drv.c              | 91 ++++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.h              |  4 ++
 3 files changed, 72 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 236b25c094cd5d462f4b6653de7b7910985cccb6..325cb710ea08ac8e5c3d9c80c8d8e18e1946e994 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -241,42 +241,22 @@ static const struct component_ops a3xx_ops = {
 	.unbind = adreno_unbind,
 };
 
-static void adreno_device_register_headless(void)
-{
-	/* on imx5, we don't have a top-level mdp/dpu node
-	 * this creates a dummy node for the driver for that case
-	 */
-	struct platform_device_info dummy_info = {
-		.parent = NULL,
-		.name = "msm",
-		.id = -1,
-		.res = NULL,
-		.num_res = 0,
-		.data = NULL,
-		.size_data = 0,
-		.dma_mask = ~0,
-	};
-	platform_device_register_full(&dummy_info);
-}
-
 static int adreno_probe(struct platform_device *pdev)
 {
-
-	int ret;
-
-	ret = component_add(&pdev->dev, &a3xx_ops);
-	if (ret)
-		return ret;
-
 	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
-		adreno_device_register_headless();
+		return msm_gpu_probe(pdev, &a3xx_ops);
 
-	return 0;
+	return component_add(&pdev->dev, &a3xx_ops);
 }
 
 static void adreno_remove(struct platform_device *pdev)
 {
-	component_del(&pdev->dev, &a3xx_ops);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+
+	if (priv->kms_init)
+		component_del(&pdev->dev, &a3xx_ops);
+	else
+		msm_gpu_remove(pdev, &a3xx_ops);
 }
 
 static void adreno_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2c6997c85fbbc3767315ca3a166a99b322f1218a..804b594ba1e7df9d9aec53a9be1451f1167fc77a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -62,7 +62,7 @@ module_param(modeset, bool, 0600);
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
-static int msm_drm_uninit(struct device *dev)
+static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
@@ -91,7 +91,10 @@ static int msm_drm_uninit(struct device *dev)
 
 	msm_deinit_vram(ddev);
 
-	component_unbind_all(dev, ddev);
+	if (gpu_ops)
+		gpu_ops->unbind(dev, dev, NULL);
+	else
+		component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
@@ -200,7 +203,8 @@ static void msm_deinit_vram(struct drm_device *ddev)
 			attrs);
 }
 
-static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
+static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
+			const struct component_ops *gpu_ops)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
@@ -247,7 +251,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	/* Bind all our sub-components: */
-	ret = component_bind_all(dev, ddev);
+	if (gpu_ops)
+		ret = gpu_ops->bind(dev, dev, NULL);
+	else
+		ret = component_bind_all(dev, ddev);
 	if (ret)
 		goto err_deinit_vram;
 
@@ -259,11 +266,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		ret = msm_drm_kms_init(dev, drv);
 		if (ret)
 			goto err_msm_uninit;
-	} else {
-		/* valid only for the dummy headless case, where of_node=NULL */
-		WARN_ON(dev->of_node);
-		ddev->driver_features &= ~DRIVER_MODESET;
-		ddev->driver_features &= ~DRIVER_ATOMIC;
 	}
 
 	ret = drm_dev_register(ddev, 0);
@@ -280,7 +282,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	return 0;
 
 err_msm_uninit:
-	msm_drm_uninit(dev);
+	msm_drm_uninit(dev, gpu_ops);
 
 	return ret;
 
@@ -896,6 +898,28 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
+static const struct drm_driver msm_gpu_driver = {
+	.driver_features    = DRIVER_GEM |
+				DRIVER_RENDER |
+				DRIVER_SYNCOBJ_TIMELINE |
+				DRIVER_SYNCOBJ,
+	.open               = msm_open,
+	.postclose          = msm_postclose,
+	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = msm_debugfs_init,
+#endif
+	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
+	.fops               = &fops,
+	.name               = "msm",
+	.desc               = "MSM Snapdragon DRM",
+	.major              = MSM_VERSION_MAJOR,
+	.minor              = MSM_VERSION_MINOR,
+	.patchlevel         = MSM_VERSION_PATCHLEVEL,
+};
+
 /*
  * Componentized driver support:
  */
@@ -1020,12 +1044,12 @@ static int add_gpu_components(struct device *dev,
 
 static int msm_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev, &msm_driver);
+	return msm_drm_init(dev, &msm_driver, NULL);
 }
 
 static void msm_drm_unbind(struct device *dev)
 {
-	msm_drm_uninit(dev);
+	msm_drm_uninit(dev, NULL);
 }
 
 const struct component_master_ops msm_drm_ops = {
@@ -1074,29 +1098,34 @@ int msm_drv_probe(struct device *master_dev,
 	return 0;
 }
 
-/*
- * Platform driver:
- * Used only for headlesss GPU instances
- */
-
-static int msm_pdev_probe(struct platform_device *pdev)
+int msm_gpu_probe(struct platform_device *pdev,
+		  const struct component_ops *ops)
 {
-	return msm_drv_probe(&pdev->dev, NULL, NULL);
+	struct msm_drm_private *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	/* on all devices that I am aware of, iommu's which can map
+	 * any address the cpu can see are used:
+	 */
+	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
+	if (ret)
+		return ret;
+
+	return msm_drm_init(&pdev->dev, &msm_gpu_driver, ops);
 }
 
-static void msm_pdev_remove(struct platform_device *pdev)
+void msm_gpu_remove(struct platform_device *pdev,
+		    const struct component_ops *ops)
 {
-	component_master_del(&pdev->dev, &msm_drm_ops);
+	msm_drm_uninit(&pdev->dev, ops);
 }
 
-static struct platform_driver msm_platform_driver = {
-	.probe      = msm_pdev_probe,
-	.remove     = msm_pdev_remove,
-	.driver     = {
-		.name   = "msm",
-	},
-};
-
 static int __init msm_drm_register(void)
 {
 	if (!modeset)
@@ -1111,13 +1140,13 @@ static int __init msm_drm_register(void)
 	adreno_register();
 	msm_mdp4_register();
 	msm_mdss_register();
-	return platform_driver_register(&msm_platform_driver);
+
+	return 0;
 }
 
 static void __exit msm_drm_unregister(void)
 {
 	DBG("fini");
-	platform_driver_unregister(&msm_platform_driver);
 	msm_mdss_unregister();
 	msm_mdp4_unregister();
 	msm_dp_unregister();
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f6b4c5e1dc3a18516e0e40703b24d3ae37b7c35d..e7d8715bc61ccdee822bc6a1a0b0bbe7c8ff3552 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -532,6 +532,10 @@ extern const struct component_master_ops msm_drm_ops;
 int msm_kms_pm_prepare(struct device *dev);
 void msm_kms_pm_complete(struct device *dev);
 
+int msm_gpu_probe(struct platform_device *pdev,
+		  const struct component_ops *ops);
+void msm_gpu_remove(struct platform_device *pdev,
+		    const struct component_ops *ops);
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);

-- 
2.39.5

