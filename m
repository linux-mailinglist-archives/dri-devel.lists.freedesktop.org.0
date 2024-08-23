Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F195C244
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 02:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4CC10EBF0;
	Fri, 23 Aug 2024 00:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gPxZzOKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1E210E15E;
 Fri, 23 Aug 2024 00:19:54 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so179672466b.0; 
 Thu, 22 Aug 2024 17:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724372392; x=1724977192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AFn5gD+eI+oFc3WZUBSmujCGXwdn3up3L1zAyTOtMZs=;
 b=gPxZzOKroMsj1kpJgHkc5Ct03L7+dwrWvph8loKYuZUhk/iPJa4JJPcoHspZJD84He
 iFshfVCnqYZUVM+M3JM2wmFG2yteLM9vmpkSEVgVtT6XruYBDeKbLNkKpPg6qr4qnvhc
 AEvMbGGOo9Gpfr8n2oZ1ppYNzfNtQb4mW+HrXLU2n4ged1YM7/ivEaSilE8Hw3jimvVP
 YUiQ1kjz9qAqvcuGkj/jYlQLLunBFvJDeuRPHOG2fN/ibeOMZs/r4s79cNqjxIFSqaw9
 lR8T0xsbyhVGEmKPpUrnpeg/sgCcdzC66Bh8x5gkcXjfSem5RxsnK20YX5Dj8CSDDGXF
 Kt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724372392; x=1724977192;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AFn5gD+eI+oFc3WZUBSmujCGXwdn3up3L1zAyTOtMZs=;
 b=vUzrW3WWOL8s+jGs9PRg8R/mj/i/V+Bw5pIR8BeYOoD4fEtSBUXBJRZ5LUoqJaVH46
 JwSzlY76J8zqbR7krUdBcoCeVTlz4/IXgRIldA1dJCaOVXJUsL0bIOV0hU2bpmiTbGIm
 4ztke+8W5rgWKb2UcMd/LjDBmluC9dNl4G1pBasvO5/XD7DuQQNF1s8d/9oX6+nZgLaR
 QkwVYMtgD7MlRuvMdZcJpX9itMciarye9JIsFh6TYrnFsuymmhz/5QEblkC7Z1v36arJ
 biznfrRJsl3dZINbGgU5VC3C5Bdsjxko6A8zqrFW5wpJEcfWOcEB4di5935CF5Skw48E
 XzDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3EWouyEcY/NZAeruIUvngUdXQrJNE3nzWAWPTxvP//zhj5bcoYPYWZve4MHY/oClV640i2R22jCg=@lists.freedesktop.org,
 AJvYcCWps5XefezL0TmDHWxT2lvfFIhkukkYLs7QS9rshHGPmT15QItoQYPggf7tqNvM4BjSgenypAI5kU6p@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyqo1KVDz+UyAebQ5WNBAPm+iz2ZGTHIqhxUlfU0KUlvjYwnMib
 tQ/LLt4InvA3zN/fpO0hOdLt7T4RG+Dxc2Roh2OsOgNOwB+LmLCW
X-Google-Smtp-Source: AGHT+IGEdE1pbgGLiaspl7QobJK5Wc6J6u40OI9jibZkTpdAQBLwU1nX+HnLn66He1iLWtKUtIO7IQ==
X-Received: by 2002:a17:906:fe4b:b0:a7a:bae8:f2a1 with SMTP id
 a640c23a62f3a-a86a54899f5mr28977066b.42.1724372391803; 
 Thu, 22 Aug 2024 17:19:51 -0700 (PDT)
Received: from [192.168.1.14] (host-80-104-252-9.retail.telecomitalia.it.
 [80.104.252.9]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f4f6686sm179971366b.221.2024.08.22.17.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 17:19:51 -0700 (PDT)
Message-ID: <27840bd4-aac4-49ca-9c98-60913c352076@gmail.com>
Date: Fri, 23 Aug 2024 02:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
 <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
 <14591112-4455-49b4-8b1a-3feffc4d343f@gmail.com>
 <20240822192347.ffezairwoqqolssl@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240822192347.ffezairwoqqolssl@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 8/22/24 9:23 PM, Akhil P Oommen wrote:
> On Wed, Aug 21, 2024 at 04:34:15PM +0200, Antonino Maniscalco wrote:
>> On 8/19/24 10:08 PM, Akhil P Oommen wrote:
>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
>>>> This patch implements preemption feature for A6xx targets, this allows
>>>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>>>> hardware as such supports multiple levels of preemption granularities,
>>>> ranging from coarse grained(ringbuffer level) to a more fine grained
>>>> such as draw-call level or a bin boundary level preemption. This patch
>>>> enables the basic preemption level, with more fine grained preemption
>>>> support to follow.
>>>>
>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>> ---
>>>
>>> No postamble packets which resets perfcounters? It is necessary. Also, I
>>> think we should disable preemption during profiling like we disable slumber.
>>>
>>> -Akhil.
>>>
>>
>> You mention that we disable slumber during profiling however I wasn't able
>> to find code doing that. Can you please clarify which code you are referring
>> to or a mechanism through which the kernel can know when we are profiling?
>>
> 
> Please check msm_file_private_set_sysprof().
> 
> -Akhil
> 
>> Best regards,
>> -- 
>> Antonino Maniscalco <antomani103@gmail.com>
>>

I see, thank you. So as Connor said in the other message we want to 
distinguish the case of system profiling where we do want preemption and 
application level profiling where we do not want it. So sysprof is not 
the condition we want to check for to disable preemption, correct?

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

