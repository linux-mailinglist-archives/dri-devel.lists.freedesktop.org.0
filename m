Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F375B42E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 18:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156E410E5E3;
	Thu, 20 Jul 2023 16:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCDD10E5E3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 16:29:04 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso15441391fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689870543; x=1690475343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ocSaHX5NIVFNKYOsfv6n0BEBaxKRDPz0bQ1Rbnsgza0=;
 b=mpxA7JkBj7jv1YVESB2ckxNUJcbRn22fEA0Jt09Oc9l3ibYw+ondIl8GseInFHhKsa
 LeYX0PQppKzyQtELehqZgaU8ouenxWto3oAzXI/94CCi/2L3DKNAtlj0+IXG6ySgYAlI
 8Yv75xKwwNy11tuj5/6WnHqgRqdcGP940Iz5wkO0iqtCQKAg6kDJt/gR7/Izd7Z8A3q8
 KmcSaPZ4ZKjhtXZW7ZIkDOcCcOVhEXflJQek0j8b1LU+/nbwV8/KYp1+qOy4Ph13m0vK
 FnH6qIuLD27RUDxhT/KmsXHT7TzzZSQULB3yZ8d1noJ6p+u9QOp7P+mW9jgyk5RqzX7A
 wliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689870543; x=1690475343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ocSaHX5NIVFNKYOsfv6n0BEBaxKRDPz0bQ1Rbnsgza0=;
 b=Re8krxWPZmYZpmKm1z12u+yTKcRc8Qveu2PwfoPXB6Mw/XjmcslR15Vr7BbPV8COOp
 JnVgsugHkE4wbE5rdxEHU2cOnVdfQdRrPxrAIJdeO9BYG7MAOS6Ge0rR55NvVABwL7LX
 4o/K06goaASSDcn5+TUeTmfecZSxxelmaamDAVBiXwLGOZNEMa0a+Blpoqi7+TIOlCIK
 o8IpZFAXmfcOfRMS2xr6+twPoIlgagAgi3kA6/xNvjjJk7TqwgevczEa2Vf5y4IVCNOb
 0OR5rP4eWPM/5ipxfi4GBGAklx9VyvXw15/Rk6OGAn3DsmgB+M2QdvkxqPXa/+jf3a86
 BhNw==
X-Gm-Message-State: ABy/qLY3sy3UI5O2B+lGqtTLs+qzFJSv8NIvNn1aqcrrGuB93wUtFbIJ
 rJR0RdziNvIjKbWssPR1uBe0TFUoYKlihFUKuA4=
X-Google-Smtp-Source: APBJJlECZqwpsuvvsnL5OMKuLs00FpsDWt0kR1bFClLwdqeW+ShzMPTJAas1gJeKMsPx8ihKs6Tx3kyhZzIqiVctg/8=
X-Received: by 2002:a2e:3203:0:b0:2b6:e105:6174 with SMTP id
 y3-20020a2e3203000000b002b6e1056174mr2751836ljy.47.1689870542887; Thu, 20 Jul
 2023 09:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230720061105.154821-1-victor.liu@nxp.com>
 <20230720112742.GA2525277@aspen.lan>
In-Reply-To: <20230720112742.GA2525277@aspen.lan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Jul 2023 19:28:26 +0300
Message-ID: <CAHp75Vdw_-nKUdNm0TNRnMFLhUEoFAtTpt4ApVNmeHFOi_16Xg@mail.gmail.com>
Subject: Re: [PATCH] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
To: Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andy Shevchenko <andy@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Ying Liu <victor.liu@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "deller@gmx.de" <deller@gmx.de>, "lee@kernel.org" <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 2:27=E2=80=AFPM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Jul 20, 2023 at 06:06:27AM +0000, Ying Liu wrote:
> > Bootloader may leave gpio direction as input and gpio value as logical =
low.
> > It hints that initial backlight power state should be FB_BLANK_POWERDOW=
N
> > since the gpio value is literally logical low.
>
> To be honest this probably "hints" that the bootloader simply didn't
> consider the backlight at all :-) . I'd rather the patch description
> focus on what circumstances lead to the current code making a bad
> decision. More like:
>
>   If the GPIO pin is in the input state but the backlight is currently
>   off due to default pull downs then ...
>
> > So, let's drop output gpio
> > direction check and only check gpio value to set the initial power stat=
e.
>
> This check was specifically added by Bartosz so I'd be interested in his
> opinion of this change (especially since he is now a GPIO maintainer)!
>
> What motivates (or motivated) the need to check the direction rather
> than just read that current logic level on the pin?

...

> > -     else if (gpiod_get_direction(gbl->gpiod) =3D=3D 0 &&
> > -              gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
> > +     else if (gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
> >               bl->props.power =3D FB_BLANK_POWERDOWN;

The code before this patch needs a bit of elaboration. There is no
prohibition on reading value for the pin that is in any direction.
I.o.w. if the direction here is a problem it should have been
configured beforehand.

--=20
With Best Regards,
Andy Shevchenko
