Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763A3C9D85
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 13:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E130D6E825;
	Thu, 15 Jul 2021 11:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266476E825;
 Thu, 15 Jul 2021 11:10:05 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id h18so2616308qve.1;
 Thu, 15 Jul 2021 04:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=erj/xfMvJMq8CHG/t0Rf+P/0Sd/HUs6DzOm7FgUDO00=;
 b=jiY4tJDOdR21Bex8W90LV+7kMpwTiaxJ42XlQ9BQ/T0nx+ror+j4Z0wHcC+vuSrYlN
 UUECmDormyinxOm3qskPNHTTzTiJB9rqRhPXam0fEd2PkgKZSbiFJ+gVFZTBICsj7ThM
 0a0zDOGxmKEkxyK0dRUkoA7dfzP8TPRNIJLf6UmT768GgYE32kayf6YCJImqzILpdsbL
 OSsRVKzeXH2NEFZP9kZsalWr4EGZxnqgj67L8YNNVBDPtJKyceOfTXxksDhAqh79c84X
 061m3HrxC3rNpoiGc+OdUe2BNDwNWQZFHpDZhWqvVYQGU+SXWiwY/BxL97Wy4aV7Zi9Q
 4gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=erj/xfMvJMq8CHG/t0Rf+P/0Sd/HUs6DzOm7FgUDO00=;
 b=HWf/nG6e4nEQQHxRpomM30WZ1PJYDNnS1GA39XUpxchmb0w/ai4UvGnuECqG/TQIeT
 WKTI2W3P/fDKJv5x8kCmWGFvH8UTGugNYOTM1wJ9Pcp2ON9SUc6mAD1zS6pJA4BKk33m
 AgItiQ9C+AuDKhy2Arg7ALBtRTM6k5n9UFj2y7tw9c7YlcoV5q9YMwTIVN5fTbAuXyQ6
 g0g1YLg1ecTOHuaSduzKHddgr7hqSpCA0NeOeUsPa8oJND+N08Iwyz0iBhByh3d86hrp
 +XmVgN0M+S1PQ6g6e/ARW3BH2WqzmhbgVnL6r9awfgz4Qhhgr1ESFtN8VJM9+MiKFR5L
 qVSA==
X-Gm-Message-State: AOAM5326g0uVUneMqWIB10xjW0nk63cz2bi078EeSLrhc6v+ffCNyUl/
 V2nF8ZV7NPLKtlgi3NJVSW0ZSiP7KYtBHZvuGms=
X-Google-Smtp-Source: ABdhPJyv31PVDStnmKTB898zla8choRKoUSGnqqiVs493WOKU5FphD+1JSuH/yaX2+8cbALnd63cp8jfucIZTvkQdlI=
X-Received: by 2002:a05:6214:19c3:: with SMTP id
 j3mr3804670qvc.60.1626347404201; 
 Thu, 15 Jul 2021 04:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <20210715101536.2606307-4-matthew.auld@intel.com>
 <997238fe-075b-380d-3ef2-b9f528193623@linux.intel.com>
In-Reply-To: <997238fe-075b-380d-3ef2-b9f528193623@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 15 Jul 2021 12:09:35 +0100
Message-ID: <CAM0jSHMmmYwKTCBqdUkQFu4o_jyTdj30vxwS2sqoSZd5KB_xQQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/userptr: Probe existence of
 backing struct pages upon creation
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Jul 2021 at 11:33, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 15/07/2021 11:15, Matthew Auld wrote:
> > From: Chris Wilson <chris@chris-wilson.co.uk>
> >
> > Jason Ekstrand requested a more efficient method than userptr+set-domai=
n
> > to determine if the userptr object was backed by a complete set of page=
s
> > upon creation. To be more efficient than simply populating the userptr
> > using get_user_pages() (as done by the call to set-domain or execbuf),
> > we can walk the tree of vm_area_struct and check for gaps or vma not
> > backed by struct page (VM_PFNMAP). The question is how to handle
> > VM_MIXEDMAP which may be either struct page or pfn backed...
> >
> > With discrete are going to drop support for set_domain(), so offering a
> > way to probe the pages, without having to resort to dummy batches has
> > been requested.
> >
> > v2:
> > - add new query param for the PROPBE flag, so userspace can easily
> >    check if the kernel supports it(Jason).
> > - use mmap_read_{lock, unlock}.
> > - add some kernel-doc.
>
> 1)
>
> I think probing is too weak to be offered as part of the uapi. What
> probes successfully at create time might not be there anymore at usage
> time. So if the pointer is not trusted at one point, why should it be at
> a later stage?
>
> Only thing which works for me is populate (so get_pages) at create time.
> But again with no guarantees they are still there at use time clearly
> documented.
>
> 2)
>
> I am also not a fan of getparam for individual ioctl flags since I don't
> think it scales nicely. How about add a param which returns all
> supported flags like I915_PARAM_USERPTR_SUPPORTED_FLAGS?
>
> Downside is it only works for 32-bit flag fields with getparam. Or it
> could be a query to solve that as well.

