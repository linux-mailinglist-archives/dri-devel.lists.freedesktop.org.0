Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46928B0FC45
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 23:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67DF10E04B;
	Wed, 23 Jul 2025 21:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoZGisDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F89E10E04B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:46:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHmEjv032283
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tvauJF9+c6IKxzBGTcvA8iSaaoeAgCJyCD9Tgwx44f0=; b=IoZGisDVCuegZMFt
 /m/Q4EEsuKHnnCOd7eju/TXpfgxGb5IOhqc27QPCdVKs94ZKD8bIem3LfsZI+E52
 JotkVof08ygoTKIbTWh+vcogoJww7Gkk4LXwJaU6YwIzUYrwQ/aop30OxPWmoAx9
 aza2USyuTvfNUJtwEtTnL+Ofjbq9B5AVVQ3KZi0jMyA+YA0VQW6dbvAUnpggMjmt
 CWFlf+Rimaj5KkGhSKvr3qfGA7JTVW5IpAJmBJt09cos2ADWMDObwoDc3YSRpD2j
 86tkgt3JYPesJ9JrXH4T2Tnmw/xwKVbcOmJoU0BKcRyUcHPVV36lSSSFz/eRuF1E
 F3cqfw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1dxmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:46:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23507382e64so2331535ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 14:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753307204; x=1753912004;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tvauJF9+c6IKxzBGTcvA8iSaaoeAgCJyCD9Tgwx44f0=;
 b=E2ODxUB0f0kKGMGto0zZAupzZLeRZbPeNS+50oUUuLJtsWa3iQ2hhEsPtNxootbIJx
 oBVVMpCYckd8KBWo2EUAd6KF8lLyInR0UCT+xwWm1G03zgdVLnjldfBK/EoxjUH/PCMS
 f2wasJo6icOk7HFovgc2g0qEfr2wyEDOecNIyFDYExv+tNBOjCUZOl5dmenkTY4R519M
 cfLzszj7NCCR/ki+13pkHlrBdxKHr0gKuEM1kxWrRBUz+Jd2pcNiKuZKW+13kJUZL/GB
 +kFh/lZbYymCnHycK08p1FmI1j7e9iGgh6lSuaoy3sHvJj4KPpVUXpTSyG0JVmkSdEXc
 JU2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8W3KL8ibZddTkuwCGopru850sEeAMRBQaxk950uWsIWrBQSOMM6BkCToLzoZMnLiGpnhQT2dWaRk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ1qXnUjbH+XhGTN1HH/KKVmTTM/6xTg9W6nG+4qVE+63AMYbs
 Ec3VhfgRGV6bE+t5ZvJEWIywpeWDNzqLmW2c4OowK0PYWTVmxriMl1vQePwCZnpM5FXukwB6A/d
 01zGeY6sbZymQwhKXL/845989snqpalpkeMlHUkQEMegTiSdfsFhQUDXgURvPOyMHmfJXhoY=
X-Gm-Gg: ASbGncupjohWx/Hnv1VE9USZMPfUeHLgs/kLHc4vdlF+sdsQrPcx64vo30EP8t8dA2E
 EYeVMMLCj1/fpjdLJzYspuOx7UFY3GgUtHh9Xnl2iNebkoBZLZ2Vwcz6wA+JnOFdKwOtZv9Nmtr
 Itf7rNpR4sbxs7VtoM07LgJwKlaHJLlxgLZa+3Y8XAnKpXI6+jZJte9JB3jLH3ax3u7MS7FV3y6
 wYzfcPZzslbjH4hOCzDzhZeMVrzzhao4aXp73qzeDyKpMytmtqAlICv++kHx+tXnWR9rrDqwR68
 ZL+QVKQEf4ULIPBo1ywZJsBWPAkxLHvkUnqqtrf/GSE+1vEF6znTMpbbCCZRMg==
X-Received: by 2002:a17:903:1b48:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-23f981404c6mr59177235ad.3.1753307203822; 
 Wed, 23 Jul 2025 14:46:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEifem4DTzHzvzmHJWifbcs4RdVeOJnOTJq0luVnu1W3g+TYFyHU5if7/jQbz053j1WkSaKAw==
X-Received: by 2002:a17:903:1b48:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-23f981404c6mr59176895ad.3.1753307203346; 
 Wed, 23 Jul 2025 14:46:43 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa48dc18fsm198195ad.133.2025.07.23.14.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:46:43 -0700 (PDT)
