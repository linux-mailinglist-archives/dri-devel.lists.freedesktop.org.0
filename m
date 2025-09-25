Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40EB9DC06
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792E110E84F;
	Thu, 25 Sep 2025 07:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwrchYiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E8C10E84B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P02kma018785
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=yZ+xuQsK8TPZF/qA5Y0n2S
 yswG9xNhbXSlZdrQ5xB8w=; b=VwrchYiQ2Zg1sNSe93WIcnYH+sM91lNdzFPPdp
 kVJxG7VeAfbzOmpWwaBRfJJMCwVJQnkUDPwDrdcOVIyw+dH7nC+Xh9BWQgrOPLr8
 YaxmzGJPqaQarDjClmIHCpR39JQT3y2+LnXBN6ZlCVy6t8LGPaoejdca/oeFeT7Z
 o+b4h5JTiflrMoFyb3ekJCCRQJX+YKJwEHs0HCMoaDD1UAhNsHMRPkEc24gsOCUw
 RQFZ9EMA2TUOfTzh+j+RlLJajTgqRUwOxFObJEKf6vwFE3rkbjXRA2ndPdbaotHl
 bYF1z71I9jNcT7jPrJ0TSyng3cre7Jl/nwzrs/IEksKKE/Zg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkb3ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3309eab0740so185330a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783919; x=1759388719;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yZ+xuQsK8TPZF/qA5Y0n2SyswG9xNhbXSlZdrQ5xB8w=;
 b=eYTBJI1ipLq06D6T+yPbHYWi2C15rkVb9oH2fMhQ9EjfbNGSbmEmbebC98me8cQ0d7
 eac4ZYezX0+It0CamtAVj9/pe7iFUYhnqjmvkvV8PKscVGHOyZ/HaXpihC/PDAm205YI
 EWzHZeDi52EhhamDszb2K0KqbmiRf9QpLfsrnEVS/NEXWC7tcVnlmdfhnS4e6ASZ1qB+
 E6k/Ox1DUD26/dPIIIcAXpmZYcQYzkOXd0G0uXHMpoiaCmIjXHccFT+R41iqW5ZZVUGO
 zUB52ZgZKLU5bk40mwldtkZdREjNUfpWBjflpHEhq5kxm4qJoTBUqD+qTMe12quqknxt
 9wuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW3biJhqjy4dBAgbarl2DUgA7LzKLX0ycS7kgDzDUQXBWzKsgLkTRBismFvL9RTvRruqV3wTJcQv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw17gflSdOh9pNUux2NtwZTdYz0E7PExf7O8k4mZjeVUvddvCgq
 Mvtvu4wFCeng091/YPgB+q7M/U5mdoBx+ZGFIYCSWEB53LbHOJSMP37+QPcu4Bpy6ViB0o1CtCs
 G7Py70tnBATZW4WVSn9kiH2iCJaWjU21ik1W+PLfqqL4kDAs1AoXuE2XxgXa8T0G63gBdBog=
X-Gm-Gg: ASbGncscIemYtkpsMuoH+bCVBuySUE6fH5BPf0mPSrjmrIQIC/RS+99H2obCEmatftP
 0R7FaEWY8H4xBvZxbnPzjyxtjtHe6zoJOKwkDAEbyvOPyyqDVEI81k/ZxD5iGWSoLa3jLNh1NeB
 z9baU2SzZPp767JIiW/Kn8FewyB3EC6XIOctvAE2XOVU4KacyAdzdRgmgWNlWg2LgdEgmJCezg4
 kGEdhWtyeU4DHeOYlr67Ff1XfNDGsOm9BuxUhT8oosSn6uhVti9MVr/X1qyeqt0zAkJED3+cNYB
 O6UgDbMIl3DDho5stSgv2KLgTfdVLQbEAgB3Eg64EO42eQdSamck1NB9/J+6z23aH83sJuot21e
 APTjHT6lazdhfc0RNNadCQmXtK7FBMlj8Jz2NsU810jCIAAq7JDXIgShv
X-Received: by 2002:a17:90b:38c7:b0:32e:e18a:368d with SMTP id
 98e67ed59e1d1-3342a332253mr1367422a91.8.1758783918957; 
 Thu, 25 Sep 2025 00:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUbujVjnPE51nMK7rlaHLU2fKEdCZgVZSnTJAA3gW7yMsssg3WWsRWMJZqIVrdYskdNrhg0Q==
X-Received: by 2002:a17:90b:38c7:b0:32e:e18a:368d with SMTP id
 98e67ed59e1d1-3342a332253mr1367391a91.8.1758783918444; 
 Thu, 25 Sep 2025 00:05:18 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:05:18 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v6 00/14] Add DisplayPort support for QCS615 platform
Date: Thu, 25 Sep 2025 15:04:46 +0800
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJDp1GgC/5XRTW7DIBAF4KtErEsEAxjoKveousD8NEhxsMG2G
 kW+e7Glyl00C6/QY6T3jTRPVHyOvqD30xNlP8cS072G5u2E7NXcvzyOrmYEBATRVGPjHHax9Df
 z6FMecZn67Q0p48GWhgpcZ2ONHQ5KCaFly4RkqDb22Yf4vWkfnzVfYxlTfmz4TNff1eGUwjFnp
 phgog1nTDnNfLgMU7Txbs82dWiVZvhtF0QCHGuH2s6h5YRJKmlQl1TKeZjMrbZ3O8F2QgE5RrB
 K1PVbB8Jbpu0Lgu+EpvQYwSsBkkDrnKHcuxeE+EscPIOohDe+aRQNnBD4h1iW5QcZmX2OdAIAA
 A==
