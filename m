Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55546B20454
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D1910E2EA;
	Mon, 11 Aug 2025 09:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Wkrx+IHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D37B10E2EA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 09:50:32 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c0qd1209Mz9snJ;
 Mon, 11 Aug 2025 11:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1754905829; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6iVG8v6eSQ1zc21xzNcw5sM6wDtRT0rY/n/n6Z+C8FE=;
 b=Wkrx+IHyKbbOJmC8iU8W9ukEvuRhdtur1R9/nZciQk4jzZnE9v6m/rjLcMr/chaQutwRCz
 J5Zq6THUqQhMIvIQjzFaCIuzByqmqrpr1kVyyQHpBOpg0/+mLg1XiUBnEKwgPiYUMUEbKO
 OKMXZk52DcDluNgBOCN+lLmua214RMscl8LZxhPT6j5aaD5NeSl4bdtOWmTKp+u/ETYeVf
 qz7zmGj4rthvYB2Rm57PjLUW88g7uPbmJh5tyiEaz1/P2EsDM3JLJPsPsIFrXmvNlh8DX2
 +00EG2ojp/hGz+srPydbvotFy3694J1yotjdFNuyvTOT6BnkB4kD5515rttmoQ==
Message-ID: <90c89caeb8ec3ac0fcae583df722bad20fa72827.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Extend and update documentation
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Mon, 11 Aug 2025 11:50:22 +0200
In-Reply-To: <9caf8709-91ef-445a-aa4e-aede1899f364@amd.com>
References: <20250724140121.70873-2-phasta@kernel.org>
 <f064a8c305bd2f2c0684251d3cd2470699c28d5e.camel@redhat.com>
 <5fb872d0-9b0a-4398-9472-eea3fdf61940@amd.com>
 <c1f7c4adaa0ac8d1994046436da8eb64bba5e06e.camel@redhat.com>
 <9caf8709-91ef-445a-aa4e-aede1899f364@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 523bad2c5c6675e8adc
X-MBO-RS-META: 6sssz3gmcc77kzux9pogddxatqmafe6o
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

On Thu, 2025-08-07 at 16:15 +0200, Christian K=C3=B6nig wrote:
> On 05.08.25 12:22, Philipp Stanner wrote:
> > On Tue, 2025-08-05 at 11:05 +0200, Christian K=C3=B6nig wrote:
> > > On 24.07.25 17:07, Philipp Stanner wrote:
> > > > > +/**
> > > > > + * DOC: Scheduler Fence Object
> > > > > + *
> > > > > + * The scheduler fence object (&struct drm_sched_fence) encapsul=
ates the whole
> > > > > + * time from pushing the job into the scheduler until the hardwa=
re has finished
> > > > > + * processing it. It is managed by the scheduler. The implementa=
tion provides
> > > > > + * dma_fence interfaces for signaling both scheduling of a comma=
nd submission
> > > > > + * as well as finishing of processing.
> > > > > + *
> > > > > + * The lifetime of this object also follows normal dma_fence ref=
counting rules.
> > > > > + */
> > > >=20
> > > > The relict I'm most unsure about is this docu for the scheduler fen=
ce.
> > > > I know that some drivers are accessing the s_fence, but I strongly
> > > > suspect that this is a) unncessary and b) dangerous.
> > >=20
> > > Which s_fence member do you mean? The one in the job? That should be =
harmless as far as I can see.
> >=20
> > I'm talking about struct drm_sched_fence.
>=20
> Yeah that is necessary for the drivers to know about. We could potentiall=
y abstract it better but we can't really hide it completely.
>=20
> > >=20
> > > > But the original draft from Christian hinted at that. So, @Christia=
n,
> > > > this would be an opportunity to discuss this matter.
> > > >=20
> > > > Otherwise I'd drop this docu section in v2. What users don't know, =
they
> > > > cannot misuse.
> > >=20
> > > I would rather like to keep that to avoid misusing the job as the obj=
ect for tracking the submission lifetime.
> >=20
> > Why would a driver ever want to access struct drm_sched_fence? The
> > driver knows when it signaled the hardware fence, and it knows when its
> > callbacks run_job() and free_job() were invoked.
> >=20
> > I'm open to learn what amdgpu does there and why.
>=20
> The simplest use case is performance optimization. You sometimes have sub=
missions which ideally run with others at the same time.
>=20
> So we have AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES which basically tries t=
o cast a fence to a scheduler fence and then only waits for the dependency =
to be pushed to the HW instead of waiting for it to finish (see amdgpu_cs.c=
).

