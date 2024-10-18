Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED2A9A3FE2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 15:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4C410E936;
	Fri, 18 Oct 2024 13:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FF310E93E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 13:37:04 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e2915f00c12so2032332276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 06:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729258623; x=1729863423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXhQnSu+A17WdIVytDggYZkiucU4Rwu257I4oDCyVvY=;
 b=e6McsoZ8rmOaE2AvVMsf8nTLuPBF0H6N++A0m0QgqIIMXW7JU9RWkJdGile0T/ZtUN
 PSIaBdk8RDnVh6aPZD+ZtmZqTeXYWN4QAJI3Mhs9j9qsCTLoqzPtfuArr1tF8vNG+VKX
 dqRsdMtKVgEDgdbAJw4Fr6DQTHoZi9KM3DlkL+em0WEB0OmZDTklNOmqpXB10/001XF3
 jjO4lcLjJAoVG44Aw5wIy1nZIN7R6kzC0dwOHvvot/tJnVPIjlAjiMsdkXmRlVWOkt+b
 w8pfEyGXubN5by7+ljd3p7XD5f0OTiUoNucuTZp/oUEercvAseWM/FLivXkgzrdDP8Z9
 n0oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYJDQEXNdez4sIzq8k8brct4DE+ZReuZJ2q76uubM19kDd/xUHBQMwrgvyyyszgaZm8RzfOeeYCtU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNeQaFNlMr+bIR+n9c9SF63ndw5WwTAq1zh1bIS/+IlYAITpfm
 pXKxg5qpsynv0ExsN7NvgvcF/5E8Cpt/sVn02aG7FE5NtHtn6rEwXG6Ev8tR
X-Google-Smtp-Source: AGHT+IHjjy5fTh8W1nKnuR9NvkBBO1zlvpMpJC4S9aXqx34kQLWuxA64ZAg1DwgEuCIDXNr719n+ag==
X-Received: by 2002:a05:6902:2412:b0:e28:f6ba:b68d with SMTP id
 3f1490d57ef6-e2bb11de47bmr2132221276.5.1729258622663; 
 Fri, 18 Oct 2024 06:37:02 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e2bb03ea8e6sm320266276.61.2024.10.18.06.37.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2024 06:37:01 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6e2e508bd28so16899967b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 06:37:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtpaIdhb5VTop4+/zzBd0M6DOqpkkmrPanjfPvRoEp19PcKV4DbTcBABh5CB140RI91Jnjdw0AKok=@lists.freedesktop.org
X-Received: by 2002:a05:690c:d8a:b0:6e2:ef1:2558 with SMTP id
 00721157ae682-6e5bfbdb7a2mr20237897b3.8.1729258620427; Fri, 18 Oct 2024
 06:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
In-Reply-To: <20241018131035.GA20602@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Oct 2024 15:36:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
Message-ID: <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Greg KH <gregkh@linuxfoundation.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

CC GregKH

On Fri, Oct 18, 2024 at 3:10=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> > Each bridge instance creates up to four auxiliary devices with differen=
t
> > names.  However, their IDs are always zero, causing duplicate filename
> > errors when a system has multiple bridges:
> >
> >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_=
sn65dsi86.gpio.0'
> >
> > Fix this by using a unique instance ID per bridge instance.
>
> Isn't this something that should be handled by the AUX core ? The code
> below would otherwise need to be duplicated by all drivers, which seems
> a burden we should avoid.

According to the documentation, this is the responsibility of the caller
https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus=
.h#L81
I believe this is the same for platform devices.
See also the example at
https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus=
.h#L116

Note: the platform bus supports PLATFORM_DEVID_AUTO, but the auxiliary
bus does not.

> > Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI=
-to-eDP bridge into sub-drivers")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > /sys/bus/auxiliary/devices
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.0
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.0
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.0
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.0
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
> > =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index 9e31f750fd889745..8f6ac48aefdb70b3 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/gpio/driver.h>
> >  #include <linux/i2c.h>
> > +#include <linux/idr.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> > @@ -168,6 +169,7 @@
> >   * @pwm_enabled:  Used to track if the PWM signal is currently enabled=
.
> >   * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PW=
M.
> >   * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
> > + * @id:           Unique instance ID
> >   */
> >  struct ti_sn65dsi86 {
> >       struct auxiliary_device         *bridge_aux;
> > @@ -202,8 +204,11 @@ struct ti_sn65dsi86 {
> >       atomic_t                        pwm_pin_busy;
> >  #endif
> >       unsigned int                    pwm_refclk_freq;
> > +     int                             id;
> >  };
> >
> > +static DEFINE_IDA(ti_sn65dsi86_ida);
> > +
> >  static const struct regmap_range ti_sn65dsi86_volatile_ranges[] =3D {
> >       { .range_min =3D 0, .range_max =3D 0xFF },
> >  };
> > @@ -488,6 +493,7 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn=
65dsi86 *pdata,
> >               return -ENOMEM;
> >
> >       aux->name =3D name;
> > +     aux->id =3D pdata->id;
> >       aux->dev.parent =3D dev;
> >       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
> >       device_set_of_node_from_dev(&aux->dev, dev);
> > @@ -1889,6 +1895,13 @@ static int ti_sn65dsi86_parse_regulators(struct =
ti_sn65dsi86 *pdata)
> >                                      pdata->supplies);
> >  }
> >
> > +static void ti_sn65dsi86_devm_ida_free(void *data)
> > +{
> > +     struct ti_sn65dsi86 *pdata =3D data;
> > +
> > +     ida_free(&ti_sn65dsi86_ida, pdata->id);
> > +}
> > +
> >  static int ti_sn65dsi86_probe(struct i2c_client *client)
> >  {
> >       struct device *dev =3D &client->dev;
> > @@ -1903,6 +1916,17 @@ static int ti_sn65dsi86_probe(struct i2c_client =
*client)
> >       pdata =3D devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERN=
EL);
> >       if (!pdata)
> >               return -ENOMEM;
> > +
> > +     ret =3D ida_alloc(&ti_sn65dsi86_ida, GFP_KERNEL);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     pdata->id =3D ret;
> > +
> > +     ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_devm_ida_free,=
 pdata);
> > +     if (ret)
> > +             return ret;
> > +
> >       dev_set_drvdata(dev, pdata);
> >       pdata->dev =3D dev;
> >

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
