Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB6C14C31
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090F889065;
	Tue, 28 Oct 2025 13:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YBCkvKCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437C089065
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:07:46 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-26816246a0aso10294865ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761656866; x=1762261666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kvzS0/jSIy7CDl/mEGjuYynAGZ6vcbGIPlikYvSXkM=;
 b=YBCkvKCftRK4OvpDPWm6f36zIkrv190xauG8SwQvKKspm8dBkAayIsYeiSUUucsNa0
 eea84RDzE+p+YjlzADj7l5UZ5VIFF9fiFpY/D7lHaO8FYYeiQfmSleagqJUjSledi+4p
 AkxCBUOHzHn3K+1Iut4hCiuZ5qQXlrG2qAklsdH9l+f5n2vxuxzbKCFzvZ97/wJcDj64
 gv1I/2dM3220v9BRpvrJ1ie3UAb1tzgYKgGzsLx9jTYU0jKT0WckhE+pT9FGGUm17d6l
 xP40p7PulP3LH+OHu4OcUwwboPkFacmHLj/m1mQAa8zXXJcFyTq65nqf+s0GHHC8+5mM
 MISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761656866; x=1762261666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kvzS0/jSIy7CDl/mEGjuYynAGZ6vcbGIPlikYvSXkM=;
 b=NZnV8Hno50DFbNmAUmkfjyAH7efF9M+EQefT+xAOxGVm09jR0vxNw4bs+BHtUN2ePn
 RmlIKCE9gBuamxOchiGPdKCh7loCGF2pZOpuMWGsj5qzeLZ1ASTMtJxH6wiKnZzMFQRn
 18fMVohqBS1+Rt+JxEtSPWJSJ5Y6Yn3hj6JeBipqRHkEQcq23Qlkk37luC4sruMxBfhv
 JFOh7TTG2xzy3hgHnXaQOlL0YtJrdeMqRJtAyd4P/JIQlrd1ybFutBKh4DH3cxjVTXg/
 sHBYN6s+x2u2liswmZIv8gY41BbpAHZkLaVwkzPLyGOmSP+YAtKRmIDhn6KspoGHYPDZ
 0ceA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe9/rgXtmTNQ4FwwiF5Bl/hAwv9rS4tf+X1bfm624Hg3D4mIDQTB2NlbHJ9SUFZI+k0ZpCSztPbkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbAOzEq+0ZU8kPeUmYs8BATjxLu1T0ZoKmd8gHtgNymM7AdsTT
 gj0LNqT7wxqnsUnzqecV4mwo9xUFO91o7rDHoevT2x2OS6YGFNiu8UqqNpD6KTfw/QouBv0hLly
 /UTRmVMDCwElnHRPTcF69g+ZE8Toqx/M=
X-Gm-Gg: ASbGncs96YZmSl/RVHuPjumeoq07ZvSu7xBeJ7iSTQ9nE2M0HVPHeROZrdzOvKqJhb3
 HtUTReiFI5gs1gcXSkrXPMPUn8skT/5HQpd30e0tr1Nk7i2jmE4qhsXIT12VcM/N4lcKVLhPCZ8
 3YR4YzGiQfZdgtqVHQg3EKFpV0qARV1dEyVwMO6zWnhVJ2oKj8+K4YGigNfG4A1Nd9Ysu/ojXiP
 Bx8Uo68AYBgLm1htK9a5RTfHCtuLt6NET8Hpu03TwLkyccLph4KmH7rRtmW
X-Google-Smtp-Source: AGHT+IFxqJ0chO5N9XUwGQoqrk97DLRJnC2zIK5W6KD8ZUigUW1gpwg1opbzCq548Dcjj2W9P+eH+mWhJO2vg0k2Mks=
X-Received: by 2002:a17:903:3c4d:b0:27e:eee6:6df2 with SMTP id
 d9443c01a7336-294cb3e8bb7mr23787505ad.7.1761656865668; Tue, 28 Oct 2025
 06:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251015140128.1470-1-christian.koenig@amd.com>
 <f60185e4a4b8622c866965ec30c90edca0c53b40.camel@mailbox.org>
In-Reply-To: <f60185e4a4b8622c866965ec30c90edca0c53b40.camel@mailbox.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Oct 2025 09:07:34 -0400
X-Gm-Features: AWmQ_bkiqjte5rzt7mxtUKn9Dq_tMumK7m2vzUO-oO6IFvVugOoF3l7P815Tebo
Message-ID: <CADnq5_PUrPE8q8JD=pVZZYpxJuqovMbD5UcSR9m4E0nPTK=-ZA@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v3
To: phasta@kernel.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dakr@kernel.org, matthew.brost@intel.com, dri-devel@lists.freedesktop.org
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

Looks like this hasn't landed yet.  Can someone push this?

Alex

On Fri, Oct 17, 2025 at 2:18=E2=80=AFAM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> On Wed, 2025-10-15 at 16:01 +0200, Christian K=C3=B6nig wrote:
> > From: David Rosca <david.rosca@amd.com>
> >
> > The DRM scheduler tracks who last uses an entity and when that process
> > is killed blocks all further submissions to that entity.
> >
> > The problem is that we didn't track who initially created an entity, so
> > when a process accidently leaked its file descriptor to a child and
> > that child got killed, we killed the parent's entities.
> >
> > Avoid that and instead initialize the entities last user on entity
> > creation. This also allows to drop the extra NULL check.
> >
> > v2: still use cmpxchg
> > v3: improve the commit message
> >
> > Signed-off-by: David Rosca <david.rosca@amd.com>
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > CC: stable@vger.kernel.org
>
> Acked-by: Philipp Stanner <phasta@kernel.org>
>
>
> Fire at will, Christian. Maybe optionally with the commit message nits
> twirked in we discussed before.
>
>
> P.
>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 5a4697f636f2..3e2f83dc3f24 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *en=
tity,
> >       entity->guilty =3D guilty;
> >       entity->num_sched_list =3D num_sched_list;
> >       entity->priority =3D priority;
> > +     entity->last_user =3D current->group_leader;
> >       /*
> >        * It's perfectly valid to initialize an entity without having a =
valid
> >        * scheduler attached. It's just not valid to use the scheduler b=
efore it
> > @@ -302,7 +303,7 @@ long drm_sched_entity_flush(struct drm_sched_entity=
 *entity, long timeout)
> >
> >       /* For a killed process disallow further enqueueing of jobs. */
> >       last_user =3D cmpxchg(&entity->last_user, current->group_leader, =
NULL);
> > -     if ((!last_user || last_user =3D=3D current->group_leader) &&
> > +     if (last_user =3D=3D current->group_leader &&
> >           (current->flags & PF_EXITING) && (current->exit_code =3D=3D S=
IGKILL))
> >               drm_sched_entity_kill(entity);
> >
>
