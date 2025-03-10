Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38075A59259
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 12:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FA210E3F2;
	Mon, 10 Mar 2025 11:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="j7wNZZ0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4377410E3F4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 11:11:22 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZBDjL1n9xz9stH;
 Mon, 10 Mar 2025 12:11:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741605078; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1m5E9dHECKH4p563+jErai/qKXl9xTNYcMYNSMTkLh0=;
 b=j7wNZZ0vbM/yr+86LqG4rpNF9DaMbsG7rA1RsEE3JGCeIPs+TgnlSJVA62v2FKaY8Bnpbp
 IzIT/5uCnQW9U2klPE9GYSfSrEA0EXi80j3cHGEKQYyW2yHRxyo6Hr4P4aukCsjAf9K7KT
 wMXrtG9lvq2qiacHY5u2puYEC9QDgAe17U/IzTcdLEwUVPGyWtK0gciJshFVWI3FI9cw4f
 ff0FfkmS1sUNE6Evw77gB5sXW/CYYL68lB0vXbS7NVUaxD8IzxAqZnqtmdGZA4sGhdnC+m
 ZaXCS9ysEOzycLfxoCjVE+E99zKdjcwQqbdV7x8acbGeE4zS4SCXHJyc9UcsDw==
Message-ID: <d3b3a1210009223000e88a60d1215469bf765545.camel@mailbox.org>
Subject: Re: [PATCH v4 1/5] drm: Move some options to separate new Kconfig
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Simona Vetter <simona@ffwll.ch>, David
 Airlie <airlied@gmail.com>
Date: Mon, 10 Mar 2025 12:11:14 +0100
In-Reply-To: <7070a805-653c-4664-b0df-aa9c800e2f05@igalia.com>
References: <20250306170555.7244-1-tvrtko.ursulin@igalia.com>
 <20250306170555.7244-2-tvrtko.ursulin@igalia.com>
 <d355bccc3127b727c9f6fe03dfd7a43e4c5cc78e.camel@mailbox.org>
 <f9bbc28f-d2ee-403d-ba9b-708edcc4fb20@igalia.com>
 <61b4e7342572269b61ed4188dccfb688c3d95d79.camel@mailbox.org>
 <7070a805-653c-4664-b0df-aa9c800e2f05@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: kaywbt8ayojd93yctwbewb9s86hsgs9h
X-MBO-RS-ID: 9fa7268334663c0c4a4
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

