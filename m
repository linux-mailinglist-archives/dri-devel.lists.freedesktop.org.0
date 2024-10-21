Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C99A9244
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 23:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BE610E5B0;
	Mon, 21 Oct 2024 21:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mlYQg8Ot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2184A10E5A9;
 Mon, 21 Oct 2024 21:47:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LKJuXd015846;
 Mon, 21 Oct 2024 21:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ox1auV7CLtxKrIsapOLe023HrOS7BeBH+ezp21V1tVE=; b=mlYQg8Ot8rkN3Xbk
 a0Wp86dsNp7R1Zb4Ng/lrMegHFmxirPSzMLInpFhlfny/e9q4wHuf8rl+FvIYAVf
 X4Tfz1rjF5SEIQhaHt10dNHefQfpuuslJeHn+8huLM6tAx59OGav9zcTbxVV1MFZ
 Ttcv/jLbz+lzHIp0I+5ireAae8QMsHQU1y1Z8kYnWV1wQBlKxHiiKT8BZd/PPQIH
 UHSbcfrsLGOgFfKWwim8Gu01SBVMi5xt6EAegWCNWtTbXIGFaR8PZdsR1DFj0cj8
 LKKSKHEEMWcvxo0Am712fZcEPE+cWZzf0tujn8lxI9a9lNv63Sbr+voZPGufRzwo
 g27A0Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rbe4u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 21:46:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LLkuvA027581
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 21:46:56 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 14:46:50 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Tue, 22 Oct 2024 03:16:05 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241022-a663-gpu-support-v2-3-38da38234697@quicinc.com>
References: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
In-Reply-To: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Puranam V G Tejaswi
 <quic_pvgtejas@quicinc.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729547190; l=3550;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=sIXVbChZVgR22WMeWSeKGkZMTtow/fNFpV5NJ2ZlIwk=;
 b=6ddXMadn/SmVhkFg5py7qd7rKOBuOOs3GYKS2fSgnszvo2UvPFs35cQ2hOEl6gCtCrgfFN/jY
 KXnUtTXWv4UBxQzctw2GrW9my9Fx69vraSDcsq7vr7vHAEMQAUvVF3T
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gSZXiMeTylw0cwb5pcN6x5DNIoJ5T3vk
X-Proofpoint-GUID: gSZXiMeTylw0cwb5pcN6x5DNIoJ5T3vk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxlogscore=876 lowpriorityscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210155
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

From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>

Add gpu and gmu nodes for sa8775p chipset. As of now all
SKUs have the same GPU fmax, so there is no requirement of
speed bin support.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 94 +++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index e8dbc8d820a6..c6cb18193787 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3072,6 +3072,100 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-663.0", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&adreno_smmu 0 0xc00>,
+				 <&adreno_smmu 1 0xc00>;
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-405000000 {
+					opp-hz = /bits/ 64 <405000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <5285156>;
+				};
+
+				opp-676000000 {
+					opp-hz = /bits/ 64 <676000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-778000000 {
+					opp-hz = /bits/ 64 <778000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <10687500>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <12484375>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x34000>,
+			      <0x0 0x03de0000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "ahb",
+				      "hub",
+				      "smmu_vote";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+			iommus = <&adreno_smmu 5 0xc00>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+			};
+		};
+
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sa8775p-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.45.2

