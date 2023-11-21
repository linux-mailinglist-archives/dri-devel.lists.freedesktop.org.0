Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9F7F3216
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 16:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E5C10E4DF;
	Tue, 21 Nov 2023 15:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E2D10E4DD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 15:16:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a02d12a2444so71692866b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 07:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700579770; x=1701184570;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWrMwoT0xATigsoxyGO5GWTJCAnmKZt5B07C02bK/Eo=;
 b=Wt1t/vhFKczw9j9mzNT3b9M7YjJ3Fb8RAknAj65pX5ZC5mjpx17ePKSfWX/LrB8UWm
 nApJ6r8I6/ICcuiD4uNSDYbo/FJHLPTNuRwm9VjDlRcLPhST1hQUh9TramToGhE3Bvrl
 K/hYW5QechVmJTyygevdKwktZ0a/te4bAeMwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700579770; x=1701184570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZWrMwoT0xATigsoxyGO5GWTJCAnmKZt5B07C02bK/Eo=;
 b=an4tVY4k4hgO0To7JQHDAUmrF+EEcSon2HhWI2bKIo/DNDi8qbneCbY9ynYdizDHth
 PQcs9m1rbqI6QMWDc67L4BgwxcvWeDrwWl6JvV720b+j3uyLQCPngw/x90jCUD7n3jZy
 QS1tL6z9Xduhq2QKzUb5vV2J4DmIIGiZmCjSfred54SyMiauhWYZmrpzRT4+ZcZ+F435
 ToBNnzFTPoERnVljHp3rRtQY7vuSr7tI010h8XP2iDSNU1MeSN/W7S4mYoZNk/OE6thV
 cyi1XCQQ4DeMa6rVMq8CTouB+MIteHfI7+h59/ZvR26fiAaPEHgyDlL5Yv07iTvLxQnP
 zhlg==
X-Gm-Message-State: AOJu0YxwHa3MDqT6UpwkUbujdLlcd379AeeLH9v+Sv/RlAbbnQjq7jKG
 TmUZRT4nVDwz8pAl+1z3Bi04d0YhOiOVvQ/v1esv7AyV
X-Google-Smtp-Source: AGHT+IGK6R9YV11Z0miiQnVVB3DJgzkAGLW7Sjuhoc+6HanQQH4U9+liDCiqpwwhyBRcN9DJWk/aVg==
X-Received: by 2002:a17:906:518d:b0:a02:d91:d42f with SMTP id
 y13-20020a170906518d00b00a020d91d42fmr1481292ejk.56.1700579770568; 
 Tue, 21 Nov 2023 07:16:10 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 g25-20020a170906349900b009fd541851f4sm2997376ejb.198.2023.11.21.07.16.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 07:16:10 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40b2993e167so48195e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 07:16:09 -0800 (PST)
X-Received: by 2002:a05:600c:518a:b0:405:320a:44f9 with SMTP id
 fa10-20020a05600c518a00b00405320a44f9mr898wmb.5.1700579769077; Tue, 21 Nov
 2023 07:16:09 -0800 (PST)
MIME-Version: 1.0
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-102-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231121134901.208535-102-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Nov 2023 07:15:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vz7TuUH=U8t0XVhj5rzoci9KBjSZXJruMQyXiARY+Z_Q@mail.gmail.com>
Message-ID: <CAD=FV=Vz7TuUH=U8t0XVhj5rzoci9KBjSZXJruMQyXiARY+Z_Q@mail.gmail.com>
Subject: Re: [PATCH v3 101/108] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Nov 21, 2023 at 5:52=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> This prepares the pwm driver of the ti-sn65dsi86 to further changes of
> the pwm core outlined in the commit introducing devm_pwmchip_alloc().
> There is no intended semantical change and the driver should behave as
> before.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index c45c07840f64..cd40530ffd71 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -197,7 +197,7 @@ struct ti_sn65dsi86 {
>         DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>  #endif
>  #if defined(CONFIG_PWM)
> -       struct pwm_chip                 pchip;
> +       struct pwm_chip                 *pchip;
>         bool                            pwm_enabled;
>         atomic_t                        pwm_pin_busy;
>  #endif
> @@ -1372,7 +1372,8 @@ static void ti_sn_pwm_pin_release(struct ti_sn65dsi=
86 *pdata)
>
>  static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *ch=
ip)
>  {
> -       return container_of(chip, struct ti_sn65dsi86, pchip);
> +       struct ti_sn65dsi86 **pdata =3D pwmchip_priv(chip);
> +       return *pdata;
>  }
>
>  static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *p=
wm)
> @@ -1585,22 +1586,28 @@ static const struct pwm_ops ti_sn_pwm_ops =3D {
>  static int ti_sn_pwm_probe(struct auxiliary_device *adev,
>                            const struct auxiliary_device_id *id)
>  {
> +       struct pwm_chip *chip;
>         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.parent);
>
> -       pdata->pchip.dev =3D pdata->dev;
> -       pdata->pchip.ops =3D &ti_sn_pwm_ops;
> -       pdata->pchip.npwm =3D 1;
> -       pdata->pchip.of_xlate =3D of_pwm_single_xlate;
> -       pdata->pchip.of_pwm_n_cells =3D 1;
> +       /* XXX: should this better use adev->dev instead of pdata->dev? *=
/
> +       pdata->pchip =3D chip =3D devm_pwmchip_alloc(pdata->dev, 1, sizeo=
f(&pdata));

Yes, it should be "adev->dev". See recent commits like commit
7b821db95140 ("drm/bridge: ti-sn65dsi86: Associate DSI device lifetime
with auxiliary device").

I also think the size you're passing is technically wrong. The private
data you're storing is a pointer to a "struct ti_sn65dsi86". The size
of that is "sizeof(pdata)", not "sizeof(&pdata)".

Other than the above, this looks OK to me. Once the dependencies are
in I'd be happy to apply this to drm-misc. I could also "Ack" it for
landing in other trees and I _think_ that would be OK (the driver
isn't changing much and it's unlikely to cause conflicts), though
technically the Ack would be more legit from one of the drm-misc
maintainers [1].

[1] https://drm.pages.freedesktop.org/maintainer-tools/repositories.html?hi=
ghlight=3Dmaxime#the-drm-misc-repository
