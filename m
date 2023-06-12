Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A072C4B8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 14:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7018610E227;
	Mon, 12 Jun 2023 12:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDD410E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:44:49 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-56d06711fccso10770377b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 05:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686573888; x=1689165888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NxM/ZduSHHc2ByKfhrDNrtQdTcq/pb0XRbipJ1pyZng=;
 b=NkOIx1K/Lh/nyzJtxhW2sH1ayLU4NVsyp2I03JUswRSaEOMC+EzsapWHyjDBlWFhzM
 4Qn/PkPDcw8yJTxLzwc8ZBYV05PCvXXYtvNirvHn5CCG/MdinC6zR79+/w7HWFCDDryB
 uBl11jKHio6R+pr8/AcNwURC55WStbXF/HqNOdPMiKv6ChM71jV2CJQeCY+yBAzrymRU
 4Z+lPBB11vGqzLKePSzKIINpyZWES1XkgF9OOQPVTkH35VmtZ6wm1sLUnLLPpqtHZNpp
 engD+PXpAleev0zWLJCvsRVWFXb3XsGGAKqLmtDyMjPf34wf5CTbSZSUHHXRw5D+I14V
 ahKA==
X-Gm-Message-State: AC+VfDxjaTSSOCrWtdZhsrYPc7YQIZ9Uq1JJc9Z5Ksbg6WLxBkD29aSc
 ZBxrazxwRpsdVjT4p+rkPukpm3lxPPe6DQ==
X-Google-Smtp-Source: ACHHUZ6tukrIPxckQ7idw87awYXJXQMW7yUPlQo45i3+auJIsH0lVDFdbfcxAEbkninKZDnXg188+w==
X-Received: by 2002:a81:dd07:0:b0:565:9fc5:f0a1 with SMTP id
 e7-20020a81dd07000000b005659fc5f0a1mr7813988ywn.36.1686573887699; 
 Mon, 12 Jun 2023 05:44:47 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 i133-20020a816d8b000000b0056953ab06c5sm2504233ywc.95.2023.06.12.05.44.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 05:44:46 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-ba8a0500f4aso3501588276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 05:44:46 -0700 (PDT)
X-Received: by 2002:a25:e7c4:0:b0:bc9:a420:994e with SMTP id
 e187-20020a25e7c4000000b00bc9a420994emr2304847ybh.10.1686573885869; Mon, 12
 Jun 2023 05:44:45 -0700 (PDT)
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
 <20230612122353.GA22391@pendragon.ideasonboard.com>
In-Reply-To: <20230612122353.GA22391@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jun 2023 14:44:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVciwfbcnqXy=gmMjyv1_pJtvxp5Sp4osx73M-jxVKRg@mail.gmail.com>
Message-ID: <CAMuHMdWVciwfbcnqXy=gmMjyv1_pJtvxp5Sp4osx73M-jxVKRg@mail.gmail.com>
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

On Mon, Jun 12, 2023 at 2:23=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jun 12, 2023 at 09:53:02AM +0000, Biju Das wrote:
> > Hi All,
> >
> > How do we proceed here between [1] and [2]?
> >
> > DT-Maintainers suggestion:
> > [1]
> > raa215300: pmic@12 {
> >       compatible =3D "renesas,raa215300";
> >       reg =3D <0x12>, <0x6f>;
> >       reg-names =3D "main", "rtc";
> >
> >       clocks =3D <&x2>;
> >       clock-names =3D "xin";
> >       /* Add Optional shared IRQ resource and share it to child and han=
dle it both in parent and child */
> > };
> >
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
> >       };
> >
> >       rtc_raa215300: rtc@6f {
> >               compatible =3D "renesas,raa215300-isl1208";
>
> Make this
>
>                 compatible =3D "renesas,raa215300-isl1208", "isil,isl1208=
";

"renesas,raa215300-rtc", "isil,isl1208".

However, that would suggest the RAA215300 RTC can be treated as
an ISL1208, which is not true for all revisions...

> Btw, it would be nice to convert
> Documentation/devicetree/bindings/rtc/isil,isl1208.txt to YAML.

Hey, look at patch 2 in this series ;-)

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
