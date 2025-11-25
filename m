Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CEFC83046
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 02:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720F110E346;
	Tue, 25 Nov 2025 01:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="p4Z+MTB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5C010E284;
 Tue, 25 Nov 2025 01:33:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOJtGsq1303817; Tue, 25 Nov 2025 01:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=uDEnS/e+WYs
 bOeduKdXwIHpQW7q/NmgcHOM5oRsJ1rE=; b=p4Z+MTB4HOqSqLhF1ce6fxd1VJZ
 69pjZPp5gYfYCuxy1GqF9A9c/aCJrUXSwPcfncfHMr1BgHbYtruR81aoHcmq/UPO
 5c2vyigXlU5hbM21+y5y3DItmG/R87FElty8VuZGYPiCRCE+Gm5DTXrmaB3lDf4P
 7iJH0y5hKEC1uOvbY0FJ6al1f3wHzOIxasnoZ8ww0663ktgleUDu3g4KOdGi/uxc
 8QsUzGJ6iTmPkq1PIlmRUAFIk/zBW6EQTJsEhDvKU+c2jWXPRJUQ0IwucZFLu4Pu
 w3xgM4pDGcgT/V/movdMFyFxUXrm7kdJrDS95FvUQ+ziWejqd8K9N4jJ0JA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8s9u04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Nov 2025 01:33:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP1X6P1027344; 
 Tue, 25 Nov 2025 01:33:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68mvfg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Nov 2025 01:33:06 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AP1X5Df027318;
 Tue, 25 Nov 2025 01:33:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AP1X544027313
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Nov 2025 01:33:05 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id A57F45A1; Tue, 25 Nov 2025 07:03:04 +0530 (+0530)
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
Subject: [PATCH v3 2/5] dt-bindings: msm: dsi-controller-main: document the
 QCS8300 DSI CTRL
Date: Tue, 25 Nov 2025 07:02:59 +0530
Message-Id: <20251125013302.3835909-3-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: e2_n0eahUPum5mClu78aw1BKoUGp4nAu
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=69250755 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=RSSfEFUnwc2unTRNCpgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAxMSBTYWx0ZWRfX88XuVSby1pN3
 nMDy/0wY59B2YF8kkwP8j88V5O5c3oS9AhVcwvtIjXrXxftnTQvN9VRDFht7EcqM5+56ipzPSmE
 GbxnNLxTn46aAVeAxDGguauzwKl2OcRUzNlVExTQykzBdNde3xfZUNaiI2yUPQwGJauemqhF0RD
 7annhJYg3/KUXi1JhinbnqwtxjmQJ1xUFdhXwEBAFJYAZdVFRwoOwYoKe19tKaCxCn8iRgYz8XQ
 fnBFmKBYIv3sLLCajrsigRqQJ6pYhZBbVmsQ6WEGfl02ZrmqjKO0lNH2p4TeXbE++Ju93XtdaJ/
 k+lDvrvNT+wQIzS7E9HTiQ8wPKUkIrAXSWtjXWYFjoiW1xYeVpiwwlM3E1V4e2jnJp936N71kHp
 ziMhsT5V3hSijqtdOrMCZEbw7Ya6Fw==
X-Proofpoint-GUID: e2_n0eahUPum5mClu78aw1BKoUGp4nAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250011
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
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..6276350e582f 100644
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
-- 
2.34.1

