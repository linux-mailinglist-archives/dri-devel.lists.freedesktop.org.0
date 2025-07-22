Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BC1B0D2A1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546E210E5F3;
	Tue, 22 Jul 2025 07:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6+Xs1t7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C5810E5F4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M34KGx016286
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YZ4FgzCJdzXTZ68oWJfU94gpKDzF/Xt5MxzpGoR2lPo=; b=n6+Xs1t7W7KzG/B1
 PAhr0SZg0iBIDLsAbPrX2Zwk8Wr4lya+C2+5+OdnzpDd43Z/erbgMbXCuEuBLieQ
 waICVPJGZEP40CEnOJ/Xt2PGic2xUN9+phA3jiZnCfD7rkKscpsbalAoD78O1JuI
 E2hGhJ78zHD3ycHeOLq8Zp7/DU3zWGJa/+Q+BBTT//nxGlgTX6ccW2QNCK02azuD
 G27CI1HVGaN66n/3FsNAoafNreRB0PGEzL9LoyD8+Vke+HLcDDD0Eh5kILUaI7Rg
 n5rbB372Z+LxwLDwSt6GEEx18Gm5Yvq2dNTsQC5oeqXLoYPDhhpyj9tGN6o6UO9J
 3pT8/g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s0hrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311d5fe941eso1624399a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168979; x=1753773779;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZ4FgzCJdzXTZ68oWJfU94gpKDzF/Xt5MxzpGoR2lPo=;
 b=tGOjvOXnPNVoNKpBDHvMlTpkjfr6i0zlkR8s871J1w9IlNAxwttsYeejpVBhFD1EXD
 jJp/MWCAfm1DQ53fEPyEhYimL5wgiYxcxpMlJfvNG7ZvFeaNv8RT6i+/OIRJLzOZWHUX
 sSvSr2aoX/th/TaH83DfLR0TJG5taOH9Tejsgb+3in9kuto2wtoLxE8JGhBBS6JuRpn0
 vPQOs30xMXZgi0txsXuqp0UWSa8ioA1li1roVOIP3+jy2q8kWihLLxNQJRh/Gkriz7Aq
 Sep9Mg/nutsaPALmLfu8wvdqwRFMtZNLXyJUTPu0y+1zIhCJBE+miFOTf1GPSpsWfvbZ
 dW0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEYZSuZlur3rv6DobS4rEuUfxo6b96qq6R16v7OD66Aftk8+ntJtULxDlhb+8pWObrUa/CMWzvorw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4Pg7+kxL2vg5zII1jL/uF+x+6K95oUy3qVZ3iz/v/cJYvKhwT
 EXI/6yvmbx4mgze+UmFXiuCH8jHbYhN2W7euWnqsSINQo8OY3z/1/Zlom9Z/YFeEaBfIR17w3hW
 XALfkmuBG5pVPpCbT/9rGdm61WWnmZh75YWRf1FZLV6nqCC3f8b60gJDYlU2tkzmD42Htxig=
X-Gm-Gg: ASbGncvl/4Fh6QQkAKtXKUkfD2mIVSOlx1Ui7RsnKU5Lp2LgJys6Z8Qlq7ovT98XH7I
 6+HDzi4PZCzqmuY+3v/53nuE2+857oq5WGr8pgMIhchPalown25fuHKdSLzxmO1O92nPrCoBiLU
 pc4QHb3u0C/cPYtBsvTnPE+weck5ucngiMLRZxy6u359GHCNZ1ten79jyP5P0R/yi79nryjud4e
 R022BUAZgOzyDn1+tS9C88UbKuKFUQd3UW59NL8rlp/siSVsp+l/NEU2kbaDUQtU2tEYxXPwFer
 7QpTGZCiQPBj/794xFycs9UfTwuVKcIuJRQ2KKauG1Q3zZEVKwNE8D5WFpvaDUifac+yTzsFxR3
 nD0PNOwNdwiyhtH586mmCuE+BEsbxt7xf5OdGdPGH1jdudToQGPU6E2Ro
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-31c9e76ae7amr13792185a91.3.1753168978867; 
 Tue, 22 Jul 2025 00:22:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+RLb9NbCc3+jcSeXV7HScdHKbTZCeU1tAR9/nK43lPZ6TFTvGxTPW2EvCOjgTdwguI8na1A==
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-31c9e76ae7amr13792158a91.3.1753168978262; 
 Tue, 22 Jul 2025 00:22:58 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:22:57 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:06 +0800
