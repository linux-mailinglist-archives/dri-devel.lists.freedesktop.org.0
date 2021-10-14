Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3695742D3F3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 09:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DAA6E13C;
	Thu, 14 Oct 2021 07:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94BA6E13C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 07:41:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id DB77C2B00428;
 Thu, 14 Oct 2021 03:41:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 14 Oct 2021 03:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fYpD+qQEFt3q5FXg58C9+/ADaWw
 2/calmEftlemO734=; b=AXup7XZLYKVCtNOzfzNjU7yb2/0WmSG6hABwAdvBPeN
 rNWWAwa2BoM92FPcHDsdHZZNgDCdsT0e9b7BADGC6B/F16grsedsfq1jd3cGBw0S
 pHlnLmeNJfpwHNbns2KKAIrymgSA6H52le+gW0Zk2emZzsTVO4725zLuA/LTL+aD
 svNrNbTcsrHVmOm29TWjxHe0ZRW5d8r33AYPFbCO84m/aor2c8SaJf2PgWOZ1lZe
 oa/g5zaYTcpGkyzKe0HTq0akLXTJvWDZ3gDfNa9q4kpCimEKukHvf/QFIBf3ZPAy
 eS9lY2CXV0YVouHCjdnb0FTMSroptpFl/WDw4RCaopQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fYpD+q
 QEFt3q5FXg58C9+/ADaWw2/calmEftlemO734=; b=ShYTk4Z/I7O8D5DUKuQ36J
 49PXfXi4kRn0YhcKMI6M1BIzRHUG0bihojLfaYSKE//byVcRyCyOVIvjZx4lNFkP
 lbW616OCrAqO7M97qIdZB3KbnkbTHhr92MSwB4B4wKNPHFh6vx4W9zTSc9ncXbHq
 VYOs0N31MF2u/ixJe/EvxyXEKTn7jIac+hccCODzsWEAtPh+OTrjJyIe9p35h+/x
 7fyL+BNClX1ws+CHGG6Ds7wo3VyU3GT0MVJ5XFDYrXuv4d/w/FoSjD8FEeDx5O23
 9hzo3eikRYnRMQ4rXMq9csHvpTTcB+TGxEMLbt+ep1iFQRmHXmN+jANz0WZ7vcfA
 ==
X-ME-Sender: <xms:GN9nYZMTwXYtfzaNlcAxxEhG9S0ZQPdqpCEq9gv069pdjJiSrSwJDA>
 <xme:GN9nYb-DRdX23QiZkYDzhemb1ShF6yLle0TkPerg9LNXKMjwJSeonDMg_BnNPWy99
 IF2Z5Dvtc9vAQRKiv4>
X-ME-Received: <xmr:GN9nYYQKa1Dd0I8ntXyoCe_y4LQKIdK-oBDXKTPs-44vaG70wgyVJ8gr5X68bNVpQ9A2rUWkNFQFtMrot7Wc7koHFkPGM_MVbBL3vIvB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduuddgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GN9nYVt-mddnaVGxwwFln2YUMd6WPbacG1FYbZmgUFMFN07izlrHCA>
 <xmx:GN9nYRdTCFbw0sk5gqDRb0Z_xKVs7TM8Ba9F27SKcf6ls4UosU0B_g>
 <xmx:GN9nYR2nTCjFB2hZjL5TsLDoxeWAqQL_qMMh66bcIGkNUQ8OC8BOyA>
 <xmx:Gd9nYR27fqzPdRK1-0VhQQGMq0WN9PHAKqlStLofj0b89wge1mVdCf2m3hg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Oct 2021 03:41:11 -0400 (EDT)
Date: Thu, 14 Oct 2021 09:41:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc
 supply bindings
Message-ID: <20211014074110.ym6mzugde2m5ak22@gilmour>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
 <20211012064843.298104-4-alexander.stein@ew.tq-group.com>
 <20211013074722.7y7ug3eri4euknza@gilmour>
 <YWao69+QEK8Fhi/x@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2vu6g5pb2tsus6jk"
Content-Disposition: inline
In-Reply-To: <YWao69+QEK8Fhi/x@pendragon.ideasonboard.com>
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


--2vu6g5pb2tsus6jk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 12:37:47PM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> On Wed, Oct 13, 2021 at 09:47:22AM +0200, Maxime Ripard wrote:
> > On Tue, Oct 12, 2021 at 08:48:42AM +0200, Alexander Stein wrote:
> > > Add a VCC regulator which needs to be enabled before the EN pin is
> > > released.
> > >=20
> > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml     | 5 +++=
++
> > >  1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65=
dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.=
yaml
> > > index a5779bf17849..49ace6f312d5 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.y=
aml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.y=
aml
> > > @@ -32,6 +32,9 @@ properties:
> > >      maxItems: 1
> > >      description: GPIO specifier for bridge_en pin (active high).
> > > =20
> > > +  vcc-supply:
> > > +    description: A 1.8V power supply (see regulator/regulator.yaml).
> > > +
> > >    ports:
> > >      $ref: /schemas/graph.yaml#/properties/ports
> > > =20
> > > @@ -93,6 +96,7 @@ properties:
> > >  required:
> > >    - compatible
> > >    - reg
> > > +  - vcc-supply
> >=20
> > This isn't a backward-compatible change. All the previous users of that
> > binding will now require a vcc-supply property even though it was
> > working fine for them before.
> >=20
> > You handle that nicely in the code, but you can't make that new property
> > required.
>=20
> We can't make it required in the driver, but can't we make it required
> in the bindings ? This indicates that all new DTs need to set the
> property. We also need to mass-patch the in-tree DTs to avoid validation
> failures, but apart from that, I don't see any issue.

I guess we'd need to clarify what the schemas are here for.

We've been using them for two things: define the bindings, and make
sure that the users of a binding actually follow it.

The second part makes it very tempting to also cram "and make sure they
follow our best practices" in there. We never had the discussion about
whether that's ok or not, and I think the schemas syntax falls a bit
short there since I don't think we can make the difference between a
warning and an error that would make it work.

However, if we're talking about the binding itself, then no, you can't
introduce a new property. Since it was acceptable in the past, it still
needs to be acceptable going forward.

Maxime

--2vu6g5pb2tsus6jk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYWffFgAKCRDj7w1vZxhR
xeanAPjg/sDPbHy0fQ+Frfi5Ua8lhsMXTAwUoANmHT7G619yAP0eoUl7NpfwS9BH
9SR3BGTPf8SfjN+eeTIoHH0KmekmCA==
=wuEw
-----END PGP SIGNATURE-----

--2vu6g5pb2tsus6jk--
