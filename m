Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4213DBCC8E0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 12:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F91F10E32F;
	Fri, 10 Oct 2025 10:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="PaD6ZxqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DCF10E32F;
 Fri, 10 Oct 2025 10:36:54 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cjjpq0DGbz9stK;
 Fri, 10 Oct 2025 12:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760092611; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TuWfBXOUSMt4yfd+jhF0p7mzLV4aybLwGsfrtjr5ZQ=;
 b=PaD6ZxqIF2gZnnyc2T54f2aAwgtoRK71NXTHrIL4gVvT8I7MSUNpk0YRtaDnXMpm9I/BWM
 ypvK64XkXjskc7x3LH2vxl3YKngbh9sEmyAsBZGpQmCzdBV6cid1fE7dqRqdb78F6efbv9
 9/F6AcpdEZDUGdXJh/t/PqAhmLIXOxpMTr9AdQoMx7Fm/zE9XIKyCCePw3rFDiq+Po8MIO
 gXDpLLl1N0m2RNuOfGeXGm2XTunfqXbFDWl83j+Hq0wIOclpz5MdcfmDiuz3RNQxRPvLzX
 rzSFPsZ1GvqluTbdMA2bZIXPNR7lToVhLiir9t+hA/eVcBoyBHQ6UX9GCboZLw==
Message-ID: <084ffa0dea3f2bc8d0ca2f15e90f46f10ecd49a0.camel@mailbox.org>
Subject: Re: [PATCH 01/28] drm/sched: Reverse drm_sched_rq_init arguments
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>
Date: Fri, 10 Oct 2025 12:36:47 +0200
In-Reply-To: <1785ebaf-776a-4717-9922-3aa0c31d0d52@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-2-tvrtko.ursulin@igalia.com>
 <c6fab1fd60d1230b70b4c2bb4d37cdf20ab31f22.camel@mailbox.org>
 <1785ebaf-776a-4717-9922-3aa0c31d0d52@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: gsxc3rfsgyw4t3tcwgsauwa16q1dkdqb
X-MBO-RS-ID: 269b6aa8022ed2298a4
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

On Fri, 2025-10-10 at 10:46 +0100, Tvrtko Ursulin wrote:
>=20
> On 10/10/2025 09:55, Philipp Stanner wrote:
> > On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
> > > Helper operates on the run queue so lets make that the primary argume=
nt.
> > >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c | 8 ++++----
> > > =C2=A0=C2=A01 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > That's a new patch from the RFC, isn't it?
> >=20
> > And it's a general code improvement that is not related to CFS. I think
> > I mentioned it a few times already that a series is easier to review
> > and workflows are simplified if generic-improvement patches are
> > branched out and sent separately.
> >=20
> > I thought you had agreed with that?
>=20
> Hm not sure. My workflow is definitely easier if this work is a single=
=20
> unit throughout.
>=20
> Anyway, with this change it still far from consistency, so how much of=
=20
> an improvement it brings is open to debate. The general idea is that=20
> functions in sched_rq.c operate on sched_rq, which is the first=20
> argument, and by the end of the series the second argument disappears:
>=20
> void drm_sched_rq_init(struct drm_sched_rq *rq)
> {
> 	spin_lock_init(&rq->lock);
> 	INIT_LIST_HEAD(&rq->entities);
> 	rq->rb_tree_root =3D RB_ROOT_CACHED;
> 	rq->head_prio =3D -1;
> }
>=20
> int drm_sched_init(struct drm_gpu_scheduler *sched, const struct=20
> drm_sched_init_args *args)
> {
> ...
> 	drm_sched_rq_init(&sched->rq);
>=20
> But again, even at that point the code base is still not fully=20
> consistent in this respect aka needs more work. Not least you recently=
=20
> asked to rename drm_sched_rq_select_entity(rq) to=20
> drm_sched_select_entity(sched). So maybe you disagree with this patch
> completely and would prefer drm_sched_rq_init(sched). I don't know.=20
> Anyway, if you r-b it is trivial to send separately and merge. Or if you=
=20
> disapprove I will just drop this patch and rebase.

I think it's best to drop it for now and address such things in a
separate series one day for style and consistency changes which
hopefully sets it completely straight.

I had something like that on my list, too, for all the docstrings which
are inconsistent.


P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> > > index 46119aacb809..8b8c55b25762 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -174,13 +174,13 @@ void drm_sched_rq_update_fifo_locked(struct drm=
_sched_entity *entity,
> > > =C2=A0=C2=A0/**
> > > =C2=A0=C2=A0 * drm_sched_rq_init - initialize a given run queue struc=
t
> > > =C2=A0=C2=A0 *
> > > + * @rq: scheduler run queue
> > > =C2=A0=C2=A0 * @sched: scheduler instance to associate with this run =
queue
> > > - * @rq: scheduler run queue
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * Initializes a scheduler runqueue.
> > > =C2=A0=C2=A0 */
> > > -static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> > > +static void drm_sched_rq_init(struct drm_sched_rq *rq,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpu_scheduler *sched)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	spin_lock_init(&rq->lock);
> > > =C2=A0=C2=A0	INIT_LIST_HEAD(&rq->entities);
> > > @@ -1353,7 +1353,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sc=
hed, const struct drm_sched_init_
> > > =C2=A0=C2=A0		sched->sched_rq[i] =3D kzalloc(sizeof(*sched->sched_rq[=
i]), GFP_KERNEL);
> > > =C2=A0=C2=A0		if (!sched->sched_rq[i])
> > > =C2=A0=C2=A0			goto Out_unroll;
> > > -		drm_sched_rq_init(sched, sched->sched_rq[i]);
> > > +		drm_sched_rq_init(sched->sched_rq[i], sched);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	init_waitqueue_head(&sched->job_scheduled);
> >=20
>=20

