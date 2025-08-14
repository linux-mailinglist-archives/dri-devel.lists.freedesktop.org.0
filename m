Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F690B26DF4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 19:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F16510E21A;
	Thu, 14 Aug 2025 17:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMPkh4oK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4288310E21A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 17:52:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHFiTw013413
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 17:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kf1KNla6dRvfydP3rOxmCpoNvWjKiR17gEq81Ru/7Mk=; b=AMPkh4oKUw7tc07r
 34OjQkKiwy94XH8TppZ8C0lknz/11zIT/IR0EFDCgRTD3PvdsFAR3xGHJQdyiPRE
 iAgUFqASufFQRS4qPJ/XvxEkt355x48vQjd/p1sCOgMnGRqzY/Zp+OVhTXupdNVX
 EGdm4jUfq5pjyO701DXBcLGIxqXdcELfLRGa12K+Lgm+Jc6okDLmvFNFPMeNLegZ
 t7ZRsE5ALL+zSNoStzyy6tmgCgK8Bd8iL/vRKAvsbSo0/15nZ3mHreNK1KKGklmd
 2MW9Vildv2eHkJ3TEPR16aoZo/RJOGVnJUCb32IVFrRNObQgtIaexOOJnVY+MmwZ
 I1URnQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxevkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 17:52:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109bd9b3dso3472691cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 10:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755193938; x=1755798738;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kf1KNla6dRvfydP3rOxmCpoNvWjKiR17gEq81Ru/7Mk=;
 b=D/j/6rm2oqTxezFKY5Eag7eHb34LZxN6UTuDJVeNsrxggJKv9QgCr0k8LEG3TPBEu0
 wGALGZazrRpPbQiVC2G0s8nNrLshyqxfk9F9IOEu58D/nzcZvHV001y1a/XVzsG2aiIi
 eoJQU+m+JiefiFFfK3dB+pq5aoeQvtqOZGXZmnySFFz57TbwZ8PT5BYOqjGrJEmAp6JO
 6bL8S+au8iyZ61QqBn5d/XZBtnBV5RXg7Qyq4Vetfw1RPxYzUrqn7TMin3KrbEr+r3uF
 8fGBWjPeqM2lyxWZeJ7zL9LXd4IlG9/w0w41a2uQVP+pVTRpeVFwr59h+y1b0PMnc087
 dSxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAr/tQJA7l3UwQgIhqZDzsF99NxMvu+jnEXcM7um0kRQ8JLKipMcjNahQX0oYV26G2jOMbFpSmOO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc1KG0SNiCINQVmobSSulPNRUEerwjK+NOFDiAgEspjXWw2P9l
 haRLoB2gjoqbZsREcwrWZANh0D1pjxQvZWJjg4/QWiuunpUieK9tiOgNKoQfJgFRG+ZJFyZCn7a
 FM8s88QyiHlQm+grg8ghgFckb/nmmBCDujnRAceHhKvzY6r9ijt1bcsRXS+JHkRgR3NHk0xU=
X-Gm-Gg: ASbGnctgaGd6E5l3ij3Npg2MBNC9sTDvcX5wD3rY3KFGW+JwX9fxJt18xW29lSgpDtG
 j7Ntp/zdQTy0OQAxeyHnINh8FRoQRvfhEcL+iyOvXjpyHGdtpFUlgEilhsmL6jW1iHesrCJ7Qui
 5aDkbh7xCCJcR8zV3ZsO9mJ3OSLr2kvmdNai6ofuGBLtyTyJBueY2Hoia6Z9FJ9aiSj51j4RAe6
 zX/pOEvYqcQlSDo/9GUYUpu3mdAxzaO0biMBQjT8Cll9aIqvZC0HhqARUPTN1oLXFR5Fbfh7SQE
 yi5gVeeolUFmHP5RF1/11wSQAZhLqQfc+jf8c+VCoY7Xe/dnaTzTDL+BgF7iydmo2sKy/UY21iB
 meDUW4Oslb1LQ2nEV8A==
X-Received: by 2002:ac8:7d12:0:b0:4ab:7633:c58e with SMTP id
 d75a77b69052e-4b10a98ac48mr29607121cf.2.1755193937959; 
 Thu, 14 Aug 2025 10:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnts5b3T3oPwnRC47gGDR5vru1FmCBJm2j7CtF+T0NTcUjDzn2U3ZeqG7szkJIlGQBWfi7zA==
X-Received: by 2002:ac8:7d12:0:b0:4ab:7633:c58e with SMTP id
 d75a77b69052e-4b10a98ac48mr29606861cf.2.1755193937163; 
 Thu, 14 Aug 2025 10:52:17 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766d1sm2630993066b.18.2025.08.14.10.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 10:52:16 -0700 (PDT)
Message-ID: <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 19:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX8KK6OPjDZnTO
 e0r7FETgjFvorzk6UZDYS9JVuOZlx2J6i8MyUTPMWhAh1O0cSJzwJUYKiLlAMh+his/q2ojpUJi
 dRfLxx+M4H3NK+s5dGGliiQjUO5+hRUnCCTYXFoHI+r67HvTCtS0kS5ehjLGUjBeMMhkhPrqPgb
 zx5Q4cAt25Xx4rtFy34gJBi9J1De4GjFkTKtlqF7tREqk0Xf5tqaJvglWtSOe383FRg/apJAIj8
 XZv/LO7b8xF8CWhOOHd2s+QnePoIvMceCtyTapQZgLrwNWiCPgKXl3CHNXVS8ntu3QDzf0DyLe3
 h2VXVvAB2S0CQ9SiWhwM/0dHnUzfPCl4Iwp+oMCAH1ZyDd6b/9rPG6Ov0vdz+8zyL6+ukUk+X/C
 D+wj4jMf
X-Proofpoint-GUID: rPKOtGBcqOepCRzDJbC_gz2n-4zFhS2m
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689e2253 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=06jlRiaS0U7peylTb-kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rPKOtGBcqOepCRzDJbC_gz2n-4zFhS2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
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

On 8/14/25 6:38 PM, Akhil P Oommen wrote:
> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>> Hi,
>>
>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>>> along
>>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>>> OPP core scale the interconnect ddr path.
>>>>>>
>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>> parameters
>>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - Used proper ACV perfmode bit/freq
>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>> ---
>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>   1 file changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> index
>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>               .gmu_chipid = 0x7050001,
>>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>> +                {
>>>>>> +                    .name = "ACV",
>>>>>> +                    .fixed = true,
>>>>>> +                    .perfmode = BIT(3),
>>>>>> +                    .perfmode_bw = 16500000,
>>>>>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
> 
> You are right that BIT(2) is GPU specific, but that support was
> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
> use that in Linux too.
> 
> I know some docs show BIT(2) support, but lets not bring in untested
> configurations.

Eh, then let's get the docs fixed if you don't trust them because we can't
work like that..

FWIW this is information from per-platform RPMh cmd-db data

Konrad
