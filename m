Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D30B1F388
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 11:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1088C10E2A8;
	Sat,  9 Aug 2025 09:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oF2g/917";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B25510E2A8
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 09:16:25 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57997N1n017704
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 09:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=/ffwC2GAQOGujPV38YVMda
 8HrYD4lzAZbhtEn/Y4ldE=; b=oF2g/917hIxC6UoLw4dyLqSbzIW1YBhhlwEsg6
 d1iB2TA3SRIhk0iBv154fPTc3qk6+a3i/7ACV55t/deAVn3DlkCNkbeiGDe1TMQR
 exjZkO9Syv8Sxbc7W/rdyUUy0ALjSCBqOsC49RVIXyHAqow0oJ0V498sOzE5/rS5
 RvLJR9R0bjeGNoZM8l2xAO04jVjiUMIn0r9ftrDhtRo5b7lOGWKcPWTczUa5zmqC
 EAs3MxggMIe3dioTzZabDVwtkgO7alsOUj95AQtXVKOik0C6WXvS5oVCtr2B1gVC
 6YTit/O6Yzy0JokzWHmd/aKpZ1LPgp6XwRyGtTqJT9qhYEeA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj40cqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 09:16:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b076528c4aso32506471cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 02:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754730983; x=1755335783;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ffwC2GAQOGujPV38YVMda8HrYD4lzAZbhtEn/Y4ldE=;
 b=pfSTRsRBSZc5evH/1hJTGM3LIOYKUMVWlsn74cmMlGKetKC23NWgi6T0XSGRfOTEG8
 TGJZfh9TuQJn2C+r8J8B0gYJC2a5Dwo8J1+88+3IBd708foBb9XuL2voM0VMbgbzPlub
 DlmyP12SWpVZspkmd2s1Ln6zKgOdFBPShVPK+ISQf//eRyKZFVFNT4yavdZ5aOL2NKEI
 mM6O/hWM/elze0eDeZDdPFTG98nMwMoYrJiXk1YWC7p9GGdcZ+PKftz/pe0W5mtiuS8j
 qZwpOS+so5ESqlOQWhvwdFj/qIAlnR03mnU+FBAyca7I0TGhbCRfS6Y9Uzv3mE0Po04q
 4keA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/nMKtL6hzxKJRYIrnOlKcD1FfxJsJxD8aRj9NEvgyz9oMmDxX3WQ5/+3l0ECFPZ1pb3ruJKpQiFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEARE6PVjPne2sbBD8PYacGwo3sR1A0BYce5VDQgdj/u4RHkQU
 qK4ZZfVuUyZ8zXavr0Z4BLbbGfdQLVCbIAk2QEshzG6BnrfQnWTRXmFXkGXRvVASNqOX53vaU0W
 1Zef4xoaiQeBW47Yq+BUi2Odd4Jy+XGdKlSdBzS7I0Vpvv6LcnGAuhie+aXMei65+6Ye2FgU=
X-Gm-Gg: ASbGnctNQ+yUE0uZX5WJDfUiyoUS1N9btoz5p5HJ0iTMC9FaUh9OEIyjMdcTt14GCju
 1M3KMU4jMfkda/ifxcUAfJBIsH5BjVI5sounn9D6fBPb5sbXM3WbZKP/9/g5x9q1pSKeSnt0R9W
 jfbGx7u4o6oJrMWkPjrZZ7GBpeZeSJseNEIsa62lOKqW1IB/cLBBoEmmM6ozMdv3RKRXC7l7zcL
 eBwglCRuTVUhFEO5E21s2H+xPGPy3kEibPIpKsscF3esdZ7AP9arZEFVMpcn4Sh3W9a4X47DoU0
 blC++THai63wSPrDn3u/f80V3Ymeg8upUWxb0GjU5DF5UpRKpuVyM4AfVTyzQQutOPHlkWMDG3B
 AmHj9ZEZsDAfAHe6i5+x3W+QdGnDVhDkyYoeGZ1JHzhoOcoSNgLvK
X-Received: by 2002:a05:622a:1c1b:b0:4a9:a3ff:28bb with SMTP id
 d75a77b69052e-4b0aed5a7cdmr81704921cf.25.1754730983386; 
 Sat, 09 Aug 2025 02:16:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqhY3grkX54YHDTQoB9Tng8sw5PpxceXfAQb1JxOTHVJXhosA0dnKRM9d6SaA1o1RJZbyXXg==
