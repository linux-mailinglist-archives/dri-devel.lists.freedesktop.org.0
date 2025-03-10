Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E98A5934C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404B810E3F4;
	Mon, 10 Mar 2025 12:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="M4eQV51g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A3510E3F4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:00:20 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZBFnr3Gwcz9tCl;
 Mon, 10 Mar 2025 13:00:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741608016; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sao2aKGA7VLgPLYa9XmvezU8uYbohu5WPCdLd3759RE=;
 b=M4eQV51gG+chzQKcjXLePzcf2uw8TkNhjwM5X+y0hSO4YxllTefDD9m+5TtT6XyL7c54AG
 aRfnLhC5cQ4RLpwbazZVC5hIt9ek0wwMyKt3zHD2lcNxx/nvNvcMjhOogb4kseXSVyq98A
 +CV1hoX8cA4Mpzm5VG9zaVgl/CUSSJuy6TSV+AERulgoirCGjHyXJ0Pf99la41E56AizyD
 VNr7D2k57Qw1EHY7afBbDB24Is08j6Lcvyp5X1Ht71mcMFL8jSB0izd7Jy1mVqSUTO05jv
 IOIgGTioDiBtKgzmAqVnU9sSM3noNN09sK1Iny1Qr9laGcfgW2Br1rcKNMlR7w==
Message-ID: <4a3e145d48795ceffcacec4a4f1423c7b3b278ff.camel@mailbox.org>
Subject: Re: [PATCH v4 1/5] drm: Move some options to separate new Kconfig
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Simona Vetter <simona@ffwll.ch>, David
 Airlie <airlied@gmail.com>
Date: Mon, 10 Mar 2025 13:00:12 +0100
In-Reply-To: <219fc5e3-759b-4013-8def-673c7946f5e1@igalia.com>
References: <20250306170555.7244-1-tvrtko.ursulin@igalia.com>
 <20250306170555.7244-2-tvrtko.ursulin@igalia.com>
 <d355bccc3127b727c9f6fe03dfd7a43e4c5cc78e.camel@mailbox.org>
 <f9bbc28f-d2ee-403d-ba9b-708edcc4fb20@igalia.com>
 <61b4e7342572269b61ed4188dccfb688c3d95d79.camel@mailbox.org>
 <7070a805-653c-4664-b0df-aa9c800e2f05@igalia.com>
 <d3b3a1210009223000e88a60d1215469bf765545.camel@mailbox.org>
 <219fc5e3-759b-4013-8def-673c7946f5e1@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: ednmmdy7sqg3o8fzadborpjqf9tyw1yp
X-MBO-RS-ID: ba1fc976786cd68e17e
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

