Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B857CA5AE2
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 00:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2485810E9E2;
	Thu,  4 Dec 2025 23:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gCF13Wg8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A89C10E9E2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 23:20:19 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-3e80c483a13so1169363fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 15:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1764890417; x=1765495217;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ilabqU0ZPIRb1Uuq8o42HfQ+CvcrcgaYSOj/pymfPA=;
 b=gCF13Wg8z/53oQuUm5vPTf1llpt9GzXEBZf6ddLZeZ+lKc0DwGP1Z//3ppKEkSh0rj
 o6wh5uiHE+qgef8RSqWLKipjcMcss2nrW9cs34cuaqdksIlHDhJX1UvfEbj9JfJVBwS6
 Nevf6m+a1UE2Gr/MHnchaLSJyCHKzY2tT0y2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764890417; x=1765495217;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ilabqU0ZPIRb1Uuq8o42HfQ+CvcrcgaYSOj/pymfPA=;
 b=Yt+wcTsEsV5ebjcTiCH3YVbfOkAcPDynl+Dr/N7xY96TaBm1OFjVNdzaDUbVY4Iqoy
 Rbk0baLj9v73wGHI0uVAiLgCIAaFk31LiR69hzA6fTAmHmDKyo0o9f/0n3DoZCqsU7Ot
 gUAA1CbNKnlIui1im0rpvpJLrowUxjISwCT6WpygguhCwxB4dhbc2AbIepxzr/Zlqk4D
 U8LYd4plVg6aDGraymyAIPO9CYiMupOIFfQLwINTYRc13EAyQSkr/R8fEyjtymGCZ95L
 3j7F4O6c/BtlicGX3jW9DEr1ryHUAIDi027iA5EbkjyYjAglLlcG8KMAX7XBs1PP905d
 miGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyi5TJ4iKHjUNV6UW4OvyIITdPymUeLp3rTHMeWUpAHkikBTWMAELjaD3LJtb1EhQ5UF3PpJAYNLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXrFmalfPTTXj8P7+80rMjqhCNc0ERYzMfpXbHvZEDnN2Ag7iA
 VD4xG2ufftgHcA1rbAfdx9JgeQHOlJ4jOzB9Pmk14llK2sgoT3YWTxbVzGd5ZWWkgsY=
X-Gm-Gg: ASbGnct6OMbbW5gGC3j9Zj/zBL9oa5DurcuD1t0iSVO0gMmNdj3RJ/lCCOmvepirSQD
 FkELcvbWWV9Gnz3v1KRWpOLRG7sjsMdUdyoq4E8gKKcXCBJmuIXW+ReFDaIjPwKZGkIZReksyRR
 nlnAp6JoF7enI2kk7n97G9GZqsMoWFfT5AimHSkFLNs2CsOaTOCAHg8voETYuhz/GWYu6wpd861
 okVLeu8Cg4P25g+ivCSBTYQ1pVH88oMx/9FWvoH602jkDdBPgRYHOAP1VqKH4zmSZNyGXYJOVpd
 34vsjVGjvvpEl46cguCNLCxqyp9uho3voYJ+5KMqAvU9+Ca/JGgWXdG37PY4j55z50E69mPLMbi
 I1jIGiT4IdKhCIrCNvCCK37IDQRuHGsQ3b1NcOhZYsRru1RDA0MK4tup6IVBsgVHXoYMU8hti4x
 JJ632eiseVgHHIexMaNA5y8CU=
X-Google-Smtp-Source: AGHT+IEWl3G9taWVAc0FXunulp0EUlwKR0OqZ4+JiONHzArIhRnKO+2ONevOYyoQ9T+k/jyvf8v9NA==
X-Received: by 2002:a05:6870:ec8b:b0:3ec:4e22:bbb0 with SMTP id
 586e51a60fabf-3f1691d07f6mr3791225fac.18.1764890417156; 
 Thu, 04 Dec 2025 15:20:17 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3f50aa9ed65sm2288970fac.7.2025.12.04.15.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 15:20:16 -0800 (PST)
