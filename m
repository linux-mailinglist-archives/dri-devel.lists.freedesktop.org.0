Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62939FD418
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 13:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0FF10E3BD;
	Fri, 27 Dec 2024 12:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="TtTEDDmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D0910E3BD;
 Fri, 27 Dec 2024 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=ZeXiOOa/Ig8uiJ1Pf1p0S0D8bGnjqjpwo29tIbFkBcI=; b=TtTEDDmDRxwf/pda
 wV2nsweAf9/qjsHOjST+Irf8fFeC87XJ9XhuuKpyJZtGmCtX2FOtl2mKkL/LNCsiB63wpb9nbmwCL
 NrcuZ3WnhWo6e9qIP9g0tvFY372gonJBb03O7SxG/cxQvhtLoAzlFTKzIbn5h978SqKhzF2BouW+L
 rpRRFjwM3OzKGucKsN315h3Zcf0MRh4SBtD6KyfBIhdnTtWLt92cipLEXqhlsHQQrRjqqgj+0egLz
 eJYoNr6d4j/mL1fAkAyp4iYYzwjRZMa51OtXkZ0ilYO/HlWTHDqN7zrQhmiKVz2hutvOkSFmmQoOf
 chdtsFAUqvgjTk0PeQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tR9BG-007OU3-1z;
 Fri, 27 Dec 2024 12:11:02 +0000
Date: Fri, 27 Dec 2024 12:11:02 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Remove deadcode
Message-ID: <Z26ZVsh1ftEgdfbA@gallifrey>
References: <20241222174751.222975-1-linux@treblig.org>
 <add92c9e-a5d1-4dc7-91fb-0eacd93b5a49@ursulin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <add92c9e-a5d1-4dc7-91fb-0eacd93b5a49@ursulin.net>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 12:10:29 up 232 days, 23:24,  1 user,  load average: 0.00, 0.01, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Tvrtko Ursulin (tursulin@ursulin.net) wrote:
> 
> Hi,
> 
> On 22/12/2024 17:47, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > i915_active_acquire_for_context() was added in 2020 by
> > commit 5d9341370f57 ("drm/i915: Export a preallocate variant of
> > i915_active_acquire()") but has never been used.
> > 
> > The last use of __i915_gem_object_is_lmem() was removed in 2021 by
> > commit ff20afc4cee7 ("drm/i915: Update error capture code to avoid using
> > the current vma state")
> > 
> > Remove them.
> 
> I plan to apply this and your other two dead code removal patches.

Thanks!

> I needed
> to re-send to the mailing list first so they get picked up by the CI before
> I can do that (I guess you are not subscribed to intel-gfx).

Right, I'm not subscribed.

> It should
> happen in a day or two. Thanks for the cleanup!

Thanks again,

Dave

> 
> Regards,
> 
> Tvrtko
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_lmem.c | 23 -----------------------
> >   drivers/gpu/drm/i915/gem/i915_gem_lmem.h |  2 --
> >   drivers/gpu/drm/i915/i915_active.c       | 18 ------------------
> >   drivers/gpu/drm/i915/i915_active.h       |  1 -
> >   4 files changed, 44 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> > index 3198b64ad7db..388f90784d8a 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> > @@ -52,29 +52,6 @@ bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
> >   		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
> >   }
> > -/**
> > - * __i915_gem_object_is_lmem - Whether the object is resident in
> > - * lmem while in the fence signaling critical path.
> > - * @obj: The object to check.
> > - *
> > - * This function is intended to be called from within the fence signaling
> > - * path where the fence, or a pin, keeps the object from being migrated. For
> > - * example during gpu reset or similar.
> > - *
> > - * Return: Whether the object is resident in lmem.
> > - */
> > -bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
> > -{
> > -	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
> > -
> > -#ifdef CONFIG_LOCKDEP
> > -	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP) &&
> > -		    i915_gem_object_evictable(obj));
> > -#endif
> > -	return mr && (mr->type == INTEL_MEMORY_LOCAL ||
> > -		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
> > -}
> > -
> >   /**
> >    * __i915_gem_object_create_lmem_with_ps - Create lmem object and force the
> >    * minimum page size for the backing pages.
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> > index 5a7a14e85c3f..ecd8f1a633a1 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> > @@ -19,8 +19,6 @@ i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
> >   bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
> > -bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
> > -
> >   struct drm_i915_gem_object *
> >   i915_gem_object_create_lmem_from_data(struct drm_i915_private *i915,
> >   				      const void *data, size_t size);
> > diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> > index 35319228bc51..0dbc4e289300 100644
> > --- a/drivers/gpu/drm/i915/i915_active.c
> > +++ b/drivers/gpu/drm/i915/i915_active.c
> > @@ -527,24 +527,6 @@ int i915_active_acquire(struct i915_active *ref)
> >   	return err;
> >   }
> > -int i915_active_acquire_for_context(struct i915_active *ref, u64 idx)
> > -{
> > -	struct i915_active_fence *active;
> > -	int err;
> > -
> > -	err = i915_active_acquire(ref);
> > -	if (err)
> > -		return err;
> > -
> > -	active = active_instance(ref, idx);
> > -	if (!active) {
> > -		i915_active_release(ref);
> > -		return -ENOMEM;
> > -	}
> > -
> > -	return 0; /* return with active ref */
> > -}
> > -
> >   void i915_active_release(struct i915_active *ref)
> >   {
> >   	debug_active_assert(ref);
> > diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
> > index 77c676ecc263..821f7c21ea9b 100644
> > --- a/drivers/gpu/drm/i915/i915_active.h
> > +++ b/drivers/gpu/drm/i915/i915_active.h
> > @@ -186,7 +186,6 @@ int i915_request_await_active(struct i915_request *rq,
> >   #define I915_ACTIVE_AWAIT_BARRIER BIT(2)
> >   int i915_active_acquire(struct i915_active *ref);
> > -int i915_active_acquire_for_context(struct i915_active *ref, u64 idx);
> >   bool i915_active_acquire_if_busy(struct i915_active *ref);
> >   void i915_active_release(struct i915_active *ref);
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
