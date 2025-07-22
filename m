Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2788B0E40F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 21:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E7710E065;
	Tue, 22 Jul 2025 19:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7LkkL52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F0C10E065
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:23:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MF5C0M018344
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y6OxZtp9vvZax/Q2qqYgpUgRGF5sEqL1kmgDnxhJH5c=; b=P7LkkL52ERTbjHsM
 LLHB4s9DlE2TsSs+B4PA8dwpR6Yx4ivpDYflwu+p+Wk/49kTHe+bGho87QCGVty9
 8pmGkd8M3cx1kpOOQ9wHWb5ODpfmKg3DvTcuiyArX1fxU44wmQ4JuO/IKsnQm1fS
 RtSBvCpxvI5OvR1g/AWZvbTPpnOiKof6eaOg8FdXCDdb3PgPu367Sr6BytaTJkN/
 YpVannprLo7ORZ8TvRuOAlP0qgZfMUUMxTDc4Musv3kpV9oGcbgwpy0QOqKFqLex
 z762B31vkHmx03C3wN+HsXAkZtDbtuYxMGUCsDcTCgkW3+KAHH9atn7757kvhYk1
 40j9Vg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na118n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:23:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-75e28bcec3bso2680849b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753212197; x=1753816997;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y6OxZtp9vvZax/Q2qqYgpUgRGF5sEqL1kmgDnxhJH5c=;
 b=Qkb8vF3HN2Ao7hVFi8a87zfA4lUc7h0DrIh6jY7C1JcGYuofUzqQ2pjwoioWSO4uri
 PqxX+5tTOIcXUzwcL4vWjjQ2mJqZSvk9LlTl6Zl7ywc2vVrJnTkNLWxK4d9N6qscTL3q
 QUrpYSYEhDtezGNqNBow8c05Jz4RDDsZsgq8UOnSO1W2cSsXvmNPLMGpdFrVSH5M5Xa/
 3Ndsah+ZoI1DuJVuhCONuimprDSt6gRUCCf8s7qazWrtvvzqqp8TbQ/4GOKCCqowH0gm
 Th4sKiSS956JaPGPU4kjzIGhNtarFF3jhIRUtHCqmi4RyG9rnX4s2Y5IXb6/G6ibKAxl
 Xz1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7PtxdnNb38WnR28oJwX3RRtOX+0YCI6i0rZsTY+citpJ+HLwBoLKP8Sdo8MPtitaGa1e0buqtx7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx34MtdNtxEJx/utKt5N5JN+/pD6TBuYDbfE9IV2yRqYfkRFUGa
 tg+NTcQB1yu0LCcNakaRDEGkG7UT742/VhXysy2xIBzLTqrj/4uOGOMBZSBsLeRCAOHDQFxPQLc
 hzWTMc5R5r7SCMj140hSoMn5V2Wp6JdF9D0cWUzIt9gVjqTcICBQ19JmqJJTDqM2YFO6KGxk=
X-Gm-Gg: ASbGncs3CZS2bX5A6qdZshlRqkRd7erW9CQ97IM2FteZ2er3gmv19kzdkUaYAYO43Sl
 hZ55ErbCXcFikFMfQHHc7RhABsnvVBfOGfHpo7YncRUerKy+K8LJOcbHyHb/3i1d2krxR8VCuuD
 QE5TwmmByDUwFvEfpNYA0MHCMiyNA+4WsVGYsFuV06QSOpgRj8HwKkRiGzieG2Xem1evN1UDvy1
 p9ICi9AfZzX2dcYIFPyTiBh3p0GQX5BN42vuQNgxO+jdV1ktUQL6pc62x8lV2M6rhyeTQwOCMZH
 IMGyo5yuFWO7ctlSxas+5sjX0uPIziz6tb2+UmB+UXaOLeXODBjtk7GdHpbjYhHw
X-Received: by 2002:a05:6a00:1909:b0:736:5b85:a911 with SMTP id
 d2e1a72fcca58-76034c4da07mr691852b3a.8.1753212196492; 
 Tue, 22 Jul 2025 12:23:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZto37mgHShkAsmIcFVd1Yhzk4xGY6Lskz4Tb57kthENKf/xIJ68iAYMK1aJLYGAgBaOdIuA==
