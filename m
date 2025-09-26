Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBC8BA2B77
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 09:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D8210E9E1;
	Fri, 26 Sep 2025 07:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUO36ulx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156E510E9E6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6tDVt014389
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xaxo68cQZZrWEEivhuCOX2owVkj5hniZ5EATwBZwjNk=; b=MUO36ulxe97L2OD9
 1BqLZ//oeJKZlzPBFOMEWw0RJNvdw6Pf21HW9DNvxjAfqTZxX9lXGyjuCQOHTFqo
 Cgtxr9MURwmFGZMKjyP0sJ4AquEbrh2DoLj8M3GJ02OwcnvseyJfgH6amDgUSh++
 SjJNEmhjL1cgfJG5odETXojel1Hs2Yewrcdsk23PxhoadICDqTXCNFgxtdAFi+o5
 ixs0t+uhHIfw5b2pb3cgg315fB4f/+O8MUmvDkXxiY8YZYHfBJzyZN+kIudbBWET
 oBjXnOa1EJM4Uoje0/ngN90OBmzBlr1h66aond7InW7AA8Bc+ymf201AVd//d5uw
 fiYfDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rhvx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-269b2d8af0cso4284725ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 00:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871593; x=1759476393;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xaxo68cQZZrWEEivhuCOX2owVkj5hniZ5EATwBZwjNk=;
 b=RUmuzg197n3SZ/3wwc7XW3VXZxQnAqBibjAO/9Z06SeNidpCA4qtJNFcjrgC9572z4
 freoKnj/mavtNX6xbkx1bdD71ZA+/DdAtN7JS9TSwK9tYPB5HN1j3L2iGb/Sojyey4m6
 UbzKnGrTbeXlLXqTehb+f3iZIp1a5cbT2H8QmjK+a+4JU1/gieos9ducWhdW299M5vWW
 rS1A/Ge7Ir+3yQehyHoYpKHPl/jb+Yr9xb6xFyNYkxxGNoU/uwt0IAvlaCjfANMPEIf3
 b535SghZhUVXymvEegYJr3B3wwkKGnmmsFz178Z1vwcASFdoxVpS7T7ImsWJtvCNw1xO
 Q+IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg8ceryZ8d2uo4LM0g49YSVXBelAVc8iFoAvCjR5eOsYZ9TKmPAKo//MxNzrlUfhnZ0gqOjOusy24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/wrq0qqBErswRe6Fq6E4EbfmTOTw4Elkwf7Wy6AOTpfut/cEI
 msMHJCMkHsWg4jj8RZ7cY/Nrq9vVrzidu+R5m0MKLjJqrC30Ugkb4at/GFO5uV5M90dRl7sYI6/
 +g0g8Gb3takXnWwE89rfb9C34xUfup/1TvFsGJ5sKRCfW1K0RowV7N8JssV5mnIbteo9Q52U=
X-Gm-Gg: ASbGncvbg6/nY6FqwkwxIVjS/ZQxC+xRqpJQAAffjILlLybI7B57kzTSEJS6qp+uZ6h
 G68PmW/QGVYvvWgooYl6HBV80jDC8XLBrBJHA/6h++WnYFiiu9JMINvepRxm62zaJk4DIGijhsS
 yuhO8kDaNM9wmlB+SCfIpenmrnGF6+LaasSqRmDZ2lUtO940R2V1sOwypn1jk+HBj6LwEvVbEmk
 iZdDFNsWD5UI3e00Dr4lGfPlZ1pxz0nP1cW78nDZAMIgHxkri7tMBIYQaFnVGUqMU9g2EPltoLs
 FOI/KN2ZHVblYKIvc94lJtsaP1WLAlDl2k/1EZuOVMlwGBhFnYerIp4KE4al8rzT2SkKZziiHFC
 /Yp7lYIxA8eUg/aV4bgFJCKh6CujjqjiWUyZxOWHzKljoldo1t05DE0Wu
X-Received: by 2002:a17:902:db11:b0:24e:af92:70de with SMTP id
 d9443c01a7336-27ed4a7e773mr47493265ad.7.1758871593450; 
 Fri, 26 Sep 2025 00:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtuIwETTdMuZFytO6gNG8pDDirIuQO50mBZZkHzCplsKRiXqaAce6j6yazHtoa1boWUkBnIg==
X-Received: by 2002:a17:902:db11:b0:24e:af92:70de with SMTP id
 d9443c01a7336-27ed4a7e773mr47492965ad.7.1758871593007; 
 Fri, 26 Sep 2025 00:26:33 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 00:26:32 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:39 +0800
Subject: [PATCH v7 03/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-3-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871562; l=3979;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=V+bmwYjKfMRV9O7yUHq5omi3q3vjjg0Qz8GTgu2JE4Q=;
 b=8Gw1TqMTIu4+SMDOsf2QNnJ1zb+xwdOWQ6J2y4ga7ZkzeMW8XD2pf5E9cnQQLlVs0je+aagaj
 NmrMOdI5mPgC9gOOCsgy43oMazsY2HtkgiGoJtjIMzdWF79TzMxQ05T
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d6402a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jm3WsR2aq1IkTfYpOVcA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: UPz-IDYqusz7cZ4Su2gIxOjauUMQJpRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX1186Dfzfnevs
 EeikIvAoUSBtl2iG4GJ5xv6E603b1Wx1pD1Jg1TqiFVPRcFl6IgQXBvygs/AdgvZN1GACXTifOt
 oqgUt37zP7K5QvlM5qxc1/DLQamH2fAUo7+D8Mi+d+7wm+mtJoJKU7bI/e5jlkpGXEfR6Ii9VSB
 iWUenD1YSk5c22g01D6USKQvJsirBJ/mGxGgJ2m7sH4nmJcrtQtRrcmvMpqTtKPjZuvoaPZhFIL
 yVx0qAASITzeSWTBN7B/e90R3nZVOZtmunev9auf2Doec51TBEUWCiAduOu/mWKtfC+LmLrukQW
 XlHA8eO8NOeh1diD2b1+Cv/iTX8jMOGiD7K1f0MBJ20h7AFq4nEHK9Ybe8yyIrO+RlrTxAc9GEM
 8w82OLeGuj39mk+3x8NFiDqLm5eUFw==
X-Proofpoint-GUID: UPz-IDYqusz7cZ4Su2gIxOjauUMQJpRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

