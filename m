Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25E4D2F28
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3352410E63F;
	Wed,  9 Mar 2022 12:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E9C10E73D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:39:24 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q19so1844531pgm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xWp0dPV+wvFsFNokM//Axl/m5/Ve+dp841Y0a4aT5pY=;
 b=TbKgYZb30Y943UW2OwZGRlM4W4nuxyHs0hGuPF/h9x/UjZwZQaMbiMrO7cQQudH58a
 ZG0puWuQKyZatyV2Hphvya0Cgar6hFHU09Q5YQSLicpZpFsh0F0HfujMnyihwHQj6cEm
 hwE9WBbvEb3Z23Nqx/Gd68mMqm1cXAX1NjtV6GXJ6BMFyUfrNjjTDsgZKSEj6WfIY8fh
 ibwtGmjHsNff+DhgTmhaFVlWHFnCwNB7M85Aw7wMQnwtjNcPtaNzaXx1h468eYBsZkpH
 BJmZu4dF4sSIrCN0DaHR44K2sYdyKwdT4Jz87GyAfHFf8UDstaQaIa3hJq0KGkXpNXLo
 F1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xWp0dPV+wvFsFNokM//Axl/m5/Ve+dp841Y0a4aT5pY=;
 b=XZ1hGHXOi6WTaLpyt+hl51GNPV9Il6vXc8mFXGppQgyMhJngz56nrpPGgM9IJGTE95
 SlVHecLAtS3M9luDDmO3KA5Mlj1EE5iFl205IH3Ko9+6wuR73pv6XwtfzQRuVJ1N9/CX
 G51XVWv1hO27oYg24g4V1Di95+dkorGglnQBnQNsffojbH9jLvU6E10qXsgQIji8eUnW
 gdgyiX245kNOcBZCmxvn2hx4sj5/KkBh6RxS7Vqxl3evPJRc+wWBkKsGpODGTu7rZKsG
 UPR09P6qsa2UiiEtKOBVmh1jeR62EHBUuoZB33c9wJJ86VNnzZFcdRhKAk0aQh4FeM8l
 Hx7Q==
X-Gm-Message-State: AOAM531FLTKAp5+MyyhATyvVxjU2p2RxXVnfiQBkGyFjEcf3f2BHO8bH
 psb7/Gakl0ozDLi2SrhXMS9aK08/YQBppLxUKmIufz8h
X-Google-Smtp-Source: ABdhPJwz/wXNW4/uZd18h39gLgtW7Dk2UGmWO6ksJr8WqL8fZEes8CXDy3bMDG53qjW03tCAywRwOIOJ/HcaHpJ+y7Y=
X-Received: by 2002:a63:1662:0:b0:378:8b0b:1c9 with SMTP id
 34-20020a631662000000b003788b0b01c9mr18702399pgw.537.1646829563957; Wed, 09
 Mar 2022 04:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20220308195222.13471-1-tzimmermann@suse.de>
 <20220308195222.13471-13-tzimmermann@suse.de>
In-Reply-To: <20220308195222.13471-13-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 9 Mar 2022 13:39:12 +0100
Message-ID: <CAMeQTsZZ+fYebhiz+Xy-9y2Jsnwc5cJs0JTBf1T0_483HE4Kgw@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] drm/gma500: Move GTT memory-range setup into
 helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 8:52 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Move the setup code for GTT/GATT memory ranges into a new helper and
> call the function from psb_gtt_init() and psb_gtt_resume(). Removes
> code duplication.

