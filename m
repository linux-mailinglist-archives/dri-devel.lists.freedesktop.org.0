Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D6B41630
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0A110E3EB;
	Wed,  3 Sep 2025 07:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+J36IrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DE510E1FB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 07:20:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832LENj004340
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 07:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=2JoLFn5sP4ZLLO5SjGpvmt
 sl7bGVvId7x0Y1lR5LUNY=; b=N+J36IrVFKzU/FNiGjYeNS4nZgyrAAgd6Ru6RR
 CxtKRKWGOk898kEB/GFhgzx1NssteKCliuUJ3kWWekQ2DbjUu3RJ+Q4WAIZRjmVk
 dRTEmh8VpC+4/8kH1Da1beCI0ZVs4jiJ9ok1GznVeaJi969pLBDgNnyYkrT8Db54
 5pel4QkC8d93b6ZWFRLDxMWA09788tGUwmvSg5wL9RK8ExBv32xZAk4Oz6D5/wZI
 QOOpf3a1hwnL0qspsPRxnE40G5GPxX7m8FU4al339t6QzVhRnncYJPegIJIK2eHU
 /qslFTt+qaAsFQFH0iWcARhBYNFD7aQpYOwg6zGBYAzrz77A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjjj5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 07:20:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4c46fbb997so550288a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 00:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756884010; x=1757488810;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2JoLFn5sP4ZLLO5SjGpvmtsl7bGVvId7x0Y1lR5LUNY=;
 b=m3nEXDE8m7AnXVmvGrfvjvH3LZD/eL1dCFwvYQmhPf1/lT35DWumN78VZnFYc1bi6i
 6yrxE2Vy01V/Lg3RadHIfhPSC0Esz81AAH6LYjdg3HVayUi3apX/HXyZm8iUZ2/llKGY
 EEJAMtCx3neAW1TRJXcTL57I821jeyEx6jbKivajtoDD36FxXTLchNRIc1VI4IufKp6p
 bTNVaF83XMX6BcX00oC3k++5MHpEQFEdbR/TtJVteQ/TQwlofO6fSEJTI1xqvbOOgxnT
 DvVvWfjeAf0buh4A+tISyiFpgnPIg7+jCYPZubyuO0EQo2/Uy6NiQXSY7YYIs8Wv/c4Q
 IMxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL58RHTpJbXcsIAz1XrE1SxgqGeZBMgCzXGD0WKbF2WGFRBwSva1wc7TgchpNIL+SMYf+gcCyzyS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUR5q8Bo6xNo8ZhIyUqywiSPFF6xmMU0s8ReNdIoDufJBX5mrm
 M6avLtk1uZQ4GlVIBchpv/JzcWZC0lCdjYtrtJBeOwqEXXeFjb9CGIl2nKVlz3mJ1KiraKQkz4s
 cudktKDWLG4xczdRcsL55QpgW4aNSoi+FX42DlpMYvUREcQz4p5SA7RGi1qB9mub+v4A8sPY=
X-Gm-Gg: ASbGncv/mX2p3FD3h34uvHwb1cIoycrzwdf65uls6w6dwmW2ct7C4tHeMpcKoiQfTd4
 mPsCocAQCMC8k8+Sn4X6ytQ/dOx3ytUe5cP/CTEOjKkMUMHs8Bpi04PaXWAW5fsqwL1cIciedJK
 8nihPwp7F7gSjo73QS8DahNRoQoyM2urlEWc+wyEMZjj4Jc1u/3noBj3tfVw4HnBLMAaeUIvoX+
 ti1dPWpz+Iop1ML1go1RlhbwcrIgoYoc8nuG9/DP5x1xNWZZThRTt2jTZvKde4qfxmjwWqZ1pwa
 2W47DVpa2Z5yc5Nb+8RI0Oe4FgEit9HEBPv8+qNYnGBfY8uUQGQ9Q/6PKKsn5doY
X-Received: by 2002:a05:6a20:938c:b0:246:5be:ca90 with SMTP id
 adf61e73a8af0-24605becdb2mr3661985637.10.1756884010462; 
 Wed, 03 Sep 2025 00:20:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1UGA8r0cWsBWyAEbAPAOFFKu4QhQwB/Mj3xz8LLJJb2d9gBhwrpWd+rEMCxpJXlx3TTV7UQ==
X-Received: by 2002:a05:6a20:938c:b0:246:5be:ca90 with SMTP id
 adf61e73a8af0-24605becdb2mr3661943637.10.1756884009888; 
 Wed, 03 Sep 2025 00:20:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 00:20:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Support for Adreno 623 GPU
