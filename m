Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA15CA3C7A
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A68810E915;
	Thu,  4 Dec 2025 13:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jktIV0ql";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QL9npKWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC0810E1DD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:22:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4B0tkq614183
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 13:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=LS/IUkAfEAArbuQs7HfBsR
 lg6GO13UrdrNS/RdL/NJM=; b=jktIV0qlIFRDH1MWVpwbVRTvremKbbUkOKbRpL
 UbRqTu82DG4VuLUjPClMG+axccpSuYZ77MTlSVTrkJPu1U1YCFVFe87zwn3DgYPu
 mtR3vLvL1K659xRC5LXlYUipvFY7+Qr3Ip7E3ItXX5TE5vKDpD/l8AhiBW3JmYan
 Og+whoCI5GwSK9BnPvBLBig3a1SaYTFcpyNqKLsRXrKMbht0HMVOdnwvTkckxYpG
 Gz6PX0WzOUyxoF44UH5mAFHUQlyNyjo9bYNRNfXnmEIEYIYoRdUoCb1cIZPyzuYa
 HYI9cjCW8J0e31mHQQb26ra0eKUCnxKu88aZebgKlwnlPpBw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au9298bxg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 13:22:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3437b43eec4so1319232a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854538; x=1765459338;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LS/IUkAfEAArbuQs7HfBsRlg6GO13UrdrNS/RdL/NJM=;
 b=QL9npKWiVAq53AoIAtUl9FWSQ5sUZ3fmBZL3u8AmMY0BA29ntuBy9l9JnXKUTC874m
 Iazqu5IwA/TOwNAgkdyCo5Nku5SlsXoLkAiHWC6kcnRLQl6vJcMV7hp6ditiXVjDCj1u
 o+Nt3U9Zt15hPl/HXy5fEynfmS8sjBxA+MjR9minqJdI9jqSPcn0zGIb8RVYf4uycYdF
 I49Cbrmo8vb0Z4yN9Sknr5Odc/EVucIwdMGXuiXR9M9ztXQs08OjEl+jzDIhnvvUbEOq
 ApdeKjFCVLPQx23DF1qsrPZpIJd+sVqSW86cSrJL7QmQrdqQMCBALTAkfRV79z0sXNhO
 /HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854538; x=1765459338;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LS/IUkAfEAArbuQs7HfBsRlg6GO13UrdrNS/RdL/NJM=;
 b=XdkfqeIKYmkTWsYJMbOZQNUx+OHPZVcUo39C77hmirAjXx+mqtTDFCQWGv688kuM/K
 zAyNGd8Oz6WEigHkO1lE3cUceyeSQa9oOcmogX6Ub8Y4IBU38KWbGy0R/kHboPMKmXOG
 ZLq5flcRDfxHLfc7iuJnsm42bMAEf/uj7CuZkQ3iPpCqV+G+qPZ6IAzUZ0jRA04z5ozQ
 EdrhbQVV1h+05iUXRZKdX7RYNMj0BUaES4DEqmuiNc/dFWJkeQaVnetDybnXIXvNCO19
 S0asy0iBLTJbDP2WprwylCHvxFcx4H3XhA5l7JXwhCqPMX0wxxeOgTarNmmoqE1Nd3hE
 osCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT4BtpqWP4VUhS932+MJuux/0i70qH6uaL/CSHi5FfeZqEoE2Z0gfvre3Bxd7Fx/Cfth46gHWGMSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkwVfazxTkUeR946nhpxaK1Ir9VJIYjqpk/AIJhwvPGX55+4sz
 2pXBOnVLgOp6ymIzOTH/xeHUnWCAVmzGH7CPDWDzIAg4T/zzmiNqDG8Nh+U2snAZuama376Ba+W
 i23NezYAGBeF4EzUkqAGDOqawZkBFwlBmWIEXgaXEqxU9G7SDVj3NW9pzMnsNw9M62UUqhYA=
