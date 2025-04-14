Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AECA88D71
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 22:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C8E10E657;
	Mon, 14 Apr 2025 20:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W16IqfEg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085EB10E272
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 20:55:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKeOFa015169
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 20:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WxqIMMM+bD6pWCvSoOoUNZlHXMPZPcPy2ox/bPjumf4=; b=W16IqfEgr9ANz/Su
 PT/7IXowclo9n8BNUIy5eNsu+iLRfEttOXQ0DOXxZk6EsByU9K4U/xc0AugxXZjZ
 JhRWfIJXdvb8TGk2jtKw6xIkKujSxO1FMREqOei72PGhFq9pKIO2CcjF0lsk3DuD
 CTw5qyK251zw7ETYI5SN4wWnjIs5q/5lozfs97LQHD7X5QglnaYg4j8tnA4GpZxQ
 VACbYNT4b+zY018HIgXlnZvPvseQ2KI/FAhKl1v9tKQUfMXwIS3ZdV2pqFNhAwRd
 qxLPwdCXrj2VB36MJjf2BVUSaKzIovig4Owq2NyhSuBxwNs1ozneWSqfl5wYnq7t
 W9pWfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjdsp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 20:55:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54734292aso134186885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744664129; x=1745268929;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WxqIMMM+bD6pWCvSoOoUNZlHXMPZPcPy2ox/bPjumf4=;
 b=tJ7Wmkc3AfETNwGRCZQHhQrRxaJ0Cjkpk3/d7kyfKpL/6eU9yxinDr3xZ8NSLc2V6b
 UKLC1WlA3ezKaH+TR3q9Q2Y74Bgi96hl4czXwhMdwGg4EIgNlwkwbSarsiXjW8WXVoen
 uCX1yo0Ry2UnVMsyLF1/P4LHyl6YTVaHT191GfWStzBW18DypSrGROl85gIAowAOL3QX
 p826XoWKoR8bPiPR/+UyYGJq5FKD8phMNP3Dj/GcjlweC/r6TU+UG16eS2yBrICDzXXi
 5jmvNuUnNLpX40MkKLEQPMWet4YLMk5vkSC7kEyTFQudSZkW7eMsObpYJqbQSg4PspTg
 +e5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyOn8fjaJYyBkD8T8K0cP8khDGycZ6dCGIi2SxYjv0ziB2y7GmJ9nCsFbhEYBZqzuORtGXMpc/F3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBWVgMMDDjd9Ze30f5WgY3A9x5I8B1bsZJFSPcabL7kk4brTA5
 HmczAnX+9njJboSJ4EaMlRF8jfudLr1wOQ6rxxvg8pj8sTmSpG/maOvmlKe4eIQRyZBupZqOATp
 YDsHFxZIsNJekdKYZba/xjUSnN188oGzdkTxs5PG3TytQL5L3Nzg5UUpVMxSVyuExzFo=
X-Gm-Gg: ASbGncuTqEp73L2r+V2m06zB3qUl8gOaSfm5l87ZIq5arzh9m9JpaS6QmleUOcvo/AF
 NnqhZ6DrZgh0zJuH7QjB5RxyqqJUMmMEjZC3uHkF9kihIaiIzKxA7egF8HPRj0U9c4G7ADjVBfn
 Gs6V0nZlmKLeOy9PP4uKdEmEHh3oNr/c3Tut5BdQUt5k6WQYx5A7AwM4E2woh+TzMLwwvYePYiM
 0raOtjzqXcl4fdz1T/B6Mr9/0uEL1bKa+t7W7/ztBcq/H0OdBC4NsNxeUPgpSAtnBQP6cnS9ZyF
 AKw4pW/eeKjV3loF/WdaIi59f0rx0zqWZQYEbQVumYUhPpP7WLTlIWq+l0szTbLF9A==
