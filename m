Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F28EAF9F93
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 12:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E7310E38E;
	Sat,  5 Jul 2025 10:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfUaie67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FE110E38A
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5653k5F0026357
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v85XOlp6G22KyP3grDgfXY+/B0h4nwRKeUy1AK2CaOU=; b=kfUaie67mbW6FXvm
 DsoBw8fWFNd6fZYixJMvkxp/MxVN5JElfEAJvS35MQQdvUAuw2g1GhOHW8oVe6AS
 5uK7ZRe5xxcmpjRsAPOmODWCgW5SFEg6jPeRKRP45auxC37c5Dq5dCY7VOoT88K0
 IrC1J3guHUjOEbo+qWsa+sIkDf/D9gSO+DaX5dR603UlHTQHCkh37E93SiCRj52U
 GdloITm3NDw01YgW7v3yUKC1ssAToTKHGeW6n5xsf7zCvkRUQ8xubmulF/a9SVqz
 J8zXW5agY502KlQitDQBsNv/thY58JOKCk1uKBqrlwsVJBSmIzNPmOBUexEoxM32
 54Jcmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pveerhjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d444d21b24so248055585a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709767; x=1752314567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v85XOlp6G22KyP3grDgfXY+/B0h4nwRKeUy1AK2CaOU=;
 b=pXZoJnTMXUPfP8NFlWtv9fPui5kYn2ncceVBIYYyq85WUypc7L+l0e8bf3Fb7CYDjV
 ltWWcK1QolkIAeRCqgu9kOFwkSH8vGwdnUDMTQbBB8caFNKrcV2mbFxQ1Vv/4My6EPZO
 9LhJ53UsuK3pXyqX3txgMVuDWfMP3ZVdc39Xe1+T9KXaJs0K5Xa1J1JAT+gOs7VU6UaP
 LM67K3zArz5EkudJH6nc3UORAIVZA9a6ubOzmbRHcwfWKJIfLgPX6/PIltacoq9TXiqu
 zziWy2sCFJvd8WQgwurlXulEnma6FdXMWO3M35D4/w+Jg5SezB0qfqs0W/u/Zc5TRZyh
 XgHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUASuzlD4F3CZM2FWMz8HvgLWensYVcJFoeJWsIMCXeN/YyUIcCcyWmH5fzt8W8TFIMsNL3cTbqrlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4XCk1tDPLr1FB0XM7Uf9J69PTTnaqCgS2ORi+ON2XI+mtH8Xj
 ccwTVzSa1+4fgTi7XLkosaR02aUipAcUkTnX+RVk0edLpSFQDhD8oqV7Y7bOuxCj03o4I/dPXQN
 1XakQHVd+h24aymBWYStgO2ChI0VbEWmAqh7yntbS5NO2+VeFkanJ0djXAR95DQj3hMnE0nA=
X-Gm-Gg: ASbGncuIKkJYruI01TnF7neNQRwwXPnQqlR1htXmUzIcU9HNBDhr/9Z0GyIStslQqKZ
 Wj4MS4rVJJMXVQgDOj181CaYGxL4/zN/EpfDKUGPwwQ7LuiPr/tBt+Tnlgx9oXW1cN6WWnkf1In
 BKqAnEa/ytPHMGhnSUbZqKb6Omh6576UxQZtM/Tyir+G1eiLHO5/NdgNbPwwRDe3U202Jy9gr2s
 20k4VZxOU0SX91lgP02k/BgMcW3a+kqwCROQhgVScnayrkYcS2GinEqG/X712w89mOp62dRKFvk
 n53rfgu2CT5Lvj3gPVgI/k/4ROB+gerzG5KHS17x3Iaiwe9OsxQA+WyrzlHrQnaoHHgDOH5aFXM
 BEwwpJBpBcz6BuPoAa/2HawKnGMhr3IuRTM8=
