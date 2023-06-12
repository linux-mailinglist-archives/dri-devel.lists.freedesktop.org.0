Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FFE72C583
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 15:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DBA10E236;
	Mon, 12 Jun 2023 13:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EF510E236
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 13:08:07 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-3f9cf20da1dso40453521cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 06:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686575286; x=1689167286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OOSPC68jRmmKm/N4lilGrY5D58VwuhvYh8IBlby8n7U=;
 b=gvWiJ5DYGVjaHRCi3unBLKQk3WIbhyG02Dk7EgomYUOJaWysQtr9/gK3OAFmqwMwEC
 5HOaW+XvDptoGmBChIRB+aSBJ+a8hoAxsUCqF6F4PmIvUN41ahzrzNw4/H87TkU5iIo/
 CJIDnkHEdf798Z3cejA/0x813fHD9dxVLBy1J3r5B6pcnk5DB6yRIJ8QqTFPEmdYcZYL
 t0bnefO4BXl1wwPQYvf/cgQpKA4mX/TOGaHqa4cC9zyk347iocW8mEelty81zGFe8VCS
 rK0WLKyfuqiUf1RaxQTcOkLCZR/MpgUjfJsulDO5cLPoeJ/7Q2Vj9AxwXGRHq9VsSPqT
 eBQg==
X-Gm-Message-State: AC+VfDyEpK2gJtfUzEgBMvlQhPmJqNQpu4UDhOE7pkU/d3yojuSrsjEy
 8O5r9noMwrlIpdF2WzRzejPlNF/PPkY1xQ==
X-Google-Smtp-Source: ACHHUZ77JdEUyhelLxePwR/SH/llWgWey248eYx/VqQt7n7F1fajPty5HT1ORBxl7Jm4ouNKEQqrmw==
X-Received: by 2002:a05:622a:1391:b0:3f4:400d:5249 with SMTP id
 o17-20020a05622a139100b003f4400d5249mr11073382qtk.67.1686575285985; 
 Mon, 12 Jun 2023 06:08:05 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 fe9-20020a05622a4d4900b003f9adf7c9fbsm3381402qtb.71.2023.06.12.06.08.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:08:05 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-3f9b5ec058aso41809831cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 06:08:05 -0700 (PDT)
X-Received: by 2002:a25:7642:0:b0:bc5:da39:e84 with SMTP id
 r63-20020a257642000000b00bc5da390e84mr6203110ybc.13.1686574813357; Mon, 12
 Jun 2023 06:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
In-Reply-To: <ZIcUEdctlgRsGxJ3@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jun 2023 15:00:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
Message-ID: <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To: Wolfram Sang <wsa@kernel.org>
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
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wolfram,

On Mon, Jun 12, 2023 at 2:48=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
> > > Would this binding allow to not use the RTC if the second reg is
> > > missing? What are the advantages of not enabling RTC? Saving power?
> >
> > It doesn't work if there is no clock?
>
> Maybe I am confusing something now, but if the RTC _needs_ to be
> enabled, then why we don't do it unconditionally?

1. DT describes the hardware, which listens to two addresses, so the
   device node should have two entries in the reg property.
2. The RTC is enabled by instantiating an i2c ancillary device, and lets th=
e
   isl1208 driver bind against it.

> > > Thinking more about this: DT is hardware description, so the RTC shou=
ld
> > > always be described in DT. If the RTC is actually activated is more a
> > > configuration thing, or? Brainstorming: maybe the PMIC driver could t=
ry
> > > to find the node with reg =3D=3D 0x6f and see if firmware has enabled=
 it or
> > > not?
> >
> > I guess the RTC part would acknowledge anyway?
> > It is always present, it is just part of the RAA215300.
>
> I mean the driver should scan for the DT node. Not on the bus. But a
> phandle is probably safer.
>
> > Sure, you can put that in DT.  But it's a pity you have to do that,
> > as the device (the PMIC part) does know the revision...
> > That's why I suggested to let the PMIC part instantiate an i2c ancillar=
y
> > device...
>
> I see. I'll let it sink in some more.

Perhaps we should first think through what an ancillary device really
is.  My understanding is that it is used to talk to secondary addresses
of a multi-address I2C slave device.

What's different here compared to e.g. adv748x?
  - RAA215300 has a PMIC and an RTC, and there exists a separate
    RTC driver for a similar part (which is thus Linux-specific,
    not DT-specific!),
  - I don't know much about adv748x, but I understand there is a
    single driver talking to all subcomponents.
    What if in the future we e.g. would want to spin off part of it
    in a subdriver, as a subcomponent appeared in an unrelated device?

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
