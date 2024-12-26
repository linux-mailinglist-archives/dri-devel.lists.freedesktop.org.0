Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1AB9FCA08
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 10:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D31610E810;
	Thu, 26 Dec 2024 09:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aTWf0PzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4979E10E505;
 Thu, 26 Dec 2024 09:43:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ8BXrf025840;
 Thu, 26 Dec 2024 09:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C3UcchA55R2cVoUoHB7JTT9aM3N1LbRGktnjYrUF7ho=; b=aTWf0PzPiPFO5kwY
 gtgodl8jjf39equAIzhxAV6q95HdtKVgO6Wf2VRAIffAhPv+qQdGij/sK8EFT/X6
 E2AhxNOyAmH3Ge6JPa1Q7ETS+kErGgoZt2gtSlKnlJ0f8jvyRupa895tTzU58lcY
 /ZNjcCRGnQl9xthf+Z7xxrqDrSWj+MA89ZR9ouC1ZZOhnYdCs1DJ/OVtooOg32ni
 CnNgD/z2wYaZXo/iWfVoLsEKJaX2NAnEmfdeSwloCDz/+agELInJibSwg4bTj91d
 kcA7sTBJgCjEp7zj+tl6u8hTE33H8hKRpPMdInsNpWjvCX+F/ivugUXEiqrzJm4K
 sgn+3g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s3dv0sm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 09:43:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ9hYil004279
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 09:43:34 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 01:43:28 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Thu, 26 Dec 2024 17:40:48 +0800
Subject: [PATCH v2 4/5] dt-bindings: phy: Add eDP PHY compatible for
 QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
In-Reply-To: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
CC: Yongxing Mou <quic_yongmou@quicinc.com>, <linux-arm-msm@vger.kernel.org>, 
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735206182; l=1325;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=EsAPMgEnpNM/m+Ezxlp3qYNwa8zsQ0j5gmZdoSn3zdc=;
 b=sDjFcOQJRGmj+sh3vbAr3MP7NOMoN3iHXQUpRMIVaWPFv0bCXhye1rq4T6w/0MOQi/mThS/IB
 5z/ThiWx6XeBUfqpZKdI30gB5GL36e1k1jdZVv34hkRq1TvaFVqrNmU
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jtEjwVjzwUC0aZTu7A-TOHOZSC3hJWkE
X-Proofpoint-GUID: jtEjwVjzwUC0aZTu7A-TOHOZSC3hJWkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260085
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

Add compatible string for the supported eDP PHY on QCS8300 platform.
QCS8300 have the same eDP PHY with SA8775P.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 .../devicetree/bindings/phy/qcom,edp-phy.yaml         | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 293fb6a9b1c330438bceba15226c91e392c840fb..eb97181cbb9579893b4ee26a39c3559ad87b2fba 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -16,13 +16,18 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-edp-phy
-      - qcom,sc7280-edp-phy
-      - qcom,sc8180x-edp-phy
-      - qcom,sc8280xp-dp-phy
-      - qcom,sc8280xp-edp-phy
-      - qcom,x1e80100-dp-phy
+    oneOf:
+      - enum:
+          - qcom,sa8775p-edp-phy
+          - qcom,sc7280-edp-phy
+          - qcom,sc8180x-edp-phy
+          - qcom,sc8280xp-dp-phy
+          - qcom,sc8280xp-edp-phy
+          - qcom,x1e80100-dp-phy
+      - items:
+          - enum:
+              - qcom,qcs8300-edp-phy
+          - const: qcom,sa8775p-edp-phy
 
   reg:
     items:

-- 
2.34.1

