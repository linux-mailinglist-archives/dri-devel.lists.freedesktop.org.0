Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B394EA1D427
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 11:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF3110E303;
	Mon, 27 Jan 2025 10:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Bt7ucWY4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375A310E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 10:11:16 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YhPMN6zNgz9t1k;
 Mon, 27 Jan 2025 11:11:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1737972673; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gt+hpx3fL9KABJQAsLZPNp8jRyhO1DPzEjSPUMbuguE=;
 b=Bt7ucWY4J4rV8FMDCbOF8xPg9f8qKnL3DTLYbZNsUsfii853SPjnfoWBTebYV+5srrvDmU
 cyK/aOyd6SuiODWdcUjEcleiAfvzGpzLKoeh87iQTR2SbOAYqVmAd48Fu/NSPDPUCKeWb7
 P6gIx+45JG5Z1f+o4JUxzve6Dirdx93jSZLYat3AwixPGMmZG6dow5HjUsmSUUuAH7EjZv
 QPjiosQysRzHt1hazfvZomlw79FxGljTbsaLgvk1gfuOBss9E6eLXo9y5dgxC+CYymGiTi
 37Faza2p4pXaqcVzWW/Iezyksef7VLYedYh3NSjob3z3gnlZVjD5TrqqlhmzFg==
Message-ID: <0197b888d1b3daa1f9c70b0965ee75d67b514fc9.camel@mailbox.org>
Subject: Re: [PATCH 3/5] drm/sched: stop passing non struct drm_device to
 drm_err() and friends
From: Philipp Stanner <phasta@mailbox.org>
To: Jani Nikula <jani.nikula@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Date: Mon, 27 Jan 2025 11:11:08 +0100
In-Reply-To: <87msfgbfjz.fsf@intel.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
 <fe441dd1469d2b03e6b2ff247078bdde2011c6e3.1737644530.git.jani.nikula@intel.com>
 <Z5KeZnJ4HOxs1wuk@phenom.ffwll.local> <87msfgbfjz.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 1csptqmko7ba7napuizxe1ep95q7wiqe
X-MBO-RS-ID: c02a3a93349471d024a
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

nit: In drm/sched, we start with an upper case -> "drm/sched: Stop [=E2=80=
=A6]"

On Fri, 2025-01-24 at 13:46 +0200, Jani Nikula wrote:
> On Thu, 23 Jan 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> > On Thu, Jan 23, 2025 at 05:09:10PM +0200, Jani Nikula wrote:
> > > The expectation is that the struct drm_device based logging
> > > helpers get
> > > passed an actual struct drm_device pointer rather than some
> > > random
> > > struct pointer where you can dereference the ->dev member.
> > >=20
> > > Convert drm_err(sched, ...) to dev_err(sched->dev, ...) and
> > > similar. This matches current usage, as struct drm_device is not
> > > available, but drops "[drm]" or "[drm] *ERROR*" prefix from
> > > logging.
> > >=20
> > > Unfortunately, there's no dev_WARN_ON(), so the conversion is not
> > > exactly the same.
> > >=20
> > > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >=20
> > For the two previous patches just dev_ makes sense since they're
> > just
> > platform drivers, but for drm/sched I wonder whether it wouldn't be
> > better
> > to switch from struct device * to struct drm_device * instead. I
> > guess
> > might be best to leave that decision to scheduler folks.
>=20
> I had a very brief look, and it seemed like struct drm_device isn't
> passed around in sched. If use of struct drm_device is preferred, I'm
> not the best person to figure out how to do that.

The @dev field in drm_sched_init() is only ever used for debug prints.
If we want to improve those prints further and we need a drm_dev for
that, I'd say we can implement that ourselves once the need arises.


>  But the abuse of the
> drm_err() and friends macros needs to stop.
>=20
> > Anyway on the series and with that caveat:
> >=20
> > Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Acked-by: Philipp Stanner <phasta@kernel.org>

One more nice-to-have / nit below

