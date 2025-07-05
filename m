Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E7AF9F97
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 12:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E239410E224;
	Sat,  5 Jul 2025 10:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Thb20Ejc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC9710E38B
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652ENDi001076
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xpieUQjCAob3oLlQXRGz5T12XycG9BXDdnTujA4EfOc=; b=Thb20EjcqqbYijoU
 P7qSSBdTEV2xrIRciJFW+ZcBnnpUQGZQmEKF4UZlHQdXMgbNzwuZ8zKg40rP+Axg
 OhkxXpaQ32hY3y4u1eyzX4nKyd1ezZ4AEkE586aIkcxRUizrMWCPA9HXX7WOIMNQ
 fd3TNH/zmQThfr0bTWsuIaep7EN55z+G4TmcpR7l94QwSjfQf+6sDYJrAuqMeMjT
 3/7gVQo+WfIPgPag65vWDwJ6i0HVJd4oBQsbpw7F2VsiYgzGXLeNE+gr+ciil7oN
 AzE31iK9L4apHv/DMtz9taf+sRYbUJu0zDbbmEZEQ/mfjv3hVZ5t0LfyR6yYOCit
 qM1xzQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2agncw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d45e0dbee2so255643985a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709770; x=1752314570;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpieUQjCAob3oLlQXRGz5T12XycG9BXDdnTujA4EfOc=;
 b=cBGC05nJZ1Nw6KKpA0jkf6+4aiuPtIMW8qrDKO6bLlj4AQMHtde08qq/RfG1Ey/IUf
 k9X/6n2USh5ZMRiVs3odDexg5oGHVtdE/KQXAaIBZ8DDB4TPdhwa0mctV99i0WKXlnUc
 N1yRPCI6T4Dp38VQw210NgJAKPytBTAIc6LUGWBqWlOj2C3U226lp6RKCVqjlb5XLbPM
 CZDrCFIypu9i3/R1kUXnZrWEax/UW7WGkITRlPQiVMqxeKTDULUGSokWSoZfaLovNbBq
 tHPhElvshD2mznswQ75JTMQSdLineLjDj62M8VpvioSA/P/b1K2GfCXPaXML6e8xXO6h
 9Hpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwjQh9kPYlZUHKZXp6zhY/cfDvKH5CADIwzhd9XFYbKctPh6fMmiek3Rvs+kQYu/0NNjjLAPBaVBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrFmceX9ytDZCFkcbDoQhfitd4JPbmXk3wz6gz+JsiCbAyGAAx
 bBuuEbfaGs+BhRVuSHF8LYscdQCMFUvoV+S6v3C5gWBGY/Iojq7vOnp+Y2buOOAlUpDYDM1Q5BW
 j0DdLnVZHp6+vdp91LvLlyWzlrX0SpjmJ8BnKVklVAMBv4uq4rPyOD3PJCuJDBZ7XZKqUNi0=
X-Gm-Gg: ASbGncu8FNROpT30SvQ3+rZY0+/qO2iSw+3ZCpFvQvUflJr6CLIp8pNR4ORHAIVdCF4
 VNE6wrpvErwruo6PJv6hAn7DZft25lqG5EC5LbpAjWDqQKKb42ntvzeObmsd1PHw/9/Upd8ZMDp
 LbKWgboYrZFfTg1OH70oBpjgqZJyuYsJaF/cddUTp1vd+nuMOthAcE8vww4PEux6PjpYDBY6qtF
 lps/+3Y6T+WuU6Xrw0RtBJKFWge87e3X/KKQWIP46l6EKwoKyHBs+cIhG3Xi4Ny7qAqUVGHFZ9I
 zOZz9Ln3sWQzAInQQr1FM4sbTTgIgsIvfDg0z7PeW/pRnUTEeuttQl4ds2rp62G6H5plLHD4K7Q
 wPYxLWQGHsEsWLS2XT3FyXoFig4zU07Zophw=
