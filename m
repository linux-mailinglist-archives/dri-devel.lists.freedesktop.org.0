Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77628B5157A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCDB10E8E2;
	Wed, 10 Sep 2025 11:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="apieVwrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865C310E2CE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFEGj031251
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=FHhzcXvmnJzlLpLtrDG2iU
 oRE1MaY8/8WafeWyBwNuE=; b=apieVwrZnDaUOpWKUW5PEVxN3kp/le/2rjWcsh
 yGLx2EDmuRvRStEN367zPcEDWalE7AgGsQryHYRYcd0/ihXpd5qDMM5Yb/w2L9v2
 ekpOuBWtKx+ngBYm69NRcxU787SzTc+jEsdTO5AFTsJLdeWm+ZFNprnJ/Q7ZNLX6
 +W19Ofnu/rEPtivb4fS+D2xjpLg0IK8obKRmeS/uM0efGug8mlDoLqEjIF4APXwP
 nC5d3bNJIsxoVlahSndo6xFxmq/8W+OE5Cm8HQXpNJZVuAe6Qx2fUcrDuUFOXF0t
 P5G5+g/Z/TOeEQwdUBaTECT/IjYkEF0uskxmXPpxX654Hsjw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t3803gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4fae9f22c2so10477032a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 04:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503564; x=1758108364;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FHhzcXvmnJzlLpLtrDG2iUoRE1MaY8/8WafeWyBwNuE=;
 b=J6bR/gKunvSIMxwkd0VAmWB+UIf9eRASklpXVgqZQWLt/s/+JMw3MSwhuep1BvrnuV
 KvNnt7zBD42cGAAkwUD3OpFjd+AJ4H3i2TWGH6IIDUu7f1Ml8ScHxgfosvynfZAUvVDk
 S+oKmas4+YQ9adWqekADI1V+CBIY3zD5ezv5U/nxLhcTR9yiTJk78eWR+zMPBcdgH6hw
 /uLN5CmUn+45Pk4dbN/JHD8kqN7LGzXsSbV8iPBnu0d+WHYqzPc/Po5TIT48RA/CSX0H
 jpHqF95PMplbcja3nGQQWAm+pwiiTm3AUdeAOPsd0KJdXpRx99BncoaXgYfJu6VBse5Q
 jtWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK6i3IxiOYGspAUaJojo6V3xPK3ByxfNnXf9IOu6MARWBc1FGntp61NVftUlb2vok5dYZubnYrH/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+jURAs/FudKP0EGcc9m4FuXgFG4gvCZCu8IJjjE2DAIro9+P+
 hiq18FkgkXgtWT+U9tgZnWoWTL8pVg+RY/y3ZPBNLd73ylWKdsB2eURdCTZa080e9dwWImNWPOT
 cejAX7xXVUdz86uphX16q649PxWgIF/i1bXFUcjcqz9x6GQZmXzBKsYB0+ibHHekaqnBPs6M=
X-Gm-Gg: ASbGncsTB9zjnvmtXDNHm3wYJxTrHStDIGCOnVHwPjd3FyrFC98egX1fLBMPCIc0iZ6
 G5s1APUa6WjmJgi/2yZlKwkUui+bHPch8O4bUYbjz7HGSLdO1vrTmUH7J0EXo7aKyoyr3ntbsfX
 ch2htaRwlyzJBUygH7EYmODp5nEn9QOnD/Fl9lgQza4mbjXUgtj67U3Y6UtyrNqRFCbXFKAbbYM
 FFxmQPju9c6lMzuQTHEPcFWRjOP9aYiSaWRajbYWoxyYt69lRzfyLQR1fLhQlXIKajkRJTIuLIo
 +JkVqAbge800H+3Z3w2KWYPeuaz+sloYAUFBizSv7M+dLBSgdokuvfImYcF0Mcmt
X-Received: by 2002:a05:6a20:a108:b0:24e:2cee:9589 with SMTP id
 adf61e73a8af0-2533e573184mr18642239637.9.1757503564280; 
 Wed, 10 Sep 2025 04:26:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6WV6LQF7N+NPQIu+V/b5WKR8adK4HEz5XjZBgfNC0CaTeuZn/CfRi9iBd/M7owUtZ1xU2hw==
X-Received: by 2002:a05:6a20:a108:b0:24e:2cee:9589 with SMTP id
 adf61e73a8af0-2533e573184mr18642195637.9.1757503563701; 
 Wed, 10 Sep 2025 04:26:03 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:26:03 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v6 0/6] DRM/MSM: Support for Adreno 663 GPU
Date: Wed, 10 Sep 2025 16:55:20 +0530
Message-Id: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACBgwWgC/23RyW7DIBAG4FexOBeLAcwSRVXeo+oBA06Q6iVgu
 0uUdy9OlKaSfRwE3wzzX1DyMfiEdsUFRT+HFPouF+KlQPZkuqPHweUaUUI50SCxEYLh4zDhNA1
 DH0dcA5eVVVQJIlB+NkTfhK8b+fae61NIYx+/bx1mWE4fmFpjM2CCadV4wxrmBHeH8xRs6Gxp+
 xYt3Ez/CCCUbhA0E0w5wxRlXGi5Jtg/gpENgmWidg04bb0gFNYEfxAVUZtT8Exo6aioawqc+0O
 fUnmezEcm2qdTPR1N9IZTZUcKaAwxSoq62XCu961Hn6dMYbyvHtUmebxcCuOumEWZs4sWloRan
 5K5Jbsr9vcvEAZAAFjJCWgqMeBPk0JbduYnxFXL19zz+gtpn4EQOwIAAA==