Subject: [PATCH v2 05/13] phy: qcom: qmp-usbc: Introduce PHY type enum for
 USB/DP support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-5-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=10901;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=A/33KDRt3oDK4NDO2X2o64L+cjx2DofT19gj6OCqf7g=;
 b=YDREKYRUTca7/pvK1h3Q1whlAfi6sY4u2iLzec2J+rRH4GEmAsQfi5xA6MykrceM7premjvzW
 8+2lZrRHeNLCOStdaoVpXGAY81dSnFd33BOhziX5Gq3z9TGWcw3TP/u
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX1RTtk/W9xcL1
 wR0udF0A56QFEupdw2IQz2zT07ZUA+j0Ppx6hUw6KmMRNYovcem1cpJV0j7um0sgeSL5ogUo9Qs
 Kcoa/4LRtXzwSjhxFCCwGOvzrjZ1eGcX3/q/tekxfaEnRl+t6P0d/dGP4sXqnx5lcyThY3DpnUt
 /cksa19uU/5Ue8/Rk3TH72LDxdazRZ658y9QOIfmjeHQViqlSnCF70jZ3q+eNpiD7b4jJjW0TYb
 OdttJEqEqNa4dRKRIU6COJoOZ5IlGqScut6lZfoajQt7UDfDKxKRjGW6EomFgTDRLtrwOOjtZNt
 CWj3uQc8b1YwJhKcAP0GjPypBy/uDpQM8tQwtTVnkMzHaw6QRo2bXoGUITQgCRPXu7Z/WkfXTjN
 EI6yO1AMLcQBigGw3/hqZPL0uKKKxjacb2XdnVKDeKH3UZYbYYIofwHcOCa0sDM3lik//3pp
X-Proofpoint-ORIG-GUID: Wi5rUZej-a9c2Fdex-u5LOduZWd6mW0H
X-Proofpoint-GUID: Wi5rUZej-a9c2Fdex-u5LOduZWd6mW0H
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687f3c54 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lpKKpq6P2_pQO93rLgIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059
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

Add `qmp_phy_usbc_type` enum and a `type` field in `qmp_usbc` to
distinguish between USB and DP PHYs.

- Introduce `qmp_phy_usbc_type` enum with USB and DP types.
- Update device match table to associate compatible strings with type
  and config.
- Wrap existing USB-specific logic with type checks to prepare for
  future DP support.

No functional changes and serves as a preparatory step for adding DP PHY
support.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 195 ++++++++++++++++++++-----------
 1 file changed, 126 insertions(+), 69 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 078752dbc66f9b9844c003e7755fff6466ea1d6c..647e2f54b744bf099ea667e672c606dd7aef3bcf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -286,6 +286,16 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
 };
 
+enum qmp_phy_usbc_type {
+	QMP_PHY_USBC_USB,
+	QMP_PHY_USBC_DP,
+};
+
+struct qmp_phy_cfg {
+	int type;
+	const void *cfg;
+};
+
 struct qmp_usbc_usb_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -454,23 +464,40 @@ static const struct qmp_phy_usb_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
