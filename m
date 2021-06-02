Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A2399481
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1F788052;
	Wed,  2 Jun 2021 20:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C59888052
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 20:25:41 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id b9so5581099ybg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 13:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eW3GbaWpHHbXX63BT/lsF34YWPOMtt86kgVcmcguuQU=;
 b=JgsA6yTUpGkaZZDMIuR2SRzVhhRNp/grcaRDNh1kiubmhYcfcfOkQkeSm+V3uGAHRp
 ts2v/gxBjMwvBWvU9LuSRiqpJj7Z/dWO5DVoVG1/lb09+M4I9Bi8Z4GkBgEcvUIlMP/F
 patT+wu9HFlKiPJF4ROhtVb2iBJSBZ78m8yt+nDTMzR/37SeHIy0GwjghjEW1tIV/hzj
 /W25k+1evQLcH3XLfAK9ogW19JM8Sas7yMHLrurGP0/C5v4rcCfB68zxGW2HTmds110O
 usoLyGUACCcgR+Y3dNSdYc/V/jJROIFMcCrL4atRidFDGkEMA6XAQcehnQg9C5pZ0z8q
 6kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eW3GbaWpHHbXX63BT/lsF34YWPOMtt86kgVcmcguuQU=;
 b=sSQXU90X8QnmOTtH1BOR1Af3fjT6LaWOWOwGBDp5PeeY5sxGVQZ0T04eYPhDy5OAjn
 L6V0oyUTY+n4F6o+IlG0vfoYf2WS4bXG8v5EhNan2nEP0BSYrGi2+np15hFWICPhR6DE
 m7PrL9G8VhgVv/yTE+XmgHfcVyCakUUA96db4y+Ek7PGNgG+mFAd9k/uK8hRbUfT88Ub
 /8DopWY4+B6v7HEfIVQVLadOObtp7PC2EimBaj96Yy2zdUmcyxGjmbEeVMLxlbf4kk1z
 x66g8SA9kzpVaJ81ud0XrTA1dRh1V5MGFQpJRtA+Eov2k1VHVehesbqt2lr2vmrrbtnv
 O6XQ==
X-Gm-Message-State: AOAM530/+h1juHjR9g9hsxJVVUXyBXuQ7DfRVostmow8E9uAEVPjhPT9
 3XdwERIF1MQjz4h1+f0HwSD64mUlBNbvkTKgVd4aIA==
X-Google-Smtp-Source: ABdhPJzhWHJ25cStXnmegSMHO/GJwGpKPCuP4WMtclFrQOna0DL6MhloHbB8oIfIybvzxr+HrYIQO/cTuKu0x3/ggfE=
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr48682909ybo.139.1622665540371; 
 Wed, 02 Jun 2021 13:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <20210602111714.212426-6-christian.koenig@amd.com>
In-Reply-To: <20210602111714.212426-6-christian.koenig@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 2 Jun 2021 15:25:28 -0500
Message-ID: <CAOFGe97pkzUggnc6+9GV54YevbHhgvMbDpLf90Osa+x8ctNwdQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] dma-buf: rename dma_resv_get_excl_rcu to _unlocked
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

