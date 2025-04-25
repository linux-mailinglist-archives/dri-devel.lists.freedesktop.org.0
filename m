Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E65A9D3BC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 23:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FCA10E9D5;
	Fri, 25 Apr 2025 21:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMbg4l+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745CC10E9D5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 21:02:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqOS031955
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 21:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FoxC89tHfNSH1oVha4VRoLqPnSjX0y1D+aZDbZJvJ1g=; b=LMbg4l+UfM1XN+1b
 fnn3cciq8zI/v6YHyGoQJYanBK8fzNxWOsQFQogpx6hA5gac1kJ5EI9mwh949+YG
 xkbNzzGbm4IFoCIrYeIbvVN9FUAem5kY88dAr51K6evolZpvB4wSYmNZ7xiwcjmd
 xQ86Ie2lEOWL3uy6ptC+bNCEgAQIE0E5+rzpfbPsRisyNWh+gdXNrNUv4Yx1pu1c
 cFGAo1cVmap9F0n/mttdFH9AQsx4V8g2GkWClEsEPZIBebrXqUXO4Fli+te2zZGF
 DnP7qW6Mhh2P807dKDoxoRFUk3df3QXtByclxuNBjBFT4WV2g5bqG2NPbmuyxTHo
 Jmr73w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya8wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 21:02:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4775bdbcdc3so6491281cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 14:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745614935; x=1746219735;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FoxC89tHfNSH1oVha4VRoLqPnSjX0y1D+aZDbZJvJ1g=;
 b=QVIAgItuvrquQLesvT+p7Peer70mVROl1Dz0zDqeCuTe4i4C0FaeIMFI7y6mk4pruw
 Jm6tZp0MNPFDZT+fQrpoy2uxkYsE7yfrgJk2XridBaZNgRZgd/OQARj42nsHj4hXYOH5
 zoVFbphW2uWhj1yh4Kh9ReP58NT/hJW6dYLVp40oIXOEATH+BVIR6tK1+MwuCve3Ozap
 cjaFpCSD35kAWPScgJFG1Klw8fqpUtjxaPBLAbQkWTP+ZynuKrl2N8UrfbIGu1dqQPKc
 Y6zAsZVwTLYeDY11GqXX1VzCQW75fbxBnksUM5EvE+ZMVz6BtrtoTggdVFZk1x2e9BP5
 zQ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwVcsaZT/EaS2S6O25S1xY5WCBYf3MLJNhsWoN4vwtSsnHvEUw6T+hv6HUGDjdaVM3c9WlJndfjNc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2gyD3cjGUSTsDRciSM4pKct6qm3Q0Qntr5v5UEDap+eEFZmgc
 mNAiywLxIReZHNgf9Km6ZwtyoungwXv8Z8Mzz0kbiAkB0fq4u840kR4FL6TSCT8VPbLXZCE+mPG
 9PE1XXyvQNmN50mHWPJolBG4BagiqJ7UC9BKHlxPaS16j+UkNsnAy+O78vpieq6tYVF0=
X-Gm-Gg: ASbGnctohz4gHBTuplw2Pqz2d2s4+Axtd/dMx59Ot3yw1SOzrU21mxjH9V7ugGFYozv
 /XkbMuuvx1NC+GXMr+VHLxFYChww5zWbiKtUvgU6lG0OGKvey8x/02F+f0KfgK9cAKW7LjIXA7+
 kRnRkVU5L6PGIazhnic7Wn2uQySsY5wHGtisP36Yt6Z9i8I/0cWV2oF+zH2kDd35+4xhXl5GM6l
 Qpaf80a11AK4B6Dq56vWzfhBURJTQP8QMmCwQBML2aAHOSrYJ3fD9fP27Hp1cFeBonSbGqUYDTj
 AqXDBYO3p3Azl8uctxYrdmC3WU8HEKiwyK/Q1iCLlx1L7g/lC65aXLGQVVQiit0V94A=
X-Received: by 2002:a05:622a:1455:b0:472:1ee7:d2d with SMTP id
 d75a77b69052e-4801c2c16e9mr20346621cf.1.1745614935199; 
 Fri, 25 Apr 2025 14:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg0tvFhoQ0KNEBhHGLhEi7O5sgae/+O/jdTQKiFWyNNG4fCuoMl6ZMxe0c4BHyGdyFSXXbhQ==
