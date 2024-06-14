Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3990888C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A82910ECC6;
	Fri, 14 Jun 2024 09:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RkLxmoOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38A310ECEA;
 Fri, 14 Jun 2024 09:53:41 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4217990f997so15844565e9.2; 
 Fri, 14 Jun 2024 02:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718358820; x=1718963620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mzyquRNJeDjPIcSxwRkIbgFNBrXQDW35DBUgbaSGKdw=;
 b=RkLxmoOBr6yJ0Ji0YTORnyPDOpBakSRwQdBdXECjT/CVErDfAzyVkICw94hFyolVBL
 upI8sIKM+IDBFh35dSR6gnXZsmOzsTkck/LIXIWWiKE5BFqqREHbkYQY7LARWH29HeKQ
 Qoj3TNxMpWydIScnmwX+JMrKClZAhlErDvGsNmAgBEIIWqyX7gMTnqIH69RNsQqnigfk
 74Qg1p4XGUBBxX451WHZGAGljppiIXqyuo7FV8X9CGYFBYXQHaB2nlCRCqI61SbkMq6H
 uI5SZsccN+0ZyZhGYffRhKFZCtL6ADC8dmKRvxDq1jCbekG6ua8+BrmYXB97C5sgZBu3
 9h2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358820; x=1718963620;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzyquRNJeDjPIcSxwRkIbgFNBrXQDW35DBUgbaSGKdw=;
 b=R726fZHJmixUkiVa+w7kt37s4g3vJ5ZVEAKNHQALBUKNxwhfbZoQoUKJ5PaBHP4+ur
 bov6S7VNxYR91LdFekzki/3+Rf/aydw5Es1U34PKUaAbuRHh9Dindj9UU0VGa8ew41yh
 ch2XLOAagjSUiAhiPvzYFlUq4VfSr6RW63LCky3EOJGaT2lntrlIqgEtjwfKWizGHFDd
 vuQd0LCi6xvIdR+ymqed66vnuCPu0in/KMmooKYCveEeBQqJSlIqPXqBUMyej9/7V5N1
 U0VQ9mW/C6/ilDgHt7pW9OQHxdRrIs3yFpEySqSLfPuI4H/83hgXmjOxoy5sRi6Nq1ZP
 fH9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsiVKOBxyzOWzlc3kOcgtJKFVnGUBImWCm05fBuOzz12x9u74+qjEQ8TwhKmMYdAoqG0TjOhW7+iLqDIOHAypUj+rPtrt5bmIZ1GSNyw==
X-Gm-Message-State: AOJu0YyRgqpz0Bd49F6xql2tV6bS1PHoG8VvzQDy65997odNRgxgQ81d
 zaHDMn82BSzcFnqRUU6iaduHw7svRSfoeYOSS5yoOS2yQlV8AkaV
X-Google-Smtp-Source: AGHT+IGZplExwjLiy67WDvWaoynVWsLfAOG1IDXF1p+9NYpxmsjkE9cxKgOHSWm8Q2u01Qkguws3dg==
X-Received: by 2002:a05:600c:4f8e:b0:422:683b:df54 with SMTP id
 5b1f17b1804b1-42305e2843fmr15098505e9.32.1718358819766; 
 Fri, 14 Jun 2024 02:53:39 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de653sm96042265e9.32.2024.06.14.02.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:53:39 -0700 (PDT)
Message-ID: <2ccb8b25-2351-4107-bd30-3ceee1e11645@gmail.com>
Date: Fri, 14 Jun 2024 11:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/amdgpu: always enable move threshold for BOs
To: Tvrtko Ursulin <tursulin@ursulin.net>, friedrich.vock@gmx.de
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20240604160503.43359-1-christian.koenig@amd.com>
 <20240604160503.43359-6-christian.koenig@amd.com>
 <b2c68930-b165-4d78-84d5-52415923e648@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <b2c68930-b165-4d78-84d5-52415923e648@ursulin.net>
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


>>           if (domain & abo->preferred_domains & 
>> AMDGPU_GEM_DOMAIN_VRAM &&
>> -            !(adev->flags & AMD_IS_APU))
>> -            places[c].flags |= TTM_PL_FLAG_FALLBACK;
>> +            !(adev->flags & AMD_IS_APU)) {
>> +            /*
>> +             * When GTT is just an alternative to VRAM make sure 
>> that we
>> +             * only use it as fallback and still try to fill up VRAM 
>> first.
>> +            */
>> +            if (abo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT)
>> +                places[c].flags |= TTM_PL_FLAG_FALLBACK;
>> +
>> +            /*
>> +             * Enable GTT when the threshold of moved bytes is
>> +             * reached. This prevents any non essential buffer move
>> +             * when the links are already saturated.
>> +             */
>> +            places[c].flags |= TTM_PL_FLAG_MOVE_THRESHOLD;
>> +        }
>
> For the APU case I *think* this works, but for discrete I am not sure 
> yet.

Agree, APUs are basically already fine as they are. VRAM is just used so 
that it isn't wasted there.

>
> As a side note and disclaimer, the TTM "resource compatible" logic has 
> a half-life of about one week in my brain until I need to almost 
> re-figure it all out. I don't know if it just me, but I find it really 
> non-intuitive and almost like double, triple, or even quadruple 
> negation way of thinking about things.

Yeah I was also going back and forth between the different approaches 
multiple times and just ended up in this implementation because it 
seemed to do what I wanted to have.

It's certainly not very intuitive what's going on here.

>
> It is not helping that with this proposal you set threshold on just 
> one of the possible object placements which further increases the 
> asymmetry. For me intuitive thing would be that thresholds apply to 
> the act of changing the current placement directly. Not indirectly via 
> playing with one of the placement flags dynamically.

Interesting idea, how would the handling then be? Currently we have only 
the stages - 'don't evict' and 'evict'. Should we make it something more 
like 'don't move', 'move', 'evict' ?

>
>
> Anyway, lets see.. So you set TTM_PL_FLAG_MOVE_THRESHOLD and 
> TTM_PL_FLAG_FALLBACK on the GTT placement, with the logic that it will 
> be considered compatible while under the migration budget?
>
> (Side note, the fact both flags are set I also find very difficult to 
> mentally model.)
>
> Say a buffer was evicted to GTT already. What then brings it back to 
> VRAM?
>
> The first subsequent ttm_bo_validate pass (!evicting) says GTT is fine 
> (applicable) while ctx->bytes_moved < ctx->move_threshold, no? Isn't 
> that the opposite of what would be required and causes nothing to be 
> migrated back in? What am I missing?

The flag says that GTT is fine when ctx->bytes_moved >= 
ctx->move_threshold. The logic is exactly inverted to what you described.

This way a BO will be moved back into VRAM as long as bytes moved 
doesn't exceed the threshold.

Setting both flags has the effect of saying: It's ok that the BO stays 
in GTT when you either above the move threshold or would have to evict 
something.

Regards,
Christian.

>
> Regards,
>
> Tvrtko

