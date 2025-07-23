Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E1B0FBF6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 23:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0746410E85F;
	Wed, 23 Jul 2025 21:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZwFZ7Jw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE7610E189
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:06:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHo8dv007879
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /ByNsxNG/AyQvTr41MbSY4M0uuFiVWXFnX5tJOWH1zQ=; b=VZwFZ7JwlVcl5ZMS
 kGCFgDVeqNn1ZroGfszFIX+aPstI6Z44Gnx7IrDmK3EwwcwC4Z9zofg4Z92tUTYo
 BWeWOK9H0z3P3MEL3PKvUcZr373MGQ/8/L+SOjZEILn15B969HRDAbgEQ1QGpkMn
 ZnVZFjICNFnfl1tjpuKQO5zDjiY4tfdR62waN9PVkR09S2vW1wBlZn3vEZpMIE3/
 STy6zW1gla2DkMRjpxQBmDGejAEh+1eWlESMqWc4dsUG7bdAHaS/8bd/hCsEqN52
 tQwhY8zWvzs/GWJysU/SDEhXyPNbEF9e5IizupweaF4t6mjlmpesa+W97PLGK4Yg
 oesgBQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qehwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:06:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-236725af87fso3028385ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 14:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753304798; x=1753909598;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ByNsxNG/AyQvTr41MbSY4M0uuFiVWXFnX5tJOWH1zQ=;
 b=sKgUC5hNwkW9+hkmRracWpByKTMUGKWGPbMgNCoHznIlxwnKNQxxuqD0aeDCib4lFO
 H1W6nCXB12/g6cpJWnuaH6r07FQt9nwb0+TswpkpcFOTgeO97CMOWuPFGjoehQl1K9B9
 dlClqkOY8Led5q2MjcEiQEloGQFJ9zCZJXdHTGE6iwqU5II5mMgNscfvEwyuxfCrd37J
 vOtj+ZNUlheZl/Dz5GBs4PLeB1G3Mz6l5a+wdWbHbZLcMALhHqw1U20H5a0nbyJD9LPj
 Yu5xwTuLbzoABymPRe6zcEtG6Yn6rq21gtyq7ITRH5wYK2fIkMv/m8DTNoRuDJdKj9ER
 6fwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7tGaGsSw9EO5CMcN44siy3FXJgm8lDQwO9MokGFgtd3rVFTn8+jLT3lp/wGpRJ20lEUz4LNXkB+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH8FUaArVGuPrU9TJMTPS43DPZBha329afjhPCDKWR7jN/9BkU
 NEO/1lq762KKwb1deupIleZt+Us8AwNxX+MLHntwG1z3S8C5t5AKAfC6LRC0mbiguEtJ3l6Zj9g
 43hBhBbNKKZEL0xbOlzoVE0g26MYHHq9tbdotpJ1SAiI0LT9BLEqLHuSVca9g60UFEbayuUM=
X-Gm-Gg: ASbGncvR3/VB9GxfcJuSf9yUdBow5d6nCQLoNTBLl46sKj1mVzln+76UWa4iJNzE3M8
 BVKzThxArx4t0N9tDEnr/wnQOwIbgJnPxE3XeYCF4vbY9LoVOE6M3iz9IThpOjAXZQoTborBLyy
 uTKhSetEf8udjrNuvT9uM+XIqqwTisxgYMNrYOHNCC/FOuO3GZabqVpkjVn9vLCsm1EXQO8whIZ
 Ah2AzfPIVZ0PIf7cAlG0uZfPc4WBdRJ/XrncxaPPDWSAIVq7iZLvsaL1DUZQZeWHAwU0Esy8njQ
 1NO5UsqoVJjJY90MXkE76gf6CCV9L0XuZqASPkJig9ucA3LUcu1I1egFWCCjNg==
X-Received: by 2002:a17:903:184:b0:23d:d348:4567 with SMTP id
 d9443c01a7336-23f9813f511mr56953205ad.19.1753304798262; 
 Wed, 23 Jul 2025 14:06:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxu2LcuICb2xFOgDTOahLCuANW8W/4axRcHon5EQHJL5Qq3U/5Qcx8vWysqROHALSCldmkrQ==
X-Received: by 2002:a17:903:184:b0:23d:d348:4567 with SMTP id
 d9443c01a7336-23f9813f511mr56952995ad.19.1753304797828; 
 Wed, 23 Jul 2025 14:06:37 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d2fa7sm102685975ad.162.2025.07.23.14.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:06:37 -0700 (PDT)
Message-ID: <d696e7df-7f11-4491-89ff-ba71274ae101@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 02:36:30 +0530
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
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <30442713-2990-490a-b076-93c3cfc3901d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4MCBTYWx0ZWRfX+Xh3ROJExnJL
 D8GgywXn++4qC0NOQZ/1xAaMnBJKx7WYV2Hk1PqF/dF7Y85wBTqj5zc5V1FJJPvhVI0/WXqSdcz
 jSEkvfgP0GpGmzAGUUcNju2FXRSzTSXZg1rU/Uowh/P1yfv0s6/WAQfcwxc2fcoC4zhQOUtyLXW
 IJz1EEnUzrme7eDK6mj+udIQglE77jGTRcu40a5FBji9LxjdFQo/tY2H7fGonSrR1YWCXjhuWD7
 sJAOiz0HOaiXaDJt5IV/WOcLC4knee3sozpgjS5fAtSAfU95ZtvOqaaEiMHseaWXgMw9h/Bm6lN
 B20GNeAR5XbzW3Tw2lLkIP5R8xLjEvl6N7YvWicUY9mj+XjwOryMdi7xJA5FMIaem5Bsyk4Ewri
 Xw7TJd67PCNWZazhIcqF7HQwa0N3LuTwEvPf/K8O+Bam3fjgLM0iWNEGDjwF6xeIHHpD3t8F
X-Proofpoint-ORIG-GUID: 6A7zrUxHMrdzGx1WbILX-kyejqhjeWNI
X-Proofpoint-GUID: 6A7zrUxHMrdzGx1WbILX-kyejqhjeWNI
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=68814edf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=sI7m75I2uMoaLRCfwtgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230180
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

On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>> There are some special registers which are accessible even when GX power
>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>> wakes up GPU from power collapse and allow programming these registers
>>> without additional handshake with GMU. This patch adds support for this
>>> special register write sequence.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -16,6 +16,67 @@
>>>  
>>>  #define GPU_PAS_ID 13
>>>  
>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>> +{
>>> +	/* Success if !writedropped0/1 */
>>> +	if (!(status & mask))
>>> +		return true;
>>> +
>>> +	udelay(10);
>>
>> Why do we need udelay() here? Why can't we use interval setting inside
>> gmu_poll_timeout()?
> 
> Similarly here:
> 
> [...]
> 
>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>> +		return 0;
>>> +
>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>> +			offset);
>>> +
>>> +	/* Try again for another 1ms before failing */
>>> +	gpu_write(gpu, offset, value);
>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>> +		return 0;
>>> +
>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>> +			offset);
> 
> We may want to combine the two, so as not to worry the user too much..
> 
> If it's going to fail, I would assume it's going to fail both checks
> (unless e.g. the bus is so congested a single write can't go through
> to a sleepy GPU across 2 miliseconds, but that's another issue)

In case of success, we cannot be sure if the first write went through.
So we should poll separately.

-Akhil.

> 
> Konrad

