Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CCA72E663
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 16:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3336210E273;
	Tue, 13 Jun 2023 14:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B9D10E0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 14:57:22 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-56ce88ee294so29648337b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686668241; x=1689260241;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HCZylnYVESKbr03w+qaTawlaNs+/D1wETaN7cDLoL5w=;
 b=Ch+kQsyWkbLQ7dfw3vBN96mrnb3Ks48lBEY1QlRsAUqXeZmqRO+jYOWya1ECfWVrdg
 zG4Bi4VrdTksYyzVlgQH/6kzGslBtuieNioT7n67CJaSB3+JneBIhH58GVI6pWY689xs
 CBYfjvd2PNrshwPBx3QKkClOw3bWLGyjyEC3ntBvWi8hnfR+/AvH58n9gEjjuU3FiUKf
 bQpxJbkOQv+eZupg2ij0lEbN8kbil3RY0B+8ZNXvsRYwqW/jZxZXew1TODhH77lYmldJ
 8NOF1oWuUuSDfKq/jaj+IE5q/HHZ1d0UqU3XYfqKGbOP4CvDUetDwZUNNOpPbEBefg5o
 8sxg==
X-Gm-Message-State: AC+VfDzsqS3UrDalcwd5S/aZzDVf1FXi9rUqSb6nJQ7Im8iRcZBurHXm
 w3FwlFfUkAizhZnoP8kP+0/tU7FHFmYST8Wk
X-Google-Smtp-Source: ACHHUZ6cn4UGh4AAJ26fc0jX38Pyx0lkEfW9jFpB7B1+9FH24Jzz2rCZHdQPOr/+rDyGmpH5QKVTug==
X-Received: by 2002:a0d:df95:0:b0:56d:332a:5a25 with SMTP id
 i143-20020a0ddf95000000b0056d332a5a25mr1976257ywe.5.1686668240839; 
 Tue, 13 Jun 2023 07:57:20 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 l20-20020a0de214000000b0056d443372f0sm887760ywe.119.2023.06.13.07.57.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 07:57:20 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-56ce372ac00so30864697b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:57:20 -0700 (PDT)
X-Received: by 2002:a25:9f07:0:b0:bc3:cc17:6250 with SMTP id
 n7-20020a259f07000000b00bc3cc176250mr1355567ybq.1.1686667920065; Tue, 13 Jun
 2023 07:52:00 -0700 (PDT)
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
In-Reply-To: <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jun 2023 16:51:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
Message-ID: <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
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

On Tue, Jun 13, 2023 at 12:45=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > On Mon, Jun 12, 2023 at 10:43=E2=80=AFPM Wolfram Sang <wsa@kernel.org> =
wrote:
> > > > Perhaps we should first think through what an ancillary device
> > > > really is.  My understanding is that it is used to talk to secondar=
y
> > > > addresses of a multi-address I2C slave device.
> > >
> > > As I mentioned somewhere before, this is not the case. Ancillary
> > > devices are when one *driver* handles more than one address.
> > > Everything else has been handled differently in the past (for  all th=
e
> > uses I am aware of).
> > >
> > > Yet, I have another idea which is so simple that I wonder if it maybe
> > > has already been discussed so far?
> > >
> > > * have two regs in the bindings
> > > * use the second reg with i2c_new_client_device to instantiate the
> > >   RTC sibling. 'struct i2c_board_info', which is one parameter, shoul=
d
> > >   have enough options to pass data, e.g it has a software_node.
> > >
> > > Should work or did I miss something here?
> >
> > That should work, mostly (i2c_new_dummy_device() also calls
> > i2c_new_client_device()).  And as i2c_board_info has an of_node member
> > (something I had missed before!), the new I2C device can access the clo=
cks
> > in the DT node using the standard way.
>
> Looks like, I cannot assign of_node member like below as it results in pi=
nctrl failure[1]
> during device bind.
>
> info.of_node =3D client->dev.of_node;
>
> [1]
> pinctrl-rzg2l 11030000.pinctrl: pin P43_0 already requested by 3-0012; ca=
nnot claim for 3-006f
> pinctrl-rzg2l 11030000.pinctrl: pin-344 (3-006f) status -22
> pinctrl-rzg2l 11030000.pinctrl: could not request pin 344 (P43_0) from gr=
oup pmic  on device pinctrl-rzg2l
> raa215300 3-006f: Error applying setting, reverse things back

Where do you have a reference to pin P43_0 in your DT?
The last versions you posted did not have any pinctrl properties?

v6: https://lore.kernel.org/linux-renesas-soc/20230602142426.438375-5-biju.=
das.jz@bp.renesas.com
v5: https://lore.kernel.org/linux-renesas-soc/20230522101849.297499-12-biju=
.das.jz@bp.renesas.com

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
