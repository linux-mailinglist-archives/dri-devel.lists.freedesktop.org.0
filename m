Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2FC893A2A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 12:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8542810F06F;
	Mon,  1 Apr 2024 10:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lbab+vo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE3110F06F;
 Mon,  1 Apr 2024 10:26:50 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-5cddfe0cb64so2011618a12.0; 
 Mon, 01 Apr 2024 03:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711967210; x=1712572010; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JjwzJvN7Hav8Gfx5C17pz9b7G+QKQ828bVeZeg9IPps=;
 b=lbab+vo4pmpIXaLDNob5m7aUrAPpkRHtD5J0aDHryhwaUXtOoM0m2Y17ILb3aDRcTi
 TD/PwEZT2cE9TuKRf+hqSEernXTEBmFrfP0AILdaccuBiUwDGG0iCKVnktcUSnpcVntK
 S2oYt7FULM3YfgHdu0i8n9ZA8kpWNXSquF3RZSzhWVcXkLZZu+mA6qJR48uphCdqcSxG
 bgR2NUbem8X7t8wqnv3syXjOKCa0SG2ODNud7kE11SuJn3ve19nmtMBi1PSR68ax7/ef
 YNJYUT/nFujrYa4dtjKAlxWBG9gXLgvFCOp34eJZVZIjawqkChoP+R7brjBpQvjUfz4L
 Qkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711967210; x=1712572010;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JjwzJvN7Hav8Gfx5C17pz9b7G+QKQ828bVeZeg9IPps=;
 b=T+0dXzBdRGXWslWzah91jiqzvZAYw39g+uQqNs8VNBUppLAG/g8mv7LMhOTL1CgDsu
 /OsC7XFQryK7PR2sdagrYEgsVXkFeqx8ldR+D28Gwf5SD5AycikgLjTyIePfOoSQQiek
 Ig3jBKweJkT/5tUDK2Xb46RUCm9m4V1wB6o9tAdv8VFZ3qCCOPTJNEKggy4rl/2TgLU0
 XOZxPNFWaNkhTTwt/XirN8Zodt63Jd0iQo6ayKztfSiZyLEriEMcdlF50gGpy0vIOkv1
 1ly2BGE9GrLCekLJsOM5ZfAZr0U/lhwoQK+ffcuAyIUjIFWY2v5cupsEpwx0COdZMQ03
 8UEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6CNNbW1qDGmWvkC6hVum7OrAjmUIl9CJ8JH13T+o8MNP9lbvfEiXHsbniqgtnmQGPSnntEdM0KzQ7DVxS1WYKer0/HCad2iwNlRDwWM8x4ahc/6cjDEsAGGKj5bkcMylh+Lv8SUvRDYXqIH3bHg==
X-Gm-Message-State: AOJu0YwT4g51VI690OMQ1znxxTzrHx1+pS+Bwm0Z5Kbyx9I8ZUvi0Tz8
 sOgh9Ia1XDGHLcPuloKWvZMsi9068SMv7r/ii+fY8LGxjcXoPkUNxPxZHC9Hca7UaonyvqSrhFS
 hWHc3y1mLEwzT2FaMWypgp5dJhZw=
X-Google-Smtp-Source: AGHT+IGYkH5Sb7GgjlSrymSb6EhYbcInrAsRHLbXoz9xykBVamWmNo/n2ubQhgDjpR+t6aXA3b/qp3QyHjPWtzIsMW4=
X-Received: by 2002:a05:6a21:a58a:b0:1a3:dc27:1f01 with SMTP id
 gd10-20020a056a21a58a00b001a3dc271f01mr8646378pzc.11.1711967209548; Mon, 01
 Apr 2024 03:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240330205241.92711-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240330205241.92711-1-krzysztof.kozlowski@linaro.org>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 1 Apr 2024 12:26:37 +0200
Message-ID: <CAH9NwWfU5eaBRSqhgJgHwgphtL+KUAiX3Tx_7vO11N_BV7qUQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: drop driver owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.  Whatever is set here will be anyway overwritten by
> main driver calling platform_driver_register().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 734412aae94d..87b31cfee41d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1995,7 +1995,6 @@ static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
>  struct platform_driver etnaviv_gpu_driver = {
>         .driver = {
>                 .name = "etnaviv-gpu",
> -               .owner = THIS_MODULE,
>                 .pm = pm_ptr(&etnaviv_gpu_pm_ops),
>                 .of_match_table = etnaviv_gpu_match,
>         },
> --
> 2.34.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
