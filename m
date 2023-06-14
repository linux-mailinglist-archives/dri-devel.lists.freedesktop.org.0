Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67656730772
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 20:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4E410E16E;
	Wed, 14 Jun 2023 18:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F05010E168;
 Wed, 14 Jun 2023 18:41:40 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1a83bfe7ca0so707868fac.0; 
 Wed, 14 Jun 2023 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686768099; x=1689360099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dJTuWd6k2SUwWGtL9y64glk2t+q5Pii5q07Eneq0CoY=;
 b=ooXtKLYLTvpzvS6VRiOVvnARhq8diHOCIMfXiIMYIXD1Dw9sGTV0E8HGBiXbCDcmfz
 fAmAC62YWEuuK3KeihekJWiFYS8g+GTNDwr7h+gZ9AQqJSeXn9P2BQPjjhKwcWl403UZ
 xpvDTQiWBKMTWResKKj3lrX8M5mRmBx9mNzYGDP7Pf1QZeaVBZsPs73KSRL2q8RaM/eT
 CH/URFwFqccW8cMaaKV1ZmEHPyVeWEiCIEmMqUzEgA4YX2jZ8ydniNfWDhMfr8BNhmrB
 YMZ7xu1HSc9Gfhy4tWsigOToM0BDtYtSU56zqZ8kI9shyA/UPW5eKe42WrOK0eZks6tD
 oiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686768099; x=1689360099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dJTuWd6k2SUwWGtL9y64glk2t+q5Pii5q07Eneq0CoY=;
 b=cwhXiiQ3gkXSKVMPNHnOpsGmN1+SXuBr/1cFglEs/1uIWZsdmn4QnUvTmHGKIsljwh
 CB41qsmSeJK2fcD3qTJYKp1HVtoCGckH3lBdUfnL/d7NUicFDmzfZPmwD1Spg4JS3G8A
 jKE2naziNsvSrHeh3/y7TbFNdhbIo1AtDSemgaNwesZEX57ur7t4Drt6Htvj8CuVW33x
 K1II/d6gN0rIOXk9dphKUtIwNSP6oUymUuhew6RA1Jsiw9W2HT0DXD3J9bYo7UShzWiP
 atYVf5jzvviuiiF/+0b5i+NWqo7vTpDzyXzOJ5z2BGMFKLYdbWfrCK4cOo9xE7U2mIl6
 2U6w==
X-Gm-Message-State: AC+VfDwEA8+xf4S9Vhm7gH4d+OQdrLgqo0PSEfF1j9L7Ni6ORvs0Ezv2
 lMw6qXFOn7bkSJcnD7hIAB1IkDfIwqGpcfRnhJU=
X-Google-Smtp-Source: ACHHUZ6pN2pwuUdCDFby5TeiwuTQdqQVsIBGheSrc4wB0w+Ky3LcDbPqZpPj2AWMU/umREMxf4dPJn+rBZAnrS71MA8=
X-Received: by 2002:a05:6871:3d6:b0:184:818b:8a28 with SMTP id
 a22-20020a05687103d600b00184818b8a28mr9536129oag.34.1686768099148; Wed, 14
 Jun 2023 11:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
 <20230607130223.3533464-3-l.stach@pengutronix.de>
In-Reply-To: <20230607130223.3533464-3-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 14 Jun 2023 20:41:27 +0200
Message-ID: <CAH9NwWfj0CKm3Q_bVjWi7PhhWfxQxeGfu1mo9bWdSe7xXrRW_w@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/etnaviv: move runtime PM handling to events
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

>
> Conceptually events are the right abstraction to handle the GPU
> runtime PM state: as long as any event is pending the GPU can not
> be idle. Events are also properly freed and reallocated when the
> GPU has been reset after a hang.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 -
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 27 ++++++++++++--------
>  3 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> index baa81cbf701a..a42d260cac2c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -97,7 +97,6 @@ struct etnaviv_gem_submit {
>         struct list_head node; /* GPU active submit list */
>         struct etnaviv_cmdbuf cmdbuf;
>         struct pid *pid;       /* submitting process */
> -       bool runtime_resumed;
>         u32 exec_state;
>         u32 flags;
>         unsigned int nr_pmrs;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 45403ea38906..2416c526f9b0 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -362,9 +362,6 @@ static void submit_cleanup(struct kref *kref)
>                         container_of(kref, struct etnaviv_gem_submit, refcount);
>         unsigned i;
>
> -       if (submit->runtime_resumed)
> -               pm_runtime_put_autosuspend(submit->gpu->dev);
> -
>         if (submit->cmdbuf.suballoc)
>                 etnaviv_cmdbuf_free(&submit->cmdbuf);
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 4e18aa8566c6..54a1249c5bca 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1139,7 +1139,8 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
>         unsigned int *events)
>  {
>         unsigned long timeout = msecs_to_jiffies(10 * 10000);
> -       unsigned i, acquired = 0;
> +       unsigned i, acquired = 0, rpm_count = 0;

rpm is the short form of runtime power management?

> +       int ret;
>
>         for (i = 0; i < nr_events; i++) {
>                 unsigned long ret;
> @@ -1148,6 +1149,7 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
>
>                 if (!ret) {
>                         dev_err(gpu->dev, "wait_for_completion_timeout failed");
> +                       ret = -EBUSY;
>                         goto out;
>                 }
>
> @@ -1167,13 +1169,23 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
>
>         spin_unlock(&gpu->event_spinlock);
>
> +       for (i = 0; i < nr_events; i++) {
> +               ret = pm_runtime_resume_and_get(gpu->dev);
> +               if (ret)
> +                       goto out_rpm;
> +               rpm_count++;
> +       }
> +
>         return 0;
>
> +out_rpm:
> +       for (i = 0; i < rpm_count; i++)
> +               pm_runtime_put_autosuspend(gpu->dev);
>  out:
>         for (i = 0; i < acquired; i++)
>                 complete(&gpu->event_free);
>
> -       return -EBUSY;
> +       return ret;
>  }
>
>  static void event_free(struct etnaviv_gpu *gpu, unsigned int event)
> @@ -1185,6 +1197,8 @@ static void event_free(struct etnaviv_gpu *gpu, unsigned int event)
>                 clear_bit(event, gpu->event_bitmap);
>                 complete(&gpu->event_free);
>         }
> +
> +       pm_runtime_put_autosuspend(gpu->dev);
>  }
>
>  /*
> @@ -1327,15 +1341,6 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
>         unsigned int i, nr_events = 1, event[3];
>         int ret;
>
> -       if (!submit->runtime_resumed) {
> -               ret = pm_runtime_get_sync(gpu->dev);
> -               if (ret < 0) {
> -                       pm_runtime_put_noidle(gpu->dev);
> -                       return NULL;
> -               }
> -               submit->runtime_resumed = true;
> -       }
> -
>         /*
>          * if there are performance monitor requests we need to have
>          * - a sync point to re-configure gpu and process ETNA_PM_PROCESS_PRE
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
