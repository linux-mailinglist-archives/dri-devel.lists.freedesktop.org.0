Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D1F9719C8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 14:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B07510E44F;
	Mon,  9 Sep 2024 12:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CcGFdCAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D0410E44F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 12:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725886022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACM/uffDB/SuoxlLVt56Dj3zgOPDLmdwco9azNLGs6w=;
 b=CcGFdCAIfi1VEBJphuLigu2AiNCrQTzSYjsMrNQiIY89BBBtVbk6QD0Bou7H8GgnZ4dxwv
 DJEoVN81s1uGblNE7ijNmgoKRfmmr7t4i3xnZtODOmHlhX5NQK2VqFex4OCNhZqwMLWmWo
 0ZNDDMaKLwg2zGllwYQ2KSIn0Innsoc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-7h0rExYQOd2QSmKoYCgv5g-1; Mon, 09 Sep 2024 08:47:00 -0400
X-MC-Unique: 7h0rExYQOd2QSmKoYCgv5g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb6dc3365so7745155e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 05:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725886020; x=1726490820;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ACM/uffDB/SuoxlLVt56Dj3zgOPDLmdwco9azNLGs6w=;
 b=kQI1OppvVsKJHn3RuiJoMnwrCQCTeIa9Ab3JCDBTpYlqRMYH9n6Lu/rVco0X8XChEx
 8pvbFvAgkTqFD/4s93PCqh9jN2gniJ23ARk/Wx/eoBZPdQppiF9XGdwTK1N8lrUBEEI9
 PRjc9Gt5zmKJOHqsenTa/mBbHcOhmZU2Jx3Xul+LJ02U4w182kxcHIBT8bX3jNS1O0kw
 nFzpWUrREN+3s3bsTqMfk1o+hGUgVJy44N9CGzoLDrXsXIfViBCMWw6YTZJNEFEa9tYb
 NHUDsd6Ava88L6H7PBPmUrsk50BvncrM7IfXvwIMt7DyPYdjZWIAHbotwYDx2aZ8UyoW
 tYTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAs1rz/SF3X5vIvOGdO9bwSZ7lA2XYyj5KzXKA/Ral3vVMSujXcMqS6OjA52u4YnNBhD04sCjsqG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywBeBPjte9UvJQZNmf2X8t9fTviXlLvd8NsxIZMLEn7jxgEBGn
 RzvkOcrBCe1TXw4LHSZkUhs9groRqChBWoYzOG161yhglHZXtGu6e+HpIcSJIqjeJDWQz6EC9qr
 XVut/JQLS9ctgV5WLkVf1zcD8gaat72Dp+d+QBug5s/5Dz9kWF8ZI/xI4mBibNtSAYw==
X-Received: by 2002:a05:600c:214d:b0:42c:a8d5:2df5 with SMTP id
 5b1f17b1804b1-42ca8d52ed6mr59816925e9.24.1725886019542; 
 Mon, 09 Sep 2024 05:46:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmxJnTJHVcfRJCmRClUFgKHaviWnUesTJlxfFJwqWOk8Syup77zQPDM2aGz8zSy2lq1hfWJA==
X-Received: by 2002:a05:600c:214d:b0:42c:a8d5:2df5 with SMTP id
 5b1f17b1804b1-42ca8d52ed6mr59816685e9.24.1725886019035; 
 Mon, 09 Sep 2024 05:46:59 -0700 (PDT)
