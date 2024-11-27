Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6E09DA2AC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 08:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4E410E9CD;
	Wed, 27 Nov 2024 07:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ChoG0XzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED50C10E9E2;
 Wed, 27 Nov 2024 07:07:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLXwn007146;
 Wed, 27 Nov 2024 07:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=FdzhCJYyts+i+8/ip4aX/U
 kHnExbLtaZrVSH+17mkFM=; b=ChoG0XzBlB2NFUVeAKPSGHBgmL7Q/4BHvfgYwL
 v756JbLA43fvyVEw6awY2Um+G4wNHIUKfu2KNCYWS0zy30RuaIlV0EoAJ/rkKIsf
 jaLV6FUK+LTs4VpmMOWRRJdT870z67eEVFkafTy1Ob86PSm6efTeuhqHFO5NbVT6
 6Ku0NyecRtJriB5eMG0r00Mp7n3HHRhSnZhYQ0dHFidBjtziqJ4oUUEcgZEaIMrY
 LM66J2etKnW0U29RXnhcVdU9OdxPxpEWR3UIjwJ5zmUkZQx80n6dcHPz+LVbUuBO
 /I/TKKkFP8u/oP30/pb3qHYcmh7klu/xDTfd5t8QtIox6gDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434sw9dsua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 07:07:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR77FwX027248
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 07:07:15 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 23:07:10 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH 0/5] Display enablement changes for Qualcomm QCS8300 platform
Date: Wed, 27 Nov 2024 15:05:00 +0800
Message-ID: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALTERmcC/2WQQW7DIBBFr2Kx7lQMYANZ9R5VFcGAG6TaSQy1W
 kW5e7GTSo2744/0HjP/wnKcUsxs11zYFOeU03GsAZ8aRgc3vkdIoWYmuFCIAmEIOe/PlI3kHEi
 ibwXx0FrLKnKaYp++Vt3r2y1P8fxZreU2ZEPM2a3WXbM4uRUt3HX7NKaS3Mc+lJxgFsBBWUWK9
 044JV6qiNJIz3Qcls+2KkRUvyoYBiCCUODkCh1gRkDQzmrVckNadluZdzlCfQ+p7BqFiqwm23W
 +s1G5LjrtpbC6boJ1KHrrbew5W248pFyO0/fa4IzrkfeyxGNZdQcOrvcYeKze0D7ssKhm+RdvN
 7isuCHfGWn74EL8j6u/uN7gquIyGC2ckUa78Ihfr9cfk4zp8QwCAAA=
X-Change-ID: 20241121-mdss_qcs8300-c31b52c0d599
To: Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732691224; l=2087;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=JaVHnEJJVx3WJIgnsINQ7pXkS53mrl5xi4vPx6Jyeko=;
 b=yD1PeHCiVj2rBlrYMhHCDxLXmCzHE9yMK/bNScM2U6pdvVwdQzvJDXJo+gXKA6QnFqSill9Ua
 HqOtww+dpx9CLHcj3KpXojS+c8ENKqdCi+s9WgJODKUYMX8AW9C9+co
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cggMyCBySlYnhNnfs7W0LK4MQsvEIFfR
X-Proofpoint-ORIG-GUID: cggMyCBySlYnhNnfs7W0LK4MQsvEIFfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=878 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411270057
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
and Display Processing Unit (DPU) for the Qualcomm QCS8300 target. It
includes the addition of the hardware catalog, compatible string,
relevant device tree changes, and their YAML bindings.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
This series depends on following series:
https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

---
Yongxing Mou (5):
      dt-bindings: display/msm: Document MDSS on QCS8300
      dt-bindings: display/msm: Document the DPU for QCS8300
      drm/msm: mdss: Add QCS8300 support
      drm/msm/dpu: Add QCS8300 support
      arm64: dts: qcom: qcs8300: add display dt nodes for MDSS and DPU

 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 239 ++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              |  87 ++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_qcs8300.h    | 485 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 8 files changed, 826 insertions(+)
---
base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
change-id: 20241121-mdss_qcs8300-c31b52c0d599
prerequisite-message-id: 20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com
prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66
prerequisite-message-id: 20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com
prerequisite-patch-id: 8faad5c6d8ca255935d3e4d317dcbcc32b8261ff

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>

