Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 185847301A6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 16:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFAE10E06B;
	Wed, 14 Jun 2023 14:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774B110E06B;
 Wed, 14 Jun 2023 14:22:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35EEGEwK008904; Wed, 14 Jun 2023 14:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=kSbbaWee/PlN9V2bg3yK1efNJc94MTdMdYRy8dTiyY0=;
 b=P3xHpKatcME6lmrcAo7Sb85jXo0WUrcDUVitVtcXBwT/zOc4+L2araiGoC3nDNh1BIdc
 hGPBy4YrFtOoeikm8auwTaFzDA45zCmQDuW7QRNNEYlStnGmnZ6/jNN7VQDqm0SH85WK
 dw6RBHxjCPhWa0osRfN8drW8gDtIItNZ9k0ZuA+ybZPuMSBMe5SEtiNjlH0pp0O+w6sb
 kAZilEj0TeqLBUs2co/G+BW8Zrd62DgTN/vuV6GQhJMlPHjxjozCA8E7tiIupic/Z7Y7
 dY1ySrHP85Z1MKjLlHXu7Ca10T7QPgvqzEKj87NCj2tb1H9iHzrFV1PxeSC02pK49JO2 kQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r6s3wu067-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 14:22:11 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35EEMAeh022915
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 14:22:10 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 14 Jun 2023 07:22:09 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: 
Subject: [PATCH v4 0/2] drm/msm/adreno: GPU support on SC8280XP
Date: Wed, 14 Jun 2023 07:22:02 -0700
Message-ID: <20230614142204.2675653-1-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: bWoIwAdXXEatKvW8W0Zgl6ZeCHUX_0dB
X-Proofpoint-GUID: bWoIwAdXXEatKvW8W0Zgl6ZeCHUX_0dB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_10,2023-06-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=511 clxscore=1011 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140124
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the A690 support merged in the drm/msm driver, this series adds the
DeviceTree pieces to make it go on sc8280xp.

Note that in order for the GPU driver to probe, the last change
requires (which is now in linux-next):
https://lore.kernel.org/linux-arm-msm/20230410185226.3240336-1-dmitry.baryshkov@linaro.org/

Changes since v3:
- Dropped DRM patch, as it has been merged
- Left status okay on gmu, gpucc and smmu nodes, disabled latter two in
  sa8540p for now
- s/adreno_smmu/gpu_smmu/ to get the GPU nodes adjacent in sa8540p

Changes since v2:
- Added missing opp level (both gpu and gmu)
- Corrected opp-level for highest gpu opp
- Added dma-coherent to gpu smmu

Changes since v1:
- Dropped gmu_pdc_seq region from &gmu, as it shouldn't have been used.
- Added missing compatible to &adreno_smmu.
- Dropped aoss_qmp clock in &gmu and &adreno_smmu.

Bjorn Andersson (2):
  arm64: dts: qcom: sc8280xp: Add GPU related nodes
  arm64: dts: qcom: sc8280xp: Enable GPU related nodes

 arch/arm64/boot/dts/qcom/sa8540p.dtsi         |   8 +
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  14 ++
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  14 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 175 ++++++++++++++++++
 4 files changed, 211 insertions(+)

-- 
2.25.1

