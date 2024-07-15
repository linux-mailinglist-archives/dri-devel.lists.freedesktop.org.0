Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06659319EB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 20:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EF710E2A9;
	Mon, 15 Jul 2024 18:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kmdI8MVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E9F10E156;
 Mon, 15 Jul 2024 18:00:58 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-8138e2f2f69so38415639f.0; 
 Mon, 15 Jul 2024 11:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721066457; x=1721671257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOYbwMrV/O4jAT8P0a8rUtJkT/tF7xf5ebflegYxDG4=;
 b=kmdI8MVxsqruIquCQ19Y+cnOEbx8er3sSiiN1Ng7gH1aoOmTLR7OJ5yQeMCE55RHnt
 De1Y8aThSUijj561+qFfWdzTSR23RZRs7bXnJTYSHtkNNZ/QHdrqoQcwpZxuN9SxEB6m
 FYgP5cuQSWLvr8BB//I4+WyEQNhjrkhbsPf40mh/VdbtgzBRZ0UHh/aat4mjEUKnLaRB
 APgLp8HnYYTI8WM92utSAtFTVDoDKWeRiI91t3aNeR5mG08dtDNcseYNOedpuDTO11jd
 EKXHENjRLccSVFTpSiha0Xvh1A66OXGq0rLthcCCSG7pVRpzL6NRumwSeJEF9BRC8o/S
 f8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721066457; x=1721671257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOYbwMrV/O4jAT8P0a8rUtJkT/tF7xf5ebflegYxDG4=;
 b=fb61nafpQ+w2ILpJJSkuGOcJ6wc5ilVoffA9hBFIs2dO1djG5rKslssisyi46GEsHU
 2mbvu5aX88X35Xec8MklCrH2DLLqkPrTHKNynMczkFKRb6boRW3utmmtSXH/S+x78rOd
 dS4u08bQBVzIanyONbnvL/zWqDsM/SS8dY4T1e/K+a0qQaBmx0hgEfjKIFaBKYx6gfDn
 1htjcfNC785Js+gqZuSpxSGnmDJSwFxx8qk3/C0Swq0bUtAMIrQ/TON0YFT9QJlC/9Ik
 BRVf0o9vUWH7A94dNA3SMVOgiUzZSOLsp8YcAzIyUnqspQCFios2iHK4w3+traKA7qao
 J4Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU8gqqxJMP6qLQryK/OKBCOdwOj2kvAnutSZA5d6SQlkcmCYNq/FZCm1y8ynMEYl9D3AtrV9YN/J1Fs370qVtNSemZ1z1IebUogVuuEvteHYAmErp+l8pOsMDnb5Xhr8+Zf8Y0v7Rsx0o+K+eUhipcHSJQt2i4yLJzOe4ykdi3gOn1afraNJDZBxflfHfgLIJlN44I+Z5ZR/9M8x40GCYp+Oa5Brofn5mxMWvVb/l3rWCh1Ok=
X-Gm-Message-State: AOJu0Yw/7ry2uzaXWA0Usdl1xn9SughQsxyxf4YaaE1S3/rG//H2zURg
 liqAOJ06lGnOv2p4P06t2QOXhWD+DtxrGjx13gSVAmNK7tNayslFI+DRPf54K0P6oSnOvTpK6Zc
 xkYpBrf/wNDJ29cDIkYWBkO5d9Fk=
X-Google-Smtp-Source: AGHT+IFcGuXfUh6AFDn0k76fOiyVn1OhhrJ6yvUnZlqakwLRz4tCX/opcDQa3egBWhhCntMh2a6NU9aloRgRPANMli4=
X-Received: by 2002:a6b:440b:0:b0:807:4efc:9a64 with SMTP id
 ca18e2360f4ac-81546fc1d08mr43403739f.19.1721066456938; Mon, 15 Jul 2024
 11:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <ZoR40nWmpEV2Ly_6@bombadil.infradead.org>
 <CAJfuBxyxamRhOyz8WuL+7=eJkEKSw8jnAWjyAuqU2i7gvg-rsQ@mail.gmail.com>
 <CALwA+NbUCfEj_DzT5eMQ7_pSNpyp-zBe6PEL2XnMZrb303J4_Q@mail.gmail.com>
 <CAJfuBxzeYWWV1ikYagFpyFHdAQU4ReYPirksQFHbEzDxhXCfHA@mail.gmail.com>
 <CALwA+Naec_YHxHoKu8Ba_Bnuq2L3VXw1cT3=Tx3qC3mE5_BG1g@mail.gmail.com>
