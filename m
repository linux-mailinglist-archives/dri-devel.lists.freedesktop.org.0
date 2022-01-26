Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8120349C13E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 03:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D824E10E4FA;
	Wed, 26 Jan 2022 02:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0E610E4FA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 02:25:22 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id p7so33666267uao.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 18:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nsd0iFumaY43f2QkfXEIN5y4w31w3uWjtzxOZaSzScA=;
 b=ajC5QCSvrV8ckjekoyQ030W1UTCPdashc35ExAL7hW6yRDZ3s80VedN+GEg3E1Koq4
 596R04YIbjK/maAFGmkmt/4WM7w7oT78VG7U6wSysTvwqBGTTTbF7erIac+yZ3xp7Ivy
 VTWAktor5HaIGKvQVmOidtZgnTyarGoPoStZWXZNMOqzuB5JA9fWMARTa2JOe/s+fcFH
 7rbulBWYC15d4DMGaqpozwAVAhg7MVtbx3wkxLnHkGoExpbUF0kpBNBk1OXDknzFwfab
 wVQlFGe0M+Nc3HYDIpRr9YusCexe1NUaCjRa9x1iyAbXx0OoDdM4oTDsu7h3rDV64+U0
 mxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nsd0iFumaY43f2QkfXEIN5y4w31w3uWjtzxOZaSzScA=;
 b=w4Foc/e1v2LQ8HFLT7V1Ag4EPY8JBqkoSMV7zCOzyHuFbcSiN5a4wmX2rpmGb4rXtz
 fW+ACJNjYGHXxUIvJ0dyUkR/Jy060Sxmz69X5h66bOrCDhgWBqhIBjF17CnHfQpVAw3t
 0uQRCG1VadDx+Rq5YAQFZ5RZCeMMYKHAqr32ZcDj3Hv+FvbJm3teIsTeelq1oGmphvV/
 uqscatgteJ5Sy1nhTbUqRVwpU0SXlx80R1ec3TtpUoRIGMAj4iKrOPzClG7pL3OinECZ
 +yoBeOmoESuIpMVFdBiZL6ttgN3Hwoc43I3Y1Y10MM3IjbtrX3EKoGQ195Wugz9PchAS
 8sow==
X-Gm-Message-State: AOAM532csb+WBbKipMWIRwZpRA6D7jALeboWmf0RM2Teab9VcKOK7kOG
 uui/bDx+lbVi0Wgx/Md4Zw1d/5/fGyTSvjCoSTg=
X-Google-Smtp-Source: ABdhPJyY7LLuloLJXgVNQFlfS9HdwIfDEPgFULArGUc1ChbKVaz1LF+I9iUuRXbeA9Rj/EyA4UmIXr9rTve272ID36o=
X-Received: by 2002:a67:c094:: with SMTP id x20mr8612340vsi.53.1643163920689; 
 Tue, 25 Jan 2022 18:25:20 -0800 (PST)
MIME-Version: 1.0
References: <CAAhV-H4GAgKh4HBeWQ+LGf2x_uKy_T5MaMv0dNcYXFKVGAZEzw@mail.gmail.com>
 <20220125153858.GA1609157@bhelgaas>
In-Reply-To: <20220125153858.GA1609157@bhelgaas>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Wed, 26 Jan 2022 10:25:14 +0800
Message-ID: <CAAhV-H43CnYAR_QW1fduioD3O430zzRGRfpXW168LdhRAh97jA@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] vgaarb: Move framebuffer detection to ADD_DEVICE
 path
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-pci <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 11:39 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Maarten, Maxime, Thomas; beginning of thread:
> https://lore.kernel.org/r/20220106000658.243509-1-helgaas@kernel.org]
>
> On Tue, Jan 25, 2022 at 10:51:15AM +0800, Huacai Chen wrote:
> > Hi, Bjorn,
> >
> > Why this series still missing in 5.17-rc1? :(
>
> 1) It was posted late in the cycle (Jan 6, when the merge window
> opened Jan 9), so it was too late to expect a significant change like
> this to be merged for v5.17.  Right now is a good time to consider it
> again so it would some time in -next.
>
> 2) As of now, this code is still in drivers/gpu, and I don't maintain
> that area.  It's up to the DRM folks, who are all cc'd here.
>
> I would like to move this from drivers/gpu to drivers/pci, but that
> requires a little more work to resolve the initcall ordering problem
> with respect to vga_arb_device_init() and misc_init() [1].
Hmm, to me, keep it in drivers/gpu is just OK.

