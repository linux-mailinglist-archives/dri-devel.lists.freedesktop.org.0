Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C74EBFC3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 13:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D83610E921;
	Wed, 30 Mar 2022 11:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1863910E921
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 11:27:43 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id f3so16549770qvz.10
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 04:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/SsoG+PpKWZDfvPklFn/XSUiKVJSokW9Px0KF4dxFU=;
 b=TV8CO7mCsyY6rTwKULNk8AfGXiRuAD4fGxo59BLPKmCtSfDXZvxW+xYeEpyDsglta9
 VDZnSq8YJ6vq0bYLyG+g2ssJhSCd3a2TnzT3pNGfVekmcxdCqB2NEd89yuYfax/LVui2
 Adc1or8+g5aoNaVN9drL6wS0ov4T2gSddo4xlKagieGhP3WmFuBWv6PRrXJovbfh85q/
 C0HiIbZ13bM+1ya302EspQp/kTo3KNkATsar+r/gTtohvx+Oe7tBp1Tq+gd+whdrgqR4
 BHS8PR2/zSPrc6uir7hjx+KqchfemvvnGYQ1iI0zhxU9vGpVH2jFrsKPvokr1Hmq3suT
 P+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/SsoG+PpKWZDfvPklFn/XSUiKVJSokW9Px0KF4dxFU=;
 b=ryo4zSmdS2bgvXpm4rBtF6TWw8FQ4n/+kaAEn0r4MYNjtPF77aO0hUfN6Z3WaBI37w
 OdiMuKmwDZF87zw6GE1SlBMujEfm1+TTpf2aRjyJPQOj1svGX5tz2HiwTZTYwpfnhVku
 ppNhsQZsvYM9LByXCiibWTQBwLr8aUvVAlKhrselQcaOnqaMTWnSnLyN/U4yLDY/E6Qn
 0YDkZYvtOkIhO9byufqu4iBJG5q5Ffy/tmILzEgzMPJpQVoVQA2bwA06WfYySZh64X86
 mKQ7tnJTFIAvLc98OJJVAZtV+CdnsRJ/6eZxmofzFqCJobWzjOkKWWY5BN5kTPl3Dx/E
 u9lg==
X-Gm-Message-State: AOAM533YDoKs2Rnm2kHSvrVLQzMZmYwKYgAWIPtKmEictnPbZB357cKK
 hdzmw76F8sxC2zzWmlHth1iznAJdqYNMghmjQo1xCg==
X-Google-Smtp-Source: ABdhPJzTEEZV6fvobIkqTMfmaHzhQtUGKCaL+0AzoovinKm6qsrtL+/TFRCKNZBGyqYJ8Lv2uyCxtK2GjxqQhWDJ+qQ=
X-Received: by 2002:a05:6214:27ec:b0:443:9153:23d0 with SMTP id
 jt12-20020a05621427ec00b00443915323d0mr720525qvb.122.1648639662175; Wed, 30
 Mar 2022 04:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220329230105.601666-1-robdclark@gmail.com>
 <20220329230105.601666-6-robdclark@gmail.com>
In-Reply-To: <20220329230105.601666-6-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Mar 2022 14:27:31 +0300
Message-ID: <CAA8EJprKZip_3W6OJZoFs2Zewtp4hqWyADfqG8ZPXcD8FCgXbQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/msm: Drop msm_gem_iova()
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022 at 02:00, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> There was only a single user, which could just as easily stash the iova
> when pinning.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_fb.c  | 16 ++++++++++------
>  drivers/gpu/drm/msm/msm_gem.c | 16 ----------------
>  drivers/gpu/drm/msm/msm_gem.h |  2 --
>  3 files changed, 10 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 7137492fe78e..d4eef66e29dc 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -21,6 +21,9 @@ struct msm_framebuffer {
>
>         /* Count of # of attached planes which need dirtyfb: */
>         refcount_t dirtyfb;
> +
> +       /* Framebuffer per-plane address, if pinned, else zero: */
> +       uint64_t iova[DRM_FORMAT_MAX_PLANES];
>  };
>  #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, base)
>
> @@ -76,14 +79,14 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
>  {
>         struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
>         int ret, i, n = fb->format->num_planes;
> -       uint64_t iova;
>
>         if (needs_dirtyfb)
>                 refcount_inc(&msm_fb->dirtyfb);
>
>         for (i = 0; i < n; i++) {
> -               ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &iova);
> -               drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)", fb->base.id, i, iova, ret);
> +               ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &msm_fb->iova[i]);
> +               drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)",
> +                             fb->base.id, i, msm_fb->iova[i], ret);
>                 if (ret)
>                         return ret;
>         }
> @@ -103,14 +106,15 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
>
>         for (i = 0; i < n; i++)
>                 msm_gem_unpin_iova(fb->obj[i], aspace);
> +
> +       memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
>  }
>
>  uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
>                 struct msm_gem_address_space *aspace, int plane)
>  {
> -       if (!fb->obj[plane])
> -               return 0;
> -       return msm_gem_iova(fb->obj[plane], aspace) + fb->offsets[plane];
> +       struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
> +       return msm_fb->iova[plane];
>  }
>
>  struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane)
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index f4b68bb28a4d..deafae6feaa8 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -509,22 +509,6 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
>         return ret;
>  }
>
> -/* get iova without taking a reference, used in places where you have
> - * already done a 'msm_gem_get_and_pin_iova' or 'msm_gem_get_iova'
> - */
> -uint64_t msm_gem_iova(struct drm_gem_object *obj,
> -               struct msm_gem_address_space *aspace)
> -{
> -       struct msm_gem_vma *vma;
> -
> -       msm_gem_lock(obj);
> -       vma = lookup_vma(obj, aspace);
> -       msm_gem_unlock(obj);
> -       GEM_WARN_ON(!vma);
> -
> -       return vma ? vma->iova : 0;
> -}
> -
>  /*
>   * Locked variant of msm_gem_unpin_iova()
>   */
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 090c3b1a6d9a..772de010a669 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -142,8 +142,6 @@ int msm_gem_get_and_pin_iova_locked(struct drm_gem_object *obj,
>                 struct msm_gem_address_space *aspace, uint64_t *iova);
>  int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
>                 struct msm_gem_address_space *aspace, uint64_t *iova);
> -uint64_t msm_gem_iova(struct drm_gem_object *obj,
> -               struct msm_gem_address_space *aspace);
>  void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
>                 struct msm_gem_address_space *aspace);
>  void msm_gem_unpin_iova(struct drm_gem_object *obj,
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