X-Change-ID: 20240917-a663-gpu-support-b1475c828606
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=4796;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5yZF6bmqwbJzi/kgFmyA3BkJ0IqhI9QGlG1cdUqtMgc=;
 b=ygJ9G72zwWC6hpjzqRP78NeDdvp7nfiUFCGd9D7qZug+URgI+Awu8NSG9XWSWv3gN7aVg1pzm
 jpah/vxHAcWBP516SRF6Pbp1o+G8wW3g56J4yWFtnEMo+akBpmoXpIw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Y2pIOV0BnNsFEnvJMaH2qNXJKdQwWAk_
X-Proofpoint-GUID: Y2pIOV0BnNsFEnvJMaH2qNXJKdQwWAk_
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c1604d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=tVI0ZWmoAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=jTv6lf4Jh5MpNzVl0_IA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX+O8KlaqbdsBb
 ilyf5Yxc/IQgFtS8cYsnraokVGcQVmVUDRYlMd7i1nhrpmJk4pI9MZLDP//c7kHO/YX5jlBvOLh
 QQ0EfIoOxMXfFczEuuYyimBAudvZ26tl0t7RDPSJf8wEXqdIetsSgo1zJGKzizjbn++gd/h1IB0
 qFxQNUHnCfHrgdl/K+zR8miapkvVlieqFuCS17nHtbVZPiOdubP0fx3L+SqegmS5kzPwzAC/AW4
 gqBosXxJf5BhO9i1BjzcXL30BrbtY7aEuodc1trkU8SGlFAggAOj0zp18TaIpH7sR/tcnuWqLsC
 ZxyW2EjxW5KQDwcco7E7qV5riBoAAQJq3jEjmH9IBOoSATJD+h8Vpg/oAMJ6rOlgc/GOjJqO/SR
 Wv0WAEmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
chipsets. The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
	1. gmu/zap firmwares
	2. Recommended to disable Level2 swizzling

Verified kmscube/weston/glmark2-es2. This series is rebased on top of
v6.17-rc1.

Due to the SKU detection support in this series, the device tree series
technically has a runtime dependency on the driver change in patch#1.
But I think that is okay since we never had GPU support in this
platform and  the gpu support is enabled here. 

Apologies for the back to back rev bump. I am hoping to get this picked
up for v6.18.

Patch#1 is for Rob Clark, Patch#2 for Srinivas and the rest are for Bjorn to pick up.

[1] https://lore.kernel.org/all/20250803110113.401927-1-wasim.nazir@oss.qualcomm.com/

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

-Akhil

---
Changes in v6:
- Keep the efuse's reg range 4K aligned (Konrad)
- Update GMU's opp table to bump frequency to 500Mhz (Konrad)
- Link to v5: https://lore.kernel.org/r/20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com

Changes in v5:
- Remove unnecessary labels in the gpu cooling patch (Konrad)
- Update the RPMH corner for 530 Mhz
- Wire up the gpu speedbin node to the gpu
- Link to v4: https://lore.kernel.org/r/20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com

Changes in v4:
- Rebased on top of another series which renames DT files
- Enabled GPU on IoT boards as per the latest definition
- Picked up SKU detection support
- Added GPU passive cooling support
- Link to v3: https://lore.kernel.org/r/20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com

Changes in v3:
- Rebased on the latest msm-next tip
- Added R-b tags from Dmitry
- Dropped patch #1 and #2 from v2 revision since they are already
picked up in msm-next
- Link to v2: https://lore.kernel.org/r/20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com

Changes in v2:
- Fixed ubwc configuration (dimtry)
- Split out platform dt patch (dimtry)
- Fix formatting in the dt patch (dimtry)
- Updated Opp table to include all levels
- Updated bw IB votes to match downstream
- Rebased on top of msm-next tip
- Link to v1: https://lore.kernel.org/r/20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com

---
Akhil P Oommen (4):
      drm/msm/adreno: Add speedbins for A663 GPU
      dt-bindings: nvmem: qfprom: Add sa8775p compatible
      arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: lemans: Add GPU cooling

Puranam V G Tejaswi (1):
      arm64: dts: qcom: sa8775p: Add gpu and gmu nodes

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |   1 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |   8 +
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |   8 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 174 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   5 +
 5 files changed, 190 insertions(+), 6 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20240917-a663-gpu-support-b1475c828606
prerequisite-message-id: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
prerequisite-patch-id: 765475c5f1418d986e661a213cfb33ee6ffb9548
prerequisite-patch-id: 03c6d1a5b0ae9095845828fc5cbb701b00f41131
prerequisite-patch-id: f7b8a288cf4ef309b4027f0b617b7435c17d6b1f
prerequisite-patch-id: aacfb31f99b75b2f5bf2f44bbd9abf8db0f66b1d
prerequisite-patch-id: dc442a0932abeb5139daa547a1b1f4282fa9a6fa
prerequisite-patch-id: e8a728d629b4bdd22bc1ef21f3d593e17a8d3b44
prerequisite-patch-id: 067fe8f5151b3fea9cbc37192e559a123abcdb71
prerequisite-patch-id: 62150f33bd304fc34b8fbb4aab953c6c4bb8a566

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

