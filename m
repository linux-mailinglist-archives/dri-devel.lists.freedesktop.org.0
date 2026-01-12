Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C63D129C5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 13:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00EF10E0C2;
	Mon, 12 Jan 2026 12:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="WEbIohqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4799110E0C2;
 Mon, 12 Jan 2026 12:49:48 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dqXJl6GbVz9tM7;
 Mon, 12 Jan 2026 13:49:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1768222183; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6ZWZX+cTNaC+6Y0TJs/u5fF+DycThso3XLecrwoiOM=;
 b=WEbIohqnf1/9a+vSF5adBmG/x/2DFP+VYJ0RS40cCnYch2L1eG+jBBfVOgReJz1ZtKkKj3
 kjGKQC5JQ6WFNTtFcj2kum3+/fglIKUKwJg6FA9Ej6vqsfhYq5Oj3m9/RNUwIwua8qlf+v
 TYgmNPpDqO67D6K2DLljBkzSsHM2VPqiZNOhBuGodDK4UTLOiv8faXIaiWtPgat8vLWZep
 KFw7NavFAfs2v5NiGBVVXySU010JLRFfdvV0NmyUWQ8YTJhipJ1MKTz+hCU1vU1E9kDw2S
 7fVYZN+7DUMYDggIA1O0OuNO2wz4nSTKnWApMFMNu2jhAylHpaJqQYkwPfn4aQ==
Message-ID: <87d5ab37bb3594ee8b1707ffaa28f4937a7f0ad4.camel@mailbox.org>
Subject: Re: [RFC 3/3] drm/sched: Disallow initializing entities with no
 schedulers
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>
Date: Mon, 12 Jan 2026 13:49:39 +0100
In-Reply-To: <340d0ce2-85e6-4fd8-992c-c35dda9b0cbb@igalia.com>
References: <20260107124351.94738-1-tvrtko.ursulin@igalia.com>
 <20260107124351.94738-4-tvrtko.ursulin@igalia.com>
 <a763700944ed4ccfe2f36ae805e4a348dd3fd10f.camel@mailbox.org>
 <340d0ce2-85e6-4fd8-992c-c35dda9b0cbb@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 96028ad7dd6197c1215
X-MBO-RS-META: aofbom7rw3zwyf5aa58oq3nyye3kyn31
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

On Mon, 2026-01-12 at 10:29 +0000, Tvrtko Ursulin wrote:
>=20
> On 08/01/2026 13:54, Philipp Stanner wrote:
> > What's the merge plan for this series? Christian?
>=20
> It sounds that staged merge would be safest. First two patches could go=
=20
> to amd-next and if everything will look fine, I would follow up by=20
> sending the DRM scheduler patch once amdgpu patches land to drm-next.

Works for me.

>=20
> Or if DRM scheduler maintainers are happy for the DRM scheduler patch to=
=20
> also go via amd-next that is another option.
> =C2=A0 > On Wed, 2026-01-07 at 12:43 +0000, Tvrtko Ursulin wrote:
> > > Since we have removed the case where amdgpu was initializing entitite=
s
> > > with either no schedulers on the list, or with a single NULL schedule=
r,
> > > and there appears no other drivers which rely on this, we can simplif=
y the
> > > scheduler by explictly rejecting that early.
> > >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 13 ++++-------=
--
> > > =C2=A0=C2=A01 file changed, 4 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> > > index fe174a4857be..bb7e5fc47f99 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -61,32 +61,27 @@ int drm_sched_entity_init(struct drm_sched_entity=
 *entity,
> > > =C2=A0=C2=A0			=C2=A0 unsigned int num_sched_list,
> > > =C2=A0=C2=A0			=C2=A0 atomic_t *guilty)
> > > =C2=A0=C2=A0{
> > > -	if (!(entity && sched_list && (num_sched_list =3D=3D 0 || sched_lis=
t[0])))
> > > +	if (!entity || !sched_list || !num_sched_list || !sched_list[0])
> >=20
> > I personally am a fan of checking integers explicitly against a number,
> > which would make the diff a bit more straightforward, too. But I accept
> > that like that is common kernel practice.
> >=20
> > > =C2=A0=C2=A0		return -EINVAL;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	memset(entity, 0, sizeof(struct drm_sched_entity));
> > > =C2=A0=C2=A0	INIT_LIST_HEAD(&entity->list);
> > > =C2=A0=C2=A0	entity->rq =3D NULL;
> > > =C2=A0=C2=A0	entity->guilty =3D guilty;
> > > -	entity->num_sched_list =3D num_sched_list;
> > > =C2=A0=C2=A0	entity->priority =3D priority;
> > > =C2=A0=C2=A0	entity->last_user =3D current->group_leader;
> > > -	/*
> > > -	 * It's perfectly valid to initialize an entity without having a va=
lid
> > > -	 * scheduler attached. It's just not valid to use the scheduler bef=
ore it
> > > -	 * is initialized itself.
> > > -	 */
> > > +	entity->num_sched_list =3D num_sched_list;
> >=20
> > Why do you move that line downwards? Just leave it where it was?
> > num_sched_list isn't changed or anything, so I don't see a logical
> > connection to the line below so that grouping would make sense.
>=20
> It looks completely logical to me to have both lines dealing with the
> same scheduler list, accessing the same input parameter even, next to
> each other:
>=20
> =C2=A0=C2=A0 entity->num_sched_list =3D num_sched_list;
> =C2=A0=C2=A0 entity->sched_list =3D num_sched_list > 1 ? sched_list : NUL=
L;
>=20
> No? In other words, I can respin if you insist but I don't see the need.

Fine by me. Though a little sentence about that cosmetical change in
the commit message would have made that clearer.


Greetings
P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> >=20
> > With that:
> > Acked-by: Philipp Stanner <phasta@kernel.org>
> >=20
> >=20
> > P.
> >=20
> > > =C2=A0=C2=A0	entity->sched_list =3D num_sched_list > 1 ? sched_list :=
 NULL;
> > > =C2=A0=C2=A0	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> > > =C2=A0=C2=A0	RB_CLEAR_NODE(&entity->rb_tree_node);
> > > =C2=A0=20
> > > -	if (num_sched_list && !sched_list[0]->sched_rq) {
> > > +	if (!sched_list[0]->sched_rq) {
> > > =C2=A0=C2=A0		/* Since every entry covered by num_sched_list
> > > =C2=A0=C2=A0		 * should be non-NULL and therefore we warn drivers
> > > =C2=A0=C2=A0		 * not to do this and to fix their DRM calling order.
> > > =C2=A0=C2=A0		 */
> > > =C2=A0=C2=A0		pr_warn("%s: called with uninitialized scheduler\n", __=
func__);
> > > -	} else if (num_sched_list) {
> > > +	} else {
> > > =C2=A0=C2=A0		/* The "priority" of an entity cannot exceed the number=
 of run-queues of a
> > > =C2=A0=C2=A0		 * scheduler. Protect against num_rqs being 0, by conve=
rting to signed. Choose
> > > =C2=A0=C2=A0		 * the lowest priority available.
> >=20
>=20

