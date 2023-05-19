Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4769670A17C
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 23:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DCC10E610;
	Fri, 19 May 2023 21:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3341C10E61A;
 Fri, 19 May 2023 21:17:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34JL3gQn028260; Fri, 19 May 2023 21:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=T7Cxn8pulCRr49HOL1tqrB6Ta1WMBLDIfJgFS8ufVaY=;
 b=WPcrkgDnzTZj8UpnnizZnHPq3pBXc8X8fAa11QtGgIaomjYLDsbfdK9aPx/l/z8Jsc53
 dcLlU344CUJa+/gl3idCkWVFpCwM8nk3ImgmDdWx2SUJeMtytbDO1vODq+HQrIoYkHTL
 QpQEeC1AlxZuaHicC4Fe+ziLXfaVUmKw3T+dRR23y33U/lFkewj66Os8H+BYy9ce6/hG
 +D8V9reNbm9VfTJd8UZTHgotBqKO+Laf5txB22XQN9fDkqhvjRR1G1LD8QJEBkDQ2K/h
 3gtKHZfBjLeYwQeBnF3dAn9lZ/TKJ3uBRSSAgvczE3ndUTed8qMqPbgfS9eYUWxpdNwT mQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qp0ketcr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 21:17:38 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JLHbAC012365
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 21:17:37 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 19 May 2023 14:17:37 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 19 May 2023 14:17:30 -0700
Subject: [PATCH v3 5/5] drm/msm/dsi: Remove incorrect references to slice_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230405-add-dsc-support-v3-5-6e1d35a206b3@quicinc.com>
References: <20230405-add-dsc-support-v3-0-6e1d35a206b3@quicinc.com>
In-Reply-To: <20230405-add-dsc-support-v3-0-6e1d35a206b3@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684531055; l=2721;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=laSBhXzpSSVKs2/He1swhrMZNjZ6RRfXUIuZqCnKAXA=;
 b=vVehQatJntgYkNOFnVZLJ0ItCIimSJB5Qe4rziMLWKCM3tap3exN7pjnSf5THtRk3ecfgN5Yh
 ryRGoUF4borAETExNKWfw+dh8XmgjiTIqqclupn/3JGUF/b5No6aK7O
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: raAdEw5RuWCXshbwLhJZ_7p6ijPs0ucs
X-Proofpoint-ORIG-GUID: raAdEw5RuWCXshbwLhJZ_7p6ijPs0ucs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_16,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190184
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, slice_count is being used to calculate word count and
pkt_per_line. In downstream, these values are calculated using slice per
packet, which is not the same as slice_count.

Slice count represents the number of soft slices per interface, and its
value will not always match that of slice per packet. For example, it is
possible to have cases where there are multiple soft slices per interface
but the panel specifies only one slice per packet.

Thus, use the default value of one slice per packet and remove slice_count
from the aforementioned calculations.

Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to compute word count")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d04f8bbd707d..8c8858ee59ec 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -866,18 +866,15 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	 */
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
-	/*
-	 * If slice_count is greater than slice_per_intf
-	 * then default to 1. This can happen during partial
-	 * update.
-	 */
-	if (dsc->slice_count > slice_per_intf)
-		dsc->slice_count = 1;
-
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
 
 	eol_byte_num = total_bytes_per_intf % 3;
-	pkt_per_line = slice_per_intf / dsc->slice_count;
+
+	/*
+	 * Default to 1 slice_per_pkt, so pkt_per_line will be equal to
+	 * slice per intf.
+	 */
+	pkt_per_line = slice_per_intf;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -1001,7 +998,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (!msm_host->dsc)
 			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
 		else
-			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc->slice_count + 1;
+			/*
+			 * When DSC is enabled, WC = slice_chunk_size * slice_per_packet + 1.
+			 * Currently, the driver only supports default value of slice_per_packet = 1
+			 *
+			 * TODO: Expand mipi_dsi_device struct to hold slice_per_packet info
+			 *       and adjust DSC math to account for slice_per_packet.
+			 */
+			wc = msm_host->dsc->slice_chunk_size + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |

-- 
2.40.1