X-Received: by 2002:a05:620a:46a0:b0:7cd:3b13:c5b4 with SMTP id
 af79cd13be357-7d5f0286caamr235694385a.24.1751709769438; 
 Sat, 05 Jul 2025 03:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLFY60CQNpL3C+yvQakg2k85gAZCLriNkaPNQyhvp8oKtheOso4rDEGIWdjnPNdKdgNtluIw==
X-Received: by 2002:a05:620a:46a0:b0:7cd:3b13:c5b4 with SMTP id
 af79cd13be357-7d5f0286caamr235690685a.24.1751709768808; 
 Sat, 05 Jul 2025 03:02:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:35 +0300
Subject: [PATCH v4 10/10] drm/msm: enable separate binding of GPU and
 display devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-10-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5219;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fG270cxV/2q7kQa6T4r/dHwrEGN9NSQeGPoJADDDa3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0D8TLyxpxyMP5ZOm6f/GyJWsJzX6ZcuA4r
 FCYCYgTH++JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1QvtB/0f5DxO5BvqdVoPXZaDjS6R3QfljCGAuivAD4aP8SahrZOkfS8yC5L+862G61Kl1A0QwoZ
 pOocaIuIDTdq3a2U7PP1gDB79IUrNh+Jj5YkWOqE0q2d+jiaVlcdhySbrYhXm3Nfwwbw79DKeBg
 r8J2pylstkUlBHQtdm2Z+0gLbp2cNQEISwi9xHI3cO8f6KVtAmYoPgbSJclsfyHnk65kB2qUo1K
 WVd+P+dJJgmrk/YI9ID0FrmiBvXoputJ5iXF0V75jZ6KK9QtWOGFiNml93xgpea+j8Xk/JkzaZd
 f/1Uz7I8ICTvR7k6pPB2lA5Vjf6xSTcKP41+AHWcspLFx+0k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX+h/Oc30fmxmJ
 iTNSAHOc83g7q+dPfz27EMtMCVAcpKmzqvcWwVF7u5P7DkISEw7qg6Y85L9yNMUY/G+1AGFy2Hd
 OSHU9kiP2LQl98v12c9CsLhL1HPsefYumVawvcCwi5BgiaiNfjMT3r/sgd3pdyvk/NIhflOiwkK
 lKRnHtd1OBmGPQptTgoLnXBaCKeQ5hfpAz/nzfR5QJC3O4bh3pC4jb1z/wADC+w9J8BPO//K1BW
 ZSCdBc5OGLrayUJFPfDUqKk6+0eXDAjOdkCSsmmuEgpbXqWng12jcsRBM5s4Nyhi2WiZDB7f+rW
 QJesRZee7ZApptrqycIr9A5diSEmlntgTfdf06B0LoZ/SJbEZ9XioQK8ees/xWoHtRreiU/h1Ok
 /L2QtwD9ApkJon5fovfeuKUtfS/ONZGzJ61O1jsQHczlOS6R47Du+oWACKd7bC8rHYY34dwh
X-Proofpoint-ORIG-GUID: Db43rI1Dst71GacltAtCVLW5zWVk2qNo
X-Proofpoint-GUID: Db43rI1Dst71GacltAtCVLW5zWVk2qNo
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=6868f84a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=d3EbUlffPpwbv2rupc8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050064
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
index 99c8d2f4e4b49fda912fa49429399cf207eccead..50945bfe9b4992118f23db3cd17ac348be9f9c9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -262,7 +262,8 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
+	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
+	    msm_gpu_no_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 0ab005a7d5e99e46fe47c9e64514434416898d20..2966ba086b2cdb3232a7fa0445b953787cfad2b0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,9 +54,18 @@ static bool modeset = true;
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
@@ -836,6 +845,30 @@ static const struct drm_driver msm_driver = {
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
@@ -982,7 +1015,11 @@ static int add_gpu_components(struct device *dev,
 
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
@@ -1018,9 +1055,11 @@ int msm_drv_probe(struct device *master_dev,
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
index e3dfaa156307dcd8bb675f865985a0888be8fb87..9875ca62e9adb12dca9bcc74e2825b0364372a54 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -554,4 +554,6 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
+bool msm_gpu_no_components(void);
+
 #endif /* __MSM_DRV_H__ */

-- 
2.39.5

