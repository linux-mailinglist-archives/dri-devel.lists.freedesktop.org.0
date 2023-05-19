Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43D709739
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 14:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A78B10E090;
	Fri, 19 May 2023 12:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AB010E090
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 12:29:46 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-ba8253f635cso4619299276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 05:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684499385; x=1687091385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2rjFEhE9nqYpWNzWZU8ZC8ez1/dbrPmPVy1nPH0KVOg=;
 b=Xf1DbeAQh32ppH4IQY95UQI7+T4TJ9Nh2kUGA0OHPuQMWSDHSu8skDOX1hdaC6AvL5
 DJANt7kiPM92I2Og9ElgqlklN3Bw6smlQf1zji2rOMaSGBovlfADZ5xIZ359GIS3YyEF
 ViZUdJz28bxPIW72q/iPUzbX7kuQbhlBcD0Zr6prfzUSqE29opA4RBCw8zu9n0JvDFTM
 HK8ZiUpPfj2iuDkVykesWg0WUHz0IoT9Xkr9n2HlabyDbh8WEhZUeJuppFiCcOPDA+Pq
 U091o2muOHN4TxkmcvYNtcEq2uPwjH8WrDJ1B4mlR94mkbvyjXbvSI9QAIl37igc5uNe
 7Mpg==
X-Gm-Message-State: AC+VfDzm3SnJaz5mwPQM7L2fiAMVp0snwfT6lvdR4h0xmHTU6ne17FO3
 7r30kY9TwbE+8V3Mcfj5F4FITluYcMIIOA==
X-Google-Smtp-Source: ACHHUZ4L9Bug68Fs9uvAYW+R1DRytajL5Nb3WeoTnXlkGxX1RurpnVVJMlrdRedsAC36UZd6+jPQbg==
X-Received: by 2002:a25:5804:0:b0:ba8:1e3b:292f with SMTP id
 m4-20020a255804000000b00ba81e3b292fmr1060769ybb.41.1684499384587; 
 Fri, 19 May 2023 05:29:44 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 v144-20020a252f96000000b00b8f51af1364sm1004399ybv.53.2023.05.19.05.29.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 05:29:43 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-ba81ded8d3eso4596632276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 05:29:42 -0700 (PDT)
X-Received: by 2002:a0d:d141:0:b0:55d:8768:4081 with SMTP id
 t62-20020a0dd141000000b0055d87684081mr2075196ywd.7.1684499382327; Fri, 19 May
 2023 05:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518113643.420806-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 May 2023 14:29:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHZqwW8e9zCZgx2mTBP_Tzcuswo04fxw-DCo__NDFS1w@mail.gmail.com>
Message-ID: <CAMuHMdVHZqwW8e9zCZgx2mTBP_Tzcuswo04fxw-DCo__NDFS1w@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] i2c: Enhance i2c_new_ancillary_device API
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Antonio Borneo <antonio.borneo@foss.st.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 linux-renesas-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Thu, May 18, 2023 at 1:37=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Renesas PMIC RAA215300 exposes two separate i2c devices, one for the main
> device and another for rtc device.
>
> Enhance i2c_new_ancillary_device() to instantiate a real device.
> (eg: Instantiate rtc device from PMIC driver)
>
> Added helper function __i2c_new_dummy_device to share the code
> between i2c_new_dummy_device and i2c_new_ancillary_device().
>
> Also added helper function __i2c_new_client_device() to pass parent dev
> parameter, so that the ancillary device can assign its parent during
> creation.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped Rb tag from Geert as there are new changes.
>  * Introduced __i2c_new_dummy_device() to share the code between
>    i2c_new_dummy_device and i2c_new_ancillary_device().
>  * Introduced __i2c_new_client_device() to pass parent dev
>    parameter, so that the ancillary device can assign its parent during
>    creation.

Thanks for the update!

LGTM, a few minor comments below.

> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -893,24 +893,10 @@ int i2c_dev_irq_from_resources(const struct resourc=
e *resources,
>         return 0;
>  }
>
> -/**
> - * i2c_new_client_device - instantiate an i2c device
> - * @adap: the adapter managing the device
> - * @info: describes one I2C device; bus_num is ignored
> - * Context: can sleep
> - *
> - * Create an i2c device. Binding is handled through driver model
> - * probe()/remove() methods.  A driver may be bound to this device when =
we
> - * return from this function, or any later moment (e.g. maybe hotpluggin=
g will
> - * load the driver module).  This call is not appropriate for use by mai=
nboard
> - * initialization logic, which usually runs during an arch_initcall() lo=
ng
> - * before any i2c_adapter could exist.
> - *
> - * This returns the new i2c client, which may be saved for later use wit=
h
> - * i2c_unregister_device(); or an ERR_PTR to describe the error.
> - */
> -struct i2c_client *
> -i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info co=
nst *info)
> +static struct i2c_client *
> +__i2c_new_client_device(struct i2c_adapter *adap,
> +                       struct i2c_board_info const *info,
> +                       struct device *dev)

struct device *parent?

>  {
>         struct i2c_client       *client;
>         int                     status;

> @@ -1054,6 +1062,25 @@ static struct i2c_driver dummy_driver =3D {
>         .id_table       =3D dummy_id,
>  };
>
> +static struct i2c_client *__i2c_new_dummy_device(struct i2c_adapter *ada=
pter,
> +                                                u16 address, const char =
*name,
> +                                                struct device *dev)
> +{
> +       struct i2c_board_info info =3D {
> +               I2C_BOARD_INFO("dummy", address),
> +       };
> +
> +       if (name) {
> +               ssize_t ret =3D strscpy(info.type, name, sizeof(info.type=
));
> +
> +               if (ret < 0)
> +                       return ERR_PTR(dev_err_probe(&adapter->dev, ret,
> +                                                    "Invalid device name=
\n"));

%s too long?

> +       }
> +
> +       return __i2c_new_client_device(adapter, &info, dev);
> +}
> +
>  /**
>   * i2c_new_dummy_device - return a new i2c device bound to a dummy drive=
r
>   * @adapter: the adapter managing the device

> @@ -1122,15 +1145,17 @@ EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
>   * @client: Handle to the primary client
>   * @name: Handle to specify which secondary address to get
>   * @default_addr: Used as a fallback if no secondary address was specifi=
ed
> + * @aux_device_name: Ancillary device name
>   * Context: can sleep
>   *
>   * I2C clients can be composed of multiple I2C slaves bound together in =
a single
>   * component. The I2C client driver then binds to the master I2C slave a=
nd needs
> - * to create I2C dummy clients to communicate with all the other slaves.
> + * to create I2C ancillary clients to communicate with all the other sla=
ves.
>   *
> - * This function creates and returns an I2C dummy client whose I2C addre=
ss is
> - * retrieved from the platform firmware based on the given slave name. I=
f no
> - * address is specified by the firmware default_addr is used.
> + * This function creates and returns an I2C ancillary client whose I2C a=
ddress
> + * is retrieved from the platform firmware based on the given slave name=
. If no
> + * address is specified by the firmware default_addr is used. If no aux_=
device_
> + * name is specified by the firmware, it will create an I2C dummy client=
.

Please add something like:

    The ancillary's device parent will be set to the primary device.

>   *
>   * On DT-based platforms the address is retrieved from the "reg" propert=
y entry
>   * cell whose "reg-names" value matches the slave name.

> @@ -1153,7 +1179,9 @@ struct i2c_client *i2c_new_ancillary_device(struct =
i2c_client *client,
>         }
>
>         dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, a=
ddr);
> -       return i2c_new_dummy_device(client->adapter, addr);
> +       return __i2c_new_dummy_device(client->adapter, addr,
> +                                     aux_device_name ? aux_device_name :=
 NULL,

You can just pass aux_device_name.

> +                                     &client->dev);
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
