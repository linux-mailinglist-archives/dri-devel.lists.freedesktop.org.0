Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81886B30299
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 21:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8482310E37F;
	Thu, 21 Aug 2025 19:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6zr2X5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BAA10E177
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 19:06:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9Jsg012715
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 19:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BFn6lCJDWEd+aFBAvDVtshvN0IqD8I5xMt2OZhhgJXM=; b=C6zr2X5NAInkxGHY
 UZYMQ8v1GsHxX78Ld8a9BVMlwvzLjfD6+ewu3pSLuQe/8vBU13gV7t6KbuDxahtf
 CyXoxCkWAohIUiw7XGM0EUm6F3WxND6c6M4WK4gXyJedpJEPt4ZcQC7/v1rdCKrL
 Kqb/BOVEsiMNZz+wvg/1lrhq1A9iocrgW5r8p13nyf7NK1dl3IApNMfCvF8koEhQ
 rWiOORKdPEX1ub5UmnLditls3batjdnUyMKc+/xHHZYIguWfxRE9uMdCnkLqrz3p
 XFCNpPN5Y9rrt9Og5etj6QW8+nZrzYsA747Ed4kOBM//PGGUMdUMhnnBmSmNlQ8+
 QOGXRw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dpg0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 19:06:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-246088fc25cso11745715ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 12:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755803216; x=1756408016;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BFn6lCJDWEd+aFBAvDVtshvN0IqD8I5xMt2OZhhgJXM=;
 b=Vj3OdEM8CYVDMLB3T9dbBNHU3CXDcN1eaa6P7IcK3Gcec3wzxAOYAsXMcoCuC84l41
 NyeVP2WJ4rjmDP5dY1h3u04o6BKBuColybEvyOUioiEHKqQ1ZN2/W1ZQMvSKtwT6pg8O
 AwTFyNRx4R8eAn2WC2YkUUYGa5+c22yInbrtOWk4BpFcclS+0FjJ5/khkc80ALolaJj9
 GkVLmWOgS+tcM3mBPqL7rCNv1WtnbMurdNZRWyl6zM5UgL6xOq5bB0b0sLY1ncw2LAGL
 FsebKWC8wWSZxeimNnyWardgRu16x37GwiBEwBcCoym5OthexYO8YDhWcv+2YFcQ4eKJ
 B/ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9EYMUyy6ygFW42dk5Tp4Ys8K6i8as9HTRAr2neoFJYZ3Wvmvr4VpbJrCI1aKYXgyATykQQ6ldH6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMmrBoHa/ZNBM7GIIrwykYFlSmJUN7Q3ay6Ka07lR4twk1uOzz
 oa/kKAAHHWFqUKIAKDz7eIwDiUyuhEW81ymWmy7B94+mlaLgsjQz44Wina+ELiUe89IrvVTqjW3
 gJKBJG6tsPSlP2f6fOK+4wb2v8gVZbH4glJObPoLX9AikajDIWnX/Wv89Sy03H4r3qO+CcUg=
X-Gm-Gg: ASbGncvWZIUDpypXtMp4d8Ltrvyrnj9EtQtfZXrpJUnE1gq/COoboHOFg3a+09iyuqE
 3fAVWSe9mdV0mSJ1kbfZRGG3rcw3Yx6qk74M5Tv717qeFnlIjyMk6NulDVbKJOXX6eL6z4SDI6g
 jPDC3FAPzmQ+slCvnU4iW2QOS/brP7BE3f/Fx6gRecmLTdH7oKW5cLbWPsaqVhD1u1FgPkgRkLv
 549DpOReGj1UzSOYojD6IYDZkNieTDtsYDo6cpTut1x3lWFsCHT4KbslQAuHld6ath+f7go2hqM
 UYlsCE3wh7v8fZNOPatQfm5hZAXW+ekUI2Xyh6Ne5zMlrsO1+t5hGBKRoVU56og=
X-Received: by 2002:a17:902:db10:b0:243:e3:a4e5 with SMTP id
 d9443c01a7336-2462ef94f72mr4596845ad.48.1755803215600; 
 Thu, 21 Aug 2025 12:06:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEALjqD+64g6+aUDcHQDd+nzuWWoTg3zL905SlfzVM/ab/dThtX7+FD2an4jIMQPPN/oJHtgg==
X-Received: by 2002:a17:902:db10:b0:243:e3:a4e5 with SMTP id
 d9443c01a7336-2462ef94f72mr4596425ad.48.1755803215088; 
 Thu, 21 Aug 2025 12:06:55 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.235.20])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed50129dsm62047125ad.129.2025.08.21.12.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 12:06:54 -0700 (PDT)
