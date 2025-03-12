Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE9CA5DCC3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 13:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6862110E782;
	Wed, 12 Mar 2025 12:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rRveb6mQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45E710E17B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 12:36:05 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZCVVB4KpFz9sbt;
 Wed, 12 Mar 2025 13:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741782962; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gC72WzdfkRZPUYuKgX6IkzH+5Vctm90zeZP/BbVxw7s=;
 b=rRveb6mQO+fWBpd+OL1TBpU8+5qyhAe+l8M6W0dQ50IwDzevvG7wWEbWCyn+hxuzALBQYy
 pvwsQ1Li2K7xsLi10fDr35f4qDzII6KVAzFPof2i1cZtAKhmGQMeFxKeCn+OC/zNPqpCeh
 QuMmfFXrPHk5HCKvOuA2BmDxhBt2/36xIysHbkBm9nRJCQwzBigPyWfSAnhKsQ7mhjCBZW
 egSB78CGtgXOXFAqvmC26rEg8EcLRmXyqfFmHFna42PaI+etb7vezz2JPqfsGNe2QdG+3G
 lo5a2M09lCX0Sw489chPkT+huQea2m60QtdrVEvjPTwV0aYer49c7MqSQ/2V/Q==
Message-ID: <3ce2bdb2cacd9d30bd5de282e227721d838822b8.camel@mailbox.org>
Subject: Re: [PATCH v7 0/7] DRM scheduler kunit tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>
Date: Wed, 12 Mar 2025 13:35:59 +0100
In-Reply-To: <0f0102cb-8036-4fc6-898e-cd4eab4edfe0@igalia.com>
References: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
 <d92d3b58fa34f4beb957feeb372f9e18237d1c1c.camel@mailbox.org>
 <0f0102cb-8036-4fc6-898e-cd4eab4edfe0@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e13c9c4938abf59723f
X-MBO-RS-META: 18canf7jzof3sfg1bf1f3obw1e46ya6r
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

On Wed, 2025-03-12 at 10:50 +0000, Tvrtko Ursulin wrote:
>=20
> On 12/03/2025 10:39, Philipp Stanner wrote:
> > On Tue, 2025-03-11 at 09:23 +0000, Tvrtko Ursulin wrote:
> > > There has repeatedly been quite a bit of apprehension when any
> > > change
> > > to the DRM
> > > scheduler is proposed, with two main reasons being code base is
> > > considered
> > > fragile, not well understood and not very well documented, and
> > > secondly the lack
> > > of systematic testing outside the vendor specific tests suites
> > > and/or
> > > test
> > > farms.
> > >=20
> > > This series is an attempt to dislodge this status quo by adding
> > > some
> > > unit tests
> > > using the kunit framework.
> > >=20
> > > General approach is that there is a mock "hardware" backend which
> > > can
> > > be
> > > controlled from tests, which in turn allows exercising various
> > > scheduler code
> > > paths.
> > >=20
> > > Only some simple basic tests get added in the series and
> > > hopefully it
> > > is easy to
> > > understand what tests are doing.
> > >=20
> > > An obligatory "screenshot" for reference:
> > >=20
> > > [14:09:05] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_tests=
 (3 subtests)
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:06] [PASSED] drm_sched_basic_submit
> > > [14:09:06] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm=
_sched_basic_test
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:06] [PASSED] A queue of jobs in a single entity
> > > [14:09:06] [PASSED] A chain of dependent jobs across multiple
> > > entities
> > > [14:09:06] [PASSED] Multiple independent job queues
> > > [14:09:06] [PASSED] Multiple inter-dependent job queues
> > > [14:09:07] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sc=
hed_basic_test
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:07] [PASSED] drm_sched_basic_entity_cleanup
> > > [14:09:07] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sc=
hed_basic_tests
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:07] =3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_timeout_tests (1 =
subtest)
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:08] [PASSED] drm_sched_basic_timeout
> > > [14:09:08] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_ti=
meout_tests
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:08] =3D=3D=3D=3D=3D=3D=3D drm_sched_basic_priority_tests (2 su=
btests)
> > > =3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:10] [PASSED] drm_sched_priorities
> > > [14:09:10] [PASSED] drm_sched_change_priority
> > > [14:09:10] =3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_prior=
ity_tests
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:10] =3D=3D=3D=3D=3D=3D drm_sched_basic_modify_sched_tests (1 s=
ubtest)
> > > =3D=3D=3D=3D=3D=3D
> > > [14:09:11] [PASSED] drm_sched_test_modify_sched
> > > [14:09:11] =3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_modify_sche=
d_tests
> > > =3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:11] =3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_credits_tests (1 =
subtest)
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:12] [PASSED] drm_sched_test_credits
> > > [14:09:12] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_cr=
edits_tests
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:12]
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [14:09:12] Testing complete. Ran 11 tests: passed: 11
> > > [14:09:13] Elapsed time: 13.539s total, 0.001s configuring,
> > > 3.004s
> > > building, 10.462s running
> > >=20
> > > v2:
> > > =C2=A0=C2=A0* Parameterize a bunch of similar tests.
> > > =C2=A0=C2=A0* Improve test commentary.
> > > =C2=A0=C2=A0* Rename TDR test to timeout. (Christian)
> > > =C2=A0=C2=A0* Improve quality and consistency of naming. (Philipp)
> > >=20
> > > RFC v2 -> series v1:
> > > =C2=A0=C2=A0* Rebased for drm_sched_init changes.
> > > =C2=A0=C2=A0* Fixed modular build.
> > > =C2=A0=C2=A0* Added some comments.
> > > =C2=A0=C2=A0* Filename renames. (Philipp)
> > >=20
> > > v2:
> > > =C2=A0=C2=A0* Dealt with a bunch of checkpatch warnings.
> > >=20
> > > v3:
> > > =C2=A0=C2=A0* Some mock API renames, kerneldoc grammar fixes and
> > > indentation
> > > fixes.
> > >=20
> > > v4:
> > > =C2=A0=C2=A0* Fix use after free caused by relying on scheduler fence=
 for
> > > querying status.
> > > =C2=A0=C2=A0* Kerneldoc fixes.
> > >=20
> > > v5:
> > > =C2=A0=C2=A0* Cleanup in-flight jobs on scheduler shutdown.
> > > =C2=A0=C2=A0* Change hang_limit to 1.
> > >=20
> > > v6:
> > > =C2=A0=C2=A0* Use KUNIT_ASSERT_TRUE/FALSE.
> > > =C2=A0=C2=A0* Fixed patch titles.
> > > =C2=A0=C2=A0* Added credit_limit test.
> >=20
> > Please don't add new tests in a settled series. Doing so may seem
> > efficient, but causes another round of review and can cause you and
> > me
> > trouble when trying to find the cause of issues such as the one
> > mentioned below:
> >=20
> > > =C2=A0=C2=A0* Added CONFIG_DRM_SCHED_KUNIT_TEST_ASPIRATIONAL.
> > >=20
> > > v7:
> > > =C2=A0=C2=A0* v6 omitted to send the first patch by mistake.
> >=20
> > I either see a new NULL ptr deref added through the new test or an
> > old
> > one that has slipped us. My test setup is unchanged.
>=20
> All I see in what you pasted are kunit_test_null_dereference
> "crashes".=20
> Ie. expected ones from having enabled CONFIG_KUNIT_FAULT_TEST.

Allright, didn't know about that. Help me out here quickly, so would
this option lead to a real fault on a real CPU? Or is it "simulated"?


