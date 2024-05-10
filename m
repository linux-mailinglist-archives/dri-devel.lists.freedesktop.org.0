Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8BD8C270B
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 16:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B46410E04B;
	Fri, 10 May 2024 14:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XDQsiUrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE75210E04B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:39:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4064FF802;
 Fri, 10 May 2024 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715351995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+nU+cv0q1WloDIweY2B89rAwtbFBH/RqHcw3iJ3zTk=;
 b=XDQsiUrF6t6akEGF/z9RwiSoxCjD1Li48g0UfH+o4nEZKozMhwN6If3xDm0x7YstbP2Wgq
 dzsedvzzGAhaxjq0ZmF8gijW5sMTk0onpg1sgTHKHB/hSMNy0nGwtSr82pO3WQuerJUFqQ
 ZrbowCsVngaY/RCxd5AlXI/0OhOw/eHH2btD7LutjPNzlV/BA7W1JoEN20UtQuVf0dZJSZ
 kAV0YmYOQeSq4CiYz8GQaC6MYrqTr7M0rBqlKB6R9Yc7oMqn37PJTns4Da9P8iCimVjgUi
 6v7CSPIgDg4QdXoqOu+Ul5wsP7GmBvdfEmKI67hVirLqf3tComObMiIKfvmCDg==
Date: Fri, 10 May 2024 16:39:51 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Maxime Ripard <mripard@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Robert Foss <rfoss@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Derek Kiernan
 <derek.kiernan@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Saravana Kannan <saravanak@google.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Paul Kocialkowski
 <contact@paulk.fr>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Jonas
 Karlman <jonas@kwiboo.se>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: connector: add GE SUNH hotplug
 addon connector
Message-ID: <20240510163951.37817e41@booty>
In-Reply-To: <CAL_Jsq+mZLkq16OcVBcspxLrMZ=M+h57yOQohhsgn3VXVfyiLQ@mail.gmail.com>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-1-ec32f2c66d56@bootlin.com>
 <171533049583.3304069.11759668175103213313.robh@kernel.org>
 <20240510123717.437ffe6e@booty>
 <CAL_Jsq+mZLkq16OcVBcspxLrMZ=M+h57yOQohhsgn3VXVfyiLQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Fri, 10 May 2024 08:22:53 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, May 10, 2024 at 5:37=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
> >
> > Hello Rob,
> >
> > On Fri, 10 May 2024 03:41:35 -0500
> > "Rob Herring (Arm)" <robh@kernel.org> wrote:
> > =20
> > > On Fri, 10 May 2024 09:10:37 +0200, Luca Ceresoli wrote: =20
> > > > Add bindings for the GE SUNH add-on connector. This is a physical,
> > > > hot-pluggable connector that allows to attach and detach at runtime=
 an
> > > > add-on adding peripherals on non-discoverable busses.
> > > >
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > >
> > > > ---
> > > >
> > > > NOTE: the second and third examples fail 'make dt_binding_check' be=
cause
> > > >       they are example of DT overlay code -- I'm not aware of a way=
 to
> > > >       validate overlay examples as of now =20
> >
> > As mentioned here...
> > =20
> > > >
> > > > This patch is new in v2.
> > > > ---
> > > >  .../connector/ge,sunh-addon-connector.yaml         | 197 +++++++++=
++++++++++++
> > > >  MAINTAINERS                                        |   5 +
> > > >  2 files changed, 202 insertions(+)
> > > > =20
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > Error: Documentation/devicetree/bindings/connector/ge,sunh-addon-conn=
ector.example.dts:49.9-14 syntax error
> > > FATAL ERROR: Unable to parse input tree =20
> >
> > ...this is expected.
> >
> > Any hints on how this can be managed in bindings examples would be very
> > useful. =20
>=20
> Overlays in examples are not supported. Add actual .dtso files if you
> want examples of overlays (maybe you did, shrug).
>=20
> Overlays are somewhat orthogonal to bindings. Bindings define the ABI.
> It only makes sense to validate applied overlays. Now maybe overlays
> contain complete nodes and we could validate those, but that's a
> problem for actual overlay files and not something we need to
> complicate examples with.

Many thanks for the insights.

The reason I added overlays in the bindings examples is that this
specific device calls for overlays by its very nature. And in fact the
implementation is based on overlays.

However I understand the reasons for not having overlays in examples. I
think I can just remove the two examples and mention the nvmem-cells
and nvmem-cell-names nodes as regular properties, and explain in their
descriptions that these are supposed to be loaded via overlays. Quick
draft:

properties:
  nvmem-cell-names:
    items:
      - const: speed-bin

  nvmem-cells:
    maxItems: 1
    description:
      NVMEM cell containing the add-on model ID for the add-on that is
      inserted. Multiple add-on models can be connected, and in order
      to find out the exact model connected all of them have an EEPROM
      at the same I2C bus and address with an ID at the same offset. By
      its nature, this and the nvmem-cell-names nodes are supposed to be
      added by an overlay once ad add-on is detected. So they must not
      be present in the initial device tree, and they must be added by
      an overlay before the add-on can be used.

Looks reasonable?

Best regards,
Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
