Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0DABEAFEB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 19:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646A810ECA4;
	Fri, 17 Oct 2025 17:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHgOEreW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CEE10ECA4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HFQJOP022181
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=T/pxneW0GGPQT6fV2Oc8q6
 PoK83hK+J2n9XaZIObRAU=; b=oHgOEreWy24QFTZlUVBlwmW5OvR3dOWoGq6HKh
 293zIN+SJWqTOH2lWYOMklnmI6WCEXhlDc4cjn45WBhMx0woO6FPQfROKrNkbg+H
 HybTX3igTgms2DN/c3pXqKh/KG6TKjDevjYChtsF7fkI/rxgvcJWsDOMhL0Wk0iZ
 JZbENgUGB0W3YE1JgD4r1hGsqWm+q7PBMDfL5HdY/UjZTucmMsIwC27n8WeAmpwb
 vrtHMW4JMknXEsJSD0rMIBdUkllJp957fKMTan4oiBA3HHnzGW9KUbS4l88BmE0g
 DRI3Tlh9T5q141HcMgY+FyTUJ0Lk4m3EZyLNmTyRJUyFTXVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtj2gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-26985173d8eso47724415ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 10:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720939; x=1761325739;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T/pxneW0GGPQT6fV2Oc8q6PoK83hK+J2n9XaZIObRAU=;
 b=DrUCiqH67kZkduvWLccYWe5RiHFWqgxlxx6wBM6iEME4Oh1UohpdpAInd08kaVbTul
 84cIHjW1+68X+kEVox/iZeUOL8yCE6nZy/TMKbG4qkU6A52k49KpdbFWxqZvDbrg/q+s
 A3sbD1ahm/Xvt4Hf8regWM0Vilao05IXFI/nSmyk5AqrdnkB9TSD062DG62wj2hrbBSN
 bmcXdt9KQzz5iDQJ+rk4u+wR1ztGn/RGLpW/GjS/4XodFDuDEU9k05SWP5eI4lFWgEhQ
 3pOeaRIpZGbpHo2Fd5cpbWnVuaiYmIgJfb9vce9AzPg3sUE1o/5fKzva6on+Fw5U5tt7
 zRvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN5vYpwGCviJ+kbvS2D26ConV0nzmhQ2n76jYLx3fO80dA0jNKkRH5l6UhAtUDgVLHhXsHDxMFE1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+ffKeHrs5SssUNsk/gPDaUjMk/QBEwfjPoQFSr0QPxqCtCS4C
 +F6J7Oj5hPg3pDKvpmz8njUCuxq5vxp5ZW0chs1n5T+Ls1psdWQATLbVMgA3GNxzJwoKz1SKzCC
 86I9EU/tGsXVH9B6aM6B4wv/+P8Y4pYA3x2lu9B2zGVETwCbtfyjCvO3f1p7XEjI+9uo4zsc=
X-Gm-Gg: ASbGncv0r3pEwqwamkoXIKsUoMY6N90tn0Jlvyx3NU/4JYDLQcq/HLHeCtlIQdkadPD
 CsoOBDcuDcRBULTZqmDoLv7DbHAx8NdeoYUkM8UJipWkDca1lfY5TmJyBxfhXg3ff3slc8gE5aq
 Q56xJiDnWnU9MRbN48WimdKvqqanwNOoRe4ms/NJc7384Qmn5npEmFxXUrnlgSXqclxNCb8EoR5
 gZ2YBgKCkkO0lpZuXr9XjQOhUh36R7guWkxAjOSIfYxA+KuEgflMRdASDhEr+oh928s0s5IC6wx
 tuQUvAHat0VXbxdKVhU57X1D16vxfkbd4Pjb6R9iNVnWR/L7vuy8urFA1KUWRdLj1wyVB3UGUXG
 1YlOcPkwZUeRE1CbgUZMrEM8=
X-Received: by 2002:a17:902:d4c4:b0:26e:7468:8a99 with SMTP id
 d9443c01a7336-290ca121e99mr59640505ad.36.1760720939115; 
 Fri, 17 Oct 2025 10:08:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+KFNhG5PcZbke3N7Al16y0Yp79mNDUlOZzFtifVQr0J9r+kCgoWT/WU7gFhlnqZFx5kLQEw==
