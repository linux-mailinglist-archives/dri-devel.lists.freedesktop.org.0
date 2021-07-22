Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3093D1FF8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 10:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB096E8BD;
	Thu, 22 Jul 2021 08:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2B66E3DA;
 Thu, 22 Jul 2021 08:44:17 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id kl28so313925qvb.13;
 Thu, 22 Jul 2021 01:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k8MQI7ek4uNFdolzMqwsT6mjeT2mtc6YO4Pxe5Xpwp4=;
 b=VhOCaCqvdmFJANvI35fP0gluUxk+yre7Evobuy8gSlrAx8kb/CoE4QKoClyimK3H+z
 6dVIsdRKS6ps9Ua/UfO4VEBO6FAQr8gWRxqznX3WXyZrhwW/H/rL87NQf3tZJEVUtvGU
 SHt3t9kIGe7Whe72hztyZAOag6TgIyTDEN2TxiNg+MaAPGMIQ44hzkG2LUrcsQA6fzLP
 xSwb5EUHqokP5INEPrWtzwD0tPVplSr77AO9qEaIZ1BPQABQWEphJk/rzkyqj49ioAbK
 e6jqF6LFY2uoqC+b1QzkLY77kxq7vMuvSn83bVWuXwP95ILkDjgJqmcaJeWNNJW1kK3O
 qd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k8MQI7ek4uNFdolzMqwsT6mjeT2mtc6YO4Pxe5Xpwp4=;
 b=MZRYH5XpKb0mosIyB2ztyQz+3Gx/tgxjVydDJ6r0BHlIYUEbql0niBI1Ns/7zjz9Hd
 ms7RxNOylZxdfNpqYQiNHi15ROLkqSsDETBUk6BD7n9Pz4ZML4N1gL7ISemOCg4/xfB5
 WWXOc8X8rDRnkAAS24Vd9bYREYY61UVWK13hO0qBKqHx+5ssykdFUbrp9tUQWVnUoNDj
 W/7KMWJfKYGXsZ/AVZY00e/kRZnvO9sO4Oes77k9w6pCrDVuEfGgxmKl619M67J7Py03
 CsIz+f4fsMvYL9+X9UHQroqZg03jb9t4THsGuMlhChW73YXYENwXPawIwtknzkBL8vfo
 ItKQ==
X-Gm-Message-State: AOAM532/QklvfMAW56YdkYdKobyEPTylYt5mBF5Z1jPMwD4VeKG0nfZN
 kqq4CR1IfCNowOY8tEENNkmcV3+KEeWuZGk4tRQ=
X-Google-Smtp-Source: ABdhPJxHxhldVs7N/N92k7V7ocCvyYKa+DEA3SxV1W3VffOXlOaorI4zgwq93EKDaljGr58eSEZ7G0qcVYj8lAnnTGg=
X-Received: by 2002:a0c:e54e:: with SMTP id n14mr40195067qvm.41.1626943456686; 
 Thu, 22 Jul 2021 01:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <20210715101536.2606307-4-matthew.auld@intel.com>
 <CAOFGe9667Mi9pJWNmzQP6LmiWvTmHWN5UVVs7B046FDozcwcPw@mail.gmail.com>
In-Reply-To: <CAOFGe9667Mi9pJWNmzQP6LmiWvTmHWN5UVVs7B046FDozcwcPw@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 22 Jul 2021 09:43:50 +0100
Message-ID: <CAM0jSHPAhURYUVzdsaVKd+U8nYniO+vQVyU3zeYUyKddj4xW0Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/userptr: Probe existence of
 backing struct pages upon creation
