Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D8A3B2148
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 21:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CAC6E988;
	Wed, 23 Jun 2021 19:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBD96E982;
 Wed, 23 Jun 2021 19:35:58 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id bl4so8163662qkb.8;
 Wed, 23 Jun 2021 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kPTKG3mraYkTj4JFPwlLTiaB7fWUVV2BOx0ANgWE+xk=;
 b=MvYTJvO04jMVECZuDOl2vtvKkAKbRoNq6vDZrVQPwLsn28UqzxS/FVN+NHJX5PgwWo
 9KZ3+lSHqQ3bapmrrZueussdPwYJqYxZQ+y/OWVk0+U0KWBLjKZc60fEdB0EHZR9GTjK
 BR511wwUPxtSmoMcdNyIa1+yTyZYEM+lw94pEpCEec/p/d5BZ48jz8Arf6lYCeyn0+2f
 +WWB6geqKyU6TS8jeXwGh9iPXUJ6t2gXqjYQ/sNtcqse+Spq4xGq0cVvDB1Z2azkWTTj
 seXOagQF+bYZr2cFM1IweGQGtgzvIGvR2FZ49pTSPo9uTYDjTtTFQOhUV54mkilZEgjC
 tc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kPTKG3mraYkTj4JFPwlLTiaB7fWUVV2BOx0ANgWE+xk=;
 b=jfq2SJBVbuQO3UuieL1d1c4y7l4hS45vECAUgcmbNiThFbv/k4hhUvYLMKV+LulXS1
 rOtlBT5eXmtzHmHSNv8nHGminwNIg8NANnqiVop9EOncBiGsbE6K6GjqF1CKCTO7VWT0
 0k78mvNI/JyXKg3OBbrWoC6SN3aDqP9NxVqi1UGGxxF0FsrluYM49iOOXJjSgKPOY98c
 FFe+FQlWNEKfzAz9zKI89FhH6ad/Q5aMsJZ4xEfx/2/6NA8edgYjHR3up1JxoYiDn8ie
 CMNbsPLOlSmCRyOlCvh7zkqyhm3D+gphYTWAIXM1DALjDoQ5tEOB5aA8Au/We7+KAU9d
 zSrg==
X-Gm-Message-State: AOAM531I+cnQm2/aRu/gxaDW8R/6GwtcPkJ4QFAHK9JWcNyCWVjYE2Md
 5LVtAIPerwr7eze1NvH3rtqmX30/gw/yfvkCFFU=
X-Google-Smtp-Source: ABdhPJzTWhrnFIgcol+9a8y9CLv7LMv5UumdRPT+SBeFUeyQVsHpL1dTHInu4RfFXxvZQYXHZKShCL4jlSh4SMxAjko=
X-Received: by 2002:ae9:dcc3:: with SMTP id q186mr1710971qkf.426.1624476957269; 
 Wed, 23 Jun 2021 12:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210623172706.315165-1-matthew.auld@intel.com>
 <YNOISja0iGhcdomF@phenom.ffwll.local>
In-Reply-To: <YNOISja0iGhcdomF@phenom.ffwll.local>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 23 Jun 2021 20:35:30 +0100
Message-ID: <CAM0jSHNRP5kvKSBqM3ALJSP3JH8EKWvSo289yRW9xfqd=t3-UQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: add back the avail tracking
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Jun 2021 at 20:15, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 23, 2021 at 06:27:06PM +0100, Matthew Auld wrote:
> > Looks like it got lost along the way, so add it back. This is needed fo=
r
> > the region query uAPI where we want to report a snapshot of how much
> > lmem is available.
> >
> > This time around let's push it directly into the allocator, which
> > simplifies things, like not having to care about internal fragmentation=
,
> > or having to remember to track things for all possible interfaces that
> > might want to allocate or reserve pages.
> >
> > v2(Thomas): add some more kernel doc
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>
> Since this is uapi, do umds use this? Or just igt?
>
> Please record both the umd user for this and the igts that verifies this
> is not nonsense to the commit message. We need to be much better with
> keeping records for our uapi additions, there's been some really badly
> justified uapi in the past that turned out to be for testcases only.

