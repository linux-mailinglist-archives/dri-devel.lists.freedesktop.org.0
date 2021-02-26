Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415BD3263AE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 15:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02406EDF7;
	Fri, 26 Feb 2021 14:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1656EDF7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 14:04:50 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id i7so1095571wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 06:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ayfUP5ItpQZtt3c7ct2J5uiyz1LNVGzkIBowS2RlVnE=;
 b=N6VyBky6yrqmzsy3dtU3wFEmf2p5/yMikH4oimPwK7PglK8Pij8uusTZ+Fw5C3lKHT
 2FQ/M2z77/6QhLKYabYLTRTV5YfQVLhUCZn3qLwcG5DiWpfnU9rdkd+QjWNJ8wVpHaTR
 r+Ujv2inCUOmi6ulejm2tN8fK5VDSD9S5D9ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ayfUP5ItpQZtt3c7ct2J5uiyz1LNVGzkIBowS2RlVnE=;
 b=NIEdZuptX/C8fq9RMulTQVRlclp0X8fxR97cHvIZ1XAqUlFGAvUH4EaWMlnofdTIIH
 B3LJ2lAGuw3QEmozg7W1286eAQg+4MSFNAe393FEkps+LetxdWyX0s27j4ZokEZH9Nt+
 Eb7/rxeBfnG6qkJ3sDa8KtgpSsqWTePFOL9psN1wQal7VKq4fZbRXGcH5yNDMxZnnJLK
 SXbOLGMcq9PPKB+hPUDeJf25iDNjZx4Hf+xp3Mfjy9cH2AKq/bnOPGCI2xxyk2K1gGZn
 93c73gBMWlX6PtTincY/UDpKAt0rk7k5As1a2a28Nqa/sPfPCa89uIF0WHDto4a5J0Tu
 FyMQ==
X-Gm-Message-State: AOAM530Thvg0aIBH1XmmtsQNrtjtkwD5L0PTUtNAGMqwjM0cHoz/Qz4l
 TTlQ8JDMWlsHyEegxoU0nlxkwA==
X-Google-Smtp-Source: ABdhPJyGjQR51ZYzketlxzLlW+Bl8fDsgk+tAL5gaimSbPXnlXhVgDhi2+XdNg5WEU9PZRvzrOAQXA==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr3064971wmy.120.1614348289516; 
 Fri, 26 Feb 2021 06:04:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t8sm7570627wrr.10.2021.02.26.06.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 06:04:47 -0800 (PST)
Date: Fri, 26 Feb 2021 15:04:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vgem: use shmem helpers
Message-ID: <YDj//RhSq4JMeEmn@phenom.ffwll.local>
References: <20210223105951.912577-2-daniel.vetter@ffwll.ch>
 <20210225102306.1173073-1-daniel.vetter@ffwll.ch>
 <373f003f-1e7b-78ee-6de7-2982372f48b9@suse.de>
 <CAKMK7uFz2ZR63OV737cFqp+pCQFpJzMP5u8RcBnER9akK4wgng@mail.gmail.com>
 <3a230466-d797-c9dd-74c9-58b39d5c825e@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a230466-d797-c9dd-74c9-58b39d5c825e@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 02:51:58PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 26.02.21 um 14:30 schrieb Daniel Vetter:
> > On Fri, Feb 26, 2021 at 10:19 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
> > > =

> > > Hi
> > > =

> > > Am 25.02.21 um 11:23 schrieb Daniel Vetter:
> > > > Aside from deleting lots of code the real motivation here is to swi=
tch
> > > > the mmap over to VM_PFNMAP, to be more consistent with what real gpu
> > > > drivers do. They're all VM_PFNMP, which means get_user_pages doesn't
> > > > work, and even if you try and there's a struct page behind that,
> > > > touching it and mucking around with its refcount can upset drivers
> > > > real bad.
> > > > =

> > > > v2: Review from Thomas:
> > > > - sort #include
> > > > - drop more dead code that I didn't spot somehow
> > > > =

