Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72834DDC8D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 16:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4D310E941;
	Fri, 18 Mar 2022 15:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F8110E941
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 15:14:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 004573200FA9;
 Fri, 18 Mar 2022 11:14:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 18 Mar 2022 11:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=1HdyI7LG9qznT8yjtXFxPBo2TxxXkPEftGXqce
 +D3Xk=; b=Epwuw+DZ/yrrGGqmomOfiRUvgAhA+Tfj8QUktFC88+Hfnf+H8vDZNh
 bwAPGL428aML/B1ZG56zz5NFN6WsgQLm6fmMW+DdJGVGCOoyKXdxiuOue7MbVcBb
 VHnLvxcuxd4t7Sn810a+qIeNWnowNANaPUWkTFo2NmG6a4BA5a64VP2JBUlHJqDa
 qLEWEOJmn9PyawZyiDvqJ0WWdL7Od3WDY0vGcuo9/jowO3had1U+Qdj5VukcfnqS
 OGMqVqVddn6f0GH5CzppeDLGMu0tSfOUITisG+j3VtKGk6a1TFhPqtcf5CDnOsJK
 gGLy3h/36aXNHQZSJfLNxj2ZPDIUPA0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1HdyI7LG9qznT8yjt
 XFxPBo2TxxXkPEftGXqce+D3Xk=; b=jropfC5rDyX9t02DwuXI1sElkhp4/6Vqb
 uIbShiiI/TbuVTFcN4pAB3YWl0ubaJ3McCz+7XwIR61XCKYqxskkL0wq2WSd6tDf
 Aj5fb1VlhqZlf/gkxrrUFz5oA/fF4wBaxRX18yf2Sgc/px7apOORd3NFgEoSNaTG
 wxy4w5x3JHgQcopmgPPnXPE6MrueKlbmMKJx9KWU+/FiP/38FdWjqyt1OG3aXhjY
 Z4qJRxIRKg6plQc0HT3ODlQAigQUfmZr4qCUIcglld2om1gH7J59ZeLG1z8+1KlJ
 zxZgvRuOjfU7me+fH68dk/iPwpvxcck7zuvywGsKH1009xABUa/Yw==
X-ME-Sender: <xms:yaE0YvbN8onFX0p7id5TzBjt1MWaCOVEbYY1tpefEvWr20FTjMRy3Q>
 <xme:yaE0YubRKlw-yj1WcwKMKey_RMY9r8rFUv8Ic7NqpphzbQX4MNkebm8dKFKchsXDt
 tA78jQAnLZw_3UErO0>
X-ME-Received: <xmr:yaE0Yh9bOKIVSBwQuCNgxMf242XncalEd0N2lGaWiiZiaytM_ucOG1mi7ckHPY25wua69hyLSUcwF8l5bX2Tav-6PQky1Gfh6zfqaB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefiedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucdnkfhovfculdeitddmnecujfgurhepfffhvffukf
 hfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceo
 mhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepleekgeehhf
 dutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieehgedunecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
 hordhtvggthh
X-ME-Proxy: <xmx:yaE0YloSVNsEGBLordkXlMUWT4QWS1TIPQWUkPZ9xCACJQEJrnDozQ>
 <xmx:yaE0YqpwhB6KZYSaEsNbgqBPumDRjabisxGBqlurXFlp_0aS21VneQ>
 <xmx:yaE0YrRQO8WvPop1_v9dIqIPwp6nusmTmyiLj8jfN63b5cvUU1PkKLzsew>
 <xmx:yaE0YqKhJAsjtwXNsnL3GfNp87lTMEitdu7-0__8ubezohgLLjgRRA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Mar 2022 11:14:16 -0400 (EDT)
Date: Fri, 18 Mar 2022 16:14:14 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <20220318151414.vxormel2vfgzss6t@houat>
References: <20220309143200.111292-1-paul.kocialkowski@bootlin.com>
 <20220310145423.but7r7ul4j7h3wxw@houat>
 <YjIFAR2NSfjXdJGe@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wh3wounixr5n56qp"
