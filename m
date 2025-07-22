Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E62B0D2A9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E5510E5F6;
	Tue, 22 Jul 2025 07:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJBINQj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478AA10E5F6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:21 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M40FTw006465
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 50gbykZlp9W//j/JysAggcmqdiy+fttOZK6UNV9hvWI=; b=VJBINQj7sLrDudlY
 AtjYwIb+diP8fUWMBgM9K20lJSeb7x28f7Qq7TVB4GK6HP5v+j3J5mA0u+0z55tD
 8h1Cm9Ex2ZBCyMQSmbGFRkPmYjf36Hr7VyEnf8Mmr2ju+wgTAD+NylMuirU+kRvp
 MHBSVjcquFd7T047XxTOh/gIAqDQy5/KDDvlmJKcyvPLAGdXXm+U+JZucUuxHCRc
 eq3T6RYsdPsRPdLiPW2xf+USEh4et0ZQxaXD793AITfHKXFesRcyzagd4CAK1KIJ
 7FfLlqlPJ9YvOWZd+trAI9eG0Q1yDIEB9FZVA3HziVtCfQS0naOVvh5TL7NL0V5q
 +kLt6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q8h95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-311e9b4d254so296435a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168999; x=1753773799;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=50gbykZlp9W//j/JysAggcmqdiy+fttOZK6UNV9hvWI=;
 b=pJZYh6/oPpyo24DkarSakQ3TH9KrUZJt1LcbXxEVwVxfE2o3UkQ0cxOalruhwn/tky
 QrBHzhArabQNqd+eiea/AB2Kqjh7jDPrPQtmKANU/wJQNilfTm2FWpFYbUPmXDTiZZM8
 cl9+B/KR5KkOcyOz0+udTyphrofnDiOIJXjbokRnzvhDNsOHSgfn8qu/tBGLC0t8EUDo
 qBo1PK1Z40D++hOp/eoaV4n1kSxB9pSiT4DaLx7Gvb1aTha3lYrP5Xjk/PB6lzXSs3CN
 TaeExKmA+vq89ulHZ5FaLEM1pVtOR1RpXCcP5cqw2j5tZK7dM2YaQMOgu8Zt0/BEokzJ
 QtGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIwdsTF3UtNUorsUuVChITooIvvQlvSnQZjCdcK2gwfMkT4/gGW3enUeyjSSb/2twxkOzDGI/GcQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+2mje/ODnRd4LukTd/Ts80KGImn/2ZrozEadt1GSb7MzuKD2/
 IBduf+e+U8/zXmgpTWaOhj2p1FZMDBg/nyn5eiTWmVLEIcT+3EXP+TobdMn1SCZkFWVFTp7TxPs
 UP8Rb2hSiSsjHpGo2qIe+IKAfCttzQ9l+OJVsKauIOA+F1/VegPmjYOIl43xXdCPH1pl2w0o=
X-Gm-Gg: ASbGncszlP7NWyMrm1lcO+KlLMalPlq7lzsAorzFwI0Y9DyqMUY7kiZ7Dv4Frwjn1FP
 iLCbvjrgeyYqZK/g9gEeMU1FmNg4aaPVi+43aCwam+v9cHkBQY8a++J+TMhMyAI5KIAZxBtme/y
 cQZ07bsDCSKd1AwR2vBrFh25Cp+KrGxsGkXKfvzPERZqRO43bNafWT5xGmF9oSMOfme9/59dPZv
 4IhWjwgYmAhvP2wuOz4pVKTDpvBsSawFb4ZvDRo/ZvCTG6CqAujLG5lPNsajk9z3Dp8V18jEVdv
 bCAaLXSUGYxoR1HZdlbkXVt22jwHnJuM1MmRkyVpmkX/ZwaPfgbjvgXXN/10oFKmG4H69i+NZhL
 dveYAzkJkJ5X+otVIPCEgBnWmwfeqDge/w04NAZxryc/XTLt1R2YwnOCJ
X-Received: by 2002:a17:90b:2e87:b0:313:14b5:2521 with SMTP id
 98e67ed59e1d1-31c9e79557cmr13773553a91.5.1753168998801; 
 Tue, 22 Jul 2025 00:23:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkC1ZDFo8lez2mdAN1F41YIQzKnqunRrEKcvsfZ+PBJAKj4IdoTBXlggqkNRHOyeq11zgfiA==
X-Received: by 2002:a17:90b:2e87:b0:313:14b5:2521 with SMTP id
 98e67ed59e1d1-31c9e79557cmr13773535a91.5.1753168998356; 
 Tue, 22 Jul 2025 00:23:18 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:23:18 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:09 +0800
