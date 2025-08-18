Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537BAB2A897
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 16:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E1610E459;
	Mon, 18 Aug 2025 14:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/UeaWEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B89F10E456
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8BPFT006751
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 chLwK+SsPQhHTytM+7iGONL6X0o4wGCEiPMrGgw75ts=; b=D/UeaWEpAUWr/gmE
 WZwGHoUPLUcKr79Zd51wp7wQI0dwsdSBaOAHu78btslcr/KrdR/bGGhyK46HZqo+
 d7CcZ88NvoPaijN+ZaCV8SJ4Zoj3k42YheITNwu2EepURGBWsBIFaUTcebUiIHLb
 veAudXcNEk8HxCuQxsDLGlmR4tPaVw/UrcHpJ59RwxUDMnybMAmOYjfuT2tRS3YF
 +Z7W4DKOF2aMyJ98APKMORCikS8re5V3SDR/IIxj1CzopHIGKJgRGXIXnNxACm9e
 Crv+BISMW5jApN6gq6ZqrIOVlOMeklP7vUddhJ/ES0OIpOdFZGY5XWuNmliBTg3v
 RSDmFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagvx9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e1fc66de5so4516715b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755526020; x=1756130820;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=chLwK+SsPQhHTytM+7iGONL6X0o4wGCEiPMrGgw75ts=;
 b=XDL54amld6NL4nabhUeIFmgv+WhBoCxyx/996udUGiF5juSfnoY7LNMvQpVLiU2NbH
 H/aTyHsDc3pX7XjN1eHa2R4SmWa6ZycYJNCNjdTVFfaExsh5Fsvj+SVNJG5kCArQe47d
 OyzVz+WuTcmpKpMx8zdGha0OWzPbA7dpejT1wnYAE3COY2+BDIgJdUuqIydo035zj/M1
 LTJP2cgI7BYNY+5u/Bym6IW7shmHeZsHyet3W4/6TBa931TSrpzzZ6MRbpVhlHHiqtnI
 JqEg0NVuPvzzoB6wpwGK6CFlw3GyJdXErK57EeLOHn7JJU6WRxpLw83fWGX9DBRu0Htn
 yXPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDlbeUBZBpQA9rq1nsjabM42bYJW29vqd8EoAZzhuUVnJssTS+PDhAsvjoP2uPwJpEVtaxA8YbQnA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTB8VFCxsJ/pxLPbvbN1BucoLeeM+LXOoxDyxWA6mmEkAEG3WI
 A2eozJNZuK2ODb3Mjg9jEWI60/nBQWDh6c/9Eyzkb5iviYvYBwYGERV9Y+UeRdH8FQE3VJ4xd1Y
 B2lcKfvXNQpryJXf/a1n+NKBe2HzOLejZXy4pDA8o75jYzYoYQG2LOIEKj3bq/NKpKrY9s3A=
X-Gm-Gg: ASbGncsT58QQrnVF31FdTnL2qUJPvELP0yIEB/p5VNbF9VowqNTHJSpJ2syBXGmY/xK
 AcS9SZlPGb+tAgHX7oflbLVCuPRHCnqdNO3BeW4fefqhL8a68PbWI3K5TQyA9fNd6xKrOjPBTij
 u74+H4/xCPVBNKx+IngtuiOGfv/myA5Fjr7uqOP2qNtPrqoHO5rIoGxe4/WpJycF6/Q0NIatcEP
 dMfgAw+KhA5+Jzn3NbEeF+PFkqDwDNTdM51O9GCmq+b8NPtAoIWsAH6yFBHlf5uQ/yh2waVi95U
 b7rpj22ZiRd2okmkDxvNK0un8dfg/gfVE66aEDUUfD3XNSkpzRgTbM7pdZtS/l1g
X-Received: by 2002:a05:6a00:14cc:b0:736:4e14:8ec5 with SMTP id
 d2e1a72fcca58-76e438f0ec5mr15651399b3a.11.1755526019860; 
 Mon, 18 Aug 2025 07:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaW5O7M2POFlUVEtIHKn+I++/iHZWm/6mA4hEC46cPlJZweEv7D5U88CqdrtLREpBxLoXmhw==
