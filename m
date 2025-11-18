Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF35C6963C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 13:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF8210E494;
	Tue, 18 Nov 2025 12:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmPG92a6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JljNpxLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF0E10E493
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:32:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIB0i8f027738
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A3aTjUqAnV3GyFM7M/S6VNGq335rA7IntJp6oTBtDJM=; b=DmPG92a62btS/mhL
 leNG15fgB7xCZQOhb3QGnesVslm6NdEKPQz7dWXoroLIaAMibQ3ZhyxFJNQHg569
 g2i9ENSsxDeN+BbwFZu8mJuS+zQahVRfRYNSG5vNUxBa1bs91U2xy/WFIfcmhQaR
 8krIGyG/oufveCbHVD+zcRyUCOyasopXd6ZT1+lTnNUcVrxRhEO6xU6y1hmuNm2V
 okby7n7tMHq/h/Jx1+COXGj6hWitH6HPI7rpp6elGsOBs6JayRcj9ywv7BgtQdaP
 LfDev9SXjTKU7s0LOmg0rdnlIqsuRl4bIZ8h/WZVTBQp3oPmyyaXqMaEbIEpO02r
 q6y/PQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t32r6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:32:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88290612758so12565576d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763469149; x=1764073949;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A3aTjUqAnV3GyFM7M/S6VNGq335rA7IntJp6oTBtDJM=;
 b=JljNpxLBROLU8991NKDgrel5+93bmeDyV57u83CAIG+68O7OZs8dpZGQrN3SgCCkyt
 F3FW35NDOxaRnSPpc1bW/bWFDfEKWSONDDFQax+DsLkG8fIxnSP5sxL/obFwToi4uh9B
 ZjzYUM1tonWP3a4EAdVZ6gspXmIlbcvRwtD4APw+k7G0KEo8qEeFyH6P9vPHMGfHs1Y2
 u6jPtlOOaxMIMSN4I1Z7ajnim5MVOVx85iQY6QNCoESjy2KxcOmFXZ8Oni2xFnwz+5bm
 P1IJ089SUUq3ujQty6aOLbAWQtDcuaJwLlpinA0AMGYGNGUoLievwYAhb27YI2I8RxG7
 wGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763469149; x=1764073949;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A3aTjUqAnV3GyFM7M/S6VNGq335rA7IntJp6oTBtDJM=;
 b=Y83NcvmQp9yAtzLZQjEu4TnCxGvK34Nhr1m+LNIWJAM/Qs/gblI4zbuVzEh1j8Tx13
 BNazF7A2T0Voe+kUM2yEYG9j8Tg/EugaIIrvvFLKQsJ24xMaFp2ur9aNFhKVFBc0HFIi
 wYUWK1Qkwre+EfrbKsmjx4gZAXMPMQ4xbHSabhvgQvZYi/huQ3STtrs0a9QCECI7TEEj
 BilyODDgcrKILaKJlB/ocgLSTJ9BVAb6/XzAFO6dZ9Tl6X/nLhOq918gB7x8f6K/gNwS
 Cb+uIyIY0LxhCqeq2fN++qxjQGYr2gieBAiIo7/KIJs7ksqNLPVqA9Y++HZ/8e9hvCAN
 QsIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxEf080UT94IxI/Tn57zrl2JSRCnf6mdnOVGWFZLiqnbMwbRsiZf658cfuFqFx5z4QEHb7+SVDKBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP8hzSXeU2hFi6X+Qrkq+nTRr0Q36bG13/DhQOyjEQcRcGy7fr
 13bzMRm1xftirWyGndTdP1/BH93SY22YIbwj6GpkVoKgB5GtrSYW4mQq00KtYx1m4EZqpKtg9t+
 S4WVkzi/rT8LngWXZhJ1d5VhDMv85DB92877qaj0Y4DowEMXpNKOFXPYQb6yJY9N90XQZJ54=
X-Gm-Gg: ASbGncsNP+7DCni11KnVgMFY1n27OPLMV58ph2b2NI/Hp7zossDLlnfbe6aQm6OQYQ+
 Re2cRYT5LwR1Ry+v728M9gm6WMV6rTQJf5cSW/aATIJ3IvIvxJnJSQIEa6/cQSulHm6R9ssWOp6
 fHruhBtWGoG0b5p9fSqGo+r0bnlezmCixbybkO0bAub5I34pBh60lGxJG7TFhOwvOVG8WnVlmZk
 qE4pNo7eTA0ZWRfpKrPUMfYVtYqSgRVuHIF8250RPXNqYDVBp6RdV1wSZBx6Zc+/G/n/GC6ea5k
 jZ47WHlJtXPl3b3ovqCJ0MPnxTRlJeXDPAiQjeZ1ZiJbTKL/Zb135UaTdYE1NBVuHftZiLz1ub8
 yu8SWpX53vD8s6VboolMCv7AjmGwOzkvfcOl5cDY7E3XFNZfPI5dQHRQu5jGSu0YSEws=
