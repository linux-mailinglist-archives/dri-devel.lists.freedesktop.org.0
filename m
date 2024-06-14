Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D6908F9E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435A710EDC3;
	Fri, 14 Jun 2024 16:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="jIkYU4zx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AED10EDC3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:06:34 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-421eab59723so18380645e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1718381193; x=1718985993;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i+JqHug5d7cot4iJgD07g9m5oxp0jggG1AjOq9pmgcY=;
 b=jIkYU4zx5J/SwOsTYVQJxBY6NhtPM52FOoFNGsnGkGyRjD/m/2mtMs1tmPY/6o+89f
 OcAiJ0WvMlAuMpenoGyAEbHr4GYOvQutCUOr6E33dn/H2ojTHZvLPrywz0bitUGObOMX
 +f7UVj8LbuQxvGlSLTodEY1BM5XxddntNrwbUL+p5e5znkKWjIVUxqveohlt4yRGkcvd
 xoRz/ZhNwJJp4lvTEKUjIcsBrLHc3pJYpKeI+plxPO4FgR5FtmTwcoTdltNpZfLxLOeA
 t5nDzdfSLP4OFC3pCW+szqf7TMqK10VNpxZdJ7P8/FwuFzuKnbDLJPx60+FOwOb3zqcF
 9ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718381193; x=1718985993;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i+JqHug5d7cot4iJgD07g9m5oxp0jggG1AjOq9pmgcY=;
 b=dJBhsenk57r1h0bp17FcMlVsMNkblqqyL0PwNAzXCq47WPCshZOmqOmYyKM2N4ahyD
 MwqSGG2P5Ty0WhBTvtqg5q3jiF/zYufnnTD1qSgCSmPdWEB/EQj9P17Xys4Sh9ZUEw7e
 4CrRcqPHdt67wE+RGV9yM3eiSa0voe0M40Q66eu72HaSyfi0mLfDiy5l7zjyxVIsgY+/
 mZVznMx29CqaAY29Cs12Su4/P6bND5i1XwPwx3c4SwUBNAmCx9I6gGgaoNXXL92hDoQj
 rAR0nruMIUHTBjjEj47J0OlkVzTbkliCGBRaIJUNZBH4qq+SK79Q9zKd1Brvfx9AII3Z
 2t9A==
X-Gm-Message-State: AOJu0Yw7nOWk0sBdPWPhkLZbTHvAYoNJiwe1qQS012E6R6o7FSq1giuU
 84BK4MCQNyXj+P3e3nJszbbMlmom8TmHDBqtBAXyKW//5WoOgQUoUoolJse2i8M=
X-Google-Smtp-Source: AGHT+IGxRMUEL5uB9SAgOwtITRQjCB3vvTNtoX5puaJVgbaww8t1MUmtvxA44iZIEfM3On0iZwlslQ==
X-Received: by 2002:a05:600c:444f:b0:422:5b78:1c8f with SMTP id
 5b1f17b1804b1-42304811928mr27715555e9.8.1718381192678; 
 Fri, 14 Jun 2024 09:06:32 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de653sm109841455e9.32.2024.06.14.09.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 09:06:32 -0700 (PDT)
Message-ID: <fb6cc99c-74ad-468e-80ad-a1a938d1dc52@ursulin.net>
Date: Fri, 14 Jun 2024 17:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/amdgpu: always enable move threshold for BOs
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20240604160503.43359-1-christian.koenig@amd.com>
 <20240604160503.43359-6-christian.koenig@amd.com>
 <b2c68930-b165-4d78-84d5-52415923e648@ursulin.net>
 <2ccb8b25-2351-4107-bd30-3ceee1e11645@gmail.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <2ccb8b25-2351-4107-bd30-3ceee1e11645@gmail.com>
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


