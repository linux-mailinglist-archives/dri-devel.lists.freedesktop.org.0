Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77148B2D86E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D4F10E6CC;
	Wed, 20 Aug 2025 09:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTmPs7x8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B07810E6CC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1pPb0010521
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 orPZqzZzw4JcvquvD6KbeTmqShcbVWUFlNLN3adtmmw=; b=oTmPs7x80UWWh1IT
 fLbmTcZVx9qaBaTfRGhhVicn3ASP4+p/3g+yYGnn8rqdf81O86UhFaK4HnsSXdLP
 +ok8V47oRM54ngEwuYVHY/GMK/17jp9X2wpQEYpfHutH5E6Tf/oH45+T/alCwa9w
 jwUfCCmEMS43U/d/bFQDjp3xfXztV3KbGRanZTI2ax6/1yCK2QM2MOezgwgRNyD9
 8DvXiw4CfTcUNPGYEeYHsd7ctIavU2gTdnYbco0rmq5opW0RicpjYluse+Vga105
 GIw1iDr8KFxUn5lBGyxxNcpoaS0uZaNpOmqRt8tvkxVP5V6cq7tNvaMd/yZiSCAH
 ZX0vqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a17uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24457f44a2aso12193335ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682593; x=1756287393;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=orPZqzZzw4JcvquvD6KbeTmqShcbVWUFlNLN3adtmmw=;
 b=IhksAMMQf81JnUuNpUCFyceMqod7b1184oekGYuxepuDlNpEaSUqsdKIUBPuVL3Y5t
 KyXkwH1QYamexXQfTdGhRmQ7UUTyYUPiyOzV7NDoj/FLPvsa/tm9Go2b40e1wek1KzAG
 Kql8LhlJJ7p+pzDjYBlLkjin4XR6j0UQZAzYoOhliL0ACOL90QSEFzg6NPhqItAnrzCQ
 tNwUoRVo59FaGxAG/mO2ODRsL+CiDdidjhyLkYHczPLvbMAEZW0s7p+wsy8ewsH7wxk2
 j6ujJBnpDtFgx45n+qNOKCaosv980tuIhs+yji+VBqr3EhniqgWfBT3YMYkdodWiR3Mw
 3T/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCULh2pM4xZcbvJ2GFFPYrX4OoYO+Er7eS0liXbssjZ/iDd6zYzcbqFnwGZ6/R3WiMPo1EeWNF4D8iU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzfZzkQuLOJEzPjZaLhVIXc5qG+aSKumzUtRuv/DaBCEWlSleh
 wtx7KYpbVMgsAXK6AUgmgiOHMtoIHhUzjsVUw+y1mzigF8DcyrFJDpsSdplvGlZQ3g2X/JImGpw
 yi5SlBgIHyrGYhmHoVSpfGw1ybZQDwLFIrJsSdfijXdChq277YWCdI1ZwY5W5RXLd/xHJstM=
X-Gm-Gg: ASbGncu1CcHS/t2DiUVIMX/SVlxzgwI5PKaMNSzuvHxBBupQK6LQG9rxoUoWRdJK1e5
 zPjYvOvV9+5lf+BGS+m+tXiUrC+LqQENJ/Rw8zmdpzEK2Vfb4cHZvnFb5BPbT/uowzpbhy3rS8g
 hL8atnaxM+d+g0g509/IvIDzcjiMMoFyEh4hoBErxKb8UK/As9YQsY3pyaVZqekKIkxKI/Vqfcb
 24+7Ox3je5XRaPAdCDikgn3+oFben1GIUlPtnn2jex3/QBTqRjJHZ+kmZSVO2zs6ZiiSZmchC7E
 VL9HOznslrZfkBYfsFyoTz6H/dEWsKwrIkpDPPDK16kM2NFYxCwRLf1JNvt5RIY0hpuQp813zzd
 BiXffukSfInuy5RMArftf+tGqcgMZdn+5FeSeZebGkjR8Upp7VUVnoJYq
