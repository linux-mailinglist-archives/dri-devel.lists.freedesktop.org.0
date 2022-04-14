Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FBB501354
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87ACA10F232;
	Thu, 14 Apr 2022 15:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 535 seconds by postgrey-1.36 at gabe;
 Thu, 14 Apr 2022 15:18:32 UTC
Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0772A10FE07;
 Thu, 14 Apr 2022 15:18:31 +0000 (UTC)
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-04.nifty.com
 with ESMTP id 23EF5ZTg016163; Fri, 15 Apr 2022 00:05:35 +0900
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 23EF5DnO006890;
 Fri, 15 Apr 2022 00:05:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 23EF5DnO006890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1649948714;
 bh=D3Fvf0k0js+J3eM+fukVsmdW0E7pfYlBg42jAXKI77c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wRJ5hAUSwWQKd+XyHf08ogKdcUjXyXvPZMOmvUZPezU/qi9D/pn02VYoEojgzirRo
 PhBpwIyxhwdaiZPtiJ4n+ZE10n5rS5wp/rNX6q85Wiq1eYFGFWjRgywdtdemYKS/lg
 tOiX42Wfrbt4Tt3QdfgUbm7NAvV4MZPfhef+h/ipyv/hRndBFGeecQc+rFuDRnYgCw
 fOdNso255ncmxMYs0XD6cANMOlOULnVW0nz3L92wkdZEECP5GQY2IWglR5zp8SfpGb
 xY65+7ZmaYAWDRxkuEOUS1f6/nndGJ2P6ZEHTnq8vyNfDS9qY6Jgo6XTE0/6aZZLhG
 +K81mTfcYeJrw==
X-Nifty-SrcIP: [209.85.215.171]
Received: by mail-pg1-f171.google.com with SMTP id i184so4534345pgc.2;
 Thu, 14 Apr 2022 08:05:14 -0700 (PDT)
X-Gm-Message-State: AOAM533gGjkSUBQXcJBZ3lVdlM2tokTqGlpSHBSpFypzCu0Uwg4jruAQ
 0Hv71IqOtQHvJJuSlEd799fPfERoEd6BkhVlSus=
X-Google-Smtp-Source: ABdhPJx45QVB/oxoHuDprognzCExgs/0kbaStC9ZvwOrB//qQnEGRovgPPBrNlyhNKkQDLKn0inVvrDhcl1xQApvueg=
X-Received: by 2002:a65:60c1:0:b0:39d:9c28:909a with SMTP id
 r1-20020a6560c1000000b0039d9c28909amr2668928pgv.352.1649948713160; Thu, 14
 Apr 2022 08:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220413161450.1854370-1-michel@daenzer.net>
 <f425b789-5081-fa70-555f-7553d7cc5bd5@gmail.com>
 <ca5ca8ab-9c48-8d81-2dd6-fbdfface6519@mailbox.org>
 <abd87438-3ff4-6b62-81b4-6162d167348a@gmail.com>
 <CADnq5_Npy02mWVMOs-TMQ9t6OLV8XFaSQFZ5iB=Y2q3OQgiQvw@mail.gmail.com>
 <fe499d20-2667-5953-831a-d7668c5a3d18@mailbox.org>
In-Reply-To: <fe499d20-2667-5953-831a-d7668c5a3d18@mailbox.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 15 Apr 2022 00:04:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNATdTaY6+FD4TuFgmb00=Qbx=7mmCi9onHv0zi=pdZysBQ@mail.gmail.com>
Message-ID: <CAK7LNATdTaY6+FD4TuFgmb00=Qbx=7mmCi9onHv0zi=pdZysBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Add build directory to include path
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi.

On Thu, Apr 14, 2022 at 10:50 PM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
>
> On 2022-04-14 15:34, Alex Deucher wrote:
> > On Thu, Apr 14, 2022 at 4:44 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 14.04.22 um 09:37 schrieb Michel D=C3=A4nzer:
> >>> On 2022-04-14 08:24, Christian K=C3=B6nig wrote:
> >>>> Am 13.04.22 um 18:14 schrieb Michel D=C3=A4nzer:
> >>>>> From: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >>>>>
> >>>>> Fixes compile errors with out-of-tree builds, e.g.
> >>>>>
> >>>>> ../drivers/gpu/drm/radeon/r420.c:38:10: fatal error: r420_reg_safe.=
h: No such file or directory
> >>>>>      38 | #include "r420_reg_safe.h"
> >>>>>         |          ^~~~~~~~~~~~~~~~~
> >>>>
> >>>> Well stuff like that usually points to a broken build environment.
> >>> Just a separate build directory. Specifically, I'm hitting the errors=
 with
> >>>
> >>>   make -C build-amd64 M=3Ddrivers/gpu/drm


Maybe

        make  O=3Dbuild-arm64   drivers/gpu/drm/

is the way you were searching for.

It builds only drivers/gpu/drm/
in the separate directory.




> >>>
> >>> Generated headers such as r420_reg_safe.h reside in the build directo=
ry, so source files in the source directory can't find them without an expl=
icit search path.
> >>
> >> I'm trying to swap back into my brain how all of this used to work, bu=
t
> >> that's a really long time ago that I tried this as well.
> >>
> >>> Are you saying that should get added automagically somehow?


For the kernel tree, yes, it is done automatically.

See the code in scripts/Makefile.lib:

# $(srctree)/$(src) for including checkin headers from generated source fil=
es
# $(objtree)/$(obj) for including generated headers from checkin source fil=
es
ifeq ($(KBUILD_EXTMOD),)
ifdef building_out_of_srctree
_c_flags   +=3D -I $(srctree)/$(src) -I $(objtree)/$(obj)
_a_flags   +=3D -I $(srctree)/$(src) -I $(objtree)/$(obj)
_cpp_flags +=3D -I $(srctree)/$(src) -I $(objtree)/$(obj)
endif
endif




But, you used M=3Ddrivers/gpu/drm.
So, it did not work.



M=3D is intended for building external modules.

I do not recommend it for in-tree drivers.






> >>
> >> Yes, exactly that. I'm like 95% sure that used to work, but I don't kn=
ow
> >> why exactly either.
> >>
> >>> FWIW, this is pretty common in the kernel according to git grep.
> >>
> >> Maybe Alex or somebody else with some more background in the kernel
> >> Makefiles could jump in and help here.
> >
> > I don't remember either.  I vaguely recall the build support for the
> > mkregtable stuff being reworked a while ago.  A quick zip through the
> > git logs shows a series from Masahiro Yamada from 2020.
>
> Yamada-san, can you help us? :)
>
> See https://patchwork.freedesktop.org/patch/482011/ for my patch.
>
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer



--
Best Regards
Masahiro Yamada
