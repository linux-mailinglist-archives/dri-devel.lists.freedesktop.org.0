Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64EA9FEAEC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 22:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC1B10E594;
	Mon, 30 Dec 2024 21:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mw1sIOKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789B510E58D;
 Mon, 30 Dec 2024 21:12:04 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUIrfq9019929;
 Mon, 30 Dec 2024 21:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bgdK/mxKjEx2nxpeFifwgiDucKrI/TtfYPsCtwMew2I=; b=mw1sIOKiV/1dhq1s
 d8OLfsExWtxLDg4qnOLuCoALKCdvMYPVE+U0emrm2tnxgXQ85twGAjPM1MODmmLB
 GjacJln3Z0XpcsILZdBBqSUifgucT3J4N2FTVvtPaEKnVBHI3jOfi59o4CHGirec
 Zvq8YzHU1AuA/x8Br/u5Hd/rCwvFocR17e2+NZNsah5MS+SD0yK3TEXgoRggumWs
 Pp3rwUVu72oAxOomVcQ5kmJlzjWbaXN3VggRNdyF01cnFP+IaHlqt5fRu7tkKAwh
 jwVoHpl0meX0GgG6xW/K6Zlr7tfp30XLvFOdDA2qSMpz6oCqJiZbGvM2AiBgTXsq
 rhWBow==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v16t86bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 21:12:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BULBxF7031433
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 21:11:59 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Dec
 2024 13:11:53 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Tue, 31 Dec 2024 02:41:07 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: x1e80100: Add OPPs up to Turbo L3
 for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241231-gpu-acd-v3-6-3ba73660e9ca@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735593076; l=1193;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=sjQ6AQqTrV2rQKu5TT8e3XNqJKk8DNi/FMTskLJkUYg=;
 b=mGOky1KlbLhralFvRZhTtDzgvu+KsX7Vi+FhNj0iXv5OhBo/3qToKLWtzmHRmhoCYwTk9Y3BO
 Jy32XUR4CLKBbw5AfLzR0JetsbYm299qvYwfzbwng/JkebIiCRr9OT6
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ShJPF4g5Zqzw2P0eV6q1ytWJkLS0zthI
X-Proofpoint-ORIG-GUID: ShJPF4g5Zqzw2P0eV6q1ytWJkLS0zthI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=860 impostorscore=0 bulkscore=0 lowpriorityscore=0
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

Now that we have ACD support for GPU, add additional OPPs up to
Turbo L3 which are supported across all existing SKUs.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 2cf16f904aaa..2e03afb85822 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3337,6 +3337,20 @@ zap-shader {
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

-- 
2.45.2

