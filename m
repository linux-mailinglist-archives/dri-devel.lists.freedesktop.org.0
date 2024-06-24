Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F8B914E42
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 15:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E185A10E427;
	Mon, 24 Jun 2024 13:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VuvwIclv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7436A10E05E;
 Mon, 24 Jun 2024 13:18:41 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2c80637d8adso2705468a91.0; 
 Mon, 24 Jun 2024 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719235121; x=1719839921; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=emeSlriRRUrdujH0mnBIpyXCrJvSxoPHIO3O65l48VE=;
 b=VuvwIclv+Ydi3njdRvU+cqsg3SfUWkijvqagEwo3o6fAawa4rv8SBbzD6JQ+1kcGZm
 plvLyzc6pTz+/zCpANBX5nmKFt5Fl39WBhHssyoaiFI3MJMz87GGQshSZyjnOauC/dlK
 r+Zj1AAe9fjNO7cYPdgOsNbRRy0k69DTzDcfeMnuhf+QuC4/YxsPA+tIrwKIpGUts5jE
 38F28icU/NP2U/n6RXwVnmt1E/cN2/0eLwf6D9lBaABaViOCsoUcWMaUrvdylKPzpqcV
 ZJxQkentwpnFIdxAcAHdyADBy31M53UqCTQW72nYRDF4rwqSTG8YSQttvne55jQ73o+i
 Ftbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235121; x=1719839921;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=emeSlriRRUrdujH0mnBIpyXCrJvSxoPHIO3O65l48VE=;
 b=uo7DrABTrSOrJvPmLQpIApx2JmXKg3ShkaQbpB+8BXDt2QxB2Gk/mpiClSKE97Lufo
 abgBp0mwL8Qdz2b2zeUAgqIOj5D86Q1OlNcYY/mozZI3TD8MslFLtLDXwfuNnqIFqjI2
 WbmxzcjYYPOt0wpsVgWueVNnJEWzaHe3sCYNdD9HN6N1C9IqlizUeaNgAK6hvGUXv81e
 tV+sm+OopUJEV24aQ6mWsR69LSnaomDad4bRekm9FEZ0WLwVarTA2V2kAnR7C5nD+G/n
 72jtJxCFCM/tP/VvoKeOTtFQcHFYsn8yt4Pfuzx7p+ttkU3wLbrAXV4qu20EkN9x28Dw
 W3lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVb1n9Grej08598FM6FAeX5YN/8k6rLaZq86vqOk01TP187ZdroZub3KLkpgLSZUa5AkNUhYOpmjmgOrfN18GcRynzjRygmsQ8MkkwpoGD
X-Gm-Message-State: AOJu0YzAWx1PJy90LyNnNxGwtnEnhQpHdm8gmDduKObs4VF1uCRqv4Fy
 pToyYbZxmb2NzVTsBRgQ8Uq2VmbSOM4XRgC7oJJsf8swP2yvLLvN8zHAXLXh/YA9vVMHJKNgeEL
 h+RqpaJwZhCEdjPp3R7XWgCNjyty+fxUt
X-Google-Smtp-Source: AGHT+IHmP1S11AEp17y5+po5G3f7xzg1YlqziywRdUW2/0We+Ag+pjsaCLI/RdeisWEUPAZ4pa9IU3TQMa98zwJhwC0=
X-Received: by 2002:a17:90b:4b0c:b0:2c2:f472:64b0 with SMTP id
 98e67ed59e1d1-2c8582e1711mr3164364a91.49.1719235120823; Mon, 24 Jun 2024
 06:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240621195919.491217-1-l.stach@pengutronix.de>
In-Reply-To: <20240621195919.491217-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 24 Jun 2024 15:18:29 +0200
Message-ID: <CAH9NwWfMeT0-COymDsFeGGe8F=UVMBny+2Bv9wJVUfaorU19eA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: don't block scheduler when GPU is still
 active
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>, patchwork-lst@pengutronix.de, 
 kernel@pengutronix.de
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
> Since 45ecaea73883 ("drm/sched: Partial revert of 'drm/sched: Keep
> s_fence->parent pointer'") still active jobs aren't put back in the
> pending list on drm_sched_start(), as they don't have a active
> parent fence anymore, so if the GPU is still working and the timeout
> is extended, all currently active jobs will be freed.
>
> To avoid prematurely freeing jobs that are still active on the GPU,
> don't block the scheduler until we are fully committed to actually
> reset the GPU.
>
> As the current job is already removed from the pending list and
> will not be put back when drm_sched_start() isn't called, we must
> make sure to put the job back on the pending list when extending
> the timeout.
>
> Cc: stable@vger.kernel.org #6.0
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index c4b04b0dee16..62dcfdc7894d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -38,9 +38,6 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
>         u32 dma_addr;
>         int change;
>
> -       /* block scheduler */
> -       drm_sched_stop(&gpu->sched, sched_job);
> -
>         /*
>          * If the GPU managed to complete this jobs fence, the timout is
>          * spurious. Bail out.
> @@ -63,6 +60,9 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
>                 goto out_no_timeout;
>         }
>
> +       /* block scheduler */
> +       drm_sched_stop(&gpu->sched, sched_job);
> +
>         if(sched_job)
>                 drm_sched_increase_karma(sched_job);
>
> @@ -76,8 +76,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
>         return DRM_GPU_SCHED_STAT_NOMINAL;
>
>  out_no_timeout:
> -       /* restart scheduler after GPU is usable again */
> -       drm_sched_start(&gpu->sched, true);
> +       list_add(&sched_job->list, &sched_job->sched->pending_list);
>         return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
>
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