X-Received: by 2002:a05:622a:1c1b:b0:4a9:a3ff:28bb with SMTP id
 d75a77b69052e-4b0aed5a7cdmr81704561cf.25.1754730982802; 
 Sat, 09 Aug 2025 02:16:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 02:16:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/6] dt-bindings: msm/dp: Add support for 4 pixel
 streams
Date: Sat, 09 Aug 2025 12:16:14 +0300
Message-Id: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN4Rl2gC/3XQzW7CMAwH8Fepcl5Ymo+24cR7oAmlqQuW1hSSU
 DEh3n0uaOqh4xLpH9k/y76zBBEhsW1xZxEmTDgGCuajYP7kwhE4dpSZFFKX9PDufBhSPrQYOgz
 HxGujqr731oHsGXWdI/R4e4r7L8onTHmMP88BUzn/vremkgtunXVataKS2u0uV/QY/MaPA5u1S
 f4JRhgl1oIkobfS6Ep3SrpmN6a0uVzdNwnDwqiFqct6zShiaulBNLIxtVBvGL0wjbBrRhPTtqq
 soFIk6X+Yx+tmEWjVhPl1ONa6BHwuwrwtAtzy5+BShkj1j18Bcg/htAEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3590;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=H5ID36yyWPeQc2l5KdKOuFMTDKUxpBbWDky9o3Ihx8A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHhSyyRndBh1+xPxuOcnPLT8xe5PwZj/Svu3
 yCgfQzS99GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4QAKCRCLPIo+Aiko
 1VmtCACh+WPNomEpJl0PPrcQ9OcVbCvrR8P9UQ9Bq7EQHgPJHDk5hXFPOVcJr5/BFqHN/TbDAK/
 R3OKEm05V6qDmBUew5G0PdtIWZhtIZ7ng4lqADyALVCsncRk6vRV/OKVglDQHdBRpr1LIVzy5g6
 uEVaSV/IRBEOX0spN58hgMKvA8laDDwvnzkxpnYti8QAXa8LB9FVcxCp+aGiAS3QGhWYT7z2XZn
 42A1HWzj38Qb/W5M1IksF3tO7uxf8XclqDAwP8Rp+U0Fcq9oAjwgjOOsHUYm6Sj71lNtd5Q0ISn
 FWuL+YNx6Kl7+m0hULnDcCBt08tFteMY0mlTI2cPqSwEowoY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfXx6Tji+CjcNKT
 7lfWdtFGEsf5GyNZZnLoMsT9IEUXyE2nH8fPQRBl0T/kkJ73tEfxVT57gJfrq5MOf696I9NkMaP
 F4LKI7nTk9pUt3suiedNNPT2vaAACIxI7v/MMXCV3jH/MPu9461MAkkTIoPWI1RAZa8IOxGZpv/
 GHMXeP/wCzygnY7XTNwJukyZTN+jMAY3Li1mQ+L6TChep9NhPdwEuZxBZeBOiY3Oyq/5LsLxRB1
 Q1q2fnxO6LnYA8yxYi0Lo23onqRzzF641jhwX57jIMLmVA4ON7ojkI97rMuNHnf3r+zcmocv3j7
 FIhD2Tv6upm+UeTZRG6UGmC5YP/ZvZQowgkob5iAkIpIcamQYBYfKYMAzgxJ+O7BRKVmNd4OcET
 JtI4vPqn
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689711e8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=gPXn7k77wXcESHRIjWcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1QiV7BE3p1QByVbbQY_C5-q92hPY2ESj
X-Proofpoint-GUID: 1QiV7BE3p1QByVbbQY_C5-q92hPY2ESj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
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

 .../bindings/display/msm/dp-controller.yaml        | 106 ++++++++++++++++++---
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  20 +++-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  10 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  10 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  20 ++--
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  34 +++++--
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |  10 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  20 ++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  72 +++++++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  15 ++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  30 ++++--
 17 files changed, 304 insertions(+), 103 deletions(-)
---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
With best wishes
Dmitry

