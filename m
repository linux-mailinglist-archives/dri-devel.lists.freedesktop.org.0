Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B225F8A1A
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 10:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1113810E356;
	Sun,  9 Oct 2022 08:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466B610E192
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 01:48:16 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5CAB2218A9;
 Sat,  8 Oct 2022 01:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665193694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L7jyJrkdsFmXq01fk0YZDGAy2JdoxUyJSLc3cwYSrwM=;
 b=YWuRC+TfYfwErIkc330RxLKxH3WMk3+dQndL1heGH5+0LZgm/f4EYgrdi7gKIOifK4JrQb
 fbOAF1lamzHdcySR//xnYsj3IEp2On9P+uwWNI1ISz87U73vPdtrIMC7TaT0cZkP5Jz0PF
 PKl4Hb1QBFsr8tgCNEj84n6Zu9Rv24c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665193694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L7jyJrkdsFmXq01fk0YZDGAy2JdoxUyJSLc3cwYSrwM=;
 b=CehdQSF8yK+QRZLXHJHewgP7KtkOSzhbIjd2k+F9FUzuJHpggS5q3aMLI2lZQk/wkFcKRj
 CjVecdIBUyxmWNCA==
Received: from lion.mk-sys.cz (unknown [10.100.200.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E6C222C141;
 Sat,  8 Oct 2022 01:48:13 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
 id BAB9A6092E; Sat,  8 Oct 2022 03:48:13 +0200 (CEST)
Date: Sat, 8 Oct 2022 03:48:13 +0200
From: Michal Kubecek <mkubecek@suse.cz>
To: "Yadav, Arvind" <arvyadav@amd.com>
Subject: Re: [PATCH] drm/sched: Fix kernel NULL pointer dereference error
Message-ID: <20221008014813.vgcdte65mydbwlqa@lion.mk-sys.cz>
References: <20220930084810.4639-1-Arvind.Yadav@amd.com>
 <38ef1813-030c-8315-249d-349d69b81c52@amd.com>
 <e4aeea32-4ed8-c1db-e826-32ce278f61c4@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5pgokusjefpgtu4a"
Content-Disposition: inline
In-Reply-To: <e4aeea32-4ed8-c1db-e826-32ce278f61c4@amd.com>
X-Mailman-Approved-At: Sun, 09 Oct 2022 08:11:24 +0000
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
Cc: Arunpravin.PaneerSelvam@amd.com, airlied@linux.ie, gustavo@padovan.org,
 amaranath.somalapuram@amd.com, linux-kernel@vger.kernel.org,
 Arvind Yadav <Arvind.Yadav@amd.com>, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, shashank.sharma@amd.com,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5pgokusjefpgtu4a
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 09:09:56PM +0530, Yadav, Arvind wrote:
>=20
> On 9/30/2022 4:56 PM, Christian K=F6nig wrote:
> > Am 30.09.22 um 10:48 schrieb Arvind Yadav:
> > > BUG: kernel NULL pointer dereference, address: 0000000000000088
> > > =A0 #PF: supervisor read access in kernel mode
> > > =A0 #PF: error_code(0x0000) - not-present page
> > > =A0 PGD 0 P4D 0
> > > =A0 Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > =A0 CPU: 2 PID: 0 Comm: swapper/2 Not tainted 6.0.0-rc2-custom #1
> > > =A0 Arvind : [dma_fence_default_wait _START] timeout =3D -1
> > > =A0 Hardware name: AMD Dibbler/Dibbler, BIOS RDB1107CC 09/26/2018
> > > =A0 RIP: 0010:drm_sched_job_done.isra.0+0x11/0x140 [gpu_sched]
> > > =A0 Code: 8b fe ff ff be 03 00 00 00 e8 7b da b7 e3 e9 d4 fe ff ff 66
> > > 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc 53
> > > <48> 8b 9f 88 00 00 00 f0 ff 8b f0 00 00 00 48 8b 83 80 01 00 00 f0
> > > =A0 RSP: 0018:ffffb1b1801d4d38 EFLAGS: 00010087
> > > =A0 RAX: ffffffffc0aa48b0 RBX: ffffb1b1801d4d70 RCX: 0000000000000018
> > > =A0 RDX: 000036c70afb7c1d RSI: ffff8a45ca413c60 RDI: 0000000000000000
> > > =A0 RBP: ffffb1b1801d4d50 R08: 00000000000000b5 R09: 0000000000000000
> > > =A0 R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> > > =A0 R13: ffffb1b1801d4d70 R14: ffff8a45c4160000 R15: ffff8a45c416a708
> > > =A0 FS:=A0 0000000000000000(0000) GS:ffff8a48a0a80000(0000)
> > > knlGS:0000000000000000
> > > =A0 CS:=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > =A0 CR2: 0000000000000088 CR3: 000000014ad50000 CR4: 00000000003506e0
> > > =A0 Call Trace:
> > > =A0=A0 <IRQ>
> > > =A0=A0 drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
> > > =A0=A0 dma_fence_signal_timestamp_locked+0x7e/0x110
> > > =A0=A0 dma_fence_signal+0x31/0x60
> > > =A0=A0 amdgpu_fence_process+0xc4/0x140 [amdgpu]
> > > =A0=A0 gfx_v9_0_eop_irq+0x9d/0xd0 [amdgpu]
> > > =A0=A0 amdgpu_irq_dispatch+0xb7/0x210 [amdgpu]
> > > =A0=A0 amdgpu_ih_process+0x86/0x100 [amdgpu]
> > > =A0=A0 amdgpu_irq_handler+0x24/0x60 [amdgpu]
> > > =A0=A0 __handle_irq_event_percpu+0x4b/0x190
> > > =A0=A0 handle_irq_event_percpu+0x15/0x50
> > > =A0=A0 handle_irq_event+0x39/0x60
> > > =A0=A0 handle_edge_irq+0xaf/0x210
> > > =A0=A0 __common_interrupt+0x6e/0x110
> > > =A0=A0 common_interrupt+0xc1/0xe0
> > > =A0=A0 </IRQ>
> > > =A0=A0 <TASK>
> >=20
> > How is this triggered any why haven't we seen it before?
>=20
> IGT has few 'amdgpu' specific testcases which is not related=A0 to fence.
>=20
> while running those test cases I have got this crash but this crash is not
> always reproducible.

I've encountered this crash twice (out of two attempts) with kernel
built from mainline commit 4c86114194e6 when I started firefox.

The patch below fixed the crash and does not seem to introduce any
apparent issue.

Tested-by: Michal Kubecek <mkubecek@suse.cz>

> > > Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> > > ---
> > > =A0 drivers/gpu/drm/scheduler/sched_main.c | 7 ++++++-
> > > =A0 1 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 6684d88463b4..390272f6b126 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -172,7 +172,12 @@ drm_sched_rq_select_entity(struct drm_sched_rq *=
rq)
> > > =A0 static void drm_sched_job_done(struct drm_sched_job *s_job)
> > > =A0 {
> > > =A0=A0=A0=A0=A0 struct drm_sched_fence *s_fence =3D s_job->s_fence;
> > > -=A0=A0=A0 struct drm_gpu_scheduler *sched =3D s_fence->sched;
> > > +=A0=A0=A0 struct drm_gpu_scheduler *sched;
> > > +
> > > +=A0=A0=A0 if (!s_fence)
> > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > +
> > > +=A0=A0=A0 sched =3D s_fence->sched;
> > > =A0 =A0=A0=A0=A0=A0 atomic_dec(&sched->hw_rq_count);
> > > =A0=A0=A0=A0=A0 atomic_dec(sched->score);
> >=20

--5pgokusjefpgtu4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEWN3j3bieVmp26mKO538sG/LRdpUFAmNA1tYACgkQ538sG/LR
dpV9Egf/X/c89wk7BGPF4Qfl7wWawuErji4M7g7kcNcN2mIRN0TxhrO0ahZ98tue
Vk1ajmPKRlf9m7UL4ocommViSSKmdEBVhVc/EXqHXuMspAeZg1mimTZbel5Rmggc
HCkGa+HaUAqlBHK9WpxuILXw2sRPm6IspfpcltlyUGGawz3bjoGXBz/Uzjle3GuG
aU2A6bjUELm7t48qA8O9NT0l0z3lez1lgmYEJLgy1zLy8Rkpc3rmwdB9hTrWu1Bm
7WCjOJ4nJaxHawpCZDpYvRos520nZJO/jDqiue/F/U+PCLS3dPqJGVtJ1GhVHs0q
PL73Uk8zANEbXFRtnMfcV+b6S/vr/A==
=xK3o
-----END PGP SIGNATURE-----

--5pgokusjefpgtu4a--
