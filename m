Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C01986182
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 16:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE77C10E83B;
	Wed, 25 Sep 2024 14:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BWh3hR2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC9410E11B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727276027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGzOTaPVi1+w9wL9gZY7mc4grQIDs20VIIjWOimnONE=;
 b=BWh3hR2FoD6cMLv2wevQqJsN0mUXymGNIKLVEgmC1eUm2pvxGnFOqSp0Hy2gKgCp30Urmp
 NYfkBF5xtw/+qOnoVJjxzXVFJ1D7rkXnGB5ZBRBxg3cWj+bBmLNiPiQHNjOkyYwgN8wZJv
 ste6s2Q18dWyMfYtRcyrT/2Lpdk8sWw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-_IyBfn3pMaKaYMA_82HJYg-1; Wed, 25 Sep 2024 10:53:46 -0400
X-MC-Unique: _IyBfn3pMaKaYMA_82HJYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42cb6dc3365so52395795e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 07:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727276025; x=1727880825;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aflV50Q37JessWAXAzdLyDLDdLDy0TOvE7V1wlZA/Z0=;
 b=tVZQRQlueHn0cmhYPoei1GkGp0tDlastHGhCR9f0DP1AnHRnAQB8bKvH9Zjcc0MsFI
 1pno907gOKgdWwsI18MEQDHhBSbiUR1niMPnWMA2R0dGPOZa1oNdc5yC6VRlkc0SY6s6
 f/omVINAjQY4UgxRDIU+zhlcV5LLTpIRoJWfS7E26GrsHJz92n+Rl9FaElWEjNc/6Xff
 M6fZNpsZ26vhrwQ1HdZBRAQrzdUBhwpIF3zPgViimtJq6NvOFgtjOmW5Ek2zKs2QPDSF
 HaXjabEl7RKZ/us2Y4ze9va6ZgPpM8awixMuDhZZNu8LXAuGzvLnBvzy+/7pxC1M2geW
 i2sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9SzzdF/Qz0U9xJ386VzivabLnZOoZp0wYJuDiOBTxf0UjQnlCe6p9EOERKJbDClZP0/0k5ik8i9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFKaUXH/vTWj/lMK2mTWK4En9kENX+Zoui+KhP2whBsualh0zU
 Laij8SACbF2gZL5sy3T8drBnCN/KCVQqzgRYJiCswNlL5Nh2CS5Oxwf29hg2UFXjuC+KwsY8LFm
 Ua7j6sqhbcuz1BOA5/MF+DucVxAWRaLcEj+tGryj25gka627jTGY4J86EiS29dn7JjA==
X-Received: by 2002:a05:600c:45c9:b0:42c:b942:1bba with SMTP id
 5b1f17b1804b1-42e96144c66mr20532005e9.27.1727276024672; 
 Wed, 25 Sep 2024 07:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfkskEtsEVIiM2kIrVBD1XKVB/SJ5lJ/ve1WfQaPLnj67/4jnt6YQjaYMTlQ5P5KtatGgeQA==
X-Received: by 2002:a05:600c:45c9:b0:42c:b942:1bba with SMTP id
 5b1f17b1804b1-42e96144c66mr20531835e9.27.1727276024115; 
 Wed, 25 Sep 2024 07:53:44 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:9f00:110e:f1b:b4e9:a128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a36287sm21166755e9.29.2024.09.25.07.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 07:53:43 -0700 (PDT)
Message-ID: <a2ef4cdfeb31ad95de9311274de73a51cdc54a97.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
From: Philipp Stanner <pstanner@redhat.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dakr@kernel.org, dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Date: Wed, 25 Sep 2024 16:53:42 +0200
In-Reply-To: <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
 <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
 <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
 <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
 <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 2024-09-24 at 13:18 +0200, Simona Vetter wrote:
> On Mon, Sep 23, 2024 at 05:24:10PM +0200, Christian K=C3=B6nig wrote:
> > Am 20.09.24 um 15:26 schrieb Philipp Stanner:
> > > On Fri, 2024-09-20 at 12:33 +0200, Christian K=C3=B6nig wrote:
> > > > Am 20.09.24 um 10:57 schrieb Philipp Stanner:
> > > > > On Wed, 2024-09-18 at 15:39 +0200, Christian K=C3=B6nig wrote:
> > > > > > Tearing down the scheduler with jobs still on the pending
> > > > > > list
> > > > > > can
> > > > > > lead to use after free issues. Add a warning if drivers try
> > > > > > to
> > > > > > destroy a scheduler which still has work pushed to the HW.
> > > > > Did you have time yet to look into my proposed waitque-
> > > > > solution?
> > > > I don't remember seeing anything. What have I missed?
> > > https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.co=
m/
> >=20
> > Mhm, I didn't got that in my inbox for some reason.
> >=20
> > Interesting approach, I'm just not sure if we can or should wait in
> > drm_sched_fini().

