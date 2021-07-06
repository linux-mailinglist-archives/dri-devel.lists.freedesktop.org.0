Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D1A3BD690
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 14:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B9B6E199;
	Tue,  6 Jul 2021 12:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC186E199;
 Tue,  6 Jul 2021 12:35:09 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id n9so14272480qtk.7;
 Tue, 06 Jul 2021 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jt8pvOIuvJkygBOiSyJ6eVHW151CWxNQ0a8VwJyqmpg=;
 b=R1XXcZ+D6Qz3QXDzlWc11r7pwpvTaS1KcaCT+OCmw1w/cJtmGy8zsTWXsXuyxGA2+L
 PAe/g0qZMbF3MlOSYdmB7x43jCQBSb4P8j66nUQXaL9sRcVkNjPzw7H44LiTt4bzQIVn
 GjYvzcAfCXcAKDP8haNRJgPG+8+5NxOGeuJiioTddU8/CfBjQLf9BK6jIEG/NKqOgaUs
 khqVwgp/DUY2gbEAegWCXpztXJ5+jcR2NjEXKe3XjCTHBNawBNpLzX6TDJ62Bl9kUiwL
 Yo7QsWbwjR0lxz8sjHIoL3NYOdRrToIcI9J5ahCB59bNRbtUc9nU9TjhUfHed5t/SNRi
 LDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jt8pvOIuvJkygBOiSyJ6eVHW151CWxNQ0a8VwJyqmpg=;
 b=iDVlfOJ7KvTOidkEuZ0/8BQgCJtsNMJfkgLPSr5/8zifcZNGXCODZMyUnFmL16kHuk
 aF5TS1vpY1jvuWZwR+b+MqapMTGQgudOMWyguxx4661xIk5Kfg+hVUFUV71q5LiudjYG
 /0abrvv9X4xpNjnH7ZSN5bfle/wlxov6M1o7ciDKhmkmjj/n2/s5jxgJUpF4YudFc5lC
 gI+ouggvPd3VJO0WqqAAAavhzFvv9/BzGCWrD8hfQf1PrzQU1ceGE1wiZqPtmfAR716K
 HtQ5ly1RotmKqOZez6KzF8qN5GCZwGi64skdu4rzGe5OCgIROqmMCrZ06n5uPGp2l334
 GK2g==
X-Gm-Message-State: AOAM530OQ1GdZcUaoeW9KLWcY1vf+S3XqnZONQRP+vjraNJx2DrcHEV3
 HsFh3KtyxVqWygGABA2yGi9ygVJ4eErdnTB+QR0=
X-Google-Smtp-Source: ABdhPJwQIje4Ls+nmBBfAn5G5pwL5wih3C5/Omii8KCKTfCEcUlB/uwHaNbHdZxH7mag2Xv1uDhJYbqcLOp4DNvPTeo=
X-Received: by 2002:ac8:60d:: with SMTP id d13mr17283069qth.223.1625574908748; 
 Tue, 06 Jul 2021 05:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
 <20210706101209.3034092-8-daniel.vetter@ffwll.ch>
In-Reply-To: <20210706101209.3034092-8-daniel.vetter@ffwll.ch>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 6 Jul 2021 13:34:40 +0100
Message-ID: <CAM0jSHPi8wYbpM6j88fTqGb_PucmRR9T93Z7bieZEEdoV+UFHQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/7] dma-resv: Give the docs a do-over
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Jul 2021 at 11:12, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Specifically document the new/clarified rules around how the shared
> fences do not have any ordering requirements against the exclusive
> fence.
>
> But also document all the things a bit better, given how central
> struct dma_resv to dynamic buffer management the docs have been very
> inadequat.
>
> - Lots more links to other pieces of the puzzle. Unfortunately
>   ttm_buffer_object has no docs, so no links :-(
>
> - Explain/complain a bit about dma_resv_locking_ctx(). I still don't
>   like that one, but fixing the ttm call chains is going to be
>   horrible. Plus we want to plug in real slowpath locking when we do
>   that anyway.
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
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/dma-buf/dma-resv.c |  22 ++++++--
>  include/linux/dma-resv.h   | 104 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 116 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index f26c71747d43..898f8d894bbd 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -48,6 +48,8 @@
>   * write operations) or N shared fences (read operations).  The RCU
>   * mechanism is used to protect read access to fences from locked
>   * write-side updates.
> + *
> + * See struct dma_resv for more details.
>   */
>
>  DEFINE_WD_CLASS(reservation_ww_class);
> @@ -137,7 +139,11 @@ EXPORT_SYMBOL(dma_resv_fini);
>   * @num_fences: number of fences we want to add
>   *
>   * Should be called before dma_resv_add_shared_fence().  Must
> - * be called with obj->lock held.
> + * be called with @obj locked through dma_resv_lock().
> + *
> + * Note that the preallocated slots need to be re-reserved if @obj is un=
locked
> + * at any time before callind dma_resv_add_shared_fence(). This is valid=
ate when

