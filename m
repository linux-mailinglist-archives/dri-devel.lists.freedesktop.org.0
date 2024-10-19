Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2813E9A4F60
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 17:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F212E10E39B;
	Sat, 19 Oct 2024 15:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AF6FyxrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC29810E398;
 Sat, 19 Oct 2024 15:45:52 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49JCapO8008028;
 Sat, 19 Oct 2024 15:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=6o3tftsphxZMdcd+NN43Bb
 028l5wg731ogHU0O/VzOM=; b=AF6FyxrDWamtXdhrgDhs4PsqUAub15RqWFHPrL
 V2lq+BoxFiJGtPtB41hWlra8DHrbw6YEWmfzb1qkw4ySPlvqtkGXRZnw6NbFixo+
 UOHQBuE31NkmbB/ijeW4+7/bQX+JgXtjEE97Iqbxh73guIs7sUW5m2grro61V1YV
 lj8uG6Otkkbw7pbmNS9ecTIFRkYfwPpCzOlR5J39QKJJh44Hsf1+5MtPZcc+nYZb
 jzhqg8pzVear6EKav4BW0t7Umo2tCykCT+JvwdUDEjcmuZaXiapMUr9zB26pLjUj
 dxpIWbnhH4O0jzyZKXMghfP7ytAcZvJUz7AJs0deOkP2cd/g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6s58svf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2024 15:45:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49JFjisF001876
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2024 15:45:44 GMT
Received: from hu-mahap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 19 Oct 2024 08:45:37 -0700
From: Mahadevan <quic_mahap@quicinc.com>
Subject: [PATCH v5 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Date: Sat, 19 Oct 2024 21:14:52 +0530
Message-ID: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPTTE2cC/1XOTQ6DIBCG4asY1sUM+EtXvUdjDMWxzEKxYE0b4
 92Lruxu3mTy5FtZQE8Y2DVZmceFArkxRnFJmLF6fCKnLjaTIHNQGfBJz8YuWSt4CWAeRhS5wpr
 F/8ljT5/Dujexe+8GPluP+iTIUggQWZVKCSCKmgv+epNpB231dNtPGk1q3LCLlsLs/PcYt+S7e
 ygRUKcdS86Ba1V0dQ+oMav+mGbbth+Bc4p95gAAAA==
X-Change-ID: 20240930-patchv3_1-600cbc1549e8
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729352737; l=3213;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=ER5pUbIVmvLbmPg+W2QQlZADoIzmP4sUM7Hes5MIWEs=;
 b=Vwxv/z33G196wrk+d59bw1Bffbn+5LSJmYI1AUkY2Og5vx5iBHC+fKap7Zv98GVcFds3ZmqRy
 dAZjqn1kfFGBIgnjLZghPC9Mm9H75/sPGk6qzrCAelv2NURtP70/OxE
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: eyNRmIIp956mYjByl2UT6QnG2BoPukZe
X-Proofpoint-GUID: eyNRmIIp956mYjByl2UT6QnG2BoPukZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410190114
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

This series introduces support to enable the Mobile Display Subsystem (MDSS)
and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
includes the addition of the hardware catalog, compatible string,
relevant device tree changes, and their YAML bindings.

---
In this series
- PATCH 1: "dt-bindings: display/msm: Document MDSS on SA8775P" depends on dp
  binding documetion in this change:
  https://lore.kernel.org/all/20240923113150.24711-5-quic_mukhopad@quicinc.com/
- PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU"
  depends on the clock enablement change:
  https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/

---
[v5]
- Update clock-name of display-controller in MDSS documentation to align with
  qcom,sm8650-dpu.yaml. [Rob]
- Update power-domains of display-controller in DT to do proper voting on MMCX
  rail. [Internal Review]

[v4]
- Removed new YAML added for sa8775p dpu dt-binding documention as it is similar
  to qcom,sm8650-dpu.yaml and added the compatible in same. [Krzysztof]

[v3]
-Edited copyright for catalog changes. [Dmitry]
-Fix dt_binding_check tool errors(update reg address as address-cells and
 size-cells of root node one and maintain the same for child nodes of mdss,
 added additionalProperties in schema).
 [Rob, Bjorn, Krzysztof]
-Add QCOM_ICC_TAG_ACTIVE_ONLY interconnect path tag to mdp0-mem and mdp1-mem
 path in devicetree. [Dmitry]
-Update commit subject and message for DT change. [Dmitry]
-Remove interconnect path tags from dt bindings. (ref sm8450-mdss yaml)

[v2]
- Updated cover letter subject and message. [Dmitry]
- Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
- Update bindings by fixing dt_binding_check tool errors (update includes in example),
  adding proper spacing and indentation in the binding example, droping unused labels,
  droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
- Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
- add reg_bus_bw in msm_mdss_data. [Dmitry]
- Fix indentation in the devicetree. [Dmitry]

--
2.34.1

---

---
Mahadevan (5):
      dt-bindings: display/msm: Document MDSS on SA8775P
      dt-bindings: display/msm: Document the DPU for SA8775P
      drm/msm: mdss: Add SA8775P support
      drm/msm/dpu: Add SA8775P support
      arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU

 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  89 ++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 8 files changed, 830 insertions(+)
---
base-commit: e390603cfa79c860ed35e073f5fe77805b067a8e
change-id: 20240930-patchv3_1-600cbc1549e8

Best regards,
-- 
Mahadevan <quic_mahap@quicinc.com>

