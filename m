Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13477196F9A
	for <lists+dri-devel@lfdr.de>; Sun, 29 Mar 2020 21:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34E089E3B;
	Sun, 29 Mar 2020 19:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5AB89E3B
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 19:04:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D9D85804FC;
 Sun, 29 Mar 2020 21:03:53 +0200 (CEST)
Date: Sun, 29 Mar 2020 21:03:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 32/36] dt-bindings: display: convert sharp, ls037v7dw01
 to DT Schema
Message-ID: <20200329190352.GA21479@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-33-sam@ravnborg.org>
 <20200319030734.GH29911@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319030734.GH29911@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=8lPrDCVDlfZqt0RlNdoA:9 a=CjuIK1q_8ugA:10
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
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
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
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

> > +
> > +  mode-gpios:
> > +    description: |
> > +      GPIO ordered MO, LR, and UD as specified in LS037V7DW01.pdf
> 
> 3 or...
> 
> > +      change configuration between QVGA and VGA mode and the
> > +      scan direction. As these pins can be also configured
> > +      with external pulls, all the GPIOs are considered
> > +      optional with holes in the array.
> 
> minItems: 3
> maxItems: 5

This binding can specify up to three GPIOs like this:


> > +        mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH        /* gpio154, lcd MO */
> > +                      &gpio1 2 GPIO_ACTIVE_HIGH         /* gpio2, lcd LR */
> > +                      &gpio1 3 GPIO_ACTIVE_HIGH>;       /* gpio3, lcd UD */

They are in the linux kernel driver accessed like this:

    devm_gpiod_get_index(&pdev->dev, "mode", 2, GPIOD_OUT_LOW);

The following is OK in the DT file:

    mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH>;

    mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH
                  &gpio1 2 GPIO_ACTIVE_HIGH>;
		  
    mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH
                  &gpio1 2 GPIO_ACTIVE_HIGH
                  &gpio1 3 GPIO_ACTIVE_HIGH>;

But the following is not OK:
    mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH>, <&gpio1 2 GPIO_ACTIVE_HIGH>;

Any hints how to specify the binding to prevent the above?
I have tried a few combinations - but they do not catch this.
So my binding attempts are not restrictive enough.

Any hints how to describe this properly?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
