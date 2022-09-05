Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BD05ACB83
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B0D10E1CD;
	Mon,  5 Sep 2022 06:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 470 seconds by postgrey-1.36 at gabe;
 Mon, 05 Sep 2022 06:57:17 UTC
Received: from condef-08.nifty.com (condef-08.nifty.com [202.248.20.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA5410E1C1;
 Mon,  5 Sep 2022 06:57:17 +0000 (UTC)
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-08.nifty.com
 with ESMTP id 2856isQN010025; Mon, 5 Sep 2022 15:44:54 +0900
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 2856ic6t020651;
 Mon, 5 Sep 2022 15:44:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 2856ic6t020651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1662360279;
 bh=2/aEuTIGQY1eRCS8ZnFpEZnaZhJYBAN2YOqc0m45zS0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lKAB6BQc70nahRxqaJZNtnfMD+5Yec10/NkTOmFn2bNQNge2AgFZW7dBoRJqR6MnI
 xPC/bll5EYabRy5wk4VM/2t1rCwklXfH+QePUY2EHAAwAI/+OQYY/bQlEF+vfb41jq
 O+0v+kq1iRSwlgz/idsyDS/fER9XuSMbET7bpuSSVbebJZfGOYlSQyXUZJAfiTqkJD
 WW1rymTI7myf1KQPXzI+OEG5yl2tukVLr+4rx+aN9kYriAWLRWx3bo0/AFtZfrskkb
 dN6ZtLlo7S6u9OdbHj7cLg6CxD2bQaclRl5Me77fQNz7p8voW1WVLVPGvzKwUB5QB3
 cxlaHRJ2p496g==
X-Nifty-SrcIP: [209.85.210.42]
Received: by mail-ot1-f42.google.com with SMTP id
 t11-20020a05683014cb00b0063734a2a786so5583752otq.11; 
 Sun, 04 Sep 2022 23:44:39 -0700 (PDT)
X-Gm-Message-State: ACgBeo2AIAh+sior96jHTvoeAz1UYCB9FK2XGmDSb8T4sPgS0RJrVHvx
 PMt3d31dQ5Xe6AsR/F5J/yE41p1MbJGScZMQzHE=
X-Google-Smtp-Source: AA6agR5eDbGMjw3wtK6ZZjfyuxTtPhmoA7XbU6Z2YqLR6PluQmowVmlHe933hVZ0RY1QlSEEKDQLiJ+SNF7QSFqwxdE=
X-Received: by 2002:a05:6830:658b:b0:63b:3501:7167 with SMTP id
 cn11-20020a056830658b00b0063b35017167mr12590275otb.343.1662360278092; Sun, 04
 Sep 2022 23:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220831184408.2778264-1-ndesaulniers@google.com>
 <20220831184408.2778264-4-ndesaulniers@google.com>
In-Reply-To: <20220831184408.2778264-4-ndesaulniers@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 5 Sep 2022 15:44:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQsAwUX-w8YQTxPRSi8S0MRcDtv2mc=umjF_3C3dA1-Kg@mail.gmail.com>
Message-ID: <CAK7LNAQsAwUX-w8YQTxPRSi8S0MRcDtv2mc=umjF_3C3dA1-Kg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
To: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, Fangrui Song <maskray@google.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Tom Rix <trix@redhat.com>, Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
 clang-built-linux <llvm@lists.linux.dev>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>,
 Greg Thelen <gthelen@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Alexey Alexandrov <aalexand@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 1, 2022 at 3:44 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> cc-ifversion is GCC specific. Replace it with compiler specific
> variants. Update the users of cc-ifversion to use these new macros.
> Provide a helper for checking compiler versions for GCC and Clang
> simultaneously, that will be used in a follow up patch.
>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Link: https://github.com/ClangBuiltLinux/linux/issues/350
> Link: https://lore.kernel.org/llvm/CAGG=3QWSAUakO42kubrCap8fp-gm1ERJJAYXTnP1iHk_wrH=BQ@mail.gmail.com/
> Suggested-by: Bill Wendling <morbo@google.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes v1 -> v2:
> * New patch.
>
>  Documentation/kbuild/makefiles.rst          | 44 +++++++++++++++------
>  Makefile                                    |  4 +-
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 12 ++----
>  scripts/Makefile.compiler                   | 15 +++++--
>  4 files changed, 49 insertions(+), 26 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 11a296e52d68..e46f5b45c422 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -682,22 +682,42 @@ more details, with real examples.
>         In the above example, -Wno-unused-but-set-variable will be added to
>         KBUILD_CFLAGS only if gcc really accepts it.
>
> -    cc-ifversion
> -       cc-ifversion tests the version of $(CC) and equals the fourth parameter
> -       if version expression is true, or the fifth (if given) if the version
> -       expression is false.
> +    gcc-min-version
> +       gcc-min-version tests if the value of $(CONFIG_GCC_VERSION) is greater than
> +       or equal to the provided value and evaluates to y if so.
>
>         Example::
>
> -               #fs/reiserfs/Makefile
> -               ccflags-y := $(call cc-ifversion, -lt, 0402, -O1)
> +               cflags-$(call gcc-min-version, 70100) := -foo
>
> -       In this example, ccflags-y will be assigned the value -O1 if the
> -       $(CC) version is less than 4.2.
> -       cc-ifversion takes all the shell operators:
> -       -eq, -ne, -lt, -le, -gt, and -ge
> -       The third parameter may be a text as in this example, but it may also
> -       be an expanded variable or a macro.
> +       In this example, cflags-y will be assigned the value -foo if $(CC) is gcc and
> +       $(CONFIG_GCC_VERSION) is >= 7.1.
> +
> +    clang-min-version
> +       clang-min-version tests if the value of $(CONFIG_CLANG_VERSION) is greater
> +       than or equal to the provided value and evaluates to y if so.
> +
> +       Example::
> +
> +               cflags-$(call clang-min-version, 110000) := -foo
> +
> +       In this example, cflags-y will be assigned the value -foo if $(CC) is clang
> +       and $(CONFIG_CLANG_VERSION) is >= 11.0.0.
> +
> +    cc-min-version
> +       cc-min-version tests if the value of $(CONFIG_GCC_VERSION) is greater
> +       than or equal to the first value provided, or if the value of
> +       $(CONFIG_CLANG_VERSION) is greater than or equal to the second value
> +       provided, and evaluates
> +       to y if so.
> +
> +       Example::
> +
> +               cflags-$(call cc-min-version, 70100, 110000) := -foo
> +
> +       In this example, cflags-y will be assigned the value -foo if $(CC) is gcc and
> +       $(CONFIG_GCC_VERSION) is >= 7.1, or if $(CC) is clang and
> +       $(CONFIG_CLANG_VERSION) is >= 11.0.0.
>
>      cc-cross-prefix
>         cc-cross-prefix is used to check if there exists a $(CC) in path with
> diff --git a/Makefile b/Makefile
> index 952d354069a4..caa39ecb1136 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -972,7 +972,7 @@ ifdef CONFIG_CC_IS_GCC
>  KBUILD_CFLAGS += -Wno-maybe-uninitialized
>  endif
>
> -ifdef CONFIG_CC_IS_GCC
> +ifeq ($(call gcc-min-version, 90100),y)
>  # The allocators already balk at large sizes, so silence the compiler
>  # warnings for bounds checks involving those possible values. While
>  # -Wno-alloc-size-larger-than would normally be used here, earlier versions
> @@ -984,7 +984,7 @@ ifdef CONFIG_CC_IS_GCC
>  # ignored, continuing to default to PTRDIFF_MAX. So, left with no other
>  # choice, we must perform a versioned check to disable this warning.
>  # https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
> -KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-larger-than)
> +KBUILD_CFLAGS += -Wno-alloc-size-larger-than
>  endif
>
>  # disable invalid "can't wrap" optimizations for signed / pointers
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 86a3b5bfd699..d8ee4743b2e3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -33,20 +33,14 @@ ifdef CONFIG_PPC64
>  dml_ccflags := -mhard-float -maltivec
>  endif
>
> -ifdef CONFIG_CC_IS_GCC
> -ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> -IS_OLD_GCC = 1
> -endif
> -endif
> -
>  ifdef CONFIG_X86
> -ifdef IS_OLD_GCC
> +ifeq ($(call gcc-min-version, 70100),y)
> +dml_ccflags += -msse2
> +else
>  # Stack alignment mismatch, proceed with caution.
>  # GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
>  # (8B stack alignment).
>  dml_ccflags += -mpreferred-stack-boundary=4
> -else
> -dml_ccflags += -msse2
>  endif
>  endif
>
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index d1739f0d3ce3..13dade724fa3 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -61,9 +61,18 @@ cc-option-yn = $(call try-run,\
>  cc-disable-warning = $(call try-run,\
>         $(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
>
> -# cc-ifversion
> -# Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
> -cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
> +# gcc-min-version
> +# Usage: cflags-$(call gcc-min-version, 70100) += -foo
> +gcc-min-version = $(shell [ $(CONFIG_GCC_VERSION) -ge $(1) ] && echo y)
> +
> +# clang-min-version
> +# Usage: cflags-$(call clang-min-version, 110000) += -foo
> +clang-min-version = $(shell [ $(CONFIG_CLANG_VERSION) -ge $(1) ] && echo y)
> +
> +# cc-min-version
> +# Usage: cflags-$(call cc-min-version, 701000, 110000)
> +#                                      ^ GCC   ^ Clang
> +cc-min-version = $(filter y, $(call gcc-min-version, $(1)), $(call clang-min-version, $(2)))




A more intuitive and more efficient form would be:

  cc-min-version = $(or $(call gcc-min-version, $(1)), $(call
clang-min-version, $(2)))



In your implementation, both gcc-min-version and clang-min-version are
expanded before being passed to $(filter ...).
So the shell is always invoked twice.


$(or A, B) is lazily expanded; A is evaluated first.
If and only if A is empty, B is expanded.

If gcc-min-version is met, the shell invocation in clang-min-version
will be short-cut.



But, I do not find a place where cc-min-version is useful.


Looking at the next patch,



# gcc-11+, clang-14+
ifeq ($(call cc-min-version, 110000, 140000),y)
dwarf-version-y := 5
else
dwarf-version-y := 4
endif


 ... can be written in a more simpler way:


dwarf-version-y                                 := 4
dwarf-version-$(call gcc-min-version, 110000)   := 5
dwarf-version-$(call clang-min-version, 140000) := 5





With $(call cc-min-version, 110000, 140000),
you never know the meaning of 110000, 140000
until you see the definition of this macro.
So, you feel like adding the comment "gcc-11+, clang-14+".


The latter form, the code is self-documenting.








>  # ld-option
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
> --
> 2.37.2.672.g94769d06f0-goog
>


-- 
Best Regards
Masahiro Yamada
