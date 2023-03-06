Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A171A6AC3FA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 15:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A2110E245;
	Mon,  6 Mar 2023 14:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7736710E245
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 14:52:38 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id ce7so5927530pfb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678114358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHOGbF7s618g+6BK7GPivl7hxOhmlehIVaHk/foFcfs=;
 b=V1TS/HP0g4oNplL7VySS0yv5Dh9CJr4TcTSNmxzKM7lHLQT5vjba0sM1PFjNlIly5a
 1JGYp8AJVWvJMt4n8/WrZ/ugmsgx4HvEoHKWUXBTfsPs5tuo/KRuvJYxSyP13Ji25ZPV
 NNffJr8zTvidvwSbdse0NieT32Cqwpg959abkxiKz2yTcmOoqUSu0tBx+DHea2vr42xy
 oj0H96a5MUqI1GtpJFX+O+1v5qR9yssTSJLCEiWavJ1HZKLnYj/Xs0Q8W/m557jFBf5j
 3PLm8GLQAigSH45sRNVlykuec5JIss6ZpEItVpIaQmijpX+IZPrDOE6hMnnZg3wY1/JK
 BXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678114358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHOGbF7s618g+6BK7GPivl7hxOhmlehIVaHk/foFcfs=;
 b=6XSZo3Z2Ab03UJipQJXIRZoJ9T4fV6D8Bs7LIIk1kM++POnqT/DLQ74U6CJ6/S5Jh/
 6L8M0IwTF1KUIASs1Xtdzh6zcX/sVdQZ/QzV8om0CYOjbYZ/Qrfr4TY8Z6tvpBD1aVvY
 LYNtT+85ECo/Mptn3SVOPlE25TK7ePWBzQJ1g2DdDphoThwAe5Y4EaIuhp/e1WtlYWnA
 b4NqhGXDx0z5Nn89qW5qE8P2b8LDvG++sqBFAoLxnzMSwt8cLZaLbsz6nRNl275MYG0m
 e/9vsIGtFx/6N0L1H5v/xzIt7tCAtY5GhREohuoa5n90PutX8pgMLV691bEZCkkE9pV5
 S9vA==
X-Gm-Message-State: AO0yUKVxYMiPxHmHhibRuhMaeGM8KbZgxPXWL88P5CWHbX0x5pOwUY4o
 3TbnNHIbd7lNhUtjRhol3SSkT78d43D9ir1NaAo=
X-Google-Smtp-Source: AK7set+EIAXMOolOz+aXhQa90qU2nwvKKxkbewJ65pQZR/msSarN2Ld/Gm3YyEvSj8VG/rvtUDzR0MDp74fps1cWERA=
X-Received: by 2002:a63:2950:0:b0:503:2678:4f14 with SMTP id
 bu16-20020a632950000000b0050326784f14mr3847854pgb.8.1678114357991; Mon, 06
 Mar 2023 06:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20230223121733.12549-1-tzimmermann@suse.de>
 <20230223121733.12549-8-tzimmermann@suse.de>
In-Reply-To: <20230223121733.12549-8-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 6 Mar 2023 15:52:26 +0100
Message-ID: <CAMeQTsb+sa_F7nUDNQm=fNfszYbJBPTXtGx+nj15gOJA179XBQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/gma500: Pass fb_info to psb_fbdev_vm_fault()
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 1:17=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Instead of the DRM framebuffer, pass the FB info strcuture to the
> fbdev page-fault handler psb_fbdev_vm_fault(). The framebuffer is a
> high-level data structure and does not belong into fault handling.
> The fb_info has all necessary information. Also set fix.smem_start
> to the correct value (the beginning of the framebuffer in physical
> address space) and streamline the page-fault handler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/fbdev.c | 39 ++++++++++++----------------------
>  1 file changed, 14 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbde=
v.c
> index a70ca4c5013f..c8dbcb33ddb5 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -22,32 +22,24 @@
>  static vm_fault_t psb_fbdev_vm_fault(struct vm_fault *vmf)
>  {
>         struct vm_area_struct *vma =3D vmf->vma;
> -       struct drm_framebuffer *fb =3D vma->vm_private_data;
> -       struct drm_device *dev =3D fb->dev;
> -       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> -       struct psb_gem_object *pobj =3D to_psb_gem_object(fb->obj[0]);
> -       int page_num;
> -       int i;
> -       unsigned long address;
> -       vm_fault_t ret =3D VM_FAULT_SIGBUS;
> -       unsigned long pfn;
> -       unsigned long phys_addr =3D (unsigned long)dev_priv->stolen_base =
+ pobj->offset;
> -
> -       page_num =3D vma_pages(vma);
> -       address =3D vmf->address - (vmf->pgoff << PAGE_SHIFT);
> +       struct fb_info *info =3D vma->vm_private_data;
> +       unsigned long address =3D vmf->address - (vmf->pgoff << PAGE_SHIF=
T);
> +       unsigned long pfn =3D info->fix.smem_start >> PAGE_SHIFT;
> +       vm_fault_t err =3D VM_FAULT_SIGBUS;
> +       unsigned long page_num =3D vma_pages(vma);
> +       unsigned long i;
>
>         vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
>
> -       for (i =3D 0; i < page_num; i++) {
> -               pfn =3D (phys_addr >> PAGE_SHIFT);
> -
> -               ret =3D vmf_insert_mixed(vma, address, __pfn_to_pfn_t(pfn=
, PFN_DEV));
> -               if (unlikely(ret & VM_FAULT_ERROR))
> +       for (i =3D 0; i < page_num; ++i) {
> +               err =3D vmf_insert_mixed(vma, address, __pfn_to_pfn_t(pfn=
, PFN_DEV));
> +               if (unlikely(err & VM_FAULT_ERROR))
>                         break;
>                 address +=3D PAGE_SIZE;
> -               phys_addr +=3D PAGE_SIZE;
> +               ++pfn;
>         }
> -       return ret;
> +
> +       return err;
>  }
>
>  static const struct vm_operations_struct psb_fbdev_vm_ops =3D {
> @@ -102,9 +94,6 @@ static int psb_fbdev_fb_setcolreg(unsigned int regno,
>
>  static int psb_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct=
 *vma)
>  {
> -       struct drm_fb_helper *fb_helper =3D info->par;
> -       struct drm_framebuffer *fb =3D fb_helper->fb;
> -
>         if (vma->vm_pgoff !=3D 0)
>                 return -EINVAL;
>         if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
> @@ -116,7 +105,7 @@ static int psb_fbdev_fb_mmap(struct fb_info *info, st=
ruct vm_area_struct *vma)
>          * suitable for our mmap work
>          */
>         vma->vm_ops =3D &psb_fbdev_vm_ops;
> -       vma->vm_private_data =3D (void *)fb;
> +       vma->vm_private_data =3D info;
>         vma->vm_flags |=3D VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTD=
UMP;
>
>         return 0;
> @@ -235,7 +224,7 @@ static int psbfb_probe(struct drm_fb_helper *fb_helpe=
r,
>
>         drm_fb_helper_fill_info(info, fb_helper, sizes);
>
> -       info->fix.smem_start =3D dev_priv->fb_base;
> +       info->fix.smem_start =3D dev_priv->stolen_base + backing->offset;

With this change, ->fb_base is no longer used and can be removed. We
already store PSB_BSM (base of stolen memory) in ->stolen_base so no
need to keep fb_base.


>         info->fix.smem_len =3D size;
>         info->fix.ywrapstep =3D 0;
>         info->fix.ypanstep =3D 0;
> --
> 2.39.2
>
