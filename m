Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4107A4C6B0F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC1A10E514;
	Mon, 28 Feb 2022 11:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B4310E143
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 23:04:53 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id w7so12945626ioj.5
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 15:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eMPAICcK4QOcUsgRz8E97T+w3UaPr0GS8sH9qwWSGXg=;
 b=TuABxhmm7HCYx1EyphcHUqowSUq4YqzJ+L4Kes63psOESIzptu0Wj4kjFHqT803dkW
 LXOCN6uuuQNNzwm7+keCDoEdSypmqegF8fR9cDhta1+D1LAa+qBEyNfOQwugQP04bEn2
 WKtODuLeAVhFD3oNphX9RDY0KEZz34ygGTQ59ycNT4g6cnY8HQQyveZDnf/kj2lMnJnW
 EBAWvNuKUKLvFOA4WMP6MFxsRVx7HseHYWEaUVMrMk01HR+NzmWcIN8G6aAEVRgwv9QN
 3n7SXvzkvndZsfFAyCqv9qQZMzunQhLtk+NzSYtok3gmgSJCJw2GIFCbdY5fQsEt1yew
 xOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eMPAICcK4QOcUsgRz8E97T+w3UaPr0GS8sH9qwWSGXg=;
 b=gRqI1DGBrOTQkCsQiBVcugEXpULPagYw7oUZhZxGN48QydrvS0dof6D5qQnC+uuvZp
 g14TMkDRYyJIx63wwDCDYah2FOFH1O3NGXAbweSw1w9OdOydv87GYTQ9HFwizYlT69Gp
 K2uqogYQ4HK1lbvCTgsq8I86RHHxaydZQu3Kv53cqQWf0bcgfvLmsw7Eh8B9fkEacqMw
 Y4ywTML7Icm/qsYJo/KNcp3pKsSnp/cASyR7noNOIOi2LCL1GnC94mWlUk+xaOXzdyCf
 ViWhli9NcUVmiI5Rz3ZUvJVos6Uo74oaNMBiuGAmZSys93Q2t8Vh+nd++MPtuhYKDwf4
 015A==
X-Gm-Message-State: AOAM533YnOmCjDG3TimuJyI/2mJlzUsxI6TdL+L0V9NnWVf8grfgQ4UD
 6j2cGIQdjIhJNdnAnwSSt4Pngw==
X-Google-Smtp-Source: ABdhPJxe901PQ2e5joOOmSne9hXyiOxCtxiBFuu7rSDYJSL82EmvMjFPqJfxHhSAJuacb9QKHFIrTw==
X-Received: by 2002:a02:cf2b:0:b0:30d:69cc:c9c3 with SMTP id
 s11-20020a02cf2b000000b0030d69ccc9c3mr13575882jar.175.1646003092361; 
 Sun, 27 Feb 2022 15:04:52 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58]) by smtp.googlemail.com with ESMTPSA id
 p15-20020a056e02104f00b002c1f581288csm5119123ilj.59.2022.02.27.15.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 15:04:51 -0800 (PST)
Message-ID: <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
Date: Sun, 27 Feb 2022 17:04:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [greybus-dev] [PATCH] Kbuild: remove -std=gnu89 from compiler
 arguments
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org
References: <20220227215408.3180023-1-arnd@kernel.org>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20220227215408.3180023-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 28 Feb 2022 11:45:00 +0000
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 greybus-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Federico Vaga <federico.vaga@vaga.pv.it>, Hu Haowen <src.res@email.cn>,
 intel-gfx@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net, Alex Shi <alexs@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/22 3:52 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> During a patch discussion, Linus brought up the option of changing
> the C standard version from gnu89 to gnu99, which allows using variable
> declaration inside of a for() loop. While the C99, C11 and later standards
> introduce many other features, most of these are already available in
> gnu89 as GNU extensions as well.
> 
> An earlier attempt to do this when gcc-5 started defaulting to
> -std=gnu11 failed because at the time that caused warnings about
> designated initializers with older compilers. Now that gcc-5.1 is the
> minimum compiler version used for building kernels, that is no longer a
> concern. Similarly, the behavior of 'inline' functions changes between
> gnu89 and gnu89, but this was taken care of by defining 'inline' to
> include __attribute__((gnu_inline)) in order to allow building with
> clang a while ago.
> 
> One minor issue that remains is an added gcc warning for shifts of
> negative integers when building with -Werror, which happens with the
> 'make W=1' option, as well as for three drivers in the kernel that always
> enable -Werror, but it was only observed with the i915 driver so far.
> 
> Nathan Chancellor reported an additional -Wdeclaration-after-statement
> warning that appears in a system header on arm, this still needs a
> workaround.
> 
> Since the differences between gnu99, gnu11 and gnu17 are fairly minimal
> and mainly impact warnings at the -Wpedantic level that the kernel
> never enables, the easiest way is to just leave out the -std=gnu89
> argument entirely, and rely on the compiler default language setting,
> which is gnu11 for gcc-5, and gnu1x/gnu17 for all other supported
> versions of gcc or clang.
> 
> Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1603
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I put the suggestion into patch form, based on what we discussed
> in the thread.  I only gave it minimal testing, but it would
> be good to have it in linux-next if we want to do this in the
> merge window.

Did you determine what needed the new compiler flag based on
compilation results?

Glancing at the Greybus code, I don't believe there's any
reason it needs to shift a negative value.  Such warnings
could be fixed by making certain variables unsigned, for
example.

I have no objection, I'll just make a note of it.

					-Alex

> ---
>   Documentation/process/programming-language.rst             | 4 ++--
>   .../translations/it_IT/process/programming-language.rst    | 4 ++--
>   .../translations/zh_CN/process/programming-language.rst    | 4 ++--
>   .../translations/zh_TW/process/programming-language.rst    | 4 ++--
>   Makefile                                                   | 7 +++----
>   arch/arm64/kernel/vdso32/Makefile                          | 3 +--
>   drivers/gpu/drm/i915/Makefile                              | 1 +
>   drivers/staging/greybus/tools/Makefile                     | 3 ++-
>   fs/btrfs/Makefile                                          | 1 +
>   scripts/Makefile.extrawarn                                 | 1 +
>   10 files changed, 17 insertions(+), 15 deletions(-)
> 

. . .

> diff --git a/drivers/staging/greybus/tools/Makefile b/drivers/staging/greybus/tools/Makefile
> index ad0ae8053b79..a3bbd73171f2 100644
> --- a/drivers/staging/greybus/tools/Makefile
> +++ b/drivers/staging/greybus/tools/Makefile
> @@ -12,7 +12,8 @@ CFLAGS	+= -std=gnu99 -Wall -Wextra -g \
>   	    -Wredundant-decls \
>   	    -Wcast-align \
>   	    -Wsign-compare \
> -	    -Wno-missing-field-initializers
> +	    -Wno-missing-field-initializers \
> +	    -Wno-shift-negative-value
>   
>   CC	:= $(CROSS_COMPILE)gcc
>   

. . .
