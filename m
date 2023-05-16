Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86544704707
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C66E897F0;
	Tue, 16 May 2023 07:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEF810E194
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:53:21 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-759200f12baso472315485a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684223600; x=1686815600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f07seKr4m5/OlhMAPO3dIAn75k2cEFtJb88wHoo4wJk=;
 b=SgStBw5pcbH5zgKDj9HO1K3iHpjW5Os/Of1+YPCgNhxYDwPysLJvwPK9/SkOniVk4S
 s1SkJ/gTRz7N+pp5fzjlNd/7Owz361GviAGi7VWZAsGJvkEBKWEVR3pJ5Glf9qSYxRii
 7UPF/Zfl/g7V0GvPvDZiCAWltSqK9u6o6M0whOpq+uj6qFRLq7DeXYaXE1rUGydDzePp
 vG5s7GZIVeJmAb7fK+GCwAbztBJbXICzYKuSHSuSXnR1A9aghSj5xpY4rijz9Ot8vNZK
 IJcojlNEZ1GnPt//o3BjAmEUZrm/tsI0SzTdKAS+xMMOmKBfa3S5tHcAvom3btFDSh04
 1ygA==
X-Gm-Message-State: AC+VfDwgU+cwXBkAwROgoNsUhPmR4gZW212o4YiSjxAfXMQr5Rm6fmNb
 9HRY64Muazd95PSMHlQ1KfjumUfQ+XO1hw==
X-Google-Smtp-Source: ACHHUZ6UDfpRhsANbQhORSONC+DebVldcv0yF2O58OT/sB1VhJvkYhUN3xzPTn/Y5Q2nSK9CwxFlpQ==
X-Received: by 2002:a05:6214:1243:b0:5c5:1a25:edf0 with SMTP id
 r3-20020a056214124300b005c51a25edf0mr61731212qvv.26.1684223599818; 
 Tue, 16 May 2023 00:53:19 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 ow7-20020a05620a820700b0074ced3e0004sm432802qkn.63.2023.05.16.00.53.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:53:19 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-3f52d303bcdso19391631cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:53:19 -0700 (PDT)
X-Received: by 2002:a0d:df45:0:b0:55a:671b:4685 with SMTP id
 i66-20020a0ddf45000000b0055a671b4685mr32388112ywe.46.1684223280201; Tue, 16
 May 2023 00:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
 <20230513165227.13117-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230513165227.13117-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 May 2023 09:47:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYPZftcTP5E0f1uwkTsunn9KAOtLeDNqiFoKx+m7OQDg@mail.gmail.com>
Message-ID: <CAMuHMdVYPZftcTP5E0f1uwkTsunn9KAOtLeDNqiFoKx+m7OQDg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] i2c: Enhance i2c_new_ancillary_device API
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-renesas-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Lee Jones <lee@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
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

On Sat, May 13, 2023 at 6:52=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Renesas PMIC RAA215300 exposes two separate i2c devices, one for the main
> device and another for rtc device.
>
> Enhance i2c_new_ancillary_device() to instantiate a real device.
> (eg: Instantiate rtc device from PMIC driver)
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * New patch

Thanks for your patch!

Looks correct to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Some suggestions for improvement below...

> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1153,7 +1157,27 @@ struct i2c_client *i2c_new_ancillary_device(struct=
 i2c_client *client,
>         }
>
>         dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, a=
ddr);
> -       return i2c_new_dummy_device(client->adapter, addr);
> +
> +       if (aux_device_name) {
> +               struct i2c_board_info info;
> +               size_t aux_device_name_len =3D strlen(aux_device_name);
> +
> +               if (aux_device_name_len > I2C_NAME_SIZE - 1) {
> +                       dev_err(&client->adapter->dev, "Invalid device na=
me\n");
> +                       return ERR_PTR(-EINVAL);
> +               }

strscpy() return value?

> +
> +               memset(&info, 0, sizeof(struct i2c_board_info));

The call to memset() would not be needed if info would be initialized
at declaration time, i.e.

    struct i2c_board_info info =3D { .addr =3D addr };

Or, use I2C_BOARD_INFO(), to guarantee initialization is aligned
with whatever future changes made to i2c_board_info? But that relies
on providing the name at declaration time, which we already have in
i2c_new_dummy_device().

So I suggest to add a name parameter to i2c_new_dummy_device(),
rename it to __i2c_new_dummy_device(), and create a wrapper for
compatibility with existing users:

    struct i2c_client *__i2c_new_dummy_device(struct i2c_adapter
*adapter, u16 address,
                                             const char *name)
    {
            struct i2c_board_info info =3D {
                    I2C_BOARD_INFO("dummy", address),
            };

            if (name) {
                    ssize_ret =3D strscpy(info.type, name, sizeof(info.type=
));

                    if (ret < 0)
                            return ERR_PTR(dev_err_probe(&client->adapter->=
dev,
                                           ret, "Invalid device name\n");
            }

            return i2c_new_client_device(adapter, &info);
    }

> +
> +               memcpy(info.type, aux_device_name, aux_device_name_len);
> +               info.addr =3D addr;
> +
> +               i2c_aux_client =3D i2c_new_client_device(client->adapter,=
 &info);
> +       } else {
> +               i2c_aux_client =3D i2c_new_dummy_device(client->adapter, =
addr);
> +       }
> +
> +       return i2c_aux_client;
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);

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
