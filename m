Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2C2432FB9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 09:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073AF6EB2E;
	Tue, 19 Oct 2021 07:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C966EB2C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 07:37:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id B125F2B01241;
 Tue, 19 Oct 2021 03:37:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 19 Oct 2021 03:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=dJ2o5Phi9t3TGUaDaq+zBBREB8W
 tJMN4ULl6AhSRZfI=; b=Ey7pXinhihtT7Uk4WTqjZc5lXFFGq6GEUi7qh3sC0ro
 k4+jN4tgn4+cjWZzGqE4S28eDOZUQ0wwbZNhq9LAM35CI++W8P+C/w1uJdPSNxR9
 30N4KCcig0kQ1DgV4uRjMTVmPxagHWRDVs8J2USHxoYBiH+hxV2xJplCPcVIbtZh
 icmVJ+OyK/OV/4GEuJjBPj1OJSs7MAv7ZmnMi6OWXgAFBpQSVafv4jF0k8k5b3Ac
 +3tNz3j+Iy6qWlU2ZQgJVly8lAv5jFtp7qSyUjQvYkTvj9psgTERfUshngA4fMZH
 bvjSk3Y/OYKmVLe52fILFEwKS8DQL/yxHAxRyuWNtUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dJ2o5P
 hi9t3TGUaDaq+zBBREB8WtJMN4ULl6AhSRZfI=; b=gG0f9NT8hJ6feUqaVXsdF2
 GrehAEonNGuIMWyMxXkL54pJxd0eL5SZD3l2SnmkHeX1kak95QNOf3qcz47tsUoa
 oK8/q1VJTdmJYyVLJkEBtlFgcJZ44QbD3JRpGFi/DHXJjvhP73DNwaIC7ZbhlwbI
 qr1vKk5oFJNm2EHrQa67AOoRoaJyPnGLClxOs2YpN5MKaO7o/PPA1f5YiDTo1aIg
 uxQwt4YzVFwDC7KdyGnbPDE7myYO4b01aj3ViA6w5s6LRvxt0TwIhPOP+1EDqjfI
 Khe1vKYsMRbHKVc6ToDVnzi/aEKGWFh4lAcRvJaI075jmvWj7wRxQ/6TE2adaD3g
 ==
X-ME-Sender: <xms:unVuYeYw22ClFkx2CBa95i9BY3QZxRfsQYdw84WEz91k1fNsHK73iQ>
 <xme:unVuYRaSQPsNqT5iVH-G_TjwL90Hg2MqTDt9crLy85UqNyqADkA9bv4L5wVZfgC65
 VIhcS3DWXQf8jgW-Pc>
X-ME-Received: <xmr:unVuYY9PZrUZoZzra8LvgTfUlmFjuI_DzsjwdW6Z2rXy1ExlxxuBYPy1Tf-klHCmUDnbjol_S2yF43j2dgRpuHSpZV4tEIKCmP6LPG_P>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvuddguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:unVuYQrGwcYC3_nD9zt8X7A0_k6aYQnBSL1PdBPsvl4ZcvPAxB0Pxg>
 <xmx:unVuYZoS6jE1GyW1bl886W7aWv4xmdJtuXYIfKJgiRAh93rr2bEwCg>
 <xmx:unVuYeTjPsCDonyT7l2Pq5tcT6t6yC-CCPfuwA2ZFjeFqa06Xswknw>
 <xmx:vHVuYaS3pU9v-zwwM7qMDwNPkf9Ooo-D_FS5_nGzhzCjO98RHUEtm3OtOCg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Oct 2021 03:37:30 -0400 (EDT)
Date: Tue, 19 Oct 2021 09:37:28 +0200
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
Message-ID: <20211019073728.7a3rmp3fz62rxh6w@gilmour>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
 <20211012064843.298104-4-alexander.stein@ew.tq-group.com>
 <20211013074722.7y7ug3eri4euknza@gilmour>
 <YWao69+QEK8Fhi/x@pendragon.ideasonboard.com>
 <20211014074110.ym6mzugde2m5ak22@gilmour>
 <YWo6U1juhMsHnQYU@pendragon.ideasonboard.com>
 <20211018152013.e3kmbm2lszb652gi@gilmour>
 <YW2zhFX9krzbHlpL@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gtbmam7muhb73roy"
Content-Disposition: inline
In-Reply-To: <YW2zhFX9krzbHlpL@pendragon.ideasonboard.com>
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


--gtbmam7muhb73roy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Oct 18, 2021 at 08:48:52PM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> On Mon, Oct 18, 2021 at 05:20:13PM +0200, Maxime Ripard wrote:
> > On Sat, Oct 16, 2021 at 05:34:59AM +0300, Laurent Pinchart wrote:
> > > On Thu, Oct 14, 2021 at 09:41:10AM +0200, Maxime Ripard wrote:
> > > > On Wed, Oct 13, 2021 at 12:37:47PM +0300, Laurent Pinchart wrote:
> > > > > On Wed, Oct 13, 2021 at 09:47:22AM +0200, Maxime Ripard wrote:
> > > > > > On Tue, Oct 12, 2021 at 08:48:42AM +0200, Alexander Stein wrote:
> > > > > > > Add a VCC regulator which needs to be enabled before the EN p=
in is
> > > > > > > released.
> > > > > > >=20
> > > > > > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > > > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.c=
om>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml    =
 | 5 +++++
