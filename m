Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E9F7EC6B7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FE410E042;
	Wed, 15 Nov 2023 15:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DEF10E04E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:07:54 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5a8ee23f043so78543547b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700060873; x=1700665673; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dAkdFR38VbZr+retwYJvC4pXK2CLkuRAU6TUrfj2Y/Q=;
 b=QtdEUW+7LaRVSIs/saImZWMFPiJzz8wmnkhRECRc2n3NRwzJZq4fyqIUffTBOYMdQ5
 2X6q/mWh05SMWbTaKMVFWSD/yY/PJaeA02Yfm5j0RRGl0mWQTsgfZfr3wTEvX6sSCd9E
 2Cj1b4LdjiJHmTKi7xcvDnqhHURZqFKj6j2B99CDPRcGSUrVMoHTm3s3reddnCT6/aRs
 qHJXq9f3pO+iXtyFPjh69zYN659aiJnDsksKjArEzffLxQ2fCnQVO/wZzglUXMqGenkc
 i4DBAwhw8HLiebWbePLBHVFMCX9MuUKtVZpc3/mgvAAx322j1gybqrI0cVnqpRsDpraT
 6Sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700060873; x=1700665673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dAkdFR38VbZr+retwYJvC4pXK2CLkuRAU6TUrfj2Y/Q=;
 b=mH0qWm6oE1+R4Bakx5TXz42/OR7PStlyi+AQKfjbhJsm3dZvvbgKDb41PaQPvdcIM6
 eD2ry5plgmKVcHZe5QUlzPqeDia/BU7yTktNgIkx8KuK/cYig84Yg7TUUUSm1MOLKUv/
 L5nvf0E0E7R13f+VEqPi0MSUt2aCQ6O7C80Jm69LvAb6H9StBD2hFAtssCi1Pyp1KtLo
 9qfX+qQjSow6n0hyjBGC/GZg4NyKaeMJJwxhz5UIsR2lCCoErlwmuJzJbGD1dZjqKKoE
 PI+2YmCkW9YOSI50d3V5z2QxFf0FvEM6JESF908Yh6CA+rw0r8JrKbL1zFNQ58RbDIwg
 8NRw==
X-Gm-Message-State: AOJu0YzRm19e07pOADTQ9IKjyO7DHybFk/ED3CB9/clVwxL6Hsw/D4hd
 g9urz975/17PV6lSpEMorATub1KULwbhqmIwcS/4kQ==
X-Google-Smtp-Source: AGHT+IFWMAAPr69IJZOrpc5SNuEM+oacpGbG5vuVdTWdzsr6zLBxZ1vBt7gGnTY8n6wgmwhM4whO4LzzuHfj/jYhdaU=
X-Received: by 2002:a0d:cb0f:0:b0:5a7:dbd1:4889 with SMTP id
 n15-20020a0dcb0f000000b005a7dbd14889mr15802748ywd.2.1700060873202; Wed, 15
 Nov 2023 07:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20231115141928.429688-1-dipamt1729@gmail.com>
In-Reply-To: <20231115141928.429688-1-dipamt1729@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 17:07:41 +0200
Message-ID: <CAA8EJprqnUGQxmj4Y=qttVuj0zJxdD9B6neHa6sPseLLETpk5A@mail.gmail.com>
Subject: Re: [PATCH v2] Remove custom dumb_map_offset implementation in msm
 driver
To: Dipam Turkar <dipamt1729@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 16:30, Dipam Turkar <dipamt1729@gmail.com> wrote:
>
> Make msm use drm_gem_create_map_offset() instead of its custom
> implementation for associating GEM object with a fake offset. Since,
> we already have this generic implementation, we don't need the custom
> implementation and it is better to standardize the code for GEM based
> drivers. This also removes the outdated locking leftovers.

Why are they outdated?

>
> Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
>  drivers/gpu/drm/msm/msm_gem.h |  2 --
>  3 files changed, 1 insertion(+), 24 deletions(-)
>
> Changes in v2:
> Modify commit message to include the absence of internal locking leftovers
> around allocating a fake offset in msm_gem_mmap_offset() in the generic
> implementation drm_gem_create_map_offset().
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index a428951ee539..86a15992c717 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver = {
>         .open               = msm_open,
>         .postclose          = msm_postclose,
>         .dumb_create        = msm_gem_dumb_create,
> -       .dumb_map_offset    = msm_gem_dumb_map_offset,
> +       .dumb_map_offset    = drm_gem_dumb_map_offset,
>         .gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init       = msm_debugfs_init,
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index db1e748daa75..489694ef79cb 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>                         MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "dumb");
>  }
>
> -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
> -               uint32_t handle, uint64_t *offset)
> -{
> -       struct drm_gem_object *obj;
> -       int ret = 0;
> -
> -       /* GEM does all our handle to object mapping */
> -       obj = drm_gem_object_lookup(file, handle);
> -       if (obj == NULL) {
> -               ret = -ENOENT;
> -               goto fail;
> -       }
> -
> -       *offset = msm_gem_mmap_offset(obj);
> -
> -       drm_gem_object_put(obj);
> -
> -fail:
> -       return ret;
> -}
> -
>  static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
>  {
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 8ddef5443140..dc74a0ef865d 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
>  void msm_gem_unpin_pages(struct drm_gem_object *obj);
>  int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>                 struct drm_mode_create_dumb *args);
> -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
> -               uint32_t handle, uint64_t *offset);
>  void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
>  void *msm_gem_get_vaddr(struct drm_gem_object *obj);
>  void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