Message-ID: <95fed1b1-8359-4221-8245-dc12335dc4b6@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:36:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+sizJq8ZGF+K
 M7nvps2i4AcWmwD99Nm+f8Agni+2ImleMBkzRWRr+D7VbtVdlsqS1X/oY5FWp+ibmyOsSqtC5g/
 9/xCpq5WmKCl2pktqhbJYJirBaGA3Iok19QdxbiwN/oCWvcNl6odVfk4gY9ZDiEhLl/OmqlFxhS
 5RdXL06o2K79xjNR5+dU6snVMh8FgFGBIB5lTvjWmClwFtWPgTz0OpFeDN6C0ANqNK0RoJuz81Y
 VKNIdXGp49k2kD4I/ZXYmWX7UZzRASnxsbC2y2R69EVceIg9QXUxFyuUM9dhDQinardrBuKPJUH
 D7W4PgJNdN3t7iBrVtGQrWCopit4lpp4D87mrdDeAzt2d+Puo3quYdV6eJ8mzjraDGUCti1xCJs
 gfTCoSZVCCv8bfOCNxDhv02hvcZazg==
X-Proofpoint-ORIG-GUID: 9L7y8vg1V4kJ3R_hWS1-UFndmlXxo0p8
X-Proofpoint-GUID: 9L7y8vg1V4kJ3R_hWS1-UFndmlXxo0p8
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a76e51 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=YJRzWv9GHcPC3W2cS631hg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=m0bU5jEcJMV6AtSS2XYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On 8/22/2025 12:25 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. As of now all
> SKUs have the same GPU fmax, so there is no requirement of
> speed bin support.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Dmitry,

FYI, I retained your R-b tag.

-Akhil

> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>  			#mbox-cells = <2>;
>  		};
>  
> +		qfprom: efuse@784000 {
> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
> +			reg = <0x0 0x00784000 0x0 0x2410>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			gpu_speed_bin: gpu_speed_bin@240c {
> +				reg = <0x240c 0x1>;
> +				bits = <0 8>;
> +			};
> +		};
> +
>  		gpi_dma2: dma-controller@800000  {
>  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
>  			reg = <0x0 0x00800000 0x0 0x60000>;
> @@ -4093,6 +4105,110 @@ tcsr: syscon@1fc0000 {
>  			reg = <0x0 0x1fc0000 0x0 0x30000>;
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-663.0", "qcom,adreno";
> +			reg = <0x0 0x03d00000 0x0 0x40000>,
> +			      <0x0 0x03d9e000 0x0 0x1000>,
> +			      <0x0 0x03d61000 0x0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory",
> +				    "cx_mem",
> +				    "cx_dbgc";
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&adreno_smmu 0 0xc00>,
> +				 <&adreno_smmu 1 0xc00>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +			qcom,gmu = <&gmu>;
> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "gfx-mem";
> +			#cooling-cells = <2>;
> +
> +			status = "disabled";
> +
> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&pil_gpu_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-405000000 {
> +					opp-hz = /bits/ 64 <405000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <5285156>;
> +					opp-supported-hw = <0x3>;
> +				};
> +
> +				opp-530000000 {
> +					opp-hz = /bits/ 64 <530000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <12484375>;
> +					opp-supported-hw = <0x2>;
> +				};
> +
> +				opp-676000000 {
> +					opp-hz = /bits/ 64 <676000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <8171875>;
> +					opp-supported-hw = <0x1>;
> +				};
> +
> +				opp-778000000 {
> +					opp-hz = /bits/ 64 <778000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-peak-kBps = <10687500>;
> +					opp-supported-hw = <0x1>;
> +				};
> +
> +				opp-800000000 {
> +					opp-hz = /bits/ 64 <800000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					opp-peak-kBps = <12484375>;
> +					opp-supported-hw = <0x1>;
> +				};
> +			};
> +		};
> +
> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> +			      <0x0 0x03de0000 0x0 0x10000>,
> +			      <0x0 0x0b290000 0x0 0x10000>;
> +			reg-names = "gmu", "rscc", "gmu_pdc";
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> +			clock-names = "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc",
> +				      "ahb",
> +				      "hub",
> +				      "smmu_vote";
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> +					<&gpucc GPU_CC_GX_GDSC>;
> +			power-domain-names = "cx",
> +					     "gx";
> +			iommus = <&adreno_smmu 5 0xc00>;
> +			operating-points-v2 = <&gmu_opp_table>;
> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +			};
> +		};
> +
>  		gpucc: clock-controller@3d90000 {
>  			compatible = "qcom,sa8775p-gpucc";
>  			reg = <0x0 0x03d90000 0x0 0xa000>;
> 