In-Reply-To: <CALwA+Naec_YHxHoKu8Ba_Bnuq2L3VXw1cT3=Tx3qC3mE5_BG1g@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Mon, 15 Jul 2024 12:00:30 -0600
Message-ID: <CAJfuBxxnTyqeGtS1mPBFqX2MYs7kgK49ZUQeR1oTe4UMC4ct5A@mail.gmail.com>
Subject: Re: [PATCH v9 00/53] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, jbaron@akamai.com, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 15, 2024 at 4:05=E2=80=AFAM =C5=81ukasz Bartosik <ukaszb@chromi=
um.org> wrote:
>
> On Sat, Jul 13, 2024 at 11:45=E2=80=AFPM <jim.cromie@gmail.com> wrote:
> >
> > On Fri, Jul 12, 2024 at 9:44=E2=80=AFAM =C5=81ukasz Bartosik <ukaszb@ch=
romium.org> wrote:
> > >
> > > On Wed, Jul 3, 2024 at 12:14=E2=80=AFAM <jim.cromie@gmail.com> wrote:
> > > >
> > > > On Tue, Jul 2, 2024 at 4:01=E2=80=AFPM Luis Chamberlain <mcgrof@ker=
nel.org> wrote:
> > > > >
> > > > > On Tue, Jul 02, 2024 at 03:56:50PM -0600, Jim Cromie wrote:
> > > > > > This fixes dynamic-debug support for DRM.debug, added via class=
maps.
> > > > > > commit bb2ff6c27bc9 (drm: Disable dynamic debug as broken)
> > > > > >
> > > > > > CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy was marked broken because drm.=
debug=3Dval
> > > > > > was applied when drm.ko was modprobed; too early for the yet-to=
-load
> > > > > > drivers, which thus missed the enablement.  My testing with
> > > > > > /etc/modprobe.d/ entries and modprobes with dyndbg=3D$querycmd =
options
> > > > > > obscured this omission.
> > > > > >
> > > > > > The fix is to replace invocations of DECLARE_DYNDBG_CLASSMAP wi=
th
> > > > > > DYNDBG_CLASSMAP_DEFINE for core, and DYNDBG_CLASSMAP_USE for dr=
ivers.
> > > > > > The distinction allows dyndbg to also handle the users properly=
.
> > > > > >
> > > > > > DRM is the only current classmaps user, and is not really using=
 it,
