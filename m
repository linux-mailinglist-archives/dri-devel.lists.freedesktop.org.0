Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C165CDEE24
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 19:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE19C10FA89;
	Fri, 26 Dec 2025 18:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QT762RqC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzE4FfO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EF710E138
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8bain1011818
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=lsexRv5oeh3abptMWa+e6/
 J7GN5XUkLyYBJT9ad91TA=; b=QT762RqCtlhfkxcld50j9LC4rr6no3EAvjoDhL
 BMH5xLGCmqy0FCbN+qTytxWlXT/zdeC9/DDiBakJW2lt889+wogbAuZOHm3XPuVA
 quB6BdIVRWzrEcwq597RZjPrh0SKUC/ZwVh2n3b1B94TexNu7fZGeRdasb/7zY0z
 udtce1jRfy20Rn0qIVxWk16siZYu4RKUizCQSE8l9NVVcUU/i0OO0GT5FkIkQvQV
 17KLpENEaOoTajVEFQuZqtPU4J6J9rxSED3+NmCev+xT6Iqs18w4YEczC2uOu+Ii
 dCkbC+du3mZllCTNjYINazdpFzkjZ+aNefEr3DE/d1BPt7Bw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kywmeww-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34ac819b2f2so9366286a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773805; x=1767378605;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lsexRv5oeh3abptMWa+e6/J7GN5XUkLyYBJT9ad91TA=;
 b=BzE4FfO0/LAyZgz5ytaX4FNroquqPdE5+ldQvsl8MZ/Om63U3vs6SpwlN0hXteMm51
 diil/t/8LUqcYizTcFn4fQGiulzjxYNAvU255tfnPdHG6KzdB/7NBZsb1mp3OGwcUu2c
 r/0XhhtkA/c5ueDBWXUXFx27IRtUhJJ6qWqqT4fmFvVXVJGC/W5Fm3W6cJSpo0WOvAV3
 TzcewmV6dqNYrn2AK5P/kasur0MWFZh47sIoO/gOHVNhmGQLRHtaxmEnwPD//pJ4rwgZ
 ZpqTkXcjOu2GWB1rGr1llINdUAKKOdIHrgNQvlZNU0Pz6fgVYpY4nGmZItTKF5hfC2Zr
 zB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773805; x=1767378605;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lsexRv5oeh3abptMWa+e6/J7GN5XUkLyYBJT9ad91TA=;
 b=R4utKz0Kq7MUK2YiG/7ikEtE0cBNP8Z7bbI9PvRux85yhKGZJvbhuhfAXINgWj6bzl
 fyTNBXyInP3SgjLRXtb04JCVAy7vpyZz/a4yq28KzAfAXwpWZEH7VGcz7efUiHJa9yd+
 G3dvoSWCcUdFBPLMAfnOX5wx2w+zVY4ZjXxBYgOQM5PwU+nsuLzB4lKySmL4vxDn42A4
 dGmH0xQdSLiD64Fs27b+4H9SMpxDXxq5DnIR9TN7CogrUrVyA1CBRzHGPVTwiS96Buxj
 2Xf14XqVraMeCq3v6mdvamESFfC/LTD1C/zAK+nyyvzYWamz7o5L139F1F7XU/lJZZDP
 ucNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTswpWXKalyKaAVvzVt0wEZcp7Mle/TWBUzSvqXEomWGLhvdevWIyjqeMMu11HhxBhK8q63jLA4Ck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNhFoTlFYGnnoQ2QnyWMfRfQ8NCYqqac+u5UOgn1rrYcb7OVmo
 1XEbUiTbAUYAlH1KeP2r5IAgWjC0hZR7j4l1bezh5cunVZnTgnIAIZGVRtTTQY0+vdeqgPQDcP6
 esCVqwe8pvfoe4lcgrFUVN9jMRcwptyyf5g8d103bfdmgwR5u868BwAz6lGnVYiH/1csnWrk=
X-Gm-Gg: AY/fxX4UnF63MSFt067FPgrrfkS6sYdk/hqDj3U0Ns8ile0w9MkDJ1/r+Ve64yeEt2r
 1BVdK4dwh7gQDS4oBM8Y7rMtgS3xdUF62jjnQ2PF4Xt87t37NUL9lm6VbegG2YjrXvGnzlOWuYy
 811jiQQjmleqnJ+qNkQlJdIoVZ0y4MhTgU2VNILYhPGL2L1TeBl03bVJ7AZLepvKxEYzFj/CIhv
 e/PyN7K1uf8TdCHe0grspqMpeZizTtmn/OoBobcBRdSfLzGt58n+/dZpQ8C01qpeJcGuYqlSqzt
 f+PyV3G1T/In15QpSjcyWkoDosjqerKqhMN4yn7lDrLWGolwr2f+8GBvFEi3y2n4J/c/sbZRfKi
 FEYPI5uFsAdoAH8YJet8Ho+zu7oZhASEnuA==
