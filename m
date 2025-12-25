Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B94CDDE36
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 16:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E1E12B901;
	Thu, 25 Dec 2025 15:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fcFhF0HZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5849110FF3A;
 Thu, 25 Dec 2025 15:21:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BPESViY2110782; Thu, 25 Dec 2025 15:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=p7Q76h8F8rG+kI8SGtk3+9MdyPeZgWdBvaR
 CZ81+WUE=; b=fcFhF0HZ+WhBwz4vIebuZpM1e94gtUmGwyFvCnRwxNR76FNGsjh
 aaMqv9QOmRYu2l/NlEQePvJZ5GU77a4EaaRUw5UP0xjcb4c0Kio1A2+DS6lScoIN
 o2Jt4Kq979vsuFoW4RdMiKKqvPT7+b3bsTaxvSpR828fz6H5Mo+eY1sS2tAsYY7L
 tF7U+wLlYC5VV3eBVU4rBogrzWjpQ6Ww/ugH3hqSGQaeRowQHe5RimV0J7nLjlkF
 Q18WvPFU/JrxVscy6g2d97AK2o0LQYwZdoWA1Noaxej/6PyCVcFRy5zIxWjkTPR7
 hJT8kt4H5XWGWKYcYBJoGGoyXuGEGmOzNeA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r4frf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Dec 2025 15:21:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BPFLbEw006279; 
 Thu, 25 Dec 2025 15:21:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvn0fw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Dec 2025 15:21:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BPFLaIZ006256;
 Thu, 25 Dec 2025 15:21:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BPFLaGZ006250
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Dec 2025 15:21:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 81456592; Thu, 25 Dec 2025 20:51:35 +0530 (+0530)
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
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: [PATCH v4 0/5] Add DSI display support for QCS8300 target
Date: Thu, 25 Dec 2025 20:51:29 +0530
Message-Id: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oExvvK3gYQFy_6GVBB7Mqu5KXryzT9ZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDE0NyBTYWx0ZWRfX3uKHUt57TcI+
 80PEMIteeqW87k7FlTaCZrGdlD0wwqCkM5mqiZ404CB6NdsZ8YEKgMDl3UeQpT0K9vxVRSzOiLL
 97TjqdfB5hX3X4yDQAhyhTK5vZizG0VaCH6zHjZZj1BVyFPQ7qdBesWbekETaVSLczpuJjS0wez
 GkPQugnRRbxLHm7NrnwVQ46TWyM5oTZAlZNkncVLZ09TZ/vUW4iSvqpeQI0Y4KdVmNrUnIrCDO8
 /C7woNtfLTSgCr+pF+nuSeqpROYLAJy4/8F+Y1bF9OSokxN3ttjoJCeqYVF2RFRf6+3oaAc5Y/T
 YvwaNO2lVc/E/Br8qRIDL29B6rdMTNZFmf2Nsf4YwjvqzF+LZtjzsJZnWttH30U1S0qke1FqZQe
 jO7SOoDq5jYiUOmnMlPpsS6MWANwDQETVAlBuBVaWSwIditlI9FfDAdaaVmdUeIl8TJVAuGorI9
 TecUWoZRAnixik1pRmw==
X-Proofpoint-GUID: oExvvK3gYQFy_6GVBB7Mqu5KXryzT9ZE
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694d5684 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=3UhwaOG55YdarTGHrZ4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-25_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250147
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

This series enables the support for DSI to DP bridge port
(labeled as DSI0) of the Qualcomm's QCS8300 Ride platform.

QCS8300 SoC has DSI controller v2.5.1 and DSI PHY v4.2.
The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.

---
This patch depends on following series:
https://lore.kernel.org/all/20251117-dts_qcs8300-v7-0-bf42d39e7828@oss.qualcomm.com/
(Enable DPU and Display Port for Qualcomm QCS8300-ride platform)

Changes in v4: Addressed review comments from konard and Krzysztof
   - Patch 1: Update commit description to clarify PHY compatible string
              details.[Krzysztof]
   - Patch 2: Update commit description to clarify CTRL compatible string
              details.
   - Patch 4: Added new lines at few places. [konard]
   - Patch 5: 
            - Moved regulator always-on and boot-on properties at the end of
              the node. [konard]
            - Added new lines at few places. [konard]
            - Made the tlmm gpios entries sorted based on gpio index
              number. [Konard]
            - Drop output-high property. [konard]
   - Link to v3 :
     https://lore.kernel.org/all/20251125013302.3835909-1-quic_amakhija@quicinc.com/

Changes in v3: Addressed review comments from konard and Dmitry
   - Patch 2: Remove qcom,qcs8300-dsi-ctrl from clk details. [Dmitry]
   - Remove PHY and CTRL driver support. The CTRL and PHY versions for
     Monaco are the same as LeMans, and Monaco will use the same CTRL
     and PHY based on the fallback compatible string [Dmitry/Konard]
   - Patch 5: Rename the regulator used and arrange the compatible, reg,
     address and size cell for i2cmux in proper order. [Dmitry]
   - Link to v2:
     https://lore.kernel.org/all/20251006013924.1114833-1-quic_amakhija@quicinc.com/

Changes in v2: Addressed review comments from Konard and Dmitry
   - Patch 1: Documented the qcom,qcs8300-dsi-phy-5nm compatible string.
   - Patch 2: Documented the qcom,qcs8300-dsi-ctrl compatible string.
   - Patch 3:
           - Added qcom,qcs8300-dsi-ctrl and qcom,qcs8300-dsi-phy-5nm
             compatible strings
             to the Device Tree bindings. [Dmitry/Konard]
           - Fixed indentation issue. [Dmitry]
           - Drop the extra empty line. [Dmitry]
   - Patch 4: Added PHY driver support for qcom,qcs8300-dsi-phy-5nm.
   - Patch 5: Added CTRL driver support for qcom,qcs8300-dsi-ctrl.
   - Patch 6: Included qcom,qcs8300-dsi-ctrl and
     qcom,qcs8300-dsi-phy-5nm
              compatible strings in the Device Tree. [Dmitry/Konard]
   - Link to v1:
     https://lore.kernel.org/all/20250925053602.4105329-1-quic_amakhija@quicinc.com/

-- 

Ayushi Makhija (5):
  dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
  dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
  dt-bindings: display: msm: document DSI controller and phy on QCS8300
  arm64: dts: qcom: qcs8300: add Display Serial Interface device nodes
  arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP bridge node

 .../display/msm/dsi-controller-main.yaml      |   5 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |  30 +--
 .../display/msm/qcom,qcs8300-mdss.yaml        | 102 +++++++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi          | 102 +++++++++-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     | 177 ++++++++++++++++++
 5 files changed, 402 insertions(+), 14 deletions(-)

base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b ("next-20251216")
-- 
2.34.1

