Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635387FF68
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 15:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4551310E8CA;
	Tue, 19 Mar 2024 14:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z1025+5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068C510E8CA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 14:16:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8D8960EE0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 14:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B480C43394
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710857790;
 bh=c4u3kcu2TjIGqZyddrex609B70FHJabhU/6RpwTEW/0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z1025+5/rC5eMSpj+NEtuYmEe4fMRNKZsiLPlZ6fGXWSTz9pCtk8CiMWu993iiHHv
 M+Hi7dCHMOCPRoxmfJlSC4pqXrm8s0+mCMTtwtO2WepjdUmsmRu0BwdNUbzvrkt8vY
 fFE5EVEabe0tV/bDnGuA8jAOM8jih5XeGEEVQINn/lIbTMe9+6CwinivqATrivIdZK
 X+8bVKY7d+Fv6HPvxhsjqHJy5u1uV7pUWW1dNVf0nPFl7q3uRfTtnVeeU23DM09qwA
 Y+5BJpT9SP2QeKXZRrL709BKD55y7rfkpUx5QSR6JBebl39o2HaoDCJ2KANvaGnfWK
 oRLHgWpxT4kEQ==
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a46dd7b4bcbso97985766b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 07:16:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYrJwhENrryjh7AbyLTtjdIgm/F1tUatie7JIbxOiyEA5DGdHxr7bY7L08eG4AWVA/IOc49XP7Cb8KrhiSbU+BIWT/auMchP4zzjaZutdI
X-Gm-Message-State: AOJu0YwntehiphI+wiL8qcFSAArfjS72y8XqcMT7wQf3MxbenL74ehB/
 6MVxT63P0HMR8erMsb/P3/WUFga2mnMAweTTH8Y2shHNGvdgaC3zWd56om45FAXVMy4VWE4B9Gj
 X1Cds2ojDaoEaQLXdkUGRoBL/OJ4=
X-Google-Smtp-Source: AGHT+IERvjJks5ojuMHIXkwFvLzIqnvJWYWKn2Ob36KkWqAYCAtammX8jvbzBNDeHTiu62mP1J7zFyg/bmp0U6KM6z0=
X-Received: by 2002:a17:906:300f:b0:a46:da87:26e9 with SMTP id
 15-20020a170906300f00b00a46da8726e9mr1371618ejz.77.1710857789037; Tue, 19 Mar
 2024 07:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
 <CAAhV-H5gFqd3z4Etzuz_q3Hs6A4BP0yzJ69GgMcJzJBRdOwGSA@mail.gmail.com>
 <5f52d611-6ec9-429c-aabf-956d23a8c74d@ristioja.ee>
In-Reply-To: <5f52d611-6ec9-429c-aabf-956d23a8c74d@ristioja.ee>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 19 Mar 2024 22:16:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4MKRXb=STOneivyHsU6o2vU=P9cQMwjRo+PKnPpJ67Rw@mail.gmail.com>
Message-ID: <CAAhV-H4MKRXb=STOneivyHsU6o2vU=P9cQMwjRo+PKnPpJ67Rw@mail.gmail.com>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Jaak Ristioja <jaak@ristioja.ee>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>
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

Hi, Jaak,

On Mon, Mar 18, 2024 at 11:42=E2=80=AFPM Jaak Ristioja <jaak@ristioja.ee> w=
rote:
>
> Hi Huacai,
>
> Uh, no, sorry, I did not get to test such changes. From what Thomas
> wrote I presumed that this got fixed and no further action would be
> required.
>
> To speed things up I would appreciate it if you provided a patch. As I
> worked around the problem for the end user by changing the kernel
> configuration, I have long forgotten the exact details. It would
> otherwise probably take me a while to understand what and where you
> propose to change exactly.
>
> Also, do you want me to test it on some newer kernel or should I
> re-download the 6.5.# version sources?
Yes, it is better to use 6.5, you can simply change the last line of
drivers/firmware/sysfb.c to fs_initcall(sysfb_init), So no patch
needed.

And to Thomas,

I'm sorry that reverting 60aebc95594 solve Jaak's problem, but my
original problem exist (at least in 6.5), and I want to know the
result of the above experiment to understand what happens.

Huacai

>
>
> Best regards,
> Jaak
>
> On 18.03.24 16:43, Huacai Chen wrote:
> > Hi, Jaak,
> >
> > I'm still here as a boring man. :)
> > Have you ever tested whether using "fs_initcall(sysfb_init)" works
> > fine on your machine?
> >
> > Huacai
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
