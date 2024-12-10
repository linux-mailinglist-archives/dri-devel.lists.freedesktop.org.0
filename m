Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3829E9EA8F8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 07:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B7410E131;
	Tue, 10 Dec 2024 06:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BtV/7KkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C6B10E021;
 Tue, 10 Dec 2024 06:55:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9HtKoj024253;
 Tue, 10 Dec 2024 06:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ILnGMq/YFrokozpNPwUaxX
 PgTNYu2Etv9v6KilgcEBg=; b=BtV/7KkHd2WosM5gxLUv5XOE/Sh5yTdD1huy77
 k1456rZow/F6Kc6VJfgK4XELJOfz3nKvSiyhw/fDk7SwU/YMQm57jaToq5RLuY2+
 56U5EyR1N5tsG6O2/GrA0nTaTv+CB2DK7qPxdV32VCvBJmxQN57TMaHRLDfdzXoN
 PhHh7yO0Y15HjuXuL2zEmvuU18cfJ1DTR74s4E7xYpiKRBWbGQciav1JQbLFbbJ5
 TsJPWNIpoezi9ivFoGA5sepzkjlUsRIN5TQmn+vFUEjZusPaXHK8Feh5iCT6gsDa
 lcSpNBwJoU8zEmkEyLqd9oyHgJCnZOIE8pkZUBmPPk/szF9g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e5c7sn2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 06:54:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA6ssnd002815
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 06:54:54 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 22:54:48 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Subject: [PATCH v4 0/9] Add display support for QCS615 platform
Date: Tue, 10 Dec 2024 14:53:51 +0800
Message-ID: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHlV2cC/43OQU7DMBCF4atUXjMoM3ZSpyvugVCU2GNqicapn
 VpUVe6OUyIBYtPlm8X3z00kjp6TOOxuInL2yYexDPW0E+bYj+8M3pYtqCKFVLXQWwvWp+mjv0K
 6TFOIM7gQ4WxSgzWU+1zmCYgGzVor7fReFG2K7PznvfT6VvbRpznE6z2ccb1+NypUa6PbGt3W6
 ArabY2MUIFi12OLdrBWvZwv3vjRPJtwEiue6QdElA8/nanIpPeSh8YNumn/y/KXTPS4LIssa6q
 JZV+j47/ysixfBWLS2IsBAAA=
X-Change-ID: 20241209-add-display-support-for-qcs615-platform-22b8e8848f87
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Fange Zhang <quic_fangez@quicinc.com>, Liu Li <quic_lliu6@quicinc.com>,
 Xiangxu Yin <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733813685; l=5006;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=x1Oq9M6L775bMyJbxZD9/dZKHEwJiP0qzF5uyPwo+gI=;
 b=TJ7taYFc6Uf3ZgVYSPp3ixqXfn5T8qH8UaSXkOPGXsAvyKHQ2HH37zse1ebny0prgh0yBsdvj
 ro2FeQsYo2jBo4bYZR/1xT+M0fmJzvIZqehTkFph8wchyKby4EGTOGv
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8rQcqOrv5uNcp2351a_3uA4n32Wi3HId
X-Proofpoint-ORIG-GUID: 8rQcqOrv5uNcp2351a_3uA4n32Wi3HId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100051
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

This series aims to enable display on the QCS615 platform

1.Add MDSS & DPU support for QCS615
2.Add DSI support for QCS615

QCS615 platform supports DisplayPort, and this feature will be added in a future patch

Only dts part of this patch series depends on the following patch series
The other dependency patches have already been merged into linux-next
- dispcc
https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/
- dispcc dts
https://lore.kernel.org/lkml/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
Changes in v4:
- Add dp-connector node for anx_7625_out [Dmitry]
- Add missing qcom,sm6150-dsi-ctrl for dsi-controller-main.yaml [Krzysztof]
- Change VIG_SDM845_MASK to VIG_SDM845_MASK_SDMA for sm6150_sspp [Abhinav]
- Change DMA_SDM845_MASK to DMA_SDM845_MASK_SDMA for sm6150_sspp [Abhinav]
- Remove redundant annotation from sdm845_dsi_cfg [Dmitry]
- Remove redundant blocks from sm6150_intf [Dmitry]
- Update mdp_opp_table opp clk to correct value
- Link to v3: https://lore.kernel.org/r/20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com