> > > > v3: select DRM_GEM_SHMEM_HELPER to make it build (intel-gfx-ci)
> > > =

> > > Since you're working on it, could you move the config item into a
> > > Kconfig file under vgem?
> > =

> > We have a lot of drivers still without their own Kconfig. I thought
> > we're only doing that for drivers which have multiple options, or
> > otherwise would clutter up the main drm/Kconfig file?
> > =

> > Not opposed to this, just feels like if we do this, should do it for
> > all of them.
> =

> I didn't know that there was a rule for how to handle this. I just didn't
> like to have driver config rules in the main Kconfig file.

I don't think it is an actual rule, just how the driver Kconfig files
started out.

> But yeah, maybe let's change this consistently in a separate patchset.

Yeah I looked, we should also put all the driver files at the bottom, and
maybe sort them alphabetically or something like that. It's a bit a mess
right now.
-Daniel

> =

> Best regards
> Thomas
> =

> > -Daniel
> > =

> > =

> > > =

> > > Best regards
> > > Thomas
> > > =

> > > > =

> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: John Stultz <john.stultz@linaro.org>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > > ---
> > > >    drivers/gpu/drm/Kconfig         |   1 +
> > > >    drivers/gpu/drm/vgem/vgem_drv.c | 340 +-------------------------=
------
> > > >    2 files changed, 4 insertions(+), 337 deletions(-)
> > > > =

> > > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > > index 8e73311de583..94e4ac830283 100644
> > > > --- a/drivers/gpu/drm/Kconfig
> > > > +++ b/drivers/gpu/drm/Kconfig
> > > > @@ -274,6 +274,7 @@ source "drivers/gpu/drm/kmb/Kconfig"
> > > >    config DRM_VGEM
> > > >        tristate "Virtual GEM provider"
> > > >        depends on DRM
> > > > +     select DRM_GEM_SHMEM_HELPER
> > > >        help
> > > >          Choose this option to get a virtual graphics memory manage=
r,
> > > >          as used by Mesa's software renderer for enhanced performan=
ce.
> > > > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem=
/vgem_drv.c
> > > > index a0e75f1d5d01..b1b3a5ffc542 100644
> > > > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > > > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > > > @@ -38,6 +38,7 @@
> > > > =

> > > >    #include <drm/drm_drv.h>
> > > >    #include <drm/drm_file.h>
> > > > +#include <drm/drm_gem_shmem_helper.h>
> > > >    #include <drm/drm_ioctl.h>
> > > >    #include <drm/drm_managed.h>
> > > >    #include <drm/drm_prime.h>
> > > > @@ -50,87 +51,11 @@
> > > >    #define DRIVER_MAJOR        1
> > > >    #define DRIVER_MINOR        0
> > > > =

> > > > -static const struct drm_gem_object_funcs vgem_gem_object_funcs;
> > > > -
> > > >    static struct vgem_device {
> > > >        struct drm_device drm;
> > > >        struct platform_device *platform;
> > > >    } *vgem_device;
> > > > =

