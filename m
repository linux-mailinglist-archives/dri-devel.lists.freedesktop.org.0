Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D203B711822
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29F110E19D;
	Thu, 25 May 2023 20:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8334C10E19D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:30:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f6a6b9c079so276605e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 13:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1685046600; x=1687638600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KpMGG8xImlDkqBATRluOoCQ+0G0nxNJZCtKY+pxwMpA=;
 b=NL0EX6/H88L3/duJLGNldX6FVc864XY+R00ohvr+ICNoEIX6CkE9Z12+2Pn21sYWz1
 fqEfxKmu8b17oJLFja8/HxbTX7/13X/d3jvliRnKcCL5o0gu7HMoz/3qHMtZEvPltVqA
 wkoRjWENQ7+GFman8KVYBQnz295yByLuabrGeRAy63hZWE4HQ/WXDjjWRUdF6cBHkEc1
 jri0vXDscHWWc86+fjc6eIDXXtCcJXgAryO/gMactDAeMMauaUQFqPU4wPykpxFyyIr6
 JYLh8Gj8skPhNs6zH1xj14mKcX0EEDCNldNz90BGNWDVXfC6rhSazgG/9N0vuzcxtFaQ
 nNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685046600; x=1687638600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KpMGG8xImlDkqBATRluOoCQ+0G0nxNJZCtKY+pxwMpA=;
 b=hXRQ8bzVoR0rCZwDF9CLphn6sQzRyTvrOS/qauWQHFuTEooaHd5fbi8We+RIt92TEb
 LsjgCoKqzwLoIbQRmDJPPZl4AHLncYnzDOMTXJTvo1IIDjSgebdHdekgV97JAPeo/2wB
 XbS1VT4FtfZX3nUk6sNdJ5eVMZ+1dktzBgGlZmzlRBbI5ctS4/ghePmLGa47qr8udF4g
 f4PYbEub61pkmfjeYsx/NoGFdi7BQkH8BL8GtRDLZxfwSk0nwUFFDwE5MNdPtR9R1JHK
 rfijPItnwxKNQg3Xokx2beYsFIwk+Mg47ITZsspTXNZRGB0HQnqeI+sZhuTUfNf/2RJs
 Ukjw==
X-Gm-Message-State: AC+VfDwXxzOCO6KrzFMAG530kXe2k/Xs0UHujLipxQujv7ziklpPKv2U
 PH0K1Gzc+zZrjMdMnxmd5Z5Hmg==
X-Google-Smtp-Source: ACHHUZ4PexvjlMAM/TtsIgybNpAfwmX0zkAmpQB0DP94UjoG/L9hVa0OrqzyLg4x+TSxOSgSUCOgYA==
X-Received: by 2002:a05:600c:2111:b0:3f6:fb2:add4 with SMTP id
 u17-20020a05600c211100b003f60fb2add4mr3086171wml.33.1685046600132; 
 Thu, 25 May 2023 13:30:00 -0700 (PDT)
Received: from ?IPV6:2a02:578:8593:1200:bb9d:a59a:c33b:e36?
 ([2a02:578:8593:1200:bb9d:a59a:c33b:e36])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a1c4b0c000000b003f4290720d0sm6602440wma.47.2023.05.25.13.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 13:29:59 -0700 (PDT)
Message-ID: <39da7e41-dd07-b8bc-57b9-19b05fdfbeac@tessares.net>
Date: Thu, 25 May 2023 22:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915: Fix clang -Wimplicit-fallthrough in
 intel_async_flip_check_hw()
Content-Language: en-GB
To: Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>
References: <20230524-intel_async_flip_check_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org>
 <CAKwvOd=jZJouuNMd3Rvc--goA0EXPHcf6cHXUA6W1kXJg2ay2w@mail.gmail.com>
 <20230524184103.GA324296@dev-arch.thelio-3990X>
 <CAKwvOdm=Zk8YhrPptN3k7UQo+1n7Ws=Qox=BwTR9bbjPJJYz8A@mail.gmail.com>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <CAKwvOdm=Zk8YhrPptN3k7UQo+1n7Ws=Qox=BwTR9bbjPJJYz8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: tvrtko.ursulin@linux.intel.com, llvm@lists.linux.dev,
 kernel test robot <lkp@intel.com>, trix@redhat.com,
 intel-gfx@lists.freedesktop.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Joe Perches <joe@perches.com>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nick,

On 24/05/2023 20:56, Nick Desaulniers wrote:
> On Wed, May 24, 2023 at 11:41 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On Wed, May 24, 2023 at 11:32:32AM -0700, Nick Desaulniers wrote:
>>> On Wed, May 24, 2023 at 8:38 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>>>
>>>> Clang warns:
>>>>
>>>>   drivers/gpu/drm/i915/display/intel_display.c:6012:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>>>>                   case I915_FORMAT_MOD_X_TILED:
>>>>                   ^
>>>>   drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert 'break;' to avoid fall-through
>>>>                   case I915_FORMAT_MOD_X_TILED:
>>>>                   ^
>>>>                   break;
>>>>   1 error generated.
>>>>
>>>> Clang is a little more pedantic than GCC, which does not warn when
>>>> falling through to a case that is just break or return. Clang's version
>>>> is more in line with the kernel's own stance in deprecated.rst, which
>>>> states that all switch/case blocks must end in either break,
>>>> fallthrough, continue, goto, or return. Add the missing break to silence
>>>> the warning.
>>>>
>>>> Fixes: 937859485aef ("drm/i915: Support Async Flip on Linear buffers")
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/202305241902.UvHtMoxa-lkp@intel.com/
>>>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>>>> Closes: https://lore.kernel.org/CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com/
>>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>>
>>> Thanks for the patch! I've never seen the closes tag before, that's
>>> new to me. Can you tell me more about it?
>>
>> It is new to me (at least in the context of the kernel) as well. I only
>> used it over Link: because checkpatch.pl told me to:
>>
>> WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
>> #26:
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>>
>> WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
>> #27:
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>
>> It was Link: for a bit but commit 44c31888098a ("checkpatch: allow
>> Closes tags with links") changed it to Closes:. Looks odd to me but
>> whatever the linter says I suppose.
>>
>> Thanks for the review!
>>
>> Cheers,
>> Nathan
>>
>>> A few more tags
>>>
>>> Reported-by: Tom Rix <trix@redhat.com>
>>> Link: https://lore.kernel.org/all/20230523125116.1669057-1-trix@redhat.com/
>>> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> Ah then I guess my link tag should have been
> 
> Closes: https://lore.kernel.org/all/20230523125116.1669057-1-trix@redhat.com/
> 
> I hope the author of
> commit 44c31888098a ("checkpatch: allow Closes tags with links")
> has coordinated with the maintainer of b4, so that b4 recognizes Closes tags.
> b4 v0.12.2 does not pick up Closes tags.

I'm sorry for the troubles caused by this series, that was not the
intension.

When looking at modifying b4 to support the Closes tag, I realised the
Link tag from your previous message [1] was not taken as well. Was it
just me?

If no, I just sent patches for b4, see [2]. I hope it will help!

Cheers,
Matt

[1]
https://lore.kernel.org/all/CAKwvOd=jZJouuNMd3Rvc--goA0EXPHcf6cHXUA6W1kXJg2ay2w@mail.gmail.com/
[2]
https://lore.kernel.org/tools/20230525-closes-tags-v1-0-ed41b1773cb6@tessares.net/T/
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
