Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11BB996E0C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C53210E756;
	Wed,  9 Oct 2024 14:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FXw2/bkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C4610E755;
 Wed,  9 Oct 2024 14:34:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499AcDTO022770;
 Wed, 9 Oct 2024 14:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=OLrkGCm1M7uiupIDOq5/qG
 HdS/WujAZlX6bgxfbtXwY=; b=FXw2/bkS5WANsxlZrV6LrJa/kwW1QrXJ3C0BMO
 lxqkjaw1C6NhKA1yFn6tvv0Sy8OP6RZcTR5ksEFqp0PRB38MPqQkz+T+Rb5vrkia
 0cnTX3aCBo/APG/82tTybPHTZEj5NYGR2zHhbTgF61tWWIoFtQGgqhmCtQwG+TJU
 zdZs9s+c+38krWw1OMkd4WfzEG/YSeBDFXamhPAzLN9BsMjFcu0ZhvyRESmDWkd2
 1HR34LpNBXbnPjVRnjJ4kxFUdzpe147XhA5+Yut5ZW2D3A89N6cIF3A8NmpGwfWr
 vKPW/q9dvXA4LmlYEPtvY21q5m2mIhjQRfshk3z3Nq3/eO6g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424x7rw9qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2024 14:34:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499EYA41009489
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 9 Oct 2024 14:34:10 GMT
Received: from hu-mahap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 07:34:03 -0700
From: Mahadevan <quic_mahap@quicinc.com>
Subject: [PATCH v4 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Date: Wed, 9 Oct 2024 20:02:00 +0530
Message-ID: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOCTBmcC/03Myw6CMBCF4Vchs7ZkplwEV76HMaSOg50FFAsSE
 8K7W125O19y8m8wS1SZ4ZRtEGXVWcOYUB4yYO/Ghxi9J4NFW2JboJncwn4tOjI1It+YqrKVBtJ
 /itLr+9e6XJP7GAaz+Cjur2BrIqTimFuLSFVjyDxfyt3gvJvO36kj5xwG2PcPpH4Cz50AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728484443; l=2983;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=J3ENcrjn9gEIimJlxP2OIgpuvAJFdi3AKCBmbm/60wE=;
 b=+EPPiNwv5G+hrolpuquZXSzEBXrCBIZ1UlPq3ZOvzarNv61niYK3nZHwlWTZq/AV8+oifR5OX
 0ImZrITJIuTA9NHiitcPG9YbNQ3UD43QYJlqzWoJarRXn++m2XLhuUK
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: X1yNXcXptXpDn4GUjszpTT3tB2-six-5
X-Proofpoint-ORIG-GUID: X1yNXcXptXpDn4GUjszpTT3tB2-six-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090090
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

