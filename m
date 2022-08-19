Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A90D859A296
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 18:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B741410F08D;
	Fri, 19 Aug 2022 16:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814C210EFAB;
 Fri, 19 Aug 2022 16:41:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JDu6xa001366;
 Fri, 19 Aug 2022 16:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=hjSQzhi4GqzeASvTjUG5Z2rNtdg36HJX0JFu1HXUIcs=;
 b=SltAzaHPbwlfj/zOYpx8dmP3TUpvylB1UQzJ2wKVWZfeajss+ym7F2P7NOPib42z+KE2
 gE818Hacwd+aJoWbgXmkGDaie+WmjOPedptBnZBqj/K7dhB7iP7stLAo7YC6D3DtOeQF
 zQ0wzoicH62fKABI6tLN5h9cMiVgiZwNncogoBdRZskm9fhqztTjMbZA/ALBdpeEwR7E
 mxrx0nOTR4rjwf2lPu1AFG7MvCa+FAFuwyJ7LfDxA0yXOLBTQWYGJL9FTBfRidARzACe
 X279sF55kJ8cUh/3mRFzSdNZVJfgZ8Kh+toC6N+rTl0Kz4eTyu44/I57grR/xwdW76no 3g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j2bu7ghb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 16:41:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27JGfbbT030584
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 16:41:37 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 19 Aug 2022 09:41:31 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 5/6] dt-bindings: drm/msm/gpu: Add optional resets
Date: Fri, 19 Aug 2022 22:10:44 +0530
Message-ID: <20220819221017.v4.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: v7MVUo7TrPB6b1vbb9jQb6xe1XOnwash
X-Proofpoint-GUID: v7MVUo7TrPB6b1vbb9jQb6xe1XOnwash
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_08,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190060
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 krzysztof.kozlowski@linaro.org, Rob Herring <robh+dt@kernel.org>, Sean
 Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an optional reference to GPUCC reset which can be used to ensure cx
gdsc collapse during gpu recovery.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

Changes in v4:
- New patch in v4

 Documentation/devicetree/bindings/display/msm/gpu.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3397bc3..4576b31 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -109,6 +109,13 @@ properties:
       For GMU attached devices a phandle to the GMU device that will
       control the power for the GPU.
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: cx_collapse
+
 
 required:
   - compatible
-- 
2.7.4

