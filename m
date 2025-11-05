Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED78C36C60
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 17:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F408A10E2E1;
	Wed,  5 Nov 2025 16:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U75+wgNF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPS8sB4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749A010E2E5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 16:46:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5Fo7HB051537
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 16:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gNiaCnl/ZAJk2DgY15on5+Ci9unMo7cZ3k6PfcpQW8I=; b=U75+wgNFFDcfexLn
 i5pQaYJMM6iud5xMsaPr3VzLbADQfLKFHCx+pnTUvBjSwdAFz5NjJhXrY8stcQ71
 hlKeCxPSN0X/cI0OQc0PglA1zb9iBXkjD7iV67mQaiggM5kiipvqHudhh7nxGfU/
 E9P4jBbZS9MZbcbB6WCIa9+mSCcA60G0hgzGS0LhqI4H5OoZLCd8JNnFK2T/TG+q
 m26HQaUWRSIqZaQ+tfDcUEmqDwOrn+/ClGHKqxKbV7M//zygEKoVmjbc+P4bjHA/
 YBM3g3dnQz9+r79b6dAOfiQm8dTxW7VYgc4hyN/WiYQWsCtSD7XPv6LVV2Bcupp3
 F1Yaqg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a81u0hpmn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 16:46:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32ee62ed6beso100467a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 08:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762361181; x=1762965981;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gNiaCnl/ZAJk2DgY15on5+Ci9unMo7cZ3k6PfcpQW8I=;
 b=gPS8sB4BWJhjEcsj+qUoEj7EHBLs1sTmzBQUihmFLCB6Rxx6iU3xYvSLgmZCkzLVOt
 K1QIH48UbASaKprEDaE4jdeeQ3KY25hTFWBVAmiK1HW525b9HRW+80Kqr5Tlojj+UEcL
 e2dR9YBpbMXxKsiM5AixBQf6GgQ8wztG1oHvCVpGv4f7DZeGyIDb7kYqWgZl8k1QSImH
 HhGOKO9RhUQRfZTi+8OKan5afvycm7/cssbVSwINCYdiEuFOqbmD7iI6Fscua+P6CS8k
 BXY4qcdJyv+AqJVhk8jPHAnAMUjXzg0jafEmoB5YJKJN7vExLEZ9iZ8kyoGG/kRq1QSL
 hZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762361181; x=1762965981;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNiaCnl/ZAJk2DgY15on5+Ci9unMo7cZ3k6PfcpQW8I=;
 b=ttgGPS1xuxwri9ZcLrrIlaifaO07QwYEiW25ZCUuVmos1vAke7zCx4KH12Q6YS9vaV
 4cHfeprxaz65ik6+AkY+dymT/J8CJZ93rMdxokbsL72JYGD0Z8gQ8YqlKPIDBZbP7wMV
 6+9DsNDSGZ8nMy6gGnMO3YtixYdok0GkqEfsJDC2S6jqm2GKCG+uWMhwz4OcnUm3oZEi
 +idHjnOu6LQREkoAhylZNOrHSmkmDmGJuVKm4IV/5XqEzaMOSaqQXwkN0WIJHmOS+ckO
 PU5S6g+X4I3oBttqzjZMoVMWRcWlroKNbBCcCSvlG7BcHMiYBdDx/iUggpYfeWFALxkd
 8waA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4nyxfxqnxNSvjEbtxuUG4bUkHYSrBn0JxlceHHlcJJr5AFCTHaYSOJ6mm+s8BGy8clpRHXIJDkhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7Mvk2S3VYQABbokO5+GI3MtCwtkmC+gA7pP7G8XmqZ9HW5g+x
 q5uEI/MkA1hX6q61fzalN1v9vS51ZZdqqzYBAkcENG4EMQbnshy2GboNyxnVr2LLQOvfkqog+n8
 XWB2OmhH66LGaVVbYe4jE0HcmftU6cWsK3ABpm35ljgzNHgVSl3i/GZn5W7bp5lATafD5ePM=
