Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29FCB097C1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 01:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E02A10E899;
	Thu, 17 Jul 2025 23:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dE6z2L0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B44210E334
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HNEsDb000543
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Yz5ZkUX+suGgaKXr9mUH/0
 YiWBvqd0jdhWimlhmg86Q=; b=dE6z2L0RIlS08dSgqJQ2838ZAB/Wutk8bVcdX6
 d+p877uymcRLeTvoFBuZECpSKgHH/HhQ9CbTBCYTrUQGXwaM2bn+OKuYtw0xevPt
 9ntRRIEVg6wRVCxhqOtNkRngc5zz6hXBi3rpjj9LezjsxcEeiw1xxclBlSJoZ0IW
 4joRQcBh0ect7P3nl/ruwkhiohYL/KhZ9RO3nbG4IDKvlIoNW+9jklLQi5tgdasG
 VSpy41LVWoYlRV9Ym2xKpqpkSg33IiZTlUHWRtQmCQ7dNolwIGN9tag1uUuFPb3p
 OiY17yAOLewA3Z7YD3GvUuFLlkEb4eqQOT/u/Ro3Gp/KuitA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drvhha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-31215090074so2241249a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752794930; x=1753399730;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yz5ZkUX+suGgaKXr9mUH/0YiWBvqd0jdhWimlhmg86Q=;
 b=P+AW/iIxtDb9qM9AZP1dX2XWPsFA3M/u9PuZJq3dHz7cNsK/qEfLBs9Hpzz1uek07x
 Uk3MQcLdJcaM9DtjdT8S/aH1Ovl8JE7QKHx0s2nMIeOl+WTKNBek/cFD0op+VQKkE/IT
 T60BzCHvTDPg6ekaXAMzr5hidQ/ChE2yk7mOoF14FmzUDHczWHobty8RBJBRGfg9/wE7
 K9/e7ml4WE39OyH0CXYVZZC/eRVEqmRfc7pqppexBy4h6ESIqO2uu1GWc2iB7RLkoS+4
 q5DvZnSJi067ioiAiuvwLJ1QNQfVk/IMlzJtnXte0eoiNG9LqQni4YuQN+NHKMoZTxoV
 BTxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHkSgjltILyXu9vT+qNejvQRdkALhKhfVdqcG/eKYCdw2xRewhFVhDwWqebe4Y6nwqrxRO32gjGGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPIMYeMNhODf4Mzagd18wOGcSY2I3lWJNym31ThBfnTw0DJbBc
 7PkUsvmjMCPVNT0EPNU47KuSuZCKXCvjFOuA1q+IRhgw1Ri15ZytU5NyWA4ZBt2eAMMTcQwhMej
 t9QwF+pPn82sGa+JJ2+beMAX1NDRFcONxOZ8daHNfyaJzNNAU+LTTaL+I6hMx4K1w5DFbe1Q=
X-Gm-Gg: ASbGncvjutaloYnLSnQcbIRXkqp2ntYyckg2zy7w2Ybq60ZElCHPgi//1VV8o6TyfFw
 G2cLUgBG1jeM9UWYBc/tbWurs/LuPeyqvzqKvtICm45q2peyEUZvlYuvGu+MUtlt+NZfCQoUD8c
 uyU9EzdkEh3NwMPldaGIAqtUIpKzIBjpSIRpIP5CgdYjnZ0kBL1A8BjoO6rrmjFeI9nAijmyU7u
 nMPhR0A5lLZssqQ3GChjmG/SAZQR6jclAglZlsPAGeMExyqdUrAy6NoBpesv84wTYrOaToddVGx
 +VKFfCRT5RgEcYW9nAgvKFCLqeEyzCD3FoGwwOlIdy6/RmLqjt/ulbVkcYKNtirRcYOlywVhdEI
 ZtCOZb9RhkK5t6Vajh8Ca1vES
X-Received: by 2002:a17:90b:55cb:b0:312:959:dc41 with SMTP id
 98e67ed59e1d1-31c9f43747emr10698343a91.27.1752794930347; 
 Thu, 17 Jul 2025 16:28:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeZSn04EmYEL+h/t9yfP7/sJS7wsCnlKQu6QgEAKxyzBH79jPsm+h7MWyyQYnvMQSkLJjfIQ==
