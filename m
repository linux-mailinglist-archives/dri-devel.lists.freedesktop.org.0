Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E73CBDA997
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E30B10E654;
	Tue, 14 Oct 2025 16:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f/OFe2W1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA2F10E654
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:23:33 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-333abc4394dso820852a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760459013; x=1761063813; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsZIPiA5yGb4JXM8bEus0ZZn2E5Sfcn6n5pdTr+Id0k=;
 b=f/OFe2W1XhI6l3dTQhu/07fEei+LQ0Qq3DZbrsmB6RnkE+exXKybTTKDnIdoMTtJm0
 kyJrneymeAus7gWUUz8UhVWi5xCOW6UJUWmNZHu0AU3fx+4me4Acp6XqKLjyU1mCa5DB
 s3szvINgTNzN+TJ7l56P6tYpe3hn11dOJQMFtMNpQ8zCjHWkOJqCTcwmhFypk6Wf9S4O
 RcN0UWf2ZZd86erAf1arw/nyNo7yfkXYKyl4wZxdR+1lgNpeT2W8Dmr15KWMfTJiHWUk
 yIqIlvjGCgthpdcGSCoM22xHP8jEEWmVihTvJwejid1YxUHrbdeR63kMRMGHzDr1o/tr
 n8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760459013; x=1761063813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YsZIPiA5yGb4JXM8bEus0ZZn2E5Sfcn6n5pdTr+Id0k=;
 b=W8Fou6k6Kayb0LwXilzH8eQdhOoI+nZ3YN6Q8I0goknLGVoN7EOoF6H9uSkUL4fZKF
 X8h0iDFFNLjmTkZIh4FH6ZoHblgvGctnM4/sJJcxza9nImtrfnGariP1VVxq9tVP7Gfb
 YTsdJIv6EPqdvbiYAXSSgonpsGp0Nw4L79J8OKlx0g+r/Yt6hBrxHmQ+fvGWvANzObLB
 qVe5+AX/kQy/MiwLdJk95VzPR7EzgKhqWc8ah/cmE5W3T6hZGtIv6X6u8/Dfdz+oCSnf
 w4PGGC7psHkj3fa4vnxDF1a21pS8nwT4+dObeyM6vq3fySIoQqYjP65NSmOP7Dp1Ey2n
 1k4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHsTdjY2Rqc61SNxFDtimoffk6Z2XT8JhLsV6SIMlyvHCM6IUjtEU37fRgg0sn9wOUVzateBKpeug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3kcuktgnMW70HTNHeb7rLlMlZUKQ7xA2lSbdNHUosycTN+iyu
 JZV8Ig9OebAHguayBu9YV8h1rVL0t2fQen3iREStGWhOCA3/Eh/+AGhzCBlkYyFiPF+pCOdRsxd
 kKT1Ps7vnI8/1Zuc5SzVxv7lvMVTC1Ghj5SuW
X-Gm-Gg: ASbGncubnOgDNatwsOsTsz3nSnHvJ94pqnynt9lEoh0dHTNGmbhIPjuiKKKPSFge2yU
 rJOgvbLeuLTppN79InvBAkWzRwhDJlAONceUtk4VFJqpHzMhLBIuM6isYgcT/+/CA0qJrS9rpMx
 W4ynXbcS1S+KyxDrjJr+yOjPdWZbPzq44uQDyHqTBzvICtUqQ0eGc8XGbpWL0HRzgbK3BHgzHJ1
 JII/tcKADFnfTUVl01ZKZqG9IFkgh2R+pRX
X-Google-Smtp-Source: AGHT+IEdajn2b986fomaG7VQzopp3X8PhckJ4ygoQggPFgzbLPEeH38f28MHs5VgfvUw2r9q3CZP0KAhby3e7vQkkZo=
X-Received: by 2002:a17:903:2f83:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-290270f90cemr165253965ad.0.1760459013077; Tue, 14 Oct 2025
 09:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251014142430.2470-1-christian.koenig@amd.com>
In-Reply-To: <20251014142430.2470-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Oct 2025 12:23:21 -0400
X-Gm-Features: AS18NWDTyBIx3lIUL8XzF5hfmTcGKfB1CkZGlK88sYP4HqHGtlLSFVoOYbYqa88
Message-ID: <CADnq5_Ns-1eGK6JA4E_Rq_PEORJ6mgo9-cJ5yk5ofV2V4n4JWw@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: matthew.brost@intel.com, dakr@kernel.org, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Tue, Oct 14, 2025 at 11:41=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> From: David Rosca <david.rosca@amd.com>
>
> The DRM scheduler tracks who last uses an entity and when that process
> is killed blocks all further submissions to that entity.
>
> The problem is that we didn't tracked who initialy created an entity, so

initially

> when an process accidentially leaked its file descriptor to a child and

accidently

> that child got killed we killed the parents entities.

that child got killed, we killed the parent's entities.

>
> Avoid that and instead initialize the entities last user on entity
> creation.
>
> Signed-off-by: David Rosca <david.rosca@amd.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> CC: stable@vger.kernel.org

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568

With the above fixes,
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 5a4697f636f2..3e2f83dc3f24 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *enti=
ty,
>         entity->guilty =3D guilty;
>         entity->num_sched_list =3D num_sched_list;
>         entity->priority =3D priority;
> +       entity->last_user =3D current->group_leader;
>         /*
>          * It's perfectly valid to initialize an entity without having a =
valid
>          * scheduler attached. It's just not valid to use the scheduler b=
efore it
> @@ -302,7 +303,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *=
entity, long timeout)
>
>         /* For a killed process disallow further enqueueing of jobs. */
>         last_user =3D cmpxchg(&entity->last_user, current->group_leader, =
NULL);
> -       if ((!last_user || last_user =3D=3D current->group_leader) &&
> +       if (last_user =3D=3D current->group_leader &&
>             (current->flags & PF_EXITING) && (current->exit_code =3D=3D S=
IGKILL))
>                 drm_sched_entity_kill(entity);
>
> --
> 2.43.0
>
