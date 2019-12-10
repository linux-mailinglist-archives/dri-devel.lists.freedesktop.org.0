Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FB4119F45
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 00:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617416E059;
	Tue, 10 Dec 2019 23:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7BB6E059
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 23:20:47 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m6so21844954ljc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 15:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bxMYogO+2cILAd+zitUGZbZCGLQCrOAsDRP5e3k6rVQ=;
 b=B3Y2CImoaC190lfOq6XttNY7roIR+T1mzhV6eVpdrJE0JIcpxIBt2c2FseQoMjtCMW
 Tj8wAtH0h7ye+c14pYGMMh3IB0G+k1PsEkxpCmAD/5NTuMOiISistbR1R/6W2JCmsDRu
 tvMJi/CTF0GlSh1bv6uHtEvx9ta0heaxKttDdmJA1OHwc4kzmfBvzE3zeTVp1ao95rtc
 tPQhS+FQ/Sj7LP6iVXYXRwWMhSKVKJQoSINZuIzt19fzWEWH/r3DIRdVrR55I1lZo5Km
 TbFkxMu+cWuseMYyPbCf1bzsW31/3Y9GG3k/nNtXpoGnCdFV9RjBsF0xsJSqhLaAXyIM
 Xo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxMYogO+2cILAd+zitUGZbZCGLQCrOAsDRP5e3k6rVQ=;
 b=S/d/l7qARMeiST+A6irUPMKqxCQkCxrAyYDlONC4swRZtRzmxva30E7oRYZHNd6HR0
 2nrKrSfm5HdK9YRSxP9dmVxWpFD9dUmDYP9ewaQeqDi8oml6OvxgsBhT66nVWdqhNZ5b
 LhKImf8ETzVlao+XSzCqb64255ItOPjwvMrKytVGsvi5HiYRmSLkPf1wAgcyZ9SV3pV3
 KsgQk7kJbXR2fWQLiLsND7TwEPLxFahZ5P3HTMbXOSJUsZcFzXLs1WgluewU09KWD0vM
 nIHOfkSC+LhVCse6zL4GxTQ8SqwoVFfONiyzOELuM5BWPjX55PdBhnUSdcyMQt4aKIbb
 phPw==
X-Gm-Message-State: APjAAAU9YEoR3zss/xeBBUN/ZOPnnzDfjmqX0ewJp7hewW7B63ZZ37QQ
 F+P+P7Hmb4F5IouzZMBqUmLDnVwxh6cHRd1+Hhnc/Q==
X-Google-Smtp-Source: APXvYqxLrGWzyGibb7Xk5kxQ1JYs3Zn8cH/pPhW8ISLmaAWEZP7YbbeXsFX788IJsAUehkAyZRRpsf9IiPxbqRnh16o=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr22055887ljg.251.1576020045843; 
 Tue, 10 Dec 2019 15:20:45 -0800 (PST)
MIME-Version: 1.0
References: <20191203123143.118487-1-linus.walleij@linaro.org>
 <87sgluy43j.fsf@belgarion.home>
In-Reply-To: <87sgluy43j.fsf@belgarion.home>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Dec 2019 00:20:34 +0100
Message-ID: <CACRpkdZS0umWreCuXXkdmwLoSVyAtwMrN21EMyqnn4LR8zkFkw@mail.gmail.com>
Subject: Re: [PATCH] backlight: corgi: Convert to use GPIO descriptors
To: Robert Jarzmik <robert.jarzmik@free.fr>
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
Cc: Andrea Adami <andrea.adami@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 8, 2019 at 9:06 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Linus Walleij <linus.walleij@linaro.org> writes:
> > @@ -525,13 +525,33 @@ static void spitz_bl_kick_battery(void)
> >       }
> >  }
> >
> > +static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
> > +     .dev_id = "spi0.1",
> How do you know the correct device name is "spi0.1" ?

With SPI devices it is always hard to know without access to the
actual hardware, so every patch is a request for testing...

I looked at arch/arm/mach-pxa/spitz.c and
it registers just one spi bus (AFAICT) with 3 chip
selects so that will be "spi0", and then
spi_register_board_info() is called with an array of 3
devices (spitz_spi_devices[]). Those are in order of
chip select so chip select 0, 1, 2. This is the second
device so chip select 1.

The code in drivers/spi/spi.c names the devices
using spi_dev_set_name() like this:
dev_set_name(&spi->dev, "%s.%u", dev_name(&spi->controller->dev),
                     spi->chip_select);

So it will theoretically "spi0.1"

Beware about bugs in the above interpreter because it is
just my brain.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
