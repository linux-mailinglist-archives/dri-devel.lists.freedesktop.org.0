Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E687BAA7EE9
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505D010E373;
	Sat,  3 May 2025 07:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="DolCqiCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B5510E36B;
 Sat,  3 May 2025 07:04:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433S9he015858;
 Sat, 3 May 2025 07:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w6FTIxjmnrVIMbjYmNyi66xrC7oUXS4eW4qGDVqqnAU=; b=DolCqiCRr6N6KNU3
 Fq6PTYAaPq2KSQQjCXFfhuyMuyVX+6cVVlr32NM0BVDxMjHKO5d+nphPkvdFMr2V
 hQ8ZS69m0sAvX8B9bkmvAneC5W4GnQ+JOjaTejqD8HBiXN5wrwMRtZ9QXexWvJQs
 82Xgr0QLP5KHBk2pjN0w86+YQ8mk2n/hFeHCiQURFfFkVyLbxosq+T1sZMmvLNJn
 y1COXbJOHszcGL+kNwWZQjd8yHxQgsrpY71yCT4rkRebGh2VGZ/gcWdqyzouLbAN
 2Po1pSPgrPMbS8mvz8oq2TRikly1YrKJDsui3dIuoiD9rpjvhlp8grOBl1KhwWrJ
 ala55Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep0bsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 May 2025 07:04:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54374gmO020827
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 3 May 2025 07:04:42 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 00:04:35 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Sat, 3 May 2025 12:33:37 +0530
Subject: [PATCH v6 6/7] arm64: dts: qcom: x1e80100: Add ACD levels for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250503-gpu-acd-v6-6-ab1b52866c64@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746255835; l=2693;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=0w1fKddcScC0dmSgzxeQLcre4UwOthTrSfgZ0RkvsYw=;
 b=md18TOTDVSsl2HaAvTjaRo6O0CeV9Ec7C+pIniXWdMGqglUli/S2WS0Z5D6kbu5oEZKxe8YIQ
 l/2VXOBQ0USAeIgEAFUPp/1sUx3GGl9WX80t781ymocCGM4rEEx8iYZ
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6815c00b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8 a=COk6AnOGAAAA:8 a=BxRqZMmKrSJ94LtEhJwA:9
 a=QEXdDO2ut3YA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qJNABv24YKMhBYxZuEXzOwCxfVlMIeL_
X-Proofpoint-GUID: qJNABv24YKMhBYxZuEXzOwCxfVlMIeL_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA1OSBTYWx0ZWRfX8hOTeC61g+mi
 CWBnSnfT4TZZzPKhz78de9xE8VGHlnBTinrIfK5F2Hixk6waoetzgNRqHpNYaUaDkCuqJIj0y7m
 n9J/YMRINiIIuTRBA5N3NQxHVqbQOgs5DvOr+hIDbU9+O9wtPwTjJpB+76HWicZX4yKEj+tI2uW
 tdjI7azilTHeilFNEtRG2stUmS6730Vq3GCC/TtUKb4qGoRjm4OG/fbdm/buwsim4wCm2fg5uXa
 aUBeARGRFzL7GSCvQTYixyVjhMYGcS6g6D7xBGKQeO5R7+rxekiy5eTNIOLqgRO9AI94bbf9siv
 HSF2/guQe7Jk2+8BRkM77kQk6YWG9gyJzWkPsoCG5vTdLHKy1NJfgwBMCpHu6VV22akYBxM0jIh
 b/InYAckJ2GSV5AmwZ22vQZgPHpllClZy/u0BnBufv01w3lye5dy7yxu+SZ4/ySqu3q1jvI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=848 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
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

Update GPU node to include acd level values.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Tested-by: Anthony Ruhier <aruhier@mailbox.org>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 4936fa5b98ff7a9a009e3106f4dba90131251971..a9c8cca1c6356393962cef856b3dbd9420733999 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3752,60 +3752,69 @@ zap-shader {
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
2.48.1

