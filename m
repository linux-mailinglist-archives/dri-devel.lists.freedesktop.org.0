Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954DB360A9E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 15:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920746E517;
	Thu, 15 Apr 2021 13:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A2A6E516
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 13:37:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j5so22380461wrn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jlzpWqSDfbhJuZAgj+0XEEwMss/imkxxzLL0+p4EIwE=;
 b=XxKEOctMSGJC7RQtjb3g88eCjqhTjayrt9c6c/T8c7tF3b00e6gS2bdlFyL4B/O5cX
 2pX9uASbHa9cE88iTdk2RyqbM2jDsZtFVqH7NDRX+GSlGy0kWBPZz94qTkhU8dgRMafk
 c0kpnNqJqqGRJEBlslET2alj6d0bGHVWRf8i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jlzpWqSDfbhJuZAgj+0XEEwMss/imkxxzLL0+p4EIwE=;
 b=IXDzZhw8NovVtx8CZoRSjSINnIDD5uOwmu4YQvlXL/94dTvmn1ngfW1mjVLUiCkEni
 6VhW1nfA7asoyU393s2Al+AFZc5+ESg6q0tVpApvWDPRuMOX5EiFVzTir9U0qUf+uD+z
 Fu8WwHDOmerSOJMlxN+A1z53ySUxMbglyiLdKEhxIJXHcFb9j6sZ/c/OOWteCNTYYZgF
 luD/wgQGBqGmSIr0PS9YhquO8xhqshirb//UEORQre/2GBbkoPdtd3Pmw+ozjyNJXZ0p
 2isQUCKEGHyedPBmS1FHhGI/wdHoaBX9wXWyjQRUZw7DM2cwq/rjqRG+P1whkLzm8yx3
 YwCQ==
X-Gm-Message-State: AOAM5330AdiIt3o6dxWcRG+Au4WMX8YtIn4Qw2mqOC3kmVzhRn7gn3gh
 jg742Zz0xdvopGRNaX4zr06JXQ==
X-Google-Smtp-Source: ABdhPJwuw95u2hb5tiEiUsQ18aqEAp0zm6GfjfJdMY/C4OxI3Z4ivK+912BF+QeXqggMlNgg/iTSFQ==
X-Received: by 2002:a5d:6605:: with SMTP id n5mr3533686wru.116.1618493867774; 
 Thu, 15 Apr 2021 06:37:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a15sm3194412wrr.53.2021.04.15.06.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 06:37:46 -0700 (PDT)
Date: Thu, 15 Apr 2021 15:37:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC] Cross-driver ww transaction lock lists
Message-ID: <YHhBqNKukDlZ2Cld@phenom.ffwll.local>
References: <62e5b25ce7e22633c09fb0242a69d268b3b45595.camel@linux.intel.com>
 <d5ad41b9-0248-285b-8873-b8010e7c8c27@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5ad41b9-0248-285b-8873-b8010e7c8c27@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 09:57:06AM +0200, Christian K=F6nig wrote:
> =

> =

> Am 13.04.21 um 09:50 schrieb Thomas Hellstr=F6m:
> > Hi!
> > =

> > During the dma_resv conversion of the i915 driver, we've been using ww
> > transaction lock lists to keep track of ww_mutexes that are locked
> > during the transaction so that they can be batch unlocked at suitable
> > locations. Including also the LMEM/VRAM eviction we've ended up with
> > two static lists per transaction context; one typically unlocked at the
> > end of transaction and one initialized before and unlocked after each
> > buffer object validate. This enables us to do sleeping locking at
> > eviction and keep objects locked on the eviction list until we
> > eventually succeed allocating memory (modulo minor flaws of course).
> > =

> > It would be beneficial with the i915 TTM conversion to be able to
> > introduce a similar functionality that would work in ttm but also
> > cross-driver in, for example move_notify. It would also be beneficial
> > to be able to put any dma_resv ww mutex on the lists, and not require
> > it to be embedded in a particular object type.
> > =

> > I started scetching on some utilities for this. For TTM, for example,
> > the idea would be to pass a list head for the ww transaction lock list
> > in the ttm_operation_ctx. A function taking a ww_mutex could then
> > either attach a grabbed lock to the list for batch unlocking, or be
> > responsible for unlocking when the lock's scope is exited. It's also
> > possible to create sublists if so desired. I believe the below would be
> > sufficient to cover the i915 functionality.
> > =

> > Any comments and suggestions appreciated!
> =

> ah yes Daniel and I haven been discussing something like this for years.
> =

> I also came up with rough implementation, but we always ran into lifetime
> issues.
> =

> In other words the ww_mutexes which are on the list would need to be kept
> alive until unlocked.
> =

> Because of this we kind of backed up and said we would need this on the G=
EM
> level instead of working with dma_resv objects.

Yeah there's a few funny concerns here that make this awkward:
- For simplicity doing these helpers at the gem level should make things a
  bit easier, because then we have a standard way to drop the reference.
  It does mean that the only thing you can lock like this are gem objects,
  but I think that's fine. At least for a first cut.