On 14/06/2024 10:53, Christian König wrote:
> 
>>>           if (domain & abo->preferred_domains & 
>>> AMDGPU_GEM_DOMAIN_VRAM &&
>>> -            !(adev->flags & AMD_IS_APU))
>>> -            places[c].flags |= TTM_PL_FLAG_FALLBACK;
>>> +            !(adev->flags & AMD_IS_APU)) {
>>> +            /*
>>> +             * When GTT is just an alternative to VRAM make sure 
>>> that we
>>> +             * only use it as fallback and still try to fill up VRAM 
>>> first.
>>> +            */
>>> +            if (abo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT)
>>> +                places[c].flags |= TTM_PL_FLAG_FALLBACK;
>>> +
>>> +            /*
>>> +             * Enable GTT when the threshold of moved bytes is
>>> +             * reached. This prevents any non essential buffer move
>>> +             * when the links are already saturated.
>>> +             */
>>> +            places[c].flags |= TTM_PL_FLAG_MOVE_THRESHOLD;
>>> +        }
>>
>> For the APU case I *think* this works, but for discrete I am not sure 
>> yet.
> 
> Agree, APUs are basically already fine as they are. VRAM is just used so 
> that it isn't wasted there.

Well yeah it works, but because re-validation is broken so it cannot hit 
the broken migration budget. ;)

>> As a side note and disclaimer, the TTM "resource compatible" logic has 
>> a half-life of about one week in my brain until I need to almost 
>> re-figure it all out. I don't know if it just me, but I find it really 
>> non-intuitive and almost like double, triple, or even quadruple 
>> negation way of thinking about things.
> 
> Yeah I was also going back and forth between the different approaches 
> multiple times and just ended up in this implementation because it 
> seemed to do what I wanted to have.
> 
> It's certainly not very intuitive what's going on here.
> 
>>
>> It is not helping that with this proposal you set threshold on just 
>> one of the possible object placements which further increases the 
>> asymmetry. For me intuitive thing would be that thresholds apply to 
>> the act of changing the current placement directly. Not indirectly via 
>> playing with one of the placement flags dynamically.
> 
> Interesting idea, how would the handling then be? Currently we have only 
> the stages - 'don't evict' and 'evict'. Should we make it something more 
> like 'don't move', 'move', 'evict' ?

Intuitively I would think "don't move" aligns with the "out of migration 
budget" concept.

Since in this patch you add move_threshold to ttm_operation_context 
could it simply be used as the overall criteria if it is set?

In a way like:

  1. If the current placement is from the list of userspace supplied 
valid ones, and
  2. Migration limit has been set, and
  3. It is spent.

-> Then just don't migrate, return "all is good" from ttm_bo_validate.

Though I am not sure at the moment how that would interact with the 
amdgpu_evict_flags and placements userspace did not specify.

>> Anyway, lets see.. So you set TTM_PL_FLAG_MOVE_THRESHOLD and 
>> TTM_PL_FLAG_FALLBACK on the GTT placement, with the logic that it will 
>> be considered compatible while under the migration budget?
>>
>> (Side note, the fact both flags are set I also find very difficult to 
>> mentally model.)
>>
>> Say a buffer was evicted to GTT already. What then brings it back to 
>> VRAM?
>>
>> The first subsequent ttm_bo_validate pass (!evicting) says GTT is fine 
>> (applicable) while ctx->bytes_moved < ctx->move_threshold, no? Isn't 
>> that the opposite of what would be required and causes nothing to be 
>> migrated back in? What am I missing?
> 
> The flag says that GTT is fine when ctx->bytes_moved >= 
> ctx->move_threshold. The logic is exactly inverted to what you described.
> 
> This way a BO will be moved back into VRAM as long as bytes moved 
> doesn't exceed the threshold.

I'm afraid I need to sketch it out... If buffer is currently in GTT and 
placements are VRAM+GTT.

ttm_bo_validate(evicting=false)

1st iteration:
res=GTT != place=VRAM
    continue

2nd iteration:
res=GTT == place=GTT+FALLBACK+THRESHOLD

ttm_place_applicable(GTT)
   moved < threshold
     return true

Buffer stays in GTT while under migration budget -> wrong, no? Or am I 
still confused?

Regards,

Tvrtko

> Setting both flags has the effect of saying: It's ok that the BO stays 
> in GTT when you either above the move threshold or would have to evict 
> something.
> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
> 
