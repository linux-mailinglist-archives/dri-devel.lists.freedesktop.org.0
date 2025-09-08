Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821ECB4950F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 18:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1A210E561;
	Mon,  8 Sep 2025 16:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljPZ4wD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5951D10E561
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 16:22:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588999ib000749
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 16:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4+rdrikp7bBevt5yb6lYYZbNkqBe9kBUGdXeaOgnPNc=; b=ljPZ4wD9UTrVeaVC
 WMB9FhYLf1+jhrLCFecGC8ohUOenUwWLiNNTyZOJFkJgzsUCyCQHnygaWCE3OXAJ
 y6+kqB3S9EU9hbj4yDTuIcuPZYdfblyPeMSd6gSCIjU57ZwR37+oXeFiIN6vDSZr
 WnA7YdfHncMFewSH+f0OU6yRow5AQoowIdm8wZBRaB6WagkFMUP2kxS2zpv2aM0Q
 krNbm5Jud8TduKECJZkufnR6U6sEdTToV83O5YgFnOzrMKE/TADUqcs6xPIwR5NQ
 bnWty3Syj4y6x1QGs/Cf6jh9ET/wvAOwsewh+7TtDYGyVYOh3n1tzaDnEYH3wMvo
 7eSE8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j5c43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 16:22:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b6023952f6so8314881cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757348530; x=1757953330;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4+rdrikp7bBevt5yb6lYYZbNkqBe9kBUGdXeaOgnPNc=;
 b=xG07uydSTqZY48vpKaTJLZmP4qX8NHRJbfC3OiXLYmN9wF3ipmyD2Ei9PhObtpJBAG
 ELRQf3fAMYyhZ9F5aHF8FiBcb67yx6wGkYkxnve5snZYgJf8RglGhQ/E6qp0yStQXCtV
 fn1t1rGZ+u1MEaFL/pI4PS2+EdgEnLbyTo1W/oDG1MzEOl1OOmacLR4I3UirN1ggRKp9
 o3YFh7lZL5xUKYAFpNaXMtHuH0zzBv9ya7nF/USLxaycGFUYktbXAI+mFgmNdxt9QjaD
 1SJjTxpAlivVldjRcArZ/39GzqXY4Y9uuq5buACmkxol2o3VOS++ZhZD2D/CJyNfXgte
 tSAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaRjFbySeLaOgEmi1CQ66PM/s0jlKOx2+w4kXkyTXCckns9IqkEDPVQrFszken/Sbps5U1DZQ/+Ns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNyvbNajVGhRdgMlDsjRvmLc73+VXUkFUj5ch2OY+BfcyVDvWL
 bKlODPN86F1r53d0OHGR1A7ytD09BEpiuARS87gF1uH+eqE5UGG9nW4TzSfJ8dgAKoU+n7SzQyc
 +eA/NM8BGKmD8vKOQUd4j0OWP3YBFflNOx49MP+S7dZpDYRIEYO5NzPR9/CpXc1mPBM7Q/P0=
X-Gm-Gg: ASbGnctN5TUvQJ0tf79o8OcW+gQF3jACX5d/lfetGKaBN6UBVhO7DP3Fr8bP9bK4cYX
 r8VO/a2XjiLbYhCTevLxFV2NU7aQnmqfoARtD/ZbuaZ2rw5XXRyPxJt3A7gxVYWcCTW8hl3lezh
 qPmmDedgrBkPfvV7cm0R+/FCMHORdvX7+4e+y5sFsSSeQMybFDPYhiRgq57UpojtvnrWAZj758A
 vlw2FgxRVAJ3kcLzr2u/0nacUCpwIhmXWy2bEpsuYlgyQ/pVZVQQbNjeYfMxwSNbzmxOMZhkNXW
 uTgWCD4E3vMnqaOsV7UfMtmNReuMVkHU1UHhJYhrC/0UPuq561apvP/e8gZ8u3AupdNphhIkKt/
 PHNVeG4j3rT+5UsSciL5Jjg==
