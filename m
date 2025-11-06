Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CAFC3D694
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 21:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B5E10E9DB;
	Thu,  6 Nov 2025 20:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACQIiwax";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tch5DCWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC1010E9D4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 20:51:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A6F0FtS3157007
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Nov 2025 20:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4alXn5Z9NyPSEeuSzUYUetC2BlPUE3MPJ93LRIGuum0=; b=ACQIiwaxE+4/mWMn
 oh63h64/SFdH2jMTWK9X6RjEblpxpSntEtqf+gwGXZz92zoQ9WWMaY/FehapgWhd
 jPm/xcDZE4pFGy3yjGG/r8udkf1us3nLl+koHsRI07JSiywaAwdiYrPXTY5IhGlc
 HdBIPnNDH7iIHO5p/UKqs0rck7J1piaC/wAVXWguQFY7V19LR33/dmTTg2aHszK2
 iIfmt5y+hzaL00G7FxrVrM5+l8YjridQChQr/ADJoI7hWJC42SeI5pWndWbFEDL6
 ErWy95R960aU2TjMVUX7sV7lFn5uCzyf9l9EyTWGKHRF7VpBVO2zDZf3oB4t+xuu
 tD0nEg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8pu0jgjw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 20:50:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-295b713530cso760905ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 12:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762462259; x=1763067059;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4alXn5Z9NyPSEeuSzUYUetC2BlPUE3MPJ93LRIGuum0=;
 b=Tch5DCWRl/ubxlFDm+vyCFxNvRePXaEWdRJHWVM+oR+iwjIng3WAdObbj+strkglC8
 At7gT6tG6eyFLmXYq0Si7VuyEM8aEDGzTddqsPfUmxr0q/tzX/zI0FdObM/bYYEyiWbu
 lFm0bNEyfy+YKGksYF1NL8MkhESRDT4l57OTjgiVTepGjCIkw80QVGOSwHMvQi9tOnLf
 XXITwgCTqOvcGR5MtgZQTDppoWRIXJcytvZqUfEES0iYLXjjEjiMHhsMhpADNzWr3+Uu
 HE7ttvv5jcpbPdCWR4cpi7CyF8e4kc1oLJ+XBicP4TrCbNEQhxuaIf3cl2nLhXcy8ffv
 mfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462259; x=1763067059;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4alXn5Z9NyPSEeuSzUYUetC2BlPUE3MPJ93LRIGuum0=;
 b=BrS6tJsWPFehM9ESanfjUCUouh4Osf78yuql7PEbbrRO7FTHTomDD2T3HUbLtudWdo
 SstRp0+tvIto73Z5W/Rhcuvie0GdXp3hxpAzD1ZoNZ0NPN75c7Bpa0yb6r26eUjh6pgc
 Z5iNkZak+qioE9EdARFFMpcbFrJmy6oA+Pdu4rDZEYHc8sCZ71tiMo6sMSnf4TN9FaNs
 5P3tgIEH5dTNI3f3o8wFACFNf/3Kip0R6cy8LlJ+Iq+KKTRt4wpfBeUdoYm1MjVExiXX
 KRKhsHQ9qeTzUtt6YFPpx69tslP15O8RFq8cv1z36Ee5uQ0o7SUb3lmKCAAkae25R1wK
 oMRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUObzkGnoC1pPfTc13kznzBOqigojs7slGApXPsFsOmgGdkiN8OBNWOoIUx1MOmu0iwy8Ek2ezhIOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwTxSq2RVIqBvZ4Y+ab+hIHAoFfcZdOW59MNjf+EWTprY0Bk3v
 dhOLPqDTAr2Iype6Z7zoaTR2eFwNPRAkOUX+wh27vcNaio+vKnLWUqE/lvZgljRHV+UJtiV57dr
 dxjfKjlWRils/0WDqrOfm7hxSk5+w08GqRfVbJLSmiN9uW7LpcXvuUs+xp/C37zyCRE/VcV4=