X-Received: by 2002:a05:6a00:14cc:b0:736:4e14:8ec5 with SMTP id
 d2e1a72fcca58-76e438f0ec5mr15651177b3a.11.1755526017550; 
 Mon, 18 Aug 2025 07:06:57 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e45588c05sm7492056b3a.82.2025.08.18.07.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 07:06:57 -0700 (PDT)
Message-ID: <9f94c6d7-7b39-455c-83d1-81c694672775@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 19:36:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: skip re-emitting IBs for unusable VMs
To: rob.clark@oss.qualcomm.com, Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
 <272d2a39-19ce-4ac5-b3c6-3e3d6d9985c5@oss.qualcomm.com>
 <CACSVV00Yo=cZxUztB5Jf7153bsnnuATrh3L1utw4SrOQmYERug@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV00Yo=cZxUztB5Jf7153bsnnuATrh3L1utw4SrOQmYERug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a33385 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=1QxSUWC4Tu4TNCmoOX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: kumFVnN09DYIT1HFEvND7Wh0WjYYVYDL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfXw13B9WfI6vlS
 /3JvrJa/UTQ+Qzn0ZTPaOsnnB3qV8W1YfEjtP+KJIqi/cOr7+n3K4fEEbtEHoAHn+cR7apJwu1Y
 645xiBXYUfzFAGQr5DWVm47qERoIR5elL8kZXrdfVTX/8D/zDUiknGfuxQAn+35Decev9EOCQAl
 e/kEGgRvakwS/ksKMVGN3AiOvLMfCYu59ZiJuqhfQFBosd1M9+U957/YL6I1wSl1vQu/Rt5sA2m
 9ImX82e/hT/EzxnzBqzap5D7zDw1KQ3OgCn+4h1USTVr/h2J9WgcGy3WbepeTFLKic30Bh9Kos+
 WNzX0JproNq0LZQJ+vcaJb26+IooKREr+n2vH/MozHUfr3xmTVggumP13V97mvLlDeA0KVxoiNW
 DMKVZ0Av
X-Proofpoint-GUID: kumFVnN09DYIT1HFEvND7Wh0WjYYVYDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
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

On 8/18/2025 6:48 PM, Rob Clark wrote:
> On Mon, Aug 18, 2025 at 5:10 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 8/13/2025 6:34 PM, Antonino Maniscalco wrote:
>>> When a VM is marked as an usuable we disallow new submissions from it,
>>> however submissions that where already scheduled on the ring would still
>>> be re-sent.
>>>
>>> Since this can lead to further hangs, avoid emitting the actual IBs.
>>>
>>> Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>> ---
>>>  drivers/gpu/drm/msm/msm_gpu.c | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>> index c317b25a8162edba0d594f61427eac4440871b73..e6cd85c810bd2314c8bba53644a622464713b7f2 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>> @@ -553,8 +553,15 @@ static void recover_worker(struct kthread_work *work)
>>>                       unsigned long flags;
>>>
>>>                       spin_lock_irqsave(&ring->submit_lock, flags);
>>> -                     list_for_each_entry(submit, &ring->submits, node)
>>> +                     list_for_each_entry(submit, &ring->submits, node) {
>>> +                             /*
>>> +                              * If the submit uses an unusable vm make sure
>>> +                              * we don't actually run it
>>> +                              */
>>> +                             if (to_msm_vm(submit->vm)->unusable)
>>> +                                     submit->nr_cmds = 0;
>>
>> Just curious, why not just retire this submit here?
> 
> Because then you'd end up with submits retiring out of order (ie.
> fences on the same timeline signaling out of order)

Yeah, that makes sense.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> 
> BR,
> -R
> 
>> -Akhil
>>
>>>                               gpu->funcs->submit(gpu, submit);
>>> +                     }
>>>                       spin_unlock_irqrestore(&ring->submit_lock, flags);
>>>               }
>>>       }
>>>
>>> ---
>>> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
>>> change-id: 20250813-unusable_fix_b4-10bde6f3b756
>>>
>>> Best regards,
>>

