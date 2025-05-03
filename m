Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F2EAA7EEB
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AF410E333;
	Sat,  3 May 2025 07:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="myquGS8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB5F10E333;
 Sat,  3 May 2025 07:04:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433S09b029392;
 Sat, 3 May 2025 07:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Cvsir2XQ4EtL7O2Ly/4UqhXBUkg0DpAs1uDQValKM4g=; b=myquGS8l8sDxrC83
 sJUYWm6UnOceTMEfPBgL8OcfxZOauS4yNp/RnFxkkkO0KYDDHV1jIZf/nQB+fDeN
 U+MvSTGkC8MUqj+ZB+a2p3ANX5AVf4D+1yLgs9ccQ96K2M5qKkyu4ewZGahH5UHl
 YWRV0mwz7oHzV8Ack/Lr2J8mQEqSRNKIdC1QCoWzKuxkmOShCOtPsOCFSM3NXvG2
 xs6SLq3VCYaVbaDALjvLBo6ucSaRJd9vrjpDaBm4ovYHmMx2VoVvmoONJ6MSjTTE
 N04Ji19ccyCTdHXBzIPnIE++tVnqMHETLOkAliSPBw5DMQLoPsaridZhz9Eg/W12
 BvjDTw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55r9pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 May 2025 07:04:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54374mNa026659
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 3 May 2025 07:04:48 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 00:04:42 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Sat, 3 May 2025 12:33:38 +0530
Subject: [PATCH v6 7/7] arm64: dts: qcom: x1e80100: Add OPPs up to Turbo L3
 for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250503-gpu-acd-v6-7-ab1b52866c64@quicinc.com>
References: <20250503-gpu-acd-v6-0-ab1b52866c64@quicinc.com>
In-Reply-To: <20250503-gpu-acd-v6-0-ab1b52866c64@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen
 <quic_akhilpo@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, "Maya
 Matuszczyk" <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>, Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746255835; l=1555;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=+8PcFlIp7sWXkaALKqBGcEDvBWNN8sFhJTyiG0fLlXk=;
 b=iEe08S1zpDVAJUH5HDE1MJnyOZ/OpjQzhGO5GuVvyJsXMOdlARUNCX7PCl6AHpUbm1O1U7RUZ
 5RArasmtmi5B9PmHWyyGz1+Kzhl2AvN2WvzmfmKkr2mADgXtG/of4Tt
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA1OSBTYWx0ZWRfXw8vvl3TiOcGd
 VB82IJB01I0SWtvPkGVGOsGjtyku/WKg6HsEyx1MJqts223t7Wwg5jjD+Y/VEMASlOgtVEmrmMz
 czA8n3NPIDUgUUqqQ/R481wtrAfLpvUYRqSfBYrC8Oq6Z+ENVceFBXcaD01E4nJZr6aYsJ8qi7O
 YlswG4vsJpn7KH+ibMlO9WJ0ZKoeh04K26Mw9ImTvZGOQI/AtDL1Gu5J+XIWBd6OmUAJ40564Xl
 5M8ZztXOjZuRxiCz7GyZvXhNJ5+jzp7y+Iz3iHaJZxX+9Sx5QvKcotW+hOeEMnp5sF+5LHuCbCt
 QR1m7BlGr8zpwm5JFBs4NIlHgwm+2BLlRMUJaP2x4ElESwxGyzGPzmJMYNXEi/A3iuycKK9B63q
 qf8TeOicRMo5FzV8TfYc8NfRsYeo/5ui3R2WPi84MEQrZMXEB4y0LKg85uP+kEvGUYin7+fy
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=6815c012 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8 a=COk6AnOGAAAA:8 a=1Bjw1aJ-qlzXb4ygRX0A:9
 a=QEXdDO2ut3YA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PSpNBqtUlx61gkPrfXw66kyB3Io6JMW0
X-Proofpoint-ORIG-GUID: PSpNBqtUlx61gkPrfXw66kyB3Io6JMW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=926 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030059
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

Now that we have ACD support for GPU, add additional OPPs up to
Turbo L3 which are supported across all existing SKUs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Tested-by: Anthony Ruhier <aruhier@mailbox.org>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a9c8cca1c6356393962cef856b3dbd9420733999..8eddf0c9609871b8660587a22b008212a67604b3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3754,10 +3754,24 @@ zap-shader {
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2-adreno", "operating-points-v2";
 
+				opp-1250000000 {
+					opp-hz = /bits/ 64 <1250000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+				};
+
+				opp-1175000000 {
+					opp-hz = /bits/ 64 <1175000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+					opp-peak-kBps = <14398438>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+				};
+
 				opp-1100000000 {
 					opp-hz = /bits/ 64 <1100000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
-					opp-peak-kBps = <16500000>;
+					opp-peak-kBps = <14398438>;
 					qcom,opp-acd-level = <0xa82a5ffd>;
 				};
 

-- 
2.48.1

