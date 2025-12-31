Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC3CEB955
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC2110E9A3;
	Wed, 31 Dec 2025 08:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="haay+MYn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+MVum5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD18C10E9A0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV03Y1h2553078
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QaNzRd1GwTYSBjf/Z+ZwMZwMyMVSlmGG88hkiAFuNcA=; b=haay+MYnSmV8dwpB
 PHqAPXM7Us7ml1+DivxtIfO7Ne00LE4tcZDef/9pa9aJ5oV4eKg/6xuRp9TpEtAc
 8zwFjwv3LJKArl6xz79vEl7buSBw6tUIA7DFUSgVgIvOFJAleixor0UMgzckQolL
 GQCGL+Rpo7fM1RLIetRjl9Ge6UmdYLh3bNgBNCtvqDYHQ2CfW93oivnpX+yElmlp
 vkdjkbJMXUHNatp97ExNgoDkE0oaQ4D2jflFKHPGoil3jRTOPC5dsOi21d/cwtFA
 CQInU1QiODyWiyB+16FkxPL8RJ1oeG9w3fidBZKgrLorG9cyjCvT7m/fd5UE63MF
 clD8aQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skky6c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c0c7e0a8ac1so15847783a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170787; x=1767775587;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QaNzRd1GwTYSBjf/Z+ZwMZwMyMVSlmGG88hkiAFuNcA=;
 b=g+MVum5A6wTRHRZeEFCgYi2KOb9jJjOWXmkqS9vD3R3eFiTNVZAvYjW278UbTnXbXz
 u56zJURzk1oQ37e5KpR7BR1LxIif3HTd95jtIVQm2clSi7vOIfaZYG7hrUj/c/VunbbH
 FpD93PKRBPeOnGnpQMMysgMHUQsDDzIFNDoZggSVLysqcqdfQ1LX5v8ihoKY2xFM+4UD
 7ipOgNnrNcgGADdaeRXPfBNG4C3dzaVOXV0mz1ZKkuU0rvJGV7FYyky3pFklSP3pPZ+3
 I97hzdkmWFpZ0l7+EgzbrrVIkuPHKdAlT+rdUlfBHq6YbRMPhaJheYe09QsQKoH0zYRw
 bp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170787; x=1767775587;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QaNzRd1GwTYSBjf/Z+ZwMZwMyMVSlmGG88hkiAFuNcA=;
 b=AJD4qUTIYFJKiec6kjT0kwSii5jqF1R5Ty2Uh+6mdu9jUfE+ln1bTcIGBxpjYaRWnd
 X8olTXxx77enZKhZ++7bJiWntwNoEhwypMs75HGBHguGrdVmOxHPYm1DmGP0yv/XiFNo
 EsP9zPunPPSh/ROoHzs11obGx3NZaSSJtK7MjYmmD/pXVMBbrHCHxjRiazwVyO22uwt9
 NC6iyIDl8k1FhW9FqZTj2UzsZWisup9/AqfZKqsFzNdj0W2Y6lvcE70VWADDrz86jWof
 9B81/iJry3Ay83ZXRnkQY47pYsCYzwxOUlntu4Yow7pd+iinAYJuLaccr6XRAl/AfaWY
 x2YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqKN/NX7X5hozIYqsH4yJ4c0sirNc+dFSonbKE84g2+tmphnRBvaLIKIdjv1oOXmHonY1hpASDv3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDnxUB3h10oaF2JJZIlKH4KkT3Ee8QRZp0bWZEeC7VlVarizM6
 3nEGkkz0XMo3L67YZSPTTkvVjQ+OpmMm0ee92ZRHe3+fXA8HbeFyolV3aIMK7xxC79FKX70eJsi
 uOEZkydWKL4VzHiqsiEm/irA0Vehm0v8oPjxX+VbeGAkzkpYgZ68cntIrZC5mDeJEYQhZzRM=
