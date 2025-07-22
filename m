Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE4B0D292
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C827A10E2F0;
	Tue, 22 Jul 2025 07:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2gTVgHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE6D10E2F0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7IKrD015114
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=gpJoZHcyQpYbDfacgmuG1Z
 OCeDG5rolbgOKq0QUy07I=; b=p2gTVgHJXRjDWGfJx3RwFXI6wF4ThOqD69ykb3
 me0obnJUeqo29BRQ4nWhkcBV4lbPuCq6MXqvsWdc2iWf5a3GYUi2YhS03gsf9sbw
 j0pp4i8tlB+EX2pzfsmPuV40ocy/fIO4dZ8rMktttwZE0nHnDBSqt3cUsyw3KQj4
 nMDr9RTgN0AB7zQYAwiGBWXzlAXQUzH0yjstEzNR3Cd5F+4mhD0lZanfqmZoguIt
 9HQJprslWeu0UNFCNsbB375icZMo4/xNW4ROdBQ5bhHf6C10iSCkw3rO1yRUuW9Y
 cm6QodoQFht2qPcXER2SqS120CYLG/VZpBtIqmVqBkNGc8+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9xuku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3130b8246c8so1569439a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168946; x=1753773746;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gpJoZHcyQpYbDfacgmuG1ZOCeDG5rolbgOKq0QUy07I=;
 b=QDBXYS9oHr6Op2aBukSCYK7NdigQnGhWIAGUqwYhb0GxmFS9ycOzmSqhMaBAVtkLsx
 BbpQizUcc4l90hf5Igt8+8JsnPIKKH7jE+QA6L1jPCtdHeef6gkF1/+HBjoREa6b0PRK
 DsDvXLbL3sMQ4Wzcf2IMLvLjQuGnX+WuAdoEnursdqTy48F1AjEoREeRV9R0XLTGFouf
 1rBBZ9pSeWW2YJ6AHKA0kYvso92AOFLnAT3hyisf0wwn7IwK91JUOmtz3/ctIKlSMpgw
 aPZKCnwTvJgwJSsGW7BvHrkAHYRT4BlXtzTfouiMz1Gq+zDZVo7OFtqLGDYGnB0t+rt4
 NgYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdPzsqd3dILikxfAiB+PJSLFzXDwDaKQIUFEvgSXr19o24rVM64QOieTbQg3G9YKMxT89qx2DL3hs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynZakWbmKvCxlMxLUEkdtP/pEUlb4fnRUBRN22cPZMYiUhnN9y
 j2xH95RxuuzYRNBd/QrXcxaP5cBz8tJ8LFZN1cs3qFTUWC6rX7847GLvLoimhL9NjOEeJuxxwG6
 yrvt6hElCJxBysp4mH3oOVleQO/3k9c4tVnqvPGSdjy7y9KJKiZh8/iLlElyWiBxL+O6ZG30=
X-Gm-Gg: ASbGnct9iCszE2A8lSuuDFfjCNJAk/v4ZyjHWXJaBEJy7BzydF8tgxFUx2leeaZNhWw
 GUff0eHVOAqG8Ap7PUeIG6ha/d4iGDWIV7317I3FYyz8LsQlWzMSWUYdbAkQfisxx/gI0hf/MBh
 EwKP5vrSufHhmKhvG5DUvAc3OHLz0PnxrKPJUc5UzA1tLdeLnVDv88aXVIH7xQ2P7w55c1N9Y9R
 EMzSZh4Gh5OSf0d7Gj++aP1H/xSgquvC+AaBBloSYNc8eiQQ8OFZNxnom23mFMgZJp703rIglx6
 95xYtuKRsE9vNU0daUWTL3ujnhPIS590/o2Wd34FmHxTLoqrHO1soIG52u8SY9Un/r36TMxnvmp
 iaMEQHllKxoVIfVRYcVrEyKS09GS8jXIaZ3OXecV2qJb8v6jomgXC9I2Y
X-Received: by 2002:a17:90b:3f8d:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-31c9e7a4012mr13684948a91.7.1753168945513; 
 Tue, 22 Jul 2025 00:22:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNu5XNjC9N7LggT70nJqL7zjLR3AcsqyEnguxqP02Q/pBp2syZy3iYCoyam6QqSrFIAmJ8aA==
X-Received: by 2002:a17:90b:3f8d:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-31c9e7a4012mr13684928a91.7.1753168944987; 
 Tue, 22 Jul 2025 00:22:24 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:22:24 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v2 00/13] Add DisplayPort support for QCS615 platform
