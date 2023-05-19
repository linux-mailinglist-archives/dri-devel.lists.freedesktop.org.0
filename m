Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E7709297
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 11:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B9B10E074;
	Fri, 19 May 2023 09:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D3B10E074
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 09:05:57 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ac831bb762so33178301fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 02:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684487155; x=1687079155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4EShdavVLhwyU2+xZNOvJue2VsC5DbDMbZ5No7l4ZXI=;
 b=PQ46NoDY+kzZoaAkSCpEyL8zERrXYqQD0jVZ54K/9TXchlmqCKY2LZiTb3AiB1RyQk
 Y6Wr0foUQGf2hK9VjWFd0GuXY7dagkoV5+WTrqFpuSMwhngJ5olwUdhdW/8IWw6vTN63
 80aCjCMAUPNRZ/YLLYUZJWYfJThK2DPxXSO6Na6FIJiHOK+KP0pKOkeJZtjBZvtjIjXs
 cjnR6oUUW5/o5giyn09DmfIRh40/Y0Yg3HBv+fLi8NmPcFlpgl+0bTtMwMAVL/M+/K49
 ymR3JDxuNa9Q8bEZcoRJ+sEkl6T5Q7nsvJZ8rMgy2QLS6Q3ziYtZ1F2UPtsIyqYt6AqC
 gzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684487155; x=1687079155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4EShdavVLhwyU2+xZNOvJue2VsC5DbDMbZ5No7l4ZXI=;
 b=J/WB2Ph9+q251SFewpBRIjKFXWB7fPixHRcPXL1IAcav5g/QTrtLUhB634F2MDjULb
 U33544OA1O8V3j+YVOTVHM2KNWKzTMyYJfOOTRprl2PWejgN0epQklzHotsPkQtPsKNS
 DedjNQqTPer3ijTfCNJ7yvkwyYHknRFa2RH8BzxDwLL0d6y2tRHllc07/m5xCWVTmJM2
 aV+vBPnXYkY/VnUH+8lUz1w5cPKlUFfpLSYJT2SUrX8bx5n8XsbjDn3KtLKtMboiRV3T
 av+cLm4jbXTRfTAEEsu0nOdr6rN8INobjpogeWnutc9ENKicUt1BLY+b/bb7j2t1tb02
 4YIQ==
X-Gm-Message-State: AC+VfDwrNBVfYBJsqzv+qeT+k4wSBP6H9rAntdDZiWejPVzJGFTRB8hp
 zJ6Vl4MLcSyUt2gibH1/mDdBdj+rBq8cLUaDCp2y1qyhg9douw==
X-Google-Smtp-Source: ACHHUZ5MYqJcLSdBP/PJDqXTqv668XzPQdaNCwPmUAtt5gfp8VdJA/OAbT4boE2memv4QzC+ZqC4WoQl6deeMTTY8P4=
X-Received: by 2002:a19:ae1a:0:b0:4e9:cfd2:e2d with SMTP id
 f26-20020a19ae1a000000b004e9cfd20e2dmr615483lfc.65.1684487154826; Fri, 19 May
 2023 02:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230519085525.1275339-1-boris.brezillon@collabora.com>
In-Reply-To: <20230519085525.1275339-1-boris.brezillon@collabora.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 19 May 2023 10:05:27 +0100
Message-ID: <CAM0jSHNhH77Q99Xmprz-=U9J0Oi3L=W8g99dABZ3Cxb7LO21cw@mail.gmail.com>
Subject: Re: [PATCH] drm/managed: Define drmm_mutex_init() as a macro to fix
 lockdep
To: Boris Brezillon <boris.brezillon@collabora.com>
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 May 2023 at 09:55, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> drmm_mutex_init() needs to be defined as a macro if we want
> lockdep to classify locks properly. If we don't do that, all locks
> will be considered as belonging to the same lock class, leading to
> false positive deadlock reports.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reported-by: Sarah Walker <sarah.walker@imgtec.com>

Yeah, we also encountered the same issue. Patch is here:
https://patchwork.freedesktop.org/patch/537605/?series=117891&rev=2

> ---
>  drivers/gpu/drm/drm_managed.c | 26 --------------------------
>  include/drm/drm_managed.h     | 30 +++++++++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 4cf214de50c4..71c49819a7a2 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -263,29 +263,3 @@ void drmm_kfree(struct drm_device *dev, void *data)
>         free_dr(dr_match);
>  }
>  EXPORT_SYMBOL(drmm_kfree);
> -
> -static void drmm_mutex_release(struct drm_device *dev, void *res)
> -{
> -       struct mutex *lock = res;
> -
> -       mutex_destroy(lock);
> -}
> -
> -/**
> - * drmm_mutex_init - &drm_device-managed mutex_init()
> - * @dev: DRM device
> - * @lock: lock to be initialized
> - *
> - * Returns:
> - * 0 on success, or a negative errno code otherwise.
> - *
> - * This is a &drm_device-managed version of mutex_init(). The initialized
> - * lock is automatically destroyed on the final drm_dev_put().
> - */
> -int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
> -{
> -       mutex_init(lock);
> -
> -       return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
> -}
> -EXPORT_SYMBOL(drmm_mutex_init);
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 359883942612..87ffb92a16ba 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -105,6 +105,34 @@ char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
>
>  void drmm_kfree(struct drm_device *dev, void *data);
>
> -int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
> +/* Private function, don't use. */
> +static inline void __drmm_mutex_release(struct drm_device *dev, void *res)
> +{
> +       struct mutex *lock = res;
> +
> +       mutex_destroy(lock);
> +}
> +
> +/**
> + * drmm_mutex_init - &drm_device-managed mutex_init()
> + * @dev: DRM device
> + * @lock: lock to be initialized
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + *
> + * This is a &drm_device-managed version of mutex_init(). The initialized
> + * lock is automatically destroyed on the final drm_dev_put().
> + *
> + * This needs to be defined as a macro to let lockdep classify locks
> + * properly. If we don't do that, all locks will be considered as
> + * belonging to the same lock class, leading to false positive lockdep
> + * reports.
> + */
> +#define drmm_mutex_init(dev, lock) \
> +       ({\
> +               mutex_init(lock); \
> +               drmm_add_action_or_reset(dev, __drmm_mutex_release, lock); \
> +       })
>
>  #endif
> --
> 2.40.1
>
