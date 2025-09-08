Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DCB4962A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 18:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDBB10E1A4;
	Mon,  8 Sep 2025 16:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFkVSiPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0271610E1A4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 16:51:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GBu53004401
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 16:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S/+zeaYd116Dx15iEiK9NuMeAKSenvu/yLAwNz8B5ro=; b=FFkVSiPlnxM8h3/b
 rEEV/CO6t6tA2zW3Qil+GtG5629F+DtJu/Yde8JrJxvi6rESeWwM5mjRwvaI7E7E
 Wjae2gvABnRVJCgi6Cn/Dr2C2d3gC3EFkOzfFDwvWbT0bVIF0dViFaW3zdOvaOvC
 TgqS0EAplQFnKS+JzaVZTl7A2MSO3O7NIjtn5BR+u2yP3AU5WZJCbK196H3X1vsw
 Gk/gxaNZAptvm7HCLlaUTOV44xggH/+jni8ZWTQg3cUsYgwi6+MpRujQrN5KclDx
 ZmthR6/qaU5pKTURdNwbQXhPQA2X5qoFqG9dn/mxgkWPDUQ7Pwk6LrPjU+KTS+ns
 3cT3Jg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j5f47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 16:51:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4fa4be5063so3469273a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757350284; x=1757955084;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S/+zeaYd116Dx15iEiK9NuMeAKSenvu/yLAwNz8B5ro=;
 b=bXtb7mPkoyt9//Ozruu7qpeGYSzZmkIFwheOeiIUnXb5znzcX3AmeOGEUR4kvexM9W
 wT0BZS5Zrtez09YYjNPZnd9zZ4yuz807WC/Qf3p/p9ReW+jc5vNkzeXr40fMCHCv7KaZ
 Bc5KaeqdWEGkw9wez5P9tskomYDVWhW47yP0Xl9VoyczYxSsHJz1wcxG9IIniA97V/hi
 sGltH0jEXWb9HfU4CIr3LbkJaW9NSqvZPGMqrGKl4CN5VOfsfKDTHH8cYKeAOpxpN5oc
 y9WqF23ksNW7i6YRnX7pik3Pz78rwqMJ/NCFBn3wa3D+72bD431JkejUnvs6J7fwHEUO
 LQ+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3+poKwQ6Dq4qDNRgUnRnTkv/mvQJWy7QWcrXp+yBYqbE0Y+EFMdR58//BNwUoE034n1TOamw8srQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhN6cygc9hZJXs8oEIgKSj7RrR21Cknwjil1PrMdjCI1n60PF7
 JwDqgVKzEEO+qs/QlOrkVrEeVkwpjTIBILU0UTZZAy/2XwfpcIMsLXv6Xs2f1BHKwbBqPYClvj7
 bd1y6O5Y2xvcvdP4iuytd7uyN8DUetRx6QXDPck3bNtp1U9fiuiuDwC7ALp003XR0E0WxLbo=
X-Gm-Gg: ASbGncsRexjja3bGhS/7W7iQLugRmGdlj5qtfd2tl4KXTPYY5AuqQLlg/Sz5PtsHtEm
 pWkh+VpYJhQSkg3+k76oNPhHCZ7Vgkch/baRCCqaeR1YMPrN/euDfvV18LhuZcEKJ8Jh/O/Xoeh
 bdIpx8QVJdGJpn2PPIHbpNBb71OWSR1qYmPrzEDdwDLZHee5dmSjeErg+Bn+BzA4LxDnbLB8dmw
 EQ/ImIwtN2opOeoN0Lgn/NeUQTn9CekD6+Rzw1VQUcIF80mquGlZJVeJCoN3kjRJyd74ll+Jv9S
 Lk/GGuQlNmZgoxPU+EACYW/k2jV/QlEZCzme5nFhs2ALipGWZQUfTc2JnYvtkw==
X-Received: by 2002:a17:90b:4ac9:b0:32c:923d:b832 with SMTP id
 98e67ed59e1d1-32d43f60885mr12205934a91.23.1757350284380; 
 Mon, 08 Sep 2025 09:51:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoTXxdRyvNWH6SrIRGKc106RSjdLehTELZS2revNCY8iV1PAXoSzB7fP1pZgGc2alNIfxrIw==
X-Received: by 2002:a17:90b:4ac9:b0:32c:923d:b832 with SMTP id
 98e67ed59e1d1-32d43f60885mr12205893a91.23.1757350283756; 
 Mon, 08 Sep 2025 09:51:23 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32b94a3fa06sm5216758a91.9.2025.09.08.09.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 09:51:23 -0700 (PDT)