Content-Disposition: inline
In-Reply-To: <YjIFAR2NSfjXdJGe@aptenodytes>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wh3wounixr5n56qp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 04:40:49PM +0100, Paul Kocialkowski wrote:
> Hi Maxime,
>=20
> Thanks for the review!
>=20
> On Thu 10 Mar 22, 15:54, Maxime Ripard wrote:
> > Hi Paul,
> >=20
> > On Wed, Mar 09, 2022 at 03:32:00PM +0100, Paul Kocialkowski wrote:
> > > While bridge/panel detection was initially relying on the usual
> > > port/ports-based of graph detection, it was recently changed to
> > > perform the lookup on any child node that is not port/ports
> > > instead when such a node is available, with no fallback on the
> > > usual way.
> > >=20
> > > This results in breaking detection when a child node is present
> > > but does not contain any panel or bridge node, even when the
> > > usual port/ports-based of graph is there.
> > >=20
> > > In order to support both situations properly, this commit reworks
> > > the logic to try both options and not just one of the two: it will
> > > only return -EPROBE_DEFER when both have failed.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > Fixes: 80253168dbfd ("drm: of: Lookup if child node has panel or brid=
ge")
> >=20
> > Thanks, it's in pretty good shape now, but I have a few bike sheds to p=
aint :)
> >=20
> > > ---
> > >  drivers/gpu/drm/drm_of.c | 93 +++++++++++++++++++++-----------------=
--
> > >  1 file changed, 49 insertions(+), 44 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > > index 9d90cd75c457..67f1b7dfc892 100644
> > > --- a/drivers/gpu/drm/drm_of.c
> > > +++ b/drivers/gpu/drm/drm_of.c
> > > @@ -219,6 +219,35 @@ int drm_of_encoder_active_endpoint(struct device=
_node *node,
> > >  }
> > >  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
> > > =20
> > > +static int drm_of_find_remote_panel_or_bridge(struct device_node *re=
mote,
> > > +					      struct drm_panel **panel,
> > > +					      struct drm_bridge **bridge)
> >=20
> > This function performs its look up directly on the struct device_node
> > passed as argument, so I don't think the "remote" in the name is great.
> > Since it's static, we can just call it find_panel_or_bridge, what do you
> > think?
>=20
> From a quick look at other DRM code I got the impression that static func=
tions
> also usually carry the drm prefix but I might be wrong.

Not necessarily, see handle_conflicting_encoders, commit_tail, commit_work,
convert_clip_rect_to_rect, edid_load, etc.

Most functions do, but it's not a rule or a convention.