On Wed, Jun 2, 2021 at 6:17 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> That describes much better what the function is doing here.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_gem.c                    | 2 +-
>  drivers/gpu/drm/drm_gem_atomic_helper.c      | 2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_display.c | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h   | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c     | 4 ++--
>  drivers/gpu/drm/i915/i915_request.c          | 2 +-
>  drivers/gpu/drm/i915/i915_sw_fence.c         | 2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c      | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c      | 2 +-
>  include/linux/dma-resv.h                     | 4 ++--
>  11 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 9989425e9875..263b4fb03303 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1375,7 +1375,7 @@ int drm_gem_fence_array_add_implicit(struct xarray =
*fence_array,
>
>         if (!write) {
>                 struct dma_fence *fence =3D
> -                       dma_resv_get_excl_rcu(obj->resv);
> +                       dma_resv_get_excl_unlocked(obj->resv);
>
>                 return drm_gem_fence_array_add(fence_array, fence);
>         }
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/dr=
m_gem_atomic_helper.c
> index a005c5a0ba46..a27135084ae5 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -147,7 +147,7 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane =
*plane, struct drm_plane_st
>                 return 0;
>
>         obj =3D drm_gem_fb_get_obj(state->fb, 0);
> -       fence =3D dma_resv_get_excl_rcu(obj->resv);
> +       fence =3D dma_resv_get_excl_unlocked(obj->resv);
>         drm_atomic_set_fence_for_plane(state, fence);
>
>         return 0;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/d=
rm/etnaviv/etnaviv_gem_submit.c
> index d05c35994579..c942d2a8c252 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -195,7 +195,7 @@ static int submit_fence_sync(struct etnaviv_gem_submi=
t *submit)
>                         if (ret)
>                                 return ret;
>                 } else {
> -                       bo->excl =3D dma_resv_get_excl_rcu(robj);
> +                       bo->excl =3D dma_resv_get_excl_unlocked(robj);
>                 }
>
>         }
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 384ff0bb6e19..f17c5f54feb6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -11040,7 +11040,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>                 if (ret < 0)
>                         goto unpin_fb;
>
> -               fence =3D dma_resv_get_excl_rcu(obj->base.resv);
> +               fence =3D dma_resv_get_excl_unlocked(obj->base.resv);
>                 if (fence) {
>                         add_rps_boost_after_vblank(new_plane_state->hw.cr=
tc,
>                                                    fence);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index 2ebd79537aea..7c0eb425cb3b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -500,7 +500,7 @@ i915_gem_object_last_write_engine(struct drm_i915_gem=
_object *obj)
>         struct dma_fence *fence;
>
>         rcu_read_lock();
> -       fence =3D dma_resv_get_excl_rcu(obj->base.resv);
> +       fence =3D dma_resv_get_excl_unlocked(obj->base.resv);
>         rcu_read_unlock();
>
>         if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(f=
ence))
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i=
915/gem/i915_gem_wait.c
> index 4b9856d5ba14..c13aeddf5aa7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -73,7 +73,7 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>                  */
>                 prune_fences =3D count && timeout >=3D 0;
>         } else {
> -               excl =3D dma_resv_get_excl_rcu(resv);
> +               excl =3D dma_resv_get_excl_unlocked(resv);
>         }
>
>         if (excl && timeout >=3D 0)
> @@ -170,7 +170,7 @@ i915_gem_object_wait_priority(struct drm_i915_gem_obj=
ect *obj,
>
>                 kfree(shared);
>         } else {
> -               excl =3D dma_resv_get_excl_rcu(obj->base.resv);
> +               excl =3D dma_resv_get_excl_unlocked(obj->base.resv);
>         }
>
>         if (excl) {
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i=
915_request.c
> index bec9c3652188..c85494f411f4 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1611,7 +1611,7 @@ i915_request_await_object(struct i915_request *to,
>                         dma_fence_put(shared[i]);
>                 kfree(shared);
>         } else {
> -               excl =3D dma_resv_get_excl_rcu(obj->base.resv);
> +               excl =3D dma_resv_get_excl_unlocked(obj->base.resv);
>         }
>
>         if (excl) {
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/=
i915_sw_fence.c
> index 2744558f3050..7aaf74552d06 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -606,7 +606,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fe=
nce *fence,
>                         dma_fence_put(shared[i]);
>                 kfree(shared);
>         } else {
> -               excl =3D dma_resv_get_excl_rcu(resv);
> +               excl =3D dma_resv_get_excl_unlocked(resv);
>         }
>
>         if (ret >=3D 0 && excl && excl->ops !=3D exclude) {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/no=
uveau/dispnv50/wndw.c
> index 0cb1f9d848d3..8d048bacd6f0 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -561,7 +561,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct =
drm_plane_state *state)
>                         asyw->image.handle[0] =3D ctxdma->object.handle;
>         }
>
> -       asyw->state.fence =3D dma_resv_get_excl_rcu(nvbo->bo.base.resv);
> +       asyw->state.fence =3D dma_resv_get_excl_unlocked(nvbo->bo.base.re=
sv);
>         asyw->image.offset[0] =3D nvbo->offset;
>
>         if (wndw->func->prepare) {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 6003cfeb1322..2df3e999a38d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -203,7 +203,7 @@ static void panfrost_acquire_object_fences(struct drm=
_gem_object **bos,
>         int i;
>
>         for (i =3D 0; i < bo_count; i++)
> -               implicit_fences[i] =3D dma_resv_get_excl_rcu(bos[i]->resv=
);
> +               implicit_fences[i] =3D dma_resv_get_excl_unlocked(bos[i]-=
>resv);
>  }
>
>  static void panfrost_attach_object_fences(struct drm_gem_object **bos,
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 98ac66fecb71..f6b71712c029 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -228,7 +228,7 @@ dma_resv_exclusive(struct dma_resv *obj)
>  }
>
>  /**
> - * dma_resv_get_excl_rcu - get the reservation object's
> + * dma_resv_get_excl_unlocked - get the reservation object's
>   * exclusive fence, without lock held.
>   * @obj: the reservation object
>   *
> @@ -239,7 +239,7 @@ dma_resv_exclusive(struct dma_resv *obj)
>   * The exclusive fence or NULL if none
>   */
>  static inline struct dma_fence *
> -dma_resv_get_excl_rcu(struct dma_resv *obj)
> +dma_resv_get_excl_unlocked(struct dma_resv *obj)
>  {
>         struct dma_fence *fence;
>
> --
> 2.25.1
>
