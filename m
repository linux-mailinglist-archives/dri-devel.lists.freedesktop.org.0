Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C19AA8FBE
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B67D10E0E3;
	Mon,  5 May 2025 09:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Jg4rpxPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D5F10E3A9;
 Mon,  5 May 2025 09:43:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5452joFw007308;
 Mon, 5 May 2025 09:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=4Kdu8BnvBkNfnPv+VlXGtAFitHZlacMh3cs
 FMQw4dWY=; b=Jg4rpxPFe5pfSUrLhaOvKwBYi7CwJWUGY9nC4Pc45hfvdiPjvtg
 w8lKy+xurjHzyjy4btwM7miw8GG0uG6YiszkWtUwmaWAmCNzaWGdjA+bFMegKPbS
 xNwQxYqVGi9djWMseKnp6ilD6wrJkxl4yFuycHPkJyi8Os+EiPwiM/gw9qS+bnky
 c9kVvgkn+Y0rihT4yStaVPD02tpG36BXfSucJ3DEoBPT0wwjjaZcx5Q/V2tPVnz7
 Ui+aYFpXbIJ+Lqsum0E0E49L8poPiA45Xa2+eb7aGGfjXuAoiuLWCgrh+B6QEUOg
 SHBwDGX+/nGUBmg2R0tXhgGLnt5wD1SHCcA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg3pw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 09:42:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5459gnFC012605; 
 Mon, 5 May 2025 09:42:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7m5jtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 09:42:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5459gmr6012568;
 Mon, 5 May 2025 09:42:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5459gmf7012562
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 09:42:48 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id B11F1513; Mon,  5 May 2025 15:12:47 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: [PATCH v6 00/11] Add DSI display support for SA8775P target
Date: Mon,  5 May 2025 15:12:39 +0530
Message-Id: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zF4q8_2mUn_Twb__4BzcSpcrFmaLMrMv
X-Proofpoint-ORIG-GUID: zF4q8_2mUn_Twb__4BzcSpcrFmaLMrMv
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6818881c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QlWjpmH-yOSsLRRY6RUA:9 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5MiBTYWx0ZWRfXxcK1it+JbIUI
 Qx+ciw3eOhFJDTFczLx3JSrFp1VQSXjR36KPCHs78AtZZb6eigUu7zMTYTpOqVEk9GNSrXnPW0x
 38aNjevIy1NCAxfKzmIqq8aQDgHd/Ct0+7/0r6VKYQgTCYAArpnBUYBUyXr3OzYGjnBRn8LPM91
 JWjprsgUn7Z9wq341mZSMt/qn6Lh1KyshbkLNYq5WGh7Hcap7iGuIKQDiGBSdugYWOVqT5RK6KL
 nu/B1I/P6y6mQ0xH62t7Q3XBVO5LwsSUImJWRqNPQSKn9pATte4ZMwY2EzA0q2//QrMBnUO5A7o
 q98oeQM4b+zII2tXnK4T+efTZ6aj5Gh3rLCapNiqLBS7vcUHGtJvjkh86fyZ7XEwgv3grLiyhZl
 990Ftw/AeKo/7oH3OmzTIR/cQs6naEn7Jm+u+Vs7chAhwsSPsJwNutspSw77UwAsDMjrqN/r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050092
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

