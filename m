Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C13B0D29D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61D810E302;
	Tue, 22 Jul 2025 07:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDcVsCGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1259810E302
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIgiWx004629
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IJOBxXc3JHGacDSBYhI1b7PRyypCAC5CuaNkkjwC2os=; b=PDcVsCGWsMxVan/9
 7/VGEHWoktJrfjRkE2Pxlq8yxnnYIIq/kX+WgMZF8otFD89rtLjojMDPMtRY0gz2
 6N1aAlentnjzVeFp7WijMx8XjSG5GmPE68RBQ+jo9VaQxmu7mQCZasEdQFBs7T+9
 OV2SNLLxVAHe2p6AX4zvYZGkvPdD7HD/7g7wjgvihZLLw8YlRjQxMvzASD0XMiAj
 uVm9EruoB7sEvnQdcu9+cmTGk7FEtwM09y/WU+THRk21sKu3vLKYYrlMa+jlTD4W
 cx8CGa4J75YfOMTJlTcBQTuxKDL5NKfGfESbpf+uevqU8Uw4nEXmjCpcJ17kYDIR
 NvbQtg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v6tgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31cb5c86189so103472a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168972; x=1753773772;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJOBxXc3JHGacDSBYhI1b7PRyypCAC5CuaNkkjwC2os=;
 b=hMRfZ5ap8TlYfpzx98deL15mpRFhzh5YU87r6IERp7snqACRnWOHnU0GmALzyF2Vds
 CpaTxwDdd4TdsiI/7spsIQZg3sCeBNKLr+y1MkizQnJrDLFhasOGtsNp1qUSI+WEL2Sw
 HOITmrPKfEBHzDBSDrhjkvuj8tbz+8lRxGqVqm/ir/LgrJ0u7tXBLnLLyx7FRSUhZ1N/
 x5ssFdKgWz1CqxYvDukQmEJ32F7bfJqdFe+pw2uWFes5dHBnVO6r4Z/LswDU/MjNUzi7
 4dntoGZ+XjDPmmCSxQ4CpXxTL3rIw1tN5/SuJE6VRm+Wmr716SlPIMKPz2mw3uiL1F74
 PW1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAs7E09ory+MfDV2/Ti4u5bwstbC2jH+xRKu+iYtlAJDE0r2zvXtA4kDaTYvLla230PrE61JsCr20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTiSoOEIXuUAhXmd0Hx1uU7EqLpv6RIzO3uLRZuIfwxVkyJ+iN
 0o8IJTfR+VFXtUfM0MVWZuy3+tGHN7O7d1virQlP4VS2pg4/0N0DT/RQY41ua6X0q+9aPNuMaaR
 9crIByk7aS8AhsS51R0Khv2LuwwlhkkgDqaSW6pBRFyb5632BhKROxHkvtH7ZqKZbKqlTJ+4=
X-Gm-Gg: ASbGnctSywxFDhXmKPYh/QThKi/f9xMbf/CvNpkMey0yxSVFldQ8Oo7u0q2OHIuQwXj
 O2fA8e4WZj44pmD34keb9KKeCU4PJul+/7uhe6c8mMKD93Bf/OFUdnF7qpi4HzFkz5H+geYPcSy
 MJpR9kANWBuO1LN571fT5BjUODFJCExlrsBiaf0NkM8gn5uHY2CqdHCmdnsdYG7FrVQMH0rn3Ut
 aLLFeQLaby7PsgcFb3IluWCkjWsu7asjWNNkJjURJrvECA8IR0u6t+4vSOCN9+zPWfb47Vhuh0R
 XhfZLPsd2nujDJ2FkJfaN8/KtyH70xrCyFK3d7FX1OZtnNJvVLNpUu1qB+diAZwIaHaw0GxFG72
 tf3sfI+uLDIA41i9EJFd8/24mu2izHC5/1tIaXVu4t7dUIaL/8yX7tg/k
X-Received: by 2002:a17:90b:2542:b0:310:8d79:dfe4 with SMTP id
 98e67ed59e1d1-31c9e760d63mr12601199a91.4.1753168972082; 
 Tue, 22 Jul 2025 00:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFazGfQc1+dL7n5Vt6jeHIl8Bv1CHYDai3Y7YXX1FTT0A7svYOa+hdjkXM7pgf3RKYD4Grcqg==