X-Received: by 2002:a17:902:d4c4:b0:26e:7468:8a99 with SMTP id
 d9443c01a7336-290ca121e99mr59639625ad.36.1760720938250; 
 Fri, 17 Oct 2025 10:08:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:08:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/6] Support for Adreno 612 GPU - Respin
Date: Fri, 17 Oct 2025 22:38:28 +0530
Message-Id: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAx48mgC/yWMQQqDMBBFrxJm3SlJaES9SnFhktHOwqgZlYJ49
 4a6+rwP750glJkEWnVCpoOF51TAPBSET59GQo6FwWrrjDYO1yBVGVk4oUWKL+d1JN80NRRnyTT
 w9997dzdnWveS3e4TfC+EYZ4m3lp1VE9TYw4Guuv6AffKjguMAAAA
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>, Qingqing Zhou <quic_qqzhou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=3877;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TBtnh6miwgQv8qy4YxihSPZwnvBgSc+1qmJKsqgsLRw=;
 b=4vlqn1FI+5GLuRp7hEPEMU6tpBGe/cYZpbh7e15CysO9nwiTDdXKs7XfOcCbNDUQ9lpt5zfyz
 vOTIQvH0kErDs3BQI8ITy1aMbf68szIQY7oWYSlrtjxsDwvqSv8bPxn
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: saLPbso8IoeFwuza4XbuZRq5vqf18TkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX8+3jpeX7ozNg
 LHqlfADUMfLq55DX1Sp+Cs6mKNmftI/1SUJtDzzEi80/ACuRn/1hO3usuuIKOB/S4aXW/gWdg62
 Rs/YVkHLkXRTYso+f4TYU7gUyEbldCXiwuakBMx1STxEQlLYtlf7d99y70rTxdkMepqG6DE7t4K
 ANw4pv3Srpl2c7pZ+7pO5+mqT2MVB/G/ktjCEbzxT7quWdf4ppm7TRi5PhP0+Bev3t/Oonx2CKL
 u3nRQcL/V9wmk9lcJvq7ZrOEywGyS81E++8hBm11emPAdjm4Pbz0dJJ35jc9tKJALMPC31pMyNA
 QFhG5n4yHzB1eAz/KCMgpv3SJzCJeJF4nvpf+sQ9bkTE2kij3iHa4RTt4ejkMrVIPLjEDwFseHu
 6obG23l9DJ4SYfECm2ny1b5pTAglDQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f2782c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=vemyJuc05ARF21wryp8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: saLPbso8IoeFwuza4XbuZRq5vqf18TkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
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

This is a respin of an old series [1] that aimed to add support for
Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
have consolidated the previously separate series for DT and driver
support, along with some significant rework.

Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
down version of A615 GPU. A612 has a new IP called Reduced Graphics
Management Unit or RGMU, a small state machine which helps to toggle
GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
full-fledged GMU, the RGMU does not support features such as clock
control, resource voting via RPMh, HFI etc. Therefore, we require linux
clock driver support similar to gmu-wrapper implementations to control
gpu core clock and GX GDSC.

In this series, the description of RGMU hardware in devicetree is more
complete than in previous version. However, the RGMU core is not
initialized from the driver as there is currently no need for it. We do
perform a dummy load of RGMU firmware (now available in linux-firmware)
to ensure that enabling RGMU core in the future won't break backward
compatibility for users.

Due to significant changes compared to the old series, all R-b tags have
been dropped. Please review with fresh eyes.

Last 3 patches are for Bjorn and the rest are for Rob Clark for pick up.

[1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
    Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (2):
      dt-bindings: display/msm: gpu: Document A612 GPU
      dt-bindings: display/msm/gmu: Document A612 RGMU

Jie Zhang (3):
      drm/msm/a6xx: Add support for Adreno 612
      arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: qcs615: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gmu.yaml       |  98 +++++++++++---
 .../devicetree/bindings/display/msm/gpu.yaml       |  31 ++++-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/sm6150.dtsi               | 139 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  16 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  87 ++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 143 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 ++-
 11 files changed, 511 insertions(+), 32 deletions(-)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