Message-ID: <e4d3e195-8d62-48bc-902d-b42fdbe9a3bd@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 22:21:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
 <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
 <pxigrjxtizcrhn4l25ph4yh4runebintfp4swqfiewfq5hqceo@g5cy3mdgjir5>
 <77db4861-4868-4110-8c31-eb2045ddbf4b@oss.qualcomm.com>
 <4fa44ec5-2792-45e3-af87-b3e4d2ed5d86@oss.qualcomm.com>
 <dad0a37f-38b7-48b4-983d-fba265bc66f1@oss.qualcomm.com>
 <f00dffa0-11d2-4e88-9770-c34682f770ff@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f00dffa0-11d2-4e88-9770-c34682f770ff@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX66l1Omk9QKK1
 g8bw4xf0hHvSTI/Pe92PjAnHs+yhhR/AC1xsJzKzrGH/hdBWVP5REjNp8Yk3kkC9Y2Sxth+jVhF
 ejZ6T7jgR7eIOE1TE8uwXfscO2uERR23tPUhJnA5XZlKMeDMZUud5eH+2//MVMlkTv9norZ/GHq
 lrJkUdsP5xWWcfUmKSKE8ffoIHpy+7d/k14AmkoApEQc5aAa8xSFV1fJEHZV1GuWN5hQu8ehgvo
 W5Ls0nRX8trgCzSKWsjWxcWNrmIORjXqkNhZcA5oLvKI63ishBDsu33CVUCfaFWB2ZNWU6KlaO4
 QeEOJoWwgCrx/SYg7/1zXX3/KNuoQP+T7aUeqtcyW1lWlIzQdhSyXusTSKhdlctp4nZOpyRvpWF
 VUXHpmi0
X-Proofpoint-ORIG-GUID: PRI6PYxSsh783SkGKxWq23lk6_sftYrY
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bf098d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=tOSjwr6CXn1eiJSsW0AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PRI6PYxSsh783SkGKxWq23lk6_sftYrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
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

On 9/8/2025 10:03 PM, Neil Armstrong wrote:
> On 08/09/2025 18:29, Akhil P Oommen wrote:
>> On 9/8/2025 9:52 PM, Konrad Dybcio wrote:
>>> On 8/18/25 9:17 AM, Akhil P Oommen wrote:
>>>> On 8/16/2025 3:45 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
>>>>>> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
>>>>>>> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>>>>>>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>>>>>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>>>>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR
>>>>>>>>>>>> Bandwidth
>>>>>>>>>>>> along
>>>>>>>>>>>> the Frequency and Power Domain level, but by default we
>>>>>>>>>>>> leave the
>>>>>>>>>>>> OPP core scale the interconnect ddr path.
>>>>>>>>>>>>
>>>>>>>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>>>>>>>> parameters
>>>>>>>>>>>> in the GPU info struct to allow the GMU to vote for the
>>>>>>>>>>>> bandwidth.
>>>>>>>>>>>>
>>>>>>>>>>>> Reviewed-by: Dmitry Baryshkov
>>>>>>>>>>>> <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>>>>> ---
>>>>>>>>>>>> Changes in v2:
>>>>>>>>>>>> - Used proper ACV perfmode bit/freq
>>>>>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-
>>>>>>>>>>>> x1e80100-
>>>>>>>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>>>>>>>> ---
>>>>>>>>>>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>>>>>>>    1 file changed, 11 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/
>>>>>>>>>>>> drivers/
>>>>>>>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>>>> index
>>>>>>>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info
>>>>>>>>>>>> a7xx_gpus[] = {
>>>>>>>>>>>>                .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>>>>>>>                .gmu_chipid = 0x7050001,
>>>>>>>>>>>>                .gmu_cgc_mode = 0x00020202,
>>>>>>>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>>>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>>>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>>>>>>>> +                {
>>>>>>>>>>>> +                    .name = "ACV",
>>>>>>>>>>>> +                    .fixed = true,
>>>>>>>>>>>> +                    .perfmode = BIT(3),
>>>>>>>>>>>> +                    .perfmode_bw = 16500000,
>>>>>>>>>>>
>>>>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>>
>>>>>>>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
>>>>>>>
>>>>>>> You are right that BIT(2) is GPU specific, but that support was
>>>>>>> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2),
>>>>>>> so lets
>>>>>>> use that in Linux too.
>>>>>>>
>>>>>>> I know some docs show BIT(2) support, but lets not bring in untested
>>>>>>> configurations.
>>>>>>
>>>>>> Eh, then let's get the docs fixed if you don't trust them because
>>>>>> we can't
>>>>>> work like that..
>>>>>>
>>>>>> FWIW this is information from per-platform RPMh cmd-db data
>>>>>
>>>>> If it comes from cmd-db, then we should be requesting it from the
>>>>> cmd-db
>>>>> driver rather than hardcoding it here.
>>>
>>> No, what I meant is that there is a piece of configuration that reflects
>>> what goes into cmd-db as its compiled and that's where I found that
>>> information
>>>
>>>>
>>>> Not really. This should be under the control of GPU driver.
>>>> BIT(3) is correct for X1E.
>>>
>>> BIT(3) is for APPS, see the interconnect driver which also uses it.
>>> This will create conflicts and may cause unvotes when some other
>>> driver requests perf_mode through the ICC API, but the GPU is sitting
>>> idle.
> 
> Yeah gpu will vote via it's own bcm drv interface and they will be
> agregated in the rpmh.
> 
> It's basically the whole point of this gpu bandwidth voting via gmu.
> 
>>
>> No. GPU vote goes via a different DRV. So it is independent. Anyway, I
>> checked this further earlier. X1E platform doesn't implement any
>> perfmode vote. So both BIT(3) and BIT(2) are no-op and are ignored by
>> AOSS. ICC driver's vote too should be no-op on X1E.
> 
> So I can drop the ACV bcm or it's a compat for other SoCs ?

Lets leave it as it is just to keep it consistent. There is no harm.

-Akhil
 >
> Neil
> 
>>
>> -Akhil.
>>
>>>
>>> Konrad
>>
> 
L

