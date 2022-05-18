Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2BB52BBB4
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 16:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA3710EFED;
	Wed, 18 May 2022 14:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB2F10ECCC;
 Wed, 18 May 2022 14:07:36 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id i66so2719161oia.11;
 Wed, 18 May 2022 07:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=44Xgt+EUBiutauBulnIHgR1NZC7VLz+1d73CrLpoSuA=;
 b=EE+Ok5Q3AOQEWrEsMLQ8bJwxLj5JWKC0uRQavySm46LGHksaEXSJblszKsh1MvsIVQ
 sDPRJcb4u60eXiklTNwE2U+LD49Wb+WD9qcumnXXeQJnMUEh+Cprmc8yCFMWDDAx/laZ
 tSGFznxKpbQzHqnKFUn6Obmd3DZeEhLOmDwgdK5v2kgO5opVsh+5I61QnC6uyCbqRb+P
 h2C/Fnjhf4h05p6b5Q8AMg4jSgBqBTEFQHak8Fh8GP7YqlfCZ9bfj2PBgjyDMGe6fFi6
 v1tCilE06OSMQ2Ap/40R6GV7SfyLOFpw0XtrB50yxlMyw4CFBhcTVnu1K1CJBROjIYsQ
 b0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=44Xgt+EUBiutauBulnIHgR1NZC7VLz+1d73CrLpoSuA=;
 b=vTk7JJNhINkNmpz9N8xDdjXPebGVQFxAaIApzrt3kQxyLljKAC9juM0iQa4XDgOnHz
 NtgQSY4pH77nbqKbKOdqLMMNb9V0GuT0xYDXgtjKnEnUJIXpUlgX1u+amODYYn2HtMsT
 MrIV6TuF8u2pVeTRgwYQ7WcMUqymoKfhuOUmnr65ymZOCu/UU93G3R2xVJLx1jKo0usU
 xDNDo/xtKqlbyyblez0zUvyZ4Ps7Ngcvxz1z9SIL8CrW7fUSAcW4CHokAPH1w6ipgFfV
 U5EAhBOayHPApx+DKOZJNekRxDfiCOcxBHTuKjjrwBAGO8MpHbMmWH3gLk4Xfu+s2zab
 AnLA==
X-Gm-Message-State: AOAM530nF86GHWEAZe5P0+ss1Jy8s9XlyWuuBX9cprcQPJ8DfvxWgsd+
 xwvfBdOBA6mTpsM8tWcMKRA=
X-Google-Smtp-Source: ABdhPJyXPBsJSPb3qsIt30kakP/1viqje/dN0om/JEDZ69uJP4Erfc4CCzg7BfUTauTabr0j1dC5fA==
X-Received: by 2002:a05:6808:23d2:b0:326:979a:46f3 with SMTP id
 bq18-20020a05680823d200b00326979a46f3mr12917oib.207.1652882855862; 
 Wed, 18 May 2022 07:07:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a056830140800b0060603221267sm782203otp.55.2022.05.18.07.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 07:07:34 -0700 (PDT)
Message-ID: <47c64195-6629-ba2b-4533-b0fe37518da0@roeck-us.net>
Date: Wed, 18 May 2022 07:07:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220228103142.3301082-1-arnd@kernel.org>
 <20220516131023.GA2329080@roeck-us.net> <YoJSF8T5K9pPx3Ap@kroah.com>
 <9510474d-5555-42b3-5a9c-90e3078df499@roeck-us.net>
 <CAK8P3a1GmRqPTXFCoLH9h1sP76a-bVRsGYP-YvczoXM4Na3OVQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
In-Reply-To: <CAK8P3a1GmRqPTXFCoLH9h1sP76a-bVRsGYP-YvczoXM4Na3OVQ@mail.gmail.com>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 clang-built-linux <llvm@lists.linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-staging@lists.linux.dev,
 greybus-dev@lists.linaro.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Hu Haowen <src.res@email.cn>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net, Alex Shi <alexs@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/18/22 00:46, Arnd Bergmann wrote:
> On Mon, May 16, 2022 at 3:19 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 5/16/22 06:31, Greg KH wrote:
>>> On Mon, May 16, 2022 at 06:10:23AM -0700, Guenter Roeck wrote:
>>>> On Mon, Feb 28, 2022 at 11:27:43AM +0100, Arnd Bergmann wrote:
>>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>>
>>>>> During a patch discussion, Linus brought up the option of changing
>>>>> the C standard version from gnu89 to gnu99, which allows using variable
>>>>> declaration inside of a for() loop. While the C99, C11 and later standards
>>>>> introduce many other features, most of these are already available in
>>>>> gnu89 as GNU extensions as well.
>>>>
>>>> The downside is that backporting affected patches to older kernel branches
>>>> now fails with error messages such as
>>>>
>>>> mm/kfence/core.c: In function ‘kfence_init_pool’:
>>>> mm/kfence/core.c:595:2: error: ‘for’ loop initial declarations are only allowed in C99 or C11 mode
>>>>
>>>> Just something to keep in mind when writing patches.
>>>
>>> I just ran across this very issue on this commit.  It's an easy fixup
>>> for 5.17.y to make this work, so I did that in my tree.  If this gets to
>>> be too much, we might need to reconsider adding c11 to older stable
>>> kernels.
>>>
>>
>> I think I'll do just that for ChromeOS; I don't want to have to deal
>> with the backports, and we are using recent compilers anyway.
> 
> I think it would be better not to have the --std=gnu11 change in the older
> stable kernels by default, as this has introduced build warnings and other
> smaller issues, as well as raising the minimum compiler version.
> 
> The users that are stuck on older kernels for some reason tend to
> overlap with those on older compilers. One example here is Android,
> which used to ship with a gcc-4.9 build as the only non-clang toolchain,
> and was using this for building their kernels. If someone wants to
> pull in stable updates into an older Android, this would fail with
> -std=gnu11. Others may be in the same situation.
> 
> Changing some of the 5.x stable branches to -std=gnu11 is probably
> less of a problem, but I would not know where to draw the line exactly.
> Maybe check with the Android team to see what the newest kernel is
> that they expect to be built with the old gcc-4.9.
> 

I don't think they still build anything with gcc. We (ChromeOS) only
need it for test builds of chromeos-4.4 (sigh), and that will hopefully
be gone in a couple of months.

We already enabled -std=gnu11 in chromeos-5.10 and chromeos-5.15.
We'll see if that is possible with chromeos-5.4 as well.
We won't bother with older kernel branches, but those should not
get many patches from upstream outside stable release merges,
so it is less of a problem.

Guenter
