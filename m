Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B294BAB003D
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 18:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2020410E93E;
	Thu,  8 May 2025 16:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XA9LS8kA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DB910E93B;
 Thu,  8 May 2025 16:20:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DDj0k002235;
 Thu, 8 May 2025 16:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cJNGRAA5W0d9okVSXO4BPgs6c4elS/ruoJbGIngO90I=; b=XA9LS8kARNNvzapp
 VVG8JGHsb2NtbFdjnMYl08GgIbU+J7oJG2bVnysY6wDi5cbiBpE8sySlWVMTEw1F
 bLyKK8ChrqtLwPP08WKu41XmhGcU8Ta5B7yGxwJOuRb0IsjiFTBE47NYt04HTWwi
 YNbxNI94YY3MjRElJ+Oxa1UjJKU2/rINuL25EILTZ9RLqMbDkaooRDkvlBduloB0
 G/yEgyyZ1JiOx/c67J+MsJ7gqe4uSkdwX7VdulapG7glM+hLFmezf45c9KcwMO8b
 UFq5NCS/7RQK84vLQhLM411FySAXc+Z/Pp7dEQ22iqC3xASbtshNyOxGj0Dpp6HZ
 aM52pg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59wnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 May 2025 16:19:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548GJwgM021217
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 May 2025 16:19:58 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 09:19:52 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Thu, 8 May 2025 21:49:21 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250508-a623-gpu-support-v3-3-3cb31799d44e@quicinc.com>
References: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
In-Reply-To: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>, "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746721173; l=851;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=SLqrWslc9+dGwuPw0tM3Mj79iVa07v05e8RMDZ8vSlg=;
 b=KAcidV0oCftdY49tt7KB6TeSJARX2wauMgDogFSD83Nx19GWcENH6X2mchS5iP4RdsRw93V+5
 WPJ/BvYkV+3AHHxFfm4WOl8lT3DWz/wy20cl1NI01UK+dVc0Rekvoao
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681cd9af cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=ZzVv045XBorpIeM7bZwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RlCNI5dDwh-olYYbo1PSuf4do98OZAj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0MiBTYWx0ZWRfX8wUKRJrXObvL
 wDmCQWG2UC0ethBHE6A7vybDruhVNckWp8dCJVo8WnnqUFxPeaj3CBk8ObCUy23pDs2+BF/GVxu
 3Yan6mJzLd8Y9UR/uybk3qL4o5ms83xWa70CR5YfodvvfiRQMlxOUsfBJhEGDlfY84Y5O3W1tAE
 RTRYWkAyvi/1k4L9DtWTuN/LjVB+ERiL27O+Dpc0A8tWHx2BZd0Didt9CAAwOS4b8wck6RAAmPE
 WCNl276cMrgvAHdcy2MZyQ5bL6mYdZmqoRg/fDq3VOZ9Oq7ImBkr+4QgMSvVD23QttMnvKO9ftK
 ATp3NeqlEZWZW1i1P/z+kvV6/rT6kRQgnu0LegVfoyjFcQLv0Wtyx4jYLRkjK5l0xpI0D38O7FU
 4E6BHVSoAjBJDUTI3qYfYsEewKYjtUCCC9nx8JMQJHk0ohKAQhhg1XwUIGbohIGsAHRAMY1n
X-Proofpoint-ORIG-GUID: RlCNI5dDwh-olYYbo1PSuf4do98OZAj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=902 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080142
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

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs8300-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index b5c9f89b34356bbf8387643e8702a2a5f50b332f..5f6c6a1f59655bee62ca9ab09c4ee60c1b826a66 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -285,6 +285,14 @@ queue3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs8300/a623_zap.mbn";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.48.1

