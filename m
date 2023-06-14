Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9251F72F6F7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4138410E411;
	Wed, 14 Jun 2023 07:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB2D10E411
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 07:53:19 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5700401acbeso4526077b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 00:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686729198; x=1689321198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RVKO0F3nSwUgNwvgXxZdykhH7Fe6dy1ubUvaHr+R9rs=;
 b=QbJPBAU/7AhDPBeW7vVQNFM9vRkPr3WksccNmAJvc5lRNvmdfPijpZ552bxtAMjPpp
 VNhM3Ypd2ouinW5Z2grzt0VPfAMxVvHsNCln+PRjwhnuooA067jlaFsD0D0zxVLjPUdA
 l9iNa6QPTrNAPL7vn7VWrUhqMwnkdyULV9ioEN12ZI5f5U5ujiMBSXUkffp1ufIXt2EV
 W5ALutmjhzUZKcX3YsuXO+Regbm0/FgiFgsxKsyCeqH56eBB0Ws89pe6YKml9i4LJXxk
 ta0INjx/LfwwkrtplHTKcitWvK5Xwi8rp12Qx+sql+oxE3gWLTZBIge3+1C+wZAfiI2M
 MKTQ==
X-Gm-Message-State: AC+VfDxk+mOCFf8C9d1i+NukQUV3HSSCQfd/1Ux87eGs3QpAIi7uFk+W
 pJu16TSCk+xdA9vWwsTyz0zGC3WN5ccgtg==
X-Google-Smtp-Source: ACHHUZ6SvAoZbc2PVeo6Pn2dDj6ws/p8O9b34BIUEtQF029/ZH0lucJEZdkYa6VbV4uY0NDbbm3aag==
X-Received: by 2002:a0d:d6cc:0:b0:561:b246:77ca with SMTP id
 y195-20020a0dd6cc000000b00561b24677camr1124774ywd.28.1686729198063; 
 Wed, 14 Jun 2023 00:53:18 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 t65-20020a0dea44000000b0055a07585a91sm1200349ywe.11.2023.06.14.00.53.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 00:53:17 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-bcde2b13fe2so356869276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 00:53:16 -0700 (PDT)
X-Received: by 2002:a25:fc13:0:b0:ba8:66fb:dd84 with SMTP id
 v19-20020a25fc13000000b00ba866fbdd84mr1309725ybd.20.1686729196541; Wed, 14
 Jun 2023 00:53:16 -0700 (PDT)
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
In-Reply-To: <OS0PR01MB59224D7C95B9B0037046FCF78655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jun 2023 09:53:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
Message-ID: <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
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

On Tue, Jun 13, 2023 at 6:11=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > On Tue, Jun 13, 2023 at 12:45=E2=80=AFPM Biju Das <biju.das.jz@bp.renes=
as.com>
> > wrote:
> > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > > API On Mon, Jun 12, 2023 at 10:43=E2=80=AFPM Wolfram Sang <wsa@kern=
el.org>
> > wrote:
> > > > > > Perhaps we should first think through what an ancillary device
> > > > > > really is.  My understanding is that it is used to talk to
> > > > > > secondary addresses of a multi-address I2C slave device.
> > > > >
> > > > > As I mentioned somewhere before, this is not the case. Ancillary
> > > > > devices are when one *driver* handles more than one address.
> > > > > Everything else has been handled differently in the past (for  al=
l
> > > > > the
> > > > uses I am aware of).
> > > > >
> > > > > Yet, I have another idea which is so simple that I wonder if it
> > > > > maybe has already been discussed so far?
> > > > >
> > > > > * have two regs in the bindings
> > > > > * use the second reg with i2c_new_client_device to instantiate th=
e
> > > > >   RTC sibling. 'struct i2c_board_info', which is one parameter,
> > should
> > > > >   have enough options to pass data, e.g it has a software_node.
> > > > >
> > > > > Should work or did I miss something here?
> > > >
> > > > That should work, mostly (i2c_new_dummy_device() also calls
> > > > i2c_new_client_device()).  And as i2c_board_info has an of_node
> > > > member (something I had missed before!), the new I2C device can
> > > > access the clocks in the DT node using the standard way.
> > >
> > > Looks like, I cannot assign of_node member like below as it results i=
n
> > > pinctrl failure[1] during device bind.
> > >
> > > info.of_node =3D client->dev.of_node;
> > >
> > > [1]
> > > pinctrl-rzg2l 11030000.pinctrl: pin P43_0 already requested by 3-0012=
;
> > > cannot claim for 3-006f pinctrl-rzg2l 11030000.pinctrl: pin-344
> > > (3-006f) status -22 pinctrl-rzg2l 11030000.pinctrl: could not request
> > > pin 344 (P43_0) from group pmic  on device pinctrl-rzg2l
> > > raa215300 3-006f: Error applying setting, reverse things back
> >
> > Where do you have a reference to pin P43_0 in your DT?
>
> The reference to pin P43_0 is added in the PMIC node.
>
> I have done modification on my board to test PMIC INT# on RZ/G2L SMARC EV=
K
> by wiring R83 on SoM module and PMOD0 PIN7.
>
> > The last versions you posted did not have any pinctrl properties?
>
> By default, PMIC_INT# is not populated RZ/G2L SMARC EVK, so I haven't add=
ed
> Support for PMIC_INT# for the patches posted till date.
>
> Yesterday I checked with HW people, is there a way to enable PMIC_INT#
> and they told me to do the above HW modification.
>
> Today I found this issue, with this modified HW and PMIC INT# enabled on =
the DT,
> while assigning of_node of PMIC with info.of_node. It is just a coinciden=
ce.

IC.

So you now have two Linux devices pointing to the same DT node,
causing pinctrl issues...

I know this won't solve the core issue, but what is the exact pintrl
configuration you are using? Is this using a GPIO with interrupt
capabilities, or a dedicated interrupt pin? In case of the former,
you don't need a pinctrl property in DT, as the GPIO controller itself
should take care of that by asking the pin controller to configure
the pin properly through pinctrl_gpio_request().

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
