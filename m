Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93EAA9FA13
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536B010E6FF;
	Mon, 28 Apr 2025 20:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="r1HU/lhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA77E10E6FF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 20:01:10 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-47e9fea29easo9161cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745870470; x=1746475270;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJybhQX+mtsA+JCLNM6FgFt4VcVPgczSDExJzTxfhFQ=;
 b=r1HU/lhZxUszh/EwAfJGiZYklE1vLAN9K4vipWYytc0UL62ixT4mOWv779tIwuGCHn
 f4iDkTB5R+WVN9iRBAmpnsM0NjqI4axs4hngJS9Hp9cqDmWtcMh2cu4EIcWA6alKOqGc
 wC5ylCX4HB72etSOoRNm4R2j0TZ/wLB9tLH5R0WirB5bY4nGVh3IFrs8ALcQztT6gYJb
 ost4goPdNtJBGkXZ7pB3Ki47uhtLHtrrecz17pkZFTZvLnQMmuNX4GGt8BVteSjtGQEK
 zsRI6JoVRNcwf4cjO4k+SZ1bnuIhcGXI14LK+oT32Yuf1uls4qhW+Tm1FDfwSYoXjFpL
 kXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745870470; x=1746475270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VJybhQX+mtsA+JCLNM6FgFt4VcVPgczSDExJzTxfhFQ=;
 b=XiCN1qJeZgwrgg5mYfH0LE3NYXij9K+C0XTGeDA8bdsj5b3tq+9vevDV+/e5HoMtLQ
 DEC9Vg9+tZIGc+fXIakqTYSKrmyFfopO9/L/Ku2FE3XCiBFidfa0wooDw9dEuM/l3lR+
 2JE/UUzmMXfNe75g05xW8QUq+AuhsmN9pzc8jRqXdGeu82+i8MBLWnT9MvjaIuT16IvB
 ssanzyDoeRW663SgwnCKIBPTPC3gERWWBE+CMfMHhsG3TKVZC4a8rN2UatvaB6UipIla
 QX9IYxTQEMMl5yGCnLFM9WkCPfC4wHdsIO+bYDKjSd2hZ+DHKNMLiNsF7/orPBsZ9eXP
 3CBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzuZv6M34ilmF8VLN2tXySyPs29CjFnzseIXrGD9fr/89FlTnudBHEHjMmxzU+j3Gn306RiZA9VNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnYZCtcJZPbZfOQ/3ivgtzR1Q9Ae1wD309FFYQbapdG9sUlXR5
 pCXXDM2/4ei8Rd8c5bAQE4hgcO8NYtxxMENl7e/Fxkn5zlyaOMA7KUGmcqpkyNVJjiubP6zAybW
 R5kKXJFMCvRPDAlS/f0iwhNtR75AWZXzX7cxp
X-Gm-Gg: ASbGncvGPnUgb/oFE9Sp5exN2LhvHwwPsim1rxMwAQqa/VP1Sl2HHwhw9VpEIwM/lkr
 7kf7zDanlv8cDNFTcYndoSDg6p8w1rvNCUFWk6vJkmJ2s1TwFpWFxO6GAXS4fx7IeIkNa9F28Z4
 w56BNdZ7+/ABCea44ehCJs
X-Google-Smtp-Source: AGHT+IGGX805tNN1FfFiEFOchaakv5NY8Ys+vkzyi3lPHWYF87xZoteOkyrR931CQ/lcrijlBEjyDE79ZFOslGdLmbQ=
X-Received: by 2002:a05:622a:54e:b0:47b:840:7f5b with SMTP id
 d75a77b69052e-48866bc4b7cmr724121cf.29.1745870469322; Mon, 28 Apr 2025
 13:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
 <8131940c-8b22-4856-947b-62ca64e2f417@lucifer.local>
In-Reply-To: <8131940c-8b22-4856-947b-62ca64e2f417@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 28 Apr 2025 13:00:58 -0700
X-Gm-Features: ATxdqUHOhJ-hIQqSTjS_MDyVVtLFB6JwqHLrl6lHfgnOs5bz7Sa9PO5BAiYKY_U
Message-ID: <CAJuCfpFTgXu+RtbzAis4C0kV=hjFQH39BZrKJsQbjnZRMR2tbw@mail.gmail.com>
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to pfnmap_track()
 + pfnmap_untrack()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 28, 2025 at 12:47=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> +cc Suren, who has worked HEAVILY on VMA field manipulation and such :)