>=20
> Is there something more that you did not paste?

No, that was all.

I tried it again without the KUNIT_FAULT option and activated
aspirational mode. (on top of current drm-misc-next, eff0347e7c22).

There I see a UAF. Do you have an idea what that might be? I would only
expect memory leaks and the test assertions failing.


[    3.976637] Demotion targets for Node 0: null
[    3.977265] kmemleak: Kernel memory leak detector initialized (mem pool =
available: 11277)
[    3.977274] kmemleak: Automatic memory scanning thread started
[    3.978604] PM:   Magic number: 1:529:430
[    3.978914] printk: legacy console [netcon0] enabled
[    3.979247] netconsole: network logging started
[    3.979839] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    3.980811] kworker/u72:1 (156) used greatest stack depth: 28552 bytes l=
eft
[    3.981632] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    3.982437] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db1=
8c600'
[    3.983110] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[    3.983578] KTAP version 1
[    3.983767] cfg80211: failed to load regulatory.db
[    3.983988] 1..5
[    3.984976]     KTAP version 1
[    3.985299]     # Subtest: drm_sched_basic_tests
[    3.985681]     # module: drm_sched_tests
[    3.985683]     1..3
[    4.319827] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/=
i8042/serio1/input/input3
[    4.495862]     ok 1 drm_sched_basic_submit
[    4.495879]         KTAP version 1
[    4.496468]         # Subtest: drm_sched_basic_test
[    4.598388]         ok 1 A queue of jobs in a single entity
[    4.700730]         ok 2 A chain of dependent jobs across multiple entit=
ies
[    4.803439]         ok 3 Multiple independent job queues
[    4.905560]         ok 4 Multiple inter-dependent job queues
[    4.906029]     # drm_sched_basic_test: pass:4 fail:0 skip:0 total:4
[    4.906500]     ok 2 drm_sched_basic_test
[    4.959366]     # drm_sched_basic_entity_cleanup: ASSERTION FAILED at dr=
ivers/gpu/drm/scheduler/tests/mock_scheduler.c:294
[    4.959366]     Expected list_empty(&sched->job_list) to be true, but is=
 false
[    4.961263]     # drm_sched_basic_entity_cleanup: test aborted during cl=
eanup. continuing without cleaning up
[    4.961997]     not ok 3 drm_sched_basic_entity_cleanup
[    4.961999] # drm_sched_basic_tests: pass:2 fail:1 skip:0 total:3
[    4.962384] # Totals: pass:5 fail:1 skip:0 total:6
[    4.962823] not ok 1 drm_sched_basic_tests
[    4.963465]     KTAP version 1
[    4.963691]     # Subtest: drm_sched_basic_timeout_tests
[    4.964065]     # module: drm_sched_tests
[    4.964067]     1..1
[    6.503265]     # drm_sched_basic_timeout: ASSERTION FAILED at drivers/g=
pu/drm/scheduler/tests/mock_scheduler.c:294
[    6.503265]     Expected list_empty(&sched->job_list) to be true, but is=
 false
[    6.504778]     # drm_sched_basic_timeout: test aborted during cleanup. =
continuing without cleaning up
[    6.505457]     not ok 1 drm_sched_basic_timeout
[    6.505460] not ok 2 drm_sched_basic_timeout_tests
[    6.506128]     KTAP version 1
[    6.506360]     # Subtest: drm_sched_basic_priority_tests
[    6.506751]     # module: drm_sched_tests
[    6.506753]     1..2
[    6.609082]     ok 1 drm_sched_priorities
[    7.614297]     ok 2 drm_sched_change_priority
[    7.614723] # drm_sched_basic_priority_tests: pass:2 fail:0 skip:0 total=
:2
[    7.615130] # Totals: pass:2 fail:0 skip:0 total:2
[    7.615667] ok 3 drm_sched_basic_priority_tests
[    7.616344]     KTAP version 1
[    7.616580]     # Subtest: drm_sched_basic_modify_sched_tests
[    7.617039]     # module: drm_sched_tests
[    7.617042]     1..1
[    7.926594]     # drm_sched_test_modify_sched: ASSERTION FAILED at drive=
rs/gpu/drm/scheduler/tests/mock_scheduler.c:294
[    7.926594]     Expected list_empty(&sched->job_list) to be true, but is=
 false
[    7.928533] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    7.929065] BUG: KASAN: slab-use-after-free in timerqueue_add+0x24e/0x32=
0
[    7.929596] Read of size 8 at addr ffff8881092ec8e8 by task swapper/5/0
[    7.930092]=20
[    7.930251] CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Tainted: G             =
    N 6.14.0-rc4-00476-ge1aa9011309e #6
[    7.930256] Tainted: [N]=3DTEST
[    7.930257] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.16.3-2.fc40 04/01/2014
[    7.930258] Call Trace:
[    7.930260]  <IRQ>
[    7.930261]  dump_stack_lvl+0x53/0x70
[    7.930265]  print_report+0xce/0x680
[    7.930269]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[    7.930271]  ? __pfx_calc_global_load_tick+0x10/0x10
[    7.930274]  ? timerqueue_add+0x24e/0x320
[    7.930276]  kasan_report+0xe2/0x120
[    7.930278]  ? timerqueue_add+0x24e/0x320
[    7.930280]  timerqueue_add+0x24e/0x320
[    7.930281]  __hrtimer_run_queues+0x358/0x6f0
[    7.930284]  ? __pfx___hrtimer_run_queues+0x10/0x10
[    7.930286]  ? ktime_get_update_offsets_now+0x7c/0x2c0
[    7.930288]  hrtimer_interrupt+0x2cd/0x7e0
[    7.930290]  __sysvec_apic_timer_interrupt+0x88/0x260
[    7.930293]  sysvec_apic_timer_interrupt+0x67/0x80
[    7.930295]  </IRQ>
[    7.930296]  <TASK>
[    7.930296]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[    7.930299] RIP: 0010:default_idle+0xf/0x20
[    7.930302] Code: 4c 01 c7 4c 29 c2 e9 72 ff ff ff 90 90 90 90 90 90 90 =
90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d b3 d6 06 00 fb f4 <fa=
> c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90
[    7.930304] RSP: 0000:ffff888100b8fe70 EFLAGS: 00000206
[    7.930306] RAX: ffff888a8ec80000 RBX: 0000000000000005 RCX: ffffffffbb3=
b7c41
[    7.930308] RDX: ffffed1151d96a83 RSI: 0000000000000004 RDI: 00000000000=
36334
[    7.930309] RBP: ffffed1020161d58 R08: 0000000000000001 R09: ffffed1151d=
96a82
[    7.930309] R10: ffff888a8ecb5413 R11: 0000000000001400 R12: ffff888100b=
0eac0
[    7.930310] R13: ffffffffbc7f36d0 R14: 1ffff11020171fd2 R15: 00000000000=
00000
[    7.930312]  ? ct_kernel_exit.constprop.0+0xa1/0xc0
[    7.930314]  default_idle_call+0x3a/0x60
[    7.930316]  do_idle+0x2f2/0x3b0
[    7.930318]  ? __pfx_do_idle+0x10/0x10
[    7.930320]  ? __switch_to+0x5cd/0xe30
[    7.930323]  cpu_startup_entry+0x4f/0x60
[    7.930324]  start_secondary+0x1b7/0x210
[    7.930326]  common_startup_64+0x12c/0x138
[    7.930328]  </TASK>
[    7.930329]=20
[    7.931848]     not ok 1 drm_sched_test_modify_sched
[    7.932019] Allocated by task 187:
[    7.932285] not ok 4 drm_sched_basic_modify_sched_tests
[    7.932486]  kasan_save_stack+0x33/0x60
[    7.932835]     KTAP version 1
[    7.933153]  kasan_save_track+0x14/0x30
[    7.933156]  __kasan_kmalloc+0x8f/0xa0
[    7.933652]     # Subtest: drm_sched_basic_credits_tests
[    7.934095]  __kmalloc_noprof+0x18a/0x440
[    7.934494]     # module: drm_sched_tests
[    7.934817]  kunit_kmalloc_array+0x1b/0x50
[    7.935201]     1..1
[    7.935589]  drm_mock_sched_job_new+0x8f/0x400
[    7.935592]  drm_sched_test_modify_sched+0x1cd/0x490
[    7.950666]  kunit_try_run_case+0x1ae/0x490
[    7.950977]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
[    7.951400]  kthread+0x30f/0x620
[    7.951656]  ret_from_fork+0x2f/0x70
[    7.951936]  ret_from_fork_asm+0x1a/0x30
[    7.952250]=20
[    7.952373] Freed by task 192:
[    7.952605]  kasan_save_stack+0x33/0x60
[    7.952884]  kasan_save_track+0x14/0x30
[    7.953169]  kasan_save_free_info+0x3b/0x60
[    7.953495]  __kasan_slab_free+0x37/0x50
[    7.953797]  kfree+0x12f/0x350
[    7.954035]  kunit_remove_resource+0x130/0x1f0
[    7.954379]  kunit_cleanup+0x6e/0x110
[    7.954656]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
[    7.955044]  kthread+0x30f/0x620
[    7.955286]  ret_from_fork+0x2f/0x70
[    7.955557]  ret_from_fork_asm+0x1a/0x30
[    7.955844]=20
[    7.955956] The buggy address belongs to the object at ffff8881092ec800
[    7.955956]  which belongs to the cache kmalloc-512 of size 512
[    7.956883] The buggy address is located 232 bytes inside of
[    7.956883]  freed 512-byte region [ffff8881092ec800, ffff8881092eca00)
[    7.957790]=20
[    7.957904] The buggy address belongs to the physical page:
[    7.958324] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0=
x0 pfn:0x1092e8
[    7.958925] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0=
 pincount:0
