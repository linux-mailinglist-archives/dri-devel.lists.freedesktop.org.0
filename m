Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213E6B53682
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7941F10E39B;
	Thu, 11 Sep 2025 14:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uus7IPO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535A910E395
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAx3BD005772
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m5rSX4uydt5e9FRb8OHz/+TFgtpV0BPsULJzpx11jE8=; b=Uus7IPO6QxEUuBfl
 VPesdLUIz3bYnjrIaIti/n8yqmlyKsWV4+badY4bBTA5HacPtM6g80B/IKcCLWlW
 57WesY+FX74fayV9UBltqYwC1eQbuXQqTWJ0nALsCY1PiwPQvyOiakGsDKBSOVu3
 rqqPEK3mhNoAtULa74a6kBDYmLAGORm9TWycRTiw40tFnS70v0Yv/aNmYR4kr+xD
 FmisNj79y4If6QHA46F5R7JvW3S/xYhSA89eBBcKe4wiLRyjhBILJuErBt1L++Kw
 M9BxGweA95OdF7hm53VK/R6JG3FEhmUNFIvJIvrkKcOzkQHsjJQU3AOkMZzK09G0
 O7B2jw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2c7sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32dd4fd696aso211091a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602582; x=1758207382;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m5rSX4uydt5e9FRb8OHz/+TFgtpV0BPsULJzpx11jE8=;
 b=suyhT2xTCAtvlSIMx1udDva6eL7+IXbX/tTxL6gTm8rsEldLuxOcMXZz+rapvAFIKa
 7HlbCrTJCxk0FvgkqZal1i13f7LsSBkTlvL16dyZTB/N++skRP3aho9TrB0Zdrn1WDL7
 t6AZkQ78MAqnIVB7hR1BRUMzBhOj8+V/s48FYkkY1rqGDkruI6aR392xiOiBodPzgIkJ
 KRTo7d32BPjCqVMR6rBANcQ0ssTiYGX8759jHPkbLkqknTRx/Np0cQ6gltHvlt7PqZ/E
 ihqghEaCugQIwu+TuNA5XEa0MRUzfIr6JbOz6U5Wee5b1foVxi+L3qxFoX3D+s5VnXZ/
 tpTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPdKoRP3gUitFQ8Ouxt1o1P80tYbPYFJKgR3KQNXgcehMA177nkK6ETr/ciMDoHYYndVu6sC5m4XE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSivkdbyfqCjH2WXFPi3pKdvnaXXNhA3S0DboqWVBJm7oHYlv9
 6MmNzX0t73Dunm/QxnFqrm+U5y3g3b+pcVYFOP5taE2ctG3g7zPT4GSIr7eW8kLROPF/pNNGHyL
 jSH9EZM1RQrRbcA2R9PZbyrb0KgbGvZ9C+Ih56DIrJlLO4TgcrDl4CGAQhaIXhLNlkbxRsOU=
X-Gm-Gg: ASbGncvpXiHboL2iMxOYHoHvR3yYR7BFXlZ+JbuBuhdmUp7COI6Glpubxx0SyFtUZTU
 97FifP/RtdXMABDMhxC1Pft+NWcYtBf+dVijhMSB42slHFicshNv5n7D3LEM3cgVBJVr9ocTA4A
 cerCZu4W+YIyN4EHFIk2sE3qXK7NWqb0NEW5VrJrA+pOWVHV8Z+EOYQ48JXNdUTpe9xsQ3/g/A/
 46nZ3N1GJ76fea9yNBcuMiO1TAAh37meo1gmFS0ED9kMvtJ/EY7hsL9dRPTr7ta8Nx582A8VIiG
 t+5xI6bH+l/DgG6MAPrFyXYQKMHRjhxhD37n/4vJMByPANEoMH7O9ocBXCLZNE/UZK/G3D4Obov
 bsvVC3FQXV7rBN4TaysWB+ctZdB/8Xc7+a/rE1yrh05V2vYKdPT9M2dt2
X-Received: by 2002:a17:90b:38cb:b0:32c:e048:35a6 with SMTP id
 98e67ed59e1d1-32d43f126f8mr13467386a91.1.1757602581802; 
 Thu, 11 Sep 2025 07:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT6B9yKWlrdwVKTGOSkkyM9nZEcaA1nSoU1EHvvkoHye+I/GQrdMsKBEHjVGICmnNGRQt62A==
X-Received: by 2002:a17:90b:38cb:b0:32c:e048:35a6 with SMTP id
 98e67ed59e1d1-32d43f126f8mr13467364a91.1.1757602581168; 
 Thu, 11 Sep 2025 07:56:21 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:56:20 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:04 +0800
Subject: [PATCH v4 07/13] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-7-2702bdda14ed@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602528; l=10685;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=vNMHnw38Y4+djlmrAomh31fHjmTK5pZyTUstioCz3hY=;
 b=LPp5LVA3c31VSLnFPXg4cdsEBAM5vRZvGvsgwX+kIuBRtr7V8rHU81SC77P8lw+HwUHEFXHxe
 ChWWn0D7XymC0fXjJKxNOWlaraUzpoT9utmlYqnSP+a0IoolXjlS9dZ
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c2e317 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fz6FsOMk6asWW2g3UrwA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: WeyrSYEQGvDK_9McMV5dcfCpJKKrYH3e
X-Proofpoint-GUID: WeyrSYEQGvDK_9McMV5dcfCpJKKrYH3e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX935TZFugOk8T
 rKjXVJddsvkmN6suTP2plr56Ck2diRaloil1bpzzFR/tcut1Gg+inmfE+5yQobiGEtyQHTCfYa1
 6yKk/p7DMbl1f6/kKm5Pq8Ev2mpfKt4NM5tifIUMZocesDVjFcRScln3zDkGYBLHAKNgQJiZyLI
 wtyZQp3U5EAj9XHaLYuInnpAm+xVT3GSHn0IIWHOm2elhlzKiVmGhc3GvvyVV6q5PlZHMyXqND1
 BYgxE96hTY/AJ9bB9VTvdvYdT/NqG3xRxrX1I3me5lgmPM+Bq5C6yfIzVnIfSJArGCynj9EU1+j
 KpqMCf2r5FTfxgFQwgbMTt8BIL0yRW4NjLQh2Y99MCCWFyfId9Gw0iNlHN2hf7nbHO9mq9Jf2Lb
 T8ypRKIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

