Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745D69FEAE6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 22:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFD510E590;
	Mon, 30 Dec 2024 21:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="U/PwGcZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424DA10E593;
 Mon, 30 Dec 2024 21:11:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUIsF8F020158;
 Mon, 30 Dec 2024 21:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UxprjraKA5Ab/Y/kC2APfM++20dgWYPhfYmzJujlbDY=; b=U/PwGcZp4GWoct9g
 VhBu8VXmpHdYjogVq2j7OMpc8nqrE4qdhJjq6YTBIa3Unz/h05hL3nF1WRRCA+lM
 KJUf+pSbeIRmgR3fNVDgdvK9kWy19gCf3mHBpYPie5/n9wOpOkPRxUDbceciyCjZ
 uLyVrF6Z3tYKGIZiLpSskA6vl4ljoSCGfkxzI3sjQn8r4FpQ5M0THtKMqKC5jDFV
 P31kaLlbjTD4IoWhOSTVRdySWUjSBjjDZ3BVzKo3YKnkxdwl4kMHRXIhx0tCst0n
 yCXNpDl0WYS0996GRcBaEI9pMpr8gRgC3VIsfZ4qGqIkuIyTfLSow9GUdmnksFf5
 oJ6EwA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v16t86bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 21:11:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BULBrom007705
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 21:11:53 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Dec
 2024 13:11:47 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Tue, 31 Dec 2024 02:41:06 +0530
Subject: [PATCH v3 5/6] arm64: dts: qcom: x1e80100: Add ACD levels for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241231-gpu-acd-v3-5-3ba73660e9ca@quicinc.com>
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
In-Reply-To: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735593076; l=2473;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=MuGVSG18TzhwaFtlgYY2hQWdcICn0qFLYzTXj3nKYUc=;
 b=8/scjJbe3pUXv4xzW3ux+0Ic9+jjvC4dhukprKXu1LF91NsoyFHVSNDst0KTiqBsPQvY6v+l5
 JxxDk25FQJIATt9cGJGcQxP4ungKuDRi4OoCaj8ojvXOWPj6mD7XfnF
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5aoID9HL2PgzChHqYIq9RHlSgK76cp44
X-Proofpoint-ORIG-GUID: 5aoID9HL2PgzChHqYIq9RHlSgK76cp44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=740 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300182
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

Update GPU node to include acd level values.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 88805629ed2b..2cf16f904aaa 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3335,60 +3335,69 @@ zap-shader {
 			};
 
 			gpu_opp_table: opp-table {
-				compatible = "operating-points-v2";
+				compatible = "operating-points-v2-adreno", "operating-points-v2";
 
 				opp-1100000000 {
 					opp-hz = /bits/ 64 <1100000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
 					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
 				};
 
 				opp-1000000000 {
 					opp-hz = /bits/ 64 <1000000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
 					opp-peak-kBps = <14398438>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
 				};
 
 				opp-925000000 {
 					opp-hz = /bits/ 64 <925000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					opp-peak-kBps = <14398438>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
 				};
 
 				opp-800000000 {
 					opp-hz = /bits/ 64 <800000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					opp-peak-kBps = <12449219>;
+					qcom,opp-acd-level = <0xa82c5ffd>;
 				};
 
 				opp-744000000 {
 					opp-hz = /bits/ 64 <744000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
 					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882e5ffd>;
 				};
 
 				opp-687000000 {
 					opp-hz = /bits/ 64 <687000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <8171875>;
+					qcom,opp-acd-level = <0x882e5ffd>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <6074219>;
+					qcom,opp-acd-level = <0xc0285ffd>;
 				};
 
 				opp-390000000 {
 					opp-hz = /bits/ 64 <390000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <3000000>;
+					qcom,opp-acd-level = <0xc0285ffd>;
 				};
 
 				opp-300000000 {
 					opp-hz = /bits/ 64 <300000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
 					opp-peak-kBps = <2136719>;
+					qcom,opp-acd-level = <0xc02b5ffd>;
 				};
 			};
 		};

-- 
2.45.2

