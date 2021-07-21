Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F673D1181
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BB36E15D;
	Wed, 21 Jul 2021 14:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD51F6E15D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:37:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 a23-20020a05600c2257b0290236ec98bebaso1117770wmm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=aXAbDI6Pm3NHS62PolmvN9iMogn0+faG17zvMPvVdBA=;
 b=fxiwCR+9btSbT2+z13VA0fh4yi8F5OUdGsGDB3QV/Y+fnZGSiGz4KrV2wpazWsF8h1
 KLk+6VpBjyhk5C3i5m1TQ8ObLV06AwOokKQ5xZO31OEQW/MFhFMzcCY6r1Pa8HGDETRP
 KVaERFAFv8Ob0H5Mhbm6CDbDUO0QX9OzW2vMBmWafXBDx/pi6PQX5dD5auk8BUkpQzEa
 zcF4xNHs2O3ZskQBBEEiYsUeKXPwkotDY4Dc9KOOtFVFoQ/FlsvTmO2oS0z+Gg3P2dre
 WgqyHFmwxtaYIpwzfqXre23DzIN21Vt3JeXs20M8YIWnSam43EujH6JTUpmBToHkiIAd
 rN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aXAbDI6Pm3NHS62PolmvN9iMogn0+faG17zvMPvVdBA=;
 b=YTadXxrEZgcgoJ0IMPA2vNz4avAq/TiNKK+XZe8oUlHKLLBKpnQ5xaqj0GtwoJLaCA
 Gtenn1B/9hTGknLDAzZGjvBwSzwuJDlsfcdSLr4sbXGu65F0Kz2J782io4NnSDN+tJgd
 csmeFlE8R5gdwZ6WYJiqdG7KhuINYgMq/8ZHEU8hEC0LPfw8Jw0ahAvuI2/M10j30r3R
 SuhriHZX5RaNLbznecgKqkhUa179smSwvyDSgU/LQKfXgKc/nmIm4JQOFiolCU5RvLpk
 rSvNP7t1GPmqfwwHBb6fDQrpaUligrI5GUt/WYXlqcQTNAB7OMu79jxDuUWVASrm5gGK
 sqgw==
X-Gm-Message-State: AOAM531ZX9blxD2TossjVLMN8NoWHa0xDT11fAEo0bX7FXF9MWFO1F0W
 oCtbU8v1a2qm7zZGGX9kiU+TUA==
X-Google-Smtp-Source: ABdhPJzrV9dxt3zRZ84/8Hp7lfQspjn6nVBjtpesUJvx6ebUthngYA3U9eadI/fULyXuQyNzk40DxQ==
X-Received: by 2002:a05:600c:204a:: with SMTP id
 p10mr37024726wmg.136.1626878223503; 
 Wed, 21 Jul 2021 07:37:03 -0700 (PDT)
Received: from google.com ([31.124.24.141])
 by smtp.gmail.com with ESMTPSA id p9sm16383946wrj.54.2021.07.21.07.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 07:37:03 -0700 (PDT)
Date: Wed, 21 Jul 2021 15:37:01 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] backlight: ktd253: Stabilize backlight
Message-ID: <YPgxDc+ASOvozxB6@google.com>
References: <20210715113636.1139465-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210715113636.1139465-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, newbyte@disroot.org,
 Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Jul 2021, Linus Walleij wrote:

> Remove interrupt disablement during backlight setting. It is
> way to dangerous and makes platforms instable by having it
> miss vblank IRQs leading to the graphics derailing.
> 
> The code is using ndelay() which is not available on
> platforms such as ARM and will result in 32 * udelay(1)
> which is substantial.
> 
> Add some code to detect if an interrupt occurs during the
> tight loop and in that case just redo it from the top.
> 
> Fixes: 5317f37e48b9 ("backlight: Add Kinetic KTD253 backlight driver")
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Reported-by: newbyte@disroot.org
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Collect Daniel's Reviewed-by.
> ChangeLog v2->v3:
> - Read my own patch and realized a bug: when we get a timeout
>   we bounce back to max period, but still count down the pwm
>   with one leading to an off-by-one error. Fix it by extending
>   some else clauses.
> ChangeLog v1->v2:
> - Alter the dimming code to check for how many ns the pulse
>   is low, and if it gets to ~100 us then redo from start.
>   This is to account for the advent that an IRQ arrives while
>   setting backlight and hits the low pulse making it way
>   too long.
> ---
>  drivers/video/backlight/ktd253-backlight.c | 75 ++++++++++++++++------
>  1 file changed, 55 insertions(+), 20 deletions(-)

Slight change of plan.

Looks like this fixes issues introduced in v5.9.  I tend to only
submit -fixes for issues added during the same merge cycle.

How loudly will you shout if I submit this for v5.15-rc1?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