Date: Tue, 22 Jul 2025 15:22:01 +0800
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABo8f2gC/5WNQQ6CMBBFr0K6dkynUBFX3sOwIO0gkwgtLRAJ4
 e4WbuDq5/2f/LeJSIEpike2iUALR3ZDAnXJhOma4U3ANrFQUmlZKoTGWrAc/adZvQsTxNmf2bo
 Ao4k31JC2KWEP1mhDpJXCEkV69IFa/p62V5244zi5sJ7yBY/28BSIqvrLsyBIkFVT5PndVjm1z
 3Fmw4O5GteLet/3H8DNPcjoAAAA
X-Change-ID: 20250721-add-displayport-support-for-qcs615-platform-dc5cee522171
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168936; l=2923;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=j6byM6mQFWNoIMiAy5TxrSVRDC8viNz/BdGaO3ECzk0=;
 b=vnJictkXtk+9QtUeMBGykCyh1QwvmsfqkvGVQTYRgXCIilV2YYr+1MsDMAbpFqSfdeEXR6COw
 bhTEEt+S5EqBB/giQEMmWBmzrA0irPIoMjvRo+qICQxEQedfAsV+Squ
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: d3HxSlEVGB2s9LDC948RXnpvnT5ZtZT-
X-Proofpoint-ORIG-GUID: d3HxSlEVGB2s9LDC948RXnpvnT5ZtZT-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX7FmFvPZMdx4s
 R9GWBH9sCiAnX4GUxf0+PK6ti0uYp2QQLMKyVLtvaXR5/7ghy55lHml2xkzj0bkKauzl/bglri2
 eIhNK8J42EbboxnciPmimcm2s4/ULTZaNlPAPtK/tX5S5rT4Dz1leA7mFa+hfZyhF3w+4oyKLhr
 ZjACXHKlFEFWuyhxtspQ7n2HPSgI4kGL1jt/BUgzSOu+/O1KU9h50sZbrhZDb2VUUeLwkN9CLks
 w8YpoRQIInyuE/4KXUqmz7zOv/9wU+dKBkmRNlMo6HiRtR1mVPo9QFqN7xKTDLhAlL5aNjGOnyC
 B/DUOPfFYV2bVTkj5JW1kafzGNsB2r/lZZxuhVR41NjGCQFU0sDMclNGWV7e/6eyZOA1u0gzUyI
 TcedFihMYcyan5Dtf++IecjHi8iaR7aIzIhe4MvoYf/tKeqXfzLeu/0+Yw5Ib6yKN3yYQhOH
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687f3c32 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=KbB9N7STWnmORTLZSFQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059
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
Changes in v2:

- Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP [Krzysztof]
- Split DP PHY driver into patches 4-11 by logical chunks [Dmitry][Krzysztof]
- Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
- Update all hex values to lowercase [Dmitry]
- Remove redundant comments in DP PHY driver [Krzysztof]
- Remove invalid USBC type define [Dmitry]
- Move lane_map， max_dp_lanes， max_dp_link_rate parsing logic to dp_link [Dmitry]
- Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
- Drop patches 6–8 and remove related binding properties as rejected upstream
- Link to v1:
  https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/
---

---
Xiangxu Yin (13):
      dt-bindings: display/msm: Document DP on QCS615
      dt-bindings: phy: Add binding for QCS615 standalone QMP DP PHY
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: support dual TCSR registers
      phy: qcom: qmp-usbc: Rename USB structs and reorganize layout
      phy: qcom: qmp-usbc: Introduce PHY type enum for USB/DP support
      phy: qcom: qmp-usbc: Add DP PHY struct definitions
      phy: qcom: qmp-usbc: Add QCS615 DP PHY configuration and init data
      phy: qcom: qmp-usbc: Implement DP PHY bring-up flow for QCS615
      phy: qcom: qmp-usbc: Wire up DP PHY ops and flow for QCS615
      phy: qcom: qmp-usbc: Track PHYs for standalone DP/USB3.0 handling
      phy: qcom: qmp-usbc: Add QCS615 DP PHY compatible
      drm/msm/dp: Add DisplayPort support for QCS615
      drm/msm/dp: Add support for lane mapping configuration

 .../bindings/display/msm/dp-controller.yaml        |    1 +
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    |   28 +-
 .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       |  111 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    1 +
 drivers/gpu/drm/msm/dp/dp_link.c                   |   71 +
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h         |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1466 +++++++++++++++++---
 11 files changed, 1503 insertions(+), 272 deletions(-)
---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250721-add-displayport-support-for-qcs615-platform-dc5cee522171

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

