Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8902BA87284
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 18:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9AD10E245;
	Sun, 13 Apr 2025 16:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dou7qtQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89E210E228
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DGMrZI021838
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +lOfrQC97itnkemnTsDOXPlft8YCdkPBpyMvVoCbScU=; b=Dou7qtQPuTJQmifs
 fyIyU+hJUAibYcI5ro0nRZw4LRrRd5NhwOV2Vcw0Zm8pw9MAYTEvzL0XdbLdam1S
 Qz/iP8TFggdcpNcDo4A+h5VXdvOITcsZsKjYgho8W+8lYs6NMzHuWBQJTGbTv4rl
 QgyNQLDV0acWRD72r6+/GvWiP6nHvvwwJvntm+MJz9V0vJnEFzkGlrSqG2cZk5UY
 HtJGfi7imiRLwlcsPl07Uai92ubEnfWVryN7aAgQy1+FHSE6o66jCT8A6kx+I7yG
 Lzfz70ITzjwawtK4OzaT8i4f9qQOFoKkpDjqR4c1oIxZou5kcoZRC1AKHkvM0SDz
 kuXVTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjta7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c572339444so501108485a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 09:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744561983; x=1745166783;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lOfrQC97itnkemnTsDOXPlft8YCdkPBpyMvVoCbScU=;
 b=jrOmsM4213kMY8t8wemUsBGiBHUf8cYHknQXO5Sqv9DujwZzFqwkrP5BkUK+lsPH7U
 3sBA1RZ4CWS1HLSJP59HEZu2fMNXEtb5NhMtpybylIxYXp7vYO/cHYzZAn0d8igmNb41
 auDeMUtUzklurb4wE/Mp0qmPv0YSBcnlKbxJLaFqaVpYMBuhjy+HC4ZNLLE/y2OVO1lb
 t/qPw28EbbeykEMwp6hpAHwNPRPxPYa8fdU/s83gLsvdcJ/i6CxqhQkHtkhrfknChnEH
 EjVdptCEESOLmZtf+k3n+vlOMhRmU92dwc403WtVvH07fi/2Ck8vhRf5JNZoiJf+qTSX
 +0ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTWNFtppTE8US/0EnyscKgi7ztVoeM7TdzczhzWZUBQogsPOqSwoGpRo4P9sLvCmEN1v9sfah+5uM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9rh5d7R9iqqddPR2gmNNaKdot0DEYVUTVo3AztBRXvfhxelhE
 vJ26dQ1fal9dgKlAI33s5xo4R3b2TCD3DQaureuew3X33qzkhOy0Qzugt89p5RnU/DXaW41O1tC
 eFR+1ggwqiOPMc/49NHms3cJ80xfyG0d9m3IEYLLnojuFL/TNk9U1+flCiBYD8cVDfgI=
X-Gm-Gg: ASbGncud0LH+zVNdIqBb+zEq7FRhacAQYtMfTsHkEwR/q2/Z7lWhvfy5BQcESRKYi1u
 Qi12orZfX7aoa8/bKNTziHGca5+KwSXAyvQwj32rRfxXf4RhWIBAwWsVCAetkQDnwjYLCrKrlxU
 DhTzTxFaSanOR1rnHjvFDRNp3HVtXjI/RuRxe3TBn40ubdNub5PYnPsupZml68b2hvHM4/V3Yk/
 5Ar59pF6QLMHruXbA5lWD/ByggbsQ48Fj/nhUE5PxRabdu5xS4FGvPxPVfIl3QUSkkN8vjImeeJ
 qJcxyYqganQgkCICGsySve++v2IFH7A+2y+g6+Hqo32ErNuEf1Koz5mVhM90A5GLpmnjxKz4IYG
 Hm72PwcHTQ6JWNuv06hAtYkMg
X-Received: by 2002:a05:620a:24c1:b0:7c5:9788:1762 with SMTP id
 af79cd13be357-7c7af115a88mr1553671985a.45.1744561983374; 
 Sun, 13 Apr 2025 09:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoYxRLeLUP8wwMv47f5bvT970+5SGoyAUvtb70jI/1SHBFVXLdrQfg1QuWdHYnMb2Kidxnlg==
X-Received: by 2002:a05:620a:24c1:b0:7c5:9788:1762 with SMTP id
 af79cd13be357-7c7af115a88mr1553667185a.45.1744561982876; 
 Sun, 13 Apr 2025 09:33:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 09:33:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:56 +0300
Subject: [PATCH 2/7] drm/msm: move helper calls to msm_kms.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-2-1132f4b616c7@oss.qualcomm.com>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3462;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q2TV3za2YMsS1/tN81KHJ6sYde0HsrTUt/tA1uoSM5c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c514hgycc6s0hl5iJqgNWSan8fYW0TqNOeE
 In8GBkJzWaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1R+sB/4xQ14DFSepN3Pc/dbRTGNkwhgiKH0xD3kf8gzdciIq/WiOkRHnv74I0gKlgWOluGtINBd
 kJZzB7nhyLthcwogNvGAFbuNK8c1pUImkP+KZbO4YTfNXvcsMq54NO6G9CDEKfaI2XjGMbcQmBd
 rDRSAjk2H+FTk599L8VZnHpYvggAOf8Gvj1qBIPYSNVXLkS5DG5m388FtcQjA3TTD3S74Oi+Dhs
 k2umJR9C8JNvDB/7m/QVEAReT5xjXU8rUjErbWERr+cFD/6Ot0oiQjjWMDi/f2AG4bbeFFVzJso
 dK/XWFH5cnmw9z4QIAcNhuSiuuuMZ5WTHWRwVzkANkKmr88V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fbe740 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Y616JU-rhwX7OS_1NHmqdWoFqzfMs2e-
X-Proofpoint-ORIG-GUID: Y616JU-rhwX7OS_1NHmqdWoFqzfMs2e-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  9 +++------
 drivers/gpu/drm/msm/msm_kms.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h |  2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 02beb40eb9146941aa43862d07a6d82ae21c965e..b296d1315aa249638e073d08d43e8d41a4354f3b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,7 +11,6 @@
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -79,7 +78,7 @@ static int msm_drm_uninit(struct device *dev)
 	if (ddev->registered) {
 		drm_dev_unregister(ddev);
 		if (priv->kms)
-			drm_atomic_helper_shutdown(ddev);
+			msm_drm_kms_unregister(dev);
 	}
 
 	msm_gem_shrinker_cleanup(ddev);
@@ -275,10 +274,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
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
index 821f0b9f968fc3d448e612bfae04639ceb770353..fdb22c41bdc1a772b45c6940dda787dd96879bc2 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
+#include <drm/clients/drm_client_setup.h>
 
 #include "disp/msm_disp_snapshot.h"
 #include "msm_drv.h"
@@ -217,6 +218,15 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	return aspace;
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
@@ -373,3 +383,13 @@ void msm_kms_shutdown(struct platform_device *pdev)
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
index 43b58d052ee6aae0ce34d09c88e1e1c34f9c52ef..057b20367724a4ca60f2d60c038077dbcc1c7abc 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -192,6 +192,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
 
 int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv);
+void msm_drm_kms_post_init(struct device *dev);
+void msm_drm_kms_unregister(struct device *dev);
 void msm_drm_kms_uninit(struct device *dev);
 
 #endif /* __MSM_KMS_H__ */

-- 
2.39.5