X-Gm-Gg: AY/fxX71V8NQT8WoU6ibkqxv7ducRFsb6DLJdrq2+9IHMXx5A66n6uKI9WjGOyAsz3P
 kdrEKgD9GIhHI+er1DY3OYWyPD5EfCFoQBy8eikg67raPuaUJQKGwOMUQBSikISd3HZS3djZwIF
 poBNejyTX5my38MM1uWovT9US44xsT7Vmbn5PJUsgm2b2N4Q5Aiooi33RfesouUoE331+l+QZnW
 glsQKyMGusS6q0qpek7oTGK0WjQRDaOWUmwBWHZXkLrtZexQFT54UlyShUzAM1evH3FmuflbCil
 lL8Qu8et77apGUQGUAd/VRXa5HwCWV1F4in7j5D9Xer6CJypZbMqYuW18olOcCyhYHokdlf+mfi
 hmXSG0b11eQ3bsfcvk+h04XnIOQ3FMjGDdg==
X-Received: by 2002:a05:6a20:72aa:b0:366:14ac:e1df with SMTP id
 adf61e73a8af0-376ab2df3afmr30047385637.69.1767170786700; 
 Wed, 31 Dec 2025 00:46:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu/EZ3oLGF1NZl2KMcyUSJhtDfGW2zPYLbNsW86lvNNZKwJtYXyj3PHGDeUbAhfuXdkhwrRA==
X-Received: by 2002:a05:6a20:72aa:b0:366:14ac:e1df with SMTP id
 adf61e73a8af0-376ab2df3afmr30047367637.69.1767170786180; 
 Wed, 31 Dec 2025 00:46:26 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:46:25 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:27 +0530
Subject: [PATCH v6 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-6-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=3729;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lPrDGRXmTexYyR40CdhB6xnI9xlISq01WTO4Z8VvcR0=;
 b=MuisKXRywC9OCQqc/3Lssr80BMzgApYmNNGxqrut6L/gjG2mHNSAWdmmrHRC7wg6/d2LxvVNs
 JrFpwmHft6sACbQ0ZH7ZZcuqyYlIXpEfINFz7uZ52+1D0lwQuA4eRe7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX33NOD60ZQOhy
 lAmpE4sSVU9yX3ZjLEuaea0p2HcCRI+BjLgjDx2v+0SB8MAk/7Mt/S5NI11XQ8POIj1i2Y1bso5
 c2sfIiJKHuuyy4+hgEQg0PtolkUpTJyWDRqqpBpzv1mBJ0/UDEqEzjLxnQ1e8eZIndRNkLQJStT
 pEDG9tojA9yc+dEv94UMdUTH6zWFUOT4D2slF5TP0eXuAgFXPn4/joO/pLZdwPT+mtxh2U1JKAP
 cd44yGQ8GKCDidstn7iKShIxWJ5xyq2wDRX+o94jBCkft+zOTSpsSolfbC+XQ3lV5BNfwFP9pLb
 VW11UCg8LPUXFoxEcKMl8W8IxGoSo0Xa/gUp2auHizFmZ/q4W5MfwTmx4q6Gz0e9Wxbg0haZvs/
 QU4d7MYXbQsPLODhHCNLR26zfDxupsgP0Y5hllKPRfJAWK1a65XeOC00jph8xW/PDfrnXeMZXlv
 DV4/Rq05QiIaPz12x9A==
X-Proofpoint-ORIG-GUID: ZY3u1D1bvF1o27v9GfmoWbrMbs-a9i_0
X-Proofpoint-GUID: ZY3u1D1bvF1o27v9GfmoWbrMbs-a9i_0
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=6954e2e3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074
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

Add gpu and rgmu nodes for Talos chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 743c840e496d..6880630e6735 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -647,6 +647,11 @@ rproc_adsp_mem: rproc-adsp@95900000 {
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
@@ -1826,6 +1831,111 @@ data-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-612.0", "qcom,adreno";
+			reg = <0x0 0x05000000 0x0 0x40000>,
+			      <0x0 0x0509e000 0x0 0x1000>,
+			      <0x0 0x05061000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
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
+			qcom,gmu = <&gmu>;
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
+			};
+		};
+
+		gmu: gmu@506a000 {
+			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+			reg = <0x0 0x0506d000 0x0 0x2c000>;
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
+					<&gpucc GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "oob",
+					  "gmu";
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
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

