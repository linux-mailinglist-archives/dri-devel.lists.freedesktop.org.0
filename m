Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC3B0361A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 07:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE9310E3F2;
	Mon, 14 Jul 2025 05:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eegRW8R7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D0B10E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:42:10 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DJvqAr004762;
 Mon, 14 Jul 2025 05:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pjoy9L+s2OuHVxCsEkIMiscMS7VR/zKPd39K+Z+YfQg=; b=eegRW8R7dKuT7ZWO
 NMiwDKudhBUYVzPDhcEFn26FwWoB79Y87+/AOQCkB/bhXZm380KuyMOtMZHf9TQM
 gVFIn/CXMPgqzd3QH9V42w+EpfryaDD3vgsRJvT8a2Uh9GyvMnV90/gwqVTcMw1Y
 YghuFeuss/qnhowLkZcAj/jLXW3SGLzISlWO01phrlhutJHwRUBS0XMX8WrkU2JE
 EiM859KeUGNN1PL12KD7NQXWO9/4OrBvFg1v2Bu6xZn17jxQ3Ne5Yo8ip3Hdj5bK
 df9LuAnlTkme1/MfyiEoBPLh3Zw4p41K/Bo9x0Ty+UwlFTuHOfZD9yApa/XmXvE+
 wo8Siw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufuekf3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jul 2025 05:42:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56E5g4qg014091
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jul 2025 05:42:04 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 13 Jul 2025 22:42:00 -0700
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
Subject: [PATCH v7 2/4] arm64: dts: qcom: sa8775p: add GDSP fastrpc-compute-cb
 nodes
Date: Mon, 14 Jul 2025 11:11:31 +0530
Message-ID: <20250714054133.3769967-3-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: rwWVUHsf2m-gdoXNzNUf3HZFW2kFaNgg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzMSBTYWx0ZWRfX+vHx8P3SLA3+
 ZNcx7sg/3+g0i0e0e93BzY8s9vMUGtoQcKFeRi/KvkVci8K93KeSp11pGwNBsVY7bkXFJu3YCX5
 JPDXvSpoAnl37sE3VKD/HSa77SNeNmGYJhvabOfAaH+lexpkGxZcdOvFMjeyQlQ3VvZowoMXnJm
 2+Xbwc1G0pTVVxGqNIUb0ypwPD85bki+IoLuLwC8pI7vx84jWkaBWct5iF2JiJdVLvQ/8iMVxg9
 121jlWDTwpilGvIpqrf1y1KlAdFuMgZKEANOoNnOeSIWU/zXUGiYiBHRDKZIQlcBnZ4o5p1WXNd
 LB2nheYypBZkIOfUG3tR25NhCQJq1+sWjc/XcFb0ACqHGpvtr7kzDe4KlIrHONaQrTkYN1n897e
 mVkuzHhgiraZh6IVQ6v399m0k8Zu59L/UCLl4UOtV7k1TSk6I0dUZ59sIkT/aQ7NeEtdYjof
X-Proofpoint-GUID: rwWVUHsf2m-gdoXNzNUf3HZFW2kFaNgg
X-Authority-Analysis: v=2.4 cv=TL9FS0la c=1 sm=1 tr=0 ts=687498ad cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CfRyy-KmkZQ3OiQjKWoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=863 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140031
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

