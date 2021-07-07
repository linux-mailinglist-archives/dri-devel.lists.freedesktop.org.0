Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4453C3BE566
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A3B6E836;
	Wed,  7 Jul 2021 09:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1E26E830
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:13:49 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 t24-20020a9d7f980000b029046f4a1a5ec4so1622620otp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 02:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G7im4bRGKzbQON7Fr2kf3d93cjiM61szoaUr+uecDvk=;
 b=KXm0giKuVuNt2MJYMmvR9uQBnBQpKIEIWB80h3M8dfyPiaINrFSs02L/u2SfGjJBvF
 SgqUUH8Hll2TULOn5UfXPr6a7JtqRu/K9+SH67MTVRduE/+9Vjdw3pJnD82L4DwlGCWb
 LfhvSoAvfAwaXE8twyy03T3ePDdgKCukPpd8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G7im4bRGKzbQON7Fr2kf3d93cjiM61szoaUr+uecDvk=;
 b=sWbCee9mEjRtQ3GB+z+yxq/fuJw/9QXsKnUXQiX8tY8E2AJEdSEkqKAceQ1mj6Grfz
 XgKU9XWy3ijyQg2e1SXVJzOoJeDPkEbLmhqE81G581cckgH/wobhRSiqABvF3x9696Bf
 ULELX/4YxPtclvZ5wMhYCV3wdphsSU7v1OjibD+bVT45CE3aVflycK7ByLg2xM0STPyO
 JtV11ghI1TX0qxFb5gLlYpHgX2kz63wGfR5+aBtTWsVGR2Fnb9//CUka2hyweVBmFeyO
 HctdrWxPHUY3J8SuzOGf1ffwv+BHDig81FyHeO4dq882Mgahat4hZhJEkWk5li4OIZ35
 TGSg==
X-Gm-Message-State: AOAM533YKCn2g2l+4XLVWb2ijppAc1czxk34nnW77SralpKIPGGAyGqy
 gVYY4Vim8K/FKAlicUGpHuq8bQ+ohdaFO11c3HxM7Q==
X-Google-Smtp-Source: ABdhPJzFMNtDWqxinjRc1BO0D233nfdg62k2pXd+Z+F9X0n97hiaUlnpsX7t1iEyoZ3bQ/SJ+UbYxfzzqNRlDbX1HEQ=
X-Received: by 2002:a05:6830:1f19:: with SMTP id
 u25mr15203294otg.303.1625649228643; 
 Wed, 07 Jul 2021 02:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
 <20210706101209.3034092-8-daniel.vetter@ffwll.ch>
 <280c31ae-0d9f-0548-11ea-5b25546741ae@gmail.com>
In-Reply-To: <280c31ae-0d9f-0548-11ea-5b25546741ae@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Jul 2021 11:13:37 +0200
Message-ID: <CAKMK7uGADhd_2iPOXVogsNiizSkgbi2KcxNwZFwmyvD6dAVXNA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 7/7] dma-resv: Give the docs a do-over
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 7, 2021 at 10:06 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 06.07.21 um 12:12 schrieb Daniel Vetter:
> > Specifically document the new/clarified rules around how the shared
> > fences do not have any ordering requirements against the exclusive
> > fence.
> >
> > But also document all the things a bit better, given how central
> > struct dma_resv to dynamic buffer management the docs have been very
> > inadequat.
> >
> > - Lots more links to other pieces of the puzzle. Unfortunately
> >    ttm_buffer_object has no docs, so no links :-(
> >
> > - Explain/complain a bit about dma_resv_locking_ctx(). I still don't
> >    like that one, but fixing the ttm call chains is going to be
> >    horrible. Plus we want to plug in real slowpath locking when we do
> >    that anyway.
> >
> > - Main part of the patch is some actual docs for struct dma_resv.
> >
> > Overall I think we still have a lot of bad naming in this area (e.g.
> > dma_resv.fence is singular, but contains the multiple shared fences),
> > but I think that's more indicative of how the semantics and rules are
> > just not great.
> >
> > Another thing that's real awkard is how chaining exclusive fences
> > right now means direct dma_resv.exclusive_fence pointer access with an
> > rcu_assign_pointer. Not so great either.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >   drivers/dma-buf/dma-resv.c |  22 ++++++--
> >   include/linux/dma-resv.h   | 104 +++++++++++++++++++++++++++++++++++-=
-
> >   2 files changed, 116 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index f26c71747d43..898f8d894bbd 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -48,6 +48,8 @@
> >    * write operations) or N shared fences (read operations).  The RCU
> >    * mechanism is used to protect read access to fences from locked
> >    * write-side updates.
> > + *
> > + * See struct dma_resv for more details.
> >    */
> >
> >   DEFINE_WD_CLASS(reservation_ww_class);
> > @@ -137,7 +139,11 @@ EXPORT_SYMBOL(dma_resv_fini);
> >    * @num_fences: number of fences we want to add
> >    *
> >    * Should be called before dma_resv_add_shared_fence().  Must
> > - * be called with obj->lock held.
> > + * be called with @obj locked through dma_resv_lock().
> > + *
> > + * Note that the preallocated slots need to be re-reserved if @obj is =
unlocked
> > + * at any time before callind dma_resv_add_shared_fence(). This is val=
idate when
> > + * CONFIG_DEBUG_MUTEXES is enabled.
> >    *
> >    * RETURNS
> >    * Zero for success, or -errno
> > @@ -234,8 +240,10 @@ EXPORT_SYMBOL(dma_resv_reset_shared_max);
> >    * @obj: the reservation object
> >    * @fence: the shared fence to add
> >    *
> > - * Add a fence to a shared slot, obj->lock must be held, and
> > + * Add a fence to a shared slot, @obj must be locked with dma_resv_loc=
k(), and
> >    * dma_resv_reserve_shared() has been called.
> > + *
> > + * See also &dma_resv.fence for a discussion of the semantics.
> >    */
> >   void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence=
 *fence)
