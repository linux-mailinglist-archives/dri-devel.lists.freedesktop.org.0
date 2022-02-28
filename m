Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341D64C6B34
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4B110E5EB;
	Mon, 28 Feb 2022 11:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A0210E5F4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 11:48:18 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2db2add4516so72092117b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 03:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AP0PgNepdnxsOpz/9ZEeiz4P6tZwSjtnIOow+xt1Bhs=;
 b=J15huMm9W/rsHw7l7UxwubQm3myLmtLN+/oxVy/pt1DW7c92Mq1yCwuAN3Nr2eKnbI
 q8btDsNov4R7ykysxpbds/3h6ptMJrWrOfYlC7NuqyBq/6Ivytd42FC7qsNwk1w5ZCPx
 ESIWyZEYMJuS7HB46Ga0xM26C8utsWKu0yZbGfIeJEQKhoQgjwwCwUO9i6Ou/GJEuves
 SXEVpKTxjZ7JHbxMU9QdmXqy5m8JRZmq7uVdVhlrk7/Vl3/02U60prldKXhUpH+vieH5
 IUJQrTA2DD5WiTQlMvMZOHbrH+ZJ66cSxhiXK2xGxC1UuW31CsBkTpRQMSNt8XKUYi5Z
 LlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AP0PgNepdnxsOpz/9ZEeiz4P6tZwSjtnIOow+xt1Bhs=;
 b=p8sCYcmClRAQn6w8vJjkv4WZqGSZO7Kj9STaefyQmQQtQ6TlEZMivcaWRBTScwJkNo
 mqDElWh0ASeRRedceTGSVJvygs656xqPZJRhwusbhU1ccAOB8EgxPCVw17tWyvV9hiOF
 blNGaVaxtSEHU4mA3zJj4ggeHTlpMdLoXCmVu+x7jcL7oowNlzr5Zzz+WgCa1wl8u8NS
 zbANo4kY4JyT19H+Nv5T47sQu09QOZeuyQIbOck+VeKqPq7wNb2/z2QBP7E3oFJRb3Bz
 4OCRb0Q80nRwdPybypRbJFls1/Ji3147qfKXEYDi1uVe0oxz7FMkh/9AnkybHp6RVNRP
 E0vQ==
X-Gm-Message-State: AOAM5335acEB88/o8kvQEPoY80nTRrk3QfL5zo1BC4eqgy8oCUS4fD/L
 7RdSUypsKCINIYGUggGrt/PsGffKj3VA7qLRVqSXPQ==
X-Google-Smtp-Source: ABdhPJyBz3vxrgFNhr47VeuJb7h3EKQf+mF/oK5JTz4GJg27hRskRelwhJHN0mxG15EhSFY1w1DtoWCPYN4lO8MZHTQ=
X-Received: by 2002:a81:743:0:b0:2ca:287c:6ca2 with SMTP id
 64-20020a810743000000b002ca287c6ca2mr18866401ywh.327.1646048897841; Mon, 28
 Feb 2022 03:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
From: Marco Elver <elver@google.com>
Date: Mon, 28 Feb 2022 12:47:41 +0100
Message-ID: <CANpmjNP6VE9G8Yng4W7Mayk-0QsqUtAXkrMUSvL5pAP5DpXSmA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 greybus-dev@lists.linaro.org, Alex Shi <alexs@kernel.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Hu Haowen <src.res@email.cn>,
 intel-gfx@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net, linux-kbuild@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Feb 2022 at 11:32, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> During a patch discussion, Linus brought up the option of changing
