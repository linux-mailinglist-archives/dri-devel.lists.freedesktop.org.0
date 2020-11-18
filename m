Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DFA2B8D67
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101B46E566;
	Thu, 19 Nov 2020 08:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4398A6E479
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 17:48:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C65DC580478;
 Wed, 18 Nov 2020 12:48:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 18 Nov 2020 12:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WBs0+qXjmXeLcuaDX8p9vezOX23
 qqrk6o/0xn8RCNhM=; b=U1DMDLZ+NRwaWmeWqmpCIgtYYwGIoU663EKpES8ALDR
 6SeE9Uqetws3DreEG/Qsw7D2YjNVROXJVid+sbrkl/3oGxT3DNgr/NPucT4JaHY1
 kPG/D2ySeINFXVPdr9yQP/YWiDH//08ClI863koa47ufz7eS9RdVF2zOKCS+95V7
 raelulzehsE7PpTWDVm3d8e1KjBXNOCpF7w2UsqIgBicUn8qsONFsmsAdE6d0MPK
 UXogwHAYFuRweWuDSRZudZmRIQwIJ2thjUcny2UnIO1VOro4PopuYpZu7hpQmFa4
 X2Zt+7csVu7TUpZSkJM8DGLAtNX+LTb0RKDDmnAkfWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WBs0+q
 XjmXeLcuaDX8p9vezOX23qqrk6o/0xn8RCNhM=; b=VtVGw7EsJlu//oca9mCC3I
 X0/1VPyTznfArD5C1RgWYugqLR1hqmQDsXnoKeQnVOUfOu+oFMK+vLOVVHUDqLR0
 xDqRdqSrgFcfVlzaHI4bVWdUqpTxbViCL+faBpfDokt+MdkKeNSrCIPqplDTE3HX
 96iI9F6a+ywgNl1i9QT/2Xy+eCjEFJU+ojA8ZvecXb2WXiI4DRsqNynkgkHqJDd1
 TOOQ8lKw2V5DfKzWIMVb2YZ5jHm+E07ipzJ5sYqac06+axP+MyV9xQPPKHR3qfkS
 qFsQwftIjLneO2JzpjKnI2vk9xrQuXHhvddzlWVoCfv8dMjnPjEjjTlvcW8M9vlA
 ==
X-ME-Sender: <xms:V161X2m4GYgJyR7DRkY8KbEiNPlP1h8IzO2IbW42zr-XaPOFDqEPlg>
 <xme:V161X932Y2VILDup0yrk1C1XdXSpBXYwRV1SxW5XqP7IrOOJhy5G1D9nyo7Pc_J-P
 XSVR6m2q6G0J0Qjb0U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefhedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:V161X0oCdyxk1cHlXJCw3CMFYCdvcyHZ1dO6aTu20N0tUZ-92fNMqw>
 <xmx:V161X6nh1Wfqrqk5kZtyuNuJPnCtiwjyppljrCTRZ_L6kCWUZeqV7Q>
 <xmx:V161X02v3jAHMnQKpfOHdWwrPyZPJmN2Wq9QPfOaHSKTgFYPpoumGA>
 <xmx:WV61X6y-usYni9MRI2i8vjvElsqrrVgRnljVGOWuA9EosrJmlGYplg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDD1D3064AAF;
 Wed, 18 Nov 2020 12:48:06 -0500 (EST)
Date: Wed, 18 Nov 2020 18:48:05 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH RESEND v3 1/6] drm/of: Change the prototype of
 drm_of_lvds_get_dual_link_pixel_order
Message-ID: <20201118174805.cm67sluusovz5n6a@gilmour.lan>
References: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
 <6169dd15782627c8415583881fa94ba39c4f5221.1601910923.git-series.maxime@cerno.tech>
 <20201011230030.GD3944@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20201011230030.GD3944@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1862948924=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1862948924==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="myb6h2js7kdwlghz"
Content-Disposition: inline


--myb6h2js7kdwlghz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Mon, Oct 12, 2020 at 02:00:30AM +0300, Laurent Pinchart wrote:
> > -static int drm_of_lvds_get_remote_pixels_type(
> > -			const struct device_node *port_node)
> > +static int drm_of_lvds_get_remote_pixels_type(const struct device_node=
 *endpoint)
> >  {
> > -	struct device_node *endpoint =3D NULL;
> > -	int pixels_type =3D -EPIPE;
> > +	struct device_node *remote_port;
> > +	int pixels_type;
> > =20
> > -	for_each_child_of_node(port_node, endpoint) {
> > -		struct device_node *remote_port;
> > -		int current_pt;
> > -
> > -		if (!of_node_name_eq(endpoint, "endpoint"))
> > -			continue;
> > -
> > -		remote_port =3D of_graph_get_remote_port(endpoint);
> > -		if (!remote_port) {
> > -			of_node_put(remote_port);
> > -			return -EPIPE;
> > -		}
> > -
> > -		current_pt =3D drm_of_lvds_get_port_pixels_type(remote_port);
> > +	remote_port =3D of_graph_get_remote_port(endpoint);
> > +	if (!remote_port) {
> >  		of_node_put(remote_port);
>=20
> You can drop this line.
>=20
> > -		if (pixels_type < 0)
> > -			pixels_type =3D current_pt;
> > -
> > -		/*
> > -		 * Sanity check, ensure that all remote endpoints have the same
> > -		 * pixel type. We may lift this restriction later if we need to
> > -		 * support multiple sinks with different dual-link
> > -		 * configurations by passing the endpoints explicitly to
> > -		 * drm_of_lvds_get_dual_link_pixel_order().
> > -		 */
>=20
> Shouldn't we keep this check when endpoint_id is -1 in
> drm_of_lvds_get_dual_link_pixel_order() ?

I tried to do that, and I'm not quite really sure how to go around it.

This scans all the endpoints in a given port.

However, now that we have the device, port id and endpoint id, we need
to use of_graph_get_port_by_id to get the port matching the device and
port id, and iterate over all its endpoint as done here.

The trouble is that of_graph_get_port_by_id expects a !const
device_node, yet drm_of_lvds_get_dual_link_pixel_order (and seems to be
doing so rightfully), so that creates a warning because we drop the
const there.

Changing the prototype to passing only the port device_node doesn't
really work either, since it would be const, and we would need to call
of_graph_get_endpoint_by_regs (so having the parent device_node, through
of_graph_get_port_parent) and of_graph_get_port_parent takes a !const
port device_node.

I guess we could drop const entirely from our function, but that doesn't
look right either..

Maxime

--myb6h2js7kdwlghz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7VeVQAKCRDj7w1vZxhR
xdqQAP4lOz9e996baqwn9tOP7zUCzjJq+WqnxqOGmXzRnT37ogD/Tadf6Jvw9IqG
qX8ikq5JJZWhYvsmbGKewyYl6OUmtQU=
=6hPw
-----END PGP SIGNATURE-----

--myb6h2js7kdwlghz--

--===============1862948924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1862948924==--
