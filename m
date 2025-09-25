Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6732BB9D784
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 07:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C8610E842;
	Thu, 25 Sep 2025 05:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kpDwu2fF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F44E10E26B;
 Thu, 25 Sep 2025 05:36:21 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONiVpv029044;
 Thu, 25 Sep 2025 05:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=SiJomSvigflcijZ8Hjhvzj1Uqeo93IsBHsm
 HqGcw7/A=; b=kpDwu2fFbppkzOsLivAyF5PSWJu5anhbxPOvKLtMCWidQS49/pN
 iVmEiIORrnYIDLi2l2MjpiIAoes9FP0I/0aOwraPXiUIikhKKbLSJgplMDz2FYjz
 JmuWOmVvZlkA3SHlmOkcMhiHb8Bhl2jT/QXwbK87KCk2dPYRQfzSbW80/5vExocv
 NtRTGxBwSm+DA5ZhMPB2GXStZX9o9zPbnrCRLRhns7QVCcw6TcchAbfEeaeQTzQ3
 VNl+sX+LA0JBoXCrNSm0852y5e4Amg2dddQhbaMNlEaYhNhtOiV8DdmhYxdiHWTK
 Y2rnq2Kk4bUs0zh6BYAKq50GjNLnKWE8lVA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmny7xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:11 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58P5a8XK000688; 
 Thu, 25 Sep 2025 05:36:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 499nbm8bwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:07 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58P5a7cU000660;
 Thu, 25 Sep 2025 05:36:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58P5a6Hf000658
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:07 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 2276B56F; Thu, 25 Sep 2025 11:06:06 +0530 (+0530)
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
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: [PATCH 0/3] Add DSI display support for QCS8300 target
Date: Thu, 25 Sep 2025 11:05:59 +0530
Message-Id: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d4d4cb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QF8eukqJN6OF58MEyQAA:9
X-Proofpoint-ORIG-GUID: mao4Vumg_hcFxSHGZ27kkNsPawBNMjdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX045a6HG9M8oj
 Lm/weq4J7EDhk7rV+dB1C/mYmg4BwaWrMbuxcPtYA7o8vS9HHsvlBpX02shryMBBa2liH2TpeW3
 +27xtjJ2/qfDrUCkuO1sttEBj5fmcwbyr6qTlHDvpkdVAd0FSTXHK6omye+YI6TeAAI9D7olWEJ
 6hDbR/gi5WQC8Wt77X4DTGdYCpxPVIX+ME7Mu3sSx25mZjSLZYG2Mh/NbpGf1OmQz+0np33RfeK
 L7kKZ9eJ0GI6O4ncmKghCFJqzgPJlqbdmw9c+HmMcu2VifcJaLjzIV9Z2Vb6K4opL55sQOdj0jU
 DHhg/KdgMo4KMjFCQ7vlicK5r8+TUXm9zpGhKPs0KiHLDZ7EU1qyJxY9J7E9MEPaFOL4FsD7cOX
 ekCWMCZX
X-Proofpoint-GUID: mao4Vumg_hcFxSHGZ27kkNsPawBNMjdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
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
https://lore.kernel.org/all/20250916-dp_mst_bindings-v9-0-68c674b39d8e@oss.qualcomm.com/ 
(Add support for 4 pixel streams)
https://lore.kernel.org/all/20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com/
(Display enablement changes for Qualcomm QCS8300 platform)
https://lore.kernel.org/all/20250917-dts_qcs8300-v6-0-5c862aa80f64@oss.qualcomm.com/
(Enable DPU and Display Port for Qualcomm QCS8300-ride platform)

Ayushi Makhija (3):
  dt-bindings: display: msm: document DSI controller and phy on QCS8300
  arm64: dts: qcom: qcs8300: add Display Serial Interface device nodes
  arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP bridge node

 .../display/msm/qcom,qcs8300-mdss.yaml        | 100 ++++++++++-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     | 170 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         |  95 +++++++++-
 3 files changed, 363 insertions(+), 2 deletions(-)

base-commit: fba389ea7aa6401d3539456123cbadfa1a87231e ("next-20250922")
-- 
2.34.1

