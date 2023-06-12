Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBEE72C4A2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 14:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D3E10E231;
	Mon, 12 Jun 2023 12:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3395010E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:42:35 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6b2d9ea4901so1583734a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 05:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686573753; x=1689165753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3/8p0Dr0nAJ3rltZnl/XZZhJet57aER46/0/40+UUJQ=;
 b=hTBPVntMOsUPlfTFd4wgEjVLuoxptR4YmVVMzaRJoCwNLK/gj85S33X6tDMQGuj/FW
 yN+e9Eh5DwCjLnh8kBarfuKVLgrJ53WW4cqvWB0bvskDNttk4DBTCC1R+/9m8xbCkQin
 4s+lVgp+i5ijSgOBtyQi5baW9+yt4P0hXxqPREdM2SvwK4yUR3wKB/Pj77cgqdTcgFdU
 Y9lea+fxfa+yE5ZVqMgARfMky1hvP7oxmG5g2DEPuklZKzj26qj9vrPdGiTtdHQBAncj
 rRiFQQGiqryh4Hz9GJISIQ+N4Rad2zITaPAr0XB49yiPbICSppxaoL0vfp3wDywvHACK
 o8+Q==
X-Gm-Message-State: AC+VfDwGRUXcv9LSyUZVjFzgr0eLcp4nMu1juzKkYkrSQXcFFn8ThaPg
 gmUpUovCAIClL/lpSSOZ2B2ROcH+EKDIOw==
X-Google-Smtp-Source: ACHHUZ5O97BhMFDlLma9EbGOLMwsVlBx/umvSmM75gFFg/LYMbG+MLE/I9C37uaDGyU2Tj+x6Lni3g==
X-Received: by 2002:a05:6358:e91c:b0:12b:d7f8:afad with SMTP id
 gk28-20020a056358e91c00b0012bd7f8afadmr1415791rwb.25.1686573753086; 
 Mon, 12 Jun 2023 05:42:33 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 j81-20020a25d254000000b00bcbcb91e974sm456992ybg.16.2023.06.12.05.42.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 05:42:32 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-56cf343a645so22866507b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 05:42:31 -0700 (PDT)
X-Received: by 2002:a25:becc:0:b0:bac:85af:89b1 with SMTP id
 k12-20020a25becc000000b00bac85af89b1mr8375955ybm.36.1686573751530; Mon, 12
 Jun 2023 05:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
In-Reply-To: <ZIcRKl3PDy0+yZS9@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jun 2023 14:42:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
Message-ID: <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
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
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
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

Hi Wolfram, Laurent,

On Mon, Jun 12, 2023 at 2:36=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
> > DT-Maintainers suggestion:
> > [1]
> > raa215300: pmic@12 {
> >       compatible =3D "renesas,raa215300";

If you go for separate nodes: "renesas,raa215300-pmic".

> >       reg =3D <0x12>, <0x6f>;
> >       reg-names =3D "main", "rtc";
> >
> >       clocks =3D <&x2>;
> >       clock-names =3D "xin";
> >       /* Add Optional shared IRQ resource and share it to child and han=
dle it both in parent and child */
> > };
>
> Would this binding allow to not use the RTC if the second reg is
> missing? What are the advantages of not enabling RTC? Saving power?

It doesn't work if there is no clock?

> > Laurent/Wolfram suggestion to split it into two nodes and get rid of th=
is patch:
> > [2]
> >       raa215300: pmic @12 {
> >               compatible =3D "renesas,raa215300";
> >               reg =3D <0x12>;
> >
> >               /* Add Optional shared IRQ */
> >               renesas,raa215300-rtc =3D <&rtc_raa215300>; /* Parse the =
handle and Enable RTC , if present.*/
>
> Thinking more about this: DT is hardware description, so the RTC should
> always be described in DT. If the RTC is actually activated is more a
> configuration thing, or? Brainstorming: maybe the PMIC driver could try
> to find the node with reg =3D=3D 0x6f and see if firmware has enabled it =
or
> not?

I guess the RTC part would acknowledge anyway?
It is always present, it is just part of the RAA215300.

> >       };
> >
> >       rtc_raa215300: rtc@6f {
> >               compatible =3D "renesas,raa215300-isl1208";

If you go for separate nodes:  "renesas,raa215300-rtc".

> >               reg =3D <0x6f>;
> >
> >               /* Add Optional shared IRQ */
> >               clocks =3D <&x2>;
> >               clock-names =3D "xin";
> >               renesas,raa215300-pmic =3D <&pmic>; /* Parse the handle t=
o get PMIC version to check Oscillator bit is inverted or not */
> >       };
>
> I have been scratching my head around this and wondered about one thing.
> The RTC driver needs to know if the oscillator bit is inverted. AFAIU
> this depends on the version of the PMIC (which includes the RTC). So,
> can't we simply encode the version in the compatible string?
>
> >               compatible =3D "renesas,raa215300-isl1208-01";
> >               compatible =3D "renesas,raa215300-isl1208-a0";
>
> I dunno the exact versions, but you probably get the idea.

Sure, you can put that in DT.  But it's a pity you have to do that,
as the device (the PMIC part) does know the revision...
That's why I suggested to let the PMIC part instantiate an i2c ancillary
device...

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
