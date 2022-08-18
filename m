Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28173598DA2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 22:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DE810EE3B;
	Thu, 18 Aug 2022 20:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7765810E176;
 Thu, 18 Aug 2022 20:19:28 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IJOfkF002577;
 Thu, 18 Aug 2022 20:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=3h1aiXrphk5T2rqN3UBCgmzr+FGo6Il6A5/GglCrd1c=;
 b=L9Kg/BBIad56nYOisCJ1hTKIgILQ0XQqXale5FSphsCo4xj1MVFe5+INgaQT/9Z41Yaw
 fmjWp6oIgS7TyKQ5KTBJ741yGJqPKppTG1YeloUu7oATLy4O9x0K4+OTjxAF/JVTQVBw
 /S3mGsoyzHxZYhf9rORAUyGmFzv6Y69JoavES4JEpZGlSL0d9IecqeCcFWjL0iNmj3Xg
 E6sATdt3GTq2LVHh0BjvSRoaUu69HJQGPMpun0o0d2kzCMCwI2spETtMA8llLnStYYv1
 hd5cCayTNYewpuOJASq6bRnx4QAVE3bE4qqYcMsYsBznx2FdC5J38eT3Oh9oG4wdr5Ug Hg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j1rvb0t10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 20:19:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27IKJO1k019954
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 20:19:24 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 18 Aug 2022 13:19:19 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 5/5] arm64: dts: qcom: sc7280: Add Reset support for gpu
Date: Fri, 19 Aug 2022 01:48:39 +0530
Message-ID: <20220819014758.v3.5.I6a1fca5d53c886c05ea3e24cd4282d31c9c0cd0b@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660853919-987-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1660853919-987-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gDIMd5hGg-IZh9_htlmcyVJwAsyEcrME
X-Proofpoint-GUID: gDIMd5hGg-IZh9_htlmcyVJwAsyEcrME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_14,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180074
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
Cc: devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Reset using GPUCC driver for GPU. This helps to ensure
that GPU state is reset by making sure that CX head switch is collapsed.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index e66fc67..f5257d6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2243,6 +2243,9 @@
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 
+			resets = <&gpucc GPU_CX_COLLAPSE>;
+			reset-names = "cx_collapse";
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-- 
2.7.4

