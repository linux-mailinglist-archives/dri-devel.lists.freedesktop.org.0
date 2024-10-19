Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D09A4F70
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 17:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78A410E3A2;
	Sat, 19 Oct 2024 15:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OltizsLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4BE10E398;
 Sat, 19 Oct 2024 15:46:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49J6UlBt005504;
 Sat, 19 Oct 2024 15:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 INktPbV7W46TlKLbtoIPptr+tVe/VWFjdGeKJyhJUdg=; b=OltizsLKwXzrfpiP
 COtREfaYKT+9erpG7B80aKg4apgQEi+XaGafyHJszp+7UYvmypZfPMAVfLlcaQ1S
 eeFF9i7ywzdC92EUxw7I/sbSj3RMYciiwGa2DUaAFPnEWwhy++FAoA41p9+mC4rJ
 2KTYgSS3fOOaUWapE5O4CjtstGc1JYnsGVJlyRTzLFJ9ADGsWYkVzdX01r4/20yd
 ujKnHMPrhvjcTr9zTFzFHtee/c6PMGR+o0QJvloSG5i2+QgPmyct6qfpEMRF95Dd
 phZkNgiep6Av1oB2VJLQfjXWN/1SZXmXz/FndZlVhUiyWvYFvPQpZmwM95yyzbzX
 1TvR0g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rj0t70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2024 15:46:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49JFkIra018796
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2024 15:46:18 GMT
Received: from hu-mahap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 19 Oct 2024 08:46:11 -0700
From: Mahadevan <quic_mahap@quicinc.com>
Date: Sat, 19 Oct 2024 21:14:57 +0530
Subject: [PATCH v5 5/5] arm64: dts: qcom: sa8775p: add display dt nodes for
 MDSS0 and DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241019-patchv3_1-v5-5-d2fb72c9a845@quicinc.com>
References: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
In-Reply-To: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729352737; l=3798;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=mVQmN0s+yxLNnXQjp2K8qu5YCOAaJkDNG2R7E0GN6xg=;
 b=D+Ohls0znQX8sO3lWNINejk/r6wH1GCHU+tYJn/5twWmUZBLkMfnE1TQId0WauWr0PAYfaJBi
 vlEforKJONaA8AKl9CeE4FIchk6LO5du4VmGAvAWCFu4iAcKFU1RUog
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ebksaMtzSB41RM5kAG8S8Z5_d2ZEdt_n
X-Proofpoint-ORIG-GUID: ebksaMtzSB41RM5kAG8S8Z5_d2ZEdt_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410190114
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

Add devicetree changes to enable MDSS0 display-subsystem its
display-controller(DPU) for Qualcomm SA8775P platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 89 +++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 8fd68a8aa916e6595134b470f87b18b509178a51..5f6b7b59ec707490b162649d0fd97f85b1489e45 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
@@ -2937,6 +2938,94 @@ camcc: clock-controller@ade0000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss0: display-subsystem@ae00000 {
+			compatible = "qcom,sa8775p-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			/* same path used twice */
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
+			resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x1000 0x402>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss0_mdp: display-controller@ae01000 {
+				compatible = "qcom,sa8775p-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdss0_mdp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <0>;
+
+				mdss0_mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-375000000 {
+						opp-hz = /bits/ 64 <375000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-500000000 {
+						opp-hz = /bits/ 64 <500000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-575000000 {
+						opp-hz = /bits/ 64 <575000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+
+					opp-650000000 {
+						opp-hz = /bits/ 64 <650000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+		};
+
 		dispcc0: clock-controller@af00000 {
 			compatible = "qcom,sa8775p-dispcc0";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