X-Received: by 2002:a17:902:ecca:b0:240:5c13:979a with SMTP id
 d9443c01a7336-245ef27a6aamr13412385ad.9.1755682589137; 
 Wed, 20 Aug 2025 02:36:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkdSiYltbj31GCPpo7Vs7xo/QlcsdPeU7zWLOIX2jkAqwf4FJ/V31D5nzCQAqJOKrVUAMCmQ==
X-Received: by 2002:a17:902:ecca:b0:240:5c13:979a with SMTP id
 d9443c01a7336-245ef27a6aamr13412045ad.9.1755682588665; 
 Wed, 20 Aug 2025 02:36:28 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:36:28 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:49 +0800
Subject: [PATCH v3 07/14] phy: qcom: qmp-usbc: Move reset and regulator
 config into PHY cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=8280;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=+nHyT48cRMJ7suWVMlfbbY6+YDu1YwhgikHX48zQXdM=;
 b=IOOcvFICrEZas5f0cHFp9KO7fs5v0mtfUpbU+HJL07BGShS12kJY79lYWGBh+62CElBFEk8I3
 ACmuc5aOob8BzaGyG4DyoBtaHRNBCyIXJnVkj673cPUi3JlyVVtc0Ct
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a59722 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Kf0ARtB50tyeYv72HkoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Z_WA1J736LctRHzED1UOhIEBNpZGi8fm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2tQYeWg9O+2D
 miQ3XQPNAOZ9xuqvaFJZyTYr9W7JToEWr84qOwnSjVOE6TSykdAeSylQnX9SjcrvRFTn1i0O0TZ
 OpryCzUBbTwXrYs0nLqdj4IZcwXfDF+2MmXh7YqjCjIdJNf+dgdg7jeSPRV2gbbcqb4DxM3Lvoy
 gAxD055oSjx8X6U/QbzuABqqCI3hOT63O+97VMRH8KZ0I93dTxftMpJvX8gxk1M/dqkDSdWTY0U
 6RB9H87LBz9Lc6h6pTHjMmofG0DsZY6QUkBYd1NtWX1bdux2+S58p5j624FyzRiuhHVnpnggK7Y
 5XuzQ3IoGGkR3SNmfOjJJoAYQl+Lx8AqqKlzirngiIVBqIhz27z3xYgPgiArkTRdN08ksZRloli
 7bgDIGbPEmzsmBRmX3CX0lxW160AeQ==
X-Proofpoint-GUID: Z_WA1J736LctRHzED1UOhIEBNpZGi8fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
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