> > > > -static void vgem_gem_free_object(struct drm_gem_object *obj)
> > > > -{
> > > > -     struct drm_vgem_gem_object *vgem_obj =3D to_vgem_bo(obj);
> > > > -
> > > > -     kvfree(vgem_obj->pages);
> > > > -     mutex_destroy(&vgem_obj->pages_lock);
> > > > -
> > > > -     if (obj->import_attach)
> > > > -             drm_prime_gem_destroy(obj, vgem_obj->table);
> > > > -
> > > > -     drm_gem_object_release(obj);
> > > > -     kfree(vgem_obj);
> > > > -}
> > > > -
> > > > -static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
> > > > -{
> > > > -     struct vm_area_struct *vma =3D vmf->vma;
> > > > -     struct drm_vgem_gem_object *obj =3D vma->vm_private_data;
> > > > -     /* We don't use vmf->pgoff since that has the fake offset */
> > > > -     unsigned long vaddr =3D vmf->address;
> > > > -     vm_fault_t ret =3D VM_FAULT_SIGBUS;
> > > > -     loff_t num_pages;
> > > > -     pgoff_t page_offset;
> > > > -     page_offset =3D (vaddr - vma->vm_start) >> PAGE_SHIFT;
> > > > -
> > > > -     num_pages =3D DIV_ROUND_UP(obj->base.size, PAGE_SIZE);
> > > > -
> > > > -     if (page_offset >=3D num_pages)
> > > > -             return VM_FAULT_SIGBUS;
> > > > -
> > > > -     mutex_lock(&obj->pages_lock);
> > > > -     if (obj->pages) {
> > > > -             get_page(obj->pages[page_offset]);
> > > > -             vmf->page =3D obj->pages[page_offset];
> > > > -             ret =3D 0;
> > > > -     }
> > > > -     mutex_unlock(&obj->pages_lock);
> > > > -     if (ret) {
> > > > -             struct page *page;
> > > > -
> > > > -             page =3D shmem_read_mapping_page(
> > > > -                                     file_inode(obj->base.filp)->i=
_mapping,
> > > > -                                     page_offset);
> > > > -             if (!IS_ERR(page)) {
> > > > -                     vmf->page =3D page;
> > > > -                     ret =3D 0;
> > > > -             } else switch (PTR_ERR(page)) {
> > > > -                     case -ENOSPC:
> > > > -                     case -ENOMEM:
> > > > -                             ret =3D VM_FAULT_OOM;
> > > > -                             break;
> > > > -                     case -EBUSY:
> > > > -                             ret =3D VM_FAULT_RETRY;
> > > > -                             break;
> > > > -                     case -EFAULT:
> > > > -                     case -EINVAL:
> > > > -                             ret =3D VM_FAULT_SIGBUS;
> > > > -                             break;
> > > > -                     default:
> > > > -                             WARN_ON(PTR_ERR(page));
> > > > -                             ret =3D VM_FAULT_SIGBUS;
> > > > -                             break;
> > > > -             }
> > > > -
> > > > -     }
> > > > -     return ret;
> > > > -}
> > > > -
> > > > -static const struct vm_operations_struct vgem_gem_vm_ops =3D {
> > > > -     .fault =3D vgem_gem_fault,
> > > > -     .open =3D drm_gem_vm_open,
> > > > -     .close =3D drm_gem_vm_close,
> > > > -};
> > > > -
> > > >    static int vgem_open(struct drm_device *dev, struct drm_file *fi=
le)
> > > >    {
> > > >        struct vgem_file *vfile;
> > > > @@ -159,265 +84,12 @@ static void vgem_postclose(struct drm_device =
*dev, struct drm_file *file)
> > > >        kfree(vfile);
> > > >    }
> > > > =

