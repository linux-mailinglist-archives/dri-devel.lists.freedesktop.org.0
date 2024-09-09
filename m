Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBAA971904
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 14:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117DD10E394;
	Mon,  9 Sep 2024 12:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RWJzsqiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1005C10E394
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725884035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGXaupiBvlrrtQtHTXtD8BDwBLVb5uLvmxCBzgICBUE=;
 b=RWJzsqiE8JzXaML40rWTzDtvxRA0n9x7akybkpxscdPArISE0i65YJrt8HrP/bEWmmgkQI
 GTE4fz4rKPidIWHhODZgTuTi9eaOwl1t7zTQX2uHKGgpwAMOLpfVC7KHm9SaQ00eMe44RO
 sI3k1JJvfaW8OCxqjiwYH0TNni2h7Yg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-03vfMa_sNIe1SYLmEs1Xjg-1; Mon, 09 Sep 2024 08:13:54 -0400
X-MC-Unique: 03vfMa_sNIe1SYLmEs1Xjg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374b9a8512dso2051832f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 05:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725884033; x=1726488833;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bkATp1QtmV3cfFCcvxrwKHj5NzaYjxngX1fAPFVvMdU=;
 b=MGiYrqz2CuxjCXgVM3SH14QmHtPK1RkvdUr+teOSMB/dTFOF8eCaMiwHda2vwCDkmQ
 2OTVSF7O/Ox6pvMaz0tU2MQmjV5Oa4inQxaHe/bZmluWuey1olQam4VUyscsXvV8VTcF
 Cbk9ZyDSVYGD0KPQI3Mc7DxFjWUWC6vafOfB43Xn8xvuJn9CKYI03PIbuETj/uZx2Q0q
 eXsFOwX/Nb5Zg/JQR6yK5W1P5mGfsvmPtGY2QH7P7zGP3WqPjYiId/HN4m2lLkjnybH+
 GGXDDVJ8V3bYPBBbbZN4Q6/fDefYX8YVvXcEfUCnpcyL0MsYO0oGQujYkJ6sCrKiUY+J
 AAdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGWg8pGzskXVERYSfe6rNVS7HK0TqDMBjsGBYLrFWQdHdjUlkGm7BsBEIyzmWtxYCEwx8JC6gdYBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6KI8ODHMpcSQ7KFKkGja29L7Hs2qp5AH25Nj35C2l5jQpZl3X
 Hba3+7Fg56l4JQj05qQlPrDNbGv3WZMN6LWzmTBRLPN8sFC0EIZ7XLZ1Xx1JenNi7VBGAQredFk
 LwfvbqgWzXU55+daNzjk7BQK4eksM3v4Ja63kfDPVCxU0WH7ZedYt6kpKx5U5LK3Vhg==
X-Received: by 2002:adf:f34c:0:b0:367:9d05:cf1f with SMTP id
 ffacd0b85a97d-378895cafc0mr6687254f8f.14.1725884032743; 
 Mon, 09 Sep 2024 05:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgMPgGNVXT36LLq3lOi6IkAmkuKGmW1abkfOEOmlNebAx4FKPDNq5cQYQfDHfnz4n6zWNSAg==
X-Received: by 2002:adf:f34c:0:b0:367:9d05:cf1f with SMTP id
 ffacd0b85a97d-378895cafc0mr6687227f8f.14.1725884032182; 
 Mon, 09 Sep 2024 05:13:52 -0700 (PDT)
Received: from dhcp-64-8.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de3d4sm5882267f8f.108.2024.09.09.05.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 05:13:51 -0700 (PDT)
Message-ID: <2356e3d66da3e5795295267e527042ab44f192c8.camel@redhat.com>
Subject: Re: [RFC 1/4] drm/sched: Add locking to drm_sched_entity_modify_sched
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Tvrtko
 Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
Date: Mon, 09 Sep 2024 14:13:50 +0200
In-Reply-To: <80e02cde-19e7-4fb6-a572-fb45a639a3b7@amd.com>
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-2-tursulin@igalia.com>
 <8d763e5162ebc130a05da3cefbff148cdb6ce042.camel@redhat.com>
 <80e02cde-19e7-4fb6-a572-fb45a639a3b7@amd.com>
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

