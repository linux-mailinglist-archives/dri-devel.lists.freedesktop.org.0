Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E07D1E9174
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 15:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FA16E069;
	Sat, 30 May 2020 13:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BF46E069
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 13:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id B933EFB03;
 Sat, 30 May 2020 15:26:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jH8te9rYstS2; Sat, 30 May 2020 15:26:35 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id A29C944AF9; Sat, 30 May 2020 15:26:34 +0200 (CEST)
Date: Sat, 30 May 2020 15:26:34 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 1/6] dt-bindings: display/bridge: Add binding for
 input mux bridge
Message-ID: <20200530132634.GA3337@bogon.m.sigxcpu.org>
References: <cover.1589548223.git.agx@sigxcpu.org>
 <14a44a664f40584ffa25c1764aab5ebf97809c71.1589548223.git.agx@sigxcpu.org>
 <20200528194804.GA541078@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528194804.GA541078@bogus>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Anson Huang <Anson.Huang@nxp.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,
On Thu, May 28, 2020 at 01:48:04PM -0600, Rob Herring wrote:
> On Fri, May 15, 2020 at 03:12:10PM +0200, Guido G=FCnther wrote:
> > The bridge allows to select the input source via a mux controller.
> > =

> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > ---
> >  .../display/bridge/mux-input-bridge.yaml      | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/mu=
x-input-bridge.yaml
> > =

> > diff --git a/Documentation/devicetree/bindings/display/bridge/mux-input=
-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/mux-input-b=
ridge.yaml
> > new file mode 100644
> > index 000000000000..4029cf63ee5c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/mux-input-bridge=
.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/mux-input-bridge.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DRM input source selection via multiplexer
> =

> DRM is not a hardware thing.

I thought about naming the mux pixel-input-mux (input-mux sounding too
generic) but then i hit rockchip-drm and went for that name.  The
binding itself is not a drm thing in itself it really aims to model how
the mux is placed in the 'display pipeline' of the SoC (as Laurent
explained). Should I go with pixel-input-mux?

> The graph binding is already designed to support muxing. Generally, =

> multiple endpoints on an input node is a mux. So either the device with =

> the input ports knows how to select the input, or you just need a =

> mux-control property for the port to have some other device implement =

> the control.

A mux control property is how it's modeled at the moment but that is
very SoC specific.

> You could do it like you have below. That would be appropriate if =

> there's a separate h/w device controlling the muxing. Say for example =

> some board level device controlled by i2c.

It's a different part of the SoC that lives in a register range very
separate (iomuxc_gpr) from MIPI/DSI (nwl). Does that qualify?

Cheers,
 -- Guido

> =

> Rob
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