LGTM
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gtt.c | 153 +++++++++++++++--------------------
>  1 file changed, 64 insertions(+), 89 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
> index 83d9a9f7c73c..379bc218aa6b 100644
> --- a/drivers/gpu/drm/gma500/gtt.c
> +++ b/drivers/gpu/drm/gma500/gtt.c
> @@ -182,68 +182,91 @@ static void psb_gtt_clear(struct drm_psb_private *pdev)
>         (void)ioread32(pdev->gtt_map + i - 1);
>  }
>
> -int psb_gtt_init(struct drm_device *dev)
> +static void psb_gtt_init_ranges(struct drm_psb_private *dev_priv)
>  {
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +       struct drm_device *dev = &dev_priv->dev;
>         struct pci_dev *pdev = to_pci_dev(dev->dev);
>         struct psb_gtt *pg = &dev_priv->gtt;
> -       unsigned gtt_pages;
> -       int ret;
> -
> -       mutex_init(&dev_priv->gtt_mutex);
> -
> -       ret = psb_gtt_enable(dev_priv);
> -       if (ret)
> -               goto err_mutex_destroy;
> +       resource_size_t gtt_phys_start, mmu_gatt_start, gtt_start, gtt_pages,
> +                       gatt_start, gatt_pages;
> +       struct resource *gtt_mem;
>
>         /* The root resource we allocate address space from */
> -       pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
> +       gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
>
>         /*
> -        *      The video mmu has a hw bug when accessing 0x0D0000000.
> -        *      Make gatt start at 0x0e000,0000. This doesn't actually
> -        *      matter for us but may do if the video acceleration ever
> -        *      gets opened up.
> +        * The video MMU has a HW bug when accessing 0x0d0000000. Make
> +        * GATT start at 0x0e0000000. This doesn't actually matter for
> +        * us now, but maybe will if the video acceleration ever gets
> +        * opened up.
>          */
> -       pg->mmu_gatt_start = 0xE0000000;
> +       mmu_gatt_start = 0xe0000000;
> +
> +       gtt_start = pci_resource_start(pdev, PSB_GTT_RESOURCE);
> +       gtt_pages = pci_resource_len(pdev, PSB_GTT_RESOURCE) >> PAGE_SHIFT;
>
> -       pg->gtt_start = pci_resource_start(pdev, PSB_GTT_RESOURCE);
> -       gtt_pages = pci_resource_len(pdev, PSB_GTT_RESOURCE)
> -                                                               >> PAGE_SHIFT;
>         /* CDV doesn't report this. In which case the system has 64 gtt pages */
> -       if (pg->gtt_start == 0 || gtt_pages == 0) {
> +       if (!gtt_start || !gtt_pages) {
>                 dev_dbg(dev->dev, "GTT PCI BAR not initialized.\n");
>                 gtt_pages = 64;
> -               pg->gtt_start = dev_priv->pge_ctl;
> +               gtt_start = dev_priv->pge_ctl;
>         }
>
> -       pg->gatt_start = pci_resource_start(pdev, PSB_GATT_RESOURCE);
> -       pg->gatt_pages = pci_resource_len(pdev, PSB_GATT_RESOURCE)
> -                                                               >> PAGE_SHIFT;
> -       dev_priv->gtt_mem = &pdev->resource[PSB_GATT_RESOURCE];
> +       gatt_start = pci_resource_start(pdev, PSB_GATT_RESOURCE);
> +       gatt_pages = pci_resource_len(pdev, PSB_GATT_RESOURCE) >> PAGE_SHIFT;
>
> -       if (pg->gatt_pages == 0 || pg->gatt_start == 0) {
> +       if (!gatt_pages || !gatt_start) {
>                 static struct resource fudge;   /* Preferably peppermint */
> -               /* This can occur on CDV systems. Fudge it in this case.
> -                  We really don't care what imaginary space is being allocated
> -                  at this point */
> +
> +               /*
> +                * This can occur on CDV systems. Fudge it in this case. We
> +                * really don't care what imaginary space is being allocated
> +                * at this point.
> +                */
>                 dev_dbg(dev->dev, "GATT PCI BAR not initialized.\n");
> -               pg->gatt_start = 0x40000000;
> -               pg->gatt_pages = (128 * 1024 * 1024) >> PAGE_SHIFT;
> -               /* This is a little confusing but in fact the GTT is providing
> -                  a view from the GPU into memory and not vice versa. As such
> -                  this is really allocating space that is not the same as the
> -                  CPU address space on CDV */
> +               gatt_start = 0x40000000;
> +               gatt_pages = (128 * 1024 * 1024) >> PAGE_SHIFT;
> +
> +               /*
> +                * This is a little confusing but in fact the GTT is providing
> +                * a view from the GPU into memory and not vice versa. As such
> +                * this is really allocating space that is not the same as the
> +                * CPU address space on CDV.
> +                */
>                 fudge.start = 0x40000000;
>                 fudge.end = 0x40000000 + 128 * 1024 * 1024 - 1;
>                 fudge.name = "fudge";
>                 fudge.flags = IORESOURCE_MEM;
> -               dev_priv->gtt_mem = &fudge;
> +
> +               gtt_mem = &fudge;
> +       } else {
> +               gtt_mem = &pdev->resource[PSB_GATT_RESOURCE];
>         }
>
> +       pg->gtt_phys_start = gtt_phys_start;
> +       pg->mmu_gatt_start = mmu_gatt_start;
> +       pg->gtt_start = gtt_start;
>         pg->gtt_pages = gtt_pages;
> +       pg->gatt_start = gatt_start;
> +       pg->gatt_pages = gatt_pages;
> +       dev_priv->gtt_mem = gtt_mem;
> +}
> +
> +int psb_gtt_init(struct drm_device *dev)
> +{
> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +       struct psb_gtt *pg = &dev_priv->gtt;
> +       int ret;
> +
> +       mutex_init(&dev_priv->gtt_mutex);
> +
> +       ret = psb_gtt_enable(dev_priv);
> +       if (ret)
> +               goto err_mutex_destroy;
>
> -       dev_priv->gtt_map = ioremap(pg->gtt_phys_start, gtt_pages << PAGE_SHIFT);
> +       psb_gtt_init_ranges(dev_priv);
> +
> +       dev_priv->gtt_map = ioremap(pg->gtt_phys_start, pg->gtt_pages << PAGE_SHIFT);
>         if (!dev_priv->gtt_map) {
>                 dev_err(dev->dev, "Failure to map gtt.\n");
>                 ret = -ENOMEM;
> @@ -264,9 +287,8 @@ int psb_gtt_init(struct drm_device *dev)
>  int psb_gtt_resume(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -       struct pci_dev *pdev = to_pci_dev(dev->dev);
>         struct psb_gtt *pg = &dev_priv->gtt;
> -       unsigned int gtt_pages;
> +       unsigned int old_gtt_pages = pg->gtt_pages;
>         int ret;
>
>         /* Enable the GTT */
> @@ -274,61 +296,14 @@ int psb_gtt_resume(struct drm_device *dev)
>         if (ret)
>                 return ret;
>
> -       /* The root resource we allocate address space from */
> -       pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
> -
> -       /*
> -        *      The video mmu has a hw bug when accessing 0x0D0000000.
> -        *      Make gatt start at 0x0e000,0000. This doesn't actually
> -        *      matter for us but may do if the video acceleration ever
> -        *      gets opened up.
> -        */
> -       pg->mmu_gatt_start = 0xE0000000;
> -
> -       pg->gtt_start = pci_resource_start(pdev, PSB_GTT_RESOURCE);
> -       gtt_pages = pci_resource_len(pdev, PSB_GTT_RESOURCE) >> PAGE_SHIFT;
> -       /* CDV doesn't report this. In which case the system has 64 gtt pages */
> -       if (pg->gtt_start == 0 || gtt_pages == 0) {
> -               dev_dbg(dev->dev, "GTT PCI BAR not initialized.\n");
> -               gtt_pages = 64;
> -               pg->gtt_start = dev_priv->pge_ctl;
> -       }
> -
> -       pg->gatt_start = pci_resource_start(pdev, PSB_GATT_RESOURCE);
> -       pg->gatt_pages = pci_resource_len(pdev, PSB_GATT_RESOURCE) >> PAGE_SHIFT;
> -       dev_priv->gtt_mem = &pdev->resource[PSB_GATT_RESOURCE];
> +       psb_gtt_init_ranges(dev_priv);
>
> -       if (pg->gatt_pages == 0 || pg->gatt_start == 0) {
> -               static struct resource fudge;   /* Preferably peppermint */
> -               /*
> -                * This can occur on CDV systems. Fudge it in this case. We
> -                * really don't care what imaginary space is being allocated
> -                * at this point.
> -                */
> -               dev_dbg(dev->dev, "GATT PCI BAR not initialized.\n");
> -               pg->gatt_start = 0x40000000;
> -               pg->gatt_pages = (128 * 1024 * 1024) >> PAGE_SHIFT;
> -               /*
> -                * This is a little confusing but in fact the GTT is providing
> -                * a view from the GPU into memory and not vice versa. As such
> -                *  this is really allocating space that is not the same as the
> -                *  CPU address space on CDV.
> -                */
> -               fudge.start = 0x40000000;
> -               fudge.end = 0x40000000 + 128 * 1024 * 1024 - 1;
> -               fudge.name = "fudge";
> -               fudge.flags = IORESOURCE_MEM;
> -               dev_priv->gtt_mem = &fudge;
> -       }
> -
> -       if (gtt_pages != pg->gtt_pages) {
> +       if (old_gtt_pages != pg->gtt_pages) {
>                 dev_err(dev->dev, "GTT resume error.\n");
> -               ret = -EINVAL;
> +               ret = -ENODEV;
>                 goto err_psb_gtt_disable;
>         }
>
> -       pg->gtt_pages = gtt_pages;
> -
>         psb_gtt_clear(dev_priv);
>
>  err_psb_gtt_disable:
> --
> 2.35.1
>
