Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DB22E883A
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 19:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AAE898AF;
	Sat,  2 Jan 2021 18:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D68898AF;
 Sat,  2 Jan 2021 18:35:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m5so26850237wrx.9;
 Sat, 02 Jan 2021 10:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GpHuNKw7qLRBcfNt3Fox/IAI2b27BTyigIUJlqA9DoU=;
 b=uwdgIiUdTbEEi6+uNon0c6gFbUsMydqRmqxd9a6KQuzEHx4Ggy68dB7rq+TL8z3M9M
 ycBPPVg47VEidGvW0Y4RglN+hi/jmcKif+XrOSckWIg7/XSLzUbYK2SglrPwtzHJUmJH
 aW3KMyZGFRB+Z2AnCxFOM3KjcPvKTbImVFU2CSWz4qrT3kbgiNaPB2fVMOULesa93z+B
 D+IuWLffOWdfUvIvMVBreMiXH0jH1HDPgS6bauz8+WKM0a6xKBQgWTRhsF8BeBHVeT6a
 htzVweUc6Ib4QU5waENUOntDT4kcH8+6f0T/m/p/VYROy4Jm6DQqDmjaJ9NrjULPWmkb
 Vgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GpHuNKw7qLRBcfNt3Fox/IAI2b27BTyigIUJlqA9DoU=;
 b=B1chqvxwRj8hvWgpzT7+bXmcj2FbAizyicyxWg5n1PUOXl8aegVjow7Sz44nSswA30
 WUr4d9neDWpIbGtnVDL/RKO33B3SMspEQq3J9zUJ3xqKHkKgSlztjvETDhof5od2U74Q
 yDODah5JhrJWYavAqL2bOKSB4Em5l/ATHZcF3u4ouh1QPThGo1ZlItf3QmswUql1yvMy
 x/8AoMI3RcjYPCIldZ97BmXtq+5BFxCAFx4IhiqPxCTWRVrAyxl4fbcbLjf0vAgqFjzd
 dgOWcbfGidNfXbW4VzydYDdjktITry1fi6OrMV5yS029hl8P9EwPUUd7FfLEmj/I1TSs
 peww==
X-Gm-Message-State: AOAM531ieOCKCelDUorD5nWBGT0nlCdRalmIjtGNVTxM9DFbb6gQF7vB
 b+ODtlcBgqm9fnk6FihMtWj75FEuBhpwCjgWo4o=
X-Google-Smtp-Source: ABdhPJzQjpBPVEFZhAunvHy7HqDlPUm05Y5R0abwPyaiBuYnZlBOaV0U6/EUtr1aEAgCFerWSGm0jwGte1Xf7jtbLOc=
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr72329819wrn.107.1609612505304; 
 Sat, 02 Jan 2021 10:35:05 -0800 (PST)
MIME-Version: 1.0
References: <20201231205136.11422-1-mario.kleiner.de@gmail.com>
 <CAP+8YyE4H5mL3uj-T4uG0nz75XmgaZ6etXX6YxxdtO4-rL=5qA@mail.gmail.com>
 <CAEsyxyiLrpB872LdAW8-HMVC-rxf7YF8K+B51Ae9nyEvGaG1Sw@mail.gmail.com>
 <CAP+8YyHcUt0Rv_0ov5DCcm+wxeQFCqiW1vC_Pe4TdKzRzmu3fw@mail.gmail.com>
In-Reply-To: <CAP+8YyHcUt0Rv_0ov5DCcm+wxeQFCqiW1vC_Pe4TdKzRzmu3fw@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Sat, 2 Jan 2021 19:34:54 +0100
Message-ID: <CAEsyxyiRNz8GRfM1hAxzVHAFwYzkyiM6OTvvjOAHtQCoCyhRjg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix pageflipping for XOrg in Linux 5.11+
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 2, 2021 at 4:49 PM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> On Sat, Jan 2, 2021 at 4:05 PM Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
> >
> > On Sat, Jan 2, 2021 at 3:05 PM Bas Nieuwenhuizen
> > <bas@basnieuwenhuizen.nl> wrote:
> > >
> > > I think the problem here is that application A can set the FB and then
> > > application B can use getfb2 (say ffmpeg).
> >
> >
> > Yes. That, and also the check for 'X' won't get us far, because if i
> > use my own software Psychtoolbox under Vulkan in direct display mode
> > (leased RandR outputs), e.g., under radv or amdvlk, then the ->comm
> > name will be "PTB mainthread" and 'P' != 'X'. But the Vulkan drivers
> > all use legacy pageflips as well in der WSI/drm, so if Vulkan gets
> > framebuffers with DCC modifiers, it would just fail the same way.
> >
> > Neither would it work to check for atomic client, as they sometimes
> > use atomic commit ioctl only for certain use cases, e.g., setting HDR
> > metadata, but still use the legacy pageflip ioctl for flipping.
> >
> > So that patch of mine is not the proper solution for anything non-X.
> >
> > >
> > > https://lists.freedesktop.org/archives/dri-devel/2021-January/292761.html
> > > would be my alternative patch.
> > >
> >
> > I also produced and tested hopefully better alternative to my original
> > one yesterday, but was too tired to send it. I just sent it out to
> > you:
> > https://lists.freedesktop.org/archives/dri-devel/2021-January/292763.html
> >
> > This one keeps the format_info check as is for non-atomic drivers, but
> > no longer rejects pageflip if the underlying kms driver is atomic. I
> > checked, and current atomic drivers use the drm_atomic... helper for
> > implementing legacy pageflips, and that helper just wraps the pageflip
> > into a "set new fb on plane" + atomic check + atomic commit.
> >
> > My understanding is that one can do these format changes safely under
> > atomic commit, so i hope this would be safe and future proof.
>
> So I think the difference between your patch and mine seem to boil
> down to whether we want any uabi extension, since AFAICT none of the
> pre-atomic drivers support modifiers.
>

