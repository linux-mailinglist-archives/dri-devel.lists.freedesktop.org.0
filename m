Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5427FABE4F8
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 22:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D26E10E5A5;
	Tue, 20 May 2025 20:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqeIfzI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FF910E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:44:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe3dI001359
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ykPlUua1WYJOj8gRH4+W8xOqCf2Wt8uktxwJQmda3VQ=; b=bqeIfzI6O775RuX9
 XEgANszm+qJzkfQrZA3KYborl8uhrcVVj7Eg/e4CGQ9prJkt+SjWbhrrBrwCLGuW
 /p7FkazLnkV5ThJYB4slpamVeZF/RIxhAVbmbW492wt34VyrPi/jh8dUL1kA6HYc
 DXmx3mwqFIyhbxCkwYb/KeeHS1mnt1/ibX2JsumDUXgzvYoD42Q0XFfoNssuEJdA
 yn4K5nxeESVgo8zQqBMiy9VQqrkjpkjhynxrHFB4gDgwF63uaetFniueJekZ5OTj
 ZdPul4yoexnADtMLaS7A8A/rsNTFOyXkE6Vncq8eeME/A87MWQZPWz6YiDzUygMb
 sDdbAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf18kq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:44:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8c0a83f9cso76138856d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 13:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747773896; x=1748378696;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykPlUua1WYJOj8gRH4+W8xOqCf2Wt8uktxwJQmda3VQ=;
 b=Z/NRTPHwYbtw+Xaq3dAv50WYvqE5Ij5mMpB1qQhjtwp+61qZwqkTLxdqZgiJ7DQZEx
 +1ynXlTNBM1BFOGxcnXPr6chJRNvigZ+4BNT+Dpp7EXay+legcst0Ju3nNjyn4Re7ZSL
 KhfWM8NZcdZ2toERlXRzT2it/vKCoSg3amFwb5pe2uBy0kgv09q2yh/ZaNuagHRlbYG/
 49M3OiFhYEjnLiHYpBVFOvbjwuiohrDPOCf5Q9X5fy4rj0+WlVo/Y8aLOjhtFDV8ZFI9
 EMePTXlrrSePfgcYXrP7SuAhSOBIB9CA1ZfvTmREkgO0jmFG1WPSeqQnFqUMHu+Iqw2H
 uWCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqLvjiEzxizy3boNulXQ1Uf/C8nA5CgCXUjtoEI0DzTH/kZydNPXkw181p+0IJhdUoaVT7RADwKzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzky2gaBJd2twgeD3O/LgrV4MDkrn3vnTjjw8eyOtBvOVTzEyzi
 WWcnuTR4/R9lyvoFDX5C3ciS0WVmmWr2WTPQPO204Y55xrQvByMUWlsh3djI2lXj9Ly80Lni+jf
 i8ysbYhAH3vHLILfORnNsBFaoZkkBsrJ2qbpx6YlqGXtQuwvCu40IO4D9MyGrir8v4wmTjAk=
X-Gm-Gg: ASbGncsZvfV/xSmUEJSYOCqxvWVxrsvdk/HiA609hwMOuUsQjAbf0FhFI1r9nlFuAja
 7md7LuocSI9ZnWpGgcqNOg+trP+mAjk/lbh8qOp6Hm74DccvNrf7PILr8i28TY31krfdO1HA15U
 mjdm9UYOBG3xeK+1DwCVnaofFLzz79hrNbLUcLZWdLOUH1jLRjVXCK2NkxR9DxC431xD/w9GZuR
 jMTVicXZFvQLYZ+lroBCXRDVyVZjwlWVS26JwGgIXAdnpEcmWDbIrIUdRr/2HnQcXwIpNNKbvn3
 Q6fwFZarv2eiimP+RQjjsQtblzhObYuaqa8ZpXUlWeQGBcARZiCbuyZ5EeX1ZS6kybDH7LTC8IE
 1D/w1rJNBoe9rBrM1irhgRyQs
X-Received: by 2002:a05:6214:1cce:b0:6e8:f4e2:26ef with SMTP id
 6a1803df08f44-6f8b2d853a5mr303605826d6.31.1747773896244; 
 Tue, 20 May 2025 13:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExse+TXH1VriLP4f0U2rBvd0pIcWTRd0DsJ4Y79tLbGTK08qfgjRloMVmoV33Gc93nL2+Brw==
X-Received: by 2002:a05:6214:1cce:b0:6e8:f4e2:26ef with SMTP id
 6a1803df08f44-6f8b2d853a5mr303605316d6.31.1747773895791; 
 Tue, 20 May 2025 13:44:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f163ccsm2497950e87.39.2025.05.20.13.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:44:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 May 2025 23:44:44 +0300
