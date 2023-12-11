Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC8B80BFB5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 04:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F56310E078;
	Mon, 11 Dec 2023 03:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036D610E078
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 03:08:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2CD1760C4F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 03:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9383C433C7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 03:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702264136;
 bh=PBTL9V+OAAOuXqs1VxSgVNCr6uETcvDqP5KXEZ+Kggc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GmMVpIg7B/qKd00rnyksPHUvcoF6xryWGhh2OSsyuVEvjNM8B05Fmptog44pvLUfF
 tLz3gexIKOUjEk207yKBaEC/cfXRJ6K49vRLCH9ofSp2WYE6QJPJQCUKBH0sQ1OvKX
 z7SSwTqCP6rdudJELYwTmO+jv6a91iymOHv5gnhUXg5hYH/DgVTgc1m37a8UosT029
 nCTzRGaDnMRa99kt1A9tYStkq4Zw2GSu2S5LBJMnuZyCdXSyPGaxWKDgO6wD12HNrI
 goXT2OFrDB8oMiv21p0ZExuo8cMW4XMyW2jflUL68/btL5n2kmmJkQ278odaTKPoQ1
 eX8NrgZQ4yXOA==
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-54f4f7e88feso3311484a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 19:08:56 -0800 (PST)
X-Gm-Message-State: AOJu0Yztm9c5YpTFrXFEflSYdYek9aJq53rJvwwqItVqBphszgQmYQIW
 qxB0K+avwMxqy6pKqHhfAPftNVL6eQZFBFJ/oT0=
X-Google-Smtp-Source: AGHT+IFlbqaWco0vYHNtX7Ll3yRTZPnAaSv3SP4pQiBSHL2ywmRJQxlHaySWnh6bxHDYFKAcQ9elh/6GB63Ct5M4xZw=
X-Received: by 2002:a17:906:2216:b0:a1a:58a8:6d4e with SMTP id
 s22-20020a170906221600b00a1a58a86d4emr1717268ejs.63.1702264135286; Sun, 10
 Dec 2023 19:08:55 -0800 (PST)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
In-Reply-To: <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 11 Dec 2023 11:08:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
Message-ID: <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Javier,

On Wed, Nov 8, 2023 at 4:24=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hello,
>
> On Wed, Nov 8, 2023 at 9:14=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> >
> > Hi,
> >
>
> [...]
>
> >
> > Relying on linking order is just as unreliable. The usual workaround is
> > to build native drivers as modules. But first, please investigate where
> > the current code fails.
> >
>
> I fully agree with Thomas here. This is just papering over the issue.
>
> I'll read the lengthy thread now to see if I can better understand
> what's going on here.
Have you understood enough now? I really don't want the original patch
to be reverted.

And Jaak, could you please test with the below patch (but keep the
original order in Makefile) and then give me the dmesg output?

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

[1]  https://lore.kernel.org/lkml/170222766284.86103.11020060769330721008@l=
eemhuis.info/T/#u

> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
