Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB466B076F3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 15:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F1010E7A9;
	Wed, 16 Jul 2025 13:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iNfa/YLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A240D10E6E6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 13:29:28 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GCtB43014507;
 Wed, 16 Jul 2025 13:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pjoy9L+s2OuHVxCsEkIMiscMS7VR/zKPd39K+Z+YfQg=; b=iNfa/YLTG8cqLta4
 CIbapva8CiJs+84VXNHsZyojfrQ+/J5AsOsdLt3oHQg1jQ3m6lIk4kT7C5xEfokW
 1N5NOVID2/fSyp0y/rc5iCzx6LTMyK5QLPCcF9alijpdJYj76IFKnJEJqtk77HHq
 psUxXR61tM5C6T1wB/Q8uGOXKmRuT7mSeTbF3F3imY2JKgLQQUfH5AINDAH9milC
 4/B/C8cTrOC5WnFnlVvUqgto58AN1XVje6whwwN1ItU+FfWC7vFJBThBImDjPj6R
 y/OgE1g3EtwcGev2G8+O9dMrjbGFUX3aDTuhOb9RoOyHnyA5FD95CHDhyu80+GmW
 KWqLGg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dypyaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jul 2025 13:29:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56GDTNZ2026808
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jul 2025 13:29:23 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 06:29:18 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 2/5] arm64: dts: qcom: sa8775p: add GDSP fastrpc-compute-cb
 nodes
Date: Wed, 16 Jul 2025 18:58:33 +0530
Message-ID: <20250716132836.1008119-3-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZgOPjJSCGuW0do7HvZ_YvXOnOi2sxl8U
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6877a933 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CfRyy-KmkZQ3OiQjKWoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEyMSBTYWx0ZWRfX7/mqi1n2Hn3r
 LgG7eMda6B2fC+Greu49ZhNlFTY+9SDdTK1aIMwFBDdS6QKcuIn0kRQ2U1AunJ82NKeDzZplGjN
 zq1T9qkLOKmwJ8yLuoBpCdV9lYTiFwKSsBRI867UwineLX3iq5RW2JpjtrzqtVlVeJzgeLhoSB6
 ZF7vLSleqSSAHlLMOQbuFhGMoAxA0iS0iuX3E1Nyu3/NgaI/JltybYGBwq84xmDb9O3I43lIcGG
 4RleF7cDLDdOlnALrpMH45zZaK9ReUQSA729CEjjQZfcvcuAY+5L2JkeA6SwPpgxWmwCKy8k0Yi
 VCEDoUgSlNMtrgRXQKtjZTEvwbck76w4UvBL9cfNWz4/1sb+B8FXA2CV4bw+Wxc90yeawkEndAJ
 MMhWw7ToUiFxrLVs5gSRXE0EWp5YYabfk+/EhRqIQZjndMCNiPQNejGFEZ03Lwdl4ob4xsXh
X-Proofpoint-GUID: ZgOPjJSCGuW0do7HvZ_YvXOnOi2sxl8U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=861
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160121
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

Add GDSP0 and GDSP1 fastrpc compute-cb nodes for sa8775p SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index fed34717460f..5ebc058931ad 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6080,6 +6080,34 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
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
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x38a3 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
@@ -6123,6 +6151,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
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

