Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D80AF9F85
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 12:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A6B10E37D;
	Sat,  5 Jul 2025 10:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKfI1Qkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBB310E371
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565301QR007821
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h/1nhlqlwpSE5F84bbMtq9GEBT3B7Hx0giikeSnmNeY=; b=MKfI1QkkFRL6fSCy
 zeOdYCzOi92HVULTqnk4laMKgHcDqDRbAQmzj0sfB9+StFUfirvgF51qMhiAX/wm
 UAvEKdArHr7UPLmQzR4egnyp/wdYst3Iyj4O7ploY4LL2DZBrxnQsmTbTM/UpA2j
 UzlIWguAEDOXIoBBJkXCd3ENYdRWrld27004YbE7eGYuGzTtoBlQwOQ2dYFN7yNM
 IDraD/Bv1EWEwRvYuy3+zKppJ8rvieAi/1V0GlrkzStekg9/Wgd+phZaLUgSbhso
 LNASMpMXo3qSUd/sXkGxt4NCUQ8lzFqutocAQGtELmiaPINw3/mFU6lWR411dLFD
 3CfBhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq8s10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d3e90c3a81so120474685a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709757; x=1752314557;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h/1nhlqlwpSE5F84bbMtq9GEBT3B7Hx0giikeSnmNeY=;
 b=N6obZabaJJHehyGI9KktRPud7jcaFXrOs4ts+cUiBbSwLkhCdCOhURoMlFwl2Op8sr
 z5R9OXCsmiD+zLzk+odTBPGIcUGdGRst8rNtq3akC9iyRrTKXAfZd1Sc9oZEVmCS9ul+
 bsbvHDx3H2g/hsMKNj0NR06ZQVNWPBnzmf0pfl5PyK51twXhRwW3DxGv/zMO6AQlzZ0x
 d0uWvH3eJL2eQ3U14mYY5INJpkUt6VBMHpFM0jpSNTbw3SUoQBq+pP3drncFQqbxYN87
 RHTCsnU18GhljEOxOaiGGuSCXMnMNajLOgHnUDzNvcgqdeWaGN7SigZLiOxC0R9ktzYK
 zgig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOMQc5dFNzmUegCMbWYzdF4VWq+HQ8MKHXTd4JqAEAskEORkB/fpBpMEJsm9XQQ4K45M7B7DwC6F0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmZ6tFBRsVXc9Sm9GQ511L4wnpjxjgnxGxWB8g760ciRiEx9u+
 8g7UPHS3gw/xWI9tXhpTZy1W2F8k6nr8yXFvQow/Lr813mDDV68jozszsEP3CcizftGWaFHvKyj
 oVYhlBnfkzpNkJMpBfprjQBDcul+AedTjHWIJiNzft3oxIeHGgUetPlbXOD/4FakwI1wHXpU=
X-Gm-Gg: ASbGncsbo/ScxldPOY1G7e6vyuUtFFbKXWnAM2a6MjOzIL5mQxWgp5ccx6LdxiZ7VIx
 +AZ96hyY9A4J0YA9K032z7WS5vF54o6bVaWhYdUrzyzuLAz8ZczWXkaOeUNtpzwT9Y0thSA5G9x
 3J+yvwYO3PhOz+kyWFbZ2jhK5dG7blTegnMhqEJJKjrI96QXvyURanpJqMYnue4T4DsXq3ZkaHG
 ecUfvXWuVN69Mf2zJfck9m8hSXJ+cRfXvvLCZRB9TPDVabzQ2pFbrLcIe1MzsnBocZpafdOifh8
 qRpGqH36XNrCoCcosEt92fDjQkPY0QtL9kDL43jXjMpOhhMzVz6Yr0N7Wq/oROCs20lCFCB+VbF
 TWpl5PAWsrB0RgcspJi8ICzYfDe9qG3A1B1w=
X-Received: by 2002:a05:620a:410e:b0:7d4:3b3b:20f5 with SMTP id
 af79cd13be357-7d5df180268mr729964885a.48.1751709756906; 
 Sat, 05 Jul 2025 03:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnwkDUFYmSv6w9LvplPIPGz2sg8KpSYgqXGg0Jgcp8qXdWOYs4owyRO2ecIbVxnhMp5dKn6Q==
X-Received: by 2002:a05:620a:410e:b0:7d4:3b3b:20f5 with SMTP id
 af79cd13be357-7d5df180268mr729957085a.48.1751709756147; 
 Sat, 05 Jul 2025 03:02:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:27 +0300