X-Received: by 2002:ac8:598d:0:b0:4ee:2408:4e36 with SMTP id
 d75a77b69052e-4ee313fc7f6mr22769381cf.2.1763469148968; 
 Tue, 18 Nov 2025 04:32:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh/j9scY6gKmY7H/LVrmAogDQfP058lK6yPhTQca2byI2jY5prL43O5zkzKrB7PPWz4H5MFg==
X-Received: by 2002:ac8:598d:0:b0:4ee:2408:4e36 with SMTP id
 d75a77b69052e-4ee313fc7f6mr22768981cf.2.1763469148416; 
 Tue, 18 Nov 2025 04:32:28 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdac68dsm1345195766b.62.2025.11.18.04.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 04:32:27 -0800 (PST)
Message-ID: <d81b0e70-5e3f-4e33-a268-e8b903904e9b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>,
 Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMCBTYWx0ZWRfX1DrPCMFWiaey
 pCtty6NVvaB1bXARIihFCM06OGc+j5VnTIn/lV54bSTgB07bDq7kI5TSoIXFvkPdDvs6/Ib/wfb
 YhBibXeZEik8pCujOBi5xmnQ9eaIFA8O1CCZA2L8CYLJ5J9oJMR2RxYrwQTTKuEia2Tf/SY+YHK
 3javrYo33rmxX/zLfETiC/Ik0HfeLhQOqeS06zoCIsTkKrpYMeaIlfb9LpSEQcSccPExDh44YiD
 XmqgDQrQ7GLOlac4fF9DAiXGwvldLcGZCFXowtgYajUV5lu//+KxzbTQIWts3wdoAm3nFfSDjz9
 LH5nSNe05+Ybhp/qoCU5pW3oKcR6HowS1Wnum6rxchVLY7XGWenJ2+YcIGa7zDSmREHaF1AXJ+Z
 ZXsUEJjj/C/ssX/YIUG+x8k29BdngA==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c675e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=T2UTSHRGlJI1zv4ncCYA:9
 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 6PWuPctFGO3qW_ySPN4EYxupErINpmXY
X-Proofpoint-GUID: 6PWuPctFGO3qW_ySPN4EYxupErINpmXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180100
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

On 11/18/25 12:30 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.

[...]

> +&cont_splash_mem {
> +	reg = <0 0x9d400000 0 0x02400000>;
> +};

You override it to the same value on both devices, keep it in common

> +
> +&framebuffer0 {
> +	width = <1080>;
> +	height = <2160>;
> +	stride = <(1080 * 4)>;
> +	format = "a8r8g8b8";

The format is mandated by the UEFI specification and won't change too

[...]

> +&tlmm {
> +	panel_te_pin: panel-te-state {
> +		pins = "gpio12";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	panel_reset_pins: panel-active-state {
> +		pins = "gpio6";

Pin entries would be best sorted by the GPIO index:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes


> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	panel_suspend: panel-suspend-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +};

Stray \n above

[...]

> +&adsp_pas {
> +	firmware-name = "qcom/sdm845/Google/blueline/adsp.mbn";

Sorry if I asked this before, but are the binaries identical for
both devices?

[...]


> +		vreg_l14a_1p88: ldo14 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +			/*
> +			 * We can't properly bring the panel back if it gets turned off
> +			 * so keep it's regulators always on for now.
> +			 */
> +			regulator-always-on;

Is that still the case with your fixes to the panel driver?

[...]

> +
> +		vreg_l28a_3p0: ldo28 {
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-boot-on;
> +			/*
> +			 * We can't properly bring the panel back if it gets turned off
> +			 * so keep it's regulators always on for now.
> +			 */
> +			regulator-always-on;

ditto

[...]

> +	regulators-1 {
> +		compatible = "qcom,pmi8998-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		vdd-bob-supply = <&vph_pwr>;
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3600000>;

This is a very broad range, what voltage does it need to be?

[...]

[...]

> +&tlmm {
> +	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */

stray space before '0'

Konrad