Message-ID: <3cd2240b-ec2c-45d0-b73b-b66c83e75b9f@linuxfoundation.org>
Date: Thu, 4 Dec 2025 16:20:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.18 amdgpu build error
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: akpm@linux-foundation.org, Alexander Deucher <Alexander.Deucher@amd.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
 <1eb24816-530b-4470-8e58-ce7d8297996c@roeck-us.net>
 <0425d7b4-76e4-4057-83a5-a7b17a051c54@linuxfoundation.org>
 <ec77d11a-7613-4b75-8c9e-f2bba1595f0f@roeck-us.net>
 <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
 <1f31b86d-283c-4878-92d0-ab90aed0c58d@roeck-us.net>
 <5af4522e-30ab-4eec-a861-c2760cdabd4f@linuxfoundation.org>
 <2bc690ca-fa57-46fa-949b-28b5441cd364@kernel.org>
 <b24fc85c-0e6d-42f9-a6b9-05136409098f@linuxfoundation.org>
 <CAHk-=whd-k3GhNGvVmP7W2p1d0d4ctqJ8iCuG8DbyKzgNqCL+g@mail.gmail.com>
 <3b6d6e50-91ac-435e-adad-a67d4198a5b5@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <3b6d6e50-91ac-435e-adad-a67d4198a5b5@kernel.org>
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

On 12/4/25 12:45, David Hildenbrand (Red Hat) wrote:
> On 12/4/25 20:36, Linus Torvalds wrote:
>> On Thu, 4 Dec 2025 at 09:40, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> This commit has impact on all architectures, not a narrow scoped
>>> powerpc only thing -  it enables HAVE_GIGANTIC_FOLIOS on x86_64
>>> and changes the common code that determines MAX_FOLIO_ORDER in
>>> include/linux/mm.h
>>
>> So I suspect your bisection might not have worked out, and there might
>> be two different things going on.
>>
>> In particular, hugepages were broken in 6.18-rc6 due to commit
>> adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero
>> folio").
>>
>> That was then fixed for rc7 (and obviously final 6.18) by commit
>> 5bebe8de19264 ("mm/huge_memory: Fix initialization of huge zero
>> folio"), but the breakage up until that time was a bit random.
>>

Both my systems were running rc6 - I was stuck in a state
where I was able to rebase to rc7 and then 6.18, but could
never build either one.

>> End result: if you ever ended up bisecting into that broken range
>> between those two commits, you would get failures on some loads (but
>> not reliably), and your bisection would end up pointing to some random
>> thing.
>>
>> But as mentioned, that particular problem would have been fixed in rc7
>> and in final 6.18, so any issues you saw with the final build would
>> have been due to something else.
>>
>> Can I ask you to try to re-do the bisection, but with that commit
>> 5bebe8de19264 applied by hand - if it wasn't already there - every
>> time you build a kernel that has adfb6609c680?

When I suspected rc6 to be the problem, I booted rc5 and compiled 6.18
after reverting 39231e8d6ba based on config file changes between rc5
and rc6.

> 
> Right, that's what I also proposed in [1].
> 
> I cannot make sense of how 39231e8d6ba could possibly trigger it given that it only affects the value of MAX_FOLIO_ORDER --- which is primarily used for safety checks and snapshot_page(), nothing that could explain changed application behavior, really.
> 
> But while Shuah is retesting, I'll go have a yet another look.

I retested on both systems on 6.18 making sure I have 5bebe8de19264
and 39231e8d6ba in there. I cloned linux_next and built it on both.

I didn't see any problems on 6.18. Having said that, It might make
sense to hold off on including 39231e8d6ba in 6.18 so there is more
time to test beyond 2 rc cycles. That is for you all to decide.

thanks,
-- Shuah
