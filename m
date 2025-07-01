Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA30AEFF80
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D02010E5C5;
	Tue,  1 Jul 2025 16:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUvhWPrk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF4510E5C1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 16:21:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A0Upw024794
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Jul 2025 16:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=d/3iIbnpeu0qJbEV9ptsqW
 QCU/46RuJv94u+DuK5iMw=; b=JUvhWPrk6HsCBLsPYyQ2nN1Z3YHNct/c4iTIaf
 qpW/UmtI2RY9qCbXoB08muE9by9ir7bNv/QFGuj1FUZhAY/BC3vsS00tarygkaxb
 AApX0irwbCyYndDLOE4Crp1svDyLJj9DawQ/SNMfHm8I9y1JP+mQwcQ9TtVXK9ZW
 pIkNuMw/mRy1w+8qW1apVSHs1yoIffvdA9OcD5cc+2CHJSj7wA/RQjWt/KEC6cuS
 w+DCfvDdox4fwWToz00MaSVuORc82GgKzGn0zI2FB16Dyop3/xbjT2fuuQoqKbxT
 kSY5eu5uLmRz4GJRF/OHuSATKHr8+Dy9rb+ArCbo9/0k6R5w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9hkcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 16:21:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-740774348f6so4968508b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 09:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751386862; x=1751991662;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d/3iIbnpeu0qJbEV9ptsqWQCU/46RuJv94u+DuK5iMw=;
 b=CSq67gSOsve3n/hqMVsewFdNdHYjAI85/Ct+owaC7gNc4YutrMBPTiVxQwxboRU6jC
 8kdf/Om/QnxD17uKKSByj+TOAY7DOu9yoJedXq8oWAJpxZ3L6+XPEBF4wMErISO1eGSz
 uR6e32bLXsL9Dm5wcpuwMOCD6XX9ywfimcCBAGOUeTXxHbAtbmK9zMuK7Ke26trrqIRm
 AE25RmsTkG/B0obOuArdEYck1XlE40yBtQ/6IEjsNlHhDPN+uzca2j2Gy0MGhzduuvPH
 A8RAzfw6hUpZ/9nABpbi9MQ0uQQ9QuH+Xz/gcTD9v64uFYMWHuTuEbYxCx5sCaP8LRX7
 jesg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy8pKF0qCd1UpHre14z35ZrM72lZYyaO+pKduaV8STg3howBG3u5m262J+aTJDyV6YmX/KSp0hjwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOFgEdJHAmQz2/h5S2kKeYda0ne5n94UcRKsXaeUBDQhwqrQ4v
 bZ52tcjGBucR83HzXZ+2/fdiZ+z91ZULmiX94oIEPU0YSxT0ZfGliX99xQhgFRRUTdmQCNB1FNq
 OoIPTUJWDaEawxvFBg4uldl3bTK0ziMHJQYZ40WaHYcvHrstTTUdspL+tokxh/Yve1K3tDNo=
X-Gm-Gg: ASbGnct1ElyKk2mmVDS+ebFOX2GaJyRcKybyqwrpHgrTiRY8dzYF7AZUv0CbJUOiRGa
 S4GBaTC/aOKGDbwh1O1PuC3Eiema37lKzCSP6jcb79yXtnqsnwo3GjHGjYyzKCHvTR8/6tsW3+6
 MMW7iV227i507RAniiZw11hRtILzO1lzJLyEqKWG/Cws5CxtQ1Tn8gXCgtKAqAwrG9Ah1lvIYd4
 5qX2KjMPVWJCyq3HbK3B51INyUbHV08a61rDpnbbiZd2RhhOyowI65o3xyAyumq2E0Q0uioMAy8
 JOFcvz7EnCuPXutbbnez72Jj8qEW9sCZpTWn0FKK/KzM3yQ=
X-Received: by 2002:a05:6a00:b4f:b0:748:e4f6:ff31 with SMTP id
 d2e1a72fcca58-74af6e509f7mr27760135b3a.8.1751386861764; 
 Tue, 01 Jul 2025 09:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAHQZsjyCDzYg3ZAR09kxywZO5hi/ZzLk8nMbCVYX6mp+IYAjPdk1zCQc7upgp/wjsAy+f3g==
X-Received: by 2002:a05:6a00:b4f:b0:748:e4f6:ff31 with SMTP id
 d2e1a72fcca58-74af6e509f7mr27760072b3a.8.1751386861187; 
 Tue, 01 Jul 2025 09:21:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5805265sm12573010b3a.168.2025.07.01.09.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 09:21:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Support for Adreno X1-85 Speedbin along with new
 OPP levels
