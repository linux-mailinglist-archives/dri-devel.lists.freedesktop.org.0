Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D88A4896A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 21:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED42210EB75;
	Thu, 27 Feb 2025 20:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BrqK2Axz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AC010EB73;
 Thu, 27 Feb 2025 20:08:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RAmHB0003268;
 Thu, 27 Feb 2025 20:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=lBWq1nIHs8SVaVeGZfZPKB
 ueNQ/iSxF0sZnlSAfBKPA=; b=BrqK2AxzFtZchbQhvtjsH2bmL0o8bWBvX9xGOG
 3njGpIT6uGBFzfyUiuOIMw5H8LxJX8uyxBcoVK/AB6lmfKxwZFq0KSl3jk9qmbJ2
 v1q5yJ6p4G6OYPQYrMZGMFD+4mR5MiKfUU08URT+QMVW4B25Ey0H4vZR5+r6qW2M
 htNqW0CGICSOidSIci6lJOaVY8MiZY1GPZ1ttBwgpfrjGxJ5DAZGsh9Kuw30HgBp
 GuiUJ63sVGoRO4q8/S+jZTw0hOB/pF3BKipnR519PkzFhuEOy52YH3zoTbBCvgb0
 stmiLabJjtEQtp23+HLM1VAIdnS3TT8EQQuXzprWED3dbZLw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452pm7hm2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2025 20:08:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RK8TPc002253
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2025 20:08:29 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 12:08:22 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v2 0/6] Support for Adreno 623 GPU
Date: Fri, 28 Feb 2025 01:37:48 +0530
Message-ID: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABTGwGcC/3WPyw6CMBBFf4XM2jF9QGNZ+R/GBa0tdNGCbSEYw
 79bcOPG5b3J3HPmDclEZxK01RuiWVxyYyiBnSrQQxd6g+5RMjDCGsIox04wjv00Y5qnaYwZrRD
 yIgi36tJAOZuisW49Jm/3b47mOZfl/C1BdcmgHr13ua188hjMmuGXWAR2HuUUVY0qdkEP2NsVk
 /czKsKZoFJwIup2aWCnDC7lMb6OPxZ6YP4rLxQJSsm1aDSX9sGuxU+7oM/FCu7btn0ANeQauRg
 BAAA=
X-Change-ID: 20250213-a623-gpu-support-f6698603fb85
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>, "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740686902; l=1755;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=Gp7Np1uNLWQTHyBaGS7MHACrSioXyt4C5ZJwKQMSxZ4=;
 b=hhHGrGZy4IvBXKHhvIjLe+a63IRatsLxEd9TR8otJs5AbIWWuMRwYl0XIrOwKEJ8ZjMLvslO6
 bkBqUPcWqzjBpATcCb/fj9uWIciEQX5OxkVAjf22DiVUWNdW8bZPbTG
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fuGlA0-yGs2WUh-QN3WEchl9CweF7H-T
X-Proofpoint-GUID: fuGlA0-yGs2WUh-QN3WEchl9CweF7H-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270149
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

This series adds support for A623 GPU found in QCS8300 chipsets. This
GPU IP is very similar to A621 GPU, except for the UBWC configuration
and the GMU firmware.

Both DT patches are for Bjorn and rest of the patches for Rob Clark to
pick up.

---
Changes in v2:
- Fix hwcg config (Konrad)
- Split gpucc reg list patch (Rob)
- Rebase on msm-next tip
- Link to v1: https://lore.kernel.org/r/20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com

---
Jie Zhang (6):
      drm/msm/a6xx: Split out gpucc register block
      drm/msm/a6xx: Fix gpucc register block for A621
      drm/msm/a6xx: Add support for Adreno 623
      dt-bindings: display/msm/gmu: Add Adreno 623 GMU
      arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
      arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 93 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 29 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 13 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 17 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
 8 files changed, 171 insertions(+), 3 deletions(-)
---
base-commit: 89839e69f6154feecd79bd01171375225b0296e9
change-id: 20250213-a623-gpu-support-f6698603fb85
prerequisite-change-id: 20250131-b4-branch-gfx-smmu-b03261963064:v5
prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
prerequisite-patch-id: 08a0540f75b0f95fd2018b38c9ed5c6f96433b4d

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

