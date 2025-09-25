Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B2B9DC9C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5CA10E863;
	Thu, 25 Sep 2025 07:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UunmeKzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF44910E863
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONHg4q027912
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MQywDDAcWYT+0RdvqyfNhFfl3UTIYdzSA7Mm529kFnI=; b=UunmeKzBTA9Z0nDU
 r8ax4nQcrXC5dQ9QmEX+mk3kKuZisdQWK8EqLal7BQ3AygZ22eugc7zwkdMjVUIp
 /BSBtz2WZFRt6M21lPQy6HU2vOimJMIui+lv0CyW7wI19HzIiGzmqHn2VjB5eqjp
 qOvRG9EsdQH4c+k/JBdUDMSlRjG0/xyXiRyGfFqGxkjYnHXL4mKu3v+0yg56lXpV
 5a26glHX7FauC9ljjYrh7TXZJU+c4hJePuAuMlX5ETFo5ix9cgzMk0kdHSHKrb7i
 neuh1EvP3BzGTaYl2pd4FtFmPH0JUBzaMGW4317vNbYD5aGKmwJjvJFxTdQWZYxT
 3I398g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnygac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32eb3736080so159835a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783996; x=1759388796;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQywDDAcWYT+0RdvqyfNhFfl3UTIYdzSA7Mm529kFnI=;
 b=PdnJ/IShlBDxxz/mHoETl+7v5IYB/Jfv6ofrCUusD/r5FTHbxlhVLt3KlTRFkDHqZ6
 vDyRoG9Fxnp+0cWyeXC7BtBPS88rp/Kvx5Ty6u7BH4VdXMzR7vrXrKGpELmZhctaNdLt
 IAoRraJdKtY3oUvM+uiP9fodHYdhC5CYlnGu73xPuqehJzpyMPnJ4/5fQGF21V6yDFmc
 oL9VYq9gE0qE4D2POTzJVtG4J19+1HU9PVHgPzSKf2booUNgM7ySJe4IgQo9YwRAUou2
 T2Hyn0lvYCAWYIUz/KO1QDJM+3lCqgzd4wdaKN24IUoRxnngDjjhaA8BZUzPT7gYmUjw
 vk9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdmRV8IYcKWNivFcooqGlsiMs68agBTN3vhTHIhRAIqQ6TpHJ5Bk6kAKnipv2b9DjPBE/Utamj8os=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB4QXBlvKFxhoZa+tb8F6bJYncHOfu3dFYBrKTmFi9blofz9FE
 v3mgmDX0wZslUm9EHMdBFQOwDusI2vRUzrmEhmalcOXX7Z2q8OWpbiaZF3R4M2do6FPYta3POyg
 82nFqWjiWK0fLtGtEgUOFMBwS30PvPdgwQKyEsU/1RVb4xB4MNngPXg1eiscdJgH6mLp/8L8=
X-Gm-Gg: ASbGncssZP/GmexX2ly2KQQL6Tynku1V9ZyxNmHZa3etxKdPWLbR8iESCo82CuJz7xL
 LDz2y9h/MBMm5R9Gw1rfy9X4712/9vdpmI8ralzky70KB+C6Ntb3BUFQBvJkEi/L9UzSo5Cf/W4
 Gng+fULp/S5C9RdzvFUeaWLXYYNL1kUOCOkY1A6pyfiFZh58FBTdnQf9q3YyJ/3YqVOISdOJMRX
 aUCoOIPBoZAzfuyRfLwGlkum4ueIoOoHbUriGBaIg3w1ZRdQCwmoMihF+06bmFPqNPW5lsiu0Bf
 j9WbUb8fOHWToa5vbxX+fDNenwBit/BE0sMFNhFumGm5MKvspErnDi1SwbPAPInyPivQcG1TdZa
 jTPAb/AYhYX7a2fnU6BSjhIkpaeExjD2jg7T8zsTZdP2mcynyFnwXHYjx
