Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC6BBCF12
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 03:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2447C10E3A9;
	Mon,  6 Oct 2025 01:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="a8ixbgV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764B110E144;
 Mon,  6 Oct 2025 01:39:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960ewFr018389;
 Mon, 6 Oct 2025 01:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=jZVWJVP8g3/
 rFOBZJNmTb1y8CiPnFwPyQn6vOUewx/k=; b=a8ixbgV9x5f7qPa+VXd9NgQ/1/C
 USSs1X0IDDcYBp7VaRcKsggJ8WxWoJh1uJfMi0Bvf0mNog+waHIz1mWPvodlfRqZ
 2i+vEcLJrVxyrmcigcOpzVG6xkZpec5RRAVH1gyDTDj8+P5l1cVDNIfppfx2+DJr
 my7T8oTaynAeIrb4V9EMmS5+1Fo+IGy1nZYnEnDFqtOuhYNVc7BufKc+7KbcC8gS
 uSsHzoCJ0otlx/fCZ+3nyQxL7hk2vWMqfpMpyyQ3EevO7VZPCswyXvKJsX2QmgPT
 B8G3VONHvBEnuQO6dinD3rUFZVtJ1CrrbhJIQ+umQjjZb4jJ8NJ01JnGYBA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu2s6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Oct 2025 01:39:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5961dRHp003772; 
 Mon, 6 Oct 2025 01:39:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnkybtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Oct 2025 01:39:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5961dRqe003741;
 Mon, 6 Oct 2025 01:39:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5961dQEw003734
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Oct 2025 01:39:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 48A94599; Mon,  6 Oct 2025 07:09:26 +0530 (+0530)
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
Subject: [PATCH v2 2/7] dt-bindings: msm: dsi-controller-main: document the
 QCS8300 DSI CTRL
Date: Mon,  6 Oct 2025 07:09:19 +0530
Message-Id: <20251006013924.1114833-3-quic_amakhija@quicinc.com>
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
X-Proofpoint-ORIG-GUID: MXIbKfbl5HfSSTudaG4r5wZSKyT7hW4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfXwMtk24JVATzo
 euZLWEto/BxSFsgYVOw0FMAOiABVTcTSAEx77mBfc14tqVUxp2nk9tKJMRunmI3RS8EgSmd5QiC
 Sq3D6YFrxBaehHQ4CJX6K+dIWT8xOjJqFZZEtdrr3jojnLBLR2VCQmoIwIGSOag4z2Y+1eEQ/ef
 8nbuWlAmo0jYfHllfF6ivWARkS5Drd6VzQLsPnkXRTZpU2omoUQMRD9z2FQfe2B1dbfDVHLJf3t
 zfP3o7+EG06sVW2gS6q2N/xDGg4CwVCHmg1QRz7D8Ud5StiH8mCouLUMIYuYAmqK44LdzALqbm/
 YBNV2oXPyt+mKWOWp+FEwB5qKR+3e7o/gPJF5eM45aT9Wf2VF3MyKPunE6c1qoaDnBbP3IBXjRx
 gsAGXE43Wi0vk2lh6CbHSawymNMKTQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e31dd2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=hgtKu1UcES9Oz9EVn1wA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: MXIbKfbl5HfSSTudaG4r5wZSKyT7hW4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 adultscore=0 suspectscore=0
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

Document the DSI CTRL on the QCS8300 Platform.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 .../bindings/display/msm/dsi-controller-main.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..8ae08d3b0200 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -45,6 +45,11 @@ properties:
               - qcom,sm8650-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - enum:
+              - qcom,qcs8300-dsi-ctrl
+          - const: qcom,sa8775p-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
@@ -329,6 +334,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,qcs8300-dsi-ctrl
               - qcom,sa8775p-dsi-ctrl
               - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
-- 
2.34.1