> > > > > > >  1 file changed, 5 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/Documentation/devicetree/bindings/display/bridge=
/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn=
65dsi83.yaml
> > > > > > > index a5779bf17849..49ace6f312d5 100644
> > > > > > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn6=
5dsi83.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn6=
5dsi83.yaml
> > > > > > > @@ -32,6 +32,9 @@ properties:
> > > > > > >      maxItems: 1
> > > > > > >      description: GPIO specifier for bridge_en pin (active hi=
gh).
> > > > > > > =20
> > > > > > > +  vcc-supply:
> > > > > > > +    description: A 1.8V power supply (see regulator/regulato=
r.yaml).
> > > > > > > +
> > > > > > >    ports:
> > > > > > >      $ref: /schemas/graph.yaml#/properties/ports
> > > > > > > =20
> > > > > > > @@ -93,6 +96,7 @@ properties:
> > > > > > >  required:
> > > > > > >    - compatible
> > > > > > >    - reg
> > > > > > > +  - vcc-supply
> > > > > >=20
> > > > > > This isn't a backward-compatible change. All the previous users=
 of that
> > > > > > binding will now require a vcc-supply property even though it w=
as
> > > > > > working fine for them before.
> > > > > >=20
> > > > > > You handle that nicely in the code, but you can't make that new=
 property
> > > > > > required.
> > > > >=20
> > > > > We can't make it required in the driver, but can't we make it req=
uired
> > > > > in the bindings ? This indicates that all new DTs need to set the
> > > > > property. We also need to mass-patch the in-tree DTs to avoid val=
idation
> > > > > failures, but apart from that, I don't see any issue.
> > > >=20
> > > > I guess we'd need to clarify what the schemas are here for.
> > > >=20
> > > > We've been using them for two things: define the bindings, and make
> > > > sure that the users of a binding actually follow it.
> > > >=20
> > > > The second part makes it very tempting to also cram "and make sure =
they
> > > > follow our best practices" in there. We never had the discussion ab=
out
> > > > whether that's ok or not, and I think the schemas syntax falls a bit
> > > > short there since I don't think we can make the difference between a
> > > > warning and an error that would make it work.
> > > >=20
> > > > However, if we're talking about the binding itself, then no, you ca=
n't
> > > > introduce a new property.
> > >=20
> > > I assume you mean "a new required property" here.
> > >=20
> > > > Since it was acceptable in the past, it still needs to be acceptable
> > > > going forward.
> > >=20
> > > I think that's a matter of definition. The way I see it (but I could =
be
> > > mistaken), we're essentially versioning DT bindings without actually
> > > saying so, with the latest version being the visible one, and drivers
> > > having to preserve backward compatibility with new versions. We could
> > > also see it in different ways of course.
> >=20
> > I disagree. A binding is essentially a contract on how the OS is
> > supposed to interpret whatever comes from the DT. If we do what you
> > suggest, then we lose all documentation of older versions we still need
> > to support at the OS level. And relying on all developers to look
> > through the entire history to figure it out is a sure way to screw
> > things up :)
> >=20
> > The use of deprecated indicates that we actually want to document the
> > old versions.
> >=20
> > > What's important is in my opinion to make sure that new DTs will do
> > > the right thing, and if we don't make this property required, we can't
> > > check that. DT authors wouldn't know if the property is optional due
> > > to backward compatibility only but highly recommended, or really
> > > optional.
> >=20
> > Add a comment saying that this should really be added, but we can't
> > because it was missing it was in the original binding?
>=20
> That will not help validating that new DTs are compliant with the last
> version of the bindings.
>=20
> We have one tool, and two needs. The tool should be extended to cover
> both, but today it can only support one. Which of these two is the most
> important:
>=20
> - Documentating old behaviour, to helper driver authors on other
>   operating systems implement backward compatibility without having to
>   look at the history ?
>=20
> - Validating all new device trees to ensure they implement the latest
>   recommended version of the bindings ?
>=20
> I think the second one is much more frequent, and is also where most of
> the issues will arise.

I understand the drive for the latter, but we shouldn't be dropping the
former in the process, which has been what we've been doing for the last
decade or so.

Maxime

--gtbmam7muhb73roy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW51uAAKCRDj7w1vZxhR
xYLDAQDH56HcMdKvB6fGt1/meeQlGMtAY43BHN8p6k6eqxLZ6AEA+iqp7WR8QtWQ
5a7lwsxBiuwiBCKad7jOVFpAD90SZgk=
=nEym
-----END PGP SIGNATURE-----

--gtbmam7muhb73roy--
