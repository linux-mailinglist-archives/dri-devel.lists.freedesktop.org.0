Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F125DBA2B48
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 09:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A7C10E9E0;
	Fri, 26 Sep 2025 07:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOmbzYoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860C510E9E0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:14 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q7FQO8021553
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=dud8WJNENTmI5gxnKUE5mo
 +sgzvsIU1AqAlFb2/ff4g=; b=jOmbzYoOcF389FUnUJYAwuRjQ4tMNMig09hthU
 W/HdEmhKbPeDGO6974HooNYmQip1WKawnXhYyMvjGlc5MyBrrYgHvtAPttELhJrT
 bbW4trrFtsXJw3EGGF+G2bDlLt0f08H4CiSKh46yv8oQTZIachK95M9NdKWWsJci
 LjiXcw1aAht8ZtRpMJbE1hiIpmb7pxFbjeREu+xXD1st4lXAcsFFcQtemhFoZmwk
 8VYb++/FECvu//MbGsRADUE2t3xg4IRGiF7JV5IjfDq/mvNaD3W8fblXkGdC4U8b
 vfWUKFU2Z5T336aEy8sMmIEFIrRFZSxJG1U+6un2iY0lW/IQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qsvnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-244582e9d17so5964105ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 00:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871573; x=1759476373;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dud8WJNENTmI5gxnKUE5mo+sgzvsIU1AqAlFb2/ff4g=;
 b=G/kRjNDVkxd2+9oAVllN0TxzBNIBJq+34KlreHA8eYayeisPlaYnLK0JgnZ97vwuuw
 NRM80QwzN7xNagvM/Hwe38mH4s7L4HklcD8MEFaJp6XiPyfDnbXvZdHdYxkWApW29QX7
 DO062c3B9kstQKYlpv9ZYdTHoPfpLo9L89kFZY3CAA6tNHQ6CtRvEicGxq8MgMSfJaab
 CJG5xCjdYwxGkpxPo725LYYebmujHSw2hhrhXhZYWvi7iPMFVi/zMwCUYJAkg0AwOvRb
 QBMQjYMaNOuV9Pm9nkjmKgk3OibClNhtUuaZNiga+VnMTtxerudFlKzaV3MMT1Utga32
 m+8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXyj5+axtngAjjRBfpeO/06V0hEtTXw1SKHVaVuurCWM5OAhUA3sB9xT0CUklGzuHM6wNImi63014=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxc9+R6gQVuSwOenkFzy8X444mLT0C6KM+UJBwuWjv3df5NjVVs
 nwCA9Lw0ZcrcR4QRJmHzpqGmeCx6glL/sk+oRuvvR68m6bpJuuTjZ/nbxTfczSEYC2kwg/4kohy
 T21goy9aifh5IdmQEH/Do/AkbQgumpYkTbKrDJcwA1oEVobBK3cacn0qjr0G5gteaIIC2EDQ=
X-Gm-Gg: ASbGncvfWpUZTTDkOBie6Xe1x6UFn5gvRo55ZLcjyv88RTf8ZsSR1l+xsUnJEpBizVy
 qL9i/MLseaWY+GDdq03n0JqzG5Zwpfv8+BH8UBG7nnMcz0Kswk4WnhHbrfa6jXJZZVNr3e8/8Np
 8DgI5hlJZIwhAeX7+oalRH60F3DwbJewhv3lVgjOmPbnYPEXbdkAKEPZbyNpU8A4Pt15mznMu7p
 cf90FXawQWmZwV3RRHLdQFdjXjNgkKWudF/sI5UshR/DgSn2YaraGjDoKKZdq+/kijFENczQq3R
 8Ob9BDhPQvSOlskYefbetUbtzdOEVd8FyBUSf9cdA5iHjVwNXe+22gJaeJVy7Wy9zokJegX2URt
 yPpSzjSkgE5UEWnjdNdBlF9PtEtDT6Y7zipGy7iyYNEthChx67V5w53l1
X-Received: by 2002:a17:903:2341:b0:257:3283:b859 with SMTP id
 d9443c01a7336-27ed4a47a07mr38672935ad.9.1758871572719; 
 Fri, 26 Sep 2025 00:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6gfLG3g7l3wZ67mkycPSyt36CZJqPFSpdlPEG8XiWyzxlncH2l4wJA2fUOLl0HLc9gG5qqg==
X-Received: by 2002:a17:903:2341:b0:257:3283:b859 with SMTP id
 d9443c01a7336-27ed4a47a07mr38672575ad.9.1758871572067; 
 Fri, 26 Sep 2025 00:26:12 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 00:26:11 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v7 00/14] Add DisplayPort support for QCS615 platform
Date: Fri, 26 Sep 2025 15:25:36 +0800
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPM/1mgC/5XRz4rDIBAG8FcpntfijBq1p77Hsgfjn63Q1DS2Y
 Uvpu68JLOlhc8hJPge+38A8SQlDCoUcdk8yhDGVlC81qI8dcSd7+Q40+ZoJMpTMgKHWe+pT6c/
 20efhRsu9n9+YB3p1pQFJ6+xWY0ej1lIa1XKpOKmN/RBi+pm1z6+aT6nc8vCY8RGm38kRALjNG
 YEyyowVnGtveIjH6z25dHF7lzsySSP+tUumELe1Y20X2ArGFSiI+phL2V/v9lzbu4XgC6GRbSN
 4Jer6rUcZHDduhRALYQC2EaISqBi23lsQwa8Q8p3YeAZZiWBD02iIgjFcIZo3AuU2opluASYGa
 RquwfxDvF6vX7s/6DfXAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871562; l=5625;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=YPasll5NQP6TVIaoA2rYTgUFmw5RRjjIlz3VdB4qxWU=;
 b=2LVd7ANysco9u/gEASSF1mlgveF/gQTbuuMOj3m6iaQ5teJqwkL9kUDMdyVJ6HODH8UZA4dS6
 kR8CdvESMCmDUKy8f44E9UVsAeA2/W30sm4xS75w6nvKhT5ssRDrfZa
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: B90Dr6R2rRd36kUoHHJh5Li-1cIr6i4X
X-Proofpoint-ORIG-GUID: B90Dr6R2rRd36kUoHHJh5Li-1cIr6i4X
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d64015 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=-mfqEiHr7Cy1ujZptoQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/cwP+nieA5xo
 C6ymftN7NGkcvJvoQ1fvAtgUYDhS/97EFe9+qx9e78GOQMtvChYBC2bPWOy7wuYzljrYBYeqllD
 4zgP3WxuNMY3ujrvC9BYp2ZPZ9avMYIxZVCY29zV0T7yO0ssabwRTwrZb19Cm4BVL60M9Lwkuyb
 DRxzn6e2gHHxm1M1eLaeZLOu0iwOPifQ/8dzaZyX8+Iby9nLREEw0af2fzvvWJoPFU0ZqCA+pgB
 SdyVoSpJYU92MZfePqEtkm/HudErM95drYSx1LKhqM4KmrN4rII+7pfg3iXhAZrUG43mqn0jt+1
 GaVvG3M86zQm0WaynXPr9aAGoqldYGJvEgumgaue+42aZV8FRKLgJYIKnW9YZsOXUHjo1Jrbbb3
 drXtKgCK3HISY6nBygmBS/+GV/+jQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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
Changes in v7:
- Fix QSERDES_V2_TX_LANE_MODE_1 configuration from COM init table to configure_dp_tx().
- Link to v6: https://lore.kernel.org/r/20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com

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
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1072 ++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp.h                |    3 +
 11 files changed, 1427 insertions(+), 168 deletions(-)
---
base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
change-id: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

