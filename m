Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E560C7BC99
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 22:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABB810E909;
	Fri, 21 Nov 2025 21:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0oOZYqu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejj8Q5Lt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF1D10E906
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:52:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALHRdW23049176
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=mWK+CI4HwupZHnn55PN39T
 AW5BHeMV/LpUHSqvy4YvQ=; b=E0oOZYquK8VEh4uMIPFS+ad/6ck8+y7U2oiwtl
 yRv+KqQH60PiIL2tIoj9zo/z32VxQzfdReM8VMPgS+ptCxqZkoQnChsl5e4r5EG+
 9VUt0+6VZ5ZWMdUCtuTDBnJKi3gkfwk55GpBBT3Eu9Mk9V04/jLJxf/I2WRxYCCf
 BUGJeoZIB4ywJ17cN14TyqdeKdMZTrNQIG/bXbM15xbGYv1xCdIiuxrIAxxSKnNO
 LNfUeMmLOr+kt2okD5P4AHbs3VPyuQB1HSS4XwWyvBL69ux14KCWrocWQ6ENztCX
 l72y0TeNeKyqM1vVUGvZwm7OL8tv5uEGo6Lg8WSh8/x8v8oQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjt4bp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:52:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7ba9c366057so7623038b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763761967; x=1764366767;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mWK+CI4HwupZHnn55PN39TAW5BHeMV/LpUHSqvy4YvQ=;
 b=ejj8Q5Ltjf5M3/x8WTznNSVOjV+sLTLI9Trs/uWbN1b1iygFNwk962hzu6LAfgBkC7
 icsU74Q2dwPHf7RfgR88h9WCnzFtWRXxtd4VEP9mzLZfwZAB2jtBqRM4VgHQ/kVoHzpZ
 JMctRhgs03ClX9XEbDrH/Lr9gnDzX32Zz8HPzL2OJKHvOkQyu9aVLKSipxa9shmVqoyH
 QfCE8RyN3F+JMyshpoe8UVtCXxBSg3XhVZNItrqCZP7/LiEfFw2XF1fMjd4OR67Mp3aC
 WeWJdVlUcIF4/UHKyjTQwOnI8jug38slJQzcWZiLNjmveZM+uWVmwbLG0ohJYa0Gowom
 X3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763761967; x=1764366767;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mWK+CI4HwupZHnn55PN39TAW5BHeMV/LpUHSqvy4YvQ=;
 b=J/wVwKn3Q/KvE3Unma8rccqNw+G1920D4NXhxtItf3v928NH0ATJnDsToiZqcFkK7B
 QuNWWdjP7aXak0vHejZjJX2xoNGTUM5JlldS0vRhTSjkJVBHC+j1Yo1oydYbXYQnBTq1
 Grnqct7ELisX9/3KqzK/BmrZuheQOA8fZ8cBH/MqWEEJyKE4nmrIHlTbcz4muSm9GH/1
 bGdYqaWVmyqlmn3uC4t1NAk5qOZfMlN0uiv9bbWY22XT3edK88F43GYCsy8O6lvAfwAr
 QBUYPjHBwWJgTRgJHnoWk7FQKt8iQLVWOI8woi7Z6pni6uJLv5Bkfm5zO8PBRGMF2DCt
 yHvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAYu241nrknEescBkfXpoB7WzzfUT3wUS2ul3PYcE55IjB4omI1rN4EFeQBs9bOFYhIt8tIjnbTJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpczmGNnJXgxcS7m8l9IaqgefGcEIEYsDeVDK5D0qlBgeMDALR
 p1kM70H77hj+47PqDjxUy3qqUhkonBLyF/cR+y5yl2auiBtXW4Tkjo1wPDHkijxI34ao/9RlLQi
 lqp2YVcCGrrZBhlgb+pev6hvn+ZD8Eb2qQIFbaGNtLuEtAZ51UhhrKfvTDTaLYu3WRNHu8lI=
X-Gm-Gg: ASbGncsg/pG6Si9fXFPV/ptfuRjyaGAoheTyPLvMS8Wf2LrdEtV1QaAKvRr3V9lIHOg
 NPqcDh0fK1igoRtVNJyBeG8NHPDBtYPFPHmagusJuDRXr9Z2IMGoYQjQ4iGzqCkRuZQliyQke4p
 +Rdz4dG+t9RKSrx+cEvY61UJyAobE3mMQUpjN/nhZybnb3qvipVE42OUGvqk6B8IWG4ZRvpDfp0
 riBlgxfEV8Hu8y8K0W2/WCrfAQ7JAWKnJx6wQx4i8l0/fR/2nGYs4dcZA0dGU9iNUXNyy2izaXz
 OwHMWBnijoziY/er9fUv0LDPucdmctxOS/yfOuOcNqh0mQ96X4WIoATNNvOHueMwZirMc6+rnht
 q9SvpbmHtuS0yZutqsPFivzk7uv3Wmzx5fA==
