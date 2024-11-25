Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A13B9D8D41
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 21:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0AD10E108;
	Mon, 25 Nov 2024 20:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="bz/zm/pq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860D910E108
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 20:07:10 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-434a45f05feso4536385e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 12:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732565229; x=1733170029;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qec4i0RH6ZaXuVRR/piQgQkJPRtSOnwwzdHBOcyWaMg=;
 b=bz/zm/pqSyn6GWxNJMeyImVAjMIBFY6PztmlTFOgBLbJxs+/ryIHnCT2xN40Vy4VgY
 fyBaj2ZBxlJInmY2y1q2MnIW/f/OmKNJdeteS//6p01V7s1EOLIEdXAxoWO1zPx95ZEO
 Ohe46DotV6nKoIvx6K5JyIyLXtfL1sS2wny6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732565229; x=1733170029;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qec4i0RH6ZaXuVRR/piQgQkJPRtSOnwwzdHBOcyWaMg=;
 b=GwaHXfJ6qs3/uTUunAnBj7X4ga2wwyuzwPhF3s/rTz6aJamtLyP1GxQPikfNkNS9SM
 ZYHz22CQEli3f49+wKBkfsqw+rq8Mr4JiJnGIlVk4WpDWOTiYRah2Ee2UzhTVSwTaGrB
 9kESlfNGhX9Ftj1lqa/50V2YZB1j9G+yW3mM4z76kj6XQ6qXvUpwQYMyLt6CIdo90wxF
 DqotAXiqn+0GwrpQ2sDVDk/mU7JQl6Gz/R5BDQsqsG44auF4KGVwnPUjPBMoTv+gvwLB
 qIk5urACLozbukV6Ie6ZJzj2KkGjaLxz3wZKWESRyekK0CdXiCnnGSbe24BUQlLpBpZx
 /nFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8vyoUqibwDOs8wafmaqKhcipgVg2SvTmPtNQRsyxG+EvCPdL78cYHnJrUz2E70QbiBYcpb40Djhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6Dq61fQvDUM5vvMgMEMbyeQLc+ByL3z94qSjj8uXzzYygTrhI
 b7pQGE+F1Yu/l2vNU76TKGVLCxaTD2zGz0XGuYCGHIVFnE/zOyN+vVxs8T3FMq0Vpca5FePjq1s
 uwEdI/h2S4rzJFzK8qc/qY5hZtdlc/pQYjZWw
X-Gm-Gg: ASbGnctYg6HkimsaaFl+xvuHxowQN2Nh3GFmXQObs21b+fndrdyXQdFd9Hpjbu0BxL+
 sx9hNLDQ+te/wEzsOBo3MNG3MCkZCQTW1
X-Google-Smtp-Source: AGHT+IHoLaXHU/MC7f9JrcKdwmvjZvvcb2DYz+wI3wOcXBAKziY+PnJmDUTHkspPcVU08nXYxzgIeNSfxQkXtZFXds8=
X-Received: by 2002:a05:6000:178b:b0:384:3731:d721 with SMTP id
 ffacd0b85a97d-3843731d72emr9802059f8f.19.1732565228775; Mon, 25 Nov 2024
 12:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20241121102725.4195-1-christian.koenig@amd.com>
 <20241121102725.4195-2-christian.koenig@amd.com>
In-Reply-To: <20241121102725.4195-2-christian.koenig@amd.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Mon, 25 Nov 2024 14:06:57 -0600
Message-ID: <CAO6MGtiTXqC0unT-xNZhi74bsQa9oSOy455PtU75LOLWm5fguA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/vmwgfx: start to phase out ttm_exec v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: zack.rusin@broadcom.com, dri-devel@lists.freedesktop.org
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

Tested working.

Tested-by: Ian Forbes <ian.forbes@broadcom.com>

