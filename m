Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B11B7312E9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AACA10E49D;
	Thu, 15 Jun 2023 09:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D87D10E49D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:00:49 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-62de651bcf0so25255076d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 02:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686819648; x=1689411648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmqLQ0CkJgsWUGPcmqNBpJER8sgocx9vIladrrnTfN0=;
 b=QXi9l2HgFhaTYZNAuXow8GX/K7bP+tKTVrhSJCt6/NfunIi2CVAz3bZkDlSUCo5u4c
 H+iFuH/iLJrlsdhTXZ8IQp3rAvI4JLErU9jY1zVC2NnKOGZaubrOreFp3DV33w5PMbua
 l+5NdwZXMLwGjrwWg/YxYA/2QuKl0zC8cRdp4d2XAKjOordF/vL3VGXDLF+/dy6pI7we
 lWmwQTQLOorUHbWjpMHWsKw2qUA749FIdxxty95nyAz4B0+DqIm90gU/80ARTiOvIN+y
 So0E2OmOHyj0FeKquiAzyPwEjEDInZmZej77r4imTq45qoVZC3hanA5H19DgNLjh07KM
 /+YA==
X-Gm-Message-State: AC+VfDzXCLVB3PTzfzIoTEQEAbcDbwCNEba8Tu1Hkh1vIz2k/6ewGNwy
 dj/Iv00wYEuiXsZe4cxwqSMi30/VHyucAg==
X-Google-Smtp-Source: ACHHUZ6cV3XoO1roq9f6w9Pr9FCfKpE3H4nlWVDg7ZZcT5Qa+Nu9VrA6i0iCQJMnrAgnx/TObRNSBw==
X-Received: by 2002:a05:6214:c44:b0:628:731d:7aad with SMTP id
 r4-20020a0562140c4400b00628731d7aadmr19570369qvj.37.1686819648024; 
 Thu, 15 Jun 2023 02:00:48 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 t18-20020a0cea32000000b006260e7361ebsm5600390qvp.1.2023.06.15.02.00.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 02:00:46 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-3f866383b25so27820411cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 02:00:45 -0700 (PDT)
X-Received: by 2002:a05:622a:14d0:b0:3f9:1736:dc87 with SMTP id
 u16-20020a05622a14d000b003f91736dc87mr4513058qtx.36.1686819645079; Thu, 15
 Jun 2023 02:00:45 -0700 (PDT)
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
 <CAMuHMdWOTVxK+xkf5F_fBb2eB8E6kt1eWW0e15sPWj30Q7WHPQ@mail.gmail.com>
 <OS0PR01MB5922763D0F2F124EDF67CCEB865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922763D0F2F124EDF67CCEB865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jun 2023 11:00:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwQUWtH_cRJaNKUyDAM-a4HByjLnMME5ui-EOEH55chQ@mail.gmail.com>
Message-ID: <CAMuHMdUwQUWtH_cRJaNKUyDAM-a4HByjLnMME5ui-EOEH55chQ@mail.gmail.com>
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

