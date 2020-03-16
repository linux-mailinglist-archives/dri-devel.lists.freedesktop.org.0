Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C70186663
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 09:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B284089C59;
	Mon, 16 Mar 2020 08:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEB289C59
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 08:26:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 42BBB2002E;
 Mon, 16 Mar 2020 09:26:08 +0100 (CET)
Date: Mon, 16 Mar 2020 09:26:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 35/36] dt-bindings: display: convert
 lgphilips,lb035q02 to DT Schema
Message-ID: <20200316082607.GA18510@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-36-sam@ravnborg.org>
 <a73da9d3-43b2-3ce7-85e9-8135dbf48e98@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a73da9d3-43b2-3ce7-85e9-8135dbf48e98@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=IAW4dMXMqXHR358p9ncA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=aeg5Gbbo78KNqacMgKqU:22
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

Hi Tomi.

Thanks for your feedback.

On Mon, Mar 16, 2020 at 09:57:57AM +0200, Tomi Valkeinen wrote:
> Hi Sam,
> 
> On 15/03/2020 15:44, Sam Ravnborg wrote:
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >   .../display/panel/lgphilips,lb035q02.txt      | 33 ------------
> >   .../display/panel/lgphilips,lb035q02.yaml     | 54 +++++++++++++++++++
> >   2 files changed, 54 insertions(+), 33 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
> >   create mode 100644 Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
> > deleted file mode 100644
> > index 1a1e653e5407..000000000000
> > --- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -LG.Philips LB035Q02 Panel
> > -=========================
> > -
> > -Required properties:
> > -- compatible: "lgphilips,lb035q02"
> > -- enable-gpios: panel enable gpio
> > -
> > -Optional properties:
> > -- label: a symbolic name for the panel
> > -
> > -Required nodes:
> > -- Video port for DPI input
> 
> Isn't this also compatible with panel-simple bindings? 'label' is the only
> one not in panel-simple, but that's optional and has never been used by the
> panel driver.
The panel is a SPI slave - which is not too obvious from the old
binding.

The new DT Schema includes spi/spi-slave.yaml to give the binding
proper access to the spi slave properties.

That would not be possible with panel-simple binding as no further
properties are allowed with the panel-simple binding.

I hope this explains why there is a dedicated binding for this panel.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