Subject: [PATCH v4 2/5] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-fd-hdmi-phy-v4-2-fcbaa652ad75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2R5NhT4/9vDNb/+f8UkhB7hzE5bEH/Asz87X2bNQLwQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoLOnAdDwo49oDYbS1+t5ukVG1d9uFbRIxpBN+H
 Tz8Z0JgZ+iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCzpwAAKCRCLPIo+Aiko
 1XhcCACv+if9OWNeFEos1mVk7rlmiEnK1NhPAIrFf8t3Q2zI+I/VveqtxklSEp1Q8Iq0ggj3NFw
 junUhBnk6cLbZa06b6uxSaIwKd9GbYwSX1ysiZjwHunNJy3T3mW4YXRPF1HLVYirwIgJNGhumoN
 Gm1pWzwUWCVhYUEGkxtbJMQeQERwFdmvMBSa1gfgqNjWrVNHGio+VS7egsjwgC3QJiyqZkTA9tU
 yVA3DWtsoEhmOuU4AiBK295kU1jCA47DWuKhSwU3EO612CPAsAhtM6C3qT1xK59vNtPrbYoxN8X
 ZTEF4T5Y3rAJ4VY90TbNdqxK2m1mY59Ar+P5ymM2uzFl7+wu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4xhD-HQuqg93aYwbRPST2fDyOqF8QCCZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2OCBTYWx0ZWRfX9d7+FY+lGqTD
 oyE0xcMZ7z/Lh/QIQ/flIpq34G6DcZDrB5f+u8ksiqFKMjSuwxU6HHs2N2KFxK47n+ZceoENNAC
 moRj1kM1viLKee5HeIaTR1KXVnInlpx4DF3Rj4pRSLdWVuQwzdh1Km34JNUSPflmnSy6Q2abZU0
 lvsF+OQPHcwcfugxGUn2PFeWc5XgcMSGv0pxvo9QJ9FhhbYsHruy9cK2NcBi1I7L7LH7gxtZH1c
 pkElnI7PJnAFwi0Hg0V3RbgxCUqSFjCfU1T4TYsxmjpE06ah5MdfjmgIAQj+zGMCjga2DtAMP7X
 5bKVpPgtqFnGmBewBgnW0n3j8eqaxStna2GBICIhiTwgGVO6/lO2vKUETU0cbq7TqpwyG6lniPL
 PB2wMJ3xRhdqn4RC74gvICbrpbIKsZR1ohLv31TDr5ZXEqAz0V/4bfgGKhsIG/u4Lh6Hjey4
X-Authority-Analysis: v=2.4 cv=F6JXdrhN c=1 sm=1 tr=0 ts=682ce9c9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=O3Nj34nO-tYaQW5E_hgA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4xhD-HQuqg93aYwbRPST2fDyOqF8QCCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=878 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200168
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

The "uni" PLL is shared between several PHYS: APQ8064's SATA,
MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 23 +-------------------
 drivers/phy/qualcomm/phy-qcom-uniphy.h       | 32 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index cae290a6e19fcb7fd68fe6cd0229b9b00d47131c..dd9929429f9a0e2f265180e8d3f390451d91adde 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -15,28 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 
-/* PHY registers */
-#define UNIPHY_PLL_REFCLK_CFG		0x000
-#define UNIPHY_PLL_PWRGEN_CFG		0x014
-#define UNIPHY_PLL_GLB_CFG		0x020
-#define UNIPHY_PLL_SDM_CFG0		0x038
-#define UNIPHY_PLL_SDM_CFG1		0x03C
-#define UNIPHY_PLL_SDM_CFG2		0x040
-#define UNIPHY_PLL_SDM_CFG3		0x044
-#define UNIPHY_PLL_SDM_CFG4		0x048
-#define UNIPHY_PLL_SSC_CFG0		0x04C
-#define UNIPHY_PLL_SSC_CFG1		0x050
-#define UNIPHY_PLL_SSC_CFG2		0x054
-#define UNIPHY_PLL_SSC_CFG3		0x058
-#define UNIPHY_PLL_LKDET_CFG0		0x05C
-#define UNIPHY_PLL_LKDET_CFG1		0x060
-#define UNIPHY_PLL_LKDET_CFG2		0x064
-#define UNIPHY_PLL_CAL_CFG0		0x06C
-#define UNIPHY_PLL_CAL_CFG8		0x08C
-#define UNIPHY_PLL_CAL_CFG9		0x090
-#define UNIPHY_PLL_CAL_CFG10		0x094
-#define UNIPHY_PLL_CAL_CFG11		0x098
-#define UNIPHY_PLL_STATUS		0x0C0
+#include "phy-qcom-uniphy.h"
 
 #define SATA_PHY_SER_CTRL		0x100
 #define SATA_PHY_TX_DRIV_CTRL0		0x104
diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
new file mode 100644
index 0000000000000000000000000000000000000000..e5b79a4dc270f25d8979f51bf4acd6c76998032e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef PHY_QCOM_UNIPHY_H
+#define PHY_QCOM_UNIPHY_H
+
+/* PHY registers */
+#define UNIPHY_PLL_REFCLK_CFG		0x000
+#define UNIPHY_PLL_PWRGEN_CFG		0x014
+#define UNIPHY_PLL_GLB_CFG		0x020
+#define UNIPHY_PLL_SDM_CFG0		0x038
+#define UNIPHY_PLL_SDM_CFG1		0x03c
+#define UNIPHY_PLL_SDM_CFG2		0x040
+#define UNIPHY_PLL_SDM_CFG3		0x044
+#define UNIPHY_PLL_SDM_CFG4		0x048
+#define UNIPHY_PLL_SSC_CFG0		0x04c
+#define UNIPHY_PLL_SSC_CFG1		0x050
+#define UNIPHY_PLL_SSC_CFG2		0x054
+#define UNIPHY_PLL_SSC_CFG3		0x058
+#define UNIPHY_PLL_LKDET_CFG0		0x05c
+#define UNIPHY_PLL_LKDET_CFG1		0x060
+#define UNIPHY_PLL_LKDET_CFG2		0x064
+#define UNIPHY_PLL_CAL_CFG0		0x06c
+#define UNIPHY_PLL_CAL_CFG8		0x08c
+#define UNIPHY_PLL_CAL_CFG9		0x090
+#define UNIPHY_PLL_CAL_CFG10		0x094
+#define UNIPHY_PLL_CAL_CFG11		0x098
+#define UNIPHY_PLL_STATUS		0x0c0
+
+#endif

-- 
2.39.5

