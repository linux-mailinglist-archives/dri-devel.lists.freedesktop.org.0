Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765172F900
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 11:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD7310E228;
	Wed, 14 Jun 2023 09:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371C510E228
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 09:26:13 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7606bc82639so184842885a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 02:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686734772; x=1689326772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e0z9fPoNU4B1VL5CglK88xqX1DvSDN2wrWEr2r/xjmM=;
 b=Cy1+2ej/uZFICaFM2qC7X4YiYdI94c9M2DbFFynRKoPf72Buv6EHjJVk6JdZNQ6GaH
 eQR8qSDAPcw1J6s0ayduXzlu58Dpn7BGFj5Qu1KJHyNFO8cTX4GuWtIQ4dqbnOiDbqsi
 JAtDZxSAMdng5uBtxQi5YXawofY6bdoo1Fbh1ImivhhPBeKfuysNXI1YzNi8lx1p/KX2
 GjLWYYqrsYmiuKexbIBPC11ASUpZgqgpNmy+JFpHCJuHrsItvZdgZ5O23iE8ybw+XWFU
 cChBcxFA+jK20Uncl8dKUEn2WkN5jYBvVbintuAcYscpmhp3I63XcWFgblZVyHvbc54M
 TjnQ==
X-Gm-Message-State: AC+VfDyfRGLVs9nSLMTbRQ46Ch7zJrCjxLF9OJxE3I43a8tP0SO7aPrN
 u7Uk355E7rDRNuZj2Q0ShJ/Ut13Wpxh4rw==
X-Google-Smtp-Source: ACHHUZ7g34hu5X9z6eTFF3Bw7p74pPc0yXr0/Z12nkwoJKxyp/H7R/DqlpDoRbqlrk71BPEMHQnv6w==
X-Received: by 2002:ac8:5b46:0:b0:3f6:aee8:3cf7 with SMTP id
 n6-20020ac85b46000000b003f6aee83cf7mr1830590qtw.25.1686734771692; 
 Wed, 14 Jun 2023 02:26:11 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 r15-20020ac867cf000000b003ef3129a1a6sm4901917qtp.46.2023.06.14.02.26.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 02:26:11 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-3f9f25d6690so17773731cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 02:26:11 -0700 (PDT)
X-Received: by 2002:a25:dac5:0:b0:bcb:c3d6:2b1d with SMTP id
 n188-20020a25dac5000000b00bcbc3d62b1dmr1375376ybf.34.1686734304117; Wed, 14
 Jun 2023 02:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210CE54A9CF953980DFEE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220D794AED55A6B795C3EF8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230614081314.GD17519@pendragon.ideasonboard.com>
 <OS0PR01MB59225C45554667D342454923865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59225C45554667D342454923865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jun 2023 11:18:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOTVxK+xkf5F_fBb2eB8E6kt1eWW0e15sPWj30Q7WHPQ@mail.gmail.com>
Message-ID: <CAMuHMdWOTVxK+xkf5F_fBb2eB8E6kt1eWW0e15sPWj30Q7WHPQ@mail.gmail.com>
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
 Mark Brown <broonie@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Wed, Jun 14, 2023 at 10:21=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > On Tue, Jun 13, 2023 at 07:31:46PM +0000, Biju Das wrote:
> > > > Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > > API
> > > > > Subject: RE: [PATCH v5 01/11] i2c: Enhance
> > > > > i2c_new_ancillary_device API
> > > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance
> > > > > > i2c_new_ancillary_device API
> > > > > >
> > > > > > Hi everyone,
> > > > > >
> > > > > > > Perhaps we should first think through what an ancillary devic=
e
> > > > > > > really is.  My understanding is that it is used to talk to
> > > > > > > secondary addresses of a multi-address I2C slave device.
> > > > > >
> > > > > > As I mentioned somewhere before, this is not the case. Ancillar=
y
> > > > > > devices are when one *driver* handles more than one address.
> > > > > > Everything else has been handled differently in the past (for
> > > > > > all the uses I am aware of).
> > > > > >
> > > > > > Yet, I have another idea which is so simple that I wonder if it
> > > > > > maybe has already been discussed so far?
> > > > > >
> > > > > > * have two regs in the bindings
> > > > >
> > > > > OK, it is inline with DT maintainers expectation as it is matchin=
g
> > > > > with real hw as single device node having two regs.
> > > > >
> > > > > > * use the second reg with i2c_new_client_device to instantiate =
the
> > > > > >   RTC sibling. 'struct i2c_board_info', which is one parameter,
> > should
> > > > > >   have enough options to pass data, e.g it has a software_node.
> > > > >
> > > > > OK, I can see the below can be passed from PMIC to new client
> > device.
> > > > >
> > > > >         client->addr =3D info->addr;
> > > > >
> > > > >         client->init_irq =3D info->irq;
> > > > >
> > > > > >
> > > > > > Should work or did I miss something here?
> > > > >
> > > > > I guess it will work. We instantiate appropriate device based On
> > > > > PMIC revision and slave address and IRQ resource passed through
> > > > > 'struct i2c_board_info'
> > > > >
> > > > > Will check this and update you.
> > > >
> > > > info.irq =3D irq; -->Irq fine
> > > > info.addr =3D addr; -->slave address fine size =3D strscpy(info.typ=
e,
> > > > name, sizeof(info.type)); -->instantiation based on PMIC version
> > > > fine.
> > > >
> > > > 1) How do we share clk details on instantiated device to find is it
> > > > connected to external crystal or external clock source? as we canno=
t
> > > > pass of_node between PMIC and "i2c_board_info" as it results in
> > > > pinctrl failure. info->platformdata and
> > > > Client->dev.platformdata to retrieve this info??
> > >
> > > Or
> > >
> > > I2C instantiation based on actual oscillator bit value, ie, two
> > > i2c_device_id's with one for setting oscillator bit and another for
> > > clearing oscillator bit
> > >
> > > PMIC driver parses the clock details. Based on firmware version and
> > > clock, It instantiates either i2c_device_id with setting oscillator
> > > bit or clearing oscillator bit.
> >
> > I don't like that hack. I still think that two DT nodes is the best
> > option, I think you're trying hard to hack around a problem that is
> > actually not a problem.
>
> Why do you think it is a hack? I believe rather it is actual solution
>
> PMIC is a single device, with 2 regs, clocks, pinctrl and IRQ properties.
> So it will be represented as single node with single compatible.
>
> By instating a client device, we are sharing the relevant resources to RT=
C device driver.

Exactly.  RAA215300 is a PMIC with an integrated ISL1208-derivative.
My biggest concern with using 2 separate nodes in DT is that one day
we might discover another integration issue, which needs communication
between the two parts.

Things from the top of my head:
  1. The device has a single interrupt pin.  Is there any interaction
     or coordination between PMIC and RTC interrupts?
  2. On the real ISL1208, the interrupt pin can also be used as a clock
     output.  Perhaps this is fed to some PMIC part in the
     RAA215300, too?
  2. Does the battery charger circuit in the PMIC impact the VBAT
     input of the RTC?
  3. Are there other I2C addresses the chip listens to?

I only have access to the Short-Form Datasheet for the RAA215300,
so I cannot check myself...

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
