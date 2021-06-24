Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20243B2AB8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 10:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E0A6EB1D;
	Thu, 24 Jun 2021 08:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208A26EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 08:50:36 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id h17so7372763edw.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 01:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oxdoHUsK0W5Vkc6v3ozAbG6S64dO7oMqRlfcZ1AR5Tw=;
 b=NicX0IdNFdFOpyxOhMQXp4qAOrdMPdvlwAt/x0UhEr5no/+goCP7lHZQX38SYfkevW
 WoqIhd9NpuB/K4curfvqPLF9BTfFLp9S+AHgBuupUsos8ptvAEZsQGv2tIZ1amK4uMw5
 NOwM0SSf7Zk6C8Q3I8bg0cKGPkr3fZVjMrDYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oxdoHUsK0W5Vkc6v3ozAbG6S64dO7oMqRlfcZ1AR5Tw=;
 b=ETYJSgVkozvzk6E5JIHDxcNmvsVzX+3P3ue+kLnDx0ReFouqn4u8MmDqi3Uo8JIKOS
 AVCrtHUvNYZ9fG0w9Xbg7L7ZP6sDQBZeF6WzFYpSeTIQqOOuUPFP+pd8r4Wq6tLD+MW3
 0HpuX/XlYd1AB4uXHpM1cBnUV+7Bfyvq36V8KsckcgsgUnwTglVWOtZe09MkpP7U10eU
 kLc+/WM8olxD3FlISZfeBr/XTnoK+81uIEK4xUMZiejrMl0lRXW3Z8eG9phrxv1VrUXZ
 XXjLUQevRuDrfySiVogIoVZqrhb8N+EWaJ51AUeoZTD8+gMBIPl49XMpu0KZlPFaCcxS
 NkTQ==
X-Gm-Message-State: AOAM532YhSf3OVfZPGfB9UsZs+6Db1g9qObV3xObZDibZZKuL4fC5qgA
 YZErcIOLUjTW68dsrG/8pY7Xfw==
X-Google-Smtp-Source: ABdhPJyBRUQfxKQ3f4GipFfrx1iREWz9mi+9hN9U3K0t0vPSIX1B/kuj2aIDuKtsPpm1guWBk4a1dw==
X-Received: by 2002:a05:6402:6d3:: with SMTP id
 n19mr5789270edy.248.1624524634711; 
 Thu, 24 Jun 2021 01:50:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j22sm925778ejt.11.2021.06.24.01.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 01:50:34 -0700 (PDT)
Date: Thu, 24 Jun 2021 10:50:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: add back the avail tracking
Message-ID: <YNRHWIaGX1f9OZff@phenom.ffwll.local>
References: <20210623172706.315165-1-matthew.auld@intel.com>
 <YNOISja0iGhcdomF@phenom.ffwll.local>
 <CAM0jSHNRP5kvKSBqM3ALJSP3JH8EKWvSo289yRW9xfqd=t3-UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM0jSHNRP5kvKSBqM3ALJSP3JH8EKWvSo289yRW9xfqd=t3-UQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 08:35:30PM +0100, Matthew Auld wrote:
> On Wed, 23 Jun 2021 at 20:15, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jun 23, 2021 at 06:27:06PM +0100, Matthew Auld wrote:
> > > Looks like it got lost along the way, so add it back. This is needed for
> > > the region query uAPI where we want to report a snapshot of how much
> > > lmem is available.
> > >
> > > This time around let's push it directly into the allocator, which
> > > simplifies things, like not having to care about internal fragmentation,
> > > or having to remember to track things for all possible interfaces that
> > > might want to allocate or reserve pages.
> > >
> > > v2(Thomas): add some more kernel doc
> > >
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >
> > Since this is uapi, do umds use this? Or just igt?
> >
> > Please record both the umd user for this and the igts that verifies this
> > is not nonsense to the commit message. We need to be much better with
> > keeping records for our uapi additions, there's been some really badly
> > justified uapi in the past that turned out to be for testcases only.
> 
> For the userspace justification, I pinged you and Jason about that in
> the previous thread, since it's not completely clear if real userspace
> even cares about this. I can maybe just limit it to debugfs?

