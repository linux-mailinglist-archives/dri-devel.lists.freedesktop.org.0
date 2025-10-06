Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E73BBCF32
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 03:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B2C10E3B2;
	Mon,  6 Oct 2025 01:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pLCnz8Qg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B7310E306;
 Mon,  6 Oct 2025 01:39:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961VHDq009872;
 Mon, 6 Oct 2025 01:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=7GcIhqa553o
 mhiuOGSm46VDvLsLp5sH2+vBnZdVzvnE=; b=pLCnz8QgSfCOty7iFFSGNRrEsfe
 dJGgAn7DQVpZ3mKISl2CpuJYAPReHGj4rcSQHxFSnrdWCiiMHE8Lo1KPYYl9G1lG
 S2eBHy3taczpCAPkNge2E+5tWQ6ZkGRQAlRIFlhXQ7j94IrFjEFqPDcnMWUV6edB
 +kKqh5LbvyBHGDAOwiEXf2fE048TQ9ovEl2lhKvd58FFBNW0/PWLlLi/Jj4Kytbg
 DxJ8uJLIajX3rjPJvloswglveTCgIFP6FfA7DP72BNjpTW1Xwv8ZVU4jZ1KALeEG
 9ZPTZhUYU/MfjJ10gr8QRd8sS1ul+JPPWSYEhV1XXIDOYWm2grWRiv+weoA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu2s70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Oct 2025 01:39:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5961dRHq003772; 
 Mon, 6 Oct 2025 01:39:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnkybtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Oct 2025 01:39:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5961dRtt003738;
 Mon, 6 Oct 2025 01:39:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5961dSbN003790
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Oct 2025 01:39:28 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 5787C59E; Mon,  6 Oct 2025 07:09:26 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: [PATCH v2 5/7] drm/msm/dsi: add DSI support for QCS8300
Date: Mon,  6 Oct 2025 07:09:22 +0530
Message-Id: <20251006013924.1114833-6-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PImj46BdAPpzGjJqdexAHCCnTdgdAmq2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX7ZJAFMIGytmj
 Xh3dUR4chHz7KF3Z4z1Z9sTjBFy5MvmtvdLW+P/7ZsOP7eOSny0xBGbB/iTZBrDiXrdDeyUbIKx
 jb2QkmQ9OpNNrtUnyUFaUPP7zrYuMXZyXG0PWFGFkNFdot0OAii8iGnjtSJAmt9pH1u1H+kFney
 oSTK30D6MgXUMcbh49GnCG6kkn5BDydt36hpOg3qlh+QMrOlxk59jwI0ivbypd6NlgULbRtItz+
 qrpCLbTQXbPnkB0pGKXULK1WHwCcRtVw2sE1Kmv7O6o1psWVlJXSct844M2EufwA2YMyMG2Iqzn
 zo7gVfYpRXPRscaWEUg8/57n4tbZuBMv4rqsWs8bV7Yx3QnBKboV0Gx9X/Zm1hU4MpDlg8u1U+x
 vOq892G4IIXDLRV7anPv0GXD6U/Epg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e31dd5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=A-KxhFXCQp9C2J9DxaUA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: PImj46BdAPpzGjJqdexAHCCnTdgdAmq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
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

Add DSI Controller v2.5.1 support for QCS8300 SoC.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index fed8e9b67011..b60384ea0b32 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -226,6 +226,17 @@ static const struct regulator_bulk_data sa8775p_dsi_regulators[] = {
 	{ .supply = "refgen" },
 };
 
+static const struct msm_dsi_config qcs8300_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sa8775p_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sa8775p_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0xae94000},
+	},
+};
+
 static const struct msm_dsi_config sa8775p_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.regulator_data = sa8775p_dsi_regulators,
@@ -322,6 +333,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_1,
+		&qcs8300_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_1,
 		&sa8775p_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
-- 
2.34.1

