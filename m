Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89CB267A8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 15:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F9C10E198;
	Thu, 14 Aug 2025 13:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jl1P9oiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A8B10E198
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 13:39:01 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-24458051ac6so1701665ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755178741; x=1755783541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/u5aHQcTs7K0PgEM3VVNTcP1zRLDKAIIOHRIdyyBD8M=;
 b=jl1P9oiY5Am5ysQafkVA8Cg5HzHTO4D4yOzqfrhA0sM35BDrrwNvltqIvHoKx1tsSs
 shP/btQkWkr6n66pfjZ3hId9zCj+MJAdT0BHo2aPajCiilb8SZlt+96if6nUCqKQLaly
 jDwoG1oImPPkBSbwa8fReYVmGnmtfjyBmGW0BSq3FA90/JyljHbjP+MjM/lVYEoQat5C
 +tK9mpbLI9PRGdoK9j93eQuVrT2ida+mg3i+/8Qw8Ye+b+AJCEq/2mHCgNxtNEgXjXrL
 kdub5loDevLo11sNtnw0NSZnVWBEiXUcMY7jV5dykNzo+drnl119pUlz9VSODoTZiXek
 k6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755178741; x=1755783541;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/u5aHQcTs7K0PgEM3VVNTcP1zRLDKAIIOHRIdyyBD8M=;
 b=H3yBV2ibNfolTeFlAkM9blC16VyGGlXX17WM6hOI7ekQJ1zxS8YRxVkKHOtkykXKjg
 fbxt0D5sF9vxtWQmB5ZDsTphIEc0P33PqzVU1fSWc/hCCIf4VObZwet28tXasCwtEDtQ
 2PoXJJ7aeVcgflwxZkxNUN/evHWU1R8Vxnp9amg/7lorE4Vjxk5oTP8zAMt6IH5zjjt0
 IBidXteTsGDyJLXPWuhbT5mVGvFkKgl/Va+WEzbPKP6m5h4mmYIwaIGPKa7raGxmag6z
 iu9agOpI71AS7z9O1dXDB9g5PwPMmMOSz33sXlha/ApfWeU8UTlE01w1j2yhNaiGbfIp
 TEAA==
X-Gm-Message-State: AOJu0YwL/dLHzpymnpCjeQg7WB03H2RuEPEHfn19Jmihm9zAJ/g0OzhM
 1gB+h7ly+mQsGZdjZVPIYjAuuWB7e4gtkcPvwwM3L0ziv6z3TQ8auUS4eSH3c2JrFUzJV0f51gM
 JH1dRt3Rz9+8FUtwjO3M4ZK8gGhk8m3s=
X-Gm-Gg: ASbGnctj3zeBPzny+5ZoRLrr/M1nxfAzKPtZ2vk+Qa1lA4gcThC5Y8LHr6jIZWi9e7R
 XKbyRkNdbpvHxudZ+ENOTcVxyBqnjVFDl1/m9tZg6Jv33ElJ5OgJaM3nJK/z5Wwx6+BPSDs+hEc
 mBHjxy0+AdjIC2V/h8KCqlFFpazUbQgzIPUN/sZCwwqJdPunTXiq4i8+yBcxRU/iy0w7EGX/1fB
 AOkslI=
X-Google-Smtp-Source: AGHT+IEE6SLVxncvxl+vxNgFr6rWvNTasMqB1K+VRaRB8pFaxkjSJTQaVr+JnH4yOfCAmtL8iBQ0eE99CNpVa0HFjo4=
X-Received: by 2002:a17:903:2352:b0:240:3c1d:cbe3 with SMTP id
 d9443c01a7336-24458556985mr21949965ad.4.1755178741113; Thu, 14 Aug 2025
 06:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250814133627.2550-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250814133627.2550-1-tvrtko.ursulin@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Aug 2025 09:38:49 -0400
X-Gm-Features: Ac12FXygtmLi4eOrUp7Mci2tD94rVRPaFm6Y6RuCcHm8YFRdK9HKtH7geFPuAZc
Message-ID: <CADnq5_PmQS=BVv6bp_CNxK8M5Rbti3nbr5jm_19RhBQ7zxWgqg@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Remove mention of indirect buffers
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
 Philipp Stanner <phasta@kernel.org>
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

On Thu, Aug 14, 2025 at 9:36=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
> Indirect buffers are an AMD term describing essentialy a job submitted to
> the scheduler, just a lower level one. Since scheduler was promoted to be
> generic long ago, lets replace those references with jobs.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 8867b95ab089..254932b9050e 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -285,9 +285,9 @@ long drm_sched_entity_flush(struct drm_sched_entity *=
entity, long timeout)
>                 return 0;
>
>         sched =3D entity->rq->sched;
> -       /**
> -        * The client will not queue more IBs during this fini, consume e=
xisting
> -        * queued IBs or discard them on SIGKILL
> +       /*
> +        * The client will not queue more jobs during this fini - consume
> +        * existing queued ones, or discard them on SIGKILL.
>          */
>         if (current->flags & PF_EXITING) {
>                 if (timeout)
> @@ -300,7 +300,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *=
entity, long timeout)
>                                     drm_sched_entity_is_idle(entity));
>         }
>
> -       /* For killed process disable any more IBs enqueue right now */
> +       /* For a killed process disallow further enqueueing of jobs. */
>         last_user =3D cmpxchg(&entity->last_user, current->group_leader, =
NULL);
>         if ((!last_user || last_user =3D=3D current->group_leader) &&
>             (current->flags & PF_EXITING) && (current->exit_code =3D=3D S=
IGKILL))
> @@ -324,9 +324,9 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
>  void drm_sched_entity_fini(struct drm_sched_entity *entity)
>  {
>         /*
> -        * If consumption of existing IBs wasn't completed. Forcefully re=
move
> -        * them here. Also makes sure that the scheduler won't touch this=
 entity
> -        * any more.
> +        * If consumption of existing jobs wasn't completed forcefully re=
move
> +        * them. Also makes sure that the scheduler won't touch this enti=
ty any
> +        * more.
>          */
>         drm_sched_entity_kill(entity);
>
> --
> 2.48.0
>
