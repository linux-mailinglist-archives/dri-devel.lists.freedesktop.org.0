Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CC0398600
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F0A6E40A;
	Wed,  2 Jun 2021 10:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4A16E40A;
 Wed,  2 Jun 2021 10:10:48 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id k2so986330qvc.5;
 Wed, 02 Jun 2021 03:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1EeC6MPPlwn+Fdq6pRYsXEn5DzooxUBZiMN9h6Fv3eI=;
 b=OQF9DcGdOW776/FDhgKQWJ0E6XbzJVxCkKnUsrkAW5OPfdNKOQ8tp8ho1PMYcvtGTy
 By7fTdC3NKPtAxkXVYdJnNuBPxwEbu50Jv7Euu34t+KiYxSud2X4UPklCEbu18fLmsuT
 AeiVPRkxm/kR0mtJ9r7QGeasbCiZrYvQSpDWCghXmUCg+C4WEMMVmSTXUk49s5hUPCKB
 3V6vLo2ZhiDAyCfWW4v+hLTkm8xgBwzYYtXr+rT46Wx3IOfT+RTX5ceUBkmn3KX4eMaA
 l0DtNY1LKIDk0Wrr+KM9wS4ELJjhNdhUUiONuFnIWaIP0Dhzw/z+pdlq/b2m23L2yAZ3
 Nk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1EeC6MPPlwn+Fdq6pRYsXEn5DzooxUBZiMN9h6Fv3eI=;
 b=d3tFYP/ZMRsPIFJYfxT6sDRqAB9lsIY8p2MPBa7/2EY6Iy+1nXowP80uZ4rKgkXOHz
 uCO7y5edY1dOXuNVStUtDxnHXpaW2O45Vi8iX9o+Hn540uec6VsEwg2nDNBIudwoNhw2
 ksP9dS6Lku9mGdvBMOG1EB8MamP4kfktK3QBLuNWoc3GgsR8d7jqKOlvFiSZv/P4Rm7M
 4K5r7CAFPI09dNXKzZYLBrLas7goDPzerHeTGB9i5tTpD5DMEc6DQM/Lygp42RzBX5ro
 PU+z4GiFBa7AqTiDooQVutPkAj0QhTRmHVt/VgsYNzZnUxBPzYZT273j+IrIcc2PqNf7
 4/ZA==
X-Gm-Message-State: AOAM531FccFEd6K0t2Buq1nzOphpfUO4daKfrjCKOj2anvKrM4VL9DQs
 7xcPoH6QWp8QqTzt62JJzjY+RTnw99wRXYUe+Xs=
X-Google-Smtp-Source: ABdhPJyhn/VboK3uDtT/ni+JAoOR9VhtGjwl/GyBVrFVQ2BGfFZNSR+IftrGv3DMWrCxIfozr/LRbTDOgmIEpiXYnjc=
X-Received: by 2002:a05:6214:2621:: with SMTP id
 gv1mr558036qvb.48.1622628647189; 
 Wed, 02 Jun 2021 03:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210527185145.458021-1-matthew.auld@intel.com>
 <CAM0jSHOOB7=SLC+cgmXn4pWets+BJzdk=R+7LVzE+Aje2_FW5Q@mail.gmail.com>
 <CAKMK7uE1yrh-_+shOR5EuLZQaQyckDHNA8uhgwAx6-pLQaHifA@mail.gmail.com>
