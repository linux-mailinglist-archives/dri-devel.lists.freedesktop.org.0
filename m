Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0E53D54D9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 10:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673846E808;
	Mon, 26 Jul 2021 08:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138886E808;
 Mon, 26 Jul 2021 08:04:08 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id b1so6508732qtx.0;
 Mon, 26 Jul 2021 01:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6aHbaAbam3ch3C4m9VzYrrsVc21LuXB/xhePURQXsPg=;
 b=G4YbMRJn/z89oj2oj6SRVDCTgy7tMzQdLo9OllbW4gQh/b1d2y0Auvgx3NyWQazHjE
 6PyuoP8TZILuShmkRm247YpjM90wuHr/Hy+uhcwwHkmTLMNo1vP2FiUWKmRSH51yR4dr
 NnL0m9cP517QwipxknsZuUyGXsqORY2nRsh0RsgNTQlRZfMno8LK0bER0RMFWn63lPly
 ujL3GHxLyiRcTLsjQxViqYyPRV8mJxxhmRs+rDV4m49dhnGnt54WJcP69JW95uzSFY2m
 EQaZNYiCi0/kKHtZjNwfFzYN8NWirS0o4HLFTFBWmx8o7AgYAVVPG6aQpndoUVeWb4cE
 EvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6aHbaAbam3ch3C4m9VzYrrsVc21LuXB/xhePURQXsPg=;
 b=foMa6st7+jx7lHBIvWHI1ee6jpMKFTzKA+gqU/gkhtnSkVXLidYNxIUHSTnSjCtUTW
 eWL+Im4CbN11qvhg7hw2ZHsNfLC0EALq0+eZrpBSSaQaVjV8HmUGmtwQHTJMZbtoZorw
 gBesW1rYfigKqejoy19nCaoPjzN8GhKF44NzPP/zhjTMspnr4dPqUMmZZFjIV1mk4NcH
 6hyKtslpWbtQepJ6L2eyzqbUSFOkWD0aBLirh54Rnzsbe9xUYLf8KLYmeUxm6HXGvL+l
 pGdeWf0ujrtCjTgyYxTzRoGAV/293zvsSwlF7Ewi7OU37nk9A/lrI+7hAMSW/7X9ESix
 +ZHg==
X-Gm-Message-State: AOAM531r/Lp/RY0DjOTXQHmQuePKOBcD5P9a1Q8vtcwpfOMahBciP5R8
 Fpmh+e4iXrIrXWkfb+ko9OptSCk/+AkHFXXB0hU=
X-Google-Smtp-Source: ABdhPJwQEi7estwtb6uqjvApBMKsJNCjjORg6JmVGlWx0kEA4/A5eEEYfp5+ssFug3HUPRzHLJQ2epafSq37vCHjvd8=
X-Received: by 2002:ac8:584c:: with SMTP id h12mr14287148qth.95.1627286647088; 
 Mon, 26 Jul 2021 01:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210723113405.427004-1-matthew.auld@intel.com>
 <CAOFGe95TGvvQ5JYQgA1P=Kn3JXb+i+fteOU4L31SMTt4OcDR6g@mail.gmail.com>
 <CAOFGe96fH8N9w2NqRXcFTxLDYeVWHSCtGit6tvOcyM9jYR3g_w@mail.gmail.com>
In-Reply-To: <CAOFGe96fH8N9w2NqRXcFTxLDYeVWHSCtGit6tvOcyM9jYR3g_w@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 26 Jul 2021 09:03:41 +0100
Message-ID: <CAM0jSHOw5wurHh=i284OCrsH0o3FU50X6popvB=OcvE_G0bqqQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/userptr: Probe existence of backing
 struct pages upon creation
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

On Fri, 23 Jul 2021 at 18:49, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Are there IGTs for this anywhere?

https://patchwork.freedesktop.org/series/92580/

