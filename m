Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3AC9299BC
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 22:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B76710E1A4;
	Sun,  7 Jul 2024 20:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RAYW0O7/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EAA10E1A0;
 Sun,  7 Jul 2024 20:42:32 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3c9cc681ee4so1923386b6e.0; 
 Sun, 07 Jul 2024 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720384952; x=1720989752; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HFAsUiIeW1r3iO6Uv8t19LcsrMlkLwCA+nJYBBtAQng=;
 b=RAYW0O7/u7laupFvwW/23wRv+xqnfsrOhbUZ62Uu84tJYYfXw0HnBfA/9ciKX5rsJD
 tUnw+rGphMsb/qWWSMhvFQynpNCSdK82lgL4V8/xHFbZ3a7Ned+v8tAmydyhbSbpzJTS
 wmB+W3EdEBWlNem+sSkQP/xea5f7YgLJHeG+8C1q8HDh4QJMQY536ZL/rxBAQYgOoPVT
 M6b7c6D0wxKzzfumP8SuFNMsrVXgfAgxiW4WcU/o6Op46AOh9uPu+LERtpxmTEJ6mFWM
 irKcxOoglnemEfgOgQPAwkiH/b1o398L3AJ9Zcd5C1k+cFjmJKlfP9/FpYFrGokVhYlh
 IbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720384952; x=1720989752;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HFAsUiIeW1r3iO6Uv8t19LcsrMlkLwCA+nJYBBtAQng=;
 b=vM2bOJcUhrzRaKGenvr9pB3dje7oM3f2X1SprYIJaLbD9AM+86OoHc9rfzPG6DPzJN
 2a+xlKFJLeYk4uETtd0GKZ4gfOYD7eZ2Z7xqEE8U4SO5G2OrX35NEgSDSijJxk0nCKH6
 mCMFHzwdZbW3StwRuyQj24j1YTdNT3N7mnd1VsUigs1xJAjOOUPp+8ktZrTeQWx8QYDH
 XfAWDlZwJa+7eALKDrH6DIfF1+w8XkLfwt5dTS/GgYoUWFjeN7SmaF7ZTH63xxSsj0eJ
 GpoIRKc0E8UUEkOhapITOj405Ohgn+b5f9ip2ZPNOhD3z0SlMWFIYZ1C21YMCopMaG8j
 Kyxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1HBIxLsqfoITh3MLN61HtJUDbuiY8a1Rre8rEgoZXM+X91gsIFhpv/4KzEQj/QT/PWgtX9IM47jiVVEh1l6VUiHNbuUZThuNGg0LV4/Z8
X-Gm-Message-State: AOJu0Yz7k3hGtxgOgLJ3Dy6zrsk9VL33nBRgsguqzBlsVAPxOQ1PKhYm
 AoTpmbIWHLdrxSRfhlz4OE1pfMTk7p//rNkpOWX3QqDB72eadxE1Rt7kUPdcnUzoZJG/2gl9w1U
 pF5MAY3pIOVzbDRFK2qGd2WrGVQM=
X-Google-Smtp-Source: AGHT+IEYqFdsRWzOKAUHkbwBp5Nz63GFFfVqYboeJ43qZhlQZQhcbZxKxCax1i+FN96NwT2L55JIXs0UP7ACoxTjda4=
X-Received: by 2002:a05:6808:2195:b0:3d6:2eb1:8c4f with SMTP id
 5614622812f47-3d914eabe3fmr13922387b6e.53.1720384951923; Sun, 07 Jul 2024
 13:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240705200013.2656275-1-l.stach@pengutronix.de>
 <20240705200013.2656275-5-l.stach@pengutronix.de>
In-Reply-To: <20240705200013.2656275-5-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 7 Jul 2024 22:42:20 +0200
Message-ID: <CAH9NwWd1JzThTFJqJOaG4Jknp95w+Oy0EPZSbnw+1yK1ZnLR8g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/etnaviv: take current primitive into account
 when checking for hung GPU
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> Large draws can make the GPU appear to be stuck to the current hangcheck
> logic as the FE address will not move until the draw is finished. However,
> the FE has a debug register, which records the current primitive ID within
> a draw. Using this debug register we can extend the timeout as long as the
> draw progresses.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
> v2:
> - dropped debug register enable/disable
> - locked against concurrent debug register access
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h   |  1 +
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c | 17 +++++++++++++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 31322195b9e4..4d8a7d48ade3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -144,6 +144,7 @@ struct etnaviv_gpu {
>
>         /* hang detection */
>         u32 hangcheck_dma_addr;
> +       u32 hangcheck_primid;
>         u32 hangcheck_fence;
>
>         void __iomem *mmio;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 62dcfdc7894d..01f927430bc6 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -11,6 +11,7 @@
>  #include "etnaviv_gpu.h"
>  #include "etnaviv_sched.h"
>  #include "state.xml.h"
> +#include "state_hi.xml.h"
>
>  static int etnaviv_job_hang_limit = 0;
>  module_param_named(job_hang_limit, etnaviv_job_hang_limit, int , 0444);
> @@ -35,7 +36,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
>  {
>         struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
>         struct etnaviv_gpu *gpu = submit->gpu;
> -       u32 dma_addr;
> +       u32 dma_addr, primid = 0;
>         int change;
>
>         /*
> @@ -52,10 +53,22 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
>          */
>         dma_addr = gpu_read(gpu, VIVS_FE_DMA_ADDRESS);
>         change = dma_addr - gpu->hangcheck_dma_addr;
> +       if (submit->exec_state == ETNA_PIPE_3D) {
> +               /* guard against concurrent usage from perfmon_sample */
> +               mutex_lock(&gpu->lock);
> +               gpu_write(gpu, VIVS_MC_PROFILE_CONFIG0,
> +                         VIVS_MC_PROFILE_CONFIG0_FE_CURRENT_PRIM <<
> +                         VIVS_MC_PROFILE_CONFIG0_FE__SHIFT);
> +               primid = gpu_read(gpu, VIVS_MC_PROFILE_FE_READ);
> +               mutex_unlock(&gpu->lock);
> +       }
>         if (gpu->state == ETNA_GPU_STATE_RUNNING &&
>             (gpu->completed_fence != gpu->hangcheck_fence ||
> -            change < 0 || change > 16)) {
> +            change < 0 || change > 16 ||
> +            (submit->exec_state == ETNA_PIPE_3D &&
> +             gpu->hangcheck_primid != primid))) {
>                 gpu->hangcheck_dma_addr = dma_addr;
> +               gpu->hangcheck_primid = primid;
>                 gpu->hangcheck_fence = gpu->completed_fence;
>                 goto out_no_timeout;
>         }
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