On Mon, 2024-09-09 at 13:29 +0200, Christian K=C3=B6nig wrote:
> Am 09.09.24 um 11:44 schrieb Philipp Stanner:
> > On Fri, 2024-09-06 at 19:06 +0100, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > >=20
> > > Without the locking amdgpu currently can race
> > > amdgpu_ctx_set_entity_priority() and drm_sched_job_arm(),
> > I would explicitly say "amdgpu's amdgpu_ctx_set_entity_priority()
> > races
> > through drm_sched_entity_modify_sched() with drm_sched_job_arm()".
> >=20
> > The actual issue then seems to be drm_sched_job_arm() calling
> > drm_sched_entity_select_rq(). I would mention that, too.
> >=20
> >=20
> > > leading to the
> > > latter accesing potentially inconsitent entity->sched_list and
> > > entity->num_sched_list pair.
> > >=20
> > > The comment on drm_sched_entity_modify_sched() however says:
> > >=20
> > > """
> > > =C2=A0=C2=A0* Note that this must be called under the same common loc=
k for
> > > @entity as
> > > =C2=A0=C2=A0* drm_sched_job_arm() and drm_sched_entity_push_job(), or=
 the
> > > driver
> > > needs to
> > > =C2=A0=C2=A0* guarantee through some other means that this is never c=
alled
> > > while
> > > new jobs
> > > =C2=A0=C2=A0* can be pushed to @entity.
> > > """
> > >=20
> > > It is unclear if that is referring to this race or something
> > > else.
> > That comment is indeed a bit awkward. Both
> > drm_sched_entity_push_job()
> > and drm_sched_job_arm() take rq_lock. But
> > drm_sched_entity_modify_sched() doesn't.
> >=20
> > The comment was written in 981b04d968561. Interestingly, in
> > drm_sched_entity_push_job(), this "common lock" is mentioned with
> > the
> > soft requirement word "should" and apparently is more about keeping
> > sequence numbers in order when inserting.
> >=20
> > I tend to think that the issue discovered by you is unrelated to
> > that
> > comment. But if no one can make sense of the comment, should it
> > maybe
> > be removed? Confusing comment is arguably worse than no comment
>=20
> Agree, we probably mixed up in 981b04d968561 that submission needs a=20
> common lock and that rq/priority needs to be protected by the
> rq_lock.
>=20
> There is also the big FIXME in the drm_sched_entity documentation=20
> pointing out that this is most likely not implemented correctly.
>=20
> I suggest to move the rq, priority and rq_lock fields together in the
> drm_sched_entity structure and document that rq_lock is protecting
> the two.

That could also be a great opportunity for improving the lock naming:

void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
{
=09/*
=09 * Both locks need to be grabbed, one to protect from entity->rq change
=09 * for entity from within concurrent drm_sched_entity_select_rq and the
=09 * other to update the rb tree structure.
=09 */
=09spin_lock(&entity->rq_lock);
=09spin_lock(&entity->rq->lock);

[...]


P.


>=20
> Then audit the code if all users of rq and priority actually hold the
> correct locks while reading and writing them.
>=20
> Regards,
> Christian.
>=20
> >=20
> > P.
> >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Fixes: b37aced31eb0 ("drm/scheduler: implement a function to
> > > modify
> > > sched list")
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: <stable@vger.kernel.org> # v5.7+
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 2 ++
> > > =C2=A0=C2=A01 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > index 58c8161289fe..ae8be30472cd 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -133,8 +133,10 @@ void drm_sched_entity_modify_sched(struct
> > > drm_sched_entity *entity,
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0=09WARN_ON(!num_sched_list || !sched_list);
> > > =C2=A0=20
> > > +=09spin_lock(&entity->rq_lock);
> > > =C2=A0=C2=A0=09entity->sched_list =3D sched_list;
> > > =C2=A0=C2=A0=09entity->num_sched_list =3D num_sched_list;
> > > +=09spin_unlock(&entity->rq_lock);
> > > =C2=A0=C2=A0}
> > > =C2=A0=C2=A0EXPORT_SYMBOL(drm_sched_entity_modify_sched);
> > > =C2=A0=20
>=20