This series enables the support for DSI to DP bridge ports
(labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.

SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.

---
This patch depends on following series:
https://lore.kernel.org/linux-arm-msm/20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org/
(ARM / arm64: dts: qcom: Use the header with DSI phy clock IDs)

Changes in v6: Fixed the review comments from konard.
    - Added the reference voltage in patch 7 for vph-pwr. [Konard]
    - Patches from 1 to 5 of version 5 of the series are accepted.
      So removed from here.
    - Link to v5 : https://lore.kernel.org/all/20250424062431.2040692-1-quic_amakhija@quicinc.com/ 

Changes in v5: Fixed review comments from Dmitry
    - Added reset gpio for io_expander(tca9539) in patch 7. [Dmitry]
    - Updated the commit text of patch 10 for eDP configuration. [Dmitry]
    - Link to v4 : https://lore.kernel.org/all/20250417053909.1051416-1-amakhija@qti.qualcomm.com/

Changes in v4: Fixed review comments from Dmirty, Krzysztof and konard
    - Add only single compatible string in dsi ctrl pattern properties
      in patch 3. [Krzysztof/Dmitry]
    - Move the io_expander RESET and INTR pinctrls from i2c18 node to
      io_expander node in patch 7. [Dmitry]
    - Remove the gpio-hogs from io_expander node, as we are already
      configuring them under anx7625 bridge nodes. [Dmitry/Konard]
    - Updated the commit message based on hpd_enable() and
      hpd_disabled() recommendation in patch 8. [Dmitry]
    - Split the patch 9 of vesrion 3 into two separate patches. [Dmirty]
    - Updated the commit message and commit text in patch 9 and 
      patch 10.
    - Link to v3 : https://lore.kernel.org/all/20250404115539.1151201-1-quic_amakhija@quicinc.com/

Changes in v3: Fixed review comments from Dmitry and Krzysztof
    - Added qcom,sa8775p-dsi-ctrl compatible based on the set of clocks
      which are associated with it in patch 2. [Krzysztof]
    - Drop the blank line and add contains instead of items in pattern
      properties of dsi ctrl and phy in patch 3. [Krzysztof]
    - Updated the node name from anx7625@58 to bridge@58 for anx7625
      dsi-dp bridge in patch 7. [Dmitry/Krzysztof]
    - Updated endpoint label name for input output ports of analogix bridge chip in patch 7. 
    - Check the DP or eDP confiuration based on the aux node in patch 9. [Dmitry]
    - Link to v2 : https://lore.kernel.org/all/20250311122445.3597100-1-quic_amakhija@quicinc.com/

Changes in v2: Fixed review comments from Rob, konard, Dmitry and Krzysztof
    - Added additionalProperities in dsi and phy patternProperties in patch 3. [Rob's bot]
    - Updated example in qcom,sa8775p-mdss.yaml of patch 3:
        - Added port1 and port2 inside mdss0 ports.
        - Renamed dsi ports from mdss_dsi0_in to mdss0_dsi0_in and mdss_dsi1_in to mdss0_dsi1_in.
    - Updated the init load value for vdds supply of DSI PHY from
      150000uA to 48000uA as per chipset power grid in patch 4. [Dmitry]
    - Updated the init load value for vdda supply for DSI ctrl
      from 30100uA to 8300uA as per chipset power grid in patch 5.[Dmitry]
    - Rebase the series to use the header with DSI phy clock IDs to make code more
      readable in patch 6. [konard]
    - Added the interrupts-extended in patch 7. [konard]
    - Fixed the warning from DT checker against DT binding in patch 7. [Krzysztof]
    - Changed the connector node name from dsi0-connector to dp-dsi0-connector and dsi1-connector to dp-dsi1-connector
      respectively in patch 7. [Dmitry]
    - Added the vph_pwr for anx7625 vdda10, vdds18 and vdda33 supply to fix the warnings from DT checker in
      patch 7. [Rob's bot]
    - Addressed device tree comments in patch 7. [Konard]
    - Squash the DT patch 8 into DT patch 7. [Dmitry]
    - Added hpd_enable() and hpd_disable() bridge funcs in patch 9. [Dmitry]
    - Update hpd detection bridge op flags logic based on eDP connector in patch 10. [Dmitry]
    - Link to v1 : https://lore.kernel.org/linux-arm-msm/20250225121824.3869719-1-quic_amakhija@quicinc.com/

Ayushi Makhija (11):
  dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
  dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
  dt-bindings: display: msm: document DSI controller and phy on SA8775P
  drm/msm/dsi: add DSI PHY configuration on SA8775P
  drm/msm/dsi: add DSI support for SA8775P
  arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
  arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes
  drm/bridge: anx7625: enable HPD interrupts
  drm/bridge: anx7625: fix drm_bridge ops flags to support hot-plugging
  drm/bridge: anx7625: fix anx7625_sink_detect() to return correct hpd
    status
  drm/bridge: anx7625: change the gpiod_set_value API

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,sa8775p-mdss.yaml        | 181 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 183 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 186 +++++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  34 +++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  18 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  27 +++
 11 files changed, 624 insertions(+), 12 deletions(-)

-- 
2.34.1

