Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC6CDDE39
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 16:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240B412B903;
	Thu, 25 Dec 2025 15:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EddxnQMp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629BB12B8BF;
 Thu, 25 Dec 2025 15:21:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BPESHRM2886883; Thu, 25 Dec 2025 15:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=m4RM23bCMlg
 +qy0oUU09q1zF6YaxYkSDO5wnldZbYio=; b=EddxnQMpuWrj01zN3d1K/iuTWwn
 in1VGITfKU3Pzd59H4qRd4GGO6Loy0ndmoO+1s7cNszvv7ICtUaI8Y8CoqHA3puy
 UpS5LwCaYCRr3uCrMgems7vi2EUe2dy2yq5VkmJ0PVd58hhYEvb3lzV3T0b2aljP
 Y82jUduOM6nPeY6SMFGEJMniDHqyFoluoeUiXPQ8sguvYvNw4QRNa/KCEZrWyJT9
 Ux0YORbLeQorNNqumxAf7hev4GMrcc0ZdNxBVSh+p9X5wRULzVG7oxJTgoAgBEHw
 LKrkj9lkkuzfOdhhG5tY0J2CZWCyttUEo1brxfi3IPQ/nUYx1FLSoYsRwKA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xvc8uep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Dec 2025 15:21:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BPFLbdT006282; 
 Thu, 25 Dec 2025 15:21:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvn0fw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Dec 2025 15:21:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BPFLaIu006258;
 Thu, 25 Dec 2025 15:21:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BPFLaW0006249
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Dec 2025 15:21:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 83F4D3DA; Thu, 25 Dec 2025 20:51:35 +0530 (+0530)
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
Subject: [PATCH v4 1/5] dt-bindings: display: msm-dsi-phy-7nm: document the
 QCS8300 DSI PHY
Date: Thu, 25 Dec 2025 20:51:30 +0530
Message-Id: <20251225152134.2577701-2-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: R0JFEg3MGzW2vLJzhHx2t7dRGq1FjN_r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDE0NyBTYWx0ZWRfX1Va+71qfrlvl
 0k17RALqZtsRCZGvPNlBhN4ZeLPObWjv96g6gYyUpv8WyNG4s3szlQweFXMLRP+Une9g8ZEbu4n
 7uG/f7Cx/VkGHVDRtqxd5WgQF+fQodhH+jjyUtPLG/Du/BFX8COyDxtVJfaWUMAx3Z1w25VZPNX
 08erTAw2q2ek3+pUkbxzNj0y+uf0da6g7zcZNVE2emFoaXwgc0lhT8PFHs8+tE3Ixonr0z7sPOx
 n0idgGna6jjXVQOnDI/PwejD/6pHZyL0jye5evSHJ16UhFAdeRQrnUFuZRqPwkKf3vmEYFlGWFs
 hnEZst13GtqimN1P3zSKheQ6gfroJRyqvxnKhrRdchfP+bLHhXIkEW66qq9JOY8BMpH0N5z40no
 q8uuxvOEzqOwkDIlaXYARyvq0akcEM1xV6nn7Yrhn16VnrC3FsBb1X4jtnSVxI5Va4AOWOA0Mup
 fQlCRzw5ccxkpzlPXoQ==
X-Proofpoint-ORIG-GUID: R0JFEg3MGzW2vLJzhHx2t7dRGq1FjN_r
X-Authority-Analysis: v=2.4 cv=M4xA6iws c=1 sm=1 tr=0 ts=694d5684 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=p7RHMHzGFj1_hX8PGksA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-25_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512250147
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

The QCS8300 MDSS DSI PHY is the same 5nm PHY IP as on SA8775P, with
identical register layout and programming model. Model this by using
a QCS8300 specific compatible with a qcom,sa8775p-dsi-phy-5nm fallback,
and update the schema to require this two entry form for QCS8300 while
keeping existing single compatible users valid.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 .../bindings/display/msm/dsi-phy-7nm.yaml     | 30 +++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 1ca820a500b7..7a83387502da 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -14,18 +14,24 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,dsi-phy-7nm
-      - qcom,dsi-phy-7nm-8150
-      - qcom,sa8775p-dsi-phy-5nm
-      - qcom,sar2130p-dsi-phy-5nm
-      - qcom,sc7280-dsi-phy-7nm
-      - qcom,sm6375-dsi-phy-7nm
-      - qcom,sm8350-dsi-phy-5nm
-      - qcom,sm8450-dsi-phy-5nm
-      - qcom,sm8550-dsi-phy-4nm
-      - qcom,sm8650-dsi-phy-4nm
-      - qcom,sm8750-dsi-phy-3nm
+    oneOf:
+      - items:
+          - enum:
+              - qcom,dsi-phy-7nm
+              - qcom,dsi-phy-7nm-8150
+              - qcom,sa8775p-dsi-phy-5nm
+              - qcom,sar2130p-dsi-phy-5nm
+              - qcom,sc7280-dsi-phy-7nm
+              - qcom,sm6375-dsi-phy-7nm
+              - qcom,sm8350-dsi-phy-5nm
+              - qcom,sm8450-dsi-phy-5nm
+              - qcom,sm8550-dsi-phy-4nm
+              - qcom,sm8650-dsi-phy-4nm
+              - qcom,sm8750-dsi-phy-3nm
+      - items:
+          - enum:
+              - qcom,qcs8300-dsi-phy-5nm
+          - const: qcom,sa8775p-dsi-phy-5nm
 
   reg:
     items:
-- 
2.34.1