+static const struct qmp_phy_cfg msm8998_phy_usb3_cfg = {
+	.type = QMP_PHY_USBC_USB,
+	.cfg = &msm8998_usb3phy_cfg,
+};
+
+static const struct qmp_phy_cfg qcm2290_phy_usb3_cfg = {
+	.type = QMP_PHY_USBC_USB,
+	.cfg = &qcm2290_usb3phy_cfg,
+};
+
+static const struct qmp_phy_cfg sdm660_phy_usb3_cfg = {
+	.type = QMP_PHY_USBC_USB,
+	.cfg = &sdm660_usb3phy_cfg,
+};
+
 #define to_usb_cfg(x) ((struct qmp_phy_usb_cfg *)((x)->cfg))
 #define to_usb_layout(x) ((struct qmp_phy_usb_layout *)((x)->layout))
 
 static int qmp_usbc_generic_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
-	struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
-	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 	int num_vregs;
-	unsigned int reg_pwr_dn;
 	u32 val;
 	int ret;
+	unsigned int reg_pwr_dn;
 
-	num_vregs = cfg->num_vregs;
-	reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
 
-	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
+		num_vregs = cfg->num_vregs;
+		reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
+	}
+
+	ret = regulator_bulk_enable(num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
 		return ret;
@@ -497,8 +524,12 @@ static int qmp_usbc_generic_init(struct phy *phy)
 	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
 		val |= SW_PORTSELECT_VAL;
 
-	qphy_setbits(layout->pcs, reg_pwr_dn, SW_PWRDN);
-	writel(val, layout->pcs_misc);
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+
+		qphy_setbits(layout->pcs, reg_pwr_dn, SW_PWRDN);
+		writel(val, layout->pcs_misc);
+	}
 
 	return 0;
 
@@ -513,13 +544,18 @@ static int qmp_usbc_generic_init(struct phy *phy)
 static int qmp_usbc_generic_exit(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
-	struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+	int num_vregs;
 
 	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
-	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+
+		num_vregs = cfg->num_vregs;
+	}
+	regulator_bulk_disable(num_vregs, qmp->vregs);
 
 	return 0;
 }
