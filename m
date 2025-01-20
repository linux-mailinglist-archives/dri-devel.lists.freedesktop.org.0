Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA5A165CE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 04:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A430B10E273;
	Mon, 20 Jan 2025 03:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IbYiGgHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC02C10E270;
 Mon, 20 Jan 2025 03:51:21 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JNLdFX003571;
 Mon, 20 Jan 2025 03:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=wE0QTyb1bWqL0xcxeURxIg
 E1v79bThq1ByWtm34PUEA=; b=IbYiGgHq8wpROiN/LVQOz/oPhGiXiCKo4qSXPz
 cpH9aGvEzIQfZXXIr/XRxL6Ko0/FBBvEaHgHPFqzEOR1rlUaBRETLdRDJU7V2DNm
 u53svcmOY6CJX+N+neEJaM+WSvKuyVVvF8oc/CvzVFf7CxCOCyEn6Ta1Kjh5MPq4
 N2f6nsA19tLHKL/yqpg04rDJxTFsoA/0YtQ8Cg3bNronmRXiU24HpZjC0PqUmtIK
 fAOGIbmHVSvUzpeeOUb4cNB8R1GIco77mUq84gZNBO1ejWrVvGtgZZyllLLu1a+i
 p+KbsyfRVxiBB+nLEgR9ZpiA1RW1mv3/Qh/5Ov4NgZhuMsdg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44838qu2vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 03:51:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K3pDuW004385
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 03:51:13 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 19:51:06 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH v4 0/4] Display enablement changes for Qualcomm QCS8300
 platform
Date: Mon, 20 Jan 2025 11:49:17 +0800
Message-ID: <20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMXHjWcC/22OzU7DMBCEXyXyGaP1L05PvAdCKF5vqA9JWjtEo
 CrvziYthwLHGWm++S6iUslUxaG5iEJLrnkaOdiHRuCxG99J5sRZaNBWaW3lkGpN89sZazAAUqn
 4FIJJ6CEKHp0K9flzB768XnOh8wdz52spYldJ4jQMeT40OoYQnOodIwxashAxWcCeVOsdXxJq3
 aYkNtYx13kqX7vronfYTcv91lq0ZDdAjL0hF7B9ZgfMIz7y8+Z5G/p/hx3GDlJ0xiDdDTeLxfw
 8O1DK/AEYBngM1BrrWg9wD1jX9Rts/GNvdAEAAA==
X-Change-ID: 20241224-mdssdt_qcs8300-11b7883dc60b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737345062; l=2700;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=xaZ5b+j16ldrxERmWY4pdQXwzSQSeVhjH+GFucm0uU8=;
 b=veeCAo8IKxO3zgNYroMNrTX8eeaIMvMFC9wUOO8OIW/ac4rjugSsjDQ8Ji1tU1WU8cTUxlyvh
 5uvkvPQmTdCC5gll3fcYnqN3BdBPSa3tQJ50TEE0pX+M8qquIrSwh6j
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oUAKrL6qNH2zHPpBZzreZclIX9NLGmPU
X-Proofpoint-GUID: oUAKrL6qNH2zHPpBZzreZclIX9NLGmPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501200028
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
, Display Processing Unit (DPU), DisplayPort controller for the Qualcomm 
QCS8300 target. It includes the addition of the hardware catalog, compatible
string, and their YAML bindings.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
Changes in v4:Fixed review comments from Krzysztof, Dmitry.
- Use the common style for the dt-bindings commits.[Dmitry]
- Update the commits msg for the mdss binding patch, explain why they
  reuse different platform drivers.[Krzysztof]
- Link to v3: https://lore.kernel.org/r/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com

Changes in v3:Fixed review comments from Krzysztof, Dmitry.
- Fix the missing space issue in commit message.[Krzysztof]
- Separate the patch for the phy from this series.[Dmitry]
- Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
- Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com

Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
- Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
- Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
- Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
- Correct formatting errors and remove unnecessary status in MDSS
  bindings.[Krzysztof]
- Add the the necessary information in MDSS changes commit msg.[Dmitry]
- Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
  20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
- Package the DisplayPort controller and eDP PHY bindings document to
  this patch series.
- Collecting MDSS changes reviewd-by Dmitry.
- Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
- Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
- Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
~

---
Yongxing Mou (4):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display/msm: Document the dp-controller for QCS8300
      dt-bindings: display/msm: Document MDSS on QCS8300
      drm/msm: mdss: Add QCS8300 support

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 4 files changed, 268 insertions(+), 4 deletions(-)
---
base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
change-id: 20241224-mdssdt_qcs8300-11b7883dc60b

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>

