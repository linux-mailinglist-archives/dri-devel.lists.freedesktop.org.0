Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB39BEB00F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 19:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A526E10ECA8;
	Fri, 17 Oct 2025 17:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlVAKuzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFBD10ECA8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8aHQe009754
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dHkPqzKL5cOW6aLL+kPJl4pl/S+1jflMOk+MByC2fno=; b=HlVAKuzHh6zu+Egu
 DSqD6lycJX5+oBGVKBDWD9ysgND+vCI1g+jjSUtG0Trybpsyawxps/OhKXviOyVm
 9tO75ZywroCnvPQu3u/Kebe2WZtHw6LkS/nhgdbsiiPz9NVENM1EXuT8+sO/i3Ku
 cyYY+isDWLcSVtSJqhhuPFZvhtdpWp9MNBDZOyAPesAAx1/Yb+fzEkNhH75iKCZY
 JMld9i6FVGzectTOD7OxDU0XUoI3BaisR0/TvFs2xV1bre0fTRIsOksiHYzTBu0/
 uZcrWEns+QY/cjP3q6QgdYCeP128qg1bKd5l0VDaSKzRzZvrHKh2+SXUPul67zrU
 Oanv/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1asa76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-290c9724deeso15487955ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 10:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720969; x=1761325769;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHkPqzKL5cOW6aLL+kPJl4pl/S+1jflMOk+MByC2fno=;
 b=cobCFy6ExRWkbPmp1NJ6eN/UtdwIWH+rN5VawV7rx96cBuubeBHBdMVSkZbzD0SSp6
 RY5Whtyoqx8KjJYE5acEeXfrpNw1BTDRAbDwk18LdaiLxl+pg5p/elE/crjdWP5DSaa8
 6nTn0gOKWn+PvjPbp4KT/L1U+qy6LJao84iskOu/6LDBBrX9ZzH6G9a/IyclnPbkfbJ5
 wLzlzImlsaPQ9c+ui2p8hVpQDqShMlNhsonMVm0kTibSmMjgiPuglHxutGjOGIQPW6Nb
 OWC2JMohmjvHTHpdHl8RQWu+WKS+fHKM2Rv4Ks+eK7zPx/9ospYF0c8KZkrpcjGqFKTn
 5uVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWfgm69Jr0PKqTVlbJ/KLAch2gPvLpZu4ucAdZovdjL6jEHCZe228keOsaxIc0hZB+VYbYEfj6I60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcgFSLf6GsjsrLqMxxkNmXSB+ZOCpomRpMQlIg3SWRZTw+n35T
 qC8dsd7nB4kl7m1SoZTCPk+O+IIWrSxKai6DyI7cP/e8EVOhRAxMfvDPDasjr8FYR1lKYPmZFuw
 zmpt29YHhyk2nMqp3QInjwH387puDdPjBiWcPE3b0SfTxHO9TSxHYJewTb3gxYg4+D8kx7CI=
X-Gm-Gg: ASbGncu5rWKNie1x9VQt24rbDASrg+b0T9Dh5GkKebBItXsDCWPzU/JuiK7dJw5bFBD
 i/bXgC2st/Z0Coynn4jxAdmAW+Lh9V4ehJkR/LXxOeclvSZ0TPCNS9a7ctLBZmWChZhkKOgSuVs
 rRDSaoaNHFw4YiKoBGF0qreLKYe3Dw4PQ1heXpUvxVPVHZ4fG6Qe9HkvvAEpZIny550hjjtMlFZ
 8sxHmwwiSU81P9di2W5yNQmPZRzliD0/HoI2CWiWVVG2lX363MqmOx9VCJucu7xWfFQQ9MwTFZH
 eQAfWK9dpnnrrBIZySoL/fAIkP2T7UZvZsAY/80aL9cmRdQHtfyi3E1BIU8WD+U7Z9kLDUaCfe+
 wm2Dk2i15nKx7oFVqe8ctPtU=
X-Received: by 2002:a17:903:b48:b0:290:29ba:340f with SMTP id
 d9443c01a7336-290cb17c05fmr56313355ad.42.1760720968761; 
 Fri, 17 Oct 2025 10:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUHA1cKYoK5EhzqViS61RGZd6u0Dhx9U4B3Qz8Ha/inD8zekpvuLlC6BeCF7KMumjqYTzq3w==
