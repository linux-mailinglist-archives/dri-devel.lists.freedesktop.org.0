Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F4FB154D4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 23:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D4910E07D;
	Tue, 29 Jul 2025 21:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpeZtkJH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4187610E07D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 21:50:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TJ6lut005104
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 21:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JspbK+7iQlUzvPH2LdAMAjZlVUU4SzJyy/Ozc29zRpc=; b=gpeZtkJHfR4ZWH/F
 KqdBuCv5LwjDgycYqm8La+lrLipEaNpFxuSuBlEmBb6ZlF/bDiz0aAcyWZz+OLy7
 zlyYlLe8cwppdEYOjaooAfbWwYZSLTBepEQ5j/bNnwBVT7GV+J5t173bvduyokb+
 T42fBT2SfXvKQJMV3hyWER35l0wZZP3gp8YVg+tGsxcEH13/V2o0YTigdbbHYYxM
 sRGO06J2Gd5SuYzWkB5BEiwYlgtaKHYGVTnfJIA8MORKcsJjz3A+g0KnBwRqMU5T
 ck8G+uPmSxLxsCUxFU9FosLxUbdMKpov/+Bw3nskC9ysQyNTewc9HCSXRqZeTIS3
 z6ANuQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu1vrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 21:50:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3139c0001b5so5679893a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753825800; x=1754430600;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JspbK+7iQlUzvPH2LdAMAjZlVUU4SzJyy/Ozc29zRpc=;
 b=Ll3X2FQv7q/xyhHwB4bHOZpzygB2B6BQGtIDAmASyDdXpz4mxmj1jDrE5PDdVkHpqg
 hoAZOzJpY5HGcA7XvYEr3WZyx6d3C0bPGI65VIO9DgKUWcBd/iipXggYjKTkfDgqXdNc
 fWzJJvN3X9bs/kIwFWEfQ9H28Gh0l68XsGFikym0kTikx1Jjgu/i6k81tRwyExXJ3Hd6
 uYfeUJzI04hH9UOKYdGu7GbbTLpvitm1CZHJYzGGCj9ZEN93WOSQOP3Naeu9522ZjnJB
 dUw7k++40a2VxSwD1CL6JVpQoCHMOX5V4VvY4atZ1LDFx3uGC9nOEoVE4cRRpvtttk5x
 JHqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXe14yixLZORwL1AGSF0kM3jfph1nONq2ja5sF3sNafMh98Y5uC57WA+MNd+OUY1K+ZYGagwN471A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi7vLXUClAsA5HVmweKaPiIGaBsfgqRyrP3E36ha7berhGCbfy
 JNds44w41R4eM/s6hY6NQ/TIstBC9UMEJODeo8c+bImGuuo3SMBizMAdFpAk2soh5XZzWeBsF6g
 tUcu5Y6eAHZAvf6p4n29KJKw+ILvsfhud3l6j7Le9toCzl0oJ73MqeZG7YZOSH8L5Cir0pGo=
X-Gm-Gg: ASbGncsfSjyXlXx+7RGHQX2s2DlmhA9SWQCUeyNdXg2PXwmtWFDA5IQJBKcZB2mWUHE
 333Pigogmsj0+00iLW8qL52q+8GmIDQ3Nu5Xx4tgdVVra+Q7APN0mtm1t/zqThq7s6JhFUZzx0p
 6RsgpEA1rH7raPJ9UgkeHAwINZHF4rQzow3z6BU24fHVRjzjLFM2IFFaORroXOGoWTGkv60d4QJ
 JD8mL1KVZp+AHuRAMLqGhPGNcrzZ2XK2J5MwRTe7RE+1QCHOnW6baUsG0YHgKfJk4BIbPToxrSm
 cjDg5+EFUYOZFawTkpfVL4+KLGO9X5/bW7ctNj96MIKchTN/Z5rXxVMRlqlJlNgy
X-Received: by 2002:a17:90b:3f4f:b0:31a:bc78:7fe1 with SMTP id
 98e67ed59e1d1-31f5e3809efmr1403402a91.18.1753825800268; 
 Tue, 29 Jul 2025 14:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWzTCdtd/O3kQ9la6eaI+9qnWjBUz18tIpGuf+RzXz+1SzG38sYAe/Va1BAoLtjsbO/VMJSg==
X-Received: by 2002:a17:90b:3f4f:b0:31a:bc78:7fe1 with SMTP id
 98e67ed59e1d1-31f5e3809efmr1403372a91.18.1753825799808; 
 Tue, 29 Jul 2025 14:49:59 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.231.177])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63dc5383sm111612a91.15.2025.07.29.14.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 14:49:59 -0700 (PDT)
Message-ID: <4226ced8-411e-4cc1-be2c-4d1452c09b14@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 03:19:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-7-9347aa5bcbd6@oss.qualcomm.com>
 <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
 <30442713-2990-490a-b076-93c3cfc3901d@oss.qualcomm.com>
 <d696e7df-7f11-4491-89ff-ba71274ae101@oss.qualcomm.com>
 <1d320aac-e928-4fd0-812c-268a3a943575@oss.qualcomm.com>
 <3f58451a-9b5f-4697-9679-d549104e8312@oss.qualcomm.com>
 <9e48ea8e-b59b-4620-9781-211cc1f7cc07@oss.qualcomm.com>
 <bd6076a5-f888-4044-8a5d-ea6e6fea28e8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bd6076a5-f888-4044-8a5d-ea6e6fea28e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pxIqnP6tKrS3GDzqrCLHgiVG1xOCTkqh
