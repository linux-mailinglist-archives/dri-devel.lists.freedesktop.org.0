Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596844D4A64
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF8E10E7E0;
	Thu, 10 Mar 2022 14:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99DA10E7E0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:54:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 822B2320152C;
 Thu, 10 Mar 2022 09:54:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 10 Mar 2022 09:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=XU39pyNSH2eq0dpZIXSxiHRUSiX+T3Vk8Q3C8r
 t+Bns=; b=CdIft1aMeCbNbv0TO9CvaUp7I/vx6dR/lleAnxB64oXWo9lTwWoDm6
 9kITFan62pf5xs28GR3xKlM70GR1LzW7TZh54EtZGw2oWTJnpbBnG2fwtGGsGvA8
 xJs4QEFUtr8uGIRWjhdkN2qHg5syw7WeOGvOjUGT+oF8TBvxY2d4vQNGl28R7mfb
 Dj4v+m9dx0sYjPCHK3ATIouVWr3mDUYL4X8eLQDEJStXqfHOSTSsHp8Xa+77VyLc
 VntM05EyJv9Swq95xCMsd76uwhGnyr2nKPE2x/HNhdEN2gntgqQlK5M0gi/XKEOp
 QtNXkMAhCIFv24nkHE3ar00otwBJEtkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XU39pyNSH2eq0dpZI
 XSxiHRUSiX+T3Vk8Q3C8rt+Bns=; b=Z3Uw/cWIDpaTLYnYF3mDsBTqDh9zytv6V
 8TQVAtCYvRn9+HjBWI4hdeu64risYhJoPL2Pl9sQ1qRHl1erXO7YHbH/8rX8stl5
 j618SgsPnkGslSchsAf5PESDsmFtSz79k2y1ktIjroVEaU9/g4awyKaQVzQRtg+I
 7qk38DWtYw/soWgnWZJvYFxys96oel1gL7mGjl7hTEj0mZ5rLz46klHAGgDF5sEZ
 hblc17lnZbTiZ/ffLLpe0sEwHBm9ST5s9mbmQkniZh/M4DcgAI9crz4t11G4jlXv
 DBX4S3Da75b76tulpk+Ty0DFh8RpmM2i3QN8SPJXEDpvMJ5Gc9m3g==
X-ME-Sender: <xms:IREqYlLII4_wXUYdQVRP-i6fHZ3O7FJV43mek-MS4KlgX-gHkvZ74Q>
 <xme:IREqYhITxCfNZxRZ3vVao_3Tce5QF-9F3v6uxIZooBk-54ZYLN43eUD-XGPW3ecmM
 ndPpCEYQ7g9VrtKKAg>
X-ME-Received: <xmr:IREqYtuilj9KfTCQizpd4BjsMdVJsLO4QjRgk8A162uYN0gdTbBpZaP16WH1EzQXfDG-G7B3qk_32vdrKZc3KaqkxDCY_H04NngEwZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucdnkfhovfculdeitddmnecujfgurhepfffhvffukf
 hfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceo
 mhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepleekgeehhf
 dutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieehgedunecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
 hordhtvggthh
X-ME-Proxy: <xmx:IREqYmaFO7qZzP3Pn4nnriSVUKEZ6b1cVrHusG10Wp2uGHpQG8aHPA>
 <xmx:IREqYsY0fW-0oqfQ2w9NAwVG5FxXl7d_OlhlV6hHfQPhfRAqFnu3AQ>
 <xmx:IREqYqD4J9E-rTiPC5PJ3sVgqD-VfM4014WEZN5WIbtSP36zLmEGKge9ng>
 <xmx:IhEqYs6FgPet8aiL5pB1xWaWfJG2pv5uRZQ147eSex_wx73B39peYg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 09:54:25 -0500 (EST)
Date: Thu, 10 Mar 2022 15:54:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <20220310145423.but7r7ul4j7h3wxw@houat>
References: <20220309143200.111292-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lgbhzcypjjo7srta"
Content-Disposition: inline
In-Reply-To: <20220309143200.111292-1-paul.kocialkowski@bootlin.com>
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


--lgbhzcypjjo7srta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, Mar 09, 2022 at 03:32:00PM +0100, Paul Kocialkowski wrote:
> While bridge/panel detection was initially relying on the usual
> port/ports-based of graph detection, it was recently changed to
> perform the lookup on any child node that is not port/ports
> instead when such a node is available, with no fallback on the
> usual way.
>=20
> This results in breaking detection when a child node is present
> but does not contain any panel or bridge node, even when the
> usual port/ports-based of graph is there.
>=20
> In order to support both situations properly, this commit reworks
> the logic to try both options and not just one of the two: it will
> only return -EPROBE_DEFER when both have failed.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Fixes: 80253168dbfd ("drm: of: Lookup if child node has panel or bridge")

Thanks, it's in pretty good shape now, but I have a few bike sheds to paint=
 :)

> ---
>  drivers/gpu/drm/drm_of.c | 93 +++++++++++++++++++++-------------------
>  1 file changed, 49 insertions(+), 44 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 9d90cd75c457..67f1b7dfc892 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -219,6 +219,35 @@ int drm_of_encoder_active_endpoint(struct device_nod=
e *node,
>  }
>  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
> =20
> +static int drm_of_find_remote_panel_or_bridge(struct device_node *remote,
> +					      struct drm_panel **panel,
> +					      struct drm_bridge **bridge)

This function performs its look up directly on the struct device_node
passed as argument, so I don't think the "remote" in the name is great.
Since it's static, we can just call it find_panel_or_bridge, what do you
think?