[    7.959527] flags: 0x200000000000040(head|node=3D0|zone=3D2)
[    7.959926] page_type: f5(slab)
[    7.960163] raw: 0200000000000040 ffff888100042c80 dead000000000122 0000=
000000000000
[    7.960743] raw: 0000000000000000 0000000080200020 00000000f5000000 0000=
000000000000
[    7.961304] head: 0200000000000040 ffff888100042c80 dead000000000122 000=
0000000000000
[    7.961880] head: 0000000000000000 0000000080200020 00000000f5000000 000=
0000000000000
[    7.962460] head: 0200000000000003 ffffea000424ba01 ffffffffffffffff 000=
0000000000000
[    7.963025] head: 0000000000000008 0000000000000000 00000000ffffffff 000=
0000000000000
[    7.963602] page dumped because: kasan: bad access detected
[    7.964001]=20
[    7.964113] Memory state around the buggy address:
[    7.964481]  ffff8881092ec780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc=
 fc fc
[    7.965007]  ffff8881092ec800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb=
 fb fb
[    7.965576] >ffff8881092ec880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb=
 fb fb
[    7.966120]                                                           ^
[    7.966625]  ffff8881092ec900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb=
 fb fb
[    7.967199]  ffff8881092ec980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb=
 fb fb
[    7.967734] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    7.968267] Disabling lock debugging due to kernel taint
[    8.999147]     # drm_sched_test_credits: ASSERTION FAILED at drivers/gp=
u/drm/scheduler/tests/mock_scheduler.c:295
[    8.999147]     Expected list_empty(&sched->base.pending_list) to be tru=
e, but is false
[    9.001031]     not ok 1 drm_sched_test_credits
[    9.001034] not ok 5 drm_sched_basic_credits_tests