X-Proofpoint-ORIG-GUID: pxIqnP6tKrS3GDzqrCLHgiVG1xOCTkqh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDE2NyBTYWx0ZWRfX9epLpn9kGtVO
 VZ28B4r/pZlJZoNk2sLcEi3Mgm2ifs6bE4bS0qjTk7fjuLomRh4BCyBXxymjCRVr2RpNk78XDte
 BsymHZN3KkCyEfA7BlcD5lQXDwUROHc4X0d0HrPKIb4jfwbM02S2g6wnrcJqpWtBs8dLnUDJbvu
 A3x4PBTNZzK8OnPCaTLTXc4q8JOs/2LYaVBIaa2Ls1KHd5h+GCUEGkcTczCkDGTur73d4c7Hc5V
 37Aj7dcVopbwocjIDYrHsnBLeVBGChInuQGZet6rANeNjDHy1xr+aPDNF20CqWZRKG2d7/W9s3l
 jrPe44vdfPLMwBoNJk8KHWzkyacceRvlJKyeI54DbvlpMV0PikYB8G3W7utRG5PyjBKE0nIr90h
 dX6VJkWRo8z42BegqoAfk2jIvnhGFb1BmjbTzVh8yFSuySQH6NcxC+LVXyjqVMj6d5fbO5fo
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=68894209 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=9XpMM9ZEX5jLuhR58p3+Fw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5A9ZKBTbSWANmlZxSW4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_04,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290167
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

On 7/30/2025 3:10 AM, Akhil P Oommen wrote:
> On 7/29/2025 6:31 PM, Konrad Dybcio wrote:
>> On 7/24/25 6:54 PM, Akhil P Oommen wrote:
>>> On 7/24/2025 5:16 PM, Konrad Dybcio wrote:
>>>> On 7/23/25 11:06 PM, Akhil P Oommen wrote:
>>>>> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>>>>>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>>>>>> There are some special registers which are accessible even when GX power
>>>>>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>>>>>> wakes up GPU from power collapse and allow programming these registers
>>>>>>>> without additional handshake with GMU. This patch adds support for this
>>>>>>>> special register write sequence.
>>>>>>>>
>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>> @@ -16,6 +16,67 @@
>>>>>>>>  
>>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>>  
>>>>>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>>>>>> +{
>>>>>>>> +	/* Success if !writedropped0/1 */
>>>>>>>> +	if (!(status & mask))
>>>>>>>> +		return true;
>>>>>>>> +
>>>>>>>> +	udelay(10);
>>>>>>>
>>>>>>> Why do we need udelay() here? Why can't we use interval setting inside
>>>>>>> gmu_poll_timeout()?
>>>>>>
>>>>>> Similarly here:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>>> +		return 0;
>>>>>>>> +
>>>>>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>>>>>> +			offset);
> 
> This print should be after the 2nd polling. Otherwise the delay due to
> this may allow GPU to go back to IFPC.
> 
>>>>>>>> +
>>>>>>>> +	/* Try again for another 1ms before failing */
>>>>>>>> +	gpu_write(gpu, offset, value);
>>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>>> +		return 0;
>>>>>>>> +
>>>>>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>>>>>> +			offset);
>>>>>>
>>>>>> We may want to combine the two, so as not to worry the user too much..
>>>>>>
>>>>>> If it's going to fail, I would assume it's going to fail both checks
>>>>>> (unless e.g. the bus is so congested a single write can't go through
>>>>>> to a sleepy GPU across 2 miliseconds, but that's another issue)
>>>>>
>>>>> In case of success, we cannot be sure if the first write went through.
>>>>> So we should poll separately.
>>>>
>>>> You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
>>>> == 202 times, it really better go through..
>>>
>>> For the following sequence:
>>> 1. write reg1 <- suppose this is dropped
>>> 2. write reg2 <- and this went through
>>> 3. Check fence status <- This will show success
>>
>> What I'm saying is that fence_status_check() does the same write you
>> execute inbetween the polling calls
> 
> On a second thought I think it is simpler to just use a single polling
> of 2ms and measure the time taken using ktime to print a warning if it
> took more that 1ms.

But then we can't know if the higher latency measured is because this
thread got scheduled out just before we measure with ktime 2nd time. So
we should rely on gmu_poll_timeout() for accuracy.

We need a warn after 1ms because there is a 1ms timeout in VRM. We
should know if it occurs frequently enough to cause a performance issue.

I will move the the prints towards fn exit.

-Akhil.

> 
> -Akhil.
> 
>>
>> Konrad
>>>
>>>>
>>>> If it's just about the write reaching the GPU, you can write it once and
>>>> read back the register you've written to, this way you're sure that the
>>>> GPU can observe the write
>>>
>>> This is a very unique hw behavior. We can't do posted write.
>>>
>>> -Akhil
>>>
>>>>
>>>> Konrad
>>>
> 