Subject: [PATCH v2 08/13] phy: qcom: qmp-usbc: Implement DP PHY bring-up
 flow for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-8-42b4037171f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168938; l=10441;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=nWc1YJDMMhWycabU9+LemuRakn4oZ1TgB8V91TrIhOE=;
 b=8q/HV5iUXtw87AXDON4gbfnio/aZ4O11A+yS+2+kqcDN6aFkT2mAl6tpxmBpvw2Q5SuIdmdcG
 NikQttSg+12B3UFG+uFxrmHnL+mebaVLEFOxMiw8l7qMaqOqP50fkY7
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfXwVnfHItEZuXd
 gSXhS3hoQPy4lq/hKTSwv14FSR78QQeoTjA2NSppKaQdG091dc7KJvJ3O77bFAtwiTzyfI9fgxf
 43YPzIMoMn2uSZqy7BqjJDZ2E+qKgeMeaDdxYIhgsELP9FFFaO/RSr37rg1r2FphGTL1Jl3fQTo
 8891CXl9FQn6i5vgGo+7X6QL9cOO/cadi8JJTQCGqb9LeiVtS+Bo6j1Xnk/W50QCQKe5vFlx2zC
 40SeU4VCh7G0Gf4Kbf9CNZHzAXPpCv6aIOzfQEkyNgylm8hSrZKntD0x3/XZDGN7ZnUyDurTRpI
 zJfegX9lFJv/dgYulnRs3CtfoRnMPK61dkr7jtsvq168NXcll/rd0HjVcOsTHOe4DOdoQoQiUb1
 E1ZK3svZ8G2z4/Vs3U3+xYY6HdZWq/nzqico7CQnYSj3n5pbV88YBfRNKBpxkeMbxPNn/UT7
X-Proofpoint-ORIG-GUID: t3A8Kgg6Qy3IasQpECbMsvnADH3JBIoQ
X-Proofpoint-GUID: t3A8Kgg6Qy3IasQpECbMsvnADH3JBIoQ
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687f3c68 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=yBTmwL0D05r7FsG-PegA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Add QCS615-specific DP PHY bring-up sequence, including AUX channel
initialization, TX configuration, clock setup, and PHY calibration.

These functions follow the QMP combo PHY flow and are integrated into
the `qmp_phy_dp_cfg` structure to support full DP PHY mode enablement.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 256 +++++++++++++++++++++++++++++
 2 files changed, 257 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d0837838a0bac1899fb69f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
@@ -25,6 +25,7 @@
 #define QSERDES_DP_PHY_AUX_CFG7				0x03c
 #define QSERDES_DP_PHY_AUX_CFG8				0x040
 #define QSERDES_DP_PHY_AUX_CFG9				0x044
+#define QSERDES_DP_PHY_VCO_DIV				0x068
 
 /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
 # define QSERDES_V3_COM_BIAS_EN				0x0001
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index aefcc520ee0bb3dd116e58222e5e035d1d750714..13228a21644271567d4281169ff1c1f316465d81 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -645,6 +645,11 @@ static const struct qmp_phy_usb_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
+static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp);
+static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp);
+static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp);
+static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp);
+
 static const struct qmp_phy_dp_cfg qcs615_dpphy_cfg = {
 	.offsets		= &qmp_usbc_dp_offsets_qcs615,
 
@@ -663,6 +668,11 @@ static const struct qmp_phy_dp_cfg qcs615_dpphy_cfg = {
 	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
 	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
 
+	.dp_aux_init		= qcs615_qmp_dp_aux_init,
+	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
+	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
+	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
+
 	.vreg_list		= qmp_phy_dp_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_dp_vreg_l),
 };
@@ -778,6 +788,252 @@ static int qmp_usbc_generic_exit(struct phy *phy)
 	return 0;
 }
 
