Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20A0B4953F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 18:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F16110E56F;
	Mon,  8 Sep 2025 16:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8OUVLXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65BA10E56C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 16:29:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889O3YB001510
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 16:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1/JrYL6eSgak4nQJFxzbTbTPiEgAtTyrBvDwY7/FkW8=; b=f8OUVLXOkN1IkvFW
 mfSJ3ZpfSOjczj4/jphBKPL74qCnrhFfv2xWEbDgj7/4DGZxSWhXYyxl+1XRFTXB
 qXamamEgsGs4k8YSnsyIxlkKhQkIUf7xa/o9smN80bHol5YbvaEqJCErpSvp45r0
 7HNbS8CXpUfR0gmVz/oLwjAe035aBq+ZfiCVUDkJOyOiiU+w4wA3X9MGhsf/5P1s
 VFBpb5ZNde66D6aH2t+Ljt9VRoLBwcUjYXSPq0NBiefUadvb/Xd4c4wVPtfdfOsa
 5hcv4HOUWtDkviK4vvx+AZ3SUgu88FVQfmryaB/CsTrGLbogVWFH99ZJUavQfHDx
 RnBrlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8wbq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 16:29:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-25177b75e38so25042865ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757348982; x=1757953782;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1/JrYL6eSgak4nQJFxzbTbTPiEgAtTyrBvDwY7/FkW8=;
 b=ohEw4PfKVFUN0VhAIGCZ/0o6YB9nz0/RJwY3CYyUap2ZrUMI7l3vNUgn5ytf4dx14J
 eJ1XfhJft0YqHNm/tAopp8agodsdjLZPMBfI0gnYJE11GCTsyaBFEKokrba9XZ+F83AW
 az+gJGA3oMX/uWfnRkCPshb0u8hMtxk4kj1IO/eiC5kKNX275F11O5e0POM4yTH06kmT
 jPx+pQgD9GTuYV8wGZdaSEGMAccVEsJjwxu7MlG3mR84S9dPey17oW50m6OQ3qQDIPaF
 0yC3fsThcM4yaNkATH/M0gTua6ctimx7t2TOpkRkN7vcwhFbfpaPrTM4wl2oAj+Lmbc5
 guDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgfKIZyDFNzYjj9MthEEJSrppiRCuyR2dW2hPbFGkmuRwI9SyP3k0i28IdgTsdZDBID4r6NP4QLWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYDb8wYNzPF4rEMW7xceA4gL7LwqmjtNuzvqjJ2Y4+wnzBlikO
 pC7BRCwtFcsAnwipTSuHsKvaPXDbYOypkEHa7CDjr1y+mVAVbp5GgGZVrySK5EwaoaLMyWbqvxt
 jHzZIQKcA+JCxXKJqHXZVAeELnOJsZ6OQqom3LwbN8lYInvlxbcRMD6iSPgvACMFWy1We898=
X-Gm-Gg: ASbGncuvAoiU+zpuWaeQZXJhhaFsLA/sxW7C5iFl5H38iUfu57p318Qa2ubGLV9+gnp
 n2nNgS/MpPJHcVy0UNN+14v2tqOZFZ48k/NW8ZKcOhL/sikPGX/wbEBx5uTDUPtyrbfjKZ0uPrk
 4spKxyIUiyimJh6ZstetR31Iu8DC4fepXK+oQXsk+rcYJZwnkG4dN0SgF8U3/DDFhmN+U6lFM4N
 WumuQJDASQoPRZhu7p+E8Ulg4f8qQPyRgU6Hg5HDB6E6AOdr8XA5HgP4MTjEjtbfkKxxMG8J1GD
 iA2t3jRSe10MD2w8K+PG0KOuBR9HrKdnFU22NqxejK0rIDpsI/WDJSnhLJeisg==
X-Received: by 2002:a17:903:2b06:b0:24e:e5c9:ecf7 with SMTP id
 d9443c01a7336-25170c416ebmr108420925ad.34.1757348982279; 
 Mon, 08 Sep 2025 09:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8/ux+pl7ggDeP2V1/4IdQKuSpSB/3AQUQSSiAQ4GvrfZVtuHWRtKw2FqRwI/7hSQpSYGa7Q==