X-Received: by 2002:a05:620a:4627:b0:7c0:bb63:536c with SMTP id
 af79cd13be357-7c7af10641cmr597550585a.4.1744664128861; 
 Mon, 14 Apr 2025 13:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoWIvNWBnu8DBGFjtGdagGBK2fyiZED6ibSgijR4nYQRmR9ck5XDihEjcIo4pATTzpB4UWZQ==
X-Received: by 2002:a05:620a:4627:b0:7c0:bb63:536c with SMTP id
 af79cd13be357-7c7af10641cmr597548885a.4.1744664128405; 
 Mon, 14 Apr 2025 13:55:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36f5056easm5692216a12.63.2025.04.14.13.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 13:55:27 -0700 (PDT)
Message-ID: <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 22:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xq_hO9WD6uIEmJ2nIS5gChKmYo-9h-C6
X-Proofpoint-ORIG-GUID: xq_hO9WD6uIEmJ2nIS5gChKmYo-9h-C6
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fd7641 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8
 a=zdbjSHh-4Hdwht_aKTEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=BjKv_IHbNJvPKzgot4uq:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140152
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

On 3/15/25 3:57 PM, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +			power-domains = <&cpu_pd0>;
> +			power-domain-names = "psci";

So CPU4-7 get "nicer" idle, but 0-3 don't?

[...]

> +		cpu-map {
> +			/* The MSM8937 has 2 cluster A53 setup. */

This comment seems superfluous

[...]

> +	timer {

'p' < 't', please sort top-level nodes alphabetically

[...]

> +				wcss-wlan2-pins {
> +					pins = "gpio76";
> +					function = "wcss_wlan2";
> +					drive-strength = <6>;

please unify this order (drive-strength before bias)

> +					bias-pull-up;
> +
> +				};

Extra newline

[...]

> +		gpu: gpu@1c00000 {
> +			compatible = "qcom,adreno-505.0", "qcom,adreno";
> +			reg = <0x1c00000 0x40000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "kgsl_3d0_irq";
> +			#cooling-cells = <2>;
> +			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
> +				<&gcc GCC_OXILI_AHB_CLK>,
> +				<&gcc GCC_BIMC_GFX_CLK>,
> +				<&gcc GCC_BIMC_GPU_CLK>,
> +				<&gcc GCC_OXILI_TIMER_CLK>,
> +				<&gcc GCC_OXILI_AON_CLK>;

Please align the <s

> +			clock-names = "core",
> +				      "iface",
> +				      "mem_iface",
> +				      "alt_mem_iface",
> +				      "rbbmtimer",
> +				      "alwayson";
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&gcc OXILI_GX_GDSC>;
> +
> +			iommus = <&adreno_smmu 0>;
> +
> +			status = "disabled";
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-19200000 {
> +					opp-hz = /bits/ 64 <19200000>;
> +					opp-supported-hw = <0xFF>;

0xff is overly broad, please document the existing known speed bins

[...]

> +		adreno_smmu: iommu@1c40000 {
> +			compatible = "qcom,msm8996-smmu-v2",
> +				     "qcom,adreno-smmu",
> +				     "qcom,smmu-v2";
> +			reg = <0x1c40000 0x10000>;

Does it work as-is, without iommu changes?

[...]

> +	thermal_zones: thermal-zones {
> +		aoss-thermal {
> +			polling-delay-passive = <250>;

There are no passive trip points> +
> +			thermal-sensors = <&tsens 0>;
> +
> +			trips {
> +				aoss_alert0: trip-point0 {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};

Please convert these to 'critical' instead

[...]

> +		cpuss1-thermal {
> +			polling-delay-passive = <250>;

You can drop polling-delay-passive under CPU tzones, as threshold
crossing is interrupt-driven

> +
> +			thermal-sensors = <&tsens 4>;
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpuss1_alert0>;
> +					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +
> +			trips {
> +				cpuss1_alert0: trip-point0 {
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpuss1_alert1: trip-point1 {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};

On newer platforms we rely on LMH to shut down the device if it
were to reach the junction temperature, but let's leave them here
as probably no one remembers for sure how reliable that is on these
older platforms and you're most likely not willing to test that

Konrad
