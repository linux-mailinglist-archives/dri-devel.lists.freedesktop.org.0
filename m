Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A003D1B9F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 04:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6249E6EB19;
	Thu, 22 Jul 2021 02:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961626EB19
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:07:55 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id o8so4051373ilf.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 19:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=90T8pVlNu5R4aARTLjIPZ2shWeZ1pN4LEYWIIMIBA/Y=;
 b=ZrcYlafSzxD0iNHz7hFfuRgsZhERE/FFxN0t89R6+5lbyxC7+FH5iiv/EwOH4RoWLg
 qvxm3vsrC/5fwcDoUGWRvEBxx+MKGXA6auS8Dr5I8xK1XsiTXuJbW7GKLUlPzTqM4W1C
 +2CrFCMeknsDB2dF9Ecr6TqMn14CNC88WEKDpWBUxKEp8Ikpmv9jmxS2x+fQIfTgAnlF
 Z91yHUNCggVbgrcsjthne/UBOvQtsFefHu7S4Vp6UhjPlx2hJH6mbx1YF4xl5AIOlIbm
 DoklVBDaXv1/Eqh3VxLyksW2y5dGQhnsR1DYubiaFaFPi9btcOoHAJ/xROeJC58fY/6f
 TCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=90T8pVlNu5R4aARTLjIPZ2shWeZ1pN4LEYWIIMIBA/Y=;
 b=d13bc1PCVg4itbshHcetFDtNkZ5dq4RTR1GZGcj83bPLX9cYaD9n3BrGctgzSfxg29
 eXWfwdY3kZCbloqdjXutCzlYcO93+7WjAe9wyFWCYhnbBJCrzviDQsTLfcX7XgN0m+S5
 gi6bPlieFZYTOEiCqvy0Z0NtyQ7NVAdcnqUMEVQa6YAA7cRwRDbGcizYBKk7+kI9FwHw
 I8iNMaRyTYEEw1jqFORuA09q3lqj2ZLY0+N/ActsYQyxa4zVfPDzPvnShbwVrIHgYvQA
 tqxvbbo/pYYTjDCwNegBvYtEQHhYvAJtSLMccix/5UeT0AAVXYtr1/QLkM4uqRuIu/mb
 d2qw==
X-Gm-Message-State: AOAM531E04TQsnhegwkduwJ8VZQLWh/FAolfLuQXKUddeQ42J8D8X+Uq
 eZoyrXL/vRp3UI8JFGbpKlU6a74MkCYSQSHyQbk=
X-Google-Smtp-Source: ABdhPJxgBytAWSHe5ssnHfJDN1qf7Ebn8LuKIIxs/cyJ1/sfTsYmEVV6WZ09Y2ktwylhbMFQIAmIrxrDCnDM1ssJyPA=
X-Received: by 2002:a92:c5c5:: with SMTP id s5mr24509368ilt.271.1626919674933; 
 Wed, 21 Jul 2021 19:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
 <8e091b9c-764d-d410-559e-3c5e25de2a3c@tronnes.org>
In-Reply-To: <8e091b9c-764d-d410-559e-3c5e25de2a3c@tronnes.org>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 22 Jul 2021 10:07:18 +0800
Message-ID: <CAL9mu0K2yLsG0MXOd4ke8N8zn7311CJ54hL-JcbocJOK+H7W9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: Add ilitek ili9341 panel driver
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf

Thanks for your time to review my patch.

On Thu, 22 Jul 2021 at 01:42, Noralf Tr=C3=B8nnes <noralf@tronnes.org> wrot=
e:
>
>
>
> Den 21.07.2021 09.41, skrev dillon.minfei@gmail.com:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > This driver combine tiny/ili9341.c mipi_dbi_interface driver
> > with mipi_dpi_interface driver, can support ili9341 with serial
> > mode or parallel rgb interface mode by register configuration.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
>
> > +static const struct of_device_id ili9341_of_match[] =3D {
> > +     {
> > +             .compatible =3D "st,sf-tc240t-9370-t",
> > +             .data =3D &ili9341_stm32f429_disco_data,
> > +     },
> > +     {
> > +             /* porting from tiny/ili9341.c
> > +              * for original mipi dbi compitable
> > +              */
> > +             .compatible =3D "adafruit,yx240qv29",
>
> I don't understand this, now there will be 2 drivers that support the
> same display?

There is no reason to create two drivers to support the same display.

To support only-dbi and dbi+dpi panel at drm/panel or drm/tiny both
fine with me.

>
> AFAICT drm/tiny/ili9341.c is just copied into this driver, is the plan
> to remove the tiny/ driver? If so I couldn't see this mentioned anywhere.

Yes, I'd like to merge the code from drm/tiny/ili9341.c to this driver
(to make a single driver to support different bus).

I have two purpose to extend the feature drm/tiny/ili9341.c

- keep compatible =3D "adafruit,yx240qv29", add bus mode dts bindings (pane=
l_bus)
  to define the interface which host wants to use. such as
panel_bus=3D"dbi" or "rgb"
  or "i80" for this case, i will add dpi code to drm/tiny/ili9341.c.

- merge tiny/ili9341.c to this driver,remove drm/tiny/ili9341.c, add
new dts compatible
  string to support other interfaces. just like what i'm doing now.

I have no idea about your plan on drm/tiny drivers, actually some of
these panels under
the diny folder can support both dbi and dbi+dpi (much faster, need
more pins). no
doubt the requirement to support dpi is always there.

What is your preference?

Thanks & Regards
Dillon

>
> Noralf.
>
> > +             .data =3D NULL,
> > +     },
> > +};
> > +MODULE_DEVICE_TABLE(of, ili9341_of_match);