X-Received: by 2002:a05:620a:31a4:b0:7d4:2889:b456 with SMTP id
 af79cd13be357-7d5f15f64d5mr239816585a.45.1751709766765; 
 Sat, 05 Jul 2025 03:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyEbozZlrjhSQ3iied2i5GKQxbxxyAlBZWrqrOQXmdyuUtu57UO4K9M3gldjqkE0QGpWdjVQ==
X-Received: by 2002:a05:620a:31a4:b0:7d4:2889:b456 with SMTP id
 af79cd13be357-7d5f15f64d5mr239810985a.45.1751709766131; 
 Sat, 05 Jul 2025 03:02:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:33 +0300
Subject: [PATCH v4 08/10] drm/msm: rearrange symbol selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-8-fb470c481131@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KwQ9Fk/ez5j7BPU4OcwnfOs/f38mi3dlimt1zg0gBh0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0j7zdBjOLSrDl22Ex55JC6SmmlXYlMrJxq
 wMMvG/m3jqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1e/aCACaV/t6Vw5KZ+eAanxu1951sFjQ4+RjZFkCY0/4NcQ31GHSeszc4BiUEILCbCK8syLF+D7
 RcMWhY+E+UXJrnABI3EP4bCejopES7I+ibcjedaSINikVJ71q2Y3/vTgTqIPWZgl0hdtG4vVRHa
 adZCY0oTJ3BvDPBGJ92eWVYwdz11qZoWLIQHo6SMwX8ShfWLl/RATYVz2gS10xVEHCKB9TrmNhT
 XvW4ccCY9QLdCKQMaMEh91MNQHiqdG0sMF5VtMVJzUbQxyvzZanP0ylOmkqC5cd8A/w+S95eyV1
 YWeRvqYd+7QezzXiPtsd2+cC/bIwpjy/nDq/rMuBglBgGLlY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXxhcvhBV4w94a
 KanVajDhoprOFfdjLmTVaeJBe6bOqvmWDvIS+UdRWWsxIdFNMKyRbUEATBHhfU6j6G45CVO7um4
 sxiHy05pCjA65ZBPsoA5nqY14h+ahIxfye62slyYjCWmmu8BkOL8eZfaca+IHIJ/bP1/dnxUIUc
 rdQPmNKmX5+NaZTI8N6UKh8w0mJJ+BJNXpTV1U4loCdtXbllMiQkTnvm0swxQxbXVSinwd40oiz
 W6ZXioCcfJjogFA/K871YNKe3uxMhnwmropSxRRGxxE54ZXg1cUnjpepYjPuRzeeMknxuwmQtnu
 7lZqbcgmglwVxO5MLxm72ySPkBKqUkGoz4MChG6ZM1eujv91rUIRFYh4r5R019rSI4XAnK2l+H/
 OTa59u0pAR7DZmaUnbmkPSnjSbbRTGFFBDBSRVRlnG/q5eFpLM3aY/tPXT4kK1ToLeOEDeLj
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=6868f847 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=7cPi-V01pGkjOeJz:21 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mcmyTpXxDDMwTug_3yDH1Vum4XOM6tvy
X-Proofpoint-ORIG-GUID: mcmyTpXxDDMwTug_3yDH1Vum4XOM6tvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064
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

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 3a0a69f41153c5f32670e07f9728d9b9e947be92..250246f81ea94f01a016e8938f08e1aa4ce02442 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,19 +15,9 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
 	select DRM_GPUVM
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -71,10 +61,18 @@ config DRM_MSM_VALIDATE_XML
 config DRM_MSM_KMS
 	def_bool n
 	depends on DRM_MSM
+	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 
 config DRM_MSM_KMS_FBDEV
 	def_bool DRM_FBDEV_EMULATION
 	depends on DRM_MSM_KMS
+	select FB_SYSMEM_HELPERS
 
 config DRM_MSM_MDSS
 	bool
@@ -120,6 +118,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5