X-Received: by 2002:a17:90b:2542:b0:310:8d79:dfe4 with SMTP id
 98e67ed59e1d1-31c9e760d63mr12601168a91.4.1753168971421; 
 Tue, 22 Jul 2025 00:22:51 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:22:51 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:05 +0800
Subject: [PATCH v2 04/13] phy: qcom: qmp-usbc: Rename USB structs and
 reorganize layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-4-42b4037171f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=22783;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=/OA0ztxkzyXnLTIQb/ySHhp10s9CoyKZiV0nYWPw3dg=;
 b=OO/Ot8YZgcdAKooSn5Aa7AducGO1EtUC563ThCERQtLyz+OgvhPlIy+rGQDLp2Wu/kEFmSCTk
 P9YQejg+W1SBa94bqIU4uXRczchq/hRWS3+65mORWs3JWcstapMjkIB
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: gSo7wfxYy3sAibU-tD5h2dB3qV_uIBAZ
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687f3c4d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=eeARFrWrdhb-Nk5A1FAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX86oPjP27tLL/
 NBKqjCGYGGRnYs9MIborqMUh4/J5+g1+o9yTkfJTUnNG90fCB4e3gWbpFzZ2fxYL4HIKkymexN9
 I/V5kCesFD0ehJV2owwUEPqUIbmilq1ftQ4I1P5f5/oIX1T3YbY5Yuvc5Yo8U5h///p0ofh5O3k
 GugazYDC55D1w434F5+ZH+7P3zE9DBoK/P98i82etaAvSJMZ8mprOXU1VB82Tw40sCuN2oxm17k
 WDQ0Jv/It5wYIkpXCOnl9G/QcIcLhKtai61vBfcirSk4QlOI8u89cqOhlt2vFEvNS/1TiNCLMOo
 lu+Zp5hOFgzX8cdpjEISTFMuYgBGqdqv6cBM2HEv7vCbJOXGtqESaRrzV8enSbzFf+WCu9DkyTT
 tiMpyiNjK60l9nz/DxLbpuD3ySTYoJnrz6DNGXzZIAKqcoN/mTHhHY3Q0DIRbLDO549DPpdH
X-Proofpoint-ORIG-GUID: gSo7wfxYy3sAibU-tD5h2dB3qV_uIBAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059
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

Refactor the USB PHY data structures to improve modularity and prepare
for multi-mode PHY support. (e.g., DP).

- Rename `qmp_phy_cfg` to `qmp_phy_usb_cfg` and `qmp_usbc_offsets` to
  `qmp_usbc_usb_offsets`.
- Introduce `qmp_phy_usb_layout` to encapsulate USB-specific register
  mappings.
- Move USB-specific members out of the shared `qmp_usbc` structure.

No functional changes; this is a preparatory cleanup for DP PHY support.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 304 +++++++++++++++++--------------
 1 file changed, 163 insertions(+), 141 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5e7fcb26744a4401c3076960df9c0dcbec7fdef7..078752dbc66f9b9844c003e7755fff6466ea1d6c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -29,6 +29,8 @@
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
+#define SW_PORTSELECT_VAL			BIT(0)
+#define SW_PORTSELECT_MUX			BIT(1)
 
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
@@ -284,7 +286,7 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
 };
 
