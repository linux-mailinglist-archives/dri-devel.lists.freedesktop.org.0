Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91095118522
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8816E88B;
	Tue, 10 Dec 2019 10:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462B26E88B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:31:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so19479344wru.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 02:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rC5Us7HUeQB9RHFvDyX2mXnUkyg5KT9RbAWpTNmucuY=;
 b=XQEzswg3sZD69f8wAmbq6TE3wFfgHF4Ke9aY1ZkdcXPP3gdjFKtxCI6+5pY5wfVR9X
 9lPIFk3zLmMK/Cp5JbYGkwHtVzHSjP50OuS0Os39zMek5a4zmWhFjgBmeuoaf2MMEU6C
 XfQGzMbHaQyiZhbJ8oj2kv+4KxECnuAcqTpgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rC5Us7HUeQB9RHFvDyX2mXnUkyg5KT9RbAWpTNmucuY=;
 b=swiEDrVPu2cwnAI4zyBT2zQBAgUr6gGZhiB11MFL7J3i0aFgWovQskCYqVPlReNkl6
 CTgLFgLpshzvAZ9sNijAh0+BkTBeWWdD5Viili/se8zE37bGLHCbcpUN6lIVb3VoGK3b
 1Iuiq7GuJZmnDdDyMd5wltCTgud8MgAe5B+qvYyjFdHTDP5WfWhPlukua1rfJ7v8K4z+
 pJDJVoKxcOCc0tGbXrKZfFBUL1RVl+Kpkv00pW9km9GIO4OvCUBm0CnKp1AsypPvCIJX
 vafenF7V5RBhVbbmi16AcBDIgGGuVPRgHHlDUAG57RDdSrwkUBIg8yjz7n+vB5sz9U8Y
 2X7Q==
X-Gm-Message-State: APjAAAUcWfxkazjzQHo8ZJoyi5OsG17we1dui+5CfIJo1H3Vtz+MqXbq
 EpAaZtAK14+i9lyu76yfZ1zrVQ==
X-Google-Smtp-Source: APXvYqyE9xIRbubSl5N5F7yQWYQJTh7DLxY1aRqmqNKT+Fn4cv1LTSZz37V0oWTUVSTnoA+JfHfGSw==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr2356095wrl.190.1575973900750; 
 Tue, 10 Dec 2019 02:31:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id f1sm2769998wru.6.2019.12.10.02.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 02:31:40 -0800 (PST)
Date: Tue, 10 Dec 2019 11:31:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/atomc: Update docs around locking and commit
 sequencing
Message-ID: <20191210103138.GS624164@phenom.ffwll.local>
References: <20191204100011.859468-1-daniel.vetter@ffwll.ch>
 <20191205160224.GB1914185@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205160224.GB1914185@ulmo>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 05, 2019 at 05:02:24PM +0100, Thierry Reding wrote:
> On Wed, Dec 04, 2019 at 11:00:11AM +0100, Daniel Vetter wrote:
> > Both locking and especially sequencing of nonblocking commits have
> > evolved a lot. The details are all there, but I noticed that the big
> > picture and connections have fallen behind a bit. Apply polish.
> > 
> > Motivated by some review discussions with Thierry.
> > 
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/drm-kms.rst       | 11 ++++++-
> >  drivers/gpu/drm/drm_atomic.c        | 10 ++++---
> >  drivers/gpu/drm/drm_atomic_helper.c | 46 ++++++++++++++++++-----------
> >  include/drm/drm_atomic.h            | 13 ++++++--
> >  4 files changed, 56 insertions(+), 24 deletions(-)
> 
> Hi Daniel,
> 
> "drm/atomic" in the subject. A couple more minor things I noticed below.
> 
> > 
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> > index c68588ce4090..b9330343d1bc 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -260,7 +260,8 @@ Taken all together there's two consequences for the atomic design:
> >    drm_connector_state <drm_connector_state>` for connectors. These are the only
> >    objects with userspace-visible and settable state. For internal state drivers
> >    can subclass these structures through embeddeding, or add entirely new state
> > -  structures for their globally shared hardware functions.
> > +  structures for their globally shared hardware functions, see :c:type:`struct
> > +  drm_private_state<drm_private_state>`.
> >  
> >  - An atomic update is assembled and validated as an entirely free-standing pile
> >    of structures within the :c:type:`drm_atomic_state <drm_atomic_state>`
> > @@ -269,6 +270,14 @@ Taken all together there's two consequences for the atomic design:
> >    to the driver and modeset objects. This way rolling back an update boils down
> >    to releasing memory and unreferencing objects like framebuffers.
> >  
> > +Locking of atomic state structures is internally using :c:type:`struct
> > +drm_modeset_lock <drm_modeset_lock>`. As a general rule the locking shouldn't be
> > +exposed to drivers, instead the right locks should be automatically acquired by
> > +any function that duplicates or peeks into a state, like e.g.
> > +:c:func:`drm_atomic_get_crtc_state()`.  Locking only protects the software data
> > +structure, ordering of committing state changes to hardware is sequenced using
> > +:c:type:`struct drm_crtc_commit <drm_crtc_commit>`.
> > +
> >  Read on in this chapter, and also in :ref:`drm_atomic_helper` for more detailed
> >  coverage of specific topics.
> >  
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index a351a9a39530..5b4787e33f0d 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -688,10 +688,12 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
> >   * associated state struct &drm_private_state.
> >   *
> >   * Similar to userspace-exposed objects, private state structures can be
> > - * acquired by calling drm_atomic_get_private_obj_state(). Since this function
> > - * does not take care of locking, drivers should wrap it for each type of
> > - * private state object they have with the required call to drm_modeset_lock()
> > - * for the corresponding &drm_modeset_lock.
> > + * acquired by calling drm_atomic_get_private_obj_state(). This also takes care
> > + * of locking, hence drivers should not have a need to call drm_modeset_lock()
> > + * directly. Sequence of the actual hardware state commit is not handled,
> > + * drivers might need to keep track of struct drm_crtc_commit within subclassed
> > + * structure of &drm_private_state as necessary, e.g. similar to
> > + * &drm_plane_state.commit. See also &drm_atomic_state.fake_commit.
> >   *
> >   * All private state structures contained in a &drm_atomic_state update can be
> >   * iterated using for_each_oldnew_private_obj_in_state(),
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 711801b9d4f1..10d62f726b22 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1827,17 +1827,21 @@ EXPORT_SYMBOL(drm_atomic_helper_commit);
> >  /**
> >   * DOC: implementing nonblocking commit
> >   *
> > - * Nonblocking atomic commits have to be implemented in the following sequence:
> > + * Nonblocking atomic commits should use struct &drm_crtc_commit to sequence
> > + * different operations against each another. Locks, especially struct
> > + * &drm_modeset_lock, should not be held in worker threads or any other
> > + * asynchronous context used to commit the hardware state.
> >   *
> > - * 1. Run drm_atomic_helper_prepare_planes() first. This is the only function
> > - * which commit needs to call which can fail, so we want to run it first and
> > + * drm_atomic_helper_commit() implements the recommended sequence for
> > + * nonblocking commits, using drm_atomic_helper_setup_commit() internally:
> > + *
> > + * 1. Run drm_atomic_helper_prepare_planes(). Since this can fail and we
> > + * need to propagate out of memory/VRAM errors to userspace, it must be called
> >   * synchronously.
> >   *
> >   * 2. Synchronize with any outstanding nonblocking commit worker threads which
> > - * might be affected the new state update. This can be done by either cancelling
> > - * or flushing the work items, depending upon whether the driver can deal with
> > - * cancelled updates. Note that it is important to ensure that the framebuffer
> > - * cleanup is still done when cancelling.
> > + * might be affected the new state update. This is handled by
> 
> "affected _by_ the new state update"?
> 
> > + * drm_atomic_helper_setup_commit().
> >   *
> >   * Asynchronous workers need to have sufficient parallelism to be able to run
> >   * different atomic commits on different CRTCs in parallel. The simplest way to
> > @@ -1848,21 +1852,29 @@ EXPORT_SYMBOL(drm_atomic_helper_commit);
> >   * must be done as one global operation, and enabling or disabling a CRTC can
> >   * take a long time. But even that is not required.
> >   *
> > + * IMPORTANT: A &drm_atomic_state update for multiple CRTCs is sequenced
> > + * against all CRTCs therein. Therefor for atomic state updates which only flip
> 
> I think "therefor" has a slightly different meaning than "therefore",
> and I think you actually want the latter in this case.
> 
> > + * planes the driver must not get the struct &drm_crtc_state of unrelated CRTCs
> > + * in its atomic check codee: This would prevent committing of atomic updates to
> 
> "code"
> 
> > + * multiple CRTCs in parallel. In general, adding additional state structures
> > + * should be avoided as much as possible, because this reduces parallism in
> 
> "parallelism"
> 
> > + * (nonblocking) commits, both due to locking and due to commit sequencing
> > + * requirements.
> > + *
> >   * 3. The software state is updated synchronously with
> >   * drm_atomic_helper_swap_state(). Doing this under the protection of all modeset
> > - * locks means concurrent callers never see inconsistent state. And doing this
> > - * while it's guaranteed that no relevant nonblocking worker runs means that
> > - * nonblocking workers do not need grab any locks. Actually they must not grab
> > - * locks, for otherwise the work flushing will deadlock.
> > + * locks means concurrent callers never see inconsistent state. Note that commit
> > + * workers do not hold any locks, their access is only coordinated through
> 
> I stumbled across this a couple of times when reading it. I think it
> becomes clearer when you replace the comma by a colon:
> 
> 	Note that commit workers do not hold any locks: their access is only
> 	coordinated through ordering.
> 
> Or perhaps replace the comma with "and"?
> 
> Other than that, looks good to me:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>

All your comments applied and patch merged, thanks for your review.
-Daniel

> 
> > + * ordering. If workers would access state only through the pointers in the
> > + * free-standing state objects (currently not the case for any driver) then even
> > + * multiple pending commits could be in-flight at the same time.
> >   *
> >   * 4. Schedule a work item to do all subsequent steps, using the split-out
> >   * commit helpers: a) pre-plane commit b) plane commit c) post-plane commit and
> >   * then cleaning up the framebuffers after the old framebuffer is no longer
> > - * being displayed.
> > - *
> > - * The above scheme is implemented in the atomic helper libraries in
> > - * drm_atomic_helper_commit() using a bunch of helper functions. See
> > - * drm_atomic_helper_setup_commit() for a starting point.
> > + * being displayed. The scheduled work should synchronize against other workers
> > + * using the &drm_crtc_commit infrastructure as needed. See
> > + * drm_atomic_helper_setup_commit() for more details.
> >   */
> >  
> >  static int stall_checks(struct drm_crtc *crtc, bool nonblock)
> > @@ -2085,7 +2097,7 @@ EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
> >   *
> >   * This function waits for all preceeding commits that touch the same CRTC as
> >   * @old_state to both be committed to the hardware (as signalled by
> > - * drm_atomic_helper_commit_hw_done) and executed by the hardware (as signalled
> > + * drm_atomic_helper_commit_hw_done()) and executed by the hardware (as signalled
> >   * by calling drm_crtc_send_vblank_event() on the &drm_crtc_state.event).
> >   *
> >   * This is part of the atomic helper support for nonblocking commits, see
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index b6c73fd9f55a..5923819dcd68 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -60,8 +60,8 @@
> >   * 	wait for flip_done		<----
> >   * 	clean up atomic state
> >   *
> > - * The important bit to know is that cleanup_done is the terminal event, but the
> > - * ordering between flip_done and hw_done is entirely up to the specific driver
> > + * The important bit to know is that &cleanup_done is the terminal event, but the
> > + * ordering between &flip_done and &hw_done is entirely up to the specific driver
> >   * and modeset state change.
> >   *
> >   * For an implementation of how to use this look at
> > @@ -92,6 +92,9 @@ struct drm_crtc_commit {
> >  	 * commit is sent to userspace, or when an out-fence is singalled. Note
> >  	 * that for most hardware, in most cases this happens after @hw_done is
> >  	 * signalled.
> > +	 *
> > +	 * Completion of this stage is signalled implicitly by calling
> > +	 * drm_crtc_send_vblank_event() on &drm_crtc_state.event.
> >  	 */
> >  	struct completion flip_done;
> >  
> > @@ -107,6 +110,9 @@ struct drm_crtc_commit {
> >  	 * Note that this does not need to include separately reference-counted
> >  	 * resources like backing storage buffer pinning, or runtime pm
> >  	 * management.
> > +	 *
> > +	 * Drivers should call drm_atomic_helper_commit_hw_done() to signal
> > +	 * completion of this stage.
> >  	 */
> >  	struct completion hw_done;
> >  
> > @@ -118,6 +124,9 @@ struct drm_crtc_commit {
> >  	 * a vblank wait completed it might be a bit later. This completion is
> >  	 * useful to throttle updates and avoid hardware updates getting ahead
> >  	 * of the buffer cleanup too much.
> > +	 *
> > +	 * Drivers should call drm_atomic_helper_commit_cleanup_done() to signal
> > +	 * completion of this stage.
> >  	 */
> >  	struct completion cleanup_done;
> >  
> > -- 
> > 2.24.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