X-Received: by 2002:a17:90b:55cb:b0:312:959:dc41 with SMTP id
 98e67ed59e1d1-31c9f43747emr10698286a91.27.1752794929826; 
 Thu, 17 Jul 2025 16:28:49 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 16:28:49 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] dt-bindings: msm/dp: Add support for 4 pixel
 streams
Date: Thu, 17 Jul 2025 16:28:42 -0700
Message-Id: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqHeWgC/3XNSwqDMBCA4atI1o3EPGztynuUIjEPHaiJGpUW8
 e6Nlq5KNwP/wHyzomBGMAFdkxWNZoEA3sVgpwSpVrrGYNCxESWUZ3Fg3VddmKoanAbXBHwWLLd
 WFdJQi+JVPxoLz0O83WO3ECY/vo4HS7Zv/1tLhgkuZCE5q0lOuSyHGRQ4lSrfoV1b6FcQRDDyK
 9Ao2IIKnnPNqLyUPoR0mOUjCt2H2bbtDfDZEZ33AAAA
X-Change-ID: 20241202-dp_mst_bindings-7536ffc9ae2f
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=3202;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=NTksIiK3ILvCnqxlzcFH7JIUO55H2AfzNNjxdbfSZtE=;
 b=q2mx7f+qusw7faryQbddFyq4FuzXuMHpT5OooNTFj/X3U+tTXQnAe8M55ksS7d0HsbtyMF3nM
 +fnjv8H99+WCMgk7Jy7sQWsQQjD/gYCOtdZ/IG61OB+HNzVMJw3mpu/
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: _Yu9747SY5yjNLJfjP1hhXsP1nxlI0b_
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68798734 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=HrLnuC2iPlrUScbyRF0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _Yu9747SY5yjNLJfjP1hhXsP1nxlI0b_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX6Ds+NpTWZfrf
 bopLzaUKqEg1AltXopnx/vDFJXCaSsn+gxq7Lz0P5HuyDRPyIJy745IQC6kvBScfZXAJmOCGYAf
 BnmzhQ6V/QGvOEQV3IqUEgZUaGhTxHwCtbUKUve06dGXUhp3whJGSOjL5XYTEDE9hmv1MnPWwrh
 d6lMdKoR7a3zHpVuW5FXlx/wAKrFJ0G2q8KsMWuhZz5s/GokEmm4Dzp22mMOjK/G4u2MK2s5s5a
 JLFJihSiGzH6V4xA64UEfDIipZjME6zvrmN6LRZST1cPqX4qaqx2xW9A5yyxhrwRBinCFRC6wLm
 YS/BEpPO9HeFrzQpgrA83nxyol44TyK59E5HSZOHbIoioX+3ZrtqGA3kcs9HcfXVl/Fq6jrHEFE
 HJmtzwOf+m9BhPfAt+Pl/+GDCB4yWD9oYFL9qc6D182rGB2QuRfs3E/z7EDUccnInJx7japY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=863 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170206
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

On some MSM chipsets, the display port controller is capable of supporting
up to 4 streams.

To drive these additional streams, the pixel clocks for the corresponding
stream needs to be enabled.

Fixup the documentation of some of the bindings to clarify exactly which
stream they correspond to, then add the new bindings and device tree
changes.

---
Changes in v3:
- Fixed dtschema errors (Rob Herring)
- Documented all pixel stream clocks (Dmitry)
- Ordered compatibility list alphabetically (Dmitry)
- Dropped assigned-clocks too (Dmitry)
- Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com

Changes in v2:
- Rebased on top of next-20250523
- Dropped merged maintainer patch
- Added a patch to make the corresponding dts change to add pixel 1
  stream
- Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
- Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
- Updated dp-controller.yaml to include all chipsets that support stream
  1 pixel clock (Krzysztof)
- Added missing minItems and if statement (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com

---
Abhinav Kumar (4):
      dt-bindings: Fixup x1e80100 to add DP MST support
      dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
      dt-bindings: display/msm: drop assigned-clock-parents for dp controller
      dt-bindings: display/msm: add stream pixel clock bindings for MST

Jessica Zhang (1):
      arm64: dts: qcom: Add MST pixel streams for displayport

 .../bindings/display/msm/dp-controller.yaml        | 53 +++++++++++-----
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 14 +++--
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  3 -
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 12 ++--
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  5 --
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 11 ++--
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 21 +++----
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 34 +++++++---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 10 ++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 30 ++++++---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
 21 files changed, 235 insertions(+), 133 deletions(-)
---
base-commit: 7a88d609b069b7d2f4d10113b18fea02921bedb1
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

