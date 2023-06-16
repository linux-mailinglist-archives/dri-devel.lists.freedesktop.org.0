Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F837333A9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB15010E647;
	Fri, 16 Jun 2023 14:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A474C10E63E;
 Fri, 16 Jun 2023 14:34:25 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-39a55e706deso611153b6e.3; 
 Fri, 16 Jun 2023 07:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686926064; x=1689518064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ivVqe+3y+IjoJN9AQTDnUtGQRAxLSDX5uMg6GkWuJPQ=;
 b=hQYBRnQoLlf7deV4QVQXwsec2qCVpp1+9kafoi7mxUty4Y6C+yVXUuYcMO8z4QtSSa
 ZU/StFXozETvmRmXM6mutzK5rB+O2AWqPKMDtjcaOW1BDJ/MEMy1HZMNwzCaaTM1A4Vu
 iLu0v+O+wNLpYU3Z2vFKQHP+kdUPbipsLEef89P9THpMvQendZ5eYEUszN9Ssgf4W43R
 RcPd3LlJZIE37I+yU6O2GxAhQaVjh+UApJFm5oj+TWkBE+JzI5PAI2CT7p4pH84taZ3H
 +/Z7gJYxl55M7JmCIIESiYoSrrzRqrT7wXNjjK0yfSDNpvyP7FdZLTzYVDx7Nvfy3uXl
 K5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686926064; x=1689518064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ivVqe+3y+IjoJN9AQTDnUtGQRAxLSDX5uMg6GkWuJPQ=;
 b=bF26nM9rbC09L7MxgHP3LEzMJzOTFbrNoiwF896LRXhIvlYCy0AhucxDpRdaMjx2x3
 /EUr5XtKUNwh7Qks5iHvMGqMKsZ8n7qbtVj38HUVEI0VsMpu6b2kgRz+d6uhz73tVhhZ
 Fy01eUIvUF6aDfaaEcManEcPZHtHHe+GLCmDFBr8SsyQwcn14KNMMFN7+shnNYPTz9xh
 PC2s4heQDXQjZZfudpWwp/Fs/vQPfkoARZS1o/QFiXA+onPvOETpd3m+viK2q7lRScav
 9qzx/8KdzmhXAWRmNV61maVGdUVwsZufKnQl99mFgqbOuAJXRnJg83+DIHf/pTKEHdT1
 71kQ==
X-Gm-Message-State: AC+VfDx2oIQHvaIyGnc0HnLOVvges/XDSVF4iBKkuP+tXd5tmkxjpjnz
 X/aAExjdCVCXEX+FIUoh4AWbHvFNrljKDxtRiOU=
X-Google-Smtp-Source: ACHHUZ7wf5QJliSaKiDidpcW3Zr4J3WkroD8huth3Re4mFAiQTXfTfUpnPDlZrjEtVKyibZ4EMr9JolivP+cqvS5lpY=
X-Received: by 2002:aca:6547:0:b0:39b:4042:bdfb with SMTP id
 j7-20020aca6547000000b0039b4042bdfbmr1910923oiw.58.1686926064370; Fri, 16 Jun
 2023 07:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230613030151.216625-1-15330273260@189.cn>
 <20230613030151.216625-3-15330273260@189.cn>
 <dbf0d89f-717a-1f78-aef2-f30506751d4d@loongson.cn>
 <CADnq5_N6vVtzH6tzguZdHnP_TdRoG1G-Cr94O+X03jvtk=vhag@mail.gmail.com>
 <3c1c86ab-96ea-aa1c-c9c5-9a4012644fd6@loongson.cn>
 <CADnq5_Px-HWfwetv8LZsCnCeV7SMt_uqtLwMVK7648ZQiP2RCQ@mail.gmail.com>
 <f08b6a76-6c90-b59b-ff43-c779ef759d09@loongson.cn>
