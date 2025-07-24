Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9B2B1097A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 13:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698A410E934;
	Thu, 24 Jul 2025 11:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="frQzUmw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658CB10E1FE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:46:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9sxn5012570
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nLrYulJ1G5wKAXlR97Yrx07n3cFEqdg7AeV4aB+OSos=; b=frQzUmw4OQ/nyaxi
 DifxPVH1JstwaB7Ltf+ncVZTFUqweuUbvRPYUH2OlWSTMkbwHklOX2WoiNoZ914p
 UKYD/Nd2hLbE2HtDBzxvkjhdhcrshgkwLn7dYJhoYfCzme4rMPpBNEcb/+szMm4V
 vY7M5IBnuwxOTOsJCxpmvEHbHwpnF00EwZqf9Cth8ldzJtgBQ0bMA2dhPqy1UOLz
 WmXwD5MBzXi8OiQGK6BRXcXq+a3MeFL8aaxtUrXGnlr4Ksogi2UFC9/L6JVjXP0B
 2zVSTp1/QNS3sv2EFCKmXqyibGrtX1LVh+9c1u7jLX5p1qwrgI6vILXo2bSmqaXy
 ls+HUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hxk9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:46:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7df5870c8b1so19674085a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 04:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753357593; x=1753962393;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nLrYulJ1G5wKAXlR97Yrx07n3cFEqdg7AeV4aB+OSos=;
 b=T+6ZxodLix+E//vejeX5lksza0VboOWsu9/MEm7gu7AQgkJJYPK9b56q4p5Bw5qbEs
 OifQk5H2hEMIN2bg0OCvQ3C5/8ZzDiTW3F8e0EY3QI1qQVpbzOY+uZahG4DjMpRaae5h
 QeoX5cawBWnWMINkD3kSLAQvbnzvkzOLvMxh6yyr4OWZAEDTdTZlB9x4ci4gOlR7knOn
 1lX+pXyXSUqaS9Yz1OAsWuvZPIaqJMewJCpvByeQod8GLa8P4s6rwOZYczZVenUdk7xp
 jrI/Wi3u1/mtl/PD3tFKVqZASGyxqSpdLRf76CJCpl1b1nmfpARpz9UJdnX5TWoQRqp1
 sqRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXIIP704rlhHWvJon/Zcv6/Sp/2e7Tk688IZGC12Kaa4uFOVZQVGZLbKfvyMPX2+Ug4s+Y4MjDYDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh238BVlsWdT8kMglJ6M42BpZ+ysmLchBYaDOZk/jloitnht0o
 Bz1OeS7lDC5Brm7mUX8ZJ0q80LLPJaBUVyd5HNUVj74KCHzP21RIeeZML9wJmbXEe2JWKK0lM8V
 7+IZKEIl/yOy3miDrOjofzn9IaU9TjZtPJ+LILhCTOXf0T43bNbTSK9/ZyNmrLIV82OkiHVI=
X-Gm-Gg: ASbGncuYtfzYuOvLDLlvuKyV4eDq/QIvAi/R3eFqsjmABsn8DPtZBbgdUgDaXEMC8BB
 /vO58aI7yTapypJn7l59UhTXjVXd2LMbaW1e3oRYBydjf3jxFhg4evFauGf4Zs7WW4fuc+bbgQO
 zf1RzFuiD5Tj2+mtIa+2ePTw7Xktt2iX8vFeJBS8k+hgNj2RlGbnmFJHvfwUURhfB9fBkA+kqXD
 e5TxJhp1iy85iRXaypUnEFb1cQu/pmeFWJKLeNzRsQnZ4XMvVCTWblHEPWq+gIYdUxFU21hyqFL
 rInHnN1Fak3QdxJx8YwjVahfaT6l7WORMcLWUUryp9Qzjm8++JR4THrCo3ctMjkuOjpaXIGDcIh
 3Kpjcf/zKFN/P1LFgcw==
