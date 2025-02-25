Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51702A43F2C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 13:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0D610E662;
	Tue, 25 Feb 2025 12:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GEGVWtT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD6B10E66D;
 Tue, 25 Feb 2025 12:18:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8JkDD009201;
 Tue, 25 Feb 2025 12:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IfzISr8K6Us
 XEGe5sMBjBTugozgeTpx/4r4CZFzts9M=; b=GEGVWtT3uBUfC/tStv6ECeKginj
 dQ7eqWFs6YfqzRQdHsmzSseeJK5DRMALG8lYQy7BC+y6g8nWQGs8mF0f8JEZkL4E
 M6nL9NjyoLUIDJt0RpHPaCmvBpY/TBQqonx3ZkwNVW8xaIo3uENea6wNsJmQlHQC
 TZpsqEbCT8njKWH/65nCExTzCiHVV/QP+RF7Zks/m+uilnkM+q1HY439yDxxr73W
 F2u55Z0FMFd4DrzARipTA10gU1UlVI3MwluWUrwjhkn/ZHpwnC1zxBflVKSpcOnU
 /1v7LvXkQrZB0C2d3RlumWWhbbdYjWfRD2tRoRCQKtYHg70IyH7/UMhn+pQ==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6y6rt37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 12:18:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCIX8s004487; 
 Tue, 25 Feb 2025 12:18:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44y7nkx1y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 12:18:34 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51PCIXVD004460;
 Tue, 25 Feb 2025 12:18:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 51PCIYP5004503
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 12:18:34 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id B16DE590; Tue, 25 Feb 2025 17:48:32 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: [PATCH 10/11] drm/bridge: anx7625: update bridge_ops and sink detect
 logic
Date: Tue, 25 Feb 2025 17:48:23 +0530
Message-Id: <20250225121824.3869719-11-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: a79Ctre3nMEc0WZyqt6lqSJu5fwJzXsj
X-Proofpoint-GUID: a79Ctre3nMEc0WZyqt6lqSJu5fwJzXsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250086
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

The anx7625_link_bridge() checks if a device is a not a panel
bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
the bridge operations. However, on port 1 of the anx7625
bridge, any device added is always treated as a panel
bridge, preventing connector_detect function from being
called. To resolve this, instead of just checking if it is a
panel bridge, we should verify the type of panel bridge
whether it is a DisplayPort or eDP panel. If the panel
bridge is of the DisplayPort type, we should add
DRM_BRIDGE_OP_HPD or DRM_BRIDGE_OP_DETECT to the bridge
operations.

In the anx7625_sink_detect(), the device is checked to see
if it is a panel bridge, and it always sends a "connected"
status to the connector. When adding the DP port on port 1 of the
anx7625, it incorrectly treats it as a panel bridge and sends an
always "connected" status. Instead of checking the status on the
panel bridge, it's better to check the hpd_status for connectors
like DisplayPort. This way, it verifies the hpd_status variable
before sending the status to the connector.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index d2655bf46842..9b6303267924 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
 
-	if (ctx->pdata.panel_bridge)
-		return connector_status_connected;
-
 	return ctx->hpd_status ? connector_status_connected :
 				     connector_status_disconnected;
 }
@@ -2596,9 +2593,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
 	platform->bridge.of_node = dev->of_node;
 	if (!anx7625_of_panel_on_aux_bus(dev))
 		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
-	if (!platform->pdata.panel_bridge)
-		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
-					DRM_BRIDGE_OP_DETECT;
+	if (!platform->pdata.panel_bridge ||
+	    platform->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {
+		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
+	}
 	platform->bridge.type = platform->pdata.panel_bridge ?
 				    DRM_MODE_CONNECTOR_eDP :
 				    DRM_MODE_CONNECTOR_DisplayPort;
-- 
2.34.1

