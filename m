Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE3FC04C60
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 09:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80BC10E9F6;
	Fri, 24 Oct 2025 07:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQDEc/i7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1750F10E9F3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:40:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FPC0021505
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vPzIitDiH9otQXvVOFZwedMLZY4zXReFnc2YeCNbvik=; b=OQDEc/i7LR3QGwD+
 WXKCp8pGkLRwp/pN8ZnTAjtJxNw2KX2FMeLkaW8yH4nMTD7Z7i383DaLJIWI1ov5
 g8bO4ojQHm3WQc5ts7ZioegpPkUaesYEMrlmlc3ni+Zu2HsidjiH5BqjoxdoXkjT
 had6/f+oMvaOKOE94eHzGHEJEx6ss8Xg/VXWXLa931Pm4uqlp6jj+K7ywoNvFCMf
 E6jlY5bM5+gBpVEqhsklzpBfb8NN1bVKdV+PX8Abus+HLQ7798ZsEQ8o4nuPLf7y
 +a9Nl3Z3OrWnDtETKIf8mTVIcVt1+tCw5ejZUSp0bI8JP+WVm3Anh8W3nbgC1JkK
 zsMwdA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8b6dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:40:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-87c28cecb4cso5343036d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 00:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761291647; x=1761896447;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vPzIitDiH9otQXvVOFZwedMLZY4zXReFnc2YeCNbvik=;
 b=XhxGtRDKQGbX9Bce0SOwxWjh5eTgf93O3frbYMhmcU+qA4FXI7k6EkmbULdoyk/MAs
 SziWGd6sc7XeLCLSVkGRiW2uLe83YiyelIzJTF9CcTMltZzb0JE6QoKYagf6jvVH0uZh
 PK5T+7JRx2BIbi+6a00CGv77YAFhgDkmkTbLljjymnJUK1I6fhM//CNnrvoUIpcycKvT
 /3EY6Fr4eBruxwuM74pNgwgtbXa/7X/e2ff81AByFhXSkVf25mT9U8cUInpqVf6si/CS
 0He+uq5xVAiGghwKyJ0wEJsfY9IwZLzmqL4kbpmRKgm2lPlyZqDCR/yDGs9tWa8787Nc
 Xthw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuYcOUJIN7Q7aXe+tXs5UnR1pnEBkeuBJ7SNKsBNk4bnljsIFiyJsnSIE4/uw/Ot1zgzAjXcjgoy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJlWklUXn29gX0NYHnx7TVYKNjvrMWH1Fkg+AQI+H+V83AwqQj
 IBzx3gG41Q/cnCeXqWZ8gTB30JyAwjNwKg8H8gs+2jlrcio87poOX+RfoySz+EKP8oO0qiaUNZr
 zslzzZ/zONL/81rp5VPANIqOuTqkIt8ZO1ifzpu6bWQUK5AsuPVrp3m7NAYumQ+CVSMWGXE4=
X-Gm-Gg: ASbGncvcuiXg+8dvnMKxtdvcksGKO6a+hZjWSPxL0wNjsmMOi9gAsi3dTTPa7Md3CL9
 RNk8PlbO1/etda0Jo16hYv7EU8UjDk67oOT5UBKnynmZnOykTA1Ad9i/Ga/0s/QQUqGVs0rtiJ0
 GR7NQ8UXuXqXAgkEiY0tJBbxiD/QbJ5QmYSpR+mqVm7KdGqEhxYsJToKxMK5fQYruoI49qajfLc
 GwM7pRRcC8tn10yPmgCfAmT+g3oBgy7gy5pKCUjCu+IuIoOHbOhWKguS4xCfpHhTCDHhZjQu+XY
 iNDNjGlC8oNREM+d23uL3GSfQPoaCBhdL8fzIjQfoKJFUPMdMyoDt+LLMvOoJJvvGtFhbKynYyY
 3jGJFOVGOG9mBnSiewbWjhXVJhxecE+m3dqiLju/IEwJTwuhn+z7lIo9O
X-Received: by 2002:a05:622a:450:b0:4db:1bd:c21c with SMTP id
 d75a77b69052e-4ea117b0e6dmr115459841cf.12.1761291647197; 
 Fri, 24 Oct 2025 00:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGDhrS58k/AxKuFVBR7BBI8Y+VWeS0MiqdM4N/c4mARISKSYsDHdoSUEHIWyNAZ4CQaEeDpw==
X-Received: by 2002:a05:622a:450:b0:4db:1bd:c21c with SMTP id
 d75a77b69052e-4ea117b0e6dmr115459641cf.12.1761291646690; 
 Fri, 24 Oct 2025 00:40:46 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5144d565sm459794566b.58.2025.10.24.00.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 00:40:46 -0700 (PDT)
Message-ID: <853e7cb9-2a7d-445d-aacc-49e3a2f07a66@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 09:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
 <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
 <25ad160b-b618-4ade-a978-e4ae56c79e32@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <25ad160b-b618-4ade-a978-e4ae56c79e32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXwULKvbSKJBH7
 bZAPSbHFteEFqgp5kGvaSWNXlSZ43bO1a88JNfTotH1FQNM0bl7x7wXhL6LcY8SqX5bjeySlXAC
 BjawYRndwuJTWVqB0pSPnV0z5GQQ89xykQDOAlqeJUdhONgEhTsWSIRmBHRv45Ojd2ataW82c51
 ZkT5oljlWcfDPpfDDzU3sEOi8xz0gozsPS3ZEaXUXEOIzgG5aa0lKMAraA3nvsAVEgs8wGiFdhi
 dSFWkk/ylSQy3XKsX5zjG3yiNoYwMsn/rEk8p/XRYtrDpDALkaql/YAXVBUxZnXwOkKE8fI/+qr
 3DwdANCdlxVpolou8nY6ZuqMauYRf/BqQB0ARKSGyWbIBW23Ou3tiCvghwG1SesxylltBnMqMhY
 j9pgSegX9mWRXettszj0SvOKABxSUA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fb2d80 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GWL_uKs5TFOXZ07RABcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: w4mKw-pGgo73TvxSVhpWHEEANHMXCw56
X-Proofpoint-ORIG-GUID: w4mKw-pGgo73TvxSVhpWHEEANHMXCw56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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

On 10/24/25 12:17 AM, Akhil P Oommen wrote:
> On 10/22/2025 8:57 PM, Konrad Dybcio wrote:
>> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> +		rgmu: rgmu@506a000 {
>>> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
>>> +			reg = <0x0 0x0506a000 0x0 0x34000>;
>>> +			reg-names = "gmu";
>>> +
>>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>>> +				 <&gpucc GPU_CC_CXO_CLK>,
>>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
>>> +			clock-names = "gmu",
>>> +				      "cxo",
>>> +				      "axi",
>>> +				      "memnoc",
>>> +				      "smmu_vote";
>>> +
>>> +			power-domains = <&gpucc CX_GDSC>,
>>> +					<&gpucc GX_GDSC>,
>>> +					<&rpmhpd RPMHPD_CX>;
>>> +			power-domain-names = "cx", "gx", "vdd_cx";
>>
>> I think the gpucc node should reference _CX directly instead,
>> then genpd/opp should trickle the requirements up the chain
> 
> Do you mean the CX rail scaling here should be handled by gpucc clk driver?

Yes, you can simply add .use_rpm = true to qcom_cc_desc in there and
add power-domains = <&rpmhpd RPMHPD_CX> to the node

Konrad
