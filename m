Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258563BE419
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1B16E83B;
	Wed,  7 Jul 2021 08:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEA86E83B;
 Wed,  7 Jul 2021 08:06:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso1046730wmj.4; 
 Wed, 07 Jul 2021 01:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QSYk948aOngX87+6HnocMDT9EPo+d77Our2uSzGUozI=;
 b=aZ+4/9hHlQ9iZh6NsuxPcFh3Q3ZvL5a6wdBHSb4cm7cAArwKyVMMAtlNQYl/TfsLFF
 mV08KPKE/4mVBmmyW9dIzKIO+HNnQE1nsUZ2x8fay7rpB+/4iJsqjYCX/hhHv+KyOFuZ
 bvzQ+4dQJidTXJk6licog1tgquszQPQ+SrQy8CbO92ZoYaJdidd3F64qOr2geoFBBEfE
 xCN4XS4TEu9hEMieA/adggrOLKXoHknrsCcWoCY/32U+nHdPZqTOcXw5w4ERTG9vfSfK
 nLP3AdQ9vaZ0BL2d4FXWZwzpWp/3BgpOGfTFtOwxgQfKLTOT8pv8Fo8UZZKKkW+/t4Ns
 Dofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QSYk948aOngX87+6HnocMDT9EPo+d77Our2uSzGUozI=;
 b=bZELKfKLht8KL/6glgTGLO88fSsH1oDQITFi6pDFKIXBpOBtgVW5sqQ1gvlJEB9MOe
 bIp3LaJh9dZ5BkiLbCVKFRkLYc2NQ9I3dbgxXQ1u9472DGEcXAEZ2CKIBnnMB3WfjHos
 Whlgg9bYXzdnqq8JFds79YGusAQEQHLpUF9gxACq/S6cK353+j8jvPMFu6zeok7hYBj1
 f2hTF1XEgntZSsBpgVFfgEZ1SsNXdZz+3r67okiZX+pMa84ZQ87fyCLaZ9XFKGOPXQLy
 DjHVU3KaGwdpTDnKxYBNWFuVZN6Bkb81PyMcof/SdbLWHU28UZKIQSbiDiJu6E+1gCM3
 rT4A==
X-Gm-Message-State: AOAM530LZDxsbg6lMM3vZtwBmNJFblHKQa6gHlOXUtXr3EB74Z7Msxf1
 fLOOcRWZuZZL94PjynkVOxc=
X-Google-Smtp-Source: ABdhPJyUc2JfiJLCx4TuDJWK+0d4s/cWbxTsxfV1qNDmTIl/+1pHyQ34yut/8CVhLv/DIanK8iL8Aw==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr24661124wmq.13.1625645209353; 
 Wed, 07 Jul 2021 01:06:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7671:3328:2129:96b5?
 ([2a02:908:1252:fb60:7671:3328:2129:96b5])
 by smtp.gmail.com with ESMTPSA id r4sm20513204wre.84.2021.07.07.01.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 01:06:48 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 7/7] dma-resv: Give the docs a do-over
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
 <20210706101209.3034092-8-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <280c31ae-0d9f-0548-11ea-5b25546741ae@gmail.com>
