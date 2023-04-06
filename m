Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BB96D9077
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 09:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BC310EAF7;
	Thu,  6 Apr 2023 07:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D642410EAF7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 07:32:08 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bx42so12906173oib.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 00:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680766327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/DSO7OfVGYLg6YRT1xg7Rl40zRCVw5jeawk/5VIDIM=;
 b=J0xcqy4/o157Vkxd5wth+8Hh3h5HEmXOt8CnoLEm1fMEP47OWZUUQGlXSWyGYwzM/F
 mwMdb7dve0svdOHo0Bk16U2IIlHHRmN9ZUTWnMqicZn0mHvT2RTzp/pK+yeUEWzqOfXz
 ncLvaXSa8930QxSLc6GZZiacDc5mmTfVKvKnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680766327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/DSO7OfVGYLg6YRT1xg7Rl40zRCVw5jeawk/5VIDIM=;
 b=hCG2yycDDW5PRe+zHl8vO5m0+sjFkp6Ya3xN9iQsoW+7rE7YD/5cm7CkSuIgd2uuJg
 dI3u1anafsZJ3ON4kaYenjJux0FPjq217OvJywcwqQs1z0E3fuSSmeq5GJdZOMiovxkV
 VQDEL7tTmROLOC7DFldz1fwGnVkZFEwwjKJnbk0TmcJYExPokPIATH+Oo6YFop4cLAL/
 RPCkKciDZoXvTDPw3Xo/IUn0K6mOSlTKdRaPlqkRI+ktxofUlV240qId4du4V8gzSG5W
 E70PFx8U36W5+Nty/u96sXQwc1kuu1EN/EEb7ArK8h+QYDWjCOsHobPXMindr+mV3DNV
 22Bw==
X-Gm-Message-State: AAQBX9d8szQihrotuS1OfYrAETgDbb+xbLuf8+TRZbK7+nBhc00dtZL9
 icc6EoHl3MPxavYeJuz0/M88tFwq4AU2Pas4qfr/iQ==
X-Google-Smtp-Source: AKy350aLJrHe9Iv6tP0aWcFnn+UTFdGnp04KLcVFYe+sBjXDG6Are7TNP+igDKXKtUND9fRTMC4PHrcHsLq9d3nTrFA=
X-Received: by 2002:a05:6808:2807:b0:387:1afd:5924 with SMTP id
 et7-20020a056808280700b003871afd5924mr2465067oib.8.1680766327612; Thu, 06 Apr
 2023 00:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
 <ZC04hoHywz0ySzAW@phenom.ffwll.local>
 <3fd03c4c-3be6-e56b-faec-bd67a58cda09@suse.de>
 <ZC1BlNCbXPlmAhj0@phenom.ffwll.local>
 <eee11545-2a78-4556-be82-5178ea09d0d8@suse.de>
 <877cuqd1f8.fsf@minerva.mail-host-address-is-not-set>
 <ZC11J3og4Kc9ta6m@phenom.ffwll.local>
 <242ab20f-affe-b55a-6068-5ea634705cf6@suse.de>
 <ZC2beu/9inolwIlr@phenom.ffwll.local>
 <87bkk29smu.fsf@minerva.mail-host-address-is-not-set>
 <CAKMK7uGbPWE5mg2+ojxxEdfknDzmjDr+5n_y-t-nYNzDFE21EA@mail.gmail.com>
 <CAMeQTsam0efUrS=x+Eb+p8A3rXgCOUmA7UVjFB=9oAKFoepzOw@mail.gmail.com>
