Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3219299B8
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 22:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057D310E158;
	Sun,  7 Jul 2024 20:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PzpIL84h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC6410E158;
 Sun,  7 Jul 2024 20:40:23 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-5b53bb4bebaso1901612eaf.0; 
 Sun, 07 Jul 2024 13:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720384822; x=1720989622; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hDpwOmkMyCFrYvKPDy95PHGlfJKkemR6/uPTwFX1Sjg=;
 b=PzpIL84hxlnwvyUnP8NomoHOO7+Ly/2xyvjA9ReL2YCw69tT2uKgd/PqTVc7roRmtt
 pa5c/HdVmiO75QClk/KXigN5e3LkwK0PQNPrwtEHVc8QuiMo7Ha004x5fl92LZ/F+TyH
 7YLTwINmVhjcigzLG/YtKvabF/WjNqT4xhtcEnInM8Ans/HQvS+qT/rksCNheTdF2AdH
 F+RxtZeZskpnTS7IW8eS01xnebcrx+Eyj+XI68KyxOrgEZ3w6ZELg2F4gNc2Lw9q3bik
 LbLA03NTHfEn6lYUiqaW79U0wAQdI7TkiO2Fp8oMPa7jB44/t24LLVTpo0rXkRQ86+w/
 V1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720384822; x=1720989622;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hDpwOmkMyCFrYvKPDy95PHGlfJKkemR6/uPTwFX1Sjg=;
 b=tqK3rcfzGiLUAbmVw/kpiMSSqD9uYF+rhkZxAJMY8ZVz+wgFku4CiurP+9GGXuEx2B
 vnqnPNb6pnYGRgEexxLr0jaTQX/n0uIlFoHe/eLQ66BBcHovfPoN7HcktwHoN/p8oVrY
 Lc7m+B9LgYbIO/XLSQYlnaPpSzlvhx5v9uwYTu5KMOehJt/YLJmMS6ql6mQ1h5HXdi6u
 z6JK2uzBWmal0D/LLzTsxyMpT5jvmeG3YskZ2gJ34lHupv0QT26XFgUDncOncbKpv2GC
 R24339a2xE9vT2Odmee7Abk6eH/g6/b16A/65+jUxM6mDpmaIkYnT4cfwghk5FHcqMTQ
 yucQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGodNl4IewpAFJKKM33SupoMPzJYVgSG8okfkMboFjSUysggqGcU72Kkb/kPK8l/kFMJp0+PhgXk9DtFPlEE0TPaVeToRDgOFNViEkN9Ve
X-Gm-Message-State: AOJu0YwHGMCKKByXv5DJG2KNNTfhtPnJX3kMqLZlissK41D5IVWEpvpl
 hR1YU/u5uCJuYgJsvVRnjPZceiTXElUPlnQurtfRWtI6A9/KqQkmTj6oLMmJ9Zkk/fKNwLFsZkG
 FBsHiSk6RXhYcgrxj9vFwO9jHHmSU+aG1
X-Google-Smtp-Source: AGHT+IHvVtKTxYcG9uVoJ4eOJ2CPIRthO817fTOaitzI6mZgN2TtmYuYyGf2LkOt8Y2eKVfoiM/GbxeNofwzPOIU84A=
X-Received: by 2002:a05:6358:5e09:b0:1a6:9982:5dd5 with SMTP id
 e5c5f4694b2df-1aa98c394a6mr1165187155d.10.1720384822206; Sun, 07 Jul 2024
 13:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240705200013.2656275-1-l.stach@pengutronix.de>
 <20240705200013.2656275-3-l.stach@pengutronix.de>
In-Reply-To: <20240705200013.2656275-3-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 7 Jul 2024 22:40:10 +0200
Message-ID: <CAH9NwWd+RmX+gqzShahCpGFiT=nqpmTq43jWyGF5ugZ=+GKRcw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/etnaviv: unconditionally enable debug registers
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
> A later change will use the FE debug registers to improve GPU
> progress monitoring. Instead of having to keep track of the
> usage state of the debug registers and lock access to the
> VIVS_HI_CLOCK_CONTROL register, statically enable debug
> register access during GPU init.
>
> The Vivante downstream driver seems to do the same thing since
> a while, so it should be okay to keep access enabled. (See
> gckHARDWARE_InitializeHardware in 6.4.11 downstream driver).
>
> Many debug registers contain bogus data if clock gating is
> enabled, so even if they are always accessible performance
> profiling still needs to manage some prerequisites.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
> v2: new patch replacing more complex usage tracking from v1
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 2bd14d3501e2..bf0b13c99a3c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -574,8 +574,8 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
>                         continue;
>                 }
>
> -               /* disable debug registers, as they are not normally needed */
> -               control |= VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
> +               /* enable debug register access */
> +               control &= ~VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
>                 gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, control);
>
>                 failed = false;
> @@ -1337,11 +1337,6 @@ static void sync_point_perfmon_sample_pre(struct etnaviv_gpu *gpu,
>         val &= ~VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
>         gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, val);
>
> -       /* enable debug register */
> -       val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
> -       val &= ~VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
> -       gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
> -
>         sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_PRE);
>
>         mutex_unlock(&gpu->lock);
> @@ -1358,11 +1353,6 @@ static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
>
>         sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_POST);
>
> -       /* disable debug register */
> -       val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
> -       val |= VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
> -       gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
> -
>         /* enable clock gating */
>         val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>         val |= VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
