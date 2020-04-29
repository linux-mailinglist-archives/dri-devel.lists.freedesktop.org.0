Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9711BDB3B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 13:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028F36E03C;
	Wed, 29 Apr 2020 11:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41756E03C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 11:59:05 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u15so2319914ljd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aVijcxkl8RFme68KtxGbh85pzIB5ijVxKk+a09Un+iw=;
 b=IPeMj/JsiV4qquGk48mM7p/KuqRhbASEDpvvaKlgkEwerVBnGW4aqgA040wNnQ1r7e
 W/vzybo4Jf3XD21y2f2kAZ/eDgn7Sdk9GRQ8GjesRxf0xdft/QebmpCP6CaXClCPux2l
 3S9RPqjykKQAkN1qszzCmnHdy2MUkT9lsSNI7iFOaWcojEE2UVolGAiGrz1O2W7hkjiK
 mz8G/dF8OHL+EQUNVrH85bj1gZhsmHmKeOWxpbMPx/SKv1/KB/3YOLNmjxF6odJDSgsJ
 ASJ68ORqoLvHJpH25ccvtqJJ9ZtLZNKWPSf5ko8ShsZQnNMm5I+3sh8S2/ZUG85o6m8i
 MgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aVijcxkl8RFme68KtxGbh85pzIB5ijVxKk+a09Un+iw=;
 b=BudE/XkwsT40zSwhFAAvyXfjtc0DZVnY6xBkv31SV6DFK5JeoX7JDu3Jc53vQ80mQ5
 c+omrlENN5pKtL9L3ZbOq612B+phRigubxozaALI7w4YcBwbfv1Rnpm94T1UUU538udL
 vkmrbnrgC6MguqTkCj3rHQqCX4iyeZzvl8QAqDWauG3haw2ZWxWRoXmfTGaMiNJlMCQU
 tZET+hdtW2tN6j0rU4L/k6Chxzyq1p2hPi/FM+eewbuRY7cFv/iEgxgpowWYbZOAGRes
 qGI+VLIpTIa+umma5N/igcdWUPobhjENo5iDLpuESTUIuW6w/VVoZkoJc6aLmRnZNKR6
 bh/A==
X-Gm-Message-State: AGi0PuZFXLbBlsZGEsT1NHPc80s8reQpvZeapGnpez9nobI8CmknaIGe
 ZXB3+LeiZTpR4tCkGeAO9Jkp6ZPAcfMYNSc0O8OChg==
X-Google-Smtp-Source: APiQypJ0eCh+mVOekbEC0Cgc8V24te5/UeNEvaBTJ9GyT6+wXKvMtHnJPxbe0msg6agOBSnYW1BGf/tp2RvlmLmGsBE=
X-Received: by 2002:a05:651c:1058:: with SMTP id
 x24mr21524322ljm.39.1588161544192; 
 Wed, 29 Apr 2020 04:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200429082631.925461-1-linus.walleij@linaro.org>
 <20200429113305.tl35n2uws3hoxgvt@holly.lan>
In-Reply-To: <20200429113305.tl35n2uws3hoxgvt@holly.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Apr 2020 13:58:53 +0200
Message-ID: <CACRpkdZYMd+0aecr-NFGcJHyCdJoX0Bj+3eOyAPvZqENPC5rcw@mail.gmail.com>
Subject: Re: [PATCH] backlight: lms283gf05: Convert to GPIO descriptors
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Jingoo Han <jingoohan1@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 1:33 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
> On Wed, Apr 29, 2020 at 10:26:31AM +0200, Linus Walleij wrote:

> > -     if (pdata != NULL) {
> > -             ret = devm_gpio_request_one(&spi->dev, pdata->reset_gpio,
> > -                             GPIOF_DIR_OUT | (!pdata->reset_inverted ?
> > -                             GPIOF_INIT_HIGH : GPIOF_INIT_LOW),
> > -                             "LMS283GF05 RESET");
> > -             if (ret)
> > -                     return ret;
> > -     }
> > +     st->reset = gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_HIGH);
>
> Isn't this a change of behaviour w.r.t. to the initial state of the pin?

Yeah you're right. The original author intended reset to be
de-asserted here so it should be GPIOD_OUT_LOW.

> To be honest I suspect it is harmless because we launch into the reset
> sequence shortly after anyway. More that that I think I prefer it this
> way since it is better aligned with the behaviour of
> lms283gf05_power_set().
>
> However if it is an intentional change of behaviour then it would be
> good to spell that out in the description for the benefit of future
> archaeologists.

Hm I'd rather not change semantics actually, you never know.
I'll switch it back. If we decide to change it I'd use GPIOD_ASIS
and not touch the hardware here.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
