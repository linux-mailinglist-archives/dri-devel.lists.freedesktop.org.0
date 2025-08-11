Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A490B2019D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 10:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8218010E393;
	Mon, 11 Aug 2025 08:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="EM+vQBwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CCE10E393
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 08:20:26 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c0nd25nmrz9sp3;
 Mon, 11 Aug 2025 10:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1754900422; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GF4xsPLwspPonOgTyVnrW718E8T9Iw+Z5+2LBWvVv0A=;
 b=EM+vQBwdTlldTlLEo6AFNR7OrzN+2nXbjIqnZJLCQO3sF6+kYxmNyMT2Ym20/A4CuruYM4
 9DsCcx6+VGtTvZJccvwomsU6E6DU77iX1ck1oSk6a/fbGI7eP2Mm73pfsT5HB3XBXALme+
 i+QVokszDwl+1QuDmf70uIa+VQg+ExOzGjTm3End4AXCpsndA/T0G9TAOMxQCBmrbBBGOp
 EL3dbp/eS7nVzL9u0MpDz44i1xNc2mx/TknMkZ2XND4NCHvYOWzL9q8oefBw90/mg04+3O
 Myl0mrC4jv1bEWhaqApxpx3hkzuIR7lANdsRgvDoAvswB+pRK8Erufh3ghcphg==
Message-ID: <96ef095079a140f97507e8dc46bc24fd7d0af9d5.camel@mailbox.org>
Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submission
 during process kill
From: Philipp Stanner <phasta@mailbox.org>
To: phasta@kernel.org, Liu01 Tong <Tong.Liu01@amd.com>, 
 dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org, matthew.brost@intel.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, gang.ba@amd.com, matthew.schwartz@linux.dev, 
 lin.cao@amd.com, "Lin . Cao" <lincao12@amd.com>
Date: Mon, 11 Aug 2025 10:20:19 +0200
In-Reply-To: <3aa7b54d9acb0467a253c9bc993552f7f109f6aa.camel@mailbox.org>
References: <20250811072050.3838241-1-Tong.Liu01@amd.com>
 <3aa7b54d9acb0467a253c9bc993552f7f109f6aa.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 2b24e712eb7a8796bfd
X-MBO-RS-META: 8o4zid6rue99jk63j1ymoksfet6fubuz
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

On Mon, 2025-08-11 at 10:18 +0200, Philipp Stanner wrote:
> Hi,
>=20
> title: this patch changes nothing in amdgpu.
>=20
> Thus, the prefix must be drm/sched: Fix [=E2=80=A6]
>=20
>=20
> Furthermore, please use scripts/get_maintainer. A few relevant folks
> are missing. +Cc Danilo, Matthew

Oh, never mind, just overlooked them because the names weren't spelled
out. My bad.

P.

>=20
>=20
> On Mon, 2025-08-11 at 15:20 +0800, Liu01 Tong wrote:
> > During process kill, drm_sched_entity_flush() will kill the vm
> > entities.
> >=20
>=20
> What is a "vm entity"? This seems to be driver-specific language.
>=20
>=20
> > =C2=A0The following job submissions of this process will fail, and
> > the resources of these jobs have not been released, nor have the fences
> > been signalled, causing tasks to hang.
> >=20
> > Fix by not doing job init when the entity is stopped. And when the job
> > is already submitted, free the job resource if the entity is stopped.
>=20
> I'm not sure I can fully follow. Can you give more details on why that
> bug doesn't always occur?
>=20
> In general: Why is this something that needs to be fixed in the
> scheduler? amdgpu knows when it killed an entity. Why can't it stop
> submitting thereafter?
>=20
> >=20
> > Signed-off-by: Liu01 Tong <Tong.Liu01@amd.com>
> > Signed-off-by: Lin.Cao <lincao12@amd.com>
>=20
> Two authors? AFAIK should contain a Co-authored-by tag then.
>=20
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++------
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=A0 5 ++++=
+
> > =C2=A02 files changed, 12 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index ac678de7fe5e..1e744b2eb2db 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -570,6 +570,13 @@ void drm_sched_entity_push_job(struct drm_sched_jo=
b *sched_job)
> > =C2=A0	bool first;
> > =C2=A0	ktime_t submit_ts;
> > =C2=A0
> > +	if (entity->stopped) {
>=20
> This screams "race!" because you're checking for the entity being
> stopped now without the lock, as was done before.
>=20
> That's definitely a no-go because that has caused big trouble and the
> past and is still causing trouble right now at other places where the
> lock was not taken:
>=20
> https://lore.kernel.org/dri-devel/20250731093008.45267-2-phasta@kernel.or=
g/
>=20
>=20
> > +		DRM_ERROR("Trying to push job to a killed entity\n");
> > +		INIT_WORK(&sched_job->work, drm_sched_entity_kill_jobs_work);
> > +		schedule_work(&sched_job->work);
> > +		return;
> > +	}
> > +
> > =C2=A0	trace_drm_sched_job(sched_job, entity);
> > =C2=A0	atomic_inc(entity->rq->sched->score);
> > =C2=A0	WRITE_ONCE(entity->last_user, current->group_leader);
> > @@ -589,12 +596,6 @@ void drm_sched_entity_push_job(struct drm_sched_jo=
b *sched_job)
> > =C2=A0
> > =C2=A0		/* Add the entity to the run queue */
> > =C2=A0		spin_lock(&entity->lock);
> > -		if (entity->stopped) {
> > -			spin_unlock(&entity->lock);
> > -
> > -			DRM_ERROR("Trying to push to a killed entity\n");
> > -			return;
> > -		}
> > =C2=A0
> > =C2=A0		rq =3D entity->rq;
> > =C2=A0		sched =3D rq->sched;
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index bfea608a7106..c15b17d9ffe3 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -795,6 +795,11 @@ int drm_sched_job_init(struct drm_sched_job *job,
> > =C2=A0		return -ENOENT;
> > =C2=A0	}
> > =C2=A0
> > +	if (unlikely(entity->stopped)) {
> > +		pr_err("*ERROR* %s: entity is stopped!\n", __func__);
> > +		return -EINVAL;
> > +	}
>=20
> Same here, racy.
>=20
>=20
> Regards,
> Philipp
>=20
> > +
> > =C2=A0	if (unlikely(!credits)) {
> > =C2=A0		pr_err("*ERROR* %s: credits cannot be 0!\n", __func__);
> > =C2=A0		return -EINVAL;
>=20