Refactor reset and regulator configuration to be managed via qmp_phy_cfg
instead of hardcoded lists. This enables per-PHY customization and
simplifies initialization logic for USB-only and USB/DP switchable PHYs.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
 1 file changed, 53 insertions(+), 55 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -421,8 +421,9 @@ struct qmp_phy_cfg {
 	int (*configure_dp_phy)(struct qmp_usbc *qmp);
 	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
 
-	/* regulators to be requested */
-	const char * const *vreg_list;
+	const char * const *reset_list;
+	int num_resets;
+	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
 	/* array of registers with different offsets */
@@ -453,7 +454,6 @@ struct qmp_usbc {
 	struct clk_hw dp_pixel_hw;
 	struct clk_bulk_data *clks;
 	int num_clks;
-	int num_resets;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
@@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-/* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
-	"vdda-phy", "vdda-pll",
+static const char * const usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy",
+};
+
+static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
+	{ .supply = "vdda-phy" },
+	{ .supply = "vdda-pll" },
+};
+
+static const struct regulator_bulk_data qmp_phy_usbdp_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 21800 },
+	{ .supply = "vdda-phy", .init_load_uA = 36000 },
 };
 
 static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
@@ -569,8 +578,10 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
-	.vreg_list              = qmp_phy_vreg_l,
-	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
+	.vreg_list              = qmp_phy_usb_vreg_l,
+	.num_vregs              = ARRAY_SIZE(qmp_phy_usb_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
 };
 
@@ -586,8 +597,10 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
+	.vreg_list		= qmp_phy_usb_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -603,8 +616,10 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
+	.vreg_list		= qmp_phy_usb_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -637,6 +652,11 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 
 	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
 	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
+
+	.reset_list		= usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
+	.vreg_list		= qmp_phy_usbdp_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
 };
 
 static int qmp_usbc_com_init(struct phy *phy)
@@ -653,13 +673,13 @@ static int qmp_usbc_com_init(struct phy *phy)
 		return ret;
 	}
 
-	ret = reset_control_bulk_assert(qmp->num_resets, qmp->resets);
+	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 	if (ret) {
 		dev_err(qmp->dev, "reset assert failed\n");
 		goto err_disable_regulators;
 	}
 
-	ret = reset_control_bulk_deassert(qmp->num_resets, qmp->resets);
+	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
 	if (ret) {
 		dev_err(qmp->dev, "reset deassert failed\n");
 		goto err_disable_regulators;
@@ -682,7 +702,7 @@ static int qmp_usbc_com_init(struct phy *phy)
 	return 0;
 
 err_assert_reset:
-	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -694,7 +714,7 @@ static int qmp_usbc_com_exit(struct phy *phy)
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
@@ -921,42 +941,22 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
 			   qmp_usbc_runtime_resume, NULL)
 };
 
-static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
+static int qmp_usbc_reset_init(struct qmp_usbc *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	struct device *dev = qmp->dev;
-	int num = cfg->num_vregs;
-	int i;
-
-	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
-	if (!qmp->vregs)
-		return -ENOMEM;
-
-	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
-
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
-}
-
-static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
-			      const char *const *reset_list,
-			      int num_resets)
-{
 	struct device *dev = qmp->dev;
 	int i;
 	int ret;
 
-	qmp->resets = devm_kcalloc(dev, num_resets,
+	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
 				   sizeof(*qmp->resets), GFP_KERNEL);
 	if (!qmp->resets)
 		return -ENOMEM;
 
-	for (i = 0; i < num_resets; i++)
-		qmp->resets[i].id = reset_list[i];
+	for (i = 0; i < cfg->num_resets; i++)
+		qmp->resets[i].id = cfg->reset_list[i];
 
-	qmp->num_resets = num_resets;
-
-	ret = devm_reset_control_bulk_get_exclusive(dev, num_resets, qmp->resets);
+	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get resets\n");
 
@@ -1146,11 +1146,6 @@ static int qmp_usbc_parse_usb_dt_legacy(struct qmp_usbc *qmp, struct device_node
 
 	qmp->num_clks = ret;
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
-				 ARRAY_SIZE(usb3phy_legacy_reset_l));
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -1187,14 +1182,9 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
 	qmp->pipe_clk = devm_clk_get(dev, "pipe");
 	if (IS_ERR(qmp->pipe_clk)) {
 		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
-				     "failed to get pipe clock\n");
+					"failed to get pipe clock\n");
 	}
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -1228,6 +1218,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device_node *np;
 	struct qmp_usbc *qmp;
+	const struct qmp_phy_cfg *cfg;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -1239,13 +1230,20 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
 
-	qmp->cfg = of_device_get_match_data(dev);
-	if (!qmp->cfg)
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
 		return -EINVAL;
 
+	qmp->cfg = cfg;
+
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qmp_usbc_vreg_init(qmp);
+	ret = qmp_usbc_reset_init(qmp);
+	if (ret)
+		return ret;
+
+	ret = devm_regulator_bulk_get_const(qmp->dev, cfg->num_vregs,
+					 cfg->vreg_list, &qmp->vregs);
 	if (ret)
 		return ret;
 

-- 
2.34.1