X-Received: by 2002:a17:903:b48:b0:290:29ba:340f with SMTP id
 d9443c01a7336-290cb17c05fmr56312755ad.42.1760720968090; 
 Fri, 17 Oct 2025 10:09:28 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:09:27 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:33 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=3741;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=pYXZ8JyrCel0n/Z58j1178sF3I/9eN/SDHbJiB8QyuU=;
 b=cd5A5lv+d5mtTnZWr7466DoX8m11khu+CGe/Vzv5l+k/D49mAQ3av+THiJdckItV2Rx4iIEWL
 6AMy/VgCXXHAq9LXNnYVs3uZaOSZo+oOIZe7P42si7eYNgLZg0DYVTs
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f27849 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WQ4zR0kUUHxS2nCRhxYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: e_8qwqRg-jueaRQ9Fhcp6yeGzcPYcraN
X-Proofpoint-ORIG-GUID: e_8qwqRg-jueaRQ9Fhcp6yeGzcPYcraN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX1d4BhuD+LtOZ
 hRU1G3iREVCUYuvlrImBug+4e5aQVAgWwFS3KTyXK1sCVOgPKgvXJf9lFrxn1WOJOEWVwGCOexA
 ePjD4T4r4igtJG9raS6IM1OFO8O5deKIeQc9Pq/CHey5BRMMyrqnicR2ZwdWT040DQbSozgXtrt
 NzAntCpHxDCZGxKsToCysczx3pA3zltSXqLmgd01nMvrhuXI44rrQR2ohlFlr+C5aoWmnCDFKzZ
 TkuCom709Y3NuiGi6fEBhieUeAsHM96ayBI+rlPV97CbobAeMqM4Y6LA5GbAke0786ryNCkHkU9
 dQbR0gIzkmVBUGTZ1/+i3BkLHtlGTCI5/tpbWucG2jXnK4a8YtpEVv3UcbXwErC4awrdisLRy2j
 smWO/1R0Xvhx7We5yXtRY3vLvb1MJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
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

Add gpu and rgmu nodes for qcs615 chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 112 +++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index e62b062c543657b6fd8f9aba7ad595855d8134d6..8181f63e4d6838b1d198972199756271707e6e49 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -508,6 +508,11 @@ rproc_adsp_mem: rproc-adsp@95900000 {
 			reg = <0x0 0x95900000 0x0 0x1e00000>;
 			no-map;
 		};
+
+		pil_gpu_mem: pil-gpu@97715000 {
+			reg = <0x0 0x97715000 0x0 0x2000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -1687,6 +1692,113 @@ data-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-612.0", "qcom,adreno";
+			reg = <0x0 0x05000000 0x0 0x90000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>;
+			clock-names = "core";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0x0 0x401>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			qcom,gmu = <&rgmu>;
+
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
+				opp-845000000 {
+					opp-hz = /bits/ 64 <845000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+					opp-peak-kBps = <7050000>;
+				};
+
+				opp-745000000 {
+					opp-hz = /bits/ 64 <745000000>;
+					required-opps = <&rpmhpd_opp_nom_l1>;
+					opp-peak-kBps = <6075000>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5287500>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+					opp-peak-kBps = <3975000>;
+				};
+
+				opp-435000000 {
+					opp-hz = /bits/ 64 <435000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3000000>;
+				};
+
+				opp-290000000 {
+					opp-hz = /bits/ 64 <290000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1762500>;
+				};
+			};
+		};
+
+		rgmu: rgmu@506a000 {
+			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+			reg = <0x0 0x0506a000 0x0 0x34000>;
+			reg-names = "gmu";
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "smmu_vote";
+
+			power-domains = <&gpucc CX_GDSC>,
+					<&gpucc GX_GDSC>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "cx", "gx", "vdd_cx";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "oob", "gmu";
+
+			operating-points-v2 = <&rgmu_opp_table>;
+
+			rgmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@5090000 {
 			compatible = "qcom,qcs615-gpucc";
 			reg = <0 0x05090000 0 0x9000>;

-- 
2.51.0

