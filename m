Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFE0A07816
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B1D10EDE1;
	Thu,  9 Jan 2025 13:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SwtLilnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF0D10EDE1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736430476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GmM3fsMtFmaynAoVF3Nk/3zWD0Ef6aLmzRuCFSMaYUk=;
 b=SwtLilnXp6S7CQbZuIBpQ3zJwxTr7QYqgAbPUnNFBIItE+BuJhMIr4EZsxraw7UQ0EmXK7
 sH9Lv6WazJ+PtLlDmHlXmKr4AkuNiBTQxybjlqjJ812c3WB+FODrXH8gvFj4lyx7meto23
 Zle0M8dwCSb/PZbs5eWJtN2jaO9sMI4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-usbybhPQNbWrQvizaTTeDA-1; Thu, 09 Jan 2025 08:47:55 -0500
X-MC-Unique: usbybhPQNbWrQvizaTTeDA-1
X-Mimecast-MFC-AGG-ID: usbybhPQNbWrQvizaTTeDA
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d89154adabso16925846d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736430475; x=1737035275;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lpOOk3veSZPKRfwHoLIhf35QT/4GJJoffoiHyp6Ak+o=;
 b=GV02JBlOMAhjiYzWmBzCioqF/KgkB3vuiHs2xAjpmnnMY3kxDUi0lckjAw9ug+IY1B
 YDnwyf/AYybo7VAfTtLExFrgastTTn0L4cnsyTWBMobHBUgFg+uFhbmcRVPVKPzRScou
 2C9toLgUR4v6WKOnK5l5slDj0qcTsFYGl4MGroUGa4roM7aJv13LSL9o2ZFADyih3xh/
 S2Dt+/s5v68fLmhUNN8EfvIUSRLMMBtBWe63JOCyKQfLhI176iqpdyul74LD6qnter1x
 AA8OKN+moY3Xe+ce/jKDWZOTNW9z9rjoGIRHAf8ssPh8UP3vt65S/93aJCWiMdPldQEJ
 UL8g==
X-Gm-Message-State: AOJu0YzUjhWP76/ciYZ5eU2vMK7+uUQzOXBp9ftETS6zU435MzTGxLN8
 ahKJCQZfrYUtUSIhu6qpwJWGKGruiqKuj/MBvmJnWzgis+gKIPoDH8ruRF7wOGDwAV4vdcjTs+h
 EeH9zjP5sJKPvU8UP3JLtcnadjVnVQJblkzombANx5qVPH8R/qXuLAXGqVLXwpdmZCQ==
X-Gm-Gg: ASbGncvVucFftFGTW3Xun84pOV5GwlpI3vfwn8dcNm8Yi8ChFspyho/2vSPOLjkXDhV
 Vuoi4nucQJuC9zyyEzscwEr+zwCygM7iZ7j0ZYSALep7mu3UBTR+9dCRZ/WVlah2buUE5CqVWqT
 NjdyUt8VgvOrp07aHTl3zTqsk2vvlN8Jre7L5V+KxNPRWb5Vix98Ymsz5bZAPJVz/XCJQ0SEbJK
 GfqUrNDW6d2GOteyA5C6E4YEN5UegmGqvqon6lDK8HIyHl/swDrhpcjFOL9PYYTkBaLuvF4/D5f
 Um82gpc=
X-Received: by 2002:ad4:5d66:0:b0:6d8:8109:a547 with SMTP id
 6a1803df08f44-6df9b229b3dmr98723096d6.22.1736430474926; 
 Thu, 09 Jan 2025 05:47:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXPRzGXe/fDNCKPhYjjHFGFf1iA3m4z/OSqYfqPRvN04kQEjns6bNBz7lR9YWVXA9GZdtP8Q==
X-Received: by 2002:ad4:5d66:0:b0:6d8:8109:a547 with SMTP id
 6a1803df08f44-6df9b229b3dmr98722806d6.22.1736430474573; 
 Thu, 09 Jan 2025 05:47:54 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6dd7debcc33sm124784176d6.123.2025.01.09.05.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:47:54 -0800 (PST)
Message-ID: <734c1bbdb4c38dbb4fb8c681d7aec2f1232a488c.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/sched: Document run_job() refcount hazard
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 09 Jan 2025 14:47:50 +0100
In-Reply-To: <036bda23-a6a0-46f6-844a-567805cd0f7e@ursulin.net>
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-4-phasta@kernel.org>
 <036bda23-a6a0-46f6-844a-567805cd0f7e@ursulin.net>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JicEfdJ4i6Rtnt3CUR5_vwj3PuB0lXUIJE-Oz8dqNtc_1736430475
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

