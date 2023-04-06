Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064846D94E0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E9210EB5F;
	Thu,  6 Apr 2023 11:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E942110EB5F;
 Thu,  6 Apr 2023 11:16:41 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id ml21so14971580pjb.4;
 Thu, 06 Apr 2023 04:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680779801;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rHYb6HpZexNXpJPoSYlJ81so+XmwouNfzYZUA6PN18U=;
 b=SDaFVzdAZ+PGA1ek7sqxgPqbwZ9e8KwjO6kClHWchQUtfi/N49prAHd7IdkbvOwWOZ
 DDpc8RwXY+XPJeA39kRMrRgHknt+we5V7J+JHaYX9uqFd/iDJ1A1rKFxn75FVGwRN7C9
 Rdbzb5wpwizbAz8a5w6B4/69ooWI+qcE8ct/52b2eImoo8RvSEHLXnPOtbqnW7eSW6L9
 xxaoGQJ/MgI5t5o0nrkC1xWa4wVSzkgz4m7Zvjs6kmgLtlBFeUoQQP1O6aHzFLulaVGI
 eSMeh0uBunp4exeqgVl9B6IKPri0dVWGCtTmJTB+NflZYOgv1UDcFSw+QRTHV2N0jHe+
 MH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680779801;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rHYb6HpZexNXpJPoSYlJ81so+XmwouNfzYZUA6PN18U=;
 b=TMlqI1gtksENkiZWkc9WewW8kBbhJeHk0I66jN9SrwHmon78Pez1qmyD4uXY7BPhdv
 HkiX1Z/rja5JmtCaDuU3WlnpTv8J5ehQxzL+loF7HOAEFgMt9jQbNIiAqFvky6mbWtyi
 KVusjqySearJKCRmM/8PRBta02NGvtp+xy7SWQMhPSuMIv6m8zpGXx8R5E9e7RoGBKPB
 qijIBeeARuCoEMPXowkbgTrmXnrExfXkyTYS8w05YhQUQ/7fFeuF/GNL1u+dYtzyhtkn
 4ltFxEe2urQ3Ea80QZ1s+pX7MsXaODkF7FjD7O1iXeIu38mwP4rM9yne4KQB4Y4SX//e
 dj8g==
X-Gm-Message-State: AAQBX9dnOSssUXDYilM93BBIZfMUYgm1GovldNmErdyIXo0VWdj3jbRT
 WTWVfcfOWOdnicq+2zG9f3tjIkOLS3xL+4bSmj4=
X-Google-Smtp-Source: AKy350arGCXxw7uauw789YlI8TO/HwCaYawY3nlDmw4c5UA3Zi2ES5khLwASbt7Bf6ex+oy5vMfzdUDRk2wt+5Ej38c=
X-Received: by 2002:a17:902:8684:b0:1a0:6b23:7b55 with SMTP id
 g4-20020a170902868400b001a06b237b55mr3912998plo.4.1680779800802; Thu, 06 Apr
 2023 04:16:40 -0700 (PDT)
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
 <CAKMK7uEKab8UN4U=ztER_4zyODNJhxVhowJ6yDVBWuLd978MDQ@mail.gmail.com>
In-Reply-To: <CAKMK7uEKab8UN4U=ztER_4zyODNJhxVhowJ6yDVBWuLd978MDQ@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 6 Apr 2023 13:16:29 +0200
Message-ID: <CAMeQTsbs01-B4rk3v=+emAm2o2pKB6Ndpz=3AG5VEiHso1D7qA@mail.gmail.com>
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

On Thu, Apr 6, 2023 at 9:32=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> On Wed, 5 Apr 2023 at 19:46, Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> >
> > On Wed, Apr 5, 2023 at 7:15=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> =
wrote:
> > >
> > > On Wed, 5 Apr 2023 at 18:54, Javier Martinez Canillas
> > > <javierm@redhat.com> wrote:
> > > >
> > > > Daniel Vetter <daniel@ffwll.ch> writes:
> > > >
> > > > > On Wed, Apr 05, 2023 at 04:32:19PM +0200, Thomas Zimmermann wrote=
:
> > > >
> > > > [...]
> > > >
> > > > >> > > >        /*
> > > > >> > > >         * WARNING: Apparently we must kick fbdev drivers b=
efore vgacon,
> > > > >> > > >         * otherwise the vga fbdev driver falls over.
> > > > >> > > >         */
> > > > >> > > >        ret =3D vga_remove_vgacon(pdev);
> > > > >> >
> > > > >> > This isn't enough, we also nuke stuff that's mapping the vga f=
b range.
> > > >
> > > > Ah, also need aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS=
_SIZE) then.
> > > >
> > > > [...]
> > > >
> > > > >> int aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
> > > > >> {
> > > > >>      aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE)=
;
> > > > >>
> > > > >>      return vga_remove_vgacon(pdev);
> > > > >> }
> > > > >>
> > > > >> And that can be called from gma500 and the pci aperture helper.
> > > > >
> > > > > But you still pass a pci_dev to that helper. Which just doesn't m=
ake any
> > > > > sense to me (assuming your entire point is that this isn't just a=
 normal
> > > > > pci device but some special legacy vga thing), but if we go with =
(void)
> > > > > then there's more refactoring to do because the vga_remove_vgacon=
 also