X-Change-ID: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783908; l=5389;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=BriQ9CGzQPqKZfWizw8gSbddYqDWtC7/j8W0uWp5qUM=;
 b=/+juXQNfDmiteVOMuuSFk8BU/ejjFAKfyZOY1rODm2qSmgMfUlT38RitbEUoDhXbe9Ps5SJLU
 OYw0Oe6PmpoB7t0FStYiiPmDd6G9osrC8ci0mRdv00fXYvytnIJH4Q/
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: 65G9PWfLww2OzPkUCWwKEmb1aMC-nv-0
X-Proofpoint-ORIG-GUID: 65G9PWfLww2OzPkUCWwKEmb1aMC-nv-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXz8dpsekAhof8
 gMsm0ghH0eyRr7h/RRKTp2dHVyUGPOvrxLkvbP+XHB95h/lrhejjjSXmW075X+9a7CCR67Zo3QD
 14JGVQ/HEnAJXzcOG2rQjRYEnzCObjWYTYfduWzb0NNGBWnq/fCav7pPA4sroqe8N9SBHnmdVrt
 FNgP3dl4gnvsQ7u0n2KE3iugWEyLv+Geb+ERvVdF9xhN3mXASzOqyBrLNx3CjUnAYF/ZpIKhf0g
 hCvi9ILQ+bj0JcTfrj/FkmDbA4UU9LDo1dfN0QZLPoij2Rzj4iSh7A3QZE6rfPAJFSceBj87vzB
 MyFJ5XPZiCD+ERF8iCn5FKc4E9KtEZvSnVkR9RQVNITAoBHE5fcbNewBRjdWBZuLdNjce7tfMjd
 nh54Ot9J
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4e9b0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=-mfqEiHr7Cy1ujZptoQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
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

This series aims to extend the USB-C PHY to support DP mode and enable
DisplayPort on the Qualcomm QCS615 platform.

The devicetree modification for DisplayPort on QCS615 will be provided
in a future patch.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Changes in v6:
- Move usb3dpphy_reset_l definition to the patch adding compatible and related config data. [Dmitry]
- Add NOTE about SW_PORTSELECT/orientation handling. [Dmitry]
- Use C99-style loop variable declaration in msm_dp_link_lane_map. [Rob]
- Update commit msg with issue description for [05/14, 06/14, 07/14，12/14].
- Link to v5: https://lore.kernel.org/r/20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com

Changes in v5:
- Add new patch to introduce QSERDES v2 COM/TXRX register headers.
- Restore legacy reset & clock register logic. [Dmitry]
- Update phy_xlate() to return ERR_PTR(-ENODEV) when dp_phy is NULL. [Dmitry]
- Rename helper from qmp_check_mutex_phy() to qmp_usbc_check_phy_status(). [Dmitry]
- Drop storing struct device *dev in dp_link as it is only used once. [Dmitry]
- Add robust lane mapping: default 1:1, complete partial configs. [Dmitry]
- Reorganize sub-patches v5[07/14， 08/14, 11/14， 12/14] as suggested.
- Link to v4: https://lore.kernel.org/all/20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com/

Changes in v4:
- Drop patch v3[01/14 & 13/14], will sutbmit new patchsets based mst dt binding series.
- Update maintainer of qcom,qcs615-qmp-usb3dp-phy.yaml to myself.
- Add missing aux and pipe clocks. [Dmitry]
- Drop second TCSR phandle; register offsets are described directly. [Dmitry]
- Add USBC PHY series related init_load_uA configs. [Dmitry]
- Drop v3[04/14] qmp_phy_usbc_type define and use dp_serdes offsets to confirm DP capability [Dmitry]
- Reorganize sub-patches as suggested.
- Link to v3: https://lore.kernel.org/all/20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com/

Changes in v3:
- Renamed qcom,qcs615-qmp-dp-phy.yaml in v2 to qcom,qcs615-qmp-dp-phy.yaml in v3 for QCS615 USB3+DP PHY.
- Updated patch v3[02/14] to revise binding title, description, and property order. [Krzysztof]
- Updated commit messages in patch v3[01/14] and [13/14] to reflect the DTSI rename and clarify compatibility. [Krzysztof]
- Added USB3+DP mode implementation in patches v3 [003–012], organized in logical chunks. [Dmitry]
- Dropped patch v2[03/13] to maintain full backward compatibility with USBC.
- Link to v2: https://lore.kernel.org/all/20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com/

Changes in v2:
- Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP
- Split DP PHY driver into patches 4-11 by logical chunks [Dmitry]
- Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
- Update all hex values to lowercase [Dmitry]
- Remove redundant comments in DP PHY driver [Krzysztof]
- Remove invalid USBC type define [Dmitry]
- Move lane_map， max_dp_lanes， max_dp_link_rate parsing logic to dp_link [Dmitry]
- Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
- Drop patches 6–8 and remove related binding properties as rejected upstream
- Link to v1: https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/

---
Xiangxu Yin (14):
      dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
      phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
      phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
      phy: qcom: qmp-usbc: Add regulator init_load support
      phy: qcom: qmp-usbc: Move reset config into PHY cfg
      phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY
      phy: qcom: qmp-usbc: Move USB-only init to usb_power_on
      phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
      phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
      phy: qcom: qmp-usbc: Add USB/DP exclude handling
      phy: qcom: qmp: Add DP v2 PHY register definitions
      phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config and DP mode support
      drm/msm/dp: move link-specific parsing from dp_panel to dp_link
      drm/msm/dp: Add support for lane mapping configuration

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  111 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  118 +++
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h |  106 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h    |   68 ++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1066 ++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp.h                |    3 +
 11 files changed, 1421 insertions(+), 168 deletions(-)
---
base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781
change-id: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

