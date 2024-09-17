Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2038997B4BE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 22:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DF310E0E9;
	Tue, 17 Sep 2024 20:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZQ8NpK79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2271B10E0E9;
 Tue, 17 Sep 2024 20:39:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HI3REV031256;
 Tue, 17 Sep 2024 20:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=FBYsgowN36zClN8wGKTrOi
 Hp8mB6WDnMn8s5Z21bSpg=; b=ZQ8NpK79NTEfn3f9pMAQxyZJG/UIUubIpkW44X
 DS+jdFDWMxpzRyORxBNWSamOR1K4/iZ6zyXKTCJ1rGVewge8geb2A4B2R34e27FI
 Q9B2RzOxRhFb0Q9cXBVB1L6veHn+GI7fumOvkmgyKtmdvPVfiI7344PFuMXn2C1w
 ICAMs6dQverHizfocA+JpTtJZscXw/AewwTAGDRWOsyj1JK9o4ro5DVhRSzKnSFa
 iInMGn03PZsciCAmOrOmYJZc+LqleJvQjrNe5sdmJ9B4uH9omDDSZU0YkeZrZ6ML
 /8vBz/o5rMW9F+W3htE5wt1dAfUhuXlmZYr6eVbsWSujdGAg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hffy21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2024 20:39:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HKdAAn032446
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2024 20:39:10 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 13:39:04 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH 0/3] DRM/MSM: Support for Adreno 663 GPU
Date: Wed, 18 Sep 2024 02:08:40 +0530
Message-ID: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDo6WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0Nz3UQzM2Pd9IJS3eLSgoL8ohLdJEMTc9NkCyMLMwMzJaC2gqLUtMw
 KsJHRsbW1AHYh7FpiAAAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726605543; l=2241;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=X3Klkl00DVZJKqB8dgiYqPRMiamn6rmCcwbo1LgCf1o=;
 b=M2XfbCAhUtDRy3u6yuCDEWuHhCfWw1Ll7QXcdDWf4w/ghHSSW/SQMR3PazogiGi7ibD6M8Xqd
 gGRP5dKMs4mCKz2GkV6VA8V+gt1VsCIWb4vgrGVhuW+WF/Ke22gYJUM
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Y2DWKw2Tm6M-jHVOYTnRQOgAQKGdYmyT
X-Proofpoint-ORIG-GUID: Y2DWKw2Tm6M-jHVOYTnRQOgAQKGdYmyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170147
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

This series adds support for Adreno 663 gpu found in SA8775P chipsets.
The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
	1. gmu/zap firmwares
	2. Recommended to disable Level2 swizzling

Verified kmscube with the below Mesa change [1]. This series is rebased
on top of msm-next.

Patch (1) & (2) for Rob Clark and Patch (3) for Bjorn

[0] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31211

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
Puranam V G Tejaswi (3):
      drm/msm/a6xx: Add support for A663
      dt-bindings: display/msm/gmu: Add Adreno 663 GMU
      arm64: dts: qcom: sa8775p: Add gpu and gmu nodes

 .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  8 +++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 75 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 19 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 33 ++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
 7 files changed, 148 insertions(+), 1 deletion(-)
---
base-commit: 15302579373ed2c8ada629e9e7bcf9569393a48d
change-id: 20240917-a663-gpu-support-b1475c828606

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

