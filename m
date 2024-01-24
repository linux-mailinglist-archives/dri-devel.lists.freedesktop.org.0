Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5383A553
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 10:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047BA897C8;
	Wed, 24 Jan 2024 09:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF8C897C8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 09:24:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C62FCCE30DD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 09:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DC7C43330
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706088286;
 bh=3X3w5+WaWx9oI+PDVbgb4SFTmLaSzwQCyqrR1JL3GVg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O7epV6rleZd4OaY/NUc4T1O3wt/RdjlqMeukTHBQEg5lQB/BjzrvGWTZ5JfCbKSPH
 OFJftUeMoSdIX6Xx9LfKJzvY5A8RNafGP9105Ajx+YSVfmP20Q3xdwuK5/YTPgZ90A
 ycS0dr07L0czVeRZLtpFLZBzfrbQx/Q89W3NjgUm3gSsESLw1o/D0b4P3etfgAYi9r
 MejJJNoTLiDrnAxrFbkoUYPCRHKglrnlU367FL48OY6LqiGuqFpQxjsQhi29gsu7G4
 9oeFO+AHSuLHRzqyDZxcpNnqTlu/+ARQUjS4xb9a1YvqNzkFUotoozoKVJsOW9nnIq
 v8eMVCwhkes5A==
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so3250443a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 01:24:46 -0800 (PST)
X-Gm-Message-State: AOJu0YwVdJbtmB+Y2VdTrJ8kTlSis+HYbl05g7tzeRK/mrvfln9/Z9y4
 IIRUUPG2hrOoUZ19Zhl2cmPK/ES6T9ijRqnatWDh6bhrAaSh+m7eMymIaNw+g/rf/Rx3k+Ivz/j
 VM37Hw+TPoQjBxznLI0StuikIFJo=
X-Google-Smtp-Source: AGHT+IGK0xFD1L7SsGw+4O3dazvsCIjMceipW07mb1A2J9/CFfPX/wcgVppaKx0TwDIfaaouHsvqKZnOLr5HExmW7Jg=
X-Received: by 2002:a05:6402:1292:b0:559:fd27:13af with SMTP id
 w18-20020a056402129200b00559fd2713afmr1479081edv.12.1706088284949; Wed, 24
 Jan 2024 01:24:44 -0800 (PST)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
 <CAAhV-H57G-vudtEH2EbZmZQjRQLHSFvT9BYMjfmrbYnBy-Gq1A@mail.gmail.com>
 <6f7023df-5352-4dcd-b16a-458a489485d3@suse.de>
In-Reply-To: <6f7023df-5352-4dcd-b16a-458a489485d3@suse.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 24 Jan 2024 17:24:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6KHkTnJdC8hX-BRQ5OTyDAdtfJSRn2dqKykjxQYSXqmQ@mail.gmail.com>
Message-ID: <CAAhV-H6KHkTnJdC8hX-BRQ5OTyDAdtfJSRn2dqKykjxQYSXqmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Jaak Ristioja <jaak@ristioja.ee>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thomas,

