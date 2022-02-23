Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3B24C18E6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9444810E914;
	Wed, 23 Feb 2022 16:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB9C10E849
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 16:39:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8413258021B;
 Wed, 23 Feb 2022 11:39:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 23 Feb 2022 11:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=GhS9Qm+4p+Rkb2Piz862l6DxZOFn7BdSotFTMd
 L6eco=; b=qzfbwFsidiYYykh4K2Jxg+MSDFlxGStHRu7xvsX5rqnRKrroKKzsUi
 FOx7R+Pe6OM+oyYb91SXbNky98G8Ovl+LTv96Cxi1Fv4kbCcqRopwTyBYx7Vw6az
 JyjMakcxntHG+YFV24dvaG1w8TnqdITJ1gNNNNTqp1rbbJwY81sXz/yxgC/5V4Ga
 bAxFU96gUEOVmn5KTfftKbmwDv0GIxNw7+SjRJANPMSAuZsAjST6YadyredrKLFt
 swKROeEOGihBzBTitY2NmcaDFzZTDz4p3qQO6PFMkxLfk2llAcprK9sSJZIZyGe+
 GppBPFb0D7XbGHosKhzuDT9cvo6RdFag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GhS9Qm+4p+Rkb2Piz
 862l6DxZOFn7BdSotFTMdL6eco=; b=gYLyaKUNBZju59jFmLf5RCwWpByOkhGu8
 RCJdLBEbYEirZEwMgG953Rkvg8ronSD5FNDpuSGihNUXIlo9C/bnQHh1TVpQIH+z
 +zKTr0h4NNwfpjHh73/V9+Y/ZnZBNDwklQ2t4SopY1LAfV6ildv65nv+PmtUm1DN
 Pg/vwWH6Z6fbRvHbLH8yKAiLVK8Qg47wKO0YkUgAl9i4wK5xTom65+sK2zs2WdQF
 FjzNcVq7kdF+Iq6HRzGzhcJRuXIRVrETCUgpSMuaN3+rRooTTL2xR6f/mSq+2YTj
 QXBmf6q7TF0UxCiQMY8kan06sInnbR3+az7rn0JyQRJAlOg2BfLmg==
X-ME-Sender: <xms:RmMWYv1D0Z72xBOaDO_svEv1QI3x6D1PpM43qNmBjhXs7D4FAet2pg>
 <xme:RmMWYuFcYf3Cu8iPkauL2imCTvkv030JG9ZdkIGBrwfm3l7QegVk2HUvsJH8xSYJn
 xufWARpQ11iAm-n-R4>
X-ME-Received: <xmr:RmMWYv4JsxAgQyFJaBLo6pG5bUFU4SHXKc2OP2yhrZON8R-IkioWL6kFIcpw2LEfHeU_xdtV8Aavu95dEyrhvh8SNcvj4-gtlOqS_fo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RmMWYk3hQLZ5m1ljhQSwTJrNJUW3R0OB9QJMy0nhCEpHaf7-3GE77A>
 <xmx:RmMWYiHgSpmyZHq7KV1sLpcfeT47h-_iDeRc3Zcehj-b4QR0tsjYsA>
 <xmx:RmMWYl-wkUcBabATLaDki9djIDxBvRJRgSOuiJEzZAp3dKT0yodukw>
 <xmx:R2MWYgHcExXQsQ240xKAbtFC5h_ayzArykyyUqXGzVc14N_LsDco7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 11:39:33 -0500 (EST)
Date: Wed, 23 Feb 2022 17:39:30 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Message-ID: <20220223163930.wk3twgz6hranicv6@houat>
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <20220223134757.f5upi2iun27op5w5@houat>
 <d9ac0b96-3327-d250-dcdd-f49fc56b922c@denx.de>
 <20220223143703.xi7vpamjg4ytmvqs@houat>
 <bdb7884f-4c66-44ab-72e3-003b50364457@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="76yehplne2mlhk2z"
