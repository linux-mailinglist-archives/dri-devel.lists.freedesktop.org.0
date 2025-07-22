Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541EAB0D2A4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952F710E5F7;
	Tue, 22 Jul 2025 07:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwv7lJep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F25210E5F6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M2tcsl016321
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VT8b7qBDokN3MLpgkXbIZ23nfVJk/VqcFfWtXlYFuaI=; b=kwv7lJepHxwqBdSh
 fR3I4mzVGm22oceU8lIkqzW5kRgOiwxqOced/r5H7s0QRllLwdeLBwmej/D9zDbq
 NHfS6vUIrOv9iAfx9cD4ny0/QpEbaoLs6z1LAGNvhV7CLDJxIKcyIyVcSkEAK84h
 7ZNNfHaCwEL4arT65gRVDgszJLjdxYo7ecfWSxPla7v8WCskQIHo7kMBpMODxuqj
 U8ibXXNFNk6PtfqH+uE9K37TFAhGfG6jRcI9UobZpomP4LxqtMRhFZNpyxhXjiSn
 ziP77f5GHpYk9uJvs/3NwESnnRfEron8MpKYLUG7tKH1yoQUdZLNLx10vnrgPCS7
 L6WRRQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s0hrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-311e9b4d254so296386a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168985; x=1753773785;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VT8b7qBDokN3MLpgkXbIZ23nfVJk/VqcFfWtXlYFuaI=;
 b=cj8cWa0vzI/CXKeOESKZZPJEIUv6UmV9G2W+EU+Cw7IElBYgTJ3AyJ+HPOsLLMi+eL
 O11ONfxbPA7O6eYeA9GC1amBDVixqpYCnhEUl/Y8G25Ma+D+skyvkk+r0Qrfm4FvziU9
 lvmRm2USkkITT9E1nSqueC/y3BAap71fzlo1xoJUna2nuW1wEug39rNAXIiAWR5lR8FZ
 kwy4bf7Q1iS5t7WIBDPpkOvGJm0M6Wb1iiSvZ5CJw6X/6NeZBR+1OeJs6U3sRh1p4BkX
 uvvMkXR0OtpCMva++rVIldC55eTyCMxI2uawMX8z5Y5T6CRXn3TSOjOyygrXTtLczMhj
 160A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI5fFEUUKiU+If031oavkb8Ini/Hmoy7bjKUABXbsWzzYEqWqL8XTUZJEVmVu9OlntJLpdeKvalXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTA3g+gml+Fev2T9aTK9glM45SPu/X7GOOCo/zQWlZ6CZ3BB2l
 j7IWvDb8TBpS0ysfZEAgGVmLG6JlO7eu8TbVaAz2geanBpILfTON4Fcg3JRqM4+f9bkibW2kNRT
 /9UaxD9Um28SMUa/8rmfJRgDF2Pe0RqixWXafi5f+YHvnQk2psejUVOWKiL2k/EcoDce3PiQ=
X-Gm-Gg: ASbGncv0lHRzSmedDTuB/+jV3qStPsMpJXS2HG81TERIuXUzXdp39ljZBQ3BgtOhC/1
 LEKRGen4M4phRDgX+i09d0msQ8LCN7Q385BL4Fp5G8v7PiYNshwNgxMaxwhjKK+fmwZJUyLkCaY
 sqeK2xpIkzhhn1q1w/zhDjfhgN15ifTIIZGfzf52rpLR2yfYmSHCBnpX6Z65ih25R+TVnRY3eD8
 8UMvBI3Tmjt6Cgds/emk4al9LhsOFmSheXCFIFp2+V9IO6Mr37u5VAfvYB/jb+NsdAtXYK/vP1s
 QG/mmacZ9rJw+ZCKsuVQh6WSCJxYgeR6rI1ERcuRn16zcxcj93DuejBESYIqmbiUJRik8tECobp
 SbIPQqtZRGQLD6/Uh6oddmaQt3ln5nLa7BCoXZK18hKpB3yDqBzBcKxia
X-Received: by 2002:a17:90b:2b50:b0:314:2d38:3e4d with SMTP id
 98e67ed59e1d1-31c9e77383cmr12638596a91.3.1753168985251; 
 Tue, 22 Jul 2025 00:23:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsYuvflrRFQOjPT9Kd44yOZC4H81PfsHvY7KycJKf8BF5a4xjLlYXRHnJJenqyoUqbLnUukg==
X-Received: by 2002:a17:90b:2b50:b0:314:2d38:3e4d with SMTP id
 98e67ed59e1d1-31c9e77383cmr12638574a91.3.1753168984765; 
 Tue, 22 Jul 2025 00:23:04 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:23:04 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:07 +0800
Subject: [PATCH v2 06/13] phy: qcom: qmp-usbc: Add DP PHY struct
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-6-42b4037171f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=3659;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=fKOEEn238gPnE+qsS8pCjAlw+CFDdTPuR+fL/yjRTNg=;
 b=zV1gjcxy8pY51xKllTd6Tt7ApQk1amC4wRL9m2Mh/bQnoFpYUnlZaE44CklCsZyMugCPsWIJf
 +QI5UeioP8dAZyd+472EtsKsTcY/DUvabnbohnR8aXnf35DgkeCjXEQ
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfXy69U+kb4tovQ
 LFbzieRIPDJyjFZUI09dImx51BHQgfCU3Eb3pQ1c+9MC54C5woBpOujuZ3cOmcps6swq7U752tZ
 Yee2McAFnVdIR0WOm3DrdtPsCK+b/TYift/vhvywF6vOhbt7CmQoPKUKEP1gTxh5qCiqkyi77a3
 w/L/yZR919J0krwnP/AJpQP0JOTOLktACLkI5PzbU7yvNJGrsEipoPEK5zTtIj0t4V5Yqff+9Ag
 kIi+eQfFDKuovL0fvhI7Rm53LeL+ukTVWRxYhZW2TE+ik7B13rKtSTmn9C8FDcUdN7V+ZVJfmVs
 jOkaHtDBzk+q/pAtcrpa/AT1agsYnXJkbEsakJj7kz8foNJe3U7te3blt5EgUbAfVmpfJHP1t8n
 u5KCIXrOV+U2h0SVURqXsQDMM/mXNHFEIlLtgtyWp41LREcWvbTtZMyBpVrDHaitxi8zWgEd
