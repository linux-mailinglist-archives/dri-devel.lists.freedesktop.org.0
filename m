Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9927734740
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 19:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067E110E0B1;
	Sun, 18 Jun 2023 17:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5824410E0B1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 17:37:37 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687109855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FDZptFO5NnQUxuhT5MsLR5+QMUnZ7oxNR+YgYIxL7G8=;
 b=pbjtJlayc2DOxdDC0J4JxvK7c8NRGvGgmZkNgNuU/U/ngtZFeYGE4rq4oj4I0DgJCURhfP
 T7N63SiylXRtVDv/deAibVYZV2omW0C16oryHLP4b8+w/YMdZSFCkIQJKNkwYRiwK0uAIt
 V0fBrTXbVhDDY+S6UkbuzkEcME3av2ZlAl1UojzItSZ2u2tfxTf8yTb2jND3Q3qUQt+ro0
 Rzn1mV3jhXhYMG367CWZA2kQNB5FJDuguSa5w7oMOKBoekJC8Xa3no2jHJq6nX0ls+XDmZ
 5ddIYjemgbRvkGNW+SJgGPb4L6CM86s7dZMCvSth90YLRlgeaiTkFl4s1vpWJQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB54BC0002;
 Sun, 18 Jun 2023 17:37:33 +0000 (UTC)
Date: Sun, 18 Jun 2023 19:37:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 2/6] dt-bindings: display: st7789v: bound the number
 of Rx data lines
Message-ID: <20230618193732.04fc1909@xps-13>
In-Reply-To: <tcxifa7ol3fukfsdw7hh3kl25dhpviu6lasdc6xasz4dvhjedx@mo2vae6smtok>
References: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
 <20230616163255.2804163-3-miquel.raynal@bootlin.com>
 <tcxifa7ol3fukfsdw7hh3kl25dhpviu6lasdc6xasz4dvhjedx@mo2vae6smtok>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

maxime@cerno.tech wrote on Sun, 18 Jun 2023 16:37:58 +0200:

> Hi,
>=20
> On Fri, Jun 16, 2023 at 06:32:51PM +0200, Miquel Raynal wrote:
> > The ST7789V LCD controller supports regular SPI wiring, as well as no Rx
> > data line at all. The operating system needs to know whether it can read
> > registers from the device or not. Let's detail this specific design
> > possibility by bounding the spi-rx-bus-width property.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  .../devicetree/bindings/display/panel/sitronix,st7789v.yaml   | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,s=
t7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st77=
89v.yaml
> > index 0ccf0487fd8e..a25df7e1df88 100644
> > --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.=
yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.=
yaml
> > @@ -29,6 +29,10 @@ properties:
> >    spi-cpha: true
> >    spi-cpol: true
> > =20
> > +  spi-rx-bus-width:
> > +    minimum: 0
> > +    maximum: 1
> > + =20
>=20
> It's not clear to me what the default would be?

This binding references spi-peripheral-props.yaml which sets the
default to 1, I believe it is sane to keep it that way?

Thanks,
Miqu=C3=A8l
