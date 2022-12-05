Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED85C642B97
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 16:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610F910E23D;
	Mon,  5 Dec 2022 15:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0950910E23D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 15:25:53 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qk9so10904491ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 07:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTJwoP5lG4Epq30dmXniWxiUN6BJbqz5YEza2fXmANY=;
 b=mFdsqee89kncMviuE6OeVl4OrSJuG1WCQGLbWlN3sjX+4ZIz46ZeeSlaI/8x7Z31S9
 vPrsVP+urGFWd4EUahl0Q2IcJkC5EhycvZ1hkIBEiWIvjtCZs7gq0KvU8tWEJy74Q/E4
 Ezo0BACdRUfhjD1jSp+qiNYfd1QA4kH2ica4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTJwoP5lG4Epq30dmXniWxiUN6BJbqz5YEza2fXmANY=;
 b=QZpiELIqQ1I7YN5ThnMtL93vQUCEMM6G8YPRRTDsK7jQiGv1HdbEu+L9Vqn0q3CGxj
 s9bEIDWsGKltXCLrZgAUMG1HeDGIBFLvoy6rgyymy79CVYqvyIeyRTgTCiJL7Pt2zb5g
 rw24Q5mCA6DH/hAot8Qa1mGJAc8EDMipROfIvpVfloo86uwTl7FdJBoH559X5BEv0bKy
 ZV0Z5GAldg4G4B8w2+EnJ1mGzlnjntI0A7lqijJgBcrenqeXziXLv7+GZuhnYuXM05JV
 0eqN0AHeoJTQQMSxWB0trhn6S0X10JYfwbBQI9/ZRIiNaEmUV1O6zDMtQ3BxUznqL7af
 ceOA==
X-Gm-Message-State: ANoB5pnkLCCxRQyqk0RjeEf4nNkicBQF6iJhn9ghEWIYx1TYk/FYEYa5
 AIm2RoSlpFJ1fMQtMPDI4K0tCOKOZOpW/EPMj94=
X-Google-Smtp-Source: AA0mqf5xPNnbb0tmg82VYAkiTV2DaCbTzWIdjNMmRetpZQ3BZgZbsySlGFdRnTWt4sYy8cAatTdafg==
X-Received: by 2002:a17:906:1cda:b0:7c0:b9cc:2a60 with SMTP id
 i26-20020a1709061cda00b007c0b9cc2a60mr14164162ejh.362.1670253951303; 
 Mon, 05 Dec 2022 07:25:51 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 r17-20020a17090609d100b007bd28b50305sm6269650eje.200.2022.12.05.07.25.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 07:25:49 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so12007151wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 07:25:49 -0800 (PST)
X-Received: by 2002:a05:600c:1e12:b0:3cf:9ad3:a20e with SMTP id
 ay18-20020a05600c1e1200b003cf9ad3a20emr50907306wmb.151.1670253948745; Mon, 05
 Dec 2022 07:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-4-u.kleine-koenig@pengutronix.de>
 <20221204210940.qygblu244zvlenxz@pengutronix.de>
In-Reply-To: <20221204210940.qygblu244zvlenxz@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Dec 2022 07:25:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XEpf1N7dwXffw94e0QR-oZU0anto1A3QeRgoURsGVehA@mail.gmail.com>
Message-ID: <CAD=FV=XEpf1N7dwXffw94e0QR-oZU0anto1A3QeRgoURsGVehA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] drm/bridge: ti-sn65dsi86: Propagate errors in
 .get_state() to the caller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Maxime Ripard <maxime@cerno.tech>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-pwm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Dec 4, 2022 at 1:09 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> my initial Cc-list wasn't optimal. So I added a few people here.
>
> On Wed, Nov 30, 2022 at 04:21:40PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > .get_state() can return an error indication. Make use of it to propagat=
e
> > failing hardware accesses.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index 6826d2423ae9..9671071490d8 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -1512,19 +1512,19 @@ static int ti_sn_pwm_get_state(struct pwm_chip =
*chip, struct pwm_device *pwm,
> >
> >       ret =3D regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv=
);
> >       if (ret)
> > -             return 0;
> > +             return ret;
> >
> >       ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &sca=
le);
> >       if (ret)
> > -             return 0;
> > +             return ret;
> >
> >       ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight=
);
> >       if (ret)
> > -             return 0;
> > +             return ret;
> >
> >       ret =3D regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
> >       if (ret)
> > -             return 0;
> > +             return ret;
> >
> >       state->enabled =3D FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
> >       if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
>
> It would be great to get an Ack to take this patch and patch #1 via the
> PWM tree. (Both got an Ack by Douglas Anderson, I'm unsure if that is
> already enough.)

I'm probably the main person who reviews patches to ti-sn65dsi86.c
these days and I'm also typically the one landing patches, but
officially this driver goes through "drm-misc". IMO it's fine for this
to go through your tree and that's what I intended by my Ack. It seems
highly unlikely to cause any merge conflicts. That being said, since
we're drm-misc it means that the "adults" in the room (the ones who
have to deal with fallout if there are merge conflicts) are supposed
to be "Daniel, Jani and Sean" according to the docs [1].  ...though it
seems like the drm-misc-next pull requests these days come from
Maxime, so maybe he would be the right person to confirm that it could
go through your tree?

[1] https://people.freedesktop.org/~jani/html/drm-misc.html#
