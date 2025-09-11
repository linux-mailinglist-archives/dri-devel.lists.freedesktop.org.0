Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0C4B5364A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC10E10E0FE;
	Thu, 11 Sep 2025 14:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vbwgb9Td";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3ECB10E0E1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAeTok005455
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=/xEH5bhCDH+EambDfpLJYH
 Y3ZvSSk+a6Bg2AG4xJvXg=; b=Vbwgb9TdPNDtgBEwlILTgizCBFoyQZMLbK8YNT
 aZskG1U1ETHPXOu5q3lbmVNLrhyY1HhHUXLgzwzSUaLXz9ZnNEb58fJmxlEGKTau
 6ItEWpHsKyug6iIIofMBYq4oM9/2OV9o94Vuw5OwQ0O2olDLx8vYMbTZl/5uAmWN
 7Y+xA8zGXUAg0Lky8fnEbRyGA12WxEVjL6mmpd0EAKIIrBJrcU+A+qJPkN7zpuV2
 QQVQoFgk1EZbufMY66eoUb0e5549UliLC8+CYywpd0Cgc2mDvxZhGOqwSsiN7EEA
 yaxi4ZAEksYoqUrSiFC4eSjMUJWaSEko9YJMzVfDTDH7Iz6Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2c76a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32b51631ea5so234178a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602240; x=1758207040;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/xEH5bhCDH+EambDfpLJYHY3ZvSSk+a6Bg2AG4xJvXg=;
 b=Es5Dy0IDng9DoF0CNn6S0MowAyLhcKZzOlsd3E/dLvxd1KEv26JwEhcrrJrR319ixt
 T+6XlDbxsehonspzyT1lWrACxCJbB2Tg6Z+HCbI4TbKelgxFYC7Bfs3PWqNMgf8rjjbe
 bH8DPyACwpA+GIR4sODnal3rRaB+4iZ38PztAtx6sHAh5aE5L9RIBnV3Q3M8I238OhF2
 rtTkl1UTPI939NfObNdvmY3ywRoYq1QTCDYKn8we6BFg/WcHr+p+Vw9VlFxZgRIq2Aev
 qZuwfojbqAf2iwLuXbBMTUobcVjsQGiNwGkRwpZdWxIhgNrUJI0ZxH0th+x4nv6TETTy
 ZZjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFsw69OiL/8B3Uc5TpWVuwMMqv/L5ijWO/yh6AzA7yaNOaKiASdye2rKmUcSzyXfs99AJ1GLf9eGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuBYRONoXAcdrt3m+hBa5qhIayY4kMa91eQd+/l31v0yPQh6UY
 ZXpYuMxBu/9i5GjGtOVeviuNJSj6BtoQRHyc5Rc8kpvq+0jl8Qy+FIXcSqekopg79FoZUS1uN1h
 I1kz6uY0GJAdA+LwsSdu6SZPtP0Ucibg19Wipbz/Y6d4kg/vsKNHfTHs7vuWz9yfJ6gJ3S/c=
X-Gm-Gg: ASbGncv1l96xX1IwqU0N1dPwYs53bfNlwkY4J+6QeScTq8oRpMZQu8lxNHAwQqKW5I1
 rjJVD05nRcZzQlDLOJk4y+NuSSjMEKVd3Pe+NZUT/xN6PIKQ6XefERHNFA189+VFlNGCeMX5uIU
 Vo1kxhNwp3vWcaXms25eBEWY32iVU+YHyyKSIkm8NUMUOVRty6m7iT0deqEj+dofsLqe9P7HMV0
 dZeQiwbGxfwOvrJlf/64PTBo3yCgbELcuETcihCCcd/b99EZXj0lSo5hzxUdSHo37w3QsjMHsc7
 yU13CXE+SwTXeISEL/vP0uOnETBAMreALb9IU7JYaJdhs1W3Cgzzdl8nZ9ai4xekwwZs/U5LMh0
 Sqh5jOtgFbiyhoDrcv0D3Y9zLBOpGfFjZ/9CSv8EdaXAn60JI4b2pSG6o
