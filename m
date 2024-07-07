Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C099299B6
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 22:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7685110E13F;
	Sun,  7 Jul 2024 20:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DK3B1EAm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2AA10E132;
 Sun,  7 Jul 2024 20:39:10 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-70364a94255so739539a34.0; 
 Sun, 07 Jul 2024 13:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720384749; x=1720989549; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8AnEJC86DzIF29EGS85jDP9j6rEyPSqrqXKuTkC/n9E=;
 b=DK3B1EAmRiFJhNdNU4Q01qQYBf6WbrKczM/qS90c7Y2NvbBdtZ2LH0An6OUkslOyTt
 Ow0JYUYPl+Tbej7MXhBdNXuHhCigC6xpK+Sbatz/QPkRQE23aqk+wYCF4i376HeNyN+D
 s1COfMn5Mlft4YNEUGMmqhrZIgoqv+OuV0fCKRP+iUjZpjwSXRdLYA9M4RLg3nritm+y
 ZBVlfKGbcHtCv0x8JQhqnh2fxDSJvzaftAUviTk6nXEzmtsMqAHg+asGdevO4lEBgnPX
 12W032Bk9jO2HPs4b/fX6AaZOnAalJAMtW9alny1juIoBo0FNnXZxj1YMBct+6pYxUME
 Hkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720384749; x=1720989549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8AnEJC86DzIF29EGS85jDP9j6rEyPSqrqXKuTkC/n9E=;
 b=LbklwGQtv1VLvhNqz7b+OzjKm2QMpgDr0MYDUWgrMFUvofDv/2YBqbyVtbWZVpKOyz
 O8Zp3LxJD+H+TI3ppZWDGRdbtjEihfB7Bz7Xda6Gx+2DxNUAicZ3E+LfNbSVviQgzsWX
 CStuA1tmMEzfr3Q4p9cYMca/iBAs/fCMeNxjYp7eUZvHsx90Yfz9ug18w1+UsSce28Ve
 Xrga2rx76i4nMA1b+ssqyhCOnZJTfm0m26ykpnTinOXSNQWNG3zrxXTY4PEZbmbf8mLT
 LdEFDLcLFKdgvUJ6RLEcw5tBzXA1FH6/Tv+mFYox0sukd2Nw+pYy8KBgOstMhhivDvrf
 eqJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9pQwZTIOuTgWZAr2CQfKwV1fXlk7B3GC+bsO1L/lXfIrOC76TlXfFJEDSPZVnV7KrhHQYar5uulXM/CUh4WZYSbyZSH4UG2vD+VuAJQpE
X-Gm-Message-State: AOJu0YzSiRiyCsRJwglEEm+iCg9oTJD6X5FJ1yRSm3kPjZnhZvSOtezZ
 Tqp4+mLfhyxsug1jwRyQURqQT0EaLd2pwAhc7Isyk2xqVWhJl0V0QnJbxArDuySobIBIxCRn5on
 hHxfsWPhSC4uOa7bF6edCfMRjjlE=
X-Google-Smtp-Source: AGHT+IFr2GfRiLZBPls1DQVlKzy/VLjDJiLUbodANM+QqVlBBXVFUuKy3nsrNHn3Y7MC5SSyBZqHqJcHjJx7rhJyk74=
X-Received: by 2002:a05:6830:1e14:b0:703:5f4d:a758 with SMTP id
 46e09a7af769-7035f4da9a8mr6283624a34.13.1720384749142; Sun, 07 Jul 2024
 13:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240705200013.2656275-1-l.stach@pengutronix.de>
 <20240705200013.2656275-2-l.stach@pengutronix.de>
In-Reply-To: <20240705200013.2656275-2-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 7 Jul 2024 22:38:57 +0200
Message-ID: <CAH9NwWdn2+p+RBT9H6p5bBnOvSSgKXykaRRqja8FpgRqF6ya9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/etnaviv: assert GPU lock held in perfmon
 pipe_*_read functions
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
> The perf counter read functions don't just read registers, but they
> also mutate state to direct the reads towards the correct pipe and
> engine. Assert that the GPU mutex is held at this point, so that
> those state changes don't interfere with others.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
> v2: new patch
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index dc9dea664a28..d53a5c293373 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -62,6 +62,8 @@ static u32 pipe_perf_reg_read(struct etnaviv_gpu *gpu,
>         u32 value = 0;
>         unsigned i;
>
> +       lockdep_assert_held(&gpu->lock);
> +
>         for (i = 0; i < gpu->identity.pixel_pipes; i++) {
>                 pipe_select(gpu, clock, i);
>                 value += perf_reg_read(gpu, domain, signal);
> @@ -81,6 +83,8 @@ static u32 pipe_reg_read(struct etnaviv_gpu *gpu,
>         u32 value = 0;
>         unsigned i;
>
> +       lockdep_assert_held(&gpu->lock);
> +
>         for (i = 0; i < gpu->identity.pixel_pipes; i++) {
>                 pipe_select(gpu, clock, i);
>                 value += gpu_read(gpu, signal->data);
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
