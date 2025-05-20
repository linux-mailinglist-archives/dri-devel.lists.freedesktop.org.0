Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF38ABE4FE
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 22:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EF210E5D9;
	Tue, 20 May 2025 20:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEixF0Ls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8521710E588
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:44:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGgXiZ013500
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m67TFHeHsvgVLsmiNGRclVtEIGA6cCV1D/TyNxUHFNM=; b=GEixF0LsPzoA1dx/
 WqqIHMO37t/Tn7gTOyHCAhjZ9KAnA0MYBNTMNbmaNjQYjNnrN5b2C158QEKZWk5f
 Jb42vmHDXpxfcwgdalg1n7vR8ueAUcoNQl5SxPjAWx0l4mweO3qZP7cHHg5Z4pZM
 vac2auJ2LpZKXR9Vd5R1WKZmhSeGq96vybHe/MW1xT/dhGHiLE5T9cl/kLxWrp5K
 1w9aGGQFe4mXMYyVovywtxs7Ro2/NRJggHOrOfI4CspRZCEtBGyqNpemUV/96jNg
 W34zj5U0ane0lQ/ZSDTPP1rWhdOWleZjutkym378100+sEiRPmY2HNipqLy0oNGm
 o+VnAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6gkam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:44:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8e1d900e5so31638686d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 13:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747773897; x=1748378697;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m67TFHeHsvgVLsmiNGRclVtEIGA6cCV1D/TyNxUHFNM=;
 b=MESf8tXkAcieOs1K25LsyFIbYqiwjitltdMhqSXN9MokrseXHHQsFAQi0r9mR85tZS
 xA9grY3kV8z6rNiJf6xlITpb0VlUHXeXH4O4hNiK43ycLa7D11STzPy6BYe2zNtxQwLE
 JwiZ4vJv+Ay7c8Y+TL3kH/17eSluIUe1dg5H2gPoJWmOeqIhbYqtLV6zwt78+D12o0ed
 HK3uEzVxOhpoJlrq6lxbCf+gJa0K/AzNZK6mfK04rMMMz3qnRWLnB+Rl8ClK+q+7KfeU
 mPh83shyWqO8m9IMc6LoJMQYHfFGQW3vLE7RTG0AZK/y9Sw9kQA77xk+KQlin3sNwnZM
 s5MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBJ0hnZRQEX5OqnHK9x3cdwnJaM2T9RKJ1cu29hT9Ks6hBLfqFsbhJv1bPzvg1RaOZR4jZypTCADI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8P3/SHryFZmaR0vA56QOAVlzGsD0BgzPo2MpmgUS/SyhZKhQp
 WW5/VJCOWtRHN1r+smpKw0QcNkADMo0A3aEl03fYh8vziB/s9aYlTJZBJGQsgyWi1rSIGeW9Pvo
 IwiJeltqYA6aKSR+ZPF1bb2WOXQeTzkZ4ZwPG42I9mIiDaNHexZ23LQscdZWgKd9lfh0EWKU=
X-Gm-Gg: ASbGncu8oP6fajFsSdNOWkbMCp38GInALfAGAu/zZG+/6bUXA7877WLJ82yT3el3o0Q
 eEK8XOFFoee/qfmDbqCsL4Qb1vEIrrwBca4aODEGkJwxJqFwjjummgVNuWeTvBmEK1W9PtcS/Eu
 7NPHTnIos5Qjnm3/SMcWJv+Mc7qDD8PzIfnI1HGIFULQTCijRZ3F54XF7m9LHKsL5c3E09N1n2G
 icUtXcIX5Tt1JrGT5xbP7WkZXIb/j1JA822Y5eR5GmM80ZjYLEaxhDASS8gNcIjoCOUg1dMeeAR
 q0qH0TiK1xA40krrfDDbYUiyWclIUxKbjBeaVrTW0kOz2LwSmVSY+FdePIdhoQcCDu6aAeL3YLw
 96PZCbvWDC5Pif+N7c/M5zQge
X-Received: by 2002:a05:6214:483:b0:6e6:61a5:aa57 with SMTP id
 6a1803df08f44-6f8b087cdfdmr276357736d6.14.1747773895940; 
 Tue, 20 May 2025 13:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9OjJTAfQgWw6KPiwv7pMCD1Q/q0x201qdZavmVEpjfpJnZ4aXEQZofqwDfcqKtoqxE1e0Sw==
X-Received: by 2002:a05:6214:483:b0:6e6:61a5:aa57 with SMTP id
 6a1803df08f44-6f8b087cdfdmr276356596d6.14.1747773894476; 
 Tue, 20 May 2025 13:44:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f163ccsm2497950e87.39.2025.05.20.13.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:44:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 May 2025 23:44:43 +0300
Subject: [PATCH v4 1/5] drm/msm/hdmi: switch to generic PHY subsystem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-fd-hdmi-phy-v4-1-fcbaa652ad75@oss.qualcomm.com>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
In-Reply-To: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-phy@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=162424;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pT3eTmT2ZjUZPSAmnlTMn8hRKe3RMCM6JkXDQSulJgg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoLOnATTIidERZbnmRUgSikERfHE9elze7bQR/a
 prfgh3mPg6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCzpwAAKCRCLPIo+Aiko
 1f/5B/4x50diWnozF/+yqYR22SbK7ueJk+eLWN52fuJVXy1t7wuKcaBwee49uFQCVuyP9k4RScG
 h6xtkBh+ONP/DFEGaSGeG48t886sX+tPjeyH8pcR6XC784wd5Mds7qVgoVNw5clNIutohQasuXz
 alYOwYthxu2Zlt9a6Vu/QcUVlAmx9VrDIp+a5jHyuhbL2nyxJtm8x29zsBBkP3gW68KZWOCKhz9
 mC+3vQ0dJbAUiVL7UC9BpRdwTeaAvdHKYjt7uNSS6Ron2kLVfTIuuvZ95sLKHyPhhVuMbOOcMN9
 9DWJ8EJ/1BybgcHsdwn2pJFAHDHbZzPoF3O9fEZEjMdhm1WZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VL/dn8PX c=1 sm=1 tr=0 ts=682ce9ca cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=qzgp7QZQiccVP5dvYDYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cLDzzw1ANTLvdtmfGihtuNfuNRY3Yfrl
X-Proofpoint-ORIG-GUID: cLDzzw1ANTLvdtmfGihtuNfuNRY3Yfrl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2OCBTYWx0ZWRfX0JUQuGhDgMXq
 ialpQkzKWyMTiy9q4IeBn+o5rfsn1+VilVeWTL6mltmWB9GGA9tM2RyWtLCyD7VJs8JZYy/cspm
 8VEob56MYX7tZGWjrNdZLA2NwIFp3CdVbB7Jwizz+gNvkYa5hFJVflFoOJeZrJQQiygoMHEC5kk
 J4YgShiBSava+AO6irRbY7mEjyAuAW/OT7DuQEUhT7cveyMwEqhEKWkoPVWlWNrUN9sN1J4xLmy
 PM1ePboiq3cK9QKzqmzy126WoTTfHX6BDWTr+iQba4n7gHZcREMLxtw2aUKh/k9ezWxZ5TYcghu
 V9+efhOv3vY/dhwYG3nrVj+ZwST7RZ1AUS+qhbpkMuApsk0yBPZbzJaJPrhx12ij0ZYZP+Fn1aY
 YNzdGb2wMhMnbWD/stECSHtit+0NeRwxpGAc7pu17DK6vgilvwDqtoBqxfzzQuQ32SqRuAOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200168
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
drivers allows better code sharing with the rest of the PHY system.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile                     |   7 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  32 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 765 ----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 769 -----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 458 --------------
 drivers/phy/qualcomm/Kconfig                     |  21 +
 drivers/phy/qualcomm/Makefile                    |  14 +
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       |  71 +++
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 441 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  81 +++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 442 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 495 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
 22 files changed, 2259 insertions(+), 2596 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7a2ada6e2d74a902879e4f12a78ed475e5209ec2..8ea4a0ab2096574e3f6d42c165076203f709a98c 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -35,13 +35,6 @@ msm-display-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi_bridge.o \
 	hdmi/hdmi_hpd.o \
 	hdmi/hdmi_i2c.o \
-	hdmi/hdmi_phy.o \
-	hdmi/hdmi_phy_8960.o \
-	hdmi/hdmi_phy_8996.o \
-	hdmi/hdmi_phy_8998.o \
-	hdmi/hdmi_phy_8x60.o \
-	hdmi/hdmi_phy_8x74.o \
-	hdmi/hdmi_pll_8960.o \
 
 msm-display-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_crtc.o \
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 2fd388b892dcb3d83cf57b4616b7a65f9ff674d1..23f6311e4ec9218aaccf61a466c7588fe7f3d164 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -10,6 +10,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/phy/phy.h>
 
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
@@ -75,44 +76,6 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
 		msm_hdmi_i2c_destroy(hdmi->i2c);
 }
 
-static void msm_hdmi_put_phy(struct hdmi *hdmi)
-{
-	if (hdmi->phy_dev) {
-		put_device(hdmi->phy_dev);
-		hdmi->phy = NULL;
-		hdmi->phy_dev = NULL;
-	}
-}
-
-static int msm_hdmi_get_phy(struct hdmi *hdmi)
-{
-	struct platform_device *pdev = hdmi->pdev;
-	struct platform_device *phy_pdev;
-	struct device_node *phy_node;
-
-	phy_node = of_parse_phandle(pdev->dev.of_node, "phys", 0);
-	if (!phy_node) {
-		DRM_DEV_ERROR(&pdev->dev, "cannot find phy device\n");
-		return -ENXIO;
-	}
-
-	phy_pdev = of_find_device_by_node(phy_node);
-	of_node_put(phy_node);
-
-	if (!phy_pdev)
-		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "phy driver is not ready\n");
-
-	hdmi->phy = platform_get_drvdata(phy_pdev);
-	if (!hdmi->phy) {
-		put_device(&phy_pdev->dev);
-		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "phy driver is not ready\n");
-	}
-
-	hdmi->phy_dev = &phy_pdev->dev;
-
-	return 0;
-}
-
 /* construct hdmi at bind/probe time, grab all the resources.  If
  * we are to EPROBE_DEFER we want to do it here, rather than later
  * at modeset_init() time
@@ -356,36 +319,31 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
 
-	ret = msm_hdmi_get_phy(hdmi);
-	if (ret) {
+	hdmi->phy = devm_phy_get(&pdev->dev, NULL);
+	if (IS_ERR(hdmi->phy)) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to get phy\n");
-		return ret;
+		return PTR_ERR(hdmi->phy);
 	}
 
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
-		goto err_put_phy;
+		goto err;
 
 	platform_set_drvdata(pdev, hdmi);
 
 	ret = component_add(&pdev->dev, &msm_hdmi_ops);
 	if (ret)
-		goto err_put_phy;
+		goto err;
 
 	return 0;
 
-err_put_phy:
-	msm_hdmi_put_phy(hdmi);
+err:
 	return ret;
 }
 
 static void msm_hdmi_dev_remove(struct platform_device *pdev)
 {
-	struct hdmi *hdmi = dev_get_drvdata(&pdev->dev);
-
 	component_del(&pdev->dev, &msm_hdmi_ops);
-
-	msm_hdmi_put_phy(hdmi);
 }
 
 static int msm_hdmi_runtime_suspend(struct device *dev)
@@ -453,12 +411,10 @@ static struct platform_driver msm_hdmi_driver = {
 
 void __init msm_hdmi_register(void)
 {
-	msm_hdmi_phy_driver_register();
 	platform_driver_register(&msm_hdmi_driver);
 }
 
 void __exit msm_hdmi_unregister(void)
 {
 	platform_driver_unregister(&msm_hdmi_driver);
-	msm_hdmi_phy_driver_unregister();
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index d5e572d10d6a14b866f13c3a0d663cc6ae435ef5..807aef89ef1af3b7e6a21464cade5287914b0754 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -19,7 +19,6 @@
 #include "msm_drv.h"
 #include "hdmi.xml.h"
 
-struct hdmi_phy;
 struct hdmi_platform_config;
 
 struct hdmi_audio {
@@ -55,8 +54,7 @@ struct hdmi {
 
 	struct gpio_desc *hpd_gpiod;
 
-	struct hdmi_phy *phy;
-	struct device *phy_dev;
+	struct phy *phy;
 
 	struct i2c_adapter *i2c;
 	struct drm_connector *connector;
@@ -117,82 +115,6 @@ static inline u32 hdmi_qfprom_read(struct hdmi *hdmi, u32 reg)
 	return readl(hdmi->qfprom_mmio + reg);
 }
 
-/*
- * hdmi phy:
- */
-
-enum hdmi_phy_type {
-	MSM_HDMI_PHY_8x60,
-	MSM_HDMI_PHY_8960,
-	MSM_HDMI_PHY_8x74,
-	MSM_HDMI_PHY_8996,
-	MSM_HDMI_PHY_8998,
-	MSM_HDMI_PHY_MAX,
-};
-
-struct hdmi_phy_cfg {
-	enum hdmi_phy_type type;
-	void (*powerup)(struct hdmi_phy *phy, unsigned long int pixclock);
-	void (*powerdown)(struct hdmi_phy *phy);
-	const char * const *reg_names;
-	int num_regs;
-	const char * const *clk_names;
-	int num_clks;
-};
-
-extern const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg;
-extern const struct hdmi_phy_cfg msm_hdmi_phy_8960_cfg;
-extern const struct hdmi_phy_cfg msm_hdmi_phy_8x74_cfg;
-extern const struct hdmi_phy_cfg msm_hdmi_phy_8996_cfg;
-extern const struct hdmi_phy_cfg msm_hdmi_phy_8998_cfg;
-
-struct hdmi_phy {
-	struct platform_device *pdev;
-	void __iomem *mmio;
-	struct hdmi_phy_cfg *cfg;
-	const struct hdmi_phy_funcs *funcs;
-	struct regulator_bulk_data *regs;
-	struct clk **clks;
-};
-
-static inline void hdmi_phy_write(struct hdmi_phy *phy, u32 reg, u32 data)
-{
-	writel(data, phy->mmio + reg);
-}
-
-static inline u32 hdmi_phy_read(struct hdmi_phy *phy, u32 reg)
-{
-	return readl(phy->mmio + reg);
-}
-
-int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy);
-void msm_hdmi_phy_resource_disable(struct hdmi_phy *phy);
-void msm_hdmi_phy_powerup(struct hdmi_phy *phy, unsigned long int pixclock);
-void msm_hdmi_phy_powerdown(struct hdmi_phy *phy);
-void __init msm_hdmi_phy_driver_register(void);
-void __exit msm_hdmi_phy_driver_unregister(void);
-
-#ifdef CONFIG_COMMON_CLK
-int msm_hdmi_pll_8960_init(struct platform_device *pdev);
-int msm_hdmi_pll_8996_init(struct platform_device *pdev);
-int msm_hdmi_pll_8998_init(struct platform_device *pdev);
-#else
-static inline int msm_hdmi_pll_8960_init(struct platform_device *pdev)
-{
-	return -ENODEV;
-}
-
-static inline int msm_hdmi_pll_8996_init(struct platform_device *pdev)
-{
-	return -ENODEV;
-}
-
-static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
-{
-	return -ENODEV;
-}
-#endif
-
 /*
  * audio:
  */
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 53a7ce8cc7bc7b6278eae2cbc42c3fda8d697f6d..1a00c26c1b40fc81623c9fb22ba25f448c27bffb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/phy/phy.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -286,11 +287,12 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	struct hdmi_phy *phy = hdmi->phy;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
+	union phy_configure_opts phy_opts;
+	int ret;
 
 	DBG("power up");
 