Sorry I missed that ping. If it's just for igt then debugfs should be good
enough. Otherwise I'd do a quick check on the internal code repos and
maybe ping Jason on irc if he misses this, just in case we've overlooked
something.
-Daniel

> 
> > -Daniel
> >
> > > ---
> > >  drivers/gpu/drm/i915/i915_buddy.c             |  6 ++++++
> > >  drivers/gpu/drm/i915/i915_buddy.h             |  1 +
> > >  drivers/gpu/drm/i915/i915_debugfs.c           |  5 +++--
> > >  drivers/gpu/drm/i915/i915_query.c             |  2 +-
> > >  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 13 +++++++++++++
> > >  drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  2 ++
> > >  drivers/gpu/drm/i915/intel_memory_region.c    | 15 +++++++++++++++
> > >  drivers/gpu/drm/i915/intel_memory_region.h    |  4 ++++
> > >  8 files changed, 45 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
> > > index 29dd7d0310c1..27cd2487a18f 100644
> > > --- a/drivers/gpu/drm/i915/i915_buddy.c
> > > +++ b/drivers/gpu/drm/i915/i915_buddy.c
> > > @@ -80,6 +80,7 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
> > >       size = round_down(size, chunk_size);
> > >
> > >       mm->size = size;
> > > +     mm->avail = size;
> > >       mm->chunk_size = chunk_size;
> > >       mm->max_order = ilog2(size) - ilog2(chunk_size);
> > >
> > > @@ -159,6 +160,8 @@ void i915_buddy_fini(struct i915_buddy_mm *mm)
> > >               i915_block_free(mm, mm->roots[i]);
> > >       }
> > >
> > > +     GEM_WARN_ON(mm->avail != mm->size);
> > > +
> > >       kfree(mm->roots);
> > >       kfree(mm->free_list);
> > >       kmem_cache_destroy(mm->slab_blocks);
> > > @@ -235,6 +238,7 @@ void i915_buddy_free(struct i915_buddy_mm *mm,
> > >                    struct i915_buddy_block *block)
> > >  {
> > >       GEM_BUG_ON(!i915_buddy_block_is_allocated(block));
> > > +     mm->avail += i915_buddy_block_size(mm, block);
> > >       __i915_buddy_free(mm, block);
> > >  }
> > >
> > > @@ -288,6 +292,7 @@ i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
> > >       }
> > >
> > >       mark_allocated(block);
> > > +     mm->avail -= i915_buddy_block_size(mm, block);
> > >       kmemleak_update_trace(block);
> > >       return block;
> > >
> > > @@ -373,6 +378,7 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
> > >                       }
> > >
> > >                       mark_allocated(block);
> > > +                     mm->avail -= i915_buddy_block_size(mm, block);
> > >                       list_add_tail(&block->link, &allocated);
> > >                       continue;
> > >               }
> > > diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
> > > index 37f8c42071d1..feb7c1bb6244 100644
> > > --- a/drivers/gpu/drm/i915/i915_buddy.h
> > > +++ b/drivers/gpu/drm/i915/i915_buddy.h
> > > @@ -70,6 +70,7 @@ struct i915_buddy_mm {
> > >       /* Must be at least PAGE_SIZE */
> > >       u64 chunk_size;
> > >       u64 size;
> > > +     u64 avail;
> > >  };
> > >
> > >  static inline u64
> > > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> > > index cc745751ac53..4765f220469e 100644
> > > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > > @@ -246,8 +246,9 @@ static int i915_gem_object_info(struct seq_file *m, void *data)
> > >                  atomic_read(&i915->mm.free_count),
> > >                  i915->mm.shrink_memory);
> > >       for_each_memory_region(mr, i915, id)
> > > -             seq_printf(m, "%s: total:%pa, available:%pa bytes\n",
> > > -                        mr->name, &mr->total, &mr->avail);
> > > +             seq_printf(m, "%s: total:%pa, available:%llu bytes\n",
> > > +                        mr->name, &mr->total,
> > > +                        intel_memory_region_get_avail(mr));
> > >
> > >       return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > > index e49da36c62fb..f10dcea94ac9 100644
> > > --- a/drivers/gpu/drm/i915/i915_query.c
> > > +++ b/drivers/gpu/drm/i915/i915_query.c
> > > @@ -465,7 +465,7 @@ static int query_memregion_info(struct drm_i915_private *i915,
> > >               info.region.memory_class = mr->type;
> > >               info.region.memory_instance = mr->instance;
> > >               info.probed_size = mr->total;
> > > -             info.unallocated_size = mr->avail;
> > > +             info.unallocated_size = intel_memory_region_get_avail(mr);
> > >
> > >               if (__copy_to_user(info_ptr, &info, sizeof(info)))
> > >                       return -EFAULT;
> > > diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> > > index fc7ad5c035b8..562d11edc5e4 100644
> > > --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> > > +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> > > @@ -246,3 +246,16 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
> > >       return ret;
> > >  }
> > >
> > > +/**
> > > + * i915_ttm_buddy_man_avail - Get the currently available size
> > > + * @man: The buddy allocator ttm manager
> > > + *
> > > + * Return: The available size in bytes
> > > + */
> > > +u64 i915_ttm_buddy_man_get_avail(struct ttm_resource_manager *man)
> > > +{
> > > +     struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
> > > +     struct i915_buddy_mm *mm = &bman->mm;
> > > +
> > > +     return mm->avail;
> > > +}
> > > diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> > > index 26026213e20a..39f5b1a4c3e7 100644
> > > --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> > > +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> > > @@ -53,4 +53,6 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev,
> > >  int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
> > >                              u64 start, u64 size);
> > >
> > > +u64 i915_ttm_buddy_man_get_avail(struct ttm_resource_manager *man);
> > > +
> > >  #endif
> > > diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> > > index df59f884d37c..d5edf088be48 100644
> > > --- a/drivers/gpu/drm/i915/intel_memory_region.c
> > > +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> > > @@ -132,6 +132,21 @@ void intel_memory_region_set_name(struct intel_memory_region *mem,
> > >       va_end(ap);
> > >  }
> > >
> > > +/**
> > > + * intel_memory_region_get_avail - Get the currently available size for the
> > > + * region
> > > + * @mr: The memory region
> > > + *
> > > + * Return: The available size in bytes
> > > + */
> > > +u64 intel_memory_region_get_avail(struct intel_memory_region *mr)
> > > +{
> > > +     if (mr->type == INTEL_MEMORY_LOCAL)
> > > +             return i915_ttm_buddy_man_get_avail(mr->region_private);
> > > +
> > > +     return mr->avail;
> > > +}
> > > +
> > >  static void __intel_memory_region_destroy(struct kref *kref)
> > >  {
> > >       struct intel_memory_region *mem =
> > > diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> > > index 2be8433d373a..6f7a073d5a70 100644
> > > --- a/drivers/gpu/drm/i915/intel_memory_region.h
> > > +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> > > @@ -74,6 +74,7 @@ struct intel_memory_region {
> > >       resource_size_t io_start;
> > >       resource_size_t min_page_size;
> > >       resource_size_t total;
> > > +     /* Do not access directly. Use the accessor instead. */
> > >       resource_size_t avail;
> > >
> > >       u16 type;
> > > @@ -125,4 +126,7 @@ intel_memory_region_set_name(struct intel_memory_region *mem,
> > >  int intel_memory_region_reserve(struct intel_memory_region *mem,
> > >                               resource_size_t offset,
> > >                               resource_size_t size);
> > > +
> > > +u64 intel_memory_region_get_avail(struct intel_memory_region *mem);
> > > +
> > >  #endif
> > > --
> > > 2.26.3
> > >
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
