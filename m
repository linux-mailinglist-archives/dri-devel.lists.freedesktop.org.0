Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 257BB3DF1C3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 17:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C454C6E048;
	Tue,  3 Aug 2021 15:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6612789EBD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 15:47:22 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id w17so34474520ybl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GO3pqIU3xWwM7Iv/KDVMtCSsBAK+j+OJkK22Qqndccs=;
 b=m7dfWUzra788Y9bIq6mf6xYT2fpDk5xYuPm2RgeomZGuIRy7icJWlAXrkwzxdGx8hh
 Dt1I2aM2tDDC4Ed14sYlaGWYYKXFOdDq5NQ7LMZoWmdnnVXZ1lFJNjplguQFUCHSVwiX
 fCuszlE5iSvTVbl4lBmNbsxHUmBBHLUl2zG2H+eaVUcI43SSziHfiacu1mkslYN3sHW8
 g2oUzlpM4KdPlAZgwzU0A8pM1pKb1CLbdto65FVlt4DOZz07nw3yrRWzpa1qI/NQh45X
 iv8of2zkZrkXrExPZQY20IcE7+7oICxXJ3hXOrAdBFaJuT9X/zUsU71jPgpe3SW0LST7
 x8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GO3pqIU3xWwM7Iv/KDVMtCSsBAK+j+OJkK22Qqndccs=;
 b=jt7l/EJAx9M+L+du2j+Qkyx3LvuT+xTpwsu3A8Z2i/F0g9eBH37zZhYYAOvESVtCwD
 6uqEfueu6cFNRemKwn4Po7+InhHe2+8oABAGDadT3lJAU8je0njgTCbZxvCbhmiOir6h
 jZY25cZKewpLJ4ud7/XDl3HJc/dc2Nmy8vSsUKYIceM5HQV/z7T/rjnXSw5dk5tSdgJY
 w5KcXWKyqT5EbTEfKZSCSMlwHEFZU0rb7tfNHogtvXLyd2a7sHMMujFeyRSOmZ/HCN9r
 42p1suP/igGR8EBsMLONkKPz6Z9vmPnBhKKeKmXa7F6mA8QIG2zpFTADeklYjusXbgTe
 WUXQ==
X-Gm-Message-State: AOAM533EDzaCJs5Cr9bvdtIiQBzpmLRGB8XzhZDQXrqDKrg9ca2t59t9
 1nkZlUe17e1rZC9pdpwNv4yziSYOczqTKSLHKJtn3w==
X-Google-Smtp-Source: ABdhPJz4Sq8j2xFaQXyKL3OEIV30C72WJ8M8a69g0SUonySvtypXIZ1oLnpVPDXT1slqlIs3KsA9oq0sPFLVncb9u+0=
X-Received: by 2002:a25:d841:: with SMTP id p62mr30701029ybg.180.1628005641362; 
 Tue, 03 Aug 2021 08:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210803124833.3817354-1-daniel.vetter@ffwll.ch>
 <20210803124833.3817354-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20210803124833.3817354-2-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 3 Aug 2021 10:47:10 -0500
Message-ID: <CAOFGe96KzKv_3FusLXirDdUHXn9YoNcmgEQS_QNLkRBSGPBVpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915: delete gpu reloc code
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, 
 Dave Airlie <airlied@redhat.com>
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

Both are

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

On Tue, Aug 3, 2021 at 7:49 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote=
:
>
> It's already removed, this just garbage collects it all.
>
> v2: Rebase over s/GEN/GRAPHICS_VER/
>
> v3: Also ditch eb.reloc_pool and eb.reloc_context (Maarten)
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 360 +-----------------
>  .../drm/i915/selftests/i915_live_selftests.h  |   1 -
>  2 files changed, 1 insertion(+), 360 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index e4dc4c3b4df3..98e25efffb59 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -277,16 +277,8 @@ struct i915_execbuffer {
>                 bool has_llc : 1;
>                 bool has_fence : 1;
>                 bool needs_unfenced : 1;
> -
> -               struct i915_request *rq;
> -               u32 *rq_cmd;
> -               unsigned int rq_size;
> -               struct intel_gt_buffer_pool_node *pool;
>         } reloc_cache;
>
> -       struct intel_gt_buffer_pool_node *reloc_pool; /** relocation pool=
 for -EDEADLK handling */