+static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp)
+{
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+
+	writel(DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN,
+	       layout->dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN,
+	       layout->dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	writel(0x00, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG0);
+	writel(0x13, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0x00, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x00, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG3);
+	writel(0x0a, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG4);
+	writel(0x26, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG5);
+	writel(0x0a, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG6);
+	writel(0x03, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG7);
+	writel(0xbb, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG8);
+	writel(0x03, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG9);
+	layout->dp_aux_cfg = 0;
+
+	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
+	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
+	       PHY_AUX_REQ_ERR_MASK,
+	       layout->dp_phy + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
+}
+
+static int qcs615_qmp_configure_dp_swing(struct qmp_usbc *qmp)
+{
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+	struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+	const struct phy_configure_opts_dp *dp_opts = &layout->dp_opts;
+	void __iomem *tx = layout->dp_tx;
+	void __iomem *tx2 = layout->dp_tx2;
+	unsigned int v_level = 0, p_level = 0;
+	u8 voltage_swing_cfg, pre_emphasis_cfg;
+	int i;
+
+	if (dp_opts->lanes > 4) {
+		dev_err(qmp->dev, "Invalid lane_num(%d)\n", dp_opts->lanes);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+	if (v_level > 4 || p_level > 4) {
+		dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
+			v_level, p_level);
+		return -EINVAL;
+	}
+
+	voltage_swing_cfg = (*cfg->swing_tbl)[v_level][p_level];
+	pre_emphasis_cfg = (*cfg->pre_emphasis_tbl)[v_level][p_level];
+
+	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
+	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
+
+	if (voltage_swing_cfg == 0xff && pre_emphasis_cfg == 0xff)
+		return -EINVAL;
+
+	writel(voltage_swing_cfg, tx + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(pre_emphasis_cfg, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+	writel(voltage_swing_cfg, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(pre_emphasis_cfg, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+
+	return 0;
+}
+
+static void qmp_usbc_configure_dp_mode(struct qmp_usbc *qmp)
+{
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
+	u32 val;
+
+	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN;
+
+	writel(val, layout->dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	if (reverse)
+		writel(0xc9, layout->dp_phy + QSERDES_DP_PHY_MODE);
+	else
+		writel(0xd9, layout->dp_phy + QSERDES_DP_PHY_MODE);
+}
+
+static int qmp_usbc_configure_dp_clocks(struct qmp_usbc *qmp)
+{
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+	const struct phy_configure_opts_dp *dp_opts = &layout->dp_opts;
+	u32 phy_vco_div;
+	unsigned long pixel_freq;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		phy_vco_div = 0x1;
+		pixel_freq = 1620000000UL / 2;
+		break;
+	case 2700:
+		phy_vco_div = 0x1;
+		pixel_freq = 2700000000UL / 2;
+		break;
+	case 5400:
+		phy_vco_div = 0x2;
+		pixel_freq = 5400000000UL / 4;
+		break;
+	default:
+		dev_err(qmp->dev, "link rate:%d not supported\n", dp_opts->link_rate);
+		return -EINVAL;
+	}
+	writel(phy_vco_div, layout->dp_phy + QSERDES_DP_PHY_VCO_DIV);
+
+	clk_set_rate(layout->dp_link_hw.clk, dp_opts->link_rate * 100000);
+	clk_set_rate(layout->dp_pixel_hw.clk, pixel_freq);
+
+	return 0;
+}
+
+static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp)
+{
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+	void __iomem *tx = layout->dp_tx;
+	void __iomem *tx2 = layout->dp_tx2;
+
+	/* program default setting first */
+	writel(0x2a, tx + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(0x20, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+	writel(0x2a, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(0x20, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+
+	qcs615_qmp_configure_dp_swing(qmp);
+}
+
+static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp)
+{
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+	u32 status;
+	int ret;
+
+	qmp_usbc_configure_dp_mode(qmp);
+
+	writel(0x05, layout->dp_phy + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, layout->dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
+
+	ret = qmp_usbc_configure_dp_clocks(qmp);
+	if (ret)
+		return ret;
+
+	writel(0x01, layout->dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x05, layout->dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x01, layout->dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x09, layout->dp_phy + QSERDES_DP_PHY_CFG);
+
+	writel(0x20, layout->dp_serdes + QSERDES_COM_RESETSM_CNTRL);
+
+	if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_C_READY_STATUS,
+			       status,
+			       ((status & BIT(0)) > 0),
+			       500,
+			       10000)) {
+		dev_err(qmp->dev, "C_READY not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_CMN_STATUS,
+			       status,
+			       ((status & BIT(0)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "FREQ_DONE not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_CMN_STATUS,
+			       status,
+			       ((status & BIT(1)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "PLL_LOCKED not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	writel(0x19, layout->dp_phy + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
+			       status,
+			       ((status & BIT(0)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "TSYNC_DONE not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
+			       status,
+			       ((status & BIT(1)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "PHY_READY not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	writel(0x3f, layout->dp_tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+	writel(0x10, layout->dp_tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(0x0a, layout->dp_tx + QSERDES_V3_TX_TX_POL_INV);
+	writel(0x3f, layout->dp_tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+	writel(0x10, layout->dp_tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(0x0a, layout->dp_tx2 + QSERDES_V3_TX_TX_POL_INV);
+
+	writel(0x18, layout->dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x19, layout->dp_phy + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
+			       status,
+			       ((status & BIT(1)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "PHY_READY not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp)
+{
+	static const u8 cfg1_settings[] = {0x13, 0x23, 0x1d};
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+	u8 val;
+
+	layout->dp_aux_cfg++;
+	layout->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
+	val = cfg1_settings[layout->dp_aux_cfg];
+
+	writel(val, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG1);
+
+	return 0;
+}
+
 static int qmp_usbc_usb_power_on(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);

-- 
2.34.1

