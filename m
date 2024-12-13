Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725169F0A2A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B9510EFC2;
	Fri, 13 Dec 2024 10:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUR+GAL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB11A10EFC1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:57:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAMDlj030892
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JusCHnvBtzBIGRb/d57GWf9yYHTzp5QMdm9npfIyIzQ=; b=iUR+GAL+yhWTF29b
 ctUXoIJ8p3GpDIML3QTXmY6aHLkYhld3ZJVcsgyj0KjyYFFQbEH23RTOHcl9Sqyl
 m6DzHGEAGIkFOv/cSS1YMby/oDaaFvK+6Etk6zsA/sdih7z8ScIGU3i11mr/RRVh
 NX1zM5HzILUgQ0mCJIqFNszgoI8wRuXDNiyX7aezlapCHh2f3vpHjJoHFLAMgZlv
 CQ0bJy5fhzC3Ff7WritZmhMXWfRYtaxPH4walQ9Z+Am8BJpJj6AW0V9M+61o5IW2
 Zx7HVaoxKN6LrYc+MrmjJLhTBOsppHGssQw6q4qmEJomGR4+rRH8eUM7wfkIttKy
 Q6hWFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgekk2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:57:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4675a6e05d7so3230111cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 02:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734087441; x=1734692241;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JusCHnvBtzBIGRb/d57GWf9yYHTzp5QMdm9npfIyIzQ=;
 b=rfxDa5xN8BV8wUrOsCsDCDD7mGXGeaB5ebujxxHQe1z3YmFIIvvhTzN/HPUzooXqeU
 FaeAWS1e8RPfNKgtW61TApLHqklwuA0dQqC950B5a1YudAI4eOz8CJahv9jOdPOAHhpH
 7x7nyHBGJSake1QHucu2GrJnT9my+ccH2YMXDYBlG3cyU+qfC/h/lY508HsnaTT6xHAa
 r+TjBiz1Z+nLpnXao7xMYIP0re/hjZJzsSJNMy3KIIRtcm/I//Y4GJLs2thOEqLs8eSX
 XLi0K51d6D7jqUsVSm/11cszqWb+qfhuZwr2T/3/w2GPjrtRTbIoe3k2n6+jOSjve0/B
 ZWTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNevvW8eecbnl211hnlqJtMGomPu7YFPR2KFDR+WfCSPSaxnmC1L64rkCMtCCUXFrv2J9yYrV78mE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSwndqZWEgXM6uNtF14nfjh/fauMPbt1lG1VrVFohRy2NZ5f1r
 MxCa1//0cVJbuwDf7coR37LG3Wo+6/cFwo0Hq4up6zXVj8RMar8qJf+q5ozA5ZrmuHOJW9xXBlH
 lwaqHJ76G6lEeaX7eonI5taBMJ7PDz7BhqytIl1qYHukEb5F5AYOzx1BWG94BqPHzLqQ=
X-Gm-Gg: ASbGncu33IMVfexFZKsB9f0nJZNvEF3wO3GfdN9Gc+EL79giQfRAAtO5IbKcELJbg0B
 ojyg23QyElqslYTmY1GmaOGSPmV752okZ8lSsqBCzai6fKGcsJn4r2MrKK81cEUPJZ0m+L2bE19
 KPOpCoCbYhsZ3/GdzF6kZ++0OMaDrARh8nMDHrcTpNkutks47hc6PBe1p8NvLYT3/ohKtp0C1ng
 QUaYSRMibcrD9ssfr5r6rJqViKm0UfC+LQnbafl18UFVbOU5PL15/rB/m+BksYQvtOyfoiVyGUX
 ynwo+j9eAVsqSaa1U3sfedcWwevWlEaRvNVR
X-Received: by 2002:ac8:5790:0:b0:467:5931:f6a8 with SMTP id
 d75a77b69052e-467a586e7c4mr11384661cf.16.1734087441024; 
 Fri, 13 Dec 2024 02:57:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSa8UhHBfw+RnGpfBYEd5suCh19lyMpMorCOQaWkpQtF7q4Vveq1D0+NrFe8GAuyzu8dsZ8w==
X-Received: by 2002:ac8:5790:0:b0:467:5931:f6a8 with SMTP id
 d75a77b69052e-467a586e7c4mr11384521cf.16.1734087440615; 
 Fri, 13 Dec 2024 02:57:20 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa686af6709sm701440666b.88.2024.12.13.02.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 02:57:20 -0800 (PST)
Message-ID: <a44027ee-40d3-4552-8f61-bcab77476f68@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 11:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com,
 20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com,
 20240924143958.25-2-quic_rlaggysh@quicinc.com,
 20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com,
 20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com,
 20241122074922.28153-1-quic_qqzhou@quicinc.com,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-6606c64f03b5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-3-6606c64f03b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XqM7a6jQ4hYhTzIu4JMPcO4LHfC2yco2
X-Proofpoint-ORIG-GUID: XqM7a6jQ4hYhTzIu4JMPcO4LHfC2yco2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130075
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

On 13.12.2024 11:35 AM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 8df26efde3fd..dee5d3be4aa3 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -387,6 +387,11 @@ smem_region: smem@86000000 {
>  			no-map;
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		pil_gpu_mem: pil-gpu@97715000 {
> +			reg = <0x0 0x97715000 0x0 0x2000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -508,6 +513,89 @@ qup_uart0_rx: qup-uart0-rx-state {
>  			};
>  		};
>  
> +		gpu: gpu@5000000 {
> +			compatible = "qcom,adreno-612.0", "qcom,adreno";
> +			reg = <0x0 0x05000000 0x0 0x90000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +
> +			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>;
> +			clock-names = "core",
> +				      "mem_iface",
> +				      "alt_mem_iface",
> +				      "gmu",
> +				      "xo";
> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "gfx-mem";
> +
> +			iommus = <&adreno_smmu 0x0 0x401>;

No LPAC context?


> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			qcom,gmu = <&rgmu>;
> +
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
> +				opp-435000000 {
> +					opp-hz = /bits/ 64 <435000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +					opp-peak-kBps = <3000000>;
> +				};

I'm also seeing 290 MHz @ LOW_SVS

Konrad
