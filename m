Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23B79139BF
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 13:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D18810E04C;
	Sun, 23 Jun 2024 11:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TGig5pBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377C910E04C;
 Sun, 23 Jun 2024 11:08:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NAOpKW005802;
 Sun, 23 Jun 2024 11:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=zj91Xq7KorbNH+Z0iK+27U
 sO3l2jvEUsXJeRHl4se38=; b=TGig5pBOlv9YREULzuGWDyYIT03wJZ8HLXI21y
 3LIt44UMckLg2AOix+FKqphhAIAjxaMdxKwsh3XjMWcPMwwwzbq/TQOccEKih2sw
 rWvQhIKJOMeJ9RjA6xST4a9MEvCUIpx7gHd69S4kUpoav5GU0w2Vv5NWPUOHQN/l
 z635nvGcGjyv3414E62tos9cmV3TTqQ7riBRRD5R/UABHycLGobxD6ZQvMfSfgLz
 LF9bTJG5L4V1ld4ixo0Xk6oJxhnPIpDV6TCSqS8zQ2VZM1xwP5ntaC72hK7+xzzy
 n0DVNgkC+w0XGISjqMz6OrIEOtmaNgKFeEt7RVCTtp0hJ1ZQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaestam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2024 11:08:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45NB8TjY001719
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2024 11:08:29 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Jun 2024 04:08:23 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Sean Paul <sean@poorly.run>, Thomas Zimmermann
 <tzimmermann@suse.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/3] Support for Adreno X1-85 GPU
Date: Sun, 23 Jun 2024 16:36:27 +0530
Message-ID: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: x5r5Kx23Oeooa3OCSVioykwlvMhkVPWc
X-Proofpoint-GUID: x5r5Kx23Oeooa3OCSVioykwlvMhkVPWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406230088
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

This series adds support for the Adreno X1-85 GPU found in Qualcomm's
compute series chipset, Snapdragon X1 Elite (x1e80100). In this new
naming scheme for Adreno GPU, 'X' stands for compute series, '1' denotes
1st generation and '8' & '5' denotes the tier and the SKU which it
belongs.

X1-85 has major focus on doubling core clock frequency and bandwidth
throughput. It has a dedicated collapsible Graphics MX rail (gmxc) to
power the memories and double the number of data channels to improve
bandwidth to DDR.

Mesa has the necessary bits present already to support this GPU. We are
able to bring up Gnome desktop by hardcoding "0xffff43050a01" as
chipid. Also, verified glxgears and glmark2. We have plans to add the
new chipid support to Mesa in next few weeks, but these patches can go in
right away to get included in v6.11.

This series is rebased on top of v6.10-rc4. P3 cherry-picks cleanly on
qcom/for-next.

P1 & P2 for Rob, P3 for Bjorn to pick up.


Akhil P Oommen (3):
  dt-bindings: display/msm/gmu: Add Adreno X185 GMU
  drm/msm/adreno: Add support for X185 GPU
  arm64: dts: qcom: x1e80100: Add gpu support

 .../devicetree/bindings/display/msm/gmu.yaml  |   4 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 195 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  19 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  14 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   5 +
 6 files changed, 235 insertions(+), 8 deletions(-)

-- 
2.45.1