> the C standard version from gnu89 to gnu99, which allows using variable
> declaration inside of a for() loop. While the C99, C11 and later standard=
s
> introduce many other features, most of these are already available in
> gnu89 as GNU extensions as well.
>
> An earlier attempt to do this when gcc-5 started defaulting to
> -std=3Dgnu11 failed because at the time that caused warnings about
> designated initializers with older compilers. Now that gcc-5.1 is the
> minimum compiler version used for building kernels, that is no longer a
> concern. Similarly, the behavior of 'inline' functions changes between
> gnu89 and gnu11, but this was taken care of by defining 'inline' to
> include __attribute__((gnu_inline)) in order to allow building with
> clang a while ago.
>
> One minor issue that remains is an added gcc warning for shifts of
> negative integers when building with -Werror, which happens with the
> 'make W=3D1' option, as well as for three drivers in the kernel that alwa=
ys
> enable -Werror, but it was only observed with the i915 driver so far.
> To be on the safe side, add -Wno-shift-negative-value to any -Wextra
> in a Makefile.
>
> Nathan Chancellor reported an additional -Wdeclaration-after-statement
> warning that appears in a system header on arm, this still needs a
> workaround.

On the topic of Wdeclaration-after-statement, Clang only respects this
warning with C99 and later starting with Clang 14:
https://github.com/llvm/llvm-project/commit/c65186c89f35#diff-ec770381d76c8=
59f5f572db789175fe44410a72608f58ad5dbb14335ba56eb97R61

Until Clang 14, -Wdeclaration-after-statement is ignored by Clang in
newer standards. If this is a big problem, we can probably convince
the Clang stable folks to backport the fixes. However, the build won't
fail, folks might just miss the warning if they don't also test with
GCC.

> The differences between gnu99, gnu11, gnu1x and gnu17 are fairly
> minimal and mainly impact warnings at the -Wpedantic level that the
> kernel never enables. Between these, gnu11 is the newest version
> that is supported by all supported compiler versions, though it is
> only the default on gcc-5, while all other supported versions of
> gcc or clang default to gnu1x/gnu17.
>
> Link: https://lore.kernel.org/lkml/CAHk-=3DwiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdK=
pcovt8fYbVFW3TA@mail.gmail.com/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1603
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Marco Elver <elver@google.com>

Thanks,
-- Marco

> ---
> [v2]
>  - added -std=3Dgnu11 back, rather than just relying on the default
>  - minor changes to changelog text
> ---
>  Documentation/process/programming-language.rst              | 4 ++--
>  .../translations/it_IT/process/programming-language.rst     | 4 ++--
>  .../translations/zh_CN/process/programming-language.rst     | 4 ++--
>  .../translations/zh_TW/process/programming-language.rst     | 4 ++--
>  Makefile                                                    | 6 +++---
>  arch/arm64/kernel/vdso32/Makefile                           | 2 +-
>  drivers/gpu/drm/i915/Makefile                               | 1 +
>  drivers/staging/greybus/tools/Makefile                      | 3 ++-
>  fs/btrfs/Makefile                                           | 1 +
>  scripts/Makefile.extrawarn                                  | 1 +
>  10 files changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/process/programming-language.rst b/Documentati=
on/process/programming-language.rst
> index ec474a70a02f..894f2a6eb9db 100644
> --- a/Documentation/process/programming-language.rst
> +++ b/Documentation/process/programming-language.rst
> @@ -5,8 +5,8 @@ Programming Language
>
>  The kernel is written in the C programming language [c-language]_.
>  More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
> -under ``-std=3Dgnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO =
C90
> -(including some C99 features). ``clang`` [clang]_ is also supported, see
> +under ``-std=3Dgnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO =
C11
> +(including some C17 features). ``clang`` [clang]_ is also supported, see
>  docs on :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
>
>  This dialect contains many extensions to the language [gnu-extensions]_,
> diff --git a/Documentation/translations/it_IT/process/programming-languag=
e.rst b/Documentation/translations/it_IT/process/programming-language.rst
> index 41db2598ce11..aa21097737ae 100644
> --- a/Documentation/translations/it_IT/process/programming-language.rst
> +++ b/Documentation/translations/it_IT/process/programming-language.rst
> @@ -10,8 +10,8 @@ Linguaggio di programmazione
>
>  Il kernel =C3=A8 scritto nel linguaggio di programmazione C [it-c-langua=
ge]_.
>  Pi=C3=B9 precisamente, il kernel viene compilato con ``gcc`` [it-gcc]_ u=
sando
> -l'opzione ``-std=3Dgnu89`` [it-gcc-c-dialect-options]_: il dialetto GNU
> -dello standard ISO C90 (con l'aggiunta di alcune funzionalit=C3=A0 da C9=
9).
> +l'opzione ``-std=3Dgnu11`` [it-gcc-c-dialect-options]_: il dialetto GNU
> +dello standard ISO C11 (con l'aggiunta di alcune funzionalit=C3=A0 da C1=
7).
>  Linux supporta anche ``clang`` [it-clang]_, leggete la documentazione
>  :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
>
> diff --git a/Documentation/translations/zh_CN/process/programming-languag=
e.rst b/Documentation/translations/zh_CN/process/programming-language.rst
> index 2a47a1d2ec20..58d2b3bd2d85 100644
> --- a/Documentation/translations/zh_CN/process/programming-language.rst
> +++ b/Documentation/translations/zh_CN/process/programming-language.rst
> @@ -9,8 +9,8 @@
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  =E5=86=85=E6=A0=B8=E6=98=AF=E7=94=A8C=E8=AF=AD=E8=A8=80 :ref:`c-language=
 <cn_c-language>` =E7=BC=96=E5=86=99=E7=9A=84=E3=80=82=E6=9B=B4=E5=87=86=E7=