Received: from dhcp-64-8.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675c40sm5963080f8f.51.2024.09.09.05.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 05:46:58 -0700 (PDT)
Message-ID: <d8944e6ad57e4efcd480d917a38f9cee9475d59c.camel@redhat.com>
Subject: Re: [RFC 1/4] drm/sched: Add locking to drm_sched_entity_modify_sched
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Tvrtko Ursulin <tursulin@igalia.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>,  Matthew Brost <matthew.brost@intel.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 stable@vger.kernel.org
Date: Mon, 09 Sep 2024 14:46:57 +0200
In-Reply-To: <14ef37f4-b982-41c1-8121-80882917e9c0@igalia.com>
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-2-tursulin@igalia.com>
 <8d763e5162ebc130a05da3cefbff148cdb6ce042.camel@redhat.com>
 <80e02cde-19e7-4fb6-a572-fb45a639a3b7@amd.com>
 <2356e3d66da3e5795295267e527042ab44f192c8.camel@redhat.com>
 <fb9556a1-b48d-49ed-9b9c-74b21fb76af4@amd.com>
 <14ef37f4-b982-41c1-8121-80882917e9c0@igalia.com>
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

On Mon, 2024-09-09 at 13:37 +0100, Tvrtko Ursulin wrote:
>=20
> On 09/09/2024 13:18, Christian K=C3=B6nig wrote:
> > Am 09.09.24 um 14:13 schrieb Philipp Stanner:
> > > On Mon, 2024-09-09 at 13:29 +0200, Christian K=C3=B6nig wrote:
> > > > Am 09.09.24 um 11:44 schrieb Philipp Stanner:
> > > > > On Fri, 2024-09-06 at 19:06 +0100, Tvrtko Ursulin wrote:
> > > > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > >=20
> > > > > > Without the locking amdgpu currently can race
> > > > > > amdgpu_ctx_set_entity_priority() and drm_sched_job_arm(),
> > > > > I would explicitly say "amdgpu's
> > > > > amdgpu_ctx_set_entity_priority()
> > > > > races
> > > > > through drm_sched_entity_modify_sched() with
> > > > > drm_sched_job_arm()".
> > > > >=20
> > > > > The actual issue then seems to be drm_sched_job_arm() calling
> > > > > drm_sched_entity_select_rq(). I would mention that, too.
> > > > >=20
> > > > >=20
> > > > > > leading to the
> > > > > > latter accesing potentially inconsitent entity->sched_list
> > > > > > and
> > > > > > entity->num_sched_list pair.
> > > > > >=20
> > > > > > The comment on drm_sched_entity_modify_sched() however
> > > > > > says:
> > > > > >=20
> > > > > > """
> > > > > > =C2=A0=C2=A0=C2=A0* Note that this must be called under the sam=
e common
> > > > > > lock for
> > > > > > @entity as
> > > > > > =C2=A0=C2=A0=C2=A0* drm_sched_job_arm() and drm_sched_entity_pu=
sh_job(),
> > > > > > or the
> > > > > > driver
> > > > > > needs to
> > > > > > =C2=A0=C2=A0=C2=A0* guarantee through some other means that thi=
s is never
> > > > > > called
> > > > > > while
> > > > > > new jobs
> > > > > > =C2=A0=C2=A0=C2=A0* can be pushed to @entity.
> > > > > > """
> > > > > >=20
> > > > > > It is unclear if that is referring to this race or
> > > > > > something
> > > > > > else.
> > > > > That comment is indeed a bit awkward. Both
> > > > > drm_sched_entity_push_job()
> > > > > and drm_sched_job_arm() take rq_lock. But
> > > > > drm_sched_entity_modify_sched() doesn't.
> > > > >=20
> > > > > The comment was written in 981b04d968561. Interestingly, in
> > > > > drm_sched_entity_push_job(), this "common lock" is mentioned
> > > > > with
> > > > > the
> > > > > soft requirement word "should" and apparently is more about
> > > > > keeping
> > > > > sequence numbers in order when inserting.
> > > > >=20
> > > > > I tend to think that the issue discovered by you is unrelated
> > > > > to
> > > > > that
> > > > > comment. But if no one can make sense of the comment, should
> > > > > it
> > > > > maybe
> > > > > be removed? Confusing comment is arguably worse than no
> > > > > comment
> > > > Agree, we probably mixed up in 981b04d968561 that submission
> > > > needs a
> > > > common lock and that rq/priority needs to be protected by the
> > > > rq_lock.
> > > >=20
> > > > There is also the big FIXME in the drm_sched_entity
> > > > documentation
> > > > pointing out that this is most likely not implemented
> > > > correctly.
> > > >=20
> > > > I suggest to move the rq, priority and rq_lock fields together
> > > > in the
> > > > drm_sched_entity structure and document that rq_lock is
> > > > protecting
> > > > the two.
> > > That could also be a great opportunity for improving the lock
> > > naming:
> >=20
> > Well that comment made me laugh because I point out the same when
> > the=20
> > scheduler came out ~8years ago and nobody cared about it since
> > then.
> >=20
> > But yeah completely agree :)
>=20
> Maybe, but we need to keep in sight the fact some of these fixes may
> be=20
> good to backport. In which case re-naming exercises are best left to
> follow.