>=20
> > On which commit do you apply and test this series? Tell me, then I
> > test again.
>=20
> Depending on the setup, these three:
>=20
> commit 413ae464b8021542ad90cb1fbb15f8efc5050a5d
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:=C2=A0=C2=A0 Mon Mar 3 16:41:48 2025 +0100
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 drm-tip: 2025y-03m-03d-15h-40m-53s UTC integrati=
on manifest
>=20
> commit 5bcb67a2a4c61034f5a25c024631c5fbf351ee8d
> Author: Matt Coster <matt.coster@imgtec.com>
> Date:=C2=A0=C2=A0 Wed Feb 26 10:01:09 2025 +0000
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 drm-tip: 2025y-02m-26d-09h-59m-48s UTC integrati=
on manifest
>=20
> commit 777e1850811f9864aa8b55940634d3da19712bf7
> Author: Imre Deak <imre.deak@intel.com>
> Date:=C2=A0=C2=A0 Tue Mar 11 11:31:04 2025 +0200
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 drm-tip: 2025y-03m-11d-09h-30m-13s UTC integrati=
on manifest
>=20
> Regards,
>=20
> Tvrtko
>=20
> > [=C2=A0=C2=A0=C2=A0 3.902457] Loaded X.509 cert 'sforshee: 00b28ddf47ae=
f9cea7'
> > [=C2=A0=C2=A0=C2=A0 3.903376] Loaded X.509 cert 'wens:
> > 61c038651aabdcf94bd0ac7ff06c7248db18c600'
> > [=C2=A0=C2=A0=C2=A0 3.904064] platform regulatory.0: Direct firmware lo=
ad for
> > regulatory.db failed with error -2
> > [=C2=A0=C2=A0=C2=A0 3.904673] cfg80211: failed to load regulatory.db
> > [=C2=A0=C2=A0=C2=A0 3.905037] ALSA device list:
> > [=C2=A0=C2=A0=C2=A0 3.905376]=C2=A0=C2=A0 No soundcards found.
> > [=C2=A0=C2=A0=C2=A0 3.905631] KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.905834] 1..17
> > [=C2=A0=C2=A0=C2=A0 3.906732]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.906999]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit_=
executor_test
> > [=C2=A0=C2=A0=C2=A0 3.907335]=C2=A0=C2=A0=C2=A0=C2=A0 # module: kunit
> > [=C2=A0=C2=A0=C2=A0 3.907337]=C2=A0=C2=A0=C2=A0=C2=A0 1..8
> > [=C2=A0=C2=A0=C2=A0 3.908476]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 parse_filter=
_test
> > [=C2=A0=C2=A0=C2=A0 3.909064]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2 filter_suite=
s_test
> > [=C2=A0=C2=A0=C2=A0 3.909801]=C2=A0=C2=A0=C2=A0=C2=A0 ok 3 filter_suite=
s_test_glob_test
> > [=C2=A0=C2=A0=C2=A0 3.910678]=C2=A0=C2=A0=C2=A0=C2=A0 ok 4 filter_suite=
s_to_empty_test
> > [=C2=A0=C2=A0=C2=A0 3.911621]=C2=A0=C2=A0=C2=A0=C2=A0 ok 5 parse_filter=
_attr_test
> > [=C2=A0=C2=A0=C2=A0 3.912641]=C2=A0=C2=A0=C2=A0=C2=A0 ok 6 filter_attr_=
test
> > [=C2=A0=C2=A0=C2=A0 3.913511]=C2=A0=C2=A0=C2=A0=C2=A0 ok 7 filter_attr_=
empty_test
> > [=C2=A0=C2=A0=C2=A0 3.914081]=C2=A0=C2=A0=C2=A0=C2=A0 ok 8 filter_attr_=
skip_test
> > [=C2=A0=C2=A0=C2=A0 3.914400] # kunit_executor_test: pass:8 fail:0 skip=
:0 total:8
> > [=C2=A0=C2=A0=C2=A0 3.914685] # Totals: pass:8 fail:0 skip:0 total:8
> > [=C2=A0=C2=A0=C2=A0 3.915121] ok 1 kunit_executor_test
> > [=C2=A0=C2=A0=C2=A0 3.915736]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.915949]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit-=
try-catch-test
> > [=C2=A0=C2=A0=C2=A0 3.916314]=C2=A0=C2=A0=C2=A0=C2=A0 # module: kunit_t=
est
> > [=C2=A0=C2=A0=C2=A0 3.916315]=C2=A0=C2=A0=C2=A0=C2=A0 1..2
> > [=C2=A0=C2=A0=C2=A0 3.917655]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1
> > kunit_test_try_catch_successful_try_no_catch
> > [=C2=A0=C2=A0=C2=A0 3.917979]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2
> > kunit_test_try_catch_unsuccessful_try_does_catch
> > [=C2=A0=C2=A0=C2=A0 3.918630] # kunit-try-catch-test: pass:2 fail:0 ski=
p:0 total:2
> > [=C2=A0=C2=A0=C2=A0 3.919118] # Totals: pass:2 fail:0 skip:0 total:2
> > [=C2=A0=C2=A0=C2=A0 3.919578] ok 2 kunit-try-catch-test
> > [=C2=A0=C2=A0=C2=A0 3.920248]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.920473]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit-=
resource-test
> > [=C2=A0=C2=A0=C2=A0 3.920796]=C2=A0=C2=A0=C2=A0=C2=A0 # module: kunit_t=
est
> > [=C2=A0=C2=A0=C2=A0 3.920797]=C2=A0=C2=A0=C2=A0=C2=A0 1..12
> > [=C2=A0=C2=A0=C2=A0 3.921565]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 kunit_resour=
ce_test_init_resources
> > [=C2=A0=C2=A0=C2=A0 3.921793]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2 kunit_resour=
ce_test_alloc_resource
> > [=C2=A0=C2=A0=C2=A0 3.922449]=C2=A0=C2=A0=C2=A0=C2=A0 ok 3 kunit_resour=
ce_test_destroy_resource
> > [=C2=A0=C2=A0=C2=A0 3.923013]=C2=A0=C2=A0=C2=A0=C2=A0 ok 4 kunit_resour=
ce_test_remove_resource
> > [=C2=A0=C2=A0=C2=A0 3.924438]=C2=A0=C2=A0=C2=A0=C2=A0 ok 5 kunit_resour=
ce_test_cleanup_resources
> > [=C2=A0=C2=A0=C2=A0 3.925834]=C2=A0=C2=A0=C2=A0=C2=A0 ok 6 kunit_resour=
ce_test_proper_free_ordering
> > [=C2=A0=C2=A0=C2=A0 3.926700]=C2=A0=C2=A0=C2=A0=C2=A0 ok 7 kunit_resour=
ce_test_static
> > [=C2=A0=C2=A0=C2=A0 3.927588]=C2=A0=C2=A0=C2=A0=C2=A0 ok 8 kunit_resour=
ce_test_named
> > [=C2=A0=C2=A0=C2=A0 3.928244]=C2=A0=C2=A0=C2=A0=C2=A0 ok 9 kunit_resour=
ce_test_action
> > [=C2=A0=C2=A0=C2=A0 3.928774]=C2=A0=C2=A0=C2=A0=C2=A0 ok 10 kunit_resou=
rce_test_remove_action
> > [=C2=A0=C2=A0=C2=A0 3.929309]=C2=A0=C2=A0=C2=A0=C2=A0 ok 11 kunit_resou=
rce_test_release_action
> > [=C2=A0=C2=A0=C2=A0 3.929826] action_order_2
> > [=C2=A0=C2=A0=C2=A0 3.930325] action_order_2
> > [=C2=A0=C2=A0=C2=A0 3.930521] action_order_1
> > [=C2=A0=C2=A0=C2=A0 3.931007]=C2=A0=C2=A0=C2=A0=C2=A0 ok 12 kunit_resou=
rce_test_action_ordering
> > [=C2=A0=C2=A0=C2=A0 3.931308] # kunit-resource-test: pass:12 fail:0 ski=
p:0
> > total:12
> > [=C2=A0=C2=A0=C2=A0 3.931702] # Totals: pass:12 fail:0 skip:0 total:12
> > [=C2=A0=C2=A0=C2=A0 3.932183] ok 3 kunit-resource-test
> > [=C2=A0=C2=A0=C2=A0 3.932809]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.933040]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit-=
log-test
> > [=C2=A0=C2=A0=C2=A0 3.933367]=C2=A0=C2=A0=C2=A0=C2=A0 # module: kunit_t=
est
> > [=C2=A0=C2=A0=C2=A0 3.933368]=C2=A0=C2=A0=C2=A0=C2=A0 1..2
> > [=C2=A0=C2=A0=C2=A0 3.934030] put this in log.
> > [=C2=A0=C2=A0=C2=A0 3.934033] this too.
> > [=C2=A0=C2=A0=C2=A0 3.934305] add to suite log.
> > [=C2=A0=C2=A0=C2=A0 3.934500] along with this.
> > [=C2=A0=C2=A0=C2=A0 3.934982]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 kunit_log_te=
st
> > [=C2=A0=C2=A0=C2=A0 3.935405]=C2=A0=C2=A0=C2=A0=C2=A0 # kunit_log_newli=
ne_test: Add newline
> > [=C2=A0=C2=A0=C2=A0 3.936164]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2 kunit_log_ne=
wline_test # SKIP only useful
> > when debugfs is enabled
> > [=C2=A0=C2=A0=C2=A0 3.936166] # kunit-log-test: pass:1 fail:0 skip:1 to=
tal:2
> > [=C2=A0=C2=A0=C2=A0 3.936752] # Totals: pass:1 fail:0 skip:1 total:2
> > [=C2=A0=C2=A0=C2=A0 3.937197] ok 4 kunit-log-test
> > [=C2=A0=C2=A0=C2=A0 3.937776]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.938004]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit_=
status
> > [=C2=A0=C2=A0=C2=A0 3.938324]=C2=A0=C2=A0=C2=A0=C2=A0 # module: kunit_t=
est
> > [=C2=A0=C2=A0=C2=A0 3.938325]=C2=A0=C2=A0=C2=A0=C2=A0 1..2
> > [=C2=A0=C2=A0=C2=A0 3.938921]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 kunit_status=
_set_failure_test
> > [=C2=A0=C2=A0=C2=A0 3.939049]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2 kunit_status=
_mark_skipped_test
> > [=C2=A0=C2=A0=C2=A0 3.939445] # kunit_status: pass:2 fail:0 skip:0 tota=
l:2
> > [=C2=A0=C2=A0=C2=A0 3.939816] # Totals: pass:2 fail:0 skip:0 total:2
> > [=C2=A0=C2=A0=C2=A0 3.940436] ok 5 kunit_status
> > [=C2=A0=C2=A0=C2=A0 3.941142]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.941508]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit_=
current
> > [=C2=A0=C2=A0=C2=A0 3.941793]=C2=A0=C2=A0=C2=A0=C2=A0 # module: kunit_t=
est
> > [=C2=A0=C2=A0=C2=A0 3.941794]=C2=A0=C2=A0=C2=A0=C2=A0 1..2
> > [=C2=A0=C2=A0=C2=A0 3.942526]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 kunit_curren=
t_test
> > [=C2=A0=C2=A0=C2=A0 3.942596]=C2=A0=C2=A0=C2=A0=C2=A0 # fake test: lib/=
kunit/kunit-test.c:722: This
> > should make `fake` test fail.
> > [=C2=A0=C2=A0=C2=A0 3.943302]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2 kunit_curren=
t_fail_test
> > [=C2=A0=C2=A0=C2=A0 3.943908] # kunit_current: pass:2 fail:0 skip:0 tot=
al:2
> > [=C2=A0=C2=A0=C2=A0 3.944271] # Totals: pass:2 fail:0 skip:0 total:2
> > [=C2=A0=C2=A0=C2=A0 3.944661] ok 6 kunit_current
> > [=C2=A0=C2=A0=C2=A0 3.945285]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.945511]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit_=
device
> > [=C2=A0=C2=A0=C2=A0 3.945789]=C2=A0=C2=A0=C2=A0=C2=A0 # module: kunit_t=
est
> > [=C2=A0=C2=A0=C2=A0 3.945790]=C2=A0=C2=A0=C2=A0=C2=A0 1..3
> > [=C2=A0=C2=A0=C2=A0 3.946905]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 kunit_device=
_test
> > [=C2=A0=C2=A0=C2=A0 3.947420]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2 kunit_device=
_cleanup_test
> > [=C2=A0=C2=A0=C2=A0 3.948621]=C2=A0=C2=A0=C2=A0=C2=A0 ok 3 kunit_device=
_driver_test
> > [=C2=A0=C2=A0=C2=A0 3.948972] # kunit_device: pass:3 fail:0 skip:0 tota=
l:3
> > [=C2=A0=C2=A0=C2=A0 3.949349] # Totals: pass:3 fail:0 skip:0 total:3
> > [=C2=A0=C2=A0=C2=A0 3.949760] ok 7 kunit_device
> > [=C2=A0=C2=A0=C2=A0 3.950395]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.950617]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit_=
fault
> > [=C2=A0=C2=A0=C2=A0 3.950889]=C2=A0=C2=A0=C2=A0=C2=A0 # module: kunit_t=
est
> > [=C2=A0=C2=A0=C2=A0 3.950890]=C2=A0=C2=A0=C2=A0=C2=A0 1..1
> > [=C2=A0=C2=A0=C2=A0 3.951773] Oops: general protection fault, probably =
for non-
> > canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
> > PTI
> > [=C2=A0=C2=A0=C2=A0 3.952672] KASAN: null-ptr-deref in range [0x0000000=
000000000-
> > 0x0000000000000007]
> > [=C2=A0=C2=A0=C2=A0 3.953239] CPU: 2 UID: 0 PID: 225 Comm: kunit_try_ca=
tch
> > Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 N 6.14.0-rc4-00388-g712b7c2f4d5d #21
> > [=C2=A0=C2=A0=C2=A0 3.954000] Tainted: [N]=3DTEST
> > [=C2=A0=C2=A0=C2=A0 3.954245] Hardware name: QEMU Standard PC (i440FX +=
 PIIX,
> > 1996), BIOS 1.16.3-2.fc40 04/01/2014
> > [=C2=A0=C2=A0=C2=A0 3.954850] RIP: 0010:kunit_test_null_dereference+0x4=
a/0x150
> > [=C2=A0=C2=A0=C2=A0 3.955285] Code: b5 41 48 c7 44 24 08 98 95 51 ba 48=
 c1 ed 03