On Wed, Jan 24, 2024 at 4:16=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 24.01.24 um 04:00 schrieb Huacai Chen:
> > Hi, Javier and Thomas,
> >
> > On Wed, Jan 24, 2024 at 5:21=E2=80=AFAM Jaak Ristioja <jaak@ristioja.ee=
> wrote:
> >>
> >> Hi,
> >>
> >> I apologize for not finding the time to test this earlier.
> >>
> >> On 11.12.23 05:08, Huacai Chen wrote:
> >>> And Jaak, could you please test with the below patch (but keep the
> >>> original order in Makefile) and then give me the dmesg output?
> >>>
> >>> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
> >>> index 561be8feca96..cc2e39fb98f5 100644
> >>> --- a/drivers/video/aperture.c
> >>> +++ b/drivers/video/aperture.c
> >>> @@ -350,21 +350,29 @@ int
> >>> aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
> >>> char *na
> >>>           resource_size_t base, size;
> >>>           int bar, ret =3D 0;
> >>>
> >>> -       if (pdev =3D=3D vga_default_device())
> >>> +       printk("DEBUG: remove 1\n");
> >>> +
> >>> +       if (pdev =3D=3D vga_default_device()) {
> >>> +               printk("DEBUG: primary =3D true\n");
> >>>                   primary =3D true;
> >>> +       }
> >>>
> >>> -       if (primary)
> >>> +       if (primary) {
> >>> +               printk("DEBUG: disable sysfb\n");
> >>>                   sysfb_disable();
> >>> +       }
> >>>
> >>>           for (bar =3D 0; bar < PCI_STD_NUM_BARS; ++bar) {
> >>>                   if (!(pci_resource_flags(pdev, bar) & IORESOURCE_ME=
M))
> >>>                           continue;
> >>>
> >>> +               printk("DEBUG: remove 2\n");
> >>>                   base =3D pci_resource_start(pdev, bar);
> >>>                   size =3D pci_resource_len(pdev, bar);
> >>>                   aperture_detach_devices(base, size);
> >>>           }
> >>>
> >>> +       printk("DEBUG: remove 3\n");
> >>>           /*
> >>>            * If this is the primary adapter, there could be a VGA dev=
ice
> >>>            * that consumes the VGA framebuffer I/O range. Remove this
> >>>
> >>> [1]  https://lore.kernel.org/lkml/170222766284.86103.1102006076933072=
1008@leemhuis.info/T/#u
> >>
> >> Copy-pasting this from the e-mail body didn't work well, but I applied
> >> the changes manually to a 6.5.9 kernel without any of the other patche=
s.
> >> Here's the relevant dmesg output on the Lenovo L570:
> >>
> >> ...
> >> [    2.953405] ACPI: bus type drm_connector registered
> >> [    2.954014] i915 0000:00:02.0: [drm] VT-d active for gfx access
> >> [    2.954018] DEBUG: remove 1
> >> [    2.954020] DEBUG: remove 2
> >> [    2.954021] DEBUG: remove 2
> >> [    2.954023] DEBUG: remove 3
> >
> > My tmp patch is as follows:
> >
> > diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
> > index 561be8feca96..cc2e39fb98f5 100644
> > --- a/drivers/video/aperture.c
> > +++ b/drivers/video/aperture.c
> > @@ -350,21 +350,29 @@ int
> > aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
> > char *na
> >          resource_size_t base, size;
> >          int bar, ret =3D 0;
> >
> > -       if (pdev =3D=3D vga_default_device())
> > +       printk("DEBUG: remove 1\n");
> > +
> > +       if (pdev =3D=3D vga_default_device()) {
> > +               printk("DEBUG: primary =3D true\n");
> >                  primary =3D true;
> > +       }
> >
> > -       if (primary)
> > +       if (primary) {
> > +               printk("DEBUG: disable sysfb\n");
> >                  sysfb_disable();
> > +       }
> >
> >          for (bar =3D 0; bar < PCI_STD_NUM_BARS; ++bar) {
> >                  if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> >                          continue;
> >
> > +               printk("DEBUG: remove 2\n");
> >                  base =3D pci_resource_start(pdev, bar);
> >                  size =3D pci_resource_len(pdev, bar);
> >                  aperture_detach_devices(base, size);
> >          }
> >
> > +       printk("DEBUG: remove 3\n");
> >          /*
> >           * If this is the primary adapter, there could be a VGA device
> >           * that consumes the VGA framebuffer I/O range. Remove this
> >
> >  From the Jaak's dmesg, it is obvious that "pdev =3D=3D
> > vga_default_device()" is false, which causes sysfb_disable() to be not
> > called. And I think the simple-drm device is not provided by the i915
> > device in this case. So, can we unconditionally call sysfb_disable()
> > here, which is the same as aperture_remove_conflicting_devices()?
>
> Unfortunately, we cannot call sysfb_disable() unconditionally.
> Otherwise, we'd possibly remove simpledrm et al on the primary driver
> even pdev is not the primary device.
>
> Both, sysfb and vgaarb, are initialized with subsys_initcall_sync() and
> the order of initialization is most likely wrong in the broken builds.
> Hence, reordering the linking mitigates the problem.
OK, sysfb_init() should be after vgaarb, so I think we  can move
sysfb_init to be fs_initcall(). Though sysfb has nothing to do with
"file system", I found that there are already a lot of init functions
using fs_initcall().

Hi, Jaak, could you please make sysfb_initcall from
subsys_initcall_sync to be fs_initcall and see if your problem can be
fixed? Thank you very much.

Huacai

>
> I've long been thinking about how the graphics init code could be
> streamlined into something more manageable. But it's a larger effort.
>
> Best regards
> Thomas
>
> >
> > Huacai
> >
> >> [    2.954029] resource: resource sanity check: requesting [mem
> >> 0x00000000e0000000-0x00000000efffffff], which spans more than BOOTFB
> >> [mem 0xe0000000-0xe012bfff]
> >> [    2.954035] caller i915_ggtt_init_hw+0x88/0x120 mapping multiple BA=
Rs
> >> [    2.954061] i915 0000:00:02.0: [drm] Using Transparent Hugepages
> >> [    2.955103] Loading firmware: i915/kbl_dmc_ver1_04.bin
> >> [    2.955384] i915 0000:00:02.0: [drm] Finished loading DMC firmware
> >> i915/kbl_dmc_ver1_04.bin (v1.4)
> >> ...
> >> [    4.145013] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 =
on
> >> minor 0
> >> [    4.147101] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:
> >> no  post: no)
> >> [    4.147244] input: Video Bus as
> >> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input4
> >> [    4.147410] [drm] Initialized vgem 1.0.0 20120112 for vgem on minor=
 1
> >> [    4.147420] usbcore: registered new interface driver udl
> >> [    4.147500] [drm] Initialized simpledrm 1.0.0 20200625 for
> >> simple-framebuffer.0 on minor 2
> >> [    4.148643] Console: switching to colour frame buffer device 80x30
> >> [    4.153216] simple-framebuffer simple-framebuffer.0: [drm] fb0:
> >> simpledrmdrmfb frame buffer device
> >> [    4.154043] loop: module loaded
> >> [    4.156017] ahci 0000:00:17.0: version 3.0
> >> [    4.157373] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffer de=
vice
> >> ...
> >>
> >> J
> >>
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