=A1=AE=E5=9C=B0=E8=AF=B4=EF=BC=8C=E5=86=85=E6=A0=B8=E9=80=9A=E5=B8=B8=E6=98=
=AF=E7=94=A8 :ref:`gcc <cn_gcc>`
> -=E5=9C=A8 ``-std=3Dgnu89`` :ref:`gcc-c-dialect-options <cn_gcc-c-dialect=
-options>` =E4=B8=8B=E7=BC=96=E8=AF=91=E7=9A=84=EF=BC=9AISO C90=E7=9A=84 GN=
U =E6=96=B9=E8=A8=80=EF=BC=88
> -=E5=8C=85=E6=8B=AC=E4=B8=80=E4=BA=9BC99=E7=89=B9=E6=80=A7=EF=BC=89
> +=E5=9C=A8 ``-std=3Dgnu11`` :ref:`gcc-c-dialect-options <cn_gcc-c-dialect=
-options>` =E4=B8=8B=E7=BC=96=E8=AF=91=E7=9A=84=EF=BC=9AISO C11=E7=9A=84 GN=
U =E6=96=B9=E8=A8=80=EF=BC=88
> +=E5=8C=85=E6=8B=AC=E4=B8=80=E4=BA=9BC17=E7=89=B9=E6=80=A7=EF=BC=89
>
>  =E8=BF=99=E7=A7=8D=E6=96=B9=E8=A8=80=E5=8C=85=E5=90=AB=E5=AF=B9=E8=AF=AD=
=E8=A8=80 :ref:`gnu-extensions <cn_gnu-extensions>` =E7=9A=84=E8=AE=B8=E5=
=A4=9A=E6=89=A9=E5=B1=95=EF=BC=8C=E5=BD=93=E7=84=B6=EF=BC=8C=E5=AE=83=E4=BB=
=AC=E8=AE=B8=E5=A4=9A=E9=83=BD=E5=9C=A8=E5=86=85=E6=A0=B8=E4=B8=AD=E4=BD=BF=
=E7=94=A8=E3=80=82
>
> diff --git a/Documentation/translations/zh_TW/process/programming-languag=
e.rst b/Documentation/translations/zh_TW/process/programming-language.rst
> index 54e3699eadf8..235de05f7e2c 100644
> --- a/Documentation/translations/zh_TW/process/programming-language.rst
> +++ b/Documentation/translations/zh_TW/process/programming-language.rst
> @@ -12,8 +12,8 @@
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  =E5=85=A7=E6=A0=B8=E6=98=AF=E7=94=A8C=E8=AA=9E=E8=A8=80 :ref:`c-language=
 <tw_c-language>` =E7=B7=A8=E5=AF=AB=E7=9A=84=E3=80=82=E6=9B=B4=E6=BA=96=E7=