On Thu, 2025-01-09 at 13:44 +0000, Tvrtko Ursulin wrote:
>=20
> On 09/01/2025 13:37, Philipp Stanner wrote:
> > From: Philipp Stanner <pstanner@redhat.com>
> >=20
> > drm_sched_backend_ops.run_job() returns a dma_fence for the
> > scheduler.
> > That fence is signalled by the driver once the hardware completed
> > the
> > associated job. The scheduler does not increment the reference
> > count on
> > that fence, but implicitly expects to inherit this fence from
> > run_job().
> >=20
> > This is relatively subtle and prone to misunderstandings.
> >=20
> > This implies that, to keep a reference for itself, a driver needs
> > to
> > call dma_fence_get() in addition to dma_fence_init() in that
> > callback.
> >=20
> > It's further complicated by the fact that the scheduler even
> > decrements
> > the refcount in drm_sched_run_job_work() since it created a new
> > reference in drm_sched_fence_scheduled(). It does, however, still
> > use
> > its pointer to the fence after calling dma_fence_put() - which is
> > safe
> > because of the aforementioned new reference, but actually still
> > violates
> > the refcounting rules.
> >=20
> > Improve the explanatory comment for that decrement.
> >=20
> > Move the call to dma_fence_put() to the position behind the last
> > usage
> > of the fence.
> >=20
> > Document the necessity to increment the reference count in
> > drm_sched_backend_ops.run_job().
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++++----
> > =C2=A0 2 files changed, 22 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 57da84908752..5f46c01eb01e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct
> > work_struct *w)
> > =C2=A0=C2=A0=09drm_sched_fence_scheduled(s_fence, fence);
> > =C2=A0=20
> > =C2=A0=C2=A0=09if (!IS_ERR_OR_NULL(fence)) {
> > -=09=09/* Drop for original kref_init of the fence */
> > -=09=09dma_fence_put(fence);
> > -
> > =C2=A0=C2=A0=09=09r =3D dma_fence_add_callback(fence, &sched_job->cb,
> > =C2=A0=C2=A0=09=09=09=09=09=C2=A0=C2=A0 drm_sched_job_done_cb);
> > =C2=A0=C2=A0=09=09if (r =3D=3D -ENOENT)
> > =C2=A0=C2=A0=09=09=09drm_sched_job_done(sched_job, fence-
> > >error);
> > =C2=A0=C2=A0=09=09else if (r)
> > =C2=A0=C2=A0=09=09=09DRM_DEV_ERROR(sched->dev, "fence add
> > callback failed (%d)\n", r);
> > +
> > +=09=09/*
> > +=09=09 * s_fence took a new reference to fence in the
> > call to
> > +=09=09 * drm_sched_fence_scheduled() above. The
> > reference passed by
> > +=09=09 * run_job() above is now not needed any longer.
> > Drop it.
> > +=09=09 */
> > +=09=09dma_fence_put(fence);
> > =C2=A0=C2=A0=09} else {
> > =C2=A0=C2=A0=09=09drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > =C2=A0=C2=A0=09=09=09=09=C2=A0=C2=A0 PTR_ERR(fence) : 0);
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 95e17504e46a..d5cd2a78f27c 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -420,10 +420,21 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0=09=09=09=09=09 struct drm_sched_entity
> > *s_entity);
> > =C2=A0=20
> > =C2=A0=C2=A0=09/**
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @run_job: Called to=
 execute the job once all of the
> > dependencies
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * have been resolved.=
=C2=A0 This may be called multiple times,
> > if
> > -=09 * timedout_job() has happened and
> > drm_sched_job_recovery()
> > -=09 * decides to try it again.
> > +=09 * @run_job: Called to execute the job once all of the
> > dependencies
> > +=09 * have been resolved. This may be called multiple times,
> > if
> > +=09 * timedout_job() has happened and
> > drm_sched_job_recovery() decides to
> > +=09 * try it again.
> > +=09 *
> > +=09 * @sched_job: the job to run
> > +=09 *
> > +=09 * Returns: dma_fence the driver must signal once the
> > hardware has
> > +=09 *=09completed the job ("hardware fence").
> > +=09 *
> > +=09 * Note that the scheduler expects to 'inherit' its own
> > reference to
> > +=09 * this fence from the callback. It does not invoke an
> > extra
> > +=09 * dma_fence_get() on it. Consequently, this callback must
> > take a
> > +=09 * reference for the scheduler, and additional ones for
> > the driver's
> > +=09 * respective needs.
>=20
> Another thing which would be really good to document here is what
> other=20
> things run_job can return apart from the fence.
>=20
> For instance amdgpu can return an ERR_PTR but I haven't looked into=20
> other drivers.

ERR_PTR and NULL are both fine.

But good catch, I'll add that in v2

P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > =C2=A0=C2=A0=09 */
> > =C2=A0=C2=A0=09struct dma_fence *(*run_job)(struct drm_sched_job
> > *sched_job);
> > =C2=A0=20
>=20

