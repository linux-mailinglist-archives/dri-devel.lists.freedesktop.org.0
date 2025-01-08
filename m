Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FFA05B96
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 13:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A6288CBF;
	Wed,  8 Jan 2025 12:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OaqYWIxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A861E10E89D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 12:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736339230;
 bh=ztTaysNRAqM8QjRmeBqdWBGG+xlao0MGxI53Ma67uQs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OaqYWIxt46dn3ixb6CwNoTPV5iSNm8odiWYyH/Ac4B5eBSdEa8jw2DhcJgfAECQoz
 g05Otis1+uZTcoqpFa8KYqrWsB/DKolLDhhwLm7Sk9MyxMnrUqhX4yNgPC+N/9rlFW
 s7anNF8wWMCeTMsudPNcBxSqUTkdTnpDT9U17GxNPkzYu7qF9LYpvPWt34J8Xq0jLe
 LurJai6f+gWbuwiZKkK49BV6dU+bFGqdtp6SVHAAg1cNg9Jie1JK0svZaaOdjOiCPr
 DIYBy6xcheg6oiAFk4R+4PR8jg0piGcWDThHm4G5WGF7OFjeoP3le0CtJIP60Xcus2
 9rK8orJ5YpH1w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E117717E1567;
 Wed,  8 Jan 2025 13:27:09 +0100 (CET)
Date: Wed, 8 Jan 2025 13:27:05 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, Philipp Stanner <pstanner@redhat.com>, Frank
 Binns <Frank.Binns@imgtec.com>
Subject: Re: [RFC 01/14] drm/sched: Delete unused update_job_credits
Message-ID: <20250108132705.35d8f2a2@collabora.com>
In-Reply-To: <Z344gwtwvqdXW1N_@pollux>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-2-tursulin@igalia.com>
 <Z344gwtwvqdXW1N_@pollux>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Wed, 8 Jan 2025 09:34:11 +0100
Danilo Krummrich <dakr@redhat.com> wrote:

> On Mon, Dec 30, 2024 at 04:52:46PM +0000, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >=20
> > No driver is using the update_job_credits() schduler vfunc
> > so lets remove it.
> >=20
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> =20
>=20
> (+ Boris)
>=20
> AFAIR the panthor folks asked for this. I assume they never actually ende=
d up
> using it? Unless they plan to use it,

+Frank

That was for the PowerVR driver, and it doesn't seem it's been hooked
up there. I don't think we'll ever need it in panthor, so

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

>=20
> Acked-by: Danilo Krummrich <dakr@kernel.org>
>=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Danilo Krummrich <dakr@redhat.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Philipp Stanner <pstanner@redhat.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 13 -------------
> >  include/drm/gpu_scheduler.h            | 13 -------------
> >  2 files changed, 26 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 7ce25281c74c..1734c17aeea5 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -64,12 +64,6 @@
> >   * credit limit, the job won't be executed. Instead, the scheduler wil=
l wait
> >   * until the credit count has decreased enough to not overflow its cre=
dit limit.
> >   * This implies waiting for previously executed jobs.
> > - *
> > - * Optionally, drivers may register a callback (update_job_credits) pr=
ovided by
> > - * struct drm_sched_backend_ops to update the job's credits dynamicall=
y. The
> > - * scheduler executes this callback every time the scheduler considers=
 a job for
> > - * execution and subsequently checks whether the job fits the schedule=
r's credit
> > - * limit.
> >   */
> > =20
> >  #include <linux/wait.h>
> > @@ -133,13 +127,6 @@ static bool drm_sched_can_queue(struct drm_gpu_sch=
eduler *sched,
> >  	if (!s_job)
> >  		return false;
> > =20
> > -	if (sched->ops->update_job_credits) {
> > -		s_job->credits =3D sched->ops->update_job_credits(s_job);
> > -
> > -		drm_WARN(sched, !s_job->credits,
> > -			 "Jobs with zero credits bypass job-flow control.\n");
> > -	}
> > -
> >  	/* If a job exceeds the credit limit, truncate it to the credit limit
> >  	 * itself to guarantee forward progress.
> >  	 */
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 95e17504e46a..e2e6af8849c6 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -476,19 +476,6 @@ struct drm_sched_backend_ops {
> >           * and it's time to clean it up.
> >  	 */
> >  	void (*free_job)(struct drm_sched_job *sched_job);
> > -
> > -	/**
> > -	 * @update_job_credits: Called when the scheduler is considering this
> > -	 * job for execution.
> > -	 *
> > -	 * This callback returns the number of credits the job would take if
> > -	 * pushed to the hardware. Drivers may use this to dynamically update
> > -	 * the job's credit count. For instance, deduct the number of credits
> > -	 * for already signalled native fences.
> > -	 *
> > -	 * This callback is optional.
> > -	 */
> > -	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
> >  };
> > =20
> >  /**
> > --=20
> > 2.47.1
> >  =20
>=20