X-Received: by 2002:a17:90b:3b81:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-3342a2c67a0mr1337874a91.5.1758783995742; 
 Thu, 25 Sep 2025 00:06:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFosRyM+6GEnuScK4jDXS++HjDM2WVQ0viagXKb/PMykPD/+ULtO+8PwQyGqvyyIvI7w9WFMQ==
X-Received: by 2002:a17:90b:3b81:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-3342a2c67a0mr1337850a91.5.1758783995039; 
 Thu, 25 Sep 2025 00:06:35 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:06:34 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:57 +0800
Subject: [PATCH v6 11/14] phy: qcom: qmp: Add DP v2 PHY register
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-11-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783911; l=10561;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=wRcG6hvTUjOLE7118EUHmvDQXHvLMsHays/1bOGOLyY=;
 b=VJvdXOCocIzleU/aHl3LvHmehbFiSTll553k4328AFSkBzZF7cRrlS3XN1v11qGZO6RYHWLMH
 5cjmylgPSHdDM+9MWzA8oeQQFGYprOlAgtbpx+GSqhncGOfOXST3cX2
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d4e9fd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7JoLr56Aoq0vruZkpkIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Qxy47DDJjQ90SgUQB9u8aWelyjaMo6F5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX8P2PF2pjz5d7
 IQMK0URijOAf7aTSj2YiUfqDKl4/CBJoFiG38kC89nI3kr/asrnq9AdLGKv+t92iAjlSzlKn/h3
 nU3BFJTbtzpjVqm7n7vBK5MYeBgQtpXR+ZqxEVXqC53eKzzCf9L2fk5mBbduYBbCqpcoRSI818V
 GqWm/zISYQ0Kd062AaIsZp2/UuVG6QCiz4lobEC6uBmoliy+aEEy/ZpFFrzgPIxZcCOCalF0UyD
 DEt+tcVgw0cZN58mfH2xzII/icZek+GPwI39mD8SMfDcnepnhEw+1rbgN3JI42lcIzMbO20YK2D
 yDiKsMPAIcgOMwjECYVZNugoxGj3RcuBH6icf0OnUc4yHsL/Vhn7ou8KS4PSQPgDTSar8PJK1fW
 ksYI3g1h
X-Proofpoint-GUID: Qxy47DDJjQ90SgUQB9u8aWelyjaMo6F5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
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

