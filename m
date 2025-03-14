Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C30A608C7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 07:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9C910E957;
	Fri, 14 Mar 2025 06:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KR17KZ1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF4810E95B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNQwsh003492
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=aPJH6AMt3R+0o42l1hNuer
 OXIrFuPaoPXNlRFcEX02M=; b=KR17KZ1jGpoMMw+0ZRHfo83sMMfmCxecGflW5R
 aoSc+1xcAPkgZ193ocpHsQy/3zlSQe/xP+KvW4Op2x9ZNkxbQIa4nCMwkLmxokEG
 IegdU5EJumfyzxOM8TiUDr/99yhI63v8l2xXv6Ewb5+UU/1XRfxM5YZK+zT2VpXX
 8nXboHXvmhC5z9MnHEiz2bMHYW78GP8i2icmHURyon8ZyoXMwtcgR4vj21ys3acy
 U38YZD/MFLsi5T8XE4cqaQa10pXSTgFWxo4dUH4Sigc7EyZ27dBHHfUDjReG5P9y
 Ybre4wHP/mS3ml7fxqVVxwtpyu8mIGcXtqiC804lGOurNvgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96ye4jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so229573285a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 23:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932556; x=1742537356;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aPJH6AMt3R+0o42l1hNuerOXIrFuPaoPXNlRFcEX02M=;
 b=jCw1SEd0/Xu657bD9Rm2kN4yWN7vqI0E17Ui4jdg2ZwfXAz0sHtwsfi0gReMHpa9UX
 P8qhssnLnVr9U4b39x+Qi43hkBI4uK4+GI2e6DQZfcCNlHsSPKEGW0dlS08kJZ3k1TqD
 gF8f619/I9i/ibseeSmVA6IGXAW87JyuugY3bo0CZYI/snoxaQ+rB1WszB+HENsAgQLN
 dfSjhe6F+JAGRa/PfnXJBVEO4Ugc/n9kkptz/NKjeOYNTiv8gZo6LBlTJJb1RZlwrdYY
 pMvFZvk9IoaziSXuFDSvpPabHItgGqKLjTIB0TkKQ5l/A0LsYhLBWkobc5AUdQS0BJUQ
 xVpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMOMTTdHsnnSkOJk1CVjbhc9jPU0I3M31EcpAYHQ7x6KLYUHbAM+ctLZ97KfxzAITqsxtq52A1dJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyyoc7Od+l7I/3PYOqILmYPCtbrebVDij/RPxcrjW7izHU2VDFb
 YXkvaemsPFi9AQBY4okvd5xFrlgibrrW3umuw4sLBSIrmp78/KC3ZAUbJ9QK1psEuHht24xEy74
 0ZDd0HpQT70m+GgiKPXq898WpCPW0ASVEMh+0+ABW2Owh7Sr95j91CpEezvIWlQb4rSM=
X-Gm-Gg: ASbGncsKsPYjKGlqRKeZEtLQgjtnMz+FUXWyWKvUC5WIrDkNnUxKG6XskZzk/herLPw
 wkUezsbbVQhz+2PFTW2tAyUUw6I3K4Z5mqgoQZFpSMKiXEP6QhSLOgFnOciRYZn2wVULWcCOPsS
 PtxrxlYa11yji84zD5coK1op2p/nK6xJuiMIRtYZBUFWL3oglo1bt5pYPpegd5cCPI/bBFhZKsB
 Rb322OTkVUJaxFw68av+95VzDB07tOi4+yiA7kZVUALUe2ZXSO3d8cq5TvuI5oCZuLVyUk2txUL
 jejWqX0c4Ovbl/6yq1E6FP/xgOQQHcYk0pOIs/btXa70vPNzOgMNKjQr74jIxcg80PvBLybdac3
 ZDvC7Nz/VGg20VdsRmS8U7k7YzMbD