> >   {
> > @@ -280,7 +288,9 @@ EXPORT_SYMBOL(dma_resv_add_shared_fence);
> >    * @obj: the reservation object
> >    * @fence: the shared fence to add
> >    *
> > - * Add a fence to the exclusive slot.  The obj->lock must be held.
> > + * Add a fence to the exclusive slot. @obj must be locked with dma_res=
v_lock().
> > + * Note that this function replaces all fences attached to @obj, see a=
lso
> > + * &dma_resv.fence_excl for a discussion of the semantics.
> >    */
> >   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *=
fence)
> >   {
> > @@ -609,9 +619,11 @@ static inline int dma_resv_test_signaled_single(st=
ruct dma_fence *passed_fence)
> >    * fence
> >    *
> >    * Callers are not required to hold specific locks, but maybe hold
> > - * dma_resv_lock() already
> > + * dma_resv_lock() already.
> > + *
> >    * RETURNS
> > - * true if all fences signaled, else false
> > + *
> > + * True if all fences signaled, else false.
> >    */
> >   bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
> >   {
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index e1ca2080a1ff..c77fd54d033f 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -62,16 +62,90 @@ struct dma_resv_list {
> >
> >   /**
> >    * struct dma_resv - a reservation object manages fences for a buffer
> > - * @lock: update side lock
> > - * @seq: sequence count for managing RCU read-side synchronization
> > - * @fence_excl: the exclusive fence, if there is one currently
> > - * @fence: list of current shared fences
> > + *
> > + * There are multiple uses for this, with sometimes slightly different=
 rules in
> > + * how the fence slots are used.
> > + *
> > + * One use is to synchronize cross-driver access to a struct dma_buf, =
either for
> > + * dynamic buffer management or just to handle implicit synchronizatio=
n between
> > + * different users of the buffer in userspace. See &dma_buf.resv for a=
 more
> > + * in-depth discussion.
> > + *
> > + * The other major use is to manage access and locking within a driver=
 in a
> > + * buffer based memory manager. struct ttm_buffer_object is the canoni=
cal
> > + * example here, since this is were reservation objects originated fro=
m. But use
> > + * in drivers is spreading and some drivers also manage struct
> > + * drm_gem_object with the same scheme.
>
> I would still make that even harder, e.g. mentioning that you run into
> use after free and the resulting memory corruption if you don't obey the
> rules.

Hm I think that's best documented in dma_buf.resv kerneldoc, pointing
at the rules here and explaining what can go wrong on the other driver
if we just overwrite fences and breakt the DAG. I'll add something
there.
-Daniel

>
> Apart from that with the spelling stuff pointed out by others fixed the
> patch is Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Regards,
> Christian.
>
> >    */
> >   struct dma_resv {
> > +     /**
> > +      * @lock:
> > +      *
> > +      * Update side lock. Don't use directly, instead use the wrapper
> > +      * functions like dma_resv_lock() and dma_resv_unlock().
> > +      *
> > +      * Drivers which use the reservation object to manage memory dyna=
mically
> > +      * also use this lock to protect buffer object state like placeme=
nt,
> > +      * allocation policies or throughout command submission.
> > +      */
> >       struct ww_mutex lock;
> > +
> > +     /**
> > +      * @seq:
> > +      *
> > +      * Sequence count for managing RCU read-side synchronization, all=
ows
> > +      * read-only access to @fence_excl and @fence while ensuring we t=
ake a
> > +      * consistent snapshot.
> > +      */
> >       seqcount_ww_mutex_t seq;
> >
> > +     /**
> > +      * @fence_excl:
> > +      *
> > +      * The exclusive fence, if there is one currently.
> > +      *
> > +      * There are two was to update this fence:
> > +      *
> > +      * - First by calling dma_resv_add_excl_fence(), which replaces a=
ll
> > +      *   fences attached to the reservation object. To guarantee that=
 no
> > +      *   fences are lost this new fence must signal only after all pr=
evious
> > +      *   fences, both shared and exclusive, have signalled. In some c=
ases it
> > +      *   is convenient to achieve that by attaching a struct dma_fenc=
e_array
> > +      *   with all the new and old fences.
> > +      *
> > +      * - Alternatively the fence can be set directly, which leaves th=
e
> > +      *   shared fences unchanged. To guarantee that no fences are los=
t this
> > +      *   new fence must signale only after the previous exclusive fen=
ce has
> > +      *   singalled. Since the shared fences are staying intact, it is=
 not
> > +      *   necessary to maintain any ordering against those. If semanti=
cally
> > +      *   only a new access is added without actually treating the pre=
vious
> > +      *   one as a dependency the exclusive fences can be strung toget=
her
> > +      *   using struct dma_fence_chain.
> > +      *
> > +      * Note that actual semantics of what an exclusive or shared fenc=
e mean
> > +      * is defined by the user, for reservation objects shared across =
drivers
> > +      * see &dma_buf.resv.
> > +      */
> >       struct dma_fence __rcu *fence_excl;
> > +
> > +     /**
> > +      * @fence:
> > +      *
> > +      * List of current shared fences.
> > +      *
> > +      * There are no ordering constraints of shared fences against the
> > +      * exclusive fence slot. If a waiter needs to wait for all access=
, it
> > +      * has to wait for both set of fences to signal.
> > +      *
> > +      * A new fence is added by calling dma_resv_add_shared_fence(). S=
ince
> > +      * this often needs to be done past the point of no return in com=
mand
> > +      * submission it cannot fail, and therefor sufficient slots need =
to be
> > +      * reserved by calling dma_resv_reserve_shared().
> > +      *
> > +      * Note that actual semantics of what an exclusive or shared fenc=
e mean
> > +      * is defined by the user, for reservation objects shared across =
drivers
> > +      * see &dma_buf.resv.
> > +      */
> >       struct dma_resv_list __rcu *fence;
> >   };
> >
> > @@ -98,6 +172,13 @@ static inline void dma_resv_reset_shared_max(struct=
 dma_resv *obj) {}
> >    * undefined order, a #ww_acquire_ctx is passed to unwind if a cycle
> >    * is detected. See ww_mutex_lock() and ww_acquire_init(). A reservat=
ion
> >    * object may be locked by itself by passing NULL as @ctx.
> > + *
> > + * When a die situation is indicated by returning -EDEADLK all locks h=
eld by
> > + * @ctx must be unlocked and then dma_resv_lock_slow() called on @obj.
> > + *
> > + * Unlocked by calling dma_resv_lock().
> > + *
> > + * See also dma_resv_lock_interruptible() for the interruptible varian=
t.
> >    */
> >   static inline int dma_resv_lock(struct dma_resv *obj,
> >                               struct ww_acquire_ctx *ctx)
> > @@ -119,6 +200,12 @@ static inline int dma_resv_lock(struct dma_resv *o=
bj,
> >    * undefined order, a #ww_acquire_ctx is passed to unwind if a cycle
> >    * is detected. See ww_mutex_lock() and ww_acquire_init(). A reservat=
ion
> >    * object may be locked by itself by passing NULL as @ctx.
> > + *
> > + * When a die situation is indicated by returning -EDEADLK all locks h=
eld by
> > + * @ctx must be unlocked and then dma_resv_lock_slow_interruptible() c=
alled on
> > + * @obj.
> > + *
> > + * Unlocked by calling dma_resv_lock().
> >    */
> >   static inline int dma_resv_lock_interruptible(struct dma_resv *obj,
> >                                             struct ww_acquire_ctx *ctx)
> > @@ -134,6 +221,8 @@ static inline int dma_resv_lock_interruptible(struc=
t dma_resv *obj,
> >    * Acquires the reservation object after a die case. This function
> >    * will sleep until the lock becomes available. See dma_resv_lock() a=
s
> >    * well.
> > + *
> > + * See also dma_resv_lock_slow_interruptible() for the interruptible v=
ariant.
> >    */
> >   static inline void dma_resv_lock_slow(struct dma_resv *obj,
> >                                     struct ww_acquire_ctx *ctx)
> > @@ -167,7 +256,7 @@ static inline int dma_resv_lock_slow_interruptible(=
struct dma_resv *obj,
> >    * if they overlap with a writer.
> >    *
> >    * Also note that since no context is provided, no deadlock protectio=
n is
> > - * possible.
> > + * possible, which is also not needed for a trylock.
> >    *
> >    * Returns true if the lock was acquired, false otherwise.
> >    */
> > @@ -193,6 +282,11 @@ static inline bool dma_resv_is_locked(struct dma_r=
esv *obj)
> >    *
> >    * Returns the context used to lock a reservation object or NULL if n=
o context
> >    * was used or the object is not locked at all.
> > + *
> > + * WARNING: This interface is pretty horrible, but TTM needs it becaus=
e it
> > + * doesn't pass the struct ww_acquire_ctx around in some very long cal=
lchains.
> > + * Everyone else just uses it to check whether they're holding a reser=
vation or
> > + * not.
> >    */
> >   static inline struct ww_acquire_ctx *dma_resv_locking_ctx(struct dma_=
resv *obj)
> >   {
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