> -       struct intel_context *reloc_context;
> -
>         u64 invalid_flags; /** Set of execobj.flags that are invalid */
>
>         u64 batch_len; /** Length of batch within object */
> @@ -1035,8 +1027,6 @@ static void eb_release_vmas(struct i915_execbuffer =
*eb, bool final)
>
>  static void eb_destroy(const struct i915_execbuffer *eb)
>  {
> -       GEM_BUG_ON(eb->reloc_cache.rq);
> -
>         if (eb->lut_size > 0)
>                 kfree(eb->buckets);
>  }
> @@ -1048,14 +1038,6 @@ relocation_target(const struct drm_i915_gem_reloca=
tion_entry *reloc,
>         return gen8_canonical_addr((int)reloc->delta + target->node.start=
);
>  }
>
> -static void reloc_cache_clear(struct reloc_cache *cache)
> -{
> -       cache->rq =3D NULL;
> -       cache->rq_cmd =3D NULL;
> -       cache->pool =3D NULL;
> -       cache->rq_size =3D 0;
> -}
> -
>  static void reloc_cache_init(struct reloc_cache *cache,
>                              struct drm_i915_private *i915)
>  {
> @@ -1068,7 +1050,6 @@ static void reloc_cache_init(struct reloc_cache *ca=
che,
>         cache->has_fence =3D cache->graphics_ver < 4;
>         cache->needs_unfenced =3D INTEL_INFO(i915)->unfenced_needs_alignm=
ent;
>         cache->node.flags =3D 0;
> -       reloc_cache_clear(cache);
>  }
>
>  static inline void *unmask_page(unsigned long p)
> @@ -1090,48 +1071,10 @@ static inline struct i915_ggtt *cache_to_ggtt(str=
uct reloc_cache *cache)
>         return &i915->ggtt;
>  }
>
> -static void reloc_cache_put_pool(struct i915_execbuffer *eb, struct relo=
c_cache *cache)
> -{
> -       if (!cache->pool)
> -               return;
> -
> -       /*
> -        * This is a bit nasty, normally we keep objects locked until the=
 end
> -        * of execbuffer, but we already submit this, and have to unlock =
before
> -        * dropping the reference. Fortunately we can only hold 1 pool no=
de at
> -        * a time, so this should be harmless.
> -        */
> -       i915_gem_ww_unlock_single(cache->pool->obj);
> -       intel_gt_buffer_pool_put(cache->pool);
> -       cache->pool =3D NULL;
> -}
> -
> -static void reloc_gpu_flush(struct i915_execbuffer *eb, struct reloc_cac=
he *cache)
> -{
> -       struct drm_i915_gem_object *obj =3D cache->rq->batch->obj;
> -
> -       GEM_BUG_ON(cache->rq_size >=3D obj->base.size / sizeof(u32));
> -       cache->rq_cmd[cache->rq_size] =3D MI_BATCH_BUFFER_END;
> -
> -       i915_gem_object_flush_map(obj);
> -       i915_gem_object_unpin_map(obj);
> -
> -       intel_gt_chipset_flush(cache->rq->engine->gt);
> -
> -       i915_request_add(cache->rq);
> -       reloc_cache_put_pool(eb, cache);
> -       reloc_cache_clear(cache);
> -
> -       eb->reloc_pool =3D NULL;
> -}
> -
>  static void reloc_cache_reset(struct reloc_cache *cache, struct i915_exe=
cbuffer *eb)
>  {
>         void *vaddr;
>
> -       if (cache->rq)
> -               reloc_gpu_flush(eb, cache);
> -
>         if (!cache->vaddr)
>                 return;
>
> @@ -1313,295 +1256,6 @@ static void clflush_write32(u32 *addr, u32 value,=
 unsigned int flushes)
>                 *addr =3D value;
>  }
>
> -static int reloc_move_to_gpu(struct i915_request *rq, struct i915_vma *v=
ma)
> -{
> -       struct drm_i915_gem_object *obj =3D vma->obj;
> -       int err;
> -
> -       assert_vma_held(vma);
> -
> -       if (obj->cache_dirty & ~obj->cache_coherent)
> -               i915_gem_clflush_object(obj, 0);
> -       obj->write_domain =3D 0;
> -
> -       err =3D i915_request_await_object(rq, vma->obj, true);
> -       if (err =3D=3D 0)
> -               err =3D i915_vma_move_to_active(vma, rq, EXEC_OBJECT_WRIT=
E);
> -
> -       return err;
> -}
> -
> -static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
> -                            struct intel_engine_cs *engine,
> -                            struct i915_vma *vma,
> -                            unsigned int len)
> -{
> -       struct reloc_cache *cache =3D &eb->reloc_cache;
> -       struct intel_gt_buffer_pool_node *pool =3D eb->reloc_pool;
> -       struct i915_request *rq;
> -       struct i915_vma *batch;
> -       u32 *cmd;
> -       int err;
> -
> -       if (!pool) {
> -               pool =3D intel_gt_get_buffer_pool(engine->gt, PAGE_SIZE,
> -                                               cache->has_llc ?
> -                                               I915_MAP_WB :
> -                                               I915_MAP_WC);
> -               if (IS_ERR(pool))
> -                       return PTR_ERR(pool);
> -       }
> -       eb->reloc_pool =3D NULL;
> -
> -       err =3D i915_gem_object_lock(pool->obj, &eb->ww);
> -       if (err)
> -               goto err_pool;
> -
> -       cmd =3D i915_gem_object_pin_map(pool->obj, pool->type);
> -       if (IS_ERR(cmd)) {
> -               err =3D PTR_ERR(cmd);
> -               goto err_pool;
> -       }
> -       intel_gt_buffer_pool_mark_used(pool);
> -
> -       memset32(cmd, 0, pool->obj->base.size / sizeof(u32));
> -
> -       batch =3D i915_vma_instance(pool->obj, vma->vm, NULL);
> -       if (IS_ERR(batch)) {
> -               err =3D PTR_ERR(batch);
> -               goto err_unmap;
> -       }
> -
> -       err =3D i915_vma_pin_ww(batch, &eb->ww, 0, 0, PIN_USER | PIN_NONB=
LOCK);
> -       if (err)
> -               goto err_unmap;
> -
> -       if (engine =3D=3D eb->context->engine) {
> -               rq =3D i915_request_create(eb->context);
> -       } else {
> -               struct intel_context *ce =3D eb->reloc_context;
> -
> -               if (!ce) {
> -                       ce =3D intel_context_create(engine);
> -                       if (IS_ERR(ce)) {
> -                               err =3D PTR_ERR(ce);
> -                               goto err_unpin;
> -                       }
> -
> -                       i915_vm_put(ce->vm);
> -                       ce->vm =3D i915_vm_get(eb->context->vm);
> -                       eb->reloc_context =3D ce;
> -               }
> -
> -               err =3D intel_context_pin_ww(ce, &eb->ww);
> -               if (err)
> -                       goto err_unpin;
> -
> -               rq =3D i915_request_create(ce);
> -               intel_context_unpin(ce);
> -       }
> -       if (IS_ERR(rq)) {
> -               err =3D PTR_ERR(rq);
> -               goto err_unpin;
> -       }
> -
> -       err =3D intel_gt_buffer_pool_mark_active(pool, rq);
> -       if (err)
> -               goto err_request;
> -
> -       err =3D reloc_move_to_gpu(rq, vma);
> -       if (err)
> -               goto err_request;
> -
> -       err =3D eb->engine->emit_bb_start(rq,
> -                                       batch->node.start, PAGE_SIZE,
> -                                       cache->graphics_ver > 5 ? 0 : I91=
5_DISPATCH_SECURE);
> -       if (err)
> -               goto skip_request;
> -
> -       assert_vma_held(batch);
> -       err =3D i915_request_await_object(rq, batch->obj, false);
> -       if (err =3D=3D 0)
> -               err =3D i915_vma_move_to_active(batch, rq, 0);
> -       if (err)
> -               goto skip_request;
> -
> -       rq->batch =3D batch;
> -       i915_vma_unpin(batch);
> -
> -       cache->rq =3D rq;
> -       cache->rq_cmd =3D cmd;
> -       cache->rq_size =3D 0;
> -       cache->pool =3D pool;
> -
> -       /* Return with batch mapping (cmd) still pinned */
> -       return 0;
> -
> -skip_request:
> -       i915_request_set_error_once(rq, err);
> -err_request:
> -       i915_request_add(rq);
> -err_unpin:
> -       i915_vma_unpin(batch);
> -err_unmap:
> -       i915_gem_object_unpin_map(pool->obj);
> -err_pool:
> -       eb->reloc_pool =3D pool;
> -       return err;
> -}
> -
> -static bool reloc_can_use_engine(const struct intel_engine_cs *engine)
> -{
> -       return engine->class !=3D VIDEO_DECODE_CLASS || GRAPHICS_VER(engi=
ne->i915) !=3D 6;
> -}
> -
> -static u32 *reloc_gpu(struct i915_execbuffer *eb,
> -                     struct i915_vma *vma,
> -                     unsigned int len)
> -{
> -       struct reloc_cache *cache =3D &eb->reloc_cache;
> -       u32 *cmd;
> -
> -       if (cache->rq_size > PAGE_SIZE/sizeof(u32) - (len + 1))
> -               reloc_gpu_flush(eb, cache);
> -
> -       if (unlikely(!cache->rq)) {
> -               int err;
> -               struct intel_engine_cs *engine =3D eb->engine;
> -
> -               /* If we need to copy for the cmdparser, we will stall an=
yway */
> -               if (eb_use_cmdparser(eb))
> -                       return ERR_PTR(-EWOULDBLOCK);
> -
> -               if (!reloc_can_use_engine(engine)) {
> -                       engine =3D engine->gt->engine_class[COPY_ENGINE_C=
LASS][0];
> -                       if (!engine)
> -                               return ERR_PTR(-ENODEV);
> -               }
> -
> -               err =3D __reloc_gpu_alloc(eb, engine, vma, len);
> -               if (unlikely(err))
> -                       return ERR_PTR(err);
> -       }
> -
> -       cmd =3D cache->rq_cmd + cache->rq_size;
> -       cache->rq_size +=3D len;
> -
> -       return cmd;
> -}
> -
> -static inline bool use_reloc_gpu(struct i915_vma *vma)
> -{
> -       if (DBG_FORCE_RELOC =3D=3D FORCE_GPU_RELOC)
> -               return true;
> -
> -       if (DBG_FORCE_RELOC)
> -               return false;
> -
> -       return !dma_resv_test_signaled(vma->resv, true);
> -}
> -
> -static unsigned long vma_phys_addr(struct i915_vma *vma, u32 offset)
> -{
> -       struct page *page;
> -       unsigned long addr;
> -
> -       GEM_BUG_ON(vma->pages !=3D vma->obj->mm.pages);
> -
> -       page =3D i915_gem_object_get_page(vma->obj, offset >> PAGE_SHIFT)=
;
> -       addr =3D PFN_PHYS(page_to_pfn(page));
> -       GEM_BUG_ON(overflows_type(addr, u32)); /* expected dma32 */
> -
> -       return addr + offset_in_page(offset);
> -}
> -
> -static int __reloc_entry_gpu(struct i915_execbuffer *eb,
> -                             struct i915_vma *vma,
> -                             u64 offset,
> -                             u64 target_addr)
> -{
> -       const unsigned int ver =3D eb->reloc_cache.graphics_ver;
> -       unsigned int len;
> -       u32 *batch;
> -       u64 addr;
> -
> -       if (ver >=3D 8)
> -               len =3D offset & 7 ? 8 : 5;
> -       else if (ver >=3D 4)
> -               len =3D 4;
> -       else
> -               len =3D 3;
> -
> -       batch =3D reloc_gpu(eb, vma, len);
> -       if (batch =3D=3D ERR_PTR(-EDEADLK))
> -               return -EDEADLK;
> -       else if (IS_ERR(batch))
> -               return false;
> -
> -       addr =3D gen8_canonical_addr(vma->node.start + offset);
> -       if (ver >=3D 8) {
> -               if (offset & 7) {
> -                       *batch++ =3D MI_STORE_DWORD_IMM_GEN4;
> -                       *batch++ =3D lower_32_bits(addr);
> -                       *batch++ =3D upper_32_bits(addr);
> -                       *batch++ =3D lower_32_bits(target_addr);
> -
> -                       addr =3D gen8_canonical_addr(addr + 4);
> -
> -                       *batch++ =3D MI_STORE_DWORD_IMM_GEN4;
> -                       *batch++ =3D lower_32_bits(addr);
> -                       *batch++ =3D upper_32_bits(addr);
> -                       *batch++ =3D upper_32_bits(target_addr);
> -               } else {
> -                       *batch++ =3D (MI_STORE_DWORD_IMM_GEN4 | (1 << 21)=
) + 1;
> -                       *batch++ =3D lower_32_bits(addr);
> -                       *batch++ =3D upper_32_bits(addr);
> -                       *batch++ =3D lower_32_bits(target_addr);
> -                       *batch++ =3D upper_32_bits(target_addr);
> -               }
> -       } else if (ver >=3D 6) {
> -               *batch++ =3D MI_STORE_DWORD_IMM_GEN4;
> -               *batch++ =3D 0;
> -               *batch++ =3D addr;
> -               *batch++ =3D target_addr;
> -       } else if (IS_I965G(eb->i915)) {
> -               *batch++ =3D MI_STORE_DWORD_IMM_GEN4;
> -               *batch++ =3D 0;
> -               *batch++ =3D vma_phys_addr(vma, offset);
> -               *batch++ =3D target_addr;
> -       } else if (ver >=3D 4) {
> -               *batch++ =3D MI_STORE_DWORD_IMM_GEN4 | MI_USE_GGTT;
> -               *batch++ =3D 0;
> -               *batch++ =3D addr;
> -               *batch++ =3D target_addr;
> -       } else if (ver >=3D 3 &&
> -                  !(IS_I915G(eb->i915) || IS_I915GM(eb->i915))) {
> -               *batch++ =3D MI_STORE_DWORD_IMM | MI_MEM_VIRTUAL;
> -               *batch++ =3D addr;
> -               *batch++ =3D target_addr;
> -       } else {
> -               *batch++ =3D MI_STORE_DWORD_IMM;
> -               *batch++ =3D vma_phys_addr(vma, offset);
> -               *batch++ =3D target_addr;
> -       }
> -
> -       return true;
> -}
> -
> -static int __maybe_unused reloc_entry_gpu(struct i915_execbuffer *eb,
> -                           struct i915_vma *vma,
> -                           u64 offset,
> -                           u64 target_addr)
> -{
> -       if (eb->reloc_cache.vaddr)
> -               return false;
> -
> -       if (!use_reloc_gpu(vma))
> -               return false;
> -
> -       return __reloc_entry_gpu(eb, vma, offset, target_addr);
> -}
> -
>  static u64
>  relocate_entry(struct i915_vma *vma,
>                const struct drm_i915_gem_relocation_entry *reloc,
> @@ -3166,8 +2820,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>         eb.exec =3D exec;
>         eb.vma =3D (struct eb_vma *)(exec + args->buffer_count + 1);
>         eb.vma[0].vma =3D NULL;
> -       eb.reloc_pool =3D eb.batch_pool =3D NULL;
> -       eb.reloc_context =3D NULL;
> +       eb.batch_pool =3D NULL;
>
>         eb.invalid_flags =3D __EXEC_OBJECT_UNKNOWN_FLAGS;
>         reloc_cache_init(&eb.reloc_cache, eb.i915);
> @@ -3265,9 +2918,6 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>
>         batch =3D eb.batch->vma;
>
> -       /* All GPU relocation batches must be submitted prior to the user=
 rq */
> -       GEM_BUG_ON(eb.reloc_cache.rq);
> -
>         /* Allocate a request for this batch buffer nice and early. */
>         eb.request =3D i915_request_create(eb.context);
>         if (IS_ERR(eb.request)) {
> @@ -3358,10 +3008,6 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>
>         if (eb.batch_pool)
>                 intel_gt_buffer_pool_put(eb.batch_pool);
> -       if (eb.reloc_pool)
> -               intel_gt_buffer_pool_put(eb.reloc_pool);
> -       if (eb.reloc_context)
> -               intel_context_put(eb.reloc_context);
>  err_engine:
>         eb_put_engine(&eb);
>  err_context:
> @@ -3475,7 +3121,3 @@ end:;
>         kvfree(exec2_list);
>         return err;
>  }
> -
> -#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> -#include "selftests/i915_gem_execbuffer.c"
> -#endif
> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drive=
rs/gpu/drm/i915/selftests/i915_live_selftests.h
> index e2fd1b61af71..c0386fb4e286 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> @@ -38,7 +38,6 @@ selftest(gem, i915_gem_live_selftests)
>  selftest(evict, i915_gem_evict_live_selftests)
>  selftest(hugepages, i915_gem_huge_page_live_selftests)
>  selftest(gem_contexts, i915_gem_context_live_selftests)
> -selftest(gem_execbuf, i915_gem_execbuffer_live_selftests)
>  selftest(client, i915_gem_client_blt_live_selftests)
>  selftest(gem_migrate, i915_gem_migrate_live_selftests)
>  selftest(reset, intel_reset_live_selftests)
> --
> 2.32.0
>
