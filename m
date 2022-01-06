Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576BA4860B4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 07:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D591610FD2A;
	Thu,  6 Jan 2022 06:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044BA10FC82
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 06:44:43 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id c36so2570183uae.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 22:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yAk2Gs4W1UK9ZJv061rWxHpztwooZWsfp8OzDdXBAw0=;
 b=HuttzNqQ3QYmrhIpgOkK5VK32WBu1x9CqUT3eHe1nC+i6T2Ew81/ahBnhfAgeAj5Sh
 oF70HZM5yU9QzYOEQAutZY0rmMujxD20Ox32osUtrzyEZusahEXfRZvIMPUaNmjXAT0j
 GE9H8EjHSQCKsNCsUOAY4Y62REAu73Pc2fdx2/JfAoDpd4dJtqc7jybR7F/bINLJymr/
 uuw7CeijZkoO6uGbbY8p22P2S3B+oOZ+sMrExFPGVvGs7dSmZiNDPoy75QHvvvsgfJaY
 iuWvU35bNQV5NZvKwt4bi+lC/YmiUsug8oX/t/acS+Vd7Elp4eOVPChbMDsIFVobxJSU
 KC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yAk2Gs4W1UK9ZJv061rWxHpztwooZWsfp8OzDdXBAw0=;
 b=OJNVHc/PY0OfFk7Xg9xQwGpzZeWNQ31oyMvsOcx9s1tzRa4i7Sb8deNfqDKfG//G40
 OW5pJb4inlIK4PRfTJGzJxW+N2EBNuNJU/bA7s9WzdpNj/wHMtMsocDftGn8xICr55Nk
 2vo6jPs8LR1chi1glbVSq2XNX/Sb/679c7ArK5C5MHWZSqAW/T648Zdd/m17CWYz7mr6
 P6tga8UgDPPPGYs0RRo+uuSnUpyQ204HshpKlxQ6tq5lhgrGWw3x6yKyLkoxuXDOyiyr
 /cx9gP2OnY7GYLp5MoqpLZ5Y4rJKA7cJTmtgUcB+CWy9TW/Tc4AM0oXzTy+Ppgbc72QU
 Dn3Q==
X-Gm-Message-State: AOAM5308U7F+EaUYnpvAa/vewL62QaVZzXK0KerLd1+JzOl2LvZwlH4O
 Sx8W7ZJFkCy2CXPruXALw5JzW5U9F1/nTbQAgoY=
X-Google-Smtp-Source: ABdhPJz10DHXq5phLZL76z2EfPvDtVca/IjryhPZWjoVVqO9xbEPcYGvb+f6XHcMlDHjAyjLkzDvMGcIp1DtuaCi8nQ=
X-Received: by 2002:a67:b807:: with SMTP id i7mr16383794vsf.52.1641451482782; 
 Wed, 05 Jan 2022 22:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20220106000658.243509-1-helgaas@kernel.org>
 <20220106000658.243509-5-helgaas@kernel.org>
In-Reply-To: <20220106000658.243509-5-helgaas@kernel.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Thu, 6 Jan 2022 14:44:42 +0800
Message-ID: <CAAhV-H4BTAKdRwv+Wq7QRfMQRajQYzz3CqjvoGTrKujn47F3Yg@mail.gmail.com>
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
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bjorn,

