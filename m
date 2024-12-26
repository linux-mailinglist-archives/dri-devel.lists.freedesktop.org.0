Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE069FCA0C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 10:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB8B10E807;
	Thu, 26 Dec 2024 09:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ehv1lB/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FA310E806;
 Thu, 26 Dec 2024 09:43:18 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ8BgEc022659;
 Thu, 26 Dec 2024 09:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=QKhHf4JbsWGTY3FFN4/3Hj
 rj/7m02iv0le2h5LxDSos=; b=ehv1lB/2Xvy+ufv2ehZLckFG+Zd1kXKqa1KstK
 2fcojaaeZmirZFcpk+Kc62C/5oqVeA72CsgUHjpbcXsNtO3NE2F/mFbCO8TIrn/h
 Rus+zvJ+qBfk+dGbzAWYZMZ6YjX85CaXuk8zkJv+FPE5U5FsKJ3YW03HBRevg4FA
 EIw3Ue/KWDpFoypsq3hoH2Xmyvmses01wHDcu3RRs74MyY+v0Z20cTA0CMdDV/c9
 vFgpwOkCOWuZKEITauh70hSG6zsNz+l7/3txz5CMxLbZuzZqqzZ+DfaftB+YcUKe
 0GnvIn8KAdmZfPBafBMEgsG4t6L3vDPk/nTPIb9ucpgS4r9A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s3dwrr10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 09:43:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ9h9ko026118
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 09:43:09 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 01:43:03 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH v2 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Date: Thu, 26 Dec 2024 17:40:44 +0800
Message-ID: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALckbWcC/43Ry2rDMBAF0F8JWneKXrbkUEr/owQjj0aNqB+Jp
 ZqWkH+v8iiEZpOFFjNIRxfugSWaIyW2Xh3YTEtMcRrLIJ9WDLdu/CCIvsxMcqmFlBoGn5LP7R6
 TVZyDEJ2xVnmsecfKo91MIX6fwffNZZ5p/1XcfFmygVJyZ3e9ermwXMHVa+MYc3R963OKsGiQ4
 A02ldJWl6tvRcI44jNOw+vpu3tM8PoPg2GAncu4pQSLAg6hFsLZYE0Q1SOU0LcUIvh8AWERIMC
 4xuiKWzSqfoArBzwFnMYQP9rkrDHVrsV+ws+2LPM89T3NJaostmtIoHfkjb2P2rlEUIYh5vXKi
 qrqNAWl6zpwkrYhGxAbqqmWQQXtkcihZKc6tjHlaf45173Icx/XZqv/zZYYpV6O2AVFlcXmNgb
 bHI/HX9VmbhQ9AgAA
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
 <linux-phy@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735206178; l=3711;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=HrZixsa4o407w0QLd9DyL3Cx7C9rBv6UU13xVhOl9Bg=;
 b=bIaX7B/2+vkGmUQj9+iXg/N1jRIRdrjxQwdHYd5XFggH0hbBeB9az5La2tFVsJDXAa8lvUSKW
 h0YTS/kz1bYDU184yG4Dt3zLsoN4rf8ys5zcOGPAGCOVEnK3HZYqz3O
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KTiTMKdPGR80sw1UqhDk1UCgks9G9HG8
X-Proofpoint-ORIG-GUID: KTiTMKdPGR80sw1UqhDk1UCgks9G9HG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260085
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
, Display Processing Unit (DPU), DisplayPort controller and eDP PHY for 
the Qualcomm QCS8300 target. It includes the addition of the hardware catalog,
compatible string, and their YAML bindings.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
This series depends on following series:
https://lore.kernel.org/all/20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com/
https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/
https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
https://lore.kernel.org/all/20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com/
---
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
Yongxing Mou (5):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display: msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      dt-bindings: phy: Add eDP PHY compatible for QCS8300
      drm/msm: mdss: Add QCS8300 support

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
 .../devicetree/bindings/phy/qcom,edp-phy.yaml      |  19 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 5 files changed, 280 insertions(+), 11 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
prerequisite-message-id: <20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com>
prerequisite-patch-id: 33f2488a8eb133431f200e17aac743598508dcf3
prerequisite-patch-id: 7b653ebeaf1ca3f87620ccf7d876e3d1fe496c4a
prerequisite-patch-id: e1b60af8a64332e5f0ecbd3a4ea2b6e090bd97cf
prerequisite-patch-id: b823d744d2fb302e2496eaf0cf0c9c66312dcf2a
prerequisite-message-id: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
prerequisite-patch-id: 367d9c742fe5087cfa6fb8e7b05ebe9bc78d68f3
prerequisite-patch-id: ee0513c070ab96e63766d235b38ee53ca9b19181
prerequisite-patch-id: 970974160bcdc837ccbe5ea3b5dcac582e90bc0d
prerequisite-patch-id: 5b2bd9cc44a529b0b9e5d73128dca5d2ff9f2f44
prerequisite-patch-id: 6a0a81242e1d0f051e3102533bf0191615c6e96b
prerequisite-patch-id: 322540ce6d45c32f813ecef50e5135c6f08d9019
prerequisite-message-id: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
prerequisite-patch-id: 8faad5c6d8ca255935d3e4d317dcbcc32b8261ff
prerequisite-message-id: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
prerequisite-patch-id: 81378ec66ab6e569bd828401c43c4f5af55db32c

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>