For the userspace justification, I pinged you and Jason about that in
the previous thread, since it's not completely clear if real userspace
even cares about this. I can maybe just limit it to debugfs?

> -Daniel
>
> > ---
> >  drivers/gpu/drm/i915/i915_buddy.c             |  6 ++++++
> >  drivers/gpu/drm/i915/i915_buddy.h             |  1 +
> >  drivers/gpu/drm/i915/i915_debugfs.c           |  5 +++--
> >  drivers/gpu/drm/i915/i915_query.c             |  2 +-
> >  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 13 +++++++++++++
> >  drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  2 ++
> >  drivers/gpu/drm/i915/intel_memory_region.c    | 15 +++++++++++++++
> >  drivers/gpu/drm/i915/intel_memory_region.h    |  4 ++++
> >  8 files changed, 45 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i=
915_buddy.c
> > index 29dd7d0310c1..27cd2487a18f 100644
> > --- a/drivers/gpu/drm/i915/i915_buddy.c
> > +++ b/drivers/gpu/drm/i915/i915_buddy.c
> > @@ -80,6 +80,7 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 siz=
e, u64 chunk_size)
> >       size =3D round_down(size, chunk_size);
> >
> >       mm->size =3D size;
> > +     mm->avail =3D size;
> >       mm->chunk_size =3D chunk_size;
> >       mm->max_order =3D ilog2(size) - ilog2(chunk_size);
> >
> > @@ -159,6 +160,8 @@ void i915_buddy_fini(struct i915_buddy_mm *mm)
> >               i915_block_free(mm, mm->roots[i]);
> >       }
> >
> > +     GEM_WARN_ON(mm->avail !=3D mm->size);
> > +
> >       kfree(mm->roots);
> >       kfree(mm->free_list);
> >       kmem_cache_destroy(mm->slab_blocks);
> > @@ -235,6 +238,7 @@ void i915_buddy_free(struct i915_buddy_mm *mm,
> >                    struct i915_buddy_block *block)
> >  {
> >       GEM_BUG_ON(!i915_buddy_block_is_allocated(block));
> > +     mm->avail +=3D i915_buddy_block_size(mm, block);
> >       __i915_buddy_free(mm, block);
> >  }
> >
> > @@ -288,6 +292,7 @@ i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned=
 int order)
> >       }
> >
> >       mark_allocated(block);
> > +     mm->avail -=3D i915_buddy_block_size(mm, block);
> >       kmemleak_update_trace(block);
> >       return block;
> >
> > @@ -373,6 +378,7 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm=
,
> >                       }
> >
> >                       mark_allocated(block);
> > +                     mm->avail -=3D i915_buddy_block_size(mm, block);
> >                       list_add_tail(&block->link, &allocated);
> >                       continue;
> >               }
> > diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i=
915_buddy.h
> > index 37f8c42071d1..feb7c1bb6244 100644
> > --- a/drivers/gpu/drm/i915/i915_buddy.h
> > +++ b/drivers/gpu/drm/i915/i915_buddy.h
> > @@ -70,6 +70,7 @@ struct i915_buddy_mm {
> >       /* Must be at least PAGE_SIZE */
> >       u64 chunk_size;
> >       u64 size;
> > +     u64 avail;
> >  };
> >
> >  static inline u64
> > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915=
/i915_debugfs.c
> > index cc745751ac53..4765f220469e 100644
> > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > @@ -246,8 +246,9 @@ static int i915_gem_object_info(struct seq_file *m,=
 void *data)
