Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2F44419B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 13:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6534072E8E;
	Wed,  3 Nov 2021 12:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D9172E8E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 12:32:50 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id k1so2315682ilo.7
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 05:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tDdYp1cUnzplnw8xIPr07k5DnDOdOwaeISoz7QL9yx0=;
 b=JDrX1rqTut67mHyiDD55M7whnH4nzQ4v9Zb05BvlLbymXMVBtKR9whNpcPmwxMaYsw
 mc3JPmDaupFPjd+psSBTGwZ4woU42baz+lpyR+8Y+Knn+UArvVp7DUBcU2uvrqR92zo3
 a9mnlsA2WNzAPA+hQGU08xficIzDH7gMbO19zQ+ENYXABu8YIn6DApnrq12AoEOsG9Ry
 RKg+C6/MoNQzcnM7ZOOxg6orfZ4/7D21XJTNNzff0aoDs120MXaaxo/ocWxySelEHhRR
 YRBdDmuDsJP+ClFYcxafj0Scxb+uM6ulz7G2FUOVcfbXLF9SJGT5ayQ28HKv4HnFjCbB
 hMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tDdYp1cUnzplnw8xIPr07k5DnDOdOwaeISoz7QL9yx0=;
 b=2g6YRSDS7dFR5b8dQLfWY4GDqVFlRXMMcd1Ch/u9ihZbbu/d6nKf09fhQ60lsNgHnH
 lj1M8cCDetm4fCWC5WDI+YB1YHM00qF5rLrLNjiqBHOPSpSWUp4YU/9Rda3PKSBMcu6E
 /xNXqLqI1A5u1MjBpNGPnS7AzeuHTbP+t/o9ccJVgP7ng0WvX1Fg65/LCwS5vs9meqad
 B8AY22o0ZoShngyzqkpI5G+J/bpgkHxKfjgw9OarGnp9CJfLC3rWWS0pvqDr15acLqIg
 py4N4CCfE0cvQIyEo0m+nXdG/dTaUzdqLnKFfuWuWfGnmIaTUKozD+zWWkzL3y3C1mor
 iHBQ==
X-Gm-Message-State: AOAM533HoHK9LNY3gy1SNReGv50Uqhj1ub3wEGBd2n1Itl06kH6EOuUu
 zF0Ptvy6G9uscyVh3po3jMSVLp+79Eihzg04DD8nnw==
X-Google-Smtp-Source: ABdhPJyqczhhuSEjdk42q4884tP/2XraLAkEL5KVvM/Y3XOAJo7ixOsXUZsUGoMHtEfn7Mpjr0KOfXmDwAngG9O55F0=
X-Received: by 2002:a05:6e02:1bcb:: with SMTP id
 x11mr24928470ilv.94.1635942769924; 
 Wed, 03 Nov 2021 05:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <YX1KCclMB/HTZ22c@fedora>
 <CAMuHMdW5thqxWz37er3BHwqee_agvhHVDK5p8Hrx7HCKOdFjLA@mail.gmail.com>
In-Reply-To: <CAMuHMdW5thqxWz37er3BHwqee_agvhHVDK5p8Hrx7HCKOdFjLA@mail.gmail.com>
From: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Date: Wed, 3 Nov 2021 09:32:38 -0300
Message-ID: <CAH7FV3mKnigzrA42NYEweiphOaYbr2gjhR=VLVzwmxJ+oSpwOw@mail.gmail.com>
Subject: Re: [PATCH v3] backlight: lp855x: Switch to atomic PWM API
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em ter., 2 de nov. de 2021 =C3=A0s 05:39, Geert Uytterhoeven
<geert@linux-m68k.org> escreveu:
>
> Hi Ma=C3=ADra,
>
> On Sat, Oct 30, 2021 at 3:35 PM Ma=C3=ADra Canal <maira.canal@usp.br> wro=
te:
> > Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
> > replace it for the atomic PWM API.
> >
> > Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
>
> Thanks for your patch!
>
> > --- a/drivers/video/backlight/lp855x_bl.c
> > +++ b/drivers/video/backlight/lp855x_bl.c
> > @@ -233,9 +233,8 @@ static int lp855x_configure(struct lp855x *lp)
> >
> >  static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
> >  {
> > -       unsigned int period =3D lp->pdata->period_ns;
> > -       unsigned int duty =3D br * period / max_br;
> > -       struct pwm_device *pwm;
> > +       struct pwm_device *pwm =3D NULL;
> > +       struct pwm_state state;
> >
> >         /* request pwm device with the consumer name */
> >         if (!lp->pwm) {
> > @@ -245,18 +244,16 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, in=
t br, int max_br)
> >
> >                 lp->pwm =3D pwm;
> >
> > -               /*
> > -                * FIXME: pwm_apply_args() should be removed when switc=
hing to
> > -                * the atomic PWM API.
> > -                */
> > -               pwm_apply_args(pwm);
> > +               pwm_init_state(lp->pwm, &state);
> > +               state.period =3D lp->pdata->period_ns;
> >         }
> >
> > -       pwm_config(lp->pwm, duty, period);
> > -       if (duty)
> > -               pwm_enable(lp->pwm);
> > -       else
> > -               pwm_disable(lp->pwm);
> > +       pwm_get_state(lp->pwm, &state);
> > +
> > +       state.duty_cycle =3D br * state.period / max_br;
>
> Above is a 64-by-32 division, which should not be open-coded, as
> that will cause link failures on 32-bit platform (cfr. "undefined
> reference to `__udivdi3'", as reported by the kernel test robot).
> Please use div_u64() instead.

Hi Geert,

Thank you for the suggestion! I fixed this problem a bit differently
and submitted the v4. I made use of the PWM API and applied the
pwm_set_relative_duty_cycle function, which solved this division
problem.

>
> > +       state.enabled =3D state.duty_cycle;
> > +
> > +       pwm_apply_state(lp->pwm, &state);
> >  }
> >
> >  static int lp855x_bl_update_status(struct backlight_device *bl)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
