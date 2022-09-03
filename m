Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF735ABEBB
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 13:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5971410E9B3;
	Sat,  3 Sep 2022 11:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D63310E9B3;
 Sat,  3 Sep 2022 11:19:32 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id kk26so8337492ejc.11;
 Sat, 03 Sep 2022 04:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=OhA2LNu+uDzRFMs8qJfsHLDuaJYy5QrmB0USCSB+1JU=;
 b=lTsa78LcpSaycFK5XOZ0h9D2w9oidbwcP5M2TZGCXkWGWetdRXTfyLbA3nnlfTOlKZ
 cOFPVtpUWMNdYG5eSKPFhBlDF9WC3kyWdWBXt2fGwwYPZH+DJ9qk51BlPl7ikV7d7082
 pBXCa0VtCR565y8ISfWqkDvHmoMo1Fl23KzehrLmz+r2zKU69wbn1DkVO6FRKx4G825A
 b1m1MzJlb4/RzwZahkA2N8HIX6C1pIJOls917yUvskJ64In9jq201QyiRguPvwMeUL3K
 zXs4JFhbiutaAAiI7aaI4WjWn0/JkEhQs2KOdG9aYytvEgBsP8RWkBD3UbSV/grGDxqs
 DoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=OhA2LNu+uDzRFMs8qJfsHLDuaJYy5QrmB0USCSB+1JU=;
 b=gvssZbSdTxEg7Kwm5PjDxVzDs8hYpUcU9owwIBgpIYlXNth9DcUezoEUoXuI5K7Uvu
 4lFyTFVA33G3LVllyNeOJKfh/wTnZYNCdXrpHcbueQ0LjDJ4okkf2/xJhNLxE0eNrCeA
 E7Of0Iuk0q113Uy6P24QMAQsJW9ZLC8cnU1K+B4hxFhgaITPVnD2y6wx1kHLcg8O3Vpu
 PG5QjvW3xt5M/wK4KyF2L1oyPcG+QGhoIVuj883paURigxoOW2iiJINHBiIA+/WvdHhf
 AIr2PB9vQzTKdGypJIbUYycL0T8E/yamvTphv6vE4h4c7DL5HiFTm5WNN7zCi9ee2KF8
 QgMA==
X-Gm-Message-State: ACgBeo1KP2oAuzPhOfTh/yfl9XQ0GmcO1CYfnFWanlIzsRVJwx6gp3GC
 ic7MkV9HbLuQnX053Cs+C0WzZFsWE6n4H0BOZwg=
X-Google-Smtp-Source: AA6agR74qU7xBsCdTIC1WZw26zEqnDQZrbv+VZxYnP/Bskeaym3GO/sazLgaCVXzL71swAjJM7fxXu9GWl0lfo3WFIw=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr21913652ejb.609.1662203970627; Sat, 03
 Sep 2022 04:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220826190728.3213793-1-l.stach@pengutronix.de>
 <20220826190728.3213793-2-l.stach@pengutronix.de>
In-Reply-To: <20220826190728.3213793-2-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 3 Sep 2022 13:19:19 +0200
Message-ID: <CAH9NwWezqQzikrC6E_J9gpWpTdi+LU1eR4YvHRdzDqRXLgFoRg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/etnaviv: disable tx clock gating for GC7000
 rev6203
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The i.MX8MN SoC errata sheet mentions ERR050226: "GPU: Texture L2 Cache
> idle signal may incorrectly clock gate the texture engine in GPU".
>
> The workaround is to disable the corresponding clock gatings.
>
> While on it move the clock gating check for rev6202 into the same check
> to bundle them.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 37018bc55810..430fcc11d668 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -616,14 +616,15 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
>
>         /* Disable TX clock gating on affected core revisions. */
>         if (etnaviv_is_model_rev(gpu, GC4000, 0x5222) ||
> -           etnaviv_is_model_rev(gpu, GC2000, 0x5108))
> +           etnaviv_is_model_rev(gpu, GC2000, 0x5108) ||
> +           etnaviv_is_model_rev(gpu, GC2000, 0x6202) ||
> +           etnaviv_is_model_rev(gpu, GC2000, 0x6203))
>                 pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
>
> -       /* Disable SE, RA and TX clock gating on affected core revisions. */
> +       /* Disable SE and RA clock gating on affected core revisions. */
>         if (etnaviv_is_model_rev(gpu, GC7000, 0x6202))
>                 pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_SE |
> -                      VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA |
> -                      VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
> +                      VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA;
>
>         pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_HZ;
>         pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_EZ;
> --
> 2.30.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