Huacai

>
> Bjorn
>
> [1] https://lore.kernel.org/linux-pci/CAAhV-H7FhAjM-Ha42Z1dLrE4PvC9frfyeU=
27KHWcyWKkMftEsA@mail.gmail.com/
>
> > On Fri, Jan 7, 2022 at 12:21 AM Bjorn Helgaas <helgaas@kernel.org> wrot=
e:
> > >
> > > On Thu, Jan 06, 2022 at 02:44:42PM +0800, Huacai Chen wrote:
> > > > On Thu, Jan 6, 2022 at 8:07 AM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
> > > > > Previously we selected a device that owns the boot framebuffer as=
 the
> > > > > default device in vga_arb_select_default_device().  This was only=
 done in
> > > > > the vga_arb_device_init() subsys_initcall, so devices enumerated =
later,
> > > > > e.g., by pcibios_init(), were not eligible.
> > > > >
> > > > > Fix this by moving the framebuffer device selection from
> > > > > vga_arb_select_default_device() to vga_arbiter_add_pci_device(), =
which is
> > > > > called after every PCI device is enumerated, either by the
> > > > > vga_arb_device_init() subsys_initcall or as an ADD_DEVICE notifie=
r.
> > > > >
> > > > > Note that if vga_arb_select_default_device() found a device ownin=
g the boot
> > > > > framebuffer, it unconditionally set it to be the default VGA devi=
ce, and no
> > > > > subsequent device could replace it.
> > > > >
> > > > > Link: https://lore.kernel.org/r/20211015061512.2941859-7-chenhuac=
ai@loongson.cn
> > > > > Based-on-patch-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > > > > Cc: Bruno Pr=C3=A9mont <bonbons@linux-vserver.org>
> > > > > ---
> > > > >  drivers/gpu/vga/vgaarb.c | 37 +++++++++++++++++-----------------=
---
> > > > >  1 file changed, 17 insertions(+), 20 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> > > > > index b0ae0f177c6f..aefa4f406f7d 100644
> > > > > --- a/drivers/gpu/vga/vgaarb.c
> > > > > +++ b/drivers/gpu/vga/vgaarb.c
> > > > > @@ -72,6 +72,7 @@ struct vga_device {
> > > > >         unsigned int io_norm_cnt;       /* normal IO count */
> > > > >         unsigned int mem_norm_cnt;      /* normal MEM count */
> > > > >         bool bridge_has_one_vga;
> > > > > +       bool is_framebuffer;    /* BAR covers firmware framebuffe=
r */
> > > > >         unsigned int (*set_decode)(struct pci_dev *pdev, bool dec=
ode);
> > > > >  };
> > > > >
> > > > > @@ -565,10 +566,9 @@ void vga_put(struct pci_dev *pdev, unsigned =
int rsrc)
> > > > >  }
> > > > >  EXPORT_SYMBOL(vga_put);
> > > > >
> > > > > -static void __init vga_select_framebuffer_device(struct pci_dev =
*pdev)
> > > > > +static bool vga_is_framebuffer_device(struct pci_dev *pdev)
> > > > >  {
> > > > >  #if defined(CONFIG_X86) || defined(CONFIG_IA64)
> > > > > -       struct device *dev =3D &pdev->dev;
> > > > >         u64 base =3D screen_info.lfb_base;
> > > > >         u64 size =3D screen_info.lfb_size;
> > > > >         u64 limit;
> > > > > @@ -583,15 +583,6 @@ static void __init vga_select_framebuffer_de=
vice(struct pci_dev *pdev)
> > > > >
> > > > >         limit =3D base + size;
> > > > >
> > > > > -       /*
> > > > > -        * Override vga_arbiter_add_pci_device()'s I/O based dete=
ction
> > > > > -        * as it may take the wrong device (e.g. on Apple system =
under
> > > > > -        * EFI).
> > > > > -        *
> > > > > -        * Select the device owning the boot framebuffer if there=
 is
> > > > > -        * one.
> > > > > -        */
> > > > > -
> > > > >         /* Does firmware framebuffer belong to us? */
> > > > >         for (i =3D 0; i < DEVICE_COUNT_RESOURCE; i++) {
> > > > >                 flags =3D pci_resource_flags(pdev, i);
> > > > > @@ -608,13 +599,10 @@ static void __init vga_select_framebuffer_d=
evice(struct pci_dev *pdev)
> > > > >                 if (base < start || limit >=3D end)
> > > > >                         continue;
> > > > >
> > > > > -               if (!vga_default_device())
> > > > > -                       vgaarb_info(dev, "setting as boot device\=
n");
> > > > > -               else if (pdev !=3D vga_default_device())
> > > > > -                       vgaarb_info(dev, "overriding boot device\=
n");
> > > > > -               vga_set_default_device(pdev);
> > > > > +               return true;
> > > > >         }
> > > > >  #endif
> > > > > +       return false;
> > > > >  }
> > > > >
> > > > >  static bool vga_arb_integrated_gpu(struct device *dev)
> > > > > @@ -635,6 +623,7 @@ static bool vga_arb_integrated_gpu(struct dev=
ice *dev)
> > > > >  static bool vga_is_boot_device(struct vga_device *vgadev)
> > > > >  {
> > > > >         struct vga_device *boot_vga =3D vgadev_find(vga_default_d=
evice());
> > > > > +       struct pci_dev *pdev =3D vgadev->pdev;
> > > > >
> > > > >         /*
> > > > >          * We select the default VGA device in this order:
> > > > > @@ -645,6 +634,18 @@ static bool vga_is_boot_device(struct vga_de=
vice *vgadev)
> > > > >          *   Other device (see vga_arb_select_default_device())
> > > > >          */
> > > > >
> > > > > +       /*
> > > > > +        * We always prefer a firmware framebuffer, so if we've a=
lready
> > > > > +        * found one, there's no need to consider vgadev.
> > > > > +        */
> > > > > +       if (boot_vga && boot_vga->is_framebuffer)
> > > > > +               return false;
> > > > > +
> > > > > +       if (vga_is_framebuffer_device(pdev)) {
> > > > > +               vgadev->is_framebuffer =3D true;
> > > > > +               return true;
> > > > > +       }
> > > > Maybe it is better to rename vga_is_framebuffer_device() to
> > > > vga_is_firmware_device() and rename is_framebuffer to
> > > > is_fw_framebuffer?
> > >
> > > That's a great point, thanks!
> > >
> > > The "framebuffer" term is way too generic.  *All* VGA devices have a
> > > framebuffer, so it adds no information.  This is really about finding
> > > the device that was used by firmware.
> > >
> > > I renamed:
> > >
> > >   vga_is_framebuffer_device() -> vga_is_firmware_default()
> > >   vga_device.is_framebuffer   -> vga_device.is_firmware_default
> > >
> > > I updated my local branch and pushed it to:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?=
h=3Dpci/vga
> > > with head 0f4caffa1297 ("vgaarb: Replace full MIT license text with
> > > SPDX identifier").
> > >
> > > I don't maintain drivers/gpu/vga/vgaarb.c, so this branch is just for
> > > reference.  It'll ultimately be up to the DRM folks to handle this.
> > >
> > > I'll wait for any other comments or testing reports before reposting.
> > >
> > > > >         /*
> > > > >          * A legacy VGA device has MEM and IO enabled and any bri=
dges
> > > > >          * leading to it have PCI_BRIDGE_CTL_VGA enabled so the l=
egacy
> > > > > @@ -1531,10 +1532,6 @@ static void __init vga_arb_select_default_=
device(void)
> > > > >         struct pci_dev *pdev, *found =3D NULL;
> > > > >         struct vga_device *vgadev;
> > > > >
> > > > > -       list_for_each_entry(vgadev, &vga_list, list) {
> > > > > -               vga_select_framebuffer_device(vgadev->pdev);
> > > > > -       }
> > > > > -
> > > > >         if (!vga_default_device()) {
> > > > >                 list_for_each_entry_reverse(vgadev, &vga_list, li=
st) {
> > > > >                         struct device *dev =3D &vgadev->pdev->dev=
;
> > > > > --
> > > > > 2.25.1
> > > > >
