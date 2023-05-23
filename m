Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBCF70D057
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 03:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB99E10E3BD;
	Tue, 23 May 2023 01:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DF710E02F;
 Tue, 23 May 2023 01:15:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34N0sMdU001141; Tue, 23 May 2023 01:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=UO1s0M03wTvIPHQ9cNLsV67P1G2h+uyQqJfOCg5+Al0=;
 b=C9/2v1FiRZLgSgnPPejoym+f75lnI0oaCErFFnUuDjkrhSEdzIzplBwk6+ReerB490Hm
 mxYS3rnyW2aPPPTnH+Sbbu4sIOh6vh6Eyxs4mi6kAunvWQ0KdRQ1fVWvH7VhJAcpC0q+
 4Mtt17qEfFxU/xQ5nJpYQiY8Mq1wROuKcR2YqovZOc6G/l+JKuLvnQW3RyCldsXiD46P
 Cw99jpaWmd0VmUCWrHoV6nkuNthl/li+ah34tdAuwLJ1tPEzJe24aCAkFszqNhxqMDVO
 2XwVIyW3lX3HMVf+Z51J317emCF7VHrPt1jHaRE4CJABYHK41CUntB5Rwmui4fhEAfhe Lg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qpkwmw6ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 01:15:29 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34N1FSK1014500
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 01:15:28 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 22 May 2023 18:15:28 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp: Enable GPU related nodes
Date: Mon, 22 May 2023 18:15:22 -0700
Message-ID: <20230523011522.65351-4-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230523011522.65351-1-quic_bjorande@quicinc.com>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HOn7VQ6-RgtxjRw-NzPAZI1R5lCXk_SR
X-Proofpoint-ORIG-GUID: HOn7VQ6-RgtxjRw-NzPAZI1R5lCXk_SR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230008
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 johan@kernel.org, freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add memory reservation for the zap-shader and enable the Adreno SMMU,
GPU clock controller, GMU and the GPU nodes for the SC8280XP CRD and the
Lenovo ThinkPad X13s.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---

Changes since v1:
- None

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     | 26 +++++++++++++++++++
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 26 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 5b25d54b9591..547277924ea3 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -210,6 +210,11 @@ vreg_wwan: regulator-wwan {
 	};
 
 	reserved-memory {
+		gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		linux,cma {
 			compatible = "shared-dma-pool";
 			size = <0x0 0x8000000>;
@@ -259,6 +264,10 @@ usb1_sbu_mux: endpoint {
 	};
 };
 
+&adreno_smmu {
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8350-rpmh-regulators";
@@ -376,6 +385,23 @@ &dispcc0 {
 	status = "okay";
 };
 
+&gmu {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sc8280xp/qcdxkmsuc8280.mbn";
+	};
+};
+
+&gpucc {
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index bdcba719fc38..5ef3f4c07d75 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -264,6 +264,11 @@ vreg_wwan: regulator-wwan {
 	};
 
 	reserved-memory {
+		gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		linux,cma {
 			compatible = "shared-dma-pool";
 			size = <0x0 0x8000000>;
@@ -359,6 +364,10 @@ usb1_sbu_mux: endpoint {
 	};
 };
 
+&adreno_smmu {
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8350-rpmh-regulators";
@@ -518,6 +527,23 @@ &dispcc0 {
 	status = "okay";
 };
 
+&gmu {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
+	};
+};
+
+&gpucc {
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };
-- 
2.39.2