On Thu, Jan 6, 2022 at 8:07 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Previously we selected a device that owns the boot framebuffer as the
> default device in vga_arb_select_default_device().  This was only done in
> the vga_arb_device_init() subsys_initcall, so devices enumerated later,
> e.g., by pcibios_init(), were not eligible.
>
> Fix this by moving the framebuffer device selection from
> vga_arb_select_default_device() to vga_arbiter_add_pci_device(), which is
> called after every PCI device is enumerated, either by the
> vga_arb_device_init() subsys_initcall or as an ADD_DEVICE notifier.
>
> Note that if vga_arb_select_default_device() found a device owning the bo=
ot
> framebuffer, it unconditionally set it to be the default VGA device, and =
no
> subsequent device could replace it.
>
> Link: https://lore.kernel.org/r/20211015061512.2941859-7-chenhuacai@loong=
son.cn
> Based-on-patch-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Bruno Pr=C3=A9mont <bonbons@linux-vserver.org>
> ---
>  drivers/gpu/vga/vgaarb.c | 37 +++++++++++++++++--------------------
>  1 file changed, 17 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> index b0ae0f177c6f..aefa4f406f7d 100644
> --- a/drivers/gpu/vga/vgaarb.c
> +++ b/drivers/gpu/vga/vgaarb.c
> @@ -72,6 +72,7 @@ struct vga_device {
>         unsigned int io_norm_cnt;       /* normal IO count */
>         unsigned int mem_norm_cnt;      /* normal MEM count */
>         bool bridge_has_one_vga;
> +       bool is_framebuffer;    /* BAR covers firmware framebuffer */
>         unsigned int (*set_decode)(struct pci_dev *pdev, bool decode);
>  };
>
> @@ -565,10 +566,9 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc=
)
>  }
>  EXPORT_SYMBOL(vga_put);
>
> -static void __init vga_select_framebuffer_device(struct pci_dev *pdev)
> +static bool vga_is_framebuffer_device(struct pci_dev *pdev)
>  {
>  #if defined(CONFIG_X86) || defined(CONFIG_IA64)
> -       struct device *dev =3D &pdev->dev;
>         u64 base =3D screen_info.lfb_base;
>         u64 size =3D screen_info.lfb_size;
>         u64 limit;
> @@ -583,15 +583,6 @@ static void __init vga_select_framebuffer_device(str=
uct pci_dev *pdev)
>
>         limit =3D base + size;
>
> -       /*
> -        * Override vga_arbiter_add_pci_device()'s I/O based detection
> -        * as it may take the wrong device (e.g. on Apple system under
> -        * EFI).
> -        *
> -        * Select the device owning the boot framebuffer if there is
> -        * one.
> -        */
> -
>         /* Does firmware framebuffer belong to us? */
>         for (i =3D 0; i < DEVICE_COUNT_RESOURCE; i++) {
>                 flags =3D pci_resource_flags(pdev, i);
> @@ -608,13 +599,10 @@ static void __init vga_select_framebuffer_device(st=
ruct pci_dev *pdev)
>                 if (base < start || limit >=3D end)
>                         continue;
>
> -               if (!vga_default_device())
> -                       vgaarb_info(dev, "setting as boot device\n");
> -               else if (pdev !=3D vga_default_device())
> -                       vgaarb_info(dev, "overriding boot device\n");
> -               vga_set_default_device(pdev);
> +               return true;
>         }
>  #endif
> +       return false;
>  }
>
>  static bool vga_arb_integrated_gpu(struct device *dev)
> @@ -635,6 +623,7 @@ static bool vga_arb_integrated_gpu(struct device *dev=
)
>  static bool vga_is_boot_device(struct vga_device *vgadev)
>  {
>         struct vga_device *boot_vga =3D vgadev_find(vga_default_device())=
;
> +       struct pci_dev *pdev =3D vgadev->pdev;
>
>         /*
>          * We select the default VGA device in this order:
> @@ -645,6 +634,18 @@ static bool vga_is_boot_device(struct vga_device *vg=
adev)
>          *   Other device (see vga_arb_select_default_device())
>          */
>
> +       /*
> +        * We always prefer a firmware framebuffer, so if we've already
> +        * found one, there's no need to consider vgadev.
> +        */
> +       if (boot_vga && boot_vga->is_framebuffer)
> +               return false;
> +
> +       if (vga_is_framebuffer_device(pdev)) {
> +               vgadev->is_framebuffer =3D true;
> +               return true;
> +       }
Maybe it is better to rename vga_is_framebuffer_device() to
vga_is_firmware_device() and rename is_framebuffer to
is_fw_framebuffer?

Huacai
> +
>         /*
>          * A legacy VGA device has MEM and IO enabled and any bridges
>          * leading to it have PCI_BRIDGE_CTL_VGA enabled so the legacy
> @@ -1531,10 +1532,6 @@ static void __init vga_arb_select_default_device(v=
oid)
>         struct pci_dev *pdev, *found =3D NULL;
>         struct vga_device *vgadev;
>
> -       list_for_each_entry(vgadev, &vga_list, list) {
> -               vga_select_framebuffer_device(vgadev->pdev);
> -       }
> -
>         if (!vga_default_device()) {
>                 list_for_each_entry_reverse(vgadev, &vga_list, list) {
>                         struct device *dev =3D &vgadev->pdev->dev;
> --
> 2.25.1
>
