Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7119F099C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A7510EFA0;
	Fri, 13 Dec 2024 10:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TipA1kqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6DA10EFA0;
 Fri, 13 Dec 2024 10:36:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDADeZL006135;
 Fri, 13 Dec 2024 10:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=KzcnJU/yNMnn7D6lBfjSk1
 CYG5+7awuwww2XHLNxjWc=; b=TipA1kqyzMMPaDTboNP+nIcx6CF1BSn/Pw7ggN
 aJELLf3ZsziOfqgcmD3crmDFQKx6isyUyirSH7/euvwLAZFckaOsQ8VOE3WVnFGr
 epUfaRTHI5Uh+KQN21HHvECvKw7OVdZtR3qMr1IKKuFttsmnGuIAdWHtgzXoyZnt
 +uw7NVGY/NRnWfdHqSPEhsIiA5QiifQQlzZLNb5x/f8rKc14Q09fgJQyAnz20T2/
 3FBxiC9uXcuq6bgtsG3f5Soqf6Ec2ygpW32d30prjStObxZ0zBQG+oFOkZmzYE0c
 ss622eMy66KYDY+T03ahwt6JkrYEjYwtUkpLDdDVp4ppMNiA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g6xustsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 10:36:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAaFVc023255
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 10:36:15 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:36:08 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v2 0/4] Devicetree changes for QCS615's GPU
Date: Fri, 13 Dec 2024 16:05:42 +0530
Message-ID: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4NXGcC/5WS3YrbMBBGXyX4uhOkkfXjUErfoyxG1kiJWNtKJ
 Md0u+Tdqzi70JZCt5efYI7OSN9rU3yOvjSH3WuT/RpLTHMN+GnXuJOdjx4i1dwgw5ZzlHBxRXE
 Jx/MVaIFg3UDGOsFNaOrMOfsQv2+8b0+PnP3lWrHL47AZbPHg0jTF5bATzA8qsIGZgYtAKL3la
 IVVwTJrZMcl75jj7o6efCl28znsPj90WAuWqI9zXKId+3I9n1Ne+pBy/6a5SmihI/KG9GDqRV+
 rjIuz21eFL3/HMsT3Ld2Y3DNQjqvPsLYgQJDmyhKjzuh/s1hXea3opNnXp6vYOtDn0R6PL+X0A
 RXOzLvKND1sXJqXnMbxLiRAgyYxIKGQgcJ/E+sPzol8gZUDhwGV6px1TGH7ERQi022HuEfDpai
 Abb3L5ccpXX+fv1fhFMuS8svWtJVvXXjDqD9KVWUYWKO1wU4rsvQrrHm63W4/AemJwNK3AgAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>,
 <20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com>,
 <20240924143958.25-2-quic_rlaggysh@quicinc.com>,
 <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>,
 <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>,
 <20241122074922.28153-1-quic_qqzhou@quicinc.com>, Jie Zhang
 <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734086167; l=3591;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=AAySlqWRU7tneaj1wMOloOL1qA7eTfg3gG+BsQ+phnw=;
 b=s8iQWvXSQixcSWO/+63rvRUISqmffrDhqgDtVODAz47jticRM5YWAd4D2/KdLMZvSx2YFph5m
 Sy30nk3wFWjB8p3MnlHKOM9UygQiG/jAqdUKyslEZsjSK01REdXBHQy
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Dxy_7VDzwEn-BdlpJTt-75N0srBmsXTX
X-Proofpoint-GUID: Dxy_7VDzwEn-BdlpJTt-75N0srBmsXTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130073
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

This series adds support for Adreno 612 to QCS615 chipset's devicetree.
DRM driver's support was posted earlier and can be found here:
	https://patchwork.freedesktop.org/patch/626066/

Patch#1 & #2 are for Rob Clark and the other 2 for Bjorn

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
Changes in v2:
- Completely describe RGMU in devicetree and also add necessary binding
documentation (Konrad, feedback on the driver patch)
- Remove smmu_vote clk from clock list (Konrad)
- Add R-b from Dmitry
- Link to v1: https://lore.kernel.org/r/20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com

---
Akhil P Oommen (2):
      dt-bindings: display/msm: gpu: Document A612 GPU
      dt-bindings: display/msm/gmu: Document RGMU

Jie Zhang (2):
      arm64: dts: qcom: qcs615: Add gpu and gmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  7 +-
 .../devicetree/bindings/display/msm/gpu.yaml       | 36 +++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  8 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 88 ++++++++++++++++++++++
 4 files changed, 137 insertions(+), 2 deletions(-)
---
base-commit: 30eb6f0b08b13fd25ea12a3a6fa0a85915190c1c
change-id: 20241125-qcs615-gpu-dt-facbd8ac318f
prerequisite-message-id: <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>
prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-message-id: <20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com>
prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
prerequisite-message-id: <20240924143958.25-2-quic_rlaggysh@quicinc.com>
prerequisite-patch-id: 0e224a7310d36e9a633d57c4a177ff24c1e8e767
prerequisite-patch-id: 3c73bafb074ea339d387a6aa39e5362c8775596d
prerequisite-message-id: <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>
prerequisite-patch-id: df8e2fdd997cbf6c0a107f1871ed9e2caaa97582
prerequisite-patch-id: b3cc42570d5826a4704f7702e7b26af9a0fe57b0
prerequisite-patch-id: 125bb8cb367109ba22cededf6e78754579e1ed03
prerequisite-patch-id: 8e2e841401fefbd96d78dd4a7c47514058c83bf2
prerequisite-patch-id: 807019bedabd47c04f7ac78e9461d0b5a6e9131b
prerequisite-patch-id: 13b0dbf97ac1865d241791afb4b46a28ca499523
prerequisite-patch-id: 40b79fe0b9101f5db3bddad23551c1123572aee5
prerequisite-patch-id: cb93e5798f6bfe8cc3044c4ce973e3ae5f20dc6b
prerequisite-patch-id: da2b7a74f1afd58833c6a9a4544a0e271720641f
prerequisite-patch-id: 72a894a3b19fdbd431e1cec9397365bc5b27abfe
prerequisite-patch-id: 748a4e51bbedae9c6ebdbd642b2fd1badf958788
prerequisite-message-id: <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>
prerequisite-patch-id: 8844a4661902eb44406639a3b7344416a0c88ed9
prerequisite-patch-id: bcb1328b70868bb9c87c0e4c48e5c9d38853bc60
prerequisite-message-id: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
prerequisite-patch-id: c71c7897d6f250b381f7a9ac66ec58f4a10d49d6
prerequisite-patch-id: 50223f2370a7ae8053b164fa5219a1690d7e4567

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