X-Received: by 2002:a05:620a:462c:b0:7e1:79eb:18a3 with SMTP id
 af79cd13be357-7e62a153087mr339853085a.10.1753357592549; 
 Thu, 24 Jul 2025 04:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRFI8LZO/kxL2pkMtgYwoe0pvQX0WhY72KM+q23vQZMuy34RvG006zcOmvJhV+CLGyBp1TWg==
X-Received: by 2002:a05:620a:462c:b0:7e1:79eb:18a3 with SMTP id
 af79cd13be357-7e62a153087mr339851585a.10.1753357591935; 
 Thu, 24 Jul 2025 04:46:31 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47f861e8bsm98426766b.113.2025.07.24.04.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 04:46:31 -0700 (PDT)
Message-ID: <1d320aac-e928-4fd0-812c-268a3a943575@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 13:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d696e7df-7f11-4491-89ff-ba71274ae101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=68821d19 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=sJC1-YunKCaHe1VmF0sA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4OCBTYWx0ZWRfX1lsbd9UI+mg9
 KqXU/Hd4cZaYKgcpaGRp5rvh3Y0DRl40pYOVBRpeAKjFMIgnUGcNnbiK72RGsn7YeToJ8QXIg2A
 UBoLYO/zLfKFzjXE6+6tLwIlNo2LO7aWfRp8IGWlTfbjdr11+ksqu08J+KFV+7lNGX3/ZPwPPgN
 dlRKYdrEsNZv4fqzfnrJQf8hcWGBmBy2PXv8YbxgnzwCrsPdELpkD4R9nn/8UAHC/PffPhGnpok
 1Dd5R75ORZSCvvpvYFNxWDI73gYJmwdp2lCc4gzNk2bFOJWzj46w2zeJnH6dYk9c2TuljJ1JT3p
 i06WUG7hURVa+W2G6oQSKIYCRMFQQk2TOPHUl65xYkdiK2kjVI8Ps9mTttJ9K6O65k6SqaSFAuN
 ZHoL70AigeDorKNhEVS8nmPxrl8oq0j3Lva6rwQCy4pcFFCfxRQf+Tms3oXyNzQIbmG/nLHq
X-Proofpoint-GUID: IXJQM7V277ocjIGjwu3swdwzpkeqZwc_
X-Proofpoint-ORIG-GUID: IXJQM7V277ocjIGjwu3swdwzpkeqZwc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240088
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

On 7/23/25 11:06 PM, Akhil P Oommen wrote:
> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>> There are some special registers which are accessible even when GX power
>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>> wakes up GPU from power collapse and allow programming these registers
>>>> without additional handshake with GMU. This patch adds support for this
>>>> special register write sequence.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -16,6 +16,67 @@
>>>>  
>>>>  #define GPU_PAS_ID 13
>>>>  
>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>> +{
>>>> +	/* Success if !writedropped0/1 */
>>>> +	if (!(status & mask))
>>>> +		return true;
>>>> +
>>>> +	udelay(10);
>>>
>>> Why do we need udelay() here? Why can't we use interval setting inside
>>> gmu_poll_timeout()?
>>
>> Similarly here:
>>
>> [...]
>>
>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>> +		return 0;
>>>> +
>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>> +			offset);
>>>> +
>>>> +	/* Try again for another 1ms before failing */
>>>> +	gpu_write(gpu, offset, value);
>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>> +		return 0;
>>>> +
>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>> +			offset);
>>
>> We may want to combine the two, so as not to worry the user too much..
>>
>> If it's going to fail, I would assume it's going to fail both checks
>> (unless e.g. the bus is so congested a single write can't go through
>> to a sleepy GPU across 2 miliseconds, but that's another issue)
> 
> In case of success, we cannot be sure if the first write went through.
> So we should poll separately.

You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
== 202 times, it really better go through..

If it's just about the write reaching the GPU, you can write it once and
read back the register you've written to, this way you're sure that the
GPU can observe the write

Konrad
