Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5B0B281BA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 16:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5563810E0B8;
	Fri, 15 Aug 2025 14:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="njNXP5y2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE5F10E060
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIlHx017486
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=xKUxqUakXVVJwGJfwjTjI/
 3/s/4go7L7H//VCeSe2AQ=; b=njNXP5y2cpu2CcrqwDAoqUq0rDGIhBiC6wIALF
 4nI3wkIwtQaU1tpQcbYCi8n6cj5atVy4wGYHX22AxJKXRRchS6Dm7kIiRXdvWpdz
 D4KXzd9F+Ey6+uNXbCnpnDCN4D+AsrnBy4T9jMfS292gWGaYy2RcERITK8JQFqF8
 eMWtZCN9O512b5Sc3mDvPynE1DabWoqE6XBv+YVcdnax4G4FW/Zy3O8rbwLui8Vs
 oE3gOtbHQ0yEJCLgBKcjqVHhIjql702+ig0uJ5yI1NARxYbzX4Vp05z3+tKf+p0f
 C4ev8rlLvrUqNUiy9Ja6yxKcq9Otbx3a39ozBBdn0R766a7w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxhfbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a88ddec70so19562216d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 07:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268236; x=1755873036;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xKUxqUakXVVJwGJfwjTjI/3/s/4go7L7H//VCeSe2AQ=;
 b=wHSPHwiWIDEmrpPWVTAvv2qjcs6FmC/CWjCtGtopFhK2TiOpo+XOJYXBU1j3TIflqD
 F3osg9IshneTGKrvTw9M0FpB1ycfytKoO/6hfZWMhaLcMewwk+KeYPDRPAYcHhUgBkE4
 aJICwmjvfz4wKlL0rfE2ialaiEZQxYjh+JTFTOMdaN37QmgCnmQV6PEijCHLLiUZeyqu
 VHzEf4WBNHjK5A7a8nw3voG3REGHcLXQkQUXzBdUYs750U6GUb6TZOuMTHQBLUYlrcAd
 myCnP7y+juOgxheV9gU7bjx/vYoZCMxkQu4TZCmmpBM5hm7YYj9YcdLgFHI8i0Yr0ty1
 JLwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS5GT1NxB8GtWK9UO8ah+VetEDiH/64CBOWyfDLsI7SxeqjPaAomiISSv8uoOPqNPRaedtdh5XryQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBwcn6t8JLMRnXEMZVB+anVmvE8+jbK8zDkzHKuEwUJx9/HDun
 zLu/7/5r98atJUPU8cSewO8DCDMqyDVCCHfdCbnpoisQOfl/zz7mE/k0xZ+yT8SOi1UjF/j9Jq4
 zrJfvO0wvKUYBeWpe/npemDuP9JMdamYKdo1m8Q0ivC63eJw4fTEQZoIwm+fn3pxLJFP5LcI=
X-Gm-Gg: ASbGncv39vmK2u6WpLS5ZmpFcCAsH+jExz75RTWu8uvsgmbJCkgZEEuSLPAK5VyEfel
 edxNU8OFfj/nLqWMr/7x5m4ViOG6n51LxfCb/q93OwD55izNr7hYeejMabMHiH8+iaJdoy0nOkh
 M04gtH3k5BepezzO1PmFOJqcpI+Uw+k1LqbXna/11Y33PAkwE7FTh6NBCxekwX6q6xnvycor7Tr
 HT2D5l1qG9MVgm5gpYCLcuUBItsYdD8gXD8QKALAj6dNCxnMHc7HGeznMEziBmhXxoqoS+mAVhz
 6C4Yx67jhGKm7PAZR6eKVOBJiDaIOFhHY/I9kSDHj0QwYdfDI21BJYlilg2ejueuHPMpFguGqM/
 p3gWJT9XpkWBPkgkxy6tKcmqHJyFtpzcte4zD3dJLVjj7pijBSdJG
X-Received: by 2002:a05:6214:cc6:b0:707:6161:5988 with SMTP id
 6a1803df08f44-70ba7a8abccmr27697236d6.7.1755268236040; 
 Fri, 15 Aug 2025 07:30:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKls0jJzx30qUf8dAuDYp42OoO2+G5R2cjgAapJP5umqOkhX87B5oQFPnKJlUQW7/cVX+lUw==
X-Received: by 2002:a05:6214:cc6:b0:707:6161:5988 with SMTP id
 6a1803df08f44-70ba7a8abccmr27696246d6.7.1755268235199; 
 Fri, 15 Aug 2025 07:30:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 07:30:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/6] dt-bindings: msm/dp: Add support for 4 pixel
 streams
