Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2813732164
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 23:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED5110E023;
	Thu, 15 Jun 2023 21:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E99210E023;
 Thu, 15 Jun 2023 21:12:10 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1a991886254so140341fac.2; 
 Thu, 15 Jun 2023 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686863529; x=1689455529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYFIoxmK6/11WcQGMEd3k+GSDGPqNwcIqNk05D0COTE=;
 b=Ctj8OnhGP2r2mDaRqVkWYkbCXLxlBOU1XnLMs2rQnEZVFtLbX4y/91GeJfTZJq5ilZ
 BEBJVQLtXSa74ZV6v9HQtOkzjDigIp47DOIRcrHwGUcKTsqQAhkMdn1UO87Sb7Gpm7ex
 X45UZ0QhVvOtmv5xonVSE+x+ADmFWyurK8i6hsId3TXKamH0UIU6FCtus2oYmyYc/hXN
 aKVQWGwGuIgL3W0ZwDOUERyeYftA7rlPAK83m58oUSPJYAdDpFEgGtRYfhALMGIZvZ2b
 gofXVCoULo3vxmDnvGTZQX+wnBV6wdCwVEVCg+rvInQGzr6Uhq9I2bWmhZs/WkNDiQrK
 W5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686863529; x=1689455529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYFIoxmK6/11WcQGMEd3k+GSDGPqNwcIqNk05D0COTE=;
 b=jfVVE6xAZdVxNcuxdOj0IBv7br7cvBdPcsUViwbPRbPROC8oLbRo4J+nYzUJyjl5dG
 ayVkSLOBarNeI+KP0iy20FVKOfN9GDjuF9fUkdg85iqrTueQuTv0wAXz7Iqs2NYstyNt
 jy5wQYDInLvG4S6IrfCaQGr2Sq2fhrjAgAMvkWPs0cP6DNkm0fydTgqXyMCU75V2/iXY
 Ul4KjIaS+OCsz8EogjdLHK6CCa2dNaBv4a7O08dwuOwc0al8V5t/k8BiNjdaM/K/ohDu
 +MILem1sdHOF21AM25/9cF2An4VO8Fq+qgnfriEnVEB+178C7XLgA0iHGRDYGVK0ayXe
 8nEw==
X-Gm-Message-State: AC+VfDz/MOd3CB5EbHtRPqe66VpVcSiW57b8XpQGqoiYOgHDY6sZPrtk
 CNY64h0vlkx/ncUOk6DKR21HIKmSvcmVAzq2fm0=
X-Google-Smtp-Source: ACHHUZ4RQOzLkRBT57QFtwfdt42rHQTpRvSKNUguWsVJUC9l4YMVkHjXvUxUEmpNf+dIqOqbJjieNSEhAcMqJy+p5M0=
X-Received: by 2002:a05:6871:6ba6:b0:19f:ad5a:f518 with SMTP id
 zh38-20020a0568716ba600b0019fad5af518mr274084oab.25.1686863529246; Thu, 15
 Jun 2023 14:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230613030151.216625-1-15330273260@189.cn>
 <20230613030151.216625-3-15330273260@189.cn>
 <dbf0d89f-717a-1f78-aef2-f30506751d4d@loongson.cn>
