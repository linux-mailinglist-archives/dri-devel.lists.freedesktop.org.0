Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136E87EB45
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3A310F7E4;
	Mon, 18 Mar 2024 14:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dDrjNdXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C0010F7E4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:44:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 20D61CE0A2C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9E5C43390
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710773040;
 bh=0PqslfbQwYs3Lukf02BAWF9ZgaQRrIkmUqnDQfyL4VA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dDrjNdXZpDfgBUf7o7GX34GKhtzhAjX1DBbPaI2JvJ2Q2uPs/AfAOGk8Gp4rKL/vs
 qEZyF00sdpi2K+cv3WNsqs4ior1Hntv8+u69oKJgq5N2VDTISQFxT9e4RO8prXNyyp
 On2aS3vUsCoF+wKDS+ka5xvUf9KdnA5quEPpyUYU/wAqI1DFklIf+ZdAm+jC3eoDsq
 /0qvEftN3Y8jMvV+mNOX3YP95gp7yHYhfMkhzjrFS8I1y0p/evNxjeY86GVkZhADGU
 Ui3aPO5XOL5shejrenpnLMvyjTYLOzz9qAPDJ6/ZFkN8RWXIHfFCEPrScJqcOyjCPh
 tJq7WjPDmtqVg==
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-568aa3096e9so5271119a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 07:44:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVE03JPi8YaBc0YMuDeKqh5IGkQ2w7yflakgHDuHfVck0v61RIoVg/jPB77bjW7hKuxczDUpxa5iektsyVONhQtkmbrxHz3VfUOKaNAZ+g8
X-Gm-Message-State: AOJu0Yw8BRWOFe9612awW1+6XAQcMA8keCyiGhxZ//qD5RIjPlk/FMnz
 Pwe0XR0hInI6bABV1sJ6HRT0CoezUUcvZ+EuXK1aZHD3LQ+qil/D1ikC8b9k8huYnKjdaNxJGnI
 RMWj9W4aOnjqtap5owau3mdY9SQ0=
X-Google-Smtp-Source: AGHT+IFKn0JaJQbOe12xFxTGPM0/2sN5+36j8VG80rdyj5vV6RoOGxIm96lbsE4SvPI1qgmMkZkfKH92PdQrecN8bmI=
X-Received: by 2002:a17:906:c794:b0:a46:be81:fdd6 with SMTP id
 cw20-20020a170906c79400b00a46be81fdd6mr2611428ejb.32.1710773038934; Mon, 18
 Mar 2024 07:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
In-Reply-To: <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 18 Mar 2024 22:43:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5gFqd3z4Etzuz_q3Hs6A4BP0yzJ69GgMcJzJBRdOwGSA@mail.gmail.com>
Message-ID: <CAAhV-H5gFqd3z4Etzuz_q3Hs6A4BP0yzJ69GgMcJzJBRdOwGSA@mail.gmail.com>
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

I'm still here as a boring man. :)
Have you ever tested whether using "fs_initcall(sysfb_init)" works
fine on your machine?

Huacai

On Wed, Jan 24, 2024 at 5:21=E2=80=AFAM Jaak Ristioja <jaak@ristioja.ee> wr=
ote:
>
> Hi,
>
> I apologize for not finding the time to test this earlier.
>
> On 11.12.23 05:08, Huacai Chen wrote:
> > And Jaak, could you please test with the below patch (but keep the
> > original order in Makefile) and then give me the dmesg output?
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
> > [1]  https://lore.kernel.org/lkml/170222766284.86103.110200607693307210=
08@leemhuis.info/T/#u
>
> Copy-pasting this from the e-mail body didn't work well, but I applied
> the changes manually to a 6.5.9 kernel without any of the other patches.
> Here's the relevant dmesg output on the Lenovo L570:
>
> ...
> [    2.953405] ACPI: bus type drm_connector registered
> [    2.954014] i915 0000:00:02.0: [drm] VT-d active for gfx access
> [    2.954018] DEBUG: remove 1
> [    2.954020] DEBUG: remove 2
> [    2.954021] DEBUG: remove 2
> [    2.954023] DEBUG: remove 3
> [    2.954029] resource: resource sanity check: requesting [mem
> 0x00000000e0000000-0x00000000efffffff], which spans more than BOOTFB
> [mem 0xe0000000-0xe012bfff]
> [    2.954035] caller i915_ggtt_init_hw+0x88/0x120 mapping multiple BARs
> [    2.954061] i915 0000:00:02.0: [drm] Using Transparent Hugepages
> [    2.955103] Loading firmware: i915/kbl_dmc_ver1_04.bin
> [    2.955384] i915 0000:00:02.0: [drm] Finished loading DMC firmware
> i915/kbl_dmc_ver1_04.bin (v1.4)
> ...
> [    4.145013] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on
> minor 0
> [    4.147101] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:
> no  post: no)
> [    4.147244] input: Video Bus as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input4
> [    4.147410] [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 1
> [    4.147420] usbcore: registered new interface driver udl
> [    4.147500] [drm] Initialized simpledrm 1.0.0 20200625 for
> simple-framebuffer.0 on minor 2
> [    4.148643] Console: switching to colour frame buffer device 80x30
> [    4.153216] simple-framebuffer simple-framebuffer.0: [drm] fb0:
> simpledrmdrmfb frame buffer device
> [    4.154043] loop: module loaded
> [    4.156017] ahci 0000:00:17.0: version 3.0
> [    4.157373] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffer devic=
e
> ...
>
> J
>
