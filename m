Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63D90170B
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 18:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92C410E0CF;
	Sun,  9 Jun 2024 16:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ls0+WV9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF2110E025
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 16:53:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459Fc4LF019360;
 Sun, 9 Jun 2024 16:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=bk7TND1ZjinVfNUwzCl0o1
 bGbK+6tHNetWWllg+driU=; b=Ls0+WV9iwh5g6hWX1nsbqNRpmjWM37+lNNcVMw
 HYYIoRHS1z8EWPU32U2tK0KxIVkDe/NnknbRclo8YTO1KLwk5FfYb8BPWh4iYoR+
 Bn2eTxZbq2Cr+aZMxVxCu9pNmcL/JqJtFZxe9B4GnQwAyHfdKfy9f8dn0ABKX5X5
 cVamoS38zr0AxE0S43/BW4n2rIcUzqvjDmOatHwPp4N71fI7o5sj3yMXV5PMwWsY
 sPQnjPYt/zMNMrLvu4fyE158R4xkRTqY1XlwY67jnmZhb24LZoiodk/ppZi42UL7
 +OUP0RABfqrtaomfVXKc9sdpGGQp6HLOdX/7b4SDxwXTUvHA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfp79tgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Jun 2024 16:53:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 459GrO3o014478
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 9 Jun 2024 16:53:24 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Jun 2024
 09:53:23 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 9 Jun 2024 09:53:21 -0700
Subject: [PATCH] drm/panel: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240609-md-drivers-gpu-drm-panel-v1-1-04b2a1ae7412@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAADeZWYC/x3MSw7CMAxF0a1UHmMpFCifrSAGTuK2lpoQ2bSqV
 HXvBGbvDN7dwFiFDR7NBsqLmLxzxfHQQBgpD4wSq6F17dl17o4pYlRZWA2HMtedsFDmCbvLzZE
 P/SleGeq9KPey/tPPV7UnY/RKOYy/4CR5XjGRfVhh37+7PoJaiQAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yKeKqqNlljOKa-R8bEhP47xfZOspwgdQ
X-Proofpoint-ORIG-GUID: yKeKqqNlljOKa-R8bEhP47xfZOspwgdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_12,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406090132
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

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-abt-y030xx067a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-auo-a030jtn01.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-innolux-ej030na.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-newvision-nv3052c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-novatek-nt39016.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-orisetech-ota5601a.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c     | 1 +
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c      | 1 +
 drivers/gpu/drm/panel/panel-innolux-ej030na.c    | 1 +
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c  | 1 +
 drivers/gpu/drm/panel/panel-novatek-nt39016.c    | 1 +
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
index 662c7bcbe6e5..4692c36fe217 100644
--- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
+++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
@@ -381,4 +381,5 @@ module_spi_driver(y030xx067a_driver);
 
 MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
 MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
+MODULE_DESCRIPTION("Asia Better Technology Ltd. Y030XX067A IPS LCD panel driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
index 6c86ebf2cad7..77604d6a4e72 100644
--- a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
+++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
@@ -305,4 +305,5 @@ module_spi_driver(a030jtn01_driver);
 
 MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
 MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
+MODULE_DESCRIPTION("AU Optronics A030JTN01.0 TFT LCD panel driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
index 8fdbda59be48..f85b7a4cbb42 100644
--- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
+++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
@@ -306,4 +306,5 @@ module_spi_driver(ej030na_driver);
 
 MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
 MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
+MODULE_DESCRIPTION("Innolux/Chimei EJ030NA TFT LCD panel driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 1aab0c9ae52f..b8f7c673ab50 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -719,4 +719,5 @@ module_spi_driver(nv3052c_driver);
 
 MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
 MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
+MODULE_DESCRIPTION("NewVision NV3052C IPS LCD panel driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index 059260262b5a..9fa7654e2b67 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -356,4 +356,5 @@ module_spi_driver(nt39016_driver);
 
 MODULE_AUTHOR("Maarten ter Huurne <maarten@treewalker.org>");
 MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
+MODULE_DESCRIPTION("Novatek NT39016 TFT LCD panel driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
index c415dacf1816..fc87f61d4400 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
@@ -360,4 +360,5 @@ static struct spi_driver ota5601a_driver = {
 module_spi_driver(ota5601a_driver);
 
 MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
+MODULE_DESCRIPTION("Orisetech OTA5601A TFT LCD panel driver");
 MODULE_LICENSE("GPL");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240609-md-drivers-gpu-drm-panel-6580abcf3d7e