@@ -650,7 +686,7 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
 
 static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
 {
-	const struct qmp_phy_usb_cfg *cfg = qmp->cfg;
+	const struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
 	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 	void __iomem *pcs = layout->pcs;
 	u32 intr_mask;
@@ -698,18 +734,20 @@ static void qmp_usbc_disable_autonomous_mode(struct qmp_usbc *qmp)
 static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 {
 	struct qmp_usbc *qmp = dev_get_drvdata(dev);
-	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
-
-	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", layout->mode);
 
 	if (!qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
 
-	qmp_usbc_enable_autonomous_mode(qmp);
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+
+		dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", layout->mode);
+		qmp_usbc_enable_autonomous_mode(qmp);
+		clk_disable_unprepare(layout->pipe_clk);
+	}
 
-	clk_disable_unprepare(layout->pipe_clk);
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
 	return 0;
@@ -718,11 +756,8 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 {
 	struct qmp_usbc *qmp = dev_get_drvdata(dev);
-	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 	int ret = 0;
 
-	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", layout->mode);
-
 	if (!qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
@@ -732,14 +767,19 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(layout->pipe_clk);
-	if (ret) {
-		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
-		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
-		return ret;
-	}
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+
+		dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", layout->mode);
+		ret = clk_prepare_enable(layout->pipe_clk);
+		if (ret) {
+			dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
+			clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+			return ret;
+		}
 
-	qmp_usbc_disable_autonomous_mode(qmp);
+		qmp_usbc_disable_autonomous_mode(qmp);
+	}
 
 	return 0;
 }
@@ -751,20 +791,28 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
 
 static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
 {
-	struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
 	struct device *dev = qmp->dev;
-	int i;
+	int ret, i;
 
-	int num = cfg->num_vregs;
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+		int num = cfg->num_vregs;
 
-	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
-	if (!qmp->vregs)
-		return -ENOMEM;
+		qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
+		if (!qmp->vregs)
+			return -ENOMEM;
 
-	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
+		for (i = 0; i < num; i++)
+			qmp->vregs[i].supply = cfg->vreg_list[i];
 
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
+		ret = devm_regulator_bulk_get(dev, num, qmp->vregs);
+		if (ret) {
+			dev_err(dev, "failed at devm_regulator_bulk_get\n");
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
@@ -1061,6 +1109,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device_node *np;
 	struct qmp_usbc *qmp;
+	const struct qmp_phy_cfg *data_cfg;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -1072,39 +1121,45 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
 
-	qmp->cfg = of_device_get_match_data(dev);
-	if (!qmp->cfg)
+	data_cfg = of_device_get_match_data(dev);
+	if (!data_cfg)
 		return -EINVAL;
 
 	mutex_init(&qmp->phy_mutex);
 
+	qmp->type = data_cfg->type;
+	qmp->cfg = data_cfg->cfg;
+
 	ret = qmp_usbc_vreg_init(qmp);
 	if (ret)
 		return ret;
 
-	qmp->layout = devm_kzalloc(dev, sizeof(struct qmp_phy_usb_layout), GFP_KERNEL);
-	if (!qmp->layout)
-		return -ENOMEM;
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		qmp->layout = devm_kzalloc(dev, sizeof(struct qmp_phy_usb_layout), GFP_KERNEL);
+		if (!qmp->layout)
+			return -ENOMEM;
+
+		ret = qmp_usbc_parse_vls_clamp(qmp);
+		if (ret)
+			return ret;
+
+		/* Check for legacy binding with child node. */
+		np = of_get_child_by_name(dev->of_node, "phy");
+		if (np) {
+			ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
+		} else {
+			np = of_node_get(dev->of_node);
+			ret = qmp_usbc_parse_usb_dt(qmp);
+		}
+
+		if (ret)
+			goto err_node_put;
+	}
 
 	ret = qmp_usbc_typec_switch_register(qmp);
 	if (ret)
 		return ret;
 
-	ret = qmp_usbc_parse_vls_clamp(qmp);
-	if (ret)
-		return ret;
-
-	/* Check for legacy binding with child node. */
-	np = of_get_child_by_name(dev->of_node, "phy");
-	if (np) {
-		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
-	} else {
-		np = of_node_get(dev->of_node);
-		ret = qmp_usbc_parse_usb_dt(qmp);
-	}
-	if (ret)
-		goto err_node_put;
-
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
@@ -1115,15 +1170,17 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
-	if (ret)
-		goto err_node_put;
-
-	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
-	if (IS_ERR(qmp->phy)) {
-		ret = PTR_ERR(qmp->phy);
-		dev_err(dev, "failed to create PHY: %d\n", ret);
-		goto err_node_put;
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		ret = phy_pipe_clk_register(qmp, np);
+		if (ret)
+			goto err_node_put;
+
+		qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
+		if (IS_ERR(qmp->phy)) {
+			ret = PTR_ERR(qmp->phy);
+			dev_err(dev, "failed to create PHY: %d\n", ret);
+			goto err_node_put;
+		}
 	}
 
 	phy_set_drvdata(qmp->phy, qmp);
@@ -1142,19 +1199,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 static const struct of_device_id qmp_usbc_of_match_table[] = {
 	{
 		.compatible = "qcom,msm8998-qmp-usb3-phy",
-		.data = &msm8998_usb3phy_cfg,
+		.data =  &msm8998_phy_usb3_cfg,
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
-		.data = &qcm2290_usb3phy_cfg,
+		.data = &qcm2290_phy_usb3_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
-		.data = &qcm2290_usb3phy_cfg,
+		.data = &qcm2290_phy_usb3_cfg,
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
-		.data = &sdm660_usb3phy_cfg,
+		.data =  &sdm660_phy_usb3_cfg,
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
-		.data = &qcm2290_usb3phy_cfg,
+		.data =  &qcm2290_phy_usb3_cfg,
 	},
 	{ },
 };

-- 
2.34.1