> > > > -static struct drm_vgem_gem_object *__vgem_gem_create(struct drm_de=
vice *dev,
> > > > -                                             unsigned long size)
> > > > -{
> > > > -     struct drm_vgem_gem_object *obj;
> > > > -     int ret;
> > > > -
> > > > -     obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> > > > -     if (!obj)
> > > > -             return ERR_PTR(-ENOMEM);
> > > > -
> > > > -     obj->base.funcs =3D &vgem_gem_object_funcs;
> > > > -
> > > > -     ret =3D drm_gem_object_init(dev, &obj->base, roundup(size, PA=
GE_SIZE));
> > > > -     if (ret) {
> > > > -             kfree(obj);
> > > > -             return ERR_PTR(ret);
> > > > -     }
> > > > -
> > > > -     mutex_init(&obj->pages_lock);
> > > > -
> > > > -     return obj;
> > > > -}
> > > > -
> > > > -static void __vgem_gem_destroy(struct drm_vgem_gem_object *obj)
> > > > -{
> > > > -     drm_gem_object_release(&obj->base);
> > > > -     kfree(obj);
> > > > -}
> > > > -
> > > > -static struct drm_gem_object *vgem_gem_create(struct drm_device *d=
ev,
> > > > -                                           struct drm_file *file,
> > > > -                                           unsigned int *handle,
> > > > -                                           unsigned long size)
> > > > -{
> > > > -     struct drm_vgem_gem_object *obj;
> > > > -     int ret;
> > > > -
> > > > -     obj =3D __vgem_gem_create(dev, size);
> > > > -     if (IS_ERR(obj))
> > > > -             return ERR_CAST(obj);
> > > > -
> > > > -     ret =3D drm_gem_handle_create(file, &obj->base, handle);
> > > > -     if (ret) {
> > > > -             drm_gem_object_put(&obj->base);
> > > > -             return ERR_PTR(ret);
> > > > -     }
> > > > -
> > > > -     return &obj->base;
> > > > -}
> > > > -
> > > > -static int vgem_gem_dumb_create(struct drm_file *file, struct drm_=
device *dev,
> > > > -                             struct drm_mode_create_dumb *args)
> > > > -{
> > > > -     struct drm_gem_object *gem_object;
> > > > -     u64 pitch, size;
> > > > -
> > > > -     pitch =3D args->width * DIV_ROUND_UP(args->bpp, 8);
> > > > -     size =3D args->height * pitch;
> > > > -     if (size =3D=3D 0)
> > > > -             return -EINVAL;
> > > > -
> > > > -     gem_object =3D vgem_gem_create(dev, file, &args->handle, size=
);
> > > > -     if (IS_ERR(gem_object))
> > > > -             return PTR_ERR(gem_object);
> > > > -
> > > > -     args->size =3D gem_object->size;
> > > > -     args->pitch =3D pitch;
> > > > -
> > > > -     drm_gem_object_put(gem_object);
> > > > -
> > > > -     DRM_DEBUG("Created object of size %llu\n", args->size);
> > > > -
> > > > -     return 0;
> > > > -}
> > > > -
> > > >    static struct drm_ioctl_desc vgem_ioctls[] =3D {
> > > >        DRM_IOCTL_DEF_DRV(VGEM_FENCE_ATTACH, vgem_fence_attach_ioctl=
, DRM_RENDER_ALLOW),
> > > >        DRM_IOCTL_DEF_DRV(VGEM_FENCE_SIGNAL, vgem_fence_signal_ioctl=
, DRM_RENDER_ALLOW),
> > > >    };
> > > > =