X-Received: by 2002:a17:90b:2b47:b0:33b:bf8d:6172 with SMTP id
 98e67ed59e1d1-34e921ec340mr18266887a91.34.1766773804764; 
 Fri, 26 Dec 2025 10:30:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjkMYWlmQ5T0oFHflGVoyOcrDyxQHAWE9NtU1v1SUQAgfmrUWLYWCIerYl6Uz3xkRR2bcnVQ==
X-Received: by 2002:a17:90b:2b47:b0:33b:bf8d:6172 with SMTP id
 98e67ed59e1d1-34e921ec340mr18266850a91.34.1766773804228; 
 Fri, 26 Dec 2025 10:30:04 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:03 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v5 0/8] Support for Adreno 612 GPU - Respin
Date: Fri, 26 Dec 2025 23:59:33 +0530
Message-Id: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3UTmkC/3XOzW7DIAwH8FeJOI/IOECSnvoe0w58rkhr0kCKW
 lV599F0UqdsvWD9LftnbiS5GFwiu+pGosshhXEoQbxVxBzU8OlosCUTBBQMmKCTSbKUdAoDReo
 sFxqs033fkbJzis6Hy+q9fzxydNO5sPOjSbRKjprxeAzzrsqyZj2NBsl9+BDSPMbr+pfM1umfs
 +3mbGYUKGilOPcd9CD2Y0r1dFZfd7kuzwpmfCIM/iBYEIW2NdxrL518gTS/EMQt0hSk99xy07V
 eMPsC4U8EgW8RXhAvFIARWsrG/4Msy/INxQt5jq0BAAA=
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
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=4424;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=8qviCg3tVu0OI3dD01WjaLx86rinUn0YtzTxpnh3jwY=;
 b=i4sxMnFwHHhJgi+ec1FMO+y/9M+hNkxQGswjg084sBzo4wvHNT6q2ScZF25kAsJ3BS0s8FLct
 tIvGORXqiJqC9il67FQAbr52uS4ZAKauYbo2PoNv5DteMa6Y56H+IRM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX+9TXney+MrtH
 aym+a8XS47rH0aPCPdXPco5JxzWWGdJkhizC978Cuer9YFwjPN+zhiaHabutsGck+NFk3n1eGBh
 VfaVmxCnJpEEm7i8+ONsUbz8zW6weYfmflLKyBuTwoveRaGZQXs5JBPsh+cNtUhu3Qj83/LGWyJ
 iIk/uH5EFAuW/w8Dd8HnzFo1nnHErfWvPk72fNRLrybXGSOaXpN/5o+6Rfm7k3AR3zKRxDcHHmf
 LHWd4aEM4t3LFGlsYR+uRjKfKOafgN4AWrKmvwEDKDmY0daq9wAftUveXQTy8br8geydG6eOdba
 DWt0mtrilM0vD3x+Ol/AJzZZFiI5mS0aHq2eN15H2H4lC4OHCxe1pSQ6YeHf08oNud4iISnj/Bl
 diKEqSXIhcw5cGqzG/FHbuJGqgM0b9SANLC3AL8bm5/OJIrjDQwm20jrIuIHbS1SQW4961xLQ6n
 8oyK8sVBNc+sNcbuSCA==
X-Proofpoint-GUID: jdu9X-2RXRWURXzIZ4l9LwQxNA5QJFMU
X-Authority-Analysis: v=2.4 cv=MKVtWcZl c=1 sm=1 tr=0 ts=694ed42e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nlYtN0jpdUqXxw8MpYQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jdu9X-2RXRWURXzIZ4l9LwQxNA5QJFMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173
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
Changes in v5:
- Rebase on v6.19-rc2
- Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com

Changes in v4:
- Rebased on top of next-20251204 tag
- Added a new patch to simplify gpu dt schema (Krzysztof)
- Added a new patch for GPU cooling support (Gaurav)
- Updated the gpu/gmu register range in DT to be more accurate
- Remove 290Mhz corner for GPU as that is not present in downstream
- Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com

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
Akhil P Oommen (3):
      drm/msm/a6xx: Retrieve gmu core range by index
      dt-bindings: display/msm: gpu: Simplify conditional schema logic
      dt-bindings: display/msm: gpu: Document A612 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: talos: Add GPU cooling

Jie Zhang (3):
      dt-bindings: display/msm/rgmu: Document A612 RGMU
      arm64: dts: qcom: talos: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: talos: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |  89 +++++++++---
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 149 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  14 +-
 6 files changed, 357 insertions(+), 30 deletions(-)
---
base-commit: 2408853dde584f01950a0f976b743739cce30eca
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