In-Reply-To: <dbf0d89f-717a-1f78-aef2-f30506751d4d@loongson.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Jun 2023 17:11:58 -0400
Message-ID: <CADnq5_N6vVtzH6tzguZdHnP_TdRoG1G-Cr94O+X03jvtk=vhag@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] PCI/VGA: Deal only with VGA class devices
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 14, 2023 at 6:50=E2=80=AFAM Sui Jingfeng <suijingfeng@loongson.=
cn> wrote:
>
> Hi,
>
> On 2023/6/13 11:01, Sui Jingfeng wrote:
> > From: Sui Jingfeng <suijingfeng@loongson.cn>
> >
> > Deal only with the VGA devcie(pdev->class =3D=3D 0x0300), so replace th=
e
> > pci_get_subsys() function with pci_get_class(). Filter the non-PCI disp=
lay
> > device(pdev->class !=3D 0x0300) out. There no need to process the non-d=
isplay
> > PCI device.
> >
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > ---
> >   drivers/pci/vgaarb.c | 22 ++++++++++++----------
> >   1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> > index c1bc6c983932..22a505e877dc 100644
> > --- a/drivers/pci/vgaarb.c
> > +++ b/drivers/pci/vgaarb.c
> > @@ -754,10 +754,6 @@ static bool vga_arbiter_add_pci_device(struct pci_=
dev *pdev)
> >       struct pci_dev *bridge;
> >       u16 cmd;
> >
> > -     /* Only deal with VGA class devices */
> > -     if ((pdev->class >> 8) !=3D PCI_CLASS_DISPLAY_VGA)
> > -             return false;
> > -
>
> Hi, here is probably a bug fixing.
>
> For an example, nvidia render only GPU typically has 0x0380.
>
> at its PCI class number, but  render only GPU should not participate in
> the arbitration.
>
> As it shouldn't snoop the legacy fixed VGA address.
>
> It(render only GPU) can not display anything.
>
>
> But 0x0380 >> 8 =3D 0x03, the filter  failed.
>
>
> >       /* Allocate structure */
> >       vgadev =3D kzalloc(sizeof(struct vga_device), GFP_KERNEL);
> >       if (vgadev =3D=3D NULL) {
> > @@ -1500,7 +1496,9 @@ static int pci_notify(struct notifier_block *nb, =
unsigned long action,
> >       struct pci_dev *pdev =3D to_pci_dev(dev);
> >       bool notify =3D false;
> >
> > -     vgaarb_dbg(dev, "%s\n", __func__);
> > +     /* Only deal with VGA class devices */
> > +     if (pdev->class !=3D PCI_CLASS_DISPLAY_VGA << 8)
> > +             return 0;
>
> So here we only care 0x0300, my initial intent is to make an optimization=
,
>
> nowadays sane display graphic card should all has 0x0300 as its PCI
> class number, is this complete right?
>
> ```
>
> #define PCI_BASE_CLASS_DISPLAY        0x03
> #define PCI_CLASS_DISPLAY_VGA        0x0300
> #define PCI_CLASS_DISPLAY_XGA        0x0301
> #define PCI_CLASS_DISPLAY_3D        0x0302
> #define PCI_CLASS_DISPLAY_OTHER        0x0380
>
> ```
>
> Any ideas ?

I'm not quite sure what you are asking about here.  For vga_arb, we
only care about VGA class devices since those should be on the only
ones that might have VGA routed to them.  However, as VGA gets
deprecated, you'll have more non VGA PCI classes for devices which
could be the pre-OS console device.

Alex

>
> >       /* For now we're only intereted in devices added and removed. I d=
idn't
> >        * test this thing here, so someone needs to double check for the
> > @@ -1510,6 +1508,8 @@ static int pci_notify(struct notifier_block *nb, =
unsigned long action,
> >       else if (action =3D=3D BUS_NOTIFY_DEL_DEVICE)
> >               notify =3D vga_arbiter_del_pci_device(pdev);
> >
> > +     vgaarb_dbg(dev, "%s: action =3D %lu\n", __func__, action);
> > +
> >       if (notify)
> >               vga_arbiter_notify_clients();
> >       return 0;
> > @@ -1534,8 +1534,8 @@ static struct miscdevice vga_arb_device =3D {
> >
> >   static int __init vga_arb_device_init(void)
> >   {
> > +     struct pci_dev *pdev =3D NULL;
> >       int rc;
> > -     struct pci_dev *pdev;
> >
> >       rc =3D misc_register(&vga_arb_device);
> >       if (rc < 0)
> > @@ -1545,11 +1545,13 @@ static int __init vga_arb_device_init(void)
> >
> >       /* We add all PCI devices satisfying VGA class in the arbiter by
> >        * default */
> > -     pdev =3D NULL;
> > -     while ((pdev =3D
> > -             pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
> > -                            PCI_ANY_ID, pdev)) !=3D NULL)
> > +     while (1) {
> > +             pdev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev);
> > +             if (!pdev)
> > +                     break;
> > +
> >               vga_arbiter_add_pci_device(pdev);
> > +     }
> >
> >       pr_info("loaded\n");
> >       return rc;
>
> --
> Jingfeng
>