@@ -304,7 +306,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	mutex_lock(&hdmi->state_mutex);
 	if (!hdmi->power_on) {
-		msm_hdmi_phy_resource_enable(phy);
+		phy_init(hdmi->phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
 	}
@@ -315,7 +317,23 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
-	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
+	phy_opts.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+	phy_opts.hdmi.bpc = 8;
+	phy_configure(hdmi->phy, &phy_opts);
+
+	ret = phy_power_on(hdmi->phy);
+	if (WARN_ON(ret))
+		return;
+
+	if (hdmi->extp_clk) {
+		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
+		if (ret)
+			DRM_DEV_ERROR(bridge->dev->dev, "failed to set extp clk rate: %d\n", ret);
+
+		ret = clk_prepare_enable(hdmi->extp_clk);
+		if (ret)
+			DRM_DEV_ERROR(bridge->dev->dev, "failed to enable extp clk: %d\n", ret);
+	}
 
 	msm_hdmi_set_mode(hdmi, true);
 
@@ -328,7 +346,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	struct hdmi_phy *phy = hdmi->phy;
 
 	if (hdmi->hdcp_ctrl)
 		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
@@ -339,14 +356,17 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
 
-	msm_hdmi_phy_powerdown(phy);
+	if (hdmi->extp_clk)
+		clk_disable_unprepare(hdmi->extp_clk);
+
+	phy_power_off(hdmi->phy);
 
 	if (hdmi->power_on) {
 		power_off(bridge);
 		hdmi->power_on = false;
 		if (hdmi->connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
-		msm_hdmi_phy_resource_disable(phy);
+		phy_exit(hdmi->phy);
 	}
 	mutex_unlock(&hdmi->state_mutex);
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
deleted file mode 100644
index 667573f1db7c6bfef6c75828b5c581c147a86d0d..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ /dev/null
@@ -1,225 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- */
-
-#include <linux/of.h>
-#include <linux/platform_device.h>
-
-#include "hdmi.h"
-
-static int msm_hdmi_phy_resource_init(struct hdmi_phy *phy)
-{
-	struct hdmi_phy_cfg *cfg = phy->cfg;
-	struct device *dev = &phy->pdev->dev;
-	int i, ret;
-
-	phy->regs = devm_kcalloc(dev, cfg->num_regs, sizeof(phy->regs[0]),
-				 GFP_KERNEL);
-	if (!phy->regs)
-		return -ENOMEM;
-
-	phy->clks = devm_kcalloc(dev, cfg->num_clks, sizeof(phy->clks[0]),
-				 GFP_KERNEL);
-	if (!phy->clks)
-		return -ENOMEM;
-
-	for (i = 0; i < cfg->num_regs; i++)
-		phy->regs[i].supply = cfg->reg_names[i];
-
-	ret = devm_regulator_bulk_get(dev, cfg->num_regs, phy->regs);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get phy regulators: %d\n", ret);
-
-		return ret;
-	}
-
-	for (i = 0; i < cfg->num_clks; i++) {
-		struct clk *clk;
-
-		clk = msm_clk_get(phy->pdev, cfg->clk_names[i]);
-		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
-			DRM_DEV_ERROR(dev, "failed to get phy clock: %s (%d)\n",
-				cfg->clk_names[i], ret);
-			return ret;
-		}
-
-		phy->clks[i] = clk;
-	}
-
-	return 0;
-}
-
-int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
-{
-	struct hdmi_phy_cfg *cfg = phy->cfg;
-	struct device *dev = &phy->pdev->dev;
-	int i, ret = 0;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to enable regulators: (%d)\n", ret);
-		return ret;
-	}
-
-	for (i = 0; i < cfg->num_clks; i++) {
-		ret = clk_prepare_enable(phy->clks[i]);
-		if (ret)
-			DRM_DEV_ERROR(dev, "failed to enable clock: %s (%d)\n",
-				cfg->clk_names[i], ret);
-	}
-
-	return ret;
-}
-
-void msm_hdmi_phy_resource_disable(struct hdmi_phy *phy)
-{
-	struct hdmi_phy_cfg *cfg = phy->cfg;
-	struct device *dev = &phy->pdev->dev;
-	int i;
-
-	for (i = cfg->num_clks - 1; i >= 0; i--)
-		clk_disable_unprepare(phy->clks[i]);
-
-	regulator_bulk_disable(cfg->num_regs, phy->regs);
-
-	pm_runtime_put_sync(dev);
-}
-
-void msm_hdmi_phy_powerup(struct hdmi_phy *phy, unsigned long int pixclock)
-{
-	if (!phy || !phy->cfg->powerup)
-		return;
-
-	phy->cfg->powerup(phy, pixclock);
-}
-
-void msm_hdmi_phy_powerdown(struct hdmi_phy *phy)
-{
-	if (!phy || !phy->cfg->powerdown)
-		return;
-
-	phy->cfg->powerdown(phy);
-}
-
-static int msm_hdmi_phy_pll_init(struct platform_device *pdev,
-			     enum hdmi_phy_type type)
-{
-	int ret;
-
-	switch (type) {
-	case MSM_HDMI_PHY_8960:
-		ret = msm_hdmi_pll_8960_init(pdev);
-		break;
-	case MSM_HDMI_PHY_8996:
-		ret = msm_hdmi_pll_8996_init(pdev);
-		break;
-	case MSM_HDMI_PHY_8998:
-		ret = msm_hdmi_pll_8998_init(pdev);
-		break;
-	/*
-	 * we don't have PLL support for these, don't report an error for now
-	 */
-	case MSM_HDMI_PHY_8x60:
-	case MSM_HDMI_PHY_8x74:
-	default:
-		ret = 0;
-		break;
-	}
-
-	return ret;
-}
-
-static int msm_hdmi_phy_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct hdmi_phy *phy;
-	int ret;
-
-	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
-	if (!phy)
-		return -ENODEV;
-
-	phy->cfg = (struct hdmi_phy_cfg *)of_device_get_match_data(dev);
-	if (!phy->cfg)
-		return -ENODEV;
-
-	phy->mmio = msm_ioremap(pdev, "hdmi_phy");
-	if (IS_ERR(phy->mmio)) {
-		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
-		return -ENOMEM;
-	}
-
-	phy->pdev = pdev;
-
-	ret = msm_hdmi_phy_resource_init(phy);
-	if (ret)
-		return ret;
-
-	pm_runtime_enable(&pdev->dev);
-
-	ret = msm_hdmi_phy_resource_enable(phy);
-	if (ret)
-		return ret;
-
-	ret = msm_hdmi_phy_pll_init(pdev, phy->cfg->type);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "couldn't init PLL\n");
-		msm_hdmi_phy_resource_disable(phy);
-		return ret;
-	}
-
-	msm_hdmi_phy_resource_disable(phy);
-
-	platform_set_drvdata(pdev, phy);
-
-	return 0;
-}
-
-static void msm_hdmi_phy_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-}
-
-static const struct of_device_id msm_hdmi_phy_dt_match[] = {
-	{ .compatible = "qcom,hdmi-phy-8660",
-	  .data = &msm_hdmi_phy_8x60_cfg },
-	{ .compatible = "qcom,hdmi-phy-8960",
-	  .data = &msm_hdmi_phy_8960_cfg },
-	{ .compatible = "qcom,hdmi-phy-8974",
-	  .data = &msm_hdmi_phy_8x74_cfg },
-	{ .compatible = "qcom,hdmi-phy-8084",
-	  .data = &msm_hdmi_phy_8x74_cfg },
-	{ .compatible = "qcom,hdmi-phy-8996",
-	  .data = &msm_hdmi_phy_8996_cfg },
-	{ .compatible = "qcom,hdmi-phy-8998",
-	  .data = &msm_hdmi_phy_8998_cfg },
-	{}
-};
-
-static struct platform_driver msm_hdmi_phy_platform_driver = {
-	.probe      = msm_hdmi_phy_probe,
-	.remove     = msm_hdmi_phy_remove,
-	.driver     = {
-		.name   = "msm_hdmi_phy",
-		.of_match_table = msm_hdmi_phy_dt_match,
-	},
-};
-
-void __init msm_hdmi_phy_driver_register(void)
-{
-	platform_driver_register(&msm_hdmi_phy_platform_driver);
-}
-
-void __exit msm_hdmi_phy_driver_unregister(void)
-{
-	platform_driver_unregister(&msm_hdmi_phy_platform_driver);
-}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
deleted file mode 100644
index cf90a0c1f82205eb29b4903de0de65077ee80362..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
+++ /dev/null
@@ -1,51 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2013 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#include "hdmi.h"
-
-static void hdmi_phy_8960_powerup(struct hdmi_phy *phy,
-				  unsigned long int pixclock)
-{
-	DBG("pixclock: %lu", pixclock);
-
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG2, 0x00);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG0, 0x1b);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG1, 0xf2);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG4, 0x00);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG5, 0x00);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG6, 0x00);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG7, 0x00);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG8, 0x00);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG9, 0x00);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG10, 0x00);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG11, 0x00);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG3, 0x20);
-}
-
-static void hdmi_phy_8960_powerdown(struct hdmi_phy *phy)
-{
-	DBG("");
-
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG2, 0x7f);
-}
-
-static const char * const hdmi_phy_8960_reg_names[] = {
-	"core-vdda",
-};
-
-static const char * const hdmi_phy_8960_clk_names[] = {
-	"slave_iface",
-};
-
-const struct hdmi_phy_cfg msm_hdmi_phy_8960_cfg = {
-	.type = MSM_HDMI_PHY_8960,
-	.powerup = hdmi_phy_8960_powerup,
-	.powerdown = hdmi_phy_8960_powerdown,
-	.reg_names = hdmi_phy_8960_reg_names,
-	.num_regs = ARRAY_SIZE(hdmi_phy_8960_reg_names),
-	.clk_names = hdmi_phy_8960_clk_names,
-	.num_clks = ARRAY_SIZE(hdmi_phy_8960_clk_names),
-};
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
deleted file mode 100644
index 8c8d80b59573a37a4008752b16e094a218802508..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ /dev/null
@@ -1,765 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- */
-
-#include <linux/clk-provider.h>
-#include <linux/delay.h>
-
-#include "hdmi.h"
-
-#define HDMI_VCO_MAX_FREQ			12000000000UL
-#define HDMI_VCO_MIN_FREQ			8000000000UL
-
-#define HDMI_PCLK_MAX_FREQ			600000000
-#define HDMI_PCLK_MIN_FREQ			25000000
-
-#define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
-#define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
-#define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
-#define HDMI_CORECLK_DIV			5
-#define HDMI_DEFAULT_REF_CLOCK			19200000
-#define HDMI_PLL_CMP_CNT			1024
-
-#define HDMI_PLL_POLL_MAX_READS			100
-#define HDMI_PLL_POLL_TIMEOUT_US		150
-
-#define HDMI_NUM_TX_CHANNEL			4
-
-struct hdmi_pll_8996 {
-	struct platform_device *pdev;
-	struct clk_hw clk_hw;
-
-	/* pll mmio base */
-	void __iomem *mmio_qserdes_com;
-	/* tx channel base */
-	void __iomem *mmio_qserdes_tx[HDMI_NUM_TX_CHANNEL];
-};
-
-#define hw_clk_to_pll(x) container_of(x, struct hdmi_pll_8996, clk_hw)
-
-struct hdmi_8996_phy_pll_reg_cfg {
-	u32 tx_lx_lane_mode[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_tx_band[HDMI_NUM_TX_CHANNEL];
-	u32 com_svs_mode_clk_sel;
-	u32 com_hsclk_sel;
-	u32 com_pll_cctrl_mode0;
-	u32 com_pll_rctrl_mode0;
-	u32 com_cp_ctrl_mode0;
-	u32 com_dec_start_mode0;
-	u32 com_div_frac_start1_mode0;
-	u32 com_div_frac_start2_mode0;
-	u32 com_div_frac_start3_mode0;
-	u32 com_integloop_gain0_mode0;
-	u32 com_integloop_gain1_mode0;
-	u32 com_lock_cmp_en;
-	u32 com_lock_cmp1_mode0;
-	u32 com_lock_cmp2_mode0;
-	u32 com_lock_cmp3_mode0;
-	u32 com_core_clk_en;
-	u32 com_coreclk_div;
-	u32 com_vco_tune_ctrl;
-
-	u32 tx_lx_tx_drv_lvl[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_tx_emp_post1_lvl[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_vmode_ctrl1[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_vmode_ctrl2[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_res_code_lane_tx[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_hp_pd_enables[HDMI_NUM_TX_CHANNEL];
-
-	u32 phy_mode;
-};
-
-struct hdmi_8996_post_divider {
-	u64 vco_freq;
-	int hsclk_divsel;
-	int vco_ratio;
-	int tx_band_sel;
-	int half_rate_mode;
-};
-
-static inline struct hdmi_phy *pll_get_phy(struct hdmi_pll_8996 *pll)
-{
-	return platform_get_drvdata(pll->pdev);
-}
-
-static inline void hdmi_pll_write(struct hdmi_pll_8996 *pll, int offset,
-				  u32 data)
-{
-	writel(data, pll->mmio_qserdes_com + offset);
-}
-
-static inline u32 hdmi_pll_read(struct hdmi_pll_8996 *pll, int offset)
-{
-	return readl(pll->mmio_qserdes_com + offset);
-}
-
-static inline void hdmi_tx_chan_write(struct hdmi_pll_8996 *pll, int channel,
-				      int offset, int data)
-{
-	 writel(data, pll->mmio_qserdes_tx[channel] + offset);
-}
-
-static inline u32 pll_get_cpctrl(u64 frac_start, unsigned long ref_clk,
-				 bool gen_ssc)
-{
-	if ((frac_start != 0) || gen_ssc)
-		return (11000000 / (ref_clk / 20));
-
-	return 0x23;
-}
-
-static inline u32 pll_get_rctrl(u64 frac_start, bool gen_ssc)
-{
-	if ((frac_start != 0) || gen_ssc)
-		return 0x16;
-
-	return 0x10;
-}
-
-static inline u32 pll_get_cctrl(u64 frac_start, bool gen_ssc)
-{
-	if ((frac_start != 0) || gen_ssc)
-		return 0x28;
-
-	return 0x1;
-}
-
-static inline u32 pll_get_integloop_gain(u64 frac_start, u64 bclk, u32 ref_clk,
-					 bool gen_ssc)
-{
-	int digclk_divsel = bclk >= HDMI_DIG_FREQ_BIT_CLK_THRESHOLD ? 1 : 2;
-	u64 base;
-
-	if ((frac_start != 0) || gen_ssc)
-		base = (64 * ref_clk) / HDMI_DEFAULT_REF_CLOCK;
-	else
-		base = (1022 * ref_clk) / 100;
-
-	base <<= digclk_divsel;
-
-	return (base <= 2046 ? base : 2046);
-}
-
-static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
-{
-	u64 dividend = HDMI_PLL_CMP_CNT * fdata;
-	u32 divisor = ref_clk * 10;
-	u32 rem;
-
-	rem = do_div(dividend, divisor);
-	if (rem > (divisor >> 1))
-		dividend++;
-
-	return dividend - 1;
-}
-
-static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
-{
-	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
-
-	do_div(fdata, HDMI_PLL_CMP_CNT);
-
-	return fdata;
-}
-
-static int pll_get_post_div(struct hdmi_8996_post_divider *pd, u64 bclk)
-{
-	int ratio[] = { 2, 3, 4, 5, 6, 9, 10, 12, 14, 15, 20, 21, 25, 28, 35 };
-	int hs_divsel[] = { 0, 4, 8, 12, 1, 5, 2, 9, 3, 13, 10, 7, 14, 11, 15 };
-	int tx_band_sel[] = { 0, 1, 2, 3 };
-	u64 vco_freq[60];
-	u64 vco, vco_optimal;
-	int half_rate_mode = 0;
-	int vco_optimal_index, vco_freq_index;
-	int i, j;
-
-retry:
-	vco_optimal = HDMI_VCO_MAX_FREQ;
-	vco_optimal_index = -1;
-	vco_freq_index = 0;
-	for (i = 0; i < 15; i++) {
-		for (j = 0; j < 4; j++) {
-			u32 ratio_mult = ratio[i] << tx_band_sel[j];
-
-			vco = bclk >> half_rate_mode;
-			vco *= ratio_mult;
-			vco_freq[vco_freq_index++] = vco;
-		}
-	}
-
-	for (i = 0; i < 60; i++) {
-		u64 vco_tmp = vco_freq[i];
-
-		if ((vco_tmp >= HDMI_VCO_MIN_FREQ) &&
-		    (vco_tmp <= vco_optimal)) {
-			vco_optimal = vco_tmp;
-			vco_optimal_index = i;
-		}
-	}
-
-	if (vco_optimal_index == -1) {
-		if (!half_rate_mode) {
-			half_rate_mode = 1;
-			goto retry;
-		}
-	} else {
-		pd->vco_freq = vco_optimal;
-		pd->tx_band_sel = tx_band_sel[vco_optimal_index % 4];
-		pd->vco_ratio = ratio[vco_optimal_index / 4];
-		pd->hsclk_divsel = hs_divsel[vco_optimal_index / 4];
-
-		return 0;
-	}
-
-	return -EINVAL;
-}
-
-static int pll_calculate(unsigned long pix_clk, unsigned long ref_clk,
-			 struct hdmi_8996_phy_pll_reg_cfg *cfg)
-{
-	struct hdmi_8996_post_divider pd;
-	u64 bclk;
-	u64 tmds_clk;
-	u64 dec_start;
-	u64 frac_start;
-	u64 fdata;
-	u32 pll_divisor;
-	u32 rem;
-	u32 cpctrl;
-	u32 rctrl;
-	u32 cctrl;
-	u32 integloop_gain;
-	u32 pll_cmp;
-	int i, ret;
-
-	/* bit clk = 10 * pix_clk */
-	bclk = ((u64)pix_clk) * 10;
-
-	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD)
-		tmds_clk = pix_clk >> 2;
-	else
-		tmds_clk = pix_clk;
-
-	ret = pll_get_post_div(&pd, bclk);
-	if (ret)
-		return ret;
-
-	dec_start = pd.vco_freq;
-	pll_divisor = 4 * ref_clk;
-	do_div(dec_start, pll_divisor);
-
-	frac_start = pd.vco_freq * (1 << 20);
-
-	rem = do_div(frac_start, pll_divisor);
-	frac_start -= dec_start * (1 << 20);
-	if (rem > (pll_divisor >> 1))
-		frac_start++;
-
-	cpctrl = pll_get_cpctrl(frac_start, ref_clk, false);
-	rctrl = pll_get_rctrl(frac_start, false);
-	cctrl = pll_get_cctrl(frac_start, false);
-	integloop_gain = pll_get_integloop_gain(frac_start, bclk,
-						ref_clk, false);
-
-	fdata = pd.vco_freq;
-	do_div(fdata, pd.vco_ratio);
-
-	pll_cmp = pll_get_pll_cmp(fdata, ref_clk);
-
-	DBG("VCO freq: %llu", pd.vco_freq);
-	DBG("fdata: %llu", fdata);
-	DBG("pix_clk: %lu", pix_clk);
-	DBG("tmds clk: %llu", tmds_clk);
-	DBG("HSCLK_SEL: %d", pd.hsclk_divsel);
-	DBG("DEC_START: %llu", dec_start);
-	DBG("DIV_FRAC_START: %llu", frac_start);
-	DBG("PLL_CPCTRL: %u", cpctrl);
-	DBG("PLL_RCTRL: %u", rctrl);
-	DBG("PLL_CCTRL: %u", cctrl);
-	DBG("INTEGLOOP_GAIN: %u", integloop_gain);
-	DBG("TX_BAND: %d", pd.tx_band_sel);
-	DBG("PLL_CMP: %u", pll_cmp);
-
-	/* Convert these values to register specific values */
-	if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD)
-		cfg->com_svs_mode_clk_sel = 1;
-	else
-		cfg->com_svs_mode_clk_sel = 2;
-
-	cfg->com_hsclk_sel = (0x20 | pd.hsclk_divsel);
-	cfg->com_pll_cctrl_mode0 = cctrl;
-	cfg->com_pll_rctrl_mode0 = rctrl;
-	cfg->com_cp_ctrl_mode0 = cpctrl;
-	cfg->com_dec_start_mode0 = dec_start;
-	cfg->com_div_frac_start1_mode0 = (frac_start & 0xff);
-	cfg->com_div_frac_start2_mode0 = ((frac_start & 0xff00) >> 8);
-	cfg->com_div_frac_start3_mode0 = ((frac_start & 0xf0000) >> 16);
-	cfg->com_integloop_gain0_mode0 = (integloop_gain & 0xff);
-	cfg->com_integloop_gain1_mode0 = ((integloop_gain & 0xf00) >> 8);
-	cfg->com_lock_cmp1_mode0 = (pll_cmp & 0xff);
-	cfg->com_lock_cmp2_mode0 = ((pll_cmp & 0xff00) >> 8);
-	cfg->com_lock_cmp3_mode0 = ((pll_cmp & 0x30000) >> 16);
-	cfg->com_lock_cmp_en = 0x0;
-	cfg->com_core_clk_en = 0x2c;
-	cfg->com_coreclk_div = HDMI_CORECLK_DIV;
-	cfg->phy_mode = (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) ? 0x10 : 0x0;
-	cfg->com_vco_tune_ctrl = 0x0;
-
-	cfg->tx_lx_lane_mode[0] =
-		cfg->tx_lx_lane_mode[2] = 0x43;
-
-	cfg->tx_lx_hp_pd_enables[0] =
-		cfg->tx_lx_hp_pd_enables[1] =
-		cfg->tx_lx_hp_pd_enables[2] = 0x0c;
-	cfg->tx_lx_hp_pd_enables[3] = 0x3;
-
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
-		cfg->tx_lx_tx_band[i] = pd.tx_band_sel + 4;
-
-	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) {
-		cfg->tx_lx_tx_drv_lvl[0] =
-			cfg->tx_lx_tx_drv_lvl[1] =
-			cfg->tx_lx_tx_drv_lvl[2] = 0x25;
-		cfg->tx_lx_tx_drv_lvl[3] = 0x22;
-
-		cfg->tx_lx_tx_emp_post1_lvl[0] =
-			cfg->tx_lx_tx_emp_post1_lvl[1] =
-			cfg->tx_lx_tx_emp_post1_lvl[2] = 0x23;
-		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x27;
-
-		cfg->tx_lx_vmode_ctrl1[0] =
-			cfg->tx_lx_vmode_ctrl1[1] =
-			cfg->tx_lx_vmode_ctrl1[2] =
-			cfg->tx_lx_vmode_ctrl1[3] = 0x00;
-
-		cfg->tx_lx_vmode_ctrl2[0] =
-			cfg->tx_lx_vmode_ctrl2[1] =
-			cfg->tx_lx_vmode_ctrl2[2] = 0x0D;
-
-		cfg->tx_lx_vmode_ctrl2[3] = 0x00;
-	} else if (bclk > HDMI_MID_FREQ_BIT_CLK_THRESHOLD) {
-		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-			cfg->tx_lx_tx_drv_lvl[i] = 0x25;
-			cfg->tx_lx_tx_emp_post1_lvl[i] = 0x23;
-			cfg->tx_lx_vmode_ctrl1[i] = 0x00;
-		}
-
-		cfg->tx_lx_vmode_ctrl2[0] =
-			cfg->tx_lx_vmode_ctrl2[1] =
-			cfg->tx_lx_vmode_ctrl2[2] = 0x0D;
-		cfg->tx_lx_vmode_ctrl2[3] = 0x00;
-	} else {
-		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-			cfg->tx_lx_tx_drv_lvl[i] = 0x20;
-			cfg->tx_lx_tx_emp_post1_lvl[i] = 0x20;
-			cfg->tx_lx_vmode_ctrl1[i] = 0x00;
-			cfg->tx_lx_vmode_ctrl2[i] = 0x0E;
-		}
-	}
-
-	DBG("com_svs_mode_clk_sel = 0x%x", cfg->com_svs_mode_clk_sel);
-	DBG("com_hsclk_sel = 0x%x", cfg->com_hsclk_sel);
-	DBG("com_lock_cmp_en = 0x%x", cfg->com_lock_cmp_en);
-	DBG("com_pll_cctrl_mode0 = 0x%x", cfg->com_pll_cctrl_mode0);
-	DBG("com_pll_rctrl_mode0 = 0x%x", cfg->com_pll_rctrl_mode0);
-	DBG("com_cp_ctrl_mode0 = 0x%x", cfg->com_cp_ctrl_mode0);
-	DBG("com_dec_start_mode0 = 0x%x", cfg->com_dec_start_mode0);
-	DBG("com_div_frac_start1_mode0 = 0x%x", cfg->com_div_frac_start1_mode0);
-	DBG("com_div_frac_start2_mode0 = 0x%x", cfg->com_div_frac_start2_mode0);
-	DBG("com_div_frac_start3_mode0 = 0x%x", cfg->com_div_frac_start3_mode0);
-	DBG("com_integloop_gain0_mode0 = 0x%x", cfg->com_integloop_gain0_mode0);
-	DBG("com_integloop_gain1_mode0 = 0x%x", cfg->com_integloop_gain1_mode0);
-	DBG("com_lock_cmp1_mode0 = 0x%x", cfg->com_lock_cmp1_mode0);
-	DBG("com_lock_cmp2_mode0 = 0x%x", cfg->com_lock_cmp2_mode0);
-	DBG("com_lock_cmp3_mode0 = 0x%x", cfg->com_lock_cmp3_mode0);
-	DBG("com_core_clk_en = 0x%x", cfg->com_core_clk_en);
-	DBG("com_coreclk_div = 0x%x", cfg->com_coreclk_div);
-	DBG("phy_mode = 0x%x", cfg->phy_mode);
-
-	DBG("tx_l0_lane_mode = 0x%x", cfg->tx_lx_lane_mode[0]);
-	DBG("tx_l2_lane_mode = 0x%x", cfg->tx_lx_lane_mode[2]);
-
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-		DBG("tx_l%d_tx_band = 0x%x", i, cfg->tx_lx_tx_band[i]);
-		DBG("tx_l%d_tx_drv_lvl = 0x%x", i, cfg->tx_lx_tx_drv_lvl[i]);
-		DBG("tx_l%d_tx_emp_post1_lvl = 0x%x", i,
-		    cfg->tx_lx_tx_emp_post1_lvl[i]);
-		DBG("tx_l%d_vmode_ctrl1 = 0x%x", i, cfg->tx_lx_vmode_ctrl1[i]);
-		DBG("tx_l%d_vmode_ctrl2 = 0x%x", i, cfg->tx_lx_vmode_ctrl2[i]);
-	}
-
-	return 0;
-}
-
-static int hdmi_8996_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long parent_rate)
-{
-	struct hdmi_pll_8996 *pll = hw_clk_to_pll(hw);
-	struct hdmi_phy *phy = pll_get_phy(pll);
-	struct hdmi_8996_phy_pll_reg_cfg cfg;
-	int i, ret;
-
-	memset(&cfg, 0x00, sizeof(cfg));
-
-	ret = pll_calculate(rate, parent_rate, &cfg);
-	if (ret) {
-		DRM_ERROR("PLL calculation failed\n");
-		return ret;
-	}
-
-	/* Initially shut down PHY */
-	DBG("Disabling PHY");
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_PD_CTL, 0x0);
-	udelay(500);
-
-	/* Power up sequence */
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_BG_CTRL, 0x04);
-
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_PD_CTL, 0x1);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_RESETSM_CNTRL, 0x20);
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_TX0_TX1_LANE_CTL, 0x0F);
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_TX2_TX3_LANE_CTL, 0x0F);
-
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_PHY_QSERDES_TX_LX_CLKBUF_ENABLE,
-				   0x03);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_PHY_QSERDES_TX_LX_TX_BAND,
-				   cfg.tx_lx_tx_band[i]);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_PHY_QSERDES_TX_LX_RESET_TSYNC_EN,
-				   0x03);
-	}
-
-	hdmi_tx_chan_write(pll, 0, REG_HDMI_PHY_QSERDES_TX_LX_LANE_MODE,
-			   cfg.tx_lx_lane_mode[0]);
-	hdmi_tx_chan_write(pll, 2, REG_HDMI_PHY_QSERDES_TX_LX_LANE_MODE,
-			   cfg.tx_lx_lane_mode[2]);
-
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1E);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x07);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYSCLK_EN_SEL, 0x37);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYS_CLK_CTRL, 0x02);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_CLK_ENABLE1, 0x0E);
-
-	/* Bypass VCO calibration */
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SVS_MODE_CLK_SEL,
-		       cfg.com_svs_mode_clk_sel);
-
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_BG_TRIM, 0x0F);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_PLL_IVCO, 0x0F);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_VCO_TUNE_CTRL,
-		       cfg.com_vco_tune_ctrl);
-
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_BG_CTRL, 0x06);
-
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_CLK_SELECT, 0x30);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_HSCLK_SEL,
-		       cfg.com_hsclk_sel);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_LOCK_CMP_EN,
-		       cfg.com_lock_cmp_en);
-
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_PLL_CCTRL_MODE0,
-		       cfg.com_pll_cctrl_mode0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_PLL_RCTRL_MODE0,
-		       cfg.com_pll_rctrl_mode0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_CP_CTRL_MODE0,
-		       cfg.com_cp_ctrl_mode0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_DEC_START_MODE0,
-		       cfg.com_dec_start_mode0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_DIV_FRAC_START1_MODE0,
-		       cfg.com_div_frac_start1_mode0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_DIV_FRAC_START2_MODE0,
-		       cfg.com_div_frac_start2_mode0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_DIV_FRAC_START3_MODE0,
-		       cfg.com_div_frac_start3_mode0);
-
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE0,
-		       cfg.com_integloop_gain0_mode0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE0,
-		       cfg.com_integloop_gain1_mode0);
-
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_LOCK_CMP1_MODE0,
-		       cfg.com_lock_cmp1_mode0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_LOCK_CMP2_MODE0,
-		       cfg.com_lock_cmp2_mode0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_LOCK_CMP3_MODE0,
-		       cfg.com_lock_cmp3_mode0);
-
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_VCO_TUNE_MAP, 0x00);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_CORE_CLK_EN,
-		       cfg.com_core_clk_en);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_CORECLK_DIV,
-		       cfg.com_coreclk_div);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_CMN_CONFIG, 0x02);
-
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_RESCODE_DIV_NUM, 0x15);
-
-	/* TX lanes setup (TX 0/1/2/3) */
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_PHY_QSERDES_TX_LX_TX_DRV_LVL,
-				   cfg.tx_lx_tx_drv_lvl[i]);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_PHY_QSERDES_TX_LX_TX_EMP_POST1_LVL,
-				   cfg.tx_lx_tx_emp_post1_lvl[i]);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_PHY_QSERDES_TX_LX_VMODE_CTRL1,
-				   cfg.tx_lx_vmode_ctrl1[i]);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_PHY_QSERDES_TX_LX_VMODE_CTRL2,
-				   cfg.tx_lx_vmode_ctrl2[i]);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_PHY_QSERDES_TX_LX_TX_DRV_LVL_OFFSET,
-				   0x00);
-		hdmi_tx_chan_write(pll, i,
-			REG_HDMI_PHY_QSERDES_TX_LX_RES_CODE_LANE_OFFSET,
-			0x00);
-		hdmi_tx_chan_write(pll, i,
-			REG_HDMI_PHY_QSERDES_TX_LX_TRAN_DRVR_EMP_EN,
-			0x03);
-		hdmi_tx_chan_write(pll, i,
-			REG_HDMI_PHY_QSERDES_TX_LX_PARRATE_REC_DETECT_IDLE_EN,
-			0x40);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_PHY_QSERDES_TX_LX_HP_PD_ENABLES,
-				   cfg.tx_lx_hp_pd_enables[i]);
-	}
-
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_MODE, cfg.phy_mode);
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_PD_CTL, 0x1F);
-
-	/*
-	 * Ensure that vco configuration gets flushed to hardware before
-	 * enabling the PLL
-	 */
-	wmb();
-
-	return 0;
-}
-
-static int hdmi_8996_phy_ready_status(struct hdmi_phy *phy)
-{
-	u32 nb_tries = HDMI_PLL_POLL_MAX_READS;
-	unsigned long timeout = HDMI_PLL_POLL_TIMEOUT_US;
-	u32 status;
-	int phy_ready = 0;
-
-	DBG("Waiting for PHY ready");
-
-	while (nb_tries--) {
-		status = hdmi_phy_read(phy, REG_HDMI_8996_PHY_STATUS);
-		phy_ready = status & BIT(0);
-
-		if (phy_ready)
-			break;
-
-		udelay(timeout);
-	}
-
-	DBG("PHY is %sready", phy_ready ? "" : "*not* ");
-
-	return phy_ready;
-}
-
-static int hdmi_8996_pll_lock_status(struct hdmi_pll_8996 *pll)
-{
-	u32 status;
-	int nb_tries = HDMI_PLL_POLL_MAX_READS;
-	unsigned long timeout = HDMI_PLL_POLL_TIMEOUT_US;
-	int pll_locked = 0;
-
-	DBG("Waiting for PLL lock");
-
-	while (nb_tries--) {
-		status = hdmi_pll_read(pll,
-				       REG_HDMI_PHY_QSERDES_COM_C_READY_STATUS);
-		pll_locked = status & BIT(0);
-
-		if (pll_locked)
-			break;
-
-		udelay(timeout);
-	}
-
-	DBG("HDMI PLL is %slocked", pll_locked ? "" : "*not* ");
-
-	return pll_locked;
-}
-
-static int hdmi_8996_pll_prepare(struct clk_hw *hw)
-{
-	struct hdmi_pll_8996 *pll = hw_clk_to_pll(hw);
-	struct hdmi_phy *phy = pll_get_phy(pll);
-	int i, ret = 0;
-
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x1);
-	udelay(100);
-
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x19);
-	udelay(100);
-
-	ret = hdmi_8996_pll_lock_status(pll);
-	if (!ret)
-		return ret;
-
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
-		hdmi_tx_chan_write(pll, i,
-			REG_HDMI_PHY_QSERDES_TX_LX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN,
-			0x6F);
-
-	/* Disable SSC */
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_PER1, 0x0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_PER2, 0x0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_STEP_SIZE1, 0x0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_STEP_SIZE2, 0x0);
-	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_EN_CENTER, 0x2);
-
-	ret = hdmi_8996_phy_ready_status(phy);
-	if (!ret)
-		return ret;
-
-	/* Restart the retiming buffer */
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x18);
-	udelay(1);
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x19);
-
-	return 0;
-}
-
-static long hdmi_8996_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
-{
-	if (rate < HDMI_PCLK_MIN_FREQ)
-		return HDMI_PCLK_MIN_FREQ;
-	else if (rate > HDMI_PCLK_MAX_FREQ)
-		return HDMI_PCLK_MAX_FREQ;
-	else
-		return rate;
-}
-
-static unsigned long hdmi_8996_pll_recalc_rate(struct clk_hw *hw,
-					       unsigned long parent_rate)
-{
-	struct hdmi_pll_8996 *pll = hw_clk_to_pll(hw);
-	u64 fdata;
-	u32 cmp1, cmp2, cmp3, pll_cmp;
-
-	cmp1 = hdmi_pll_read(pll, REG_HDMI_PHY_QSERDES_COM_LOCK_CMP1_MODE0);
-	cmp2 = hdmi_pll_read(pll, REG_HDMI_PHY_QSERDES_COM_LOCK_CMP2_MODE0);
-	cmp3 = hdmi_pll_read(pll, REG_HDMI_PHY_QSERDES_COM_LOCK_CMP3_MODE0);
-
-	pll_cmp = cmp1 | (cmp2 << 8) | (cmp3 << 16);
-
-	fdata = pll_cmp_to_fdata(pll_cmp + 1, parent_rate);
-
-	do_div(fdata, 10);
-
-	return fdata;
-}
-
-static void hdmi_8996_pll_unprepare(struct clk_hw *hw)
-{
-	struct hdmi_pll_8996 *pll = hw_clk_to_pll(hw);
-	struct hdmi_phy *phy = pll_get_phy(pll);
-
-	hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x6);
-	usleep_range(100, 150);
-}
-
-static int hdmi_8996_pll_is_enabled(struct clk_hw *hw)
-{
-	struct hdmi_pll_8996 *pll = hw_clk_to_pll(hw);
-	u32 status;
-	int pll_locked;
-
-	status = hdmi_pll_read(pll, REG_HDMI_PHY_QSERDES_COM_C_READY_STATUS);
-	pll_locked = status & BIT(0);
-
-	return pll_locked;
-}
-
-static const struct clk_ops hdmi_8996_pll_ops = {
-	.set_rate = hdmi_8996_pll_set_clk_rate,
-	.round_rate = hdmi_8996_pll_round_rate,
-	.recalc_rate = hdmi_8996_pll_recalc_rate,
-	.prepare = hdmi_8996_pll_prepare,
-	.unprepare = hdmi_8996_pll_unprepare,
-	.is_enabled = hdmi_8996_pll_is_enabled,
-};
-
-static const struct clk_init_data pll_init = {
-	.name = "hdmipll",
-	.ops = &hdmi_8996_pll_ops,
-	.parent_data = (const struct clk_parent_data[]){
-		{ .fw_name = "xo", .name = "xo_board" },
-	},
-	.num_parents = 1,
-	.flags = CLK_IGNORE_UNUSED,
-};
-
-int msm_hdmi_pll_8996_init(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct hdmi_pll_8996 *pll;
-	int i, ret;
-
-	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
-	if (!pll)
-		return -ENOMEM;
-
-	pll->pdev = pdev;
-
-	pll->mmio_qserdes_com = msm_ioremap(pdev, "hdmi_pll");
-	if (IS_ERR(pll->mmio_qserdes_com)) {
-		DRM_DEV_ERROR(dev, "failed to map pll base\n");
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-		char name[32];
-
-		snprintf(name, sizeof(name), "hdmi_tx_l%d", i);
-
-		pll->mmio_qserdes_tx[i] = msm_ioremap(pdev, name);
-		if (IS_ERR(pll->mmio_qserdes_tx[i])) {
-			DRM_DEV_ERROR(dev, "failed to map pll base\n");
-			return -ENOMEM;
-		}
-	}
-	pll->clk_hw.init = &pll_init;
-
-	ret = devm_clk_hw_register(dev, &pll->clk_hw);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
-		return ret;
-	}
-
-	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static const char * const hdmi_phy_8996_reg_names[] = {
-	"vddio",
-	"vcca",
-};
-
-static const char * const hdmi_phy_8996_clk_names[] = {
-	"iface", "ref",
-};
-
-const struct hdmi_phy_cfg msm_hdmi_phy_8996_cfg = {
-	.type = MSM_HDMI_PHY_8996,
-	.reg_names = hdmi_phy_8996_reg_names,
-	.num_regs = ARRAY_SIZE(hdmi_phy_8996_reg_names),
-	.clk_names = hdmi_phy_8996_clk_names,
-	.num_clks = ARRAY_SIZE(hdmi_phy_8996_clk_names),
-};
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
deleted file mode 100644
index 33bb48ae58a2da13b7e90ff419c6e05fec1466af..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ /dev/null
@@ -1,769 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Freebox SAS
- */
-
-#include <linux/clk-provider.h>
-#include <linux/delay.h>
-
-#include "hdmi.h"
-
-#define HDMI_VCO_MAX_FREQ			12000000000UL
-#define HDMI_VCO_MIN_FREQ			8000000000UL
-
-#define HDMI_PCLK_MAX_FREQ			600000000
-#define HDMI_PCLK_MIN_FREQ			25000000
-
-#define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
-#define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
-#define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
-#define HDMI_CORECLK_DIV			5
-#define HDMI_DEFAULT_REF_CLOCK			19200000
-#define HDMI_PLL_CMP_CNT			1024
-
-#define HDMI_PLL_POLL_MAX_READS			100
-#define HDMI_PLL_POLL_TIMEOUT_US		150
-
-#define HDMI_NUM_TX_CHANNEL			4
-
-struct hdmi_pll_8998 {
-	struct platform_device *pdev;
-	struct clk_hw clk_hw;
-	unsigned long rate;
-
-	/* pll mmio base */
-	void __iomem *mmio_qserdes_com;
-	/* tx channel base */
-	void __iomem *mmio_qserdes_tx[HDMI_NUM_TX_CHANNEL];
-};
-
-#define hw_clk_to_pll(x) container_of(x, struct hdmi_pll_8998, clk_hw)
-
-struct hdmi_8998_phy_pll_reg_cfg {
-	u32 com_svs_mode_clk_sel;
-	u32 com_hsclk_sel;
-	u32 com_pll_cctrl_mode0;
-	u32 com_pll_rctrl_mode0;
-	u32 com_cp_ctrl_mode0;
-	u32 com_dec_start_mode0;
-	u32 com_div_frac_start1_mode0;
-	u32 com_div_frac_start2_mode0;
-	u32 com_div_frac_start3_mode0;
-	u32 com_integloop_gain0_mode0;
-	u32 com_integloop_gain1_mode0;
-	u32 com_lock_cmp_en;
-	u32 com_lock_cmp1_mode0;
-	u32 com_lock_cmp2_mode0;
-	u32 com_lock_cmp3_mode0;
-	u32 com_core_clk_en;
-	u32 com_coreclk_div_mode0;
-
-	u32 tx_lx_tx_band[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_tx_drv_lvl[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_tx_emp_post1_lvl[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_pre_driver_1[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_pre_driver_2[HDMI_NUM_TX_CHANNEL];
-	u32 tx_lx_res_code_offset[HDMI_NUM_TX_CHANNEL];
-
-	u32 phy_mode;
-};
-
-struct hdmi_8998_post_divider {
-	u64 vco_freq;
-	int hsclk_divsel;
-	int vco_ratio;
-	int tx_band_sel;
-	int half_rate_mode;
-};
-
-static inline struct hdmi_phy *pll_get_phy(struct hdmi_pll_8998 *pll)
-{
-	return platform_get_drvdata(pll->pdev);
-}
-
-static inline void hdmi_pll_write(struct hdmi_pll_8998 *pll, int offset,
-				  u32 data)
-{
-	writel(data, pll->mmio_qserdes_com + offset);
-}
-
-static inline u32 hdmi_pll_read(struct hdmi_pll_8998 *pll, int offset)
-{
-	return readl(pll->mmio_qserdes_com + offset);
-}
-
-static inline void hdmi_tx_chan_write(struct hdmi_pll_8998 *pll, int channel,
-				      int offset, int data)
-{
-	 writel(data, pll->mmio_qserdes_tx[channel] + offset);
-}
-
-static inline u32 pll_get_cpctrl(u64 frac_start, unsigned long ref_clk,
-				 bool gen_ssc)
-{
-	if ((frac_start != 0) || gen_ssc)
-		return 0x8;
-
-	return 0x30;
-}
-
-static inline u32 pll_get_rctrl(u64 frac_start, bool gen_ssc)
-{
-	if ((frac_start != 0) || gen_ssc)
-		return 0x16;
-
-	return 0x18;
-}
-
-static inline u32 pll_get_cctrl(u64 frac_start, bool gen_ssc)
-{
-	if ((frac_start != 0) || gen_ssc)
-		return 0x34;
-
-	return 0x2;
-}
-
-static inline u32 pll_get_integloop_gain(u64 frac_start, u64 bclk, u32 ref_clk,
-					 bool gen_ssc)
-{
-	int digclk_divsel = bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD ? 1 : 2;
-	u64 base;
-
-	if ((frac_start != 0) || gen_ssc)
-		base = 0x3F;
-	else
-		base = 0xC4;
-
-	base <<= (digclk_divsel == 2 ? 1 : 0);
-
-	return base;
-}
-
-static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
-{
-	u64 dividend = HDMI_PLL_CMP_CNT * fdata;
-	u32 divisor = ref_clk * 10;
-	u32 rem;
-
-	rem = do_div(dividend, divisor);
-	if (rem > (divisor >> 1))
-		dividend++;
-
-	return dividend - 1;
-}
-
-#define HDMI_REF_CLOCK_HZ ((u64)19200000)
-#define HDMI_MHZ_TO_HZ ((u64)1000000)
-static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
-{
-	static const u32 ratio_list[] = {1, 2, 3, 4, 5, 6, 9, 10, 12, 15, 25};
-	static const u32 band_list[] = {0, 1, 2, 3};
-	u32 const sz_ratio = ARRAY_SIZE(ratio_list);
-	u32 const sz_band = ARRAY_SIZE(band_list);
-	u32 const cmp_cnt = 1024;
-	u32 const th_min = 500, th_max = 1000;
-	u32 half_rate_mode = 0;
-	u32 list_elements;
-	int optimal_index;
-	u32 i, j, k;
-	u32 found_hsclk_divsel = 0, found_vco_ratio;
-	u32 found_tx_band_sel;
-	u64 const min_freq = HDMI_VCO_MIN_FREQ, max_freq = HDMI_VCO_MAX_FREQ;
-	u64 freq_list[ARRAY_SIZE(ratio_list) * ARRAY_SIZE(band_list)];
-	u64 found_vco_freq;
-	u64 freq_optimal;
-
-find_optimal_index:
-	freq_optimal = max_freq;
-	optimal_index = -1;
-	list_elements = 0;
-
-	for (i = 0; i < sz_ratio; i++) {
-		for (j = 0; j < sz_band; j++) {
-			u64 freq = div_u64(bclk, (1 << half_rate_mode));
-
-			freq *= (ratio_list[i] * (1 << band_list[j]));
-			freq_list[list_elements++] = freq;
-		}
-	}
-
-	for (k = 0; k < ARRAY_SIZE(freq_list); k++) {
-		u32 const clks_pll_div = 2, core_clk_div = 5;
-		u32 const rng1 = 16, rng2 = 8;
-		u32 th1, th2;
-		u64 core_clk, rvar1, rem;
-
-		core_clk = div_u64(freq_list[k],
-				   ratio_list[k / sz_band] * clks_pll_div *
-				   core_clk_div);
-
-		rvar1 = HDMI_REF_CLOCK_HZ * rng1 * HDMI_MHZ_TO_HZ;
-		rvar1 = div64_u64_rem(rvar1, (cmp_cnt * core_clk), &rem);
-		if (rem > ((cmp_cnt * core_clk) >> 1))
-			rvar1++;
-		th1 = rvar1;
-
-		rvar1 = HDMI_REF_CLOCK_HZ * rng2 * HDMI_MHZ_TO_HZ;
-		rvar1 = div64_u64_rem(rvar1, (cmp_cnt * core_clk), &rem);
-		if (rem > ((cmp_cnt * core_clk) >> 1))
-			rvar1++;
-		th2 = rvar1;
-
-		if (freq_list[k] >= min_freq &&
-				freq_list[k] <= max_freq) {
-			if ((th1 >= th_min && th1 <= th_max) ||
-					(th2 >= th_min && th2 <= th_max)) {
-				if (freq_list[k] <= freq_optimal) {
-					freq_optimal = freq_list[k];
-					optimal_index = k;
-				}
-			}
-		}
-	}
-
-	if (optimal_index == -1) {
-		if (!half_rate_mode) {
-			half_rate_mode = 1;
-			goto find_optimal_index;
-		} else {
-			return -EINVAL;
-		}
-	} else {
-		found_vco_ratio = ratio_list[optimal_index / sz_band];
-		found_tx_band_sel = band_list[optimal_index % sz_band];
-		found_vco_freq = freq_optimal;
-	}
-
-	switch (found_vco_ratio) {
-	case 1:
-		found_hsclk_divsel = 15;
-		break;
-	case 2:
-		found_hsclk_divsel = 0;
-		break;
-	case 3:
-		found_hsclk_divsel = 4;
-		break;
-	case 4:
-		found_hsclk_divsel = 8;
-		break;
-	case 5:
-		found_hsclk_divsel = 12;
-		break;
-	case 6:
-		found_hsclk_divsel = 1;
-		break;
-	case 9:
-		found_hsclk_divsel = 5;
-		break;
-	case 10:
-		found_hsclk_divsel = 2;
-		break;
-	case 12:
-		found_hsclk_divsel = 9;
-		break;
-	case 15:
-		found_hsclk_divsel = 13;
-		break;
-	case 25:
-		found_hsclk_divsel = 14;
-		break;
-	}
-
-	pd->vco_freq = found_vco_freq;
-	pd->tx_band_sel = found_tx_band_sel;
-	pd->vco_ratio = found_vco_ratio;
-	pd->hsclk_divsel = found_hsclk_divsel;
-
-	return 0;
-}
-
-static int pll_calculate(unsigned long pix_clk, unsigned long ref_clk,
-			 struct hdmi_8998_phy_pll_reg_cfg *cfg)
-{
-	struct hdmi_8998_post_divider pd;
-	u64 bclk;
-	u64 dec_start;
-	u64 frac_start;
-	u64 fdata;
-	u32 pll_divisor;
-	u32 rem;
-	u32 cpctrl;
-	u32 rctrl;
-	u32 cctrl;
-	u32 integloop_gain;
-	u32 pll_cmp;
-	int i, ret;
-
-	/* bit clk = 10 * pix_clk */
-	bclk = ((u64)pix_clk) * 10;
-
-	ret = pll_get_post_div(&pd, bclk);
-	if (ret)
-		return ret;
-
-	dec_start = pd.vco_freq;
-	pll_divisor = 4 * ref_clk;
-	do_div(dec_start, pll_divisor);
-
-	frac_start = pd.vco_freq * (1 << 20);
-
-	rem = do_div(frac_start, pll_divisor);
-	frac_start -= dec_start * (1 << 20);
-	if (rem > (pll_divisor >> 1))
-		frac_start++;
-
-	cpctrl = pll_get_cpctrl(frac_start, ref_clk, false);
-	rctrl = pll_get_rctrl(frac_start, false);
-	cctrl = pll_get_cctrl(frac_start, false);
-	integloop_gain = pll_get_integloop_gain(frac_start, bclk,
-						ref_clk, false);
-
-	fdata = pd.vco_freq;
-	do_div(fdata, pd.vco_ratio);
-
-	pll_cmp = pll_get_pll_cmp(fdata, ref_clk);
-
-	/* Convert these values to register specific values */
-	if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD)
-		cfg->com_svs_mode_clk_sel = 1;
-	else
-		cfg->com_svs_mode_clk_sel = 2;
-
-	cfg->com_hsclk_sel = (0x20 | pd.hsclk_divsel);
-	cfg->com_pll_cctrl_mode0 = cctrl;
-	cfg->com_pll_rctrl_mode0 = rctrl;
-	cfg->com_cp_ctrl_mode0 = cpctrl;
-	cfg->com_dec_start_mode0 = dec_start;
-	cfg->com_div_frac_start1_mode0 = (frac_start & 0xff);
-	cfg->com_div_frac_start2_mode0 = ((frac_start & 0xff00) >> 8);
-	cfg->com_div_frac_start3_mode0 = ((frac_start & 0xf0000) >> 16);
-	cfg->com_integloop_gain0_mode0 = (integloop_gain & 0xff);
-	cfg->com_integloop_gain1_mode0 = ((integloop_gain & 0xf00) >> 8);
-	cfg->com_lock_cmp1_mode0 = (pll_cmp & 0xff);
-	cfg->com_lock_cmp2_mode0 = ((pll_cmp & 0xff00) >> 8);
-	cfg->com_lock_cmp3_mode0 = ((pll_cmp & 0x30000) >> 16);
-	cfg->com_lock_cmp_en = 0x0;
-	cfg->com_core_clk_en = 0x2c;
-	cfg->com_coreclk_div_mode0 = HDMI_CORECLK_DIV;
-	cfg->phy_mode = (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) ? 0x5 : 0x4;
-
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
-		cfg->tx_lx_tx_band[i] = pd.tx_band_sel;
-
-	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) {
-		cfg->tx_lx_tx_drv_lvl[0] = 0x0f;
-		cfg->tx_lx_tx_drv_lvl[1] = 0x0f;
-		cfg->tx_lx_tx_drv_lvl[2] = 0x0f;
-		cfg->tx_lx_tx_drv_lvl[3] = 0x0f;
-		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x03;
-		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x02;
-		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x03;
-		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
-		cfg->tx_lx_pre_driver_1[0] = 0x00;
-		cfg->tx_lx_pre_driver_1[1] = 0x00;
-		cfg->tx_lx_pre_driver_1[2] = 0x00;
-		cfg->tx_lx_pre_driver_1[3] = 0x00;
-		cfg->tx_lx_pre_driver_2[0] = 0x1C;
-		cfg->tx_lx_pre_driver_2[1] = 0x1C;
-		cfg->tx_lx_pre_driver_2[2] = 0x1C;
-		cfg->tx_lx_pre_driver_2[3] = 0x00;
-		cfg->tx_lx_res_code_offset[0] = 0x03;
-		cfg->tx_lx_res_code_offset[1] = 0x00;
-		cfg->tx_lx_res_code_offset[2] = 0x00;
-		cfg->tx_lx_res_code_offset[3] = 0x03;
-	} else if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD) {
-		cfg->tx_lx_tx_drv_lvl[0] = 0x0f;
-		cfg->tx_lx_tx_drv_lvl[1] = 0x0f;
-		cfg->tx_lx_tx_drv_lvl[2] = 0x0f;
-		cfg->tx_lx_tx_drv_lvl[3] = 0x0f;
-		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x03;
-		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x03;
-		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x03;
-		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
-		cfg->tx_lx_pre_driver_1[0] = 0x00;
-		cfg->tx_lx_pre_driver_1[1] = 0x00;
-		cfg->tx_lx_pre_driver_1[2] = 0x00;
-		cfg->tx_lx_pre_driver_1[3] = 0x00;
-		cfg->tx_lx_pre_driver_2[0] = 0x16;
-		cfg->tx_lx_pre_driver_2[1] = 0x16;
-		cfg->tx_lx_pre_driver_2[2] = 0x16;
-		cfg->tx_lx_pre_driver_2[3] = 0x18;
-		cfg->tx_lx_res_code_offset[0] = 0x03;
-		cfg->tx_lx_res_code_offset[1] = 0x00;
-		cfg->tx_lx_res_code_offset[2] = 0x00;
-		cfg->tx_lx_res_code_offset[3] = 0x00;
-	} else if (bclk > HDMI_MID_FREQ_BIT_CLK_THRESHOLD) {
-		cfg->tx_lx_tx_drv_lvl[0] = 0x0f;
-		cfg->tx_lx_tx_drv_lvl[1] = 0x0f;
-		cfg->tx_lx_tx_drv_lvl[2] = 0x0f;
-		cfg->tx_lx_tx_drv_lvl[3] = 0x0f;
-		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x05;
-		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x05;
-		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x05;
-		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
-		cfg->tx_lx_pre_driver_1[0] = 0x00;
-		cfg->tx_lx_pre_driver_1[1] = 0x00;
-		cfg->tx_lx_pre_driver_1[2] = 0x00;
-		cfg->tx_lx_pre_driver_1[3] = 0x00;
-		cfg->tx_lx_pre_driver_2[0] = 0x0E;
-		cfg->tx_lx_pre_driver_2[1] = 0x0E;
-		cfg->tx_lx_pre_driver_2[2] = 0x0E;
-		cfg->tx_lx_pre_driver_2[3] = 0x0E;
-		cfg->tx_lx_res_code_offset[0] = 0x00;
-		cfg->tx_lx_res_code_offset[1] = 0x00;
-		cfg->tx_lx_res_code_offset[2] = 0x00;
-		cfg->tx_lx_res_code_offset[3] = 0x00;
-	} else {
-		cfg->tx_lx_tx_drv_lvl[0] = 0x01;
-		cfg->tx_lx_tx_drv_lvl[1] = 0x01;
-		cfg->tx_lx_tx_drv_lvl[2] = 0x01;
-		cfg->tx_lx_tx_drv_lvl[3] = 0x00;
-		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x00;
-		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x00;
-		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x00;
-		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
-		cfg->tx_lx_pre_driver_1[0] = 0x00;
-		cfg->tx_lx_pre_driver_1[1] = 0x00;
-		cfg->tx_lx_pre_driver_1[2] = 0x00;
-		cfg->tx_lx_pre_driver_1[3] = 0x00;
-		cfg->tx_lx_pre_driver_2[0] = 0x16;
-		cfg->tx_lx_pre_driver_2[1] = 0x16;
-		cfg->tx_lx_pre_driver_2[2] = 0x16;
-		cfg->tx_lx_pre_driver_2[3] = 0x18;
-		cfg->tx_lx_res_code_offset[0] = 0x00;
-		cfg->tx_lx_res_code_offset[1] = 0x00;
-		cfg->tx_lx_res_code_offset[2] = 0x00;
-		cfg->tx_lx_res_code_offset[3] = 0x00;
-	}
-
-	return 0;
-}
-
-static int hdmi_8998_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long parent_rate)
-{
-	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
-	struct hdmi_phy *phy = pll_get_phy(pll);
-	struct hdmi_8998_phy_pll_reg_cfg cfg = {};
-	int i, ret;
-
-	ret = pll_calculate(rate, parent_rate, &cfg);
-	if (ret) {
-		DRM_ERROR("PLL calculation failed\n");
-		return ret;
-	}
-
-	/* Initially shut down PHY */
-	hdmi_phy_write(phy, REG_HDMI_8998_PHY_PD_CTL, 0x0);
-	udelay(500);
-
-	/* Power up sequence */
-	hdmi_phy_write(phy, REG_HDMI_8998_PHY_PD_CTL, 0x1);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL, 0x20);
-	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CMN_CTRL, 0x6);
-
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_8998_PHY_TXn_INTERFACE_SELECT_TX_BAND,
-				   cfg.tx_lx_tx_band[i]);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_8998_PHY_TXn_CLKBUF_TERM_ENABLE,
-				   0x1);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_8998_PHY_TXn_LANE_MODE,
-				   0x20);
-	}
-
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE, 0x02);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x0B);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_EN_SEL, 0x37);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SYS_CLK_CTRL, 0x02);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CLK_ENABLE1, 0x0E);
-
-	/* Bypass VCO calibration */
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SVS_MODE_CLK_SEL,
-		       cfg.com_svs_mode_clk_sel);
-
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_PLL_IVCO, 0x07);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_CTRL, 0x00);
-
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CLK_SEL, 0x30);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_HSCLK_SEL,
-		       cfg.com_hsclk_sel);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_EN,
-		       cfg.com_lock_cmp_en);
-
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE0,
-		       cfg.com_pll_cctrl_mode0);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE0,
-		       cfg.com_pll_rctrl_mode0);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE0,
-		       cfg.com_cp_ctrl_mode0);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE0,
-		       cfg.com_dec_start_mode0);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE0,
-		       cfg.com_div_frac_start1_mode0);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE0,
-		       cfg.com_div_frac_start2_mode0);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE0,
-		       cfg.com_div_frac_start3_mode0);
-
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE0,
-		       cfg.com_integloop_gain0_mode0);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE0,
-		       cfg.com_integloop_gain1_mode0);
-
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP1_MODE0,
-		       cfg.com_lock_cmp1_mode0);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP2_MODE0,
-		       cfg.com_lock_cmp2_mode0);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP3_MODE0,
-		       cfg.com_lock_cmp3_mode0);
-
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_MAP, 0x00);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CORE_CLK_EN,
-		       cfg.com_core_clk_en);
-	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CORECLK_DIV_MODE0,
-		       cfg.com_coreclk_div_mode0);
-
-	/* TX lanes setup (TX 0/1/2/3) */
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_8998_PHY_TXn_DRV_LVL,
-				   cfg.tx_lx_tx_drv_lvl[i]);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL,
-				   cfg.tx_lx_tx_emp_post1_lvl[i]);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1,
-				   cfg.tx_lx_pre_driver_1[i]);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2,
-				   cfg.tx_lx_pre_driver_2[i]);
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET,
-				   cfg.tx_lx_res_code_offset[i]);
-	}
-
-	hdmi_phy_write(phy, REG_HDMI_8998_PHY_MODE, cfg.phy_mode);
-
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_8998_PHY_TXn_LANE_CONFIG,
-				   0x10);
-	}
-
-	/*
-	 * Ensure that vco configuration gets flushed to hardware before
-	 * enabling the PLL
-	 */
-	wmb();
-
-	pll->rate = rate;
-
-	return 0;
-}
-
-static int hdmi_8998_phy_ready_status(struct hdmi_phy *phy)
-{
-	u32 nb_tries = HDMI_PLL_POLL_MAX_READS;
-	unsigned long timeout = HDMI_PLL_POLL_TIMEOUT_US;
-	u32 status;
-	int phy_ready = 0;
-
-	while (nb_tries--) {
-		status = hdmi_phy_read(phy, REG_HDMI_8998_PHY_STATUS);
-		phy_ready = status & BIT(0);
-
-		if (phy_ready)
-			break;
-
-		udelay(timeout);
-	}
-
-	return phy_ready;
-}
-
-static int hdmi_8998_pll_lock_status(struct hdmi_pll_8998 *pll)
-{
-	u32 status;
-	int nb_tries = HDMI_PLL_POLL_MAX_READS;
-	unsigned long timeout = HDMI_PLL_POLL_TIMEOUT_US;
-	int pll_locked = 0;
-
-	while (nb_tries--) {
-		status = hdmi_pll_read(pll,
-				       REG_HDMI_8998_PHY_QSERDES_COM_C_READY_STATUS);
-		pll_locked = status & BIT(0);
-
-		if (pll_locked)
-			break;
-
-		udelay(timeout);
-	}
-
-	return pll_locked;
-}
-
-static int hdmi_8998_pll_prepare(struct clk_hw *hw)
-{
-	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
-	struct hdmi_phy *phy = pll_get_phy(pll);
-	int i, ret = 0;
-
-	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x1);
-	udelay(100);
-
-	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x59);
-	udelay(100);
-
-	ret = hdmi_8998_pll_lock_status(pll);
-	if (!ret)
-		return ret;
-
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-		hdmi_tx_chan_write(pll, i,
-				   REG_HDMI_8998_PHY_TXn_LANE_CONFIG, 0x1F);
-	}
-
-	/* Ensure all registers are flushed to hardware */
-	wmb();
-
-	ret = hdmi_8998_phy_ready_status(phy);
-	if (!ret)
-		return ret;
-
-	/* Restart the retiming buffer */
-	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x58);
-	udelay(1);
-	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x59);
-
-	/* Ensure all registers are flushed to hardware */
-	wmb();
-
-	return 0;
-}
-
-static long hdmi_8998_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
-{
-	if (rate < HDMI_PCLK_MIN_FREQ)
-		return HDMI_PCLK_MIN_FREQ;
-	else if (rate > HDMI_PCLK_MAX_FREQ)
-		return HDMI_PCLK_MAX_FREQ;
-	else
-		return rate;
-}
-
-static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
-					       unsigned long parent_rate)
-{
-	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
-	return pll->rate;
-}
-
-static void hdmi_8998_pll_unprepare(struct clk_hw *hw)
-{
-	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
-	struct hdmi_phy *phy = pll_get_phy(pll);
-
-	hdmi_phy_write(phy, REG_HDMI_8998_PHY_PD_CTL, 0);
-	usleep_range(100, 150);
-}
-
-static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
-{
-	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
-	u32 status;
-	int pll_locked;
-
-	status = hdmi_pll_read(pll, REG_HDMI_8998_PHY_QSERDES_COM_C_READY_STATUS);
-	pll_locked = status & BIT(0);
-
-	return pll_locked;
-}
-
-static const struct clk_ops hdmi_8998_pll_ops = {
-	.set_rate = hdmi_8998_pll_set_clk_rate,
-	.round_rate = hdmi_8998_pll_round_rate,
-	.recalc_rate = hdmi_8998_pll_recalc_rate,
-	.prepare = hdmi_8998_pll_prepare,
-	.unprepare = hdmi_8998_pll_unprepare,
-	.is_enabled = hdmi_8998_pll_is_enabled,
-};
-
-static const struct clk_init_data pll_init = {
-	.name = "hdmipll",
-	.ops = &hdmi_8998_pll_ops,
-	.parent_data = (const struct clk_parent_data[]){
-		{ .fw_name = "xo", .name = "xo_board" },
-	},
-	.num_parents = 1,
-	.flags = CLK_IGNORE_UNUSED,
-};
-
-int msm_hdmi_pll_8998_init(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct hdmi_pll_8998 *pll;
-	int ret, i;
-
-	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
-	if (!pll)
-		return -ENOMEM;
-
-	pll->pdev = pdev;
-
-	pll->mmio_qserdes_com = msm_ioremap(pdev, "hdmi_pll");
-	if (IS_ERR(pll->mmio_qserdes_com)) {
-		DRM_DEV_ERROR(dev, "failed to map pll base\n");
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-		char name[32];
-
-		snprintf(name, sizeof(name), "hdmi_tx_l%d", i);
-
-		pll->mmio_qserdes_tx[i] = msm_ioremap(pdev, name);
-		if (IS_ERR(pll->mmio_qserdes_tx[i])) {
-			DRM_DEV_ERROR(dev, "failed to map pll base\n");
-			return -ENOMEM;
-		}
-	}
-	pll->clk_hw.init = &pll_init;
-
-	ret = devm_clk_hw_register(dev, &pll->clk_hw);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
-		return ret;
-	}
-
-	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static const char * const hdmi_phy_8998_reg_names[] = {
-	"vddio",
-	"vcca",
-};
-
-static const char * const hdmi_phy_8998_clk_names[] = {
-	"iface", "ref", "xo",
-};
-
-const struct hdmi_phy_cfg msm_hdmi_phy_8998_cfg = {
-	.type = MSM_HDMI_PHY_8998,
-	.reg_names = hdmi_phy_8998_reg_names,
-	.num_regs = ARRAY_SIZE(hdmi_phy_8998_reg_names),
-	.clk_names = hdmi_phy_8998_clk_names,
-	.num_clks = ARRAY_SIZE(hdmi_phy_8998_clk_names),
-};
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
deleted file mode 100644
index 1d97640d8c24aa62f5f80e58ca6408f51fbfe38f..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
+++ /dev/null
@@ -1,141 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2013 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#include <linux/delay.h>
-
-#include "hdmi.h"
-
-static void hdmi_phy_8x60_powerup(struct hdmi_phy *phy,
-		unsigned long int pixclock)
-{
-	/* De-serializer delay D/C for non-lbk mode: */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG0,
-		       HDMI_8x60_PHY_REG0_DESER_DEL_CTRL(3));
-
-	if (pixclock == 27000000) {
-		/* video_format == HDMI_VFRMT_720x480p60_16_9 */
-		hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG1,
-			       HDMI_8x60_PHY_REG1_DTEST_MUX_SEL(5) |
-			       HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL(3));
-	} else {
-		hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG1,
-			       HDMI_8x60_PHY_REG1_DTEST_MUX_SEL(5) |
-			       HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL(4));
-	}
-
-	/* No matter what, start from the power down mode: */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG2,
-		       HDMI_8x60_PHY_REG2_PD_PWRGEN |
-		       HDMI_8x60_PHY_REG2_PD_PLL |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
-		       HDMI_8x60_PHY_REG2_PD_DESER);
-
-	/* Turn PowerGen on: */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG2,
-		       HDMI_8x60_PHY_REG2_PD_PLL |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
-		       HDMI_8x60_PHY_REG2_PD_DESER);
-
-	/* Turn PLL power on: */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG2,
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
-		       HDMI_8x60_PHY_REG2_PD_DESER);
-
-	/* Write to HIGH after PLL power down de-assert: */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG3,
-		       HDMI_8x60_PHY_REG3_PLL_ENABLE);
-
-	/* ASIC power on; PHY REG9 = 0 */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG9, 0);
-
-	/* Enable PLL lock detect, PLL lock det will go high after lock
-	 * Enable the re-time logic
-	 */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG12,
-		       HDMI_8x60_PHY_REG12_RETIMING_EN |
-		       HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN);
-
-	/* Drivers are on: */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG2,
-		       HDMI_8x60_PHY_REG2_PD_DESER);
-
-	/* If the RX detector is needed: */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG2,
-		       HDMI_8x60_PHY_REG2_RCV_SENSE_EN |
-		       HDMI_8x60_PHY_REG2_PD_DESER);
-
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG4, 0);
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG5, 0);
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG6, 0);
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG7, 0);
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG8, 0);
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG9, 0);
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG10, 0);
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG11, 0);
-
-	/* If we want to use lock enable based on counting: */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG12,
-		       HDMI_8x60_PHY_REG12_RETIMING_EN |
-		       HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN |
-		       HDMI_8x60_PHY_REG12_FORCE_LOCK);
-}
-
-static void hdmi_phy_8x60_powerdown(struct hdmi_phy *phy)
-{
-	/* Assert RESET PHY from controller */
-	hdmi_phy_write(phy, REG_HDMI_PHY_CTRL,
-		       HDMI_PHY_CTRL_SW_RESET);
-	udelay(10);
-	/* De-assert RESET PHY from controller */
-	hdmi_phy_write(phy, REG_HDMI_PHY_CTRL, 0);
-	/* Turn off Driver */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG2,
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
-		       HDMI_8x60_PHY_REG2_PD_DESER);
-	udelay(10);
-	/* Disable PLL */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG3, 0);
-	/* Power down PHY, but keep RX-sense: */
-	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG2,
-		       HDMI_8x60_PHY_REG2_RCV_SENSE_EN |
-		       HDMI_8x60_PHY_REG2_PD_PWRGEN |
-		       HDMI_8x60_PHY_REG2_PD_PLL |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
-		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
-		       HDMI_8x60_PHY_REG2_PD_DESER);
-}
-
-static const char * const hdmi_phy_8x60_reg_names[] = {
-	"core-vdda",
-};
-
-static const char * const hdmi_phy_8x60_clk_names[] = {
-	"slave_iface",
-};
-
-const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg = {
-	.type = MSM_HDMI_PHY_8x60,
-	.powerup = hdmi_phy_8x60_powerup,
-	.powerdown = hdmi_phy_8x60_powerdown,
-	.reg_names = hdmi_phy_8x60_reg_names,
-	.num_regs = ARRAY_SIZE(hdmi_phy_8x60_reg_names),
-	.clk_names = hdmi_phy_8x60_clk_names,
-	.num_clks = ARRAY_SIZE(hdmi_phy_8x60_clk_names),
-};
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c
deleted file mode 100644
index a2a6940e195a0788a3d84de0171565510ef60623..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c
+++ /dev/null
@@ -1,44 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2013 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#include "hdmi.h"
-
-static void hdmi_phy_8x74_powerup(struct hdmi_phy *phy,
-		unsigned long int pixclock)
-{
-	hdmi_phy_write(phy, REG_HDMI_8x74_ANA_CFG0,   0x1b);
-	hdmi_phy_write(phy, REG_HDMI_8x74_ANA_CFG1,   0xf2);
-	hdmi_phy_write(phy, REG_HDMI_8x74_BIST_CFG0,  0x0);
-	hdmi_phy_write(phy, REG_HDMI_8x74_BIST_PATN0, 0x0);
-	hdmi_phy_write(phy, REG_HDMI_8x74_BIST_PATN1, 0x0);
-	hdmi_phy_write(phy, REG_HDMI_8x74_BIST_PATN2, 0x0);
-	hdmi_phy_write(phy, REG_HDMI_8x74_BIST_PATN3, 0x0);
-	hdmi_phy_write(phy, REG_HDMI_8x74_PD_CTRL1,   0x20);
-}
-
-static void hdmi_phy_8x74_powerdown(struct hdmi_phy *phy)
-{
-	hdmi_phy_write(phy, REG_HDMI_8x74_PD_CTRL0, 0x7f);
-}
-
-static const char * const hdmi_phy_8x74_reg_names[] = {
-	"core-vdda",
-	"vddio",
-};
-
-static const char * const hdmi_phy_8x74_clk_names[] = {
-	"iface", "alt_iface"
-};
-
-const struct hdmi_phy_cfg msm_hdmi_phy_8x74_cfg = {
-	.type = MSM_HDMI_PHY_8x74,
-	.powerup = hdmi_phy_8x74_powerup,
-	.powerdown = hdmi_phy_8x74_powerdown,
-	.reg_names = hdmi_phy_8x74_reg_names,
-	.num_regs = ARRAY_SIZE(hdmi_phy_8x74_reg_names),
-	.clk_names = hdmi_phy_8x74_clk_names,
-	.num_clks = ARRAY_SIZE(hdmi_phy_8x74_clk_names),
-};
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
deleted file mode 100644
index 83c8781fcc3f6e1db99cfec64055ee5f359e49e5..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ /dev/null
@@ -1,458 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- * Copyright (C) 2013 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#include <linux/clk-provider.h>
-#include <linux/delay.h>
-
-#include "hdmi.h"
-
-struct hdmi_pll_8960 {
-	struct platform_device *pdev;
-	struct clk_hw clk_hw;
-	void __iomem *mmio;
-
-	unsigned long pixclk;
-};
-
-#define hw_clk_to_pll(x) container_of(x, struct hdmi_pll_8960, clk_hw)
-
-/*
- * HDMI PLL:
- *
- * To get the parent clock setup properly, we need to plug in hdmi pll
- * configuration into common-clock-framework.
- */
-
-struct pll_rate {
-	unsigned long rate;
-	int num_reg;
-	struct {
-		u32 val;
-		u32 reg;
-	} conf[32];
-};
-
-/* NOTE: keep sorted highest freq to lowest: */
-static const struct pll_rate freqtbl[] = {
-	{ 154000000, 14, {
-		{ 0x08, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x0d, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x4d, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x5e, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0x42, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-			}
-	},
-	/* 1080p60/1080p50 case */
-	{ 148500000, 27, {
-		{ 0x02, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
-		{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
-		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
-		{ 0x76, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-		{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
-		{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
-		{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
-		{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
-		{ 0xe6, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
-			}
-	},
-	{ 108000000, 13, {
-		{ 0x08, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x21, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x1c, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x49, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x49, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-			}
-	},
-	/* 720p60/720p50/1080i60/1080i50/1080p24/1080p30/1080p25 */
-	{ 74250000, 8, {
-		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
-		{ 0x12, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x76, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0xe6, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-			}
-	},
-	{ 74176000, 14, {
-		{ 0x18, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0xe5, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x0c, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x7d, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0xbc, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-			}
-	},
-	{ 65000000, 14, {
-		{ 0x18, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x8a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x0b, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x4b, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x7b, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0x09, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-			}
-	},
-	/* 480p60/480i60 */
-	{ 27030000, 18, {
-		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
-		{ 0x38, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
-		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0xff, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x4e, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0xd7, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0x03, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-		{ 0x2a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
-			}
-	},
-	/* 576p50/576i50 */
-	{ 27000000, 27, {
-		{ 0x32, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
-		{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
-		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
-		{ 0x7b, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-		{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
-		{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
-		{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
-		{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
-		{ 0x2a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
-			}
-	},
-	/* 640x480p60 */
-	{ 25200000, 27, {
-		{ 0x32, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
-		{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
-		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
-		{ 0x77, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-		{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
-		{ 0x20, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
-		{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
-		{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
-		{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
-		{ 0xf4, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
-			}
-	},
-};
-
-static inline void pll_write(struct hdmi_pll_8960 *pll, u32 reg, u32 data)
-{
-	writel(data, pll->mmio + reg);
-}
-
-static inline u32 pll_read(struct hdmi_pll_8960 *pll, u32 reg)
-{
-	return readl(pll->mmio + reg);
-}
-
-static inline struct hdmi_phy *pll_get_phy(struct hdmi_pll_8960 *pll)
-{
-	return platform_get_drvdata(pll->pdev);
-}
-
-static int hdmi_pll_enable(struct clk_hw *hw)
-{
-	struct hdmi_pll_8960 *pll = hw_clk_to_pll(hw);
-	struct hdmi_phy *phy = pll_get_phy(pll);
-	int timeout_count, pll_lock_retry = 10;
-	unsigned int val;
-
-	DBG("");
-
-	/* Assert PLL S/W reset */
-	pll_write(pll, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x8d);
-	pll_write(pll, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0, 0x10);
-	pll_write(pll, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1, 0x1a);
-
-	/* Wait for a short time before de-asserting
-	 * to allow the hardware to complete its job.
-	 * This much of delay should be fine for hardware
-	 * to assert and de-assert.
-	 */
-	udelay(10);
-
-	/* De-assert PLL S/W reset */
-	pll_write(pll, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x0d);
-
-	val = hdmi_phy_read(phy, REG_HDMI_8960_PHY_REG12);
-	val |= HDMI_8960_PHY_REG12_SW_RESET;
-	/* Assert PHY S/W reset */
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
-	val &= ~HDMI_8960_PHY_REG12_SW_RESET;
-	/*
-	 * Wait for a short time before de-asserting to allow the hardware to
-	 * complete its job. This much of delay should be fine for hardware to
-	 * assert and de-assert.
-	 */
-	udelay(10);
-	/* De-assert PHY S/W reset */
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG2,  0x3f);
-
-	val = hdmi_phy_read(phy, REG_HDMI_8960_PHY_REG12);
-	val |= HDMI_8960_PHY_REG12_PWRDN_B;
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
-	/* Wait 10 us for enabling global power for PHY */
-	mb();
-	udelay(10);
-
-	val = pll_read(pll, REG_HDMI_8960_PHY_PLL_PWRDN_B);
-	val |= HDMI_8960_PHY_PLL_PWRDN_B_PLL_PWRDN_B;
-	val &= ~HDMI_8960_PHY_PLL_PWRDN_B_PD_PLL;
-	pll_write(pll, REG_HDMI_8960_PHY_PLL_PWRDN_B, val);
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG2, 0x80);
-
-	timeout_count = 1000;
-	while (--pll_lock_retry > 0) {
-		/* are we there yet? */
-		val = pll_read(pll, REG_HDMI_8960_PHY_PLL_STATUS0);
-		if (val & HDMI_8960_PHY_PLL_STATUS0_PLL_LOCK)
-			break;
-
-		udelay(1);
-
-		if (--timeout_count > 0)
-			continue;
-
-		/*
-		 * PLL has still not locked.
-		 * Do a software reset and try again
-		 * Assert PLL S/W reset first
-		 */
-		pll_write(pll, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x8d);
-		udelay(10);
-		pll_write(pll, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x0d);
-
-		/*
-		 * Wait for a short duration for the PLL calibration
-		 * before checking if the PLL gets locked
-		 */
-		udelay(350);
-
-		timeout_count = 1000;
-	}
-
-	return 0;
-}
-
-static void hdmi_pll_disable(struct clk_hw *hw)
-{
-	struct hdmi_pll_8960 *pll = hw_clk_to_pll(hw);
-	struct hdmi_phy *phy = pll_get_phy(pll);
-	unsigned int val;
-
-	DBG("");
-
-	val = hdmi_phy_read(phy, REG_HDMI_8960_PHY_REG12);
-	val &= ~HDMI_8960_PHY_REG12_PWRDN_B;
-	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
-
-	val = pll_read(pll, REG_HDMI_8960_PHY_PLL_PWRDN_B);
-	val |= HDMI_8960_PHY_REG12_SW_RESET;
-	val &= ~HDMI_8960_PHY_REG12_PWRDN_B;
-	pll_write(pll, REG_HDMI_8960_PHY_PLL_PWRDN_B, val);
-	/* Make sure HDMI PHY/PLL are powered down */
-	mb();
-}
-
-static const struct pll_rate *find_rate(unsigned long rate)
-{
-	int i;
-
-	for (i = 1; i < ARRAY_SIZE(freqtbl); i++)
-		if (rate > freqtbl[i].rate)
-			return &freqtbl[i - 1];
-
-	return &freqtbl[i - 1];
-}
-
-static unsigned long hdmi_pll_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
-{
-	struct hdmi_pll_8960 *pll = hw_clk_to_pll(hw);
-
-	return pll->pixclk;
-}
-
-static long hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
-{
-	const struct pll_rate *pll_rate = find_rate(rate);
-
-	return pll_rate->rate;
-}
-
-static int hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
-			     unsigned long parent_rate)
-{
-	struct hdmi_pll_8960 *pll = hw_clk_to_pll(hw);
-	const struct pll_rate *pll_rate = find_rate(rate);
-	int i;
-
-	DBG("rate=%lu", rate);
-
-	for (i = 0; i < pll_rate->num_reg; i++)
-		pll_write(pll, pll_rate->conf[i].reg, pll_rate->conf[i].val);
-
-	pll->pixclk = rate;
-
-	return 0;
-}
-
-static const struct clk_ops hdmi_pll_ops = {
-	.enable = hdmi_pll_enable,
-	.disable = hdmi_pll_disable,
-	.recalc_rate = hdmi_pll_recalc_rate,
-	.round_rate = hdmi_pll_round_rate,
-	.set_rate = hdmi_pll_set_rate,
-};
-
-static const struct clk_parent_data hdmi_pll_parents[] = {
-	{ .fw_name = "pxo", .name = "pxo_board" },
-};
-
-static struct clk_init_data pll_init = {
-	.name = "hdmi_pll",
-	.ops = &hdmi_pll_ops,
-	.parent_data = hdmi_pll_parents,
-	.num_parents = ARRAY_SIZE(hdmi_pll_parents),
-	.flags = CLK_IGNORE_UNUSED,
-};
-
-int msm_hdmi_pll_8960_init(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct hdmi_pll_8960 *pll;
-	int i, ret;
-
-	/* sanity check: */
-	for (i = 0; i < (ARRAY_SIZE(freqtbl) - 1); i++)
-		if (WARN_ON(freqtbl[i].rate < freqtbl[i + 1].rate))
-			return -EINVAL;
-
-	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
-	if (!pll)
-		return -ENOMEM;
-
-	pll->mmio = msm_ioremap(pdev, "hdmi_pll");
-	if (IS_ERR(pll->mmio)) {
-		DRM_DEV_ERROR(dev, "failed to map pll base\n");
-		return -ENOMEM;
-	}
-
-	pll->pdev = pdev;
-	pll->clk_hw.init = &pll_init;
-
-	ret = devm_clk_hw_register(dev, &pll->clk_hw);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
-		return ret;
-	}
-
-	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
-		return ret;
-	}
-
-	return 0;
-}
diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index ef14f4e33973cff4103d8ea3b07cfd62d344e450..4e3636ee53efc5691307e7c21d1f5caf5d7d71ff 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -42,6 +42,20 @@ config PHY_QCOM_IPQ806X_SATA
 	depends on OF
 	select GENERIC_PHY
 
+config PHY_QCOM_HDMI
+	tristate "Qualcomm MSM8x60/MSM8960/MSM8974 HDMI PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
+	depends on COMMON_CLK
+	default DRM_MSM_HDMI && ARCH_QCOM && ARM
+	select GENERIC_PHY
+	help
+	  Enable this to support the Qualcomm HDMI PHY presend on 32-bit platforms:
+	  MSM8260, MSM8660, MSM8960, MSM8974, APQ8060, APQ8064, APQ8074 and APQ8084.
+
+	  Note, this driver is not used on MSM899x platforms, which use
+	  PHY_QCOM_QMP_HDMI instead.
+
 config PHY_QCOM_PCIE2
 	tristate "Qualcomm PCIe Gen2 PHY Driver"
 	depends on OF && COMMON_CLK && (ARCH_QCOM || COMPILE_TEST)
@@ -68,6 +82,13 @@ config PHY_QCOM_QMP_COMBO
 	  Enable this to support the QMP Combo PHY transceiver that is used
 	  with USB3 and DisplayPort controllers on Qualcomm chips.
 
+config PHY_QCOM_QMP_HDMI
+	tristate "Qualcomm QMP HDMI PHY Driver"
+	default PHY_QCOM_QMP && DRM_MSM_HDMI
+	help
+	  Enable this to support the QMP HDMI PHY transceiver that is used
+	  with HDMI output on Qualcomm MSM8996 chips.
+
 config PHY_QCOM_QMP_PCIE
 	tristate "Qualcomm QMP PCIe PHY Driver"
 	depends on PCI || COMPILE_TEST
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 3851e28a212d4a677a5b41805868f38b9ab49841..351b9ff5aa9dad74c454c461e883a83cd098e6fc 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -4,16 +4,30 @@ obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
 obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
+obj-$(CONFIG_PHY_QCOM_HDMI)		+= phy-qcom-hdmi.o
+
+phy-qcom-hdmi-y := \
+	phy-qcom-hdmi-preqmp.o \
+	phy-qcom-hdmi-28hpm.o \
+	phy-qcom-hdmi-28lpm.o \
+	phy-qcom-hdmi-45nm.o \
+
 obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 
 obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
+obj-$(CONFIG_PHY_QCOM_QMP_HDMI)		+= phy-qcom-qmp-hdmi.o
 obj-$(CONFIG_PHY_QCOM_QMP_PCIE)		+= phy-qcom-qmp-pcie.o
 obj-$(CONFIG_PHY_QCOM_QMP_PCIE_8996)	+= phy-qcom-qmp-pcie-msm8996.o
 obj-$(CONFIG_PHY_QCOM_QMP_UFS)		+= phy-qcom-qmp-ufs.o
 obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
 obj-$(CONFIG_PHY_QCOM_QMP_USB_LEGACY)	+= phy-qcom-qmp-usb-legacy.o
 
+phy-qcom-qmp-hdmi-y := \
+	phy-qcom-qmp-hdmi-base.o \
+	phy-qcom-qmp-hdmi-msm8996.o \
+	phy-qcom-qmp-hdmi-msm8998.o \
+
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
 obj-$(CONFIG_PHY_QCOM_EUSB2_REPEATER)	+= phy-qcom-eusb2-repeater.o
 obj-$(CONFIG_PHY_QCOM_UNIPHY_PCIE_28LP)	+= phy-qcom-uniphy-pcie-28lp.o
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
new file mode 100644
index 0000000000000000000000000000000000000000..db7fa2df1a369d3889daab922c21ed8b71d733be
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 Red Hat
+ * Copyright (c) 2023, Linaro Ltd.
+ * Copyright (c) 2025, Qualcomm Incorporated
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+
+#include "phy-qcom-hdmi-preqmp.h"
+
+#define REG_HDMI_8x74_ANA_CFG0					0x00000000
+#define REG_HDMI_8x74_ANA_CFG1					0x00000004
+#define REG_HDMI_8x74_ANA_CFG2					0x00000008
+#define REG_HDMI_8x74_ANA_CFG3					0x0000000c
+#define REG_HDMI_8x74_PD_CTRL0					0x00000010
+#define REG_HDMI_8x74_PD_CTRL1					0x00000014
+#define REG_HDMI_8x74_GLB_CFG					0x00000018
+#define REG_HDMI_8x74_DCC_CFG0					0x0000001c
+#define REG_HDMI_8x74_DCC_CFG1					0x00000020
+#define REG_HDMI_8x74_TXCAL_CFG0				0x00000024
+#define REG_HDMI_8x74_TXCAL_CFG1				0x00000028
+#define REG_HDMI_8x74_TXCAL_CFG2				0x0000002c
+#define REG_HDMI_8x74_TXCAL_CFG3				0x00000030
+#define REG_HDMI_8x74_BIST_CFG0					0x00000034
+#define REG_HDMI_8x74_BIST_PATN0				0x0000003c
+#define REG_HDMI_8x74_BIST_PATN1				0x00000040
+#define REG_HDMI_8x74_BIST_PATN2				0x00000044
+#define REG_HDMI_8x74_BIST_PATN3				0x00000048
+#define REG_HDMI_8x74_STATUS					0x0000005c
+
+static int qcom_hdmi_msm8974_phy_power_on(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG0,   0x1b);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG1,   0xf2);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_CFG0,  0x0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_PATN0, 0x0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_PATN1, 0x0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_PATN2, 0x0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_PATN3, 0x0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL1,   0x20);
+
+	return 0;
+}
+
+static int qcom_hdmi_msm8974_phy_power_off(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x7f);
+
+	return 0;
+}
+
+const struct clk_parent_data msm8974_hdmi_pll_parent = {
+	.fw_name = "xo", .name = "xo_board",
+};
+
+const struct qcom_hdmi_preqmp_cfg msm8974_hdmi_phy_cfg = {
+	.clk_names = { "iface", "alt_iface" },
+	.num_clks = 2,
+
+	.reg_names = { "vddio", "core-vdda" },
+	.reg_init_load = { 100000, 10000 },
+	.num_regs = 2,
+
+	.power_on = qcom_hdmi_msm8974_phy_power_on,
+	.power_off = qcom_hdmi_msm8974_phy_power_off,
+
+	.pll_parent = &msm8974_hdmi_pll_parent,
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
new file mode 100644
index 0000000000000000000000000000000000000000..61e29c65395cd0a92ace1ee37695ed449138aa41
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
@@ -0,0 +1,441 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 Red Hat
+ * Copyright (c) 2023, Linaro Ltd.
+ * Copyright (c) 2025, Qualcomm Incorporated
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+
+#include "phy-qcom-hdmi-preqmp.h"
+
+#define REG_HDMI_8960_PHY_REG0					0x00000000
+
+#define REG_HDMI_8960_PHY_REG1					0x00000004
+
+#define REG_HDMI_8960_PHY_REG2					0x00000008
+
+#define REG_HDMI_8960_PHY_REG3					0x0000000c
+
+#define REG_HDMI_8960_PHY_REG4					0x00000010
+
+#define REG_HDMI_8960_PHY_REG5					0x00000014
+
+#define REG_HDMI_8960_PHY_REG6					0x00000018
+
+#define REG_HDMI_8960_PHY_REG7					0x0000001c
+
+#define REG_HDMI_8960_PHY_REG8					0x00000020
+
+#define REG_HDMI_8960_PHY_REG9					0x00000024
+
+#define REG_HDMI_8960_PHY_REG10					0x00000028
+
+#define REG_HDMI_8960_PHY_REG11					0x0000002c
+
+#define REG_HDMI_8960_PHY_REG12					0x00000030
+#define HDMI_8960_PHY_REG12_SW_RESET				0x00000020
+#define HDMI_8960_PHY_REG12_PWRDN_B				0x00000080
+
+#define REG_HDMI_8960_PHY_REG_BIST_CFG				0x00000034
+
+#define REG_HDMI_8960_PHY_DEBUG_BUS_SEL				0x00000038
+
+#define REG_HDMI_8960_PHY_REG_MISC0				0x0000003c
+
+#define REG_HDMI_8960_PHY_REG13					0x00000040
+
+#define REG_HDMI_8960_PHY_REG14					0x00000044
+
+#define REG_HDMI_8960_PHY_REG15					0x00000048
+
+#define REG_HDMI_8960_PHY_PLL_REFCLK_CFG			0x00000000
+
+#define REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG			0x00000004
+
+#define REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0			0x00000008
+
+#define REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1			0x0000000c
+
+#define REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG			0x00000010
+
+#define REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG			0x00000014
+
+#define REG_HDMI_8960_PHY_PLL_PWRDN_B				0x00000018
+#define HDMI_8960_PHY_PLL_PWRDN_B_PD_PLL			0x00000002
+#define HDMI_8960_PHY_PLL_PWRDN_B_PLL_PWRDN_B			0x00000008
+
+#define REG_HDMI_8960_PHY_PLL_SDM_CFG0				0x0000001c
+
+#define REG_HDMI_8960_PHY_PLL_SDM_CFG1				0x00000020
+
+#define REG_HDMI_8960_PHY_PLL_SDM_CFG2				0x00000024
+
+#define REG_HDMI_8960_PHY_PLL_SDM_CFG3				0x00000028
+
+#define REG_HDMI_8960_PHY_PLL_SDM_CFG4				0x0000002c
+
+#define REG_HDMI_8960_PHY_PLL_SSC_CFG0				0x00000030
+
+#define REG_HDMI_8960_PHY_PLL_SSC_CFG1				0x00000034
+
+#define REG_HDMI_8960_PHY_PLL_SSC_CFG2				0x00000038
+
+#define REG_HDMI_8960_PHY_PLL_SSC_CFG3				0x0000003c
+
+#define REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0			0x00000040
+
+#define REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1			0x00000044
+
+#define REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2			0x00000048
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0			0x0000004c
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1			0x00000050
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2			0x00000054
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3			0x00000058
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4			0x0000005c
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5			0x00000060
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6			0x00000064
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7			0x00000068
+
+#define REG_HDMI_8960_PHY_PLL_DEBUG_SEL				0x0000006c
+
+#define REG_HDMI_8960_PHY_PLL_MISC0				0x00000070
+
+#define REG_HDMI_8960_PHY_PLL_MISC1				0x00000074
+
+#define REG_HDMI_8960_PHY_PLL_MISC2				0x00000078
+
+#define REG_HDMI_8960_PHY_PLL_MISC3				0x0000007c
+
+#define REG_HDMI_8960_PHY_PLL_MISC4				0x00000080
+
+#define REG_HDMI_8960_PHY_PLL_MISC5				0x00000084
+
+#define REG_HDMI_8960_PHY_PLL_MISC6				0x00000088
+
+#define REG_HDMI_8960_PHY_PLL_DEBUG_BUS0			0x0000008c
+
+#define REG_HDMI_8960_PHY_PLL_DEBUG_BUS1			0x00000090
+
+#define REG_HDMI_8960_PHY_PLL_DEBUG_BUS2			0x00000094
+
+#define REG_HDMI_8960_PHY_PLL_STATUS0				0x00000098
+#define HDMI_8960_PHY_PLL_STATUS0_PLL_LOCK			0x00000001
+
+#define REG_HDMI_8960_PHY_PLL_STATUS1				0x0000009c
+
+#define HDMI_8974_VCO_MAX_FREQ 1125000000UL
+#define HDMI_8974_VCO_MIN_FREQ 540000000UL
+
+#define HDMI_8974_COMMON_DIV 5
+
+static unsigned long qcom_28lpm_recalc(struct qcom_hdmi_preqmp_phy *hdmi_phy,
+				       unsigned long parent_rate)
+{
+	unsigned long rate;
+	u32 refclk_cfg;
+	u32 dc_offset;
+	u64 fraq_n;
+	u32 val;
+
+	refclk_cfg = hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_REFCLK_CFG);
+	if (refclk_cfg & BIT(1))
+		parent_rate /= 2;
+	if (refclk_cfg & BIT(3))
+		parent_rate *= 2;
+
+	val = hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG0);
+	if (val & 0x40) {
+		dc_offset = val & 0x3f;
+		fraq_n = 0;
+	} else {
+		dc_offset = hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG1) & 0x3f;
+		fraq_n = hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG2) |
+			(hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG3) << 8);
+	}
+
+	rate = (dc_offset + 1) * parent_rate;
+	rate += mult_frac(fraq_n, parent_rate, 0x10000);
+
+	return rate;
+}
+
+static int qcom_28lpm_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy, unsigned long parent_rate,
+			       unsigned long vco_freq, u32 div_idx)
+{
+	unsigned int pixclk = hdmi_phy->hdmi_opts.tmds_char_rate;
+	unsigned int int_ref_freq;
+	unsigned int div;
+	unsigned int dc_offset;
+	unsigned int sdm_freq_seed;
+	unsigned int val;
+	bool sdm_mode = false;
+	u32 refclk_cfg;
+	u32 lf_cfg0;
+	u32 lf_cfg1;
+
+	dev_dbg(hdmi_phy->dev, "rate=%u, div = %d, vco = %lu", pixclk, div, vco_freq);
+
+	if (vco_freq % (parent_rate / 2) == 0) {
+		refclk_cfg = 0x2;
+		int_ref_freq = parent_rate / 2;
+	} else {
+		refclk_cfg = 0x8;
+		int_ref_freq = parent_rate * 2;
+		sdm_mode = true;
+	}
+
+	dc_offset = vco_freq / int_ref_freq - 1;
+	sdm_freq_seed = vco_freq - (dc_offset + 1) * int_ref_freq;
+	sdm_freq_seed = mult_frac(sdm_freq_seed, 0x10000, int_ref_freq);
+
+	val = (div_idx << 4) | refclk_cfg;
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_REFCLK_CFG, val);
+
+	lf_cfg0 = dc_offset >= 30 ? 0 : (dc_offset >= 16 ? 0x10 : 0x20);
+	lf_cfg0 += sdm_mode ? 0 : 1;
+
+	/* XXX: 0xc3 instead of 0x33 for qcs404 */
+	lf_cfg1 = dc_offset >= 30 ? 0x33 : (dc_offset >= 16 ? 0xbb : 0xf9);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0, lf_cfg0);
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1, lf_cfg1);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG0,
+		       (sdm_mode ? 0 : 0x40) | dc_offset);
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG1,
+		       0x40 | dc_offset);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG2,
+		       sdm_freq_seed & 0xff);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG3,
+		       (sdm_freq_seed >> 8) & 0xff);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG4,
+		       sdm_freq_seed >> 16);
+
+	vco_freq /= 1000;
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0, vco_freq & 0xff);
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1, vco_freq >> 8);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2, 0x3b);
+
+	return 0;
+}
+
+static const unsigned int qcom_hdmi_8974_divs[] = {1, 2, 4, 6};
+
+static unsigned long qcom_hdmi_8960_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = hw_clk_to_phy(hw);
+	u32 div_idx = hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_REFCLK_CFG);
+	unsigned long rate = qcom_28lpm_recalc(hdmi_phy, parent_rate);
+
+	return rate / HDMI_8974_COMMON_DIV / qcom_hdmi_8974_divs[div_idx >> 4];
+}
+
+static long qcom_hdmi_8960_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long *parent_rate)
+{
+	return clamp(rate,
+		     HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV / 6,
+		     HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV / 1);
+}
+
+static const struct clk_ops qcom_hdmi_8960_pll_ops = {
+	.recalc_rate = qcom_hdmi_8960_pll_recalc_rate,
+	.round_rate = qcom_hdmi_8960_pll_round_rate,
+};
+
+static int qcom_hdmi_msm8960_phy_pll_enable(struct qcom_hdmi_preqmp_phy *phy)
+{
+	int pll_lock_retry = 10;
+	unsigned int val;
+	int ret;
+
+	/* Assert PLL S/W reset */
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x8d);
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0, 0x10);
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1, 0x1a);
+
+	/* Wait for a short time before de-asserting
+	 * to allow the hardware to complete its job.
+	 * This much of delay should be fine for hardware
+	 * to assert and de-assert.
+	 */
+	udelay(10);
+
+	/* De-assert PLL S/W reset */
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x0d);
+
+	val = hdmi_phy_read(phy, REG_HDMI_8960_PHY_REG12);
+	val |= HDMI_8960_PHY_REG12_SW_RESET;
+	/* Assert PHY S/W reset */
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
+	val &= ~HDMI_8960_PHY_REG12_SW_RESET;
+	/*
+	 * Wait for a short time before de-asserting to allow the hardware to
+	 * complete its job. This much of delay should be fine for hardware to
+	 * assert and de-assert.
+	 */
+	udelay(10);
+	/* De-assert PHY S/W reset */
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG2,  0x3f);
+
+	val = hdmi_phy_read(phy, REG_HDMI_8960_PHY_REG12);
+	val |= HDMI_8960_PHY_REG12_PWRDN_B;
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
+	/* Wait 10 us for enabling global power for PHY */
+	mb();
+	udelay(10);
+
+	val = hdmi_pll_read(phy, REG_HDMI_8960_PHY_PLL_PWRDN_B);
+	val |= HDMI_8960_PHY_PLL_PWRDN_B_PLL_PWRDN_B;
+	val &= ~HDMI_8960_PHY_PLL_PWRDN_B_PD_PLL;
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_PWRDN_B, val);
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG2, 0x80);
+
+	while (--pll_lock_retry > 0) {
+		ret = readl_poll_timeout(phy->pll_reg + REG_HDMI_8960_PHY_PLL_STATUS0,
+					 val, val & HDMI_8960_PHY_PLL_STATUS0_PLL_LOCK,
+					 1, 1000);
+		if (!ret)
+			break;
+
+		/*
+		 * PLL has still not locked.
+		 * Do a software reset and try again
+		 * Assert PLL S/W reset first
+		 */
+		hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x8d);
+		udelay(10);
+		hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x0d);
+
+		/*
+		 * Wait for a short duration for the PLL calibration
+		 * before checking if the PLL gets locked
+		 */
+		udelay(350);
+	}
+
+	return ret;
+}
+
+static int qcom_hdmi_msm8974_phy_find_div(unsigned long long pixclk)
+{
+	int i;
+	unsigned long long min_freq = HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV;
+
+	if (pixclk > HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV)
+		return -E2BIG;
+
+	for (i = 0; i < ARRAY_SIZE(qcom_hdmi_8974_divs); i++) {
+		if (pixclk >= min_freq / qcom_hdmi_8974_divs[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int qcom_hdmi_msm8960_phy_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	unsigned long long pixclk = hdmi_phy->hdmi_opts.tmds_char_rate;
+	/* XXX: 19.2 for qcs404 */
+	unsigned long parent_rate = 27000000;
+	unsigned long vco_freq;
+	int div_idx;
+	u32 div;
+
+	div_idx = qcom_hdmi_msm8974_phy_find_div(pixclk);
+	if (WARN_ON(div_idx < 0))
+		return div_idx;
+
+	div = qcom_hdmi_8974_divs[div_idx];
+	vco_freq = pixclk * HDMI_8974_COMMON_DIV * div;
+
+	return qcom_28lpm_set_rate(hdmi_phy, parent_rate, vco_freq, div_idx);
+}
+
+static void qcom_hdmi_msm8960_phy_pll_disable(struct qcom_hdmi_preqmp_phy *phy)
+{
+	unsigned int val;
+
+	val = hdmi_phy_read(phy, REG_HDMI_8960_PHY_REG12);
+	val &= ~HDMI_8960_PHY_REG12_PWRDN_B;
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
+
+	val = hdmi_pll_read(phy, REG_HDMI_8960_PHY_PLL_PWRDN_B);
+	val |= HDMI_8960_PHY_REG12_SW_RESET;
+	val &= ~HDMI_8960_PHY_REG12_PWRDN_B;
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_PWRDN_B, val);
+	/* Make sure HDMI PHY/PLL are powered down */
+	mb();
+}
+
+static int qcom_hdmi_msm8960_phy_power_on(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	int ret;
+
+	ret = qcom_hdmi_msm8960_phy_set_rate(hdmi_phy);
+	if (ret)
+		return ret;
+
+	ret = qcom_hdmi_msm8960_phy_pll_enable(hdmi_phy);
+	if (ret)
+		return ret;
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG2, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG0, 0x1b);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG1, 0xf2);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG4, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG5, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG6, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG7, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG8, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG9, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG10, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG11, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG3, 0x20);
+
+	return 0;
+}
+
+static int qcom_hdmi_msm8960_phy_power_off(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG2, 0x7f);
+
+	qcom_hdmi_msm8960_phy_pll_disable(hdmi_phy);
+
+	return 0;
+}
+
+const struct clk_parent_data msm8960_hdmi_pll_parent = {
+	.fw_name = "pxo", .name = "pxo_board",
+};
+
+const struct qcom_hdmi_preqmp_cfg msm8960_hdmi_phy_cfg = {
+	.clk_names = { "slave_iface" },
+	.num_clks = 1,
+
+	.reg_names = { "core-vdda" },
+	.num_regs = 1,
+
+	.power_on = qcom_hdmi_msm8960_phy_power_on,
+	.power_off = qcom_hdmi_msm8960_phy_power_off,
+
+	.pll_ops = &qcom_hdmi_8960_pll_ops,
+	.pll_parent = &msm8960_hdmi_pll_parent,
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c
new file mode 100644
index 0000000000000000000000000000000000000000..ae834f0827fa67cbcbb9c00d5477c2f70b9e9f8d
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 Red Hat
+ * Copyright (c) 2023, Linaro Ltd.
+ * Copyright (c) 2025, Qualcomm Incorporated
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/units.h>
+
+#include "phy-qcom-hdmi-preqmp.h"
+
+#define REG_HDMI_8x60_PHY_REG0					0x00000000
+#define HDMI_8x60_PHY_REG0_DESER_DEL_CTRL__MASK			0x0000001c
+
+#define REG_HDMI_8x60_PHY_REG1					0x00000004
+#define HDMI_8x60_PHY_REG1_DTEST_MUX_SEL__MASK			0x000000f0
+#define HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL__MASK		0x0000000f
+
+#define REG_HDMI_8x60_PHY_REG2					0x00000008
+#define HDMI_8x60_PHY_REG2_PD_DESER				0x00000001
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_1				0x00000002
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_2				0x00000004
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_3				0x00000008
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_4				0x00000010
+#define HDMI_8x60_PHY_REG2_PD_PLL				0x00000020
+#define HDMI_8x60_PHY_REG2_PD_PWRGEN				0x00000040
+#define HDMI_8x60_PHY_REG2_RCV_SENSE_EN				0x00000080
+
+#define REG_HDMI_8x60_PHY_REG3					0x0000000c
+#define HDMI_8x60_PHY_REG3_PLL_ENABLE				0x00000001
+
+#define REG_HDMI_8x60_PHY_REG4					0x00000010
+
+#define REG_HDMI_8x60_PHY_REG5					0x00000014
+
+#define REG_HDMI_8x60_PHY_REG6					0x00000018
+
+#define REG_HDMI_8x60_PHY_REG7					0x0000001c
+
+#define REG_HDMI_8x60_PHY_REG8					0x00000020
+
+#define REG_HDMI_8x60_PHY_REG9					0x00000024
+
+#define REG_HDMI_8x60_PHY_REG10					0x00000028
+
+#define REG_HDMI_8x60_PHY_REG11					0x0000002c
+
+#define REG_HDMI_8x60_PHY_REG12					0x00000030
+#define HDMI_8x60_PHY_REG12_RETIMING_EN				0x00000001
+#define HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN			0x00000002
+#define HDMI_8x60_PHY_REG12_FORCE_LOCK				0x00000010
+
+static int qcom_hdmi_msm8x60_phy_power_on(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	unsigned long pixclock = hdmi_phy->hdmi_opts.tmds_char_rate;
+
+	/* De-serializer delay D/C for non-lbk mode: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG0,
+		       FIELD_PREP(HDMI_8x60_PHY_REG0_DESER_DEL_CTRL__MASK, 3));
+
+	if (pixclock == 27 * HZ_PER_MHZ) {
+		/* video_format == HDMI_VFRMT_720x480p60_16_9 */
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG1,
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_DTEST_MUX_SEL__MASK, 5) |
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL__MASK, 3));
+	} else {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG1,
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_DTEST_MUX_SEL__MASK, 5) |
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL__MASK, 4));
+	}
+
+	/* No matter what, start from the power down mode: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_PWRGEN |
+		       HDMI_8x60_PHY_REG2_PD_PLL |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* Turn PowerGen on: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_PLL |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* Turn PLL power on: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* Write to HIGH after PLL power down de-assert: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG3,
+		       HDMI_8x60_PHY_REG3_PLL_ENABLE);
+
+	/* ASIC power on; PHY REG9 = 0 */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG9, 0);
+
+	/* Enable PLL lock detect, PLL lock det will go high after lock
+	 * Enable the re-time logic
+	 */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG12,
+		       HDMI_8x60_PHY_REG12_RETIMING_EN |
+		       HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN);
+
+	/* Drivers are on: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* If the RX detector is needed: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_RCV_SENSE_EN |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG4, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG5, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG6, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG7, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG8, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG9, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG10, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG11, 0);
+
+	/* If we want to use lock enable based on counting: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG12,
+		       HDMI_8x60_PHY_REG12_RETIMING_EN |
+		       HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN |
+		       HDMI_8x60_PHY_REG12_FORCE_LOCK);
+
+	return 0;
+}
+
+static int qcom_hdmi_msm8x60_phy_power_off(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	/* Turn off Driver */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+	udelay(10);
+	/* Disable PLL */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG3, 0);
+	/* Power down PHY, but keep RX-sense: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_RCV_SENSE_EN |
+		       HDMI_8x60_PHY_REG2_PD_PWRGEN |
+		       HDMI_8x60_PHY_REG2_PD_PLL |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	return 0;
+}
+
+const struct qcom_hdmi_preqmp_cfg msm8x60_hdmi_phy_cfg = {
+	.clk_names = { "slave_iface" },
+	.num_clks = 1,
+
+	.reg_names = { "core-vdda" },
+	.num_regs = 1,
+
+	.power_on = qcom_hdmi_msm8x60_phy_power_on,
+	.power_off = qcom_hdmi_msm8x60_phy_power_off,
+
+	/* FIXME: no PLL support */
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
new file mode 100644
index 0000000000000000000000000000000000000000..de188f660da76d45079916277b31f3b014374f1d
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 Red Hat
+ * Copyright (c) 2023, Linaro Ltd.
+ * Copyright (c) 2025, Qualcomm Incorporated
+ */
+
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+#include "phy-qcom-hdmi-preqmp.h"
+
+static int qcom_hdmi_preqmp_phy_init(struct phy *phy)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	return pm_runtime_resume_and_get(hdmi_phy->dev);
+}
+
+static int qcom_hdmi_preqmp_phy_exit(struct phy *phy)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	pm_runtime_put_noidle(hdmi_phy->dev);
+
+	return 0;
+}
+
+static int qcom_hdmi_preqmp_phy_power_on(struct phy *phy)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	return hdmi_phy->power_on(hdmi_phy);
+};
+
+static int qcom_hdmi_preqmp_phy_power_off(struct phy *phy)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	return hdmi_phy->power_off(hdmi_phy);
+};
+
+static int qcom_hdmi_preqmp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	const struct phy_configure_opts_hdmi *hdmi_opts = &opts->hdmi;
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	memcpy(&hdmi_phy->hdmi_opts, hdmi_opts, sizeof(*hdmi_opts));
+
+	return ret;
+}
+
+static int __maybe_unused qcom_hdmi_preqmp_runtime_resume(struct device *dev)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_bulk_enable(hdmi_phy->num_regs, hdmi_phy->regs);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(hdmi_phy->num_clks, hdmi_phy->clks);
+	if (ret)
+		goto out_disable_supplies;
+
+	return 0;
+
+out_disable_supplies:
+	regulator_bulk_disable(hdmi_phy->num_regs, hdmi_phy->regs);
+
+	return ret;
+}
+
+static int __maybe_unused qcom_hdmi_preqmp_runtime_suspend(struct device *dev)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(hdmi_phy->num_clks, hdmi_phy->clks);
+	regulator_bulk_disable(hdmi_phy->num_regs, hdmi_phy->regs);
+
+	return 0;
+}
+
+static const struct phy_ops qcom_hdmi_preqmp_phy_ops = {
+	.init		= qcom_hdmi_preqmp_phy_init,
+	.configure	= qcom_hdmi_preqmp_phy_configure,
+	.power_on	= qcom_hdmi_preqmp_phy_power_on,
+	.power_off	= qcom_hdmi_preqmp_phy_power_off,
+	.exit		= qcom_hdmi_preqmp_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int qcom_hdmi_preqmp_probe(struct platform_device *pdev)
+{
+	struct clk_init_data init;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct qcom_hdmi_preqmp_phy *hdmi_phy;
+	const struct qcom_hdmi_preqmp_cfg *cfg;
+	int i, ret;
+
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
+		return -EINVAL;
+
+	hdmi_phy = devm_kzalloc(dev, sizeof(*hdmi_phy), GFP_KERNEL);
+	if (!hdmi_phy)
+		return -ENOMEM;
+
+	hdmi_phy->dev = dev;
+
+	hdmi_phy->phy_reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hdmi_phy->phy_reg))
+		return PTR_ERR(hdmi_phy->phy_reg);
+
+	hdmi_phy->pll_reg = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(hdmi_phy->pll_reg))
+		return PTR_ERR(hdmi_phy->pll_reg);
+
+	hdmi_phy->num_clks = cfg->num_clks;
+	for (i = 0; i < cfg->num_clks; i++)
+		hdmi_phy->clks[i].id = cfg->clk_names[i];
+	ret = devm_clk_bulk_get(dev, hdmi_phy->num_clks, hdmi_phy->clks);
+	if (ret)
+		return ret;
+
+	hdmi_phy->num_regs = cfg->num_regs;
+	for (i = 0; i < cfg->num_regs; i++) {
+		hdmi_phy->regs[i].supply = cfg->reg_names[i];
+		hdmi_phy->regs[i].init_load_uA = cfg->reg_init_load[i];
+	}
+	ret = devm_regulator_bulk_get(dev, hdmi_phy->num_regs, hdmi_phy->regs);
+	if (ret)
+		return ret;
+
+	hdmi_phy->power_on = cfg->power_on;
+	hdmi_phy->power_off = cfg->power_off;
+
+	platform_set_drvdata(pdev, hdmi_phy);
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	/* FIXME: msm8x60 doesn't yet have PLL ops */
+	if (cfg->pll_ops) {
+		init.name = "hdmipll";
+		init.ops = cfg->pll_ops;
+		init.flags = CLK_GET_RATE_NOCACHE;
+		init.parent_data = cfg->pll_parent;
+		init.num_parents = 1;
+
+		hdmi_phy->pll_hw.init = &init;
+		ret = devm_clk_hw_register(hdmi_phy->dev, &hdmi_phy->pll_hw);
+		if (ret)
+			goto err;
+
+		ret = devm_of_clk_add_hw_provider(hdmi_phy->dev, of_clk_hw_simple_get,
+						  &hdmi_phy->pll_hw);
+		if (ret)
+			goto err;
+	}
+
+	hdmi_phy->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_hdmi_preqmp_phy_ops);
+	if (IS_ERR(hdmi_phy->phy)) {
+		ret = PTR_ERR(hdmi_phy->phy);
+		goto err;
+	}
+
+	phy_set_drvdata(hdmi_phy->phy, hdmi_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	pm_runtime_put_noidle(&pdev->dev);
+	return PTR_ERR_OR_ZERO(phy_provider);
+
+err:
+	pm_runtime_put_noidle(&pdev->dev);
+	return ret;
+}
+
+static const struct of_device_id qcom_hdmi_preqmp_of_match_table[] = {
+	{ .compatible = "qcom,hdmi-phy-8660", .data = &msm8x60_hdmi_phy_cfg, },
+	{ .compatible = "qcom,hdmi-phy-8960", .data = &msm8960_hdmi_phy_cfg, },
+	{ .compatible = "qcom,hdmi-phy-8974", .data = &msm8974_hdmi_phy_cfg, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_hdmi_preqmp_of_match_table);
+
+DEFINE_RUNTIME_DEV_PM_OPS(qcom_hdmi_preqmp_pm_ops,
+			  qcom_hdmi_preqmp_runtime_suspend,
+			  qcom_hdmi_preqmp_runtime_resume,
+			  NULL);
+
+static struct platform_driver qcom_hdmi_preqmp_driver = {
+	.probe		= qcom_hdmi_preqmp_probe,
+	.driver = {
+		.name	= "qcom-preqmp-hdmi-phy",
+		.of_match_table = qcom_hdmi_preqmp_of_match_table,
+		.pm     = &qcom_hdmi_preqmp_pm_ops,
+	},
+};
+
+module_platform_driver(qcom_hdmi_preqmp_driver);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm MSMpreqmp HDMI PHY driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
new file mode 100644
index 0000000000000000000000000000000000000000..5562a3ac4840f7a76d7c76f6f80f1f9c1c7852e1
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 Red Hat
+ * Copyright (c) 2023, Linaro Ltd.
+ * Copyright (c) 2025, Qualcomm Incorporated
+ */
+
+#ifndef PHY_QCOM_HDMI_PREQMP_H
+#define PHY_QCOM_HDMI_PREQMP_H
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/phy/phy-hdmi.h>
+#include <linux/regulator/consumer.h>
+
+#define MAX_CLKS 2
+#define MAX_SUPPLIES 2
+
+struct qcom_hdmi_preqmp_phy {
+	struct device *dev;
+	struct phy *phy;
+	void __iomem *pll_reg;
+	void __iomem *phy_reg;
+
+	struct phy_configure_opts_hdmi hdmi_opts;
+
+	struct clk_hw pll_hw;
+	struct clk_bulk_data clks[MAX_CLKS];
+	int num_clks;
+
+	struct regulator_bulk_data regs[MAX_SUPPLIES];
+	int num_regs;
+
+	int (*power_on)(struct qcom_hdmi_preqmp_phy *phy);
+	int (*power_off)(struct qcom_hdmi_preqmp_phy *phy);
+};
+
+#define hw_clk_to_phy(x) container_of(x, struct qcom_hdmi_preqmp_phy, pll_hw)
+
+struct qcom_hdmi_preqmp_cfg {
+	const char * const clk_names[MAX_CLKS];
+	int num_clks;
+
+	const char * const reg_names[MAX_SUPPLIES];
+	int reg_init_load[MAX_SUPPLIES];
+	int num_regs;
+
+	int (*power_on)(struct qcom_hdmi_preqmp_phy *phy);
+	int (*power_off)(struct qcom_hdmi_preqmp_phy *phy);
+
+	const struct clk_ops *pll_ops;
+	const struct clk_parent_data *pll_parent;
+};
+
+static inline void hdmi_phy_write(struct qcom_hdmi_preqmp_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->phy_reg + offset);
+}
+
+static inline u32 hdmi_phy_read(struct qcom_hdmi_preqmp_phy *phy, int offset)
+{
+	return readl(phy->phy_reg + offset);
+}
+
+static inline void hdmi_pll_write(struct qcom_hdmi_preqmp_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->pll_reg + offset);
+}
+
+static inline u32 hdmi_pll_read(struct qcom_hdmi_preqmp_phy *phy, int offset)
+{
+	return readl(phy->pll_reg + offset);
+}
+
+extern const struct qcom_hdmi_preqmp_cfg msm8x60_hdmi_phy_cfg;
+extern const struct qcom_hdmi_preqmp_cfg msm8960_hdmi_phy_cfg;
+extern const struct qcom_hdmi_preqmp_cfg msm8974_hdmi_phy_cfg;
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c
new file mode 100644
index 0000000000000000000000000000000000000000..caca753d50e423a831fa9ba33464b713b093e0ff
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Ltd.
+ * Copyright (c) 2025, Qualcomm Incorporated
+ */
+
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+#include "phy-qcom-qmp-hdmi.h"
+
+int qmp_hdmi_phy_init(struct phy *phy)
+{
+	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	return pm_runtime_resume_and_get(hdmi_phy->dev);
+}
+
+int qmp_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	const struct phy_configure_opts_hdmi *hdmi_opts = &opts->hdmi;
+	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	memcpy(&hdmi_phy->hdmi_opts, hdmi_opts, sizeof(*hdmi_opts));
+
+	return ret;
+}
+
+int qmp_hdmi_phy_exit(struct phy *phy)
+{
+	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	pm_runtime_put_noidle(hdmi_phy->dev);
+
+	return 0;
+}
+
+static int __maybe_unused qmp_hdmi_runtime_resume(struct device *dev)
+{
+	struct qmp_hdmi_phy *hdmi_phy = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
+	if (ret)
+		goto out_disable_supplies;
+
+	return 0;
+
+out_disable_supplies:
+	regulator_bulk_disable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
+
+	return ret;
+}
+
+static int __maybe_unused qmp_hdmi_runtime_suspend(struct device *dev)
+{
+	struct qmp_hdmi_phy *hdmi_phy = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
+	regulator_bulk_disable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
+
+	return 0;
+}
+
+static int qmp_hdmi_probe(struct platform_device *pdev)
+{
+	struct clk_init_data init = {
+		.name = "hdmipll",
+		.parent_data = (const struct clk_parent_data[]) {
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
+		.flags = CLK_GET_RATE_NOCACHE,
+		.num_parents = 1,
+	};
+	const struct qmp_hdmi_cfg *cfg = of_device_get_match_data(&pdev->dev);
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct qmp_hdmi_phy *hdmi_phy;
+	int ret, i;
+
+	hdmi_phy = devm_kzalloc(dev, sizeof(*hdmi_phy), GFP_KERNEL);
+	if (!hdmi_phy)
+		return -ENOMEM;
+
+	hdmi_phy->dev = dev;
+
+	hdmi_phy->serdes = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hdmi_phy->serdes))
+		return PTR_ERR(hdmi_phy->serdes);
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		hdmi_phy->tx[i] = devm_platform_ioremap_resource(pdev, 1 + i);
+		if (IS_ERR(hdmi_phy->tx[i]))
+			return PTR_ERR(hdmi_phy->tx[i]);
+	}
+
+	hdmi_phy->phy_reg = devm_platform_ioremap_resource(pdev, 5);
+	if (IS_ERR(hdmi_phy->phy_reg))
+		return PTR_ERR(hdmi_phy->phy_reg);
+
+	hdmi_phy->clks[0].id = "iface";
+	hdmi_phy->clks[1].id = "ref";
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
+	if (ret)
+		return ret;
+
+	hdmi_phy->supplies[0].supply = "vddio";
+	hdmi_phy->supplies[0].init_load_uA = 100000;
+	hdmi_phy->supplies[1].supply = "vcca";
+	hdmi_phy->supplies[1].init_load_uA = 10000;
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, hdmi_phy);
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	init.ops = cfg->pll_ops;
+	hdmi_phy->pll_hw.init = &init;
+	ret = devm_clk_hw_register(hdmi_phy->dev, &hdmi_phy->pll_hw);
+	if (ret)
+		goto err;
+
+	ret = devm_of_clk_add_hw_provider(hdmi_phy->dev, of_clk_hw_simple_get, &hdmi_phy->pll_hw);
+	if (ret)
+		goto err;
+
+	hdmi_phy->phy = devm_phy_create(dev, pdev->dev.of_node, cfg->phy_ops);
+	if (IS_ERR(hdmi_phy->phy)) {
+		ret = PTR_ERR(hdmi_phy->phy);
+		goto err;
+	}
+
+	phy_set_drvdata(hdmi_phy->phy, hdmi_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	pm_runtime_put_noidle(&pdev->dev);
+	return PTR_ERR_OR_ZERO(phy_provider);
+
+err:
+	pm_runtime_put_noidle(&pdev->dev);
+	return ret;
+}
+
+static const struct of_device_id qmp_hdmi_of_match_table[] = {
+	{
+		.compatible = "qcom,hdmi-phy-8996", .data = &qmp_hdmi_8996_cfg,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qmp_hdmi_of_match_table);
+
+DEFINE_RUNTIME_DEV_PM_OPS(qmp_hdmi_pm_ops,
+			  qmp_hdmi_runtime_suspend,
+			  qmp_hdmi_runtime_resume,
+			  NULL);
+
+static struct platform_driver qmp_hdmi_driver = {
+	.probe		= qmp_hdmi_probe,
+	.driver = {
+		.name	= "qcom-qmp-hdmi-phy",
+		.of_match_table = qmp_hdmi_of_match_table,
+		.pm     = &qmp_hdmi_pm_ops,
+	},
+};
+
+module_platform_driver(qmp_hdmi_driver);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm QMP HDMI PHY driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c
new file mode 100644
index 0000000000000000000000000000000000000000..2eb1064046f289dacb58b5242c2a388122561b13
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Ltd.
+ * Copyright (c) 2025, Qualcomm Incorporated
+ */
+
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/phy/phy.h>
+
+#include "phy-qcom-qmp-hdmi.h"
+#include "phy-qcom-qmp-qserdes-com.h"
+#include "phy-qcom-qmp-qserdes-txrx.h"
+
+#define HDMI_VCO_MAX_FREQ			12000000000UL
+#define HDMI_VCO_MIN_FREQ			8000000000UL
+
+#define HDMI_PCLK_MAX_FREQ			600000000UL
+#define HDMI_PCLK_MIN_FREQ			25000000UL
+
+#define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
+#define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
+#define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
+#define HDMI_DEFAULT_REF_CLOCK			19200000
+#define HDMI_PLL_CMP_CNT			1024
+
+#define HDMI_PLL_POLL_MAX_READS			100
+#define HDMI_PLL_POLL_TIMEOUT_US		150
+
+#define REG_HDMI_8996_PHY_CFG					0x00000000
+#define REG_HDMI_8996_PHY_PD_CTL				0x00000004
+#define REG_HDMI_8996_PHY_MODE					0x00000008
+#define REG_HDMI_8996_PHY_MISR_CLEAR				0x0000000c
+#define REG_HDMI_8996_PHY_TX0_TX1_BIST_CFG0			0x00000010
+#define REG_HDMI_8996_PHY_TX0_TX1_BIST_CFG1			0x00000014
+#define REG_HDMI_8996_PHY_TX0_TX1_PRBS_SEED_BYTE0		0x00000018
+#define REG_HDMI_8996_PHY_TX0_TX1_PRBS_SEED_BYTE1		0x0000001c
+#define REG_HDMI_8996_PHY_TX0_TX1_BIST_PATTERN0			0x00000020
+#define REG_HDMI_8996_PHY_TX0_TX1_BIST_PATTERN1			0x00000024
+#define REG_HDMI_8996_PHY_TX2_TX3_BIST_CFG0			0x00000028
+#define REG_HDMI_8996_PHY_TX2_TX3_BIST_CFG1			0x0000002c
+#define REG_HDMI_8996_PHY_TX2_TX3_PRBS_SEED_BYTE0		0x00000030
+#define REG_HDMI_8996_PHY_TX2_TX3_PRBS_SEED_BYTE1		0x00000034
+#define REG_HDMI_8996_PHY_TX2_TX3_BIST_PATTERN0			0x00000038
+#define REG_HDMI_8996_PHY_TX2_TX3_BIST_PATTERN1			0x0000003c
+#define REG_HDMI_8996_PHY_DEBUG_BUS_SEL				0x00000040
+#define REG_HDMI_8996_PHY_TXCAL_CFG0				0x00000044
+#define REG_HDMI_8996_PHY_TXCAL_CFG1				0x00000048
+#define REG_HDMI_8996_PHY_TX0_TX1_LANE_CTL			0x0000004c
+#define REG_HDMI_8996_PHY_TX2_TX3_LANE_CTL			0x00000050
+#define REG_HDMI_8996_PHY_LANE_BIST_CONFIG			0x00000054
+#define REG_HDMI_8996_PHY_CLOCK					0x00000058
+#define REG_HDMI_8996_PHY_MISC1					0x0000005c
+#define REG_HDMI_8996_PHY_MISC2					0x00000060
+#define REG_HDMI_8996_PHY_TX0_TX1_BIST_STATUS0			0x00000064
+#define REG_HDMI_8996_PHY_TX0_TX1_BIST_STATUS1			0x00000068
+#define REG_HDMI_8996_PHY_TX0_TX1_BIST_STATUS2			0x0000006c
+#define REG_HDMI_8996_PHY_TX2_TX3_BIST_STATUS0			0x00000070
+#define REG_HDMI_8996_PHY_TX2_TX3_BIST_STATUS1			0x00000074
+#define REG_HDMI_8996_PHY_TX2_TX3_BIST_STATUS2			0x00000078
+#define REG_HDMI_8996_PHY_PRE_MISR_STATUS0			0x0000007c
+#define REG_HDMI_8996_PHY_PRE_MISR_STATUS1			0x00000080
+#define REG_HDMI_8996_PHY_PRE_MISR_STATUS2			0x00000084
+#define REG_HDMI_8996_PHY_PRE_MISR_STATUS3			0x00000088
+#define REG_HDMI_8996_PHY_POST_MISR_STATUS0			0x0000008c
+#define REG_HDMI_8996_PHY_POST_MISR_STATUS1			0x00000090
+#define REG_HDMI_8996_PHY_POST_MISR_STATUS2			0x00000094
+#define REG_HDMI_8996_PHY_POST_MISR_STATUS3			0x00000098
+#define REG_HDMI_8996_PHY_STATUS				0x0000009c
+#define REG_HDMI_8996_PHY_MISC3_STATUS				0x000000a0
+#define REG_HDMI_8996_PHY_MISC4_STATUS				0x000000a4
+#define REG_HDMI_8996_PHY_DEBUG_BUS0				0x000000a8
+#define REG_HDMI_8996_PHY_DEBUG_BUS1				0x000000ac
+#define REG_HDMI_8996_PHY_DEBUG_BUS2				0x000000b0
+#define REG_HDMI_8996_PHY_DEBUG_BUS3				0x000000b4
+#define REG_HDMI_8996_PHY_PHY_REVISION_ID0			0x000000b8
+#define REG_HDMI_8996_PHY_PHY_REVISION_ID1			0x000000bc
+#define REG_HDMI_8996_PHY_PHY_REVISION_ID2			0x000000c0
+#define REG_HDMI_8996_PHY_PHY_REVISION_ID3			0x000000c4
+
+struct qmp_hdmi_8996_post_divider {
+	u64 vco_freq;
+	int hsclk_divsel;
+	int vco_ratio;
+	int tx_band_sel;
+};
+
+static inline u32 qmp_hdmi_8996_pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
+{
+	u64 dividend = HDMI_PLL_CMP_CNT * fdata;
+	u32 divisor = ref_clk * 10;
+	u32 rem;
+
+	rem = do_div(dividend, divisor);
+	if (rem > (divisor >> 1))
+		dividend++;
+
+	return dividend - 1;
+}
+
+static int qmp_hdmi_8996_pll_get_post_div(struct qmp_hdmi_8996_post_divider *pd, u64 bclk)
+{
+	int ratio[] = { 2, 3, 4, 5, 6, 9, 10, 12, 14, 15, 20, 21, 25, 28, 35 };
+	int hs_divsel[] = { 0, 4, 8, 12, 1, 5, 2, 9, 3, 13, 10, 7, 14, 11, 15 };
+	int tx_band_sel[] = { 0, 1, 2, 3 };
+	u64 vco_freq[60];
+	u64 vco, vco_optimal;
+	int half_rate_mode = 0;
+	int vco_optimal_index, vco_freq_index;
+	int i, j;
+
+retry:
+	vco_optimal = HDMI_VCO_MAX_FREQ;
+	vco_optimal_index = -1;
+	vco_freq_index = 0;
+	for (i = 0; i < 15; i++) {
+		for (j = 0; j < 4; j++) {
+			u32 ratio_mult = ratio[i] << tx_band_sel[j];
+
+			vco = bclk >> half_rate_mode;
+			vco *= ratio_mult;
+			vco_freq[vco_freq_index++] = vco;
+		}
+	}
+
+	for (i = 0; i < 60; i++) {
+		u64 vco_tmp = vco_freq[i];
+
+		if ((vco_tmp >= HDMI_VCO_MIN_FREQ) &&
+		    (vco_tmp <= vco_optimal)) {
+			vco_optimal = vco_tmp;
+			vco_optimal_index = i;
+		}
+	}
+
+	if (vco_optimal_index == -1) {
+		if (!half_rate_mode) {
+			half_rate_mode = 1;
+			goto retry;
+		}
+
+		return -EINVAL;
+	}
+
+	pd->vco_freq = vco_optimal;
+	pd->tx_band_sel = tx_band_sel[vco_optimal_index % 4];
+	pd->vco_ratio = ratio[vco_optimal_index / 4];
+	pd->hsclk_divsel = hs_divsel[vco_optimal_index / 4];
+
+	return 0;
+}
+
+static int qmp_hdmi_8996_phy_set_rate(struct qmp_hdmi_phy *hdmi_phy)
+{
+	unsigned long parent_rate = HDMI_DEFAULT_REF_CLOCK;
+	unsigned long rate = hdmi_phy->hdmi_opts.tmds_char_rate;
+	struct qmp_hdmi_8996_post_divider pd;
+	bool gen_ssc = false;
+	u64 bclk;
+	u64 dec_start;
+	u64 frac_start;
+	u64 fdata;
+	u32 pll_divisor;
+	u32 rem;
+	u32 integloop_gain;
+	u32 pll_cmp;
+	int i, ret;
+
+	bclk = ((u64)rate) * 10;
+	ret = qmp_hdmi_8996_pll_get_post_div(&pd, bclk);
+	if (ret) {
+		dev_err(hdmi_phy->dev, "PLL calculation failed\n");
+		return ret;
+	}
+
+	dec_start = pd.vco_freq;
+	pll_divisor = 4 * parent_rate;
+	do_div(dec_start, pll_divisor);
+
+	frac_start = pd.vco_freq * (1 << 20);
+
+	rem = do_div(frac_start, pll_divisor);
+	frac_start -= dec_start * (1 << 20);
+	if (rem > (pll_divisor >> 1))
+		frac_start++;
+
+	fdata = pd.vco_freq;
+	do_div(fdata, pd.vco_ratio);
+
+	pll_cmp = qmp_hdmi_8996_pll_get_pll_cmp(fdata, parent_rate);
+
+	/* Initially shut down PHY */
+	dev_dbg(hdmi_phy->dev, "Disabling PHY");
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_PD_CTL, 0x0);
+	udelay(500);
+
+	/* Power up sequence */
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_BG_CTRL, 0x04);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_PD_CTL, 0x1);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_RESETSM_CNTRL, 0x20);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_TX0_TX1_LANE_CTL, 0x0f);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_TX2_TX3_LANE_CTL, 0x0f);
+
+	hdmi_tx_chan_write(hdmi_phy, 0, QSERDES_TX_LANE_MODE, 0x43);
+	hdmi_tx_chan_write(hdmi_phy, 2, QSERDES_TX_LANE_MODE, 0x43);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1e);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x07);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_SYSCLK_EN_SEL, 0x37);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_SYS_CLK_CTRL, 0x02);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_CLK_ENABLE1, 0x0e);
+
+	if (frac_start != 0 || gen_ssc) {
+		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_CCTRL_MODE0, 0x28);
+		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
+		hdmi_pll_write(hdmi_phy, QSERDES_COM_CP_CTRL_MODE0,
+			       11000000 / (parent_rate / 20));
+		integloop_gain = (64 * parent_rate) / HDMI_DEFAULT_REF_CLOCK;
+	} else {
+		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_CCTRL_MODE0, 0x01);
+		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_RCTRL_MODE0, 0x10);
+		hdmi_pll_write(hdmi_phy, QSERDES_COM_CP_CTRL_MODE0, 0x23);
+		integloop_gain = (1022 * parent_rate) / (100 * 1000 * 1000);
+	}
+
+	/* Bypass VCO calibration */
+	if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD) {
+		hdmi_pll_write(hdmi_phy, QSERDES_COM_SVS_MODE_CLK_SEL, 1);
+		integloop_gain <<= 1;
+	} else {
+		hdmi_pll_write(hdmi_phy, QSERDES_COM_SVS_MODE_CLK_SEL, 2);
+		integloop_gain <<= 2;
+	}
+
+	integloop_gain = min_t(u32, integloop_gain, 2046);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_BG_TRIM, 0x0f);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_IVCO, 0x0f);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_VCO_TUNE_CTRL, 0);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_BG_CTRL, 0x06);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_CLK_SELECT, 0x30);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_HSCLK_SEL, 0x20 | pd.hsclk_divsel);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_LOCK_CMP_EN, 0x0);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_DEC_START_MODE0, dec_start);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_DIV_FRAC_START1_MODE0,
+		       frac_start & 0xff);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_DIV_FRAC_START2_MODE0,
+		       (frac_start >> 8) & 0xff);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_DIV_FRAC_START3_MODE0,
+		       (frac_start >> 16) & 0xf);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_INTEGLOOP_GAIN0_MODE0,
+		       integloop_gain & 0xff);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_INTEGLOOP_GAIN1_MODE0,
+		       (integloop_gain >> 8) & 0xff);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_LOCK_CMP1_MODE0,
+		       pll_cmp & 0xff);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_LOCK_CMP2_MODE0,
+		       (pll_cmp >> 8) & 0xff);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_LOCK_CMP3_MODE0,
+		       (pll_cmp >> 16) & 0x3);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_VCO_TUNE_MAP, 0x00);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_CORE_CLK_EN, 0x2c);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_CORECLK_DIV, 5);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_CMN_CONFIG, 0x02);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_RESCODE_DIV_NUM, 0x15);
+
+	/* TX lanes setup (TX 0/1/2/3) */
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_CLKBUF_ENABLE, 0x03);
+		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_BAND, pd.tx_band_sel + 4);
+		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_RESET_TSYNC_EN, 0x03);
+		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_VMODE_CTRL1, 0x00);
+		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_DRV_LVL_OFFSET, 0x00);
+		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_RES_CODE_LANE_OFFSET, 0x00);
+		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TRAN_DRVR_EMP_EN, 0x03);
+		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_PARRATE_REC_DETECT_IDLE_EN, 0x40);
+		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_HP_PD_ENABLES,
+				   i != 3 ? 0xc : 0x3);
+	}
+
+	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) {
+		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_DRV_LVL,
+					   i != 3 ? 0x25 : 0x22);
+			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_EMP_POST1_LVL,
+					   i != 3 ? 0x23 : 0x27);
+			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_VMODE_CTRL2,
+					   i != 3 ? 0x0d : 0x00);
+		}
+	} else if (bclk > HDMI_MID_FREQ_BIT_CLK_THRESHOLD) {
+		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_DRV_LVL, 0x25);
+			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_EMP_POST1_LVL, 0x23);
+			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_VMODE_CTRL2,
+					   i != 3 ? 0x0d : 0x00);
+		}
+	} else {
+		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_DRV_LVL, 0x20);
+			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_EMP_POST1_LVL, 0x20);
+			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_VMODE_CTRL2, 0x0e);
+		}
+	}
+
+	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD)
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_MODE, 0x10);
+	else
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_MODE, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_PD_CTL, 0x1f);
+
+	return 0;
+}
+
+static int qmp_hdmi_8996_phy_power_on(struct phy *phy)
+{
+	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+	u32 status;
+	int i, ret = 0;
+
+	ret = qmp_hdmi_8996_phy_set_rate(hdmi_phy);
+	if (ret) {
+		dev_err(hdmi_phy->dev, "Setting pixel clock rate failed\n");
+		return ret;
+	}
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_CFG, 0x1);
+	udelay(100);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_CFG, 0x19);
+	udelay(100);
+
+	ret = readl_poll_timeout(hdmi_phy->serdes + QSERDES_COM_C_READY_STATUS,
+				 status, status & BIT(0),
+				 HDMI_PLL_POLL_TIMEOUT_US,
+				 HDMI_PLL_POLL_MAX_READS * HDMI_PLL_POLL_TIMEOUT_US);
+
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PLL is not locked\n");
+		return ret;
+	}
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
+		hdmi_tx_chan_write(hdmi_phy, i,
+				   QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN,
+				   0x6f);
+
+	/* Disable SSC */
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_SSC_PER1, 0x0);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_SSC_PER2, 0x0);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_SSC_STEP_SIZE1, 0x0);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_SSC_STEP_SIZE2, 0x0);
+	hdmi_pll_write(hdmi_phy, QSERDES_COM_SSC_EN_CENTER, 0x2);
+
+	ret = readl_poll_timeout(hdmi_phy->phy_reg + REG_HDMI_8996_PHY_STATUS,
+				 status, status & BIT(0),
+				 HDMI_PLL_POLL_TIMEOUT_US,
+				 HDMI_PLL_POLL_MAX_READS * HDMI_PLL_POLL_TIMEOUT_US);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PLL is not locked\n");
+		return ret;
+	}
+
+	/* Restart the retiming buffer */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_CFG, 0x18);
+	udelay(1);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_CFG, 0x19);
+
+	return 0;
+}
+
+static int qmp_hdmi_8996_phy_power_off(struct phy *phy)
+{
+	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_CFG, 0x6);
+	usleep_range(100, 150);
+
+	return 0;
+}
+
+static long qmp_hdmi_8996_pll_round_rate(struct clk_hw *hw,
+				     unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	return clamp(rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+}
+
+static unsigned long qmp_hdmi_8996_pll_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct qmp_hdmi_phy *phy = hw_clk_to_pll(hw);
+	u32 cmp1, cmp2, cmp3, pll_cmp;
+
+	cmp1 = hdmi_pll_read(phy, QSERDES_COM_LOCK_CMP1_MODE0);
+	cmp2 = hdmi_pll_read(phy, QSERDES_COM_LOCK_CMP2_MODE0);
+	cmp3 = hdmi_pll_read(phy, QSERDES_COM_LOCK_CMP3_MODE0);
+
+	pll_cmp = cmp1 | (cmp2 << 8) | (cmp3 << 16);
+
+	return mult_frac(pll_cmp + 1, parent_rate, HDMI_PLL_CMP_CNT);
+}
+
+static int qmp_hdmi_8996_pll_is_enabled(struct clk_hw *hw)
+{
+	struct qmp_hdmi_phy *phy = hw_clk_to_pll(hw);
+	u32 status;
+	int pll_locked;
+
+	status = hdmi_pll_read(phy, QSERDES_COM_C_READY_STATUS);
+	pll_locked = status & BIT(0);
+
+	return pll_locked;
+}
+
+static const struct clk_ops qmp_hdmi_8996_pll_ops = {
+	.recalc_rate = qmp_hdmi_8996_pll_recalc_rate,
+	.round_rate = qmp_hdmi_8996_pll_round_rate,
+	.is_enabled = qmp_hdmi_8996_pll_is_enabled,
+};
+
+static const struct phy_ops qmp_hdmi_8996_phy_ops = {
+	.init		= qmp_hdmi_phy_init,
+	.configure	= qmp_hdmi_phy_configure,
+	.power_on	= qmp_hdmi_8996_phy_power_on,
+	.power_off	= qmp_hdmi_8996_phy_power_off,
+	.exit		= qmp_hdmi_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+const struct qmp_hdmi_cfg qmp_hdmi_8996_cfg = {
+	.pll_ops = &qmp_hdmi_8996_pll_ops,
+	.phy_ops = &qmp_hdmi_8996_phy_ops,
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c
new file mode 100644
index 0000000000000000000000000000000000000000..b0ff96f7168a9dd3433a523098cc7978ad46be49
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024 Freebox SAS
+ * Copyright (c) 2025, Qualcomm Incorporated
+ */
+
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/phy/phy.h>
+#include <linux/units.h>
+
+#include "phy-qcom-qmp-hdmi.h"
+#include "phy-qcom-qmp-qserdes-com-v3.h"
+#include "phy-qcom-qmp-qserdes-txrx.h"
+
+#define HDMI_VCO_MAX_FREQ			12000000000UL
+#define HDMI_VCO_MIN_FREQ			8000000000UL
+
+#define HDMI_PCLK_MAX_FREQ			600000000UL
+#define HDMI_PCLK_MIN_FREQ			25000000UL
+
+#define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
+#define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
+#define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
+#define HDMI_DEFAULT_REF_CLOCK			19200000
+#define HDMI_PLL_CMP_CNT			1024
+
+#define HDMI_PLL_POLL_MAX_READS			100
+#define HDMI_PLL_POLL_TIMEOUT_US		150
+
+#define REG_HDMI_8998_PHY_CFG					0x00000000
+#define REG_HDMI_8998_PHY_PD_CTL				0x00000004
+#define REG_HDMI_8998_PHY_MODE					0x00000010
+#define REG_HDMI_8998_PHY_CLOCK					0x0000005c
+#define REG_HDMI_8998_PHY_CMN_CTRL				0x00000068
+#define REG_HDMI_8998_PHY_STATUS				0x000000b4
+
+#define REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL			0x00000000
+#define REG_HDMI_8998_PHY_TXn_INTERFACE_SELECT_TX_BAND		0x00000008
+#define REG_HDMI_8998_PHY_TXn_CLKBUF_TERM_ENABLE		0x0000000c
+#define REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET		0x00000014
+#define REG_HDMI_8998_PHY_TXn_DRV_LVL				0x00000018
+#define REG_HDMI_8998_PHY_TXn_LANE_CONFIG			0x0000001c
+#define REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1			0x00000024
+#define REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2			0x00000028
+#define REG_HDMI_8998_PHY_TXn_LANE_MODE				0x0000002c
+
+struct qmp_hdmi_8998_post_divider {
+	u64 vco_freq;
+	int hsclk_divsel;
+	int vco_ratio;
+	int tx_band_sel;
+	int half_rate_mode;
+};
+
+static inline u32 qmp_hdmi_8998_pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
+{
+	u64 dividend = HDMI_PLL_CMP_CNT * fdata;
+	u32 divisor = ref_clk * 10;
+	u32 rem;
+
+	rem = do_div(dividend, divisor);
+	if (rem > (divisor >> 1))
+		dividend++;
+
+	return dividend - 1;
+}
+
+static int qmp_hdmi_8998_pll_get_post_div(struct qmp_hdmi_8998_post_divider *pd, u64 bclk)
+{
+	u32 const ratio_list[] = {1, 2, 3, 4, 5, 6, 9, 10, 12, 15, 25};
+	u32 const band_list[] = {0, 1, 2, 3};
+	u32 const sz_ratio = ARRAY_SIZE(ratio_list);
+	u32 const sz_band = ARRAY_SIZE(band_list);
+	u32 const cmp_cnt = 1024;
+	u32 const th_min = 500, th_max = 1000;
+	u32 half_rate_mode = 0;
+	u32 list_elements;
+	int optimal_index;
+	u32 i, j, k;
+	u32 found_hsclk_divsel = 0, found_vco_ratio;
+	u32 found_tx_band_sel;
+	u64 const min_freq = HDMI_VCO_MIN_FREQ, max_freq = HDMI_VCO_MAX_FREQ;
+	u64 freq_list[ARRAY_SIZE(ratio_list) * ARRAY_SIZE(band_list)];
+	u64 found_vco_freq;
+	u64 freq_optimal;
+
+find_optimal_index:
+	freq_optimal = max_freq;
+	optimal_index = -1;
+	list_elements = 0;
+
+	for (i = 0; i < sz_ratio; i++) {
+		for (j = 0; j < sz_band; j++) {
+			u64 freq = div_u64(bclk, (1 << half_rate_mode));
+
+			freq *= (ratio_list[i] * (1 << band_list[j]));
+			freq_list[list_elements++] = freq;
+		}
+	}
+
+	for (k = 0; k < ARRAY_SIZE(freq_list); k++) {
+		u32 const clks_pll_div = 2, core_clk_div = 5;
+		u32 const rng1 = 16, rng2 = 8;
+		u32 th1, th2;
+		u64 core_clk, rvar1, rem;
+
+		core_clk = div_u64(freq_list[k],
+				   ratio_list[k / sz_band] * clks_pll_div *
+				   core_clk_div);
+
+		rvar1 = HDMI_DEFAULT_REF_CLOCK * rng1 * HZ_PER_MHZ;
+		rvar1 = div64_u64_rem(rvar1, (cmp_cnt * core_clk), &rem);
+		if (rem > ((cmp_cnt * core_clk) >> 1))
+			rvar1++;
+		th1 = rvar1;
+
+		rvar1 = HDMI_DEFAULT_REF_CLOCK * rng2 * HZ_PER_MHZ;
+		rvar1 = div64_u64_rem(rvar1, (cmp_cnt * core_clk), &rem);
+		if (rem > ((cmp_cnt * core_clk) >> 1))
+			rvar1++;
+		th2 = rvar1;
+
+		if (freq_list[k] >= min_freq &&
+				freq_list[k] <= max_freq) {
+			if ((th1 >= th_min && th1 <= th_max) ||
+					(th2 >= th_min && th2 <= th_max)) {
+				if (freq_list[k] <= freq_optimal) {
+					freq_optimal = freq_list[k];
+					optimal_index = k;
+				}
+			}
+		}
+	}
+
+	if (optimal_index == -1) {
+		if (!half_rate_mode) {
+			half_rate_mode = 1;
+			goto find_optimal_index;
+		} else {
+			return -EINVAL;
+		}
+	} else {
+		found_vco_ratio = ratio_list[optimal_index / sz_band];
+		found_tx_band_sel = band_list[optimal_index % sz_band];
+		found_vco_freq = freq_optimal;
+	}
+
+	switch (found_vco_ratio) {
+	case 1:
+		found_hsclk_divsel = 15;
+		break;
+	case 2:
+		found_hsclk_divsel = 0;
+		break;
+	case 3:
+		found_hsclk_divsel = 4;
+		break;
+	case 4:
+		found_hsclk_divsel = 8;
+		break;
+	case 5:
+		found_hsclk_divsel = 12;
+		break;
+	case 6:
+		found_hsclk_divsel = 1;
+		break;
+	case 9:
+		found_hsclk_divsel = 5;
+		break;
+	case 10:
+		found_hsclk_divsel = 2;
+		break;
+	case 12:
+		found_hsclk_divsel = 9;
+		break;
+	case 15:
+		found_hsclk_divsel = 13;
+		break;
+	case 25:
+		found_hsclk_divsel = 14;
+		break;
+	}
+
+	pd->vco_freq = found_vco_freq;
+	pd->tx_band_sel = found_tx_band_sel;
+	pd->vco_ratio = found_vco_ratio;
+	pd->hsclk_divsel = found_hsclk_divsel;
+
+	return 0;
+}
+
+static int qmp_hdmi_8998_phy_set_rate(struct qmp_hdmi_phy *hdmi_phy)
+{
+	unsigned long parent_rate = HDMI_DEFAULT_REF_CLOCK;
+	unsigned long rate = hdmi_phy->hdmi_opts.tmds_char_rate;
+	struct qmp_hdmi_8998_post_divider pd;
+	bool gen_ssc = false;
+	u64 bclk;
+	u64 dec_start;
+	u64 frac_start;
+	u64 fdata;
+	u32 pll_divisor;
+	u32 rem;
+	u32 integloop_gain;
+	u32 pll_cmp;
+	int i, ret;
+
+	bclk = ((u64)rate) * 10;
+	ret = qmp_hdmi_8998_pll_get_post_div(&pd, bclk);
+	if (ret) {
+		dev_err(hdmi_phy->dev, "PLL calculation failed\n");
+		return ret;
+	}
+
+	dec_start = pd.vco_freq;
+	pll_divisor = 4 * parent_rate;
+	do_div(dec_start, pll_divisor);
+
+	frac_start = pd.vco_freq * (1 << 20);
+
+	rem = do_div(frac_start, pll_divisor);
+	frac_start -= dec_start * (1 << 20);
+	if (rem > (pll_divisor >> 1))
+		frac_start++;
+
+	fdata = pd.vco_freq;
+	do_div(fdata, pd.vco_ratio);
+
+	pll_cmp = qmp_hdmi_8998_pll_get_pll_cmp(fdata, parent_rate);
+
+	/* Initially shut down PHY */
+	dev_dbg(hdmi_phy->dev, "Disabling PHY");
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8998_PHY_PD_CTL, 0x0);
+	udelay(500);
+
+	/* Power up sequence */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8998_PHY_PD_CTL, 0x1);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_RESETSM_CNTRL, 0x20);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8998_PHY_CMN_CTRL, 0x6);
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		hdmi_tx_chan_write(hdmi_phy, i,
+				   REG_HDMI_8998_PHY_TXn_INTERFACE_SELECT_TX_BAND,
+				   pd.tx_band_sel);
+		hdmi_tx_chan_write(hdmi_phy, i,
+				   REG_HDMI_8998_PHY_TXn_CLKBUF_TERM_ENABLE,
+				   0x1);
+		hdmi_tx_chan_write(hdmi_phy, i,
+				   REG_HDMI_8998_PHY_TXn_LANE_MODE,
+				   0x20);
+	}
+
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x02);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x0B);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_SYSCLK_EN_SEL, 0x37);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_SYS_CLK_CTRL, 0x02);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_CLK_ENABLE1, 0x0E);
+
+	if (frac_start != 0 || gen_ssc) {
+		hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x34);
+		hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16);
+		hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_CP_CTRL_MODE0, 0x08);
+		integloop_gain = 0x3f;
+	} else {
+		hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x02);
+		hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x18);
+		hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_CP_CTRL_MODE0, 0x30);
+		integloop_gain = 0xc4;
+	}
+
+	/* Bypass VCO calibration */
+	if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD) {
+		hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_SVS_MODE_CLK_SEL, 1);
+		integloop_gain <<= 1;
+	} else {
+		hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_SVS_MODE_CLK_SEL, 2);
+		integloop_gain <<= 2;
+	}
+
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_PLL_IVCO, 0x07);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_VCO_TUNE_CTRL, 0x00);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_CLK_SELECT, 0x30);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_HSCLK_SEL, 0x20 | pd.hsclk_divsel);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_LOCK_CMP_EN, 0x0);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_DEC_START_MODE0, dec_start);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_DIV_FRAC_START1_MODE0,
+		       frac_start & 0xff);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_DIV_FRAC_START2_MODE0,
+		       (frac_start >> 8) & 0xff);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_DIV_FRAC_START3_MODE0,
+		       (frac_start >> 16) & 0xf);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0,
+		       integloop_gain & 0xff);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0,
+		       (integloop_gain >> 8) & 0xff);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_LOCK_CMP1_MODE0,
+		       pll_cmp & 0xff);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_LOCK_CMP2_MODE0,
+		       (pll_cmp >> 8) & 0xff);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_LOCK_CMP3_MODE0,
+		       (pll_cmp >> 16) & 0x3);
+
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_VCO_TUNE_MAP, 0x00);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_CORE_CLK_EN, 0x2c);
+	hdmi_pll_write(hdmi_phy, QSERDES_V3_COM_CORECLK_DIV_MODE0, 5);
+
+	/* TX lanes setup (TX 0/1/2/3) */
+	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) {
+		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_DRV_LVL,
+					   0xf);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL,
+					   i == 3 ? 0x00 :
+					   i == 1 ? 0x02 : 0x03);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1,
+					   0x00);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2,
+					   i == 3 ? 0x00 : 0x1c);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET,
+					   (i == 0 || i == 3) ? 0x03 : 0x00);
+		}
+	} else if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD) {
+		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_DRV_LVL,
+					   0x0f);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL,
+					   i == 3 ? 0x00 : 0x03);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1,
+					   0x00);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2,
+					   i == 3 ? 0x18 : 0x16);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET,
+					   i == 0 ? 0x03 : 0x00);
+		}
+	} else if (bclk > HDMI_MID_FREQ_BIT_CLK_THRESHOLD) {
+		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_DRV_LVL,
+					   0x0f);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL,
+					   i == 3 ? 0x00 : 0x05);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1,
+					   0x00);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2,
+					   0x0e);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET,
+					   0x00);
+		}
+	} else {
+		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_DRV_LVL,
+					   i == 3 ? 0x00 : 0x01);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL,
+					   0x00);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1,
+					   0x00);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2,
+					   i == 3 ? 0x18 : 0x16);
+			hdmi_tx_chan_write(hdmi_phy, i, REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET,
+					   0x00);
+		}
+	}
+
+	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD)
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8998_PHY_MODE, 0x5);
+	else
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8998_PHY_MODE, 0x4);
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		hdmi_tx_chan_write(hdmi_phy, i,
+				   REG_HDMI_8998_PHY_TXn_LANE_CONFIG,
+				   0x10);
+	}
+
+	return 0;
+}
+
+static int qmp_hdmi_8998_phy_power_on(struct phy *phy)
+{
+	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+	u32 status;
+	int i, ret = 0;
+
+	ret = qmp_hdmi_8998_phy_set_rate(hdmi_phy);
+	if (ret) {
+		dev_err(hdmi_phy->dev, "Setting pixel clock rate failed\n");
+		return ret;
+	}
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8998_PHY_CFG, 0x1);
+	udelay(100);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8998_PHY_CFG, 0x59);
+	udelay(100);
+
+	ret = readl_poll_timeout(hdmi_phy->serdes + QSERDES_V3_COM_C_READY_STATUS,
+				 status, status & BIT(0),
+				 HDMI_PLL_POLL_TIMEOUT_US,
+				 HDMI_PLL_POLL_MAX_READS * HDMI_PLL_POLL_TIMEOUT_US);
+
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PLL is not locked\n");
+		return ret;
+	}
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		hdmi_tx_chan_write(hdmi_phy, i,
+				   REG_HDMI_8998_PHY_TXn_LANE_CONFIG, 0x1f);
+	}
+
+	ret = readl_poll_timeout(hdmi_phy->phy_reg + REG_HDMI_8998_PHY_STATUS,
+				 status, status & BIT(0),
+				 HDMI_PLL_POLL_TIMEOUT_US,
+				 HDMI_PLL_POLL_MAX_READS * HDMI_PLL_POLL_TIMEOUT_US);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PLL is not locked\n");
+		return ret;
+	}
+
+	/* Restart the retiming buffer */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8998_PHY_CFG, 0x58);
+	udelay(1);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8998_PHY_CFG, 0x59);
+
+	return 0;
+}
+
+static int qmp_hdmi_8998_phy_power_off(struct phy *phy)
+{
+	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8998_PHY_PD_CTL, 0);
+	usleep_range(100, 150);
+
+	return 0;
+}
+
+static long qmp_hdmi_8998_pll_round_rate(struct clk_hw *hw,
+				     unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	return clamp(rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+}
+
+static unsigned long qmp_hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct qmp_hdmi_phy *phy = hw_clk_to_pll(hw);
+	u32 cmp1, cmp2, cmp3, pll_cmp;
+
+	cmp1 = hdmi_pll_read(phy, QSERDES_V3_COM_LOCK_CMP1_MODE0);
+	cmp2 = hdmi_pll_read(phy, QSERDES_V3_COM_LOCK_CMP2_MODE0);
+	cmp3 = hdmi_pll_read(phy, QSERDES_V3_COM_LOCK_CMP3_MODE0);
+
+	pll_cmp = cmp1 | (cmp2 << 8) | (cmp3 << 16);
+
+	return mult_frac(pll_cmp + 1, parent_rate, HDMI_PLL_CMP_CNT);
+}
+
+static int qmp_hdmi_8998_pll_is_enabled(struct clk_hw *hw)
+{
+	struct qmp_hdmi_phy *phy = hw_clk_to_pll(hw);
+	u32 status;
+	int pll_locked;
+
+	status = hdmi_pll_read(phy, QSERDES_V3_COM_C_READY_STATUS);
+	pll_locked = status & BIT(0);
+
+	return pll_locked;
+}
+
+static const struct clk_ops qmp_hdmi_8998_pll_ops = {
+	.recalc_rate = qmp_hdmi_8998_pll_recalc_rate,
+	.round_rate = qmp_hdmi_8998_pll_round_rate,
+	.is_enabled = qmp_hdmi_8998_pll_is_enabled,
+};
+
+static const struct phy_ops qmp_hdmi_8998_phy_ops = {
+	.init		= qmp_hdmi_phy_init,
+	.configure	= qmp_hdmi_phy_configure,
+	.power_on	= qmp_hdmi_8998_phy_power_on,
+	.power_off	= qmp_hdmi_8998_phy_power_off,
+	.exit		= qmp_hdmi_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+const struct qmp_hdmi_cfg qmp_hdmi_8998_cfg = {
+	.pll_ops = &qmp_hdmi_8998_pll_ops,
+	.phy_ops = &qmp_hdmi_8998_phy_ops,
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h
new file mode 100644
index 0000000000000000000000000000000000000000..cac28bff396400eb05794daec705104defbcb796
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Ltd.
+ * Copyright (c) 2025, Qualcomm Incorporated
+ */
+
+#ifndef PHY_QCOM_QMP_HDMI_H
+#define PHY_QCOM_QMP_HDMI_H
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/regulator/consumer.h>
+#include <linux/phy/phy-hdmi.h>
+
+#define MAX_CLKS 2
+#define MAX_SUPPLIES 2
+
+#define HDMI_NUM_TX_CHANNEL 4
+
+struct qmp_hdmi_phy {
+	struct device *dev;
+	struct phy *phy;
+	void __iomem *serdes;
+	void __iomem *tx[HDMI_NUM_TX_CHANNEL];
+	void __iomem *phy_reg;
+
+	struct phy_configure_opts_hdmi hdmi_opts;
+
+	struct clk_hw pll_hw;
+	struct clk_bulk_data clks[MAX_CLKS];
+	struct regulator_bulk_data supplies[MAX_SUPPLIES];
+};
+
+struct qmp_hdmi_cfg {
+	const struct clk_ops *pll_ops;
+	const struct phy_ops *phy_ops;
+};
+
+#define hw_clk_to_pll(x) container_of(x, struct qmp_hdmi_phy, pll_hw)
+
+static inline void hdmi_phy_write(struct qmp_hdmi_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->phy_reg + offset);
+}
+
+static inline u32 hdmi_phy_read(struct qmp_hdmi_phy *phy, int offset)
+{
+	return readl(phy->phy_reg + offset);
+}
+
+static inline void hdmi_pll_write(struct qmp_hdmi_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->serdes + offset);
+}
+
+static inline u32 hdmi_pll_read(struct qmp_hdmi_phy *phy, int offset)
+{
+	return readl(phy->serdes + offset);
+}
+
+static inline void hdmi_tx_chan_write(struct qmp_hdmi_phy *phy, int channel,
+				      int offset, int data)
+{
+	writel(data, phy->tx[channel] + offset);
+}
+
+int qmp_hdmi_phy_init(struct phy *phy);
+int qmp_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts);
+int qmp_hdmi_phy_exit(struct phy *phy);
+
+extern const struct qmp_hdmi_cfg qmp_hdmi_8996_cfg;
+extern const struct qmp_hdmi_cfg qmp_hdmi_8998_cfg;
+
+#endif

-- 
2.39.5

