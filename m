Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49CE4C84C8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26BF10E445;
	Tue,  1 Mar 2022 07:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A6710E474
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 21:41:51 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id p8so12245490pfh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 13:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SDEQwyNhO1YP2PlPCVZv2QT+trnELH3tuuISdUJhH/A=;
 b=d9xMn/X4LpBqF7CCmU2zh6/QLyVNBTRuNZU+e7jV9ejFO0/bkIPnXV0yhaKjw6dJm8
 FJS3J2mi6lbO85oN/dNF+rqWxtAJUijNlNeALlXJL+eaCxB0tcq950US1kKVvr8mqukF
 e0ToSOH4Si3JfzpFzCogjXNl1DMde6d8MLn9SuHccOTRwzid1E81/cSQ/4tTUtiOrMCh
 9TojhlCRrVYJxHlgtGOmRoGhypN9RiWcKC8aFAkMrBK4RGw8XoilLoTMd70dGA9hdZYh
 n+kv4MVL49Db4WfNBmaeThQEFLAURei7cyQEoj8G+S/4PT3zkCcTFjR/aTe5mw8oJWud
 4tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SDEQwyNhO1YP2PlPCVZv2QT+trnELH3tuuISdUJhH/A=;
 b=WwlecrpXJ9Gt5vH0craWIHReGVFQ/u380GueNZdq+vyN1/Pn+LZ/VVOFHimvynynvM
 ug5JW+PElaO/x1GCb1CpjCgW7ZBtzlhORQ8qmQQXQzTqCnrmI4z1UQkDtqDzWMnK1V26
 ppAGTvGUwQfrVKwXbn8h1zyfkcSCPf2rqqfmEV3G2p1MeJv67oJqbFZ4au3biHmhzoqY
 f4ozhLAwz3YjBdYhKOllerWjoFS0oOVyzRheZZzHHW3IdGkIRNM4VOSCGHZDZY2KnYRO
 /2P0rFbIVplrz7o81ZqzfG3Mqv/O0KROlGUE1TiURH4fPbgaOKGC/REOR3GHpvyJsHFb
 QAyA==
X-Gm-Message-State: AOAM53026OsePEelAY3A08D0QqsseM2WZUEV059hj1ltxJFsNCeQS0rK
 geo094EEH2gkaTnn9Q9deCHcBw==
X-Google-Smtp-Source: ABdhPJysQYIb7FAhRgqLT3HifNDIOw9MY3JP0SvCbCIF1CiA1nyX5JMrxTKRUKNjLMnj4tBxx48g9A==
X-Received: by 2002:a05:6a00:26e0:b0:4e1:7131:de2b with SMTP id
 p32-20020a056a0026e000b004e17131de2bmr23819114pfw.20.1646084510471; 
 Mon, 28 Feb 2022 13:41:50 -0800 (PST)
Received: from google.com ([2620:15c:2ce:200:777f:ae46:e31e:b07e])
 by smtp.gmail.com with ESMTPSA id
 23-20020a17090a0b9700b001b8f602eaeasm259006pjr.53.2022.02.28.13.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 13:41:50 -0800 (PST)
Date: Mon, 28 Feb 2022 13:41:45 -0800
From: Fangrui Song <maskray@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
Message-ID: <20220228214145.o37bgp3zl3rxpeo4@google.com>
References: <20220228103142.3301082-1-arnd@kernel.org>
 <CAKwvOdkLUx1td+qgUYy3w2ojtBG-mJTzpJg3BV8Xv56YHTxHCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOdkLUx1td+qgUYy3w2ojtBG-mJTzpJg3BV8Xv56YHTxHCw@mail.gmail.com>
X-Mailman-Approved-At: Tue, 01 Mar 2022 07:18:19 +0000
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
Cc: Arnd Bergmann <arnd@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <src.res@email.cn>, intel-gfx@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>, linux-btrfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net, Alex Shi <alexs@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the patch!

(Was always wondering which of binutils and kernel would migrate to C99+
earlier... binutils won)

On 2022-02-28, Nick Desaulniers wrote:
>On Mon, Feb 28, 2022 at 2:32 AM Arnd Bergmann <arnd@kernel.org> wrote:
>>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> During a patch discussion, Linus brought up the option of changing
>> the C standard version from gnu89 to gnu99, which allows using variable
>> declaration inside of a for() loop. While the C99, C11 and later standards
>> introduce many other features, most of these are already available in
>> gnu89 as GNU extensions as well.
>>
>> An earlier attempt to do this when gcc-5 started defaulting to
>> -std=gnu11 failed because at the time that caused warnings about
>> designated initializers with older compilers. Now that gcc-5.1 is the
>> minimum compiler version used for building kernels, that is no longer a
>> concern. Similarly, the behavior of 'inline' functions changes between
>
>More precisely, the semantics of "extern inline" functions changed
>between ISO C90 and ISO C99.

Perhaps a clearer explanation to readers is: "extern inline" and "inline" swap
semantics with gnu_inline (-fgnu89-inline or __attribute__((__gnu_inline__))).

>That's the only concern I have, which I doubt is an issue. The kernel
>is already covered by the function attribute as you note.
>
>Just to have some measure:
>$ git grep -rn "extern inline" | wc -l
>116

"^inline" behaves like C99+ "extern inline"

Agree this is handled by

     #define inline inline __gnu_inline __inline_maybe_unused notrace

>Most of those are in arch/alpha/ which is curious; I wonder if those
>were intentional.
>
>(I do worry about Makefiles that completely reset KBUILD_CFLAGS
>though; the function attributes still take precedence).
>
>> gnu89 and gnu11, but this was taken care of by defining 'inline' to
>> include __attribute__((gnu_inline)) in order to allow building with
>> clang a while ago.
>>
>> One minor issue that remains is an added gcc warning for shifts of
>> negative integers when building with -Werror, which happens with the
>> 'make W=1' option, as well as for three drivers in the kernel that always
>> enable -Werror, but it was only observed with the i915 driver so far.
>> To be on the safe side, add -Wno-shift-negative-value to any -Wextra
>> in a Makefile.
>>
>> Nathan Chancellor reported an additional -Wdeclaration-after-statement
>> warning that appears in a system header on arm, this still needs a
>> workaround.
>
>Ack; I think we can just fix this in clang.
>
>>
>> The differences between gnu99, gnu11, gnu1x and gnu17 are fairly
>> minimal and mainly impact warnings at the -Wpedantic level that the
>> kernel never enables. Between these, gnu11 is the newest version
>> that is supported by all supported compiler versions, though it is
>> only the default on gcc-5, while all other supported versions of
>> gcc or clang default to gnu1x/gnu17.
>
>I agree. With the fixup to s/Werror/Wextra.
>
>Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
>>
>> Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
>> Link: https://github.com/ClangBuiltLinux/linux/issues/1603
>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: linux-kbuild@vger.kernel.org
>> Cc: llvm@lists.linux.dev
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>-- 
>Thanks,
>~Nick Desaulniers
>