X-Received: by 2002:a05:620a:4387:b0:7c0:c469:d651 with SMTP id
 af79cd13be357-7c57c8f2fafmr153252385a.57.1741932555831; 
 Thu, 13 Mar 2025 23:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU2fdH1nYknRxmyE0Pv1gs73Y7wtDiY6qmVkZjEOFWyyh/E2KJTtu6R4id2U1COR7/iYgZsw==
X-Received: by 2002:a05:620a:4387:b0:7c0:c469:d651 with SMTP id
 af79cd13be357-7c57c8f2fafmr153249585a.57.1741932555466; 
 Thu, 13 Mar 2025 23:09:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:09:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/10] drm/msm: add support for SAR2130P
Date: Fri, 14 Mar 2025 08:09:04 +0200
Message-Id: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAADI02cC/3WOTQ6CMBCFr0JmbXXaojGuvIdhUWCKk0iL00o0h
 LuLsHb5vby/CRIJU4JLMYHQyIljWMDsCmjuLnSkuF0YDJojWjyr5MRoi4NqOQ0P91E1nlD7xlN
 tEZbYIOT5vVbeqo2Fnq+lOW8i1C6RamLfc74Ugd750LuUSeBnv3PKUT7roVGv/v/bo1aodFs2F
 n1pz8ZcHxycxH2UDqp5nr/LdYw04AAAAA==
X-Change-ID: 20250308-sar2130p-display-b0601fcfeb30
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JcgEM0xedYxu5bYof0Ovcu0EaEeskIX5tXdtwYapZDI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08gGsPRmM7wX4zdSQvNqp8Q+K5YNl0IUjqldp
 1a8iYn/lUyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PIBgAKCRCLPIo+Aiko
 1fvtCACoM5/p8j/jiu1MRW5fm7gny1R4+IwOUzJ3uIj1j5bnsUYdAGdgeJdtDhX24RsqIWpk1U+
 Me5C1z+Bp953zcjJx8/lOJFsjdZV5hOAqQjeNkTeFgFpMtT0fyAzzL1jycxmXWGy9XgIB/Z/bMd
 soyL74eqB6Dad2frQ+7rs3SJNZZhQt+Aab4+RrTpmpSp8EeiC5nndVMn8ZJrGiZvcha6hoxI8Do
 +FHJP7cgHGqFPBSNasJ3TQl0pxVqosTAgBKBNU1Ec0UtmUwVpy1BvjmZov7f3jBB3Gc/Ur00VSF
 Q9ws5Dmd1JPROErmBHfToVHVPPUHi5O2BWiIFOFdqco7LRcd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qCMNSDNDm5jD3jucmHXxSNTq-w3xg-rb
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d3c80d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qnNoV65vq9fCYBTq3NIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qCMNSDNDm5jD3jucmHXxSNTq-w3xg-rb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
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

Add support for the Mobile Display SubSystem (MDSS) device present on
the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
controller.

Note, due to the technical limitations DP controller wasn't completely
evaluated.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- In MDSS schema switched from list items to contains: (Krzyztof)
- In MDSS schema dropped extra empty lines (Krzysztof)
- Fixed .ubwc_bank_spread in msm_mdss. (LKP)
- Link to v1: https://lore.kernel.org/r/20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org

---
Dmitry Baryshkov (10):
      dt-bindings: display/msm: dp-controller: describe SAR2130P
      dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
      dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
      dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
      dt-bindings: display/msm: Add Qualcomm SAR2130P
      drm/msm/mdss: add SAR2130P device configuration
      drm/msm/dsi/phy: add configuration for SAR2130P
      drm/msm/dpu: add catalog entry for SAR2130P
      iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
      arm64: dts: qcom: sar2130p: add display nodes

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 439 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   1 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 394 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 434 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  23 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 15 files changed, 1313 insertions(+), 1 deletion(-)
---
base-commit: 613af589b566093ce7388bf3202fca70d742c166
change-id: 20250308-sar2130p-display-b0601fcfeb30

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

