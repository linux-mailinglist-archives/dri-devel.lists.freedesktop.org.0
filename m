Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFD8C7BCD5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 22:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCB110E910;
	Fri, 21 Nov 2025 21:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAsVU2bX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbPR5LXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4076A10E910
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:21 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALBkHDF3007810
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KjLJCdugkSrnuhoZABzCHzl3nmZIMgNYbluEhMiOUDc=; b=pAsVU2bXCoM7+c7s
 R9JjeMrtJ42d0uB3BPpqo4eGCP9EZ7rrKxGwWB3j7SDbLYd5r/CP7Dki0963rQ5Y
 js6duFALSa7BhaoyGpFmTYPkiC3WtNJdq3udh5eLJctrd05QU90eB/irIShVYbjL
 KtbRhomKG5azjfPABZ/8CTONoEQ4+f5YCwxpvvSNibk6xxELJcAfiB7MYmhy15US
 vyGEWOa9Zp5OTFSZXDcgW8uMD8WdCEf0GMh+AbBY8vFpNMXLDse7viiU6lp7ZdfB
 5k2J/cRipDnTPIH0QzXcEOIClMEx4Fwg8MPIBCo8aoO3O1R23pnf7peSXkz7Beul
 JEdRKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkf306c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b90740249dso4544979b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763761999; x=1764366799;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KjLJCdugkSrnuhoZABzCHzl3nmZIMgNYbluEhMiOUDc=;
 b=ZbPR5LXiV0Z8pHDrcGIX0GcOWBQVRX2AHpG18SZRAfGght8Fpdu0lArbgrH5aRzqtB
 TxfOAZGIYyPaxaSmVepEbqut6JaF17siEYaMHyjr6ymFym3b+sU4zNaHE59bvsX6I63E
 u7Yg7ppe5efSNDU68pNI71EXZx/wOl4OnkO+KrPsED3W4dU/GldhKKMTXwJ36jfIhBl1
 DGtqgd0Mc8XXxTx3W0kd7qfEeQzu5VfL83VK/taayOArUKzemzoQAksdtDhctBH4ZFGU
 DoV5D9l1e9Y8bS560UOVAhQtWdPgA5zpc9kUe/lwq+Zmx/NPogCkL5p/2Sk+fUZDaDeu
 +2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763761999; x=1764366799;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KjLJCdugkSrnuhoZABzCHzl3nmZIMgNYbluEhMiOUDc=;
 b=QtNDDE7WIhM2Vo3ET026diW9qc+EorfaipfnpE42Ir+QGdcGs0cS6QTkK//WRsdGYb
 FrZPHOdOZ8jXrm8ZY5UYdEl7wIgjnBPoiVbfdYgxqtwgtKldwFw2W9zWJ5vP96/sZ3cz
 8bMC/Q0ZURe0hpsUzmG53ysnwuZak1wPXUKCLrw744vb0xsPfeX1k/GfuyySp0J11r/N
 axzqsc3DnLX9Up81T6QiDTU2c+KvTRpNPtqpMUEVgvpgJK77NK4JUX/LAf9aKKUo9nkL
 6PE+AvKFKZofcqxnRypuIkSpNWlY9nfS9Ul6nYc6gK4PPFiBAveid2GdzLYDrJLzJfN7
 u6Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrc4pypvMeiXP3UdX5u3+VXJACDPvs37zEHWF53Ebwouml8NBSR2sE+1KTqeP7yJLh/aAsSaOX18E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy56NtLtMIAEhDH/P5tQsWtgVKN08cd6iPYP3t72cpbAsRDr9AC
 y5zEUMnf7GTuBR7yp39mJxklz98EPnZsDKPfmr/ZzXyUiRvjP+lzBRcedkYFtqe7bpcWv+/EKPS
 qZQsPn/T2SFXr5NYlYkko9fcXxb1nn9TsBDTadN9RNp88MzKVvHOswfPpWaLQ1wfvtdzEIsU=