> > > > > > so if you think DRM could benefit from zero-off-cost debugs bas=
ed on
> > > > > > static-keys, please test.
> > > > > >
> > > > > > HISTORY
> > > > > >
> > > > > > 9/4/22  - ee879be38bc8..ace7c4bbb240 commited - classmaps-v1 dy=
ndbg parts
> > > > > > 9/11/22 - 0406faf25fb1..16deeb8e18ca commited - classmaps-v1 dr=
m parts
> > > > > >
> > > > > > https://lore.kernel.org/lkml/Y3XUrOGAV4I7bB3M@kroah.com/
> > > > > > greg k-h says:
> > > > > > This should go through the drm tree now.  The rest probably sho=
uld also
> > > > > > go that way and not through my tree as well.
> > > > >
> > > > > Can't this just be defined as a coccinelle smpl patch? Must easie=
r
> > > > > to read than 53 patches?
> > > > >
> > > >
> > > > perhaps it could - Im not sure that would be easier to review
> > > > than a file-scoped struct declaration or reference per driver
> > > >
> > > > Also, I did it hoping to solicit more Tested-by:s with drm.debug=3D=
0x1ff
> > > >
> > > > Jim
> > > >
> > >
> > > Jim,
> > >
> > > When testing different combinations of Y/M for TEST_DYNAMIC_DEBUG and
> > > TEST_DYNAMIC_DEBUG_SUBMOD in virtme-ng I spotted test failures:
> > >
> > > When the TEST_DYNAMIC_DEBUG=3DM and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> > > BASIC_TESTS, COMMA_TERMINATOR_TESTS, TEST_PERCENT_SPLITTING,
> > > TEST_MOD_SUBMOD selftests passed
> > > When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> > > BASIC_TESTS, COMMA_TERMINATOR_TESTS selftests passed, however
> > > TEST_PERCENT_SPLITTING selftest fails with ": ./dyndbg_selftest.sh:27=
0
> > > check failed expected 1 on =3Dpf, got 0"
> > > When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DY -
> > > BASIC_TESTS, COMMA_TERMINATOR_TESTS selftests passed, however
> > > TEST_PERCENT_SPLITTING selftest fails also with ":
> > > ./dyndbg_selftest.sh:270 check failed expected 1 on =3Dpf, got 0"
> > >
> > > Have I missed something ?
> > >
> >
> > I am not seeing those 2 failures on those 2 configs.
> >
> > most of my recent testing has been on x86-defconfig + minimals,
> > built and run using/inside virtme-ng
> >
> > the last kernel I installed on this hw was june 16, I will repeat that,
> > and report soon if I see the failure outside the vm
> >
> > I'll also send you my script, to maybe speed isolation of the differenc=
es.
> >
>
> Jim,
>
> I know why I saw these failures.
> I ran dyndbg_selftest.sh directly in thw directory
> tools/testing/selftests/dynamic_debug/.

thats odd.
I mostly run it from src-root,
also whereever make selftest target is/works (I forgot)

I went into that subdir and ran it there
I got no test differences / failures.

IIRC, the failure was on line 270, just after a modprobe.
can you further isolate it ?

> All works as expected when I run it from the top kernel directory.
> Here are the results:
>
> When the TEST_DYNAMIC_DEBUG=3DM and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> BASIC_TESTS, COMMA_TERMINATOR_TESTS, TEST_PERCENT_SPLITTING,
> TEST_MOD_SUBMOD selftests passed
>
> When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> BASIC_TESTS and COMMA_TERMINATOR_TESTS selftests passed,
> TEST_PERCENT_SPLITTING and TEST_PERCENT_SPLITTING selftests were
> skipped
>
> When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DY -
> BASIC_TESTS and COMMA_TERMINATOR_TESTS selftests passed,
> TEST_PERCENT_SPLITTING and TEST_PERCENT_SPLITTING selftests were
> skipped


thank you for running these config-combo tests.

are you doing these in a VM ?
and since Im asking, Ive done these combos on virtme-ng builds,
also installed & running on 2 x86 boxen.

could you add DRM=3Dm and a driver too,
and boot with drm.debug=3D0x1ff, dynamic_debug.verbose=3D3
the debug output should show all the class-work on modprobe,
for your easy inspection/grading ;-)

>
> Based on that maybe it would be worth it for the script to fail when
> it doesn't find a .config with an error message something like this:

if no config - they get to see more errors now.
if the solution isnt obvious to them, we can find out more ?

> "Kernel .config not found. Are you running the script from the
> kernel's top directory?"
>
> What do you think ?

the -rc0 window is open, Id rather not fiddle with this now.

Im gonna rebase onto 6.10, resend,
copy and rebase onto drm-mumble-next
then try to get into the DRM-CI river, see where that takes me.

thanks Lukas,
Jim

>
> Thanks,
> Lukasz
>
> > > Thanks,
> > > Lukasz
> > >
> > > > >   Luis
> > > > >
