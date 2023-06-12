Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8216A72C597
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 15:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA03510E0D8;
	Mon, 12 Jun 2023 13:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929FF10E0D8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 13:16:24 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-19f3550bcceso2414180fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 06:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686575783; x=1689167783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5XhZcZSHZMUBc906xfl0reyAu6fl6qfJnXfrRKfwIpg=;
 b=bSdm7h9M0GQWDc7IkXY/wXbowSk2ZLe5FT3Od7LquiKpkyumjy5QDkcRaTbkqiZUix
 2CSFWtDQ9MT1fNgGwChZfZmy5VuK4en03b4xBX/6bigRwyv9W7Gj2lXs318WvNPsfp4N
 bGFr/PzECYOFdHjVKiLQCoeGexkJu/tukaFKrzCEglZE9pXcH/5WsqfRmCSWbQE9yuGs
 AkwGVhkcksZU4PYTK6qiIWzSdHAqTIgBSqnLufaYgDL9D5lVFBjtnJ9rnbJjo17HXz2l
 V3yxluPSbhjtQQp5eBtOEOfkqChYGvTVLW6lXWOspysb1UkeXb0YjxYWZQ7ih5V4xH17
 OyNQ==
X-Gm-Message-State: AC+VfDyBdnrpdO8kQnDdfnz1HbXCkj8B3mJ/5aWwdG948aZ1Oys7e7ay
 mjhqO6ux0qjbZql8upoEDY2RsXJ8yC0VAQ==
X-Google-Smtp-Source: ACHHUZ6+lqtn4v7ki4tvf2uCkcI/wSxpjNeJ6l7RVjoYZGzhMG6fs1fX81oTvSXT09XWCLH45ph3/g==
X-Received: by 2002:a05:6870:8444:b0:1a2:cfd7:bfdc with SMTP id
 n4-20020a056870844400b001a2cfd7bfdcmr5728722oak.6.1686575783288; 
 Mon, 12 Jun 2023 06:16:23 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com.
 [209.85.160.50]) by smtp.gmail.com with ESMTPSA id
 ld10-20020a0568702b0a00b001762ce27f9asm5840748oab.23.2023.06.12.06.16.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:16:23 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-1a6960956d5so671469fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 06:16:23 -0700 (PDT)
X-Received: by 2002:a25:1e86:0:b0:ba9:b3dd:6b0d with SMTP id
 e128-20020a251e86000000b00ba9b3dd6b0dmr8576899ybe.64.1686575338138; Mon, 12
 Jun 2023 06:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612122353.GA22391@pendragon.ideasonboard.com>
 <OS0PR01MB5922D335D53C7B0FA021B3218654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612125405.GA23921@pendragon.ideasonboard.com>
In-Reply-To: <20230612125405.GA23921@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jun 2023 15:08:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_xw-+_MakVeLVgv1nCW_GqKQ2hiEfb5J-p2WiSvWV_g@mail.gmail.com>
Message-ID: <CAMuHMdV_xw-+_MakVeLVgv1nCW_GqKQ2hiEfb5J-p2WiSvWV_g@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Trent Piepho <tpiepho@gmail.com>,
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
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Jun 12, 2023 at 2:54=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jun 12, 2023 at 12:42:33PM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device A=
PI
> > > On Mon, Jun 12, 2023 at 09:53:02AM +0000, Biju Das wrote:
> > > > How do we proceed here between [1] and [2]?
> > > >
> > > > DT-Maintainers suggestion:
> > > > [1]
> > > > raa215300: pmic@12 {
> > > >   compatible =3D "renesas,raa215300";
> > > >   reg =3D <0x12>, <0x6f>;
> > > >   reg-names =3D "main", "rtc";
> > > >
> > > >   clocks =3D <&x2>;
> > > >   clock-names =3D "xin";
> > > >   /* Add Optional shared IRQ resource and share it to child and han=
dle
> > > > it both in parent and child */ };
> > > >
> > > > Laurent/Wolfram suggestion to split it into two nodes and get rid o=
f this patch:
> > > > [2]
> > > >   raa215300: pmic @12 {
> > > >           compatible =3D "renesas,raa215300";
> > > >           reg =3D <0x12>;
> > > >
> > > >           /* Add Optional shared IRQ */
> > > >           renesas,raa215300-rtc =3D <&rtc_raa215300>; /* Parse the =
handle and Enable RTC , if present.*/
> > > >   };
> > > >
> > > >   rtc_raa215300: rtc@6f {
> > > >           compatible =3D "renesas,raa215300-isl1208";
> > >
> > > Make this
> > >
> > >             compatible =3D "renesas,raa215300-isl1208", "isil,isl1208=
";
> > >
> > > >           reg =3D <0x6f>;
> > > >
> > > >           /* Add Optional shared IRQ */
> > > >           clocks =3D <&x2>;
> > > >           clock-names =3D "xin";
> > > >           renesas,raa215300-pmic =3D <&pmic>; /* Parse the handle t=
o get PMIC
> > > > version to check Oscillator bit is inverted or not */
> > >
> > > This isn't nice. I would instead add a renesas,invert-xtoscb boolean
> > > property. If you don't want different DT sources for different revisi=
ons
> > > of the PMIC,
> >
> > I need to support all PMIC versions with same image, as PMIC is just a =
component on the
> > SoM module. So SoM's have different PMIC versions.
>
> I understand it's not convenient, so let's try to find a good solution.
>
> > > one option is to perform the auto-detection in the boot
> > > loader and update the DT dynamically there.
> >
> > Yes, this is an option. Bootloader updates "renesas,invert-xtoscb" prop=
erty based
> > on PMIC version.
> >
> > Not sure, From binding perspective, Documenting "renesas,invert-xtoscb"=
 is OK for
> > the relevant maintainers??
>
> It's fine with me at least :-) I think a property makes sense, as it
> describes the device. Updating the device tree in the boot loader based
> on auto-detection of features is also fairly common (to set the amount
> of DRAM for instance).
>
> What I'm not entirely sure about in this case is if a property would be
> the best option, or two different compatible strings. I'll let the
> appropriate maintainer recommend one of those two options. In either
> case, the boot loader would be responsible for updating the DT.

Indeed. DT binding best practices 101: do not use properties to
distinguish, use compatible values instead.

And don't use different compatible values if you can distinguish using
a version register.  Unfortunately the version register is part of the
main/first device (the PMIC), so the RTC cannot find out easily...

So basically you have an i2c mfd.  The Linux mfd subsystem is tailored
for platform devices, so it's not a good match.  The closest we have
in i2c is the ancillary device...

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