X-Received: by 2002:a05:6a00:1909:b0:736:5b85:a911 with SMTP id
 d2e1a72fcca58-76034c4da07mr691818b3a.8.1753212195961; 
 Tue, 22 Jul 2025 12:23:15 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb1569f5sm8187912b3a.80.2025.07.22.12.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 12:23:15 -0700 (PDT)
Message-ID: <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 00:53:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: rob.clark@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1Q1SfCA_2parLCjq71eZI5T-NSVndgPr
X-Proofpoint-ORIG-GUID: 1Q1SfCA_2parLCjq71eZI5T-NSVndgPr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE2NiBTYWx0ZWRfXxogg9I1o5QuK
 zb+CjyibMsXrehYd2IIwEx2qRcxf237rmFpC0tJu7qvbh70+oqoBYwm6flt6OOR+xCsMutmU+QP
 wR4hj6qYY95UAA36PP9wkMiG+kVVHXo5aZ3353hO9m8U4Yc85d9cRedClxcS9O9/vsbndBKABsq
 NamHQUoRYmjDEPSzLyanpxG2T5HihfXn2ReCiTBO9eehAe06FYjmo98Ado7pO4XI2fIXr/m7OFi
 wP8JZv7GiUGO6DzJ/FaWX6NWSY6ZQV4jZPh6+T182xacCpkiFS9/GA7o5R8z/+fSGh5ny/nhpOi
 yzACTPneKu5JqtVCNUer4Ij2pTiHPXya6qMjSGY3WLKxr67r98/AFSLPtcorV0+knrDC/jgrp4Q
 79KKSkKCKRoR6NP9NG3M3WnOsj8mq+A9gwo5htg/7fZqv52k5JHuu+4VWIJi0eHq+slbPNWA
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687fe525 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=blXxefCSwbONkpe3GJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220166
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

On 7/22/2025 9:08 PM, Rob Clark wrote:
> On Tue, Jul 22, 2025 at 6:50 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
>>> When IFPC is supported, devfreq idling is redundant and adds
>>> unnecessary pm suspend/wake latency. So skip it when IFPC is
>>> supported.
>>
>> With this in place we have a dummy devfreq instance which does nothing.
>> Wouldn't it be better to skip registering devfreq if IFPC is supported
>> on the platform?
> 
> devfreq is still scaling the freq.  What is being bypassed is
> essentially a CPU based version of IFPC (because on sc7180 we didn't
> have IFPC
> 
> Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
> point those grew IFPC support we could remove the trickery to drop GPU
> to min freq when it is idle altogether.

There are 2 functionalities here:
1. Clamp-to-idle: enabled only on a618/7c3
2. boost-after-idle: Enabled for all GPUs.

With this patch, we are skipping both when IFPC is supported. In the
absence of latency due to clamp-to-idle, do you think a618 (relatively
weaker GPU) would require boost-after-idle to keep with the
UI/composition workload for its typical configuration (1080p@60hz)? If
yes, I should probably create a quirk to disable boost-after-idle for
premium tier GPUs, instead of tying it to IFPC feature.

-Akhil.

> 
> BR,
> -R
> 
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> @@ -4,6 +4,7 @@
>>>   * Author: Rob Clark <robdclark@gmail.com>
>>>   */
>>>
>>> +#include "adreno/adreno_gpu.h"
>>>  #include "msm_gpu.h"
>>>  #include "msm_gpu_trace.h"
>>>
>>> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>>>       if (!has_devfreq(gpu))
>>>               return;
>>>
>>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>>> +             return;
>>>       /*
>>>        * Cancel any pending transition to idle frequency:
>>>        */
>>> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>>>       if (!has_devfreq(gpu))
>>>               return;
>>>
>>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>>> +             return;
>>> +
>>>       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
>>>                              HRTIMER_MODE_REL);
>>>  }
>>>
>>> --
>>> 2.50.1
>>>
>>
>> --
>> With best wishes
>> Dmitry

