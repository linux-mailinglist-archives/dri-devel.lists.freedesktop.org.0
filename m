Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CFA561AF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 08:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C968710EAF9;
	Fri,  7 Mar 2025 07:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Fe0n23hy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827BA10E340
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 07:21:34 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Z8HlZ2xJ6z9svM;
 Fri,  7 Mar 2025 08:21:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741332090; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+inEoO3lh33LpGfQnoDbSqZC49qhvFyKAvzD6asU9gM=;
 b=Fe0n23hy9Z1UnQRLsAsjUZ9F36gWyS1wGuOvh7fMIqiiuj3/pkURuMarkdtgc8+drJXu3r
 UI5mZpwBsLavGa++kZlyV779HA6eq3kOgl5tA3L0Vqtgkd8CIv9zBZwaKBAKyC53uOJJ0A
 Q1tsaGg1zT2eeyVfXs+naPmsdiPJ0i+AJmb/vscraz2HCnpdwkOVenjRtiAtbrFTXM2DOg
 eU05AJrB6kwqIoWT2x26RsiDRjIPreSNZuPYVQ1uFt7f2Vjt4XDrgdoZYu8REmiUD2PYZ+
 BVvB8gr/rPmCWmnHWA9aJhikoirNlS7czGPj0XbkYipjCAkJM+mAPVVs87b30Q==
Message-ID: <20fe30189a03f4eb241524c5a92cf1d52ee5081e.camel@mailbox.org>
Subject: Re: [PATCH v3 0/5] DRM scheduler kunit tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>
Date: Fri, 07 Mar 2025 08:21:27 +0100
In-Reply-To: <7fcc66f3-47c6-4867-829c-1a51e09e4d04@igalia.com>
References: <20250304131030.52850-1-tvrtko.ursulin@igalia.com>
 <00d9bf39713e995d62ffb10eb9a85028d213f3aa.camel@mailbox.org>
 <c2052196-b67e-407f-8d99-c4b26e9ed199@igalia.com>
 <d4f08145-df2f-4178-acad-3a55fa8ae82c@igalia.com>
 <7fcc66f3-47c6-4867-829c-1a51e09e4d04@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 7dcfccfd6f5acaffc81
X-MBO-RS-META: 11zfeuud6n7ym9xx7hee6chdb9t9jk87
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

