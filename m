Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708BF41AB9D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 11:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B585189E5F;
	Tue, 28 Sep 2021 09:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C95489E5F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 09:18:12 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 952F65805DD;
 Tue, 28 Sep 2021 05:18:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 28 Sep 2021 05:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=a
 z58RAATejJOnuwYVDi925Y5L5Fz8v8ETOF1VVXfBFo=; b=mkFIkhnTkD262P8Bg
 f1tIlQZrFdVw1cP7H9BBmWxTQF6b5mjae2413trvlP/CZ2NBr5+ZwX0UJ9OFzvBd
 nLRBxRbHVwuH6MBwubzC7aMfSxToIM9Kc2hzDNrlKY83hA7OZ0FR3QOr7pD8HEOD
 lbQbUfHn5qilrvRgkLn7zaEyAEBLeI+1goh90CzhK6ZzwT5OFQgDVoive+sovI0R
 9jmNRcML0RqkfnQLc+igmQwPNQS8T6x6JD/jp0dndMvxtTL4F1NC1Ff5gKpIw+UV
 fOsVHZrlSrCvqW7OKlnXCrtpJH+tLqqqSfK9hRdTrSKJbBSpMbNGtZ418RujdLA2
 OLYNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=az58RAATejJOnuwYVDi925Y5L5Fz8v8ETOF1VVXfB
 Fo=; b=rfG7exEEIVLxzpRwK3TohfxlxFmByaAfXcABxwKjk67aN6Jwi188Ev45+
 SNpsmsXpMlJaw4vOsIFn13seohtIiYdkYzCfjg3DHlGiNXMZpqWmKw33BfZeB6nX
 o+JroOJd6jAdNjFFsUs6MgpnaVuyWrjAtz5If9JNu/3hDXCKsOWE/B+Qa2F2qh4x
 kgcF/DDodk8eYLm7B6ChCa4NmpTBBVB0wPZIh6yLD/0/tHKHOr3xaZ+KV8tjv0fL
 m6aXxOj5IRW78jf2a9JTNwGTy/PNhW2Fx2++OTjVfjJ3QyxDvpv5LJ8Wc1oYKJEu
 vlGNno8kgehwScDbf/DZZQoBnAEdg==
X-ME-Sender: <xms:0d1SYTSkOVGLaTDvKb7bSx3g2PLhUE1q4F-drfTVnz68Ey0e1rSUMQ>
 <xme:0d1SYUy-9x6xkL7am5hURVJM8Mb2Tq1geK4s5kIB1bZ4BClHGkX50jyVmO1UQi5TE
 bVX7I-XA2tZnMxappY>
X-ME-Received: <xmr:0d1SYY2m5BFFrPgJgcPjBFltzmbxi-dP_QlaN0CxTZ7S1EG5jl3_8cQoHPpmDm4Eaw0V8SJkKDZZRB4H5YtGoOPPII4tqXsJ8-01krXH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0d1SYTAE3SAKplh0RD2GGlSKpV4rHmkxG7LZOYEClF6x0cxVUiXskw>
 <xmx:0d1SYcisYUhRDUfxM9rvcjDqyCOI-MI_a2cF2_r136Jj9W8LmzMqyg>
 <xmx:0d1SYXrdGMy-gaanmz3jc5nIhCC94IKt1aohdY-ZTBuDc2d4eloerw>
 <xmx:091SYaN_G8DqT03oJb9VyCR2LGkFmLftcoQI0a0fZ2n9Cj8Ag5vmpg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 05:18:08 -0400 (EDT)
Date: Tue, 28 Sep 2021 11:18:07 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>,	Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,	linux-mips <linux-mips@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 03/10] dt-bindings: display: Add
 ingenic,jz4780-dw-hdmi DT Schema
Message-ID: <20210928091807.xgqxemjizlobpcxy@gilmour>
References: <cover.1632761067.git.hns@goldelico.com>
 <6c8b72a03703de54fa02b29c1a53c84ca0889e50.1632761067.git.hns@goldelico.com>
 <20210927170702.on243lp24fcfdhbj@gilmour>
 <C529DB99-709A-4C24-B647-3A2004CBFE18@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <C529DB99-709A-4C24-B647-3A2004CBFE18@goldelico.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 28, 2021 at 10:59:45AM +0200, H. Nikolaus Schaller wrote:
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: ingenic,jz4780-dw-hdmi
> >=20
> > This can just be a const, there's no need for the items
>=20
> Maybe starting with an enum is better if more compatible strings are to b=
e added.

it's still fairly easy to change if needed, there's no need to confuse
anyone.

> >=20
> >> +  reg-io-width:
> >> +    const: 4
> >=20
> > If it's fixed, why do you need it in the first place?
>=20
> There is a fixed default of 1 if not specified.

My point was more about why do you need to have that property at all?
Can't you just drop it and assume that the register width is 32 bits if
it's all you will ever run on?

> >> +  clocks:
> >> +    maxItems: 2
> >> +    description: Clock specifiers for isrf and iahb clocks
> >=20
> > This can be defined as
> >=20
> > clocks:
> >  items:
> >    - description: isrf
> >    - description: iahb
> >=20
> > A better description about what these clocks are would be nice as well
>=20
> Generally I see that this all is nowadays not independent of
>=20
> Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>=20
> where there is already a description.

Ok, good then

> On the other hand every SoC specialization runs its own copy. e.g.
>=20
> Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yam
>=20
> >=20
> >> +  clock-names:
> >> +    items:
> >> +      - const: isfr
> >=20
> > Is it isfr or isrf?
>=20
> isfr. Seems to be a typo in the description. See
> bridge/synopsys,dw-hdmi.yaml#
>=20
> One question to the yaml specialists:
>=20
> since ../bridge/synopsys,dw-hdmi.yaml# already defines this, do we
> have to repeat? Or can we reduce to just the changes?

If you add the ref you mentionned above, you don't have to repeat
yourself indeed. You can just put clock-names: true

> [I am still not familiar enough with the yaml stuff to understand if
> it has sort of inheritance like device tree include files, so that you
> just have to change relevant properties]

Kind of, but not entirely. schemas are all applied separately, unlike DT
includes that will just expand to one big DT. In practice, it means that
your device must validate against all the schemas, not just the sum of
them.

For example, if you have a generic schema that has:

properties:
  compatible:
    const: vendor,my-generic-compatible


and your schema that extends the generic binding, with a ref to the
generic one that has:

properties:
  compatible:
    items:
      - const: other-vendor,my-device-compatible
      - const: vendor,my-generic-compatible


It will still fail since the generic schema expects only a single
compatible, whereas your device would have two.

> >=20
> >> +      - const: iahb
>=20
> would it make sense to add additionalItems: false here?
>=20
> In the jz4780 case there are just two clocks while other specializations
> use more and synopsys,dw-hdmi.yaml# defines additionalItems: true.

If you want to refine the generic one, and it's all the clocks you ever
expect then there's no need for additionalItems

> >=20
> >> +    description: An I2C interface if the internal DDC I2C driver is n=
ot to be used
> >> +  ports: true
> >=20
> > If there's a single port, you don't need ports
>=20
> There can be two ports - one for input from LCDC and one
> for output (HDMI connector). But explicitly defining an output
> port is optional to some extent (depending on driver structure).

This needs to be defined then (and port@0 made mandatory)

Maxime
