Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6F79C707A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 14:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E4C10E6EF;
	Wed, 13 Nov 2024 13:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YVETseHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018C510E205;
 Wed, 13 Nov 2024 11:52:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD7usm5030530;
 Wed, 13 Nov 2024 11:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=0BfW0mwwK/RB1gSytGAIpA
 He7yoP9uFrYSI4uI6UUZ4=; b=YVETseHFCG8cug3yuQ0XMx2vgGGMoiQ9BSrcpU
 LWSkFkCpEOdGmhoPP2T1j9T9p+Q1xFTUSAUxNy5cc8x/x/YyoYUGOYuWk0+vqU+n
 yfZoei37uOdHTblWQ1rWs+AGxlhDeCVPo4iloZThaYVaKJitiSj0bZSBc+k27X2F
 SrlQzdnEdAVv6Y4r0orZnibUBijEp44OhlZard+lgvuzkc0GXYS+LIVMwlE552xf
 tZ4fOYrg5vC/CDaSTZWBOxZroZjLobCI+bD+ca0qV05M8GBDCn5XhmMNTKQZCXs8
 yKV8ml2UOCL0wz8pnmdfSvVIoh8dHmHH/1t40rAV/4BchM8A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vr5y0k41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2024 11:52:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADBqkNv023365
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2024 11:52:46 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 03:52:39 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Subject: [PATCH v2 0/9] Add display support for QCS615 platform
Date: Wed, 13 Nov 2024 19:51:42 +0800
Message-ID: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOKSNGcC/5WS3YrbMBCFXyX4ugoa/dkOpfQ9lsXImlEjaluJ5
 Jhul7x7ZSdL6c9FcnkG5jujo/NeZUqBcnXYvVeJlpBDnIoQn3aVO9rpG7GARVeCCwUAgllEhiG
 fBvvG8uV0imlmPiZ2dtmAZmU+FzkyUytC4xoCzatCOyXy4cfm9PJ604nOl2I434bVSDnbzfCw+
 7z5cSE+uG6I7jvDFBZKbFFMMIk1GIsc26b+WkAuTG7v4vhldXuKpZ5lAVdrDl2Ywhzs0N1z6Mr
 Du7vHohlnLSI1WPcN7/lDWM2lAF7vW61FOWtd6c7nn8d4eWS9ABolJeyFNsooyeBGWNBi+cvw0
 AnNR0rjeAvKxWlOcRjWrGR5VI2yFyik9uifJuLMpoiU2QIF1QtjWmcdN0L9g+ptJlbEGObDrhV
 tT9b3VFvnSApTlyUATSCJS+8Naa5VY6u1WseQ55jetk4vsHXrHpB8uL7bfeTqFkTrlVd/3Le5L
 OI3mcOtEHfyfwuxAhV5Cy1gj/gX8Hq9/gKb8v4YjAMAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731498757; l=6520;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=46/Ey+YEHt4Pvbsre6EY4dkMGTbt3Z0H9At3392O4dk=;
 b=6GdQhj6KMBQNAYuNIJNpiHQtoIuTK338b3Rw1IX8rd3mzJvdK4uAC7VccJSAl1JZWAAz5lxml
 Z0Ysi0MYuRwDL6FkZ8LWdNt9Ra/0Cu9ZSIOHi8acoyI/0rSEUOvqFs7
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DuMNqlqN2PUdarahakdHA5NO9rCAFoqr
X-Proofpoint-GUID: DuMNqlqN2PUdarahakdHA5NO9rCAFoqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=963 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130102
X-Mailman-Approved-At: Wed, 13 Nov 2024 13:23:55 +0000
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

Note:
items still being confirmed
- missing reg_bus_bw
- missing refgen supply

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
Changes in v2:
- Added b4 check and check passed
- Added necessary blank line
- Added correct S-o-B
- Added correct maintainer
- Added correct To&Cc
- Added QCS615 DP controller comment in commit message
- Added comments for dsi_dp_hpd_cfg_pins and dsi_dp_cdet_cfg_pins
- Added missing port@1 for connector
- Changed patch order
- Changed 0 to QCOM_ICC_TAG_ALWAYS for mdss interconnects
- Changed 0 to GPIO_ACTIVE_HIGH for GPIO flags
- Fix indent issue
- Fix sorted issue
- Moved anx_7625 to same node
- Moved status to last
- Renamed dsi0_hpd_cfg_pins to dsi_dp_hpd_cfg_pins
- Renamed dsi0_cdet_cfg_pins to dsi_dp_cdet_cfg_pins
- Renamed anx_7625_1 to dsi_anx_7625
- Removed extra blank line
- Removed absent block
- Removed merge_3d value
- Removed redundant annotation
- Removed unsupported dsi clk in dsi0_opp_table
- Removed dp_hpd_cfg_pins node
- Splited patch according to requirements
- Link to v2: https://lore.kernel.org/r/20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com

---
Li Liu (9):
      dt-bindings: display/msm: Add QCS615 DSI phy
      dt-bindings: display/msm: dsi-controller-main: Document QCS615
      dt-bindings: display/msm: Add QCS615 MDSS & DPU
      drm/msm/dpu: Add QCS615 support
      drm/msm: mdss: Add QCS615 support
      drm/msm/dsi: Add support for QCS615
      arm64: dts: qcom: Add display support for QCS615
      arm64: dts: qcom: Add display support for QCS615 RIDE board
      arm64: defconfig: Enable SX150X for QCS615 ride board

 .../bindings/display/msm/dsi-controller-main.yaml  |   1 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
 .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 118 +++++++++
 .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 252 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 109 +++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 186 ++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 263 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |   7 +
 17 files changed, 982 insertions(+), 1 deletion(-)
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