Changes in v3:
- Add reg_bus_bw for sm6150_data [Dmitry]
- Remove patch for SX150X defconfig [Dmitry]
- Remove dsi0_hpd_cfg_pins from ioexp [Dmitry]
- Remove dsi0_cdet_cfg_pins from ioexpa [Dmitry]
- Remove tlmm node for ioexp_intr_active and ioAexp_reset_active [Dmitry]
- Remove qcs615_dsi_regulators and reuse sdm845_dsi_cfg [Dmitry, Konrad]
- Rename qcs615/QCS615 to sm6150/SM6150 for whole patch [Dmitry]
- Rename qcom,dsi-phy-14nm-615 to qcom,sm6150-dsi-phy-14nm [Dmitry]
- Rename qcom,qcs615-dsi-ctrl to qcom,sm6150-dsi-ctrl [Dmitry]
- Rename qcom,qcs615-dpu to qcom,sm6150-dpu [Dmitry]
- Rename qcom,qcs615-mdss to qcom,sm6150-mdss [Dmitry]
- Split drm dsi patch to dsi and dsi phy [Dmitry]
- Update yaml clocks node with ephemeral nodes and remove unsed include [Dmitry, Rob]
- Link to v2: https://lore.kernel.org/r/20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com

Changes in v2:
- Add QCS615 DP controller comment in commit message [Dmitry]
- Add comments for dsi_dp_hpd_cfg_pins and dsi_dp_cdet_cfg_pins [Dmitry]
- Add missing port@1 for connector for anx7625 [Dmitry]
- Change 0 to QCOM_ICC_TAG_ALWAYS for mdss interconnects [Dmitry]
- Change 0 to GPIO_ACTIVE_HIGH for GPIO flags [Dmitry]
- Move anx_7625 to same node [Dmitry]
- Move status to last in mdss_dsi0 [Dmitry]
- Rename dsi0_hpd_cfg_pins to dsi_dp_hpd_cfg_pins in ioexp [Dmitry]
- Rename dsi0_cdet_cfg_pins to dsi_dp_cdet_cfg_pins in ioexp [Dmitry]
- Rename anx_7625_1 to dsi_anx_7625 in ioexp [Dmitry]
- Remove absent block in qcs615_lm [Dmitry]
- Remove merge_3d value in qcs615_pp [Dmitry]
- Remove redundant annotation in qcs615_sspp [Dmitry]
- Remove unsupported dsi clk from dsi0_opp_table [Dmitry]
- Remove dp_hpd_cfg_pins node from ioexp [Dmitry]
- Splite drm driver patches to mdss, dpu and dsi [Dmitry]
- Link to v1: https://lore.kernel.org/r/20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com

---
Li Liu (9):
      dt-bindings: display/msm: Add SM6150 DSI phy
      dt-bindings: display/msm: dsi-controller-main: Document SM6150
      dt-bindings: display/msm: Add SM6150 MDSS & DPU
      drm/msm: mdss: Add SM6150 support
      drm/msm/dpu: Add SM6150 support
      drm/msm/dsi: Add dsi phy support for SM6150
      drm/msm/dsi: Add support for SM6150
      arm64: dts: qcom: Add display support for QCS615
      arm64: dts: qcom: Add display support for QCS615 RIDE board

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      | 108 +++++++++
 .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 245 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  89 ++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 181 ++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 254 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |   8 +
 16 files changed, 917 insertions(+), 1 deletion(-)
---
base-commit: 1031240d9d007339c6661dddfbe2efda0b3859e9
change-id: 20241209-add-display-support-for-qcs615-platform-22b8e8848f87

Best regards,
-- 
fangez <quic_fangez@quicinc.com>

