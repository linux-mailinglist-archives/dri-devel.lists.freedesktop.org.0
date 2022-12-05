Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB22643515
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 20:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0AF10E044;
	Mon,  5 Dec 2022 19:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B55B10E044;
 Mon,  5 Dec 2022 19:58:28 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bj12so1044334ejb.13;
 Mon, 05 Dec 2022 11:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fUBYd+/OIOUoGkMQoiRVXH5I+1PP1uRFia3yCcoalZ4=;
 b=XXrwY0YM3B7+X4pSxHygI+I1cq4Yw9xOXvPZGgoFmB8o+AOsZ5H8iTrKiEbQksUgFS
 K3lGp/fw9q3VRdhlvQn/ykYLcnp6AVOxK67OMAPfy9TwMu9AnHqZ5eSGhpzEMyxA8+yc
 J7RwnFBq2+JIscct+2UcHchG/pgC5G/utrP2gf1ELGrACG/xi5vAUQiAyVcto0pb6NLj
 fqBWbONKBxnqRTdMb6M+7YmgAYZI2iwrmQpjf5zoFtbZpuU9nYBqT1coztCi4Rveh1uK
 Y5H5KYKH9ewMRd+liTbt2BIJt9czH+iafqtbKAnN5TOVFcqIq2+JrZYP3WIfCN9friRd
 VMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fUBYd+/OIOUoGkMQoiRVXH5I+1PP1uRFia3yCcoalZ4=;
 b=MoF2d6BiEvWjWR170FiJy768/wjQQ94qindoB4gjC87XAeMur27j0XEBsgpvpurpBK
 r/P7Oe2WyOqMSL6l6gEQMXPdT1BcYlf0x/H93lb5Ygs97nnr+Bfv3eFnVwZUBQMC+N/P
 0PTMgJjPsfZRuagNDxb3NXBEhTbHUorsZQZ/TlXEuEdA9qbr31gSAAPaCgSwC828ztdY
 1nN/7q9DfF9j2v1MGpQLWbyF68a3lX6h0rLlFnLqH72baVog+6i1722crn3P2c7tA5UA
 FB6XC8shXiWvnkjPaGLNg7TN6Nx8KsqAnqDmgI9Q+FSfk3EIBCtvjDaFJsRXko0p1lj3
 5yDA==
X-Gm-Message-State: ANoB5pmOLG2U0mR0K0W41JEV1KUcYAjjhsNqVNrXvoV0jsoJXK0H4pGN
 fN0TNPYhGV7/6Cc+ERKeXs7ARyHe8k8=
X-Google-Smtp-Source: AA0mqf5dfmLWWpz8o4OinUDoOSU7iY32aAcmG20SvPQfankEuNet4/4vs/Inkm9eWS0M7bGWOrI94Q==
X-Received: by 2002:a17:906:b34a:b0:755:6595:cd34 with SMTP id
 cd10-20020a170906b34a00b007556595cd34mr58857884ejb.70.1670270307068; 
 Mon, 05 Dec 2022 11:58:27 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:7d4e:4122:f56a:39c2?
 ([2a02:908:1256:79a0:7d4e:4122:f56a:39c2])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a170906c00f00b0078c213ad441sm6620351ejz.101.2022.12.05.11.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 11:58:26 -0800 (PST)
Message-ID: <4514ca57-e39e-d684-3101-fddf57b0c89a@gmail.com>
Date: Mon, 5 Dec 2022 20:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: stop using ttm_bo_wait
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-7-christian.koenig@amd.com>
 <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
 <CAM0jSHMKBb3orp8Ez4sC8TNcjPZF9y-4e12Jy6SPqbJonhYVhw@mail.gmail.com>
 <d03545c9-d0cb-5bdb-24e8-9eadcda51b83@linux.intel.com>
 <CAKMK7uHf1yvpS5JWzF2JASkXuZwyvpzWw66w9sYe19_+VqMHeA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAKMK7uHf1yvpS5JWzF2JASkXuZwyvpzWw66w9sYe19_+VqMHeA@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.william.auld@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.11.22 um 15:06 schrieb Daniel Vetter:
> On Wed, 30 Nov 2022 at 14:03, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>> On 29/11/2022 18:05, Matthew Auld wrote:
>>> On Fri, 25 Nov 2022 at 11:14, Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>> + Matt
>>>>
>>>> On 25/11/2022 10:21, Christian König wrote:
>>>>> TTM is just wrapping core DMA functionality here, remove the mid-layer.
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>     drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++++---
>>>>>     1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> index 5247d88b3c13..d409a77449a3 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> @@ -599,13 +599,16 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>>>>>     static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
>>>>>     {
>>>>>         struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>>>>> -     int err;
>>>>> +     long err;
>>>>>
>>>>>         WARN_ON_ONCE(obj->mm.madv == I915_MADV_WILLNEED);
>>>>>
>>>>> -     err = ttm_bo_wait(bo, true, false);
>>>>> -     if (err)
>>>>> +     err = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
>>>>> +                                 true, 15 * HZ);
>>>> This 15 second stuck out a bit for me and then on a slightly deeper look
>>>> it seems this timeout will "leak" into a few of i915 code paths. If we
>>>> look at the difference between the legacy shmem and ttm backend I am not
>>>> sure if the legacy one is blocking or not - but if it can block I don't
>>>> think it would have an arbitrary timeout like this. Matt your thoughts?
>>> Not sure what is meant by leak here, but the legacy shmem must also
>>> wait/block when unbinding each VMA, before calling truncate. It's the
>> By "leak" I meant if 15s timeout propagates into some code paths visible
>> from userspace which with a legacy backend instead have an indefinite
>> wait. If we have that it's probably not very good to have this
>> inconsistency, or to apply an arbitrary timeout to those path to start with.
>>
>>> same story for the ttm backend, except slightly more complicated in
>>> that there might be no currently bound VMA, and yet the GPU could
>>> still be accessing the pages due to async unbinds, kernel moves etc,
>>> which the wait here (and in i915_ttm_shrink) is meant to protect
>>> against. If the wait times out it should just fail gracefully. I guess
>>> we could just use MAX_SCHEDULE_TIMEOUT here? Not sure if it really
>>> matters though.
>> Right, depends if it can leak or not to userspace and diverge between
>> backends.
> Generally lock_timeout() is a design bug. It's either
> lock_interruptible (or maybe lock_killable) or try_lock, but
> lock_timeout is just duct-tape. I haven't dug in to figure out what
> should be here, but it smells fishy.

Independent of this discussion could I get an rb for removing 
ttm_bo_wait() from i915?

Exactly hiding this timeout inside TTM is what always made me quite 
nervous here.

Regards,
Christian.

> -Daniel

