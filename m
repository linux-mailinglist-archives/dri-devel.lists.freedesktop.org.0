Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339BEA4D948
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB65E10E546;
	Tue,  4 Mar 2025 09:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="SkyKF0MN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68BB10E546
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:52:48 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z6WFS4n4Bz9swL;
 Tue,  4 Mar 2025 10:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741081964; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IumFkgj5RXyBW8xkXtlbiJZO0EHE6ceqR/JFdelIahs=;
 b=SkyKF0MNJcEVTZH/QGvnEM8iI5WauYugSv5Tx4AdTgHTQ4KuFv0J6k2FmrYh1OgcgQyPGO
 j6+fnhmiGuaZWagC3HlX0LkVtWuWnK8NRFbu2yUjHA/qcOD6s6QMuve1h3BmDI/zwX800W
 TcKdTDRzJ2cVdRwBs9rBomin9fqk2Kk0LG1W9X32ast76npXJV617VJ0uGkGQAEWKPTWdI
 HuOvVuRsqtMsa7FOToR3zCYi2cOwrlA3quJyrlEEW0aRn51GflMHlwiwt1sSSsSEGzjCST
 TrqTY8+geC5g9LOiJG8jSme0iKIc5BM1b62WDCxSClSVQSPNUfz8V6j2I5ptBQ==
Message-ID: <6c44f2140ebaf9a3b82fa186b939baa2a605556f.camel@mailbox.org>
Subject: Re: [PATCH v5 2/3] drm/sched: Adjust outdated docu for run_job()
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>
Cc: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, phasta@kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 04 Mar 2025 10:52:39 +0100
In-Reply-To: <688b5665-496d-470d-9835-0c6eadfa5569@gmail.com>
References: <20250220112813.87992-2-phasta@kernel.org>
 <20250220112813.87992-4-phasta@kernel.org>
 <12c53d41-21c4-443d-a572-fd22c3cc56ad@igalia.com>
 <1457e985f88e02cd04b2152d2468a65b7a513e63.camel@mailbox.org>
 <cfef8bd7-f335-4796-9d4f-93197bb3fc2d@igalia.com>
 <Z7yFpZMCFINhEht7@cassiopeiae> <Z7ydaE4JmNcvzjJw@lstrano-desk.jf.intel.com>
 <688b5665-496d-470d-9835-0c6eadfa5569@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 7246108e307df21d31a
X-MBO-RS-META: sxa17rsmkj3ri8xf4pyc99hdpc73t5p3
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

