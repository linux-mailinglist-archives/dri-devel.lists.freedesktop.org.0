Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5D199CB7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 19:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB9D6E86C;
	Tue, 31 Mar 2020 17:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F026E86C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 17:20:27 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 811FD214D8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585675227;
 bh=D7FWF2ylL+0NQ2FWuF8jpzvckwDCaUUfutqBPPPnLhY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xm4DyzFlw4jGGUBlaafwQAckXswyUC7+wK8f9dZih9Eow6b2D8WjrmJf5p/Jld3fG
 gQB5Lnaki+PI71nuqEdqSxCB4N0N8kXzta0yDfuH9HdjW0bjHdxslO1Ws5cAcqT3op
 uQeXB1rPjS35avDSI+GNxcBACEkSyeQLXjnU25xY=
Received: by mail-qt1-f178.google.com with SMTP id e14so19061193qts.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 10:20:27 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2bxuODu/hZWYTbOGPhgNdTyhYBb7B18MehWQgKqRHqfUulSxVB
 L3lXqOz1iaGr406Ra0vngMJS1DiuiRY91/OE+Q==
X-Google-Smtp-Source: ADFU+vuIDLlP6mJJzdijDIsPAvdYaGjDtb9aCWKF5WJKEAR+/umG5DoIAzKXfoqzc8KIaBO8hshbu4VG7fPqaOkBerA=
X-Received: by 2002:aed:3461:: with SMTP id w88mr6324133qtd.143.1585675226482; 
 Tue, 31 Mar 2020 10:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-33-sam@ravnborg.org>
 <20200319030734.GH29911@bogus> <20200329190352.GA21479@ravnborg.org>
In-Reply-To: <20200329190352.GA21479@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 31 Mar 2020 11:20:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJGpCBohddU+h3366rzGVw6mgn5H9YMqq-MF4Ka=mVkzw@mail.gmail.com>
Message-ID: <CAL_JsqJGpCBohddU+h3366rzGVw6mgn5H9YMqq-MF4Ka=mVkzw@mail.gmail.com>
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

On Sun, Mar 29, 2020 at 1:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> > > +
> > > +  mode-gpios:
> > > +    description: |
> > > +      GPIO ordered MO, LR, and UD as specified in LS037V7DW01.pdf
> >
> > 3 or...
> >
> > > +      change configuration between QVGA and VGA mode and the
> > > +      scan direction. As these pins can be also configured
> > > +      with external pulls, all the GPIOs are considered
> > > +      optional with holes in the array.
> >
> > minItems: 3
> > maxItems: 5
>
> This binding can specify up to three GPIOs like this:

So it should be:

minItems: 1
maxItems: 3

> > > +        mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH        /* gpio154, lcd MO */
> > > +                      &gpio1 2 GPIO_ACTIVE_HIGH         /* gpio2, lcd LR */
> > > +                      &gpio1 3 GPIO_ACTIVE_HIGH>;       /* gpio3, lcd UD */
>
> They are in the linux kernel driver accessed like this:
>
>     devm_gpiod_get_index(&pdev->dev, "mode", 2, GPIOD_OUT_LOW);
>
> The following is OK in the DT file:
>
>     mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH>;
>
>     mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH
>                   &gpio1 2 GPIO_ACTIVE_HIGH>;
>
>     mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH
>                   &gpio1 2 GPIO_ACTIVE_HIGH
>                   &gpio1 3 GPIO_ACTIVE_HIGH>;

With the above, the 2nd 2 should fail...

> But the following is not OK:
>     mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH>, <&gpio1 2 GPIO_ACTIVE_HIGH>;

And this should pass. We want phandle+arg type properties to be
bracketed like this.

If that's not working, then it's a bug in the tooling. Please confirm
and I'll investigate.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
