Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6729D643923
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 00:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8261E10E2BD;
	Mon,  5 Dec 2022 23:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869C210E2B8;
 Mon,  5 Dec 2022 23:08:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B5Kw4qm000862; Mon, 5 Dec 2022 23:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=s6QtGoY7dRmvBrGfrP5X8ls29l5dhfxu/M9+zw3/pjA=;
 b=O4IBYBinSPnbMs1nm1+ODFfLBB1S54m0+0uP2ksXy4jdv810d871RsZ/lXyjLH5bqWih
 cZyG2BGNBYtL53DV5PMqt73n3UlhLAJWwcLcH77noY7tBds4fuOX4lQrjXA6CFSL3up6
 /EMy8shxwzqFzddT0BltAsYDZxz3kOdMTIEA/fM//kGsZDY5m0yAWT5e/uXuta8AAHWk
 TQPCO0WPLId56a7iRPruuVxaAN1nPMR09ewCjiGgQy9Zs41pMN/4Wf44p+K20I7cWCzy
 i0yPW1KWKbAqgg7Af4A8ovdiKr8Ss/ySFuh69TRaGQAtAhX41TjNr5kfM6DFzYPO/PfS fQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m9eev1tkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 23:08:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5N8SfN017998
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Dec 2022 23:08:28 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 15:08:28 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <andersson@kernel.org>, <konrad.dybcio@somainline.org>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <devicetree@vger.kernel.org>, <airlied@gmail.com>
Subject: [PATCH v9 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Date: Mon, 5 Dec 2022 15:08:11 -0800
Message-ID: <1670281694-13281-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1670281694-13281-1-git-send-email-quic_khsieh@quicinc.com>
References: <1670281694-13281-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2JNl65vJagEq0X3OLwq2evzFuPmuc3L1
X-Proofpoint-GUID: 2JNl65vJagEq0X3OLwq2evzFuPmuc3L1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212050191
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add both data-lanes and link-frequencies property into endpoint

Changes in v7:
-- split yaml out of dtsi patch
-- link-frequencies from link rate to symbol rate
-- deprecation of old data-lanes property

Changes in v8:
-- correct Bjorn mail address to kernel.org

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index f2515af..38ce17d 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -81,6 +81,7 @@ properties:
 
   data-lanes:
     $ref: /schemas/types.yaml#/definitions/uint32-array
+    deprecated: true
     minItems: 1
     maxItems: 4
     items:
@@ -104,6 +105,11 @@ properties:
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Output endpoint of the controller
+          data-lanes:
+          $ref: /schemas/types.yaml#/definitions/uint32-array
+
+          link-frequencies:
+          $ref: /schemas/types.yaml#/definitions/uint64-array
 
 required:
   - compatible
@@ -193,6 +199,9 @@ examples:
                 reg = <1>;
                 endpoint {
                     remote-endpoint = <&typec>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <1620000000 2700000000
+                                                  5400000000 8100000000>;
                 };
             };
         };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

