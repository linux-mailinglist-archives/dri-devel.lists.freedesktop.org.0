Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A416FB9DC27
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DE010E856;
	Thu, 25 Sep 2025 07:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqKrZrfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90F510E857
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:43 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1MWZV024045
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xaxo68cQZZrWEEivhuCOX2owVkj5hniZ5EATwBZwjNk=; b=lqKrZrfmnA1mA49d
 BMGBV4DJ0/vxTosfPR90Pc4E2f5oXHiWVRexHvOUMa/OsMVrAoLIGm7yQnocHpSX
 ccZgtt9i/Uu+1iHLafyo5iUwbbRNSxcadDmTp4Eszsth66cIXI2ARYyIUoTf5J4c
 t4oWuZz6CnM5fEuhtOvh6eNiGyGZ5OYiMwgJYaLItz4/bZUfT/yUq16n1tAwrUkY
 j5G8N+5rGjKWdXoXhwM5mBjmcL2bcZ+BoMGsJio78CJnKMfRU/84v71ENg9Ir7mc
 5dhATCTLyEEfLO56LjnspaO8gzewjGHuJKvNoIX7sjniAYYKsY1xuUEVBTaDvLzf
 0jpHCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0e5h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3253ba05aa7so174413a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783940; x=1759388740;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xaxo68cQZZrWEEivhuCOX2owVkj5hniZ5EATwBZwjNk=;
 b=NcJnpStjyMDbt0G9rutNlBxUwsJNHWg6woaMCeU061wlK+AP+oPEqhz+yFEhmZKghG
 VOS1wyyv5j8rhAQQlPf/FACUHGkDj01akxQv9cwzVR7UVzfTm9ZPcnSFopYO131Y+GI9
 HUekyCgCa8qZJa85hx1A1KDO3A/tsrmXAOrXl4m2mpW07DWZbZZ7Zw5/k845LrZgG2Ev
 mqScHX8O3oAn3d18C42oDuAyYAGMMLAeRhxFVba9f3vvkTjmvFp54KXfP+uAUBnr9Y3D
 +FXgjfJo875XmEcQvr/9QZ8KmpYFDT3TyZPoZPhGQrxBJLFEdrEtX92mit8XpvPsm3iN
 RkPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjNo0nVmKMUeobH5066k3Jm+6RNKJsNpALAhwvugzzXjhGVXlRAh5xYa9FNR1426ASEyoAqBOmoXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ8+G43UE5JsXcOZ+qCr3ND8noJcEgXDqqUiU5BHANi+LnNefv
 lIm6fFT31rI6OCgfMtubyCjMY9uaGV5hxkNhYOrvSr0FsiQ57587mfO7s+qYvq42nuln1B6NlVV
 Hxf1++l0XUoO/8D5TRERvxZK31QnWDBA/fKtPfkSuMx1gtMHljKRnNv01XmpMqZ7OzyS25Nk=
X-Gm-Gg: ASbGnct9CQ0RRNgzanU9L1ll3g9zRVBYzgWjkb9obDWTJbjknhgz48m3w/o5K/ZjRG3
 it1AaajJUpIqLALq2+qW7gFDz2c7Q4G9Pnl/aQhAkgNYOvmfSoVjUYwWsreqF/LNhDuAX7if19e
 1hqsab7d3VE/axmypnay3/Jdht4nYYfkzwUwtzev/DYuve/f6wyw14F+SsdMuzyTlbRm27vhLxa
 9eGu/w6sDJsjfYKykVPc0MjWya7Ffzbk49BaE6USUII5wkTvBaZZ+M0/FpPQ/D9rdsep+8IR3a3
 W456Nw9JQMEAWpNJNvDzkgp/opFHYPH2NJs22OyxY1X5j5UDosjmvrNN3wQS0rN24lkXCf43eZL
 KojPq+LXJx+pazNjusWY+2S7+AuHivIJFDtnqHZi4bpYMnhskG6jU2XNr
X-Received: by 2002:a17:90b:388e:b0:32b:aed4:aa1a with SMTP id
 98e67ed59e1d1-3342a2becc5mr1437899a91.4.1758783940314; 
 Thu, 25 Sep 2025 00:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF08XNZvMgLQSMxyP3a6gJQ7OHs/SMmu2hfWmPLLtMYILn3N1lf7IdRY1VjzAg/lXzvndi+aw==
X-Received: by 2002:a17:90b:388e:b0:32b:aed4:aa1a with SMTP id
 98e67ed59e1d1-3342a2becc5mr1437881a91.4.1758783939828; 
 Thu, 25 Sep 2025 00:05:39 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:05:39 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:49 +0800
