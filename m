Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7756C5382
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 19:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A172D10E37E;
	Wed, 22 Mar 2023 18:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0694610E0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 18:17:46 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id c4so11697975pfl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 11:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679509066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bKB37a91eiyjPZCGoC8cw5qGoIyXW5WK1FJBstPT2zY=;
 b=WleNqr3DN+FkMbhcZxhEoIwB5sGt2CVE3PI2u4pSTo6GPQdoVfk/4tR4Suf1zeoJzR
 a/zNPLfFT+FrC3XcJALt3QrkFR4O/xlSffmEjK41M+RF5AypPAF8geKV9+ak+fx8kfpd
 7sop9EeXQ2X7BKFTM4B7sGKYyC0OgceFgYn+P4nBUla71nPm0uPenu7WqbI9kBnBy6MO
 aU1UEu9HyB0y4ctqAexK+r0td/WYh/tLGwaZpgenKXmbxEOU1BMPaZbbTL5Lh/Qo4cpV
 Z8D0wPOq4hPvOGihBDeROie0LWJcPEdXcsnE4V6jHbdwVOsmYIBHvjzINBu0LWlYvk86
 FkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679509066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bKB37a91eiyjPZCGoC8cw5qGoIyXW5WK1FJBstPT2zY=;
 b=xMMIsID0Y1Kvf4G4UjANFcn0LKq8P4XEO0EI1SWB8uSQ9ruG58t0YtViDA2DhNXOog
 fgrHqxUoIETTlxLYoVicz/wiOLMn8aADK4eTQ0MRWtiXj/ABxKzdv1DZaglsfNn1TqVw
 fZuyeWdkUOvxa9SeDHpsqLFyakKtvaJjVZYm6h6sjxOgGkMUbaSUO0FRUbcuPXIt3LeK
 J64vw9NBMiyz7nJq5+3Rt5mIdBTGqE4GK6Q762e847yRWtj43w923ymiWU24K+eyR0MU
 Pf5AgKidR+uyeOZMoFGaQpmldVnlgeJtytj83VLEQjnPHFABXmFJcSnS29gwVBUIdwTo
 NxmA==
X-Gm-Message-State: AO0yUKURTW8cgnSdLtu15HbFJMHVCiD+DMJ+00FRYNwVZFV6PxZglq0O
 aAiA3J6OEh4Ml6deDyN8Cl5Ryhj8XKjSCrKsCGcFbQ==
X-Google-Smtp-Source: AK7set/y6sBv+fJORMtZJ9jPQsOI9ad8xXZTj20sziRULRJ5N+3atiS5WZJhXtZqH7Hzyux4u+Z6/cMQiB5unzBvJKc=
X-Received: by 2002:a65:4781:0:b0:503:7be3:e81d with SMTP id
 e1-20020a654781000000b005037be3e81dmr1119318pgs.1.1679509066284; Wed, 22 Mar
 2023 11:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X> <87pm91uf9c.fsf@kernel.org>
 <CA+icZUUYyqhV2HFzVtpi_KjBoYxjk7OB0UBVd2mX6abjmYhDjg@mail.gmail.com>
 <CAHk-=whdrvCkSWh=BRrwZwNo3=yLBXXM88NGx8VEpP1VTgmkyQ@mail.gmail.com>
In-Reply-To: <CAHk-=whdrvCkSWh=BRrwZwNo3=yLBXXM88NGx8VEpP1VTgmkyQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 22 Mar 2023 11:17:35 -0700
Message-ID: <CAKwvOdm1VpSSxN9zPVdEuDcyq2z2quQ1-qAQ5H+Q4y2xp1Focg@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>
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
Cc: linux-toolchains@vger.kernel.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Kalle Valo <kvalo@kernel.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 sedat.dilek@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Masahiro and linux-kbuild for the proposal

On Wed, Mar 22, 2023 at 9:56=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Mar 22, 2023 at 9:40=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.co=
m> wrote:
> >
> > You have to pass `make LLVM=3D1` in any case... to `oldconfig` or when
> > adding any MAKEFLAGS like -j${number-of-available-cpus}.
>
> I actually think we should look (again) at just making the compiler
> choice (and the prefix) be a Kconfig option.
>
> That would simplify *so* many use cases.
>
> It used to be that gcc was "THE compiler" and anything else was just
> an odd toy special case, but that's clearly not true any more.

<3

>
> So it would be lovely to make the kernel choice a Kconfig choice - so
> you'd set it only at config time, and then after that a kernel build
> wouldn't need special flags any more, and you'd never need to play
> games with GNUmakefile or anything like that.
>
> Yes, you'd still use environment variables (or make arguments) for
> that initial Kconfig, but that's no different from the other
> environment variables we already have, like KCONFIG_SEED that kconfig
> uses internally, but also things like "$(ARCH)" that we already use
> *inside* the Kconfig files themselves.
>
> I really dislike how you have to set ARCH and CROSS_COMPILE etc
> externally, and can't just have them *in* the config file.

Not needing CROSS_COMPILE for LLVM=3D1 has been great. ;)

(Still need it for ARCH=3Ds390 until LLD gets s390 support though)

>
> So when you do cross-compiles, right now you have to do something like
>
>     make ARCH=3Di386 allmodconfig
>
> to build the .config file, but then you have to *repeat* that
> ARCH=3Di386 when you actually build things:
>
>     make ARCH=3Di386
>
> because the ARCH choice ends up being in the .config file, but the
> makefiles themselves always take it from the environment.
>
> There are good historical reasons for our behavior (and probably a
> number of extant practical reasons too), but it's a bit annoying, and
> it would be lovely if we could start moving away from this model.
>
>             Linus
>


--=20
Thanks,
~Nick Desaulniers
