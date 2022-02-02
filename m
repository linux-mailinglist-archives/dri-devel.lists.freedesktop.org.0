Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FA34A6E13
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E795389956;
	Wed,  2 Feb 2022 09:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CB410E8E4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:48:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 65CF132022E7;
 Wed,  2 Feb 2022 04:48:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 02 Feb 2022 04:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=mvttCoDxEmNSX3VfTvVqa/R3/CbmzT2hj3kMEv
 HCk0Y=; b=tHMBvloRnmuWkysYytaejOfMmrUlaS05Gy6WvAMaFKSCHQGbTyKT46
 +mttsXFlVcfXP8s5l1dXFMFQ7dojoGxunaeYZUkwmAxGLW8kQ+qxTz1oHjnz0Blw
 /Y0jkaI/YtsE503hS6y1dC9el0qpAWRoFRDJIYW/GJSUc7+TAPcx5OhK7BwSJGd4
 eX0JHgEXJYFx7VVP0Da5nZMZuafiQ1mGlkj2s/otgKlE00WsmkQjL6J17To53yFE
 6k1QlEzpwzg7YfLGXrMmQNafbqW6kucxVszajMFqd2RkFU2AUt/NhvJDCuVpdG6f
 ByAt7eGrr+zlpT3yqzG4EvVYKrAnokow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mvttCoDxEmNSX3VfT
 vVqa/R3/CbmzT2hj3kMEvHCk0Y=; b=olO5y7TULxYTntOJ/dc27lHM1ELkRlDk5
 x21iZGqsQQBCHMnoF18lTKg258exO//Tk/pINWLFSyD9Mm6/BCYfpHZRcSp3xHnm
 EuS0LnTW1cVgztoeS1XGArJ2OSO4wWrXugUquU15aQcRjbdNMIlHeEXx4zZ3RkVi
 WmRM/+How3+nxCv3xhwgAjSRCwvULxU0nQuNHqk/V4KEMCAIjumrZLjnQk8c60pX
 EuA1HPx9e1BXYmzaCXjSxc9DP+EcbzxGJOtw1W8bACFdnTIVYnfWxabFrBMltHz9
 GhCIAMx40bd9ZppiOg8fHUVcmQgfuWPgjVC73WEO2PJoNOY1+Z1rQ==
X-ME-Sender: <xms:f1P6YdKqxLLHSo68jLA8f1yWaMqgGC04k5yTp2IafVZrNGlL-enwBw>
 <xme:f1P6YZKDw6zFOOVGD3kvYhyVYubNeYUP3313wa_Z9lT0U974KN2D_i2H9Z2H38OtW
 HrOMSPybR96VXj076w>
X-ME-Received: <xmr:f1P6YVuJbBWYYwvuUUAi_xoKwjCPxqX9Qq-K-yw_5No_4YdIlJKJ5o7wth3QFosrANWqtg4VhP0TcP7GEpMi7E2Jd6hDaL1lqbTxrUk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeehgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeffteetveeijeetuefhffegkeetgffhieelheehtdduudethffhjedtvddtudel
 vdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:f1P6YeapZXF351_fmv_i83cSJdf1XU6ZZOXBsffO0SdDqlE3a0PWQw>
 <xmx:f1P6YUa_Oe_HXYLIpLIIZgzL0JhzDJHku6VQFm46RJGikgFlrOmUAg>
 <xmx:f1P6YSDx3UZqK3A_VnnsB8OO1qMMfqS2WXwESTH8e8AsZoYkPAq7vg>
 <xmx:f1P6YaN-jN5pjxggdBLqo9JTqDzMcVD8JPmfHL-s_KYo-wOmokxUyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 04:48:47 -0500 (EST)
Date: Wed, 2 Feb 2022 10:48:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: panel: Introduce a panel-lvds binding
Message-ID: <20220202094845.r7td65zxfo5uqg5x@houat>
References: <20220111110635.804371-1-maxime@cerno.tech>
 <20220111110635.804371-2-maxime@cerno.tech>
 <Yd2Ahn3+FVv/Aks7@pendragon.ideasonboard.com>
 <20220127142215.fesipdslabur43sx@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="56zeyuukc3asnzuk"
Content-Disposition: inline
In-Reply-To: <20220127142215.fesipdslabur43sx@houat>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--56zeyuukc3asnzuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 03:22:15PM +0100, Maxime Ripard wrote:
> Hi Laurent,
>=20
> On Tue, Jan 11, 2022 at 03:05:10PM +0200, Laurent Pinchart wrote:
> > On Tue, Jan 11, 2022 at 12:06:35PM +0100, Maxime Ripard wrote:
> > > Following the previous patch, let's introduce a generic panel-lvds
> > > binding that documents the panels that don't have any particular
> > > constraint documented.
> > >=20
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >=20
> > > ---
> > >=20
> > > Changes from v2:
> > >   - Added a MAINTAINERS entry
> > >=20
> > > Changes from v1:
> > >   - Added missing compatible
> > >   - Fixed lint
> > > ---
> > >  .../bindings/display/panel/panel-lvds.yaml    | 57 +++++++++++++++++=
++
> > >  MAINTAINERS                                   |  1 +
> > >  2 files changed, 58 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/p=
anel-lvds.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-lv=
ds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > > new file mode 100644
> > > index 000000000000..fcc50db6a812
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Generic LVDS Display Panel Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +  - $ref: /schemas/display/lvds.yaml/#
> > > +
> > > +select:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        const: panel-lvds
> > > +
> > > +  not:
> > > +    properties:
> > > +      compatible:
> > > +        contains:
> > > +          enum:
> > > +            - advantech,idk-1110wr
> > > +            - advantech,idk-2121wr
> > > +            - innolux,ee101ia-01d
> > > +            - mitsubishi,aa104xd12
> > > +            - mitsubishi,aa121td01
> > > +            - sgd,gktw70sdae4se
> >=20
> > I still don't like this :-( Couldn't we instead do
> >=20
> > select:
> >   properties:
> >     compatible:
> >       contains:
> >         enum:
> >           - auo,b101ew05
> >           - tbs,a711-panel
> >=20
> > ?
>=20
> That works too, I'll send another version.

Actually, no, it doesn't work.

If we do this, if we were to have a panel that has panel-lvds but none
of the other compatible (because of a typo, or downright invalid
binding) we won't validate it and report any error.

I'll merge this version (together with the v4 version of patch 1)

Maxime

--56zeyuukc3asnzuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfpTfQAKCRDj7w1vZxhR
xVS5AP43Ygo51GOlm2AVd9y0d5io7X75oqP7eO0QejtACduRxwEA/mTSShcWWSTX
n262O8BX2oXwr8En6g34f7pBOZt1DAU=
=A7Ja
-----END PGP SIGNATURE-----

--56zeyuukc3asnzuk--
