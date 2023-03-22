Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFEA6C50F0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 17:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C66810E3C9;
	Wed, 22 Mar 2023 16:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB9F10E3C9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 16:40:58 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q14so5247713ljm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679503256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=scYlvuYnUfIO+ytvcQ1WgmMTc6bJHOSg7B8uMz0Bpnw=;
 b=ENhKu62sEGygmpYVXYnyZ+wza3E6eVReMpyEbPfstSh3doe6+xBn0m3mh4kNzH44z8
 mhbZcXA5KQbpToKHUsMRVU7iRNXGq9rl9zm3u8NF14qmHh8y8aP+dRwGiv2QXqpBKAHu
 KofmS5ShKQVEFrbRhKF3zWynciqo9qDTYgN7Bu3qanZCYEcuiCCFk4lfzbGFujMgaYZj
 XJu+oTbAIz+xLoOreu608scgXFJjub5oUUjPScYvbhQ7hS+6Jqs5eP9XRPu9oBPXqLAj
 Cix2i1PqZyYigtNMYcaS5KMrkP0Gvk7vDJJbtLHeyvzP89jHDP5NSA3FrrbmgYytRi1m
 lXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679503256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=scYlvuYnUfIO+ytvcQ1WgmMTc6bJHOSg7B8uMz0Bpnw=;
 b=2NlYA2AVqjI4HjvTx27I9PKsjCdbU9SgcVEVeWLYLxv8u0NBb205AH3y8D57G2U9Pm
 gpW11oAZZBDNZshd81eW2+uY6VVvcZMIkviJxuseuxY7VdpKy+cWc2KfohKeVcicikCh
 NDDjYPgAB6F2oWcvb3ZViQdxiOlTDfnjrfqhT2Ebhy3eIWx/tZXeoIkBmaASNXumrbBk
 XdqY4q0WXEmO05BThncA9R3ke/EOKUpX8bSmYpK2ba81RXaZLjYZa5MlQQyWgl3XQWgq
 ViOhSZVtcbdbJgaNnD38is/pdiqW2DRjviZr+ooa1SOEdA2+UWXoFnjU/gYTUqHEhxw1
 BQeg==
X-Gm-Message-State: AO0yUKViiKmmOYrPVSsuL8t/KhJhi0wTaJXQuCYuaeFEK/GYzUCgYicN
 Xeh3mRt8twJAyOIdQNuhCqV7LnSWKonpfdHVLIk=
X-Google-Smtp-Source: AK7set+PkDCGdPW8BcSm3drm+jFs+5IZP+ddpS2jxDz62nJJg0paKgp1Wv52fMUBHaESCZ7BfXnmXdkhyl5LO/JRib8=
X-Received: by 2002:a2e:9ece:0:b0:298:7034:836e with SMTP id
 h14-20020a2e9ece000000b002987034836emr2170491ljk.8.1679503256122; Wed, 22 Mar
 2023 09:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X> <87pm91uf9c.fsf@kernel.org>
In-Reply-To: <87pm91uf9c.fsf@kernel.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 22 Mar 2023 17:40:15 +0100
Message-ID: <CA+icZUUYyqhV2HFzVtpi_KjBoYxjk7OB0UBVd2mX6abjmYhDjg@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: Kalle Valo <kvalo@kernel.org>
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
Reply-To: sedat.dilek@gmail.com
Cc: linux-toolchains@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 1:49=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Nathan Chancellor <nathan@kernel.org> writes:
>
> > On Mon, Mar 20, 2023 at 11:26:17AM -0700, Linus Torvalds wrote:
> >> On Mon, Mar 20, 2023 at 11:05=E2=80=AFAM Nathan Chancellor <nathan@ker=
nel.org> wrote:
> >> >
> >> > On the clang front, I am still seeing the following warning turned e=
rror
> >> > for arm64 allmodconfig at least:
> >> >
> >> >   drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is un=
initialized when used here [-Werror,-Wuninitialized]
> >> >           if (syncpt_irq < 0)
> >> >               ^~~~~~~~~~
> >>
> >> Hmm. I do my arm64 allmodconfig builds with gcc, and I'm surprised
> >> that gcc doesn't warn about this.
> >
> > Perhaps these would make doing allmodconfig builds with clang more
> > frequently less painful for you?
> >
> > https://lore.kernel.org/llvm/20230319235619.GA18547@dev-arch.thelio-399=
0X/
>
> Thank you, at least for me this is really helpful. I tried now clang for
> the first time but seeing a strange problem.
>
> I prefer to define the compiler in GNUmakefile so it's easy to change
> compilers and I don't need to remember the exact command line. So I have
> this in the top level GNUmakefile (all the rest commented out):
>
> LLVM=3D/opt/clang/llvm-16.0.0/bin/
>

Welcome to the LLVM/Clang world!

First try - First Cry...

In my build-environment I add (export) /path/to/llvm/bin to $PATH and
pass single CC LD AR etc. (what is substituted by LLVM=3D1):

make CC=3Dclang LD=3Dld.lld AR=3Dllvm-ar NM=3Dllvm-nm STRIP=3Dllvm-strip \
 OBJCOPY=3Dllvm-objcopy OBJDUMP=3Dllvm-objdump READELF=3Dllvm-readelf \
 HOSTCC=3Dclang HOSTCXX=3Dclang++ HOSTAR=3Dllvm-ar HOSTLD=3Dld.lld

Equivalent to:

make LLVM=3D1

I cannot comment on `make LLVM=3D/path/to/llvm/` and/or combinations
with `LLVM=3D1` as I have never used it

> If I run 'make oldconfig' it seems to use clang but after I run just
> 'make' it seems to switch back to the host GCC compiler and ask for GCC
> specific config questions again. Workaround for this seems to be adding
> 'export LLVM' to GNUmakefile, after that also 'make' uses clang as
> expected.
>

You have to pass `make LLVM=3D1` in any case... to `oldconfig` or when
adding any MAKEFLAGS like -j${number-of-available-cpus}.

Hope that helps.

Best regards,
-Sedat-

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/kbuild/llvm.rst
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/kbuild/llvm.rst#n52
