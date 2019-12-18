Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFBF1256D3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662F26EA8D;
	Wed, 18 Dec 2019 22:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C2D6EA8D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:34:45 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id a6so3089322ili.9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oB3C/amjaPaUoFd3WkaUwk7Puy42NPe+srnuJ0tvf1c=;
 b=hbRmJLXew0YwGinXhZPGdP7G2Wo3vDuXm7EkUeYMjef16hIFBOPvla45pmB4Eups5P
 0Mo+F1RpvpiZv3geo5TxZVFxO7LD2JkKe9eAUh0SbN5YE3BItjALIyYbgxAanIF9geSc
 0z593n+diWeftkY2MuJoTfGlTH+tiDaHZ+yXgNCjki9NGOkR+jF1pk6+WshLm0M6WLX8
 +1mywMg9JSmK5HPq2dAoRBI8bN4r3IN6iP79XRkaP3QfTsOK2Pnc42YhkRJpq3iAw/zV
 dZ/IrNrh3M5KDoJsBSBCyHhlNRls2bCc53/rlCEYX+UUNQTWx7dD9uwvDtr9BzNWIrEQ
 VGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oB3C/amjaPaUoFd3WkaUwk7Puy42NPe+srnuJ0tvf1c=;
 b=l3MQTrNsixpGhMxFDgnWy4HLe5A03x9B9XB2WaaTO87zKThDf02AaXzlMTtzZJL01K
 5mRvlGvQN3aAMQPvtltvIbTn9Pu4/fwUvoPCTIojyemkjYUmwtL/ruL3Uh05OXtAmYCl
 4yVRZTqco/aj54ay4E99d48c4jrDyKlGbujy0Q2pyJUgcsejUs2EdPvktvoMSjEYjvZk
 zECHHXJq3sanIrUPT+gSfQcsXob6x3Cx7A0w3EtCHsoo/Ee/VeBHLeixDTGtpcqu0FeL
 v0vMphnEjuu2+FgPUYwo5VJk3RKUUt4oF3JUCoOXxJccCHXIUzizj1WW/t1Z66od3nja
 caRw==
X-Gm-Message-State: APjAAAUbBP4BRHu1ZYhqqT+xORC3/FRj2P/PsQLobbNNmW1ieTv5HPFA
 H1202CK6TB9aF6JMeGZqKk9naSo4RoAKGWAB/N4=
X-Google-Smtp-Source: APXvYqzbXsO71rLtp1FSjeCcYbAsLuT54QDwOPuwFtllLBf/IaluI6ARmSGaz1wD6bQn2OuLqLqlYLUprnz5H/5roJo=
X-Received: by 2002:a92:9e97:: with SMTP id s23mr4461314ilk.139.1576708485032; 
 Wed, 18 Dec 2019 14:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20191218125645.9211-1-kraxel@redhat.com>
 <20191218125645.9211-4-kraxel@redhat.com>
In-Reply-To: <20191218125645.9211-4-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 18 Dec 2019 14:34:34 -0800
Message-ID: <CAPaKu7RyFjYCxuCVF7aBMfs4UdNwWahoh3Jg67sb2nOeyH+9Zg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/udl: simplify gem object mapping.
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, tzimmermann@suse.de,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 18, 2019 at 4:56 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> With shmem helpers allowing to update pgprot caching flags via
> drm_gem_shmem_object.map_cached we can just use that and ditch
> our own implementations of mmap() and vmap().
>
> We also don't need a special case for imported objects, any map
> requests are handled by the exporter not udl.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/udl/udl_gem.c | 62 ++---------------------------------
>  1 file changed, 3 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_gem.c
> index b6e26f98aa0a..7e3a88b25b6b 100644
> --- a/drivers/gpu/drm/udl/udl_gem.c
> +++ b/drivers/gpu/drm/udl/udl_gem.c
> @@ -17,72 +17,15 @@
>   * GEM object funcs
>   */
>
> -static int udl_gem_object_mmap(struct drm_gem_object *obj,
> -                              struct vm_area_struct *vma)
> -{
> -       int ret;
> -
> -       ret = drm_gem_shmem_mmap(obj, vma);
> -       if (ret)
> -               return ret;
> -
> -       vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> -       if (obj->import_attach)
> -               vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> -       vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> -
> -       return 0;
> -}
> -
> -static void *udl_gem_object_vmap(struct drm_gem_object *obj)
> -{
> -       struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> -       int ret;
> -
> -       ret = mutex_lock_interruptible(&shmem->vmap_lock);
> -       if (ret)
> -               return ERR_PTR(ret);
> -
> -       if (shmem->vmap_use_count++ > 0)
> -               goto out;
> -
> -       ret = drm_gem_shmem_get_pages(shmem);
> -       if (ret)
> -               goto err_zero_use;
> -
> -       if (obj->import_attach)
> -               shmem->vaddr = dma_buf_vmap(obj->import_attach->dmabuf);
> -       else
> -               shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
> -                                   VM_MAP, PAGE_KERNEL);
> -
> -       if (!shmem->vaddr) {
> -               DRM_DEBUG_KMS("Failed to vmap pages\n");
> -               ret = -ENOMEM;
> -               goto err_put_pages;
> -       }
> -
> -out:
> -       mutex_unlock(&shmem->vmap_lock);
> -       return shmem->vaddr;
> -
> -err_put_pages:
> -       drm_gem_shmem_put_pages(shmem);
> -err_zero_use:
> -       shmem->vmap_use_count = 0;
> -       mutex_unlock(&shmem->vmap_lock);
> -       return ERR_PTR(ret);
> -}
> -
>  static const struct drm_gem_object_funcs udl_gem_object_funcs = {
>         .free = drm_gem_shmem_free_object,
>         .print_info = drm_gem_shmem_print_info,
>         .pin = drm_gem_shmem_pin,
>         .unpin = drm_gem_shmem_unpin,
>         .get_sg_table = drm_gem_shmem_get_sg_table,
> -       .vmap = udl_gem_object_vmap,
> +       .vmap = drm_gem_shmem_vmap,
>         .vunmap = drm_gem_shmem_vunmap,
> -       .mmap = udl_gem_object_mmap,
> +       .mmap = drm_gem_shmem_mmap,
>  };
It looks like we can just use the default ops (drm_gem_shmem_funcs).

With that, this series is

  Reviewed-by: Chia-I Wu <olvaffe@gmail.com>.

>
>  /*
> @@ -101,6 +44,7 @@ struct drm_gem_object *udl_driver_gem_create_object(struct drm_device *dev,
>
>         obj = &shmem->base;
>         obj->funcs = &udl_gem_object_funcs;
> +       shmem->map_cached = true;
>
>         return obj;
>  }
> --
> 2.18.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
