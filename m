Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AD39DA3AC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 09:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD34B10EA1C;
	Wed, 27 Nov 2024 08:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ckvgpxgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6018710EA18;
 Wed, 27 Nov 2024 08:18:36 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQLCn3e006440;
 Wed, 27 Nov 2024 08:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QoWMbD4vIthzT9w5rmXePUV59yIJWQ8nU83UzHCc+ms=; b=ckvgpxgVq7jdwDoK
 AWzjKGaPXjs2ojSxgJKyyn7yv8fqxGPxwUS97h7Fo+yYDDJibpiUKCfybxpZx9dn
 hEVkM1FAXVfQl4V+s/ySETXiCUQtueytSja0CBOvtjgC+wrLPqYkiapCQEcLVXIz
 6sCVlWblvWBTI5x2g4YfmXvrIO1Ip+ToIhEeRu8ELrWfZkJFc6IC1PRiaTwWyhr+
 oVBSemPYlGK6FALM7jJDOiOaR5p1A3IN7ClKGnk8FfmkgxJ3XGOiiRGKCMDbj1T+
 3NbscGGCYleBoM3ycFvOI6JMlV4o2OKwd96PcufXcSBKfNyCwDZdArz2L0iRc9Kv
 7vIbgw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435p22sgs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 08:18:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR8IQWw025522
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 08:18:26 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 00:18:20 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 27 Nov 2024 16:15:48 +0800
Subject: [PATCH 1/4] dt-bindings: phy: Add eDP PHY compatible for qcs8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241127-qcs8300_dp-v1-1-0d30065c8c58@quicinc.com>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
In-Reply-To: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>, Ritesh Kumar
 <quic_riteshk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732695490; l=795;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=NUpknD97phYJXI3s1k4ECLerSEHHdgKAY3OmcryDRlw=;
 b=HN5Ugr/nD6EHZxZObr9n44Zq948nM9VVyJ9NFO/0JvldG2vbixGzIWPSziy060CfL3KPgCNJQ
 bCvJnZS0GvWARUQK9+CnRUxA7QujmuX96WkxaWJjOVdgwnCo1iAiuKx
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9FNn-Fit4SQjinHeT8PEHVqDvMzbUiYs
X-Proofpoint-GUID: 9FNn-Fit4SQjinHeT8PEHVqDvMzbUiYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270066
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

Add compatible string for the supported eDP PHY on qcs8300 platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 293fb6a9b1c330438bceba15226c91e392c840fb..e249aee9b11d58b8f2a9c8708285e0f2510bafc7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-edp-phy
       - qcom,sa8775p-edp-phy
       - qcom,sc7280-edp-phy
       - qcom,sc8180x-edp-phy

-- 
2.34.1