On Wed, Jun 14, 2023 at 1:04=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > On Wed, Jun 14, 2023 at 10:21=E2=80=AFAM Biju Das <biju.das.jz@bp.renes=
as.com>
> > wrote:
> > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > > API On Tue, Jun 13, 2023 at 07:31:46PM +0000, Biju Das wrote:
> > > > > > Subject: RE: [PATCH v5 01/11] i2c: Enhance
> > > > > > i2c_new_ancillary_device API
> > > > > > > Subject: RE: [PATCH v5 01/11] i2c: Enhance
> > > > > > > i2c_new_ancillary_device API
> > > > > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance
> > > > > > > > i2c_new_ancillary_device API
> > > > > > > >
> > > > > > > > Hi everyone,
> > > > > > > >
> > > > > > > > > Perhaps we should first think through what an ancillary
> > > > > > > > > device really is.  My understanding is that it is used to
> > > > > > > > > talk to secondary addresses of a multi-address I2C slave
> > device.
> > > > > > > >
> > > > > > > > As I mentioned somewhere before, this is not the case.
> > > > > > > > Ancillary devices are when one *driver* handles more than o=
ne
> > address.
> > > > > > > > Everything else has been handled differently in the past
> > > > > > > > (for all the uses I am aware of).
> > > > > > > >
> > > > > > > > Yet, I have another idea which is so simple that I wonder i=
f
> > > > > > > > it maybe has already been discussed so far?
> > > > > > > >
> > > > > > > > * have two regs in the bindings
> > > > > > >
> > > > > > > OK, it is inline with DT maintainers expectation as it is
> > > > > > > matching with real hw as single device node having two regs.
> > > > > > >
> > > > > > > > * use the second reg with i2c_new_client_device to instanti=
ate
> > the
> > > > > > > >   RTC sibling. 'struct i2c_board_info', which is one
> > > > > > > > parameter,
> > > > should
> > > > > > > >   have enough options to pass data, e.g it has a
> > software_node.
> > > > > > >
> > > > > > > OK, I can see the below can be passed from PMIC to new client
> > > > device.
> > > > > > >
> > > > > > >         client->addr =3D info->addr;
> > > > > > >
> > > > > > >         client->init_irq =3D info->irq;
> > > > > > >
> > > > > > > >
> > > > > > > > Should work or did I miss something here?
> > > > > > >
> > > > > > > I guess it will work. We instantiate appropriate device based
> > > > > > > On PMIC revision and slave address and IRQ resource passed
> > > > > > > through 'struct i2c_board_info'
> > > > > > >
> > > > > > > Will check this and update you.
> > > > > >
> > > > > > info.irq =3D irq; -->Irq fine
> > > > > > info.addr =3D addr; -->slave address fine size =3D
> > > > > > strscpy(info.type, name, sizeof(info.type)); -->instantiation
> > > > > > based on PMIC version fine.
> > > > > >
> > > > > > 1) How do we share clk details on instantiated device to find i=
s
> > > > > > it connected to external crystal or external clock source? as w=
e
> > > > > > cannot pass of_node between PMIC and "i2c_board_info" as it
> > > > > > results in pinctrl failure. info->platformdata and
> > > > > > Client->dev.platformdata to retrieve this info??
> > > > >
> > > > > Or
> > > > >
> > > > > I2C instantiation based on actual oscillator bit value, ie, two
> > > > > i2c_device_id's with one for setting oscillator bit and another
> > > > > for clearing oscillator bit
> > > > >
> > > > > PMIC driver parses the clock details. Based on firmware version
> > > > > and clock, It instantiates either i2c_device_id with setting
> > > > > oscillator bit or clearing oscillator bit.
> > > >
> > > > I don't like that hack. I still think that two DT nodes is the best
> > > > option, I think you're trying hard to hack around a problem that is
> > > > actually not a problem.
> > >
> > > Why do you think it is a hack? I believe rather it is actual solution
> > >
> > > PMIC is a single device, with 2 regs, clocks, pinctrl and IRQ
> > properties.
> > > So it will be represented as single node with single compatible.
> > >
> > > By instating a client device, we are sharing the relevant resources t=
o
> > RTC device driver.
> >
> > Exactly.  RAA215300 is a PMIC with an integrated ISL1208-derivative.
> > My biggest concern with using 2 separate nodes in DT is that one day we
> > might discover another integration issue, which needs communication
> > between the two parts.
> >
> > Things from the top of my head:

> >   2. On the real ISL1208, the interrupt pin can also be used as a clock
> >      output.  Perhaps this is fed to some PMIC part in the
> >      RAA215300, too?
>
> The ISL1208 driver doesn't support clock output. It is same as ISL1208, b=
ut difference is
> since same INT# pin used for PMIC, I guess we won't be able to use PMIC i=
nterrupt, if RTC configured for clock output.

Exactly.

The documentation confirms it can also be configured as clock signal
output in Frequency Output (FOUT) mode of the RTC on RAA215300.

> >   3. Are there other I2C addresses the chip listens to?
>
> No, only 2 address 0x12 and 0x6f.

Both addresses are programmable, and can even be the same!
Interesting, but more challenging for the Linux driver model...

> > I only have access to the Short-Form Datasheet for the RAA215300, so I
> > cannot check myself...

Thanks, got access through the kind people behind the Renesas website.

Other things I noticed during a quick glance:
  - To activate the RTC, the host must first set the RTC EN bit =3D
    1 and the WRTC bit =3D 1.
    The RTC EN bit is located in the PMIC address space.
    IMHO this precludes using a separate DT node.
  - ISL1208 supports 400 kHz I2C, RAA215300 supports 1 MHz.

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