>
> Suren - David is proposing adding a new field. AFAICT this does not add a
> new cache line so I think we're all good.
>
> But FYI!

Thanks! Yes, there should be some space in the last cacheline after my
last field reshuffling.

>
> On Fri, Apr 25, 2025 at 10:17:09AM +0200, David Hildenbrand wrote:
> > Let's use our new interface. In remap_pfn_range(), we'll now decide
> > whether we have to track (full VMA covered) or only sanitize the pgprot
> > (partial VMA covered).
> >
> > Remember what we have to untrack by linking it from the VMA. When
> > duplicating VMAs (e.g., splitting, mremap, fork), we'll handle it simil=
ar
> > to anon VMA names, and use a kref to share the tracking.
> >
> > Once the last VMA un-refs our tracking data, we'll do the untracking,
> > which simplifies things a lot and should sort our various issues we saw
> > recently, for example, when partially unmapping/zapping a tracked VMA.
> >
> > This change implies that we'll keep tracking the original PFN range eve=
n
> > after splitting + partially unmapping it: not too bad, because it was
> > not working reliably before. The only thing that kind-of worked before
> > was shrinking such a mapping using mremap(): we managed to adjust the
> > reservation in a hacky way, now we won't adjust the reservation but
> > leave it around until all involved VMAs are gone.
> >
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  include/linux/mm_inline.h |  2 +
> >  include/linux/mm_types.h  | 11 ++++++
> >  kernel/fork.c             | 54 ++++++++++++++++++++++++--
> >  mm/memory.c               | 81 +++++++++++++++++++++++++++++++--------
> >  mm/mremap.c               |  4 --
> >  5 files changed, 128 insertions(+), 24 deletions(-)
> >
> > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > index f9157a0c42a5c..89b518ff097e6 100644
> > --- a/include/linux/mm_inline.h
> > +++ b/include/linux/mm_inline.h
> > @@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma=
_name *anon_name1,
> >
> >  #endif  /* CONFIG_ANON_VMA_NAME */
> >
> > +void pfnmap_track_ctx_release(struct kref *ref);
> > +
> >  static inline void init_tlb_flush_pending(struct mm_struct *mm)
> >  {
> >       atomic_set(&mm->tlb_flush_pending, 0);
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 56d07edd01f91..91124761cfda8 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -764,6 +764,14 @@ struct vma_numab_state {
> >       int prev_scan_seq;
> >  };
> >
> > +#ifdef __HAVE_PFNMAP_TRACKING
> > +struct pfnmap_track_ctx {
> > +     struct kref kref;
> > +     unsigned long pfn;
> > +     unsigned long size;
> > +};
> > +#endif
> > +
> >  /*
> >   * This struct describes a virtual memory area. There is one of these
> >   * per VM-area/task. A VM area is any part of the process virtual memo=
ry
> > @@ -877,6 +885,9 @@ struct vm_area_struct {
> >       struct anon_vma_name *anon_name;
> >  #endif
> >       struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> > +#ifdef __HAVE_PFNMAP_TRACKING
> > +     struct pfnmap_track_ctx *pfnmap_track_ctx;
> > +#endif
> >  } __randomize_layout;
> >
> >  #ifdef CONFIG_NUMA
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 168681fc4b25a..ae518b8fe752c 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -481,7 +481,51 @@ static void vm_area_init_from(const struct vm_area=
_struct *src,
> >  #ifdef CONFIG_NUMA
> >       dest->vm_policy =3D src->vm_policy;
> >  #endif
> > +#ifdef __HAVE_PFNMAP_TRACKING
> > +     dest->pfnmap_track_ctx =3D NULL;
> > +#endif
> > +}
> > +
> > +#ifdef __HAVE_PFNMAP_TRACKING
> > +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig=
,
> > +             struct vm_area_struct *new)
> > +{
> > +     struct pfnmap_track_ctx *ctx =3D orig->pfnmap_track_ctx;
> > +
> > +     if (likely(!ctx))
> > +             return 0;
> > +
> > +     /*
> > +      * We don't expect to ever hit this. If ever required, we would h=
ave
> > +      * to duplicate the tracking.
> > +      */
> > +     if (unlikely(kref_read(&ctx->kref) >=3D REFCOUNT_MAX))
> > +             return -ENOMEM;
> > +     kref_get(&ctx->kref);
> > +     new->pfnmap_track_ctx =3D ctx;
> > +     return 0;
> > +}
> > +
> > +static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct =
*vma)
> > +{
> > +     struct pfnmap_track_ctx *ctx =3D vma->pfnmap_track_ctx;
> > +
> > +     if (likely(!ctx))
> > +             return;
> > +
> > +     kref_put(&ctx->kref, pfnmap_track_ctx_release);
> > +     vma->pfnmap_track_ctx =3D NULL;
> > +}
> > +#else
> > +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig=
,
> > +             struct vm_area_struct *new)
> > +{
> > +     return 0;
> >  }
> > +static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct =
*vma)
> > +{
> > +}
> > +#endif
> >
> >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> >  {
> > @@ -493,6 +537,11 @@ struct vm_area_struct *vm_area_dup(struct vm_area_=
struct *orig)
> >       ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
> >       ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
> >       vm_area_init_from(orig, new);
> > +
> > +     if (vma_pfnmap_track_ctx_dup(orig, new)) {
> > +             kmem_cache_free(vm_area_cachep, new);
> > +             return NULL;
> > +     }
> >       vma_lock_init(new, true);
> >       INIT_LIST_HEAD(&new->anon_vma_chain);
> >       vma_numab_state_init(new);
> > @@ -507,6 +556,7 @@ void vm_area_free(struct vm_area_struct *vma)
> >       vma_assert_detached(vma);
> >       vma_numab_state_free(vma);
> >       free_anon_vma_name(vma);
> > +     vma_pfnmap_track_ctx_release(vma);
> >       kmem_cache_free(vm_area_cachep, vma);
> >  }
> >
> > @@ -669,10 +719,6 @@ static __latent_entropy int dup_mmap(struct mm_str=
uct *mm,
> >               if (!tmp)
> >                       goto fail_nomem;
> >
> > -             /* track_pfn_copy() will later take care of copying inter=
nal state. */
> > -             if (unlikely(tmp->vm_flags & VM_PFNMAP))
> > -                     untrack_pfn_clear(tmp);
> > -
> >               retval =3D vma_dup_policy(mpnt, tmp);
> >               if (retval)
> >                       goto fail_nomem_policy;
> > diff --git a/mm/memory.c b/mm/memory.c
> > index c737a8625866a..eb2b3f10a97ec 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -1370,7 +1370,7 @@ copy_page_range(struct vm_area_struct *dst_vma, s=
truct vm_area_struct *src_vma)
> >       struct mm_struct *dst_mm =3D dst_vma->vm_mm;
> >       struct mm_struct *src_mm =3D src_vma->vm_mm;
> >       struct mmu_notifier_range range;
> > -     unsigned long next, pfn =3D 0;
> > +     unsigned long next;
> >       bool is_cow;
> >       int ret;
> >
> > @@ -1380,12 +1380,6 @@ copy_page_range(struct vm_area_struct *dst_vma, =
struct vm_area_struct *src_vma)
> >       if (is_vm_hugetlb_page(src_vma))
> >               return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, s=
rc_vma);
> >
> > -     if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
> > -             ret =3D track_pfn_copy(dst_vma, src_vma, &pfn);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > -
> >       /*
> >        * We need to invalidate the secondary MMU mappings only when
> >        * there could be a permission downgrade on the ptes of the
> > @@ -1427,8 +1421,6 @@ copy_page_range(struct vm_area_struct *dst_vma, s=
truct vm_area_struct *src_vma)
> >               raw_write_seqcount_end(&src_mm->write_protect_seq);
> >               mmu_notifier_invalidate_range_end(&range);
> >       }
> > -     if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
> > -             untrack_pfn_copy(dst_vma, pfn);
> >       return ret;
> >  }
> >
> > @@ -1923,9 +1915,6 @@ static void unmap_single_vma(struct mmu_gather *t=
lb,
> >       if (vma->vm_file)
> >               uprobe_munmap(vma, start, end);
> >
> > -     if (unlikely(vma->vm_flags & VM_PFNMAP))
> > -             untrack_pfn(vma, 0, 0, mm_wr_locked);
> > -
> >       if (start !=3D end) {
> >               if (unlikely(is_vm_hugetlb_page(vma))) {
> >                       /*
> > @@ -2871,6 +2860,36 @@ int remap_pfn_range_notrack(struct vm_area_struc=
t *vma, unsigned long addr,
> >       return error;
> >  }
> >
> > +#ifdef __HAVE_PFNMAP_TRACKING
> > +static inline struct pfnmap_track_ctx *pfnmap_track_ctx_alloc(unsigned=
 long pfn,
> > +             unsigned long size, pgprot_t *prot)
> > +{
> > +     struct pfnmap_track_ctx *ctx;
> > +
> > +     if (pfnmap_track(pfn, size, prot))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     ctx =3D kmalloc(sizeof(*ctx), GFP_KERNEL);
> > +     if (unlikely(!ctx)) {
> > +             pfnmap_untrack(pfn, size);
> > +             return ERR_PTR(-ENOMEM);
> > +     }
> > +
> > +     ctx->pfn =3D pfn;
> > +     ctx->size =3D size;
> > +     kref_init(&ctx->kref);
> > +     return ctx;
> > +}
> > +
> > +void pfnmap_track_ctx_release(struct kref *ref)
> > +{
> > +     struct pfnmap_track_ctx *ctx =3D container_of(ref, struct pfnmap_=
track_ctx, kref);
> > +
> > +     pfnmap_untrack(ctx->pfn, ctx->size);
> > +     kfree(ctx);
> > +}
> > +#endif /* __HAVE_PFNMAP_TRACKING */
> > +
> >  /**
> >   * remap_pfn_range - remap kernel memory to userspace
> >   * @vma: user vma to map to
> > @@ -2883,20 +2902,50 @@ int remap_pfn_range_notrack(struct vm_area_stru=
ct *vma, unsigned long addr,
> >   *
> >   * Return: %0 on success, negative error code otherwise.
> >   */
> > +#ifdef __HAVE_PFNMAP_TRACKING
> >  int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
> >                   unsigned long pfn, unsigned long size, pgprot_t prot)
> >  {
> > +     struct pfnmap_track_ctx *ctx =3D NULL;
> >       int err;
> >
> > -     err =3D track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
> > -     if (err)
> > +     size =3D PAGE_ALIGN(size);
> > +
> > +     /*
> > +      * If we cover the full VMA, we'll perform actual tracking, and
> > +      * remember to untrack when the last reference to our tracking
> > +      * context from a VMA goes away.
> > +      *
> > +      * If we only cover parts of the VMA, we'll only sanitize the
> > +      * pgprot.
> > +      */
> > +     if (addr =3D=3D vma->vm_start && addr + size =3D=3D vma->vm_end) =
{
> > +             if (vma->pfnmap_track_ctx)
> > +                     return -EINVAL;
> > +             ctx =3D pfnmap_track_ctx_alloc(pfn, size, &prot);
> > +             if (IS_ERR(ctx))
> > +                     return PTR_ERR(ctx);
> > +     } else if (pfnmap_sanitize_pgprot(pfn, size, &prot)) {
> >               return -EINVAL;
> > +     }
> >
> >       err =3D remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> > -     if (err)
> > -             untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
> > +     if (ctx) {
> > +             if (err)
> > +                     kref_put(&ctx->kref, pfnmap_track_ctx_release);
> > +             else
> > +                     vma->pfnmap_track_ctx =3D ctx;
> > +     }
> >       return err;
> >  }
> > +
> > +#else
> > +int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
> > +                 unsigned long pfn, unsigned long size, pgprot_t prot)
> > +{
> > +     return remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> > +}
> > +#endif
> >  EXPORT_SYMBOL(remap_pfn_range);
> >
> >  /**
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index 7db9da609c84f..6e78e02f74bd3 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -1191,10 +1191,6 @@ static int copy_vma_and_data(struct vma_remap_st=
ruct *vrm,
> >       if (is_vm_hugetlb_page(vma))
> >               clear_vma_resv_huge_pages(vma);
> >
> > -     /* Tell pfnmap has moved from this vma */
> > -     if (unlikely(vma->vm_flags & VM_PFNMAP))
> > -             untrack_pfn_clear(vma);
> > -
> >       *new_vma_ptr =3D new_vma;
> >       return err;
> >  }
> > --
> > 2.49.0
> >