Add dedicated headers for DP v2 PHY, including QSERDES COM and TX/RX
register definitions.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |  21 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h | 106 +++++++++++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h    |  68 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   3 +
 4 files changed, 198 insertions(+)

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
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h
new file mode 100644
index 0000000000000000000000000000000000000000..3ea1884f35dd50a0bde9b213f193ac8ac6b77612
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V2_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V2_H_
+
+/* Only for QMP V2 PHY - QSERDES COM registers */
+#define QSERDES_V2_COM_ATB_SEL1				0x000
+#define QSERDES_V2_COM_ATB_SEL2				0x004
+#define QSERDES_V2_COM_FREQ_UPDATE			0x008
+#define QSERDES_V2_COM_BG_TIMER				0x00c
+#define QSERDES_V2_COM_SSC_EN_CENTER			0x010
+#define QSERDES_V2_COM_SSC_ADJ_PER1			0x014
+#define QSERDES_V2_COM_SSC_ADJ_PER2			0x018
+#define QSERDES_V2_COM_SSC_PER1				0x01c
+#define QSERDES_V2_COM_SSC_PER2				0x020
+#define QSERDES_V2_COM_SSC_STEP_SIZE1			0x024
+#define QSERDES_V2_COM_SSC_STEP_SIZE2			0x028
+#define QSERDES_V2_COM_POST_DIV				0x02c
+#define QSERDES_V2_COM_POST_DIV_MUX			0x030
+#define QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN		0x034
+#define QSERDES_V2_COM_CLK_ENABLE1			0x038
+#define QSERDES_V2_COM_SYS_CLK_CTRL			0x03c
+#define QSERDES_V2_COM_SYSCLK_BUF_ENABLE		0x040
+#define QSERDES_V2_COM_PLL_EN				0x044
+#define QSERDES_V2_COM_PLL_IVCO				0x048
+#define QSERDES_V2_COM_LOCK_CMP1_MODE0			0x04c
+#define QSERDES_V2_COM_LOCK_CMP2_MODE0			0x050
+#define QSERDES_V2_COM_LOCK_CMP3_MODE0			0x054
+#define QSERDES_V2_COM_LOCK_CMP1_MODE1			0x058
+#define QSERDES_V2_COM_LOCK_CMP2_MODE1			0x05c
+#define QSERDES_V2_COM_LOCK_CMP3_MODE1			0x060
+#define QSERDES_V2_COM_EP_CLOCK_DETECT_CTR		0x068
+#define QSERDES_V2_COM_SYSCLK_DET_COMP_STATUS		0x06c
+#define QSERDES_V2_COM_CLK_EP_DIV			0x074
+#define QSERDES_V2_COM_CP_CTRL_MODE0			0x078
+#define QSERDES_V2_COM_CP_CTRL_MODE1			0x07c
+#define QSERDES_V2_COM_PLL_RCTRL_MODE0			0x084
+#define QSERDES_V2_COM_PLL_RCTRL_MODE1			0x088
+#define QSERDES_V2_COM_PLL_CCTRL_MODE0			0x090
+#define QSERDES_V2_COM_PLL_CCTRL_MODE1			0x094
+#define QSERDES_V2_COM_PLL_CNTRL			0x09c
+#define QSERDES_V2_COM_BIAS_EN_CTRL_BY_PSM		0x0a8
+#define QSERDES_V2_COM_SYSCLK_EN_SEL			0x0ac
+#define QSERDES_V2_COM_CML_SYSCLK_SEL			0x0b0
+#define QSERDES_V2_COM_RESETSM_CNTRL			0x0b4
+#define QSERDES_V2_COM_RESETSM_CNTRL2			0x0b8
+#define QSERDES_V2_COM_LOCK_CMP_EN			0x0c8
+#define QSERDES_V2_COM_LOCK_CMP_CFG			0x0cc
+#define QSERDES_V2_COM_DEC_START_MODE0			0x0d0
+#define QSERDES_V2_COM_DEC_START_MODE1			0x0d4
+#define QSERDES_V2_COM_VCOCAL_DEADMAN_CTRL		0x0d8
+#define QSERDES_V2_COM_DIV_FRAC_START1_MODE0		0x0dc
+#define QSERDES_V2_COM_DIV_FRAC_START2_MODE0		0x0e0
+#define QSERDES_V2_COM_DIV_FRAC_START3_MODE0		0x0e4
+#define QSERDES_V2_COM_DIV_FRAC_START1_MODE1		0x0e8
+#define QSERDES_V2_COM_DIV_FRAC_START2_MODE1		0x0ec
+#define QSERDES_V2_COM_DIV_FRAC_START3_MODE1		0x0f0
+#define QSERDES_V2_COM_VCO_TUNE_MINVAL1			0x0f4
+#define QSERDES_V2_COM_VCO_TUNE_MINVAL2			0x0f8
+#define QSERDES_V2_COM_INTEGLOOP_INITVAL		0x100
+#define QSERDES_V2_COM_INTEGLOOP_EN			0x104
+#define QSERDES_V2_COM_INTEGLOOP_GAIN0_MODE0		0x108
+#define QSERDES_V2_COM_INTEGLOOP_GAIN1_MODE0		0x10c
+#define QSERDES_V2_COM_INTEGLOOP_GAIN0_MODE1		0x110
+#define QSERDES_V2_COM_INTEGLOOP_GAIN1_MODE1		0x114
+#define QSERDES_V2_COM_VCO_TUNE_MAXVAL1			0x118
+#define QSERDES_V2_COM_VCO_TUNE_MAXVAL2			0x11c
+#define QSERDES_V2_COM_VCO_TUNE_CTRL			0x124
+#define QSERDES_V2_COM_VCO_TUNE_MAP			0x128
+#define QSERDES_V2_COM_VCO_TUNE1_MODE0			0x12c
+#define QSERDES_V2_COM_VCO_TUNE2_MODE0			0x130
+#define QSERDES_V2_COM_VCO_TUNE1_MODE1			0x134
+#define QSERDES_V2_COM_VCO_TUNE2_MODE1			0x138
+#define QSERDES_V2_COM_VCO_TUNE_INITVAL1		0x13c
+#define QSERDES_V2_COM_VCO_TUNE_INITVAL2		0x140
+#define QSERDES_V2_COM_VCO_TUNE_TIMER1			0x144
+#define QSERDES_V2_COM_VCO_TUNE_TIMER2			0x148
+#define QSERDES_V2_COM_CMN_STATUS			0x15c
+#define QSERDES_V2_COM_RESET_SM_STATUS			0x160
+#define QSERDES_V2_COM_RESTRIM_CODE_STATUS		0x164
+#define QSERDES_V2_COM_PLLCAL_CODE1_STATUS		0x168
+#define QSERDES_V2_COM_PLLCAL_CODE2_STATUS		0x16c
+#define QSERDES_V2_COM_CLK_SELECT			0x174
+#define QSERDES_V2_COM_HSCLK_SEL			0x178
+#define QSERDES_V2_COM_INTEGLOOP_BINCODE_STATUS		0x17c
+#define QSERDES_V2_COM_PLL_ANALOG			0x180
+#define QSERDES_V2_COM_CORECLK_DIV			0x184
+#define QSERDES_V2_COM_SW_RESET				0x188
+#define QSERDES_V2_COM_CORE_CLK_EN			0x18c
+#define QSERDES_V2_COM_C_READY_STATUS			0x190
+#define QSERDES_V2_COM_CMN_CONFIG			0x194
+#define QSERDES_V2_COM_CMN_RATE_OVERRIDE		0x198
+#define QSERDES_V2_COM_SVS_MODE_CLK_SEL			0x19c
+#define QSERDES_V2_COM_DEBUG_BUS0			0x1a0
+#define QSERDES_V2_COM_DEBUG_BUS1			0x1a4
+#define QSERDES_V2_COM_DEBUG_BUS2			0x1a8
+#define QSERDES_V2_COM_DEBUG_BUS3			0x1ac
+#define QSERDES_V2_COM_DEBUG_BUS_SEL			0x1b0
+#define QSERDES_V2_COM_CMN_MISC1			0x1b4
+#define QSERDES_V2_COM_CMN_MISC2			0x1b8
+#define QSERDES_V2_COM_CORECLK_DIV_MODE1		0x1bc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
new file mode 100644
index 0000000000000000000000000000000000000000..34919720b7bc457ae9549e7c53864be01a27a9b3
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V2_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V2_H_
+
+/* Only for QMP V2 PHY - TX registers */
+#define QSERDES_V2_TX_BIST_MODE_LANENO			0x000
+#define QSERDES_V2_TX_CLKBUF_ENABLE			0x008
+#define QSERDES_V2_TX_TX_EMP_POST1_LVL			0x00c
+#define QSERDES_V2_TX_TX_DRV_LVL			0x01c
+#define QSERDES_V2_TX_RESET_TSYNC_EN			0x024
+#define QSERDES_V2_TX_PRE_STALL_LDO_BOOST_EN		0x028
+#define QSERDES_V2_TX_TX_BAND				0x02c
+#define QSERDES_V2_TX_SLEW_CNTL				0x030
+#define QSERDES_V2_TX_INTERFACE_SELECT			0x034
+#define QSERDES_V2_TX_RES_CODE_LANE_TX			0x03c
+#define QSERDES_V2_TX_RES_CODE_LANE_RX			0x040
+#define QSERDES_V2_TX_RES_CODE_LANE_OFFSET_TX		0x044
+#define QSERDES_V2_TX_RES_CODE_LANE_OFFSET_RX		0x048
+#define QSERDES_V2_TX_DEBUG_BUS_SEL			0x058
+#define QSERDES_V2_TX_TRANSCEIVER_BIAS_EN		0x05c
+#define QSERDES_V2_TX_HIGHZ_DRVR_EN			0x060
+#define QSERDES_V2_TX_TX_POL_INV			0x064
+#define QSERDES_V2_TX_PARRATE_REC_DETECT_IDLE_EN	0x068
+#define QSERDES_V2_TX_LANE_MODE_1			0x08c
+#define QSERDES_V2_TX_LANE_MODE_2			0x090
+#define QSERDES_V2_TX_LANE_MODE_3			0x094
+#define QSERDES_V2_TX_RCV_DETECT_LVL_2			0x0a4
+#define QSERDES_V2_TX_TRAN_DRVR_EMP_EN			0x0c0
+#define QSERDES_V2_TX_TX_INTERFACE_MODE			0x0c4
+#define QSERDES_V2_TX_VMODE_CTRL1			0x0f0
+
+/* Only for QMP V2 PHY - RX registers */
+#define QSERDES_V2_RX_UCDR_FO_GAIN			0x008
+#define QSERDES_V2_RX_UCDR_SO_GAIN_HALF			0x00c
+#define QSERDES_V2_RX_UCDR_SO_GAIN			0x014
+#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN_HALF		0x024
+#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN_QUARTER		0x028
+#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN			0x02c
+#define QSERDES_V2_RX_UCDR_FASTLOCK_FO_GAIN		0x030
+#define QSERDES_V2_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
+#define QSERDES_V2_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
+#define QSERDES_V2_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
+#define QSERDES_V2_RX_UCDR_PI_CONTROLS			0x044
+#define QSERDES_V2_RX_RX_TERM_BW			0x07c
+#define QSERDES_V2_RX_VGA_CAL_CNTRL1			0x0bc
+#define QSERDES_V2_RX_VGA_CAL_CNTRL2			0x0c0
+#define QSERDES_V2_RX_RX_EQ_GAIN2_LSB			0x0c8
+#define QSERDES_V2_RX_RX_EQ_GAIN2_MSB			0x0cc
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL1		0x0d0
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d4
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3		0x0d8
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL4		0x0dc
+#define QSERDES_V2_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x0f8
+#define QSERDES_V2_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x0fc
+#define QSERDES_V2_RX_SIGDET_ENABLES			0x100
+#define QSERDES_V2_RX_SIGDET_CNTRL			0x104
+#define QSERDES_V2_RX_SIGDET_LVL			0x108
+#define QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL		0x10c
+#define QSERDES_V2_RX_RX_BAND				0x110
+#define QSERDES_V2_RX_RX_INTERFACE_MODE			0x11c
+#define QSERDES_V2_RX_RX_MODE_00			0x164
+#define QSERDES_V2_RX_RX_MODE_01			0x168
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index f58c82b2dd23e1bda616d67ab7993794b997063b..1a9e4cc5aa11d6e18d97ce93d0e44c9a5afa3fbf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -9,6 +9,9 @@
 #include "phy-qcom-qmp-qserdes-com.h"
 #include "phy-qcom-qmp-qserdes-txrx.h"
 
+#include "phy-qcom-qmp-qserdes-com-v2.h"
+#include "phy-qcom-qmp-qserdes-txrx-v2.h"
+
 #include "phy-qcom-qmp-qserdes-com-v3.h"
 #include "phy-qcom-qmp-qserdes-txrx-v3.h"
 

-- 
2.34.1