On Mon, 2025-03-10 at 11:54 +0000, Tvrtko Ursulin wrote:
>=20
> On 10/03/2025 11:11, Philipp Stanner wrote:
> > On Mon, 2025-03-10 at 09:55 +0000, Tvrtko Ursulin wrote:
> > >=20
> > > On 07/03/2025 18:06, Philipp Stanner wrote:
> > > > On Fri, 2025-03-07 at 16:59 +0000, Tvrtko Ursulin wrote:
> > > > >=20
> > > > > On 07/03/2025 13:41, Philipp Stanner wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > You forgot to put folks in CC as recipents for the cover
> > > > > > letter
> > > > > > :(
> > > > > >=20
> > > > > >=20
> > > > > > On Thu, 2025-03-06 at 17:05 +0000, Tvrtko Ursulin wrote:
> > > > > > > Move some options out into a new debug specific kconfig
> > > > > > > file
> > > > > > > in
> > > > > > > order
> > > > > > > to
> > > > > > > make things a bit cleaner.
> > > > > > >=20
> > > > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > > > >=20
> > > > > > We all have our individual work flows, so don't take this
> > > > > > as
> > > > > > lecturing
> > > > > > or anything =E2=80=93 I just suspect that I was forgotten in th=
e
> > > > > > cover
> > > > > > letter
> > > > > > because you Cc people by hand in the individual patches.
> > > > > >=20
> > > > > > What I do is that I run get_maintainer and then put the
> > > > > > individuals
> > > > > > listed there into the --to=3D field. That sends the entire
> > > > > > series
> > > > > > to
> > > > > > all
> > > > > > of them.
> > > > > >=20
> > > > > > Only sometimes, when there's a huge list of recipents or
> > > > > > when
> > > > > > the
> > > > > > patches of a series are very independent, I deviate from
> > > > > > that
> > > > > > rule.
> > > > > >=20
> > > > > > JFYI
> > > > >=20
> > > > > Notice it was there in v3, I just omitted to paste it this
> > > > > time.
> > > > >=20
> > > > > > Anyways, we have a bigger problem about the entire series.
> > > > > > I
> > > > > > now
> > > > > > tested
> > > > > > again with the same setup as yesterday and the faults are
> > > > > > indeed
> > > > > > gone,
> > > > > > so that's good.
> > > > > >=20
> > > > > > But to be sure I then did run kmemleak and got a list of
> > > > > > leaks
> > > > > > that
> > > > > > is
> > > > > > more than 2000 lines long.
> > > > >=20
> > > > > There is this comment for drm_sched_fini which ends with:
> > > > >=20
> > > > > """
> > > > > ...
> > > > > =C2=A0=C2=A0=C2=A0 * This stops submission of new jobs to the har=
dware
> > > > > through
> > > > > =C2=A0=C2=A0=C2=A0 * drm_sched_backend_ops.run_job(). Consequentl=
y,
> > > > > drm_sched_backend_ops.free_job()
> > > > > =C2=A0=C2=A0=C2=A0 * will not be called for all jobs still in
> > > > > drm_gpu_scheduler.pending_list.
> > > > > =C2=A0=C2=A0=C2=A0 * There is no solution for this currently. Thu=
s, it is up
> > > > > to
> > > > > the
> > > > > driver to make
> > > > > =C2=A0=C2=A0=C2=A0 * sure that:
> > > > > =C2=A0=C2=A0=C2=A0 *
> > > > > =C2=A0=C2=A0=C2=A0 *=C2=A0 a) drm_sched_fini() is only called aft=
er for all
> > > > > submitted
> > > > > jobs
> > > > > =C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_op=
s.free_job() has been called or
> > > > > that
> > > > > =C2=A0=C2=A0=C2=A0 *=C2=A0 b) the jobs for which drm_sched_backen=
d_ops.free_job()
> > > > > has
> > > > > not
> > > > > been
> > > > > called
> > > > > =C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 after drm_sched_fini=
() ran are freed manually.
> > > > > =C2=A0=C2=A0=C2=A0 *
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0 * FIXME: Take care of the above problem and pr=
event this
> > > > > function
> > > > > from
> > > > > leaking
> > > > > =C2=A0=C2=A0=C2=A0 * the jobs in drm_gpu_scheduler.pending_list u=
nder any
> > > > > circumstances.
> > > > > """
> > > > >=20
> > > > > I got bitten by that. Keep forgetting how fragile the thing
> > > > > is..
> > > > > :(
> > > >=20
> > > > argh damn, those are *all* from the pending_list?!
> > >=20
> > > Right, all leaks I saw were from the
> > > drm_sched_basic_entity_cleanup
> > > test. All other tests actually wait for jobs to finish so can't
> > > hit
> > > that.
> > >=20
> > > Fix was simply to add a drm_sched_job_cleanup call when unwinding
> > > unfinished mock scheduler jobs from drm_mock_sched_fini, which
> > > happens
> > > before calling drm_sched_fini.
> > >=20
> > > That's pretty much how things are expected to be handled AFAIU.
> > >=20
> > > > OK. Well.
> > > >=20
> > > > Now we've got a philosophical problem:
> > > >=20
> > > > We still have to fix those leaks (I'm still working on it, but
> > > > my
> > > > current attempt has failed and I probably fall back to a
> > > > refcount
> > > > solution).
> > >=20
> > > You propose to move the responsibility of cleaning up in-flight
> > > jobs
> > > to
> > > the scheduler core?
> >=20
> > The scheduler core is already and has always been responsible for
> > cleaning up "in-flight jobs". It does so through
> > backend_ops.free_job(). And we prevent it from cleaning up all jobs
> > by
> > cancelling the work items in drm_sched_fini().
> >=20
> > Semantically, the scheduler is the one in charge of the job life
> > times.
> >=20
> > As of right now, every single driver is effectively forced to
> > implement
> > the same logic, but they have implemented it in different ways (Xe
> > refcounts the scheduler and only calls drm_sched_fini() once refcnt
> > =3D=3D
> > 0, Nouveau maintains a copy of the pending_list, blocking for it to
> > become empty before calling drm_sched_fini())
>=20
> Right. And to change it means making ->free_job() for all drivers
> handle=20
> different potential job states, while today it only needs to handle=20
> finished jobs. Or adding a new vfunc. Or something. It sounds doable
> but=20
> a lot of work, not least because there is a lot of drivers.

I know the pain, I'm working on that since ~November.

I plan to propose a new solution "soon"(tm)

>=20
> > > > And to see whether the fix actually fixes the leaks, directly
> > > > using
> > > > the
> > > > kunit tests would be handy.
> > > >=20
> > > > After all, this is what the kunit tests are there for: show
> > > > what is
> > > > broken within the scheduler. And those leaks definitely
> > > > qualify. Or
> > > > should kunit tests follow the same rules we demand from
> > > > drivers?
> > > >=20
> > > > I'd like to hear more opinions about that.
> > > >=20
> > > > @Danilo, @Dave, @Sima
> > > > would it be OK if we add kunit tests for the scheduler to DRM
> > > > that
> > > > cause leaks until we can fix them?
> > >=20
> > > It is indeed a bit philosophical. I'd say only if there is a 100%
> > > agreement that drm_sched_fini should be able to clean up, or
> > > drive
> > > cleaning up, all driver state. And if we are prepared to handle a
> > > permanently failing test from now to some future date when this
> > > would
> > > be
> > > implemented.
> > >=20
> > > I have a similar conundrum with set priority, where I was
> > > contemplating
> > > to add a permanently failing test showing how that does not fully
> > > work,
> > > and then get improved with my deadline scheduling series.
> > >=20
> > > On the other side of the argument is the past experience of CI
> > > systems
> > > generally not coping well with permanently failing test.
> > > Eventually
> > > they
> > > succumb to the pressure to remove them due noisy results.
> > > Therefore
> > > other option is to have the mock scheduler adhere to the current
> > > implementation and only change it once the DRM scheduler rules
> > > change.
> >=20
> > Can you think of a way, like flags or kconfig options, with which
> > developers such as you and I could "switch the bugs on" for working
> > on
> > those issues?
>=20
> We could do that easily I think. Something like:
>=20
> config DRM_SCHED_KUNIT_TEST_ASPIRATIONAL
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "Turn on the aspira=
tional mode for DRM scheduler unit=20
> tests" if !KUNIT_ALL_TESTS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_SCHED
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on DRM && KUNIT =
&& DRM_SCHED_KUNIT_TEST
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default KUNIT_ALL_TESTS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose this =
option to make the DRM scheduler unit tests
> test=20
> for behaviour which was agreed as a design goal, even if the current=20
> implementation can make specific tests fail.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Recommended =
for driver developers only.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If in doubt,=
 say "N".

If you can work out something like this, that would be fantastic and
solve all the aforementioned problems

>=20
> I can skip the job cleanup based on it and also add some validation
> that=20
> the pending list is empty after drm_sched_fini if on.

Sounds handy. That way the developer doesn't even have to use kmemleak.


P.

>=20
> Regards,
>=20
> Tvrtko
>=20