X-Gm-Gg: ASbGncskDx42/JpDU+o9xO80rgIFu4aKDsFnbKpkqjdyiT7xL+Ny7AlxfXqssq932TC
 q/Cr0LvLjZb8C5nJtat5+nAJrUFhn3yHg7RixbdfT/QyhIWvcDBiKUAB+bUm4j5V/ON53haUV2q
 7z7QR3TYCnRjKmmPyehsshp5qXYQgaPKjKGBa403XJgf6JfmOWKcZEaYokUHvQLbPVwEwtYtgy+
 IVVnJf2rFVpWPGXVxUNRFE2tkLhCIYoVKU7Ub6k9HD+uLHYakqE6yfQUkMER7GcIOBejW/Z3w3E
 7TBJRqkoGwkqCme2qqplkYJoeAwMabpJ/EgAvqm3TZn2XaLDr1nYc4HxkKgAcTt/0UU4yQ7JLLH
 l06W9dfoNcMccabP13etXJE2NWOtux3TTjg==
X-Received: by 2002:a05:6a20:430f:b0:35b:ae01:a4cd with SMTP id
 adf61e73a8af0-3614eb18184mr5149959637.2.1763761999332; 
 Fri, 21 Nov 2025 13:53:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSgxBtF2ograWO1NrHiOadBUmpcmLAamAg76KthlngYGISb7kJWhbFYgOnSeBWgxh+5JwBTA==
X-Received: by 2002:a05:6a20:430f:b0:35b:ae01:a4cd with SMTP id
 adf61e73a8af0-3614eb18184mr5149943637.2.1763761998827; 
 Fri, 21 Nov 2025 13:53:18 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 13:53:18 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 03:22:19 +0530
Subject: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
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
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=3755;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=s6trvpgsx15gZ8Cw3XsRmVsxCHybqjIyr/OcMGeEUE4=;
 b=TJyzzBt/5IxjTd0qvYkEeFl6VnMIlv+N7NU2fWChxGxucijjZiRnZgH4XdjfxKzrl7cGp4gaf
 BI8cGUJ/gTSDsTUvpegTcgek32u1uXpE3j0ZHUuS86YWN+fMA11WeAR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: IuRPWNQa9s_jZhmJLUo22G5GwWYzuZtE
X-Authority-Analysis: v=2.4 cv=ApPjHe9P c=1 sm=1 tr=0 ts=6920df50 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WQ4zR0kUUHxS2nCRhxYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IuRPWNQa9s_jZhmJLUo22G5GwWYzuZtE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfX2DbIQEBJFHCB
 S/fHDFufCp8EnLlBqv1328ZNX5ISZyVJkqJmA/tlnDNAgVY7c+Ty0i541VyYa5WKmt2oOwZNA4C
 O+/mBPkv7DTtklelGVYqCL96wx+5mE0Dtc1JEAaoUE/EauTHgdZyLsXOTp7jsSjPG8n5i26WI3M
 4wKgJBv5Viib85Ll3eZvf3nL7cntHmLtl9tAJDyOgl6WuZmVg1PbtIp6Hvs9gtgukxoklBrPx1o
 T4xItgH5dWOHialSTTUskkvr5JYYvEMjQW/DnUlxVJWHcjDsk4/5qP+S7e9jp3gQy+a90HO/zm3
 8I6BLMrNHL3E8BQ0PF1rY/zz+6SL6/Fqw4vza73R7aodd3/S4Xei0E+E13VvBMOruUUYturwf/U
 4IbZ/R+yV9qU8EiawUFywD3iR6rcww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210167
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
 arch/arm64/boot/dts/qcom/talos.dtsi | 116 ++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 743c840e496d..12d6b296b562 100644
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
@@ -1826,6 +1831,117 @@ data-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-612.0", "qcom,adreno";
+			reg = <0x0 0x05000000 0x0 0x90000>,
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
+
+				opp-290000000 {
+					opp-hz = /bits/ 64 <290000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1762500>;
+				};
+			};
+		};
+
+		gmu: gmu@506a000 {
+			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+			reg = <0x0 0x0506a000 0x0 0x34000>;
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