I guess. You don't think it's a little iffy though, since there were
other flags which were added before this? So effectively userspace
queries SUPPORTED_FLAGS and might get -EINVAL on older kernels, even
though the flag is supported on that kernel(like READONLY)?

Maybe a versioning scheme instead? I915_PARAM_USERPTR_VERSION? Seems
quite common for other params.

>
> Regards,
>
> Tvrtko
>
> > Testcase: igt/gem_userptr_blits/probe
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 40 ++++++++++++++++++++=
-
> >   drivers/gpu/drm/i915/i915_getparam.c        |  3 ++
> >   include/uapi/drm/i915_drm.h                 | 18 ++++++++++
> >   3 files changed, 60 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/=
drm/i915/gem/i915_gem_userptr.c
> > index 56edfeff8c02..fd6880328596 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > @@ -422,6 +422,33 @@ static const struct drm_i915_gem_object_ops i915_g=
em_userptr_ops =3D {
> >
> >   #endif
> >
> > +static int
> > +probe_range(struct mm_struct *mm, unsigned long addr, unsigned long le=
n)
> > +{
> > +     const unsigned long end =3D addr + len;
> > +     struct vm_area_struct *vma;
> > +     int ret =3D -EFAULT;
> > +
> > +     mmap_read_lock(mm);
> > +     for (vma =3D find_vma(mm, addr); vma; vma =3D vma->vm_next) {
> > +             if (vma->vm_start > addr)
> > +                     break;
> > +
> > +             if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
> > +                     break;
> > +
> > +             if (vma->vm_end >=3D end) {
> > +                     ret =3D 0;
> > +                     break;
> > +             }
> > +
> > +             addr =3D vma->vm_end;
> > +     }
> > +     mmap_read_unlock(mm);
> > +
> > +     return ret;
> > +}
> > +
> >   /*
> >    * Creates a new mm object that wraps some normal memory from the pro=
cess
> >    * context - user memory.
> > @@ -477,7 +504,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> >       }
> >
> >       if (args->flags & ~(I915_USERPTR_READ_ONLY |
> > -                         I915_USERPTR_UNSYNCHRONIZED))
> > +                         I915_USERPTR_UNSYNCHRONIZED |
> > +                         I915_USERPTR_PROBE))
> >               return -EINVAL;
> >
> >       if (i915_gem_object_size_2big(args->user_size))
> > @@ -504,6 +532,16 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> >                       return -ENODEV;
> >       }
> >
> > +     if (args->flags & I915_USERPTR_PROBE) {
> > +             /*
> > +              * Check that the range pointed to represents real struct
> > +              * pages and not iomappings (at this moment in time!)
> > +              */
> > +             ret =3D probe_range(current->mm, args->user_ptr, args->us=
er_size);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >   #ifdef CONFIG_MMU_NOTIFIER
> >       obj =3D i915_gem_object_alloc();
> >       if (obj =3D=3D NULL)
> > diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i91=
5/i915_getparam.c
> > index 24e18219eb50..d6d2e1a10d14 100644
> > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > @@ -163,6 +163,9 @@ int i915_getparam_ioctl(struct drm_device *dev, voi=
d *data,
> >       case I915_PARAM_PERF_REVISION:
> >               value =3D i915_perf_ioctl_version();
> >               break;
> > +     case I915_PARAM_HAS_USERPTR_PROBE:
> > +             value =3D true;
> > +             break;
> >       default:
> >               DRM_DEBUG("Unknown parameter %d\n", param->param);
> >               return -EINVAL;
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index e20eeeca7a1c..2e4112bf4d38 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -674,6 +674,9 @@ typedef struct drm_i915_irq_wait {
> >    */
> >   #define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
> >
> > +/* Query if the kernel supports the I915_USERPTR_PROBE flag. */
> > +#define I915_PARAM_HAS_USERPTR_PROBE 56
> > +
> >   /* Must be kept compact -- no holes and well documented */
> >
> >   typedef struct drm_i915_getparam {
> > @@ -2178,12 +2181,27 @@ struct drm_i915_gem_userptr {
> >        * through the GTT. If the HW can't support readonly access, an e=
rror is
> >        * returned.
> >        *
> > +      * I915_USERPTR_PROBE:
> > +      *
> > +      * Probe the provided @user_ptr range and validate that the @user=
_ptr is
> > +      * indeed pointing to normal memory and that the range is also va=
lid.
> > +      * For example if some garbage address is given to the kernel, th=
en this
> > +      * should complain.
> > +      *
> > +      * Returns -EFAULT if the probe failed.
> > +      *
> > +      * Note that this doesn't populate the backing pages.
> > +      *
> > +      * The kernel supports this feature if I915_PARAM_HAS_USERPTR_PRO=
BE
> > +      * returns a non-zero value.
> > +      *
> >        * I915_USERPTR_UNSYNCHRONIZED:
> >        *
> >        * NOT USED. Setting this flag will result in an error.
> >        */
> >       __u32 flags;
> >   #define I915_USERPTR_READ_ONLY 0x1
> > +#define I915_USERPTR_PROBE 0x2
> >   #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
> >       /**
> >        * @handle: Returned handle for the object.
> >
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