-struct qmp_usbc_offsets {
+struct qmp_usbc_usb_offsets {
 	u16 serdes;
 	u16 pcs;
 	u16 pcs_misc;
@@ -295,9 +297,8 @@ struct qmp_usbc_offsets {
 	u16 rx2;
 };
 
-/* struct qmp_phy_cfg - per-PHY initialization config */
-struct qmp_phy_cfg {
-	const struct qmp_usbc_offsets *offsets;
+struct qmp_phy_usb_cfg {
+	const struct qmp_usbc_usb_offsets *offsets;
 
 	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
@@ -317,11 +318,7 @@ struct qmp_phy_cfg {
 	const unsigned int *regs;
 };
 
-struct qmp_usbc {
-	struct device *dev;
-
-	const struct qmp_phy_cfg *cfg;
-
+struct qmp_phy_usb_layout {
 	void __iomem *serdes;
 	void __iomem *pcs;
 	void __iomem *pcs_misc;
@@ -329,11 +326,14 @@ struct qmp_usbc {
 	void __iomem *rx;
 	void __iomem *tx2;
 	void __iomem *rx2;
-
-	struct regmap *tcsr_map;
-	u32 vls_clamp_reg;
-
+	enum phy_mode mode;
 	struct clk *pipe_clk;
+	struct clk_fixed_rate pipe_clk_fixed;
+};
+
+struct qmp_usbc {
+	struct device *dev;
+	int type;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	int num_resets;
@@ -341,16 +341,16 @@ struct qmp_usbc {
 	struct regulator_bulk_data *vregs;
 
 	struct mutex phy_mutex;
-
-	enum phy_mode mode;
-	unsigned int usb_init_count;
-
 	struct phy *phy;
+	enum typec_orientation orientation;
+	unsigned int init_count;
+	const void *cfg;
+	void *layout;
 
-	struct clk_fixed_rate pipe_clk_fixed;
+	struct regmap *tcsr_map;
+	u32 vls_clamp_reg;
 
 	struct typec_switch_dev *sw;
-	enum typec_orientation orientation;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -392,11 +392,11 @@ static const char * const usb3phy_reset_l[] = {
 };
 
 /* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
+static const char * const qmp_phy_usb_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
-static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
+static const struct qmp_usbc_usb_offsets qmp_usbc_usb_offsets_v3_qcm2290 = {
 	.serdes		= 0x0,
 	.pcs		= 0xc00,
 	.pcs_misc	= 0xa00,
@@ -406,8 +406,8 @@ static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
 	.rx2		= 0x800,
 };
 
-static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
-	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+static const struct qmp_phy_usb_cfg msm8998_usb3phy_cfg = {
+	.offsets		= &qmp_usbc_usb_offsets_v3_qcm2290,
 
 	.serdes_tbl             = msm8998_usb3_serdes_tbl,
 	.serdes_tbl_num         = ARRAY_SIZE(msm8998_usb3_serdes_tbl),
@@ -417,13 +417,13 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
-	.vreg_list              = qmp_phy_vreg_l,
-	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list              = qmp_phy_usb_vreg_l,
+	.num_vregs              = ARRAY_SIZE(qmp_phy_usb_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
 };
 
-static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
-	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+static const struct qmp_phy_usb_cfg qcm2290_usb3phy_cfg = {
+	.offsets		= &qmp_usbc_usb_offsets_v3_qcm2290,
 
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
@@ -433,13 +433,13 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_usb_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
-static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
-	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+static const struct qmp_phy_usb_cfg sdm660_usb3phy_cfg = {
+	.offsets		= &qmp_usbc_usb_offsets_v3_qcm2290,
 
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
@@ -449,19 +449,27 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_usb_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
-static int qmp_usbc_init(struct phy *phy)
+#define to_usb_cfg(x) ((struct qmp_phy_usb_cfg *)((x)->cfg))
+#define to_usb_layout(x) ((struct qmp_phy_usb_layout *)((x)->layout))
+
+static int qmp_usbc_generic_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	void __iomem *pcs = qmp->pcs;
-	u32 val = 0;
+	struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+	int num_vregs;
+	unsigned int reg_pwr_dn;
+	u32 val;
 	int ret;
 
+	num_vregs = cfg->num_vregs;
+	reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
+
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
@@ -484,30 +492,28 @@ static int qmp_usbc_init(struct phy *phy)
 	if (ret)
 		goto err_assert_reset;
 
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
-
-#define SW_PORTSELECT_VAL			BIT(0)
-#define SW_PORTSELECT_MUX			BIT(1)
 	/* Use software based port select and switch on typec orientation */
 	val = SW_PORTSELECT_MUX;
 	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
 		val |= SW_PORTSELECT_VAL;
-	writel(val, qmp->pcs_misc);
+
+	qphy_setbits(layout->pcs, reg_pwr_dn, SW_PWRDN);
+	writel(val, layout->pcs_misc);
 
 	return 0;
 
 err_assert_reset:
 	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
 err_disable_regulators:
-	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+	regulator_bulk_disable(num_vregs, qmp->vregs);
 
 	return ret;
 }
 
-static int qmp_usbc_exit(struct phy *phy)
+static int qmp_usbc_generic_exit(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
 
 	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
 
@@ -518,39 +524,40 @@ static int qmp_usbc_exit(struct phy *phy)
 	return 0;
 }
 
-static int qmp_usbc_power_on(struct phy *phy)
+static int qmp_usbc_usb_power_on(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 	void __iomem *status;
 	unsigned int val;
 	int ret;
 
-	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
+	qmp_configure(qmp->dev, layout->serdes, cfg->serdes_tbl,
 		      cfg->serdes_tbl_num);
 
-	ret = clk_prepare_enable(qmp->pipe_clk);
+	ret = clk_prepare_enable(layout->pipe_clk);
 	if (ret) {
 		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
 		return ret;
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_configure_lane(qmp->dev, qmp->tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_configure_lane(qmp->dev, qmp->rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, layout->tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, layout->rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
-	qmp_configure_lane(qmp->dev, qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
-	qmp_configure_lane(qmp->dev, qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, layout->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, layout->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
-	qmp_configure(qmp->dev, qmp->pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(qmp->dev, layout->pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	/* Pull PHY out of reset state */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	qphy_clrbits(layout->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
 	/* start SerDes and Phy-Coding-Sublayer */
-	qphy_setbits(qmp->pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
+	qphy_setbits(layout->pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
 
-	status = qmp->pcs + cfg->regs[QPHY_PCS_STATUS];
+	status = layout->pcs + cfg->regs[QPHY_PCS_STATUS];
 	ret = readl_poll_timeout(status, val, !(val & PHYSTATUS), 200,
 				 PHY_INIT_COMPLETE_TIMEOUT);
 	if (ret) {
@@ -561,92 +568,95 @@ static int qmp_usbc_power_on(struct phy *phy)
 	return 0;
 
 err_disable_pipe_clk:
-	clk_disable_unprepare(qmp->pipe_clk);
+	clk_disable_unprepare(layout->pipe_clk);
 
 	return ret;
 }
 
-static int qmp_usbc_power_off(struct phy *phy)
+static int qmp_usbc_usb_power_off(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 
-	clk_disable_unprepare(qmp->pipe_clk);
+	clk_disable_unprepare(layout->pipe_clk);
 
 	/* PHY reset */
-	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	qphy_setbits(layout->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
 	/* stop SerDes and Phy-Coding-Sublayer */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
-			SERDES_START | PCS_START);
+	qphy_clrbits(layout->pcs, cfg->regs[QPHY_START_CTRL],
+		     SERDES_START | PCS_START);
 
 	/* Put PHY into POWER DOWN state: active low */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-			SW_PWRDN);
+	qphy_clrbits(layout->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+		     SW_PWRDN);
 
 	return 0;
 }
 
-static int qmp_usbc_enable(struct phy *phy)
+static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
 
-	ret = qmp_usbc_init(phy);
+	ret = qmp_usbc_generic_init(phy);
 	if (ret)
 		goto out_unlock;
 
-	ret = qmp_usbc_power_on(phy);
+	ret = qmp_usbc_usb_power_on(phy);
 	if (ret) {
-		qmp_usbc_exit(phy);
+		qmp_usbc_generic_exit(phy);
 		goto out_unlock;
 	}
 
-	qmp->usb_init_count++;
+	qmp->init_count++;
 out_unlock:
 	mutex_unlock(&qmp->phy_mutex);
 
 	return ret;
 }
 
-static int qmp_usbc_disable(struct phy *phy)
+static int qmp_usbc_usb_disable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
-	qmp->usb_init_count--;
-	ret = qmp_usbc_power_off(phy);
+	qmp->init_count--;
+	ret = qmp_usbc_usb_power_off(phy);
 	if (ret)
 		return ret;
-	return qmp_usbc_exit(phy);
+	return qmp_usbc_generic_exit(phy);
 }
 
-static int qmp_usbc_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+static int qmp_usbc_usb_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 
-	qmp->mode = mode;
+	layout->mode = mode;
 
 	return 0;
 }
 
-static const struct phy_ops qmp_usbc_phy_ops = {
-	.init		= qmp_usbc_enable,
-	.exit		= qmp_usbc_disable,
-	.set_mode	= qmp_usbc_set_mode,
+static const struct phy_ops qmp_usbc_usb_phy_ops = {
+	.init		= qmp_usbc_usb_enable,
+	.exit		= qmp_usbc_usb_disable,
+	.set_mode	= qmp_usbc_usb_set_mode,
 	.owner		= THIS_MODULE,
 };
 
 static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
 {
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	void __iomem *pcs = qmp->pcs;
+	const struct qmp_phy_usb_cfg *cfg = qmp->cfg;
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+	void __iomem *pcs = layout->pcs;
 	u32 intr_mask;
 
-	if (qmp->mode == PHY_MODE_USB_HOST_SS ||
-	    qmp->mode == PHY_MODE_USB_DEVICE_SS)
+	if (layout->mode == PHY_MODE_USB_HOST_SS ||
+	    layout->mode == PHY_MODE_USB_DEVICE_SS)
 		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
 	else
 		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
@@ -669,8 +679,9 @@ static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
 
 static void qmp_usbc_disable_autonomous_mode(struct qmp_usbc *qmp)
 {
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	void __iomem *pcs = qmp->pcs;
+	const struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+	void __iomem *pcs = layout->pcs;
 
 	/* Disable i/o clamp_n on resume for normal mode */
 	if (qmp->tcsr_map && qmp->vls_clamp_reg)
@@ -687,8 +698,9 @@ static void qmp_usbc_disable_autonomous_mode(struct qmp_usbc *qmp)
 static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 {
 	struct qmp_usbc *qmp = dev_get_drvdata(dev);
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 
-	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
+	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", layout->mode);
 
 	if (!qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
@@ -697,7 +709,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	qmp_usbc_enable_autonomous_mode(qmp);
 
-	clk_disable_unprepare(qmp->pipe_clk);
+	clk_disable_unprepare(layout->pipe_clk);
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
 	return 0;
@@ -706,9 +718,10 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 {
 	struct qmp_usbc *qmp = dev_get_drvdata(dev);
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 	int ret = 0;
 
-	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
+	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", layout->mode);
 
 	if (!qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
@@ -719,7 +732,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(qmp->pipe_clk);
+	ret = clk_prepare_enable(layout->pipe_clk);
 	if (ret) {
 		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
 		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
@@ -738,11 +751,12 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
 
 static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
 {
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
 	struct device *dev = qmp->dev;
-	int num = cfg->num_vregs;
 	int i;
 
+	int num = cfg->num_vregs;
+
 	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
 	if (!qmp->vregs)
 		return -ENOMEM;
@@ -821,7 +835,9 @@ static void phy_clk_release_provider(void *res)
  */
 static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
 {
-	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+
+	struct clk_fixed_rate *fixed = &layout->pipe_clk_fixed;
 	struct clk_init_data init = { };
 	int ret;
 
@@ -864,12 +880,12 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 	mutex_lock(&qmp->phy_mutex);
 	qmp->orientation = orientation;
 
-	if (qmp->usb_init_count) {
-		qmp_usbc_power_off(qmp->phy);
-		qmp_usbc_exit(qmp->phy);
+	if (qmp->init_count) {
+		qmp_usbc_usb_power_off(qmp->phy);
+		qmp_usbc_generic_exit(qmp->phy);
 
-		qmp_usbc_init(qmp->phy);
-		qmp_usbc_power_on(qmp->phy);
+		qmp_usbc_generic_init(qmp->phy);
+		qmp_usbc_usb_power_on(qmp->phy);
 	}
 
 	mutex_unlock(&qmp->phy_mutex);
@@ -907,15 +923,16 @@ static int qmp_usbc_typec_switch_register(struct qmp_usbc *qmp)
 }
 #endif
 
-static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np)
+static int qmp_usbc_parse_usb_dt_legacy(struct qmp_usbc *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
 	struct device *dev = qmp->dev;
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 	int ret;
 
-	qmp->serdes = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(qmp->serdes))
-		return PTR_ERR(qmp->serdes);
+	layout->serdes = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(layout->serdes))
+		return PTR_ERR(layout->serdes);
 
 	/*
 	 * Get memory resources for the PHY:
@@ -923,35 +940,35 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
 	 * For dual lane PHYs: tx2 -> 3, rx2 -> 4, pcs_misc (optional) -> 5
 	 * For single lane PHYs: pcs_misc (optional) -> 3.
 	 */
-	qmp->tx = devm_of_iomap(dev, np, 0, NULL);
-	if (IS_ERR(qmp->tx))
-		return PTR_ERR(qmp->tx);
+	layout->tx = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(layout->tx))
+		return PTR_ERR(layout->tx);
 
-	qmp->rx = devm_of_iomap(dev, np, 1, NULL);
-	if (IS_ERR(qmp->rx))
-		return PTR_ERR(qmp->rx);
+	layout->rx = devm_of_iomap(dev, np, 1, NULL);
+	if (IS_ERR(layout->rx))
+		return PTR_ERR(layout->rx);
 
-	qmp->pcs = devm_of_iomap(dev, np, 2, NULL);
-	if (IS_ERR(qmp->pcs))
-		return PTR_ERR(qmp->pcs);
+	layout->pcs = devm_of_iomap(dev, np, 2, NULL);
+	if (IS_ERR(layout->pcs))
+		return PTR_ERR(layout->pcs);
 
-	qmp->tx2 = devm_of_iomap(dev, np, 3, NULL);
-	if (IS_ERR(qmp->tx2))
-		return PTR_ERR(qmp->tx2);
+	layout->tx2 = devm_of_iomap(dev, np, 3, NULL);
+	if (IS_ERR(layout->tx2))
+		return PTR_ERR(layout->tx2);
 
-	qmp->rx2 = devm_of_iomap(dev, np, 4, NULL);
-	if (IS_ERR(qmp->rx2))
-		return PTR_ERR(qmp->rx2);
+	layout->rx2 = devm_of_iomap(dev, np, 4, NULL);
+	if (IS_ERR(layout->rx2))
+		return PTR_ERR(layout->rx2);
 
-	qmp->pcs_misc = devm_of_iomap(dev, np, 5, NULL);
-	if (IS_ERR(qmp->pcs_misc)) {
+	layout->pcs_misc = devm_of_iomap(dev, np, 5, NULL);
+	if (IS_ERR(layout->pcs_misc)) {
 		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
-		qmp->pcs_misc = NULL;
+		layout->pcs_misc = NULL;
 	}
 
-	qmp->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
-	if (IS_ERR(qmp->pipe_clk)) {
-		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
+	layout->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
+	if (IS_ERR(layout->pipe_clk)) {
+		return dev_err_probe(dev, PTR_ERR(layout->pipe_clk),
 				     "failed to get pipe clock\n");
 	}
 
@@ -969,11 +986,12 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
 	return 0;
 }
 
-static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
+static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	const struct qmp_usbc_offsets *offs = cfg->offsets;
+	const struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+	const struct qmp_usbc_usb_offsets *offs = cfg->offsets;
+	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 	struct device *dev = qmp->dev;
 	void __iomem *base;
 	int ret;
@@ -985,28 +1003,28 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	qmp->serdes = base + offs->serdes;
-	qmp->pcs = base + offs->pcs;
+	layout->serdes = base + offs->serdes;
+	layout->pcs = base + offs->pcs;
 	if (offs->pcs_misc)
-		qmp->pcs_misc = base + offs->pcs_misc;
-	qmp->tx = base + offs->tx;
-	qmp->rx = base + offs->rx;
+		layout->pcs_misc = base + offs->pcs_misc;
+	layout->tx = base + offs->tx;
+	layout->rx = base + offs->rx;
 
-	qmp->tx2 = base + offs->tx2;
-	qmp->rx2 = base + offs->rx2;
+	layout->tx2 = base + offs->tx2;
+	layout->rx2 = base + offs->rx2;
 
 	ret = qmp_usbc_clk_init(qmp);
 	if (ret)
 		return ret;
 
-	qmp->pipe_clk = devm_clk_get(dev, "pipe");
-	if (IS_ERR(qmp->pipe_clk)) {
-		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
+	layout->pipe_clk = devm_clk_get(dev, "pipe");
+	if (IS_ERR(layout->pipe_clk)) {
+		return dev_err_probe(dev, PTR_ERR(layout->pipe_clk),
 				     "failed to get pipe clock\n");
 	}
 
 	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
+				  ARRAY_SIZE(usb3phy_reset_l));
 	if (ret)
 		return ret;
 
@@ -1064,6 +1082,10 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	qmp->layout = devm_kzalloc(dev, sizeof(struct qmp_phy_usb_layout), GFP_KERNEL);
+	if (!qmp->layout)
+		return -ENOMEM;
+
 	ret = qmp_usbc_typec_switch_register(qmp);
 	if (ret)
 		return ret;
@@ -1075,10 +1097,10 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	/* Check for legacy binding with child node. */
 	np = of_get_child_by_name(dev->of_node, "phy");
 	if (np) {
-		ret = qmp_usbc_parse_dt_legacy(qmp, np);
+		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
 	} else {
 		np = of_node_get(dev->of_node);
-		ret = qmp_usbc_parse_dt(qmp);
+		ret = qmp_usbc_parse_usb_dt(qmp);
 	}
 	if (ret)
 		goto err_node_put;
@@ -1097,7 +1119,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_phy_ops);
+	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
 	if (IS_ERR(qmp->phy)) {
 		ret = PTR_ERR(qmp->phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);

-- 
2.34.1

