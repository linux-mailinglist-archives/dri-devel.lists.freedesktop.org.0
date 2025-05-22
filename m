Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3412EAC0CAC
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD81610EA12;
	Thu, 22 May 2025 13:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ggu+NwwP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2793810EA12;
 Thu, 22 May 2025 13:25:24 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-231f39b1b7aso3919455ad.2; 
 Thu, 22 May 2025 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747920323; x=1748525123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n4b+E0T4YrAmjHgzd/Vo2ndV3+vwuGWV9fbWiDIKafI=;
 b=ggu+NwwPa2A3Q0X6KvgUyaIxMxhLuSc5BuJ1Sps5F3mJfjzOeHRX7/KgUtJKaMqV6F
 Vu1UWUHuY85eOcwwbvy3xIzDykdj2RIxxkEXYklriFAMyPbF/HR6cbTdd5jgv6n39hKT
 eWb9thIXL7LUgi0McVmbmficrtROELiFQkAwrPI+ubRdHnfDRA7w9/5BhHsXEJEwxjND
 OsML8UJWaLtI8lODg4eNkILcWekvk74Su433mfUTUHmPyS9qrTJG7oc9hWjGheB8jYEN
 bpck7i0mO+i0EeVoXRgRZss7co8p0SS2vqEfpz5iPs7iIUtIMR//BhQqgSfqoZGdIm7E
 LALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747920323; x=1748525123;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n4b+E0T4YrAmjHgzd/Vo2ndV3+vwuGWV9fbWiDIKafI=;
 b=cABelQQS4J9YO8kMKj5Ygn3GjolV6rn7/mwfK1bRtfm9DM3zOjtMdRKFWv2Po3xyi1
 N7GePSAzRl9x1QZIjNUhUtXoEwXV5TyRd9pSiE+SqIDGIwUl9goNh4pWJkQhBd/+YYgW
 vc4Gnvmd/4quitzLrS4s5rbLK9BKBQyaQcoR05oYNlQdOioTstbWFzHhqpgQPNDpyH4Z
 /45Oi5ZNl7EuFe3e1NugKPkKg7tMvXSF3K/RfOUWCaiuiZM1swD7HE7knqKmi0Jnfyl2
 E/ewv3c2zd+cfuYLHGffjrtys1QNvIKD+N4YObagjjtWNAX2wXuC1CN1vsSFDfnDK7cR
 ejHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe5lAU9R8cZqiRUf3fqq+/GpzvJX4ZojigMe1LdeSV+pBFHRcGSZrjXWXCyM1vAojmBY9tfiFvy+lh@lists.freedesktop.org,
 AJvYcCXzNkLnuW0Fu8XY8VxL5EJ5hz0D7rJ9JDMBu6R73802LAfbFnWOrIdOhbhWCUci7GKWrva4vl+/Xg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/EpKThHFakt0u19GuDwyb1GACDD3lTmC8Q4d83v/qg9ZlUFxV
 aoR7apxuf7ecR2tfIYMtOR+sq3K881mqxxC7KoPrhMXnp2xSTVLKtt1u401UQVegKJWIphe+jT3
 kuaMhCXUE2bkwTQ8pA2s/JzZc4aAh7y1Mtw==
X-Gm-Gg: ASbGnctbXdEGmMxIbODHfaWjdpPt+tjxelsmppNbqzi9b0jYoregbeldZQc2XQc4YFy
 q18Mo1RrFYT/WzPVeiO7UhnMVAxrNXOigPW9qYAkDHaZLOX5dFoClJjMbkSmufZyZW5hNMWFr3T
 LAi5y35n1aC45AKkgz4r0zOVD4FI7be2/+1A==
X-Google-Smtp-Source: AGHT+IGu+XTlE0fy+pKdoJKvtDmNDOZuGZOQ7f6kaaCXhucjtI/Fd9U3dXNKkCtXXnhZx2HTIbjV+DAGcF5m1ms+E2w=
X-Received: by 2002:a17:903:41d0:b0:216:30f9:93c5 with SMTP id
 d9443c01a7336-231d43b7cb6mr132025805ad.6.1747920323386; Thu, 22 May 2025
 06:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250515020713.1110476-1-lincao12@amd.com>
 <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
In-Reply-To: <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 May 2025 09:25:10 -0400
X-Gm-Features: AX0GCFs8lsBqAsPDiniabG25q2o1D5llziVjgzPhdWm6W1GPgy-yy93yex8EOgo
Message-ID: <CADnq5_M2VDyrBcAZxkYFqE6myJGBKL+aBNL0GNiu=+mfroH+8w@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: signal scheduled fence when kill job
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Lin.Cao" <lincao12@amd.com>, dri-devel@lists.freedesktop.org, 
 aamd-gfx@lists.freedesktop.org, haijun.chang@amd.com, zhenguo.yin@amd.com, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
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

On Thu, May 15, 2025 at 4:58=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Explicitly adding the scheduler maintainers.
>
> On 5/15/25 04:07, Lin.Cao wrote:
> > Previously we only signaled finished fence which may cause some
> > submission's dependency cannot be cleared the cause benchmark hang.
> > Signal both scheduled fence and finished fence could fix this issue.
> >
> > Signed-off-by: Lin.Cao <lincao12@amd.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Danilo & Philipp can we quickly get an rb for that? I'm volunteering to p=
ush it to drm-misc-fixes and add the necessary stable tags since this is a =
fix for a rather ugly bug.

Did this land in drm-misc?  I don't see it.

Alex

>
> Regards,
> Christian.
>
>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index bd39db7bb240..e671aa241720 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -176,6 +176,7 @@ static void drm_sched_entity_kill_jobs_work(struct =
work_struct *wrk)
> >  {
> >       struct drm_sched_job *job =3D container_of(wrk, typeof(*job), wor=
k);
> >
> > +     drm_sched_fence_scheduled(job->s_fence, NULL);
> >       drm_sched_fence_finished(job->s_fence, -ESRCH);
> >       WARN_ON(job->s_fence->parent);
> >       job->sched->ops->free_job(job);
>