> > > > -static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
> > > > -{
> > > > -     unsigned long flags =3D vma->vm_flags;
> > > > -     int ret;
> > > > -
> > > > -     ret =3D drm_gem_mmap(filp, vma);
> > > > -     if (ret)
> > > > -             return ret;
> > > > -
> > > > -     /* Keep the WC mmaping set by drm_gem_mmap() but our pages
> > > > -      * are ordinary and not special.
> > > > -      */
> > > > -     vma->vm_flags =3D flags | VM_DONTEXPAND | VM_DONTDUMP;
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static const struct file_operations vgem_driver_fops =3D {
> > > > -     .owner          =3D THIS_MODULE,
> > > > -     .open           =3D drm_open,
> > > > -     .mmap           =3D vgem_mmap,
> > > > -     .poll           =3D drm_poll,
> > > > -     .read           =3D drm_read,
> > > > -     .unlocked_ioctl =3D drm_ioctl,
> > > > -     .compat_ioctl   =3D drm_compat_ioctl,
> > > > -     .release        =3D drm_release,
> > > > -};
> > > > -
> > > > -static struct page **vgem_pin_pages(struct drm_vgem_gem_object *bo)
> > > > -{
> > > > -     mutex_lock(&bo->pages_lock);
> > > > -     if (bo->pages_pin_count++ =3D=3D 0) {
> > > > -             struct page **pages;
> > > > -
> > > > -             pages =3D drm_gem_get_pages(&bo->base);
> > > > -             if (IS_ERR(pages)) {
> > > > -                     bo->pages_pin_count--;
> > > > -                     mutex_unlock(&bo->pages_lock);
> > > > -                     return pages;
> > > > -             }
> > > > -
> > > > -             bo->pages =3D pages;
> > > > -     }
> > > > -     mutex_unlock(&bo->pages_lock);
> > > > -
> > > > -     return bo->pages;
> > > > -}
> > > > -
> > > > -static void vgem_unpin_pages(struct drm_vgem_gem_object *bo)
> > > > -{
> > > > -     mutex_lock(&bo->pages_lock);
> > > > -     if (--bo->pages_pin_count =3D=3D 0) {
> > > > -             drm_gem_put_pages(&bo->base, bo->pages, true, true);
> > > > -             bo->pages =3D NULL;
> > > > -     }
> > > > -     mutex_unlock(&bo->pages_lock);
> > > > -}
> > > > -
> > > > -static int vgem_prime_pin(struct drm_gem_object *obj)
> > > > -{
> > > > -     struct drm_vgem_gem_object *bo =3D to_vgem_bo(obj);
> > > > -     long n_pages =3D obj->size >> PAGE_SHIFT;
> > > > -     struct page **pages;
> > > > -
> > > > -     pages =3D vgem_pin_pages(bo);
> > > > -     if (IS_ERR(pages))
> > > > -             return PTR_ERR(pages);
> > > > -
> > > > -     /* Flush the object from the CPU cache so that importers can =
rely
> > > > -      * on coherent indirect access via the exported dma-address.
> > > > -      */
> > > > -     drm_clflush_pages(pages, n_pages);
> > > > -
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static void vgem_prime_unpin(struct drm_gem_object *obj)
> > > > -{
> > > > -     struct drm_vgem_gem_object *bo =3D to_vgem_bo(obj);
> > > > -
> > > > -     vgem_unpin_pages(bo);
> > > > -}
> > > > -
> > > > -static struct sg_table *vgem_prime_get_sg_table(struct drm_gem_obj=
ect *obj)
> > > > -{
> > > > -     struct drm_vgem_gem_object *bo =3D to_vgem_bo(obj);
> > > > -
> > > > -     return drm_prime_pages_to_sg(obj->dev, bo->pages, bo->base.si=
ze >> PAGE_SHIFT);
> > > > -}
> > > > -
> > > > -static struct drm_gem_object* vgem_prime_import(struct drm_device =
*dev,
> > > > -                                             struct dma_buf *dma_b=
uf)
> > > > -{
> > > > -     struct vgem_device *vgem =3D container_of(dev, typeof(*vgem),=
 drm);
> > > > -
> > > > -     return drm_gem_prime_import_dev(dev, dma_buf, &vgem->platform=
->dev);
> > > > -}
> > > > -
> > > > -static struct drm_gem_object *vgem_prime_import_sg_table(struct dr=
m_device *dev,
> > > > -                     struct dma_buf_attachment *attach, struct sg_=
table *sg)
> > > > -{
> > > > -     struct drm_vgem_gem_object *obj;
> > > > -     int npages;
> > > > -
> > > > -     obj =3D __vgem_gem_create(dev, attach->dmabuf->size);
> > > > -     if (IS_ERR(obj))
> > > > -             return ERR_CAST(obj);
> > > > -
> > > > -     npages =3D PAGE_ALIGN(attach->dmabuf->size) / PAGE_SIZE;
> > > > -
> > > > -     obj->table =3D sg;
> > > > -     obj->pages =3D kvmalloc_array(npages, sizeof(struct page *), =
GFP_KERNEL);
> > > > -     if (!obj->pages) {
> > > > -             __vgem_gem_destroy(obj);
> > > > -             return ERR_PTR(-ENOMEM);
> > > > -     }
> > > > -
> > > > -     obj->pages_pin_count++; /* perma-pinned */
> > > > -     drm_prime_sg_to_page_array(obj->table, obj->pages, npages);
> > > > -     return &obj->base;
> > > > -}
> > > > -
> > > > -static int vgem_prime_vmap(struct drm_gem_object *obj, struct dma_=
buf_map *map)
> > > > -{
> > > > -     struct drm_vgem_gem_object *bo =3D to_vgem_bo(obj);
> > > > -     long n_pages =3D obj->size >> PAGE_SHIFT;
> > > > -     struct page **pages;
> > > > -     void *vaddr;
> > > > -
> > > > -     pages =3D vgem_pin_pages(bo);
> > > > -     if (IS_ERR(pages))
> > > > -             return PTR_ERR(pages);
> > > > -
> > > > -     vaddr =3D vmap(pages, n_pages, 0, pgprot_writecombine(PAGE_KE=
RNEL));
> > > > -     if (!vaddr)
> > > > -             return -ENOMEM;
> > > > -     dma_buf_map_set_vaddr(map, vaddr);
> > > > -
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static void vgem_prime_vunmap(struct drm_gem_object *obj, struct d=
ma_buf_map *map)
> > > > -{
> > > > -     struct drm_vgem_gem_object *bo =3D to_vgem_bo(obj);
> > > > -
> > > > -     vunmap(map->vaddr);
> > > > -     vgem_unpin_pages(bo);
> > > > -}
> > > > -
> > > > -static int vgem_prime_mmap(struct drm_gem_object *obj,
> > > > -                        struct vm_area_struct *vma)
> > > > -{
> > > > -     int ret;
> > > > -
> > > > -     if (obj->size < vma->vm_end - vma->vm_start)
> > > > -             return -EINVAL;
> > > > -
> > > > -     if (!obj->filp)
> > > > -             return -ENODEV;
> > > > -
> > > > -     ret =3D call_mmap(obj->filp, vma);
> > > > -     if (ret)
> > > > -             return ret;
> > > > -
> > > > -     vma_set_file(vma, obj->filp);
> > > > -     vma->vm_flags |=3D VM_DONTEXPAND | VM_DONTDUMP;
> > > > -     vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vm=
a->vm_flags));
> > > > -
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static const struct drm_gem_object_funcs vgem_gem_object_funcs =3D=
 {
> > > > -     .free =3D vgem_gem_free_object,
> > > > -     .pin =3D vgem_prime_pin,
> > > > -     .unpin =3D vgem_prime_unpin,
> > > > -     .get_sg_table =3D vgem_prime_get_sg_table,
> > > > -     .vmap =3D vgem_prime_vmap,
> > > > -     .vunmap =3D vgem_prime_vunmap,
> > > > -     .vm_ops =3D &vgem_gem_vm_ops,
> > > > -};
> > > > +DEFINE_DRM_GEM_FOPS(vgem_driver_fops);
> > > > =

> > > >    static const struct drm_driver vgem_driver =3D {
> > > >        .driver_features                =3D DRIVER_GEM | DRIVER_REND=
ER,
> > > > @@ -427,13 +99,7 @@ static const struct drm_driver vgem_driver =3D {
> > > >        .num_ioctls                     =3D ARRAY_SIZE(vgem_ioctls),
> > > >        .fops                           =3D &vgem_driver_fops,
> > > > =

> > > > -     .dumb_create                    =3D vgem_gem_dumb_create,
> > > > -
> > > > -     .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
> > > > -     .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
> > > > -     .gem_prime_import =3D vgem_prime_import,
> > > > -     .gem_prime_import_sg_table =3D vgem_prime_import_sg_table,
> > > > -     .gem_prime_mmap =3D vgem_prime_mmap,
> > > > +     DRM_GEM_SHMEM_DRIVER_OPS,
> > > > =

> > > >        .name   =3D DRIVER_NAME,
> > > >        .desc   =3D DRIVER_DESC,
> > > > =

> > > =

> > > --
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> > > (HRB 36809, AG N=FCrnberg)
> > > Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> > > =

> > =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
