Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF0B52B3BE
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D178010E713;
	Wed, 18 May 2022 07:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1031113E13;
 Wed, 18 May 2022 07:46:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCB7061445;
 Wed, 18 May 2022 07:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F379C34113;
 Wed, 18 May 2022 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652860005;
 bh=KUl7JvGgqkc1DfGhPQMhcKNc6+xW1iqiAC34dWUYIYI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dkK2VuiRazUYy/0raeMMGlNR4Tax1p2NGjBr/nBjKum21oFxmslWmUCU0VzoRu+cO
 HmrzPveZdQjdv+cTPBR2V9tak/jiomNUfYBj5sw2dX2dKoC9xH7uM57L8jH4xYiIuM
 08YqMdtOguRYHRonbNsRBlTLvM52Q+3TpvkwtUExXHPUUphUHyK569lWDbMs10HDjU
 DyH3Js5U9VM/fgDmVN0asWG655mirLaZZDwLq2xvJajzBmBVBbWSRTWp5U0pCUQtsS
 fyTFbdmkyAv0lZigt1Yr/42MgLcInpjxDL0ApYmAeUaT9QZgryC0kOix45ZHLnTsUi
 zGfw+Eb+H8wvA==
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2fed823dd32so14912787b3.12; 
 Wed, 18 May 2022 00:46:45 -0700 (PDT)
X-Gm-Message-State: AOAM533WBzUvhSSUGuIQXK8prgcpdqZL1fGgNsC6d3NUFxTQPMly7iOj
 gCb1SJD3J4uEibo/FLfd3h6P8frVL1qotF9ScWo=
X-Google-Smtp-Source: ABdhPJyhm2Dj408LoUWWmvAqhkBhAYE1RnSkeixOEh3zciq1RMr7OwAYsEs1iONJHOBW1KRcCiA1jSuvrZOus+J3c4c=
X-Received: by 2002:a0d:cd06:0:b0:2f8:f39c:4cfc with SMTP id
 p6-20020a0dcd06000000b002f8f39c4cfcmr29636586ywd.495.1652860004199; Wed, 18
 May 2022 00:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
 <20220516131023.GA2329080@roeck-us.net>
 <YoJSF8T5K9pPx3Ap@kroah.com>
 <9510474d-5555-42b3-5a9c-90e3078df499@roeck-us.net>
In-Reply-To: <9510474d-5555-42b3-5a9c-90e3078df499@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 18 May 2022 08:46:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1GmRqPTXFCoLH9h1sP76a-bVRsGYP-YvczoXM4Na3OVQ@mail.gmail.com>
Message-ID: <CAK8P3a1GmRqPTXFCoLH9h1sP76a-bVRsGYP-YvczoXM4Na3OVQ@mail.gmail.com>
Subject: Re: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Guenter Roeck <linux@roeck-us.net>
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

On Mon, May 16, 2022 at 3:19 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/16/22 06:31, Greg KH wrote:
> > On Mon, May 16, 2022 at 06:10:23AM -0700, Guenter Roeck wrote:
> >> On Mon, Feb 28, 2022 at 11:27:43AM +0100, Arnd Bergmann wrote:
> >>> From: Arnd Bergmann <arnd@arndb.de>
> >>>
> >>> During a patch discussion, Linus brought up the option of changing
> >>> the C standard version from gnu89 to gnu99, which allows using variab=
le
> >>> declaration inside of a for() loop. While the C99, C11 and later stan=
dards
> >>> introduce many other features, most of these are already available in
> >>> gnu89 as GNU extensions as well.
> >>
> >> The downside is that backporting affected patches to older kernel bran=
ches
> >> now fails with error messages such as
> >>
> >> mm/kfence/core.c: In function =E2=80=98kfence_init_pool=E2=80=99:
> >> mm/kfence/core.c:595:2: error: =E2=80=98for=E2=80=99 loop initial decl=
arations are only allowed in C99 or C11 mode
> >>
> >> Just something to keep in mind when writing patches.
> >
> > I just ran across this very issue on this commit.  It's an easy fixup
> > for 5.17.y to make this work, so I did that in my tree.  If this gets t=
o
> > be too much, we might need to reconsider adding c11 to older stable
> > kernels.
> >
>
> I think I'll do just that for ChromeOS; I don't want to have to deal
> with the backports, and we are using recent compilers anyway.

I think it would be better not to have the --std=3Dgnu11 change in the olde=
r
stable kernels by default, as this has introduced build warnings and other
smaller issues, as well as raising the minimum compiler version.

The users that are stuck on older kernels for some reason tend to
overlap with those on older compilers. One example here is Android,
which used to ship with a gcc-4.9 build as the only non-clang toolchain,
and was using this for building their kernels. If someone wants to
pull in stable updates into an older Android, this would fail with
-std=3Dgnu11. Others may be in the same situation.

Changing some of the 5.x stable branches to -std=3Dgnu11 is probably
less of a problem, but I would not know where to draw the line exactly.
Maybe check with the Android team to see what the newest kernel is
that they expect to be built with the old gcc-4.9.

         Arnd
