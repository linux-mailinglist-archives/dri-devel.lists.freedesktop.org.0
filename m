Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735DA671686
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 09:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93E610E038;
	Wed, 18 Jan 2023 08:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3924910E00A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 08:51:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 98CD5320029B;
 Wed, 18 Jan 2023 03:51:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 18 Jan 2023 03:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674031872; x=1674118272; bh=9KUlsgI3dn
 S0cospHZM0OdIrpPKgU9PSIeNZux/mzes=; b=VHpuXgGRlkv5xc8SExS+dg31iB
 +Q+CYFjSv9ud6aswis1izSDAblf05ZPwclFetYjnu8f9MfsaYSxXhZmiXlvEQRk4
 2ZYkw7NleykQ9es6UTxzMIFiCgtywrbKreB9QP9eLKmcKacjfKiGptdJiNq3/tQA
 Ap5ddP/R65lrHO29TZH7TX7F0swpIs7wogcyEivQnA2upeFwzqs3eyp97pdx3TND
 y8RvcNsiyLmbtq8h5dqltyilugYulmbpA1RprvzoQ2TFxTaxzVU94TkidxOQUQOP
 plreSci1FPoUwBbXEpJF6tomUxovNJ50vp0QyyJxWvdDzjLZvB+6KLC2E2SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674031872; x=1674118272; bh=9KUlsgI3dnS0cospHZM0OdIrpPKg
 U9PSIeNZux/mzes=; b=rjz5pqWyZcUB3WkTJowupxeNrhtn1dvu8BqR8VDJKlia
 /bxpnMP+NuFG40RzAxgYOI+GYH3EP8O2msetwFdQHV6hvkzeLDEOBL4b10d+H//+
 WgxWpuf1qSpoKmer3WFBjlUwgmWyyYJ7LRDKicEpvRc6qyPvpTfSHpL1vU9tMzeJ
 GvuIvISNbPeWKIUMEVsZYBO9+cJfMAiPTZKaWS61P2y+57NnGoJvC7EEH/E6nUkr
 4LchYH0AEOhlBN3uZHHkJtkppQJXj2Qm1GtWDQjAGh+GEZkyTv9LDXFss2LURCfY
 3hipnsWh+4oQPbgxPCt5RQGWxNT5PRDT6V7KLT1rfA==
X-ME-Sender: <xms:_7LHYyUZ3W6_D0KDonQUvuqXT52av5tAtXbIb-IdyCRndIdlN953sw>
 <xme:_7LHY-kOzWReXpWtrWdMqsy5feqDqeRNu94yZS38dizVRGbo6IZ98FJQEf9Pxbxbm
 Hl9z9plykKvGDKoIDc>
X-ME-Received: <xmr:_7LHY2YH4eqzPjJjuFr8iJsyFvPazhCNAly9u0GRWxsAA8Ck5m3hHtag647kf-Ahz5ipW_YUjkW0-Em4Oqx6ecI94t4vKMIuM6wjXQ3zcqHHvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_7LHY5U2Ybl6Oa0fGtX5eIMw9jzassbK-x78IIAttHDpoDDBlDeOFA>
 <xmx:_7LHY8nfDQkoggn6SyxTl4ryUQMgvZnlopw_ROiFy1XwjRoPSWGFXQ>
 <xmx:_7LHY-d6KW7OhfEBhpBRdCYPwofC_WAMgkKUWiHhzYAszG1Pb0I-1w>
 <xmx:ALPHY6wcHIrClecEzdSuS6AP4OF_h2lEUu5RYDdVIow0CBot5Y0DSQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jan 2023 03:51:10 -0500 (EST)
Date: Wed, 18 Jan 2023 09:51:08 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V10 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Message-ID: <20230118085108.huhhod43ixwe7pwk@houat>
References: <20230112175358.421975-1-macroalpha82@gmail.com>
 <20230112175358.421975-2-macroalpha82@gmail.com>
 <20230117165819.4rx7aucvyp5e2rj6@houat>
 <63c6f329.050a0220.82479.85d4@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rybdiaw5plw7ten3"