> >                  atomic_read(&i915->mm.free_count),
> >                  i915->mm.shrink_memory);
> >       for_each_memory_region(mr, i915, id)
> > -             seq_printf(m, "%s: total:%pa, available:%pa bytes\n",
> > -                        mr->name, &mr->total, &mr->avail);
> > +             seq_printf(m, "%s: total:%pa, available:%llu bytes\n",
> > +                        mr->name, &mr->total,
> > +                        intel_memory_region_get_avail(mr));
> >
> >       return 0;
> >  }
> > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i=
915_query.c
> > index e49da36c62fb..f10dcea94ac9 100644
> > --- a/drivers/gpu/drm/i915/i915_query.c
> > +++ b/drivers/gpu/drm/i915/i915_query.c
> > @@ -465,7 +465,7 @@ static int query_memregion_info(struct drm_i915_pri=
vate *i915,
> >               info.region.memory_class =3D mr->type;
> >               info.region.memory_instance =3D mr->instance;
> >               info.probed_size =3D mr->total;
> > -             info.unallocated_size =3D mr->avail;
> > +             info.unallocated_size =3D intel_memory_region_get_avail(m=
r);
> >
> >               if (__copy_to_user(info_ptr, &info, sizeof(info)))
> >                       return -EFAULT;
> > diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gp=
u/drm/i915/i915_ttm_buddy_manager.c
> > index fc7ad5c035b8..562d11edc5e4 100644
> > --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> > +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> > @@ -246,3 +246,16 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource=
_manager *man,
> >       return ret;
> >  }
> >
> > +/**
> > + * i915_ttm_buddy_man_avail - Get the currently available size
> > + * @man: The buddy allocator ttm manager
> > + *
> > + * Return: The available size in bytes
> > + */
> > +u64 i915_ttm_buddy_man_get_avail(struct ttm_resource_manager *man)
> > +{
> > +     struct i915_ttm_buddy_manager *bman =3D to_buddy_manager(man);
> > +     struct i915_buddy_mm *mm =3D &bman->mm;
> > +
> > +     return mm->avail;
> > +}
> > diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gp=
u/drm/i915/i915_ttm_buddy_manager.h
> > index 26026213e20a..39f5b1a4c3e7 100644
> > --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> > +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> > @@ -53,4 +53,6 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev,
> >  int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
> >                              u64 start, u64 size);
> >
> > +u64 i915_ttm_buddy_man_get_avail(struct ttm_resource_manager *man);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/d=
rm/i915/intel_memory_region.c
> > index df59f884d37c..d5edf088be48 100644
> > --- a/drivers/gpu/drm/i915/intel_memory_region.c
> > +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> > @@ -132,6 +132,21 @@ void intel_memory_region_set_name(struct intel_mem=
ory_region *mem,
> >       va_end(ap);
> >  }
> >
> > +/**
> > + * intel_memory_region_get_avail - Get the currently available size fo=
r the
> > + * region
> > + * @mr: The memory region
> > + *
> > + * Return: The available size in bytes
> > + */
> > +u64 intel_memory_region_get_avail(struct intel_memory_region *mr)
> > +{
> > +     if (mr->type =3D=3D INTEL_MEMORY_LOCAL)
> > +             return i915_ttm_buddy_man_get_avail(mr->region_private);
> > +
> > +     return mr->avail;
> > +}
> > +
> >  static void __intel_memory_region_destroy(struct kref *kref)
> >  {
> >       struct intel_memory_region *mem =3D
> > diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/d=
rm/i915/intel_memory_region.h
> > index 2be8433d373a..6f7a073d5a70 100644
> > --- a/drivers/gpu/drm/i915/intel_memory_region.h
> > +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> > @@ -74,6 +74,7 @@ struct intel_memory_region {
> >       resource_size_t io_start;
> >       resource_size_t min_page_size;
> >       resource_size_t total;
> > +     /* Do not access directly. Use the accessor instead. */
> >       resource_size_t avail;
> >
> >       u16 type;
> > @@ -125,4 +126,7 @@ intel_memory_region_set_name(struct intel_memory_re=
gion *mem,
> >  int intel_memory_region_reserve(struct intel_memory_region *mem,
> >                               resource_size_t offset,
> >                               resource_size_t size);
> > +
> > +u64 intel_memory_region_get_avail(struct intel_memory_region *mem);
> > +
> >  #endif
> > --
> > 2.26.3
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