X-Received: by 2002:a05:622a:1455:b0:472:1ee7:d2d with SMTP id
 d75a77b69052e-4801c2c16e9mr20346351cf.1.1745614934774; 
 Fri, 25 Apr 2025 14:02:14 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed49c2fsm187099666b.124.2025.04.25.14.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 14:02:14 -0700 (PDT)
Message-ID: <656da4e9-b609-43f4-9afd-006698a2c7d6@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 23:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
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
 Dmitry Baryshkov <lumag@kernel.org>, Adam Skladowski
 <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
 <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
 <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
 <5ccb39f9393b44761127717096a38a46@mainlining.org>
 <68e2c0ee-d5e2-40fd-9ca0-262ed3270628@oss.qualcomm.com>
 <31559417a92d1e1ff17d0f3add9a1ba0@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <31559417a92d1e1ff17d0f3add9a1ba0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1MSBTYWx0ZWRfX4dY7gebqwvv6
 tHa28vSbickugs9pT5ZAC7wWHH34L48ZmtKn6waPM3R6ghBZr08NWo0w6fain0V/C+q8woqPRDv
 rSEYtQJl2Ws2gH7e1DqG8e3WWmH99VS1oEOtgQhv2nb1RQ894+uvg0nw0KMuHhibWDpMYT3MNqt
 eB3++ENZTEdlQ6joW3XdzNmLT2sJgEJJkElagp2bFxWLUjZOzAuz9D+mBzfhJjzAqVSBFuKWFs+
 npWHLxwnr0M3gmbRzttn72SYZcPFhORxZWNUIUFSVkZ7lKvKoOef5LOT9RSmo+kzHVfEV9UfG7J
 BttNJ/mcN8pt7rBgjtzdLZmkXLYYbkVHLo6FG+dxC49+QTkJE/3JOFS4ujTump4/1vDWgHIqExp
 o4P+PxIXcCeLZ/l5mwC26skKnp15321WOIPDTNBxZcRqvpMtXbgAYXtQTh5VLbW5R120eXFe
X-Proofpoint-GUID: EpT7LgxSnZYeuiPcxM-RuHJim5hfDLaD
X-Proofpoint-ORIG-GUID: EpT7LgxSnZYeuiPcxM-RuHJim5hfDLaD
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bf858 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=qC_FGOx9AAAA:8
 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8
 a=BjP4FqewG5DG9Cpw7CUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250151
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

On 4/25/25 10:22 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-25 21:26, Konrad Dybcio wrote:
>> On 4/25/25 5:13 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2025-04-25 11:57, Konrad Dybcio wrote:
>>>> On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
>>>>> On 2025-04-23 16:03, Konrad Dybcio wrote:
>>>>>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>>>>>> From: Dang Huynh <danct12@riseup.net>
>>>>>>>
>>>>>>> Add initial support for MSM8937 SoC.
>>>>>>>
>>>>>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>>>>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>>> +            gpu_opp_table: opp-table {
>>>>>>> +                compatible = "operating-points-v2";
>>>>>>> +
>>>>>>> +                opp-19200000 {
>>>>>>> +                    opp-hz = /bits/ 64 <19200000>;
>>>>>>> +                    opp-supported-hw = <0xff>;
>>>>>>
>>>>>> The comment from the previous revision still stands
>>>>> If i remove opp-supported-hw i will got -22 EINVAL messages and the opp will be not fine.
>>>>
>>>> Right, I have a series pending to improve this situation a bit..
>>>>
>>>> In the meantime, you should be able to define the nvmem cell and
>>>> fill in meaningful values for this platform
>>> As I wrote in the previous revision there is no nvmem for GPU on msm8937 only on msm8940.
>>
>> This seems not to be the case
>>
>> https://github.com/penglezos/android_kernel_xiaomi_msm8953/blob/pie/arch/arm/boot/dts/qcom/msm8937.dtsi#L2046-L2191
>>
> These are on msm-4.9 was moved to msm8940.dtsi
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8937-gpu.dtsi#L162
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8940.dtsi#L600
> 475 MHz and 500 MHz is for msm8940 at least based on 4.9

I'll try to get a more conclusive answer internally

Konrad