Content-Disposition: inline
In-Reply-To: <63c6f329.050a0220.82479.85d4@mx.google.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, tzimmermann@suse.de,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rybdiaw5plw7ten3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 01:12:39PM -0600, Chris Morgan wrote:
> On Tue, Jan 17, 2023 at 05:58:19PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Jan 12, 2023 at 11:53:55AM -0600, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >=20
> > > Add helper function to find DSI host for devices where DSI panel is n=
ot
> > > a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
> > > official Raspberry Pi touchscreen display).
> > >=20
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_of.c | 70 ++++++++++++++++++++++++++++++++++++++=
++
> > >  include/drm/drm_of.h     | 10 ++++++
> > >  2 files changed, 80 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > > index 7bbcb999bb75..6c2c97a716fe 100644
> > > --- a/drivers/gpu/drm/drm_of.c
> > > +++ b/drivers/gpu/drm/drm_of.c
> > > @@ -10,6 +10,7 @@
> > >  #include <drm/drm_crtc.h>
> > >  #include <drm/drm_device.h>
> > >  #include <drm/drm_encoder.h>
> > > +#include <drm/drm_mipi_dsi.h>
> > >  #include <drm/drm_of.h>
> > >  #include <drm/drm_panel.h>
> > > =20
> > > @@ -493,3 +494,72 @@ int drm_of_get_data_lanes_count_ep(const struct =
device_node *port,
> > >  	return ret;
> > >  }
> > >  EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_MIPI_DSI)
> > > +
> > > +/**
> > > + * drm_of_get_dsi_bus - find the DSI bus for a given device
> > > + * @dev: parent device of display (SPI, I2C)
> > > + * @info: DSI device info to be updated with DSI node. This is optio=
nal
> > > + * and if not needed can be NULL.
> > > + *
> > > + * Gets parent DSI bus for a DSI device controlled through a bus oth=
er
> > > + * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
> > > + *
> > > + * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
> > > + * request is unsupported, -EPROBE_DEFER if the DSI host is found but
> > > + * not available, or -ENODEV otherwise.
> > > + */
> > > +struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev,
> > > +					 struct mipi_dsi_device_info *info)
> > > +{
> > > +	struct mipi_dsi_host *dsi_host;
> > > +	struct device_node *endpoint, *dsi_host_node;
> > > +
> > > +	/*
> > > +	 * Get first endpoint child from device.
> > > +	 */
> > > +	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
> > > +	if (!endpoint)
> > > +		return ERR_PTR(-ENODEV);
> > > +
> > > +	/*
> > > +	 * Follow the first endpoint to get the DSI host node.
> > > +	 */
> > > +	dsi_host_node =3D of_graph_get_remote_port_parent(endpoint);
> > > +	if (!dsi_host_node)
> > > +		goto error;
> > > +
> > > +	/*
> > > +	 * Get the DSI host from the DSI host node. If we get an error
> > > +	 * or the return is null assume we're not ready to probe just
> > > +	 * yet. Release the DSI host node since we're done with it.
> > > +	 */
> > > +	dsi_host =3D of_find_mipi_dsi_host_by_node(dsi_host_node);
> > > +	of_node_put(dsi_host_node);
> > > +	if (IS_ERR_OR_NULL(dsi_host)) {
> > > +		of_node_put(endpoint);
> > > +		return ERR_PTR(-EPROBE_DEFER);
> > > +	}
> > > +
> > > +	/*
> > > +	 * Set the node of the mipi_dsi_device_info to the correct node
> > > +	 * and then release the endpoint node since we're done with it.
> > > +	 * since this is optional, check if the info is NULL first.
> > > +	 */
> > > +	if (info) {
> > > +		info->node =3D of_graph_get_remote_port(endpoint);
> >=20
> > it looks to me that the info->node is actually the DSI device OF node,
> > not its host port. Which begs the question, why should we even return it
> > there, since there's a pretty big chance that dev->of.node =3D=3D
> > info->node, and you obviously don't care about the channel and type fie=
lds.
> >=20
> > I've had a look and node of the current users of
> > mipi_dsi_device_register_full actually register a mipi_dsi_device_info
> > with a node pointer set to !NULL, including the driver in this series.
> >=20
> > So, why do we care about the device info at all?
>
> I honestly thought it might be useful, but I can try without it.

It might tbh, but it doesn't look like you use it in your driver. You have:

struct mipi_dsi_device_info info =3D {
	.type =3D "d53e6ea8966",
	.channel =3D 0,
	.node =3D NULL,
};

=2E..

// info.node is NULL so far
dsi_host =3D drm_of_get_dsi_bus(dev, &info);

=2E..

// info.node has been filled to the port node by drm_of_get_dsi_bus()
db->dsi_dev =3D devm_mipi_dsi_device_register_full(dev, dsi_host, &info);

// db->dsi_dev.dev.of_node is now set to the port node

But if we grep through drm_mipi_dsi.c, we can see that the of_node is
only really useful if we're using of_find_mipi_dsi_device_by_node, and
it looks like you don't.

So nothing uses info->node, which also explains why not reporting the
proper node has been working.

Looking more into the code, it really looks to me that info->node should
be equal to the your panel device tree node, that's what
of_mipi_dsi_device_add does at least.

if info->node =3D=3D dev->of_node, and if info->node is the only thing
filled by drm_of_get_dsi_bus(), then it doesn't need to fill it at all
because it's already accessible easily to the caller (and even more
easily than to the callee).

So yeah, until we have a real-world need to retrieve the info function I
think we should leave it aside for now, and we can always change the API
later if we need to.

Maxime

--rybdiaw5plw7ten3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY8ey/AAKCRDj7w1vZxhR
xVS/AQDUdnSGblEzWLEWmRten0nr00zGWqhrXBNcMiHWRnUERgD+JwQ2k5RXvHoW
kEDhs0Tdt0wE9hYtSODBYAEGVjWMewo=
=R/IG
-----END PGP SIGNATURE-----

--rybdiaw5plw7ten3--
