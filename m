Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB37B10FF5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDC710E987;
	Thu, 24 Jul 2025 16:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsrEFfPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA98010E987
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 16:55:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9dT2O001453
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 16:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WkvO3HWuwnO10CopnTi1wToI7EW9iwYWQA6wYcR0+jQ=; b=WsrEFfPDaBoP+9qj
 4Q3M/prEdlMGBq4s0KXkhYo/u8PN/QuqfKpPpApeD/RJ1Wev+rmTbnbi37lxMvMh
 SwMjck/yeJUpRscVsyHPgsUbqm6iIFakKak17vhAjWH15yZTAgpwdiBVv1QPfFyU
 Mu23QuqHsK2qYxBi6gr9I9nf/u2W16jUNXyu+k5h8wJL51/S+/RFTswY0FnxKfy1
 oPsJNnoiQWLhAhh7JIYFC/SzYSJkgwrSwdBMvcN5Y6K5Yzyut8A9HYPPLQexOGhg
 pDG3hLmyXLI9jq+BDyMoHYcGqAyvEp5j9b757WWhZda/7C1LGPsXrbJjgsq4Z18X
 v03xag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ug3bn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 16:55:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2369261224bso12722865ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753376101; x=1753980901;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WkvO3HWuwnO10CopnTi1wToI7EW9iwYWQA6wYcR0+jQ=;
 b=pKipyG+Kd7/xj98vkJf7vKVG1xf8+4Onea5gBU5ETSXzn4BTO7zStuY3Eaqb98EmOI
 c6qiUeCZ0lWO8zSiwwRmK7R9Gphlx5ysec3PhMPtUAx7hJXp/5X23F5YOaZ3nG0bQWer
 I7gShgs8MB28w3+1CpDQaL3ic5pmDuoKkWuJw5x3EW/AWqiRczP97wg7Sg1G0E5/jdTE
 hfXiZldKKbWq4JhhZgsOS9PFpK01gEzH9ZShjgUQojDd5b8GP3RFRa9UqX0LpNMc9kpe
 XZGmZy+v7O2SpY64a3Tt7EiGbNelOKxh7490ZisEOGPSfz9y7iYXncjLcBaTM/T86pCA
 0WUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWivfwEwUe3ZLCSs6giIOzSBjvbql+fAEukBLPciw6RTLeTZwts7iYlZqxrMjNFqoy4yj1QNTMzzyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnI3wcZwQwDSKW0ftr1Wj0PzK+dNyW1kk+BkENXo86ghw82lqJ
 5FCJ/rKcZF0F0GCENXuWEjUL8tCqvB1HKqV0W28eoNcQy3HkifCKaKOtZcDijlJenDBpNvNgdLl
 TbY8PuqAIu/J/Eepq+DvEw8SOZQdzx9J+CkGUTMKcp2OZLd998LTfhbzmdHdcNSuKhTzepqU=
X-Gm-Gg: ASbGnct0/JgEyzhGqRSCUaR/4zhGAyBVR9JnFFWfcK0hmTTbZ6SjgtF8/r0QP58js+p
 y7frOb6TqEQqxvEgfxKgdd4c1KKPqxtwWb9xVd8307lrKn7ZJoqS5nf/QVOWzupK7nNgBXC+snr
 2oqs9oop4wnpV6GSp77vZMUU+pzRNPIXbMe/0/z0Wjt/4RxZIVTYLb+3bpwMp6frbfdQgHdpZKE
 CW3QL+X7dv4NDDiLXpm4/AHbr2K00qtjKr17wYYCOpzZ+O7MCir53IWfshtjrcKGRJ3H7TItkkp
 xhseWgAtRMaHfdgxbmOgu06qnvaDM0cIqnf0tvfncekXQd74BpuLEPhn5DMrLA==
X-Received: by 2002:a17:902:f693:b0:235:f45f:ed55 with SMTP id
 d9443c01a7336-23f9812b40emr105598925ad.1.1753376101300; 
 Thu, 24 Jul 2025 09:55:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyvLqO0p8DE/R/ENYjSnXqR13kGXRv8iVQZndC6b9Kh2sUCELYpa5iV7vJ24tGDfXy+ZJh2g==