X-Received: by 2002:a05:6a20:728b:b0:358:dc7d:a2be with SMTP id
 adf61e73a8af0-3614ebab4admr5105568637.17.1763761966654; 
 Fri, 21 Nov 2025 13:52:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnHfCt4k+6CJ+tOfjv4eYF/1fpI7D/vvqO3cnpPwlQLdA69tw6iZHE3iQ4JVF6Q6vP0IkLRg==
X-Received: by 2002:a05:6a20:728b:b0:358:dc7d:a2be with SMTP id
 adf61e73a8af0-3614ebab4admr5105544637.17.1763761966177; 
 Fri, 21 Nov 2025 13:52:46 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 13:52:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/6] Support for Adreno 612 GPU - Respin
Date: Sat, 22 Nov 2025 03:22:14 +0530
Message-Id: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA7fIGkC/23OTQqDMBAF4KtI1o0kqf+r3qN0kehYA9VoRsUi3
 r0xFgptNxNe4H0zK0GwGpAUwUoszBq16Vw4nwJSNrK7A9WVy0QwEXPGYzqUmLgHe91RQaGKYsU
 qUHmeEdfpLdR68d71dmQLw+TY8fgkSiLQ0rStHougg2WknuaCk73QaByNffp7Zu4b79Xp1+qZU
 0aZkjKK6ozlLL4YxHCY5GPXQzc8OIsPwtkPIhwiRZWWUa3qBJI/yLZtL4ud2UQnAQAA
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=3668;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=q1YoWf3ORQcN4tOPmLohOft5QpHgD41Hzvz1QG0Fgqc=;
 b=n7GJeHf+8hii2Tyoce/nTIdSA3kkKOm/VH7B/k6lEYSoWYKYh8aqeS2EWDWgLs5f+qvh7lPxJ
 obSQmr9izipCbpc6Q5wkU11+P8WrTEW6S3/oriQGLtnDgPCZG+NF+Nw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: pkHPKEvutY5edSTAeKjlm1VlJag9IlKe
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=6920df2f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=vemyJuc05ARF21wryp8A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfX72b0CVWbWrZs
 Q70f3FOjf3LWJ7Y0F706PjxaERyqpU2ZN2FzbCkmIOvap8aT6+jjF1D3YaopXVmHpQWD2UGouoq
 0G9VRYr1eU4RY0/j8/y7H02K75U5VtTNl6IAuhf6JIM1PuctIQJSHisMe2ysFbl4TLQvZNb00hP
 lGijZvpbswUgJuYo3zVHzPowPNBQOPzRHfCyJtmu7l8BLdW3ooITBZAN4GFI9y+btJWrS2fb0IW
 rjKQ6erj71S1VqKZRcQYiN9Ny1NfVX/9ygdyQexdHji3ZFz6KS2eIi8fPqMjtiRL+h/968sVTa5
 stu9QTxO9p5z79kWYHOoA9ELufGXEkHbXXfd3ztFu6WTJDL/a7xW/asvyz9nWc5Fu5NY29Zq2vc
 vRv3ygShxr/237bQyoutBj6hJUf05Q==
X-Proofpoint-GUID: pkHPKEvutY5edSTAeKjlm1VlJag9IlKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210167
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

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v3:
- Rebased on top of next-20251121 tag
- Drop a612 driver support patch as it got picked up
- Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
- Remove reg-names property for rgmu node (Krzysztof)
- Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
- Describe cx_mem and cx_dgc register ranges (Krzysztof)
- A new patch to retrieve gmu core reg resource by id
- Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com

Changes in v2:
- Rebased on next-20251105
- Fix hwcg configuration (Dan)
- Reuse a few gmu-wrapper routines (Konrad)
- Split out rgmu dt schema (Krzysztof/Dmitry)
- Fixes for GPU dt binding doc (Krzysztof)
- Removed VDD_CX from rgmu dt node. Will post a separate series to
address the gpucc changes (Konrad)
- Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
- Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com

---
Akhil P Oommen (2):
      drm/msm/a6xx: Retrieve gmu core range by index
      dt-bindings: display/msm: gpu: Document A612 GPU

Jie Zhang (3):
      dt-bindings: display/msm/rgmu: Document A612 RGMU
      arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: sm6150: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |  24 +++-
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 ++++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 141 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  14 +-
 6 files changed, 304 insertions(+), 10 deletions(-)
---
base-commit: e93f8002e4d244f0642224635f457bc8b135c98b
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