Date: Tue, 01 Jul 2025 21:50:43 +0530
Message-Id: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsKZGgC/2WOwW6DMBBEfwXtuYvWxiXAqf8R5WDspdlDDLWJl
 Qjx73HJpVKPM9K8eRskjsIJhmqDyFmSzKEE/VGBu9rwzSi+ZNCkDXV0wodiTAuzHyXgaNCSa8h
 41fRdA2W1RJ7kcRDPl3eO/HMv4PVdwmgTo5tvN1mHKre1ajE6A38fiwDpT2qpKX8LWh85zKhV7
 62evHHWDNnAL/4qaZ3j8/DP6uAfU0X9P9WskJCo507p8TRp+1W8nARXFxu47Pv+AgG2gXIPAQA
 A
X-Change-ID: 20240807-x1e-speedbin-b4-a0c304d13983
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751386855; l=2493;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PXhlqE+RLKyz8eL7ircdqym5btkHj/B/miez7UaEoMg=;
 b=8RPMZOE178+e6hz/XUQAKxMLWfSNezm+eVyLA2bm7dQs6OTODAc9guipMaU1GUsXWBff2Q5lZ
 MBzhbGhEwr+DprIPR27QbZOs+kVRos24v4UZSN0NtPB08k9FXyJHQIW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68640aef cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=yFGAn9Q8HXAzXJEDlGEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: vKApboFdakf1b3tvk2Jfo8FRFu9rMbKk
X-Proofpoint-GUID: vKApboFdakf1b3tvk2Jfo8FRFu9rMbKk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDExMCBTYWx0ZWRfX8COAHN4BlJSd
 kmrR5YPiRB5uuEjwE/ouC3wGRKdqwvbYqTk6GcfTGItnV/b9dthqgA1QRJ/ryE3jg5Fsz7xWDTC
 WhdbQ1zcDb3Wl97AkiUhZVzYWS1+ddxcNNoxCeflx6fGLKfWMajl+fiopOkYC7qseFdih/S+iEj
 ioPWkqGL6B7V+G5Uhu6Oohc4+3XrzKmvWPkUd6XSj9+OwydVcqlSUf5GuD+tUzx+hhoXFiue1Jc
 SXfU2DFPaBNEfN2GOWU9mYtt7etOpR9HhGIdPzYs2UobO1YAdL7B9qG2ilJI01a4XfrTYqQ5LO1
 lCMN4RR482nd/+f+65pnjT9dU8k4r2i4rZn+OZ+R/IIqLOPppq9oAyS34S2K6ILAJTM6SgxGBSI
 AZKD27qMdqb0kjhB3NLO2OB9Y9jSI3KdCloh4OoySfaAP8U+cR7Ls0m+Po5gdJvDoZpHCIwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010110
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

This series adds gpu speedbin support for Adreno X1-85 GPU along with
additional OPP levels. Because the higher OPPs require GPU ACD feature,
this series has dependency on the GPU ACD support series [1] which is
now available in v6.16-rc1. 

The device tree change has a dependency on both driver and the
dt-bindings update. So those 2 should be picked before the DT change.

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
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
Changes in v2:
- Rebased on top of v6.16-rc4 and Adreno X1-45 series
- Dropped speedbin-hi bit because it is possible to identify the SKU
  using just the 8 bits.
- Dropped the qfprom binding patch as it is already merged upstream
- Link to v1: https://lore.kernel.org/r/20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com

---
Akhil P Oommen (3):
      drm/msm/adreno: Add speedbin support for X1-85
      dt-bindings: power: qcom,rpmpd: add Turbo L5 corner
      arm64: dts: qcom: x1e80100: Update GPU OPP table

 arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 57 +++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  7 ++++
 include/dt-bindings/power/qcom-rpmpd.h    |  1 +
 4 files changed, 64 insertions(+), 2 deletions(-)
---
base-commit: 88bf743cabe5793d24f831ef8240a0bf90e5fd44
change-id: 20240807-x1e-speedbin-b4-a0c304d13983
prerequisite-change-id: 20250603-x1p-adreno-219da2fd4ca4:v4
prerequisite-patch-id: 4332cdf1f4257a45ee565eb0fad3af0e814be464
prerequisite-patch-id: 41ffbd1ea7e32b22a90b5d139e5b1c0dc2d38496
prerequisite-patch-id: 8dbc74e0f6c059ebdfe5ab0d883477011953e025
prerequisite-patch-id: 912297c03c5d233f6e38a91c769cc6518bac4411

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

