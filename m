Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB00EB159FA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 09:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1124210E423;
	Wed, 30 Jul 2025 07:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBvqUKWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA9B10E423
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 07:49:30 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6DGmb031480
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 07:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rTm+TZkQT/SGQGK62s6S181SpWgQH5VtRqWeAqKrzZc=; b=DBvqUKWVV6+E3hMq
 WemIAzJm3LT2m6sGOWR+cg/hJWHEaFz31nnOakfi6LAogcIilPrC6WEOO28ovgDf
 lymO0BXfeHSfbweKmBEiP8OEk7M96xynCHloyYXZ9efHUPSal3PhgUqUbFhV4Hw2
 f5nSEkFcD55Hxe4ZmtLNZgHN6IE8cTNqr8S9PLwMxHpGygxxtCOPNKVOMKUlSabi
 vjmyfeNCXocYaeRxiPu7p69i6lZbCceAd3GQ47WmZ9kOpahLV1fFHWv57Mc1W9XO
 hEKpZtR8rdl04mIETVTOFGGFQBW15B5IHvto2riCYE9zLfesedjZ7voALZdp+CAG
 U4IfbA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xgacd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 07:49:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ab65611676so23120651cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 00:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753861768; x=1754466568;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rTm+TZkQT/SGQGK62s6S181SpWgQH5VtRqWeAqKrzZc=;
 b=vccNLqUsjFT0bhlkYnQT7qhAg+o5q1RLXR2RCGlOGYMglJ1PtKBBYCis2FJG/fSRJy
 5FRnDsn+R1yt64nynBVTZcy2atSf8bGgzt9FoZ/jhmAfisCFVkP3cXH9AN4QfO4cgvjJ
 0F6lt0nCf5fXg9GeobXzuUukoVuveRuv5KoPcmLtAwcpI7gmOKoAwNZebznPJVST7YSy
 4S7A43skUDCVkpE5nCoAFXNUr5ceBB4jcTVMsx+VH9fa1u4LxZN97oBs+nuJs0yNrEBL
 gIgTzxdOnaEzYphFYgvEYDr+K+7mwkwc16SL2qXNzWUKdxMfKIBWa3v8oqAVfSY/Pa2V
 Vayg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9F5Okgf9Fi4VhcjqLwCy4YisxRHroY5x0xG4DuJ7FjYpKachN3Lf4MlPK2MvOc9GFUL+amTqDxpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4C9nBBbi422WEDn12s65Y9j0XMy21lKz/mqAk4KbjzIge/VLN
 lBqyTH5IJqEAnAyFycmngYqQyerl8nhnTa9z5CGu1cQt4JzA8AdNDdXyoy/v+tBVuz48uK3bqFB
 QWnxkZGCmwzXXIUlP7AfWnt/R55fR+o0S7DEW4iWX1rZ1S34XLTtHQESlvtdIOxaL4I+0dqY=
X-Gm-Gg: ASbGncvzFvkDpSn/Wz+ipDH+Z1D7uoiMMyoFgOg9jChIpsJZLKycwo3eSZtgGfP/wD+
 HLI5QPxtMnR6q1vuqpBp7f+N6psFrh8tmRsQBPIbM20LnaijCoBpgo93rRLbZyezdWH7ZaS1diL
 c6AsQFTcflohXF3muT8gv0S1ntmGLdHSttiQ+sgV8w1LIo+721mTfWXOE3kZT50hloCV7pDeOJS
 DKhQfgZh7CjM7DoXZ3ShDmz5RzUfw8tyNjGPI/El1Cq6HwvSNCjAXHbS/N28OZAQkpahs+KT+TQ
 BqA02uZoAAP/HzEMhbgHaTaEaCO1z1PKrSr4mei1LEyWEDuBIXi/ujZuZ3dkJ/20WfZAHty4Sw2
 BMpgU786zbsZRPaQtPQ==
X-Received: by 2002:a05:622a:488:b0:4a7:bed9:524c with SMTP id
 d75a77b69052e-4aedbc144cemr18605991cf.11.1753861768333; 
 Wed, 30 Jul 2025 00:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpPhh045uTi/QuFSdP8//pNs61a36JHJHwALkH8CLnoy9U2dacpk/Mha/zFLAQRC76nIkYJw==
X-Received: by 2002:a05:622a:488:b0:4a7:bed9:524c with SMTP id
 d75a77b69052e-4aedbc144cemr18605921cf.11.1753861767853; 
 Wed, 30 Jul 2025 00:49:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af9015990c4sm74181966b.128.2025.07.30.00.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 00:49:27 -0700 (PDT)
