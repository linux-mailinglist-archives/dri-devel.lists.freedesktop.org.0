Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC78B2550C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 23:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4506710E7C9;
	Wed, 13 Aug 2025 21:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aC3fyS+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8105E10E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:15:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLdx1012161
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BU4jpzKtkDsQFKXYvRi5iZOPZy6N+odqXW/8kLMUFwI=; b=aC3fyS+B86oBIXic
 Z6Vt+HYCZPSUECqGjyQ98u5u1kEDjjXC7moR8Y7Yw+bZGjA66tZYmfwzxGcyn/Ql
 FpMxKo3y9W0/vwJpZJQ4Fufg93/rag9jkTrDNJLQ88qiZfAb3X/NoROAxgOcBvEE
 0tYh9M3Vk87BANWvYK+P0nj3kaRiLiDBg73XlHHyJglLd1BRNC9I6iHM+ldJb8WF
 BG97PbBS0cijCZUwWdT31bwKWY6Af4pGkACAjJx3pvS60D26zE9s81fmwPWeVw78
 9Vs7K0R6AWqLzrw7gH2VKqIldvtzTkWHMbOYT44g610ExtqHIlmL26XdYcwFpHsY
 X1vYHQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxbe31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:15:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-244581c62faso1894235ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 14:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755119747; x=1755724547;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BU4jpzKtkDsQFKXYvRi5iZOPZy6N+odqXW/8kLMUFwI=;
 b=DsHiBypBFsP76S3cZMpKToCQPLYpRVhlGVEWN4VsPbY+JmOXXGVeU7hDKvaGtPyZlt
 7Cdyhkteuf+f6PHNy/4NfB7HbFw8DSC6vFBf7nNZV8GYBA5Ia3eGznBG6dqNg8TpjWM8
 JlS6l010QNAaa28+l97p4Zv6XfSY6mvXBgI0ngwtS1z4+JYvvwZGwDGEM5wfqza6C/r9
 Bh/yoNIfnmKF3c9+DIe6XtgS4m9Kv0Dl5tuTEPWl+lTVbrsgTTbjRWIqyR3fk6wWByZr
 KBqc8t+HoXwsC2crG0CQD3yjIZyhJzxmyLHICDB60fpQGf4HYy09637g4adNjMrQeJYx
 uEgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKKqtkOor5NpLKJVp+Q67q7CCzUgONjfDu7EYwtvVtU9kahm2Tu95WafgT2Wdy6gN6poXPd+wQg6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzd3/Yrqi621sfp5t9YycrDTSIXOdHOYcKl0eGkln6jSF1RrwcN
 k/aqV0Pcqgu0o5b49OycUeFTsp8GAivnnIhGsS1WZpkuPUQ2FBZlOiPVPH/NPrRqoUyFpcPepmq
 C5R5R26rRHlFZ8f6nlFz+YkYPrW4U5V/UJYZCeCBB4jFpp55wJmn/n4h7TEcKRMv2zr+YNts=
X-Gm-Gg: ASbGncvPCjQG8IC4QKICE+7q03ZCqLCF4+cA0uMYMmDJFj5SCx63YaN7eJRw/MqbT+3
 pUw1m/Z9mbQvZRQWwqNcKnRO4vYkN9eKFOHqus6F1XI40Z7MYEFm30Gzg/X1FXYZiD+bGrjcZhx
 fwgTkHfcscN4KKg6KfHncrBTGFVyQK6ykPaBfs3SYqePw/D9KLQJm1LJqxKgQPamJAp5/kzsGPA
 K0sJwT12SI++6MTJdkLu3UvMSHwVq7BxgQt4M/UvDNNJmufHmWvMH3i6qCBC23lJFyPhG3kFCRZ
 yU9DiqOCeNJ84fZCQYmeRkLOFusUN0Ms0l+ho1jenfa/3UOI1VRNoIbdNZoqBX0=
X-Received: by 2002:a17:902:f612:b0:240:22af:91c7 with SMTP id
 d9443c01a7336-244584edfd6mr5555035ad.14.1755119746938; 
 Wed, 13 Aug 2025 14:15:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHegHtK3Ax/E8VqCoX3HqLC7R/eeYh4Ddkvi7u9xQ5U8sonAzBwOxUTAIwSh2fBoqSbuDCrcw==
X-Received: by 2002:a17:902:f612:b0:240:22af:91c7 with SMTP id
 d9443c01a7336-244584edfd6mr5554695ad.14.1755119746464; 
 Wed, 13 Aug 2025 14:15:46 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef595esm331895325ad.13.2025.08.13.14.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 14:15:46 -0700 (PDT)
