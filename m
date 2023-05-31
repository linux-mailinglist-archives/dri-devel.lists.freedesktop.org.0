Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA8718219
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 15:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F0310E4C7;
	Wed, 31 May 2023 13:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8950F10E4C7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 13:39:48 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-19f56608dc2so1880441fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 06:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685540387; x=1688132387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rSOChSb4Rql4ADuqVo8nyBzIdfufwXtQLzEn6jqADzE=;
 b=E4AZAnexpVt08gsBResKo+P/y+tiwFzpkuP9bMsMGIfDbJFto5sRBD7SMtysox5Yrj
 ciYN/3lXMgu1o4NCYm4IntuVKAWGZ/mAiLV9Y8ek5p5pE8VIP1p0Wqn28QZRGjALFdte
 ZAJTFZQnzpzuHxCtH96N+/k+Pm9h507Mvj7SWrqE/kxFT/msk9cFdvjECNCs0wAQrnC1
 sVo2QJ2QQ1oVfbny4Kd3qhqbeRErKNt+SjlLx2eQD3NAJ4PDHayHcoe84FFTusMjuh0V
 eEa3YZrNY45OVzK7+BEbth+qedj27yViOU2HwfStE7QulFQifwKRiDHVo0JTIPS+0pVY
 mk3Q==
X-Gm-Message-State: AC+VfDwwHuStQI1SAgcHKwin/MtEXIHGK2atyq5mZDs9o1mOcOk7VKrI
 WzPw2QGpGg9vyVmbw5aDmcxIxANRy8v/5A==
X-Google-Smtp-Source: ACHHUZ60elObSpr1aWk1sssX5LOcW5j6JGSQLRsnbLGeXrt7uyTwtmg940V9O6ZrPeQPEAhG75dm3w==
X-Received: by 2002:a05:6870:98a6:b0:19e:bcc4:8f66 with SMTP id
 eg38-20020a05687098a600b0019ebcc48f66mr3029275oab.29.1685540387188; 
 Wed, 31 May 2023 06:39:47 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com.
 [209.85.160.50]) by smtp.gmail.com with ESMTPSA id
 g9-20020a9d6209000000b006af7ccca526sm475691otj.20.2023.05.31.06.39.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 06:39:45 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-19a308a045aso2838179fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 06:39:45 -0700 (PDT)
X-Received: by 2002:a05:6870:5ab4:b0:18e:dec0:8d09 with SMTP id
 dt52-20020a0568705ab400b0018edec08d09mr3880986oab.34.1685540385002; Wed, 31
 May 2023 06:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <20230531133706.GI27043@pendragon.ideasonboard.com>
In-Reply-To: <20230531133706.GI27043@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 May 2023 15:39:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDmyn00sX0n=KTL+HuxQc3SpfJQKJR4uhfTvTW-U8=ig@mail.gmail.com>
Message-ID: <CAMuHMdVDmyn00sX0n=KTL+HuxQc3SpfJQKJR4uhfTvTW-U8=ig@mail.gmail.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
 Alessandro Zummo <a.zummo@towertech.it>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, May 31, 2023 at 3:37=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, May 31, 2023 at 02:51:48PM +0200, Geert Uytterhoeven wrote:
> > On Wed, May 31, 2023 at 10:59=E2=80=AFAM Laurent Pinchart wrote:
> > > On Mon, May 29, 2023 at 09:00:43AM +0000, Biju Das wrote:
> > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_devi=
ce API
> > > > > And why do you need this ?
> > > >
> > > > As per Krzysztof [2],
> > > >
> > > > The DT schema allows multiple addresses for children. But we lack
> > > > implementation of parent child relationship, As parent owns the res=
ources.
> > > > Child device needs to parse parent node to get some resource
> > > > like clocks.
> > > >
> > > > [2] https://lore.kernel.org/linux-renesas-soc/TYCPR01MB5933BFFD4EB5=
56F5FB4EA82186729@TYCPR01MB5933.jpnprd01.prod.outlook.com/
> > >
> > > The I2C ancillary clients are not meant to be handled by separate
> > > drivers. You're supposed to have one device node in DT, which causes =
the
> > > I2C core to instantiate a main i2c_client, and bind it to one driver.
> > > That driver then uses i2c_new_ancillary_device() to create other
> > > i2c_client instances for the secondary I2C addresses. Those i2c_clien=
t
> > > instances are not bound to a separate driver, so there should be no c=
ode
> > > that needs to look at the parent for resources.
> >
> > In Biju's particular use case, the i2c device responds to two addresses=
,
> > which is the standard i2c ancillary use case.  However, what's special
> > is that the second instance is a derivative of an existing i2c device
> > with an existing Linux driver.  Hence the desire to make the existing
> > driver match against the second instance, which requires these changes
> > to i2c_new_ancillary_device().
> >
> > As some resources are shared (knowledge about the clocks), splitting
> > this in two distinct devices in DT (which is what Biju's initial patch
> > series did) would need phandles to link both nodes together.
> >
> > Do you have a better idea how to represent this?
>
> MFD ? Otherwise, I'll delegate that to Wolfram, I've spent enough time
> on this patch series I'm afraid :-)

That was v2... (do I need to repeat I don't like mfds? ;-)

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
