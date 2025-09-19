Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC37B89EAE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43DC10EA04;
	Fri, 19 Sep 2025 14:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KG30EoIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881BD10EA04
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:55 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDOnVc030556
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4NPGHZZG6XJ298+gcQuKbhaG+vQUCP3RgV4uBh+3CL8=; b=KG30EoIjYXW9CY4B
 BF2pcR4slxppGfefFAtOnTz7qERmPJqIqcrn4TaUD4NfU0XU6g5LTGBzoXgqDjG8
 vJBId/NsBgTDvU5Q/u/pPArppULMDrq9YSrmHMpF5V4+IGJ25uoBIdFt2JqZJbvT
 Te6zI6rQejM6P3HlTmoI0miXRLU6OwR6u6vIA2LlO94XGBdSmR2d6y8W30iMhumC
 QZOIivBZ3KWzpT6CCWWxdIUdItPJVpLj1GoPzfX2uLe4f9SBmf6rmeFhG33lHEQ3
 bqQSgp+1jHACHY40yUFHmbCLCD1h6XBF73k1yfGKRzuRITk++O/BSktYqsdoL49x
 NXyvQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49916x1j2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-267f099ca68so4541645ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758291954; x=1758896754;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4NPGHZZG6XJ298+gcQuKbhaG+vQUCP3RgV4uBh+3CL8=;
 b=Wy7/9e40FIidwG5DngtWshTgmQ2xjy9Pvhg1ppwv01DWZS+W0wFyEV1GEszxI5aXhE
 /q/sGWd154X+vSKSElozU3lZHNf1NWbQOfWU6pyRZbbhRic9sqOY2c2eSPuI6bTrc0KA
 K1r5anHi9X/j7X71NnBhQg5qzUr0X5RPP2CaIKy5/00XIprDp+B1hI5wskMVtMy5C6Ch
 RExnV62GyQdIraLFiWypL9tKsCodkjscGsK/Mn9jJVwbIFRsf/cjmSO4Q8/TjrRVZZJo
 Hj0HthCUaS2Cu0R/2WwmI8SASFr6++H6RhJ9Clv3HZd4F0X4/xyzbglwhE7DTcs3NUdC
 tywg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoNJHGK134OYqPrup0TFF4N+hSm76kACwc5gcfLPUCotGvaQ/DOUc0725awwu227LquYD/tqbxVh8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5Eyu+bU+burYE0fkjHQxL1aIE/TJ7/i2+e2UsphOTS5dEHprN
 OmHiF0tqPVcG8/d954Erv3GbZ0FBX8DGNS95gDDf7lBNeJXiYygUJLkT+oz/qEXuOgRM5CT1FBE
 eN9okGW7C76HofqwppZzlWyvtCDRCN4xFn2V/Gz6gzvDdh6BBmC0D3q7HdSTVqzEBFo8LNrA=
X-Gm-Gg: ASbGnct+6eygM+1uvyJU6jRa4rMUAcfWVZXuBcjfJXruHDcVdhzzpK3bqiIDyJA937V
 PbpB0S8P3yVToKTTmer9vMBt+6zQFrT8oYMHt5crrtxuDKc51H11TCcm3ueDdQzRRQR3XQXhzz3
 /bViLYm+HG5IhTkdTEV1x1RLsttDf9ZyyVCRxwRBFkKjT4U0F3loDeehYYKaNywPil/477n+e9W
 vuYfEgpJqS8Gkrbk43lSdtopqdly00O6gmQnbhq9Eo5puSBH442VPsXK5FUVGH++iSYOfzUkJrq
 nBfNLyDU2fJf7oi9b8cX6bZrdRvolM2vbU8CJgLwNVLhtticjAL3f04dmQLoa+7HsUiFRZUNcCl
 MVLhJlKIR+/2hGQ==
X-Received: by 2002:a17:902:e805:b0:267:b312:9cd8 with SMTP id
 d9443c01a7336-269ba5477ffmr23548475ad.8.1758291953928; 
 Fri, 19 Sep 2025 07:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhWf2RyPDPG5JNlEIwfeKF5HBQZnjfl4KQdteIogUTd9k5aZvCF48gGr20YVSz2GhdBqTvZA==