Content-Disposition: inline
In-Reply-To: <bdb7884f-4c66-44ab-72e3-003b50364457@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Max Krummenacher <max.oss.09@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--76yehplne2mlhk2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 03:38:20PM +0100, Marek Vasut wrote:
> On 2/23/22 15:37, Maxime Ripard wrote:
> > On Wed, Feb 23, 2022 at 03:09:08PM +0100, Marek Vasut wrote:
> > > On 2/23/22 14:47, Maxime Ripard wrote:
> > > > On Wed, Feb 23, 2022 at 02:45:30PM +0100, Marek Vasut wrote:
> > > > > On 2/23/22 14:41, Maxime Ripard wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > On Tue, Feb 22, 2022 at 09:47:23AM +0100, Max Krummenacher wrot=
e:
> > > > > > > Use the new property bus-format to set the enum bus_format an=
d bpc.
> > > > > > > Completes: commit 4a1d0dbc8332 ("drm/panel: simple: add panel=
-dpi support")
> > > > > > >=20
> > > > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > >=20
> > > > > > > ---
> > > > > > >=20
> > > > > > >     drivers/gpu/drm/panel/panel-simple.c | 32 +++++++++++++++=
+++++++++++++
> > > > > > >     1 file changed, 32 insertions(+)
> > > > > > >=20
> > > > > > > Relates to the discussion: https://lore.kernel.org/all/202202=
01110717.3585-1-cniedermaier@dh-electronics.com/
> > > > > > >=20
> > > > > > > Max
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/g=
pu/drm/panel/panel-simple.c
> > > > > > > index c5f133667a2d..5c07260de71c 100644
> > > > > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device =
*dev,
> > > > > > >     	struct panel_desc *desc;
> > > > > > >     	unsigned int bus_flags;
> > > > > > >     	struct videomode vm;
> > > > > > > +	const char *format =3D "";
> > > > > > >     	int ret;
> > > > > > >     	np =3D dev->of_node;
> > > > > > > @@ -477,6 +478,37 @@ static int panel_dpi_probe(struct device=
 *dev,
> > > > > > >     	of_property_read_u32(np, "width-mm", &desc->size.width);
> > > > > > >     	of_property_read_u32(np, "height-mm", &desc->size.height=
);
> > > > > > > +	of_property_read_string(np, "bus-format", &format);
> > > > > > > +	if (!strcmp(format, "BGR888_1X24")) {
> > > > > > > +		desc->bpc =3D 8;
> > > > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_BGR888_1X24;
> > > > > > > +	} else if (!strcmp(format, "GBR888_1X24")) {
> > > > > > > +		desc->bpc =3D 8;
> > > > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_GBR888_1X24;
> > > > > > > +	} else if (!strcmp(format, "RBG888_1X24")) {
> > > > > > > +		desc->bpc =3D 8;
> > > > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RBG888_1X24;
> > > > > > > +	} else if (!strcmp(format, "RGB444_1X12")) {
> > > > > > > +		desc->bpc =3D 6;
> > > > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB444_1X12;
> > > > > > > +	} else if (!strcmp(format, "RGB565_1X16")) {
> > > > > > > +		desc->bpc =3D 6;
> > > > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB565_1X16;
> > > > > > > +	} else if (!strcmp(format, "RGB666_1X18")) {
> > > > > > > +		desc->bpc =3D 6;
> > > > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB666_1X18;
> > > > > > > +	} else if (!strcmp(format, "RGB666_1X24_CPADHI")) {
> > > > > > > +		desc->bpc =3D 6;
> > > > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> > > > > > > +	} else if (!strcmp(format, "RGB888_1X24")) {
> > > > > > > +		desc->bpc =3D 8;
> > > > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> > > > > > > +	} else {
> > > > > > > +		dev_err(dev, "%pOF: missing or unknown bus-format property=
\n",
> > > > > > > +			np);
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > >=20
> > > > > > It doesn't seem right, really. We can't the bus format / bpc be=
 inferred
> > > > > > from the compatible? I'd expect two panels that don't have the =
same bus
> > > > > > format to not be claimed as compatible.
> > > > >=20
> > > > > Which compatible ?
> > > > >=20
> > > > > Note that this is for panel-dpi compatible, i.e. the panel which =
has timings
> > > > > specified in DT (and needs bus format specified there too).
> > > >=20
> > > > panel-dpi is supposed to have two compatibles, the panel-specific o=
ne
> > > > and panel-dpi. This would obviously be tied to the panel-specific o=
ne.
> > >=20
> > > This whole discussion is about the one which only has 'panel-dpi' com=
patible
> > > and describes the panel in DT completely. The specific compatible is =
not
> > > present in DT when this patch is needed.
> >=20
> >  From the panel-dpi DT binding:
> >=20
> > properties:
> >    compatible:
> >      description:
> >        Shall contain a panel specific compatible and "panel-dpi"
> >        in that order.
> >      items:
> >        - {}
> >        - const: panel-dpi
> >=20
> > The panel-specific compatible is mandatory, whether you like it or not.
>=20
> It doesn't seem to me that's the intended use per panel-simple.c , so may=
be
> the bindings need to be fixed too ?

It's not clear to me why this has anything to do with panel-simple, but
the binding is correct, and that requirement is fairly standard. We have
the same thing with panel-lvds for example.

Maxime

--76yehplne2mlhk2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhZjQgAKCRDj7w1vZxhR
xeHhAQD/5CzK/6EkxeFhUo4encxukPWOvcvN+91UQwlzUZDgIAEA6LPMsADeA1hR
nT0u1CxUfqlksfe9eQpUXNC4zKs+dgI=
=55IT
-----END PGP SIGNATURE-----

--76yehplne2mlhk2z--