Message-ID: <820f45f1-9494-48eb-b536-7a8124de06f0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:16:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
 <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
 <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com>
 <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
 <CACSVV00d4rbNDOLVZJTBNRmUsGyY6Tkwzv0cHRomeYyMXWHZVA@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV00d4rbNDOLVZJTBNRmUsGyY6Tkwzv0cHRomeYyMXWHZVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8YGMvgJ3Eh93PfCnYOW86Q8oIVwkQZYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NiBTYWx0ZWRfX1qZyotIBOcxJ
 VxSamsED6ALCrRRLjDQINzvkX25M9aU/OTeW30r7jqBMnn1a27LYklf5LbMfZTpPFcTdBruJ6uK
 Tr2rQHTsgTLKpDEtHCVWGtsBUCt6CSAj2WBr06iDEvItYpmlHSJUezVHtvM633S7M0l7F/csIhu
 n2AeJt4ZC0EDuM+DZvIT/O3+LPraHtIOoDgxUqLBqQtLEhCAX6wGj451NqMuF+vsxbZ1YML+WEQ
 aB/J/R/SzZuGjw6ntzY8vzFWr6vQfQ4aXEEIYFj0NpdcA1W0XA4AxSfIUvhQKllWfTYVRcRcUUS
 jZOHU7HEubdWnU9VJ/HfkXcYVxn5LrzGIZ+Izz0RWBoFGH7ikY9vV9WIo00cZeoEaryi2SRcA2o
 6bvVf1dLJ63EnbfYxNCT+TPculkxv2Sq/y4oclNPB1VG+WbiiK0h1jHMCf6iLs9wBRqJPVZP
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=68815845 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=XTD9XnCZvQp0TTkZ5uwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 8YGMvgJ3Eh93PfCnYOW86Q8oIVwkQZYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230186
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

On 7/23/2025 1:43 AM, Rob Clark wrote:
> On Tue, Jul 22, 2025 at 12:23 PM Akhil P Oommen
> <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 7/22/2025 9:08 PM, Rob Clark wrote:
>>> On Tue, Jul 22, 2025 at 6:50 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
>>>>> When IFPC is supported, devfreq idling is redundant and adds
>>>>> unnecessary pm suspend/wake latency. So skip it when IFPC is
>>>>> supported.
>>>>
>>>> With this in place we have a dummy devfreq instance which does nothing.
>>>> Wouldn't it be better to skip registering devfreq if IFPC is supported
>>>> on the platform?
>>>
>>> devfreq is still scaling the freq.  What is being bypassed is
>>> essentially a CPU based version of IFPC (because on sc7180 we didn't
>>> have IFPC
>>>
>>> Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
>>> point those grew IFPC support we could remove the trickery to drop GPU
>>> to min freq when it is idle altogether.
>>
>> There are 2 functionalities here:
>> 1. Clamp-to-idle: enabled only on a618/7c3
>> 2. boost-after-idle: Enabled for all GPUs.
>>
>> With this patch, we are skipping both when IFPC is supported. In the
>> absence of latency due to clamp-to-idle, do you think a618 (relatively
>> weaker GPU) would require boost-after-idle to keep with the
>> UI/composition workload for its typical configuration (1080p@60hz)? If
>> yes, I should probably create a quirk to disable boost-after-idle for
>> premium tier GPUs, instead of tying it to IFPC feature.
> 
> Hmm, yeah.. I suppose _this_ patch should only skip clamp-to-idle.  It
> is a different topic, boost-after-idle.

I think we can just drop this patch. Also, Boost-after-idle is not super
bad as it is only doubling the gpu freq. We can try to optimize it
separately.

-Akhil.

> 
> BR,
> -R
> 
>> -Akhil.
>>
>>>
>>> BR,
>>> -R
>>>
>>>>>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> @@ -4,6 +4,7 @@
>>>>>   * Author: Rob Clark <robdclark@gmail.com>
>>>>>   */
>>>>>
>>>>> +#include "adreno/adreno_gpu.h"
>>>>>  #include "msm_gpu.h"
>>>>>  #include "msm_gpu_trace.h"
>>>>>
>>>>> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>>>>>       if (!has_devfreq(gpu))
>>>>>               return;
>>>>>
>>>>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>>>>> +             return;
>>>>>       /*
>>>>>        * Cancel any pending transition to idle frequency:
>>>>>        */
>>>>> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>>>>>       if (!has_devfreq(gpu))
>>>>>               return;
>>>>>
>>>>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>>>>> +             return;
>>>>> +
>>>>>       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
>>>>>                              HRTIMER_MODE_REL);
>>>>>  }
>>>>>
>>>>> --
>>>>> 2.50.1
>>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>