X-Gm-Gg: ASbGncuTH24T7j+Mdfz1IRD93LNaLviPq1njbpZFywfy8G0YoD+sMsC4q548WnzJytT
 qVTFRJ+gu4C1UVeIwdhD1bjKnVkeDpparUfMtCuP1KuN93/s/w7qpjjc/A+30zSNmuP3/9hW02M
 BM37kBscheYCVDg+LsU62egTaULl+Gb1EKsXLdULWZfLcxI66tXZrXsAtWHcHgFuWmciWu1rd9U
 SmzuB6nlOcHS1qCk4ZpAFucBwrh5FAVlnRMs/KnvYksSXcvESDE6PQGyKchv5Cad1nN53zXipPA
 hz0D42w7BfDwVPgxPlz2EbOwFIeanWe5xVcpyaQYizbzJ9lab1h7htmbbxUV19y8GQA+M1qa7JM
 UXdSn8LS6dPa9HRygN7oWAp0=
X-Received: by 2002:a17:90b:17d0:b0:341:1ac:84e0 with SMTP id
 98e67ed59e1d1-341a6c43bc6mr5313301a91.11.1762361181259; 
 Wed, 05 Nov 2025 08:46:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpGdqaiaTEAa2LzG3a/pfsz08lzVJ8gnN8pk8dvCpVHcI2W34tyKgoSHwurHyUA8G0KlAHrQ==
X-Received: by 2002:a17:90b:17d0:b0:341:1ac:84e0 with SMTP id
 98e67ed59e1d1-341a6c43bc6mr5313285a91.11.1762361180732; 
 Wed, 05 Nov 2025 08:46:20 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:46:20 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:46 +0530
Subject: [PATCH v7 2/5] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v7-2-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=4606;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=luvOKrArTfNaPhVmBH/wS1foS7oE6cguSnjd/GdyRZE=;
 b=9/5ReRt6JvTHQu9A1ntMHBE9rjdzezS2IH6zgxk2zJlKqCx4SEhErJFAeq6nA9FH2cfjYSE2b
 QGTo+GPUp0yC7yBiY1J/3ndcFAaOiowRlxY0/Md2jLlmd9/YV/AEyVZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: z7SOj_WlV5auSQecjkxOOyFcRhStLBI5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfXwYjO7ZgXd8jS
 x9iuhum41wtdjW9iOqJipLoSNJExsohb1tirDatFKcTDDNaeK0ezngzgbRNVQRO7skvypqr45MY
 IADoFlRsVsFaJaB7zVIbbUTQJLQ5a3OG8wlLqA6DbQtnWzKzwiqsb1Y1z8KM1tbELxecUmZCXnZ
 rP4Nl6ZfznFlAT9+3wkP7CApy2TrPTAH/UTwibHw5kRiMx1lvEWzmDSeYs+qdVDYZJl25pItG/U
 OiNWC+8DaZOe1ZP+0jdNVBDsp42vC+zqEVHw4UWqaNlkiG9Eh5rJL07y6+5ld6EojYtNemDvmqf
 dkRXUcszoBj8+yxnuUqIT98LL7169YR1/JqCITAxwMwwLYzGv0xtsFETK/fmguS1KW+wjV9P+hi
 iCvM9BQSsxc/vKhZva2wgENAskHncg==
X-Authority-Analysis: v=2.4 cv=KaXfcAYD c=1 sm=1 tr=0 ts=690b7f5e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=D_IGQ_qLm8RrHFHUsBgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: z7SOj_WlV5auSQecjkxOOyFcRhStLBI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050129
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

Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
qfprom node and wire it up with GPU node.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24e69a9d900f06bbb22baa2781cc3f..883f9e0ab45c98b9e128f3fa141d625431d89831 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1098,6 +1098,18 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
+			reg = <0x0 0x00784000 0x0 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu_speed_bin@240c {
+				reg = <0x240c 0x1>;
+				bits = <0 8>;
+			};
+		};
+
 		gpi_dma2: dma-controller@800000  {
 			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00800000 0x0 0x60000>;
@@ -4135,6 +4147,113 @@ tcsr: syscon@1fc0000 {
 			reg = <0x0 0x1fc0000 0x0 0x30000>;
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
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
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
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-530000000 {
+					opp-hz = /bits/ 64 <530000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x2>;
+				};
+
+				opp-676000000 {
+					opp-hz = /bits/ 64 <676000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-778000000 {
+					opp-hz = /bits/ 64 <778000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <10687500>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x1>;
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
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sa8775p-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.51.0

