Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D571F6D520A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 22:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E37F10E53C;
	Mon,  3 Apr 2023 20:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F20310E19C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 20:15:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j24so30658250wrd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1680552924;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+2/apUlJWp8bxcZrHIpzP1gcPTgZpNx4ofb9IcPTnnA=;
 b=R0RPIIPEfXeqEn6F2kyMIwVIt2ZJWVlaXIUKodLW7pKgW+NjvrvSinnbqtv8sBacNu
 AiszTu2THszGvunEtQcIXDsVbBd+nxXW4G5UNVF9E9AYk4ndN4GB/9hglawJk8JKeoaS
 bIPkxDx4+yx3xMdZQGoE8URK67EuLBMl0zdDg1bKAKhqEG8vuAKxtpy6aHYbe5ajpUkq
 GXOnT9t+XDi7mL/992jhEWO4h7h3zlbtbexZHlcUoosef/EN6eSoVGdXTUZJmmc9wRoW
 akMOLTHCqZAEjwKVZN9JOC5ABJfbVettYqe2+sZ4m6cCYvUtyNpItn7LcN9m0DwsScjm
 Oqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680552924;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+2/apUlJWp8bxcZrHIpzP1gcPTgZpNx4ofb9IcPTnnA=;
 b=KFD1RJpUKgloixlxgNKmurhzABiCf1c7gQpR2VXGQfpeSKzdxwiMrvdHRZ9JXzXcZs
 VeB24Wfhs6RnaJ1a4NRGHRKhswQdMBdddUXabgGn/o9htKw9U4F0K2HrPJVM2ovy4yxd
 emL1mwbdNyDl9Uz6NQps6fULeHdfHW/+S1DZBtYUiywwAbJGa93Q7PmQrWa2LlZqa3v2
 n6cGIgZvquDnY60DQ5v0WhQoCckIKekCZFZvX+rZZkhJS1dEAOv+gjgH0pUnuNKLeYvd
 Wc/fHwa0hQKAz3S2joTJ7yKn1XQ96pTzzQ7VFb0LYVbp+y7CBgx91/lGjO4vE7dvw9T/
 9WTw==
X-Gm-Message-State: AAQBX9dohmt3kyWj5ld2enhpX706AmHNBCyCY1PU0/6Cip+kSesQjD2G
 OzryGDsuIB7iBTQe0kLvMI/VmwhQgQ+UrYb6ZPI=
X-Google-Smtp-Source: AKy350ap3UyyRf69xECqcCr94gpGgE0vlIV3XHIhPMvr+mCmcgZyQ9eSHbyDyGyktqd62b8x/sCuXQ==
X-Received: by 2002:adf:f2c6:0:b0:2d1:5b75:28f0 with SMTP id
 d6-20020adff2c6000000b002d15b7528f0mr26373991wrp.39.1680552924005; 
 Mon, 03 Apr 2023 13:15:24 -0700 (PDT)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b002cfe685bfd6sm10418772wrv.108.2023.04.03.13.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 13:15:23 -0700 (PDT)
Message-ID: <09e2e192-6d24-23d5-1668-d6ac24c4136a@froggi.es>
Date: Mon, 3 Apr 2023 21:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/4] uapi, drm: Add and implement RLIMIT_GPUPRIO
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20230403194058.25958-1-joshua@froggi.es>
 <1567fb39-47a7-d1d5-0652-371f7ffcb71e@amd.com>
Content-Language: en-US
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <1567fb39-47a7-d1d5-0652-371f7ffcb71e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 4/3/23 20:54, Christian König wrote:
> Am 03.04.23 um 21:40 schrieb Joshua Ashton:
>> Hello all!
>>
>> I would like to propose a new API for allowing processes to control
>> the priority of GPU queues similar to RLIMIT_NICE/RLIMIT_RTPRIO.
>>
>> The main reason for this is for compositors such as Gamescope and
>> SteamVR vrcompositor to be able to create realtime async compute
>> queues on AMD without the need of CAP_SYS_NICE.
>>
>> The current situation is bad for a few reasons, one being that in order
>> to setcap the executable, typically one must run as root which involves
>> a pretty high privelage escalation in order to achieve one
>> small feat, a realtime async compute queue queue for VR or a compositor.
>> The executable cannot be setcap'ed inside a
>> container nor can the setcap'ed executable be run in a container with
>> NO_NEW_PRIVS.
>>
>> I go into more detail in the description in
>> `uapi: Add RLIMIT_GPUPRIO`.
>>
>> My initial proposal here is to add a new RLIMIT, `RLIMIT_GPUPRIO`,
>> which seems to make most initial sense to me to solve the problem.
>>
>> I am definitely not set that this is the best formulation however
>> or if this should be linked to DRM (in terms of it's scheduler
>> priority enum/definitions) in any way and and would really like other
>> people's opinions across the stack on this.
>>
>> Once initial concern is that potentially this RLIMIT could out-live
>> the lifespan of DRM. It sounds crazy saying it right now, something
>> that definitely popped into my mind when touching `resource.h`. :-)
>>
>> Anyway, please let me know what you think!
>> Definitely open to any feedback and advice you may have. :D
> 
> Well the basic problem is that higher priority queues can be used to 
> starve low priority queues.
> 
> This starvation in turn is very very bad for memory management since the 
> dma_fence's the GPU scheduler deals with have very strong restrictions.
> 
> Even exposing this under CAP_SYS_NICE is questionable, so we will most 
> likely have to NAK this.

This is already exposed with CAP_SYS_NICE and is relied on by SteamVR 
for async reprojection and Gamescope's composite path on Steam Deck.

Having a high priority async compute queue is really really important 
and advantageous for these tasks.

The majority of usecases for something like this is going to be a 
compositor which does some really tiny amount of work per-frame but is 
incredibly latency dependent (as it depends on latching onto buffers 
just before vblank to do it's work)

Starving and surpassing work on other queues is kind of the entire 
point. Gamescope and SteamVR do it on ACE as well so GFX work can run 
alongside it.

- Joshie 🐸✨

> 
> Regards,
> Christian.
> 
>>
>> Thanks!
>>   - Joshie
>>
>> Joshua Ashton (4):
>>    drm/scheduler: Add DRM_SCHED_PRIORITY_VERY_HIGH
>>    drm/scheduler: Split out drm_sched_priority to own file
>>    uapi: Add RLIMIT_GPUPRIO
>>    drm/amd/amdgpu: Check RLIMIT_GPUPRIO in priority permissions
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 13 ++++++--
>>   drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
>>   fs/proc/base.c                          |  1 +
>>   include/asm-generic/resource.h          |  3 +-
>>   include/drm/drm_sched_priority.h        | 41 +++++++++++++++++++++++++
>>   include/drm/gpu_scheduler.h             | 14 +--------
>>   include/uapi/asm-generic/resource.h     |  3 +-
>>   7 files changed, 58 insertions(+), 19 deletions(-)
>>   create mode 100644 include/drm/drm_sched_priority.h
>>
> 