> > 48 c7 44 24 10 40 af 3b b7 48 8d 54 05 00 c7 02 f1 f1 f1 f1 c7 42
> > 04 01 f3 f3 f3 <0f> b6 04
> > [=C2=A0=C2=A0=C2=A0 3.956604] RSP: 0000:ffff88810920fe00 EFLAGS: 00010a=
06
> > [=C2=A0=C2=A0=C2=A0 3.956972] RAX: dffffc0000000000 RBX: ffff88810088fb=
30 RCX:
> > ffffffffb65da11d
> > [=C2=A0=C2=A0=C2=A0 3.957651] RDX: ffffed1021241fc0 RSI: 00000000000000=
08 RDI:
> > ffff88810088fb30
> > [=C2=A0=C2=A0=C2=A0 3.958317] RBP: 1ffff11021241fc0 R08: 00000000000000=
00 R09:
> > ffffed10207de600
> > [=C2=A0=C2=A0=C2=A0 3.958849] R10: ffff888103ef3007 R11: 00000000000000=
00 R12:
> > ffffffffb73baf40
> > [=C2=A0=C2=A0=C2=A0 3.959425] R13: ffffffffb73b1c60 R14: ffff8881038a9d=
80 R15:
> > ffff8881091c6ac0
> > [=C2=A0=C2=A0=C2=A0 3.959917] FS:=C2=A0 0000000000000000(0000)
> > GS:ffff888a88700000(0000) knlGS:0000000000000000
> > [=C2=A0=C2=A0=C2=A0 3.960521] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000=
0000080050033
> > [=C2=A0=C2=A0=C2=A0 3.960920] CR2: 0000000000000000 CR3: 0000000b1406a0=
00 CR4:
> > 00000000000006f0
> > [=C2=A0=C2=A0=C2=A0 3.961480] Call Trace:
> > [=C2=A0=C2=A0=C2=A0 3.961655]=C2=A0 <TASK>
> > [=C2=A0=C2=A0=C2=A0 3.961805]=C2=A0 ? die_addr+0x3b/0xa0
> > [=C2=A0=C2=A0=C2=A0 3.962052]=C2=A0 ? exc_general_protection+0x151/0x22=
0
> > [=C2=A0=C2=A0=C2=A0 3.962439]=C2=A0 ? asm_exc_general_protection+0x26/0=
x30
> > [=C2=A0=C2=A0=C2=A0 3.962801]=C2=A0 ?
> > __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.963447]=C2=A0 ? __pfx_kunit_test_null_dereference=
+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.964150]=C2=A0 ? __kthread_parkme+0x7d/0x140
> > [=C2=A0=C2=A0=C2=A0 3.964443]=C2=A0 ? kunit_test_null_dereference+0x4a/=
0x150
> > [=C2=A0=C2=A0=C2=A0 3.964785]=C2=A0 ? __pfx_kunit_test_null_dereference=
+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.965205]=C2=A0 ? __kthread_parkme+0x7d/0x140
> > [=C2=A0=C2=A0=C2=A0 3.965494]=C2=A0 kunit_generic_run_threadfn_adapter+=
0x7b/0xe0
> > [=C2=A0=C2=A0=C2=A0 3.965859]=C2=A0 kthread+0x30f/0x620
> > [=C2=A0=C2=A0=C2=A0 3.966108]=C2=A0 ? __pfx_kthread+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.966406]=C2=A0 ? __pfx_kthread+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.966680]=C2=A0 ret_from_fork+0x2f/0x70
> > [=C2=A0=C2=A0=C2=A0 3.966941]=C2=A0 ? __pfx_kthread+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.967264]=C2=A0 ret_from_fork_asm+0x1a/0x30
> > [=C2=A0=C2=A0=C2=A0 3.967560]=C2=A0 </TASK>
> > [=C2=A0=C2=A0=C2=A0 3.967722] Modules linked in:
> > [=C2=A0=C2=A0=C2=A0 3.967989] ---[ end trace 0000000000000000 ]---
> > [=C2=A0=C2=A0=C2=A0 3.968368] RIP: 0010:kunit_test_null_dereference+0x4=
a/0x150
> > [=C2=A0=C2=A0=C2=A0 3.968780] Code: b5 41 48 c7 44 24 08 98 95 51 ba 48=
 c1 ed 03