In-Reply-To: <CAKMK7uE1yrh-_+shOR5EuLZQaQyckDHNA8uhgwAx6-pLQaHifA@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 2 Jun 2021 11:10:20 +0100
Message-ID: <CAM0jSHOy7R13m27pC+bZHr2S9wGQjT2CmWxVWfu8d58zM9=Gbw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] Revert "i915: use io_mapping_map_user"
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 Matthew Auld <matthew.auld@intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Jun 2021 at 09:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Wed, Jun 2, 2021 at 9:28 AM Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Thu, 27 May 2021 at 19:52, Matthew Auld <matthew.auld@intel.com> wrote:
> > >
> > > This reverts commit b739f125e4ebd73d10ed30a856574e13649119ed.
> > >
> > > We are unfortunately seeing more issues like we did in 293837b9ac8d
> > > ("Revert "i915: fix remap_io_sg to verify the pgprot""), except this is
> > > now for the vm_fault_gtt path, where we are now hitting the same
> > > BUG_ON(!pte_none(*pte)):
> > >
> > > [10887.466150] kernel BUG at mm/memory.c:2183!
> > > [10887.466162] invalid opcode: 0000 [#1] PREEMPT SMP PTI
> > > [10887.466168] CPU: 0 PID: 7775 Comm: ffmpeg Tainted: G     U            5.13.0-rc3-CI-Nightly #1
> > > [10887.466174] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./J4205-ITX, BIOS P1.40 07/14/2017
> > > [10887.466177] RIP: 0010:remap_pfn_range_notrack+0x30f/0x440
> > > [10887.466188] Code: e8 96 d7 e0 ff 84 c0 0f 84 27 01 00 00 48 ba 00 f0 ff ff ff ff 0f 00 4c 89 e0 48 c1 e0 0c 4d 85 ed 75 96 48 21 d0 31 f6 eb a9 <0f> 0b 48 39 37 0f 85 0e 01 00 00 48 8b 0c 24 48 39 4f 08 0f 85 00
> > > [10887.466193] RSP: 0018:ffffc90006e33c50 EFLAGS: 00010286
> > > [10887.466198] RAX: 800000000000002f RBX: 00007f5e01800000 RCX: 0000000000000028
> > > [10887.466201] RDX: 0000000000000001 RSI: ffffea0000000000 RDI: 0000000000000000
> > > [10887.466204] RBP: ffffea000033fea8 R08: 800000000000002f R09: ffff8881072256e0
> > > [10887.466207] R10: ffffc9000b84fff8 R11: 0000000017dab000 R12: 0000000000089f9f
> > > [10887.466210] R13: 800000000000002f R14: 00007f5e017e4000 R15: ffff88800cffaf20
> > > [10887.466213] FS:  00007f5e04849640(0000) GS:ffff888278000000(0000) knlGS:0000000000000000
> > > [10887.466216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [10887.466220] CR2: 00007fd9b191a2ac CR3: 00000001829ac000 CR4: 00000000003506f0
> > > [10887.466223] Call Trace:
> > > [10887.466233]  vm_fault_gtt+0x1ca/0x5d0 [i915]
> > > [10887.466381]  ? ktime_get+0x38/0x90
> > > [10887.466389]  __do_fault+0x37/0x90
> > > [10887.466395]  __handle_mm_fault+0xc46/0x1200
> > > [10887.466402]  handle_mm_fault+0xce/0x2a0
> > > [10887.466407]  do_user_addr_fault+0x1c5/0x660
> > >
> > > Reverting this commit is reported to fix the issue.
> > >
> > > Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
> > > References: https://gitlab.freedesktop.org/drm/intel/-/issues/3519
> > > Fixes: b739f125e4eb ("i915: use io_mapping_map_user")
> > > Cc: Christoph Hellwig <hch@lst.de>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >
> > Could someone give an ack for this? There are at least two separate
> > user reports for this issue.
>
> I was assuming Christoph would ack this, but fwiw:
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Pushed to gt-next. Thanks for the ack Daniel.

>
> Also adding Joonas to make sure this doesn't miss the -fixes pull
> request train. Also can't hurt to cc Linus since he reverted the other
> part of this already in -rc3.
> -Daniel
> >
> > > ---
> > >  drivers/gpu/drm/i915/Kconfig             |  1 -
> > >  drivers/gpu/drm/i915/gem/i915_gem_mman.c |  9 ++---
> > >  drivers/gpu/drm/i915/i915_drv.h          |  3 ++
> > >  drivers/gpu/drm/i915/i915_mm.c           | 44 ++++++++++++++++++++++++
> > >  4 files changed, 52 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> > > index 93f4d059fc89..1e1cb245fca7 100644
> > > --- a/drivers/gpu/drm/i915/Kconfig
> > > +++ b/drivers/gpu/drm/i915/Kconfig
> > > @@ -20,7 +20,6 @@ config DRM_I915
> > >         select INPUT if ACPI
> > >         select ACPI_VIDEO if ACPI
> > >         select ACPI_BUTTON if ACPI
> > > -       select IO_MAPPING
> > >         select SYNC_FILE
> > >         select IOSF_MBI
> > >         select CRC32
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > index f6fe5cb01438..8598a1c78a4c 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > @@ -367,10 +367,11 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
> > >                 goto err_unpin;
> > >
> > >         /* Finally, remap it using the new GTT offset */
> > > -       ret = io_mapping_map_user(&ggtt->iomap, area, area->vm_start +
> > > -                       (vma->ggtt_view.partial.offset << PAGE_SHIFT),
> > > -                       (ggtt->gmadr.start + vma->node.start) >> PAGE_SHIFT,
> > > -                       min_t(u64, vma->size, area->vm_end - area->vm_start));
> > > +       ret = remap_io_mapping(area,
> > > +                              area->vm_start + (vma->ggtt_view.partial.offset << PAGE_SHIFT),
> > > +                              (ggtt->gmadr.start + vma->node.start) >> PAGE_SHIFT,
> > > +                              min_t(u64, vma->size, area->vm_end - area->vm_start),
> > > +                              &ggtt->iomap);
> > >         if (ret)
> > >                 goto err_fence;
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > > index 0f6d27da69ac..e926f20c5b82 100644
> > > --- a/drivers/gpu/drm/i915/i915_drv.h
> > > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > > @@ -1941,6 +1941,9 @@ int i915_reg_read_ioctl(struct drm_device *dev, void *data,
> > >                         struct drm_file *file);
> > >
> > >  /* i915_mm.c */
> > > +int remap_io_mapping(struct vm_area_struct *vma,
> > > +                    unsigned long addr, unsigned long pfn, unsigned long size,
> > > +                    struct io_mapping *iomap);
> > >  int remap_io_sg(struct vm_area_struct *vma,
> > >                 unsigned long addr, unsigned long size,
> > >                 struct scatterlist *sgl, resource_size_t iobase);
> > > diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
> > > index 9a777b0ff59b..666808cb3a32 100644
> > > --- a/drivers/gpu/drm/i915/i915_mm.c
> > > +++ b/drivers/gpu/drm/i915/i915_mm.c
> > > @@ -37,6 +37,17 @@ struct remap_pfn {
> > >         resource_size_t iobase;
> > >  };
> > >
> > > +static int remap_pfn(pte_t *pte, unsigned long addr, void *data)
> > > +{
> > > +       struct remap_pfn *r = data;
> > > +
> > > +       /* Special PTE are not associated with any struct page */
> > > +       set_pte_at(r->mm, addr, pte, pte_mkspecial(pfn_pte(r->pfn, r->prot)));
> > > +       r->pfn++;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  #define use_dma(io) ((io) != -1)
> > >
> > >  static inline unsigned long sgt_pfn(const struct remap_pfn *r)
> > > @@ -66,7 +77,40 @@ static int remap_sg(pte_t *pte, unsigned long addr, void *data)
> > >         return 0;
> > >  }
> > >
> > > +/**
> > > + * remap_io_mapping - remap an IO mapping to userspace
> > > + * @vma: user vma to map to
> > > + * @addr: target user address to start at
> > > + * @pfn: physical address of kernel memory
> > > + * @size: size of map area
> > > + * @iomap: the source io_mapping
> > > + *
> > > + *  Note: this is only safe if the mm semaphore is held when called.
> > > + */
> > > +int remap_io_mapping(struct vm_area_struct *vma,
> > > +                    unsigned long addr, unsigned long pfn, unsigned long size,
> > > +                    struct io_mapping *iomap)
> > > +{
> > > +       struct remap_pfn r;
> > > +       int err;
> > > +
> > >  #define EXPECTED_FLAGS (VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP)
> > > +       GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
> > > +
> > > +       /* We rely on prevalidation of the io-mapping to skip track_pfn(). */
> > > +       r.mm = vma->vm_mm;
> > > +       r.pfn = pfn;
> > > +       r.prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
> > > +                         (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK));
> > > +
> > > +       err = apply_to_page_range(r.mm, addr, size, remap_pfn, &r);
> > > +       if (unlikely(err)) {
> > > +               zap_vma_ptes(vma, addr, (r.pfn - pfn) << PAGE_SHIFT);
> > > +               return err;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > >
> > >  /**
> > >   * remap_io_sg - remap an IO mapping to userspace
> > > --
> > > 2.26.3
> > >
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