But the driver recognizes that a certain fence got / gets pushed right
now through backend_ops.run_job(), doesn't it?

>=20
> Another example are gang submissions (where I still have the TODO to actu=
ally fix the code to not crash in an OOM situation).
>=20
> Here we have a gang leader and gang members which are guaranteed to run t=
ogether on the HW at the same time.
>=20
> This works by adding scheduled dependencies to the gang leader so that th=
e scheduler pushes it to the HW only after all gang members have been pushe=
d.
>=20
> The first gang member pushed now triggers a dependency handling which mak=
es sure that no other gang can be pushed until gang leader is pushed as wel=
l.

You mean amdgpu registers callbacks to drm_sched_fence?

>=20
> > > > > +/**
> > > > > + * DOC: Error and Timeout handling
> > > > > + *
> > > > > + * Errors are signaled by using dma_fence_set_error() on the har=
dware fence
> > > > > + * object before signaling it with dma_fence_signal(). Errors ar=
e then bubbled
> > > > > + * up from the hardware fence to the scheduler fence.
> > > > > + *
> > > > > + * The entity allows querying errors on the last run submission =
using the
> > > > > + * drm_sched_entity_error() function which can be used to cancel=
 queued
> > > > > + * submissions in &struct drm_sched_backend_ops.run_job as well =
as preventing
> > > > > + * pushing further ones into the entity in the driver's submissi=
on function.
> > > > > + *
> > > > > + * When the hardware fence doesn't signal within a configurable =
amount of time
> > > > > + * &struct drm_sched_backend_ops.timedout_job gets invoked. The =
driver should
> > > > > + * then follow the procedure described in that callback's docume=
ntation.
> > > > > + *
> > > > > + * (TODO: The timeout handler should probably switch to using th=
e hardware
> > > > > + * fence as parameter instead of the job. Otherwise the handling=
 will always
> > > > > + * race between timing out and signaling the fence).
> > > >=20
> > > > This TODO can probably removed, too. The recently merged
> > > > DRM_GPU_SCHED_STAT_NO_HANG has solved this issue.
> > >=20
> > > No, it only scratched on the surface of problems here.
> > >=20
> > > I'm seriously considering sending a RFC patch to cleanup the job life=
time and implementing this change.
> > >=20
> > > Not necessarily giving the HW fence as parameter to the timeout callb=
ack, but more generally not letting the scheduler depend on driver behavior=
.
> >=20
> > That's rather vague. Regarding this TODO, "racing between timing out
> > and signaling the fence" can now be corrected by the driver. Are there
> > more issues? If so, we want to add a new FIXME for them.
>=20
> Yeah good point. We basically worked around all those issues now.
>=20
> It's just that I still see that we are missing a general concept. E.g. we=
 applied workaround on top of workaround until it didn't crashed any more i=
nstead of saying ok that is the design does that work? Is it valid? etc...

Yes, that seems to have been our destiny for a while now :) :(

What I'm afraid of right now is that with the callbacks vs.
drm_sched_fence we now potentially have several distinct mechanisms for
doing things. The hardware fence is clearly the relevant
synchronization object for telling when a job is completed; yet, we
also have s_fence->finished.

Using it (for what?) is even encouraged by the docu:

        /**
         * @finished: this fence is what will be signaled by the scheduler
         * when the job is completed.
         *
         * When setting up an out fence for the job, you should use
         * this, since it's available immediately upon
         * drm_sched_job_init(), and the fence returned by the driver
         * from run_job() won't be created until the dependencies have
         * resolved.
         */


Anyways.
I think this is a big topic very suitable for our work shop at XDC. I
also have some ideas about paths forward that I want to present.


P.

>=20
> > That said, such an RFC would obviously be great. We can discuss the
> > paragraph above there, if you want.
>=20
> I will try to hack something together. Not necessarily complete but it sh=
ould show the direction.
>=20
> Christian.
>=20
> >=20
> >=20
> > Regards
> > P.