X-Received: by 2002:a17:903:2b06:b0:24e:e5c9:ecf7 with SMTP id
 d9443c01a7336-25170c416ebmr108420405ad.34.1757348981586; 
 Mon, 08 Sep 2025 09:29:41 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329dcc0af56sm19952353a91.24.2025.09.08.09.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 09:29:41 -0700 (PDT)
Message-ID: <dad0a37f-38b7-48b4-983d-fba265bc66f1@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 21:59:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <4fa44ec5-2792-45e3-af87-b3e4d2ed5d86@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4fa44ec5-2792-45e3-af87-b3e4d2ed5d86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bf0477 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=PfGohb2nDGJMFqWtIAwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eJfpDlRqYz4yPat2daNFd60NuLfOuy78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX3w+eUx9er020
 Ctcs6zvCQDqbAGduIKPWHPf7sgvYkiUTXGBfN5bjb0CbntFC2jwApSJ9xZaP1VRXTFEVSHMbM9q
 uA2sULvEKYNlaHmu59s/uDE6RIuZyf+k16q7ycUAbl2wIniUSs/qZKv94Ywlp5QMS7R7JGpz9zi
 aHBAa5a768PiMX/AYDGSu8zrgGZCE/q4g/MPu52U401EChCxWtGJbzi87r8OC1AUImy71sp3Q5G
 en+BIaOgSHC3D8OBNuZN8NBDBHQXJUqcvj8v+cPykW9n3tfqU1JRNWRSQ60M/Dv22KvsIZH/Apm
 v3Pv/E34Mp61xRM5P16jNJ3evX/PEiQeBKu96ig2OSjzF3cFMmOZ+cBFINT+R7VuGFEK9IQzsGr
 JxOTjT+5
X-Proofpoint-ORIG-GUID: eJfpDlRqYz4yPat2daNFd60NuLfOuy78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On 9/8/2025 9:52 PM, Konrad Dybcio wrote:
> On 8/18/25 9:17 AM, Akhil P Oommen wrote:
>> On 8/16/2025 3:45 AM, Dmitry Baryshkov wrote:
>>> On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
>>>> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
>>>>> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>>>>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>>>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>>>>>>> along
>>>>>>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>>>>>>> OPP core scale the interconnect ddr path.
>>>>>>>>>>
>>>>>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>>>>>> parameters
>>>>>>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>>>>>>
>>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>>> ---
>>>>>>>>>> Changes in v2:
>>>>>>>>>> - Used proper ACV perfmode bit/freq
>>>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>>>>>> ---
>>>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>>>>>   1 file changed, 11 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> index
>>>>>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>>>>>               .gmu_chipid = 0x7050001,
>>>>>>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>>>>>> +                {
>>>>>>>>>> +                    .name = "ACV",
>>>>>>>>>> +                    .fixed = true,
>>>>>>>>>> +                    .perfmode = BIT(3),
>>>>>>>>>> +                    .perfmode_bw = 16500000,
>>>>>>>>>
>>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
>>>>>
>>>>> You are right that BIT(2) is GPU specific, but that support was
>>>>> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
>>>>> use that in Linux too.
>>>>>
>>>>> I know some docs show BIT(2) support, but lets not bring in untested
>>>>> configurations.
>>>>
>>>> Eh, then let's get the docs fixed if you don't trust them because we can't
>>>> work like that..
>>>>
>>>> FWIW this is information from per-platform RPMh cmd-db data
>>>
>>> If it comes from cmd-db, then we should be requesting it from the cmd-db
>>> driver rather than hardcoding it here.
> 
> No, what I meant is that there is a piece of configuration that reflects
> what goes into cmd-db as its compiled and that's where I found that
> information
> 
>>
>> Not really. This should be under the control of GPU driver.
>> BIT(3) is correct for X1E.
> 
> BIT(3) is for APPS, see the interconnect driver which also uses it.
> This will create conflicts and may cause unvotes when some other
> driver requests perf_mode through the ICC API, but the GPU is sitting
> idle.

No. GPU vote goes via a different DRV. So it is independent. Anyway, I
checked this further earlier. X1E platform doesn't implement any
perfmode vote. So both BIT(3) and BIT(2) are no-op and are ignored by
AOSS. ICC driver's vote too should be no-op on X1E.

-Akhil.

> 
> Konrad