On Mon, 2025-03-10 at 09:55 +0000, Tvrtko Ursulin wrote:
>=20
> On 07/03/2025 18:06, Philipp Stanner wrote:
> > On Fri, 2025-03-07 at 16:59 +0000, Tvrtko Ursulin wrote:
> > >=20
> > > On 07/03/2025 13:41, Philipp Stanner wrote:
> > > > Hi,
> > > >=20
> > > > You forgot to put folks in CC as recipents for the cover letter
> > > > :(
> > > >=20
> > > >=20
> > > > On Thu, 2025-03-06 at 17:05 +0000, Tvrtko Ursulin wrote:
> > > > > Move some options out into a new debug specific kconfig file
> > > > > in
> > > > > order
> > > > > to
> > > > > make things a bit cleaner.
> > > > >=20
> > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > >=20
> > > > We all have our individual work flows, so don't take this as
> > > > lecturing
> > > > or anything =E2=80=93 I just suspect that I was forgotten in the co=
ver
> > > > letter
> > > > because you Cc people by hand in the individual patches.
> > > >=20
> > > > What I do is that I run get_maintainer and then put the
> > > > individuals
> > > > listed there into the --to=3D field. That sends the entire series
> > > > to
> > > > all
> > > > of them.
> > > >=20
> > > > Only sometimes, when there's a huge list of recipents or when
> > > > the
> > > > patches of a series are very independent, I deviate from that
> > > > rule.
> > > >=20
> > > > JFYI
> > >=20
> > > Notice it was there in v3, I just omitted to paste it this time.
> > >=20
> > > > Anyways, we have a bigger problem about the entire series. I
> > > > now
> > > > tested
> > > > again with the same setup as yesterday and the faults are
> > > > indeed
> > > > gone,
> > > > so that's good.
> > > >=20
> > > > But to be sure I then did run kmemleak and got a list of leaks
> > > > that
> > > > is
> > > > more than 2000 lines long.
> > >=20
> > > There is this comment for drm_sched_fini which ends with:
> > >=20
> > > """
> > > ...
> > > =C2=A0=C2=A0 * This stops submission of new jobs to the hardware thro=
ugh
> > > =C2=A0=C2=A0 * drm_sched_backend_ops.run_job(). Consequently,
> > > drm_sched_backend_ops.free_job()
> > > =C2=A0=C2=A0 * will not be called for all jobs still in
> > > drm_gpu_scheduler.pending_list.
> > > =C2=A0=C2=A0 * There is no solution for this currently. Thus, it is u=
p to
> > > the
> > > driver to make
> > > =C2=A0=C2=A0 * sure that:
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 *=C2=A0 a) drm_sched_fini() is only called after for all=
 submitted
> > > jobs
> > > =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job=
() has been called or that
> > > =C2=A0=C2=A0 *=C2=A0 b) the jobs for which drm_sched_backend_ops.free=
_job() has
> > > not
> > > been
> > > called
> > > =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 after drm_sched_fini() ran are=
 freed manually.
> > > =C2=A0=C2=A0 *
> > >=20
> > > =C2=A0=C2=A0 * FIXME: Take care of the above problem and prevent this
> > > function
> > > from
> > > leaking
> > > =C2=A0=C2=A0 * the jobs in drm_gpu_scheduler.pending_list under any
> > > circumstances.
> > > """
> > >=20
> > > I got bitten by that. Keep forgetting how fragile the thing is..
> > > :(
> >=20
> > argh damn, those are *all* from the pending_list?!
>=20
> Right, all leaks I saw were from the drm_sched_basic_entity_cleanup=20
> test. All other tests actually wait for jobs to finish so can't hit
> that.
>=20
> Fix was simply to add a drm_sched_job_cleanup call when unwinding=20
> unfinished mock scheduler jobs from drm_mock_sched_fini, which
> happens=20
> before calling drm_sched_fini.
>=20
> That's pretty much how things are expected to be handled AFAIU.
>=20
> > OK. Well.
> >=20
> > Now we've got a philosophical problem:
> >=20
> > We still have to fix those leaks (I'm still working on it, but my
> > current attempt has failed and I probably fall back to a refcount
> > solution).
>=20
> You propose to move the responsibility of cleaning up in-flight jobs
> to=20
> the scheduler core?

The scheduler core is already and has always been responsible for
cleaning up "in-flight jobs". It does so through
backend_ops.free_job(). And we prevent it from cleaning up all jobs by
cancelling the work items in drm_sched_fini().

Semantically, the scheduler is the one in charge of the job life times.

As of right now, every single driver is effectively forced to implement
the same logic, but they have implemented it in different ways (Xe
refcounts the scheduler and only calls drm_sched_fini() once refcnt =3D=3D
0, Nouveau maintains a copy of the pending_list, blocking for it to
become empty before calling drm_sched_fini())

>=20
> > And to see whether the fix actually fixes the leaks, directly using
> > the
> > kunit tests would be handy.
> >=20
> > After all, this is what the kunit tests are there for: show what is
> > broken within the scheduler. And those leaks definitely qualify. Or
> > should kunit tests follow the same rules we demand from drivers?
> >=20
> > I'd like to hear more opinions about that.
> >=20
> > @Danilo, @Dave, @Sima
> > would it be OK if we add kunit tests for the scheduler to DRM that
> > cause leaks until we can fix them?
>=20
> It is indeed a bit philosophical. I'd say only if there is a 100%=20
> agreement that drm_sched_fini should be able to clean up, or drive=20
> cleaning up, all driver state. And if we are prepared to handle a=20
> permanently failing test from now to some future date when this would
> be=20
> implemented.
>=20
> I have a similar conundrum with set priority, where I was
> contemplating=20
> to add a permanently failing test showing how that does not fully
> work,=20
> and then get improved with my deadline scheduling series.
>=20
> On the other side of the argument is the past experience of CI
> systems=20
> generally not coping well with permanently failing test. Eventually
> they=20
> succumb to the pressure to remove them due noisy results. Therefore=20
> other option is to have the mock scheduler adhere to the current=20
> implementation and only change it once the DRM scheduler rules
> change.

Can you think of a way, like flags or kconfig options, with which
developers such as you and I could "switch the bugs on" for working on
those issues?

P.


>=20
> Regards,
>=20
> Tvrtko
>=20

