Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611E99B8460
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 21:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA60B10E926;
	Thu, 31 Oct 2024 20:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2+KpKfi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DBB10E926
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:30:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VBrohx002303
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vn3QTWUjCAic1i2jtFrxyg3FZC1WBX+pK1/bjh3GN7Q=; b=A2+KpKfilPVw8X7j
 gf7IT53+mwotSyyijMjSdmuCOU8klTIoEdkZGLR6K5QrIzkM6cb0HSuaK5qtydYA
 vbXd6z5HkGeTu3M9XsJUqB/pNZaKxz0MPgj9N3TfQ+EMCscMbr/XWiUy8TMdzZ3m
 V8V7L1k8W/ls1mLcUY19iniL18U7N6YIVqYR+8JGcQebi2ew8VIXoLwG9WAbeeYo
 QOU6+SyzxlU4YeZzX69siE9sldbcX94n4GAUPj07Ko6kXWFHmgfEQEQzen8lvwVa
 TvugyhOEdBoyD6DfJQ/4iGpuSqJeGnRnM0L1jvsLzesemwgmnsMihFZrku5l6OKO
 ThkGug==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmn5ctu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:30:38 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-4a487bd8d04so59398137.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 13:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730406637; x=1731011437;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vn3QTWUjCAic1i2jtFrxyg3FZC1WBX+pK1/bjh3GN7Q=;
 b=DjpgxuZmFdA22YKBO8LRAz/tzMIXf+6VXv0vHMoNpwOeDtuf+K8lkz49kK4Leh9Cel
 eh6QScrXImFiX0qiDHatPyspl2jiHz1zC47maTAczZD9PXjFAognyv5qxIp6B596UrH7
 BdEEUnIM+N9Fg7YixD9sydmT7SPNhOtHbjyM0RyEPfOKFztygJm1pUnMfykKdGMdMCqN
 9gCL7gyk+kmddqRgdcw5W9tJTPVHgjpU0Xg3OHJT5MC7GO1grOHmDKbsM0sRss9EPoTR
 d3LkXe6H9r6SqjaLcC13A13K9uIQ1QEruzrDEfx5yUdk2j9O3QDzyh65Fu7pEAi8X0eu
 qQ+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqaY4SPVI0FtrU4VBfuD4yI6Q8ipGKt+H7E4UvHjWw06w2Yc9AVIkpaHsefuw3/npxN3Qp48RGsyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrJ6E4qtSUwqGBTVChKfNBGf8BldTrAIRx3D4xkWvRl3s7h9v6
 SEc44+eOv7dL2FoLRdAHRf9GPVaAwKzEA2jQ6SyBFhhqDZEWd7UebnQdocbqXYxPpYuk+V42mUA
 X7nyH1uhntzcLnHzsfB8p/iAjia+8wDQyEHmOFk4+LxmNQYbftnVK1YqxJglET/UAxAA=
X-Received: by 2002:a05:6122:308:b0:50d:a94f:6b5d with SMTP id
 71dfb90a1353d-510150e3c77mr5462591e0c.2.1730406637214; 
 Thu, 31 Oct 2024 13:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdl28X3YUr9VOac9QD1ZHycOAxkaqooK6TaCu9jFulPQMeNW7RR5+G5iY1kNTYpQQ8cejOdQ==
X-Received: by 2002:a05:6122:308:b0:50d:a94f:6b5d with SMTP id
 71dfb90a1353d-510150e3c77mr5462563e0c.2.1730406636788; 
 Thu, 31 Oct 2024 13:30:36 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e56641232sm101237166b.152.2024.10.31.13.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 13:30:35 -0700 (PDT)
Message-ID: <14a7bfdb-7106-4317-a54a-e0101c41cba1@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-1-bdf1d9ce6021@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241030-a663-gpu-support-v3-1-bdf1d9ce6021@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NrsjMGy8XxivgkPwieqlakAp8RmDtKX_
X-Proofpoint-GUID: NrsjMGy8XxivgkPwieqlakAp8RmDtKX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310155
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

On 30.10.2024 8:02 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. As of now all
> SKUs have the same GPU fmax, so there is no requirement of
> speed bin support.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 94 +++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index e8dbc8d820a6..c6cb18193787 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3072,6 +3072,100 @@ tcsr_mutex: hwlock@1f40000 {
>  			#hwlock-cells = <1>;
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-663.0", "qcom,adreno";

Is the patchlevel zero for this SKU?


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

You might want to hook this up to a thermal-zone right away

Konrad