We do agree that jobs still pending when drm_sched_fini() starts is
always a bug, right?

If so, what are the disadvantages of waiting in drm_sched_fini()? We
could block buggy drivers as I see it. Which wouldn't be good, but
could then be fixed on drivers' site.

> >=20
> > Probably better to make that a separate function, something like
> > drm_sched_flush() or similar.

We could do that. Such a function could then be called by drivers which
are not sure whether all jobs are done before they start tearing down.

>=20
> Yeah I don't think we should smash this into drm_sched_fini
> unconditionally. I think conceptually there's about three cases:
>=20
> - Ringbuffer schedules. Probably want everything as-is, because
> =C2=A0 drm_sched_fini is called long after all the entities are gone in
> =C2=A0 drm_device cleanup.
>=20
> - fw scheduler hardware with preemption support. There we probably
> want to
> =C2=A0 nuke the context by setting the tdr timeout to zero (or maybe just
> as
> =C2=A0 long as context preemption takes to be efficient), and relying on
> the
> =C2=A0 normal gpu reset flow to handle things. drm_sched_entity_flush
> kinda
> =C2=A0 does this, except not really and it's a lot more focused on the
> =C2=A0 ringbuffer context. So maybe we want a new drm_sched_entity_kill.
>=20
> =C2=A0 For this case calling drm_sched_fini() after the 1:1 entity is gon=
e
> =C2=A0 should not find any linger jobs, it would actually be a bug
> somewhere if
> =C2=A0 there's a job lingering. Maybe a sanity check that there's not jus=
t
> no
> =C2=A0 jobs lingering, but also no entity left would be good here?

The check for lingering ones is in Christian's patch here IISC.
At which position would you imagine the check for the entity being
performed?

>=20
> - fw scheduler without preemption support. There we kinda need the
> =C2=A0 drm_sched_flush, except blocking in fops->close is not great. So
> instead
> =C2=A0 I think the following is better:
> =C2=A0 1. drm_sched_entity_stopped, which only stops new submissions (for
> =C2=A0 paranoia) but doesn't tear down the entity

Who would call that function?
Drivers using it voluntarily could just as well stop accepting new jobs
from userspace to their entities, couldn't they?

> =C2=A0 2. drm_dev_get
> =C2=A0 3. launch a worker which does a) drm_sched_flush (or
> =C2=A0 drm_sched_entity_flush or whatever we call it) b)
> drm_sched_entity_fini
> =C2=A0 + drm_sched_fini c) drm_dev_put
>=20
> =C2=A0 Note that semantically this implements the refcount in the other
> path
> =C2=A0 from Phillip:
>=20
> =C2=A0
> https://lore.kernel.org/all/20240903094531.29893-2-pstanner@redhat.com/
> =C2=A0=20
> =C2=A0 Except it doesn't impose refcount on everyone else who doesn't nee=
d
> it,
> =C2=A0 and it doesn't even impose refcounting on drivers that do need it
> =C2=A0 because we use drm_sched_flush and a worker to achieve the same.

I indeed wasn't happy with the refcount approach for that reason,
agreed.

>=20
> Essentially helper functions for the common use-cases instead of
> trying to
> solve them all by putting drm_sched_flush as a potentially very
> blocking
> function into drm_sched_fini.

I'm still not able to see why it blocking would be undesired =E2=80=93 as f=
ar
as I can see, it is only invoked on driver teardown, so not during
active operation. Teardown doesn't happen that often, and it can (if
implemented correctly) only block until the driver's code has signaled
the last fences. If that doesn't happen, the block would reveal a bug.

But don't get me wrong: I don't want to *push* this solution. I just
want to understand when it could become a problem.


Wouldn't an explicitly blocking, separate function like
drm_sched_flush() or drm_sched_fini_flush() be a small, doable step
towards the right direction?


