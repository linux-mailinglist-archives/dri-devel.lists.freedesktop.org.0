Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7D1B41C5B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FA410E738;
	Wed,  3 Sep 2025 10:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL9JUpZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0BC10E12F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 10:54:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AMiWL010148
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 10:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SN52Stku6irzzygye658oXiBDSvkmv+/53cdsuo8Qoc=; b=XL9JUpZ+VtDwPbNG
 R12bsrBYQgiEvFwu7M6IkEk0sHMwzQjPhmsvgvSX/rcv72V3Xad3TjVc4xMZFrrF
 ly+LStev01TlDrXqB3MUO8ipPdmAzrtcuQNmRAAbaeDH/pryFP357V7OITcmz8JU
 3vIpsQjTkFotg5EFcDTtAnwa1k5tvD5FVya2qjvL0oJXNtxA9FBg/eTxEQsTN6Eb
 yOTX7AI448QwROoEYzShuS5QdElPe1Yu7fjJWYMf37V9K8cW4eGYazkhN4NMIrrc
 yREXPskGTy6/7D9GWSAiCkdz57G50OTIGECgZ07VMftIU4bGD/kgJ+I530QXQiiO
 6W6O2w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ekg54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 10:54:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7148174e111so9443416d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 03:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896884; x=1757501684;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SN52Stku6irzzygye658oXiBDSvkmv+/53cdsuo8Qoc=;
 b=kpqCG7AczfAgtmceMzarZlYmEGZBx1933qMctFMkhAZmRXqRrjfFtJ+JqjnhFyagUi
 pkQR91YQYi1WGOrgtD9dUhCxey+9VjZO9MAtKLd7BMpNWmpuMzYbZRhVNJ7bogt03i4b
 8fa/Ps3zDw1CRSuf7OqXidb5fLYYWB0wgXlohFvGdzstUAqFKl7f8A2doGKXDIPsxllF
 +Og+LrWddpQHZ+dbl4JF91OfgnbUdlP4v1Me9qU010yIKZplHxp5KjkxKZ+fAd1++8LY
 GK7v32UmmLb1ldezSVan169zCdV7mjwu32TKtFwEif5szYfEaU44zOHnkiPuw1lGjumK
 fO0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvS4GvGnIDjtqqBW/8ygDx2/FYfvr/rGRGgxXuWpkN7xWZC6myCW4JiLJMpJB9kxlPa4vTlPpWp/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0h6NlRGKhsFAKK/fT3DSMklAeg5sP8IzEW379jkBRrX91ApuK
 dECrdyZ/ceWqonH3JRjV2K9Cnb7GAdtcgY3BvZBLjtmG/KxmLT8nO5NSwlL2/Bw+MHVM9rQzKan
 4AKNd65ZESbs8ubOsETFCEOxSQOFoEwvQbRvaXF5h3IAJxEP0cl2okTBhKQS7uxTnliLymto=
X-Gm-Gg: ASbGncsAAVxIy2X77w+37tx9oBgNS2pDO4klU5IA0ki0o1P66PRDVLGrEfMHPne/b/1
 +qBJQGnyMRmUN/opLt91WsBRKzaRJRTK0W42InQMx6+FyM5ekKqD1hGqDfBSLmMe1rxafUBiJv8
 TQLwfPCqwZ3VM+NMHa1CkJNPYkryi6Aml5Q+Iyr/8eWIOxNxsqEiOdOKINRk3pePG1T9rsN6DMD
 pFdvcQ0rAmhmmTBSIhm1/8gsBWSkUrlayIjZQh9H2+QDL3x+gRmddUVezuOaVHpVPlXcvI4ZuM5
 s+qsyadYNYwn1DCDoCgEd/5HbJh6/D1NZgdAhPXF9rvRE8MoQE9gnP95Lmglw6xHDgs9h7G4gY9
 5wW1+LduD/+izmqVgJZVNVw==
X-Received: by 2002:ad4:5743:0:b0:707:4eab:2b5e with SMTP id
 6a1803df08f44-70fa1d92d30mr148150496d6.4.1756896884412; 
 Wed, 03 Sep 2025 03:54:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEetDZkFBnEZJ/kKVop60xaty004rw6FYmAAfEqO0MuEDwRglU3hRd6MaQX/oR3QxdMGUb85g==
X-Received: by 2002:ad4:5743:0:b0:707:4eab:2b5e with SMTP id
 6a1803df08f44-70fa1d92d30mr148150266d6.4.1756896883912; 
 Wed, 03 Sep 2025 03:54:43 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61ded4749aesm7462141a12.32.2025.09.03.03.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 03:54:43 -0700 (PDT)
Message-ID: <6083a6b2-c5cc-41f0-8026-e022f2f4eb38@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
 <67aa2a1a-3adf-4c97-a7b8-865b5ca3b17e@oss.qualcomm.com>
 <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EVRESpGyYj1hkzcpjryuFbyk_SNcOCUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX3XKTU9z8xKQZ
 v9SDk+e7nuSz3vsYQHwWIrwmK7qhIGK+izArzLE/puL8zkkNPJQ33n/nuYOTmNAJ0mx6DE71UvZ
 0Nnah1xly3zv1+wtudDxg+MHz5gCeQhlMO41WhM2p0ICdrY/WBPRDoFH/ruBCmTvr+lAcpffH0k
 qGjyg8IuOS2czOBW2+amw6cDSbZ30dLvp4bca5V1mF7oTtWvtKKf116Jd23fNczpB6fk2SXXida
 U1JGwZ1dKdbDd8iBroOpakwMpAIl5Q1ElkQCAg0xWXSXAI7UBlC+h72k0TyY18Hv6lbwk2+n18u
 8bn2LsUtsKns2b2H+TEJU9s7YdoooikAWBffC0eyfCFOtOmGZOA4Y2NBEmNz+ZIqKiUl+24iOZk
 4sJEazbT
X-Proofpoint-ORIG-GUID: EVRESpGyYj1hkzcpjryuFbyk_SNcOCUE
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b81e75 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bBqXziUQAAAA:8
 a=OuZLqq7tAAAA:8 a=G6GrHqeLqaT2Jh2KzrsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On 9/3/25 12:47 PM, Barnabás Czémán wrote:
> 
> 
> On 3 September 2025 12:42:38 CEST, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 8/31/25 2:29 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> [...]
>>
>>> +		qfprom: qfprom@a4000 {
>>> +			compatible = "qcom,msm8937-qfprom", "qcom,qfprom";
>>> +			reg = <0x000a4000 0x1000>;
>>
>> here you reserve 0x1000 for the qfprom
>>
>> [...]
>>
>>> +			gpu_speed_bin: gpu-speed-bin@601b {
>>> +				reg = <0x601b 0x1>;
>>
>> and here you make way for OOB accesses
> Ack
>>
>> Make qfprom length 0x3000 with the current base and the gpu
>> speed bin should be at base+0x201b, I *think* (the docs aren't
>> super clear on that)
>>
>> [...]
>>
>>> +		mdss: display-subsystem@1a00000 {
>>> +			compatible = "qcom,mdss";
>>> +			reg = <0x01a00000 0x1000>,
>>> +			      <0x01ab0000 0x1040>;
>>
>> In v5, I pointed out the size of vbif should be 0x3000.. and the random
> Where 0x3000 is come from downstream is using 0x1040 for vbif.

Hardware documentation.

Konrad