X-Gm-Gg: ASbGncvKvXuJ2UNz15o/bP6fxIlr4oQ0tDMsKB7UdVhkA3XxkHktL6sqbhrX5kr7Vh4
 bEc7PXr1Ey1CpUXLnGwuOiZPF5BE/qJi368z21zRfTzExlhCU8JtBiWSdg8qk/ljI5Tm7DIbMZ0
 zjBDuTOVZd4feJ5Jm2Z1saNk3nmMADuTXMc75gsftL12DbHbVVZP83STnlh/9t6CWgJmfj8FM4J
 GAN2Hz0e/oWPyURkzU3djvo7I4FjbFo815n4HshEPU7DrEjZYlmPVukJQv9Tl+qitssobTMe4P0
 Aa5E05UPpZpjpyUL0QfLjvaF0t+9w16mxE1Y/Rs8uZXUsOJ1MwVhmpQKIFwHY9t3ZGHvfmVO96V
 AWsA2iJbw9D60RSUfqr8/arM=
X-Received: by 2002:a17:903:1110:b0:269:8d1b:40c3 with SMTP id
 d9443c01a7336-297c03ab66fmr8998915ad.12.1762462258832; 
 Thu, 06 Nov 2025 12:50:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvzjLUzykk5qQIPuXJFJNx8GRGolqHLiDIkvgFyorR08sPq55A5GPVLpAmt2J6lNFfm5dTPg==
X-Received: by 2002:a17:903:1110:b0:269:8d1b:40c3 with SMTP id
 d9443c01a7336-297c03ab66fmr8998525ad.12.1762462258295; 
 Thu, 06 Nov 2025 12:50:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 12:50:57 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:10 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-5-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=3661;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Ct57iacDgaVMt56kXqWeRFWhEb4Wd5ogLzmDMijMvgs=;
 b=e/BqN8mgOUhXSRNrqolpteNBwbBYXhn8yVoEJAQU24ywpExTCCdo4JQAZUDl39nnqVHMjSSmi
 nEk4WIRahHqCtdIsmGZFSZMBLI7z2vBtWPVJCebVLHYsPrMPQg5VWaN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX9HYs4Px6xA63
 DoBtxzBTiJAWlXn6N73GJRaqlpsWv2ZuHZNIB9FbmrX+3F5T459IGHAwqKQfxDT9hXFfkFWPUmg
 r6VZuVTrzLqWUfw1DXk/DyFO3u2cvv4uZkRWIfvcLsRM9yovSI5CpCXSwbhLhVeZqW9eyDzpc9+
 V4BcySAz9aL072udjByQgQiIhvC6DXROkkecAZZYpDq8Np7XHpQDj8DxEoONa6lK3RwlHuA4IwM
 EeJ7nv4WszUdsTqF0sYfnvIPa1eyp44BiMnPhuzxF38XkiLylE5+u5doNUW30X7KM/37O7fAw9k
 ueFozsS3NWoQ2TRk9KHl0jgy8Os8msOJ5JqqhD+MKvX6xwRsI4KU4n/m+DKl2E78lzY9t55B40I
 7uaCeVcyJwTEXK+6GzvSE1lyZNdjAQ==
X-Authority-Analysis: v=2.4 cv=bIYb4f+Z c=1 sm=1 tr=0 ts=690d0a33 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WQ4zR0kUUHxS2nCRhxYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Emsvjaz2fVsihB5RKFEpws4EJ7txLxJh
X-Proofpoint-GUID: Emsvjaz2fVsihB5RKFEpws4EJ7txLxJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060169
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
 arch/arm64/boot/dts/qcom/talos.dtsi | 113 ++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index efb753ba1747..500587ea9ae4 100644
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
@@ -1826,6 +1831,114 @@ data-pins {
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
+			power-domains = <&gpucc GX_GDSC>;
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
+					<&gpucc GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "oob",
+					  "gmu";
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

