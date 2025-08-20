Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456EFB2D865
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4392C10E6B2;
	Wed, 20 Aug 2025 09:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXgMSf3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2902310E6B2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1obND027686
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AWgj+1YIpaMRY/yWhK0hs1P4y4VfFaoAvgfjBAJlkCg=; b=cXgMSf3fnD8zorX8
 JopNHWRQEAlnni3NWHN+ivR8Ct+zyyPUQ03LPJBqJZdjbLLkyUnX+F7knHd5WmYe
 GAYyIuu96X5M/MBcsZaoCNmsksAic8cf15FxNNpmMvy8aJGY7E6IWFoYwu13I2ym
 BJ8eBQ8PemGMtbAVxM3SAHSgtkxYKxkcAILQS3PDdiV3EApxYMWFeGaIWJdYlxV/
 vYWE7jvdhJ6+pdvq0BKm+SGoZupaEC0Bs1ofiEimBUOzhc5/tEztdVB0uDTVOYSB
 Es6p+iBbaLK8Ae2fGBZsH8qRP2Rs/2RqB9Oo8Gw91JKYDZKvdQxmyTnMw0B/Nolg
 7VCySw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52as6d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32326bedeb3so2099479a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682564; x=1756287364;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AWgj+1YIpaMRY/yWhK0hs1P4y4VfFaoAvgfjBAJlkCg=;
 b=eFOGQz9yh1WAdz90Nb3jwaRSgD4YDjYxKouLBofh/Tv2GApOvXVbgW7+ZOWDdq+NmF
 Y0ZnLaoMnNh27kyugM138Z2lorV//UCziNRih3VsUs/TeRNV0qARw83D7lnrY3qrjmcj
 GTWl2ARhvXN5RrAFhSism6+AJNn0JG2bwl5oRwdvvGc0bHkCABH3MP+IRR3oKti1Bm8K
 VnuYG5cx+5SrdggtdooFIWony+BuBPG33QZx0oUJ3Z1BERBdiKupLA5qSYZUZJ9jLGFc
 24MT7a8/LYObPDznO0BN/0+DrqDbuY5GWZVNa0JPMgcgpLuQ8PHM+Z0zBAcCDBx9pLnt
 oKVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfefJ5XB6wqGse5G+kQwWn7BzWem9hKDyvwUv+ge9UESMUqKFRssEZfWacK0cAKt4S47CHgFyPjmQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCahKZMa6PdySe/7pAXMgPi3Lb5q+M606qOndwQcKn+jF+xLkT
 TQwA0g0MLE0W5n9dH+GIR/oBiVU7iGylzpsVS/7rRRb8JN/iYFATcrycSD99yeCfa2QRK9ls8Ng
 gGU4bJnBcB9J08hiNbqsV/Gw1xqgNYdcJBGrUnMh02uATQhE0vFsngp2dxYFU/DP/tnWmXYoNU1
 NOV7I=
X-Gm-Gg: ASbGncsVMrfljVvLIENiWnyxMXZjM7Ywkmi2DeDMoAHoB32aAQX+g/n3vZ2kXo9r9Fb
 yNycc6KPamf2WdlOP4kyaKXU7nk7Mesp7V9Da91ex/p05Rvf4mwPwsi2JmL0ysEeVU3g0jwDhDr
 IavL+4OzX5fBej6GxTxNHvXlgiNRq0vlUYFnGL/O+zuo58Wt5pLgHEBeD4lsn6jquD/yxPi5x1H
 FsrDPIwJPUhl7PBzbeI6NaWw7z7oaZh75vtn7GVMrQXiTzYASS2dvYB8tQO7U7jFsPa2ikn/MCC
 p243gb8M6kDbX/ZNeOBivTTJtbkBbygDdCFvqEUVBRr75V5pAS5CrTij6pYUoULygm3YydxGGKg
 Oey1ebf6E1o8skD7/y6+Ki6oWxd59mOl2U/qaNFiB63fYYOAB5XJOWkMK