On Thu, 2025-03-06 at 17:10 +0000, Tvrtko Ursulin wrote:
>=20
> On 06/03/2025 15:18, Tvrtko Ursulin wrote:
> >=20
> > On 06/03/2025 14:56, Tvrtko Ursulin wrote:
> > >=20
> > > On 06/03/2025 12:37, Philipp Stanner wrote:
> > > > On Tue, 2025-03-04 at 13:10 +0000, Tvrtko Ursulin wrote:
> > > > > There has repeatedly been quite a bit of apprehension when
> > > > > any change
> > > > > to the DRM
> > > > > scheduler is proposed, with two main reasons being code base
> > > > > is
> > > > > considered
> > > > > fragile, not well understood and not very well documented,
> > > > > and
> > > > > secondly the lack
> > > > > of systematic testing outside the vendor specific tests
> > > > > suites and/or
> > > > > test
> > > > > farms.
> > > > >=20
> > > > > This series is an attempt to dislodge this status quo by
> > > > > adding some
> > > > > unit tests
> > > > > using the kunit framework.
> > > > >=20
> > > > > General approach is that there is a mock "hardware" backend
> > > > > which can
> > > > > be
> > > > > controlled from tests, which in turn allows exercising
> > > > > various
> > > > > scheduler code
> > > > > paths.
> > > > >=20
> > > > > Only some simple basic tests get added in the series and
> > > > > hopefully it
> > > > > is easy to
> > > > > understand what tests are doing.
> > > > >=20
> > > > > An obligatory "screenshot" for reference:
> > > > >=20
> > > > > [14:29:37] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_t=
ests (3 subtests)
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > [14:29:38] [PASSED] drm_sched_basic_submit
> > > > > [14:29:38] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 drm_sched_basic_test
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > [14:29:38] [PASSED] A queue of jobs in a single entity
> > > > > [14:29:38] [PASSED] A chain of dependent jobs across multiple
> > > > > entities
> > > > > [14:29:38] [PASSED] Multiple independent job queues
> > > > > [14:29:38] [PASSED] Multiple inter-dependent job queues
> > > > > [14:29:38] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] dr=
m_sched_basic_test
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > [14:29:38] [PASSED] drm_sched_basic_entity_cleanup
> > > > > [14:29:38] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] dr=
m_sched_basic_tests
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > [14:29:38] =3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_timeout_tests=
 (1 subtest)
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > [14:29:40] [PASSED] drm_sched_basic_timeout
> > > > > [14:29:40] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basi=
c_timeout_tests
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > [14:29:40] =3D=3D=3D=3D=3D=3D=3D drm_sched_basic_priority_tests (=
2
> > > > > subtests)
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D
> > > > > [14:29:42] [PASSED] drm_sched_priorities
> > > > > [14:29:42] [PASSED] drm_sched_change_priority
> > > > > [14:29:42] =3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_p=
riority_tests
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > [14:29:42] =3D=3D=3D=3D=3D=3D drm_sched_basic_modify_sched_tests =
(1
> > > > > subtest)
> > > > > =3D=3D=3D=3D=3D=3D
> > > > > [14:29:43] [PASSED] drm_sched_test_modify_sched
> > > > > [14:29:43] =3D=3D=3D=3D=3D=3D=3D [PASSED]
> > > > > drm_sched_basic_modify_sched_tests
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D
> > > > > [14:29:43]
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > [14:29:43] Testing complete. Ran 10 tests: passed: 10
> > > > > [14:29:43] Elapsed time: 13.330s total, 0.001s configuring,
> > > > > 4.005s
> > > > > building, 9.276s running
> > > >=20
> > > > Yo,
> > > >=20
> > > > so I tried to test this all this in QEMU and I am encountering
> > > > some
> > > > explosions when I activate the scheduler tests. Just DRM tests
> > > > boot
> > > > fine.
> > > >=20
> > > > I'm using a kernel on relatively current drm-misc-next:
> > > > 44d2f310f008
> > > >=20
> > > > I apply your series, then
> > > > make defconfig
> > > > make menuconfig # switch on kunit framework and scheduler tests
> > > > install everything + initramfs
> > > >=20
> > > > Boot then causes errors as below. Just using the DRM kunit
> > > > tests works
> > > > fine.
> > > >=20
> > > > Excerpt of the first fault:
> > > >=20
> > > > [=C2=A0=C2=A0=C2=A0 1.040513] # kunit_device: pass:3 fail:0 skip:0 =
total:3
> > > > [=C2=A0=C2=A0=C2=A0 1.040867] # Totals: pass:3 fail:0 skip:0 total:=
3
> > > > [=C2=A0=C2=A0=C2=A0 1.041296] ok 7 kunit_device
> > > > [=C2=A0=C2=A0=C2=A0 1.041936]=C2=A0=C2=A0=C2=A0=C2=A0 KTAP version =
1
> > > > [=C2=A0=C2=A0=C2=A0 1.042186]=C2=A0=C2=A0=C2=A0=C2=A0 # Subtest: ku=
nit_fault
> > > > [=C2=A0=C2=A0=C2=A0 1.042517]=C2=A0=C2=A0=C2=A0=C2=A0 # module: kun=
it_test
> > > > [=C2=A0=C2=A0=C2=A0 1.042517]=C2=A0=C2=A0=C2=A0=C2=A0 1..1
> > > > [=C2=A0=C2=A0=C2=A0 1.043147] BUG: kernel NULL pointer dereference,=
 address:=20
> > > > 0000000000000000
> > > > [=C2=A0=C2=A0=C2=A0 1.043765] #PF: supervisor write access in kerne=
l mode
> > > > [=C2=A0=C2=A0=C2=A0 1.044189] #PF: error_code(0x0002) - not-present=
 page