X-Received: by 2002:a17:90b:33d0:b0:32a:8b55:5b82 with SMTP id
 98e67ed59e1d1-32d43e11bcemr12961227a91.0.1757602240204; 
 Thu, 11 Sep 2025 07:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiDHS8WTe48sZ+5y9L/B0ypbKllzVCvSYx+GkBixPPnAxR1xtVluwi00iOjWP7C4GYyo7pqA==
X-Received: by 2002:a17:90b:33d0:b0:32a:8b55:5b82 with SMTP id
 98e67ed59e1d1-32d43e11bcemr12961197a91.0.1757602239708; 
 Thu, 11 Sep 2025 07:50:39 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd6307590sm2934648a91.16.2025.09.11.07.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:50:39 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v4 00/13] (no cover subject)
Date: Thu, 11 Sep 2025 22:46:07 +0800
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-0-177348170c2d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALHgwmgC/5XOTW6DMBAF4KtEXteRZ2wK7ir3qLIw/mksBQw2o
 EQRd++AVGXTDavRm5HeNy9WfI6+sK/Ti2W/xBJTT0F9nJi9mf7H8+goMxRYCQ3AjXPcxTLczXN
 IeeJlHvYZUuajLZ9QcbpNFDuOQdTosTUoNaPGIfsQH7v2faV8i2VK+bnjC2zbzVEAqA85C3DBh
 TZKysZp6cNlnKONvT3b1LFNWvCvvaKX8Fg7UrvCVglZQw2huaRSzuNs7tTevQn5JhoUxwhJBL3
 fOqy8ldr+Q6zr+gsijr6+rgEAAA==
X-Change-ID: 20250911-add-displayport-support-for-qcs615-platform-2f072e2ba239
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602231; l=4013;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=PxQ+Nl+6gXCfV0SnVCZ6IaDcnEi2VND1S9/H0brbNM8=;
 b=ASVtpO3j3ss865EQa+slC1BIbpK4AuajgD50RsGYQ2UDxDcHtA5P/cICIkaBsEeXjJ2v15if3
 NeNejHOckv9DEB7lLy4re35wi+qcLTngu1WPzMW2V7v/JDgrFgx35Tf
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c2e1c1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=NhqbsNcZucgFEQMbMWwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BSIsH0scZmz7baJpL1YeZpLxaKNRVUWd
X-Proofpoint-GUID: BSIsH0scZmz7baJpL1YeZpLxaKNRVUWd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX5dBnMs7kJW3J
 5K0Jtem5gQTqzSz16bImLwnIlF+W9agLmYheKjE5INg8vXh5U3IWtajxR6cPvR3eL0U7RFuie/R
 iyOdcKSlu0fpitReDeRGB2QbkYnbyZS94rSnBle1CRvcbD+s8PAsdJOSrCdqM3mBMBMgclgtiYW
 hpEjb/k3IpH5WTVoVmO5WwJdM8iVxj/kqK07uiEWK4t0dgwdcMgONJJEZ3HLa1HDW39vhbH1WnJ
 qTtANGDctvoOz7+0fJPgaerLVihFpIWh8ZLr9WumuM8MzkyNbz71yr9+yKNAizr2CQ4CPqxxDUP
 2WblBkd6h9FJYY0knBtCa17jS0ZvXIfXJQIXTM5ilHwpzxG+uyGTeAALgS2elRp8YaMikOxg+I6
 CwxQ0kWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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
Xiangxu Yin (13):
      dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
      phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
      phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
      phy: qcom: qmp-usbc: Add QCS615 DP PHY configuration and init data
      phy: qcom: qmp-usbc: Add regulator init_load support
      phy: qcom: qmp-usbc: Move reset config into PHY cfg
      phy: qcom: qmp-usbc: Add DP PHY configuration support for QCS615
      phy: qcom: qmp-usbc: Add USB/DP switchable PHY clk register
      phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
      phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
      phy: qcom: qmp-usbc: Add USB/DP mutex handling
      drm/msm/dp: move link-specific parsing from dp_panel to dp_link
      drm/msm/dp: Add support for lane mapping configuration

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  111 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |   71 ++
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1089 +++++++++++++++++---
 8 files changed, 1192 insertions(+), 196 deletions(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250911-add-displayport-support-for-qcs615-platform-2f072e2ba239

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

