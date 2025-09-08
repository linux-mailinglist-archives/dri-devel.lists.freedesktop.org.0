Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60E5B49A1E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD7110E0E2;
	Mon,  8 Sep 2025 19:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgJAKVmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0454410E168
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:40:08 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588JGHXV013469
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 19:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=TXIW4CE8LYawHSDmEPYejS
 9mxlDCMmxE1HIHyddZJyA=; b=ZgJAKVmFyhb22rOwYthN4+S7xeNSiDeVJ9sYDc
 0Yrvqls01S+Ry3cm43SdQ8JkLdeMBQwZovkYZ0okReV6BSQ/NnOZEQvem+PbBJOk
 KzSEJMiC9ocF5GF5qBa7vbVC4zCffyqu8ras+w6Lo9ClBNvVW5pIpHDSjfIEQd6X
 zCTbLiNBNQvXS76P9rU0aN8vHBItltk0mvseZ0100PoXUwNf1Vk42sA/77KxHysu
 GNGT/3jIM999/fpRCAPnV+I51ugXnIjc7aCDQOnD3Nc+2AM3gkHfOektmy5/d4u/
 67MsvvaOnWn7sHV29Z+Ri6U9jpkdPtzgfcah1JOuMr4iuHFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdtknu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 19:40:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24b2336e513so73520375ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757360407; x=1757965207;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TXIW4CE8LYawHSDmEPYejS9mxlDCMmxE1HIHyddZJyA=;
 b=H4Nsv5IUvUxFitlAv1EfLeA65pON/PKmSCqr/fPBtJENgKOs9x34n5Uy/UwExCtIuc
 gbgENKtDoFG3eZ22uIs6Q9+cMbzUC2WTcHhX+YbFxERQmRoanz30ePSrIUkk9NYYHiNU
 ibPFIPharSFheYW41a1pymlIFOn+8nO6k/kaqDilWJYqOpnCu/4vbnaxW7/Pe2ukrMRO
 a/rCHhsqLFD0EDxWo5LviUlqe/pRQ69pVQVRZ29USMDyBitBv47Qzhkwdk0i1w8AaeIM
 r2LSpfDIPpzFddf6FWHO1L3QlefQGzuRChQ9kpT2sOpmoehVOtKbREkRrWBQwaN8Edtr
 HVeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcYc7Hax/35pSUYUZInqf0Ny9fWcUEL2NpOldpXcpOYp5PUUiLfFkZJPPMcb0utUAm+VyXStmywN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtESOMs90hP5dNpRUZh/9sLDxeGNS3nH+qviefgd1KRLbZXdMQ
 1KQOMk4MiZQCMhUu5GEIUe6SQ8GvRfF2Be96aW4i2EjAAfcGl0H6A9fcHzZW3ouRMVlovmQJj5f
 NmjbSekiOQgqm7w0Lj40kgIcLdKtaKIhZ9Gydyaju7QAYAEvx36oh+HmzCawv2S7nss/zDGg=
X-Gm-Gg: ASbGncs08P6FPlvkKIpM2ckSXUxi7Qi2YYNjAsMSjjeU0GHqVeYAnL7p0fpPGk3wG6o
 IodoMPAdkcyUEPBSIypIwQTGMEei1aANrjOaW56kgM7ep7jx1l7ixRgBFNxzahS5tcHKS1/F+bP
 fHezVfT7UsZSPNx0Dz8x0Am88cnGJjhoZDhC1sEyO3ilpjrdk2nI/augbmTnDarWgG4h7KXBeiG
 BCzhkndOigl8V1f9TCv9IGY1uaLQ7/5A+ecVAvhOSMxCR1hD3W8JzicbUdL2q3/rZWHdf/mpa16
 B80sLeHE7HQezR/k2TL5LVMCNeB6JF6wLwPncNXkghHLCwk5lGyhRZr3zUtsnDau
X-Received: by 2002:a17:903:3d10:b0:258:2476:77c4 with SMTP id
 d9443c01a7336-2582476792emr35062505ad.49.1757360406959; 
 Mon, 08 Sep 2025 12:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3I62Y0ox2cbIu1BL+fkNIJFm5SwRP6C1uf8ev/c1vxlfovckwXEI7NkLSZwAzUfOtHCNDfQ==
X-Received: by 2002:a17:903:3d10:b0:258:2476:77c4 with SMTP id
 d9443c01a7336-2582476792emr35062145ad.49.1757360406497; 
 Mon, 08 Sep 2025 12:40:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:40:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v5 0/6] DRM/MSM: Support for Adreno 663 GPU
Date: Tue, 09 Sep 2025 01:09:35 +0530
Message-Id: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgwv2gC/23R22rEIBAG4FcJXtfgjMYcWMq+R+mFUbMrNIfVJ
 D0s++41CVsKyeWI8/3yeyfBemcDqZI78XZ2wfVdHLKXhOir6i6WOhNnggwFKyGnSkpOL8NEwzQ
 MvR9pDSLPdIGFZJLEtcHbxn2t5Nt7nK8ujL3/XhNmWE6fWLHHZqCMYtZYxRtupDDn2+S063Sq+
 5Ys3Ix/BDDEAwIjwQujeIFcyDLfE/wfwdkBwSNRmwZMqa1kCHtCPImMFYevEJEoc4OyrhGEsOc
 +hPQ2qY9ItJvz2NryNurBjVtlpFbB0uWSG6tklmns3GtYmm1tCGr9kSo5bdGMAzAAngoGJeYU6
 KcKrk079eP8LvI1Zj5+AXLB0wzzAQAA
X-Change-ID: 20240917-a663-gpu-support-b1475c828606
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=4370;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4UqvYbOo0ozDV/YFCMOiziYwPn3/KsWgI2LYvHpmupw=;
 b=6UupagRBc3X3EiNbsn33g8Z8cblahJQTDZ+nEM0bW6eyy5xmBiDLP9BRh9J7h26NjLOHYEZ7c
 tH021bkr5QtCtOtMfzQfny+WGvfqenhlESUO8KrufSntO9Pgcw5bhx7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: vp59v_R1lqZVSCiPPNBt9ovad594-sUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX9S3RIMYmf8M1
 sS3z+t/NqL9+5h3mwAD/NpP9r8baKFwHEdUcF8oSxxVB5LzD11bEblp4nb7qdUnKNgYyIwAeX8g
 AxcHOkLk/H81UPdrd73PICp4Oakx3PPj6/zCIxSeeCrv1gQNkv1IHip1FzABPOzMubL1XkuIKtk
 HNeX9bhx4OBPmx/ULgKkqGYdIP8WLX9j6neGS39ugrPSg0Pgg+vg283z3S5dF7PpR4l8XCRPMkX
 Np9Um3BvWuHrLVgrweEl+4jRBNx7H3nqbdiO9a1EJCThU5tRvTkPrsvaqKroTf0U3Zf+qNesNSv
 P5Ac84j2HYa1/11Hb67Tw6zm02Ltn84p9OzliTAahjSoBbaVoRBX9hSSUeECKsTbL20Bt+x5mZz
 /Q4Tkqjm
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bf3118 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=tVI0ZWmoAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=jTv6lf4Jh5MpNzVl0_IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: vp59v_R1lqZVSCiPPNBt9ovad594-sUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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

Due to the renaming of the Leman's devicetree files [1], this v4
revision had to wait for quite sometime.

Patch#1 is for Rob Clark, Patch#2 for Srinivas and the rest are for Bjorn to pick up.

[1] https://lore.kernel.org/all/20250803110113.401927-1-wasim.nazir@oss.qualcomm.com/

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