In-Reply-To: <f08b6a76-6c90-b59b-ff43-c779ef759d09@loongson.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Jun 2023 10:34:13 -0400
Message-ID: <CADnq5_PFoM2O8mCd6+VFfu9Nc-Hg_HTnwEMxrq0FGRpva1kKiA@mail.gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 10:22=E2=80=AFAM Sui Jingfeng <suijingfeng@loongson=
.cn> wrote:
>
>
> On 2023/6/16 21:41, Alex Deucher wrote:
> > On Fri, Jun 16, 2023 at 3:11=E2=80=AFAM Sui Jingfeng <suijingfeng@loong=
son.cn> wrote:
> >> Hi,
> >>
> >> On 2023/6/16 05:11, Alex Deucher wrote:
> >>> On Wed, Jun 14, 2023 at 6:50=E2=80=AFAM Sui Jingfeng <suijingfeng@loo=
ngson.cn> wrote:
> >>>> Hi,
> >>>>
> >>>> On 2023/6/13 11:01, Sui Jingfeng wrote:
> >>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
> >>>>>
> >>>>> Deal only with the VGA devcie(pdev->class =3D=3D 0x0300), so replac=
e the
> >>>>> pci_get_subsys() function with pci_get_class(). Filter the non-PCI =
display
> >>>>> device(pdev->class !=3D 0x0300) out. There no need to process the n=
on-display
> >>>>> PCI device.
> >>>>>
> >>>>> Cc: Bjorn Helgaas <bhelgaas@google.com>
> >>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >>>>> ---
> >>>>>     drivers/pci/vgaarb.c | 22 ++++++++++++----------
> >>>>>     1 file changed, 12 insertions(+), 10 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> >>>>> index c1bc6c983932..22a505e877dc 100644
> >>>>> --- a/drivers/pci/vgaarb.c
> >>>>> +++ b/drivers/pci/vgaarb.c
> >>>>> @@ -754,10 +754,6 @@ static bool vga_arbiter_add_pci_device(struct =
pci_dev *pdev)
> >>>>>         struct pci_dev *bridge;
> >>>>>         u16 cmd;
> >>>>>
> >>>>> -     /* Only deal with VGA class devices */
> >>>>> -     if ((pdev->class >> 8) !=3D PCI_CLASS_DISPLAY_VGA)
> >>>>> -             return false;
> >>>>> -
> >>>> Hi, here is probably a bug fixing.
> >>>>
> >>>> For an example, nvidia render only GPU typically has 0x0380.
> >>>>
> >>>> as its PCI class number, but render only GPU should not participate =
in
> >>>> the arbitration.
> >>>>
> >>>> As it shouldn't snoop the legacy fixed VGA address.
> >>>>
> >>>> It(render only GPU) can not display anything.
> >>>>
> >>>>
> >>>> But 0x0380 >> 8 =3D 0x03, the filter  failed.
> >>>>
> >>>>
> >>>>>         /* Allocate structure */
> >>>>>         vgadev =3D kzalloc(sizeof(struct vga_device), GFP_KERNEL);
> >>>>>         if (vgadev =3D=3D NULL) {
> >>>>> @@ -1500,7 +1496,9 @@ static int pci_notify(struct notifier_block *=
nb, unsigned long action,
> >>>>>         struct pci_dev *pdev =3D to_pci_dev(dev);
> >>>>>         bool notify =3D false;
> >>>>>
> >>>>> -     vgaarb_dbg(dev, "%s\n", __func__);
> >>>>> +     /* Only deal with VGA class devices */
> >>>>> +     if (pdev->class !=3D PCI_CLASS_DISPLAY_VGA << 8)
> >>>>> +             return 0;
> >>>> So here we only care 0x0300, my initial intent is to make an optimiz=
ation,
> >>>>
> >>>> nowadays sane display graphic card should all has 0x0300 as its PCI
> >>>> class number, is this complete right?
> >>>>
> >>>> ```
> >>>>
> >>>> #define PCI_BASE_CLASS_DISPLAY        0x03
> >>>> #define PCI_CLASS_DISPLAY_VGA        0x0300
> >>>> #define PCI_CLASS_DISPLAY_XGA        0x0301
> >>>> #define PCI_CLASS_DISPLAY_3D        0x0302
> >>>> #define PCI_CLASS_DISPLAY_OTHER        0x0380
> >>>>
> >>>> ```
> >>>>
> >>>> Any ideas ?
> >>> I'm not quite sure what you are asking about here.
> >> To be honest, I'm worried about the PCI devices which has a
> >>
> >> PCI_CLASS_DISPLAY_XGA as its PCI class number.
> >>
> >> As those devices are very uncommon in the real world.
> >>
> >>
> >> $ find . -name "*.c" -type f | xargs grep "PCI_CLASS_DISPLAY_XGA"
> >>
> >>
> >> Grep the "PCI_CLASS_DISPLAY_XGA" in the linux kernel tree got ZERO,
> >>
> >> there no code reference this macro. So I think it seems safe to ignore
> >> the XGA ?
> >>
> >>
> >> PCI_CLASS_DISPLAY_3D and PCI_CLASS_DISPLAY_OTHER are used to annotate
> >> the render-only GPU.
> >>
> >> And render-only GPU can't decode the fixed VGA address space, it is sa=
fe
> >> to ignore them.
> >>
> >>
> >>>    For vga_arb, we
> >>> only care about VGA class devices since those should be on the only
> >>> ones that might have VGA routed to them.
> >>>    However, as VGA gets deprecated,
> >> We need the vgaarb for a system with multiple video card.
> >>
> >> Not only because some Legacy VGA devices implemented
> >>
> >> on PCI will typically have the same "hard-decoded" addresses;
> >>
> >> But also these video card need to participate in the arbitration,
> >>
> >> determine the default boot device.
> > But couldn't the boot device be determined via what whatever resources
> > were used by the pre-OS console?
>
> I don't know what you are refer to by saying  pre-OS console, UEFI
> SHELL,  UEFI GOP  or something like that.
>

Right.  Before the OS loads the platform firmware generally sets up
something for display.  That could be GOP or vesa or some other
platform specific protocol.

> If you are referring to the framebuffer driver which light up the screen
> before the Linux kernel is loaded .
>
>
> Then, what you have said is true,  the boot device is determined by the
> pre-OS console.
>
> But the problem is how does the Linux kernel(vgaarb) could know which
> one is the default boot device
>
> on a multiple GPU machine.  Relaying on the firmware fb's address and
> size is what the mechanism
>
> we already in using.

Right.  It shouldn't need to depend on vgaarb.

>
>
> >   I feel like that should be separate from vgaarb.
>
> Emm, this really deserved another patch, please ?
>
> >   vgaarb should handle PCI VGA routing and some other
> > mechanism should be used to determine what device provided the pre-OS
> > console.
>
> If the new mechanism need the firmware changed, then this probably break
> the old machine.
>
> Also, this probably will get all arch involved. to get the new mechanism
> supported.
>
> The testing pressure and review power needed is quite large.
>
> drm/amdgpu and drm/radeon already being used on X86, ARM64,  Mips and
> more arch...
>
> The reviewing process will became quite difficult then.
>
> vgaarb is really what we already in use, and being used more than ten
> years ...

Yes, it works for x86 (and a few other platforms) today because of the
VGA legacy, so we can look at VGA routing to determine this.  But even
today, we don't need VGA routing to determine what was the primary
display before starting the OS.  We could probably have a platform
independent way to handle this by looking at the bread crumbs leftover
from the pre-OS environment.  E.g., for pre-UEFI platforms, we can
look at VGA routing.  For UEFI platforms we can look at what GOP left
us.  For various non-UEFI ARM/PPC/MIPS/etc. platforms we can look at
whatever breadcrumbs those pre-OS environments left.  That way when
VGA goes away, we can have a clean break and you won't need vgaarb if
the platform has no VGA devices.

Alex

>
>
> > Alex
> >
>
> >>
> >> Nowadays, the 'VGA devices' here is stand for the Graphics card
> >>
> >> which is capable of display something on the screen.
> >>
> >> We still need vgaarb to select the default boot device.
> >>
> >>
> >>> you'll have more non VGA PCI classes for devices which
> >>> could be the pre-OS console device.
> >> Ah, we still want  do this(by applying this patch) first,
> >>
> >> and then we will have the opportunity to see who will crying if
> >> something is broken. Will know more then.
> >>
> >> But drop this patch or revise it with more consideration is also
> >> acceptable.
> >>
> >>
> >> I asking about suggestion and/or review.
> >>
> >>> Alex
> >>>
> >>>>>         /* For now we're only intereted in devices added and remove=
d. I didn't
> >>>>>          * test this thing here, so someone needs to double check f=
or the
> >>>>> @@ -1510,6 +1508,8 @@ static int pci_notify(struct notifier_block *=
nb, unsigned long action,
> >>>>>         else if (action =3D=3D BUS_NOTIFY_DEL_DEVICE)
> >>>>>                 notify =3D vga_arbiter_del_pci_device(pdev);
> >>>>>
> >>>>> +     vgaarb_dbg(dev, "%s: action =3D %lu\n", __func__, action);
> >>>>> +
> >>>>>         if (notify)
> >>>>>                 vga_arbiter_notify_clients();
> >>>>>         return 0;
> >>>>> @@ -1534,8 +1534,8 @@ static struct miscdevice vga_arb_device =3D {
> >>>>>
> >>>>>     static int __init vga_arb_device_init(void)
> >>>>>     {
> >>>>> +     struct pci_dev *pdev =3D NULL;
> >>>>>         int rc;
> >>>>> -     struct pci_dev *pdev;
> >>>>>
> >>>>>         rc =3D misc_register(&vga_arb_device);
> >>>>>         if (rc < 0)
> >>>>> @@ -1545,11 +1545,13 @@ static int __init vga_arb_device_init(void)
> >>>>>
> >>>>>         /* We add all PCI devices satisfying VGA class in the arbit=
er by
> >>>>>          * default */
> >>>>> -     pdev =3D NULL;
> >>>>> -     while ((pdev =3D
> >>>>> -             pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
> >>>>> -                            PCI_ANY_ID, pdev)) !=3D NULL)
> >>>>> +     while (1) {
> >>>>> +             pdev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pd=
ev);
> >>>>> +             if (!pdev)
> >>>>> +                     break;
> >>>>> +
> >>>>>                 vga_arbiter_add_pci_device(pdev);
> >>>>> +     }
> >>>>>
> >>>>>         pr_info("loaded\n");
> >>>>>         return rc;
> >>>> --
> >>>> Jingfeng
> >>>>
> >> --
> >> Jingfeng
> >>
> --
> Jingfeng
>
