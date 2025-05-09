Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA53AB0B86
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 09:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8A510E9C0;
	Fri,  9 May 2025 07:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KPEfb/5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5252D10E990;
 Fri,  9 May 2025 07:22:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492TXAn010134;
 Fri, 9 May 2025 07:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Dla8B35B5GI7NgCRFcppF9HQbZmolek3xZUmGt8T47U=; b=KPEfb/5f+TMt5MEM
 O5z5n8tx7j0dbRM4M0Y7CIafCHQ1Aa3SjB0e5Xb6hXNM64YIjITcD9Aabxib5cQD
 Mw/NcTxngEV/EdtdEqn/xe5/sVvvHx+U5/TtrOusMJx8md4Je1QR1QgQbsh5DwgP
 svcj3jc/yLjac1cH2eh9V+cS/nwNOpFC6++o3mVK2dxW7t9oLne8U10Zs0i3KSCq
 37DKOL6MuTIGhbaMQeZYaTeenj8DKjlaMHXSoOVze19zi0zcE7g62Ytc3V7/HBtB
 U7QPClzAAhPGq8FmAR2ebYMnF/+uA1oIJIAgVnBUUH57NYC/K+eCrwdjp6rtnHEs
 /0l0sg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7btur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 May 2025 07:22:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5497MTBi012284
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 May 2025 07:22:29 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 00:22:23 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 9 May 2025 12:51:39 +0530
Subject: [PATCH v4 1/3] dt-bindings: display/msm/gmu: Update Adreno 623
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-a623-gpu-support-v4-1-d4da14600501@quicinc.com>
References: <20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com>
In-Reply-To: <20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>, "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746775337; l=1861;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=YW+qNb3QmImeSEjxA2dh16peK5ppbEY4RY5TSaG5hNc=;
 b=jTs8TQc5m9joAQ9xWPP8xl1pKvGC6VlDOkUaKzxkygbzMv3ZbLkM7/dwfd6r7+K4BI/GB6aAD
 23KJcq7ct0WDr5rgcRh44nrW1Ttw0f71AIyAyUlp6f9hp0YrubKPS8Y
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA3MCBTYWx0ZWRfX/2YEsHbXV95C
 0sBHEQjKDG6KJhc78lOMkfKxIBwc4kQQ102RVLpXpxb8zv+MIQsyW174Qr7D5rRgBjCFPCFBCmr
 5oiYc4anfeu+UC4a1gO3BP6QoQk5kpcTGjgYyWEuoepxineOzIM9yt1lhqk/D+xJW5zoIiCUR/o
 QNzZ6pY3NEe7pLglekpVEV3d3454qIn9KZhfp9qGF6R74uJDORbX/JB1J7HQpi+kY0JSX39KpMc
 k6lpfbgB1ZxCIBMW+shNpEoa5r49dhV4bo/psm0RNJNROujTogvJ6BELH44A3TX9/w4hcGRHFkE
 ozAYuzVcLvnUPcuNlfTgZ/N4xrcXcDlpB8sGh8KgKZ2sSVpLVuYnpEY81b/66J1tWLbjY0g8aCc
 mc04+BHbIvqIk8ojQTehIaWMqvHem6tdNzwh+kB1nRqjEKzMY1qZgEp6iRI+Uvv2Tp++HtKj
X-Proofpoint-GUID: a30TSwTBNc5ua0zXgQvWlErZfEdsRBjl
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681dad36 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=Z2Up3Oz-XkvUWgdIv6MA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: a30TSwTBNc5ua0zXgQvWlErZfEdsRBjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090070
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

From: Jie Zhang <quic_jiezh@quicinc.com>

Update Adreno 623's dt-binding to remove smmu_clk which is not required
for this GMU.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 4392aa7a4ffe2492d69a21e067be1f42e00016d8..afc1879357440c137cadeb2d9a74ae8459570a25 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -124,6 +124,40 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-623.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU HUB CX clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: ahb
+            - const: hub
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,adreno-gmu-635.0
               - qcom,adreno-gmu-660.1
               - qcom,adreno-gmu-663.0

-- 
2.48.1