X-Proofpoint-ORIG-GUID: fDh2ax-sM0yM-hxIvcFv9VbheCB6MkTX
X-Proofpoint-GUID: fDh2ax-sM0yM-hxIvcFv9VbheCB6MkTX
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687f3c5a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Wh4CJP1ljwJP8B485oAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
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

This patch introduces new data structures to support DP functionality:
- `qmp_phy_dp_cfg`: Platform-specific constant configuration for DP PHY,
  including init tables, function callbacks, swing/pre-emphasis tables,
  and regulator definitions.
- `qmp_phy_dp_layout`: Runtime layout for DP PHY, including mapped
  registers, DP options from driver, and dynamically configured clocks.
- `qmp_usbc_dp_offsets`: Platform-defined base offsets for DP
  sub-blocks.

These structures mirror the USB counterparts and enable clean separation
of DP logic.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 647e2f54b744bf099ea667e672c606dd7aef3bcf..bc0eaa7dba9cb84b54c7c5a264aac613f888cb99 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -291,6 +291,12 @@ enum qmp_phy_usbc_type {
 	QMP_PHY_USBC_DP,
 };
 
+/* list of regulators */
+struct qmp_regulator_data {
+	const char *name;
+	unsigned int enable_load;
+};
+
 struct qmp_phy_cfg {
 	int type;
 	const void *cfg;
@@ -341,6 +347,67 @@ struct qmp_phy_usb_layout {
 	struct clk_fixed_rate pipe_clk_fixed;
 };
 
+struct qmp_usbc_dp_offsets {
+	u16 dp_serdes;
+	u16 dp_txa;
+	u16 dp_txb;
+	u16 dp_phy;
+};
+
+struct qmp_usbc;
+
+struct qmp_phy_dp_cfg {
+	const struct qmp_usbc_dp_offsets *offsets;
+
+	const struct qmp_phy_init_tbl *serdes_tbl;
+	int serdes_tbl_num;
+	const struct qmp_phy_init_tbl *tx_tbl;
+	int tx_tbl_num;
+	const struct qmp_phy_init_tbl *rx_tbl;
+	int rx_tbl_num;
+	const struct qmp_phy_init_tbl *pcs_tbl;
+	int pcs_tbl_num;
+	const struct qmp_phy_init_tbl *pcs_usb_tbl;
+	int pcs_usb_tbl_num;
+	const struct qmp_phy_init_tbl *dp_serdes_tbl;
+	int dp_serdes_tbl_num;
+	const struct qmp_phy_init_tbl *dp_tx_tbl;
+	int dp_tx_tbl_num;
+
+	/* Init sequence for DP PHY block link rates */
+	const struct qmp_phy_init_tbl *serdes_tbl_rbr;
+	int serdes_tbl_rbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr;
+	int serdes_tbl_hbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr2;
+	int serdes_tbl_hbr2_num;
+
+	/* DP PHY swing and pre_emphasis tables */
+	const u8 (*swing_tbl)[4][4];
+	const u8 (*pre_emphasis_tbl)[4][4];
+
+	/* DP PHY callbacks */
+	void (*dp_aux_init)(struct qmp_usbc *qmp);
+	void (*configure_dp_tx)(struct qmp_usbc *qmp);
+	int (*configure_dp_phy)(struct qmp_usbc *qmp);
+	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
+
+	const struct qmp_regulator_data *vreg_list;
+	int num_vregs;
+};
+
+struct qmp_phy_dp_layout {
+	void __iomem *dp_phy;
+	void __iomem *dp_tx;
+	void __iomem *dp_tx2;
+	void __iomem *dp_serdes;
+
+	unsigned int dp_aux_cfg;
+	struct phy_configure_opts_dp dp_opts;
+	struct clk_hw dp_link_hw;
+	struct clk_hw dp_pixel_hw;
+};
+
 struct qmp_usbc {
 	struct device *dev;
 	int type;
@@ -359,6 +426,7 @@ struct qmp_usbc {
 
 	struct regmap *tcsr_map;
 	u32 vls_clamp_reg;
+	u32 dp_phy_mode_reg;
 
 	struct typec_switch_dev *sw;
 };
@@ -480,7 +548,9 @@ static const struct qmp_phy_cfg sdm660_phy_usb3_cfg = {
 };
 
 #define to_usb_cfg(x) ((struct qmp_phy_usb_cfg *)((x)->cfg))
+#define to_dp_cfg(x) ((struct qmp_phy_dp_cfg *)((x)->cfg))
 #define to_usb_layout(x) ((struct qmp_phy_usb_layout *)((x)->layout))
+#define to_dp_layout(x) ((struct qmp_phy_dp_layout *)((x)->layout))
 
 static int qmp_usbc_generic_init(struct phy *phy)
 {

-- 
2.34.1

