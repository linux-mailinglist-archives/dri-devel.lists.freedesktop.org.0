Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6847311C4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 10:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7F510E495;
	Thu, 15 Jun 2023 08:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B103A10E495
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 08:07:56 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-56d378b75f0so17605847b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 01:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686816475; x=1689408475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwN7xkQsIMitCd4edPOUEfx3D1ulWw+mJLJ/cEru9Gs=;
 b=IwXNFuaVk9TXH1h8NrdLD1WBd3xyt4Pgp88wY7Z3xqo6SyE8wp4W3GcUZEOMDVuQSf
 6ebkmeqcJvrHKPuLbcKfacTK9RVb30sccbvp4ZMXN53RDlIkOXq5JcroOBC292y/PIfE
 BDsKlUtf1Ds5QyETOdxQKHTv03pJhb6hcQA8LkDYctcqrOvrqTuS8F0j91msASGQcx9e
 SgQVrIkIP1mJW+eg2jUhieSxwfbZH7XsmhNtwUrgUhp4WL8gcgnD7MzwZWSeZdGvyGtw
 lqQ27ZFIjV8v2Tm3SWtMKBmJGFcf/I8qy5qslJJ5QajQ8AbgwPsFw2CGg9NItqbkbUpC
 +dpw==
X-Gm-Message-State: AC+VfDzxOngI6N912y8VzpKznyN/xBtPZGkGNAB1vNzyfL7qfsTpOM8+
 OB6lb5kkg6OGUDURqolvjwfB+0WseRjp0g==
X-Google-Smtp-Source: ACHHUZ4xRWvnvEHh93h9g7LV5FKtvAq25l3hC9yAmbhWyVO4rQ2g8xy3tsEOXhJlqgyPW1TOBzbZTA==
X-Received: by 2002:a0d:e850:0:b0:565:a0c8:7e66 with SMTP id
 r77-20020a0de850000000b00565a0c87e66mr3898214ywe.0.1686816474963; 
 Thu, 15 Jun 2023 01:07:54 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 j132-20020a81928a000000b0056d1de0a154sm234436ywg.37.2023.06.15.01.07.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 01:07:53 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-bb2ffa1e235so1401428276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 01:07:53 -0700 (PDT)
X-Received: by 2002:a25:2805:0:b0:bca:9326:2f5e with SMTP id
 o5-20020a252805000000b00bca93262f5emr3925299ybo.39.1686816473432; Thu, 15 Jun
 2023 01:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
 <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
 <OS0PR01MB59224D7C95B9B0037046FCF78655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
In-Reply-To: <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jun 2023 10:07:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4QxmFJi3q61ByOFG38KgcGMxPQMeXyPA3r1D9098BMg@mail.gmail.com>
Message-ID: <CAMuHMdX4QxmFJi3q61ByOFG38KgcGMxPQMeXyPA3r1D9098BMg@mail.gmail.com>
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
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
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
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Wed, Jun 14, 2023 at 9:53=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Tue, Jun 13, 2023 at 6:11=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device A=
PI
> > > On Tue, Jun 13, 2023 at 12:45=E2=80=AFPM Biju Das <biju.das.jz@bp.ren=
esas.com>
> > > wrote:
> > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_devi=
ce
> > > > > API On Mon, Jun 12, 2023 at 10:43=E2=80=AFPM Wolfram Sang <wsa@ke=
rnel.org>
> > > wrote:
> > > > > > > Perhaps we should first think through what an ancillary devic=
e
> > > > > > > really is.  My understanding is that it is used to talk to
> > > > > > > secondary addresses of a multi-address I2C slave device.
> > > > > >
> > > > > > As I mentioned somewhere before, this is not the case. Ancillar=
y
> > > > > > devices are when one *driver* handles more than one address.
> > > > > > Everything else has been handled differently in the past (for  =
all
> > > > > > the
> > > > > uses I am aware of).
> > > > > >
> > > > > > Yet, I have another idea which is so simple that I wonder if it
> > > > > > maybe has already been discussed so far?
> > > > > >
> > > > > > * have two regs in the bindings
> > > > > > * use the second reg with i2c_new_client_device to instantiate =
the
> > > > > >   RTC sibling. 'struct i2c_board_info', which is one parameter,
> > > should
> > > > > >   have enough options to pass data, e.g it has a software_node.
> > > > > >
> > > > > > Should work or did I miss something here?
> > > > >
> > > > > That should work, mostly (i2c_new_dummy_device() also calls
> > > > > i2c_new_client_device()).  And as i2c_board_info has an of_node
> > > > > member (something I had missed before!), the new I2C device can
> > > > > access the clocks in the DT node using the standard way.
> > > >
> > > > Looks like, I cannot assign of_node member like below as it results=
 in
> > > > pinctrl failure[1] during device bind.
> > > >
> > > > info.of_node =3D client->dev.of_node;
> > > >
> > > > [1]
> > > > pinctrl-rzg2l 11030000.pinctrl: pin P43_0 already requested by 3-00=
12;
> > > > cannot claim for 3-006f pinctrl-rzg2l 11030000.pinctrl: pin-344
> > > > (3-006f) status -22 pinctrl-rzg2l 11030000.pinctrl: could not reque=
st
> > > > pin 344 (P43_0) from group pmic  on device pinctrl-rzg2l
> > > > raa215300 3-006f: Error applying setting, reverse things back
> > >
> > > Where do you have a reference to pin P43_0 in your DT?
> >
> > The reference to pin P43_0 is added in the PMIC node.
> >
> > I have done modification on my board to test PMIC INT# on RZ/G2L SMARC =
EVK
> > by wiring R83 on SoM module and PMOD0 PIN7.
> >
> > > The last versions you posted did not have any pinctrl properties?
> >
> > By default, PMIC_INT# is not populated RZ/G2L SMARC EVK, so I haven't a=
dded
> > Support for PMIC_INT# for the patches posted till date.
> >
> > Yesterday I checked with HW people, is there a way to enable PMIC_INT#
> > and they told me to do the above HW modification.
> >
> > Today I found this issue, with this modified HW and PMIC INT# enabled o=
n the DT,
> > while assigning of_node of PMIC with info.of_node. It is just a coincid=
ence.
>
> IC.
>
> So you now have two Linux devices pointing to the same DT node,
> causing pinctrl issues...

So don't set info.of_node? ;-)

Without of_node, devm_clk_get() and friends falls back to registered
clkdevs. So you could call clk_register_clkdev() from within the
PMIC driver, and can keep on using devm_clk_get_optional() in the
ISL1208 driver.

If that fails, there's also software_node.properties, or even the good
old platform_data...


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
