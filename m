Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB323D1430
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 18:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D7E6E419;
	Wed, 21 Jul 2021 16:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C316E419
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 16:28:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n1so2817065wri.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=87zUbz1C5W2YezlBPGoE/oRfgomWOIiqwbdvJRz3UsQ=;
 b=w3Sm9dn4CA9P0CADAfnovH6ZEa15/lTy6uxy+QE6OyRp91druNovikPOnN0XWrREwD
 2bTtw96xizHcM73y86u4E1YY1sRFQrHTp7Hm+iOcOa5PAg+oehKX5GI1EsHeFqVpN/vX
 0AO5qr7bmbipeVoVKqonopdG3/UJaCEU+1HFoNqpO/mEtECiBWs84hkMV8evV3+snY+m
 nLZTYf1DN1297CMN2rl1XbqVCgN5vR3Zi9hkZp6QtRhfF5hjr41Fm478jTxPS2cAmcm6
 yQYpdsPoQo9iXNZeUvxU0Qa++CFGhNxnflDzFR4NuRNuAT7wcQZKedf3nR9JYscwb5zJ
 ZlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=87zUbz1C5W2YezlBPGoE/oRfgomWOIiqwbdvJRz3UsQ=;
 b=E+giCN1M0JXgjgqE7GD3rmXQpX6Nk/aGSn2gw0mtxtbJPu1vvtorCWYLiJIrJwn4B4
 2XdFtr6tSIy7ZCH6u1SrwzhVBwaMKHH7Np3kVt7n/V3TIUsm32Y5h7lCzm0Glmlpcr4f
 tbRuBj6nA9CcX/gZqscYTf+ntEza0nennRZ7DOdZZXB79MJ8A02qWrqHxoRupUFL1N9T
 8mOE4cirwI9EZUf/+wjSCDqrQN5xHYuZpdKv/k+hyuak4ol0G90j9SezbjtKW9A/a9LX
 2MfS9RSS2BKbf4YvcB8SuLIfw83xpyLqkuiCRi4v3SJnwL7H8/tAblpKe6JWrRnXaiOV
 qpFw==
X-Gm-Message-State: AOAM532O1xRHU7oS9pV8KSEC+JBBknIihslKF8hN3+dIyqqOVnhFlELC
 wmyvJi1iIomARBYEaKJx+Zi6Yw==
X-Google-Smtp-Source: ABdhPJwJBPfX6dh1eCAyJLjrCpduCB33AO9NkDFvKD2kD6175alBe9bavqvW2HOGSVTGrLnN1Xsc3w==
X-Received: by 2002:a5d:5305:: with SMTP id e5mr10653335wrv.237.1626884928767; 
 Wed, 21 Jul 2021 09:28:48 -0700 (PDT)
Received: from google.com ([31.124.24.141])
 by smtp.gmail.com with ESMTPSA id z11sm27170045wru.65.2021.07.21.09.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 09:28:48 -0700 (PDT)
Date: Wed, 21 Jul 2021 17:28:46 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] backlight: ktd253: Stabilize backlight
Message-ID: <YPhLPpljqgAyp6QS@google.com>
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

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