To: Jason Ekstrand <jason@jlekstrand.net>
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
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jul 2021 at 21:28, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Thu, Jul 15, 2021 at 5:16 AM Matthew Auld <matthew.auld@intel.com> wro=
te:
> >
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
> >   check if the kernel supports it(Jason).
> > - use mmap_read_{lock, unlock}.
> > - add some kernel-doc.
> >
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
> >  drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 40 ++++++++++++++++++++-
> >  drivers/gpu/drm/i915/i915_getparam.c        |  3 ++
> >  include/uapi/drm/i915_drm.h                 | 18 ++++++++++
> >  3 files changed, 60 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/=
drm/i915/gem/i915_gem_userptr.c
> > index 56edfeff8c02..fd6880328596 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > @@ -422,6 +422,33 @@ static const struct drm_i915_gem_object_ops i915_g=
em_userptr_ops =3D {
> >
> >  #endif
> >
> > +static int
> > +probe_range(struct mm_struct *mm, unsigned long addr, unsigned long le=
n)
> > +{
> > +       const unsigned long end =3D addr + len;
> > +       struct vm_area_struct *vma;
> > +       int ret =3D -EFAULT;
> > +
> > +       mmap_read_lock(mm);
> > +       for (vma =3D find_vma(mm, addr); vma; vma =3D vma->vm_next) {
> > +               if (vma->vm_start > addr)
>
> Why isn't this > end?  Are we somehow guaranteed that one vma covers
> the entire range?

AFAIK we are just making sure we don't have a hole(note that we also
update addr below), for example the user might have done a partial
munmap. There could be multiple vma's if the kernel was unable to
merge them. If we reach the vm_end >=3D end, then we know we have a
"valid" range.

>
> > +                       break;
> > +
> > +               if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
> > +                       break;
> > +
> > +               if (vma->vm_end >=3D end) {
> > +                       ret =3D 0;
> > +                       break;
> > +               }
> > +
> > +               addr =3D vma->vm_end;
> > +       }
> > +       mmap_read_unlock(mm);
> > +
> > +       return ret;
> > +}
> > +
> >  /*
> >   * Creates a new mm object that wraps some normal memory from the proc=
ess
> >   * context - user memory.
> > @@ -477,7 +504,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> >         }
> >
> >         if (args->flags & ~(I915_USERPTR_READ_ONLY |
> > -                           I915_USERPTR_UNSYNCHRONIZED))
> > +                           I915_USERPTR_UNSYNCHRONIZED |
> > +                           I915_USERPTR_PROBE))
> >                 return -EINVAL;
> >
> >         if (i915_gem_object_size_2big(args->user_size))
> > @@ -504,6 +532,16 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> >                         return -ENODEV;
> >         }
> >
> > +       if (args->flags & I915_USERPTR_PROBE) {
> > +               /*
> > +                * Check that the range pointed to represents real stru=
ct
> > +                * pages and not iomappings (at this moment in time!)
> > +                */
> > +               ret =3D probe_range(current->mm, args->user_ptr, args->=
user_size);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> >  #ifdef CONFIG_MMU_NOTIFIER
> >         obj =3D i915_gem_object_alloc();
> >         if (obj =3D=3D NULL)
> > diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i91=
5/i915_getparam.c
> > index 24e18219eb50..d6d2e1a10d14 100644
> > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > @@ -163,6 +163,9 @@ int i915_getparam_ioctl(struct drm_device *dev, voi=
d *data,
> >         case I915_PARAM_PERF_REVISION:
> >                 value =3D i915_perf_ioctl_version();
> >                 break;
> > +       case I915_PARAM_HAS_USERPTR_PROBE:
> > +               value =3D true;
> > +               break;
> >         default:
> >                 DRM_DEBUG("Unknown parameter %d\n", param->param);
> >                 return -EINVAL;
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index e20eeeca7a1c..2e4112bf4d38 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -674,6 +674,9 @@ typedef struct drm_i915_irq_wait {
> >   */
> >  #define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
> >
> > +/* Query if the kernel supports the I915_USERPTR_PROBE flag. */
> > +#define I915_PARAM_HAS_USERPTR_PROBE 56
> > +
> >  /* Must be kept compact -- no holes and well documented */
> >
> >  typedef struct drm_i915_getparam {
> > @@ -2178,12 +2181,27 @@ struct drm_i915_gem_userptr {
> >          * through the GTT. If the HW can't support readonly access, an=
 error is
> >          * returned.
> >          *
> > +        * I915_USERPTR_PROBE:
> > +        *
> > +        * Probe the provided @user_ptr range and validate that the @us=
er_ptr is
> > +        * indeed pointing to normal memory and that the range is also =
valid.
> > +        * For example if some garbage address is given to the kernel, =
then this
> > +        * should complain.
> > +        *
> > +        * Returns -EFAULT if the probe failed.
> > +        *
> > +        * Note that this doesn't populate the backing pages.
> > +        *
> > +        * The kernel supports this feature if I915_PARAM_HAS_USERPTR_P=
ROBE
> > +        * returns a non-zero value.
> > +        *
> >          * I915_USERPTR_UNSYNCHRONIZED:
> >          *
> >          * NOT USED. Setting this flag will result in an error.
> >          */
> >         __u32 flags;
> >  #define I915_USERPTR_READ_ONLY 0x1
> > +#define I915_USERPTR_PROBE 0x2
> >  #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
> >         /**
> >          * @handle: Returned handle for the object.
> > --
> > 2.26.3
> >
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
