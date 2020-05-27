Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7331E440B
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 15:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0266E0AA;
	Wed, 27 May 2020 13:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392246E0AA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 13:42:29 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q2so28926261ljm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 06:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Gpj8j0c5lyk5HRTgWrPRCYDejEarn7rj3eE7+2oSVc=;
 b=zcyryCjEzgqjzqS0vEKTDZVA0X++Z1anrdUB1lNCfaHBFkLcjTCnYHdYlj7k3n3QM9
 Odvj75y+zy5TV+HerTnoD7OtG+IXx3N3ktu9K6NDagmnSq6JJ6/3ha/lUnacFXH4FkhH
 8qa48jdqcVdfMm0g1ELVkh1J6LQQSyBFN0LF2hsFL53oi+oRo7TbRzsAs1iq2wGS7Brm
 5pC3xPkW2IIsc+ILl9OaLm8+cQL+GwIxfx3UU1MGtY5Q4hkMLZoajmCZRa4cbhy5bP9r
 QqZd3Ad570pj8v29IEiK5wGFkzAraEl/NkquTKxiLTvPg3IhIZnTNIR9z8g7rc0xqpIk
 lhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Gpj8j0c5lyk5HRTgWrPRCYDejEarn7rj3eE7+2oSVc=;
 b=bJoF8rPDVlZn0oRJ/aUBk2PBguIy8jTnZ3AQy1ggNJCy20f7ijcmtWInz/CF39Myt/
 kgdtTR95/kFAveZsYwxyRNuSrh3Bi9VQBiGQP6PMT5Pryf0X2HcXbsEsNSFeu2MPTm84
 KjhL+CoSjv8gCJzUXr7fEYpvl1raC2UCiQ4Kyg7s0zNWyVn1GsRETz2Ho8JWIjVIlstf
 dAL/l/gRF15vlaNwwf8Oavi8IFoznQT4utPC9nWGKxWoi+ouIUgR4VAYits3MHV+Y6D5
 XIVmnz+LNuIWFsNeoWc51+N5gydQWNiSmuteRTssRVNjXw/4oaw2YK24O18j1wbNcCSs
 5+9w==
X-Gm-Message-State: AOAM5319HRSKWJJT63LJ8HoFdX1nacKQL84JlojqlW2mK9FRx9CcUH9R
 e66tbsbOoUoLeHeS4CAeMWzATNTF8OS573khvDb9OQ==
X-Google-Smtp-Source: ABdhPJwdDESykBgd1/Xo09tRAtdPiuah9DZv+t/1lZLdX32cBET1VtueeUtTZW2AEqUKI8AAVqGqcdgKFtE02GKvehQ=
X-Received: by 2002:a2e:9716:: with SMTP id r22mr3231303lji.293.1590586947594; 
 Wed, 27 May 2020 06:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200527133158.462057-1-arnd@arndb.de>
In-Reply-To: <20200527133158.462057-1-arnd@arndb.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 27 May 2020 15:42:16 +0200
Message-ID: <CACRpkdYVM=KNTPeZKPmFDa755S2F6wTP7aAZPX60tTxnKBUYpw@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: add CONFIG_VEXPRESS_CONFIG dependency
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 3:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
> The vexpress_config code fails to link in some configurations:
>
> drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_versatile_init':
> (.text+0x1f0): undefined reference to `devm_regmap_init_vexpress_config'
>
> Add a dependency that links to this only if the dependency is there,
> and prevent the configuration where the drm driver is built-in but
> the config is a loadable module.
>
> Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Rob will you apply this directly to the drm tree?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