> > 48 c7 44 24 10 40 af 3b b7 48 8d 54 05 00 c7 02 f1 f1 f1 f1 c7 42
> > 04 01 f3 f3 f3 <0f> b6 04
> > [=C2=A0=C2=A0=C2=A0 3.970211] RSP: 0000:ffff88810920fe00 EFLAGS: 00010a=
06
> > [=C2=A0=C2=A0=C2=A0 3.970567] RAX: dffffc0000000000 RBX: ffff88810088fb=
30 RCX:
> > ffffffffb65da11d
> > [=C2=A0=C2=A0=C2=A0 3.971074] RDX: ffffed1021241fc0 RSI: 00000000000000=
08 RDI:
> > ffff88810088fb30
> > [=C2=A0=C2=A0=C2=A0 3.971580] RBP: 1ffff11021241fc0 R08: 00000000000000=
00 R09:
> > ffffed10207de600
> > [=C2=A0=C2=A0=C2=A0 3.972089] R10: ffff888103ef3007 R11: 00000000000000=
00 R12:
> > ffffffffb73baf40
> > [=C2=A0=C2=A0=C2=A0 3.972629] R13: ffffffffb73b1c60 R14: ffff8881038a9d=
80 R15:
> > ffff8881091c6ac0
> > [=C2=A0=C2=A0=C2=A0 3.973176] FS:=C2=A0 0000000000000000(0000)
> > GS:ffff888a88700000(0000) knlGS:0000000000000000
> > [=C2=A0=C2=A0=C2=A0 3.973720] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000=
0000080050033
> > [=C2=A0=C2=A0=C2=A0 3.974148] CR2: 0000000000000000 CR3: 0000000b1406a0=
00 CR4:
> > 00000000000006f0
> > [=C2=A0=C2=A0=C2=A0 3.974659] kunit_try_catch (225) used greatest stack=
 depth:
> > 28416 bytes left
> > [=C2=A0=C2=A0=C2=A0 3.974764]=C2=A0=C2=A0=C2=A0=C2=A0 # kunit_test_faul=
t_null_dereference: try
> > faulted: last line seen lib/kunit/kunit-test.c:95
> > [=C2=A0=C2=A0=C2=A0 3.976367]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 kunit_test_f=
ault_null_dereference
> > [=C2=A0=C2=A0=C2=A0 3.976370] ok 8 kunit_fault
> > [=C2=A0=C2=A0=C2=A0 3.976946]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.977208]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit_=
platform_device
> > [=C2=A0=C2=A0=C2=A0 3.977549]=C2=A0=C2=A0=C2=A0=C2=A0 # module: platfor=
m_test
> > [=C2=A0=C2=A0=C2=A0 3.977550]=C2=A0=C2=A0=C2=A0=C2=A0 1..4
> > [=C2=A0=C2=A0=C2=A0 3.978550]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 kunit_platfo=
rm_device_alloc_test
> > [=C2=A0=C2=A0=C2=A0 3.978989]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2 kunit_platfo=
rm_device_add_test
> > [=C2=A0=C2=A0=C2=A0 3.980097] sysfs: cannot create duplicate filename
> > '/devices/platform/kunit-platform-add-2'
> > [=C2=A0=C2=A0=C2=A0 3.981138] CPU: 7 UID: 0 PID: 231 Comm: kunit_try_ca=
tch
> > Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 N 6.14.0-rc4-00388-g712b7c2f4d5d #21
> > [=C2=A0=C2=A0=C2=A0 3.981142] Tainted: [D]=3DDIE, [N]=3DTEST
> > [=C2=A0=C2=A0=C2=A0 3.981143] Hardware name: QEMU Standard PC (i440FX +=
 PIIX,
> > 1996), BIOS 1.16.3-2.fc40 04/01/2014
> > [=C2=A0=C2=A0=C2=A0 3.981144] Call Trace:
> > [=C2=A0=C2=A0=C2=A0 3.981145]=C2=A0 <TASK>
> > [=C2=A0=C2=A0=C2=A0 3.981146]=C2=A0 dump_stack_lvl+0x53/0x70
> > [=C2=A0=C2=A0=C2=A0 3.981151]=C2=A0 sysfs_warn_dup+0x70/0x90
> > [=C2=A0=C2=A0=C2=A0 3.981154]=C2=A0 sysfs_create_dir_ns+0x209/0x280
> > [=C2=A0=C2=A0=C2=A0 3.981156]=C2=A0 ? __pfx_sysfs_create_dir_ns+0x10/0x=
10
> > [=C2=A0=C2=A0=C2=A0 3.981159]=C2=A0 ? _raw_spin_lock+0x80/0xe0
> > [=C2=A0=C2=A0=C2=A0 3.981161]=C2=A0 kobject_add_internal+0x216/0x8b0
> > [=C2=A0=C2=A0=C2=A0 3.981163]=C2=A0 kobject_add+0x13b/0x200
> > [=C2=A0=C2=A0=C2=A0 3.981165]=C2=A0 ? __pfx_kobject_add+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.981167]=C2=A0 ? kobject_get+0x50/0xe0
> > [=C2=A0=C2=A0=C2=A0 3.981169]=C2=A0 device_add+0x217/0x1460
> > [=C2=A0=C2=A0=C2=A0 3.981171]=C2=A0 ? __pfx_device_add+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.981173]=C2=A0 ? _raw_spin_lock_irqsave+0x86/0xe0
> > [=C2=A0=C2=A0=C2=A0 3.981174]=C2=A0 ? __pfx__raw_spin_lock_irqsave+0x10=
/0x10
> > [=C2=A0=C2=A0=C2=A0 3.981176]=C2=A0 ? device_initialize+0x1f4/0x410
> > [=C2=A0=C2=A0=C2=A0 3.981179]=C2=A0 ? platform_device_alloc+0x97/0x200
> > [=C2=A0=C2=A0=C2=A0 3.981182]=C2=A0 platform_device_add+0x375/0x5b0
> > [=C2=A0=C2=A0=C2=A0 3.981184]=C2=A0 kunit_platform_device_add+0x20/0x2c=
0
> > [=C2=A0=C2=A0=C2=A0 3.981186]=C2=A0
> > kunit_platform_device_add_twice_fails_test+0x1f5/0x420
> > [=C2=A0=C2=A0=C2=A0 3.981189]=C2=A0 ?
> > __pfx_kunit_platform_device_add_twice_fails_test+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.981191]=C2=A0 ? __schedule+0xdda/0x24f0
> > [=C2=A0=C2=A0=C2=A0 3.981193]=C2=A0 ? kvm_clock_get_cycles+0x18/0x30
> > [=C2=A0=C2=A0=C2=A0 3.981196]=C2=A0 ? ktime_get_ts64+0x7d/0x220
> > [=C2=A0=C2=A0=C2=A0 3.981200]=C2=A0 kunit_try_run_case+0x1ae/0x490
> > [=C2=A0=C2=A0=C2=A0 3.981202]=C2=A0 ? __pfx_kunit_try_run_case+0x10/0x1=
0
> > [=C2=A0=C2=A0=C2=A0 3.981204]=C2=A0 ? _raw_spin_lock_irqsave+0x86/0xe0
> > [=C2=A0=C2=A0=C2=A0 3.981205]=C2=A0 ? __pfx_kunit_try_run_case+0x10/0x1=
0
> > [=C2=A0=C2=A0=C2=A0 3.981207]=C2=A0 ?
> > __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.981210]=C2=A0 kunit_generic_run_threadfn_adapter+=
0x7b/0xe0
> > [=C2=A0=C2=A0=C2=A0 3.981212]=C2=A0 kthread+0x30f/0x620
> > [=C2=A0=C2=A0=C2=A0 3.981214]=C2=A0 ? __pfx_kthread+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.981216]=C2=A0 ? __pfx_kthread+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.981217]=C2=A0 ret_from_fork+0x2f/0x70
> > [=C2=A0=C2=A0=C2=A0 3.981223]=C2=A0 ? __pfx_kthread+0x10/0x10
> > [=C2=A0=C2=A0=C2=A0 3.981225]=C2=A0 ret_from_fork_asm+0x1a/0x30
> > [=C2=A0=C2=A0=C2=A0 3.981227]=C2=A0 </TASK>
> > [=C2=A0=C2=A0=C2=A0 3.981232] kobject: kobject_add_internal failed for =
kunit-
> > platform-add-2 with -EEXIST, don't try to register things with the
> > same name in the same direc.
> > [=C2=A0=C2=A0=C2=A0 3.995255] kunit_try_catch (231) used greatest stack=
 depth:
> > 27528 bytes left
> > [=C2=A0=C2=A0=C2=A0 3.995525]=C2=A0=C2=A0=C2=A0=C2=A0 ok 3 kunit_platfo=
rm_device_add_twice_fails_test
> > [=C2=A0=C2=A0=C2=A0 3.996247]=C2=A0=C2=A0=C2=A0=C2=A0 ok 4 kunit_platfo=
rm_device_add_cleans_up
> > [=C2=A0=C2=A0=C2=A0 3.996678] # kunit_platform_device: pass:4 fail:0 sk=
ip:0
> > total:4
> > [=C2=A0=C2=A0=C2=A0 3.997073] # Totals: pass:4 fail:0 skip:0 total:4
> > [=C2=A0=C2=A0=C2=A0 3.997530] ok 9 kunit_platform_device
> > [=C2=A0=C2=A0=C2=A0 3.998130]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 3.998356]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit_=
platform_driver
> > [=C2=A0=C2=A0=C2=A0 3.998664]=C2=A0=C2=A0=C2=A0=C2=A0 # module: platfor=
m_test
> > [=C2=A0=C2=A0=C2=A0 3.998665]=C2=A0=C2=A0=C2=A0=C2=A0 1..2
> > [=C2=A0=C2=A0=C2=A0 3.999663]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 kunit_platfo=
rm_driver_register_test
> > [=C2=A0=C2=A0=C2=A0 4.000372]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2
> > kunit_platform_device_prepare_wait_for_probe_completes_when_already
> > _probed
> > [=C2=A0=C2=A0=C2=A0 4.000750] # kunit_platform_driver: pass:2 fail:0 sk=
ip:0
> > total:2
> > [=C2=A0=C2=A0=C2=A0 4.001372] # Totals: pass:2 fail:0 skip:0 total:2
> > [=C2=A0=C2=A0=C2=A0 4.001777] ok 10 kunit_platform_driver
> > [=C2=A0=C2=A0=C2=A0 4.002412]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 4.002618]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: string=
-stream-test
> > [=C2=A0=C2=A0=C2=A0 4.002909]=C2=A0=C2=A0=C2=A0=C2=A0 # module: string_=
stream_test
> > [=C2=A0=C2=A0=C2=A0 4.002910]=C2=A0=C2=A0=C2=A0=C2=A0 1..12
> > [=C2=A0=C2=A0=C2=A0 4.003643]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 string_strea=
m_managed_init_test
> > [=C2=A0=C2=A0=C2=A0 4.003919]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2 string_strea=
m_unmanaged_init_test
> > [=C2=A0=C2=A0=C2=A0 4.004581]=C2=A0=C2=A0=C2=A0=C2=A0 ok 3 string_strea=
m_managed_free_test
> > [=C2=A0=C2=A0=C2=A0 4.005295]=C2=A0=C2=A0=C2=A0=C2=A0 ok 4 string_strea=
m_resource_free_test
> > [=C2=A0=C2=A0=C2=A0 4.007076]=C2=A0=C2=A0=C2=A0=C2=A0 ok 5 string_strea=
m_line_add_test
> > [=C2=A0=C2=A0=C2=A0 4.008801]=C2=A0=C2=A0=C2=A0=C2=A0 ok 6 string_strea=
m_variable_length_line_test
> > [=C2=A0=C2=A0=C2=A0 4.009944]=C2=A0=C2=A0=C2=A0=C2=A0 ok 7 string_strea=
m_append_test
> > [=C2=A0=C2=A0=C2=A0 4.010840]=C2=A0=C2=A0=C2=A0=C2=A0 ok 8 string_strea=
m_append_auto_newline_test
> > [=C2=A0=C2=A0=C2=A0 4.011461]=C2=A0=C2=A0=C2=A0=C2=A0 ok 9 string_strea=
m_append_empty_string_test
> > [=C2=A0=C2=A0=C2=A0 4.012233]=C2=A0=C2=A0=C2=A0=C2=A0 ok 10 string_stre=
am_no_auto_newline_test
> > [=C2=A0=C2=A0=C2=A0 4.013158]=C2=A0=C2=A0=C2=A0=C2=A0 ok 11 string_stre=
am_auto_newline_test
> > [=C2=A0=C2=A0=C2=A0 4.063760]=C2=A0=C2=A0=C2=A0=C2=A0 # string_stream_p=
erformance_test: Time
> > elapsed:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 49=
385 us
> > [=C2=A0=C2=A0=C2=A0 4.064713]=C2=A0=C2=A0=C2=A0=C2=A0 # string_stream_p=
erformance_test: Total string
> > length:=C2=A0=C2=A0=C2=A0 573890
> > [=C2=A0=C2=A0=C2=A0 4.065271]=C2=A0=C2=A0=C2=A0=C2=A0 # string_stream_p=
erformance_test: Bytes
> > requested:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 823930
> > [=C2=A0=C2=A0=C2=A0 4.065803]=C2=A0=C2=A0=C2=A0=C2=A0 # string_stream_p=
erformance_test: Actual bytes
> > allocated: 1048312
> > [=C2=A0=C2=A0=C2=A0 4.098820]=C2=A0=C2=A0=C2=A0=C2=A0 ok 12 string_stre=
am_performance_test
> > [=C2=A0=C2=A0=C2=A0 4.098826] # string-stream-test: pass:12 fail:0 skip=
:0 total:12
> > [=C2=A0=C2=A0=C2=A0 4.099348] # Totals: pass:12 fail:0 skip:0 total:12
> > [=C2=A0=C2=A0=C2=A0 4.099814] ok 11 string-stream-test
> > [=C2=A0=C2=A0=C2=A0 4.100495]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 4.100735]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: kunit-=
assert
> > [=C2=A0=C2=A0=C2=A0 4.101048]=C2=A0=C2=A0=C2=A0=C2=A0 # module: assert_=
test
> > [=C2=A0=C2=A0=C2=A0 4.101050]=C2=A0=C2=A0=C2=A0=C2=A0 1..11
> > [=C2=A0=C2=A0=C2=A0 4.101943]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 kunit_test_i=
s_literal
> > [=C2=A0=C2=A0=C2=A0 4.102331]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2 kunit_test_i=
s_str_literal
> > [=C2=A0=C2=A0=C2=A0 4.103177]=C2=A0=C2=A0=C2=A0=C2=A0 ok 3 kunit_test_a=
ssert_prologue
> > [=C2=A0=C2=A0=C2=A0 4.103996]=C2=A0=C2=A0=C2=A0=C2=A0 ok 4 kunit_test_a=
ssert_print_msg
> > [=C2=A0=C2=A0=C2=A0 4.104867]=C2=A0=C2=A0=C2=A0=C2=A0 ok 5 kunit_test_u=
nary_assert_format
> > [=C2=A0=C2=A0=C2=A0 4.105908]=C2=A0=C2=A0=C2=A0=C2=A0 ok 6 kunit_test_p=
tr_not_err_assert_format
> > [=C2=A0=C2=A0=C2=A0 4.107022]=C2=A0=C2=A0=C2=A0=C2=A0 ok 7 kunit_test_b=
inary_assert_format
> > [=C2=A0=C2=A0=C2=A0 4.107868]=C2=A0=C2=A0=C2=A0=C2=A0 ok 8 kunit_test_b=
inary_ptr_assert_format
> > [=C2=A0=C2=A0=C2=A0 4.108702]=C2=A0=C2=A0=C2=A0=C2=A0 ok 9 kunit_test_b=
inary_str_assert_format
> > [=C2=A0=C2=A0=C2=A0 4.109969]=C2=A0=C2=A0=C2=A0=C2=A0 ok 10 kunit_test_=
assert_hexdump
> > [=C2=A0=C2=A0=C2=A0 4.111490]=C2=A0=C2=A0=C2=A0=C2=A0 ok 11 kunit_test_=
mem_assert_format
> > [=C2=A0=C2=A0=C2=A0 4.111845] # kunit-assert: pass:11 fail:0 skip:0 tot=
al:11
> > [=C2=A0=C2=A0=C2=A0 4.112522] # Totals: pass:11 fail:0 skip:0 total:11
> > [=C2=A0=C2=A0=C2=A0 4.112949] ok 12 kunit-assert
> > [=C2=A0=C2=A0=C2=A0 4.113628]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 4.113867]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: drm_sc=
hed_basic_tests
> > [=C2=A0=C2=A0=C2=A0 4.114281]=C2=A0=C2=A0=C2=A0=C2=A0 # module: drm_sch=
ed_tests
> > [=C2=A0=C2=A0=C2=A0 4.114283]=C2=A0=C2=A0=C2=A0=C2=A0 1..3
> > [=C2=A0=C2=A0=C2=A0 4.234223] input: ImExPS/2 Generic Explorer Mouse as
> > /devices/platform/i8042/serio1/input/input3
> > [=C2=A0=C2=A0=C2=A0 4.617191]=C2=A0=C2=A0=C2=A0=C2=A0 ok 1 drm_sched_ba=
sic_submit
> > [=C2=A0=C2=A0=C2=A0 4.617197]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 4.617765]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 # Subtest: drm_sched_basic_test
> > [=C2=A0=C2=A0=C2=A0 4.719657]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ok 1 A queue of jobs in a single entity
> > [=C2=A0=C2=A0=C2=A0 4.821976]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ok 2 A chain of dependent jobs across
> > multiple entities
> > [=C2=A0=C2=A0=C2=A0 4.924015]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ok 3 Multiple independent job queues
> > [=C2=A0=C2=A0=C2=A0 5.026465]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ok 4 Multiple inter-dependent job queues
> > [=C2=A0=C2=A0=C2=A0 5.026907]=C2=A0=C2=A0=C2=A0=C2=A0 # drm_sched_basic=
_test: pass:4 fail:0 skip:0
> > total:4
> > [=C2=A0=C2=A0=C2=A0 5.027322]=C2=A0=C2=A0=C2=A0=C2=A0 ok 2 drm_sched_ba=
sic_test
> > [=C2=A0=C2=A0=C2=A0 5.080020]=C2=A0=C2=A0=C2=A0=C2=A0 ok 3 drm_sched_ba=
sic_entity_cleanup
> > [=C2=A0=C2=A0=C2=A0 5.080317] # drm_sched_basic_tests: pass:3 fail:0 sk=
ip:0
> > total:3
> > [=C2=A0=C2=A0=C2=A0 5.080657] # Totals: pass:6 fail:0 skip:0 total:6
> > [=C2=A0=C2=A0=C2=A0 5.081103] ok 13 drm_sched_basic_tests
> > [=C2=A0=C2=A0=C2=A0 5.081679]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version 1
> > [=C2=A0=C2=A0=C2=A0 5.081881]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: drm_sc=
hed_basic_timeout_tests
> > [=C2=A0=C2=A0=C2=A0 5.082259]=C2=A0=C2=A0=C2=A0=C2=A0 # module: drm_sch=
ed_tests
> > [=C2=A0=C2=A0=C2=A0 5.082260]=C2=A0=C2=A0=C2=A0=C2=A0 1..1
> >=20
> >=20
> >=20
> > >=20
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > >=20
> > > Tvrtko Ursulin (7):
> > > =C2=A0=C2=A0 drm: Move some options to separate new Kconfig
> > > =C2=A0=C2=A0 drm/sched: Add scheduler unit testing infrastructure and=
 some
