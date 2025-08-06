Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64AB1BF22
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 05:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DB710E713;
	Wed,  6 Aug 2025 03:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CH4KyWXF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6A710E184;
 Wed,  6 Aug 2025 03:17:54 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761ekpH008619;
 Wed, 6 Aug 2025 03:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=yOT2CnCbTagf5bPAOGbBwo
 kc8ZhH7hgxro3rWIgHyoM=; b=CH4KyWXFRAavuJiruaL9DggzB1P8ROhTfXEQId
 3ZIU/shjfLxNfQA2USfxSLvGr2jgTnz+XqbLCbXVV4clORtCa5zZ1sYxwIVBkeCO
 1YTMJBPk6D1SYdYSap7dZKw6n1RtwK3PZ8vd6e/wiuMAXAEe1W1+BibWWxR+4LwJ
 QsDzVsa7pVxDG7AQ+jz1lmffJ6Ub9m3RmmnjkCpb55u52LRfYJfgc2xAHC7b0S0l
 UW9t8chFsu+sQyuWDqqWNzZSlAY16vgJnjle10MeTTaiMVWLVwEfazSbMztJBCh9
 FKgmtnvWQFMsqJSo4LrqXemEf2CfSsy9qiFBipj2EcHJE2dQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy897tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Aug 2025 03:17:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5763HgUI028449
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Aug 2025 03:17:42 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 Aug 2025 20:17:36 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH v6 0/6] Display enablement changes for Qualcomm QCS8300
 platform
Date: Wed, 6 Aug 2025 11:16:44 +0800
Message-ID: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACvJkmgC/23R227CMAwG4FdBvV5QEudUNE28xzRVObgQaW2hK
 dUQ4t2XAttg5dKW/i+2cyoS9hFTsVqcih7HmGLX5kK9LAq/te0GSQy5LjjlgnEuSBNSCkO198k
 ApYQxp42B4BV1RQ7teqzj1wV8/7jWPe4P2R2uzaLBlOzFXS1eMyupzpDmmsslEwCgskpyxFfHr
 t003WE9FbH1S981b9MjTwimSdhVTRoqF9sQ200iIxBKNPdIDTdSU1h3KS33B/uZneYXczYhmTp
 xWC3ylkhLFEK4wB1VFrEMrIYatQMGXlseauZcMe22jWno+uPldiO/LHc7k/x/ppHnWRj13tWA0
 vjyfqdpiltQPQ1a7ywNTgJ4fAhOU4zw87KkjMEMmK6gvMEShCwVpXNA3AGczgAxja6MRm0EZ1z
 OAfkH5L+cATIDLk9gQTqHQT0C5/P5G9vOJMmGAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754450254; l=4482;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=zyEHq+SsGfd1r8KY8nj2AXUlL7cvjBDfG/yNO39pRLI=;
 b=oiVSCXOJkKybOHTuUT9fj8sJF81hZezmmcICcPKT40MsLM9TUs3nlJ0La5kAOqDyXKARmjBTX
 pbTdLtw/KZgBc3j5Q84qMzce+tbIguNjP+xVtr7vHfl7Uw7GEI97KLf
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1phOKCwgY35JWdeO6CEZk4oCFbKEG7uC
X-Proofpoint-ORIG-GUID: 1phOKCwgY35JWdeO6CEZk4oCFbKEG7uC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX52jHx08skMla
 5xnjfUoLlzXPTr6FNXybFpXuIWUvJAO/Qd47qAILmmkhaz99Pgr+v8AxpBYhVlJWSwZGMVZ8Axv
 CuADYKIXuWUaRPYwsLEVVdBoSGuoiP1k2UqL94VbQjXfjjTZ5BAjj3ylWM+qxQzAqbsXLBCNMxd
 fSwJFWddkJnY838EJqI9NSkenAAtoorbziW4SrN8YQ0S2esO6vC4Jjok5TpOzRSg7EJEsdbZPqG
 Na029A0cfUslGw+aQ5pjv+gy2ZH1IrigXCXhfcoJqk3zusxB90JciEmZoAjTfSixYrfG1Pfdvjx
 RBTU2VvE2fInSmbRFlFdiIzRtdCGKm0Zo0J9WBdSpfwgzLIbTK+axDyQlvkzCxQLGrn2PjIHeE3
 N3392xi+
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6892c957 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=iD6vXzWbp0dc2yQZ6nwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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
Changes in v6: Fixed review comments from Konrad, Dmitry.
- Rewrite commit msg in dp-controller dt-binding change.[Dmitry]
- Optimize the description in MDSS dt-binding.[Dmitry]
- Pass the sc8280xp_data as fallback in the UBWC change.[Konrad]
- Add the DP controller driver change.
- Link to v5: https://lore.kernel.org/r/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com

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
https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/

---
Yongxing Mou (6):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      drm/msm: mdss: Add QCS8300 support
      soc: qcom: ubwc: Add QCS8300 UBWC cfg
      drm/msm/dp: Add DisplayPort controller for QCS8300

 .../bindings/display/msm/dp-controller.yaml        |   2 +
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 282 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 6 files changed, 297 insertions(+), 5 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
prerequisite-message-id: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
prerequisite-message-id: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
prerequisite-patch-id: 4782272bb7d2403e2f2dbf762586d4570e6b6ba6
prerequisite-patch-id: cfdd5c37d38b2a4f1386af4021ba3920c6d8dcf8
prerequisite-patch-id: c874bf64aec8cb2ff0bc91051620ac771cbeeeea
prerequisite-patch-id: 63defbfb812a2f9c6365a98538421aea374e0e13
prerequisite-patch-id: 0ffa9d544d516d4e14700229a4ab6a9c7751823f

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>