That's a point: Although the uabi extension would only relax rules,
instead of tighten them, so current drm clients would be ok, i guess.

Afaict the current non-atomic modesetting drivers are:

gma500, shmobile, radeon, nouveau, amdgpu non-DC.

gma500, shmobile and radeon don't use modifiers, and probably won't
get any in the future?

Also amdgpu without DC? Atm. you only enable explicit modifiers for >=
FAMILY_AI, ie. Vega and later, and DC is a requirement for Vega and
later, so modifiers ==> DC ==> atomic.

But some of your code was moved from amdgpu_dm to amdgpu_display
specifically to allow compiling it without DC, and any client i tested
apart from Waylands weston (and that only for cursor planes) didn't
use addfb2 ioctl with modifiers at all, so all of X and Vulkan
currently hits the new convert_tiling_flags_to_modifier() fallback
code that converts old style tiling flags into modifiers. That
fallback path is the reason for triggering this issue in the first
place, as it converts some tiling flags to DCC/DCC-retile modifiers
and therefore changes the format_info.

Modifiers are only enabled if DC is on. So as long as nobody decides
to add modifiers in the legacy non-DC kms path, we'd be ok.

I'm less sure about nouveau. It uses modifiers, but has atomic support
only on nv50+ and that atomic support is off by default -- needs a
nouveau.nouveau_atomic=1 boot parameter to switch it on. It seems to
enable modifier support unconditionally regardless if atomic or not,
see:
https://elixir.bootlin.com/linux/v5.11-rc1/source/drivers/gpu/drm/nouveau/nouveau_display.c#L703

Atm. nouveau doesn't assign a new format_info though, so wouldn't
trigger this issue atm.

So i think the decision is about relaxing uabi a bit with my patch,
vs. less future-proofing with your patch?

Atm. both patches would solve the immediate problem, which is very
serious for my users' use cases, so I'd be ok with any of them. I just
don't want this issue to repeat in the future. Tracking it down killed
almost two full days for me, although I involuntarily learned more
about the current state of modifiers in kernel and user space than I
ever thought I wanted to know :/.

-mario



> >
> > > (I'm not good at detecting the effects of tearing  apparently but
> > > tested this avoids the pageflip failure by debug-prints)
> >
> >
> > XOrg log (e.g., ~/.local/share/xorg/XOrg0.log on current Ubuntu's) is
> > a good place on native XOrg, where the amdgpu-ddx was flooding the log
> > with present flip failures. Or drm.debug=4 for the kernel log.
> >
> > Piglit has the OML_sync_control tests for timing correctness, although
> > they are mostly pointless if not run in fullscreen mode, which they
> > are not by default.
> >
> > I can also highly recommend (sudo apt install octave-psychtoolbox-3)
> > on Debian/Ubutu based systems for X11. It is used for neuroscience and
> > medical research and critically depends on properly working pageflips
> > and timestamping on native X11/GLX under OpenGL and recently also
> > under Vulkan/WSI (radv,anv,amdvlk) in direct display mode. Working
> > FOSS AMD and Intel are especially critical for this research, so far
> > under X11+Mesa/OpenGL, but lately also under Vulkan direct display
> > mode. It has many built-in correctness tests and will shout angrily if
> > something software-detectable is broken wrt. pageflipping or timing.
> > E.g., octave-cli --eval PerceptualVBLSyncTest
> > PerceptualVBLSyncTest creates a flicker pattern that will tear like
> > crazy under Mesa if pageflipping isn't used. Also good to test
> > synchronization on dual-display setups, e.g., for udal-display stereo
> > presentation.
> >
> > I was actually surprised that this patch made it through the various
> > test suites and into drm-next. I thought page-flipping was covered
> > well enough somewhere.
>
> I don't think there are any tests using the AMDGPU implicit modifiers
> (not in IGT for anything except linear at least)
>
> >
> > Happy new year!
> > -mario
> >
> > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