>=20
> Thanks,
> Jani.
>=20
> >=20
> >=20
> > >=20
> > > ---
> > >=20
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > Cc: "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > ---
> > > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c |=C2=A0 2 +-
> > > =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 | 20 +++++++=
++++-------
> > > --
> > > =C2=A02 files changed, 12 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > index 69bcf0e99d57..e29af71d4b5c 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -92,7 +92,7 @@ int drm_sched_entity_init(struct
> > > drm_sched_entity *entity,
> > > =C2=A0		 * the lowest priority available.
> > > =C2=A0		 */
> > > =C2=A0		if (entity->priority >=3D sched_list[0]->num_rqs)
> > > {
> > > -			drm_err(sched_list[0], "entity with out-
> > > of-bounds priority:%u num_rqs:%u\n",
> > > +			dev_err(sched_list[0]->dev, "entity with
> > > out-of-bounds priority:%u num_rqs:%u\n",

Since you're touching that line already, could you improve that
string's formatting a bit?

"entity has out-of-bounds priority: %u. num_rqs: %u\n"


Thx,
P.

> > > =C2=A0				entity->priority, sched_list[0]-
> > > >num_rqs);
> > > =C2=A0			entity->priority =3D max_t(s32, (s32)
> > > sched_list[0]->num_rqs - 1,
> > > =C2=A0						 (s32)
> > > DRM_SCHED_PRIORITY_KERNEL);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index a48be16ab84f..d1c1f22fd1db 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -103,9 +103,9 @@ static u32 drm_sched_available_credits(struct
> > > drm_gpu_scheduler *sched)
> > > =C2=A0{
> > > =C2=A0	u32 credits;
> > > =C2=A0
> > > -	drm_WARN_ON(sched, check_sub_overflow(sched-
> > > >credit_limit,
> > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > atomic_read(&sched->credit_count),
> > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &credits));
> > > +	WARN_ON(check_sub_overflow(sched->credit_limit,
> > > +				=C2=A0=C2=A0 atomic_read(&sched-
> > > >credit_count),
> > > +				=C2=A0=C2=A0 &credits));
> > > =C2=A0
> > > =C2=A0	return credits;
> > > =C2=A0}
> > > @@ -130,9 +130,11 @@ static bool drm_sched_can_queue(struct
> > > drm_gpu_scheduler *sched,
> > > =C2=A0	/* If a job exceeds the credit limit, truncate it to the
> > > credit limit
> > > =C2=A0	 * itself to guarantee forward progress.
> > > =C2=A0	 */
> > > -	if (drm_WARN(sched, s_job->credits > sched-
> > > >credit_limit,
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0 "Jobs may not exceed the credit limit,
> > > truncate.\n"))
> > > +	if (s_job->credits > sched->credit_limit) {
> > > +		dev_WARN(sched->dev,
> > > +			 "Jobs may not exceed the credit limit,
> > > truncate.\n");
> > > =C2=A0		s_job->credits =3D sched->credit_limit;
> > > +	}
> > > =C2=A0
> > > =C2=A0	return drm_sched_available_credits(sched) >=3D s_job-
> > > >credits;
> > > =C2=A0}
> > > @@ -790,7 +792,7 @@ int drm_sched_job_init(struct drm_sched_job
> > > *job,
> > > =C2=A0		 * or worse--a blank screen--leave a trail in
> > > the
> > > =C2=A0		 * logs, so this can be debugged easier.
> > > =C2=A0		 */
> > > -		drm_err(job->sched, "%s: entity has no rq!\n",
> > > __func__);
> > > +		dev_err(job->sched->dev, "%s: entity has no
> > > rq!\n", __func__);
> > > =C2=A0		return -ENOENT;
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -1280,7 +1282,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > > *sched,
> > > =C2=A0	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > > =C2=A0		/* This is a gross violation--tell drivers what
> > > the=C2=A0 problem is.
> > > =C2=A0		 */
> > > -		drm_err(sched, "%s: num_rqs cannot be greater
> > > than DRM_SCHED_PRIORITY_COUNT\n",
> > > +		dev_err(sched->dev, "%s: num_rqs cannot be
> > > greater than DRM_SCHED_PRIORITY_COUNT\n",
> > > =C2=A0			__func__);
> > > =C2=A0		return -EINVAL;
> > > =C2=A0	} else if (sched->sched_rq) {
> > > @@ -1288,7 +1290,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > > *sched,
> > > =C2=A0		 * fine-tune their DRM calling order, and return
> > > all
> > > =C2=A0		 * is good.
> > > =C2=A0		 */
> > > -		drm_warn(sched, "%s: scheduler already
> > > initialized!\n", __func__);
> > > +		dev_warn(sched->dev, "%s: scheduler already
> > > initialized!\n", __func__);
> > > =C2=A0		return 0;
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -1343,7 +1345,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > > *sched,
> > > =C2=A0Out_check_own:
> > > =C2=A0	if (sched->own_submit_wq)
> > > =C2=A0		destroy_workqueue(sched->submit_wq);
> > > -	drm_err(sched, "%s: Failed to setup GPU scheduler--out
> > > of memory\n", __func__);
> > > +	dev_err(sched->dev, "%s: Failed to setup GPU scheduler--
> > > out of memory\n", __func__);
> > > =C2=A0	return -ENOMEM;
> > > =C2=A0}
> > > =C2=A0EXPORT_SYMBOL(drm_sched_init);
> > > --=20
> > > 2.39.5
> > >=20
>=20

