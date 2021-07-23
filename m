Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6670C3D3519
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 09:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED5C6F45D;
	Fri, 23 Jul 2021 07:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5A26F45D;
 Fri, 23 Jul 2021 07:16:51 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id r18so1423430iot.4;
 Fri, 23 Jul 2021 00:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xe2OINBH+BRr0c0B6Rjuunf1y/CF6ftNbio56e+sO/U=;
 b=B/E7k4toRTdG51Xn1+b8uQblMIAYTeDSYwFtqlEV9w+f2GnxRubcqAxTzyIeWJN8mH
 O6n61pgcCQYYe9DBzfjgPrMspAwBHD985Z2CH1soCmAVawStI9gQczByWPtOiU+HCdU3
 B6PgMeVBSNKhRW94qwYABJ+F06HZE2vfgi7TX85mWBI1t8aS7+gbGRMjp9DCqtzZPsx0
 +AGDC23HR5qLj09CNuvI0JYT3mjgLs+VaFIVVo2EeyKQ2KNwM/2oDYzHZkV/2JVE42L8
 LSCrIvYdben9raJIiSfC43nD6SoE6NEJ7xDPibMhfShJAr/GNAQWg67gD1byv3Xnjk4O
 Zd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xe2OINBH+BRr0c0B6Rjuunf1y/CF6ftNbio56e+sO/U=;
 b=ivEYNOrEFnRMSGN49x2xBb+Hs7v8Mzgad8d9aozRUHrbigCCrPnX43W+RY6nOtHN+N
 yFt5tijG2gyFkd7oO6SHzpAwQZg32uMwvGVioNo+IOzyrrVbrMDAbAp9C5sqBzy13TC4
 KPPd9Wx3J0sVXK88vDqp2OsQMGxfPrIz3c2ckhwH7ewbSrKG0xmkxIP7Ww0c3IhSXiRA
 gYFlradJB5Z6dsBj6J+Dzu8D7n2H2dJoEI1TWB/Z8AQASIbWMxPI3/HwB8NOwZPHaNO8
 u+fe8qzjGDDgQjM49lq783qq+qV2GJTfeYkW0YWNLIMP2/bne2I/EzTEz26GMT+3X+2d
 HHNQ==
X-Gm-Message-State: AOAM533mrCxQNsEmLja3uSW/OjnYVdMQbNVaPfH1ouQpvDhcZoNfN+Xa
 Bbe7lYTGefFLqjaZgp4mNlU=
X-Google-Smtp-Source: ABdhPJyIuQBU8O+4oz9gwGN1TLTCzxwB5DCKMsiP+uv75Gp3fk/x11JK7NIqOzv5tmMQkd+M+WZgbA==
X-Received: by 2002:a02:666d:: with SMTP id l45mr3089958jaf.0.1627024610836;
 Fri, 23 Jul 2021 00:16:50 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id w10sm15622116ilo.17.2021.07.23.00.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 00:16:50 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailauth.nyi.internal (Postfix) with ESMTP id 9C8A227C0054;
 Fri, 23 Jul 2021 03:16:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 23 Jul 2021 03:16:49 -0400
X-ME-Sender: <xms:4Gz6YKJPK3nkWfQ4Geob8UDl6rxghgbcCBcYaE4I5AsrOKW3ksf4xg>
 <xme:4Gz6YCKQSq4OwcSULkMIKh3wz9UsIoV_0pgSXS7N2pX7gHQ8sWkcXFtxamWL8HVIN
 pglgYAvrz3QxMV8OQ>
X-ME-Received: <xmr:4Gz6YKtC9oV0cEIqPE0hemsadw3evFS6KYBhguqd84lE7ahl_IMVdXmE-328zA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepgedugeeftdejtdffvdelleetfeduvdekgfehjeeuudejheefleekteejgedt
 fefgnecuffhomhgrihhnpehffhiflhhlrdgthhenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
 shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
 hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:4Gz6YPZwR069ffaPF6qhZ1SRoGyrRiurkAcN6zUNEw8wnZU8j5IJng>
 <xmx:4Gz6YBbh8zYyKBTFS47YY4YIHXVVE0_3vKScH7aqwxqY0k_9bhpLZQ>
 <xmx:4Gz6YLA2P5ebpABLcjMU7NYIARdy_qoPX4YTtg5PlcScZVoAbHYSEA>
 <xmx:4Wz6YFpL2rMhdkiJLKmiCjOF9eUuXLcqZBwi7EC5yR-v0k4DLOvvGXn17-A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:16:48 -0400 (EDT)
Date: Fri, 23 Jul 2021 15:16:42 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, Dave Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
Message-ID: <YPps2hoA+PXQGqQZ@boqun-archlinux>
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-2-desmondcheongzx@gmail.com>
 <YPlKkvelm/mcnCj0@phenom.ffwll.local>
 <YPmJEYrnB0j17cZV@boqun-archlinux>
 <CAKMK7uGSc_YMf2e=oA23KeAvC8i_pqJBU82v8oRGfnwsT41WLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGSc_YMf2e=oA23KeAvC8i_pqJBU82v8oRGfnwsT41WLQ@mail.gmail.com>
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