On Tue, 2025-03-04 at 10:05 +0100, Christian K=C3=B6nig wrote:
> Am 24.02.25 um 17:25 schrieb Matthew Brost:
> > On Mon, Feb 24, 2025 at 03:43:49PM +0100, Danilo Krummrich wrote:
> > > On Mon, Feb 24, 2025 at 10:29:26AM -0300, Ma=C3=ADra Canal wrote:
> > > > On 20/02/25 12:28, Philipp Stanner wrote:
> > > > > On Thu, 2025-02-20 at 10:28 -0300, Ma=C3=ADra Canal wrote:
> > > > > > Would it be possible to add a comment that `run_job()` must
> > > > > > check if
> > > > > > `s_fence->finished.error` is different than 0? If you
> > > > > > increase the
> > > > > > karma
> > > > > > of a job and don't check for `s_fence->finished.error`, you
> > > > > > might run
> > > > > > a
> > > > > > cancelled job.
> > > > > s_fence->finished is only signaled and its error set once the
> > > > > hardware
> > > > > fence got signaled; or when the entity is killed.
> > > > If you have a timeout, increase the karma of that job with
> > > > `drm_sched_increase_karma()` and call
> > > > `drm_sched_resubmit_jobs()`, the
> > > > latter will flag an error in the dma fence. If you don't check
> > > > for it in
> > > > `run_job()`, you will run the guilty job again.
> > > Considering that drm_sched_resubmit_jobs() is deprecated I don't
> > > think we need
> > > to add this hint to the documentation; the drivers that are still
> > > using the API
> > > hopefully got it right.
> > >=20
> > > > I'm still talking about `drm_sched_resubmit_jobs()`, because
> > > > I'm
> > > > currently fixing an issue in V3D with the GPU reset and we
> > > > still use
> > > > `drm_sched_resubmit_jobs()`. I read the documentation of
> > > > `run_job()` and
> > > > `timeout_job()` and the information I commented here (which was
> > > > crucial
> > > > to fix the bug) wasn't available there.
> > > Well, hopefully... :-)
> > >=20
> > > > `drm_sched_resubmit_jobs()` was deprecated in 2022, but Xe
> > > > introduced a
> > > > new use in 2023
> > > Yeah, that's a bit odd, since Xe relies on a firmware scheduler
> > > and uses a 1:1
> > > scheduler - entity setup. I'm a bit surprised Xe does use this
> > > function.
> > >=20
> > To clarify Xe's usage. We use this function to resubmit jobs after
> > device reset for queues which had nothing to do with the device
> > reset.
> > In practice, a device should never occur as we have per-queue
> > resets in
> > our harwdare. If a per-queue reset occurs, we ban the queue rather
> > than
> > doing a resubmit.
>=20
> That's still invalid usage. Re-submitting jobs by the scheduler is a
> completely broken concept in general.
>=20
> What you can do is to re-create the queue content after device reset
> inside your driver, but *never* use drm_sched_resubmit_jobs() for
> that.
>=20
> >=20
> > Matt=C2=A0=20
> >=20
> > > > for example. The commit that deprecated it just
> > > > mentions AMD's case, but do we know if the function works as
> > > > expected
> > > > for the other users?
> > > I read the comment [1] you're referring to differently. It says
> > > that
> > > "Re-submitting jobs was a concept AMD came up as cheap way to
> > > implement recovery
> > > after a job timeout".
> > >=20
> > > It further explains that "there are many problem with the
> > > dma_fence
> > > implementation and requirements. Either the implementation is
> > > risking deadlocks
> > > with core memory management or violating documented
> > > implementation details of
> > > the dma_fence object", which doesn't give any hint to me that the
> > > conceptual
> > > issues are limited to amdgpu.
> > >=20
> > > > For V3D, it does. Also, we need to make it clear which
> > > > are the dma fence requirements that the functions violates.
> > > This I fully agree with, unfortunately the comment does not
> > > explain what's the
> > > issue at all.
> > >=20
> > > While I do think I have a vague idea of what's the potential
> > > issue with this
> > > approach, I think it would be way better to get Christian, as the
> > > expert for DMA
> > > fence rules to comment on this.
> > >=20
> > > @Christian: Can you please shed some light on this?
> > >=20
> > > > If we shouldn't use `drm_sched_resubmit_jobs()`, would it be
> > > > possible to
> > > > provide a common interface for job resubmission?
> > > I wonder why this question did not come up when
> > > drm_sched_resubmit_jobs() was
> > > deprecated two years ago, did it?
>=20
> Exactly that's the point why drm_sched_resubmit_jobs() was
> deprecated.
>=20
> It is not possible to provide a common interface to re-submit jobs
> (with switching of hardware dma_fences) without breaking dma_fence
> rules.
>=20
> The idea behind the scheduler is that you pack your submission state
> into a job object which as soon as it is picked up is converted into
> a hardware dma_fence for execution. This hardware dma_fence is then
> the object which represents execution of the submission on the
> hardware.
>=20
> So on re-submission you either use the same dma_fence multiple times
> which results in a *horrible* kref_init() on an already initialized
> reference (It's a wonder that this doesn't crashes all the time in
> amdgpu). Or you do things like starting to allocate memory while the
> memory management potentially waits for the reset to complete.
>=20
> What we could do is to provide a helper for the device drivers in the
> form of an iterator which gives you all the hardware fences the
> scheduler is waiting for, but in general device drivers should have
> this information by themselves.

What we should work out in this patch series first is some lines of
documentation telling the drivers what the current state is and what
they should do.

Maira is not OK with me just removing mention of
drm_sched_resubmit_jobs().

So the question is what they should do instead and thus, what, e.g.,
amdgpu does instead. See also below

>=20
> > >=20
> > > Anyway, let's shed some light on the difficulties with
> > > drm_sched_resubmit_jobs()
> > > and then we can figure out how we can do better.
> > >=20
> > > I think it would also be interesting to know how amdgpu handles
> > > job from
> > > unrelated entities being discarded by not re-submitting them when
> > > a job from
> > > another entitiy hangs the HW ring.
>=20
> Quite simple this case never happens in the first place.
>=20
> When you have individual queues for each process (e.g. like Xe and
> upcomming amdgpu HW generation)

If amdgpu's *current* HW generation does not have individual queues,
why then can it never happen currently?

How does amdgpu make sure that jobs from innocent entities get
rescheduled after a GPU reset? AFAIK AMD cards currently have 4 run
queues, which are shared by many entities by many processes.

P.

>  you should always be able to reset the device without loosing
> everything.
>=20
> Otherwise things like userspace queues also doesn't work at all
> because then neither the kernel nor the DRM scheduler is involved in
> the submission any more.
>=20
> Regards,
> Christian.
>=20
> > >=20
> > > [1]
> > > https://patchwork.freedesktop.org/patch/msgid/20221109095010.141189-5=
-christian.koenig@amd.com
>=20

