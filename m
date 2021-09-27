Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FA5419F56
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 21:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F286E039;
	Mon, 27 Sep 2021 19:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D81A6E039
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 19:43:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 3574D2B01288;
 Mon, 27 Sep 2021 15:43:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 27 Sep 2021 15:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=dHqeTD+V/hQKNAgo3OWX8numwtF
 A/V+vd0ZVEiooor4=; b=uM8GKMejyERnwzJXAovzXWj1qjzEyoiavk3kcXVTlBX
 YCnvQqYSHCZ8zH9cO/KXcekkUfQWtKN2thfd01mV6dhXJhq74M/n5oYf/jghX3TK
 gDcwRchlsSdYpInO04FKWWrpjlWIpstpYs+4Gjl6XyzJOSLXNd9LAyItHQBbqGT1
 Ns3ZtBEjIbaio6SB6FW/ibBtpcvVgjFOrVT3p7pOVPD6hv9zUJUlcj4Inzk+3M4v
 5DkwVFX5+dqcC+uH4RkMXvxM5txT1X1weTAxZ+BBrTwAEammhC5zg6i5nw6QrWJ8
 uRQ7Gtmn2T/PlGaGI7LIWtI0TUkqiwAxdZ4T+ExOFBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dHqeTD
 +V/hQKNAgo3OWX8numwtFA/V+vd0ZVEiooor4=; b=jRKyACsLLpLO9/PWsC3ppd
 fEtIwOoD8MWsx8P2CXa8voWuZBK5J2pkK8Hyd9oNkWqLZ26KPpaOJ5/BDi7hOf0d
 TMdTD3qQZjOrIA0N84VhO2wBuXO9Cp+/uhE4IqBDlb43T08Rc9X5/Nvg2ydrn/qv
 FWY3num6QkriT1Gc0sNWDdNVG08v6jE9Xo1mlIGWLMdOnU/hlVkWK0WPkocMk0T6
 B0vBSpmHTXl7ZGosVV0Og/HwjUnsgefdnYAK4i+iorJjyGnLOwpxoe/iV6LXy9li
 nxOU8xGJ+yxNCKNJY2yyGMVD/ySsiTq8+M1iSk4aCXJKi9fwDr/Je+QPMlMv7VXQ
 ==
X-ME-Sender: <xms:8x5SYXSM7vnaS6qwqaYWdZplyiiuPgqMDdxWXV9gF-m0kkE1GsjGlQ>
 <xme:8x5SYYwhqBcM2cNLZfvb8O4bGhzXLVhmrtttgekvHaS2I6ns4CJzxaT1kgmBuHPSc
 -W-_jtj2TYFZT5jyCI>
X-ME-Received: <xmr:8x5SYc1oKm1owukDO52UIuIfD1hXzIMA83SwTmuHowc2fSIsBXltGPY1c9J7B2dJ4WaIfMkpdAvVYljRMf1lsk2X-wpH3gNr2quPi4sX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgudefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8x5SYXA5Fj1uGg8YOfpFgmaG3G1mhZ_MDxeBN8XS-p073-_ea4WImg>
 <xmx:8x5SYQjZlEm9CgscjPpLwFULEAL3zqlgyYEadCsKhcjKW8Q7EFq0RQ>
 <xmx:8x5SYbo0pJNe-r_et0eAI5Vcjb3XA_Lv_l_NLcm6ThH5qmr1eu4_RA>
 <xmx:9B5SYTOW7NLD0S68vmunq_0hPE5BCMZ_9wpzEJ3lgfSe8cE00OyHhocpEGY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 15:43:47 -0400 (EDT)
Date: Mon, 27 Sep 2021 21:43:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/bridge: Add a function to abstract away panels
Message-ID: <20210927194344.avbex3qyw2swa7kz@gilmour>
References: <20210910130941.1740182-1-maxime@cerno.tech>
 <20210910130941.1740182-2-maxime@cerno.tech>
 <YUvKcTv2hSrUqIvF@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bmyyr2rsicwwepy2"
Content-Disposition: inline
In-Reply-To: <YUvKcTv2hSrUqIvF@pendragon.ideasonboard.com>
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