On Thu, Jul 22, 2021 at 09:02:41PM +0200, Daniel Vetter wrote:
> On Thu, Jul 22, 2021 at 6:00 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Thu, Jul 22, 2021 at 12:38:10PM +0200, Daniel Vetter wrote:
> > > On Thu, Jul 22, 2021 at 05:29:27PM +0800, Desmond Cheong Zhi Xi wrote:
> > > > Inside drm_is_current_master, using the outer drm_device.master_mutex
> > > > to protect reads of drm_file.master makes the function prone to creating
> > > > lock hierarchy inversions. Instead, we can use the
> > > > drm_file.master_lookup_lock that sits at the bottom of the lock
> > > > hierarchy.
> > > >
> > > > Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_auth.c | 9 +++++----
> > > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > > index f00354bec3fb..9c24b8cc8e36 100644
> > > > --- a/drivers/gpu/drm/drm_auth.c
> > > > +++ b/drivers/gpu/drm/drm_auth.c
> > > > @@ -63,8 +63,9 @@
> > > >
> > > >  static bool drm_is_current_master_locked(struct drm_file *fpriv)
> > > >  {
> > > > -   lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
> > > > -
> > > > +   /* Either drm_device.master_mutex or drm_file.master_lookup_lock
> > > > +    * should be held here.
> > > > +    */
> > >
> > > Disappointing that lockdep can't check or conditions for us, a
> > > lockdep_assert_held_either would be really neat in some cases.
> > >
> >
> > The implementation is not hard but I don't understand the usage, for
> > example, if we have a global variable x, and two locks L1 and L2, and
> > the function
> >
> >         void do_something_to_x(void)
> >         {
> >                 lockdep_assert_held_either(L1, L2);
> >                 x++;
> >         }
> >
> > and two call sites:
> >
> >         void f(void)
> >         {
> >                 lock(L1);
> >                 do_something_to_x();
> >                 unlock(L1);
> >         }
> >
> >         void g(void)
> >         {
> >                 lock(L2);
> >                 do_something_to_x();
> >                 unlock(L2);
> >         }
> >
> > , wouldn't it be racy if f() and g() called by two threads at the same
> > time? Usually I would expect there exists a third synchronazition
> > mechanism (say M), which synchronizes the calls to f() and g(), and we
> > put M in the lockdep_assert_held() check inside do_something_to_x()
> > like:
> >
> >         void do_something_to_x(void)
> >         {
> >                 lockdep_assert_held_once(M);
> >                 x++;
> >         }
> >
> > But of course, M may not be a lock, so we cannot put the assert there.
> >
> > My cscope failed to find ->master_lookup_lock in -rc2 and seems it's not
> > introduced in the patchset either, could you point me the branch this
> > patchset is based on, so that I could understand this better, and maybe
> > come up with a solution? Thanks ;-)
> 
> The use case is essentially 2 nesting locks, and only the innermost is
> used to update a field. So when you only read this field, it's safe if
> either of these two locks are held. Essentially this is a read/write lock
> type of thing, except for various reasons the two locks might not be of
> the same type (like here where the write lock is a mutex, but the read
> lock is a spinlock).
> 
> It's a bit like the rcu_derefence macro where it's ok to either be in a
> rcu_read_lock() section, or holding the relevant lock that's used to
> update the value. We do _not_ have two different locks that allow writing
> to the same X.
> 
> Does that make it clearer what's the use-case here?
> 
> In an example:
> 
> void * interesting_pointer.
> 
> do_update_interesting_pointer()
> {
> 	mutex_lock(A);
> 	/* do more stuff to prepare things */
> 	spin_lock(B);
> 	interesting_pointer = new_value;
> 	spin_unlock(B);
> 	mutex_unlock(A);
> }
> 
> read_interesting_thing_locked()
> {
> 	lockdep_assert_held_either(A, B);
> 
> 	return interesting_pointer->thing;
> }
> 
> read_interesting_thing()
> {
> 	int thing;
> 	spin_lock(B);
> 	thing = interesting_pointer->thing;
> 	spin_unlock(B);
> 
> 	return B;
> }
> 
> spinlock might also be irqsafe here if this can be called from irq
> context.
> 

Make sense, so we'd better also provide lockdep_assert_held_both(), I
think, to use it at the update side, something as below:


	/*
	 * lockdep_assert_held_{both,either}().
	 * 
	 * Sometimes users can use a combination of two locks to
	 * implement a rwlock-like lock, for example, say we have
	 * locks L1 and L2, and we only allow updates when two locks
	 * both held like:
	 * 
	 * update()
	 * {
	 *	lockdep_assert_held_both(L1, L2);
	 *	x++; // update x
	 * }
	 *
	 * while for read-only accesses, either lock suffices (since
	 * holding either lock means others cannot hold both, so readers
	 * serialized with the updaters):
	 *
	 * read()
	 * {
	 * 	lockdep_assert_held_either(L1, L2);
	 *	r = x; // read x
	 * }
	 */

	#define lockdep_assert_held_both(l1, l2)	do {			\
			WARN_ON_ONCE(debug_locks &&				\
					(!lockdep_is_held(l1) ||		\
					 !lockdep_is_held(l2)));		\
	} while (0)

	#define lockdep_assert_held_either(l1, l2)	do {			\
			WARN_ON_ONCE(debug_locks &&				\
					(!lockdep_is_held(l1) &&		\
					 !lockdep_is_held(l2)));		\
	} while (0)

Still need sometime to think through this (e.g. on whether this it the
best implementation).

Regards,
Boqun

> Cheers, Daniel
> 
> > Regards,
> > Boqun
> >
> > > Adding lockdep folks, maybe they have ideas.
> > >
> > > On the patch:
> > >
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >
> > > >     return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> > > >  }
> > > >
> > > > @@ -82,9 +83,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
> > > >  {
> > > >     bool ret;
> > > >
> > > > -   mutex_lock(&fpriv->minor->dev->master_mutex);
> > > > +   spin_lock(&fpriv->master_lookup_lock);
> > > >     ret = drm_is_current_master_locked(fpriv);
> > > > -   mutex_unlock(&fpriv->minor->dev->master_mutex);
> > > > +   spin_unlock(&fpriv->master_lookup_lock);
> > > >
> > > >     return ret;
> > > >  }
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
