Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E0EA0B088
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CBA10E421;
	Mon, 13 Jan 2025 08:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="oLsWgOq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D4B10E421;
 Mon, 13 Jan 2025 08:06:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D4WWNI007710;
 Mon, 13 Jan 2025 08:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 444nZ169tZ+Tedf8qd/ScLfsd4haVXiFaAKNEXWkQHg=; b=oLsWgOq5K1sntkDv
 MN27o6pWjcv6oSC+PbRXHOnWBKdUO1CEZq6iffYmfHIXgzHI5lHJEN/Dfd9FHS/p
 rjF6OXTqdBzkIeyyn4uRpdpbusZvAdXaGONLT5hfRFVoce6nHXb+p5Zl9ugRZKfF
 DlP+ooxZUaX1zfkF5yYAgJaG/dHV37dQmfAqOobXKKJulU+CY1JAcbelCYEqzOaQ
 zDk/BH3QSbPiyPNejUBQBYb7MSvZd5VfmWrOdXldVaGqpptnWW1YHoNGO2hkT+J6
 i9aoctqBHEsDRBImqsQAoRlMN6Y/bQpAAjg7xU2zOMLoyE5eKCM7jOWvnj1FaJYH
 whNeXg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444uw6gdv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 08:05:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D85tPj007776
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 08:05:55 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 00:05:48 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 13 Jan 2025 16:03:09 +0800
Subject: [PATCH v3 2/4] dt-bindings: display: msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-mdssdt_qcs8300-v3-2-6c8e93459600@quicinc.com>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
In-Reply-To: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
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
 <linux-phy@lists.infradead.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736755530; l=1145;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=WMZvY5lJhEJd/KRjqE5MHTAkIV+gcfxlVveIF0j+GGI=;
 b=SsJsZggmYWvXh6y012ygM54qdyw75gBex3dHPqyqAOmwJvibfuxzxZDV0ZeRjorQj8c3Ce6VS
 Rb6Q0ab2wYkBxRxMbQ0FI8BEM7G2EY8tGwNSpLA0pi1ojc0gagMoM6R
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6ztsWXmQkNb-zYjcUWeGYBnNFz4-YwGw
X-Proofpoint-ORIG-GUID: 6ztsWXmQkNb-zYjcUWeGYBnNFz4-YwGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130068
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

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 platform.QCS8300 only support one DisplayPort
controller and have the same base offset with sm8650, so we reuse
the sm8650 DisplayPort driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..3df6f9e278275d8e19fafb4a397d776e0c606c7c 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -37,6 +37,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,qcs8300-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.34.1

