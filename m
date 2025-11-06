Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A29C3D65E
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 21:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCFF10E9CB;
	Thu,  6 Nov 2025 20:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/2HigNQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PStDqdT4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923BE10E9CB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 20:50:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A6HHDkw2326852
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Nov 2025 20:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=c+0CI3phAGYDyHILGmN1e2
 d0RUo7uh44/KkruqoJ1dY=; b=T/2HigNQHaN0BouYmyS5QtddKOx9hJPk/6ad0F
 PvddoEMsl2o6YwVa2KfdH2QrsTuvectw4Vb1hbHDCeDda6yJBpcUdcJaAoFPcLXa
 r3oarwSJk4HQTpwV40KX9W6kpfkGwwwF2P1FvWIZVOYoqTXiE8O2paawM5hMbADF
 ZFKVQXt28EtWdmPiz7MBxPIsELSA7YxO0W3HJIhNMSV1P6uIvy1Dqm4ubIMVnj9H
 Afocj0Z+0eGkk+klLMsj+5SDLrG4M5xZ9luB/TeLsSZnvKBgZCp5XVwUQhB7O/za
 SHyVkRv+SwQZda1+OpiNzECY+hDH/YV3r39+biVhITh9xcpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h0v3ehb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 20:50:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-28bd8b3fa67so587885ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 12:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762462227; x=1763067027;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c+0CI3phAGYDyHILGmN1e2d0RUo7uh44/KkruqoJ1dY=;
 b=PStDqdT4eQexbAFCfWI3Ejab3dXit9pyLmN6wEwcY5mUcRfY954bzhh1Ijl0KxfA1j
 VOwyL5B5DGofSJ8sb512oNRsKl/NBPs5fH64I4/XiVSqMQFyWiD+H1QeWICTxCSeqBNM
 rUT2nPbrmdV9P9Dh7alyvO4fb/FlxGZ/i+9jfyG5l27iibOwxtQO6W1dJZfDBbNzr0HH
 TvoJXg/e27PFcXQ1iI/mxHUmUhS/aOYvd0jewkoh0qxR0nVa5cY+IV754++AX4Fq5KLk
 ZTuGUWxX6nT714zD+12SKvYqABJAeyU57kpMtGBaDInVBcCuqX3MaySZIdKE5fCc4AWe
 1KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462227; x=1763067027;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+0CI3phAGYDyHILGmN1e2d0RUo7uh44/KkruqoJ1dY=;
 b=IR15LHlxgxY+RK+tWOSWn5APi/6E8ghoADT/jVYZVncfDPdeGI1ZdE7HyBTvWR2CYm
 cfLtxEMCeelBKL7rbgzHQ/BlOGKpHmaVdOlwc902ztLS6phNrMg9JMN4S56L7WQ18bcT
 sQ9Epj9OC1/LJidjd8qlIbF7rfhiBHIoSmNUbgI0BfdVkOGxfBWp3PiUCcNQ5Mz0UUE8
 U/+pxkh+5ymKDJo61i3nz8yC9U4UKEYistPYLYjd8Kf53v8Js9/h7dAxMTvOsvTorb5h
 crN1zu8sLXtd3N66U9zXdNnmjxt2tt8P1KmQCTH/BWFCgGLuQfPHSW2OGuCqgQ29DIIH
 AKrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJg16ozI/BalaAfgT+yU9uyOExin2Ih3tvP6qcGrhxiYkiyjQ6riw4JHcT+I8heW2o7JeDi2UuJzc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeJCmxVSup7bWWedZ3hTUWSomX2KeBHDsJ1v7aJUWIffQms++/
 9/Y/JFzPJG9Mqa+ih7kqMwWpep439bjNNMPJnSP1b2uCZyOMKwac+fhw5CBC7ViJv6MuAfd+JGq
 q4l44LmBl5f1ZooGqV00sv9+7kcyQQbuncFe1ChgcNEPknYyVfGKBlrvE/YWd0yv+nQy3pgw=