--bmyyr2rsicwwepy2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 03:29:37AM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> I know this has already been merged, but I have a question.
>=20
> On Fri, Sep 10, 2021 at 03:09:39PM +0200, Maxime Ripard wrote:
> > Display drivers so far need to have a lot of boilerplate to first
> > retrieve either the panel or bridge that they are connected to using
> > drm_of_find_panel_or_bridge(), and then either deal with each with ad-h=
oc
> > functions or create a drm panel bridge through drm_panel_bridge_add.
> >=20
> > In order to reduce the boilerplate and hopefully create a path of least
> > resistance towards using the DRM panel bridge layer, let's create the
> > function devm_drm_of_get_next to reduce that boilerplate.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 42 ++++++++++++++++++++++++++++++++----
> >  drivers/gpu/drm/drm_of.c     |  3 +++
> >  include/drm/drm_bridge.h     |  2 ++
> >  3 files changed, 43 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index a8ed66751c2d..10ddca4638b0 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -28,6 +28,7 @@
> >  #include <drm/drm_atomic_state_helper.h>
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_encoder.h>
> > +#include <drm/drm_of.h>
> >  #include <drm/drm_print.h>
> > =20
> >  #include "drm_crtc_internal.h"
> > @@ -51,10 +52,8 @@
> >   *
> >   * Display drivers are responsible for linking encoders with the first=
 bridge
> >   * in the chains. This is done by acquiring the appropriate bridge with
> > - * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating =
it for a
> > - * panel with drm_panel_bridge_add_typed() (or the managed version
> > - * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall=
 be
> > - * attached to the encoder with a call to drm_bridge_attach().
> > + * devm_drm_of_get_bridge(). Once acquired, the bridge shall be attach=
ed to the
> > + * encoder with a call to drm_bridge_attach().
> >   *
> >   * Bridges are responsible for linking themselves with the next bridge=
 in the
> >   * chain, if any. This is done the same way as for encoders, with the =
call to
> > @@ -1233,6 +1232,41 @@ struct drm_bridge *of_drm_find_bridge(struct dev=
ice_node *np)
> >  	return NULL;
> >  }
> >  EXPORT_SYMBOL(of_drm_find_bridge);
> > +
> > +/**
> > + * devm_drm_of_get_bridge - Return next bridge in the chain
> > + * @dev: device to tie the bridge lifetime to
> > + * @np: device tree node containing encoder output ports
> > + * @port: port in the device tree node
> > + * @endpoint: endpoint in the device tree node
> > + *
> > + * Given a DT node's port and endpoint number, finds the connected node
> > + * and returns the associated bridge if any, or creates and returns a
> > + * drm panel bridge instance if a panel is connected.
> > + *
> > + * Returns a pointer to the bridge if successful, or an error pointer
> > + * otherwise.
> > + */
> > +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> > +					  struct device_node *np,
> > +					  unsigned int port,
> > +					  unsigned int endpoint)
> > +{
> > +	struct drm_bridge *bridge;
> > +	struct drm_panel *panel;
> > +	int ret;
> > +
> > +	ret =3D drm_of_find_panel_or_bridge(np, port, endpoint,
> > +					  &panel, &bridge);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	if (panel)
> > +		bridge =3D devm_drm_panel_bridge_add(dev, panel);
> > +
> > +	return bridge;
>=20
> I really like the idea, I've wanted to do something like this for a long
> time. I however wonder if this is the best approach, or if we could get
> the panel core to register the bridge itself. The part that bothers me
> here is the assymetry in the lifetime of the bridges, the returned
> pointer is either looked up or allocated.
>=20
> Bridge lifetime is such a mess that it may not make a big difference,
> but eventually we'll have to address that problem globally.

We can't have Rust soon enough :)

Does it really matter though? I thought the bridges couldn't be unloaded
=66rom a DRM device anyway, so for all practical purposes this will be
removed at around the same time: when the whole DRM device is going to
be teared down?

Maxime

--bmyyr2rsicwwepy2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYVIe8AAKCRDj7w1vZxhR
xdVBAPwNddQ+uvTjScdQjCse+yFGOkFeGsDJJ4GAgfD1ua+sbAEArXCoBxANka2a
Li0Dv4DXtllGmbw5gd1KGigN+R12qQY=
=krTb
-----END PGP SIGNATURE-----

--bmyyr2rsicwwepy2--
