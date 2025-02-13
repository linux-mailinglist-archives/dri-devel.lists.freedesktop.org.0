Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC14A34926
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1896810E45F;
	Thu, 13 Feb 2025 16:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eofMLLMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C847410E09D;
 Thu, 13 Feb 2025 16:10:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DAcEbo002191;
 Thu, 13 Feb 2025 16:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=3HL6sl92zaxhx0opG+pobi
 HfF3pojHqEdIfAEm4d0Hs=; b=eofMLLMHFdQ+yWZbiGxl+ua2DFD8FTd7RSdbec
 ismgr7VY4LeBSsTozsqibbtA/cRcshm2KIs/chwjXf2RvzZTIHkf/MTOMaCguRam
 DpTIs6GecLtI3gBNyQXZ5VNszoZVTOpvy+1ieQniFQm7BmQ65EuTmV+u+DEo8mCQ
 CQbizqVv0SBwkKE6UUJY3ZwGsfp6trlBwWMHzzzvM7iPiplAgPJ/EW4e497dAhxQ
 gJfoslKeHbXp0C12IzZy68PEkBQek3dJGuZL0oJqx1H6hGe1d7kQexWJivXHa3P4
 izI5GPDp0JTJkLtQILurA+Dh9DzWg958ZSsT6v51uc01YHqA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s5w4a9hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2025 16:10:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DGAbTg004607
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2025 16:10:37 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 08:10:31 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH 0/5] EDITME: Support for Adreno 623 GPU
Date: Thu, 13 Feb 2025 21:40:05 +0530
Message-ID: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0ZrmcC/02Nyw6DIBQFf4XcdW/DQ4n1VxoXQEFZoBTEmBj/v
 UQ3Xc5JzswB2SZvM/TkgGQ3n/0yV2APAmZS82jRfyoDp7ylnAlUkgscY8FcYlzSik7KVyepcLp
 rod5iss7vl/I93Jzst1Tzeo+gVbZolhD82pNNPlmDyXD4T/bkCjLBUDeok5rNhKPbMYdQUFPBJ
 XtJQWXTby0M5/kDMURev8kAAAA=
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
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739463031; l=1493;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=WuR3peFWCiiP4y40/7sn77mVtQotfsJB+UuS/7nLy9g=;
 b=96aU8j1P4fpykQ0YA6UdYOeoBcRwuJwxxNgJcFX8HcKtbk3qJXvvnORjxhU5AsKeL16Ekc/QZ
 /YLoDXGK50fAPlgTsuCRd84kP1aqzyqep8LnMTi0GvLccxQ+V/P2huX
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zc7jQoVuuJbv4zusTslYyUk3wiZdWcat
X-Proofpoint-ORIG-GUID: zc7jQoVuuJbv4zusTslYyUk3wiZdWcat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130118
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
Jie Zhang (5):
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
base-commit: 6a25088d268ce4c2163142ead7fe1975bb687cb7
change-id: 20250213-a623-gpu-support-f6698603fb85
prerequisite-change-id: 20250131-b4-branch-gfx-smmu-b03261963064:v5
prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
prerequisite-patch-id: 08a0540f75b0f95fd2018b38c9ed5c6f96433b4d

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