X-Received: by 2002:a17:902:f68e:b0:245:f771:4241 with SMTP id
 d9443c01a7336-245f771442amr2583605ad.7.1755682563892; 
 Wed, 20 Aug 2025 02:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9IDMLLuCizqDn1Eie9iwbgkWU+1zGOnXJZGc8mc4IQjEGtB2REIhr9sTL5kOXEZ1CIGViEw==
X-Received: by 2002:a17:902:f68e:b0:245:f771:4241 with SMTP id
 d9443c01a7336-245f771442amr2583365ad.7.1755682563442; 
 Wed, 20 Aug 2025 02:36:03 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:36:03 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:46 +0800
Subject: [PATCH v3 04/14] phy: qcom: qmp-usbc: Add USBC PHY type enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=2215;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=L77RPub4GUYm5+EpcE6zsdJ8e7TcjMW6KL61o2Mo0ZI=;
 b=DQ0gW20v1QwVf9ZNCC8n6LW3iHDlR0KstZhA7x5Lbvq9mjFrBMw+JkSg2jH/jW3XPqEVnFNMs
 VC00FmcL4nJCkp/c5mYGZ58jPMhHMU8LWEPS3yPwz4BZVLeNkt6MXYj
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6RvIkgjAy8j8
 H7fgmTtM5Z4whiNnjpX6sYrT0K2srFTzAuAd8hqWQ5kSdQLuIFTqjxcsF1Nh79DGaNt9zL/RFVd
 B9WQjBw5j6To/Zws1JkaRwBGib37T4FaQMwNmj4PA+Q8sXdfh2dsZ2PZPAZ1utkX2xc335zPQBo
 NA0zDGdsvli4n8/wWGyOA0kt9gLtneF5NTTxfRaiFnWJeyIydtpsEhoWPGAtoyuODnKBG/ARfKL
 BDUkljNxT8XGC2o3sEWfYXu2lIsYzHSi6tuoYOPwsYlFUnVALXna1xuKHNybqjMwVeveeaBnS/e
 tvSR+7Dhqu7kJrRGaCMM32VvOMwLPq1eX/IpJlnr0qEpjf1qfoOl8K8vm5JgO8gEqnaXRhUHBnz
 cvmkLKblvPAYOE6uXXg38Ah07RBSRg==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a59705 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FzSNxF14YNJ6EpJegcUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: obratH0tO3tbW9qbsnfoOXuxI6x3ItC2
X-Proofpoint-GUID: obratH0tO3tbW9qbsnfoOXuxI6x3ItC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

Introduce qmp_phy_usbc_type enum and a 'type' field in qmp_phy_cfg to
differentiate between USB-only PHYs and USB/DP switchable PHYs.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index e484caec2be20121cfe287c507b17af28fb9f211..5afe090b546977a11265bbffa7c355feb8c72dfa 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -284,6 +284,11 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
 };
 
+enum qmp_phy_usbc_type {
+	QMP_PHY_USBC_USB3_ONLY,
+	QMP_PHY_USBC_USB3_DP,
+};
+
 struct qmp_usbc_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -298,6 +303,7 @@ struct qmp_usbc_offsets {
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
 	const struct qmp_usbc_offsets *offsets;
+	const enum qmp_phy_usbc_type type;
 
 	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
@@ -408,6 +414,7 @@ static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
 
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+	.type			= QMP_PHY_USBC_USB3_ONLY,
 
 	.serdes_tbl             = msm8998_usb3_serdes_tbl,
 	.serdes_tbl_num         = ARRAY_SIZE(msm8998_usb3_serdes_tbl),
@@ -424,6 +431,7 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 
 static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+	.type			= QMP_PHY_USBC_USB3_ONLY,
 
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
@@ -440,6 +448,7 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 
 static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+	.type			= QMP_PHY_USBC_USB3_ONLY,
 
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),

-- 
2.34.1

