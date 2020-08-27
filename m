Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C425416F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 11:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADC46E4D7;
	Thu, 27 Aug 2020 09:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326966E4D7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 09:04:28 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j15so2517793lfg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W/YcO+y91qWpRifOToTl3r69MDdmjwxk+I8zXayPCGo=;
 b=LlLVyeIrPJxgDnlEpofz44Cygw2F99oipnbWNQSugsqjWlw99519NkX8Fx8PHaVX9w
 ZHuiMjwxDn2dXM4kL7CBbSjpWK4+rgbZ885BnIS3em2oxBsa9NhFbV7B/dVAG3vOnLOq
 jt+usPLmo0yKK5KDwW/SBayqXY1jLhNVfxaJeQwEVWi5r+nevL0cBq9FjwvRTXB2km6X
 rwFja/rwDbqgjBcgLtBe/ZwIC1/lbPc6qq+jLriFQ3xb3Olxk6CXFFf8f/TNt9Hdbr6l
 JFLg9qoVEHrJNBLpSNtUWSowk1v0QdnSbZw5Wq43Q8dXmEDiWW2XHxrZ82TeVzMihi54
 TVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W/YcO+y91qWpRifOToTl3r69MDdmjwxk+I8zXayPCGo=;
 b=uMDXPpFaXHwuAN4sF7RTdLen7xEaKKptFu/XZdVJhJlRgVdcuS+jgy9lzp9gnOuvpW
 4TvenaGmhfgpw7UkbhCdMhgLJwsXzQ5vO7Et6MozL/qh8MBchyvR7ZP6HQkoz8TsDBrv
 vkxEIuB87Y73a7am1ZZJYJTXLEwDIdHv3j+u7hBfe2MaTQ9pf4D0seANxiUrr9vvUXhF
 18LCcnLStuBsl2TrfymN3yaaRqF2gbd5++noCp/DDsFUF8mA9o8j3gT6pGsF/zaGSlYl
 b1nQdKxnVkUhf7zvJhgVPj0whQEZo7X0N0c32C4xqA/XdTiO0zDJiztQX486WOQJVGLf
 EAdQ==
X-Gm-Message-State: AOAM531pcnANHj0gXMU0Ok8esZbxGbewEEIkyCZFO9Sjd0T7GlTz7+08
 PwW6ifDHzI2itGB66PRH3lq0lLnHnIRP5BOONTl0Ug==
X-Google-Smtp-Source: ABdhPJy24XEIBJGL6cL3QsBINB04tx7LWVUDLVgFl8ziWNqLDc1eLGkrb4+WhkkWo+0uSW0nXmzSRJ6+eInG7S1AlDM=
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr7043877lfm.194.1598519066409; 
 Thu, 27 Aug 2020 02:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200809215104.1830206-1-linus.walleij@linaro.org>
 <20200818171020.GA2290142@ravnborg.org>
In-Reply-To: <20200818171020.GA2290142@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Aug 2020 11:04:15 +0200
Message-ID: <CACRpkdaRVpGC536iSZ9ZYcOMukd9VyAkcTwmuahQJEA3tNwuqA@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/panel: s6e63m0: Add DSI transport
To: Sam Ravnborg <sam@ravnborg.org>, Paul Cercueil <paul@crapouillou.net>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 7:10 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> How does this patchset relate to the patchset posted by Paul?
> https://lore.kernel.org/dri-devel/20200727164613.19744-1-paul@crapouillou.net/

Not much. S6E63M0 uses "spi" as it is right now and is not using
the existing DBI code.

So it would require it to start using the DBI core to begin with.
If it can. Which is kind of an orthogonal task.

What would be the defining character for it to
be "DBI"? I do see that the driver sends MIPI standard commands
over SPI. I suspect this is another standard without public specs...

> Seems that two different approcahes are used for the same type of
> problem.

This approach is based on the approach from IIO, se e.g.:
drivers/iio/accel/bmc150-accel-core.c
drivers/iio/accel/bmc150-accel.h
drivers/iio/accel/bmc150-accel-i2c.c
drivers/iio/accel/bmc150-accel-spi.c

> Is it possible to find a common solution?

I'm happy to rework it any direction. If the other patch set is going to
take time to finalize (as in: will not merge it the coming week, need to
hack and stuff) then I'd prefer to apply this so I know my display works
in v5.10. I can certainly rework it into Paul's framework when that
arrives.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