Date: Wed, 03 Sep 2025 12:49:51 +0530
Message-Id: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjst2gC/3XP207EIBAG4FdpuJYNMMCWxhjfwxhDgXaJ9iC0j
 WbTd5eyF9ZsvWPIzPfPXFF0wbuIquKKglt89EOfCvFQIHPRfeuwt6lGjDBBGAWsJQPcjjOO8zg
 OYcKNlKqUBJq6FCiNjcE1/iuTL6+3OrjPOcnT7RPVOjpshq7zU1Us8kTPOBjYZjsXo86ZVfGYI
 0vGCGdAty7JqABMccLMW/s+XD788/b2vTkl7gltcRcfpyF854MWmvP+332hmGClwEhhQDWW7b3
 MLWxHsPKAYInQTkvBnTHUwj0Bv0Q66ICARICpgZ6Vspy7e4LvCXVA8ERYbjXlkqQW+pdY1/UHI
 DzEf+oBAAA=
X-Change-ID: 20250213-a623-gpu-support-f6698603fb85
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=2608;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=iEHHNOUp5Zf9Seli7wZfoQELliaGPiDXzU/94llyCSk=;
 b=D0JWR6w+bg4ZVSlHnoj/IzLyKrc0jTOe9GyPVcMLL8tw94rswzmMkSbALYa9b5Tj3z5ADZg6H
 TNU9SKJAV4CBarOQJNW0/WI0wUmCkHbNmH2JLNRpWTEmVIV3wwzu2yg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b7ec33 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=xbU8ZoTWYswB9xRdz4sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: g2pqRtCIxbadGcmoKwG8NkE-6VnDKA6s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX3DZuO4hQG4dy
 ktmb5MWKZcLV2Y/8GHvSnbJrxTIyK9/8eQ8SjhBA2qJQAsJTDjUY357e4YfFH7FxVLSfdZ+yUsO
 mvFWluoBarDv1wu1NhIrkEneQeMJtz6cIiuawk6pGDRyJ56FH9O2AEF09p0gu2TR63YV9TC0IwL
 Ad1wTvwKGRdR9uqFyTRScD/0EhZG0d1BfMv1kF7dxrHUxgJfwrWe5wRdqbCvS+1rZ6JBntakIwQ
 sRmAYTNl1MuGgDcOt6mI/l3o4unNr4D0nWFmdSpENGYZvXbkRlKMh7Bhv8Ez1Sug/XYIeCPkaqX
 QRIA1A2JiApXLujoxEEHbq+Hen/dLLV5ukyXAHQqzEUtiKc1Q+VWYLhn5FKRo217TNFIT3i0wc0
 KBhhhw7S
X-Proofpoint-ORIG-GUID: g2pqRtCIxbadGcmoKwG8NkE-6VnDKA6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

This series adds support for A623 GPU found in QCS8300 (internal codename - Monaco)
chipsets. This GPU IP is very similar to A621 GPU, except for the UBWC configuration
and the GMU firmware.

Since the last revision, there is a new board support (monaco-evk) in the mailing
list. But I am skipping support for it in this series due to the heavy code churn
happening in that file at the moment. For Bjorn's convenience, I will share a
separate DT patch for gpu support for that board later.

First 2 patches are for Rob Clark and the rest are for Bjorn to pick up.

---
Changes in v5:
- Rebased on top of v6.17-rc3
- Added new patches for SKU detection and passive cooling support for GPU
- Link to v4: https://lore.kernel.org/r/20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com

Changes in v4:
- Correct the commit text for the new patch#1 added in v3 and drop the
incorrect R-b tag
- Link to v3: https://lore.kernel.org/r/20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com

Changes in v3:
- Rebased on top of v6.15-rc5
- Dropped drm-msm patches since they are merged in v6.15
- Correct GMU opp table in dt (Konrad)
- Remove smmu_clk from gmu clock list (Konrad)
- Update dt-bindings yaml with a new patch#1
- Link to v2: https://lore.kernel.org/r/20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com

Changes in v2:
- Fix hwcg config (Konrad)
- Split gpucc reg list patch (Rob)
- Rebase on msm-next tip
- Link to v1: https://lore.kernel.org/r/20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com

---
Akhil P Oommen (1):
      drm/msm/adreno: Add speedbin data for A623 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: qcs8300: Add GPU cooling

Jie Zhang (3):
      dt-bindings: display/msm/gmu: Update Adreno 623 bindings
      arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
      arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  34 ++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   8 ++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 132 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   5 +
 4 files changed, 178 insertions(+), 1 deletion(-)
---
base-commit: 89d926fa53d0a6c257c4e8ac1c00c3d9a194ef31
change-id: 20250213-a623-gpu-support-f6698603fb85
prerequisite-message-id: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
prerequisite-patch-id: d7777838f03a79704af190f43063f99334e58e53
prerequisite-patch-id: e3228ae5f83ed408ee59404be165498bc6a3e183

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

