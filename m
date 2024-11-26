Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F119D9927
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 15:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858D210E40A;
	Tue, 26 Nov 2024 14:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bpw74h2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E33C10E408;
 Tue, 26 Nov 2024 14:09:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQDweju019861;
 Tue, 26 Nov 2024 14:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=qLa/jexMcmZaGRBDyAgRLR
 o8c9MmhNNi6oP+B9/cXnk=; b=bpw74h2DSG4MQmlxPQcCQP+jjph1isFUrRBE8q
 12pZxItjkFAzxON1xfaNIcr0UumG0ZpEZL02C5EOjUKzORRGmLRGpjhQkUNSksex
 s3JiHLMEFGcmYXC/0n5cNRvtP6cN7iBZc2JCCzCCGxvzKpUU4lbPSs7T2xhrBb/E
 FAmu/0D9eqApu9bscEomL1dO1eMkxTgIKrnzcg4Z7gUcj5/rnDtZUjpHmLj8IIdZ
 N2Rs9r/TH+BSb7ghOuBYUrKgQnxg9qWQ0zFwt9ZwwWfVsvqcIJ1kH29AEK0fjUcO
 rX1KDHpwv+MtSTJ5rEHz7IMT9zBkJ7h6X6cNbEHLyf29rEPw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4358399cud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2024 14:09:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQE9dmV028166
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2024 14:09:39 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 06:09:33 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH 0/3] Devicetree changes for QCS615's GPU
Date: Tue, 26 Nov 2024 19:36:46 +0530
Message-ID: <20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbVRWcC/5WR3WqEMBBGX0W87iz5MRqXUvoeZZGYSXZD1Wii0
 nbZd2927V4UCm0vv4HvzJnknEcTnIn5PjvnwawuOj+kQB+yXJ/UcDTgMOWcEVZQygRMOpZUwHF
 cAGewSrcoleZU2jx1xmCse7vxXg5bDmZaEnbehnmrogHt+97N+4wT05aWtES2lFtkwijKFFelV
 URJUVNBa6KpvqJ7E6O6+eyzx02HFKAQGze42amuics4+jA31ofmS3MVUECNaCRWrUyLnpOMdoP
 eJYWnn7GEsfuVuvP6FTC41QRYC+DAsaKlQoK1rH5nkTrxCl4LuUtPl7Cp0IROHY/v8fQHFUrkX
 aXvNxvthzn4rrsKcaigQt4yZFxYtP8mph8cPJoIKwUKLSvLWitNSlb8BcUYqYqasR2TVPAEuJ0
 3TR8nv3zvHy6XTxvaqx1qAgAA
X-Change-ID: 20241125-qcs615-gpu-dt-facbd8ac318f
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
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732630173; l=3156;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=d5iHBiGGN5jBz6LgxCxlnJnrYaoDxXw7Uj57uUApwcU=;
 b=mvsPszG7J+F4lxa0BgQdH6pj/A+l/uewjtgFLL3wNNJKjsJaadH8ZugkGU4/OLZH84VXs/5nE
 65pGkw3XaolBs1GG0ER8HfNEcPPUGjpVNQ9+eIdT+knK8ydcZ0d/kPn
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BBsP1mWnJii_gDhM9-3seYt7Vc1UhS02
X-Proofpoint-ORIG-GUID: BBsP1mWnJii_gDhM9-3seYt7Vc1UhS02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260114
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

Patch#1 is for Rob Clark and the other 2 for Bjorn

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
Akhil P Oommen (1):
      dt-bindings: display/msm: gpu: Document A612 GPU

Jie Zhang (2):
      arm64: dts: qcom: qcs615: Add gpu and gmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

 .../devicetree/bindings/display/msm/gpu.yaml       | 28 ++++---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  8 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 86 ++++++++++++++++++++++
 3 files changed, 110 insertions(+), 12 deletions(-)
---
base-commit: 30eb6f0b08b13fd25ea12a3a6fa0a85915190c1c
change-id: 20241125-qcs615-gpu-dt-facbd8ac318f
prerequisite-message-id: <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae
prerequisite-message-id: <20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com>
prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
prerequisite-message-id: <20240924143958.25-2-quic_rlaggysh@quicinc.com>
prerequisite-patch-id: 3c73bafb074ea339d387a6aa39e5362c8775596d
prerequisite-patch-id: 0e224a7310d36e9a633d57c4a177ff24c1e8e767
prerequisite-message-id: <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>
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
prerequisite-message-id: <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>
prerequisite-patch-id: bcb1328b70868bb9c87c0e4c48e5c9d38853bc60
prerequisite-patch-id: 8844a4661902eb44406639a3b7344416a0c88ed9
prerequisite-message-id: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
prerequisite-patch-id: 50223f2370a7ae8053b164fa5219a1690d7e4567
prerequisite-patch-id: c71c7897d6f250b381f7a9ac66ec58f4a10d49d6

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