Date: Fri, 15 Aug 2025 17:30:27 +0300
Message-Id: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAINEn2gC/4XQTWrDMBAF4KsEratU/7azyj1KCbI8SgZqOZEUk
 xJy98oJxQvXdCN4YvSJeXeSICIkstvcSYQREw6hBPO2Ie5kwxEodiUTwYTi5aDd+dCnfGgxdBi
 OiVZaGu9dY0F4Ul6dI3i8PcWPz5JPmPIQv58fjHy6XbdGThltbGOVbJkRyu4vV3QY3NYNPZm0U
 fwKmmnJloIogm+EVkZ1Uth6P6S0vVztVxH6mZEzU/FqycjCVMIBq0WtKyZXGDUzNWuWjCpM20p
 uwMgiqRVG/8PoieG19qAr5eVfSz1e1UcojSXMr/5JaxPQaQjzbhPglt97mzLEMv/4AUOwPEv7A
 QAA
X-Change-ID: 20241202-dp_mst_bindings-7536ffc9ae2f
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3828;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bQapPzenZLyTGK7ECXYfIjUl3GjiSCJxWw0TY4elCgM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SH/tT78u1LLbXDS+TPv5j3dB2r80a0zqj4y
 IYLLH+w6MWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1Vt2CAChlv+VPS1gkmTEv3nFDlmH9JWGwstHv5HCMGMEi3a6Sg4mU8aM2g6QX4PGWh5Lfb853Ir
 O1KFH5lOCcmYIbejcLoC6p7afpkdVKj/Aho4Evmvw/qSgEKzA8JhBeYUT9Du3mkBsVkzo/NWK1F
 WU523oRGyHwcEnkzvmmlaPLFjHNWvcCO1aTaYA8oQndYeEIWXN+bFiyO4VJFl1gPwQdUR9Q3AE7
 yQrzMhX4t9MyuJlfEkzIxlgn5c5sGW/H1BVQVfevBE7WTI/AwjqSF5ukBxhDV1aTWAxtRCoJxeV
 lQlCa104AyiwvMAFtH7VUmSUwSH3W1Se8HC+mH92k9k3hs8N
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX70AgF8Y4j8G/
 F/CYrtCQJOziPZ2bw4iBfMV460xit0iCo8uNC8op/IWBL/tfRiSXbsNnlaN9Wb/Z1MFnFpYxV/R
 ModxoBvnk0Qd0WqtcoKwAGJ7PedcO+X9QJ+A6ow0yfTas0vTnqiGIaVTeSDQ7zIdGLOmDq0BRAS
 de6qWM0wcDJ3/pLHC2EXkllsvHEkgQLDQXwSZuQmv/fkcKDZsXaz7Vd/8i8UMgWqv4RLU5n3mwv
 5dCxQGap8tkLasDAsu5IcDhReYs/kiUuWROsOFKLWQofi2W8w41/xiBKbSeIFuNYw4QeTzCdoXA
 182I1tXgk9aBmt8oMeGQsz0lm4q3EsR41aPo4Ki5qBWo4LIe0NPzvZIKYAlxzJimQtI66OA5FOU
 5KBYNyLE
X-Proofpoint-GUID: 2N0kafLg7blB1QNsdgEYEEVmkx31c2yC
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689f448d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=nKDAeR57af22TOinyaIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2N0kafLg7blB1QNsdgEYEEVmkx31c2yC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
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

Note: SC7280 changes depend on clock driver changes and will be posted
---
Changes in v6:
- Switched platforms with different MST configrations to use single
  properties entry instead of using oneOf (Rob)
- Link to v5: https://lore.kernel.org/r/20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com

Changes in v5:
- Removed SC7280-related comments, it has no DP MST support
- Link to v4: https://lore.kernel.org/r/20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com

Changes in v4:
- Picked up series from Jessica by the mutual agreement
- Corrected Rob's tags (Krzysztof)
- Split X1E80100 DP patch (Dmitry)
- Removed SC7280 changes
- Enabled the MST clock on SDM845
- Link to v3: https://lore.kernel.org/r/20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com

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
      dt-bindings: display/msm: qcom,x1e80100-mdss: correct DP addresses
      dt-bindings: display/msm: dp-controller: add X1E80100
      dt-bindings: display/msm: drop assigned-clock-parents for dp controller
      dt-bindings: display/msm: add stream pixel clock bindings for MST

Dmitry Baryshkov (1):
      dt-bindings: display/msm: dp-controller: allow eDP for SA8775P

Jessica Zhang (1):
      arm64: dts: qcom: Add MST pixel streams for displayport

 .../bindings/display/msm/dp-controller.yaml        | 97 ++++++++++++++++++----
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 20 ++++-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 10 ++-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 10 ++-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 20 +++--
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 34 ++++++--
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 10 ++-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 +++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 30 +++++--
 17 files changed, 295 insertions(+), 103 deletions(-)
---
base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
With best wishes
Dmitry