>
> On Fri, Jul 23, 2021 at 12:47 PM Jason Ekstrand <jason@jlekstrand.net> wr=
ote:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12044
> >
> > On Fri, Jul 23, 2021 at 6:35 AM Matthew Auld <matthew.auld@intel.com> w=
rote:
> > >
> > > From: Chris Wilson <chris@chris-wilson.co.uk>
> > >
> > > Jason Ekstrand requested a more efficient method than userptr+set-dom=
ain
> > > to determine if the userptr object was backed by a complete set of pa=
ges
> > > upon creation. To be more efficient than simply populating the userpt=
r
> > > using get_user_pages() (as done by the call to set-domain or execbuf)=
,
> > > we can walk the tree of vm_area_struct and check for gaps or vma not
> > > backed by struct page (VM_PFNMAP). The question is how to handle
> > > VM_MIXEDMAP which may be either struct page or pfn backed...
> > >
> > > With discrete we are going to drop support for set_domain(), so offer=
ing
> > > a way to probe the pages, without having to resort to dummy batches h=
as
> > > been requested.
> > >
> > > v2:
> > > - add new query param for the PROBE flag, so userspace can easily
> > >   check if the kernel supports it(Jason).
> > > - use mmap_read_{lock, unlock}.
> > > - add some kernel-doc.
> > > v3:
> > > - In the docs also mention that PROBE doesn't guarantee that the page=
s
> > >   will remain valid by the time they are actually used(Tvrtko).
> > > - Add a small comment for the hole finding logic(Jason).
> > > - Move the param next to all the other params which just return true.
> > >
> > > Testcase: igt/gem_userptr_blits/probe
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Ramalingam C <ramalingam.c@intel.com>
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Acked-by: Kenneth Graunke <kenneth@whitecape.org>
> > > Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 41 +++++++++++++++++++=
+-
> > >  drivers/gpu/drm/i915/i915_getparam.c        |  1 +
> > >  include/uapi/drm/i915_drm.h                 | 20 ++++++++++
> > >  3 files changed, 61 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gp=
u/drm/i915/gem/i915_gem_userptr.c
> > > index 56edfeff8c02..468a7a617fbf 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > > @@ -422,6 +422,34 @@ static const struct drm_i915_gem_object_ops i915=
_gem_userptr_ops =3D {
> > >
> > >  #endif
> > >
> > > +static int
> > > +probe_range(struct mm_struct *mm, unsigned long addr, unsigned long =
len)
> > > +{
> > > +       const unsigned long end =3D addr + len;
> > > +       struct vm_area_struct *vma;
> > > +       int ret =3D -EFAULT;
> > > +
> > > +       mmap_read_lock(mm);
> > > +       for (vma =3D find_vma(mm, addr); vma; vma =3D vma->vm_next) {
> > > +               /* Check for holes, note that we also update the addr=
 below */
> > > +               if (vma->vm_start > addr)
> > > +                       break;
> > > +
> > > +               if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
> > > +                       break;
> > > +
> > > +               if (vma->vm_end >=3D end) {
> > > +                       ret =3D 0;
> > > +                       break;
> > > +               }
> > > +
> > > +               addr =3D vma->vm_end;
> > > +       }
> > > +       mmap_read_unlock(mm);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > >  /*
> > >   * Creates a new mm object that wraps some normal memory from the pr=
ocess
> > >   * context - user memory.
> > > @@ -477,7 +505,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> > >         }
> > >
> > >         if (args->flags & ~(I915_USERPTR_READ_ONLY |
> > > -                           I915_USERPTR_UNSYNCHRONIZED))
> > > +                           I915_USERPTR_UNSYNCHRONIZED |
> > > +                           I915_USERPTR_PROBE))
> > >                 return -EINVAL;
> > >
> > >         if (i915_gem_object_size_2big(args->user_size))
> > > @@ -504,6 +533,16 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> > >                         return -ENODEV;
> > >         }
> > >
> > > +       if (args->flags & I915_USERPTR_PROBE) {
> > > +               /*
> > > +                * Check that the range pointed to represents real st=
ruct
> > > +                * pages and not iomappings (at this moment in time!)
> > > +                */
> > > +               ret =3D probe_range(current->mm, args->user_ptr, args=
->user_size);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +
> > >  #ifdef CONFIG_MMU_NOTIFIER
> > >         obj =3D i915_gem_object_alloc();
> > >         if (obj =3D=3D NULL)
> > > diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i=
915/i915_getparam.c
> > > index 24e18219eb50..bbb7cac43eb4 100644
> > > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > > @@ -134,6 +134,7 @@ int i915_getparam_ioctl(struct drm_device *dev, v=
oid *data,
> > >         case I915_PARAM_HAS_EXEC_FENCE_ARRAY:
> > >         case I915_PARAM_HAS_EXEC_SUBMIT_FENCE:
> > >         case I915_PARAM_HAS_EXEC_TIMELINE_FENCES:
> > > +       case I915_PARAM_HAS_USERPTR_PROBE:
> > >                 /* For the time being all of these are always true;
> > >                  * if some supported hardware does not have one of th=
ese
> > >                  * features this value needs to be provided from
> > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.=
h
> > > index 975087553ea0..0d290535a6e5 100644
> > > --- a/include/uapi/drm/i915_drm.h
> > > +++ b/include/uapi/drm/i915_drm.h
> > > @@ -674,6 +674,9 @@ typedef struct drm_i915_irq_wait {
> > >   */
> > >  #define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
> > >
> > > +/* Query if the kernel supports the I915_USERPTR_PROBE flag. */
> > > +#define I915_PARAM_HAS_USERPTR_PROBE 56
> > > +
> > >  /* Must be kept compact -- no holes and well documented */
> > >
> > >  typedef struct drm_i915_getparam {
> > > @@ -2222,12 +2225,29 @@ struct drm_i915_gem_userptr {
> > >          * through the GTT. If the HW can't support readonly access, =
an error is
> > >          * returned.
> > >          *
> > > +        * I915_USERPTR_PROBE:
> > > +        *
> > > +        * Probe the provided @user_ptr range and validate that the @=
user_ptr is
> > > +        * indeed pointing to normal memory and that the range is als=
o valid.
> > > +        * For example if some garbage address is given to the kernel=
, then this
> > > +        * should complain.
> > > +        *
> > > +        * Returns -EFAULT if the probe failed.
> > > +        *
> > > +        * Note that this doesn't populate the backing pages, and als=
o doesn't
> > > +        * guarantee that the object will remain valid when the objec=
t is
> > > +        * eventually used.
> > > +        *
> > > +        * The kernel supports this feature if I915_PARAM_HAS_USERPTR=
_PROBE
> > > +        * returns a non-zero value.
> > > +        *
> > >          * I915_USERPTR_UNSYNCHRONIZED:
> > >          *
> > >          * NOT USED. Setting this flag will result in an error.
> > >          */
> > >         __u32 flags;
> > >  #define I915_USERPTR_READ_ONLY 0x1
> > > +#define I915_USERPTR_PROBE 0x2
> > >  #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
> > >         /**
> > >          * @handle: Returned handle for the object.
> > > --
> > > 2.26.3
> > >
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