=A2=BA=E5=9C=B0=E8=AA=AA=EF=BC=8C=E5=85=A7=E6=A0=B8=E9=80=9A=E5=B8=B8=E6=98=
=AF=E7=94=A8 :ref:`gcc <tw_gcc>`
> -=E5=9C=A8 ``-std=3Dgnu89`` :ref:`gcc-c-dialect-options <tw_gcc-c-dialect=
-options>` =E4=B8=8B=E7=B7=A8=E8=AD=AF=E7=9A=84=EF=BC=9AISO C90=E7=9A=84 GN=
U =E6=96=B9=E8=A8=80=EF=BC=88
> -=E5=8C=85=E6=8B=AC=E4=B8=80=E4=BA=9BC99=E7=89=B9=E6=80=A7=EF=BC=89
> +=E5=9C=A8 ``-std=3Dgnu11`` :ref:`gcc-c-dialect-options <tw_gcc-c-dialect=
-options>` =E4=B8=8B=E7=B7=A8=E8=AD=AF=E7=9A=84=EF=BC=9AISO C11=E7=9A=84 GN=
U =E6=96=B9=E8=A8=80=EF=BC=88
> +=E5=8C=85=E6=8B=AC=E4=B8=80=E4=BA=9BC17=E7=89=B9=E6=80=A7=EF=BC=89
>
>  =E9=80=99=E7=A8=AE=E6=96=B9=E8=A8=80=E5=8C=85=E5=90=AB=E5=B0=8D=E8=AA=9E=
=E8=A8=80 :ref:`gnu-extensions <tw_gnu-extensions>` =E7=9A=84=E8=A8=B1=E5=
=A4=9A=E6=93=B4=E5=B1=95=EF=BC=8C=E7=95=B6=E7=84=B6=EF=BC=8C=E5=AE=83=E5=80=
=91=E8=A8=B1=E5=A4=9A=E9=83=BD=E5=9C=A8=E5=85=A7=E6=A0=B8=E4=B8=AD=E4=BD=BF=
=E7=94=A8=E3=80=82
>
> diff --git a/Makefile b/Makefile
> index 289ce2be8032..66496eaeb9ec 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -432,7 +432,7 @@ HOSTCXX     =3D g++
>  endif
>
>  export KBUILD_USERCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-protot=
ypes \
> -                             -O2 -fomit-frame-pointer -std=3Dgnu89
> +                             -O2 -fomit-frame-pointer -std=3Dgnu11
>  export KBUILD_USERLDFLAGS :=3D
>
>  KBUILD_HOSTCFLAGS   :=3D $(KBUILD_USERCFLAGS) $(HOST_LFS_CFLAGS) $(HOSTC=
FLAGS)
> @@ -515,7 +515,7 @@ KBUILD_CFLAGS   :=3D -Wall -Wundef -Werror=3Dstrict-p=
rototypes -Wno-trigraphs \
>                    -fno-strict-aliasing -fno-common -fshort-wchar -fno-PI=
E \
>                    -Werror=3Dimplicit-function-declaration -Werror=3Dimpl=
icit-int \
>                    -Werror=3Dreturn-type -Wno-format-security \
> -                  -std=3Dgnu89
> +                  -std=3Dgnu11
>  KBUILD_CPPFLAGS :=3D -D__KERNEL__
>  KBUILD_AFLAGS_KERNEL :=3D
>  KBUILD_CFLAGS_KERNEL :=3D
> @@ -782,7 +782,7 @@ KBUILD_CFLAGS +=3D $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMP=
LICIT_FALLTHROUGH)
>
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CPPFLAGS +=3D -Qunused-arguments
> -# The kernel builds with '-std=3Dgnu89' so use of GNU extensions is acce=
ptable.
> +# The kernel builds with '-std=3Dgnu11' so use of GNU extensions is acce=
ptable.
>  KBUILD_CFLAGS +=3D -Wno-gnu
>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, =
as the
>  # source of a reference will be _MergedGlobals and not on of the whiteli=
sted names.
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32=
/Makefile
> index 6c01b63ff56d..9378ea055bf2 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -68,7 +68,7 @@ VDSO_CFLAGS +=3D -Wall -Wundef -Wstrict-prototypes -Wno=
-trigraphs \
>                 -fno-strict-aliasing -fno-common \
>                 -Werror-implicit-function-declaration \
>                 -Wno-format-security \
> -               -std=3Dgnu89
> +               -std=3Dgnu11
>  VDSO_CFLAGS  +=3D -O2
>  # Some useful compiler-dependent flags from top-level Makefile
>  VDSO_CFLAGS +=3D $(call cc32-option,-Wdeclaration-after-statement,)
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index 1b62b9f65196..1618a6e0af4e 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -17,6 +17,7 @@ subdir-ccflags-y +=3D -Wno-unused-parameter
>  subdir-ccflags-y +=3D -Wno-type-limits
>  subdir-ccflags-y +=3D -Wno-missing-field-initializers
>  subdir-ccflags-y +=3D -Wno-sign-compare
> +subdir-ccflags-y +=3D -Wno-shift-negative-value
>  subdir-ccflags-y +=3D $(call cc-disable-warning, unused-but-set-variable=
)
>  subdir-ccflags-y +=3D $(call cc-disable-warning, frame-address)
>  subdir-ccflags-$(CONFIG_DRM_I915_WERROR) +=3D -Werror
> diff --git a/drivers/staging/greybus/tools/Makefile b/drivers/staging/gre=
ybus/tools/Makefile
> index ad0ae8053b79..a3bbd73171f2 100644
> --- a/drivers/staging/greybus/tools/Makefile
> +++ b/drivers/staging/greybus/tools/Makefile
> @@ -12,7 +12,8 @@ CFLAGS        +=3D -std=3Dgnu99 -Wall -Wextra -g \
>             -Wredundant-decls \
>             -Wcast-align \
>             -Wsign-compare \
> -           -Wno-missing-field-initializers
> +           -Wno-missing-field-initializers \
> +           -Wno-shift-negative-value
>
>  CC     :=3D $(CROSS_COMPILE)gcc
>
> diff --git a/fs/btrfs/Makefile b/fs/btrfs/Makefile
> index 4188ba3fd8c3..99f9995670ea 100644
> --- a/fs/btrfs/Makefile
> +++ b/fs/btrfs/Makefile
> @@ -17,6 +17,7 @@ subdir-ccflags-y +=3D $(condflags)
>  subdir-ccflags-y +=3D -Wno-missing-field-initializers
>  subdir-ccflags-y +=3D -Wno-sign-compare
>  subdir-ccflags-y +=3D -Wno-type-limits
> +subdir-ccflags-y +=3D -Wno-shift-negative-value
>
>  obj-$(CONFIG_BTRFS_FS) :=3D btrfs.o
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 8be892887d71..650d0b8ceec3 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -36,6 +36,7 @@ KBUILD_CFLAGS +=3D $(call cc-option, -Wstringop-truncat=
ion)
>  KBUILD_CFLAGS +=3D -Wno-missing-field-initializers
>  KBUILD_CFLAGS +=3D -Wno-sign-compare
>  KBUILD_CFLAGS +=3D -Wno-type-limits
> +KBUILD_CFLAGS +=3D -Wno-shift-negative-value
>
>  KBUILD_CPPFLAGS +=3D -DKBUILD_EXTRA_WARN1
>
> --
> 2.29.2
>
>