X-Received: by 2002:a17:902:e805:b0:267:b312:9cd8 with SMTP id
 d9443c01a7336-269ba5477ffmr23548105ad.8.1758291953373; 
 Fri, 19 Sep 2025 07:25:53 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:25:52 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:24 +0800
Subject: [PATCH v5 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-7-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291894; l=2160;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=X6747pX/z+HXPUbzpVscGZ+y7P+DLT2Ka1aFOv7nPv4=;
 b=SSWMxTP2f7OASGPCipXSWGNWwHj7K6Mc91TPyvdWPxTeS5cOPpYMfWRQHbNxnmcxvYFsI1FKL
 cF4Y8nqexATB6dv66j+Lt7F8NuZOncIpFaP8S1YPyoHfwOMj7NrfW4w
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0OCBTYWx0ZWRfX3mPIT0jt+eVH
 nNCVgZ4puTz3qU3keIwftlLG9f8Ggjdulj+BMQbo8mHfdjIDr/0CMHW1XpsZ7acQRpRRoTII9xl
 8YJdcQRsOM1dFQIiUrGzVqLosIvy1CB4UCKbi9I2ySekGrhW4GPAdrcJogD6hcG6NJvOhhleM7N
 LkmS53czbMFDuGQJqzxftfQTLtUvfxutci+A3yhd3kxEjz72dBilWy08yfGkr+E+AJxn7JE6n3u
 v3RBSyE8Apc02nWbRVwQYt7b2xmt3bC0jN5RptGtOA4sx9YLeI2pXYjzkJ78H+MpGPGRtybrg4X
 Rtl8r2bXl+RVvc7VrQ8Ckl9+XsoKvwfmDl2NHgzXPlffGs4IgzkYX5l7/dg71KxQeWIgSEfK/Xs
 YQDq+cGh
X-Proofpoint-GUID: UrH-fuq5IoStq2w9rkI6HVv-ph37CuhK
X-Authority-Analysis: v=2.4 cv=LcM86ifi c=1 sm=1 tr=0 ts=68cd67f3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lTgBPn2m1EfcVYAV3zkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: UrH-fuq5IoStq2w9rkI6HVv-ph37CuhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190048
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

Move USB-only register setup from com_init to qmp_usbc_usb_power_on,
so it runs only for USB mode.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index bfb94fa1a86cc52e1c67f954376d5fd8d321f4f3..d570ce486aee8e8a3cf3f7bb312a00bc1cd03d82 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -30,6 +30,8 @@
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
+#define SW_PORTSELECT_VAL			BIT(0)
+#define SW_PORTSELECT_MUX			BIT(1)
 
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
@@ -535,8 +537,6 @@ static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	void __iomem *pcs = qmp->pcs;
-	u32 val = 0;
 	int ret;
 
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -561,16 +561,6 @@ static int qmp_usbc_com_init(struct phy *phy)
 	if (ret)
 		goto err_assert_reset;
 
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
-
-#define SW_PORTSELECT_VAL			BIT(0)
-#define SW_PORTSELECT_MUX			BIT(1)
-	/* Use software based port select and switch on typec orientation */
-	val = SW_PORTSELECT_MUX;
-	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
-		val |= SW_PORTSELECT_VAL;
-	writel(val, qmp->pcs_misc);
-
 	return 0;
 
 err_assert_reset:
@@ -603,6 +593,14 @@ static int qmp_usbc_usb_power_on(struct phy *phy)
 	unsigned int val;
 	int ret;
 
+	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
+
+	/* Use software based port select and switch on typec orientation */
+	val = SW_PORTSELECT_MUX;
+	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
+		val |= SW_PORTSELECT_VAL;
+	writel(val, qmp->pcs_misc);
+
 	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
 		      cfg->serdes_tbl_num);
 

-- 
2.34.1