Subject: [PATCH v6 03/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-3-419fe5963819@oss.qualcomm.com>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783909; l=3979;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=V+bmwYjKfMRV9O7yUHq5omi3q3vjjg0Qz8GTgu2JE4Q=;
 b=Ae0l6papN9LzPWR+g9eFxMd4ZlEhIaSGUpmSLY4qxCCVUqXRcR6QD7bRTeW43zrHkOlMzP+Ve
 p5rKCT8LoSsCIdXV1/sNtFb7PSqek1AuWbZErM1yQ8AxonY2RoJ96Vg
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4e9c5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jm3WsR2aq1IkTfYpOVcA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: qRmxkEDK5F0KpM1cHVsobT_1Mr7UVSoG
X-Proofpoint-ORIG-GUID: qRmxkEDK5F0KpM1cHVsobT_1Mr7UVSoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX1TAvkW5iQtso
 ItwIcqEhe9mjsTjXmZFECwuTNAGywFaLUFJ83eojsBlG1e03qXdPjuZ4gKG2zaxo7d58AsDgqMv
 23hc5xZ1EweZSxL/hrmMOL8Boa06ZtRfyQ7pwwu9Her5C6TAmk7OqL4/u+594HI03miAN534XBd
 d5XPacK+OnwJ7My9RgkHNGuknLtWD67D4i/QPqHKYlhfmf+sAsT5FL8He2YwRACY/eRGvhVGo3i
 yQScbCMFdXW03gmxuW+U1AZxKxOyOHTxdoiHqloM8qVjHH9qjuPO1HUod2y3BtBeq5WujPopIQZ
 1H9Bk4SAou83ATSX5yTUjtXE6DsCtHnZnou0JOu42f9YAkGP20iqS9+btdUX5gSEXMDe9aOucZs
 +ySNBjvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
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

Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
including register offsets, init tables, and callback hooks. Also
update qmp_usbc struct to track DP-related resources and state.
This enables support for USB/DP switchable Type-C PHYs that operate
in either mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 54 +++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 62920dd2aed39bbfddd54ba2682e3d45d65a09c8..de28c3464a40ea97740e16fe78cba4b927911d92 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -293,13 +293,18 @@ struct qmp_usbc_offsets {
 	/* for PHYs with >= 2 lanes */
 	u16 tx2;
 	u16 rx2;
+
+	u16 dp_serdes;
+	u16 dp_txa;
+	u16 dp_txb;
+	u16 dp_dp_phy;
 };
 
-/* struct qmp_phy_cfg - per-PHY initialization config */
+struct qmp_usbc;
 struct qmp_phy_cfg {
 	const struct qmp_usbc_offsets *offsets;
 
-	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
+	/* Init sequence for USB PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
 	int serdes_tbl_num;
 	const struct qmp_phy_init_tbl *tx_tbl;
@@ -309,6 +314,27 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *pcs_tbl;
 	int pcs_tbl_num;
 
+	/* Init sequence for DP PHY blocks - serdes, tx, rbr, hbr, hbr2 */
+	const struct qmp_phy_init_tbl *dp_serdes_tbl;
+	int dp_serdes_tbl_num;
+	const struct qmp_phy_init_tbl *dp_tx_tbl;
+	int dp_tx_tbl_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_rbr;
+	int serdes_tbl_rbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr;
+	int serdes_tbl_hbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr2;
+	int serdes_tbl_hbr2_num;
+
+	const u8 (*swing_tbl)[4][4];
+	const u8 (*pre_emphasis_tbl)[4][4];
+
+	/* DP PHY callbacks */
+	void (*dp_aux_init)(struct qmp_usbc *qmp);
+	void (*configure_dp_tx)(struct qmp_usbc *qmp);
+	int (*configure_dp_phy)(struct qmp_usbc *qmp);
+	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
+
 	/* regulators to be requested */
 	const char * const *vreg_list;
 	int num_vregs;
@@ -329,24 +355,36 @@ struct qmp_usbc {
 	void __iomem *rx;
 	void __iomem *tx2;
 	void __iomem *rx2;
-
-	struct regmap *tcsr_map;
-	u32 vls_clamp_reg;
+	void __iomem *dp_dp_phy;
+	void __iomem *dp_tx;
+	void __iomem *dp_tx2;
+	void __iomem *dp_serdes;
 
 	struct clk *pipe_clk;
+	struct clk_fixed_rate pipe_clk_fixed;
+
+	struct clk_hw dp_link_hw;
+	struct clk_hw dp_pixel_hw;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	int num_resets;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
+	struct regmap *tcsr_map;
+	u32 vls_clamp_reg;
+	u32 dp_phy_mode_reg;
+
 	struct mutex phy_mutex;
 
 	struct phy *usb_phy;
 	enum phy_mode mode;
 	unsigned int usb_init_count;
 
-	struct clk_fixed_rate pipe_clk_fixed;
+	struct phy *dp_phy;
+	unsigned int dp_aux_cfg;
+	struct phy_configure_opts_dp dp_opts;
+	unsigned int dp_init_count;
 
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
@@ -689,7 +727,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->usb_init_count) {
+	if (!qmp->usb_init_count && !qmp->dp_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -709,7 +747,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->usb_init_count) {
+	if (!qmp->usb_init_count && !qmp->dp_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}

-- 
2.34.1