s/callind/calling
s/validate/validated

> + * CONFIG_DEBUG_MUTEXES is enabled.
>   *
>   * RETURNS
>   * Zero for success, or -errno
> @@ -234,8 +240,10 @@ EXPORT_SYMBOL(dma_resv_reset_shared_max);
>   * @obj: the reservation object
>   * @fence: the shared fence to add
>   *
> - * Add a fence to a shared slot, obj->lock must be held, and
> + * Add a fence to a shared slot, @obj must be locked with dma_resv_lock(=
), and
>   * dma_resv_reserve_shared() has been called.
> + *
> + * See also &dma_resv.fence for a discussion of the semantics.
>   */
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *f=
ence)
>  {
> @@ -280,7 +288,9 @@ EXPORT_SYMBOL(dma_resv_add_shared_fence);
>   * @obj: the reservation object
>   * @fence: the shared fence to add

"the exclusive fence", or perhaps "the fence to add to the exclusive slot"?

>   *
> - * Add a fence to the exclusive slot.  The obj->lock must be held.
> + * Add a fence to the exclusive slot. @obj must be locked with dma_resv_=
lock().
> + * Note that this function replaces all fences attached to @obj, see als=
o
> + * &dma_resv.fence_excl for a discussion of the semantics.
>   */
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fen=
ce)
>  {
> @@ -609,9 +619,11 @@ static inline int dma_resv_test_signaled_single(stru=
ct dma_fence *passed_fence)
>   * fence
>   *
>   * Callers are not required to hold specific locks, but maybe hold
> - * dma_resv_lock() already
> + * dma_resv_lock() already.
> + *
>   * RETURNS
> - * true if all fences signaled, else false
> + *
> + * True if all fences signaled, else false.
>   */
>  bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
>  {
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index e1ca2080a1ff..c77fd54d033f 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -62,16 +62,90 @@ struct dma_resv_list {
>
>  /**
>   * struct dma_resv - a reservation object manages fences for a buffer
> - * @lock: update side lock
> - * @seq: sequence count for managing RCU read-side synchronization
> - * @fence_excl: the exclusive fence, if there is one currently
> - * @fence: list of current shared fences
> + *
> + * There are multiple uses for this, with sometimes slightly different r=
ules in
> + * how the fence slots are used.
> + *
> + * One use is to synchronize cross-driver access to a struct dma_buf, ei=
ther for
> + * dynamic buffer management or just to handle implicit synchronization =
between
> + * different users of the buffer in userspace. See &dma_buf.resv for a m=
ore
> + * in-depth discussion.
> + *
> + * The other major use is to manage access and locking within a driver i=
n a
> + * buffer based memory manager. struct ttm_buffer_object is the canonica=
l
> + * example here, since this is were reservation objects originated from.=
 But use

s/were/where

> + * in drivers is spreading and some drivers also manage struct
> + * drm_gem_object with the same scheme.
>   */
>  struct dma_resv {
> +       /**
> +        * @lock:
> +        *
> +        * Update side lock. Don't use directly, instead use the wrapper
> +        * functions like dma_resv_lock() and dma_resv_unlock().
> +        *
> +        * Drivers which use the reservation object to manage memory dyna=
mically
> +        * also use this lock to protect buffer object state like placeme=
nt,
> +        * allocation policies or throughout command submission.
> +        */
>         struct ww_mutex lock;
> +
> +       /**
> +        * @seq:
> +        *
> +        * Sequence count for managing RCU read-side synchronization, all=
ows
> +        * read-only access to @fence_excl and @fence while ensuring we t=
ake a
> +        * consistent snapshot.
> +        */
>         seqcount_ww_mutex_t seq;
>
> +       /**
> +        * @fence_excl:
> +        *
> +        * The exclusive fence, if there is one currently.
> +        *
> +        * There are two was to update this fence:

s/was/ways

> +        *
> +        * - First by calling dma_resv_add_excl_fence(), which replaces a=
ll
> +        *   fences attached to the reservation object. To guarantee that=
 no
> +        *   fences are lost this new fence must signal only after all pr=
evious
> +        *   fences, both shared and exclusive, have signalled. In some c=
ases it/

Random slash at the end

> +        *   is convenient to achieve that by attaching a struct dma_fenc=
e_array
> +        *   with all the new and old fences.
> +        *
> +        * - Alternatively the fence can be set directly, which leaves th=
e
> +        *   shared fences unchanged. To guarantee that no fences are los=
t this
> +        *   new fence must signale only after the previous exclusive fen=
ce has

s/signale/signal

> +        *   singalled. Since the shared fences are staying intact, it is=
 not

s/singalled/signalled

> +        *   necessary to maintain any ordering against those. If semanti=
cally
> +        *   only a new access is added without actually treating the pre=
vious
> +        *   one as a dependency the exclusive fences can be strung toget=
her
> +        *   using struct dma_fence_chain.
> +        *
> +        * Note that actual semantics of what an exclusive or shared fenc=
e mean
> +        * is defined by the user, for reservation objects shared across =
drivers
> +        * see &dma_buf.resv.
> +        */
>         struct dma_fence __rcu *fence_excl;
> +
> +       /**
> +        * @fence:
> +        *
> +        * List of current shared fences.
> +        *
> +        * There are no ordering constraints of shared fences against the
> +        * exclusive fence slot. If a waiter needs to wait for all access=
, it
> +        * has to wait for both set of fences to signal.
> +        *
> +        * A new fence is added by calling dma_resv_add_shared_fence(). S=
ince
> +        * this often needs to be done past the point of no return in com=
mand
> +        * submission it cannot fail, and therefor sufficient slots need =
to be

s/therefor/therefore

> +        * reserved by calling dma_resv_reserve_shared().
> +        *
> +        * Note that actual semantics of what an exclusive or shared fenc=
e mean
> +        * is defined by the user, for reservation objects shared across =
drivers
> +        * see &dma_buf.resv.
> +        */
>         struct dma_resv_list __rcu *fence;
>  };
>
> @@ -98,6 +172,13 @@ static inline void dma_resv_reset_shared_max(struct d=
ma_resv *obj) {}
>   * undefined order, a #ww_acquire_ctx is passed to unwind if a cycle
>   * is detected. See ww_mutex_lock() and ww_acquire_init(). A reservation
>   * object may be locked by itself by passing NULL as @ctx.
> + *
> + * When a die situation is indicated by returning -EDEADLK all locks hel=
d by
> + * @ctx must be unlocked and then dma_resv_lock_slow() called on @obj.
> + *
> + * Unlocked by calling dma_resv_lock().

dma_resv_unlock()

> + *
> + * See also dma_resv_lock_interruptible() for the interruptible variant.
>   */
>  static inline int dma_resv_lock(struct dma_resv *obj,
>                                 struct ww_acquire_ctx *ctx)
> @@ -119,6 +200,12 @@ static inline int dma_resv_lock(struct dma_resv *obj=
,
>   * undefined order, a #ww_acquire_ctx is passed to unwind if a cycle
>   * is detected. See ww_mutex_lock() and ww_acquire_init(). A reservation
>   * object may be locked by itself by passing NULL as @ctx.
> + *
> + * When a die situation is indicated by returning -EDEADLK all locks hel=
d by
> + * @ctx must be unlocked and then dma_resv_lock_slow_interruptible() cal=
led on
> + * @obj.
> + *
> + * Unlocked by calling dma_resv_lock().

dma_resv_unlock()

fwiw,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


>   */
>  static inline int dma_resv_lock_interruptible(struct dma_resv *obj,
>                                               struct ww_acquire_ctx *ctx)
> @@ -134,6 +221,8 @@ static inline int dma_resv_lock_interruptible(struct =
dma_resv *obj,
>   * Acquires the reservation object after a die case. This function
>   * will sleep until the lock becomes available. See dma_resv_lock() as
>   * well.
> + *
> + * See also dma_resv_lock_slow_interruptible() for the interruptible var=
iant.
>   */
>  static inline void dma_resv_lock_slow(struct dma_resv *obj,
>                                       struct ww_acquire_ctx *ctx)
> @@ -167,7 +256,7 @@ static inline int dma_resv_lock_slow_interruptible(st=
ruct dma_resv *obj,
>   * if they overlap with a writer.
>   *
>   * Also note that since no context is provided, no deadlock protection i=
s
> - * possible.
> + * possible, which is also not needed for a trylock.
>   *
>   * Returns true if the lock was acquired, false otherwise.
>   */
> @@ -193,6 +282,11 @@ static inline bool dma_resv_is_locked(struct dma_res=
v *obj)
>   *
>   * Returns the context used to lock a reservation object or NULL if no c=
ontext
>   * was used or the object is not locked at all.
> + *
> + * WARNING: This interface is pretty horrible, but TTM needs it because =
it
> + * doesn't pass the struct ww_acquire_ctx around in some very long callc=
hains.
> + * Everyone else just uses it to check whether they're holding a reserva=
tion or
> + * not.
>   */
>  static inline struct ww_acquire_ctx *dma_resv_locking_ctx(struct dma_res=
v *obj)
>  {
> --
> 2.32.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