X-Gm-Gg: ASbGncs4Cl6GRX+qAOmn/Ypa2BGe3v0wVJOddY12nt5f6NsW+9BPs593wNaRBVJouiI
 x8nduOMzmCuJU280CLGJnc/51oE14DdS6UgQZ+6U8jr3vf/RpbqNIQZf49zOM/AznnIuHs8g8Vk
 gddGfmZ5lItMHItV7RXmVgnm+YJtMjHNC/01Y3LIXqXHPW0OvoZzpcbm3j65aBtx7DjfE+lomn0
 AGeK4RyU3W9vVDKueimi5uUkUtr1Df9q0CPobyZBwAruOlVsVUlWYZ6oM0NEKEbKF0WmO1YdamC
 VwgUD4pfz434D5vUOq2iJoVf3UuqklCjPRlR9ZmPYydYCY2Q/Y0BL1HxrnCkvAPI9qKJfjxfsfx
 E9JRzccE2oaOxhuYYyXvqcx4=
X-Received: by 2002:a17:902:c942:b0:295:9e4e:4090 with SMTP id
 d9443c01a7336-297c048e1aamr9267705ad.52.1762462227028; 
 Thu, 06 Nov 2025 12:50:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkVL9sBwSB/OhF4GGfbkM9glVzBtBg9nKvK1YYv7yR04xbzRA1HMup/agqqeQtSQa4DhZ1vA==
X-Received: by 2002:a17:902:c942:b0:295:9e4e:4090 with SMTP id
 d9443c01a7336-297c048e1aamr9267445ad.52.1762462226464; 
 Thu, 06 Nov 2025 12:50:26 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 12:50:26 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Support for Adreno 612 GPU - Respin
Date: Fri, 07 Nov 2025 02:20:05 +0530
Message-Id: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP0JDWkC/12OSw6DMAwFr4K8rlESkRa66j0qFgFMiVR+cUBUi
 Ls3QFfd2BpLb55XYHKWGO7RCo5my7bvAqhLBGVjuhehrQKDEkpLITWOJV/D4sF2qJCqRBeioiL
 LUgiZwVFtl8P3zE92NE5B688jFIYJy75trb9HHS0eD7UUGvZAY9n37nP8M8sj8au+/VXPEgWKw
 pgkqVORCf3omeNxMu/dHocB+bZtX5rPe2riAAAA
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
 Jie Zhang <quic_jiezh@quicinc.com>, Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=3492;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYt1DO1LqTfFqHj16/ypXH3yHHgYuudVfxTIn/PI/Ts=;
 b=QRE7PA3UltZ/UcjZenH28Rd68rTh2wo2ssJfBfKhgw2eKzacmjm4dKSrkedIYMUuaqQCDC4Sj
 zTAHQ7Fd8ccAmb14wyxpPBWg5/A2tNJ5kFxFc3O+ef8h2KfKeL/v39U
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 9AGm-EBnpq7tZYLvE_ZDCFUAKDClRebT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX9QyCFWE8L0U6
 Wh3CIXYYaQdoCeJqPefMXgzrIxCnsrrgViXOKuGRfx67UK85V0z/ufmq7JYX88SSMdxmA7xmjnJ
 wmlrtw/yj8la68YuebM2uBVXqOuImpzsh3WCDLL8+H5Izw93LsyNd9Y7i9CpWfX/+uY9plkXNK5
 1q+X+eR4cgcLfbj2NFhnHUYRQ0eKjO03Un1ELRj3/4WNKlXF6gHxv6WgElQSUEWt4s0Zc1L6mim
 yHXjQcw1QLcAjH2oNWNGe80KUC5L1ufv9quv6RB73ya73/lMZ29nV5gZp1kU2d7Spcxy+U8w5gO
 qCv9dsIfP2gbMfEFAGT3rvg9UPtVJIGibHn+OYtmwz4JjVx6yqAHRKZh9N9ldOG5l4W5qRtCxJR
 xqPuXHq3Y5aW4R12FqN3BtqkdpwP1w==
X-Proofpoint-GUID: 9AGm-EBnpq7tZYLvE_ZDCFUAKDClRebT
X-Authority-Analysis: v=2.4 cv=PoyergM3 c=1 sm=1 tr=0 ts=690d0a14 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=vemyJuc05ARF21wryp8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060169
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
Akhil P Oommen (1):
      dt-bindings: display/msm: gpu: Document A612 GPU

Jie Zhang (4):
      drm/msm/a6xx: Add support for Adreno 612
      dt-bindings: display/msm/rgmu: Document A612 RGMU
      arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: sm6150: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |  32 ++++-
 .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 138 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  16 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  23 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  45 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 ++-
 11 files changed, 398 insertions(+), 16 deletions(-)
---
base-commit: 185cd3dc1a12b97194a62eba9d217d280ef74135
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

