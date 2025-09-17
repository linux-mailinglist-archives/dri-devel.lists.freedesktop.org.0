Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F2DB81586
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 20:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855DA10E579;
	Wed, 17 Sep 2025 18:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFlSOhkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EEB10E579;
 Wed, 17 Sep 2025 18:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758133952; x=1789669952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKhsV0DTKfHcZHhQSlACQ2V9nltecXOvtlLqKQxGrmM=;
 b=RFlSOhkk41xvTn3pbvHO6GTnatn6Sn6FD+uPuJtfpVWnbxJAhVS7kSO3
 28l/DlX5onUxNTxg0TVmdU4GtiuRWp2tjBKwmZG010v0dG0Sc6rYE0GTU
 6lBOho/QEiG1YutcomPM9rBAHN+u3z0+4vnwhgT9XGIJEKvEMAAxP4Q1P
 OSw4FvwUwuEfwbaq1eAQu2pOKZDePWgVw77a5U980Km5Jt105JsKjEhUN
 WwEaFkv6wOh1HUMvfewDlRRSk2W8YzHZoB2vlZvnxvZ2Pf3T+uAwycKAR
 JamlY4VP6AhN6KUz3Gcd5y64rSIFWkN8gofmp5mdckHZdTHTYhu5ABbxQ Q==;
X-CSE-ConnectionGUID: xqQdZjhPQVG3A2n/IEkKZA==
X-CSE-MsgGUID: B+fvLnU2SO6wcAeY0a7Dgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85892171"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="85892171"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 11:32:31 -0700
X-CSE-ConnectionGUID: G+OrrZGWTPCYzmSLn778rw==
X-CSE-MsgGUID: do31WYqyRRaskv43POty6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175393701"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.65])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 11:32:29 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/syncobj_timeline: Exercise signaling of
 awaited points
Date: Wed, 17 Sep 2025 20:32:26 +0200
Message-ID: <3568023.QJadu78ljV@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b1897f06-bac3-4677-aa38-c959dedb6c39@amd.com>
References: <20250916095707.918819-2-janusz.krzysztofik@linux.intel.com>
 <b1897f06-bac3-4677-aa38-c959dedb6c39@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Christian,

On Tuesday, 16 September 2025 12:58:22 CEST Christian K=C3=B6nig wrote:
>=20
> On 16.09.25 11:55, Janusz Krzysztofik wrote:
> > CI reports kernel soft lockups when running a wait_backward test case of
> > igt@dmabuf@all-tests@dma_fence_chain selftest on less powerful machines.
> > A kernel fix has been developed that has proven to resolve the issue, b=
ut
> > it hasn't been accepted upstream, with a recommendation for dropping th=
at
> > test case as a "nonsense".
> >=20
> > Before we decide to take that path, try to implement the problematic te=
st
> > case in user space as an IGT subtest.  Since no kernel uAPIs have been
> > found that allow strict reimplementation of exact algorithm of the
> > problematic test case, where every link of a dma-fence chain is signaled
> > one by one from a loop running in kernel space, provide two approximate
> > variants, one that signals each fence with an individual system call, a=
nd
> > one that signals them all in one shot with one system call.
>=20
> Those tests are unrealistic outside of the syncobj framework.
>=20
> E.g. a test which exercises signaling each fence individually would requi=
re=20
HW which would do that to happen in reality.

I've been trying to understand what you meant but I've failed.  If a user=20
submits a number of DRM exec requests, each with an out fence, then HW will=
=20
signal each of those fences when its corresponding request completes, won't=
=20
it?

But anyway, some of those subtests, e.g. stress-enable-all-signal-all-forwa=
rd=20
or stress-enable-all-signal-all-backward, can trigger hard lockups.  Should=
n't=20
we care?

Thanks,
Janusz

