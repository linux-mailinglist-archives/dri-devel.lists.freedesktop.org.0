Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37188AE5F58
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 10:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44B010E520;
	Tue, 24 Jun 2025 08:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ajJ3DfkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FDD10E506;
 Tue, 24 Jun 2025 08:31:43 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3134c67a173so5519544a91.1; 
 Tue, 24 Jun 2025 01:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750753902; x=1751358702; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RLm1eCOS558a0OxABxyreVhiNPYo5PVwJq6HLdRyQY4=;
 b=ajJ3DfkBmLc+YoqIRHsam/GoZn8xalRAm4h9CNBeBqc0BY3+YtBPvtNpJzWl6WFHeh
 8jPXFIrCHWNKORa8R3ESSWAiNiTqIndrAvw6lNNYlWaL7Ng8i+PsGdIzLNtnbIc5hp/P
 nLagkdUtutMmApsNjWCZUOEXC3+BicTi2+nCdUso/5aSwPQ1NrEvHuQIQvnIRhlUW3Wk
 2/BuYhcgflP8MEtW81iQpRB5RAnyKZj89j5+5z10M5CHKk0L9kqKuEjYWkKOvwqH9bQF
 AaOVb9HinkNqGrGxW7QuvBQg4BgEcMylHwf3zWrg+QT+kgwC5D79o9UNk17Gq7ZAKimn
 nabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750753902; x=1751358702;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RLm1eCOS558a0OxABxyreVhiNPYo5PVwJq6HLdRyQY4=;
 b=bwEg80hGel1EPi6oPtn30a4CzzOU+sXtclida6nY1N3PIWcWuyv12hQeSWYokuELdO
 JA39XtYTIEDA/w0RgMSynlk11xjMRLt8bkJ+CQB135XwesQSKUHNzOOweYELZkyj386C
 LJuKfitM+Yn5entAM5fynm3zFMdpROiN58o0GNy38fOxuyDQzKxXpwh2iynbdVFoEa8Y
 Vlxjy+LzaAoStIsXTMP1C913bAgRRYhGFtRcmWawDCK1GZ500peSJxGM3jMlvOp+hDrU
 IimFTRHv/OQ7le58SKynlRerXI/WHkdyElKC6KzzmMTIrX+ToYurNfrMeugFzWjCYo79
 4Oog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzYa7/kJDNrkEPJdkv9cpVP4OZlA7DuJnaXImqJOemMemSpFA21pagVmftfCIqDN6kFX+tVQJtwoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXMQqc0MEUVOAClJNiiFyn9DhiCCyRNZQWdTD/coaSmG+6i3BX
 d/TRbJIL+mIdJa3ddN+r8bA6T8Jm6Xy4i+P+v27FRQRoOjRxuKwdgixwDpJ89A5UalRGe32vpzh
 OvlwajZO9W+d3muir/BMuekkLBMUn5MQ=
X-Gm-Gg: ASbGnctUfcR0E4wOHfzVMrg1HpmY5jnjj2TW6db5VwodsgpET0QhXXPMifdtRVuMebE
 +ccAnd9AixGi9GGvMIZMWxGctcj1Sd1Wwh5e2HIuhQJNdY9OEJr1NDTxJYascMqKMYsJp42EtYS
 5EgBONoJwltm9oKUG9R8qdX7G1PTYnYiZQw9FxeFNbZYcmPKr9OeXm
X-Google-Smtp-Source: AGHT+IEXsmebtdLEDU4+D7wfNeISKIT4XGszutosXR7ErbIhUbYXn7g0OjaLVPWrYv4hqFiV0lJiZ9QwH/kl/wffxuM=
X-Received: by 2002:a17:90b:574d:b0:312:e51c:af67 with SMTP id
 98e67ed59e1d1-3159d6267eamr22961507a91.1.1750753902390; Tue, 24 Jun 2025
 01:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250620195741.2770474-1-l.stach@pengutronix.de>
In-Reply-To: <20250620195741.2770474-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 24 Jun 2025 10:31:31 +0200
X-Gm-Features: AX0GCFuTF3S7xGMmIthZrCWwrOdEiDpVZkoxKCqfNOBAiqKO6_qaSePJOzJkWB0
Message-ID: <CAH9NwWfzXyMz7DVmmSFy_jKHBrSj2p_QAU1152yMPu0hN2=s3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: disable pulse eater on cores with 3D pipe
 and revision > 0x5420
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-slt@pengutronix.de
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
> The downstream driver switched from only disabling internal DFS on those
> cores to clearing bit 16 and setting bit 17 in commit "MGS-3448: gpu-viv:
> fix 6.2.4 remaning issues". This, as far as is known, completely disables
> the pulse eater.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index a1e84deba6c0..a2b3785e49b3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -747,9 +747,10 @@ static void etnaviv_gpu_setup_pulse_eater(struct etnaviv_gpu *gpu)
>         if ((gpu->identity.revision > 0x5420) &&
>             (gpu->identity.features & chipFeatures_PIPE_3D))
>         {
> -               /* Performance fix: disable internal DFS */
> +               /* Performance fix: disable internal DFS and pulse-eater */
>                 pulse_eater = gpu_read_power(gpu, VIVS_PM_PULSE_EATER);
> -               pulse_eater |= BIT(18);
> +               pulse_eater &= ~BIT(16);
> +               pulse_eater |= BIT(18) | BIT(17);
>         }
>
>         gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> --
> 2.39.5
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