X-Received: by 2002:a17:902:f693:b0:235:f45f:ed55 with SMTP id
 d9443c01a7336-23f9812b40emr105598655ad.1.1753376100869; 
 Thu, 24 Jul 2025 09:55:00 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa4924a8fsm19330245ad.210.2025.07.24.09.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 09:55:00 -0700 (PDT)
Message-ID: <3f58451a-9b5f-4697-9679-d549104e8312@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 22:24:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
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
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1d320aac-e928-4fd0-812c-268a3a943575@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=68826566 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Dh8trrp802kbo3xzQFwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyOSBTYWx0ZWRfX+NRFSy23APbE
 9ynlm13nbmagbnH0pt6TND98CVyDT2bQlM2VYZia8HZObudqNByzk/k0+s6shoZ5yeb8DRImi5E
 NXqzCX18W1x1ooZ4us8JRtmY6MrDX0ABuVaWkYLHZs/ZvD63l15gcFSZ7Be7h1+/WbAFM7PCFxR
 KwjHTDUWTNSfxHax77pFYSRZDXSp77h42JMAYaZ0mRajq44pJk9r8vPEr64YWUKULDF8H0ebn5Q
 lROWZABpLm2Em6f3lXpGCGdamhUlbjKFocvj9bXaj9+F5eaghecPWu3dv97/NCYsF4rv2aeoI9R
 ofPsA5bT8KXCWD6GDNVx1si4nZ7eQetfmdqhkgeA3J5Zn7xD9rCEiEqozmue1iuWQ4tnciKiu3i
 UBYv6GJURM2hwXgcpmMHiHSFtRmF3mB0gMcfPY7JQAlxzZjtaq/CIXg8UcYVSrirId8PXfIa
X-Proofpoint-ORIG-GUID: uqbZMyIPbHXYOY5uvMFimGYyyaOdYGmD
X-Proofpoint-GUID: uqbZMyIPbHXYOY5uvMFimGYyyaOdYGmD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240129
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

On 7/24/2025 5:16 PM, Konrad Dybcio wrote:
> On 7/23/25 11:06 PM, Akhil P Oommen wrote:
>> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>>> There are some special registers which are accessible even when GX power
>>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>>> wakes up GPU from power collapse and allow programming these registers
>>>>> without additional handshake with GMU. This patch adds support for this
>>>>> special register write sequence.
>>>>>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> @@ -16,6 +16,67 @@
>>>>>  
>>>>>  #define GPU_PAS_ID 13
>>>>>  
>>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>>> +{
>>>>> +	/* Success if !writedropped0/1 */
>>>>> +	if (!(status & mask))
>>>>> +		return true;
>>>>> +
>>>>> +	udelay(10);
>>>>
>>>> Why do we need udelay() here? Why can't we use interval setting inside
>>>> gmu_poll_timeout()?
>>>
>>> Similarly here:
>>>
>>> [...]
>>>
>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>> +		return 0;
>>>>> +
>>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>>> +			offset);
>>>>> +
>>>>> +	/* Try again for another 1ms before failing */
>>>>> +	gpu_write(gpu, offset, value);
>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>> +		return 0;
>>>>> +
>>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>>> +			offset);
>>>
>>> We may want to combine the two, so as not to worry the user too much..
>>>
>>> If it's going to fail, I would assume it's going to fail both checks
>>> (unless e.g. the bus is so congested a single write can't go through
>>> to a sleepy GPU across 2 miliseconds, but that's another issue)
>>
>> In case of success, we cannot be sure if the first write went through.
>> So we should poll separately.
> 
> You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
> == 202 times, it really better go through..

For the following sequence:
1. write reg1 <- suppose this is dropped
2. write reg2 <- and this went through
3. Check fence status <- This will show success

> 
> If it's just about the write reaching the GPU, you can write it once and
> read back the register you've written to, this way you're sure that the
> GPU can observe the write

This is a very unique hw behavior. We can't do posted write.

-Akhil

> 
> Konrad

