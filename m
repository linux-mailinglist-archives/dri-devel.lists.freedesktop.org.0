Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD08839FC3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481D910F5C7;
	Wed, 24 Jan 2024 03:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18EB10F5BD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 03:00:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8E0F0CE30F9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 03:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE237C43390
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 03:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706065239;
 bh=fLVXXGU2Kxore3yLc83YhnUlsP1PFjlQeq4IAU9uZ7I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D9BEvbC65rf72Lc4wnzN6Bhig/6YwaLfdw5LEjwgRWWhgXB/vT7kOroVSycw+NeWH
 LVypLrHodSZdN3xLYXNmGeSOAzm4A055CDoBXGpGR1J9Kje/qonR2D2EwRkV9r+4db
 tfiVizY2mQJdsiK1vBOGYTcGbGQbXi6AkBDec1InL4pM4ymWc/LivgJEHW8EkrOTZD
 DFg4qhZZCf8ckqNYPmHdeeqG8RM119HOvHyHkQg6B/awzwa6q2zCcXqZsBOu6mK2tZ
 SWw2n8QzRZKU1TaC+2HkKu6F6Ou/vmso6L6WnqdUiUaYlvDCOplDdo7up6x2a5FSaz
 L/jlIWV8bM7ZA==
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so59619935e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:00:39 -0800 (PST)
X-Gm-Message-State: AOJu0YxjjEWeKg1g4Ueku6HSA3X+KL+04C3RqrSCaAjuLBrT0eg/J6n4
 c8bBsWt9C4buow3PGfEJqXe2ioOov4FiXeNoiDHLVydZmPiMa/tVLEHe8GgBRrHvQp14fJyejnb
 Va6LrdPWXA41FEZRDZ6GSjwEhsnY=
X-Google-Smtp-Source: AGHT+IF3bVMroeXrXUvIIyWLLSCuA4V+ub3H4Gcat6wtKvUtzTlietSNC803/cmDp1GYbR44oq2BalXYr0NMhBkkhms=
X-Received: by 2002:a05:600c:580c:b0:40e:4a61:a0d7 with SMTP id
 jz12-20020a05600c580c00b0040e4a61a0d7mr453585wmb.86.1706065238100; Tue, 23
 Jan 2024 19:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
In-Reply-To: <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 24 Jan 2024 11:00:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H57G-vudtEH2EbZmZQjRQLHSFvT9BYMjfmrbYnBy-Gq1A@mail.gmail.com>
Message-ID: <CAAhV-H57G-vudtEH2EbZmZQjRQLHSFvT9BYMjfmrbYnBy-Gq1A@mail.gmail.com>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Jaak Ristioja <jaak@ristioja.ee>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Javier and Thomas,

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

My tmp patch is as follows:

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 561be8feca96..cc2e39fb98f5 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -350,21 +350,29 @@ int
aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
char *na
        resource_size_t base, size;
        int bar, ret =3D 0;

-       if (pdev =3D=3D vga_default_device())
+       printk("DEBUG: remove 1\n");
+
+       if (pdev =3D=3D vga_default_device()) {
+               printk("DEBUG: primary =3D true\n");
                primary =3D true;
+       }

-       if (primary)
+       if (primary) {
+               printk("DEBUG: disable sysfb\n");
                sysfb_disable();
+       }

        for (bar =3D 0; bar < PCI_STD_NUM_BARS; ++bar) {
                if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
                        continue;

+               printk("DEBUG: remove 2\n");
                base =3D pci_resource_start(pdev, bar);
                size =3D pci_resource_len(pdev, bar);
                aperture_detach_devices(base, size);
        }

+       printk("DEBUG: remove 3\n");
        /*
         * If this is the primary adapter, there could be a VGA device
         * that consumes the VGA framebuffer I/O range. Remove this

From the Jaak's dmesg, it is obvious that "pdev =3D=3D
vga_default_device()" is false, which causes sysfb_disable() to be not
called. And I think the simple-drm device is not provided by the i915
device in this case. So, can we unconditionally call sysfb_disable()
here, which is the same as aperture_remove_conflicting_devices()?

Huacai

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