>=20
>=20
> > > > > > When there are still entities with jobs the situation is
> > > > > > even
> > > > > > worse
> > > > > > since the dma_fences for those jobs can never signal we can
> > > > > > just
> > > > > > choose between potentially locking up core memory
> > > > > > management and
> > > > > > random memory corruption. When drivers really mess it up
> > > > > > that
> > > > > > well
> > > > > > let them run into a BUG_ON().
> > > > > >=20
> > > > > > Signed-off-by: Christian K=C3=B6nig<christian.koenig@amd.com>
> > > > > > ---
> > > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c | 19
> > > > > > ++++++++++++++++++-
> > > > > > =C2=A0=C2=A0=C2=A01 file changed, 18 insertions(+), 1 deletion(=
-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > index f093616fe53c..8a46fab5cdc8 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct
> > > > > > drm_gpu_scheduler
> > > > > > *sched)
> > > > > I agree with Sima that it should first be documented in the
> > > > > function's
> > > > > docstring what the user is expected to have done before
> > > > > calling the
> > > > > function.
> > > > Good point, going to update the documentation as well.
> > > Cool thing, thx.
> > > Would be great if everything (not totally trivial) necessary to
> > > be done
> > > before _fini() is mentioned.
> > >=20
> > > One could also think about providing a hint at how the driver can
> > > do
> > > that. AFAICS the only way for the driver to ensure that is to
> > > maintain
> > > its own, separate list of submitted jobs.
> >=20
> > Even with a duplicated pending list it's actually currently
> > impossible to do
> > this fully cleanly.
> >=20
> > The problem is that the dma_fence object gives no guarantee when
> > callbacks
> > are processed, e.g. they can be both processed from interrupt
> > context as
> > well as from a CPU which called dma_fence_is_signaled().
> >=20
> > So when a driver (or drm_sched_fini) waits for the last submitted
> > fence it
> > actually can be that the drm_sched object still needs to do some
> > processing.
> > See the hack in amdgpu_vm_tlb_seq() for more background on the
> > problem.

Oh dear ^^'
We better work towards fixing that centrally

Thanks,
P.


>=20
> So I thought this should be fairly easy because of the sched
> hw/public
> fence split: If we wait for both all jobs to finish and for all the
> sched
> work/tdr work to finish, and we make sure there's no entity existing
> that's not yet stopped we should catch them all? Or at least I think
> it's
> a bug if any other code even tries to touch the hw fence.
>=20
> If you have any other driver code which relies on the rcu freeing
> then I
> think that's just a separate concern and we can ignore that here
> since the
> fences themselves will till get rcu-delay freed even if
> drm_sched_fini has
> finished.
> -Sima
>=20
> >=20
> > Regards,
> > Christian.
> >=20
> > >=20
> > > P.
> > >=20
> > > > Thanks,
> > > > Christian.
> > > >=20
> > > > > P.
> > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=09drm_sched_wqueue_stop(sched);
> > > > > > +=09/*
> > > > > > +=09 * Tearing down the scheduler wile there are still
> > > > > > unprocessed jobs can
> > > > > > +=09 * lead to use after free issues in the scheduler
> > > > > > fence.
> > > > > > +=09 */
> > > > > > +=09WARN_ON(!list_empty(&sched->pending_list));
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=09for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < =
sched-
> > > > > > >num_rqs;
> > > > > > i++)
> > > > > > {
> > > > > > =C2=A0=C2=A0=C2=A0=09=09struct drm_sched_rq *rq =3D sched-
> > > > > > >sched_rq[i];
> > > > > > =C2=A0=C2=A0=C2=A0=09=09spin_lock(&rq->lock);
> > > > > > -=09=09list_for_each_entry(s_entity, &rq-
> > > > > > >entities,
> > > > > > list)
> > > > > > +=09=09list_for_each_entry(s_entity, &rq-
> > > > > > >entities,
> > > > > > list) {
> > > > > > +=09=09=09/*
> > > > > > +=09=09=09 * The justification for this
> > > > > > BUG_ON()
> > > > > > is
> > > > > > that tearing
> > > > > > +=09=09=09 * down the scheduler while jobs
> > > > > > are
> > > > > > pending
> > > > > > leaves
> > > > > > +=09=09=09 * dma_fences unsignaled. Since we
> > > > > > have
> > > > > > dependencies
> > > > > > +=09=09=09 * from the core memory management
> > > > > > to
> > > > > > eventually signal
> > > > > > +=09=09=09 * dma_fences this can trivially
> > > > > > lead to
> > > > > > a
> > > > > > system wide
> > > > > > +=09=09=09 * stop because of a locked up
> > > > > > memory
> > > > > > management.
> > > > > > +=09=09=09 */
> > > > > > +=09=09=09BUG_ON(spsc_queue_count(&s_entity-
> > > > > > > job_queue));
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=09=09=09/*
> > > > > > =C2=A0=C2=A0=C2=A0=09=09=09 * Prevents reinsertion and marks
> > > > > > job_queue
> > > > > > as idle,
> > > > > > =C2=A0=C2=A0=C2=A0=09=09=09 * it will removed from rq in
> > > > > > drm_sched_entity_fini
> > > > > > =C2=A0=C2=A0=C2=A0=09=09=09 * eventually
> > > > > > =C2=A0=C2=A0=C2=A0=09=09=09 */
> > > > > > =C2=A0=C2=A0=C2=A0=09=09=09s_entity->stopped =3D true;
> > > > > > +=09=09}
> > > > > > =C2=A0=C2=A0=C2=A0=09=09spin_unlock(&rq->lock);
> > > > > > =C2=A0=C2=A0=C2=A0=09=09kfree(sched->sched_rq[i]);
> > > > > > =C2=A0=C2=A0=C2=A0=09}
>=20