X-Received: by 2002:ac8:574d:0:b0:4b5:e9b6:c96 with SMTP id
 d75a77b69052e-4b5f8485b15mr55798641cf.7.1757348529520; 
 Mon, 08 Sep 2025 09:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYOBJx4IJkeJeAPl8HAgvgXSbH1A+bDveiyp+jDidpl9Ny8oP0uh/qo/0V2HKO1R7C2uho2A==
X-Received: by 2002:ac8:574d:0:b0:4b5:e9b6:c96 with SMTP id
 d75a77b69052e-4b5f8485b15mr55798281cf.7.1757348528898; 
 Mon, 08 Sep 2025 09:22:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6248711bfe8sm5192325a12.20.2025.09.08.09.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 09:22:08 -0700 (PDT)
Message-ID: <4fa44ec5-2792-45e3-af87-b3e4d2ed5d86@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 18:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <77db4861-4868-4110-8c31-eb2045ddbf4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXyCuxjnrwT6gm
 Mdwlp2/K7JYg0ko1jzY8GEFCRPbzzUJRtmPJfG4qfUZLVExXL5gzS6uQIuwlDzEuVQGeDXZ+yz+
 IB1jvCJv0aKyhOaQJbsa5sCNHizCYVFg5sPyOatHlwOd2yMh4WQodxxcX1Z2+LJgGgjRQMMCss6
 /goMAu9l2GZNCTD6/W8fjatMhjyrZ0+ziHIohxZYfRkEdpJacwp0nU1EnSQHrxbcG03cu9cAkHz
 nzlzN9g7R/DjNhdA9Ff0w1EhRslk+mCb2dHIQTpERZA+oTFd9l9jZCb9w9xcG6D1E46r4iVOTUv
 dPivP6+nIsycuzkc0c9WKEjKrt16cJN7O2Gbh3Kd1tWE7tnwR1rrCSQH1d01PFLAMTf4vZR9ThH
 P+ynluSq
X-Proofpoint-ORIG-GUID: vfkKT-pmQ2dFvJOUnC8vmSyx0vnC7LW3
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bf02b2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=-rBNSpjuQUH0YdP2-XMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vfkKT-pmQ2dFvJOUnC8vmSyx0vnC7LW3
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

On 8/18/25 9:17 AM, Akhil P Oommen wrote:
> On 8/16/2025 3:45 AM, Dmitry Baryshkov wrote:
>> On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
>>> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
>>>> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>>>>> Hi,
>>>>>
>>>>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>>>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>>>>>> along
>>>>>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>>>>>> OPP core scale the interconnect ddr path.
>>>>>>>>>
>>>>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>>>>> parameters
>>>>>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>>>>>
>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>> ---
>>>>>>>>> Changes in v2:
>>>>>>>>> - Used proper ACV perfmode bit/freq
>>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>>>>   1 file changed, 11 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>> index
>>>>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>>>>               .gmu_chipid = 0x7050001,
>>>>>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>>>>> +                {
>>>>>>>>> +                    .name = "ACV",
>>>>>>>>> +                    .fixed = true,
>>>>>>>>> +                    .perfmode = BIT(3),
>>>>>>>>> +                    .perfmode_bw = 16500000,
>>>>>>>>
>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>
>>>>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
>>>>
>>>> You are right that BIT(2) is GPU specific, but that support was
>>>> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
>>>> use that in Linux too.
>>>>
>>>> I know some docs show BIT(2) support, but lets not bring in untested
>>>> configurations.
>>>
>>> Eh, then let's get the docs fixed if you don't trust them because we can't
>>> work like that..
>>>
>>> FWIW this is information from per-platform RPMh cmd-db data
>>
>> If it comes from cmd-db, then we should be requesting it from the cmd-db
>> driver rather than hardcoding it here.

No, what I meant is that there is a piece of configuration that reflects
what goes into cmd-db as its compiled and that's where I found that
information

> 
> Not really. This should be under the control of GPU driver.
> BIT(3) is correct for X1E.

BIT(3) is for APPS, see the interconnect driver which also uses it.
This will create conflicts and may cause unvotes when some other
driver requests perf_mode through the ICC API, but the GPU is sitting
idle.

Konrad