X-Gm-Gg: ASbGncsc9xTxepL0v3QNRWJaxzh2EnQxN2hst7Rzc7xUdwbAII/+RqUT/HBW1G2WolV
 bAbHFF7bqmK6tSSpsyA4NE1+HJpRJrkVjgl/G1JU/CpTyVaTQjoq11LmH1zL5nLnzbGAVDJX4Yy
 lSfmmRTX1r7V7Za2IByom+qDfyUHbtG/rj5XbHhIxSRe635Wc8YcR8FDooIMJ0vbp4PfDDF0TTt
 CRsicNHXLcj55ztDJupVR4QyQoQrFbEn1c/TLJF5eyj4Ncdpmd4+JXPP+eVVwdYq7MoTiUFkyBa
 IiwYMsqxXq//GGwXdc1/5LBeFJhZFawhbJcbEVpcetjngFGUcD0hkaIbtfC9eclcmXB9xgRlsDc
 E47V4p9dxiHOXaAOwmrcw2ugw7W1WhBk3Iw==
X-Received: by 2002:a17:90b:4d92:b0:32e:38b0:15f4 with SMTP id
 98e67ed59e1d1-349125be8ecmr7920406a91.7.1764854538350; 
 Thu, 04 Dec 2025 05:22:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW1rjgANzwkBwo6WdaWtJrjXlAYMk6lSCrHRo9Z0EfqefF0ytJitWZ54wk59aBQ7IpfswFjA==
X-Received: by 2002:a17:90b:4d92:b0:32e:38b0:15f4 with SMTP id
 98e67ed59e1d1-349125be8ecmr7920342a91.7.1764854537771; 
 Thu, 04 Dec 2025 05:22:17 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:22:17 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v4 0/8] Support for Adreno 612 GPU - Respin
Date: Thu, 04 Dec 2025 18:51:52 +0530
Message-Id: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPCKMWkC/3XOy27CMBAF0F+JvK7R2Nh5sOp/VCz8GIOlkhBPi
 EAo/44xSK2g3Yx1Ld0zc2WEKSKxTXVlCedIcehzUB8Vc3vT75BHnzOTILUAofnoqM4PHWPPJUe
 vtAWPtutaljvHhCGei/e1feSE4ymz0+OTWUPI3XA4xGlT9XieeKElKHYv7CNNQ7qUe2ZRGs/Vz
 cvqWXDgYI1RKrTQgf4ciFbjyXzf9VUeBZzlDyLgDZEZMdI3TgUbaqz/Qda/EClfkXVGuqC8cm0
 TtPB/IMuy3ABcJFCVbAEAAA==
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
 Krzysztof Kozlowski <krzk@kernel.org>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=4216;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=uOlMr4qsBLKCoyb4NO+v6kph6XJZa/vsIoUACNtE+ZI=;
 b=YI+hPZcQUl69FvrgLdsNeM8FfPYO0EXDqe89Kr4cv4yvEbR+t3dlQCJGWaKVbfPFYypyJiPVh
 KmzCc1GJUYeCKGQoyBiZ7kM82bOlamN8C3rEapdTy9P7gf8HTDNqy2K
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: v_KJSS5zDUhXdiqX2EXJeTFzI6i_P_dh
X-Proofpoint-GUID: v_KJSS5zDUhXdiqX2EXJeTFzI6i_P_dh
X-Authority-Analysis: v=2.4 cv=UddciaSN c=1 sm=1 tr=0 ts=69318b0b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nlYtN0jpdUqXxw8MpYQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX6wGHlue9O+pp
 51qiCM6euqj/M0lsHMqGo4emhktsreSjOa6WN/4CdDlyVgMI2rGSvTJY+LcI1jrG4Jt3wkaye9a
 33m9SNW1ITMko5nSJqJUJzYaQkTAuX32sAjtJtBXq9ME2gvhS1re4Kmyvpmp7F7uwsLN0679VJP
 EZPzfdplrH6jcY7TTFhyF75rtqGrkdeJ4qMQlZeh7/J7YgLocqFyHovuISeK/PNSJWJLs9tYxet
 mcFziAMcbWnLE8kZCbBH481kRDJ0p82qB2tOYP05Njo1IQuKeSPah9ijYtlmyuVgc386UTcA9WC
 DA22BK3YukzvSKuY4LBsNisiqpFz44i3IXtuWBOzTxGhK+dVuunRjrrY0If6tjfMKG6uUpPVwok
 m2AHoYgWmTZJn/20d6nT795fhHG2UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108
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

 .../devicetree/bindings/display/msm/gpu.yaml       |  86 +++++++++---
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 149 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  14 +-
 6 files changed, 354 insertions(+), 30 deletions(-)
---
base-commit: 2bd3691a4219f5610afefaef1016c2ff95ca2ec9
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