My argument basically. It's good if fixes and other improvements are
separated, in general, unless there is a practical / good reason not
to.

>=20
> Also..
>=20
> > > void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
> > > ktime_t=20
> > > ts)
> > > {
> > > =C2=A0=C2=A0=C2=A0=C2=A0/*
> > > =C2=A0=C2=A0=C2=A0=C2=A0 * Both locks need to be grabbed, one to prot=
ect from entity-
> > > >rq=20
> > > change
> > > =C2=A0=C2=A0=C2=A0=C2=A0 * for entity from within concurrent
> > > drm_sched_entity_select_rq=20
> > > and the
> > > =C2=A0=C2=A0=C2=A0=C2=A0 * other to update the rb tree structure.
> > > =C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0spin_lock(&entity->rq_lock);
> > > =C2=A0=C2=A0=C2=A0=C2=A0spin_lock(&entity->rq->lock);
>=20
> .. I agree this is quite unredable and my initial reaction was a
> similar=20
> ugh. However.. What names would you guys suggest and for what to make
> this better and not lessen the logic of naming each individually?

According to the documentation, drm_sched_rq.lock does not protect the
entire runque, but "@lock: to modify the entities list."

So I would keep drm_sched_entity.rq_lock as it is, because it indeed
protects the entire runqueue.

And drm_sched_rq.lock could be named "entities_lock" or
"entities_list_lock" or something. That's debatable, but it should be
something that highlights that this lock is not for locking the entire
runque as the one in the entity apparently is.


Cheers,
P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > > [...]
> > >=20
> > >=20
> > > P.
> > >=20
> > >=20
> > > > Then audit the code if all users of rq and priority actually
> > > > hold the
> > > > correct locks while reading and writing them.
> > > >=20
> > > > Regards,
> > > > Christian.
> > > >=20
> > > > > P.
> > > > >=20
> > > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > Fixes: b37aced31eb0 ("drm/scheduler: implement a function
> > > > > > to
> > > > > > modify
> > > > > > sched list")
> > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > Cc: <stable@vger.kernel.org> # v5.7+
> > > > > > ---
> > > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 2 =
++
> > > > > > =C2=A0=C2=A0=C2=A01 file changed, 2 insertions(+)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > index 58c8161289fe..ae8be30472cd 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > @@ -133,8 +133,10 @@ void
> > > > > > drm_sched_entity_modify_sched(struct
> > > > > > drm_sched_entity *entity,
> > > > > > =C2=A0=C2=A0=C2=A0{
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(!num_sched_list ||=
 !sched_list);
> > > > > > +=C2=A0=C2=A0=C2=A0 spin_lock(&entity->rq_lock);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity->sched_list =3D sch=
ed_list;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity->num_sched_list =3D=
 num_sched_list;
> > > > > > +=C2=A0=C2=A0=C2=A0 spin_unlock(&entity->rq_lock);
> > > > > > =C2=A0=C2=A0=C2=A0}
> > > > > > =C2=A0=C2=A0=C2=A0EXPORT_SYMBOL(drm_sched_entity_modify_sched);
> >=20
>=20

