Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC42B15C79
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 11:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DCE10E14E;
	Wed, 30 Jul 2025 09:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OWcjDp5F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F1210E43D;
 Wed, 30 Jul 2025 09:43:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6EfZw014586;
 Wed, 30 Jul 2025 09:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=f7iraRWkvQHYrHL8Iug9KT
 Y4j4R6e3IUEIZUCUXiwUA=; b=OWcjDp5F1fCvyvoFNbcZ2r+wlRRqI1CBW/tq5Y
 IZVIhmZ36+p9122pmoaDipY/1TRoLVJkLZq+osie21YnQSMsuw5m+wNgPT9B3CfK
 UVzq2TnGyh6HoM0X62+NwcvBJ3qUycq9hD5L4BrkPfn9cX3WhZlUXO78inL+9+cZ
 C3fZobDRgC+fLzjMgLfDPRON8Vi0QVEYff2z0saPze83wZA59k/bp4yYjlVVsc4c
 8JPlhNcrvWWbto3p9FvbTC8kRJ+bdYp+KedeF0Gkg00bsHTl4JTWr1LEeZQdjh88
 yaCT+m+qz4lPfEm2x2xGS8Yn2ma+a8k3Dc0A2SyOhjRQ9qKQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xu6q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jul 2025 09:43:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U9h4sb031596
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jul 2025 09:43:04 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 02:42:58 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH v5 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Date: Wed, 30 Jul 2025 17:42:25 +0800
Message-ID: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAXpiWgC/22QW2rDMBBFt2L0XYXRy5JDKdlHKUGPcSKI7cRyT
 EvI3is5KTRNfwQzcM+cqwtJOEZMZF1dyIhzTHHo86BeKuL3tt8hjSHPhAOXjHNJu5BSmLYnn4w
 AoIw5bYwIvgZHcug4Yhs/F+D7x20e8XTO3Om2JB2mZBfuunrNWAWaaRqO2y5NWxf7EPtdorOgQ
 DX3CIYbpUFshpRWp7M9+KHrVvl5K+ecTUjLJk7rKisiNCildIE7qC1iE1grWtROMOG15aFlzpE
 ito9pGsavpfjMF7N7R/W348yzCwPvXStQGd9sciEfe180isU9WP8btN5ZCE4J4fEhWCxm8XNZA
 WPiCVB+ofYGGyFVUwM8A+QvAIcngCzqtdGojeSMq0fA9Xr9BkgMlHQCAgAA
X-Change-ID: 20241224-mdssdt_qcs8300-11b7883dc60b
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868577; l=3837;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=VwrLwk4N5aOftz1GVDh+AA1ziCxnQvYuCZX/YYBDOKc=;
 b=1WmW0bhbP5xfaqjbbMhKB06I5UIlLjV9IMVl46LAVd3SYBivhnMWkL9pgxnSZXPvVvQTYJ05A
 9miTctBFDjiAOvgSC4O8us/or2TIqkwHjHnq9qgMJzzYs3CaV7lC7pb
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6889e929 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4DmgWqGqtajQqN1ybTwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rVs3jOtblvEJy4lZ6_8We01v0rqBoXav
X-Proofpoint-GUID: rVs3jOtblvEJy4lZ6_8We01v0rqBoXav
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2NyBTYWx0ZWRfX1+r/HRHnB0sR
 nB9JoQfu9N8ditLXlDv0thNF4D8nMAStKLwPp/ApJ0cLa2fSIhpz7YcKkbpHnreqABaQ4VRps0x
 tkRV58BQErMmvqW80lqzT5ivQis7hhtrR9JiuM+2lScBU3tZ0AeEXuIi7+BkrFz8cdjfHUmebyi
 bCLAe6PJUjX5xbstxcfg+qRZc6d56eGE8RjCRQI/ykcJKWFEnrkgx6DhJ+j9lvTzDOvTOhXkOmG
 07YCLL4aXE6UszDoJKwyZUin8CetPYLWQh6ebXfTqGnWjMSbs52WLGCj893C71J5DbroGJyhHqI
 /PHaPc9TPc+SP+Hghyv37T0bkIWtb9fwrT2KvAamWkHQUA9XO3aQ4ChfHcX2oI2I6lECiv1r6XR
 c4MXNrpvCPf+dE4TyfmWpOV2dzpC6vbDS93TON3ReusMTS8+Sfigk8M+LD2B5nCh6pNaVnhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300067
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
Changes in v5:Fixed review comments from Krzysztof, Dmitry.
- Rebase to next-20250717.
- Change DP compatible to qcs8300-dp due to add 4 streams support.
- Add QCS8300 UBWC config change due to rebase.
- Add 4 streams clk and phy in the mdss yaml.
- Link to v4: https://lore.kernel.org/r/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com

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
---
This series depend on 4 pixel streams dt-binding series:
https://lore.kernel.org/all/20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com/

and separate eDP PHY binding:
https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/~

---
Yongxing Mou (5):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      drm/msm: mdss: Add QCS8300 support
      soc: qcom: ubwc: Add QCS8300 UBWC cfg

 .../bindings/display/msm/dp-controller.yaml        |   2 +
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |  11 +
 5 files changed, 308 insertions(+), 5 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
prerequisite-message-id: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
prerequisite-patch-id: 4782272bb7d2403e2f2dbf762586d4570e6b6ba6
prerequisite-patch-id: cfdd5c37d38b2a4f1386af4021ba3920c6d8dcf8
prerequisite-patch-id: c874bf64aec8cb2ff0bc91051620ac771cbeeeea
prerequisite-patch-id: 63defbfb812a2f9c6365a98538421aea374e0e13
prerequisite-patch-id: 0ffa9d544d516d4e14700229a4ab6a9c7751823f

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>