> > > +{
> > > +	int ret =3D -EPROBE_DEFER;
> > > +
> > > +	if (panel) {
> > > +		*panel =3D of_drm_find_panel(remote);
> > > +		if (!IS_ERR(*panel))
> > > +			ret =3D 0;
> >=20
> > return 0?
>=20
> The idea was to still go through the "*bridge =3D NULL;" path if a bridge
> pointer is provided, to preserve the original behavior of the function.
> There may or may not not be any hard expectation on that, in any case
> I feel like it would be good to avoid out-of-scope functional changes her=
e.

Then we could just clear it just like we clear the panel pointer in
drm_of_find_panel_or_bridge. It would be more consistent.

> > > +		else
> > > +			*panel =3D NULL;
> > > +
> > > +	}
> > > +
> > > +	/* No panel found yet, check for a bridge next. */
> > > +	if (bridge) {
> > > +		if (ret) {
> >=20
> > And the return above allows to remove that test
> >=20
> > > +			*bridge =3D of_drm_find_bridge(remote);
> > > +			if (*bridge)
> > > +				ret =3D 0;
> >=20
> > return 0?
> >=20
> > > +		} else {
> > > +			*bridge =3D NULL;
> > > +		}
> > > +
> > > +	}
> > > +
> > > +	return ret;
> >=20
> > And here we can just return -EPROBE_DEFER
> >=20
> > > +}
> > > +
> >=20
> > >  /**
> > >   * drm_of_find_panel_or_bridge - return connected panel or bridge de=
vice
> > >   * @np: device tree node containing encoder output ports
> > > @@ -249,57 +278,33 @@ int drm_of_find_panel_or_bridge(const struct de=
vice_node *np,
> > >  	if (panel)
> > >  		*panel =3D NULL;
> > > =20
> > > -	/**
> > > -	 * Devices can also be child nodes when we also control that device
> > > -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> > > -	 *
> > > -	 * Lookup for a child node of the given parent that isn't either po=
rt
> > > -	 * or ports.
> > > -	 */
> > > -	for_each_available_child_of_node(np, remote) {
> > > -		if (of_node_name_eq(remote, "port") ||
> > > -		    of_node_name_eq(remote, "ports"))
> > > -			continue;
> > > -
> > > -		goto of_find_panel_or_bridge;
> > > +	/* Check for a graph on the device node first. */
> > > +	if (of_graph_is_present(np)) {
> > > +		remote =3D of_graph_get_remote_node(np, port, endpoint);
> > > +		if (remote) {
> > > +			ret =3D drm_of_find_remote_panel_or_bridge(remote, panel,
> > > +								 bridge);
> > > +			of_node_put(remote);
> > > +		}
> > >  	}
> > > =20
> > > -	/*
> > > -	 * of_graph_get_remote_node() produces a noisy error message if port
> > > -	 * node isn't found and the absence of the port is a legit case her=
e,
> > > -	 * so at first we silently check whether graph presents in the
> > > -	 * device-tree node.
> > > -	 */
> > > -	if (!of_graph_is_present(np))
> > > -		return -ENODEV;
> > > -
> > > -	remote =3D of_graph_get_remote_node(np, port, endpoint);
> > > -
> > > -of_find_panel_or_bridge:
> > > -	if (!remote)
> > > -		return -ENODEV;
> > > +	/* Otherwise check for any child node other than port/ports. */
> > > +	if (ret) {
> > > +		for_each_available_child_of_node(np, remote) {
> > > +			if (of_node_name_eq(remote, "port") ||
> > > +			    of_node_name_eq(remote, "ports"))
> > > +				continue;
> > > =20
> > > -	if (panel) {
> > > -		*panel =3D of_drm_find_panel(remote);
> > > -		if (!IS_ERR(*panel))
> > > -			ret =3D 0;
> > > -		else
> > > -			*panel =3D NULL;
> > > -	}
> > > +			ret =3D drm_of_find_remote_panel_or_bridge(remote, panel,
> > > +								 bridge);
> > > +			of_node_put(remote);
> > > =20
> > > -	/* No panel found yet, check for a bridge next. */
> > > -	if (bridge) {
> > > -		if (ret) {
> > > -			*bridge =3D of_drm_find_bridge(remote);
> > > -			if (*bridge)
> > > -				ret =3D 0;
> > > -		} else {
> > > -			*bridge =3D NULL;
> > > +			/* Stop at the first found occurrence. */
> > > +			if (!ret)
> > > +				break;
> > >  		}
> > > -
> > >  	}
> > > =20
> > > -	of_node_put(remote);
> > >  	return ret;
> > >  }
> >=20
> > So the diff is fairly hard to read, but it ends up as:
>=20
> Yeah I agree, not sure what I can do about that.

Nothing, really. I don't expect any change there, it just happens sometimes=
 :)

Maxime

--wh3wounixr5n56qp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjShxgAKCRDj7w1vZxhR
xf5JAQDmxxQlwOLr+WoU55rb+kKgTqjN81stleRWwvtNPvHL/QD/b96Wr8MjlVF0
8r//DEe2OL2d9vGdB5FxsoQbIiUCjg8=
=SsVH
-----END PGP SIGNATURE-----

--wh3wounixr5n56qp--
