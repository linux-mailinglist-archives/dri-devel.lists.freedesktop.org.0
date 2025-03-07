Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39213A57044
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 19:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3905710E699;
	Fri,  7 Mar 2025 18:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uau6aD9F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7805210E699
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 18:17:25 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Z8ZJL2792z9srd;
 Fri,  7 Mar 2025 19:17:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741371442; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IePPmOmMn8KJIitOVOV3s2iLtbd6ZgsJKHOeXdSwiwA=;
 b=uau6aD9F5+oh2NMxob2D6Gg5hf7asidDx3re/t8GC03fE7MJ6xr7E6CNCVndrHg6yan9jB
 6Z4Z2cYt9jvLWqP7I9vDl0GImOyzG8sfOY63gWKw/tJZDSQnrrNcA/82iWhN0GKW3ohZrt
 BzypSAkmHB5X7pRivubR1ZQR+bsBG18p2fDMFLZ3F4+aEk/XREQQsjkZEdXDuKxx1LkuE6
 4j/5MvKIYe5HaXjlc+mUssHSqt+2m7V/jRy7djeVu7T/lLvpUhqxRF0+FTmWKgvIb8NryD
 ALf9sDzqJNyXuJIEta/X3qMO7HZzwMO5FUAL+zejXC50CmOtVs683e9q5VHy8A==
Message-ID: <81065d3cdf24c3d972e46b39eff1b744c93c7ccc.camel@mailbox.org>
Subject: Re: [PATCH v7 1/3] drm/sched: Adjust outdated docu for run_job()
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 07 Mar 2025 19:17:18 +0100
In-Reply-To: <7502a793-4e92-4bfc-9c87-66bd7fdd88ce@igalia.com>
References: <20250305130551.136682-2-phasta@kernel.org>
 <20250305130551.136682-3-phasta@kernel.org>
 <7502a793-4e92-4bfc-9c87-66bd7fdd88ce@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: bzczxdz9wd1pabtuc3yzuexj5eefyemq
X-MBO-RS-ID: 44e0341c584da62060b
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2025-03-07 at 15:09 -0300, Ma=C3=ADra Canal wrote:
> Hi Philipp,
>=20
> On 05/03/25 10:05, Philipp Stanner wrote:
> > The documentation for drm_sched_backend_ops.run_job() mentions a
> > certain
> > function called drm_sched_job_recovery(). This function does not
> > exist.
> > What's actually meant is drm_sched_resubmit_jobs(), which is by now
> > also
> > deprecated.
> >=20
> > Furthermore, the scheduler expects to "inherit" a reference on the
> > fence
> > from the run_job() callback. This, so far, is also not documented.
> >=20
> > Remove the mention of the removed function.
> >=20
> > Discourage the behavior of drm_sched_backend_ops.run_job() being
> > called
> > multiple times for the same job.
> >=20
> > Document the necessity of incrementing the refcount in run_job().
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 include/drm/gpu_scheduler.h | 34 ++++++++++++++++++++++++++++++-=
-
> > --
> > =C2=A0 1 file changed, 30 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 50928a7ae98e..6381baae8024 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -410,10 +410,36 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0					 struct drm_sched_entity
> > *s_entity);
> > =C2=A0=20
> > =C2=A0=C2=A0	/**
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @run_job: Called to=
 execute the job once all of the
> > dependencies
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * have been resolved.=
=C2=A0 This may be called multiple times,
> > if
> > -	 * timedout_job() has happened and
> > drm_sched_job_recovery()
> > -	 * decides to try it again.
> > +	 * @run_job: Called to execute the job once all of the
> > dependencies
> > +	 * have been resolved.
> > +	 *
> > +	 * @sched_job: the job to run
> > +	 *
> > +	 * The deprecated drm_sched_resubmit_jobs() (called by
> > &struct
> > +	 * drm_sched_backend_ops.timedout_job) can invoke this
> > again with the
> > +	 * same parameters. Using this is discouraged because it
> > violates
> > +	 * dma_fence rules, notably dma_fence_init() has to be
> > called on
> > +	 * already initialized fences for a second time. Moreover,
> > this is
> > +	 * dangerous because attempts to allocate memory might
> > deadlock with
> > +	 * memory management code waiting for the reset to
> > complete.
>=20
> Thanks for adding this paragraph!

You're welcome


>  Also, thanks Christian for providing
> this explanation in v5. It really helped clarify the reasoning behind
> deprecating drm_sched_resubmit_jobs().

I thought a bit more about it the last days and think that you are
right and we definitely have to tell drivers with hardware scheduler
how they can achieve that without using drm_sched_resubmit_jobs().

Unfortunately, I discovered that this is quite complicated and
certainly difficult to do right.

So I'd only feel comfortable writing more docu about that once we got
more input from Christian or someone else who's got a hardware
scheduler about how they're currently doing it


Cheers
P.

>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> > +	 *
> > +	 * TODO: Document what drivers should do / use instead.
> > +	 *
> > +	 * This method is called in a workqueue context - either
> > from the
> > +	 * submit_wq the driver passed through drm_sched_init(),
> > or, if the
> > +	 * driver passed NULL, a separate, ordered workqueue the
> > scheduler
> > +	 * allocated.
> > +	 *
> > +	 * Note that the scheduler expects to 'inherit' its own
> > reference to
> > +	 * this fence from the callback. It does not invoke an
> > extra
> > +	 * dma_fence_get() on it. Consequently, this callback must
> > take a
> > +	 * reference for the scheduler, and additional ones for
> > the driver's
> > +	 * respective needs.
> > +	 *
> > +	 * Return:
> > +	 * * On success: dma_fence the driver must signal once the
> > hardware has
> > +	 * completed the job ("hardware fence").
> > +	 * * On failure: NULL or an ERR_PTR.
> > =C2=A0=C2=A0	 */
> > =C2=A0=C2=A0	struct dma_fence *(*run_job)(struct drm_sched_job
> > *sched_job);
> > =C2=A0=20
>=20