> > > basic
> > > =C2=A0=C2=A0=C2=A0=C2=A0 tests
> > > =C2=A0=C2=A0 drm/sched: Add aspirational unit test mode
> > > =C2=A0=C2=A0 drm/sched: Add a simple timeout test
> > > =C2=A0=C2=A0 drm/sched: Add basic priority tests
> > > =C2=A0=C2=A0 drm/sched: Add a basic test for modifying entities sched=
uler
> > > list
> > > =C2=A0=C2=A0 drm/sched: Add a basic test for checking credit limit
> > >=20
> > > =C2=A0=C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 109 +---
> > > =C2=A0=C2=A0drivers/gpu/drm/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 128=
 +++++
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/.kunitconfig=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
> > > =C2=A0=C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 345
> > > +++++++++++++
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h | 224 +++++=
++++
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 476
> > > ++++++++++++++++++
> > > =C2=A0=C2=A08 files changed, 1199 insertions(+), 104 deletions(-)
> > > =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/Kconfig.debug
> > > =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
> > > =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/Makefi=
le
> > > =C2=A0=C2=A0create mode 100644
> > > drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > =C2=A0=C2=A0create mode 100644
> > > drivers/gpu/drm/scheduler/tests/sched_tests.h
> > > =C2=A0=C2=A0create mode 100644
> > > drivers/gpu/drm/scheduler/tests/tests_basic.c
> > >=20
> >=20
>=20

