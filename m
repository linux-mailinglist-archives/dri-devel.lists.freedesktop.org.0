Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBBE71827E
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 15:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA1D10E4D3;
	Wed, 31 May 2023 13:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FCC10E4D4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 13:43:33 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-64d247a023aso3953206b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 06:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685540613; x=1688132613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WVaRbAXqjrI+Y8VEfYiLARtKsf04kthNVoHQskLsENA=;
 b=J5t88yzQ3fi6cjqaK07aiuPo7hL7wQRNeSAk+pUOH9aHBvh6ZsYCeTS7HC8vHtNjdV
 g6TCoMspXaHLhb67ZlpTqTHkSiiT2kyT9dndsdDeRqWMGKJRW5ROxxFLD9DWIt1t9UCW
 CsrnTRpqHtCUIXRArSfuJP/FAqzBrQgCWTV0H2X3VdaumPqIr+RoGXxhcaBso96px2X5
 S1nrs+mhmdAJiB3pWdd6dVYetCDLJPNpMPLGfik6IcTdS5ZZFN1HXl39PIsLAW26c7Rj
 VQ1S9jyeBmbiBWEvC+Ywp4lHJcXbfdq+ZwHOQ54zhxJII601xSubWuTvOEoPelAajIT1
 7SIQ==
X-Gm-Message-State: AC+VfDwhkLspJmGChGSkJQSNYzv9pUpdI2yTSuc07whD6dF0lYnw1hlg
 4EBiUpdN3qfszHoS7QsSntXJFO4gwWSF8g==
X-Google-Smtp-Source: ACHHUZ4vDJsmMoEkJtZ24qW5l/yeh5OVIl55bs5eXttGR1qKoWt0mfnKTD/zCx4pJdvTw+n86414zw==
X-Received: by 2002:a05:6a20:7fa9:b0:103:73a6:5cc1 with SMTP id
 d41-20020a056a207fa900b0010373a65cc1mr5873211pzj.4.1685540612754; 
 Wed, 31 May 2023 06:43:32 -0700 (PDT)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com.
 [209.85.210.175]) by smtp.gmail.com with ESMTPSA id
 x7-20020a62fb07000000b0063b867a1959sm3310349pfm.133.2023.05.31.06.43.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 06:43:32 -0700 (PDT)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-64d247a023aso3953180b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 06:43:32 -0700 (PDT)
X-Received: by 2002:a05:6358:e489:b0:123:44bd:bce7 with SMTP id
 by9-20020a056358e48900b0012344bdbce7mr514077rwb.31.1685540286373; Wed, 31 May
 2023 06:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <OS0PR01MB59226E87241A61A2CB255DEE86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531114103.GD27043@pendragon.ideasonboard.com>
 <OS0PR01MB592217BBDCD7C0072F24493D86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592217BBDCD7C0072F24493D86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 May 2023 15:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV56T2P4fGhs-_Sf-N-ow8rf26TAvk77diHc3wQMH7_Zg@mail.gmail.com>
Message-ID: <CAMuHMdV56T2P4fGhs-_Sf-N-ow8rf26TAvk77diHc3wQMH7_Zg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Wed, May 31, 2023 at 2:53=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > > * This function creates and returns an I2C ancillary client whose I2C
> > > address
> > > * is retrieved from the platform firmware based on the given slave
> > > name. If
> > > * aux_device_name is not NULL, the ancillary's device parent
> > > * will be set to the primary device otherwise it will be set to I2C
> > adapter.
> >
> > The wording is better, but this is not what you have implemented in the
> > code. The name doesn't select which parent is used.
>
> It is the same implemented in the code.
>
> For the existing users, aux_device_name is NULL --> The parent is set as =
"I2C adapter".
>
> For instantiating a "i2c client device", aux_device_name is not NULL --> =
The parent is set as primary device.
>
> The primary device is the one instantiated the "i2c client device" using
> i2c_new_ancillary_device().
>
> Please correct me if anything wrong here.
>
> >
> > > * If no address is specified by the firmware default_addr is used.
> > >
> > > > > > > the ancillary's device parent
> > > > > > > + * will be set to the primary device.
> > > > > >
> > > > > > This doesn't seem to match the implementation. With this patch
> > > > > > the ancillary device's parent is always the primary device. Are
> > > > > > you sure this won't cause any regression ?
> > > > >
> > > > > There is no regression as existing users only instantiate dummy
> > > > device.
> > > >
> > > > Sorry, I don't follow you here. Existing callers of
> > > > i2c_new_ancillary_device() today get an i2c_client device whose
> > > > parent is the I2C adapter. With this patch they will get an
> > > > i2c_client device whose parent is the main i2c_client. That's a
> > > > change in behaviour, which could cause all sorts of issues.
> > >
> > > Please see the patch snippet below, there is no regression.
> > >
> > > client->dev.parent =3D parent ? parent : &client->adapter->dev;
> >
> > When called from i2c_new_ancillary_device(), __i2c_new_dummy_device() a=
s
> > a non-NULL parent argument. There is no change of behaviour *for
> > i2c_new_dummy_device()*, but thre is a change of behaviour *for
> > i2c_new_ancillary_device()*.
>
>
> I don't think I understand what you mean.
>
> For existing users, i2c_new_ancillary_device(..., aux_device_name=3DNULL)=
 the behaviour is not changed.
>
> Could you please elaborate further?

Laurent is right, there is a small issue:

    struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
                                               const char *name,
                                               u16 default_addr,
                                               const char *aux_device_name)
    {
            ...
           return __i2c_new_dummy_device(client->adapter, addr, aux_device_=
name,
                                         &client->dev);
    }

To preserve backwards compatibility, the last parameter should be

     aux_device_name ? &client->dev : NULL

Sorry for missing that before.

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