> > > > [=C2=A0=C2=A0=C2=A0 1.044617] PGD 0 P4D 0
> > > > [=C2=A0=C2=A0=C2=A0 1.044818] Oops: Oops: 0002 [#1] PREEMPT SMP PTI
> > > > [=C2=A0=C2=A0=C2=A0 1.045380] CPU: 7 UID: 0 PID: 214 Comm: kunit_tr=
y_catch
> > > > Tainted:=20
> > > > G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 N 6.14.0-rc4-00387-g33e4632926a0 #8
> > > > [=C2=A0=C2=A0=C2=A0 1.046262] Tainted: [N]=3DTEST
> > > > [=C2=A0=C2=A0=C2=A0 1.046521] Hardware name: QEMU Standard PC (i440=
FX + PIIX,
> > > > 1996),=20
> > > > BIOS 1.16.3-2.fc40 04/01/2014
> > > > [=C2=A0=C2=A0=C2=A0 1.047224] RIP: 0010:kunit_test_null_dereference=
+0x37/0x80
> > > > [=C2=A0=C2=A0=C2=A0 1.047706] Code: 80 b5 49 c7 c0 50 7f 56 b4 ba 0=
1 00 00 00
> > > > 65 48=20
> > > > 8b 04 25 28 00 00 00 48 89 44 24 08 31 c0 48 8d 4c 24 07 48 c7
> > > > c6 80=20
> > > > 8a 26 b5 <c7> 04 25 00 00 00 00 00 00 00 00 48 c7 87 70 01 00
> > > > 00 a6=20
> > > > e9 8c b5
> > > > [=C2=A0=C2=A0=C2=A0 1.049204] RSP: 0000:ffffa609807c7ec8 EFLAGS: 00=
010246
> > > > [=C2=A0=C2=A0=C2=A0 1.049642] RAX: 0000000000000000 RBX: ffff91d982=
623000 RCX:
> > > > ffffa609807c7ecf
> > > > [=C2=A0=C2=A0=C2=A0 1.050213] RDX: 0000000000000001 RSI: ffffffffb5=
268a80 RDI:
> > > > ffffa60980013c68
> > > > [=C2=A0=C2=A0=C2=A0 1.050799] RBP: ffff91d98105afc0 R08: ffffffffb4=
567f50 R09:
> > > > ffffffffb5807ce8
> > > > [=C2=A0=C2=A0=C2=A0 1.051375] R10: 0000000000000000 R11: 0000000000=
000001 R12:
> > > > ffff91d98105afc0
> > > > [=C2=A0=C2=A0=C2=A0 1.051941] R13: ffff91d983c749c0 R14: ffffffffb4=
5685e0 R15:
> > > > ffff91d982623000
> > > > [=C2=A0=C2=A0=C2=A0 1.052543] FS:=C2=A0 0000000000000000(0000)
> > > > GS:ffff91e48f9c0000(0000)=20
> > > > knlGS:0000000000000000
> > > > [=C2=A0=C2=A0=C2=A0 1.053187] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0:
> > > > 0000000080050033
> > > > [=C2=A0=C2=A0=C2=A0 1.053649] CR2: 0000000000000000 CR3: 00000004ce=
e30000 CR4:
> > > > 00000000000006f0
> > > > [=C2=A0=C2=A0=C2=A0 1.054214] Call Trace:
> > > > [=C2=A0=C2=A0=C2=A0 1.054427]=C2=A0 <TASK>
> > > > [=C2=A0=C2=A0=C2=A0 1.054597]=C2=A0 ? __die+0x1e/0x60
> > > > [=C2=A0=C2=A0=C2=A0 1.054844]=C2=A0 ? page_fault_oops+0x17b/0x4a0
> > > > [=C2=A0=C2=A0=C2=A0 1.055174]=C2=A0 ? search_extable+0x26/0x30
> > > > [=C2=A0=C2=A0=C2=A0 1.055482]=C2=A0 ? kunit_test_null_dereference+0=
x37/0x80
> > > > [=C2=A0=C2=A0=C2=A0 1.055888]=C2=A0 ? search_module_extables+0x14/0=
x50
> > > > [=C2=A0=C2=A0=C2=A0 1.056255]=C2=A0 ? exc_page_fault+0x6b/0x150
> > > > [=C2=A0=C2=A0=C2=A0 1.056571]=C2=A0 ? asm_exc_page_fault+0x26/0x30
> > > > [=C2=A0=C2=A0=C2=A0 1.056898]=C2=A0 ?
> > > > __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> > > > [=C2=A0=C2=A0=C2=A0 1.057387]=C2=A0 ? __pfx_kunit_fail_assert_forma=
t+0x10/0x10
> > > > [=C2=A0=C2=A0=C2=A0 1.057799]=C2=A0 ? kunit_test_null_dereference+0=
x37/0x80
> > > > [=C2=A0=C2=A0=C2=A0 1.058195]=C2=A0 ? __kthread_parkme+0x33/0x80
> > > > [=C2=A0=C2=A0=C2=A0 1.058523]=C2=A0 kunit_generic_run_threadfn_adap=
ter+0x1c/0x40
> > > > [=C2=A0=C2=A0=C2=A0 1.058949]=C2=A0 kthread+0xe9/0x1f0
> > > > [=C2=A0=C2=A0=C2=A0 1.059206]=C2=A0 ? __pfx_kthread+0x10/0x10
> > > > [=C2=A0=C2=A0=C2=A0 1.059513]=C2=A0 ret_from_fork+0x2f/0x50
> > > > [=C2=A0=C2=A0=C2=A0 1.059798]=C2=A0 ? __pfx_kthread+0x10/0x10
> > > > [=C2=A0=C2=A0=C2=A0 1.060095]=C2=A0 ret_from_fork_asm+0x1a/0x30
> > > > [=C2=A0=C2=A0=C2=A0 1.060421]=C2=A0 </TASK>
> > > > [=C2=A0=C2=A0=C2=A0 1.060597] Modules linked in:
> > > > [=C2=A0=C2=A0=C2=A0 1.060841] CR2: 0000000000000000
> > > > [=C2=A0=C2=A0=C2=A0 1.061104] ---[ end trace 0000000000000000 ]---
> > > > [=C2=A0=C2=A0=C2=A0 1.061481] RIP: 0010:kunit_test_null_dereference=
+0x37/0x80
> > > >=20
> > > >=20
> > > > I attach my kernel config and the full log file.
> > > >=20
> > > > What's awkward is that it does not seem to be related directly
> > > > to
> > > > sched, but only faults with sched.
> > > >=20
> > > >=20
> > > > Could you try to reproduce this, Tvrtko?
> > >=20
> > > Any chance that between the two runs you somehow manage to enable
> > > CONFIG_KUNIT_FAULT_TEST?
> >=20
> > Hmm in the sea of kunit_test_null_dereference there was a drm sched
> > related fail too. Investigating.
>=20
> Well this was quite embarrassing - I had an use after free due
> relying=20
> on scheduler fences for querying job status. That's what I get for=20
> over-relying on KASAN...

Interesting, so KASAN had a false negative with those?

>=20
> I've fixed it by tracking the job completion status in the mock job=20
> object directly and sent v4 out.
>=20
> Also interestingly, for me testing under qemu failed to catch it.
> Only=20
> one out of two real hw test machines hit it.

That's very awkward. How can my QEMU be that different from your QEMU?
Did you use the commit I provided above as the base of your kernel,
too?

>  Excellent that you gave it=20
> a spin and caught it before merge, thanks for that!

No worries, that's our mission. Cool that you found it so quickly!

P.


>=20
> Regards,
>=20
> Tvrtko
>=20
> >=20
> > Regards,
> >=20
> > Tvrtko
> >=20
> > > >=20
> > > >=20
> > > > Thanks
> > > > P.
> > > >=20
> > > >=20
> > > > >=20
> > > > > v2:
> > > > > =C2=A0=C2=A0* Parameterize a bunch of similar tests.
> > > > > =C2=A0=C2=A0* Improve test commentary.
> > > > > =C2=A0=C2=A0* Rename TDR test to timeout. (Christian)
> > > > > =C2=A0=C2=A0* Improve quality and consistency of naming. (Philipp=
)
> > > > >=20
> > > > > RFC v2 -> series v1:
> > > > > =C2=A0=C2=A0* Rebased for drm_sched_init changes.
> > > > > =C2=A0=C2=A0* Fixed modular build.
> > > > > =C2=A0=C2=A0* Added some comments.
> > > > > =C2=A0=C2=A0* Filename renames. (Philipp)
> > > > >=20
> > > > > v2:
> > > > > =C2=A0=C2=A0* Dealt with a bunch of checkpatch warnings.
> > > > >=20
> > > > > v3:
> > > > > =C2=A0=C2=A0* Some mock API renames, kerneldoc grammar fixes and
> > > > > indentation
> > > > > fixes.
> > > > >=20
> > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > > >=20
> > > > > Tvrtko Ursulin (5):
> > > > > =C2=A0=C2=A0 drm: Move some options to separate new Kconfig
> > > > > =C2=A0=C2=A0 drm/scheduler: Add scheduler unit testing infrastruc=
ture
> > > > > and some
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 basic tests
> > > > > =C2=A0=C2=A0 drm/scheduler: Add a simple timeout test
> > > > > =C2=A0=C2=A0 drm/scheduler: Add basic priority tests
> > > > > =C2=A0=C2=A0 drm/scheduler: Add a basic test for modifying entiti=
es
> > > > > scheduler
> > > > > list
> > > > >=20
> > > > > =C2=A0=C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 109 +----
> > > > > =C2=A0=C2=A0drivers/gpu/drm/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
115 +++++
> > > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/.kunitconfig=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +
> > > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
> > > > > =C2=A0=C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | =
323
> > > > > +++++++++++++
> > > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h | 223
> > > > > +++++++++
> > > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 426
> > > > > ++++++++++++++++++
> > > > > =C2=A0=C2=A08 files changed, 1113 insertions(+), 104 deletions(-)
> > > > > =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/Kconfig.debug
> > > > > =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/scheduler/.kunitco=
nfig
> > > > > =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/Ma=
kefile
> > > > > =C2=A0=C2=A0create mode 100644
> > > > > drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > > =C2=A0=C2=A0create mode 100644
> > > > > drivers/gpu/drm/scheduler/tests/sched_tests.h
> > > > > =C2=A0=C2=A0create mode 100644
> > > > > drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > > >=20
> > > >=20
> > >=20
> >=20
>=20

