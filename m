Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08DDB9DC36
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF4B10E854;
	Thu, 25 Sep 2025 07:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cK/OdlXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B1E10E855
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4adaN027863
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ph7HUhaBaiRojkAD3JbT6dqDUnW8cPmN0abiXHdzjwk=; b=cK/OdlXkZtcd4T/Q
 mgVAZlicyr/yPTGek5K8OsRqISqjTdJMhvZxyRnUNtZmXs5a3D+PIQ5I1AQdP1gY
 XU41Ih8upF6IYvj8808u5lZmTJou2hIA9G4TuBfA1XO0F4s0K9YG6ezZokzIAfXm
 zrnZmaHDz08en4EOYL0RLKM/RR6/1haXNFvR6bHG8GdIjPduqvmKIBap1705SVOB
 SyLxWojcfzLY0koa+hOswikznVGIUnFrQ1f/vaDxHcRmKnWnI2GnV+jFeqIKUXTT
 opRY1bln7VSH3R0QB1ziKVC58kWjqzjsQqLML5t6FG5MgdHugjHVb6wtF86nrx+P
 zE/6hw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup0buc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-26b3e727467so2375355ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783947; x=1759388747;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ph7HUhaBaiRojkAD3JbT6dqDUnW8cPmN0abiXHdzjwk=;
 b=P4KLJ/ylVx/WsE6GRAbV2Dl+XP1BPnYXLtHukRVhjZGe1VmY1SmsLg5j3A6X9KC0AH
 bITN7pfRWlzDzhP3LtLl+KRWiCUBSgguWAhTAON7YykIec8hXuwgszg9S9njqCTWnNTx
 8ylW6Vj3+WUKQ1mWUriEj+1/iq12O/h6jCBywYbYEsDo+qHnay1LnBt9LNRENGvs0ekB
 tQgZ2AURswkT9jPB8WGnQz6nsaJ8QPu3DwY9jkO4dda1Hb55tI7gXYLDnHtYGEKeZYdc
 ayHQQahGaHSq/Yfgg7mmlR2kmC6Lz4jmVM27p+AoYg7TQuphPcWxgcwSN6SSaksktoZb
 ehzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkQrWz1IWlDLUHNXkEh1Wi7A1RhObqjy+NvCuNMsM0V9K12gNcidxSrKOz/vYoOi2yx3plUbHIEFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKYXj1vo0i6pszOnSux61tCkFWQje9Ah+1P1j2uPcnxlacMXQF
 D4vvXjslkyE3ZU9kQSP3tVeEsna9xOiFW6nR03i9VEM0pGim50cyDMU6e+hxPgEapjBGa560EyC
 MxANgHSVbZlF/aTQtpC2huvQd4LUy0A2XgOyyu2MngYU96RNL6qdN/yOrrUdG+GtRaHy6PaA=
X-Gm-Gg: ASbGncuvi7M6PPrsiLp35NRIFWT/1PxOexBUe6LW5djraXH5Ne9bAr4hAxfHGEDKaCp
 fQdbFR3j3u8ifLuOQ06L4vR4v2EPOtVJ6QnxjP367TfkXFSP1VamGgsfXTUeUiecFLE0sX19EaE
 npcxK8yxz/IH5jtgB7EkYAKIGhhvgJHFkMgqgvcA/8g2sIZKZgW8MiNzIf5G9qqIFPUf/JuzPTW
 8X4LX+rGBWUjYf7fqZrJ4jReAHyz6CnaTR0l6qmtA4uM22oAgbKfhv1s2omEqZvtXFQ6p88r/zx
 RXWZkQpdWUM5AJueKrghSvyw6FgaMuq3O8nnw29dZ+W3XLl/IEmnqx7ThNB3Ik//lf54mOppB91
 gV079DcLjImgM9dd0U/Lsr/wc3giVkIlw9/fwaZHWgmxSbmFtHF/NPTAX
X-Received: by 2002:a17:902:db11:b0:24e:af92:70de with SMTP id
 d9443c01a7336-27ed4a7e773mr18675395ad.7.1758783947524; 
 Thu, 25 Sep 2025 00:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj+bwvxBUG8vgoHHmPF6ytXc074CDD60FgvKn/jVxkoKD6yq0QRAunDpbU6JJhFhqnTIsG/Q==
