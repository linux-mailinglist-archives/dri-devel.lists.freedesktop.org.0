Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A531C3969
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FEB89F24;
	Mon,  4 May 2020 12:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966FD89CF5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:32:05 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id n207so4548128vkf.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lklxy+sYpyzWF52ttbPWvntCg6ps8wAjH4z8IilwOD4=;
 b=RcgAZTRJBXwsArsjkZ2ipn9y7rapYDMqkYiOUCe5XnJqKeXOdMcDppk/ZEcik/pTix
 JM15CHGlL6jW07PiOVXXTDfRO60pc9LsQRldzpkjcFqWAIfHMh8TYJorYQcED2984/o/
 e6/5igETHTRjJNFZlxO2ktYAT6e2aYg4r4srE8lHK9XO9EIb66n+OjJ3k8CEsWSKLJCc
 l7VLOn6i0UUhv4QPCM77l8u9voZiYv6V3XH7krBGLIkd8gW3zbaiTZOzhDu6rPhr57u1
 Q0mPt2661XkBAt0FkvataJlQgJmevKpN+Io9It79E4p6IG3OpRgs/Mc074S0RtBZh3xZ
 ymcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lklxy+sYpyzWF52ttbPWvntCg6ps8wAjH4z8IilwOD4=;
 b=fD72duJdxdKWeVXYhTwz3/IaEjoFEK6quFMXUO0M118sKn8iuprMQxp0hRiLy3TAR+
 P8sV/HpIKp84+WUMSE7jXDuMztNcP07Nz4c2deQ9hnjtLpaKVOPUCiJtYDIEujFgF/DY
 pLuz3UFGqC2SMIXmDC9T3+PxlIH0IOuce3h4ODZUIZc/+aNYeyJBFlseF6RO7AAxDra6
 iLPigXsPfDkdIKbMOcx9VZjcRcJ6IrswvIEswnAZbYV5mwxzfay4tNB9cn9N6FuLNIpg
 LT9vutWw4kS33TuBKgZmDUvz3fNb8mYY30mnFQ5RFoOGqjNKs1j5nm5uFqX3oa8mXRZL
 1M8g==
X-Gm-Message-State: AGi0PuZ035wNAM5QdS52Ibp2YkePVnoNXJsmAvZ9dyNUHfdZJi1+A6bu
 tBtQmA/uDvLAhQtKDX2UyomOeUGVjcEhMAbIxlo=
X-Google-Smtp-Source: APiQypLJ/pWaviUfjyIVbcsAleUT2OTRk5Yo4Mg2B5te/p87P66naFXn35eSDvcr/WjYM8Uavt5PHe4Eq5ZQMWWaI0U=
X-Received: by 2002:a1f:a454:: with SMTP id n81mr9921524vke.6.1588595524675;
 Mon, 04 May 2020 05:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-18-tzimmermann@suse.de>
In-Reply-To: <20200429143238.10115-18-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 4 May 2020 13:29:40 +0100
Message-ID: <CACvgo50KRJV1E-D3KBmKdDWOqY_JH8V29U+f9igUtCS058VxUg@mail.gmail.com>
Subject: Re: [PATCH 17/17] drm/mgag200: Replace VRAM helpers with SHMEM helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Just a couple of fly-by comments.

On Wed, 29 Apr 2020 at 15:33, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> @@ -1618,21 +1640,13 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
>         struct mga_device *mdev = to_mga_device(dev);
>         struct drm_plane_state *state = plane->state;
>         struct drm_framebuffer *fb = state->fb;
> -       struct drm_gem_vram_object *gbo;
> -       s64 gpu_addr;
> +       struct drm_rect damage;
>
>         if (!fb)
>                 return;
>
> -       gbo = drm_gem_vram_of_gem(fb->obj[0]);
> -
> -       gpu_addr = drm_gem_vram_offset(gbo);
> -       if (drm_WARN_ON_ONCE(dev, gpu_addr < 0))
> -               return; /* BUG: BO should have been pinned to VRAM. */
> -
> -       mgag200_set_format_regs(mdev, fb);
This function seems to be missing from the handle_damage helper.

Is that intentional, something which should be squashed with another
patch or it belongs in the helper?

> -       mgag200_set_startadd(mdev, (unsigned long)gpu_addr);
> -       mgag200_set_offset(mdev, fb);
> +       if (drm_atomic_helper_damage_merged(old_state, state, &damage))
> +               mgag200_handle_damage(mdev, fb, &damage);
>  }



>  int mgag200_mm_init(struct mga_device *mdev)
>  {

> +       arch_io_reserve_memtype_wc(pci_resource_start(pdev, 0),
> +                                  pci_resource_len(pdev, 0));
>
> -       arch_io_reserve_memtype_wc(pci_resource_start(dev->pdev, 0),
> -                                  pci_resource_len(dev->pdev, 0));
> +       mdev->fb_mtrr = arch_phys_wc_add(pci_resource_start(pdev, 0),
> +                                        pci_resource_len(pdev, 0));
>
> -       mdev->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
> -                                        pci_resource_len(dev->pdev, 0));

Some spurious s/dev->pdev/pdev/g changes got in the way. Might as well
do those separately...

> +       mdev->vram = ioremap(pci_resource_start(pdev, 0),
> +                            pci_resource_len(pdev, 0));
> +       if (!mdev->vram) {
> +               ret = -ENOMEM;
> +               goto err_arch_phys_wc_del;
> +       }
>
>         mdev->vram_fb_available = mdev->mc.vram_size;
>
>         return 0;
> +
> +err_arch_phys_wc_del:
> +       arch_phys_wc_del(mdev->fb_mtrr);
> +       arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
> +                               pci_resource_len(dev->pdev, 0));
... and consistently?

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