> > > > > wants a pdev.
> > > > >
> > > > > All so that we don't call aperture_detach_devices() on a bunch of=
 pci
> > > > > bars, which apparently is not problem for any other driver, but a=
bsolutely
> > > > > is a huge problem for gma500 somehow.
> > > > >
> > > > > I don't understand why.
> > > > >
> > > >
> > > > Yeah, agreed that if vga_remove_vgacon() isn't enough and another h=
elper
> > > > is needed then starts to get a little silly. Maybe one option is to=
 add a
> > > > 3rd param to aperture_remove_conflicting_pci_devices() and skip the=
 logic
> > > > to iterate over PCI bars and call aperture_remove_conflicting_devic=
es() ?
> > >
> > > The thing I don't get: Why does this matter for gma500 and not any of
> > > the other pci devices? Look at your gpu, realize there's a lot more
> > > than the one pci bar for vram or stolen memory, realize that we're
> > > nuking bars that cannot possible contain the framebuffer for everyone
> > > else too. Like the entire "gpus have a lot of bars" thing is the
> > > reason why I pulled the sysfb_disable one level up, because we've bee=
n
> > > doing that quite a few times before this patch (yes it's not the main
> > > thing, but the side-effect cleanup is why I've gone down this rabbit
> > > hole and wrote the entire series here):
> > >
> > > https://lore.kernel.org/dri-devel/20230404201842.567344-7-daniel.vett=
er@ffwll.ch/
> > >
> > > But somehow for gma500 it's a problem, while for everyone else it's
> > > fine. That's the part I dont get, or Thomas&me have been talking past
> > > each another and there's another issue that I'm missing.
> > > -Daniel
> >
> > I'm also getting confused here.
> >
> > AFAIK the stolen memory works the same for gma500 hardware as other
> > Intel GPUs. Are you saying that there is a difference in how gma500
> > hardware works? I always assumed that i915 got away with not dealing
> > much with stolen memory because it simply doesn't use it for
> > allocations. In gma500 we use it for fbdev and cursors. The actual
> > pages reserved by the bios can be accessed through a pci bar if you
> > map it so (which IIRC we do) but I suppose that doesn't help
> > identifying it as a range reserved by other drivers.
>
> The other integrated gpu have their fw fb behind a pci bar, and stolen
> is often entirely hidden from the cpu for direct access. gma500 seems
> different with having stolen as just a specially marked up range of
> normal system memory. That's why the usual pci helper doesn't catch
> everything for gma500.

Right, now I get it. You don't have the GATT on some systems so the
range can never be inside the aperture on those systems anyway.

The GATT probably went away because there is no need for it since you
don't get coherency with the PowerVR parts anyway.

Thanks for explaining

>
> > The reason I've kept the stolen allocation logic is because some
> > gma500 systems don't have a lot of memory. But that is mostly the old
> > Pouslbo systems. Perhaps it is time to ditch the stolen allocation
> > code?
>
> Yeah that's all fine.
> -Daniel
>
> >
> > -Patrik
> >
> > >
> > > > > Consider this me throwing in the towel. If you&Javier are convinc=
ed this
> > > > > makes sense please type it up and merge it, but I'm not going to =
type
> > > > > something that just doesn't make sense to me.
> > > >
> > > > Honestly, I would just go with the double drm_aperture_remove_*() h=
elper
> > > > calls (your original patch) unless that causes real issues. There i=
s no
> > > > point on blocking all your series just for this IMO.
> > > >
> > > > Then latter if Thomas has strong opinions can send a follow-up patc=
h for
> > > > the gma500 driver and the aperture helpers.
> > > >
> > > > > -Daniel
> > > > >
> > > >
> > > > --
> > > > Best regards,
> > > >
> > > > Javier Martinez Canillas
> > > > Core Platforms
> > > > Red Hat
> > > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
