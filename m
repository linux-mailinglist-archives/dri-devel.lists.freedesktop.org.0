Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDBCAC03DC
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 07:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37549B296;
	Thu, 22 May 2025 05:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Nte9RMJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132349B25C;
 Thu, 22 May 2025 05:13:37 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIFefW013430;
 Thu, 22 May 2025 05:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=godeQjSfZ3mm7u5AuFZu4jej25Ii63iNVRL
 q0zaKXwg=; b=Nte9RMJDxM3RnnmC0muzTBrrSUvSTGEFFCNG6SoynZxTtCR/N3Y
 Ap1i3gwfNnNcMJlukONZUYfti7mHudJIjSYZByxx2tLAYJTsqzhBDsAlumcn7m97
 bO9YJVH0oz4EYP4e49ehmQCP2PcwCDphILnqUmYIRq5Lp8GW42W2Iw31UlOdxeBJ
 uGnFrB1/KFoX594+3+ixxJ6BYadlxkiVMC+CO4vCsz0iqqO6CtVWJ6LrAytfrdsq
 i7Kz+rHqPkByu0KJ55A+/qoZp3K63CGAiHir+HLXvtyhjdHFXDd8ZUPbB0Au88iZ
 3mQb1CJ/mO6ZFljU/PFYgY86NEg8GB5cA4Q==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5d5fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 May 2025 05:13:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M5DLHU005556; 
 Thu, 22 May 2025 05:13:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhmrbar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 May 2025 05:13:21 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54M5DKJt005541;
 Thu, 22 May 2025 05:13:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54M5DKHF005535
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 May 2025 05:13:20 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id EACD0580; Thu, 22 May 2025 10:43:19 +0530 (+0530)
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
Subject: [PATCH v8 0/2] Add DSI display support for SA8775P target
Date: Thu, 22 May 2025 10:43:16 +0530
Message-Id: <20250522051318.1783905-1-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0OSBTYWx0ZWRfX+pSRTD5e36gO
 c8NjfX+CURA5lQMBvMuGPH9jwtvOX5oZRQ0EQCJp48CZFFit18zYLlFS0SgvrxqXzmHNHnuAYhj
 CpCh5AyhO4BCeaAqUaYsVYFydQpkOAHZIFHj0B0LbsU9Z5JSl8UfadAr+DifyFWBOvOlZZ1byow
 kr6kQH3GaAYse4XYEe6iX3u2p26YfFxX7E6wEOByy3riS0u8m5LoPI2kyFaYKC2jMxMciN0Ggik
 E708/nIR8uGxpMX7VZqo/Qj6lO4DGFEymw6+IFGBKfv4InG7dTiJdyb+47iR5N9V5kyZuCjFIyI
 6QrySMgEig6vKEn+JHvUduHRvOdIN9UGSc/OFM6okZBCQvXcy9G53oGJoAXxPO7QkLRdxR0DXZj
 6sMAG/IPYS7LC6hN5ZIscLILCmsc4Fj4ogm5RpEbxC/cccCQBdRp4Cm093t57yz8LAAvqJJ6
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682eb274 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=QlWjpmH-yOSsLRRY6RUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Y_1fPHHFusddgT-j52YZ335MJ4Bh7a4i
X-Proofpoint-ORIG-GUID: Y_1fPHHFusddgT-j52YZ335MJ4Bh7a4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220049
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
Changes in  v8: Fixed the review comments from Dmirty
    - Renamed the opp table from dsi0_opp_table to mdss_dsi_opp_table in patch 1. [Dmitry]
    - Referred the same mdss_dsi_opp_table opp table in mdss0_dsi1 node in patch 1. [Dmitry]
    - Link to v7 : https://lore.kernel.org/all/20250513102611.1456868-1-amakhija@qti.qualcomm.com/ 

Changes in v7: Rebased and fixed the review comments from Dmitry
    - Below four patches of v6 are merged. Removed them from this version.
        - [08/11] drm/bridge: anx7625: enable HPD interrupts
        - [09/11] drm/bridge: anx7625: fix drm_bridge ops flags to
          support hot-plugging
        - [10/11] drm/bridge: anx7625: fix anx7625_sink_detect() to
          return correct hpd status
        - [11/11] drm/bridge: anx7625: change the gpiod_set_value API
    - Rebased the remaining two patches of the series. 
    - Added anx7625 bridge supplies as fixed reulators, according to the power grid. [Dmitry]
    - Link to v6 : https://lore.kernel.org/all/20250505094245.2660750-1-quic_amakhija@quicinc.com/

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

Ayushi Makhija (2):
  arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
  arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes

 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 232 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 177 +++++++++++++++-
 2 files changed, 408 insertions(+), 1 deletion(-)

-- 
2.34.1

