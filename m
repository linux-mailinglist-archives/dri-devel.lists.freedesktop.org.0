Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D633AA89821
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E9410E6AF;
	Tue, 15 Apr 2025 09:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmW0bNr4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1FA10E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:39 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tFvH018871
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=V8/InWf/oEp6mC1XkXIEKa
 Vat3glgwm35TmdtOEWZG8=; b=SmW0bNr4aipfz2iUbnS7akLkYvwi4n+q1kzQAb
 Z4ggY3zeY1GRWHOrwGJC8yFh6czu3l44zUUQemIy6uXNASeFAF7FVVQ7R+2fYlcT
 uO8GwSWvIZK7+LwGAQFQTYKho3vYoZ7NHR+Ie1dJmgoxW4eUPgdpGNNHiYn2jz+X
 ZXYr6VVYdt3NnrAkM1lI6K1TsW8O5eY0U1Rft223nDcub1knNIpstQ3Y/8i6KYNK
 dbcTpGUfFTKEH/zZc494PeLaCvuvoc+7OKO1BkGPg7v/zvoysCHFuAchmBbsI38/
 z7wFdygB+q+S7ZQVl38xYUxecpm7OcCCrPwnqMtqvzqRD+BQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjfgaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5c77aff78so1552954985a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744709978; x=1745314778;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V8/InWf/oEp6mC1XkXIEKaVat3glgwm35TmdtOEWZG8=;
 b=CXJAq6BDUjxcPfmd1DNSODDVTXIIb6yT4B80aei08h/lw7ytxeLtepX11xmgL5DaYe
 NNEl1j0EXAdObQnhdFnOABOB+6d6ourvvH04v5PiKt5cArH0LQjNaU92l3TPQ2D1RHuk
 vaHzm+YWEUjCV/tZj2EpZH7aodpjImRno847yTnuq0iTZmLoLyMjZpcwQFaMgoq3kYJz
 oRpEybZ2yDV7P+Za3na+FlViT8+529gvTA54asQS28jDbrkBQDVAtF5nlnsofqELKxUJ
 G4vg04XIY8dTpYL6mmf4vFUm5qfWtYzY9SjYpSCM0VBnWfSaGI2XJjRCKpfltbEgrgXr
 wRpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOE1lvOn7ztLIhoExuMwA1jMX9hEZqPMDfZqkz3kgXETjPLR4Fgh5JSWWuN4l1tsAgTW3NQHylsog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4vc+gjCeq48lYokvYnwF0K768WKSZ2ULknSzGmuSo8Xqa1LK7
 JgtOY7W61O7O97uu5RlvGd/I7/s8G8PNT9/ksVxP0ZkkFjIkRk8Z6IubQ8wDLpWokp7ebkvEnhk
 WQcrd35dt6HFSLAjj6OrRfQPkVKoCJrPw9fksEtlOWIZ+apHJEAdSERAoiTaHUeyoaaU=
X-Gm-Gg: ASbGnctOhjAyqb3KTTeJTHadaJ5rXrvbsgog1ajX7LEeFG5oP3j6Lw/ztQOsl6GbmLY
 e2nI+lQp4ddSIcy7uMv/FZacIc5RBOnfQBQ6xsYJasMrmrouma2Iwd2Hm52ahapiqEwQjrO0dyd
 bWyTnFddyuVGX83MxpeiZExpVnj5PV+NY/ZxZ3dmHLZCO0wHaJk2+tv8aT2U2pvoRabGjM3y0iq
 1YVp1v1BP1RkpR2n2imXwN2g136KyEC335/FUdReN3GNUgL72X+Fii4I01ItNkoxPvC4gaLx0t8
 hTzRTmeyBkTgyxolz6AJKzBRjOrBac06zFTu+YzTOhO0N1BsuNemh9Ye2NNVwGpRW8iviYFblBe
 iNkANFQTPrJrX5tuaqNjqaXFZ
X-Received: by 2002:a05:620a:2941:b0:7c5:57b2:2cb7 with SMTP id
 af79cd13be357-7c7af13effdmr2310019085a.56.1744709977768; 
 Tue, 15 Apr 2025 02:39:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4rACzgVsYI3BzPQGoMw4ZxLMn+GpdVuPdRl/4ZF9EcAu0Pa9lLDPfkwsny6yqR1/CgDYg7g==
X-Received: by 2002:a05:620a:2941:b0:7c5:57b2:2cb7 with SMTP id
 af79cd13be357-7c7af13effdmr2310016085a.56.1744709977374; 
 Tue, 15 Apr 2025 02:39:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:39:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/10] drm/msm: add support for SAR2130P
Date: Tue, 15 Apr 2025 12:39:28 +0300
Message-Id: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAp/mcC/3WOQY7CMAxFr1J5TYqTtKOKFfcYsUhbByy1TYlDB
 UK9+4SyYcFsLD3r+/k/QSgyCRyKJ0RaWDhMGeyugO7ipjMp7jODQVOjxUaJi0ZbnFXPMg/uoVr
 8Qe07T61FyGdzJM/3Tfl7enOk6y2b03sJrRNSXRhHTodionvaj04SRXjFLywpxMdWaNFb/v/fi
 1aodF91Fn1lG2OOA08uhjLE82ZbzIdBV18MJhus9q6q0bimxmMQKa83N7wKlnnAaV3XP7wHV6w
 oAQAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2735;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8+FdRKBRcQNHe/n056K1ZGMprSxiSZfCl3rDyLla6E8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilVQblGdMJpbMs8bFSCq/qV9blClDIrPNXU6
 68xeWaH1FuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVQAKCRCLPIo+Aiko
 1YZ2B/9ihoSC4zR3Eh0ZFAbhucp8PMMkr8PUnF6yxorCyMNhIOUeGw59NXQ2agjKOhmZKNGyVeq
 2PIodoZBADp4xLaOIJvTAl8kTIpiTzAGCM4NENMGP71c45NOsrqdS2LwYdLWb/D3ousXN2mvLTG
 No5siL7covudh6eimBrUt1Z3meFpoIzAW8u626EL43LRw5PYxttaZDPvdfEtpm1Mhs68j3IdpWO
 FwogpnPBKKUKAnj1pLbzXxNZN7vV+p7BKHSCDPWjZfuVByr+oxX9D68q/ePAJK2xNaSKDiQa6HH
 LguDGt1yqk7R2lhJDP+UtaMyk2i6z0OAO/GNQ3NVXiZxgZav
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: xtjsSp3BrwhngzGWcUP0dL5QoELjHLqi
X-Proofpoint-ORIG-GUID: xtjsSp3BrwhngzGWcUP0dL5QoELjHLqi
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fe295a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qnNoV65vq9fCYBTq3NIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=986 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
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
Changes in v3:
- Use defines for DSI PHY clock indices (Konrad)
- Increas VBIF region size of 0x3000 (Konrad)
- Link to v2: https://lore.kernel.org/r/20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com

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
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 395 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 434 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  23 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 15 files changed, 1314 insertions(+), 1 deletion(-)
---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250308-sar2130p-display-b0601fcfeb30

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