Message-ID: <7c5df7d1-6757-4cfd-b69d-46854731a119@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 09:49:23 +0200
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
 <1d320aac-e928-4fd0-812c-268a3a943575@oss.qualcomm.com>
 <3f58451a-9b5f-4697-9679-d549104e8312@oss.qualcomm.com>
 <9e48ea8e-b59b-4620-9781-211cc1f7cc07@oss.qualcomm.com>
 <bd6076a5-f888-4044-8a5d-ea6e6fea28e8@oss.qualcomm.com>
 <4226ced8-411e-4cc1-be2c-4d1452c09b14@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4226ced8-411e-4cc1-be2c-4d1452c09b14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1NCBTYWx0ZWRfX/DYMg5CnSPgP
 eYziXWZYjSRUmdrNESQMG6HA3sCDPxuU9zPYZasWqmYXoOEJIRvF0HRmWPN6pQV0sBlqdhWIuZN
 Z67AVmkvWriVDaZIuRBUzfEgaD+HHjkoaGSXJcz22aXxA/RAAXcdvrLJ5twKGEomDKwDJpr312c
 /ChaP0e1y/s9+mnCt7GMOornPiZRtIbcW9qUWNF4oLZXOf2DNZm8vc/xrpiYLpMd4w5oVAYG+Bc
 rgQyGIia7mWeGES5jLqU+lPWdjX0h7sKVUEuHl5YrTG8p+AjV5NslPzKAl5CCfBexcFijs1nZBu
 gycUtAZ9U4WeMmL+ZRC0/HIP+hoKFs3aJSaxCzqdkaCsNbJtcvdvLiUpdudcxroyS6I3l5rA/qE
 ax7AvJ3ETbOm670P2fxCGntkZbb4/FmaxNvcNg4DeUi9PIYdc5TbmYg+NllUujj31qDOgiEb
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6889ce89 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ND-EWpZVFRsHkRg0wacA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3wbmn6h7iCLt_UDMZpicV128tc5lE2Mp
X-Proofpoint-GUID: 3wbmn6h7iCLt_UDMZpicV128tc5lE2Mp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300054
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

On 7/29/25 11:49 PM, Akhil P Oommen wrote:
> On 7/30/2025 3:10 AM, Akhil P Oommen wrote:
>> On 7/29/2025 6:31 PM, Konrad Dybcio wrote:
>>> On 7/24/25 6:54 PM, Akhil P Oommen wrote:
>>>> On 7/24/2025 5:16 PM, Konrad Dybcio wrote:
>>>>> On 7/23/25 11:06 PM, Akhil P Oommen wrote:
>>>>>> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>>>>>>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>>>>>>> There are some special registers which are accessible even when GX power
>>>>>>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>>>>>>> wakes up GPU from power collapse and allow programming these registers
>>>>>>>>> without additional handshake with GMU. This patch adds support for this
>>>>>>>>> special register write sequence.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>>>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> @@ -16,6 +16,67 @@
>>>>>>>>>  
>>>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>>>  
>>>>>>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>>>>>>> +{
>>>>>>>>> +	/* Success if !writedropped0/1 */
>>>>>>>>> +	if (!(status & mask))
>>>>>>>>> +		return true;
>>>>>>>>> +
>>>>>>>>> +	udelay(10);
>>>>>>>>
>>>>>>>> Why do we need udelay() here? Why can't we use interval setting inside
>>>>>>>> gmu_poll_timeout()?
>>>>>>>
>>>>>>> Similarly here:
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>>>> +		return 0;
>>>>>>>>> +
>>>>>>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>>>>>>> +			offset);
>>
>> This print should be after the 2nd polling. Otherwise the delay due to
>> this may allow GPU to go back to IFPC.
>>
>>>>>>>>> +
>>>>>>>>> +	/* Try again for another 1ms before failing */
>>>>>>>>> +	gpu_write(gpu, offset, value);
>>>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>>>> +		return 0;
>>>>>>>>> +
>>>>>>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>>>>>>> +			offset);
>>>>>>>
>>>>>>> We may want to combine the two, so as not to worry the user too much..
>>>>>>>
>>>>>>> If it's going to fail, I would assume it's going to fail both checks
>>>>>>> (unless e.g. the bus is so congested a single write can't go through
>>>>>>> to a sleepy GPU across 2 miliseconds, but that's another issue)
>>>>>>
>>>>>> In case of success, we cannot be sure if the first write went through.
>>>>>> So we should poll separately.
>>>>>
>>>>> You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
>>>>> == 202 times, it really better go through..
>>>>
>>>> For the following sequence:
>>>> 1. write reg1 <- suppose this is dropped
>>>> 2. write reg2 <- and this went through
>>>> 3. Check fence status <- This will show success
>>>
>>> What I'm saying is that fence_status_check() does the same write you
>>> execute inbetween the polling calls
>>
>> On a second thought I think it is simpler to just use a single polling
>> of 2ms and measure the time taken using ktime to print a warning if it
>> took more that 1ms.
> 
> But then we can't know if the higher latency measured is because this
> thread got scheduled out just before we measure with ktime 2nd time. So
> we should rely on gmu_poll_timeout() for accuracy.
> 
> We need a warn after 1ms because there is a 1ms timeout in VRM. We
> should know if it occurs frequently enough to cause a performance issue.

VRM, as in the RPMh component?

Please provide more context on how it's tied together in the commit
message, it'll be useful for people down the line (I'd assume accessing
these special registers invokes some handler that brings GX back up
momentarily, which is why we're polling in the first place?)

Konrad