Subject: [PATCH v4 02/10] drm/msm: move helper calls to msm_kms.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-2-fb470c481131@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3498;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TG9Y97y24HNtxbyFJsoKUMYBT/41NYtNamoIMKjs3K8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bGD+NpfuVMXE8qXWfIlP5WzkqwFZsXN2PHmgTpH/N4+
 pxi40Q6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRH+4cDGsOvWpX+PVAsze+
 zNje906pj+PVZaer58Y0e/7heqm3Kmj2lzzf19yTe1ZsKko+7OJs2P/H3MKBL6xWL+FeidlXFla
 zsys1dS9knpm++CCn2qQtb6zDN9u5FfwJP5GY5pkmwBfJL5hUKXii2F1wssmMC+aBwmum/ma3ji
 1jMiyJMjulqnfKmS/Hqs044d2pYMb3BtKvP83/JHLvpa6ab63tprZfPM1f0/8yzA5QOrdxYWp+X
 WJKymV2r2Mv1m5Vc+RQmnFiD5e9TJVgf/NVEXEph2Im0aN5yjGuLel/A8TLA79M1V5/6fa3k09n
 hS7WkVxxpin/h7uSuNnnsr76ecc+CHJHurNYZf3TNwIA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=6868f83d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: c1m3ZE2ihk5LX9SNFsnIgkV37JrjV3lp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXzTIc6Hca3jz6
 PdSZKULhy/y1mDlBvvAtawsBWxLNJgwVDBxMpgm5kc/j+T3bEC2J5JjSqxH2+wRbwEWIeDH2uKd
 btDszPrMwHFt8FCM8AHI3CxdVMWnp9l2VvC2Pc5XJE4fhIt2/yRUFBVRkr9tnk+mQFWA3hMAlJ9
 Z7dlAwGmBrSpdG5AMY2C8C5ycLZqQNMhA7Dhk5nnBtXd1/obEh/FZg6rwnaWxa9X0Gpg56P1XR1
 FCxHiwzgw7J0ncx7NETPnwe4THLvIeP0kdBFnphgiiyI90XVb7+krSu1Zv4QXTkf41ip3Jp4orK
 rV1NMmRffDsr/RmDtVgHQ4e2S05cRTSX3aAs5Astl/rLB37vnnf0izgtqIyscfHTS2QFpPH2gq6
 tnQECTeyt+i1tNU29MjUNcmSqccQfSFBt6riHmEg9waGht86NHz9BFkizVDbdzj5+1sdcv9Z
X-Proofpoint-GUID: c1m3ZE2ihk5LX9SNFsnIgkV37JrjV3lp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Extract two more KMS-related codepieces to msm_kms.c, removing last
pieces of KMS code from msm_drv.c.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  9 +++------
 drivers/gpu/drm/msm/msm_kms.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h |  2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 8f79f5b9a61eb39dbd63b4ff225b96e63ee9a5dd..ce22d96033c8efe9210436eff8241f52d3c053bd 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,7 +11,6 @@
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -74,7 +73,7 @@ static int msm_drm_uninit(struct device *dev)
 	if (ddev->registered) {
 		drm_dev_unregister(ddev);
 		if (priv->kms)
-			drm_atomic_helper_shutdown(ddev);
+			msm_drm_kms_unregister(dev);
 	}
 
 	msm_gem_shrinker_cleanup(ddev);
@@ -167,10 +166,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	if (priv->kms_init) {
-		drm_kms_helper_poll_init(ddev);
-		drm_client_setup(ddev, NULL);
-	}
+	if (priv->kms_init)
+		msm_drm_kms_post_init(dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index c6c4d3a89ba829e161b060b52c91f5323cb5a806..9541dd7f56c9ea0f1d63c77b8ad8e7bc8cb46508 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
+#include <drm/clients/drm_client_setup.h>
 
 #include "disp/msm_disp_snapshot.h"
 #include "msm_drv.h"
@@ -217,6 +218,15 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 	return vm;
 }
 
+void msm_drm_kms_unregister(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+
+	drm_atomic_helper_shutdown(ddev);
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -366,3 +376,13 @@ void msm_kms_shutdown(struct platform_device *pdev)
 	if (drm && drm->registered && priv->kms)
 		drm_atomic_helper_shutdown(drm);
 }
+
+void msm_drm_kms_post_init(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+
+	drm_kms_helper_poll_init(ddev);
+	drm_client_setup(ddev, NULL);
+}
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index e48529c0a1554e8b9bf477dd71f59286b388de73..7ecf420d0f16cd68f8f7fd99c52e994fe604851f 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -200,6 +200,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
 
 int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv);
+void msm_drm_kms_post_init(struct device *dev);
+void msm_drm_kms_unregister(struct device *dev);
 void msm_drm_kms_uninit(struct device *dev);
 
 #endif /* __MSM_KMS_H__ */

-- 
2.39.5