Date: Wed, 7 Jul 2021 10:06:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706101209.3034092-8-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.07.21 um 12:12 schrieb Daniel Vetter:
> Specifically document the new/clarified rules around how the shared
> fences do not have any ordering requirements against the exclusive
> fence.
>
> But also document all the things a bit better, given how central
> struct dma_resv to dynamic buffer management the docs have been very
> inadequat.
>
> - Lots more links to other pieces of the puzzle. Unfortunately
>    ttm_buffer_object has no docs, so no links :-(
>
> - Explain/complain a bit about dma_resv_locking_ctx(). I still don't
>    like that one, but fixing the ttm call chains is going to be
>    horrible. Plus we want to plug in real slowpath locking when we do
>    that anyway.
>
> - Main part of the patch is some actual docs for struct dma_resv.
>
> Overall I think we still have a lot of bad naming in this area (e.g.
> dma_resv.fence is singular, but contains the multiple shared fences),
> but I think that's more indicative of how the semantics and rules are
> just not great.
>
> Another thing that's real awkard is how chaining exclusive fences
> right now means direct dma_resv.exclusive_fence pointer access with an
> rcu_assign_pointer. Not so great either.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   drivers/dma-buf/dma-resv.c |  22 ++++++--
>   include/linux/dma-resv.h   | 104 +++++++++++++++++++++++++++++++++++--
>   2 files changed, 116 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index f26c71747d43..898f8d894bbd 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -48,6 +48,8 @@
>    * write operations) or N shared fences (read operations).  The RCU
>    * mechanism is used to protect read access to fences from locked
>    * write-side updates.
> + *
> + * See struct dma_resv for more details.
>    */
>   
>   DEFINE_WD_CLASS(reservation_ww_class);
> @@ -137,7 +139,11 @@ EXPORT_SYMBOL(dma_resv_fini);
>    * @num_fences: number of fences we want to add
>    *
>    * Should be called before dma_resv_add_shared_fence().  Must
> - * be called with obj->lock held.
> + * be called with @obj locked through dma_resv_lock().
> + *
> + * Note that the preallocated slots need to be re-reserved if @obj is unlocked
> + * at any time before callind dma_resv_add_shared_fence(). This is validate when
> + * CONFIG_DEBUG_MUTEXES is enabled.
>    *
>    * RETURNS
>    * Zero for success, or -errno
> @@ -234,8 +240,10 @@ EXPORT_SYMBOL(dma_resv_reset_shared_max);
>    * @obj: the reservation object
>    * @fence: the shared fence to add
>    *
> - * Add a fence to a shared slot, obj->lock must be held, and
> + * Add a fence to a shared slot, @obj must be locked with dma_resv_lock(), and
>    * dma_resv_reserve_shared() has been called.
> + *
> + * See also &dma_resv.fence for a discussion of the semantics.
>    */
>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>   {
> @@ -280,7 +288,9 @@ EXPORT_SYMBOL(dma_resv_add_shared_fence);
>    * @obj: the reservation object
>    * @fence: the shared fence to add
>    *
> - * Add a fence to the exclusive slot.  The obj->lock must be held.
> + * Add a fence to the exclusive slot. @obj must be locked with dma_resv_lock().
> + * Note that this function replaces all fences attached to @obj, see also
> + * &dma_resv.fence_excl for a discussion of the semantics.
>    */
>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>   {
> @@ -609,9 +619,11 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
>    * fence
>    *
>    * Callers are not required to hold specific locks, but maybe hold
> - * dma_resv_lock() already
> + * dma_resv_lock() already.
> + *
>    * RETURNS
> - * true if all fences signaled, else false
> + *
> + * True if all fences signaled, else false.
>    */
>   bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
>   {
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index e1ca2080a1ff..c77fd54d033f 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -62,16 +62,90 @@ struct dma_resv_list {
>   
>   /**
>    * struct dma_resv - a reservation object manages fences for a buffer
> - * @lock: update side lock
> - * @seq: sequence count for managing RCU read-side synchronization
> - * @fence_excl: the exclusive fence, if there is one currently
> - * @fence: list of current shared fences
> + *
> + * There are multiple uses for this, with sometimes slightly different rules in
> + * how the fence slots are used.
> + *
> + * One use is to synchronize cross-driver access to a struct dma_buf, either for
> + * dynamic buffer management or just to handle implicit synchronization between
> + * different users of the buffer in userspace. See &dma_buf.resv for a more
> + * in-depth discussion.
> + *
> + * The other major use is to manage access and locking within a driver in a
> + * buffer based memory manager. struct ttm_buffer_object is the canonical
> + * example here, since this is were reservation objects originated from. But use
> + * in drivers is spreading and some drivers also manage struct
> + * drm_gem_object with the same scheme.

I would still make that even harder, e.g. mentioning that you run into 
use after free and the resulting memory corruption if you don't obey the 
rules.

Apart from that with the spelling stuff pointed out by others fixed the 
patch is Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

>    */
>   struct dma_resv {
> +	/**
> +	 * @lock:
> +	 *
> +	 * Update side lock. Don't use directly, instead use the wrapper
> +	 * functions like dma_resv_lock() and dma_resv_unlock().
> +	 *
> +	 * Drivers which use the reservation object to manage memory dynamically
> +	 * also use this lock to protect buffer object state like placement,
> +	 * allocation policies or throughout command submission.
> +	 */
>   	struct ww_mutex lock;
> +
> +	/**
> +	 * @seq:
> +	 *
> +	 * Sequence count for managing RCU read-side synchronization, allows
> +	 * read-only access to @fence_excl and @fence while ensuring we take a
> +	 * consistent snapshot.
> +	 */
>   	seqcount_ww_mutex_t seq;
>   
> +	/**
> +	 * @fence_excl:
> +	 *
> +	 * The exclusive fence, if there is one currently.
> +	 *
> +	 * There are two was to update this fence:
> +	 *
> +	 * - First by calling dma_resv_add_excl_fence(), which replaces all
> +	 *   fences attached to the reservation object. To guarantee that no
> +	 *   fences are lost this new fence must signal only after all previous
> +	 *   fences, both shared and exclusive, have signalled. In some cases it
> +	 *   is convenient to achieve that by attaching a struct dma_fence_array
> +	 *   with all the new and old fences.
> +	 *
> +	 * - Alternatively the fence can be set directly, which leaves the
> +	 *   shared fences unchanged. To guarantee that no fences are lost this
> +	 *   new fence must signale only after the previous exclusive fence has
> +	 *   singalled. Since the shared fences are staying intact, it is not
> +	 *   necessary to maintain any ordering against those. If semantically
> +	 *   only a new access is added without actually treating the previous
> +	 *   one as a dependency the exclusive fences can be strung together
> +	 *   using struct dma_fence_chain.
> +	 *
> +	 * Note that actual semantics of what an exclusive or shared fence mean
> +	 * is defined by the user, for reservation objects shared across drivers
> +	 * see &dma_buf.resv.
> +	 */
>   	struct dma_fence __rcu *fence_excl;
> +
> +	/**
> +	 * @fence:
> +	 *
> +	 * List of current shared fences.
> +	 *
> +	 * There are no ordering constraints of shared fences against the
> +	 * exclusive fence slot. If a waiter needs to wait for all access, it
> +	 * has to wait for both set of fences to signal.
> +	 *
> +	 * A new fence is added by calling dma_resv_add_shared_fence(). Since
> +	 * this often needs to be done past the point of no return in command
> +	 * submission it cannot fail, and therefor sufficient slots need to be
> +	 * reserved by calling dma_resv_reserve_shared().
> +	 *
> +	 * Note that actual semantics of what an exclusive or shared fence mean
> +	 * is defined by the user, for reservation objects shared across drivers
> +	 * see &dma_buf.resv.
> +	 */
>   	struct dma_resv_list __rcu *fence;
>   };
>   
> @@ -98,6 +172,13 @@ static inline void dma_resv_reset_shared_max(struct dma_resv *obj) {}
>    * undefined order, a #ww_acquire_ctx is passed to unwind if a cycle
>    * is detected. See ww_mutex_lock() and ww_acquire_init(). A reservation
>    * object may be locked by itself by passing NULL as @ctx.
> + *
> + * When a die situation is indicated by returning -EDEADLK all locks held by
> + * @ctx must be unlocked and then dma_resv_lock_slow() called on @obj.
> + *
> + * Unlocked by calling dma_resv_lock().
> + *
> + * See also dma_resv_lock_interruptible() for the interruptible variant.
>    */
>   static inline int dma_resv_lock(struct dma_resv *obj,
>   				struct ww_acquire_ctx *ctx)
> @@ -119,6 +200,12 @@ static inline int dma_resv_lock(struct dma_resv *obj,
>    * undefined order, a #ww_acquire_ctx is passed to unwind if a cycle
>    * is detected. See ww_mutex_lock() and ww_acquire_init(). A reservation
>    * object may be locked by itself by passing NULL as @ctx.
> + *
> + * When a die situation is indicated by returning -EDEADLK all locks held by
> + * @ctx must be unlocked and then dma_resv_lock_slow_interruptible() called on
> + * @obj.
> + *
> + * Unlocked by calling dma_resv_lock().
>    */
>   static inline int dma_resv_lock_interruptible(struct dma_resv *obj,
>   					      struct ww_acquire_ctx *ctx)
> @@ -134,6 +221,8 @@ static inline int dma_resv_lock_interruptible(struct dma_resv *obj,
>    * Acquires the reservation object after a die case. This function
>    * will sleep until the lock becomes available. See dma_resv_lock() as
>    * well.
> + *
> + * See also dma_resv_lock_slow_interruptible() for the interruptible variant.
>    */
>   static inline void dma_resv_lock_slow(struct dma_resv *obj,
>   				      struct ww_acquire_ctx *ctx)
> @@ -167,7 +256,7 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
>    * if they overlap with a writer.
>    *
>    * Also note that since no context is provided, no deadlock protection is
> - * possible.
> + * possible, which is also not needed for a trylock.
>    *
>    * Returns true if the lock was acquired, false otherwise.
>    */
> @@ -193,6 +282,11 @@ static inline bool dma_resv_is_locked(struct dma_resv *obj)
>    *
>    * Returns the context used to lock a reservation object or NULL if no context
>    * was used or the object is not locked at all.
> + *
> + * WARNING: This interface is pretty horrible, but TTM needs it because it
> + * doesn't pass the struct ww_acquire_ctx around in some very long callchains.
> + * Everyone else just uses it to check whether they're holding a reservation or
> + * not.
>    */
>   static inline struct ww_acquire_ctx *dma_resv_locking_ctx(struct dma_resv *obj)
>   {

