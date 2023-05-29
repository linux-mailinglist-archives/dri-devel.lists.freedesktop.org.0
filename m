Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D0B714BB7
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A2A10E2BF;
	Mon, 29 May 2023 14:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305EF10E215
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:02:34 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f3b9e54338so3306858e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 00:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1685343753; x=1687935753; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cJB5+P4xgPilKMJQyTk3eAPDV8GpHyt2fP+7h44nDNs=;
 b=FGhKiz8dBWwr9/+R+reQipeYxNB1gcmYsJ7bZbWgP8vpD+0Js4lgYwersF0bhlBFfx
 AoBv3t60BEjDsQ+//F6gNfJL7TKCuKtbj0JZY91qkazqTzob+IFBzGrNq5fvEJgkX67W
 y+qzGQyohlsogF2BSjAWqXcmUTFY4fEXNADyl2U7gc1c+xNSymu2Tu9tPcquM7DB6a6L
 riSRw20OAF0VAmq08GHr9Kr2aUzUiKiaI/5QFnc7BO7OqnJgspihpwvULSi1tTJvEBf/
 f24Gl6irXXG2dDmzNTQUJOdBeI0zsO6HQViONoOYQkZZs1g9+txWx4YM53xWgvRg43Os
 Z0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685343753; x=1687935753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cJB5+P4xgPilKMJQyTk3eAPDV8GpHyt2fP+7h44nDNs=;
 b=bhPhSQ0ogtj99B8/nJZ3i7J1N7Oos2+c/twB5lq60TOYy0lhidmG+n5YRTdcZMYPTa
 oDuvdfAXM7QPtxWnrdXABMYZ4EipBFHFX8Cxq04hsY/IAstdmesNDCSAw1kQ8IyO9pjU
 ZSA/mZuc24c1/JB+2kyw1NaW78Eqqj1hBnWV5VyJnTp1OjGbKa6TbhjNDjJoVNxV3X7L
 /lcg5VoN9Gq3NSoxQr9kp9Th90cVcac+znMO7FIS0yfP5xrZHqIlNPyAUBEXNXePaYDS
 4q5ArFLFR/hfZGTc1xWCqv+cShTlr15qOyy1CwSiy52jVQfo3USAbVyiflaGsH1oUQ9E
 npiQ==
X-Gm-Message-State: AC+VfDyJ2u/V2p5nQKdjzT597rAdWYuiGlgBfJu2mTMnaYqOHrYuDkwP
 +NxKRPmuGw+092KP7RCnB6NKjGp/uiMvrX9sK0I+1A==
X-Google-Smtp-Source: ACHHUZ6dy/tVjeBZf9nbJfVYzPM3W/IXKBY1aEH8eswJWC6FweeAzZtsDZnpj8P70hH4TPm2Olzs1bvP+3NW6NNxhSE=
X-Received: by 2002:a05:6512:40b:b0:4f4:d710:12d4 with SMTP id
 u11-20020a056512040b00b004f4d71012d4mr3426221lfk.17.1685343752776; Mon, 29
 May 2023 00:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230519200520.10657-1-alex@shruggie.ro>
 <d7fc3df2-aae7-d3b2-ea29-14d266289d1d@foss.st.com>
In-Reply-To: <d7fc3df2-aae7-d3b2-ea29-14d266289d1d@foss.st.com>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Mon, 29 May 2023 10:02:21 +0300
Message-ID: <CAH3L5Qo51dVV_FsYTLKNcmYL5VbD+9S54VYuNbhZUunHOTi_aA@mail.gmail.com>
Subject: Re: [PATCH 1/2] backlight: gpio_backlight: add new property
 default-brightness-level
To: Philippe CORNU <philippe.cornu@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 29 May 2023 14:08:20 +0000
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, pavel@ucw.cz, daniel.thompson@linaro.org,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 3:04=E2=80=AFPM Philippe CORNU
<philippe.cornu@foss.st.com> wrote:
>
>
> On 5/19/23 22:05, Alexandru Ardelean wrote:
> > From: Yannick Fertre <yannick.fertre@foss.st.com>
> >
> > Add new property to set a brightness by default at probe.
> >
> > Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>
>
> Hi Alexandru,
>
> Many thanks for your patch.
>
> You have sent a patch originally pushed on the STMicroelectronics github
> as mentioned in your commit message (no problem with that :-). But, the
> "Reviewed-by" inside this github patch is linked to our gerrit STM
> internal server so you can not use it directly for mainlining this patch.
>
> So please, re-send your this patch without my "Reviewed-by".

ack
will do

>
> Many thanks
> Philippe :-)
>
>
> > Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >
> > Link to original patch:
> >    https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa1=
4ffd49892c4ce663cdafe98
> >
> >   drivers/video/backlight/gpio_backlight.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/b=
acklight/gpio_backlight.c
> > index 6f78d928f054..d3fa3a8bef4d 100644
> > --- a/drivers/video/backlight/gpio_backlight.c
> > +++ b/drivers/video/backlight/gpio_backlight.c
> > @@ -53,6 +53,7 @@ static int gpio_backlight_probe(struct platform_devic=
e *pdev)
> >       struct backlight_device *bl;
> >       struct gpio_backlight *gbl;
> >       int ret, init_brightness, def_value;
> > +     u32 value;
> >
> >       gbl =3D devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
> >       if (gbl =3D=3D NULL)
> > @@ -93,7 +94,11 @@ static int gpio_backlight_probe(struct platform_devi=
ce *pdev)
> >       else
> >               bl->props.power =3D FB_BLANK_UNBLANK;
> >
> > -     bl->props.brightness =3D 1;
> > +     ret =3D device_property_read_u32(dev, "default-brightness-level",=
 &value);
> > +     if (!ret && value <=3D props.max_brightness)
> > +             bl->props.brightness =3D value;
> > +     else
> > +             bl->props.brightness =3D 1;
> >
> >       init_brightness =3D backlight_get_brightness(bl);
> >       ret =3D gpiod_direction_output(gbl->gpiod, init_brightness);
