Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085C86D852B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 19:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D54010E220;
	Wed,  5 Apr 2023 17:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749E610E1E2;
 Wed,  5 Apr 2023 17:46:16 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id l184so13131341pgd.11;
 Wed, 05 Apr 2023 10:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680716775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RjwHNkPIv0gqvcJDvLcIFhQPDzxKuxipVi5C1/h0iY=;
 b=k9YsTrT7iglyB2h5BrYi0vc5gxR8cZ7mA/lKvhgo4IuUxMdXaMgAXnKYkCMVBQtCi0
 ljwIUYA2lA8J8aHiwni8E0KhG5/ZNFZ3ZV6KeDL1lsoRo2T207nZaYscJ4AwpBG1YZDo
 HJqt9hP4IRk7ZbxfE3huj8CMuifFs4v8o8vaCoP0CmctgLiPVczX2UsA5igwRQB4ju7S
 V32yjMrJp8zy6njXl7h66QxCkC9rN/KgidzY6FpF6VptCDdD4URfPu+biSEKfDC1P22J
 eC3JBo+zjazbSWhopXmnysTp4hqFFnMx5UFFNLdNfPzokdC7RwSuueZ8BbyRZiYcciPw
 ujXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680716775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1RjwHNkPIv0gqvcJDvLcIFhQPDzxKuxipVi5C1/h0iY=;
 b=0DZLXwpRQql8uJ6Gvib9OA4tjfejh9RBIJLhbWN/OG1bmXzaPi3DNgokl0Ep1DpesB
 YZ0Z4wgkYPBdLP7gejUUMeUwySL8u9VA19AfLi6XOkqU0OtM1yI08pifsGpg2Ooz+PUy
 NMLM8O2ZbE87FoRUJXwFkaLMUIXL0/KABMsVWN9mMl1J+sNSMoprN6NPt2DkyAQpFKne
 7lm0r9U4EegS140d1F0vR048ccVN7wd3qsCWigwdsgv07DPD/2PMcm/ok1NqUZnXCi+R
 gQxtn6RW5xV4MfQW4BrfcL0+wYvVFyGzzc/0qH/sqFTHlTeJItfMeQ3cidfqhdvUtrKR
 u+ag==
X-Gm-Message-State: AAQBX9ceuuPepBd81sx1U4stx29wu4ZNYLNdf5xsWDUqUNTKs0jgx9pj
 omvi5N18R1+gPo1Ir/LDZZ1clx8CikQkYWQcf9A=
X-Google-Smtp-Source: AKy350YPh2RyfQOOasMXAGbUKWcCvg3I6pkQCHSo04I6plSURlf5F/BifW7aJ7Dt8zM6N6tTmGU7wiZGkoHb/mwcDpA=
X-Received: by 2002:a63:f307:0:b0:50c:bd0:eb8c with SMTP id
 l7-20020a63f307000000b0050c0bd0eb8cmr2253298pgh.6.1680716775437; Wed, 05 Apr
 2023 10:46:15 -0700 (PDT)
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
In-Reply-To: <CAKMK7uGbPWE5mg2+ojxxEdfknDzmjDr+5n_y-t-nYNzDFE21EA@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 5 Apr 2023 19:46:04 +0200
Message-ID: <CAMeQTsam0efUrS=x+Eb+p8A3rXgCOUmA7UVjFB=9oAKFoepzOw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
To: Daniel Vetter <daniel@ffwll.ch>
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

On Wed, Apr 5, 2023 at 7:15=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> On Wed, 5 Apr 2023 at 18:54, Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> >
> > Daniel Vetter <daniel@ffwll.ch> writes:
> >
> > > On Wed, Apr 05, 2023 at 04:32:19PM +0200, Thomas Zimmermann wrote:
> >
> > [...]
> >
> > >> > > >        /*
> > >> > > >         * WARNING: Apparently we must kick fbdev drivers befor=
e vgacon,
> > >> > > >         * otherwise the vga fbdev driver falls over.
> > >> > > >         */
> > >> > > >        ret =3D vga_remove_vgacon(pdev);
> > >> >
> > >> > This isn't enough, we also nuke stuff that's mapping the vga fb ra=
nge.
> >
> > Ah, also need aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZ=
E) then.
> >
> > [...]
> >
> > >> int aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
> > >> {
> > >>      aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
> > >>
> > >>      return vga_remove_vgacon(pdev);
> > >> }
> > >>
> > >> And that can be called from gma500 and the pci aperture helper.
> > >
> > > But you still pass a pci_dev to that helper. Which just doesn't make =
any
> > > sense to me (assuming your entire point is that this isn't just a nor=
mal
> > > pci device but some special legacy vga thing), but if we go with (voi=
d)
> > > then there's more refactoring to do because the vga_remove_vgacon als=
o
> > > wants a pdev.
> > >
> > > All so that we don't call aperture_detach_devices() on a bunch of pci
> > > bars, which apparently is not problem for any other driver, but absol=
utely
> > > is a huge problem for gma500 somehow.
> > >
> > > I don't understand why.
> > >
> >
> > Yeah, agreed that if vga_remove_vgacon() isn't enough and another helpe=
r
> > is needed then starts to get a little silly. Maybe one option is to add=
 a
> > 3rd param to aperture_remove_conflicting_pci_devices() and skip the log=
ic
> > to iterate over PCI bars and call aperture_remove_conflicting_devices()=
 ?
>
> The thing I don't get: Why does this matter for gma500 and not any of
> the other pci devices? Look at your gpu, realize there's a lot more
> than the one pci bar for vram or stolen memory, realize that we're
> nuking bars that cannot possible contain the framebuffer for everyone
> else too. Like the entire "gpus have a lot of bars" thing is the
> reason why I pulled the sysfb_disable one level up, because we've been
> doing that quite a few times before this patch (yes it's not the main
> thing, but the side-effect cleanup is why I've gone down this rabbit
> hole and wrote the entire series here):
>
> https://lore.kernel.org/dri-devel/20230404201842.567344-7-daniel.vetter@f=
fwll.ch/
>
> But somehow for gma500 it's a problem, while for everyone else it's
> fine. That's the part I dont get, or Thomas&me have been talking past
> each another and there's another issue that I'm missing.
> -Daniel

I'm also getting confused here.

AFAIK the stolen memory works the same for gma500 hardware as other
Intel GPUs. Are you saying that there is a difference in how gma500
hardware works? I always assumed that i915 got away with not dealing
much with stolen memory because it simply doesn't use it for
allocations. In gma500 we use it for fbdev and cursors. The actual
pages reserved by the bios can be accessed through a pci bar if you
map it so (which IIRC we do) but I suppose that doesn't help
identifying it as a range reserved by other drivers.

The reason I've kept the stolen allocation logic is because some
gma500 systems don't have a lot of memory. But that is mostly the old
Pouslbo systems. Perhaps it is time to ditch the stolen allocation
code?

-Patrik

>
> > > Consider this me throwing in the towel. If you&Javier are convinced t=
his
> > > makes sense please type it up and merge it, but I'm not going to type
> > > something that just doesn't make sense to me.
> >
> > Honestly, I would just go with the double drm_aperture_remove_*() helpe=
r
> > calls (your original patch) unless that causes real issues. There is no
> > point on blocking all your series just for this IMO.
> >
> > Then latter if Thomas has strong opinions can send a follow-up patch fo=
r
> > the gma500 driver and the aperture helpers.
> >
> > > -Daniel
> > >
> >
> > --
> > Best regards,
> >
> > Javier Martinez Canillas
> > Core Platforms
> > Red Hat
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
