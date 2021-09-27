Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E178419A63
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 19:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E29F89C0A;
	Mon, 27 Sep 2021 17:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8231389C0A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 17:07:06 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DFDF5580864;
 Mon, 27 Sep 2021 13:07:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 27 Sep 2021 13:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:date:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=C23JHerz+uo3XKNwE1t4BeW8sj1
 7nTbI7dVeuDRxUmU=; b=FcORk3VtJdjphBsYbRbfRwmkQK0fVtv6KQAIYwW7isK
 6JIGneIoognErzIYqDOHKAKxCXEOA97UfJe1XNL8KCZy8z7TfiukdS5xsrfUzZFp
 rLf1fXa/HhdxtP5RSuCc1gPCJ8lcgMq9TMCIEl5GmCOa+P3etfg2GKIoqxTwDu6O
 o5isglcnxLJTUfwwrLgHlWiNV9Xn+hro7q37PLO6beNC5Q9MeNwiDjQSgAatt4iJ
 TtU1COq0WVqcATwApgUmgypJT+YSZHXWVDOh5lmBljaejYfqEy8OgU1XpEfQwup6
 m+CRz1rNsNEZeWcHM3QIPEkGog/hn7HVe7waFweNpcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=C23JHe
 rz+uo3XKNwE1t4BeW8sj17nTbI7dVeuDRxUmU=; b=AumqthNKsvCRFbLaVtRxgg
 9Yh9K6j3P6zDURnIOPUIBIQnt3kQV5ME+Osou3m5wyqpR5O6jqohCchhebTPjs2G
 Ssp3YAdeue5Rve0d3tMBdWQvuwO5PnALLztya6mGYr6cA2/2ZSa2RZg6j1WouguO
 rFmO6bnabo/4AsHhjfz56e4uzX2eApWpO5HQrVTrD5WhxP2LM7gCHBvrRbelBn16
 7q3fO63OAVi/ei9znwsKGSz476hb8NDzNluK1x7ppEbYiGHM1TusP4AcBa6fw+5y
 dGhvfV93CpBoL7yGxi/xwOrx2/xBoMAinRI+oZuht2QIS7WNFCm9UilMcVXMfzIw
 ==
X-ME-Sender: <xms:OPpRYQAVxJO_y9oFDk94UQbD8i43-Na3ZSIfFhVy-7sStCLUhETxKg>
 <xme:OPpRYSgNUbm4kWXiGvrshDYS2Fi_33smii0aUr5AD7juzh31pPbiGCJJh4OjU-PFo
 HCshIIb8tWMU70pLaE>
X-ME-Received: <xmr:OPpRYTnilIFfe_2pucrU1nTgecs_MbEGb6vwi5q8bYYW6_PoQIYBhS-t3zTA735gk2p1Xubf6cbQQhMX1F41JdvQq1B0IBH8DsvPytPz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedguddtiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeihfdvlefhtefgtefgtd
 evieekjeegvdejffdvtefgudelkeefieetgeevieevteenucffohhmrghinhepuggvvhhi
 tggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OPpRYWz0Ei924i9XTUkRI9ZFTqwq4hwGIR29C19Y7aOMfH08dA5_vg>
 <xmx:OPpRYVTefkrUwtlUuydnAUS73rH5KBQ9y8qQmBpaTMqKSuclzGHfvA>
 <xmx:OPpRYRa-GgKxFXK1LU-lbELSV3TWdJo6pg9t6hQdHgyGuee6256Q9Q>
 <xmx:OfpRYQ_wtch0dhFxsEjUSkpu8hhFfGkZg8f6H95OyjzjJYVI2GXj5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 13:07:04 -0400 (EDT)
From: maxime@cerno.tech
Date: Mon, 27 Sep 2021 19:07:02 +0200
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,	Sam Ravnborg <sam@ravnborg.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>,	devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org,	linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org,	Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 03/10] dt-bindings: display: Add
 ingenic,jz4780-dw-hdmi DT Schema
Message-ID: <20210927170702.on243lp24fcfdhbj@gilmour>
65;6402;1cFrom: Maxime Ripard <maxime@cerno.tech>
References: <cover.1632761067.git.hns@goldelico.com>
 <6c8b72a03703de54fa02b29c1a53c84ca0889e50.1632761067.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j6vwrplgw63cjval"
Content-Disposition: inline
In-Reply-To: <6c8b72a03703de54fa02b29c1a53c84ca0889e50.1632761067.git.hns@goldelico.com>
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


--j6vwrplgw63cjval
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 27, 2021 at 06:44:21PM +0200, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>=20
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4=
780-hdmi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdm=
i.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> new file mode 100644
> index 000000000000..5e60cdac4f63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic JZ4780 HDMI Transmitter
> +
> +maintainers:
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |
> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare HD=
MI 1.4
> +  TX controller IP with accompanying PHY IP.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#

Is it a panel though?

> +properties:
> +  compatible:
> +    items:
> +      - const: ingenic,jz4780-dw-hdmi

This can just be a const, there's no need for the items

> +
> +  reg:
> +    maxItems: 1
> +    description: the address & size of the LCD controller registers

There's no need for that description, it's obvious enough

> +  reg-io-width:
> +    const: 4

If it's fixed, why do you need it in the first place?

> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the interrupt provided by parent

There's no need for that description, it's obvious enough

> +  clocks:
> +    maxItems: 2
> +    description: Clock specifiers for isrf and iahb clocks

This can be defined as

clocks:
  items:
    - description: isrf
    - description: iahb

A better description about what these clocks are would be nice as well

> +  clock-names:
> +    items:
> +      - const: isfr

Is it isfr or isrf?

> +      - const: iahb
> +
> +  hdmi-regulator: true
> +    description: Optional regulator to provide +5V at the connector

regulators need to be suffixed by -supply

You also can just provide the description, you don't need the true there

> +  ddc-i2c-bus: true

ditto

> +    description: An I2C interface if the internal DDC I2C driver is not =
to be used
> +  ports: true

If there's a single port, you don't need ports

You should also include /schemas/graph.yaml#/$defs/port-base

Maxime


--j6vwrplgw63cjval
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYVH6NgAKCRDj7w1vZxhR
xalAAP4tvNejSW/x6s4rB4S+KzL6lJIvVmJobeQcfT8CtoUBOQEAg/6rE4/wtT/n
IHVxntZxhsCa4XBOGO/RZGHSn6WlHwY=
=hZe+
-----END PGP SIGNATURE-----

--j6vwrplgw63cjval--
