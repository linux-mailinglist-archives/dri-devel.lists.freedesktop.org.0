Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C05EAB0033
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 18:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16E810E203;
	Thu,  8 May 2025 16:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="b7qRc/1s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4932510E203;
 Thu,  8 May 2025 16:19:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5488lqDO019416;
 Thu, 8 May 2025 16:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=3y7f/rfzEJvyCsfA3x73B/
 n8u+CtoUu2v5pm9kfs7T4=; b=b7qRc/1slRJc5gGHo4bR9FbpNA9ojO8YWdwmHK
 SB9pSO+NHgUOLuoUZdk65sAAMcdYbLyXzNTxw3rs6fEFXm+txwOzq3DpMX2m+HE4
 wT5JWsD9P109dxD9LACyRpelmN/Bq8r/6TwdsJzQqMNQr/tV2ToPwuwwiZyW4ALr
 F1pYi5i3fYZsh2p8W7Fa4HOe7yVfeuvSAoAJ2jNWCYCtq26uZjLhORc987LNjIdR
 HGNBYZTRHwoBPk5LkIhqj9eKQyltEb++isLQKofSqfvFFq/5iSOyEccztWCxTTlP
 ZHtKW/LmyEJFt/7YdnbrKmaNBP9Nxn1+YIDBLxEYeM0af2oQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj1ahq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 May 2025 16:19:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548GJe0Z026651
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 May 2025 16:19:40 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 09:19:33 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v3 0/3] Support for Adreno 623 GPU
Date: Thu, 8 May 2025 21:49:18 +0530
Message-ID: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIbZHGgC/3XPy2rDMBAF0F8xWneCHpGwTCj9j5KFNJZsLfyoZ
 IuE4H+vqmxSaJd34J7LPEhyMbhEuuZBosshhWUuQbw1BEczDw5CXzLhlEvKmQCjuIBh3SHt67r
 EDbxSulVUeNtKUmprdD7cKvl5febovvYib88jsSY5wGWawtY1WZ2YhIi1O7mUTN3smkudFIyCP
 YONZsYRBn+DNE07ZAUcmERFbWtsr/VHWcAw46m47+RndwxpW+K9fpZZHf7/icyAgtYClUShfc9
 fvcpl/kLw9g+CF8I4o+TZIbJe/CaO4/gGQG/iwm0BAAA=
X-Change-ID: 20250213-a623-gpu-support-f6698603fb85
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
 Oommen" <quic_akhilpo@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746721173; l=1636;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=e3pyHsNfoGdzYxZZUg3CeC5Pgg3Gylc5xxF193wq9zk=;
 b=8iwjAaoIjVe8w7OXVzgxUDQekZOZU0G1hr1zjQUpXfWORsARJCjpTYfXAyhdfuSulefmhwJJl
 XbaAN7pumpaDHFsGaKYI8cT1DKUp2hPZYKp7rN6hOhD+PYvXr8IqCGg
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681cd99c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=Zgk8kBV0DBUZDr0MsEgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0MiBTYWx0ZWRfX/qkCi+NBWrI9
 9Dj0t3yaxEL/KL4mGqQmo1mZVpLZ30fwZ+nk1/IEVd6VDywSU9qFqdmF4tZ2HeHmr3TFxul57DE
 NkhfXVzl5iu9qhaxmlIiLUJwBdsngAwS1Xmk19hraREKT9BsqWqdfvFzQ3BnadFmiXH4AQs7E3k
 B1PWwj67qyj+OQ8yvA2/NCZfPhoi1oN+bMo5H2JLy3/OsjNT03lQd0xR7dUI/zNDTFVRgwnJERt
 zdF1lB0BLJ5ovQ1LiI6jvFdorZI6eOL0t3gzqqbAQg2lgeql0KADOZlMWlRDu9/ZmidP47L9onh
 FmFIrIi1uyUAiQByLcrThrWPt6l015sGnEiGFGF5PrHrh+uleJzr2lNcJhgkRmHvFfpR1cIaXVQ
 ADO49vshKlxWHiFceyr/zdQY6/dF0+BuXzOfiHg61gLRVTqCHCdfqigkrgtcKrO1taVfWJq2
X-Proofpoint-GUID: kD3K_YKiGbcz1gqzE_IHHEpdnZUFi4S1
X-Proofpoint-ORIG-GUID: kD3K_YKiGbcz1gqzE_IHHEpdnZUFi4S1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080142
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

Both DT patches are for Bjorn and the dt-bindings update for Rob Clark
to pick up.

---
Changes in v3:
- Rebased on top of v6.15-rc5
- Dropped drm-msm patches since they are merged in v6.15
- Correct GMU opp table in dt (Konrad)
- Remove smmu_clk from gmu clock list (Konrad)
- Update dt-bindings yaml with a new patch#1
- Link to v2: https://lore.kernel.org/r/20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com

Changes in v2:
- Fix hwcg config (Konrad)
- Split gpucc reg list patch (Rob)
- Rebase on msm-next tip
- Link to v1: https://lore.kernel.org/r/20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com

---
Jie Zhang (3):
      dt-bindings: display/msm/gmu: Add Adreno 623 GMU
      arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
      arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       | 34 ++++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 91 ++++++++++++++++++++++
 3 files changed, 133 insertions(+)
---
base-commit: bc720facc421d0ff6d568323035d1a4d5d35ce84
change-id: 20250213-a623-gpu-support-f6698603fb85
prerequisite-message-id: <20250310-b4-branch-gfx-smmu-v6-2-15c60b8abd99@quicinc.com>
prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
prerequisite-patch-id: 6a64b525e8ef33377b3cd885554b421fe8e6a192

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

