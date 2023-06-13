Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB93772E426
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 15:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5859C10E256;
	Tue, 13 Jun 2023 13:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC0410E256;
 Tue, 13 Jun 2023 13:31:06 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-55554c33bf3so4053779eaf.2; 
 Tue, 13 Jun 2023 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686663065; x=1689255065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+oJRr1HWHP9JqECQ3VZkz1/hm2pDZyPwBSm4m7w5HBM=;
 b=X5CFBWZRU88crBNevaA8EZ3Qwq7j0QAypahi0v2mI0PpXen/aCrVq0HQwkdSiB9tdg
 AHlFtStU+Es90VmcsHyQoK1pxexIbwHVi97R7o6rBIWZLFZs/INTThPOx0RX02Uq5pKB
 JGRlpzoGDJ/mAnBEidnTXGETHXCb+XOE9DAcmzOVVbpLoEkhoF4A5tXGlCR0tEfP9IEF
 XGpNSXnxll0V/h9q9ypIo00EeQddQjqOl+vrHBDs2I2WjnTeBInAev7A6XYy8s53YRsn
 zGRE/k5k+xaPWzdemHOoNPzHoBqtS0ZsCmlpnhFNFb3nh/USd89DlKuSdUBciHeHmmdg
 fN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663065; x=1689255065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+oJRr1HWHP9JqECQ3VZkz1/hm2pDZyPwBSm4m7w5HBM=;
 b=MZE79dGkHRRHGH4LnFlMd42gvgTTHIUE3fv6Tpt+VfCSRAgIKKuUyeV+TM570Ie06p
 dvKKSUhipm06u96hjF+kwOBqQSRA88kgv+GngUPL0/KB3IXwJCS2mfCbQ5iKO9+OKXoG
 SrobIENQ0bN4AmfnF0ELOTdZmp5d+4MXxvEEtF7uh8CRg418eyQ6v30v+Lh1aXfCbMew
 HukYD/NBbDFKcD+XyU4WoUYA+l8lF/CW572til/jxvZ36LYyS8WsSzSdfvCUE8hJKnRF
 iUsttAVvhauxlavkpKFJJ8QbBEDAapfntpMUANPOtszHKcdmexfTG7yAGRI2JWXPMDZ8
 CilA==
X-Gm-Message-State: AC+VfDxsZyuAjNDRnv94k0A5VqCboDQNZTlYv/vvwtJG2+YSH+s7LtAB
 hLoXvETXThmCQ+q2cvjQkd03jeLmI292E/rcSUU=
X-Google-Smtp-Source: ACHHUZ52t43arx1Rkq3eXW9fLgapK+ffELJAuM0B/ToRKDlRMpAaATeQslJvGP2kjGDPZ8nR6LAcwBZEHYKbLv5H+kE=
X-Received: by 2002:a4a:d0a9:0:b0:558:b5b2:72fe with SMTP id
 t9-20020a4ad0a9000000b00558b5b272femr6932618oor.2.1686663064998; Tue, 13 Jun
 2023 06:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230607125841.3518385-1-l.stach@pengutronix.de>
In-Reply-To: <20230607125841.3518385-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 13 Jun 2023 15:30:53 +0200
Message-ID: <CAH9NwWd+1DgZoL8SM=+TuEA435Lqi5HoN8eDYwCtCQgHuNhxrA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: disable MLCG and pulse eater on GPU reset
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

>
> Module level clock gating and the pulse eater might interfere with
> the GPU reset, as they both have the potential to stop the clock
> and thus reset propagation to parts of the GPU.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
> I'm not aware of any cases where this would have been an issue, but
> it is what the downstream driver does and fundametally seems like
> the right thing to do.
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index de8c9894967c..41aab1aa330b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -505,8 +505,19 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
>         timeout = jiffies + msecs_to_jiffies(1000);
>
>         while (time_is_after_jiffies(timeout)) {
> -               /* enable clock */
>                 unsigned int fscale = 1 << (6 - gpu->freq_scale);
> +               u32 pulse_eater = 0x01590880;
> +
> +               /* disable clock gating */
> +               gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
> +
> +               /* disable pulse eater */
> +               pulse_eater |= BIT(17);
> +               gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> +               pulse_eater |= BIT(0);
> +               gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> +
> +               /* enable clock */
>                 control = VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
>                 etnaviv_gpu_load_clock(gpu, control);
>
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