>=20
> Regards,
> Christian.
>=20
> >=20
> > For more comprehensive testing, also implement the _forward and _random
> > scenarios from the original selftest, as well as simplified variants th=
at
> > don't enable signaling on each link of the dma-fence chain, and yet oth=
ers
> > that not only enable but also wait on every link of the chain.
> >=20
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  tests/syncobj_timeline.c | 289 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 289 insertions(+)
> >=20
> > diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> > index a77896ec1d..80c5970687 100644
> > --- a/tests/syncobj_timeline.c
> > +++ b/tests/syncobj_timeline.c
> > @@ -427,6 +427,61 @@
> >   *
> >   * SUBTEST: wait-zero-handles
> >   * Description: Verifies that waiting on an empty list of syncobj hand=
les=20
is accepted
> > + *
> > + * SUBTEST: stress-wait-last-signal-forward
> > + * Description: Signals each fence of a large timeline while another=20
thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-wait-last-signal-backward
> > + * Description: Signals each fence of a large timeline in reverse orde=
r=20
while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-wait-last-signal-random
> > + * Description: Signals each fence of a large timeline in random order=
=20
while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-wait-last-signal-all-forward
> > + * Description: Signals all fences of a large timeline while another=20
thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-wait-last-signal-all-backward
> > + * Description: Signals all fences of a large reverse ordered timeline=
=20
while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-wait-last-signal-all-random
> > + * Description: Signals all fences of a large randomly ordered timelin=
e=20
while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-forward
> > + * Description: Signals each fence of a large timeline with signaling=
=20
enabled on each point while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-backward
> > + * Description: Signals each fence of a large timeline in reversed ord=
er=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-random
> > + * Description: Signals each fence of a large timeline in random order=
=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-all-forward
> > + * Description: Signals all fences of a large timeline with signaling=
=20
enabled on each point while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-all-backward
> > + * Description: Signals all fences of a large reversed ordered timelin=
e=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-all-random
> > + * Description: Signals all fences of a large randomly ordered timelin=
e=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline
> > + *
> > + * SUBTEST: stress-wait-all-signal-forward
> > + * Description: Signals each fence of a large timeline while another=20
thread is waiting on each point of that timeline
> > + *
> > + * SUBTEST: stress-wait-all-signal-backward
> > + * Description: Signals each fence of a large timeline in reversed ord=
er=20
while another thread is waiting on each point of that timeline
> > + *
> > + * SUBTEST: stress-wait-all-signal-random
> > + * Description: Signals each fence of a large timeline in random order=
=20
while another thread is waiting on each point of that timeline
> > + *
> > + * SUBTEST: stress-wait-all-signal-all-forward
> > + * Description: Signals all fences of a large timeline while another=20
thread is waiting on each point of that timeline
> > + *
> > + * SUBTEST: stress-wait-all-signal-all-backward
> > + * Description: Signals all fences of a large reversed ordered timelin=
e=20
while another thread is waiting on each point of that timeline
> > + *
> > + * SUBTEST: stress-wait-all-signal-all-random
> > + * Description: Signals all fences of a large randomly ordered timelin=
e=20
while another thread is waiting on each point of that timeline
> > + *
> >   */
> > =20
> >  IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
> > @@ -1675,6 +1730,217 @@ test_32bits_limit(int fd)
> >  	close(timeline);
> >  }
> > =20
> > +#define STRESS_FLAGS_WAIT_ALL	=09
DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL
> > +#define STRESS_FLAGS_ENABLE_ALL		(STRESS_FLAGS_WAIT_ALL <<=20
1)
> > +#define STRESS_FLAGS_SIGNAL_ALL		(STRESS_FLAGS_ENABLE_ALL <<=20
1)
> > +#define STRESS_FLAGS_SIGNAL_BACKWARD	(STRESS_FLAGS_SIGNAL_ALL <<=20
1)
> > +#define STRESS_FLAGS_SIGNAL_RANDOM	(STRESS_FLAGS_SIGNAL_BACKWARD << 1)
> > +
> > +const char *stress_descriptions[] =3D {
> > +	/* stress-wait-last-signal-forward */
> > +	[0] =3D
> > +		"Signals each fence of a large timeline while another=20
thread is waiting on that timeline",
> > +	/* stress-wait-last-signal-backward */
> > +	[STRESS_FLAGS_SIGNAL_BACKWARD] =3D
> > +		"Signals each fence of a large timeline in reverse order=20
while another thread is waiting on that timeline",
> > +	/* stress-wait-last-signal-random */
> > +	[STRESS_FLAGS_SIGNAL_RANDOM] =3D
> > +		"Signals each fence of a large timeline in random order=20
while another thread is waiting on that timeline",
> > +	/* stress-wait-last-signal-all-forward */
> > +	[STRESS_FLAGS_SIGNAL_ALL] =3D
> > +		"Signals all fences of a large timeline while another=20
thread is waiting on that timeline",
> > +	/* stress-wait-last-signal-all-backward */
> > +	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =3D
> > +		"Signals all fences of a large reverse ordered timeline=20
while another thread is waiting on that timeline",
> > +	/* stress-wait-last-signal-all-random */
> > +	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =3D
> > +		"Signals all fences of a large randomly ordered timeline=20
while another thread is waiting on that timeline",
> > +	/* stress-enable-all-signal-forward */
> > +	[STRESS_FLAGS_ENABLE_ALL] =3D
> > +		"Signals each fence of a large timeline with signaling=20
enabled on each point while another thread is waiting on that timeline",
> > +	/* stress-enable-all-signal-backward */
> > +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =3D
> > +		"Signals each fence of a large timeline in reversed order=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline",
> > +	/* stress-enable-all-signal-random */
> > +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =3D
> > +		"Signals each fence of a large timeline in random order=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline",
> > +	/* stress-enable-all-signal-all-forward */
> > +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL] =3D
> > +		"Signals all fences of a large timeline with signaling=20
enabled on each point while another thread is waiting on that timeline",
> > +	/* stress-enable-all-signal-all-backward */
> > +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL |=20
STRESS_FLAGS_SIGNAL_BACKWARD] =3D
> > +		"Signals all fences of a large reversed ordered timeline=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline",
> > +	/* stress-enable-all-signal-all-random */
> > +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL |=20
STRESS_FLAGS_SIGNAL_RANDOM] =3D
> > +		"Signals all fences of a large randomly ordered timeline=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline",
> > +	/* stress-wait-all-signal-forward */
> > +	[STRESS_FLAGS_WAIT_ALL] =3D
> > +		"Signals each fence of a large timeline while another=20
thread is waiting on each point of that timeline",
> > +	/* stress-wait-all-signal-backward */
> > +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =3D
> > +		"Signals each fence of a large timeline in reversed order=20
while another thread is waiting on each point of that timeline",
> > +	/* stress-wait-all-signal-random */
> > +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =3D
> > +		"Signals each fence of a large timeline in random order=20
while another thread is waiting on each point of that timeline",
> > +	/* stress-wait-all-signal-all-forward */
> > +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL] =3D
> > +		"Signals all fences of a large timeline while another=20
thread is waiting on each point of that timeline",
> > +	/* stress-wait-all-signal-all-backward */
> > +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL |=20
STRESS_FLAGS_SIGNAL_BACKWARD] =3D
> > +		"Signals all fences of a large reversed ordered timeline=20
while another thread is waiting on each point of that timeline",
> > +	/* stress-wait-all-signal-all-random */
> > +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL |=20
STRESS_FLAGS_SIGNAL_RANDOM] =3D
> > +		"Signals all fences of a large randomly ordered timeline=20
while another thread is waiting on each point of that timeline",
> > +};
> > +
> > +#define TL_LENGTH 4096
> > +
> > +struct stress_timeline {
> > +	int fd;
> > +	int swsync;
> > +	uint32_t syncobj;
> > +	int tmp_fence;
> > +	uint32_t *syncobjs;
> > +	uint64_t *points;
> > +	unsigned int length;
> > +	unsigned int flags;
> > +	pthread_t thread;
> > +	int retval;
> > +};
> > +
> > +static void stress_init(int fd, struct stress_timeline **timeline,=20
unsigned int flags)
> > +{
> > +	struct stress_timeline *tl;
> > +	uint64_t point;
> > +	int i;
> > +
> > +	tl =3D calloc(TL_LENGTH, sizeof(*tl));
> > +	igt_assert(tl);
> > +	*timeline =3D tl;
> > +
> > +	tl->fd =3D fd;
> > +	tl->tmp_fence =3D -1;
> > +	tl->length =3D TL_LENGTH;
> > +	tl->flags =3D flags;
> > +
> > +	tl->swsync =3D sw_sync_timeline_create();
> > +	tl->syncobj =3D syncobj_create(fd, 0);
> > +
> > +	tl->syncobjs =3D calloc(tl->length, sizeof(*tl->syncobjs));
> > +	igt_assert(tl->syncobjs);
> > +
> > +	tl->points =3D calloc(tl->length, sizeof(*tl->points));
> > +	igt_assert(tl->points);
> > +
> > +	for (i =3D 0; i < tl->length; i++)
> > +		tl->points[i] =3D (flags & STRESS_FLAGS_SIGNAL_BACKWARD) ?=20
tl->length - 1 : i + 1;
> > +	if (flags & STRESS_FLAGS_SIGNAL_RANDOM)
> > +		igt_permute_array(tl->points, tl->length,=20
igt_exchange_int64);
> > +
> > +	for (i =3D 0; i < tl->length; i++) {
> > +		tl->tmp_fence =3D sw_sync_timeline_create_fence(tl->swsync,=20
tl->points[i]);
> > +		tl->syncobjs[i] =3D syncobj_create(fd, 0);
> > +
> > +		syncobj_import_sync_file(fd, tl->syncobjs[i], tl-
>tmp_fence);
> > +		close(tl->tmp_fence);
> > +		tl->tmp_fence =3D -1;
> > +
> > +		syncobj_binary_to_timeline(fd, tl->syncobj, i + 1, tl-
>syncobjs[i]);
> > +		syncobj_destroy(fd, tl->syncobjs[i]);
> > +
> > +		tl->syncobjs[i] =3D tl->syncobj;
> > +		tl->points[i] =3D i + 1;
> > +	}
> > +
> > +	if (flags & STRESS_FLAGS_ENABLE_ALL)
> > +		igt_assert_eq(syncobj_timeline_wait_err(tl->fd, tl-
>syncobjs,
> > +							tl-
>points, tl->length, 0,
> > +						=09
DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL), -ETIME);
> > +
> > +	syncobj_timeline_query(fd, &tl->syncobj, &point, 1);
> > +	igt_assert_eq(point, 0);
> > +}
> > +
> > +static void *stress_wait_syncobj_thread_func(void *data)
> > +{
> > +	struct stress_timeline *tl =3D data;
> > +	unsigned int count =3D (tl->flags & STRESS_FLAGS_WAIT_ALL) ? tl-
>length : 1;
> > +	uint64_t *points =3D &tl->points[tl->length - count];
> > +
> > +	tl->retval =3D -EINPROGRESS;
> > +
> > +	/* Wait for the timeline signaled */
> > +	tl->retval =3D syncobj_timeline_wait_err(tl->fd, tl->syncobjs, points=
,=20
count,
> > +					       gettime_ns() + 600 *=20
NSECS_PER_SEC,
> > +					       tl->flags &=20
DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL);
> > +
> > +	return &tl->retval;
> > +}
> > +
> > +static void test_stress_enable_wait_signal(int fd, struct stress_timel=
ine=20
**timeline,
> > +					   unsigned int flags)
> > +{
> > +	struct stress_timeline *tl;
> > +	int64_t dt;
> > +	int i;
> > +
> > +	stress_init(fd, timeline, flags);
> > +	tl =3D *timeline;
> > +
> > +	tl->retval =3D 0;
> > +	igt_assert_eq(pthread_create(&tl->thread, NULL,
> > +				     stress_wait_syncobj_thread_func,=20
tl), 0);
> > +	igt_assert_eq(sched_yield(), 0);
> > +	while (READ_ONCE(tl->retval) !=3D -EINPROGRESS)
> > +		;
> > +	igt_assert_eq(sched_yield(), 0);
> > +
> > +	dt =3D -gettime_ns();
> > +	if (flags & STRESS_FLAGS_SIGNAL_ALL)
> > +		sw_sync_timeline_inc(tl->swsync, tl->length);
> > +	else
> > +		for (i =3D 0; i < tl->length; i++)
> > +			sw_sync_timeline_inc(tl->swsync, 1);
> > +	dt +=3D gettime_ns();
> > +	igt_info("%s: %d signals in %ld ns\n", __func__, tl->length, dt);
> > +
> > +	igt_assert_eq(pthread_join(tl->thread, NULL), 0);
> > +	tl->thread =3D 0;
> > +	igt_assert_eq(tl->retval, 0);
> > +}
> > +
> > +static void stress_cleanup(struct stress_timeline *timeline)
> > +{
> > +	if (!timeline)
> > +		return;
> > +
> > +	if (timeline->thread)
> > +		igt_warn_on(pthread_join(timeline->thread, NULL));
> > +
> > +	if (timeline->points)
> > +		free(timeline->points);
> > +
> > +	if (timeline->syncobjs) {
> > +		int i;
> > +
> > +		for (i =3D 0; i < timeline->length; i++)
> > +			if (timeline->syncobjs && timeline->syncobjs[i]=20
!=3D timeline->syncobj)
> > +				syncobj_destroy(timeline->fd,=20
timeline->syncobjs[i]);
> > +		free(timeline->syncobjs);
> > +	}
> > +
> > +	if (timeline->tmp_fence >=3D 0)
> > +		igt_warn_on(close(timeline->tmp_fence));
> > +
> > +	if (timeline->syncobj)
> > +		syncobj_destroy(timeline->fd, timeline->syncobj);
> > +
> > +	if (timeline->swsync >=3D 0)
> > +		igt_warn_on(close(timeline->swsync));
> > +
> > +	free(timeline);
> > +}
> > +
> >  static bool
> >  has_syncobj_timeline_wait(int fd)
> >  {
> > @@ -1934,6 +2200,29 @@ igt_main
> >  	igt_subtest("32bits-limit")
> >  		test_32bits_limit(fd);
> > =20
> > +	for (unsigned int flags =3D 0;
> > +	     flags < (STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL |
> > +		      STRESS_FLAGS_ENABLE_ALL |=20
STRESS_FLAGS_SIGNAL_RANDOM);
> > +	     flags++) {
> > +		struct stress_timeline *timeline =3D NULL;
> > +
> > +		if (flags & STRESS_FLAGS_ENABLE_ALL && flags &=20
STRESS_FLAGS_WAIT_ALL)
> > +			continue;
> > +
> > +		igt_describe(stress_descriptions[flags]);
> > +		igt_subtest_f("stress-%s-%s-signal%s-%s",
> > +			      (flags & STRESS_FLAGS_ENABLE_ALL) ?=20
"enable" : "wait",
> > +			      (flags & (STRESS_FLAGS_WAIT_ALL |=20
STRESS_FLAGS_ENABLE_ALL)) ? "all" :
> > +							=09
			    "last",
> > +			      (flags & STRESS_FLAGS_SIGNAL_ALL) ? "-all"=20
: "",
> > +			      (flags & STRESS_FLAGS_SIGNAL_RANDOM) ?=20
"random" :
> > +			      (flags & STRESS_FLAGS_SIGNAL_BACKWARD) ?=20
"backward" : "forward")
> > +			test_stress_enable_wait_signal(fd, &timeline,=20
flags);
> > +
> > +		igt_fixture
> > +			stress_cleanup(READ_ONCE(timeline));
> > +	}
> > +
> >  	igt_fixture {
> >  		drm_close_driver(fd);
> >  	}
>=20
>=20