In-Reply-To: <CAMeQTsam0efUrS=x+Eb+p8A3rXgCOUmA7UVjFB=9oAKFoepzOw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 6 Apr 2023 09:31:56 +0200
Message-ID: <CAKMK7uEKab8UN4U=ztER_4zyODNJhxVhowJ6yDVBWuLd978MDQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Apr 2023 at 19:46, Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Wed, Apr 5, 2023 at 7:15=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
> >
> > On Wed, 5 Apr 2023 at 18:54, Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> > >
> > > Daniel Vetter <daniel@ffwll.ch> writes:
> > >
> > > > On Wed, Apr 05, 2023 at 04:32:19PM +0200, Thomas Zimmermann wrote:
> > >
> > > [...]
> > >
> > > >> > > >        /*
> > > >> > > >         * WARNING: Apparently we must kick fbdev drivers bef=
ore vgacon,
> > > >> > > >         * otherwise the vga fbdev driver falls over.
> > > >> > > >         */
> > > >> > > >        ret =3D vga_remove_vgacon(pdev);
> > > >> >
> > > >> > This isn't enough, we also nuke stuff that's mapping the vga fb =
range.
> > >
> > > Ah, also need aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_S=
IZE) then.
> > >
> > > [...]
> > >
> > > >> int aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
> > > >> {
> > > >>      aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
> > > >>
> > > >>      return vga_remove_vgacon(pdev);
> > > >> }
> > > >>
> > > >> And that can be called from gma500 and the pci aperture helper.
> > > >
> > > > But you still pass a pci_dev to that helper. Which just doesn't mak=
e any
> > > > sense to me (assuming your entire point is that this isn't just a n=
ormal
> > > > pci device but some special legacy vga thing), but if we go with (v=
oid)
> > > > then there's more refactoring to do because the vga_remove_vgacon a=
lso
> > > > wants a pdev.
> > > >
> > > > All so that we don't call aperture_detach_devices() on a bunch of p=
ci
> > > > bars, which apparently is not problem for any other driver, but abs=
olutely
> > > > is a huge problem for gma500 somehow.
> > > >
> > > > I don't understand why.
> > > >
> > >
> > > Yeah, agreed that if vga_remove_vgacon() isn't enough and another hel=
per
> > > is needed then starts to get a little silly. Maybe one option is to a=
dd a
> > > 3rd param to aperture_remove_conflicting_pci_devices() and skip the l=
ogic
> > > to iterate over PCI bars and call aperture_remove_conflicting_devices=
() ?
> >
> > The thing I don't get: Why does this matter for gma500 and not any of
> > the other pci devices? Look at your gpu, realize there's a lot more
> > than the one pci bar for vram or stolen memory, realize that we're
> > nuking bars that cannot possible contain the framebuffer for everyone
> > else too. Like the entire "gpus have a lot of bars" thing is the
> > reason why I pulled the sysfb_disable one level up, because we've been
> > doing that quite a few times before this patch (yes it's not the main
> > thing, but the side-effect cleanup is why I've gone down this rabbit
> > hole and wrote the entire series here):
> >
> > https://lore.kernel.org/dri-devel/20230404201842.567344-7-daniel.vetter=
@ffwll.ch/
> >
> > But somehow for gma500 it's a problem, while for everyone else it's
> > fine. That's the part I dont get, or Thomas&me have been talking past
> > each another and there's another issue that I'm missing.
> > -Daniel
>
> I'm also getting confused here.
>
> AFAIK the stolen memory works the same for gma500 hardware as other
> Intel GPUs. Are you saying that there is a difference in how gma500
> hardware works? I always assumed that i915 got away with not dealing
> much with stolen memory because it simply doesn't use it for
> allocations. In gma500 we use it for fbdev and cursors. The actual
> pages reserved by the bios can be accessed through a pci bar if you
> map it so (which IIRC we do) but I suppose that doesn't help
> identifying it as a range reserved by other drivers.

The other integrated gpu have their fw fb behind a pci bar, and stolen
is often entirely hidden from the cpu for direct access. gma500 seems
different with having stolen as just a specially marked up range of
normal system memory. That's why the usual pci helper doesn't catch
everything for gma500.

> The reason I've kept the stolen allocation logic is because some
> gma500 systems don't have a lot of memory. But that is mostly the old
> Pouslbo systems. Perhaps it is time to ditch the stolen allocation
> code?

Yeah that's all fine.
-Daniel

>
> -Patrik
>
> >
> > > > Consider this me throwing in the towel. If you&Javier are convinced=
 this
> > > > makes sense please type it up and merge it, but I'm not going to ty=
pe
> > > > something that just doesn't make sense to me.
> > >
> > > Honestly, I would just go with the double drm_aperture_remove_*() hel=
per
> > > calls (your original patch) unless that causes real issues. There is =
no
> > > point on blocking all your series just for this IMO.
> > >
> > > Then latter if Thomas has strong opinions can send a follow-up patch =
for
> > > the gma500 driver and the aperture helpers.
> > >
> > > > -Daniel
> > > >
> > >
> > > --
> > > Best regards,
> > >
> > > Javier Martinez Canillas
> > > Core Platforms
> > > Red Hat
> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
