Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE25419A047
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 22:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6CB6E214;
	Tue, 31 Mar 2020 20:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAB56E214
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 20:57:42 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDC012166E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 20:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585688261;
 bh=cZUq7aaNQWWsd7nujXKdGojgy9Xn5BD3Y6JU9Kd2Mwo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CNAgVPOG2kU8wA8iP+Bzok2rh/UxvzMgzdMFqG/gQ1EBJBPuUFtdHGtwMCeFyL+f2
 16pbR89Ns7T9UiweJC3IRgssi7s3UEZCBUQLdz/OF7qYUTkjo7qQW3EQYcVr/iThMo
 1kvlc1qgT1LyhGozvcK3C5sn3uvVoOYmyXIIWXrk=
Received: by mail-qk1-f170.google.com with SMTP id v7so24746082qkc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 13:57:41 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0N1QS2XWTENz3Ow8iC7Mflsc8qfS0qig7qhXbLMKu2Qr9a05Bk
 oYWvWbMxR40S/cv2COW7SDfMdhzFKy0zdmqrqQ==
X-Google-Smtp-Source: ADFU+vvq34TxHm4hqjlR/CY7tWkOnMzotYoHbjOsldxdZa66U+ehdQSMRAA7wRqGNd9dlPqxDXPM0hTjMOhNo5FqmBY=
X-Received: by 2002:a37:aa92:: with SMTP id t140mr6375840qke.119.1585688260747; 
 Tue, 31 Mar 2020 13:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-33-sam@ravnborg.org>
 <20200319030734.GH29911@bogus> <20200329190352.GA21479@ravnborg.org>
 <CAL_JsqJGpCBohddU+h3366rzGVw6mgn5H9YMqq-MF4Ka=mVkzw@mail.gmail.com>
 <20200331191353.GA14267@ravnborg.org>
In-Reply-To: <20200331191353.GA14267@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 31 Mar 2020 14:57:29 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+S1yjX3aH7jYiMGUsgvwCju2KgCvn57Pv9DYZ4LfHa7Q@mail.gmail.com>
Message-ID: <CAL_Jsq+S1yjX3aH7jYiMGUsgvwCju2KgCvn57Pv9DYZ4LfHa7Q@mail.gmail.com>
Subject: Re: [PATCH v1 32/36] dt-bindings: display: convert sharp, ls037v7dw01
 to DT Schema
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi <linux-spi@vger.kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 1:14 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Tue, Mar 31, 2020 at 11:20:13AM -0600, Rob Herring wrote:
> > On Sun, Mar 29, 2020 at 1:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Rob.
> > >
> > > > > +
> > > > > +  mode-gpios:
> > > > > +    description: |
> > > > > +      GPIO ordered MO, LR, and UD as specified in LS037V7DW01.pdf
> > > >
> > > > 3 or...
> > > >
> > > > > +      change configuration between QVGA and VGA mode and the
> > > > > +      scan direction. As these pins can be also configured
> > > > > +      with external pulls, all the GPIOs are considered
> > > > > +      optional with holes in the array.
> > > >
> > > > minItems: 3
> > > > maxItems: 5
> > >
> > > This binding can specify up to three GPIOs like this:
> >
> > So it should be:
> >
> > minItems: 1
> > maxItems: 3
> >
> > > > > +        mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH        /* gpio154, lcd MO */
> > > > > +                      &gpio1 2 GPIO_ACTIVE_HIGH         /* gpio2, lcd LR */
> > > > > +                      &gpio1 3 GPIO_ACTIVE_HIGH>;       /* gpio3, lcd UD */
> > >
> > > They are in the linux kernel driver accessed like this:
> > >
> > >     devm_gpiod_get_index(&pdev->dev, "mode", 2, GPIOD_OUT_LOW);
> > >
> > > The following is OK in the DT file:
> > >
> > >     mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH>;
> > >
> > >     mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH
> > >                   &gpio1 2 GPIO_ACTIVE_HIGH>;
> > >
> > >     mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH
> > >                   &gpio1 2 GPIO_ACTIVE_HIGH
> > >                   &gpio1 3 GPIO_ACTIVE_HIGH>;
> >
> > With the above, the 2nd 2 should fail...
> >
> > > But the following is not OK:
> > >     mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH>, <&gpio1 2 GPIO_ACTIVE_HIGH>;
> >
> > And this should pass. We want phandle+arg type properties to be
> > bracketed like this.
>
> OK, so if I get you right you say that we should accept the:
> <phandle+arg>, <phandle+arg> ... syntax.
>
> And then ignore that current DT files uses:
> <phandle+arg phandle+arg>
>
>
> A binding like this:
>  mode-gpios:
>     minItems: 1
>     maxItems: 3
>     description: |
>       GPIO ordered MO, LR, and UD as specified in LS037V7DW01.pdf
>       This panel can have zero to three GPIOs to configure to
>
>
> Do not error out when the example looks like this:
>
>         mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH        /* gpio154, lcd MO */
>                       &gpio1 2 GPIO_ACTIVE_HIGH         /* gpio2, lcd LR */
>                       &gpio1 3 GPIO_ACTIVE_HIGH>;       /* gpio3, lcd UD */

That's because we can't distinguish between this and 1 entry as the
schema doesn't have visibility of what #gpio-cells value is. dtc does
check that the cell sizes are correct. We'll need to somehow combine
that and the schema to check this form correctly.

>
> So if I get you right this is a bug in the tooling.

Limitation I guess. I thought you where saying the bracketed form was
not working.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
