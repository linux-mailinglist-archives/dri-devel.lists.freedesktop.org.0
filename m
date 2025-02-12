Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C91A31FB9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 08:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492BB10E7D3;
	Wed, 12 Feb 2025 07:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EgCb+7uG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EBE10E7C8;
 Wed, 12 Feb 2025 07:15:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C5xCN4006113;
 Wed, 12 Feb 2025 07:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 22LPV32tFRSPNvTVkyVUSsvfBCHZ0Gz9jWXuDADGHK8=; b=EgCb+7uGncOfRDK4
 jTrRUrSCR9WKA1k+QBJN9twqUmYmw/PooXFD0ZREkcuyGNJMzQBjGx4hNu0Tz0Dg
 X4H1iBqHiN+thbYU6wNx6rlGxDxqWzVGaGdunX7gipqz3StA7AVZMTn5hBK5MekP
 cGkC/7ostWn0k7cFZ2MXIeHoEz94T5dKCNHTYIRTNWUdV+EqtW8blVGRrUzWMVdp
 eNRwzhb7OeT7IoX1vLHReDVuGipjes4T4Fw+dy2BFv7UuZ0pR9jzm3SOMWPw0/G+
 qwsvyXDe190QHT8Ia1JM5EJxudxkBs9Q3Y8sBa2d8NMZfluglCX8kPZ8/NcHqiAX
 GOAssw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mxmtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2025 07:15:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C7FlHP032521
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2025 07:15:47 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 23:15:41 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 12 Feb 2025 15:12:24 +0800
Subject: [PATCH 1/4] dt-bindings: display/msm: Redocument the dp-controller
 for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
In-Reply-To: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739344531; l=1318;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=oZwn6CQcPkfn2HChYyQw5Jok2/iQojiyJ+cd40C1/5c=;
 b=xNQurVyXTxc5lSjSCACTsIXgtyY4UvyhOB6BgOIgC9c0WkZtShZXe0qusuIJ62JY1htQkCduM
 P924mS3PqSJBNvfqffuasEyGGBZ3kTLl7P0/VUgIXzX82dEqkXwdDrg
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _BtGSiwRmso42GRshz2ARUljJ28jUp9s
X-Proofpoint-ORIG-GUID: _BtGSiwRmso42GRshz2ARUljJ28jUp9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120055
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

We need to enable mst for qcs8300, dp0 controller will support 2 streams
output. So not reuse sm8650 dp controller driver and will add a new driver
patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
to compatible with the qcs8300-dp.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 359e364d79b20469d41cd8416a55b6a5d5c7d8ce..59075d7f05147f1f477f236a76fee6ec5d8c5ad8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,qcs8300-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -37,10 +38,6 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
-      - items:
-          - enum:
-              - qcom,qcs8300-dp
-          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.34.1