On Thu, Nov 21, 2024 at 4:27=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Start switching over vmwgfx to drm_exec as well. Replacing some
> unnecessary complex calls with just just single BO dma_resv locking.
>
> No intentional functional change, but only compile tested for now.
>
> v2: fix kerneldoc issues
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 53 ++++++++----------------
>  1 file changed, 18 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_resource.c
> index a73af8a355fb..0002b2f9a6c9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -510,14 +510,14 @@ void vmw_resource_unreserve(struct vmw_resource *re=
s,
>   * @res:            The resource for which to allocate a backup buffer.
>   * @interruptible:  Whether any sleeps during allocation should be
>   *                  performed while interruptible.
> - * @val_buf:        On successful return contains data about the
> - *                  reserved and validated backup buffer.
> + * @bo:             On successful return contains the reserved and valid=
ated
> + *                  backup buffer.
>   */
>  static int
>  vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>                           struct vmw_resource *res,
>                           bool interruptible,
> -                         struct ttm_validate_buffer *val_buf)
> +                         struct ttm_buffer_object **bo)
>  {
>         struct ttm_operation_ctx ctx =3D { true, false };
>         struct list_head val_list;
> @@ -532,10 +532,12 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ti=
cket,
>
>         INIT_LIST_HEAD(&val_list);
>         ttm_bo_get(&res->guest_memory_bo->tbo);
> -       val_buf->bo =3D &res->guest_memory_bo->tbo;
> -       val_buf->num_shared =3D 0;
> -       list_add_tail(&val_buf->head, &val_list);
> -       ret =3D ttm_eu_reserve_buffers(ticket, &val_list, interruptible, =
NULL);
> +
> +       *bo =3D &res->guest_memory_bo->tbo;
> +       if (ticket)
> +               ww_acquire_init(ticket, &reservation_ww_class);
> +
> +       ret =3D ttm_bo_reserve(*bo, interruptible, (ticket =3D=3D NULL), =
ticket);
>         if (unlikely(ret !=3D 0))
>                 goto out_no_reserve;
>
> @@ -555,10 +557,11 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ti=
cket,
>         return 0;
>
>  out_no_validate:
> -       ttm_eu_backoff_reservation(ticket, &val_list);
> +       dma_resv_unlock((*bo)->base.resv);
> +       if (ticket)
> +               ww_acquire_fini(ticket);
>  out_no_reserve:
> -       ttm_bo_put(val_buf->bo);
> -       val_buf->bo =3D NULL;
> +       ttm_bo_put(*bo);
>         if (guest_memory_dirty)
>                 vmw_user_bo_unref(&res->guest_memory_bo);
>
> @@ -600,29 +603,6 @@ int vmw_resource_reserve(struct vmw_resource *res, b=
ool interruptible,
>         return 0;
>  }
>
> -/**
> - * vmw_resource_backoff_reservation - Unreserve and unreference a
> - *                                    guest memory buffer
> - *.
> - * @ticket:         The ww acquire ctx used for reservation.
> - * @val_buf:        Guest memory buffer information.
> - */
> -static void
> -vmw_resource_backoff_reservation(struct ww_acquire_ctx *ticket,
> -                                struct ttm_validate_buffer *val_buf)
> -{
> -       struct list_head val_list;
> -
> -       if (likely(val_buf->bo =3D=3D NULL))
> -               return;
> -
> -       INIT_LIST_HEAD(&val_list);
> -       list_add_tail(&val_buf->head, &val_list);
> -       ttm_eu_backoff_reservation(ticket, &val_list);
> -       ttm_bo_put(val_buf->bo);
> -       val_buf->bo =3D NULL;
> -}
> -
>  /**
>   * vmw_resource_do_evict - Evict a resource, and transfer its data
>   *                         to a backup buffer.
> @@ -642,7 +622,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ct=
x *ticket,
>
>         val_buf.bo =3D NULL;
>         val_buf.num_shared =3D 0;
> -       ret =3D vmw_resource_check_buffer(ticket, res, interruptible, &va=
l_buf);
> +       ret =3D vmw_resource_check_buffer(ticket, res, interruptible, &va=
l_buf.bo);
>         if (unlikely(ret !=3D 0))
>                 return ret;
>
> @@ -657,7 +637,10 @@ static int vmw_resource_do_evict(struct ww_acquire_c=
tx *ticket,
>         res->guest_memory_dirty =3D true;
>         res->res_dirty =3D false;
>  out_no_unbind:
> -       vmw_resource_backoff_reservation(ticket, &val_buf);
> +       dma_resv_unlock(val_buf.bo->base.resv);
> +       if (ticket)
> +               ww_acquire_fini(ticket);
> +       ttm_bo_put(val_buf.bo);
>
>         return ret;
>  }
> --
> 2.34.1
>
