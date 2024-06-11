Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F9A903F05
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 16:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5310010E19B;
	Tue, 11 Jun 2024 14:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="O5UyJSFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C175910E19B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 14:43:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E372920009;
 Tue, 11 Jun 2024 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1718117000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qWHfpv+jXiy2o9uspnLye8WVPnOeDHAl++BqV0w7CAE=;
 b=O5UyJSFeA2xPnA/OYrMwNbImlf+JqBITKgrNDlruVVA74nZbE8la1RTak3sR+cQPD66/PS
 ucxHox0AAUqO7xw8PPEgJz0V0Ni771LgSFDfhz/sp0KyDW+lYM/826n3jy4FvoYaM+FFOE
 5oeASV2NlTjgEj4F7ed5X3Mtpm+3rsMnay+dOGoBd8+KMCeQjXjQtOYIjLi+pchGVpWpie
 ElX1jduFhWIqZkkTj45eIdaU20f0QoQO/QA8e1ygU3EpYj7epRCNEiazShVpIWNi2oSDmz
 +7ZYyOeK9zSqiG68gxeXn5AeXkTnDMos+F+vjy34NXp6OCOIEbnWIX6vnD7PLQ==
Date: Tue, 11 Jun 2024 16:43:15 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan
 <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, Paul Kocialkowski
 <contact@paulk.fr>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: connector: add GE SUNH hotplug
 addon connector
Message-ID: <20240611164315.64414552@booty>
In-Reply-To: <20240605144531.GA2642279-robh@kernel.org>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-1-ec32f2c66d56@bootlin.com>
 <20240510163625.GA336987-robh@kernel.org>
 <20240514185125.58225238@booty>
 <20240605144531.GA2642279-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Rob,

thanks for the follow up. I still have a couple questions for you
before I see a clear direction forward, see below.

On Wed, 5 Jun 2024 08:45:31 -0600
Rob Herring <robh@kernel.org> wrote:

[...]

> > > > +  # "base" overlay describing the common components on every add-o=
n that
> > > > +  # are required to read the model ID   =20
> > >=20
> > > This is located on the add-on board, right? =20
> >=20
> > Exactly. Each add-on has an EEPROM with the add-on model ID stored
> > along with other data.
> >  =20
> > > Is it really any better to have this as a separate overlay rather tha=
n=20
> > > just making it an include? Better to have just 1 overlay per board=20
> > > applied atomically than splitting it up. =20
> >=20
> > (see below)
> >  =20
> > > > +  - |
> > > > +    &i2c1 {   =20
> > >=20
> > > Generally, I think everything on an add-on board should be underneath=
=20
> > > the connector node. For starters, that makes controlling probing and=
=20
> > > removal of devices easier. For example, you'll want to handle=20
> > > reset-gpios and powergood-gpios before any devices 'appear'. Otherwis=
e,=20
> > > you add devices on i2c1, start probing them, and then reset them at s=
ome=20
> > > async time? =20
> >=20
> > This is not a problem because the code is asserting reset before
> > loading the first overlay. From patch 5/5: =20
>=20
> What if the bootloader happened to load the overlay already? Or you=20
> kexec into a new kernel?

When an overlay is loaded by the bootloader, IIRC it becomes an
integral part of the live device tree and is not removable anymore.
This does not make sense for a physically removable add-on: as the
add-on can be physically removed, its device tree representation must
be removable as well.

And the main board is able to work autonomously without the add-on, so
I don't see any reason for loading the overlay in the bootloader.

For the kexec case, the main use cases I can think of involves 'kexec
--dtb=3D...' to loads its own copy of the base DT (without overlays). So
everything will probe again, and the overlays will be loaded again
by the connector driver if/whan the add-on is connected.

And if there are use cases of kexec when the 2nd kernel finds the DT
with the overlays already loaded, this is just as wrong as in the
bootloader case.

> Keeping things underneath a connector node makes managing the=20
> dependencies easier. It also can allow us to have some control over what=
=20
> overlays can and can't modify. It also reflects reality that these=20
> devices sit behind the connector.

=46rom my limited point of view, these points appear all nice to have but
not strictly needed. About the last one, referring to your example:

> > > For i2c, it could look something like this:
> > >=20
> > > connector {
> > >   i2c {
> > > 	i2c-parent =3D <&i2c1>;
> > >=20
> > > 	eeprom@50 {...};
> > >   };
> > > }; =20

I definitely understand the usefulness of such an additional level of
indirection in the most general case, to decouple the add-on side of the
I2C bus from the base board side of it, thus allowing multiple different
base board models and even helping with having multiple connectors
(multiple add-ons at the same time) on the same main board.

But I also see drawbacks.

The first one is added complexity.

The second is that this representation seems to suggest that the 'i2c'
node above is another bus w.r.t. '&i2c1', somewhat similarly to what
happens with child busses of an i2c mux being a different node from the
parent bus. But in this case they are really the same bus on the same
electrical lines (when the add-on is connected).

So I think both representations have pros and cons.

Back to the specific product I'm working on: there is only one base
board model, and also only one connector per main board, and this is by
the very nature of the product, i.e. it would not make sense to have
two connectors on the same board.

So in the specific case of this product, do you think it would be OK to
keep the representation I proposed initially?

> > > Do you load the first overlay and then from it decide which=20
> > > specific overlay to apply? =20
> >=20
> > Exactly.
> >=20
> > The first overlay (the example you quoted above) describes enough to
> > reach the model ID in the EEPROM, and this is identical for all add-on
> > models. The second add-on is model-specific, there is one for each
> > model, and the model ID allows to know which one to load. =20
>=20
> So you don't really need an overlay for this unless the EEPROM model=20
> changes or the model-id offset changes.

The EEPROM model is the same on all add-on models, or at least it's
fully compatible. Otherwise finding out the model ID would become very
annoying.

However the EEPROM is on the add-on, so describing it in the main DT
would be wrong. Not only conceptually, as hardware not present should
not be in the live DT, but also practically, as when the add-on is
removed and then a possibly different add-on is connected we need the
EEPROM driver to probe again, in order to do any initialization that
might be needed in the EEPROM driver probe function.

So I see no option but adding the EEPROM in an overlay. But it cannot
be the "full" overlay because before accessing the EEPROM we don't know
which model is loaded.

Do you have in mind a better approach that I just didn't think about?

Best regards,
Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