X-Received: by 2002:a17:902:db11:b0:24e:af92:70de with SMTP id
 d9443c01a7336-27ed4a7e773mr18675055ad.7.1758783947040; 
 Thu, 25 Sep 2025 00:05:47 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:05:46 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:50 +0800
Subject: [PATCH v6 04/14] phy: qcom: qmp-usbc: Add regulator init_load support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-4-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783909; l=5441;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ScND5R19fNR4fxgqnX3CVdg+GNtnOHYJhlmcXMGybGg=;
 b=0fB5OjPqaagCd3BrReglBJJPeOjzulbqpFpWXN0Or0+qaUYtuwJ6Y+P4ZYRQZ5ojyxU730kA2
 AGd3Qr7RGYzBTupWFA88I5M1Mej/W5qDL+cfYtOkEMlWj5pze7kwRdU
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4e9cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6BFfyeCpfu5Dl7vuC9UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX0wffLFXlhEjS
 uJxU/0XLSKsVnH0YAQCHOX45j7BRKGNdAicGiPSnkudSZ2G/FdQ2LwFVensbZZ8uhsVkt1ceunN
 QuT0Ou9BLsOMdQpi4KxiAtAOTUBioNj51wygmiUZj9mEHjnyxY0nDiwa8xyFCm4JxYBTs8gw1EB
 73+j09IRVtNZB31oqFQEuKwiKlmpinx/Z6uSHirnFXkzPUGVX6SA02NBrRw+SFnd1h548wzi9MA
 gROXtmWa67TssBZbaVBCH6y+8IDy5o68MMZcb/8F0h//e74b67fVxO+JxS9i2AfNK1f7PKe9wPZ
 P7P9SAvxhtTg0Kl47S/JCHSiVLSxK4JDBAL4ImB9Z86XLefmEoq4pyu/LfUqaUv3rAKn7d5PuSG
 zejCkcwL
X-Proofpoint-GUID: x9F2SRfRa7za65EBXbmF8LujZGR5sYG4
X-Proofpoint-ORIG-GUID: x9F2SRfRa7za65EBXbmF8LujZGR5sYG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042
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

QMP USBC PHY drivers previously did not set init_load_uA for regulators,
which could result in incorrect vote levels. This patch introduces
regulator definitions with proper init_load_uA values based on each
chip's power grid design.

QCS615 USB3 PHY was previously reusing qcm2290_usb3phy_cfg, but its
regulator requirements differ. A new qcs615_usb3phy_cfg is added to
reflect the correct settings.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 68 ++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index de28c3464a40ea97740e16fe78cba4b927911d92..3b48c69f9c3cb7daec495ebc281b83fe34e56881 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -336,7 +336,7 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
 
 	/* regulators to be requested */
-	const char * const *vreg_list;
+	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
 	/* array of registers with different offsets */
@@ -428,9 +428,19 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-/* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
-	"vdda-phy", "vdda-pll",
+static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 68600 },
+	{ .supply = "vdda-pll", .init_load_uA = 14200 },
+};
+
+static const struct regulator_bulk_data qmp_phy_sm2290_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 66100 },
+	{ .supply = "vdda-pll", .init_load_uA = 13300 },
+};
+
+static const struct regulator_bulk_data qmp_phy_qcs615_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 50000 },
+	{ .supply = "vdda-pll", .init_load_uA = 20000 },
 };
 
 static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
@@ -454,8 +464,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
-	.vreg_list              = qmp_phy_vreg_l,
-	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list              = qmp_phy_msm8998_vreg_l,
+	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
 };
 
@@ -470,8 +480,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_sm2290_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -486,8 +496,24 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_msm8998_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
+};
+
+static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
+	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+
+	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
+	.tx_tbl			= qcm2290_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
+	.rx_tbl			= qcm2290_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
+	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -773,23 +799,6 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
 			   qmp_usbc_runtime_resume, NULL)
 };
 
-static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
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
 static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
 			      const char *const *reset_list,
 			      int num_resets)
@@ -1097,7 +1106,8 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qmp_usbc_vreg_init(qmp);
+	ret = devm_regulator_bulk_get_const(qmp->dev, qmp->cfg->num_vregs,
+					 qmp->cfg->vreg_list, &qmp->vregs);
 	if (ret)
 		return ret;
 
@@ -1163,7 +1173,7 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 		.data = &qcm2290_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
-		.data = &qcm2290_usb3phy_cfg,
+		.data = &qcs615_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,

-- 
2.34.1