Message-ID: <5e862a36-8384-4098-b22a-9bbad1205965@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 02:45:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
 <937197e9-09dd-4f3c-bdb4-4001f5217c07@oss.qualcomm.com>
 <ba1d97d0-3420-4cca-8823-4d27cbe7bae6@oss.qualcomm.com>
 <d9357f4a-6f26-4570-bcb5-62fe39c78a70@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d9357f4a-6f26-4570-bcb5-62fe39c78a70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX3GZtbhMI6klI
 D/NNyoNQk4Jz74kt0m7Pr3lSwZc8frIcBUBZu5OxJIWRh+3JFgGrw/kQmK410EDe9DyRjSynSTI
 yI0mvJSgENtjlupFBrR5NdbBajMBPbeneDWY4efgGfNDQ2s+LwuHaiaPVafLVXsBuoK9KlWOVHo
 KO9v1vivflelBlNPoxLhQWOMq0I1RPZp5qprf2RhbSyzyHdGXEHBV7dpKez1L/+5PoV1XQXXWQ7
 Ot2yZk+RWuqBT14WwF0wQEpa+GC3MLPYSjodqjkXxk3jwohQkzUXs11cT+m3QQG1SgFcQH/YsoR
 kmfa9YM3ZW0KJrciRbm+baIa2yzrmAfXw0sZbWQ0/A9LVzVh0bOqrTrvE8PYOK+SiS/GyMzr5Q8
 HoRa8MhA
X-Proofpoint-GUID: BW5PcXnEy5bj7vpPwDYRb46NyvtfhKeP
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689d0084 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=geSN8yY6MFID4zSGlH7RRw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=svzdbv4JTWmE8afvHjAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: BW5PcXnEy5bj7vpPwDYRb46NyvtfhKeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
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

On 8/11/2025 2:10 PM, Konrad Dybcio wrote:
> On 8/8/25 7:22 PM, Akhil P Oommen wrote:
>> On 8/7/2025 7:21 PM, Konrad Dybcio wrote:
>>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>>> Since the PDC resides out of the GPU subsystem and cannot be reset in
>>>> case it enters bad state, utmost care must be taken to trigger the PDC
>>>> wake/sleep routines in the correct order.
>>>>
>>>> The PDC wake sequence can be exercised only after a PDC sleep sequence.
>>>> Additionally, GMU firmware should initialize a few registers before the
>>>> KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
>>>> GMU firmware has not initialized. Track these dependencies using a new
>>>> status variable and trigger PDC sleep/wake sequences appropriately.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> FWIW some time ago I made this patch, which tackles a similar issue,
>>> perhaps it's a good idea to merge both:
>>>
>>> From 7d6441fc6ec5ee7fe723e1ad86d11fdd17bee922 Mon Sep 17 00:00:00 2001
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Date: Thu, 20 Feb 2025 10:28:51 +0100
>>> Subject: [PATCH] drm/msm/adreno: Delay the Adreno RPMh startup to HFI init
>>>
>>> There's no use in trying to power up the GX logic before we're almost
>>> ready to fire up the GPU. In fact, with A8xx the PDC and RSC uCode are
>>> loaded by the GMU firmware, so we *must* wait for the GMU to fully
>>> initialize before trying to do so.
>>>
>>
>> iirc, this wake up sequence should be done before fw start. That aligns
>> with downstream sequence order too.
> 
> FWIW techpack/graphics adreno_gen7_gmu.c @ gfx-kernel.lnx.15.0.r3-rel
> adb0a9da173e ("kgsl: rgmu: corrected pm suspend flag check on resume")
> 
> // load gmu fw, enable clocks, irq, set up chipid etc.
> [...]
> 
> // unmask CM3_SYSRESET
> ret = gen7_gmu_device_start(adreno_dev);
> if (ret)
>         goto err;
> 
> if (!test_bit(GMU_PRIV_PDC_RSC_LOADED, &gmu->flags)) {
> 	// set PDC_GPU_ENABLE_PDC & seq_start_addr
>         ret = gen7_load_pdc_ucode(adreno_dev);
>         if (ret)
>                 goto err;
> 
> 	// disable hwcg, sleep/wake handshake setup, pdc ucode
>         gen7_load_rsc_ucode(adreno_dev);
>         set_bit(GMU_PRIV_PDC_RSC_LOADED, &gmu->flags);
> }
> 
> // set HFI_CTRL_INIT
> ret = gen7_gmu_hfi_start(adreno_dev);
> if (ret)
>         goto err;
> 
> // continue booting the gpus, send out feature messages
> 
> on a830, the patch is observably necessary (gmu doesn't start otherwise)

I am confused actually, why are we mixing ucode load and PDC trigger
sequence?

-Akhil.

> 
> Konrad

