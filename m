Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA539D5C9C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B5510E22D;
	Fri, 22 Nov 2024 09:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AEYLFD6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A451D10E22C;
 Fri, 22 Nov 2024 09:58:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM86MwS015290;
 Fri, 22 Nov 2024 09:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Oo7HikWZjO7o4h8uvE+hBs
 svbZ8a0Y9HAjNRBm40WBc=; b=AEYLFD6b/ub2x+7u9ki5P2oe+NnhIz46nGyZ23
 iTMy0KvCvufbCd89ztRohxYjzfupHXqWY1a7HhHCQPjBmI6LdnolwsU3p8lfI91e
 23SfO8HG1C/Jxby+8210vGJfLLA6vL25a3tv+rfA2QZZJ9QnCaJWn3bqWj1JBlGa
 SWRGIQkS/CBtMJ2SKwpvZ7I9Xma7K0nB77RJyeSYgKTVapzJOnipUmejEyp6Z+Q2
 XarQ/pObcQKTV3Ki5mQGoddpsEHIaBkqoYeRjwwLcxzMmgfbwKiRmJ47eO5t/3WZ
 sEeUy1impFOX4uNbzlF/XrqdPV6MDSA1x8pgjXpkjhy3BjwQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320y9krgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2024 09:58:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM9whGv007649
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2024 09:58:43 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 01:58:36 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Subject: [PATCH v3 0/9] Add display support for QCS615 platform
Date: Fri, 22 Nov 2024 17:56:43 +0800
Message-ID: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGlVQGcC/52S3YrbMBCFXyX4ehX0LzuU0vdYFiNrRo2obSWSY
 7pd8u6V7SwltBdJL2dgvnN0dD6qjClgrg67jyrhHHKIYxnEy65yRzt+RxKgzBWnXDLGOLEABEI
 +9fad5MvpFNNEfEzk7LJmipT9VMaBaCMRtKuRKVoV2imhDz9Xpde3bU54vhTBaVtWA+ZsV8HD7
 suqRzn/5Lo+uh8EUpgxkVkSTgQYpi1QaGrzrYBcGN3exeHrovYUSz7LYlQuObRhDFOwfXvLoS0
 Pb28asyKUNABYg+lq2tGHsIoKzqjZN0rxYms5ac/nX8d4eeS8AGopBNtzpaWWgrCNMIOF8pfhI
 Qv1Z0rDsAXl4jil2PdLVqI8yoDoOHChPPiniTCRMQJmMrOC6rjWjbOOai7/QnU2IynDEKbDruF
 Nh9Z3aKxzKLg25YgxhUwgFd5rVFTJ2lZLtY4hTzG9r52e2dqtW0Di4fqu/tCZhvHGSy/v/K0qM
 /9DpmwrxI38z0IsQInesoZBB3APfNn9h0VeiLw2Ajvtu1o39xav1+tv7Z7s4d4DAAA=
X-Change-ID: 20241112-add-display-support-for-qcs615-platform-674ed6c8e150
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, "Li Liu" <quic_lliu6@quicinc.com>,
 Fange Zhang <quic_fangez@quicinc.com>,
 "Xiangxu Yin" <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732269514; l=7370;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=hWA2D4wHps5pueio3pYCUA1Rqom0bBEVdMwteSrKAFs=;
 b=VX+AvZl0xeQt3wxbfrrHLOeXezFOI+qIgfmeOuw82KJe1LMivhg1oXJhDRm/fYyv2BmRQaVjV
 GyihA1icA6HDwQCQKyBYiFU6zKyenFkuuTem1QMEd6Haoy/VGiFu7BU
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XGYdlXSlf7zHHntipg-iiUssa7r6MNeS
X-Proofpoint-ORIG-GUID: XGYdlXSlf7zHHntipg-iiUssa7r6MNeS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220084
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

This patch series depends on below patch series:
- rpmhcc
https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-2-3d716ad0d987@quicinc.com/
- gcc
https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com/
- base
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
- Apps SMMU
https://lore.kernel.org/all/20241105032107.9552-4-quic_qqzhou@quicinc.com/
- I2C
https://lore.kernel.org/all/20241111084331.2564643-1-quic_vdadhani@quicinc.com/
- dispcc
https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/
- dispcc dts
https://lore.kernel.org/lkml/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
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
- Link to v2: https://lore.kernel.org/r/20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com

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

 .../bindings/display/msm/dsi-controller-main.yaml  |   1 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      | 113 +++++++++
 .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 250 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  76 ++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 186 ++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 263 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   4 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |   8 +
 16 files changed, 928 insertions(+), 2 deletions(-)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241112-add-display-support-for-qcs615-platform-674ed6c8e150
prerequisite-message-id: <20241022-qcs615-clock-driver-v4-2-3d716ad0d987@quicinc.com>
prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
prerequisite-message-id: <20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com>
prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
prerequisite-message-id: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae
prerequisite-message-id: <20241105032107.9552-4-quic_qqzhou@quicinc.com>
prerequisite-patch-id: aaa7214fe86fade46ae5c245e0a44625fae1bad3
prerequisite-patch-id: 4db9f55207af45c6b64fff4f8929648a7fb44669
prerequisite-patch-id: 89ce719a863bf5e909989877f15f82b51552e449
prerequisite-message-id: <20241111084331.2564643-1-quic_vdadhani@quicinc.com>
prerequisite-patch-id: 3f9489c89f3e632abfc5c3ca2e8eca2ce23093b0
prerequisite-message-id: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
prerequisite-patch-id: 748a4e51bbedae9c6ebdbd642b2fd1badf958788
prerequisite-patch-id: 72a894a3b19fdbd431e1cec9397365bc5b27abfe
prerequisite-patch-id: da2b7a74f1afd58833c6a9a4544a0e271720641f
prerequisite-patch-id: 40b79fe0b9101f5db3bddad23551c1123572aee5
prerequisite-patch-id: cb93e5798f6bfe8cc3044c4ce973e3ae5f20dc6b
prerequisite-patch-id: 13b0dbf97ac1865d241791afb4b46a28ca499523
prerequisite-patch-id: 807019bedabd47c04f7ac78e9461d0b5a6e9131b
prerequisite-patch-id: 8e2e841401fefbd96d78dd4a7c47514058c83bf2
prerequisite-patch-id: 125bb8cb367109ba22cededf6e78754579e1ed03
prerequisite-patch-id: b3cc42570d5826a4704f7702e7b26af9a0fe57b0
prerequisite-patch-id: df8e2fdd997cbf6c0a107f1871ed9e2caaa97582
prerequisite-message-id: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
prerequisite-patch-id: bcb1328b70868bb9c87c0e4c48e5c9d38853bc60
prerequisite-patch-id: 8844a4661902eb44406639a3b7344416a0c88ed9

Best regards,
-- 
fangez <quic_fangez@quicinc.com>