> +{
> +	int ret =3D -EPROBE_DEFER;
> +
> +	if (panel) {
> +		*panel =3D of_drm_find_panel(remote);
> +		if (!IS_ERR(*panel))
> +			ret =3D 0;

return 0?

> +		else
> +			*panel =3D NULL;
> +
> +	}
> +
> +	/* No panel found yet, check for a bridge next. */
> +	if (bridge) {
> +		if (ret) {

And the return above allows to remove that test

> +			*bridge =3D of_drm_find_bridge(remote);
> +			if (*bridge)
> +				ret =3D 0;

return 0?

> +		} else {
> +			*bridge =3D NULL;
> +		}
> +
> +	}
> +
> +	return ret;

And here we can just return -EPROBE_DEFER

> +}
> +

>  /**
>   * drm_of_find_panel_or_bridge - return connected panel or bridge device
>   * @np: device tree node containing encoder output ports
> @@ -249,57 +278,33 @@ int drm_of_find_panel_or_bridge(const struct device=
_node *np,
>  	if (panel)
>  		*panel =3D NULL;
> =20
> -	/**
> -	 * Devices can also be child nodes when we also control that device
> -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> -	 *
> -	 * Lookup for a child node of the given parent that isn't either port
> -	 * or ports.
> -	 */
> -	for_each_available_child_of_node(np, remote) {
> -		if (of_node_name_eq(remote, "port") ||
> -		    of_node_name_eq(remote, "ports"))
> -			continue;
> -
> -		goto of_find_panel_or_bridge;
> +	/* Check for a graph on the device node first. */
> +	if (of_graph_is_present(np)) {
> +		remote =3D of_graph_get_remote_node(np, port, endpoint);
> +		if (remote) {
> +			ret =3D drm_of_find_remote_panel_or_bridge(remote, panel,
> +								 bridge);
> +			of_node_put(remote);
> +		}
>  	}
> =20
> -	/*
> -	 * of_graph_get_remote_node() produces a noisy error message if port
> -	 * node isn't found and the absence of the port is a legit case here,
> -	 * so at first we silently check whether graph presents in the
> -	 * device-tree node.
> -	 */
> -	if (!of_graph_is_present(np))
> -		return -ENODEV;
> -
> -	remote =3D of_graph_get_remote_node(np, port, endpoint);
> -
> -of_find_panel_or_bridge:
> -	if (!remote)
> -		return -ENODEV;
> +	/* Otherwise check for any child node other than port/ports. */
> +	if (ret) {
> +		for_each_available_child_of_node(np, remote) {
> +			if (of_node_name_eq(remote, "port") ||
> +			    of_node_name_eq(remote, "ports"))
> +				continue;
> =20
> -	if (panel) {
> -		*panel =3D of_drm_find_panel(remote);
> -		if (!IS_ERR(*panel))
> -			ret =3D 0;
> -		else
> -			*panel =3D NULL;
> -	}
> +			ret =3D drm_of_find_remote_panel_or_bridge(remote, panel,
> +								 bridge);
> +			of_node_put(remote);
> =20
> -	/* No panel found yet, check for a bridge next. */
> -	if (bridge) {
> -		if (ret) {
> -			*bridge =3D of_drm_find_bridge(remote);
> -			if (*bridge)
> -				ret =3D 0;
> -		} else {
> -			*bridge =3D NULL;
> +			/* Stop at the first found occurrence. */
> +			if (!ret)
> +				break;
>  		}
> -
>  	}
> =20
> -	of_node_put(remote);
>  	return ret;
>  }

So the diff is fairly hard to read, but it ends up as:

>        int ret =3D -EPROBE_DEFER;
>        struct device_node *remote;
>
>        if (!panel && !bridge)
>                return -EINVAL;
>        if (panel)
>                *panel =3D NULL;
>
>        /* Check for a graph on the device node first. */
>       if (of_graph_is_present(np)) {
>                remote =3D of_graph_get_remote_node(np, port, endpoint);
>                if (remote) {
>                        ret =3D drm_of_find_remote_panel_or_bridge(remote,=
 panel,
>                                                                 bridge);
>                        of_node_put(remote);

I think we can simplify this by doing

                        if (!ret)
			        return ret;

>                }
>        }
>
>        /* Otherwise check for any child node other than port/ports. */
>        if (ret) {

And thus we won't have to check for ret here

>                for_each_available_child_of_node(np, remote) {

I'm a bit reluctant with variables that we reuse from one loop to
another, especially since it's a bit misleading here. What about using a
(loop local) remote variable in the of_graph path, and a loop-local
variable node or child here?

>                        if (of_node_name_eq(remote, "port") ||
>                            of_node_name_eq(remote, "ports"))
>                                continue;
>
>                        ret =3D drm_of_find_remote_panel_or_bridge(remote,=
 panel,
>                                                                 bridge);
>                        of_node_put(remote);
>
>                        /* Stop at the first found occurrence. */
>                        if (!ret)
>                                break;

Ditto, let's just return here

>                }
>       }
>
>        return ret;

And then we can just return EPROBE_DEFER here (and get rid of ret entirely)

Maxime

--lgbhzcypjjo7srta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYioRHwAKCRDj7w1vZxhR
xRlZAP98YkMuA9DQnqs5EI61id1YvE2ZQ+/gLGD36nrQVxFZwgD/aq9ge2+PLPGL
TJgiShNyXnzB5UY6045THZf+j0+wqgE=
=IMzz
-----END PGP SIGNATURE-----

--lgbhzcypjjo7srta--