- This is a bit awkward for vmwgfx, but a) Zack has mentioned he's looking
  into adopting gem bo internally to be able to drop a pile of code and
  stop making vmwgfx the only special-case we have b) drivers which don't
  need this won't need this, so should be fine.

  The other awkward thing I guess is that ttm would need to use the
  embedded kref from the gem bo, but that should be transparent I think.

- Next up is dma-buf: For i915 we'd like to do the same eviction trick
  also through p2p dma-buf callbacks, so that this works the same as
  eviction/reservation within a gpu. But for these internal bo you might
  not have a dma-buf, so we can't just lift the trick to the dma-buf
  level. But I think if we pass e.g. a struct list_head and a callback to
  unreference/unlock all the buffers in there to the exporter, plus
  similar for the slowpath lock, then that should be doable without
  glorious layering inversions between dma-buf and gem.

  I think for dma-buf it should even be ok if this requires that we
  allocate an entire structure with kmalloc or something, allocating
  memory while holding dma_resv is ok.

- Another reason for doing it at the gem level is that the SoC drivers
  should probably use dma_resv more, so having some competent cs/eviction
  helpers derived from what we have in ttm would be nice I think.

But also I never got anywhere with anything, since like Christian said if
we just link up ww_mutex, or dma_resv, it always dies on some lifetime
handling issues.
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > 8<------------------------------------------------------
> > =

> > #ifndef _TRANSACTION_LOCKLIST_H_
> > #define _TRANSACTION_LOCKLIST_H_
> > =

> > struct trans_lockitem;
> > =

> > /**
> >   * struct trans_locklist_ops - Ops structure for the ww locklist
> > functionality.
> >   *
> >   * Typically a const struct trans_locklist_ops is defined for each type
> > that
> >   * embeds a struct trans_lockitem, or hav a struct trans_lockitem
> > pointing
> >   * at it using the private pointer. It can be a buffer object,
> > reservation
> >   * object, a single ww_mutex or even a sublist of trans_lockitems.
> >   */
> > struct trans_locklist_ops {
> > 	/**
> > 	 * slow_lock: Slow lock to relax the transaction. Only used by
> > 	 * a contending lock item.
> > 	 * @item: The struct trans_lockitem to lock
> > 	 * @intr: Whether to lock interruptible
> > 	 *
> > 	 * Return: -ERESTARTSYS: Hit a signal when relaxing,
> > 	 * -EAGAIN, relaxing succesful, but the contending lock
> > 	 * remains unlocked.
> > 	 */
> > 	int (*slow_lock) (struct trans_lockitem *item, bool intr);
> > =

> > 	/**
> > 	 * unlock: Unlock.
> > 	 * @item: The struct trans_lockitem to unlock.
> > 	 */
> > 	void (*unlock) (struct trans_lockitem *item);
> > =

> > 	/**
> > 	 * unlock: Unlock.
> > 	 * @item: The struct trans_lockitem to put. This function may
> > be NULL.
> > 	 */
> > 	void (*put) (struct trans_lockitem *item);
> > };
> > =

> > /**
> >   * struct trans_lockitem
> >   * @ops: Pointer to an Ops structure for this lockitem.
> >   * @link: List link for the transaction locklist.
> >   * @private: Private info.
> >   * @relax_unlock: Unlock contending lock after relaxation since it is
> >   * likely not needed after a transaction restart.
> >   *
> >   * A struct trans_lockitem typically represents a single lock, but is
> >   * generic enough to represent a sublist of locks. It can either be
> >   * embedded, or allocated on demand. A kmem_cache might be beneficial.
> >   */
> > struct trans_lockitem {
> > 	const struct trans_locklist_ops *ops;
> > 	struct list_head link;
> > 	u32 relax_unlock:1;
> > 	void *private;
> > };
> > =

> > /* unlock example */
> > static inline void trans_unlock_put_all(struct list_head *list)
> > {
> > 	struct trans_lockitem *lock, *next;
> > =

> > 	list_for_each_entry_safe(lock, next, typeof(*lock), link) {
> > 		lock->ops->unlock(lock);
> > 		list_del_init(&lock->link);
> > 		if (lock->ops_put)
> > 			lock->ops->put(lock);
> > 	}
> > }
> > =

> > /* Backoff example */
> > static inline int __must_check trans_backoff(struct list_head *list,
> > bool intr,
> > 					     struct trans_lockitem
> > *contending)
> > {
> > 	int ret =3D 0;
> > =

> > 	trans_unlock_put_all(list);
> > 	if (contending) {
> > 		ret =3D contending->ops->slow_lock(contending, intr);
> > 		if (!ret && contending->relax_unlock)
> > 			contending->unlock(contending);
> > 		if (ret =3D=3D -EAGAIN)
> > 			ret =3D 0;
> > 		contending->ops->put(contending);
> > 	}
> > =

> > 	return ret;
> > }
> > 		=

> > 		=

> > #endif _TRANSACTION_LOCKLIST_
> > =

> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
