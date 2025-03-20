Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCC2A6A24D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 10:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AEE10E18B;
	Thu, 20 Mar 2025 09:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cWA4uHo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BB010E064
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 09:15:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6YtDr004905;
 Thu, 20 Mar 2025 09:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F+zE79mH7nz2L9jfgN+evG2RmFUXCjR99aSiFiYXWp0=; b=cWA4uHo2ch3Z+Y2G
 W6B1SFp0FtJYNpsztrI4bOIjnFQS9K3PZrOmbHVGd7TNMiLrc5yKayPxYexYHogJ
 WmiAvBt9u57kah53DK6oBcwGuCK2c+t0PhEatXcupVcZViR09uiQHUvuu84pwpW/
 L1hvlK+ZWe9v2viO4BobuQTUcDG2mQC4j1Ngha4MMAOxLeNxsZ4ayWoazlLjRVl9
 Vmc5Dzci61xXqq5baakh7LTxgP2oUE4+CGG4c2SGNucVRLqX0koFgsmtbDWeXraj
 WqGQUPSMyiqEytL8dMJZXWcTGCc4q0K3t68cMbMZAmkFtRD3yVlHT1CEEKRQ9Ldg
 /UHo+g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd18mym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Mar 2025 09:15:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K9F6r0026573
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Mar 2025 09:15:06 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Mar 2025 02:15:03 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <amahesh@qti.qualcomm.com>,
 <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Ling Xu
 <quic_lxu5@quicinc.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sa8775p: add GPDSP
 fastrpc-compute-cb nodes
Date: Thu, 20 Mar 2025 14:44:44 +0530
Message-ID: <20250320091446.3647918-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dbdc9b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=0N1BruFWQXcd0hGPKwQA:9
 a=J9S7IUWIVzv7Xi4UEJQm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Q6OtTXmZ9cP2Tv24pe67OQ7ID1Htmj-9
X-Proofpoint-ORIG-GUID: Q6OtTXmZ9cP2Tv24pe67OQ7ID1Htmj-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=805
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200055
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

Add GPDSP0 and GPDSP1 fastrpc compute-cb nodes for sa8775p SoC.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 58 +++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 581dac8556ec..28025c76c96a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4850,6 +4850,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "gpdsp0";
 				qcom,remote-pid = <17>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "gdsp0";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x38a1 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x38a2 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x38a3 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
@@ -4893,6 +4922,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "gpdsp1";
 				qcom,remote-pid = <18>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "gdsp1";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x38c1 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x38c2 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x38c3 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
-- 
2.34.1