Introduce DisplayPort PHY configuration routines for QCS615, including
aux channel setup, lane control, voltage swing tuning, clock config and
calibration. These callbacks are registered via qmp_phy_cfg to enable DP
mode on USB/DP switchable Type-C PHYs.

Add register define for QMP_DP_PHY_V2 series.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h |  21 +++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 251 ++++++++++++++++++++++++++
 2 files changed, 272 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h
new file mode 100644
index 0000000000000000000000000000000000000000..8b9572d3cdebb70a0f3811f129a40aa78e184638
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_PHY_V2_H_
+#define QCOM_PHY_QMP_DP_PHY_V2_H_
+
+// /* Only for QMP V2 PHY - DP PHY registers */
+#define QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK		0x048
+#define QSERDES_V2_DP_PHY_AUX_INTERRUPT_CLEAR		0x04c
+#define QSERDES_V2_DP_PHY_AUX_BIST_CFG			0x050
+
+#define QSERDES_V2_DP_PHY_VCO_DIV			0x068
+#define QSERDES_V2_DP_PHY_TX0_TX1_LANE_CTL		0x06c
+#define QSERDES_V2_DP_PHY_TX2_TX3_LANE_CTL		0x088
+
+#define QSERDES_V2_DP_PHY_SPARE0			0x0ac
+#define QSERDES_V2_DP_PHY_STATUS			0x0c0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 663024b8c09124f2991b8e0537a9feb60baaa686..7b2b47320cbb2d16e4f316b0f52fdc1bd09fe656 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -28,6 +28,9 @@
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
+#include "phy-qcom-qmp-dp-phy.h"
+#include "phy-qcom-qmp-dp-phy-v2.h"
+
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
 /* set of registers with offsets different per-PHY */
@@ -619,6 +622,11 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
+static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp);
+static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp);
+static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp);
+static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp);
+
 static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
 
@@ -666,6 +674,11 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
 	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
 
+	.dp_aux_init		= qcs615_qmp_dp_aux_init,
+	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
+	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
+	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
+
 	.reset_list		= usb3dpphy_reset_l,
 	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
@@ -736,6 +749,244 @@ static int qmp_usbc_com_exit(struct phy *phy)
 	return 0;
 }
 
+static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp)
+{
+	writel(DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN,
+	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN,
+	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
+	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG3);
+	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG4);
+	writel(0x26, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG5);
+	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG6);
+	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG7);
+	writel(0xbb, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG8);
+	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG9);
+	qmp->dp_aux_cfg = 0;
+
+	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
+	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
+	       PHY_AUX_REQ_ERR_MASK,
+	       qmp->dp_dp_phy + QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK);
+}
+
+static int qcs615_qmp_configure_dp_swing(struct qmp_usbc *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	void __iomem *tx = qmp->dp_tx;
+	void __iomem *tx2 = qmp->dp_tx2;
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
+	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
+	u32 val;
+
+	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN;
+
+	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	if (reverse)
+		writel(0xc9, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
+	else
+		writel(0xd9, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
+}
+
+static int qmp_usbc_configure_dp_clocks(struct qmp_usbc *qmp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
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
+	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_VCO_DIV);
+
+	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
+	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
+
+	return 0;
+}
+
+static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp)
+{
+	void __iomem *tx = qmp->dp_tx;
+	void __iomem *tx2 = qmp->dp_tx2;
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
+	u32 status;
+	int ret;
+
+	qmp_usbc_configure_dp_mode(qmp);
+
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_TX2_TX3_LANE_CTL);
+
+	ret = qmp_usbc_configure_dp_clocks(qmp);
+	if (ret)
+		return ret;
+
+	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+
+	writel(0x20, qmp->dp_serdes + QSERDES_COM_RESETSM_CNTRL);
+
+	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_C_READY_STATUS,
+			       status,
+			       ((status & BIT(0)) > 0),
+			       500,
+			       10000)) {
+		dev_err(qmp->dev, "C_READY not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_CMN_STATUS,
+			       status,
+			       ((status & BIT(0)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "FREQ_DONE not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_CMN_STATUS,
+			       status,
+			       ((status & BIT(1)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "PLL_LOCKED not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
+			       status,
+			       ((status & BIT(0)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "TSYNC_DONE not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
+			       status,
+			       ((status & BIT(1)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "PHY_READY not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	writel(0x3f, qmp->dp_tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+	writel(0x10, qmp->dp_tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(0x0a, qmp->dp_tx + QSERDES_V3_TX_TX_POL_INV);
+	writel(0x3f, qmp->dp_tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+	writel(0x10, qmp->dp_tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(0x0a, qmp->dp_tx2 + QSERDES_V3_TX_TX_POL_INV);
+
+	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
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
+	u8 val;
+
+	qmp->dp_aux_cfg++;
+	qmp->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
+	val = cfg1_settings[qmp->dp_aux_cfg];
+
+	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
+
+	return 0;
+}
+
 static int qmp_usbc_usb_power_on(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);

-- 
2.34.1

