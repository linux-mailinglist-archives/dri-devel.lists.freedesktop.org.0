Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13457830CBB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1137E10E7D4;
	Wed, 17 Jan 2024 18:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1755010E7BE;
 Wed, 17 Jan 2024 18:29:31 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40e60d74b81so3185945e9.1; 
 Wed, 17 Jan 2024 10:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705516109; x=1706120909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2YTIWppZOBmL1H/qdXTnDsoCpEw1sXU7s7kj9GmEfng=;
 b=S5KmANRRAN1saIu+YDv1SaPcSrmqKusftZ4baUtGxhcKfv2E91aJMbEhxMSlSwg69w
 IMtq9kps3FUqpcbDJ6pd7PBQAdrUyxd39k71opCo8rBrflWZF1VeUQRapwutTMq0+wiF
 eVjlJ9rjonr4K4BInxW5BGp1y41z4nPnyaPVJcO6cf8pN1ThOvsHS9Z3QvE/aHqaUIvc
 08R8mGJqJbB0BFT1S1V5sTeZbPCAx5k81zENMJQuMKFMNP1za0ZWhBwChwvG1QhIQAgC
 1Y3bmU3kiq6pQVOMhj4/2lUaWKXpLs0s26RZLU4rqX1++4WAdGdtJ/e7j7I5/N/qNk3v
 /ROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705516109; x=1706120909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YTIWppZOBmL1H/qdXTnDsoCpEw1sXU7s7kj9GmEfng=;
 b=aZEIxjHK0h7ch0HZb2DvOyR4m+KWQFfQZwDb3FHgByzWzQ2SSY/HKVBmhNybIa68uW
 H/8xF8s42GUiwPdnzO1JKHQ5S3bk9IUGQG+mw41fMf0/Dj2rPznbHBd0+UUjBeU18Of5
 3KY81N5OpG7ngEtTk3ptLEkSb0cLbFeVdQYhA98nl6huSpPeVzqUPxlBDZ/hEg3ulirp
 yaMDj+ohGcYdO0/X/U1D/R3h227PDURCe/e7AtggZ++DKTuzOAfGQu3UrLOawmss1dsk
 Y9JJdDqFFfpian46wFVfTa9tfgmxbiVPfWIgVfqLeQ+7QxdTLpE0a0i8C9Bu7nE3g2N4
 oamA==
X-Gm-Message-State: AOJu0YwfdDXE/w9RJ4Ya2DazRUcyiNpl8oGUmM+ky+IByUYscpeM22wf
 7nW22LNiDyN7akFvl+csY24k17ZMAybCuXQ1cLk=
X-Google-Smtp-Source: AGHT+IEBNi5qG09aWKVIGebEpdYQKcvYy1/Zs4NTddYCXN5LBWTykzC2D8B21MvTXNKkVrx5cxbkWxUUYO/cZli+noE=
X-Received: by 2002:a05:600c:3ca3:b0:40e:89e8:107a with SMTP id
 bg35-20020a05600c3ca300b0040e89e8107amr184597wmb.3.1705516109458; Wed, 17 Jan
 2024 10:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-6-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-6-nunes.erico@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 17 Jan 2024 10:28:02 -0800
Message-ID: <CA+E=qVe_5fDsW+_KobwP5+Xg0Tac3Eh3dtVsmM1VSEmiQeH_cQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] drm/lima: remove guilty drm_sched context handling
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 7:12=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> Marking the context as guilty currently only makes the application which
> hits a single timeout problem to stop its rendering context entirely.
> All jobs submitted later are dropped from the guilty context.
>
> Lima runs on fairly underpowered hardware for modern standards and it is
> not entirely unreasonable that a rendering job may time out occasionally
> due to high system load or too demanding application stack. In this case
> it would be generally preferred to report the error but try to keep the
> application going.
>
> Other similar embedded GPU drivers don't make use of the guilty context
> flag. Now that there are reliability improvements to the lima timeout
> recovery handling, drop the guilty contexts to let the application keep
> running in this case.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  drivers/gpu/drm/lima/lima_ctx.c   | 2 +-
>  drivers/gpu/drm/lima/lima_ctx.h   | 1 -
>  drivers/gpu/drm/lima/lima_sched.c | 5 ++---
>  drivers/gpu/drm/lima/lima_sched.h | 3 +--
>  4 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_=
ctx.c
> index 8389f2d7d021..0e668fc1e0f9 100644
> --- a/drivers/gpu/drm/lima/lima_ctx.c
> +++ b/drivers/gpu/drm/lima/lima_ctx.c
> @@ -19,7 +19,7 @@ int lima_ctx_create(struct lima_device *dev, struct lim=
a_ctx_mgr *mgr, u32 *id)
>         kref_init(&ctx->refcnt);
>
>         for (i =3D 0; i < lima_pipe_num; i++) {
> -               err =3D lima_sched_context_init(dev->pipe + i, ctx->conte=
xt + i, &ctx->guilty);
> +               err =3D lima_sched_context_init(dev->pipe + i, ctx->conte=
xt + i);
>                 if (err)
>                         goto err_out0;
>         }
> diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/lima_=
ctx.h
> index 74e2be09090f..5b1063ce968b 100644
> --- a/drivers/gpu/drm/lima/lima_ctx.h
> +++ b/drivers/gpu/drm/lima/lima_ctx.h
> @@ -13,7 +13,6 @@ struct lima_ctx {
>         struct kref refcnt;
>         struct lima_device *dev;
>         struct lima_sched_context context[lima_pipe_num];
> -       atomic_t guilty;
>
>         /* debug info */
>         char pname[TASK_COMM_LEN];
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index 9449b81bcd5b..496c79713fe8 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -154,13 +154,12 @@ void lima_sched_task_fini(struct lima_sched_task *t=
ask)
>  }
>
>  int lima_sched_context_init(struct lima_sched_pipe *pipe,
> -                           struct lima_sched_context *context,
> -                           atomic_t *guilty)
> +                           struct lima_sched_context *context)
>  {
>         struct drm_gpu_scheduler *sched =3D &pipe->base;
>
>         return drm_sched_entity_init(&context->base, DRM_SCHED_PRIORITY_N=
ORMAL,
> -                                    &sched, 1, guilty);
> +                                    &sched, 1, NULL);
>  }
>
>  void lima_sched_context_fini(struct lima_sched_pipe *pipe,
> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lim=
a_sched.h
> index 34050facb110..677e908b53f8 100644
> --- a/drivers/gpu/drm/lima/lima_sched.h
> +++ b/drivers/gpu/drm/lima/lima_sched.h
> @@ -93,8 +93,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
>  void lima_sched_task_fini(struct lima_sched_task *task);
>
>  int lima_sched_context_init(struct lima_sched_pipe *pipe,
> -                           struct lima_sched_context *context,
> -                           atomic_t *guilty);
> +                           struct lima_sched_context *context);
>  void lima_sched_context_fini(struct lima_sched_pipe *pipe,
>                              struct lima_sched_context *context);
>  struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *=
task);
> --
> 2.43.0
>
