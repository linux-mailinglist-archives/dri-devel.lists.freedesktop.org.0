Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC996463C7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 23:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C84A10E42D;
	Wed,  7 Dec 2022 22:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777D110E421;
 Wed,  7 Dec 2022 22:00:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7Lpha7017071; Wed, 7 Dec 2022 22:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=lFKgCEY+m8s6V7qWWdDw4MkZtqXPkhjxhPX3jmjPHxA=;
 b=jESumicXMahaRkfs1HGrTbVQSWzmqeTO7lHVBjjWnsJlbNojqNIiksoMPcxWmM4z5RCz
 1/EOCu7BVTM2yt54jtWJe2+6W13u1ob8ODMo6+s+I3OZKj3WXDxWNVpVXCv0vBcRPbi+
 36xsk6a2K9pF4zCkLrkScvzWk+PI7AmyNffiabYMJVFKqeJ/AruKajCdboudVOhbzFg1
 +LFGZ9cskUKV6lqsGhRiQnOTSSiharcXJqJCzw6M3piTNJDIM+dfWO65VPbTtG5gwU3f
 kosW/J6AXx5DH+fIV9oAdfhbuWPrfp4o/ejaQ6ZRrFqdSJFhRXxU5EJDr3SpGs3S1c4H SQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3maj5w28jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 22:00:22 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B7M0LQo008756
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 7 Dec 2022 22:00:21 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 7 Dec 2022 14:00:20 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 04/12] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Date: Wed, 7 Dec 2022 14:00:04 -0800
Message-ID: <20221207220012.16529-5-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207220012.16529-1-quic_bjorande@quicinc.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wafWAs-j83RK4JAig5FODOt_mrZJCvdC
X-Proofpoint-ORIG-GUID: wafWAs-j83RK4JAig5FODOt_mrZJCvdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_11,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=957
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212070186
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
Qualcomm SDM845 and SC8280XP platforms.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes since v4:
- None

 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index f2515af8256f..a1dc3a13e1cf 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -21,6 +21,9 @@ properties:
       - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
+      - qcom,sc8280xp-dp
+      - qcom,sc8280xp-edp
+      - qcom,sdm845-dp
       - qcom,sm8350-dp
 
   reg:
-- 
2.37.3

